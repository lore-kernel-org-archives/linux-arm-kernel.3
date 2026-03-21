Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7347108B8FF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 04:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9LLJQ7w5jRV1ZFsAeJh5r47Qt8WvsK5A7ZyJvQuyCk=; b=Cw7QNq/1hLx6VyxnX3DkfW9k4k
	ky4iWMb3Vs0UxFzSM+Y4sAAGLD3d0pl9cKQw8Ag22DVYb0EpD0ukHy7UxekaX5kQmCzupeBCkAVbu
	0YKK9tlmi7PR8/bIO49FMvQfh00KfNXpes7ful8qHq+AU9ADBI6x6X1UaTR+lNDLPjLBvePE2ZZg3
	TOWOMKMJEJWsbNDm+dhhWXRYmBPp8Fbqvx95RxEbKCuKb7gb0T6kbIvN2wZYKx8F/qcrh68itCGXm
	mITp23SCduroXdeIIb1J4IIRDQcElMlcTFce9JGUZ3ghWFffduTITfEsT0VWEZ6AQc8htU4g+D28U
	HN7SwopA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3nhJ-0000000Dzf7-2rwH;
	Sat, 21 Mar 2026 04:12:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ngw-0000000DzPw-1VB2;
	Sat, 21 Mar 2026 04:12:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF7C8423DE;
	Sat, 21 Mar 2026 04:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69505C19421;
	Sat, 21 Mar 2026 04:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774066320;
	bh=YTFyJAIEOhhLeKY3UBEI5OwPSzWVkQMpvibnBimqIPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ux/QjEMPLlzpazjhHj4PL/GfXE7r9TXrXBNDXcmxakM+BXC8H/XYwCy00fO/zf28D
	 2rwSTEujjWGFfuz+9Z+zwHms3mcsQpB+gitvFuEvHJvVqhIgdYzFMTlltJn2sirCh0
	 5cdu/cY0kgGCxpaTvQXVF1+I0SJhVu+PqkHRPgwQo6BfeFOyqQInYYlhInlSf4nekJ
	 XPg1A00KKniHbLx7sC4kBlabHDw/6x8/UjXq2lKdZM+2p7DXacnp5vw9BloDMxKKMd
	 HcDAiAMuHbhdVEM+IWJnSGeaplZD+XT4AvLL8GEI87vRIiFkmVyEv8b0EEhaY/qCmG
	 m7lk6ODCdprtw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 06/12] crypto: sm3 - Replace with wrapper around library
Date: Fri, 20 Mar 2026 21:09:29 -0700
Message-ID: <20260321040935.410034-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321040935.410034-1-ebiggers@kernel.org>
References: <20260321040935.410034-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_211202_495289_384D562B 
X-CRM114-Status: GOOD (  13.89  )
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

Reimplement the "sm3" crypto_shash on top of the SM3 library, closely
mirroring the other hash algorithms (e.g. SHA-*).

The result, after later commits migrate the architecture-optimized SM3
code into the library as well, is that crypto/sm3.c will be the single
point of integration between crypto_shash and the actual SM3
implementations, simplifying the code.

Note: to see the diff from crypto/sm3_generic.c to crypto/sm3.c, view
this commit with 'git show -M10'.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/Makefile                       |  2 +-
 crypto/{sm3_generic.c => sm3.c}       | 83 +++++++++++++++++----------
 crypto/testmgr.c                      |  2 +
 drivers/crypto/starfive/jh7110-hash.c |  4 +-
 4 files changed, 59 insertions(+), 32 deletions(-)
 rename crypto/{sm3_generic.c => sm3.c} (30%)

diff --git a/crypto/Makefile b/crypto/Makefile
index 28467f900c9a..842dbc459e4b 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -81,11 +81,11 @@ obj-$(CONFIG_CRYPTO_MD5) += md5.o
 obj-$(CONFIG_CRYPTO_RMD160) += rmd160.o
 obj-$(CONFIG_CRYPTO_SHA1) += sha1.o
 obj-$(CONFIG_CRYPTO_SHA256) += sha256.o
 obj-$(CONFIG_CRYPTO_SHA512) += sha512.o
 obj-$(CONFIG_CRYPTO_SHA3) += sha3.o
-obj-$(CONFIG_CRYPTO_SM3) += sm3_generic.o
+obj-$(CONFIG_CRYPTO_SM3) += sm3.o
 obj-$(CONFIG_CRYPTO_STREEBOG) += streebog_generic.o
 obj-$(CONFIG_CRYPTO_WP512) += wp512.o
 CFLAGS_wp512.o := $(call cc-option,-fno-schedule-insns)  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79149
 obj-$(CONFIG_CRYPTO_BLAKE2B) += blake2b.o
 obj-$(CONFIG_CRYPTO_ECB) += ecb.o
diff --git a/crypto/sm3_generic.c b/crypto/sm3.c
similarity index 30%
rename from crypto/sm3_generic.c
rename to crypto/sm3.c
index 0c606f526347..05111a99b851 100644
--- a/crypto/sm3_generic.c
+++ b/crypto/sm3.c
@@ -4,61 +4,86 @@
  * described at https://tools.ietf.org/html/draft-shen-sm3-hash-01
  *
  * Copyright (C) 2017 ARM Limited or its affiliates.
  * Written by Gilad Ben-Yossef <gilad@benyossef.com>
  * Copyright (C) 2021 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
+ * Copyright 2026 Google LLC
  */
 
 #include <crypto/internal/hash.h>
 #include <crypto/sm3.h>
-#include <crypto/sm3_base.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-static int crypto_sm3_update(struct shash_desc *desc, const u8 *data,
-			  unsigned int len)
+#define SM3_CTX(desc) ((struct sm3_ctx *)shash_desc_ctx(desc))
+
+static int crypto_sm3_init(struct shash_desc *desc)
+{
+	sm3_init(SM3_CTX(desc));
+	return 0;
+}
+
+static int crypto_sm3_update(struct shash_desc *desc,
+			     const u8 *data, unsigned int len)
+{
+	sm3_update(SM3_CTX(desc), data, len);
+	return 0;
+}
+
+static int crypto_sm3_final(struct shash_desc *desc, u8 *out)
 {
-	return sm3_base_do_update_blocks(desc, data, len, sm3_block_generic);
+	sm3_final(SM3_CTX(desc), out);
+	return 0;
 }
 
-static int crypto_sm3_finup(struct shash_desc *desc, const u8 *data,
-			unsigned int len, u8 *hash)
+static int crypto_sm3_digest(struct shash_desc *desc,
+			     const u8 *data, unsigned int len, u8 *out)
 {
-	sm3_base_do_finup(desc, data, len, sm3_block_generic);
-	return sm3_base_finish(desc, hash);
+	sm3(data, len, out);
+	return 0;
+}
+
+static int crypto_sm3_export_core(struct shash_desc *desc, void *out)
+{
+	memcpy(out, SM3_CTX(desc), sizeof(struct sm3_ctx));
+	return 0;
+}
+
+static int crypto_sm3_import_core(struct shash_desc *desc, const void *in)
+{
+	memcpy(SM3_CTX(desc), in, sizeof(struct sm3_ctx));
+	return 0;
 }
 
 static struct shash_alg sm3_alg = {
-	.digestsize	=	SM3_DIGEST_SIZE,
-	.init		=	sm3_base_init,
-	.update		=	crypto_sm3_update,
-	.finup		=	crypto_sm3_finup,
-	.descsize	=	SM3_STATE_SIZE,
-	.base		=	{
-		.cra_name	 =	"sm3",
-		.cra_driver_name =	"sm3-generic",
-		.cra_priority	=	100,
-		.cra_flags	 =	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	 =	SM3_BLOCK_SIZE,
-		.cra_module	 =	THIS_MODULE,
-	}
+	.base.cra_name		= "sm3",
+	.base.cra_driver_name	= "sm3-lib",
+	.base.cra_priority	= 300,
+	.base.cra_blocksize	= SM3_BLOCK_SIZE,
+	.base.cra_module	= THIS_MODULE,
+	.digestsize		= SM3_DIGEST_SIZE,
+	.init			= crypto_sm3_init,
+	.update			= crypto_sm3_update,
+	.final			= crypto_sm3_final,
+	.digest			= crypto_sm3_digest,
+	.export_core		= crypto_sm3_export_core,
+	.import_core		= crypto_sm3_import_core,
+	.descsize		= sizeof(struct sm3_ctx),
 };
 
-static int __init sm3_generic_mod_init(void)
+static int __init crypto_sm3_mod_init(void)
 {
 	return crypto_register_shash(&sm3_alg);
 }
+module_init(crypto_sm3_mod_init);
 
-static void __exit sm3_generic_mod_fini(void)
+static void __exit crypto_sm3_mod_exit(void)
 {
 	crypto_unregister_shash(&sm3_alg);
 }
-
-module_init(sm3_generic_mod_init);
-module_exit(sm3_generic_mod_fini);
+module_exit(crypto_sm3_mod_exit);
 
 MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("SM3 Secure Hash Algorithm");
+MODULE_DESCRIPTION("Crypto API support for SM3");
 
 MODULE_ALIAS_CRYPTO("sm3");
-MODULE_ALIAS_CRYPTO("sm3-generic");
+MODULE_ALIAS_CRYPTO("sm3-lib");
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index fec950f1628b..8089e9f04218 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -5083,10 +5083,11 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.hash = __VECS(hmac_sha512_tv_template)
 		}
 	}, {
 		.alg = "hmac(sm3)",
+		.generic_driver = "hmac(sm3-lib)",
 		.test = alg_test_hash,
 		.suite = {
 			.hash = __VECS(hmac_sm3_tv_template)
 		}
 	}, {
@@ -5450,10 +5451,11 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.hash = __VECS(sha512_tv_template)
 		}
 	}, {
 		.alg = "sm3",
+		.generic_driver = "sm3-lib",
 		.test = alg_test_hash,
 		.suite = {
 			.hash = __VECS(sm3_tv_template)
 		}
 	}, {
diff --git a/drivers/crypto/starfive/jh7110-hash.c b/drivers/crypto/starfive/jh7110-hash.c
index 54b7af4a7aee..742038a5201a 100644
--- a/drivers/crypto/starfive/jh7110-hash.c
+++ b/drivers/crypto/starfive/jh7110-hash.c
@@ -518,11 +518,11 @@ static int starfive_sha512_init_tfm(struct crypto_ahash *hash)
 				      STARFIVE_HASH_SHA512, 0);
 }
 
 static int starfive_sm3_init_tfm(struct crypto_ahash *hash)
 {
-	return starfive_hash_init_tfm(hash, "sm3-generic",
+	return starfive_hash_init_tfm(hash, "sm3-lib",
 				      STARFIVE_HASH_SM3, 0);
 }
 
 static int starfive_hmac_sha224_init_tfm(struct crypto_ahash *hash)
 {
@@ -548,11 +548,11 @@ static int starfive_hmac_sha512_init_tfm(struct crypto_ahash *hash)
 				      STARFIVE_HASH_SHA512, 1);
 }
 
 static int starfive_hmac_sm3_init_tfm(struct crypto_ahash *hash)
 {
-	return starfive_hash_init_tfm(hash, "hmac(sm3-generic)",
+	return starfive_hash_init_tfm(hash, "hmac(sm3-lib)",
 				      STARFIVE_HASH_SM3, 1);
 }
 
 static struct ahash_engine_alg algs_sha2_sm3[] = {
 {
-- 
2.53.0


