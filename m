Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E649C71134
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 02:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZdQsFt4GeWqDc7rqot5PaQVq14ZLz8q+8+ujmTkMPE=; b=V1J50lnoVmLFrpVdU3yRcXKdDv
	XorrvVmUuqGPLRfodpM0CJP+RZXj7aODrjLzYqUzklHyxRtN0rKWeRfw6w4I/feQFswrPLR5fi4+q
	gjef5UQxNtgAHFN9HfVRmQ1XXqt+h0aW2CgUTdVPaWR/CRDR5NvELQEHVuTKzF3jFf6Bzpt4IIfdZ
	g7CeSuDfyC4W2y6S/L+vzCA5uWppqigZpmsGqsp6iHYH9BV2o2wzoCoaUeJHvXeyQofqHcvah/S7y
	tg24WRq8m2cfQ4o8cfZ+jLsAqXvOjPGB9/r68k/LUSg/XbziryIfCJVpfVWSS5CDBrsGniQzZ4ufJ
	N5N1gILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPB3r-00000008dib-41Rn;
	Wed, 11 Jun 2025 02:19:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAxR-00000008cMB-3HuQ;
	Wed, 11 Jun 2025 02:12:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D0310A51255;
	Wed, 11 Jun 2025 02:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50059C4CEF1;
	Wed, 11 Jun 2025 02:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749607972;
	bh=hTzqIPE8jGSH60x3USrFNk9o+3svOV8hf9z113UDgJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O9SOps0Uo2bDYBlyskNcRKbp7I+RI3AAQBONiPJ5syevbDXXmUhAsMbLHADD/c1eh
	 9VRigQ7XlLzJCkIZ3KqoBH67n5HLlbkMOH3gebJSi7cLvFFr2+G8vVcH8WmUMzSkH9
	 wikjUROQdLIVlJaJ86iPHSU9hoVvcS4W/uonPUUNxcTTs79BA2Qc0rlSQzMoZrVOUN
	 4dBYK3gGkDQPcmyTHWTRc9/tq39ILKBYirIDvlR9jJ4Gyt9kQ/1r/KtSOhs7UDuKUJ
	 jkGfUex1KyuizQT/O1E/6lMDD9oMtb4U6f3nNyskPJ1xh1pVg4T40DY432p5vFuF3N
	 bUqmz4zt2qCtg==
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
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 01/16] crypto: sha512 - rename conflicting symbols
Date: Tue, 10 Jun 2025 19:09:08 -0700
Message-ID: <20250611020923.1482701-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611020923.1482701-1-ebiggers@kernel.org>
References: <20250611020923.1482701-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_191253_970006_DFB0D21F 
X-CRM114-Status: GOOD (  16.80  )
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

From: Eric Biggers <ebiggers@google.com>

Rename existing functions and structs in architecture-optimized SHA-512
code that had names conflicting with the upcoming library interface
which will be added to <crypto/sha2.h>: sha384_init, sha512_init,
sha512_update, sha384, and sha512.

Note: all affected code will be superseded by later commits that migrate
the arch-optimized SHA-512 code into the library.  This commit simply
keeps the kernel building for the initial introduction of the library.

Signed-off-by: Eric Biggers <ebiggers@google.com>
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
2.49.0


