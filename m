Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69263D3E78C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 01:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWz8FBQLNC3chzOyjuP1tX0+e/qTjiPNAhzle1Nl2R0=; b=ClTBdMQZcVusilElEgD4CgeNcb
	Ifrs/1DocJ44h5bnuy/paXJ3QJ3S6ZiX2xYsOpv2CgmKJuOAKPHF6vE8d0cFa2rIC2AG+eOTEY5Td
	kwaKQk3J5Om0qhaQN1hBOWRXQ7l/hzHfkm/8+rpoQff66JNT54359tmshSLfiBybat9snmpxhJNlF
	rSbwNe9T7aPTJ85iBgCoHrutyg130k8bsmB6wvP60lRDSBlzhzbuWVE8kjx46s5oERdV9kaEND3AU
	fOHVTbPrD1FGvo/tEFcVo3UBGp0+vQ/IzzYVXSLsBwLgeHS2F8bqxXjLpJZD9fybQ6//MKe52k7wF
	x9ggG4KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMe-0000000G3p3-2h8d;
	Thu, 11 Dec 2025 01:21:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMY-0000000G3gF-1otu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 01:21:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FCC441A83;
	Thu, 11 Dec 2025 01:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2716C4CEF7;
	Thu, 11 Dec 2025 01:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765416057;
	bh=/nofUveZyorl1krlyxDggW3EvtuF1tSn+n8Tbr1hxlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TeUDdx5kdaBvIJ30eIjLLOyZav2WdtEZosrnwPE2iBRWTjsuxrm+FPU+kRtXlEYLH
	 PzUFj6cPC0kb4DCY3EOXSaKt+aGWe3pZhFOZdiTCx0mN6gW+B9yIUII5+u1Qvuja5f
	 Q2szzKZgnFZjzYrx6DHJSsyVTcrHmRWgoQcclljNHJS7jxmmyuzax2JasX8UI1woUw
	 yF2PITqqrWQ54gSxhZ2Z6Hxym1TCIfeTVIL2sanf+KSJgaXlps4m7cqzRTRiWaddPW
	 JDCeT1i6iz/7jv1VYlgFz+pTkC7WkOmNB1E1SUU8YHhyfOTqeV1yra8a0g8BkRetTk
	 tKtHmZKqhxPMg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 10/12] crypto: nhpoly1305 - Remove crypto_shash support
Date: Wed, 10 Dec 2025 17:18:42 -0800
Message-ID: <20251211011846.8179-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211011846.8179-1-ebiggers@kernel.org>
References: <20251211011846.8179-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_172058_584320_3E330CC0 
X-CRM114-Status: GOOD (  24.73  )
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

Remove nhpoly1305 support from crypto_shash.  It no longer has any user
now that crypto/adiantum.c no longer uses it.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/Kconfig              |   6 -
 crypto/Makefile             |   1 -
 crypto/nhpoly1305.c         | 255 ------------------------------------
 include/crypto/nhpoly1305.h |  74 -----------
 4 files changed, 336 deletions(-)
 delete mode 100644 crypto/nhpoly1305.c
 delete mode 100644 include/crypto/nhpoly1305.h

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 89d1ccaa1fa0..12a87f7cf150 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -757,16 +757,10 @@ config CRYPTO_XTS
 
 	  Use with aes-xts-plain, key size 256, 384 or 512 bits. This
 	  implementation currently can't handle a sectorsize which is not a
 	  multiple of 16 bytes.
 
-config CRYPTO_NHPOLY1305
-	tristate
-	select CRYPTO_HASH
-	select CRYPTO_LIB_POLY1305
-	select CRYPTO_LIB_POLY1305_GENERIC
-
 endmenu
 
 menu "AEAD (authenticated encryption with associated data) ciphers"
 
 config CRYPTO_AEGIS128
diff --git a/crypto/Makefile b/crypto/Makefile
index 16a35649dd91..23d3db7be425 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -92,11 +92,10 @@ obj-$(CONFIG_CRYPTO_LRW) += lrw.o
 obj-$(CONFIG_CRYPTO_XTS) += xts.o
 obj-$(CONFIG_CRYPTO_CTR) += ctr.o
 obj-$(CONFIG_CRYPTO_XCTR) += xctr.o
 obj-$(CONFIG_CRYPTO_HCTR2) += hctr2.o
 obj-$(CONFIG_CRYPTO_ADIANTUM) += adiantum.o
-obj-$(CONFIG_CRYPTO_NHPOLY1305) += nhpoly1305.o
 obj-$(CONFIG_CRYPTO_GCM) += gcm.o
 obj-$(CONFIG_CRYPTO_CCM) += ccm.o
 obj-$(CONFIG_CRYPTO_CHACHA20POLY1305) += chacha20poly1305.o
 obj-$(CONFIG_CRYPTO_AEGIS128) += aegis128.o
 aegis128-y := aegis128-core.o
diff --git a/crypto/nhpoly1305.c b/crypto/nhpoly1305.c
deleted file mode 100644
index 2b648615b5ec..000000000000
--- a/crypto/nhpoly1305.c
+++ /dev/null
@@ -1,255 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * NHPoly1305 - ε-almost-∆-universal hash function for Adiantum
- *
- * Copyright 2018 Google LLC
- */
-
-/*
- * "NHPoly1305" is the main component of Adiantum hashing.
- * Specifically, it is the calculation
- *
- *	H_L ← Poly1305_{K_L}(NH_{K_N}(pad_{128}(L)))
- *
- * from the procedure in section 6.4 of the Adiantum paper [1].  It is an
- * ε-almost-∆-universal (ε-∆U) hash function for equal-length inputs over
- * Z/(2^{128}Z), where the "∆" operation is addition.  It hashes 1024-byte
- * chunks of the input with the NH hash function [2], reducing the input length
- * by 32x.  The resulting NH digests are evaluated as a polynomial in
- * GF(2^{130}-5), like in the Poly1305 MAC [3].  Note that the polynomial
- * evaluation by itself would suffice to achieve the ε-∆U property; NH is used
- * for performance since it's over twice as fast as Poly1305.
- *
- * This is *not* a cryptographic hash function; do not use it as such!
- *
- * [1] Adiantum: length-preserving encryption for entry-level processors
- *     (https://eprint.iacr.org/2018/720.pdf)
- * [2] UMAC: Fast and Secure Message Authentication
- *     (https://fastcrypto.org/umac/umac_proc.pdf)
- * [3] The Poly1305-AES message-authentication code
- *     (https://cr.yp.to/mac/poly1305-20050329.pdf)
- */
-
-#include <linux/unaligned.h>
-#include <crypto/algapi.h>
-#include <crypto/internal/hash.h>
-#include <crypto/internal/poly1305.h>
-#include <crypto/nhpoly1305.h>
-#include <linux/crypto.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-static void nh_generic(const u32 *key, const u8 *message, size_t message_len,
-		       __le64 hash[NH_NUM_PASSES])
-{
-	u64 sums[4] = { 0, 0, 0, 0 };
-
-	BUILD_BUG_ON(NH_PAIR_STRIDE != 2);
-	BUILD_BUG_ON(NH_NUM_PASSES != 4);
-
-	while (message_len) {
-		u32 m0 = get_unaligned_le32(message + 0);
-		u32 m1 = get_unaligned_le32(message + 4);
-		u32 m2 = get_unaligned_le32(message + 8);
-		u32 m3 = get_unaligned_le32(message + 12);
-
-		sums[0] += (u64)(u32)(m0 + key[ 0]) * (u32)(m2 + key[ 2]);
-		sums[1] += (u64)(u32)(m0 + key[ 4]) * (u32)(m2 + key[ 6]);
-		sums[2] += (u64)(u32)(m0 + key[ 8]) * (u32)(m2 + key[10]);
-		sums[3] += (u64)(u32)(m0 + key[12]) * (u32)(m2 + key[14]);
-		sums[0] += (u64)(u32)(m1 + key[ 1]) * (u32)(m3 + key[ 3]);
-		sums[1] += (u64)(u32)(m1 + key[ 5]) * (u32)(m3 + key[ 7]);
-		sums[2] += (u64)(u32)(m1 + key[ 9]) * (u32)(m3 + key[11]);
-		sums[3] += (u64)(u32)(m1 + key[13]) * (u32)(m3 + key[15]);
-		key += NH_MESSAGE_UNIT / sizeof(key[0]);
-		message += NH_MESSAGE_UNIT;
-		message_len -= NH_MESSAGE_UNIT;
-	}
-
-	hash[0] = cpu_to_le64(sums[0]);
-	hash[1] = cpu_to_le64(sums[1]);
-	hash[2] = cpu_to_le64(sums[2]);
-	hash[3] = cpu_to_le64(sums[3]);
-}
-
-/* Pass the next NH hash value through Poly1305 */
-static void process_nh_hash_value(struct nhpoly1305_state *state,
-				  const struct nhpoly1305_key *key)
-{
-	BUILD_BUG_ON(NH_HASH_BYTES % POLY1305_BLOCK_SIZE != 0);
-
-	poly1305_core_blocks(&state->poly_state, &key->poly_key, state->nh_hash,
-			     NH_HASH_BYTES / POLY1305_BLOCK_SIZE, 1);
-}
-
-/*
- * Feed the next portion of the source data, as a whole number of 16-byte
- * "NH message units", through NH and Poly1305.  Each NH hash is taken over
- * 1024 bytes, except possibly the final one which is taken over a multiple of
- * 16 bytes up to 1024.  Also, in the case where data is passed in misaligned
- * chunks, we combine partial hashes; the end result is the same either way.
- */
-static void nhpoly1305_units(struct nhpoly1305_state *state,
-			     const struct nhpoly1305_key *key,
-			     const u8 *src, unsigned int srclen, nh_t nh_fn)
-{
-	do {
-		unsigned int bytes;
-
-		if (state->nh_remaining == 0) {
-			/* Starting a new NH message */
-			bytes = min_t(unsigned int, srclen, NH_MESSAGE_BYTES);
-			nh_fn(key->nh_key, src, bytes, state->nh_hash);
-			state->nh_remaining = NH_MESSAGE_BYTES - bytes;
-		} else {
-			/* Continuing a previous NH message */
-			__le64 tmp_hash[NH_NUM_PASSES];
-			unsigned int pos;
-			int i;
-
-			pos = NH_MESSAGE_BYTES - state->nh_remaining;
-			bytes = min(srclen, state->nh_remaining);
-			nh_fn(&key->nh_key[pos / 4], src, bytes, tmp_hash);
-			for (i = 0; i < NH_NUM_PASSES; i++)
-				le64_add_cpu(&state->nh_hash[i],
-					     le64_to_cpu(tmp_hash[i]));
-			state->nh_remaining -= bytes;
-		}
-		if (state->nh_remaining == 0)
-			process_nh_hash_value(state, key);
-		src += bytes;
-		srclen -= bytes;
-	} while (srclen);
-}
-
-int crypto_nhpoly1305_setkey(struct crypto_shash *tfm,
-			     const u8 *key, unsigned int keylen)
-{
-	struct nhpoly1305_key *ctx = crypto_shash_ctx(tfm);
-	int i;
-
-	if (keylen != NHPOLY1305_KEY_SIZE)
-		return -EINVAL;
-
-	poly1305_core_setkey(&ctx->poly_key, key);
-	key += POLY1305_BLOCK_SIZE;
-
-	for (i = 0; i < NH_KEY_WORDS; i++)
-		ctx->nh_key[i] = get_unaligned_le32(key + i * sizeof(u32));
-
-	return 0;
-}
-EXPORT_SYMBOL(crypto_nhpoly1305_setkey);
-
-int crypto_nhpoly1305_init(struct shash_desc *desc)
-{
-	struct nhpoly1305_state *state = shash_desc_ctx(desc);
-
-	poly1305_core_init(&state->poly_state);
-	state->buflen = 0;
-	state->nh_remaining = 0;
-	return 0;
-}
-EXPORT_SYMBOL(crypto_nhpoly1305_init);
-
-int crypto_nhpoly1305_update_helper(struct shash_desc *desc,
-				    const u8 *src, unsigned int srclen,
-				    nh_t nh_fn)
-{
-	struct nhpoly1305_state *state = shash_desc_ctx(desc);
-	const struct nhpoly1305_key *key = crypto_shash_ctx(desc->tfm);
-	unsigned int bytes;
-
-	if (state->buflen) {
-		bytes = min(srclen, (int)NH_MESSAGE_UNIT - state->buflen);
-		memcpy(&state->buffer[state->buflen], src, bytes);
-		state->buflen += bytes;
-		if (state->buflen < NH_MESSAGE_UNIT)
-			return 0;
-		nhpoly1305_units(state, key, state->buffer, NH_MESSAGE_UNIT,
-				 nh_fn);
-		state->buflen = 0;
-		src += bytes;
-		srclen -= bytes;
-	}
-
-	if (srclen >= NH_MESSAGE_UNIT) {
-		bytes = round_down(srclen, NH_MESSAGE_UNIT);
-		nhpoly1305_units(state, key, src, bytes, nh_fn);
-		src += bytes;
-		srclen -= bytes;
-	}
-
-	if (srclen) {
-		memcpy(state->buffer, src, srclen);
-		state->buflen = srclen;
-	}
-	return 0;
-}
-EXPORT_SYMBOL(crypto_nhpoly1305_update_helper);
-
-int crypto_nhpoly1305_update(struct shash_desc *desc,
-			     const u8 *src, unsigned int srclen)
-{
-	return crypto_nhpoly1305_update_helper(desc, src, srclen, nh_generic);
-}
-EXPORT_SYMBOL(crypto_nhpoly1305_update);
-
-int crypto_nhpoly1305_final_helper(struct shash_desc *desc, u8 *dst, nh_t nh_fn)
-{
-	struct nhpoly1305_state *state = shash_desc_ctx(desc);
-	const struct nhpoly1305_key *key = crypto_shash_ctx(desc->tfm);
-
-	if (state->buflen) {
-		memset(&state->buffer[state->buflen], 0,
-		       NH_MESSAGE_UNIT - state->buflen);
-		nhpoly1305_units(state, key, state->buffer, NH_MESSAGE_UNIT,
-				 nh_fn);
-	}
-
-	if (state->nh_remaining)
-		process_nh_hash_value(state, key);
-
-	poly1305_core_emit(&state->poly_state, NULL, dst);
-	return 0;
-}
-EXPORT_SYMBOL(crypto_nhpoly1305_final_helper);
-
-int crypto_nhpoly1305_final(struct shash_desc *desc, u8 *dst)
-{
-	return crypto_nhpoly1305_final_helper(desc, dst, nh_generic);
-}
-EXPORT_SYMBOL(crypto_nhpoly1305_final);
-
-static struct shash_alg nhpoly1305_alg = {
-	.base.cra_name		= "nhpoly1305",
-	.base.cra_driver_name	= "nhpoly1305-generic",
-	.base.cra_priority	= 100,
-	.base.cra_ctxsize	= sizeof(struct nhpoly1305_key),
-	.base.cra_module	= THIS_MODULE,
-	.digestsize		= POLY1305_DIGEST_SIZE,
-	.init			= crypto_nhpoly1305_init,
-	.update			= crypto_nhpoly1305_update,
-	.final			= crypto_nhpoly1305_final,
-	.setkey			= crypto_nhpoly1305_setkey,
-	.descsize		= sizeof(struct nhpoly1305_state),
-};
-
-static int __init nhpoly1305_mod_init(void)
-{
-	return crypto_register_shash(&nhpoly1305_alg);
-}
-
-static void __exit nhpoly1305_mod_exit(void)
-{
-	crypto_unregister_shash(&nhpoly1305_alg);
-}
-
-module_init(nhpoly1305_mod_init);
-module_exit(nhpoly1305_mod_exit);
-
-MODULE_DESCRIPTION("NHPoly1305 ε-almost-∆-universal hash function");
-MODULE_LICENSE("GPL v2");
-MODULE_AUTHOR("Eric Biggers <ebiggers@google.com>");
-MODULE_ALIAS_CRYPTO("nhpoly1305");
-MODULE_ALIAS_CRYPTO("nhpoly1305-generic");
diff --git a/include/crypto/nhpoly1305.h b/include/crypto/nhpoly1305.h
deleted file mode 100644
index 306925fea190..000000000000
--- a/include/crypto/nhpoly1305.h
+++ /dev/null
@@ -1,74 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Common values and helper functions for the NHPoly1305 hash function.
- */
-
-#ifndef _NHPOLY1305_H
-#define _NHPOLY1305_H
-
-#include <crypto/hash.h>
-#include <crypto/internal/poly1305.h>
-
-/* NH parameterization: */
-
-/* Endianness: little */
-/* Word size: 32 bits (works well on NEON, SSE2, AVX2) */
-
-/* Stride: 2 words (optimal on ARM32 NEON; works okay on other CPUs too) */
-#define NH_PAIR_STRIDE		2
-#define NH_MESSAGE_UNIT		(NH_PAIR_STRIDE * 2 * sizeof(u32))
-
-/* Num passes (Toeplitz iteration count): 4, to give ε = 2^{-128} */
-#define NH_NUM_PASSES		4
-#define NH_HASH_BYTES		(NH_NUM_PASSES * sizeof(u64))
-
-/* Max message size: 1024 bytes (32x compression factor) */
-#define NH_NUM_STRIDES		64
-#define NH_MESSAGE_WORDS	(NH_PAIR_STRIDE * 2 * NH_NUM_STRIDES)
-#define NH_MESSAGE_BYTES	(NH_MESSAGE_WORDS * sizeof(u32))
-#define NH_KEY_WORDS		(NH_MESSAGE_WORDS + \
-				 NH_PAIR_STRIDE * 2 * (NH_NUM_PASSES - 1))
-#define NH_KEY_BYTES		(NH_KEY_WORDS * sizeof(u32))
-
-#define NHPOLY1305_KEY_SIZE	(POLY1305_BLOCK_SIZE + NH_KEY_BYTES)
-
-struct nhpoly1305_key {
-	struct poly1305_core_key poly_key;
-	u32 nh_key[NH_KEY_WORDS];
-};
-
-struct nhpoly1305_state {
-
-	/* Running total of polynomial evaluation */
-	struct poly1305_state poly_state;
-
-	/* Partial block buffer */
-	u8 buffer[NH_MESSAGE_UNIT];
-	unsigned int buflen;
-
-	/*
-	 * Number of bytes remaining until the current NH message reaches
-	 * NH_MESSAGE_BYTES.  When nonzero, 'nh_hash' holds the partial NH hash.
-	 */
-	unsigned int nh_remaining;
-
-	__le64 nh_hash[NH_NUM_PASSES];
-};
-
-typedef void (*nh_t)(const u32 *key, const u8 *message, size_t message_len,
-		     __le64 hash[NH_NUM_PASSES]);
-
-int crypto_nhpoly1305_setkey(struct crypto_shash *tfm,
-			     const u8 *key, unsigned int keylen);
-
-int crypto_nhpoly1305_init(struct shash_desc *desc);
-int crypto_nhpoly1305_update(struct shash_desc *desc,
-			     const u8 *src, unsigned int srclen);
-int crypto_nhpoly1305_update_helper(struct shash_desc *desc,
-				    const u8 *src, unsigned int srclen,
-				    nh_t nh_fn);
-int crypto_nhpoly1305_final(struct shash_desc *desc, u8 *dst);
-int crypto_nhpoly1305_final_helper(struct shash_desc *desc, u8 *dst,
-				   nh_t nh_fn);
-
-#endif /* _NHPOLY1305_H */
-- 
2.52.0


