Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F225ACD13D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xcTNCvkQpPtdc9waetfnqMGE5H22H5hQueSz9187JE=; b=S7YGW8SGZbd1lHgErZkfdokm6u
	RSep7UnN2G3ym6cj8Ug2OHV/yW8I/kCpJZtRfD0ATeCV9KFBO1UhgRcigJH6qgQkcYFl115yx0Owr
	bms4b8riby9sL4q6b6B60eDhjwQgNjrGHgS3M2TrKH/9NgNZr4E1YsspTmaP3Y6NZ3lO2QWErYYO/
	Z9Nn794/bzCSR1GsOJYBSoDZ1xyUkldBAFsnGSqPrsZsre4pDUfX1iEAT01FnHVAOy5WVrwwNkH5q
	WIkuxpe+fOsTHoaou/NnlL8G2uo0SNjfw2r4fk+1Xu+zvv34LNoeHwlNCH04f+Vi849uaup+eYaKx
	DE2eLLQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIFAg-00000004Vqp-1Vuj;
	Sun, 09 Nov 2025 23:50:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIFAX-00000004Vlg-1BCY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 23:50:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10092446BA;
	Sun,  9 Nov 2025 23:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38CCC4CEF8;
	Sun,  9 Nov 2025 23:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762732199;
	bh=nqSfESYD3WdUWSz/fBnUEecChZSD29umtZlw2xLsB0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ipyjBVVBmsPbmwitdkyiaqgT4axyARVg2FomhDjAfZkJc1ubHKtY/wftpORy2bCuo
	 g3pkYu7Msd6Ua1c0v+tsP3fY+RprmxzK9s2+KaN6DKW0tl+eBqfxmfSgSq8W0qNhNM
	 /Klt2r7KxtbhBX73y8AxEZZ1Hp1f2gK7VbciFBTvjrZuxAVn0g/+SfegyuxVAaOeT+
	 cqgQL10S3WCaG5efZKJE5T722jmmCEIha+0RjvYOTfKohjIoS0xgNvupDTVy+gdMfE
	 Ihy86GM1k2fQ+jAF5ZWJYRTlC/5S/GyBuFHdwo9aq7BPf439kTep7b2KvkifiqUUew
	 YbRlwKqxunQbQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 8/9] crypto: testmgr - Remove polyval tests
Date: Sun,  9 Nov 2025 15:47:23 -0800
Message-ID: <20251109234726.638437-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109234726.638437-1-ebiggers@kernel.org>
References: <20251109234726.638437-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_155001_375139_CDE70480 
X-CRM114-Status: GOOD (  11.30  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

These are no longer used, since polyval support has been removed from
the crypto_shash API.

POLYVAL remains supported via lib/crypto/, where it has a KUnit test
suite instead.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/tcrypt.c  |   4 --
 crypto/testmgr.c |   6 --
 crypto/testmgr.h | 171 -----------------------------------------------
 3 files changed, 181 deletions(-)

diff --git a/crypto/tcrypt.c b/crypto/tcrypt.c
index d1d88debbd71..32d9eaf2c8af 100644
--- a/crypto/tcrypt.c
+++ b/crypto/tcrypt.c
@@ -1688,14 +1688,10 @@ static int do_test(const char *alg, u32 type, u32 mask, int m, u32 num_mb)
 
 	case 56:
 		ret = min(ret, tcrypt_test("ccm(sm4)"));
 		break;
 
-	case 57:
-		ret = min(ret, tcrypt_test("polyval"));
-		break;
-
 	case 58:
 		ret = min(ret, tcrypt_test("gcm(aria)"));
 		break;
 
 	case 59:
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 499e979a56dc..6fb53978df11 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -5368,16 +5368,10 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.fips_allowed = 1,
 	}, {
 		.alg = "pkcs1pad(rsa)",
 		.test = alg_test_null,
 		.fips_allowed = 1,
-	}, {
-		.alg = "polyval",
-		.test = alg_test_hash,
-		.suite = {
-			.hash = __VECS(polyval_tv_template)
-		}
 	}, {
 		.alg = "rfc3686(ctr(aes))",
 		.test = alg_test_skcipher,
 		.fips_allowed = 1,
 		.suite = {
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index 268231227282..a3e4695945ca 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -36233,181 +36233,10 @@ static const struct cipher_testvec aes_xctr_tv_template[] = {
 		.len	= 512,
 	},
 
 };
 
-/*
- * Test vectors generated using https://github.com/google/hctr2
- *
- * To ensure compatibility with RFC 8452, some tests were sourced from
- * https://datatracker.ietf.org/doc/html/rfc8452
- */
-static const struct hash_testvec polyval_tv_template[] = {
-	{ // From RFC 8452
-		.key	= "\x31\x07\x28\xd9\x91\x1f\x1f\x38"
-			  "\x37\xb2\x43\x16\xc3\xfa\xb9\xa0",
-		.plaintext	= "\x65\x78\x61\x6d\x70\x6c\x65\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x48\x65\x6c\x6c\x6f\x20\x77\x6f"
-			  "\x72\x6c\x64\x00\x00\x00\x00\x00"
-			  "\x38\x00\x00\x00\x00\x00\x00\x00"
-			  "\x58\x00\x00\x00\x00\x00\x00\x00",
-		.digest	= "\xad\x7f\xcf\x0b\x51\x69\x85\x16"
-			  "\x62\x67\x2f\x3c\x5f\x95\x13\x8f",
-		.psize	= 48,
-		.ksize	= 16,
-	},
-	{ // From RFC 8452
-		.key	= "\xd9\xb3\x60\x27\x96\x94\x94\x1a"
-			  "\xc5\xdb\xc6\x98\x7a\xda\x73\x77",
-		.plaintext	= "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00",
-		.digest	= "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00",
-		.psize	= 16,
-		.ksize	= 16,
-	},
-	{ // From RFC 8452
-		.key	= "\xd9\xb3\x60\x27\x96\x94\x94\x1a"
-			  "\xc5\xdb\xc6\x98\x7a\xda\x73\x77",
-		.plaintext	= "\x01\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x40\x00\x00\x00\x00\x00\x00\x00",
-		.digest	= "\xeb\x93\xb7\x74\x09\x62\xc5\xe4"
-			  "\x9d\x2a\x90\xa7\xdc\x5c\xec\x74",
-		.psize	= 32,
-		.ksize	= 16,
-	},
-	{ // From RFC 8452
-		.key	= "\xd9\xb3\x60\x27\x96\x94\x94\x1a"
-			  "\xc5\xdb\xc6\x98\x7a\xda\x73\x77",
-		.plaintext	= "\x01\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x02\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x03\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x80\x01\x00\x00\x00\x00\x00\x00",
-		.digest	= "\x81\x38\x87\x46\xbc\x22\xd2\x6b"
-			  "\x2a\xbc\x3d\xcb\x15\x75\x42\x22",
-		.psize	= 64,
-		.ksize	= 16,
-	},
-	{ // From RFC 8452
-		.key	= "\xd9\xb3\x60\x27\x96\x94\x94\x1a"
-			  "\xc5\xdb\xc6\x98\x7a\xda\x73\x77",
-		.plaintext	= "\x01\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x02\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x03\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x04\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x02\x00\x00\x00\x00\x00\x00",
-		.digest	= "\x1e\x39\xb6\xd3\x34\x4d\x34\x8f"
-			  "\x60\x44\xf8\x99\x35\xd1\xcf\x78",
-		.psize	= 80,
-		.ksize	= 16,
-	},
-	{ // From RFC 8452
-		.key	= "\xd9\xb3\x60\x27\x96\x94\x94\x1a"
-			  "\xc5\xdb\xc6\x98\x7a\xda\x73\x77",
-		.plaintext	= "\x01\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x02\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x03\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x04\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x05\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x08\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x02\x00\x00\x00\x00\x00\x00",
-		.digest	= "\xff\xcd\x05\xd5\x77\x0f\x34\xad"
-			  "\x92\x67\xf0\xa5\x99\x94\xb1\x5a",
-		.psize	= 96,
-		.ksize	= 16,
-	},
-	{ // Random ( 1)
-		.key	= "\x90\xcc\xac\xee\xba\xd7\xd4\x68"
-			  "\x98\xa6\x79\x70\xdf\x66\x15\x6c",
-		.plaintext	= "",
-		.digest	= "\x00\x00\x00\x00\x00\x00\x00\x00"
-			  "\x00\x00\x00\x00\x00\x00\x00\x00",
-		.psize	= 0,
-		.ksize	= 16,
-	},
-	{ // Random ( 1)
-		.key	= "\xc1\x45\x71\xf0\x30\x07\x94\xe7"
-			  "\x3a\xdd\xe4\xc6\x19\x2d\x02\xa2",
-		.plaintext	= "\xc1\x5d\x47\xc7\x4c\x7c\x5e\x07"
-			  "\x85\x14\x8f\x79\xcc\x73\x83\xf7"
-			  "\x35\xb8\xcb\x73\x61\xf0\x53\x31"
-			  "\xbf\x84\xde\xb6\xde\xaf\xb0\xb8"
-			  "\xb7\xd9\x11\x91\x89\xfd\x1e\x4c"
-			  "\x84\x4a\x1f\x2a\x87\xa4\xaf\x62"
-			  "\x8d\x7d\x58\xf6\x43\x35\xfc\x53"
-			  "\x8f\x1a\xf6\x12\xe1\x13\x3f\x66"
-			  "\x91\x4b\x13\xd6\x45\xfb\xb0\x7a"
-			  "\xe0\x8b\x8e\x99\xf7\x86\x46\x37"
-			  "\xd1\x22\x9e\x52\xf3\x3f\xd9\x75"
-			  "\x2c\x2c\xc6\xbb\x0e\x08\x14\x29"
-			  "\xe8\x50\x2f\xd8\xbe\xf4\xe9\x69"
-			  "\x4a\xee\xf7\xae\x15\x65\x35\x1e",
-		.digest	= "\x00\x4f\x5d\xe9\x3b\xc0\xd6\x50"
-			  "\x3e\x38\x73\x86\xc6\xda\xca\x7f",
-		.psize	= 112,
-		.ksize	= 16,
-	},
-	{ // Random ( 1)
-		.key	= "\x37\xbe\x68\x16\x50\xb9\x4e\xb0"
-			  "\x47\xde\xe2\xbd\xde\xe4\x48\x09",
-		.plaintext	= "\x87\xfc\x68\x9f\xff\xf2\x4a\x1e"
-			  "\x82\x3b\x73\x8f\xc1\xb2\x1b\x7a"
-			  "\x6c\x4f\x81\xbc\x88\x9b\x6c\xa3"
-			  "\x9c\xc2\xa5\xbc\x14\x70\x4c\x9b"
-			  "\x0c\x9f\x59\x92\x16\x4b\x91\x3d"
-			  "\x18\x55\x22\x68\x12\x8c\x63\xb2"
-			  "\x51\xcb\x85\x4b\xd2\xae\x0b\x1c"
-			  "\x5d\x28\x9d\x1d\xb1\xc8\xf0\x77"
-			  "\xe9\xb5\x07\x4e\x06\xc8\xee\xf8"
-			  "\x1b\xed\x72\x2a\x55\x7d\x16\xc9"
-			  "\xf2\x54\xe7\xe9\xe0\x44\x5b\x33"
-			  "\xb1\x49\xee\xff\x43\xfb\x82\xcd"
-			  "\x4a\x70\x78\x81\xa4\x34\x36\xe8"
-			  "\x4c\x28\x54\xa6\x6c\xc3\x6b\x78"
-			  "\xe7\xc0\x5d\xc6\x5d\x81\xab\x70"
-			  "\x08\x86\xa1\xfd\xf4\x77\x55\xfd"
-			  "\xa3\xe9\xe2\x1b\xdf\x99\xb7\x80"
-			  "\xf9\x0a\x4f\x72\x4a\xd3\xaf\xbb"
-			  "\xb3\x3b\xeb\x08\x58\x0f\x79\xce"
-			  "\xa5\x99\x05\x12\x34\xd4\xf4\x86"
-			  "\x37\x23\x1d\xc8\x49\xc0\x92\xae"
-			  "\xa6\xac\x9b\x31\x55\xed\x15\xc6"
-			  "\x05\x17\x37\x8d\x90\x42\xe4\x87"
-			  "\x89\x62\x88\x69\x1c\x6a\xfd\xe3"
-			  "\x00\x2b\x47\x1a\x73\xc1\x51\xc2"
-			  "\xc0\x62\x74\x6a\x9e\xb2\xe5\x21"
-			  "\xbe\x90\xb5\xb0\x50\xca\x88\x68"
-			  "\xe1\x9d\x7a\xdf\x6c\xb7\xb9\x98"
-			  "\xee\x28\x62\x61\x8b\xd1\x47\xf9"
-			  "\x04\x7a\x0b\x5d\xcd\x2b\x65\xf5"
-			  "\x12\xa3\xfe\x1a\xaa\x2c\x78\x42"
-			  "\xb8\xbe\x7d\x74\xeb\x59\xba\xba",
-		.digest	= "\xae\x11\xd4\x60\x2a\x5f\x9e\x42"
-			  "\x89\x04\xc2\x34\x8d\x55\x94\x0a",
-		.psize	= 256,
-		.ksize	= 16,
-	},
-
-};
-
 /*
  * Test vectors generated using https://github.com/google/hctr2
  */
 static const struct cipher_testvec aes_hctr2_tv_template[] = {
 	{
-- 
2.51.2


