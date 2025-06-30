Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A45AC8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 17:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JuD8EXOEUP3HCT5ccEov4su1ji9LylvPKiZOxnaN+hU=; b=3GBPGL31RimjrH96Cr4djwrwjT
	DAk++xDngfowI7fn61YTkT2Qv49ZnaqrbCRSwsfrKJIJM7slGFQDmlTSiXQxEi7564jbtvtKcxv0S
	q8SE2hYFiHrPmLigrTZ57oT7Itqhxx6VGpDYlCFwM4hWTZ/7wFkOEywcQkfUKCc55dveCHnJOzlla
	ThI+F6LiKFQHTjOIOGL8pgvzpU66R8wuCSwOWfSLdkCUZq+b9iPnzHamfrxMabtRbOcQSb+8L3zOA
	ksKyVG0Nh4GGkzgvDdoPtx+L4uOMXhvXdJCRPHzHsXKyHYH0Obfap2cnClQH7i+qB1oFWCCtLEOUG
	jJpcPDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHzG-000000032LP-1fTn;
	Mon, 30 Jun 2025 17:08:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWH0c-00000002opL-0PPu;
	Mon, 30 Jun 2025 16:05:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87B0B613AE;
	Mon, 30 Jun 2025 16:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA2BC4CEF2;
	Mon, 30 Jun 2025 16:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299529;
	bh=Re8d5TuPUDJdqxyH89C7qlYblbZnrA5EjF86KsH1XwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=No3QeIRmm7nlNERtKsn+ZyD7ApGiWkaIJk7FG/8b02RBvVt8BnEm4mMr1kGFRguX7
	 bZse8gOMDl2RguH9Al5RMXRfo4nMMB50ohKZVkdfhLnFRIrOxW9gvzUC+n00XH0+iY
	 9TH1JM6PrKklHfOntc9odhZozTrfFL7mhOzBliq2FCV5TlP968eIkkL1Ao0AXuC2Xd
	 aiiB+i1f+mH0ulGtZTu7oHtA749yaAWdo2f/7TRILzujisMvwU7MP9ogNQ3M17vTMJ
	 4Qx9NLxIq4BVav5bn31e4LZnHmRGclQY/IXM+CjEJBahQ5XnqBxt8dyb/U4BzbSsRz
	 tM1D5LSdhxLZg==
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
Subject: [PATCH v3 16/16] crypto: sha512 - Remove sha512_base.h
Date: Mon, 30 Jun 2025 09:03:20 -0700
Message-ID: <20250630160320.2888-17-ebiggers@kernel.org>
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

sha512_base.h is no longer used, so remove it.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha512_base.h | 117 -----------------------------------
 1 file changed, 117 deletions(-)
 delete mode 100644 include/crypto/sha512_base.h

diff --git a/include/crypto/sha512_base.h b/include/crypto/sha512_base.h
deleted file mode 100644
index d1361b3eb70b0..0000000000000
--- a/include/crypto/sha512_base.h
+++ /dev/null
@@ -1,117 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * sha512_base.h - core logic for SHA-512 implementations
- *
- * Copyright (C) 2015 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#ifndef _CRYPTO_SHA512_BASE_H
-#define _CRYPTO_SHA512_BASE_H
-
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <linux/compiler.h>
-#include <linux/math.h>
-#include <linux/string.h>
-#include <linux/types.h>
-#include <linux/unaligned.h>
-
-typedef void (sha512_block_fn)(struct sha512_state *sst, u8 const *src,
-			       int blocks);
-
-static inline int sha384_base_init(struct shash_desc *desc)
-{
-	struct sha512_state *sctx = shash_desc_ctx(desc);
-
-	sctx->state[0] = SHA384_H0;
-	sctx->state[1] = SHA384_H1;
-	sctx->state[2] = SHA384_H2;
-	sctx->state[3] = SHA384_H3;
-	sctx->state[4] = SHA384_H4;
-	sctx->state[5] = SHA384_H5;
-	sctx->state[6] = SHA384_H6;
-	sctx->state[7] = SHA384_H7;
-	sctx->count[0] = sctx->count[1] = 0;
-
-	return 0;
-}
-
-static inline int sha512_base_init(struct shash_desc *desc)
-{
-	struct sha512_state *sctx = shash_desc_ctx(desc);
-
-	sctx->state[0] = SHA512_H0;
-	sctx->state[1] = SHA512_H1;
-	sctx->state[2] = SHA512_H2;
-	sctx->state[3] = SHA512_H3;
-	sctx->state[4] = SHA512_H4;
-	sctx->state[5] = SHA512_H5;
-	sctx->state[6] = SHA512_H6;
-	sctx->state[7] = SHA512_H7;
-	sctx->count[0] = sctx->count[1] = 0;
-
-	return 0;
-}
-
-static inline int sha512_base_do_update_blocks(struct shash_desc *desc,
-					       const u8 *data,
-					       unsigned int len,
-					       sha512_block_fn *block_fn)
-{
-	unsigned int remain = len - round_down(len, SHA512_BLOCK_SIZE);
-	struct sha512_state *sctx = shash_desc_ctx(desc);
-
-	len -= remain;
-	sctx->count[0] += len;
-	if (sctx->count[0] < len)
-		sctx->count[1]++;
-	block_fn(sctx, data, len / SHA512_BLOCK_SIZE);
-	return remain;
-}
-
-static inline int sha512_base_do_finup(struct shash_desc *desc, const u8 *src,
-				       unsigned int len,
-				       sha512_block_fn *block_fn)
-{
-	unsigned int bit_offset = SHA512_BLOCK_SIZE / 8 - 2;
-	struct sha512_state *sctx = shash_desc_ctx(desc);
-	union {
-		__be64 b64[SHA512_BLOCK_SIZE / 4];
-		u8 u8[SHA512_BLOCK_SIZE * 2];
-	} block = {};
-
-	if (len >= SHA512_BLOCK_SIZE) {
-		int remain;
-
-		remain = sha512_base_do_update_blocks(desc, src, len, block_fn);
-		src += len - remain;
-		len = remain;
-	}
-
-	if (len >= bit_offset * 8)
-		bit_offset += SHA512_BLOCK_SIZE / 8;
-	memcpy(&block, src, len);
-	block.u8[len] = 0x80;
-	sctx->count[0] += len;
-	block.b64[bit_offset] = cpu_to_be64(sctx->count[1] << 3 |
-					    sctx->count[0] >> 61);
-	block.b64[bit_offset + 1] = cpu_to_be64(sctx->count[0] << 3);
-	block_fn(sctx, block.u8, (bit_offset + 2) * 8 / SHA512_BLOCK_SIZE);
-	memzero_explicit(&block, sizeof(block));
-
-	return 0;
-}
-
-static inline int sha512_base_finish(struct shash_desc *desc, u8 *out)
-{
-	unsigned int digest_size = crypto_shash_digestsize(desc->tfm);
-	struct sha512_state *sctx = shash_desc_ctx(desc);
-	__be64 *digest = (__be64 *)out;
-	int i;
-
-	for (i = 0; digest_size > 0; i++, digest_size -= sizeof(__be64))
-		put_unaligned_be64(sctx->state[i], digest++);
-	return 0;
-}
-
-#endif /* _CRYPTO_SHA512_BASE_H */
-- 
2.50.0


