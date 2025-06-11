Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BC3C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 03:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClRqmZ9X6+Ifb38OvA0WPWP1qVtOoa/p+i2/eF0TAJM=; b=qifIxtl8lYOpwT6W4nXQASu5dy
	5KoWSAR9jzeywDpi/EISFCNw7HsJJUPM8MwYcQ7P9yZJhQ81mKX7TvBMFsJf7qWkLsF+gcDZPXJn2
	QhPSZiwhZZhvaK11crmGZdGYlqlDpeO3kz54PK6OAAa2k0HF6XRpDWF7+MEr8WG+4JKILwreI+ted
	3dMjC8Sfiqsp4mrSt2ZX844GlfP4zr8qMgxkd0xkPmCfpDvBMbTuSQZgSAbiK7F+DxEQgMQeqWKIl
	yi0jBQJCgicH9zZo5M4DEYwXA17eaXO3FFbAbvp35ia03MECqjyloipzB3utxsFSDrxw4b+NvNRPM
	/v28cuig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCXM-00000008mVz-2Qjc;
	Wed, 11 Jun 2025 03:54:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAxd-00000008cUP-1Xnl;
	Wed, 11 Jun 2025 02:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ClRqmZ9X6+Ifb38OvA0WPWP1qVtOoa/p+i2/eF0TAJM=; b=NjFfNXn/kLSRPY38uiBhL0ZsCC
	Q6ojOD07Q/47DlNS/UFBKj9Kw8VN1zDZf0IVjqLNxr1ZuZ+iZPgSamFPqQjZnoLm1T8ZGv461f2XS
	jbUxbmUWmlM9Kb95yjQH6261Y9bTH57XA+nbHk4z9V+Ey256caL3bDelPFDg0Kk45NXAZsJ/umMCP
	rIUoHKXCrmTrq9uh5HpdI1iXQnJYlQnRWWg6GeiyW6ST3Iy0qXH+xH3fz6s6HQktnxIMeNjmFgXLB
	oLZewbvwSY/pXE6DCmPPdwRh4nBNuzSQJnbhiGhFT7CT/1ChiS/BWIgPmWmfBJRtpmjqootPK46e/
	JzHy+fLw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAxa-000000024Ri-4114;
	Wed, 11 Jun 2025 02:13:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE11949F9D;
	Wed, 11 Jun 2025 02:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757C9C4CEF4;
	Wed, 11 Jun 2025 02:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749607979;
	bh=CfGkdjItRjUxPxMuzjk2hmHTtGTMsfQDaBtxQ0B43iQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SRBS7SW8VmFEJ0509uOL86wnk9Tx1wrf6gYUew2s1ujJ6OdYPHuwrCvUEfCLoSjX8
	 WwoHxf1HurvQAjWwoKYOETmw6DM1g7C5xr39n/gjn4Gbmegy1hA7S+jSz40kW9Kx2v
	 WC0PvLKZGpvQgqRruPy3sGcGnwNvIi4pPSUeFv6Va1/udN6ifk+e5oNF51Z7KHPcem
	 6xI1n/YfA6eHNzWoUsO3+3i9jU1vkIfCsx54Rge0mBlQKq/XD01CtZPgdTOnS2o69P
	 G0LG9Cu+ajcQADMD1qLeKwR+WfjVK3TAj47rvQqhv/QHxu0zE/AObXnmC2iEWjW+4s
	 R/fA3gadiYkqg==
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
Subject: [PATCH 16/16] crypto: sha512 - remove sha512_base.h
Date: Tue, 10 Jun 2025 19:09:23 -0700
Message-ID: <20250611020923.1482701-17-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611020923.1482701-1-ebiggers@kernel.org>
References: <20250611020923.1482701-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_031303_614849_0803E16B 
X-CRM114-Status: GOOD (  10.34  )
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

sha512_base.h is no longer used, so remove it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
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
2.49.0


