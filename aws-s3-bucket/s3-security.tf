provider "aws" {
  region     = "us-east-2"
  access_key = "Your_Access_key"
  secret_key = "Your_Secret_key"
}

resource "aws_s3_bucket" "b" {
  bucket = "$you_bucket_name"
  acl    = "private"


  versioning {
    enabled = true
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    }

  logging {
    target_bucket = "mytestbuckforyoutube"
    target_prefix = "log/"
    }
    server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm     = "AES256"
        }
      }
    }


}
