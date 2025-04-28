Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554A8C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 17:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wn9BjgkE2+3mBCEiin0rtZNfMaiiTypr9lnO+2M+sxw=; b=xLNqaRWTdy5srykgGMJIfchJ5E
	vzotb2VXZL2KH7R1mcTwbX9CnvXSVVTLb5jOOjDCp4KpQV+q0dJ5YGzMNQgHqMEwC3vn+SyZUi+G3
	WX+Fwjqz71Jc4mBqTqtxe7cWtzag/9as+HB9kHa3h+JMTW9fM5STjMqten4mvp0EITzaPix+5rclx
	OlwJ6r2gthDFlozi1CKeYS3l+jakJvbOaN73hUiKPvLLvSertiP0wWylF349wqkn3FDKXFlEN4ak0
	4aPSbklffzXdI6LvKLnWf5v/K1NcXCf5jZ7bb7RVVc2V5zTYkzX8xUBEPCMtT6PBZr0uu5WMGee2z
	r261gFxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9S7L-000000074Fj-1erE;
	Mon, 28 Apr 2025 17:18:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rrp-000000070uu-3izK;
	Mon, 28 Apr 2025 17:02:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B45F44AAB0;
	Mon, 28 Apr 2025 17:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51142C4CEE4;
	Mon, 28 Apr 2025 17:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745859725;
	bh=nXzVAsBZCcgzdRMgpyZqkLVLDfQ1jazwy8tBAdc6LUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fhWU0v5rvclI0LyXWoFJWCc8BBqZDSK9XM7bRtugjwHxkC9RmCMCl2vCKuOh436Ey
	 Ig/QtscHPvoggKplKY8rsRsfkwt0OwdOq34ZqZDAbiEv8E5P01FA/mfMJ72ATs6yi5
	 xtI4vlMR9BO7Dk/EK/p0TqckPPgaRp0M4L70oTI7kuhAq08xKo8Ct0naj+YkYryNq7
	 blhBW4oQl/I7gEJaoQUPcdRlQut7zku3n/Ndeo5F4OSGVa3pMFbqtC6wAXO56chZBJ
	 HuVy4LX5Sijc6DMVip1M6D8+vuscZaaisIZodo+tI3jQpBF1IChO5AMAywdJvSVo6A
	 y5G4kI3kbrXAg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v4 12/13] crypto: sha256 - remove sha256_base.h
Date: Mon, 28 Apr 2025 10:00:37 -0700
Message-ID: <20250428170040.423825-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428170040.423825-1-ebiggers@kernel.org>
References: <20250428170040.423825-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_100205_973401_9A18CB5F 
X-CRM114-Status: GOOD (  10.49  )
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
---
 include/crypto/sha256_base.h | 183 -----------------------------------
 1 file changed, 183 deletions(-)
 delete mode 100644 include/crypto/sha256_base.h

diff --git a/include/crypto/sha256_base.h b/include/crypto/sha256_base.h
deleted file mode 100644
index 6878fb9c26c04..0000000000000
--- a/include/crypto/sha256_base.h
+++ /dev/null
@@ -1,183 +0,0 @@
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
-	struct crypto_sha256_state *state = (void *)sctx;
-
-	sctx->count += len;
-
-	if (unlikely((partial + len) >= SHA256_BLOCK_SIZE)) {
-		int blocks;
-
-		if (partial) {
-			int p = SHA256_BLOCK_SIZE - partial;
-
-			memcpy(sctx->buf + partial, data, p);
-			data += p;
-			len -= p;
-
-			block_fn(state, sctx->buf, 1);
-		}
-
-		blocks = len / SHA256_BLOCK_SIZE;
-		len %= SHA256_BLOCK_SIZE;
-
-		if (blocks) {
-			block_fn(state, data, blocks);
-			data += blocks * SHA256_BLOCK_SIZE;
-		}
-		partial = 0;
-	}
-	if (len)
-		memcpy(sctx->buf + partial, data, len);
-
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
-static inline int sha256_base_do_finalize(struct shash_desc *desc,
-					  sha256_block_fn *block_fn)
-{
-	struct sha256_state *sctx = shash_desc_ctx(desc);
-
-	return lib_sha256_base_do_finalize(sctx, block_fn);
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
2.49.0


