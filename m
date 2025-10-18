Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314E1CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 04:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuY2OJgXjadBxySDUALvJqc5L44NUalWYqMrmHcmokE=; b=3c1YYeXF45lz66AzHEaIvWNcKo
	LLT0eweryLDV7ivl3XX3qfoM2jzwpNfEAPaQHA2SM6GVN9Q1AIOcPcvpI0HsDutjt7LWhoGg/vbkC
	jyG5cA7D0nvthh8i47RflM7UrnMdu6gOC+NslJIk5AmGJSTPmHxkzZzyYwPEtUsvlJNLYpay25uvN
	yBblWybNoDg7WhT+47TdE9azYxCY+E8E/sN7M5E8NvVw6HQ6uxpYXoZ8A+esCxgAqBNKqtIPaTbko
	iJOfgTFc2OY8CT0LHtmBVQkhzdIiA8UDfHyDLCEvtWr64ai+xZPqmrZMe/CQGxSvaDCFxnOnfz5vv
	sKoC442A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9yg7-00000009VJ7-0CDw;
	Sat, 18 Oct 2025 04:36:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9yg3-00000009VFF-1wsY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 04:36:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 907E2605E2;
	Sat, 18 Oct 2025 04:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0772BC116D0;
	Sat, 18 Oct 2025 04:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760762182;
	bh=PzxSfFbOnc7a/0F7T89AfzwtcHq2YTXwzLumyKuku6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O9NWiENxuMMK2HRxvUlwpz4/PrKhTaGAA57aQzr4ojwJDUdQYEc4+CTJ6taIJ8GFi
	 mz5K0QeSmCzozap+oDyHAZm63HywlfqGLa2hmAytzy8D5lYHy6pa01A22lZE9+BwaI
	 nZtD4k5Kc5PGGKw04IGwcK6esKryolxt/0ZIa2PGEEk4v+uiax2Naa4U9CR51qzFV2
	 S8jF4oF+aPSJL6O3wPnCPjg+oLjCbsIkefEu6aH8fgnKnyoP873TGjfpat/XACkeJE
	 qyj53quvGsfxM3l5B0hSGA3vMgD2kmfkj7wesE3hxo4eRfufQw4uFY6/xdwxBuDDOP
	 9x6kjc3JPs0cQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 03/10] lib/crypto: blake2s: Drop excessive const & rename block => data
Date: Fri, 17 Oct 2025 21:30:59 -0700
Message-ID: <20251018043106.375964-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251018043106.375964-1-ebiggers@kernel.org>
References: <20251018043106.375964-1-ebiggers@kernel.org>
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

A couple more small cleanups to the BLAKE2s code before these things get
propagated into the BLAKE2b code:

- Drop 'const' from some non-pointer function parameters.  It was a bit
  excessive and not conventional.

- Rename 'block' argument of blake2s_compress*() to 'data'.  This is for
  consistency with the SHA-* code, and also to avoid the implication
  that it points to a singular "block".

No functional changes.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/blake2s.h      | 13 ++++++-------
 lib/crypto/arm/blake2s-core.S |  6 +++---
 lib/crypto/arm/blake2s.h      |  2 +-
 lib/crypto/blake2s.c          | 12 ++++++------
 lib/crypto/x86/blake2s.h      | 18 ++++++++----------
 5 files changed, 24 insertions(+), 27 deletions(-)

diff --git a/include/crypto/blake2s.h b/include/crypto/blake2s.h
index 4c8d532ee97b3..33893057eb414 100644
--- a/include/crypto/blake2s.h
+++ b/include/crypto/blake2s.h
@@ -65,31 +65,30 @@ static inline void __blake2s_init(struct blake2s_ctx *ctx, size_t outlen,
 		memset(&ctx->buf[keylen], 0, BLAKE2S_BLOCK_SIZE - keylen);
 		ctx->buflen = BLAKE2S_BLOCK_SIZE;
 	}
 }
 
-static inline void blake2s_init(struct blake2s_ctx *ctx, const size_t outlen)
+static inline void blake2s_init(struct blake2s_ctx *ctx, size_t outlen)
 {
 	__blake2s_init(ctx, outlen, NULL, 0);
 }
 
-static inline void blake2s_init_key(struct blake2s_ctx *ctx,
-				    const size_t outlen, const void *key,
-				    const size_t keylen)
+static inline void blake2s_init_key(struct blake2s_ctx *ctx, size_t outlen,
+				    const void *key, size_t keylen)
 {
 	WARN_ON(IS_ENABLED(DEBUG) && (!outlen || outlen > BLAKE2S_HASH_SIZE ||
 		!key || !keylen || keylen > BLAKE2S_KEY_SIZE));
 
 	__blake2s_init(ctx, outlen, key, keylen);
 }
 
 void blake2s_update(struct blake2s_ctx *ctx, const u8 *in, size_t inlen);
 void blake2s_final(struct blake2s_ctx *ctx, u8 *out);
 
-static inline void blake2s(const u8 *key, const size_t keylen,
-			   const u8 *in, const size_t inlen,
-			   u8 *out, const size_t outlen)
+static inline void blake2s(const u8 *key, size_t keylen,
+			   const u8 *in, size_t inlen,
+			   u8 *out, size_t outlen)
 {
 	struct blake2s_ctx ctx;
 
 	WARN_ON(IS_ENABLED(DEBUG) && ((!in && inlen > 0) || !out || !outlen ||
 		outlen > BLAKE2S_HASH_SIZE || keylen > BLAKE2S_KEY_SIZE ||
diff --git a/lib/crypto/arm/blake2s-core.S b/lib/crypto/arm/blake2s-core.S
index 78e758a7cb3e2..14eb7c18a8365 100644
--- a/lib/crypto/arm/blake2s-core.S
+++ b/lib/crypto/arm/blake2s-core.S
@@ -169,11 +169,11 @@
 	__strd		r10, r11, sp, 20
 .endm
 
 //
 // void blake2s_compress(struct blake2s_ctx *ctx,
-//			 const u8 *block, size_t nblocks, u32 inc);
+//			 const u8 *data, size_t nblocks, u32 inc);
 //
 // Only the first three fields of struct blake2s_ctx are used:
 //	u32 h[8];	(inout)
 //	u32 t[2];	(inout)
 //	u32 f[2];	(in)
@@ -182,11 +182,11 @@
 ENTRY(blake2s_compress)
 	push		{r0-r2,r4-r11,lr}	// keep this an even number
 
 .Lnext_block:
 	// r0 is 'ctx'
-	// r1 is 'block'
+	// r1 is 'data'
 	// r3 is 'inc'
 
 	// Load and increment the counter t[0..1].
 	__ldrd		r10, r11, r0, 32
 	adds		r10, r10, r3
@@ -273,11 +273,11 @@ ENTRY(blake2s_compress)
 	stm		r14, {r0-r3}		// store new h[4..7]
 
 	// Advance to the next block, if there is one.  Note that if there are
 	// multiple blocks, then 'inc' (the counter increment amount) must be
 	// 64.  So we can simply set it to 64 without re-loading it.
-	ldm		sp, {r0, r1, r2}	// load (ctx, block, nblocks)
+	ldm		sp, {r0, r1, r2}	// load (ctx, data, nblocks)
 	mov		r3, #64			// set 'inc'
 	subs		r2, r2, #1		// nblocks--
 	str		r2, [sp, #8]
 	bne		.Lnext_block		// nblocks != 0?
 
diff --git a/lib/crypto/arm/blake2s.h b/lib/crypto/arm/blake2s.h
index ce009cd98de90..42c04440c1913 100644
--- a/lib/crypto/arm/blake2s.h
+++ b/lib/crypto/arm/blake2s.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 
 /* defined in blake2s-core.S */
 void blake2s_compress(struct blake2s_ctx *ctx,
-		      const u8 *block, size_t nblocks, u32 inc);
+		      const u8 *data, size_t nblocks, u32 inc);
diff --git a/lib/crypto/blake2s.c b/lib/crypto/blake2s.c
index 1ad36cb29835f..6182c21ed943d 100644
--- a/lib/crypto/blake2s.c
+++ b/lib/crypto/blake2s.c
@@ -27,31 +27,30 @@ static const u8 blake2s_sigma[10][16] = {
 	{ 13, 11, 7, 14, 12, 1, 3, 9, 5, 0, 15, 4, 8, 6, 2, 10 },
 	{ 6, 15, 14, 9, 11, 3, 0, 8, 12, 2, 13, 7, 1, 4, 10, 5 },
 	{ 10, 2, 8, 4, 7, 6, 1, 5, 15, 11, 9, 14, 3, 12, 13, 0 },
 };
 
-static inline void blake2s_increment_counter(struct blake2s_ctx *ctx,
-					     const u32 inc)
+static inline void blake2s_increment_counter(struct blake2s_ctx *ctx, u32 inc)
 {
 	ctx->t[0] += inc;
 	ctx->t[1] += (ctx->t[0] < inc);
 }
 
 static void __maybe_unused
-blake2s_compress_generic(struct blake2s_ctx *ctx, const u8 *block,
-			 size_t nblocks, const u32 inc)
+blake2s_compress_generic(struct blake2s_ctx *ctx,
+			 const u8 *data, size_t nblocks, u32 inc)
 {
 	u32 m[16];
 	u32 v[16];
 	int i;
 
 	WARN_ON(IS_ENABLED(DEBUG) &&
 		(nblocks > 1 && inc != BLAKE2S_BLOCK_SIZE));
 
 	while (nblocks > 0) {
 		blake2s_increment_counter(ctx, inc);
-		memcpy(m, block, BLAKE2S_BLOCK_SIZE);
+		memcpy(m, data, BLAKE2S_BLOCK_SIZE);
 		le32_to_cpu_array(m, ARRAY_SIZE(m));
 		memcpy(v, ctx->h, 32);
 		v[ 8] = BLAKE2S_IV0;
 		v[ 9] = BLAKE2S_IV1;
 		v[10] = BLAKE2S_IV2;
@@ -97,11 +96,11 @@ blake2s_compress_generic(struct blake2s_ctx *ctx, const u8 *block,
 #undef ROUND
 
 		for (i = 0; i < 8; ++i)
 			ctx->h[i] ^= v[i] ^ v[i + 8];
 
-		block += BLAKE2S_BLOCK_SIZE;
+		data += BLAKE2S_BLOCK_SIZE;
 		--nblocks;
 	}
 }
 
 #ifdef CONFIG_CRYPTO_LIB_BLAKE2S_ARCH
@@ -128,10 +127,11 @@ void blake2s_update(struct blake2s_ctx *ctx, const u8 *in, size_t inlen)
 		in += fill;
 		inlen -= fill;
 	}
 	if (inlen > BLAKE2S_BLOCK_SIZE) {
 		const size_t nblocks = DIV_ROUND_UP(inlen, BLAKE2S_BLOCK_SIZE);
+
 		blake2s_compress(ctx, in, nblocks - 1, BLAKE2S_BLOCK_SIZE);
 		in += BLAKE2S_BLOCK_SIZE * (nblocks - 1);
 		inlen -= BLAKE2S_BLOCK_SIZE * (nblocks - 1);
 	}
 	memcpy(ctx->buf + ctx->buflen, in, inlen);
diff --git a/lib/crypto/x86/blake2s.h b/lib/crypto/x86/blake2s.h
index de360935b8204..f8eed6cb042e4 100644
--- a/lib/crypto/x86/blake2s.h
+++ b/lib/crypto/x86/blake2s.h
@@ -10,43 +10,41 @@
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
 #include <linux/sizes.h>
 
 asmlinkage void blake2s_compress_ssse3(struct blake2s_ctx *ctx,
-				       const u8 *block, const size_t nblocks,
-				       const u32 inc);
+				       const u8 *data, size_t nblocks, u32 inc);
 asmlinkage void blake2s_compress_avx512(struct blake2s_ctx *ctx,
-					const u8 *block, const size_t nblocks,
-					const u32 inc);
+					const u8 *data, size_t nblocks, u32 inc);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(blake2s_use_ssse3);
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(blake2s_use_avx512);
 
-static void blake2s_compress(struct blake2s_ctx *ctx, const u8 *block,
-			     size_t nblocks, const u32 inc)
+static void blake2s_compress(struct blake2s_ctx *ctx,
+			     const u8 *data, size_t nblocks, u32 inc)
 {
 	/* SIMD disables preemption, so relax after processing each page. */
 	BUILD_BUG_ON(SZ_4K / BLAKE2S_BLOCK_SIZE < 8);
 
 	if (!static_branch_likely(&blake2s_use_ssse3) || !may_use_simd()) {
-		blake2s_compress_generic(ctx, block, nblocks, inc);
+		blake2s_compress_generic(ctx, data, nblocks, inc);
 		return;
 	}
 
 	do {
 		const size_t blocks = min_t(size_t, nblocks,
 					    SZ_4K / BLAKE2S_BLOCK_SIZE);
 
 		kernel_fpu_begin();
 		if (static_branch_likely(&blake2s_use_avx512))
-			blake2s_compress_avx512(ctx, block, blocks, inc);
+			blake2s_compress_avx512(ctx, data, blocks, inc);
 		else
-			blake2s_compress_ssse3(ctx, block, blocks, inc);
+			blake2s_compress_ssse3(ctx, data, blocks, inc);
 		kernel_fpu_end();
 
+		data += blocks * BLAKE2S_BLOCK_SIZE;
 		nblocks -= blocks;
-		block += blocks * BLAKE2S_BLOCK_SIZE;
 	} while (nblocks);
 }
 
 #define blake2s_mod_init_arch blake2s_mod_init_arch
 static void blake2s_mod_init_arch(void)
-- 
2.51.1.dirty


