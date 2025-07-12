Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1688BC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 00:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DuvWhVNJl2FITNbjiKCdwfd8JX7D8enMTFVlgePxCs=; b=suqUt7rBLrYGIreUxseKICxyeR
	jOuJ8+jH2Gy56GMVgB1VFaDE1p/NaXLvmUtcFN1cSQyW1Ozv5JTpP9cZ0L7wLdqGmwHTNOV0IpTzd
	ffoc3ew4G4+clKXl9M+8xs9M0ohcnbgGSq+xa5QrRj4rS+TCqMOWp2IjBc17F9Yh5wgeS98KnNUJw
	xCwaQijCmyM8mmZULls/7PP9XFqzcEd37ecLrgbbc+DbxCn/iTi516ux+80n84cwbSJoiEVpTN1bb
	kvM/QIzrFHNAa82w57Okz3v1HjacWnR4Hi/J8lr2vBpA3NXBa2MKV9Ulr8R0IEnHDKck0qha82tbm
	aQz88UpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uakGB-0000000HBbR-21oP;
	Sun, 13 Jul 2025 00:08:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajbv-0000000H7ba-2ANL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 23:26:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12A3D5C558D;
	Sat, 12 Jul 2025 23:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89025C4CEF7;
	Sat, 12 Jul 2025 23:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362786;
	bh=GJ7nKp2NVjns7Vn/yd3vh/j/wSpE2hgTFf8rr99laVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rz40jc33/xphGqSYpQPco+3iJDZjL56YDYjR8lxUDvHZC9qTvA05p/dSIALTZNGLa
	 yXvMs5aBqkFHImLl8aUETc28cZI9qr1/dmBFyRLyOgDtANWvrLelg0XRsRp+H1fo49
	 2DXRpbcKWE/DMscKaQTB1MFDsjuADixByyVL5OJsS9GQAlJAw6f+QBrnQF+UwZ7wEq
	 b+hYHp4Q85Y8NjEOgve5GU4izy0luLiGraER+1MUi9nok4+Y53XmfRQ4/acQ0DDxuF
	 YuAIzEJHyD9PML6iIifGmew7AXaHbdsozX5EIyYP5MW3xQ6bkeFEF23ba0B568EVUx
	 Tvva3Jqe3BFgg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 14/26] crypto: sha1 - Remove sha1_base.h
Date: Sat, 12 Jul 2025 16:23:05 -0700
Message-ID: <20250712232329.818226-15-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_162627_669221_CB274E10 
X-CRM114-Status: UNSURE (   9.49  )
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

sha1_base.h is no longer used, so remove it.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha1_base.h | 82 --------------------------------------
 1 file changed, 82 deletions(-)
 delete mode 100644 include/crypto/sha1_base.h

diff --git a/include/crypto/sha1_base.h b/include/crypto/sha1_base.h
deleted file mode 100644
index 62701d136c793..0000000000000
--- a/include/crypto/sha1_base.h
+++ /dev/null
@@ -1,82 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * sha1_base.h - core logic for SHA-1 implementations
- *
- * Copyright (C) 2015 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#ifndef _CRYPTO_SHA1_BASE_H
-#define _CRYPTO_SHA1_BASE_H
-
-#include <crypto/internal/hash.h>
-#include <crypto/sha1.h>
-#include <linux/math.h>
-#include <linux/string.h>
-#include <linux/types.h>
-#include <linux/unaligned.h>
-
-typedef void (sha1_block_fn)(struct sha1_state *sst, u8 const *src, int blocks);
-
-static inline int sha1_base_init(struct shash_desc *desc)
-{
-	struct sha1_state *sctx = shash_desc_ctx(desc);
-
-	sctx->state[0] = SHA1_H0;
-	sctx->state[1] = SHA1_H1;
-	sctx->state[2] = SHA1_H2;
-	sctx->state[3] = SHA1_H3;
-	sctx->state[4] = SHA1_H4;
-	sctx->count = 0;
-
-	return 0;
-}
-
-static inline int sha1_base_do_update_blocks(struct shash_desc *desc,
-					     const u8 *data,
-					     unsigned int len,
-					     sha1_block_fn *block_fn)
-{
-	unsigned int remain = len - round_down(len, SHA1_BLOCK_SIZE);
-	struct sha1_state *sctx = shash_desc_ctx(desc);
-
-	sctx->count += len - remain;
-	block_fn(sctx, data, len / SHA1_BLOCK_SIZE);
-	return remain;
-}
-
-static inline int sha1_base_do_finup(struct shash_desc *desc,
-				     const u8 *src, unsigned int len,
-				     sha1_block_fn *block_fn)
-{
-	unsigned int bit_offset = SHA1_BLOCK_SIZE / 8 - 1;
-	struct sha1_state *sctx = shash_desc_ctx(desc);
-	union {
-		__be64 b64[SHA1_BLOCK_SIZE / 4];
-		u8 u8[SHA1_BLOCK_SIZE * 2];
-	} block = {};
-
-	if (len >= bit_offset * 8)
-		bit_offset += SHA1_BLOCK_SIZE / 8;
-	memcpy(&block, src, len);
-	block.u8[len] = 0x80;
-	sctx->count += len;
-	block.b64[bit_offset] = cpu_to_be64(sctx->count << 3);
-	block_fn(sctx, block.u8, (bit_offset + 1) * 8 / SHA1_BLOCK_SIZE);
-	memzero_explicit(&block, sizeof(block));
-
-	return 0;
-}
-
-static inline int sha1_base_finish(struct shash_desc *desc, u8 *out)
-{
-	struct sha1_state *sctx = shash_desc_ctx(desc);
-	__be32 *digest = (__be32 *)out;
-	int i;
-
-	for (i = 0; i < SHA1_DIGEST_SIZE / sizeof(__be32); i++)
-		put_unaligned_be32(sctx->state[i], digest++);
-
-	return 0;
-}
-
-#endif /* _CRYPTO_SHA1_BASE_H */
-- 
2.50.1


