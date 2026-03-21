Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3255108B8FF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 04:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUhnZJL42KuDW9pEM8uyMhxSg2jF72Cc4sDO7GmrYrc=; b=0rquga2agrmRkB4eXu+l5sznVK
	oXHjggxZqGsbNuvsqRQZiPF5Irg7xBGjHkUtgaJJLP0IRN8l1KfKKna4SDUHX3PxiidCjkOCzlziu
	F5GPNMZVNoEZ2uS2OCRZ0MRbChasFgHazm3LEec6MieziErA+AA9z6XNPTC4LwXl5b4/+6r9wudiB
	KvnJ5unv2EY9xtufmbwWGwlNfcng3sLDJulY9pFd4onC902tmrfb8uzpMjZ6G9WfhMlygd8pnT8hf
	K1x6rfI/YPWz3wGi2whxqyEEclcNM3Pyjwrkj1YdJ9XAcXksPcU9vam7VrbLzMX9OjlkT3XewwX/d
	0XowrXaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3nhw-0000000E0Kv-13Mg;
	Sat, 21 Mar 2026 04:13:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ngx-0000000DzRO-2o62;
	Sat, 21 Mar 2026 04:12:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A1B44470E;
	Sat, 21 Mar 2026 04:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279C0C2BCB6;
	Sat, 21 Mar 2026 04:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774066322;
	bh=YTCXNwCW0pq6MdfWR7uCz9B7vdUNcCWmKts2sjqXBG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mxIeQ4nXmXOm+FC9A25/2GNvGqGXr3MsknSYssoxvx/2YrDB6qkriCl6SG6OujLq1
	 wENn7p9NRFovoYtvcgvm0ObpcE1HckNEU5ixH5vIlSDwhWKf33m6fwxPcpyfj3lYgh
	 K2E/PAlFCOBXsVlpuCC/4cBb46R8fKyYzyNDWif1QybebUP3dQCPNTG32TZmye1Yhr
	 ykI1r/IJSZ32SsnhjxG4d95cZNc/hXaUEAJwZI6pWJvlpEEjETv69Jujd7IUFM5oil
	 6BKgaTy+APxjb4I5mjDHeIBdc2tokUsSxfdqQODJ51V0pwACykij9VDeoibrhX/LLB
	 oUw6/Dtz8p0qA==
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
Subject: [PATCH 10/12] crypto: sm3 - Remove sm3_base.h
Date: Fri, 20 Mar 2026 21:09:33 -0700
Message-ID: <20260321040935.410034-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321040935.410034-1-ebiggers@kernel.org>
References: <20260321040935.410034-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_211204_864351_661F1E20 
X-CRM114-Status: UNSURE (   9.61  )
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

Remove include/crypto/sm3_base.h, since it's no longer used.  The
corresponding logic was reimplemented in a central place in lib/crypto/.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sm3_base.h | 92 ---------------------------------------
 1 file changed, 92 deletions(-)
 delete mode 100644 include/crypto/sm3_base.h

diff --git a/include/crypto/sm3_base.h b/include/crypto/sm3_base.h
deleted file mode 100644
index 9fa995617495..000000000000
--- a/include/crypto/sm3_base.h
+++ /dev/null
@@ -1,92 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * sm3_base.h - core logic for SM3 implementations
- *
- * Copyright (C) 2017 ARM Limited or its affiliates.
- * Written by Gilad Ben-Yossef <gilad@benyossef.com>
- */
-
-#ifndef _CRYPTO_SM3_BASE_H
-#define _CRYPTO_SM3_BASE_H
-
-#include <crypto/internal/hash.h>
-#include <crypto/sm3.h>
-#include <linux/math.h>
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/types.h>
-#include <linux/unaligned.h>
-
-typedef void (sm3_block_fn)(struct sm3_state *sst, u8 const *src, int blocks);
-
-static inline int sm3_base_init(struct shash_desc *desc)
-{
-	struct sm3_state *sctx = shash_desc_ctx(desc);
-
-	sctx->state[0] = SM3_IVA;
-	sctx->state[1] = SM3_IVB;
-	sctx->state[2] = SM3_IVC;
-	sctx->state[3] = SM3_IVD;
-	sctx->state[4] = SM3_IVE;
-	sctx->state[5] = SM3_IVF;
-	sctx->state[6] = SM3_IVG;
-	sctx->state[7] = SM3_IVH;
-	sctx->count = 0;
-	return 0;
-}
-
-static inline int sm3_base_do_update_blocks(struct shash_desc *desc,
-					    const u8 *data, unsigned int len,
-					    sm3_block_fn *block_fn)
-{
-	unsigned int remain = len - round_down(len, SM3_BLOCK_SIZE);
-	struct sm3_state *sctx = shash_desc_ctx(desc);
-
-	sctx->count += len - remain;
-	block_fn(sctx, data, len / SM3_BLOCK_SIZE);
-	return remain;
-}
-
-static inline int sm3_base_do_finup(struct shash_desc *desc,
-				    const u8 *src, unsigned int len,
-				    sm3_block_fn *block_fn)
-{
-	unsigned int bit_offset = SM3_BLOCK_SIZE / 8 - 1;
-	struct sm3_state *sctx = shash_desc_ctx(desc);
-	union {
-		__be64 b64[SM3_BLOCK_SIZE / 4];
-		u8 u8[SM3_BLOCK_SIZE * 2];
-	} block = {};
-
-	if (len >= SM3_BLOCK_SIZE) {
-		int remain;
-
-		remain = sm3_base_do_update_blocks(desc, src, len, block_fn);
-		src += len - remain;
-		len = remain;
-	}
-
-	if (len >= bit_offset * 8)
-		bit_offset += SM3_BLOCK_SIZE / 8;
-	memcpy(&block, src, len);
-	block.u8[len] = 0x80;
-	sctx->count += len;
-	block.b64[bit_offset] = cpu_to_be64(sctx->count << 3);
-	block_fn(sctx, block.u8, (bit_offset + 1) * 8 / SM3_BLOCK_SIZE);
-	memzero_explicit(&block, sizeof(block));
-
-	return 0;
-}
-
-static inline int sm3_base_finish(struct shash_desc *desc, u8 *out)
-{
-	struct sm3_state *sctx = shash_desc_ctx(desc);
-	__be32 *digest = (__be32 *)out;
-	int i;
-
-	for (i = 0; i < SM3_DIGEST_SIZE / sizeof(__be32); i++)
-		put_unaligned_be32(sctx->state[i], digest++);
-	return 0;
-}
-
-#endif /* _CRYPTO_SM3_BASE_H */
-- 
2.53.0


