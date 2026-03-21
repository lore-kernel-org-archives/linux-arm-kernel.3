Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32381093170
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 04:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKAtjs9sZQlxYV97FqTcfHTxW+3FnsFdAl2AU7bwQBc=; b=PFj/M6f43GxyxBcdY0b0RteNRp
	MbNTWkjJnrFwOjFpCAzrUCbGigcm1p6CSWmWU0/HtAk+jsq4w7VnizpqKRqJDPrVZW/enRkgLZsgc
	rdxbEkoqBSjmOMCP5hTeTnbkW5SM91ND6cg8cye7/AiQZrkhI2RO54k6Gbjk+WqvmlDuy3zxDYfr6
	pbrcPtuFeFUH2izo3hbZoKE6k+cF2+o9ewtAR10xlvIZyMLYp4Oqsv1BUreMusIU6dfUt82gBeNHc
	i5Mo47LlK6fCEpQkmhRlJxfT2B9qg33z8AbMfUfQMpgvLbXdj796qP4XJa7G5aC6W7eoBARRb7a28
	d3vvpbZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ni0-0000000E0Pk-124Z;
	Sat, 21 Mar 2026 04:13:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ngx-0000000DzRN-2jyu;
	Sat, 21 Mar 2026 04:12:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0239F446A8;
	Sat, 21 Mar 2026 04:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9262BC19421;
	Sat, 21 Mar 2026 04:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774066322;
	bh=aPexQl25sVpfd7KJG7INV55g5JGQD/xd4wrqdkbZ9eU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IODjViXxp/PXolRvvTJOaPuZ4v3pS6wk/V5GOneRwdFYZJttusDpllhUTpsS12qkn
	 ds01YusVFrDi7lLx5E1+gYG8y2OJ2BlHy0HQPt/1LeFJhVZYB8yUNpz18Ly5Noe0Sw
	 HASZd5+U4IC55Na4SL3ZzTrGD5B+6BKJU8qzkFsIv/n5K0LE6qaa28kX+K2R8kcDeV
	 10jjL4DtuvyjyJgfWI6JKFv08EhdZ+DWYnESx+rkykN9rI4uvmYcS4GpuBeWOhpjnE
	 jGyL1pEy2WS+QBhWeR7ue0vxVxpMpHekJ/2UgJ47yUUjyX7v6vHuGb9wn3BReMxRWt
	 /gLljYo/oHc6g==
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
Subject: [PATCH 11/12] crypto: sm3 - Remove the original "sm3_block_generic()"
Date: Fri, 20 Mar 2026 21:09:34 -0700
Message-ID: <20260321040935.410034-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321040935.410034-1-ebiggers@kernel.org>
References: <20260321040935.410034-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_211204_869899_A204C98D 
X-CRM114-Status: GOOD (  10.19  )
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

Since the architecture-optimized SM3 code was migrated into lib/crypto/,
sm3_block_generic() is no longer called.  Remove it.  Then, since this
frees up the name, rename sm3_transform() to sm3_block_generic()
(matching the naming convention used in other hash algorithms).

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sm3.h |  2 --
 lib/crypto/sm3.c     | 19 +++----------------
 2 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/include/crypto/sm3.h b/include/crypto/sm3.h
index 702c5326b4be..34d7eb32b7db 100644
--- a/include/crypto/sm3.h
+++ b/include/crypto/sm3.h
@@ -29,12 +29,10 @@ struct sm3_state {
 	u32 state[SM3_DIGEST_SIZE / 4];
 	u64 count;
 	u8 buffer[SM3_BLOCK_SIZE];
 };
 
-void sm3_block_generic(struct sm3_state *sctx, u8 const *data, int blocks);
-
 /* State for the SM3 compression function */
 struct sm3_block_state {
 	u32 h[SM3_DIGEST_SIZE / 4];
 };
 
diff --git a/lib/crypto/sm3.c b/lib/crypto/sm3.c
index 20500cf4b8c0..b02b8a247adf 100644
--- a/lib/crypto/sm3.c
+++ b/lib/crypto/sm3.c
@@ -77,12 +77,12 @@ static const u32 ____cacheline_aligned K[64] = {
 			^ W[(i-9) & 0x0f]		\
 			^ rol32(W[(i-3) & 0x0f], 15))	\
 		^ rol32(W[(i-13) & 0x0f], 7)		\
 		^ W[(i-6) & 0x0f])
 
-static void sm3_transform(struct sm3_block_state *state,
-			  const u8 data[SM3_BLOCK_SIZE], u32 W[16])
+static void sm3_block_generic(struct sm3_block_state *state,
+			      const u8 data[SM3_BLOCK_SIZE], u32 W[16])
 {
 	u32 a, b, c, d, e, f, g, h, ss1, ss2;
 
 	a = state->h[0];
 	b = state->h[1];
@@ -175,30 +175,17 @@ static void sm3_transform(struct sm3_block_state *state,
 #undef R2
 #undef I
 #undef W1
 #undef W2
 
-void sm3_block_generic(struct sm3_state *sctx, u8 const *data, int blocks)
-{
-	u32 W[16];
-
-	do {
-		sm3_transform((struct sm3_block_state *)sctx->state, data, W);
-		data += SM3_BLOCK_SIZE;
-	} while (--blocks);
-
-	memzero_explicit(W, sizeof(W));
-}
-EXPORT_SYMBOL_GPL(sm3_block_generic);
-
 static void __maybe_unused sm3_blocks_generic(struct sm3_block_state *state,
 					      const u8 *data, size_t nblocks)
 {
 	u32 W[16];
 
 	do {
-		sm3_transform(state, data, W);
+		sm3_block_generic(state, data, W);
 		data += SM3_BLOCK_SIZE;
 	} while (--nblocks);
 
 	memzero_explicit(W, sizeof(W));
 }
-- 
2.53.0


