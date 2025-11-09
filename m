Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C453CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFROL0VvOPkRmMdmt/KDM+OHMiD4GfDdJWHKglp9Zw0=; b=Rju6GGe/lkdUKhdfrDNziHQTFp
	sjLJ+fq6RAca9MKAG5gE5owxbJVKMHSJ2MVgGiD2HVnRFQmUn4sUPRorMsqVr3WdUEL6mbllR+RM3
	vCFJzzOQDjECg5x1wI73x6QYDN+7NgTNiU+D1WTT51DY1rKIAj0n0kBoXO1ViHV91PfFIlmkjqsFD
	L+AuKNUlXc8ailiFx8UcXljcZ+VrGlG6XCRDZjOOSpV/rsKMZsMLWYt4v4zSaAl093c/ykgGzloYs
	FAWPRClDowWNerxUwaj0j/mpSS6jiyPqFD6AvuQIZTfmZ/envjRlGWp65yS8rciGpLX8B8Lar5f4/
	Txnvm/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIFAf-00000004VqP-49NF;
	Sun, 09 Nov 2025 23:50:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIFAW-00000004VlG-3oCP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 23:50:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD0E1446C1;
	Sun,  9 Nov 2025 23:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCA9C113D0;
	Sun,  9 Nov 2025 23:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762732199;
	bh=Zodgx2IYoNCP1gQCEOxcXaY8nw/zLva62Cv6WrKrveo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bHY/4O64tE1Hgu0ldpjTDMtmZm6jm5u7rgsO6X7LaBLYf6YGaIKvRImvfPpEkGKvV
	 vB+Tps9CbLKK5/m/269VfcjRb9jzTi/Q11mSmmLg+1PQeoi3zNypTWcDYZrXODk25N
	 4rpOMiC0KyNqSd1z9QRPQ8XWw6at6l0ZkTjD7ygoxSVRr8fqYZTJxzyI0M18nt9VN1
	 Ha9E06n27LxzTrhD4/2tX8e0nL47DQKaJ05hyRxTY8AJbZydqgvnfUqL7twT0x+qFj
	 RtwcFuRfV/4YbSkuOCj9J6wq5KSYeJZolawOA8q7HEwA1WDXLIE2ctKNFTB+PzyZ4d
	 cdyTQrF+Rl8Qg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 7/9] crypto: polyval - Remove the polyval crypto_shash
Date: Sun,  9 Nov 2025 15:47:22 -0800
Message-ID: <20251109234726.638437-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109234726.638437-1-ebiggers@kernel.org>
References: <20251109234726.638437-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_155001_019657_FF25856C 
X-CRM114-Status: GOOD (  23.01  )
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

Remove polyval support from crypto_shash.  It no longer has any user now
that the HCTR2 code uses the POLYVAL library instead.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/Kconfig           |  10 --
 crypto/Makefile          |   1 -
 crypto/polyval-generic.c | 205 ---------------------------------------
 3 files changed, 216 deletions(-)
 delete mode 100644 crypto/polyval-generic.c

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 805172f75bf1..bf8b8a60a0c0 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -946,20 +946,10 @@ config CRYPTO_MICHAEL_MIC
 	  known as WPA (Wif-Fi Protected Access).
 
 	  This algorithm is required for TKIP, but it should not be used for
 	  other purposes because of the weakness of the algorithm.
 
-config CRYPTO_POLYVAL
-	tristate
-	select CRYPTO_HASH
-	select CRYPTO_LIB_GF128MUL
-	help
-	  POLYVAL hash function for HCTR2
-
-	  This is used in HCTR2.  It is not a general-purpose
-	  cryptographic hash function.
-
 config CRYPTO_RMD160
 	tristate "RIPEMD-160"
 	select CRYPTO_HASH
 	help
 	  RIPEMD-160 hash function (ISO/IEC 10118-3)
diff --git a/crypto/Makefile b/crypto/Makefile
index 0388ff8d219d..093c56a45d3f 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -170,11 +170,10 @@ KASAN_SANITIZE_jitterentropy.o = n
 UBSAN_SANITIZE_jitterentropy.o = n
 jitterentropy_rng-y := jitterentropy.o jitterentropy-kcapi.o
 obj-$(CONFIG_CRYPTO_JITTERENTROPY_TESTINTERFACE) += jitterentropy-testing.o
 obj-$(CONFIG_CRYPTO_BENCHMARK) += tcrypt.o
 obj-$(CONFIG_CRYPTO_GHASH) += ghash-generic.o
-obj-$(CONFIG_CRYPTO_POLYVAL) += polyval-generic.o
 obj-$(CONFIG_CRYPTO_USER_API) += af_alg.o
 obj-$(CONFIG_CRYPTO_USER_API_HASH) += algif_hash.o
 obj-$(CONFIG_CRYPTO_USER_API_SKCIPHER) += algif_skcipher.o
 obj-$(CONFIG_CRYPTO_USER_API_RNG) += algif_rng.o
 obj-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
diff --git a/crypto/polyval-generic.c b/crypto/polyval-generic.c
deleted file mode 100644
index fe5b01a4000d..000000000000
--- a/crypto/polyval-generic.c
+++ /dev/null
@@ -1,205 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * POLYVAL: hash function for HCTR2.
- *
- * Copyright (c) 2007 Nokia Siemens Networks - Mikko Herranen <mh1@iki.fi>
- * Copyright (c) 2009 Intel Corp.
- *   Author: Huang Ying <ying.huang@intel.com>
- * Copyright 2021 Google LLC
- */
-
-/*
- * Code based on crypto/ghash-generic.c
- *
- * POLYVAL is a keyed hash function similar to GHASH. POLYVAL uses a different
- * modulus for finite field multiplication which makes hardware accelerated
- * implementations on little-endian machines faster. POLYVAL is used in the
- * kernel to implement HCTR2, but was originally specified for AES-GCM-SIV
- * (RFC 8452).
- *
- * For more information see:
- * Length-preserving encryption with HCTR2:
- *   https://eprint.iacr.org/2021/1441.pdf
- * AES-GCM-SIV: Nonce Misuse-Resistant Authenticated Encryption:
- *   https://datatracker.ietf.org/doc/html/rfc8452
- *
- * Like GHASH, POLYVAL is not a cryptographic hash function and should
- * not be used outside of crypto modes explicitly designed to use POLYVAL.
- *
- * This implementation uses a convenient trick involving the GHASH and POLYVAL
- * fields. This trick allows multiplication in the POLYVAL field to be
- * implemented by using multiplication in the GHASH field as a subroutine. An
- * element of the POLYVAL field can be converted to an element of the GHASH
- * field by computing x*REVERSE(a), where REVERSE reverses the byte-ordering of
- * a. Similarly, an element of the GHASH field can be converted back to the
- * POLYVAL field by computing REVERSE(x^{-1}*a). For more information, see:
- * https://datatracker.ietf.org/doc/html/rfc8452#appendix-A
- *
- * By using this trick, we do not need to implement the POLYVAL field for the
- * generic implementation.
- *
- * Warning: this generic implementation is not intended to be used in practice
- * and is not constant time. For practical use, a hardware accelerated
- * implementation of POLYVAL should be used instead.
- *
- */
-
-#include <crypto/gf128mul.h>
-#include <crypto/internal/hash.h>
-#include <crypto/polyval.h>
-#include <crypto/utils.h>
-#include <linux/errno.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/unaligned.h>
-
-struct polyval_tfm_ctx {
-	struct gf128mul_4k *gf128;
-};
-
-struct polyval_desc_ctx {
-	union {
-		u8 buffer[POLYVAL_BLOCK_SIZE];
-		be128 buffer128;
-	};
-};
-
-static void copy_and_reverse(u8 dst[POLYVAL_BLOCK_SIZE],
-			     const u8 src[POLYVAL_BLOCK_SIZE])
-{
-	u64 a = get_unaligned((const u64 *)&src[0]);
-	u64 b = get_unaligned((const u64 *)&src[8]);
-
-	put_unaligned(swab64(a), (u64 *)&dst[8]);
-	put_unaligned(swab64(b), (u64 *)&dst[0]);
-}
-
-static int polyval_setkey(struct crypto_shash *tfm,
-			  const u8 *key, unsigned int keylen)
-{
-	struct polyval_tfm_ctx *ctx = crypto_shash_ctx(tfm);
-	be128 k;
-
-	if (keylen != POLYVAL_BLOCK_SIZE)
-		return -EINVAL;
-
-	gf128mul_free_4k(ctx->gf128);
-
-	BUILD_BUG_ON(sizeof(k) != POLYVAL_BLOCK_SIZE);
-	copy_and_reverse((u8 *)&k, key);
-	gf128mul_x_lle(&k, &k);
-
-	ctx->gf128 = gf128mul_init_4k_lle(&k);
-	memzero_explicit(&k, POLYVAL_BLOCK_SIZE);
-
-	if (!ctx->gf128)
-		return -ENOMEM;
-
-	return 0;
-}
-
-static int polyval_generic_init(struct shash_desc *desc)
-{
-	struct polyval_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	memset(dctx, 0, sizeof(*dctx));
-
-	return 0;
-}
-
-static int polyval_generic_update(struct shash_desc *desc,
-				  const u8 *src, unsigned int srclen)
-{
-	struct polyval_desc_ctx *dctx = shash_desc_ctx(desc);
-	const struct polyval_tfm_ctx *ctx = crypto_shash_ctx(desc->tfm);
-	u8 tmp[POLYVAL_BLOCK_SIZE];
-
-	do {
-		copy_and_reverse(tmp, src);
-		crypto_xor(dctx->buffer, tmp, POLYVAL_BLOCK_SIZE);
-		gf128mul_4k_lle(&dctx->buffer128, ctx->gf128);
-		src += POLYVAL_BLOCK_SIZE;
-		srclen -= POLYVAL_BLOCK_SIZE;
-	} while (srclen >= POLYVAL_BLOCK_SIZE);
-
-	return srclen;
-}
-
-static int polyval_finup(struct shash_desc *desc, const u8 *src,
-			 unsigned int len, u8 *dst)
-{
-	struct polyval_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	if (len) {
-		u8 tmp[POLYVAL_BLOCK_SIZE] = {};
-
-		memcpy(tmp, src, len);
-		polyval_generic_update(desc, tmp, POLYVAL_BLOCK_SIZE);
-	}
-	copy_and_reverse(dst, dctx->buffer);
-	return 0;
-}
-
-static int polyval_export(struct shash_desc *desc, void *out)
-{
-	struct polyval_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	copy_and_reverse(out, dctx->buffer);
-	return 0;
-}
-
-static int polyval_import(struct shash_desc *desc, const void *in)
-{
-	struct polyval_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	copy_and_reverse(dctx->buffer, in);
-	return 0;
-}
-
-static void polyval_exit_tfm(struct crypto_shash *tfm)
-{
-	struct polyval_tfm_ctx *ctx = crypto_shash_ctx(tfm);
-
-	gf128mul_free_4k(ctx->gf128);
-}
-
-static struct shash_alg polyval_alg = {
-	.digestsize	= POLYVAL_DIGEST_SIZE,
-	.init		= polyval_generic_init,
-	.update		= polyval_generic_update,
-	.finup		= polyval_finup,
-	.setkey		= polyval_setkey,
-	.export		= polyval_export,
-	.import		= polyval_import,
-	.exit_tfm	= polyval_exit_tfm,
-	.statesize	= sizeof(struct polyval_desc_ctx),
-	.descsize	= sizeof(struct polyval_desc_ctx),
-	.base		= {
-		.cra_name		= "polyval",
-		.cra_driver_name	= "polyval-generic",
-		.cra_priority		= 100,
-		.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize		= POLYVAL_BLOCK_SIZE,
-		.cra_ctxsize		= sizeof(struct polyval_tfm_ctx),
-		.cra_module		= THIS_MODULE,
-	},
-};
-
-static int __init polyval_mod_init(void)
-{
-	return crypto_register_shash(&polyval_alg);
-}
-
-static void __exit polyval_mod_exit(void)
-{
-	crypto_unregister_shash(&polyval_alg);
-}
-
-module_init(polyval_mod_init);
-module_exit(polyval_mod_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("POLYVAL hash function");
-MODULE_ALIAS_CRYPTO("polyval");
-MODULE_ALIAS_CRYPTO("polyval-generic");
-- 
2.51.2


