Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB375C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 05:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:
	References:In-Reply-To:Message-Id:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zs+jjuqV59SC6aR+A/8i7hzPzQTJkbGceMgv3+5Qxj4=; b=AgFMy4GJVuECWvQmZqjcc2EJV8
	lxAGSNKGTieUmb/5e5CRMGLjbNc0b9yc2SD2N7SYCWkdRkYhDFF1JHECmVbPz18rjHX6yIBqlxQbW
	+pAjxSH4TfVRX/DMMpFnLmri9r0DJf26wyiQpZvZpVSsaGQKu5O1H6QJR+eu8HKfwsYGq5ji393QA
	r6DHzoq02meiq4eM2040nG8w4tpVUGvHGBwHr9+CC3Na5kK3q4kWq9hQLVOl7mdqEpIHb6efabnYA
	HYKQSsGSoFEhRRsQ6YvhGTCBnN0TaZTkkWrXz66g8IaO2dp67nDBYp006kTpPUnQjTi89Qwy/vg6t
	mxANF/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9HF6-00000004qYe-0Rhw;
	Mon, 28 Apr 2025 05:41:24 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Gs1-00000004hXA-0Emj;
	Mon, 28 Apr 2025 05:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Zs+jjuqV59SC6aR+A/8i7hzPzQTJkbGceMgv3+5Qxj4=; b=RN1e0J3y9nSsePTNr41C+LgIRb
	9eqX9TNconFna8BSR/AaM65fBQpXiOjY0jH/YhhNkIsK51uJX07eph82OjarfAkSeXeo+co1D5+7J
	MRCu4c4Xp+EtbLZQHvOg+pe2F1ycY1/MTdHsLYNaEQX3GYcOP8oayF0vjIvcSsaH5kmtKVrK7BxKA
	EFTwEURaNtx4ZdLJOgC/QZtNmY4roLW8V32OsEt8kWtSVz3CZ9ma9yFXnUiUdAcQO66myKgTjaQP9
	+YjLhDtOi/l+DmsF7it1Q7F/eTJsTrprXeJ/0n+xWGs0MZx/+Tpu517X01f66lE6zuKu3dwL/WaXZ
	1ObHaoxw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u9Grx-001WUH-36;
	Mon, 28 Apr 2025 13:17:31 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 28 Apr 2025 13:17:29 +0800
Date: Mon, 28 Apr 2025 13:17:29 +0800
Message-Id: <0596218f2caebca829a40a05c014a94e44ae1369.1745816372.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1745816372.git.herbert@gondor.apana.org.au>
References: <cover.1745816372.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v3 PATCH 12/13] crypto: sha256 - remove sha256_base.h
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld " <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_221733_087493_D83A85EA 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

sha256_base.h is no longer used, so remove it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 include/crypto/sha256_base.h | 151 -----------------------------------
 1 file changed, 151 deletions(-)
 delete mode 100644 include/crypto/sha256_base.h

diff --git a/include/crypto/sha256_base.h b/include/crypto/sha256_base.h
deleted file mode 100644
index 804361731a7a..000000000000
--- a/include/crypto/sha256_base.h
+++ /dev/null
@@ -1,151 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * sha256_base.h - core logic for SHA-256 implementations
- *
- * Copyright (C) 2015 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#ifndef _CRYPTO_SHA256_BASE_H
-#define _CRYPTO_SHA256_BASE_H
-
-#include <crypto/internal/blockhash.h>
-#include <crypto/internal/hash.h>
-#include <crypto/internal/sha2.h>
-#include <linux/math.h>
-#include <linux/string.h>
-#include <linux/types.h>
-#include <linux/unaligned.h>
-
-typedef void (sha256_block_fn)(struct crypto_sha256_state *sst, u8 const *src,
-			       int blocks);
-
-static inline int sha224_base_init(struct shash_desc *desc)
-{
-	struct sha256_state *sctx = shash_desc_ctx(desc);
-
-	sha224_init(sctx);
-	return 0;
-}
-
-static inline int sha256_base_init(struct shash_desc *desc)
-{
-	struct sha256_state *sctx = shash_desc_ctx(desc);
-
-	sha256_init(sctx);
-	return 0;
-}
-
-static inline int lib_sha256_base_do_update(struct sha256_state *sctx,
-					    const u8 *data,
-					    unsigned int len,
-					    sha256_block_fn *block_fn)
-{
-	unsigned int partial = sctx->count % SHA256_BLOCK_SIZE;
-
-	sctx->count += len;
-	BLOCK_HASH_UPDATE_BLOCKS(block_fn, &sctx->ctx, data, len,
-				 SHA256_BLOCK_SIZE, sctx->buf, partial);
-	return 0;
-}
-
-static inline int lib_sha256_base_do_update_blocks(
-	struct crypto_sha256_state *sctx, const u8 *data, unsigned int len,
-	sha256_block_fn *block_fn)
-{
-	unsigned int remain = len - round_down(len, SHA256_BLOCK_SIZE);
-
-	sctx->count += len - remain;
-	block_fn(sctx, data, len / SHA256_BLOCK_SIZE);
-	return remain;
-}
-
-static inline int sha256_base_do_update_blocks(
-	struct shash_desc *desc, const u8 *data, unsigned int len,
-	sha256_block_fn *block_fn)
-{
-	return lib_sha256_base_do_update_blocks(shash_desc_ctx(desc), data,
-						len, block_fn);
-}
-
-static inline int lib_sha256_base_do_finup(struct crypto_sha256_state *sctx,
-					   const u8 *src, unsigned int len,
-					   sha256_block_fn *block_fn)
-{
-	unsigned int bit_offset = SHA256_BLOCK_SIZE / 8 - 1;
-	union {
-		__be64 b64[SHA256_BLOCK_SIZE / 4];
-		u8 u8[SHA256_BLOCK_SIZE * 2];
-	} block = {};
-
-	if (len >= bit_offset * 8)
-		bit_offset += SHA256_BLOCK_SIZE / 8;
-	memcpy(&block, src, len);
-	block.u8[len] = 0x80;
-	sctx->count += len;
-	block.b64[bit_offset] = cpu_to_be64(sctx->count << 3);
-	block_fn(sctx, block.u8, (bit_offset + 1) * 8 / SHA256_BLOCK_SIZE);
-	memzero_explicit(&block, sizeof(block));
-
-	return 0;
-}
-
-static inline int sha256_base_do_finup(struct shash_desc *desc,
-				       const u8 *src, unsigned int len,
-				       sha256_block_fn *block_fn)
-{
-	struct crypto_sha256_state *sctx = shash_desc_ctx(desc);
-
-	if (len >= SHA256_BLOCK_SIZE) {
-		int remain;
-
-		remain = lib_sha256_base_do_update_blocks(sctx, src, len,
-							  block_fn);
-		src += len - remain;
-		len = remain;
-	}
-	return lib_sha256_base_do_finup(sctx, src, len, block_fn);
-}
-
-static inline int lib_sha256_base_do_finalize(struct sha256_state *sctx,
-					      sha256_block_fn *block_fn)
-{
-	unsigned int partial = sctx->count % SHA256_BLOCK_SIZE;
-	struct crypto_sha256_state *state = (void *)sctx;
-
-	sctx->count -= partial;
-	return lib_sha256_base_do_finup(state, sctx->buf, partial, block_fn);
-}
-
-static inline int __sha256_base_finish(u32 state[SHA256_DIGEST_SIZE / 4],
-				       u8 *out, unsigned int digest_size)
-{
-	__be32 *digest = (__be32 *)out;
-	int i;
-
-	for (i = 0; digest_size > 0; i++, digest_size -= sizeof(__be32))
-		put_unaligned_be32(state[i], digest++);
-	return 0;
-}
-
-static inline void lib_sha256_base_finish(struct sha256_state *sctx, u8 *out,
-					  unsigned int digest_size)
-{
-	__sha256_base_finish(sctx->state, out, digest_size);
-	memzero_explicit(sctx, sizeof(*sctx));
-}
-
-static inline int sha256_base_finish(struct shash_desc *desc, u8 *out)
-{
-	unsigned int digest_size = crypto_shash_digestsize(desc->tfm);
-	struct crypto_sha256_state *sctx = shash_desc_ctx(desc);
-
-	return __sha256_base_finish(sctx->state, out, digest_size);
-}
-
-static inline void sha256_transform_blocks(struct crypto_sha256_state *sst,
-					   const u8 *input, int blocks)
-{
-	sha256_blocks_generic(sst->state, input, blocks);
-}
-
-#endif /* _CRYPTO_SHA256_BASE_H */
-- 
2.39.5


