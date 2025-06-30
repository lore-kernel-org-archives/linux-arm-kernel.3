Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D772DC8302B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 16:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNjhLsrwMluVvxaUUF1QlsijrcjCRoLkb1rqU5YD1zY=; b=Ad57AarUmq3hfEzaJl7+HcXx9i
	PQYcOZiDuKBeCGdQ5I2NpdQBHHAj7y7PvAfuHsfcMu62baEBORPU7z1LRlTBjiNIAN+GbItntPH/H
	BoO+rBQMWh8p8JdlpjqInZL1NU9Zh22Yo1fhxK0Ku4E8YLpTCqaauFsMPNq/EIs1p62U7t38U8YuK
	P00oKse7fs62RC0h2M/tVT7VS6CiXVPIVrvH2k87FXUkKJjqTwAsrNR2UrW4mqTmnM7YxIlGg6S2a
	PPQwdHmv83278faScZAj2afsEMIF+mFhTFVjzV5i+qfkR0MJSlQ5bGyucN3+eO48lzXIRiNSJhXb2
	y5gLzfjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHHA-00000002u6e-3aBg;
	Mon, 30 Jun 2025 16:22:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWH0V-00000002ojU-0Z3X;
	Mon, 30 Jun 2025 16:05:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F2506112D;
	Mon, 30 Jun 2025 16:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9809C4CEF4;
	Mon, 30 Jun 2025 16:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299522;
	bh=m8b9QVkIhF8M/bhCYfEccNbG5xwp7BU+pMzzoTskfZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dr1yLhc6Hd7kiH/o6qs2PCfo54LA/2VhAWi+gIrOvpsnwFWtyuvceA2rFCIC2ES3H
	 GJGvIWtnt1Dgs7HBOshwa0iW152TaUyUZfkkS8uiKwmVIPvK5gia9LQnANcTFB0ouf
	 lWlsy3E4vW+8KjhOX4F+xVxAUKRK85Uk3334zsgnM6TzADG0k4Zz2/a0s9DsMUzGgz
	 n5ZzT1dJR4xFtHaApZ4q0BFe5KTfahX51omf89DdTOys8OrQvoQ0YVO9nBS6M1ClTT
	 v3rr7GntE1rWyy0lycLESqSvTmKiWgiB+9jnmQpb/GLUB4S8bJr+yqT2C3WIP6sKlF
	 UyfbKdNCR+Gcw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v3 01/16] crypto: sha512 - Rename conflicting symbols
Date: Mon, 30 Jun 2025 09:03:05 -0700
Message-ID: <20250630160320.2888-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160320.2888-1-ebiggers@kernel.org>
References: <20250630160320.2888-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Rename existing functions and structs in architecture-optimized SHA-512
code that had names conflicting with the upcoming library interface
which will be added to <crypto/sha2.h>: sha384_init, sha512_init,
sha512_update, sha384, and sha512.

Note: all affected code will be superseded by later commits that migrate
the arch-optimized SHA-512 code into the library.  This commit simply
keeps the kernel building for the initial introduction of the library.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/crypto/sha512-glue.c     |  8 ++++----
 arch/s390/crypto/sha512_s390.c      |  8 ++++----
 arch/sparc/crypto/sha512_glue.c     | 14 +++++++-------
 arch/x86/crypto/sha512_ssse3_glue.c | 10 +++++-----
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/crypto/sha512-glue.c b/arch/arm64/crypto/sha512-glue.c
index 15aa9d8b7b2c4..a78e184c100fa 100644
--- a/arch/arm64/crypto/sha512-glue.c
+++ b/arch/arm64/crypto/sha512-glue.c
@@ -25,12 +25,12 @@ static void sha512_arm64_transform(struct sha512_state *sst, u8 const *src,
 				   int blocks)
 {
 	sha512_blocks_arch(sst->state, src, blocks);
 }
 
-static int sha512_update(struct shash_desc *desc, const u8 *data,
-			 unsigned int len)
+static int sha512_update_arm64(struct shash_desc *desc, const u8 *data,
+			       unsigned int len)
 {
 	return sha512_base_do_update_blocks(desc, data, len,
 					    sha512_arm64_transform);
 }
 
@@ -42,11 +42,11 @@ static int sha512_finup(struct shash_desc *desc, const u8 *data,
 }
 
 static struct shash_alg algs[] = { {
 	.digestsize		= SHA512_DIGEST_SIZE,
 	.init			= sha512_base_init,
-	.update			= sha512_update,
+	.update			= sha512_update_arm64,
 	.finup			= sha512_finup,
 	.descsize		= SHA512_STATE_SIZE,
 	.base.cra_name		= "sha512",
 	.base.cra_driver_name	= "sha512-arm64",
 	.base.cra_priority	= 150,
@@ -55,11 +55,11 @@ static struct shash_alg algs[] = { {
 	.base.cra_blocksize	= SHA512_BLOCK_SIZE,
 	.base.cra_module	= THIS_MODULE,
 }, {
 	.digestsize		= SHA384_DIGEST_SIZE,
 	.init			= sha384_base_init,
-	.update			= sha512_update,
+	.update			= sha512_update_arm64,
 	.finup			= sha512_finup,
 	.descsize		= SHA512_STATE_SIZE,
 	.base.cra_name		= "sha384",
 	.base.cra_driver_name	= "sha384-arm64",
 	.base.cra_priority	= 150,
diff --git a/arch/s390/crypto/sha512_s390.c b/arch/s390/crypto/sha512_s390.c
index 33711a29618c3..e8bb172dbed75 100644
--- a/arch/s390/crypto/sha512_s390.c
+++ b/arch/s390/crypto/sha512_s390.c
@@ -15,11 +15,11 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 
 #include "sha.h"
 
-static int sha512_init(struct shash_desc *desc)
+static int sha512_init_s390(struct shash_desc *desc)
 {
 	struct s390_sha_ctx *ctx = shash_desc_ctx(desc);
 
 	ctx->sha512.state[0] = SHA512_H0;
 	ctx->sha512.state[1] = SHA512_H1;
@@ -60,11 +60,11 @@ static int sha512_import(struct shash_desc *desc, const void *in)
 	return 0;
 }
 
 static struct shash_alg sha512_alg = {
 	.digestsize	=	SHA512_DIGEST_SIZE,
-	.init		=	sha512_init,
+	.init		=	sha512_init_s390,
 	.update		=	s390_sha_update_blocks,
 	.finup		=	s390_sha_finup,
 	.export		=	sha512_export,
 	.import		=	sha512_import,
 	.descsize	=	sizeof(struct s390_sha_ctx),
@@ -80,11 +80,11 @@ static struct shash_alg sha512_alg = {
 	}
 };
 
 MODULE_ALIAS_CRYPTO("sha512");
 
-static int sha384_init(struct shash_desc *desc)
+static int sha384_init_s390(struct shash_desc *desc)
 {
 	struct s390_sha_ctx *ctx = shash_desc_ctx(desc);
 
 	ctx->sha512.state[0] = SHA384_H0;
 	ctx->sha512.state[1] = SHA384_H1;
@@ -101,11 +101,11 @@ static int sha384_init(struct shash_desc *desc)
 	return 0;
 }
 
 static struct shash_alg sha384_alg = {
 	.digestsize	=	SHA384_DIGEST_SIZE,
-	.init		=	sha384_init,
+	.init		=	sha384_init_s390,
 	.update		=	s390_sha_update_blocks,
 	.finup		=	s390_sha_finup,
 	.export		=	sha512_export,
 	.import		=	sha512_import,
 	.descsize	=	sizeof(struct s390_sha_ctx),
diff --git a/arch/sparc/crypto/sha512_glue.c b/arch/sparc/crypto/sha512_glue.c
index 47b9277b6877a..fb81c3290c8c0 100644
--- a/arch/sparc/crypto/sha512_glue.c
+++ b/arch/sparc/crypto/sha512_glue.c
@@ -38,11 +38,11 @@ static int sha512_sparc64_finup(struct shash_desc *desc, const u8 *src,
 {
 	sha512_base_do_finup(desc, src, len, sha512_block);
 	return sha512_base_finish(desc, out);
 }
 
-static struct shash_alg sha512 = {
+static struct shash_alg sha512_alg = {
 	.digestsize	=	SHA512_DIGEST_SIZE,
 	.init		=	sha512_base_init,
 	.update		=	sha512_sparc64_update,
 	.finup		=	sha512_sparc64_finup,
 	.descsize	=	SHA512_STATE_SIZE,
@@ -53,11 +53,11 @@ static struct shash_alg sha512 = {
 		.cra_blocksize	=	SHA512_BLOCK_SIZE,
 		.cra_module	=	THIS_MODULE,
 	}
 };
 
-static struct shash_alg sha384 = {
+static struct shash_alg sha384_alg = {
 	.digestsize	=	SHA384_DIGEST_SIZE,
 	.init		=	sha384_base_init,
 	.update		=	sha512_sparc64_update,
 	.finup		=	sha512_sparc64_finup,
 	.descsize	=	SHA512_STATE_SIZE,
@@ -85,17 +85,17 @@ static bool __init sparc64_has_sha512_opcode(void)
 }
 
 static int __init sha512_sparc64_mod_init(void)
 {
 	if (sparc64_has_sha512_opcode()) {
-		int ret = crypto_register_shash(&sha384);
+		int ret = crypto_register_shash(&sha384_alg);
 		if (ret < 0)
 			return ret;
 
-		ret = crypto_register_shash(&sha512);
+		ret = crypto_register_shash(&sha512_alg);
 		if (ret < 0) {
-			crypto_unregister_shash(&sha384);
+			crypto_unregister_shash(&sha384_alg);
 			return ret;
 		}
 
 		pr_info("Using sparc64 sha512 opcode optimized SHA-512/SHA-384 implementation\n");
 		return 0;
@@ -104,12 +104,12 @@ static int __init sha512_sparc64_mod_init(void)
 	return -ENODEV;
 }
 
 static void __exit sha512_sparc64_mod_fini(void)
 {
-	crypto_unregister_shash(&sha384);
-	crypto_unregister_shash(&sha512);
+	crypto_unregister_shash(&sha384_alg);
+	crypto_unregister_shash(&sha512_alg);
 }
 
 module_init(sha512_sparc64_mod_init);
 module_exit(sha512_sparc64_mod_fini);
 
diff --git a/arch/x86/crypto/sha512_ssse3_glue.c b/arch/x86/crypto/sha512_ssse3_glue.c
index 067684c543952..97744b7d23817 100644
--- a/arch/x86/crypto/sha512_ssse3_glue.c
+++ b/arch/x86/crypto/sha512_ssse3_glue.c
@@ -36,12 +36,12 @@
 #include <crypto/sha512_base.h>
 
 asmlinkage void sha512_transform_ssse3(struct sha512_state *state,
 				       const u8 *data, int blocks);
 
-static int sha512_update(struct shash_desc *desc, const u8 *data,
-		       unsigned int len, sha512_block_fn *sha512_xform)
+static int sha512_update_x86(struct shash_desc *desc, const u8 *data,
+			     unsigned int len, sha512_block_fn *sha512_xform)
 {
 	int remain;
 
 	/*
 	 * Make sure struct sha512_state begins directly with the SHA512
@@ -67,11 +67,11 @@ static int sha512_finup(struct shash_desc *desc, const u8 *data,
 }
 
 static int sha512_ssse3_update(struct shash_desc *desc, const u8 *data,
 		       unsigned int len)
 {
-	return sha512_update(desc, data, len, sha512_transform_ssse3);
+	return sha512_update_x86(desc, data, len, sha512_transform_ssse3);
 }
 
 static int sha512_ssse3_finup(struct shash_desc *desc, const u8 *data,
 	      unsigned int len, u8 *out)
 {
@@ -139,11 +139,11 @@ static bool avx_usable(void)
 }
 
 static int sha512_avx_update(struct shash_desc *desc, const u8 *data,
 		       unsigned int len)
 {
-	return sha512_update(desc, data, len, sha512_transform_avx);
+	return sha512_update_x86(desc, data, len, sha512_transform_avx);
 }
 
 static int sha512_avx_finup(struct shash_desc *desc, const u8 *data,
 	      unsigned int len, u8 *out)
 {
@@ -201,11 +201,11 @@ asmlinkage void sha512_transform_rorx(struct sha512_state *state,
 				      const u8 *data, int blocks);
 
 static int sha512_avx2_update(struct shash_desc *desc, const u8 *data,
 		       unsigned int len)
 {
-	return sha512_update(desc, data, len, sha512_transform_rorx);
+	return sha512_update_x86(desc, data, len, sha512_transform_rorx);
 }
 
 static int sha512_avx2_finup(struct shash_desc *desc, const u8 *data,
 	      unsigned int len, u8 *out)
 {
-- 
2.50.0


