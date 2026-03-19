Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D020B1075261
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 06:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbY0lD9y6Ny/NRRdO5SCDID/z3y4KwAoHSYoVy1slKo=; b=acb2pCWe21Tm24bzhayjX5prTz
	5MiobFFSMSABlbBW2HJBqCHu+LRLR9lC5ILuJARhiU+wkDj4EpSN212dsLOSI03U+H01Ssxl0G/7f
	Vf3vxh0yXaj5NGzvKqbvmaTFoRo8I64jJtqsqmvsS0n/SE7Q/bWBeOkwx8+P57nU1DCXhWTpCaAr/
	L7nTIMI/hA3hdf+42VuXXRYmPa1OQ/lm1M5rfC2nXpLDab7BDkYXOGGRzbNDCnRpdqLDF2k78i7Ry
	9ozGoAowLdlqGpBVDnjP44FEto40oAoGXzGgR0coBSl8ogiCgAGG6ryJsIDlgTY6XNSKkDrkozEFh
	RfCvIX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w36jT-0000000A0Bl-2e0G;
	Thu, 19 Mar 2026 06:19:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w36j0-00000009ziQ-3GfC;
	Thu, 19 Mar 2026 06:19:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76B6E404E5;
	Thu, 19 Mar 2026 06:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11745C2BCB0;
	Thu, 19 Mar 2026 06:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773901158;
	bh=sJchU+D5iVBtqxo0a18kfpJyCQYQXaGhsufyuqET8E4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lbL6kp8QtwQt8SUU7QXIx/mdm74G/ku13WvGixi/vBNv5Du0xPzxmE1PDcwA/J6wT
	 JSqjT/FxIdPQIloxJPuHBBJjeTnsThSf+2uYnwqAKBwB6MY3GlTWfsuE3tgH+slGJA
	 rOCsYVjqL4L5cJ/eXlX61ibF6/NaWBk2MtL33rqJc6y/RJhXD5UnwbG0fmpKu3pAMI
	 jiHAJwCI4ag7YrUABdu8XeW/a/Z4BRs+FMLOPGv2R/Z+s8xSRJLYD6PsyzlZxnnvQB
	 OnZAcTqchQKuQX0ffqjJ4mfjP9jSrk7lAOwTiNO632g3rsXKtgNMC2wJVf8M57DJxH
	 r1kurhQF8AIaA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 08/19] crypto: arm64/ghash - Move NEON GHASH assembly into its own file
Date: Wed, 18 Mar 2026 23:17:09 -0700
Message-ID: <20260319061723.1140720-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319061723.1140720-1-ebiggers@kernel.org>
References: <20260319061723.1140720-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_231918_867944_9BFF2FE8 
X-CRM114-Status: GOOD (  15.75  )
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

arch/arm64/crypto/ghash-ce-core.S implements pmull_ghash_update_p8(),
which is used only by a crypto_shash implementation of GHASH.  It also
implements other functions, including pmull_ghash_update_p64() and
others, which are used only by a crypto_aead implementation of AES-GCM.

While some code is shared between pmull_ghash_update_p8() and
pmull_ghash_update_p64(), it's not very much.  Since
pmull_ghash_update_p8() will also need to be migrated into lib/crypto/
to achieve parity in the standalone GHASH support, let's move it into a
separate file ghash-neon-core.S.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/crypto/Makefile          |   2 +-
 arch/arm64/crypto/ghash-ce-core.S   | 207 ++-----------------------
 arch/arm64/crypto/ghash-neon-core.S | 226 ++++++++++++++++++++++++++++
 3 files changed, 239 insertions(+), 196 deletions(-)
 create mode 100644 arch/arm64/crypto/ghash-neon-core.S

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index 8a8e3e551ed3..b7ba43ce8584 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -25,11 +25,11 @@ sm4-ce-gcm-y := sm4-ce-gcm-glue.o sm4-ce-gcm-core.o
 
 obj-$(CONFIG_CRYPTO_SM4_ARM64_NEON_BLK) += sm4-neon.o
 sm4-neon-y := sm4-neon-glue.o sm4-neon-core.o
 
 obj-$(CONFIG_CRYPTO_GHASH_ARM64_CE) += ghash-ce.o
-ghash-ce-y := ghash-ce-glue.o ghash-ce-core.o
+ghash-ce-y := ghash-ce-glue.o ghash-ce-core.o ghash-neon-core.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64_CE_CCM) += aes-ce-ccm.o
 aes-ce-ccm-y := aes-ce-ccm-glue.o aes-ce-ccm-core.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64_CE_BLK) += aes-ce-blk.o
diff --git a/arch/arm64/crypto/ghash-ce-core.S b/arch/arm64/crypto/ghash-ce-core.S
index 23ee9a5eaf27..4344fe213d14 100644
--- a/arch/arm64/crypto/ghash-ce-core.S
+++ b/arch/arm64/crypto/ghash-ce-core.S
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Accelerated GHASH implementation with ARMv8 PMULL instructions.
+ * Accelerated AES-GCM implementation with ARMv8 Crypto Extensions.
  *
  * Copyright (C) 2014 - 2018 Linaro Ltd. <ard.biesheuvel@linaro.org>
  */
 
 #include <linux/linkage.h>
@@ -17,35 +17,10 @@
 	XM		.req	v5
 	XL		.req	v6
 	XH		.req	v7
 	IN1		.req	v7
 
-	k00_16		.req	v8
-	k32_48		.req	v9
-
-	t3		.req	v10
-	t4		.req	v11
-	t5		.req	v12
-	t6		.req	v13
-	t7		.req	v14
-	t8		.req	v15
-	t9		.req	v16
-
-	perm1		.req	v17
-	perm2		.req	v18
-	perm3		.req	v19
-
-	sh1		.req	v20
-	sh2		.req	v21
-	sh3		.req	v22
-	sh4		.req	v23
-
-	ss1		.req	v24
-	ss2		.req	v25
-	ss3		.req	v26
-	ss4		.req	v27
-
 	XL2		.req	v8
 	XM2		.req	v9
 	XH2		.req	v10
 	XL3		.req	v11
 	XM3		.req	v12
@@ -58,94 +33,10 @@
 	HH34		.req	v19
 
 	.text
 	.arch		armv8-a+crypto
 
-	.macro		__pmull_p64, rd, rn, rm
-	pmull		\rd\().1q, \rn\().1d, \rm\().1d
-	.endm
-
-	.macro		__pmull2_p64, rd, rn, rm
-	pmull2		\rd\().1q, \rn\().2d, \rm\().2d
-	.endm
-
-	.macro		__pmull_p8, rq, ad, bd
-	ext		t3.8b, \ad\().8b, \ad\().8b, #1		// A1
-	ext		t5.8b, \ad\().8b, \ad\().8b, #2		// A2
-	ext		t7.8b, \ad\().8b, \ad\().8b, #3		// A3
-
-	__pmull_p8_\bd	\rq, \ad
-	.endm
-
-	.macro		__pmull2_p8, rq, ad, bd
-	tbl		t3.16b, {\ad\().16b}, perm1.16b		// A1
-	tbl		t5.16b, {\ad\().16b}, perm2.16b		// A2
-	tbl		t7.16b, {\ad\().16b}, perm3.16b		// A3
-
-	__pmull2_p8_\bd	\rq, \ad
-	.endm
-
-	.macro		__pmull_p8_SHASH, rq, ad
-	__pmull_p8_tail	\rq, \ad\().8b, SHASH.8b, 8b,, sh1, sh2, sh3, sh4
-	.endm
-
-	.macro		__pmull_p8_SHASH2, rq, ad
-	__pmull_p8_tail	\rq, \ad\().8b, SHASH2.8b, 8b,, ss1, ss2, ss3, ss4
-	.endm
-
-	.macro		__pmull2_p8_SHASH, rq, ad
-	__pmull_p8_tail	\rq, \ad\().16b, SHASH.16b, 16b, 2, sh1, sh2, sh3, sh4
-	.endm
-
-	.macro		__pmull_p8_tail, rq, ad, bd, nb, t, b1, b2, b3, b4
-	pmull\t		t3.8h, t3.\nb, \bd			// F = A1*B
-	pmull\t		t4.8h, \ad, \b1\().\nb			// E = A*B1
-	pmull\t		t5.8h, t5.\nb, \bd			// H = A2*B
-	pmull\t		t6.8h, \ad, \b2\().\nb			// G = A*B2
-	pmull\t		t7.8h, t7.\nb, \bd			// J = A3*B
-	pmull\t		t8.8h, \ad, \b3\().\nb			// I = A*B3
-	pmull\t		t9.8h, \ad, \b4\().\nb			// K = A*B4
-	pmull\t		\rq\().8h, \ad, \bd			// D = A*B
-
-	eor		t3.16b, t3.16b, t4.16b			// L = E + F
-	eor		t5.16b, t5.16b, t6.16b			// M = G + H
-	eor		t7.16b, t7.16b, t8.16b			// N = I + J
-
-	uzp1		t4.2d, t3.2d, t5.2d
-	uzp2		t3.2d, t3.2d, t5.2d
-	uzp1		t6.2d, t7.2d, t9.2d
-	uzp2		t7.2d, t7.2d, t9.2d
-
-	// t3 = (L) (P0 + P1) << 8
-	// t5 = (M) (P2 + P3) << 16
-	eor		t4.16b, t4.16b, t3.16b
-	and		t3.16b, t3.16b, k32_48.16b
-
-	// t7 = (N) (P4 + P5) << 24
-	// t9 = (K) (P6 + P7) << 32
-	eor		t6.16b, t6.16b, t7.16b
-	and		t7.16b, t7.16b, k00_16.16b
-
-	eor		t4.16b, t4.16b, t3.16b
-	eor		t6.16b, t6.16b, t7.16b
-
-	zip2		t5.2d, t4.2d, t3.2d
-	zip1		t3.2d, t4.2d, t3.2d
-	zip2		t9.2d, t6.2d, t7.2d
-	zip1		t7.2d, t6.2d, t7.2d
-
-	ext		t3.16b, t3.16b, t3.16b, #15
-	ext		t5.16b, t5.16b, t5.16b, #14
-	ext		t7.16b, t7.16b, t7.16b, #13
-	ext		t9.16b, t9.16b, t9.16b, #12
-
-	eor		t3.16b, t3.16b, t5.16b
-	eor		t7.16b, t7.16b, t9.16b
-	eor		\rq\().16b, \rq\().16b, t3.16b
-	eor		\rq\().16b, \rq\().16b, t7.16b
-	.endm
-
 	.macro		__pmull_pre_p64
 	add		x8, x3, #16
 	ld1		{HH.2d-HH4.2d}, [x8]
 
 	trn1		SHASH2.2d, SHASH.2d, HH.2d
@@ -158,47 +49,10 @@
 
 	movi		MASK.16b, #0xe1
 	shl		MASK.2d, MASK.2d, #57
 	.endm
 
-	.macro		__pmull_pre_p8
-	ext		SHASH2.16b, SHASH.16b, SHASH.16b, #8
-	eor		SHASH2.16b, SHASH2.16b, SHASH.16b
-
-	// k00_16 := 0x0000000000000000_000000000000ffff
-	// k32_48 := 0x00000000ffffffff_0000ffffffffffff
-	movi		k32_48.2d, #0xffffffff
-	mov		k32_48.h[2], k32_48.h[0]
-	ushr		k00_16.2d, k32_48.2d, #32
-
-	// prepare the permutation vectors
-	mov_q		x5, 0x080f0e0d0c0b0a09
-	movi		T1.8b, #8
-	dup		perm1.2d, x5
-	eor		perm1.16b, perm1.16b, T1.16b
-	ushr		perm2.2d, perm1.2d, #8
-	ushr		perm3.2d, perm1.2d, #16
-	ushr		T1.2d, perm1.2d, #24
-	sli		perm2.2d, perm1.2d, #56
-	sli		perm3.2d, perm1.2d, #48
-	sli		T1.2d, perm1.2d, #40
-
-	// precompute loop invariants
-	tbl		sh1.16b, {SHASH.16b}, perm1.16b
-	tbl		sh2.16b, {SHASH.16b}, perm2.16b
-	tbl		sh3.16b, {SHASH.16b}, perm3.16b
-	tbl		sh4.16b, {SHASH.16b}, T1.16b
-	ext		ss1.8b, SHASH2.8b, SHASH2.8b, #1
-	ext		ss2.8b, SHASH2.8b, SHASH2.8b, #2
-	ext		ss3.8b, SHASH2.8b, SHASH2.8b, #3
-	ext		ss4.8b, SHASH2.8b, SHASH2.8b, #4
-	.endm
-
-	//
-	// PMULL (64x64->128) based reduction for CPUs that can do
-	// it in a single instruction.
-	//
 	.macro		__pmull_reduce_p64
 	pmull		T2.1q, XL.1d, MASK.1d
 	eor		XM.16b, XM.16b, T1.16b
 
 	mov		XH.d[0], XM.d[1]
@@ -207,51 +61,27 @@
 	eor		XL.16b, XM.16b, T2.16b
 	ext		T2.16b, XL.16b, XL.16b, #8
 	pmull		XL.1q, XL.1d, MASK.1d
 	.endm
 
-	//
-	// Alternative reduction for CPUs that lack support for the
-	// 64x64->128 PMULL instruction
-	//
-	.macro		__pmull_reduce_p8
-	eor		XM.16b, XM.16b, T1.16b
-
-	mov		XL.d[1], XM.d[0]
-	mov		XH.d[0], XM.d[1]
-
-	shl		T1.2d, XL.2d, #57
-	shl		T2.2d, XL.2d, #62
-	eor		T2.16b, T2.16b, T1.16b
-	shl		T1.2d, XL.2d, #63
-	eor		T2.16b, T2.16b, T1.16b
-	ext		T1.16b, XL.16b, XH.16b, #8
-	eor		T2.16b, T2.16b, T1.16b
-
-	mov		XL.d[1], T2.d[0]
-	mov		XH.d[0], T2.d[1]
-
-	ushr		T2.2d, XL.2d, #1
-	eor		XH.16b, XH.16b, XL.16b
-	eor		XL.16b, XL.16b, T2.16b
-	ushr		T2.2d, T2.2d, #6
-	ushr		XL.2d, XL.2d, #1
-	.endm
-
-	.macro		__pmull_ghash, pn
+	/*
+	 * void pmull_ghash_update_p64(int blocks, u64 dg[], const char *src,
+	 *			       u64 const h[][2], const char *head)
+	 */
+SYM_TYPED_FUNC_START(pmull_ghash_update_p64)
 	ld1		{SHASH.2d}, [x3]
 	ld1		{XL.2d}, [x1]
 
-	__pmull_pre_\pn
+	__pmull_pre_p64
 
 	/* do the head block first, if supplied */
 	cbz		x4, 0f
 	ld1		{T1.2d}, [x4]
 	mov		x4, xzr
 	b		3f
 
-0:	.ifc		\pn, p64
+0:
 	tbnz		w0, #0, 2f		// skip until #blocks is a
 	tbnz		w0, #1, 2f		// round multiple of 4
 
 1:	ld1		{XM3.16b-TT4.16b}, [x2], #64
 
@@ -312,11 +142,10 @@
 	eor		T2.16b, T2.16b, XH.16b
 	eor		XL.16b, XL.16b, T2.16b
 
 	cbz		w0, 5f
 	b		1b
-	.endif
 
 2:	ld1		{T1.2d}, [x2], #16
 	sub		w0, w0, #1
 
 3:	/* multiply XL by SHASH in GF(2^128) */
@@ -325,42 +154,30 @@ CPU_LE(	rev64		T1.16b, T1.16b	)
 	ext		T2.16b, XL.16b, XL.16b, #8
 	ext		IN1.16b, T1.16b, T1.16b, #8
 	eor		T1.16b, T1.16b, T2.16b
 	eor		XL.16b, XL.16b, IN1.16b
 
-	__pmull2_\pn	XH, XL, SHASH			// a1 * b1
+	pmull2		XH.1q, XL.2d, SHASH.2d		// a1 * b1
 	eor		T1.16b, T1.16b, XL.16b
-	__pmull_\pn 	XL, XL, SHASH			// a0 * b0
-	__pmull_\pn	XM, T1, SHASH2			// (a1 + a0)(b1 + b0)
+	pmull		XL.1q, XL.1d, SHASH.1d		// a0 * b0
+	pmull		XM.1q, T1.1d, SHASH2.1d		// (a1 + a0)(b1 + b0)
 
 4:	eor		T2.16b, XL.16b, XH.16b
 	ext		T1.16b, XL.16b, XH.16b, #8
 	eor		XM.16b, XM.16b, T2.16b
 
-	__pmull_reduce_\pn
+	__pmull_reduce_p64
 
 	eor		T2.16b, T2.16b, XH.16b
 	eor		XL.16b, XL.16b, T2.16b
 
 	cbnz		w0, 0b
 
 5:	st1		{XL.2d}, [x1]
 	ret
-	.endm
-
-	/*
-	 * void pmull_ghash_update(int blocks, u64 dg[], const char *src,
-	 *			   struct ghash_key const *k, const char *head)
-	 */
-SYM_TYPED_FUNC_START(pmull_ghash_update_p64)
-	__pmull_ghash	p64
 SYM_FUNC_END(pmull_ghash_update_p64)
 
-SYM_TYPED_FUNC_START(pmull_ghash_update_p8)
-	__pmull_ghash	p8
-SYM_FUNC_END(pmull_ghash_update_p8)
-
 	KS0		.req	v8
 	KS1		.req	v9
 	KS2		.req	v10
 	KS3		.req	v11
 
diff --git a/arch/arm64/crypto/ghash-neon-core.S b/arch/arm64/crypto/ghash-neon-core.S
new file mode 100644
index 000000000000..6157135ad566
--- /dev/null
+++ b/arch/arm64/crypto/ghash-neon-core.S
@@ -0,0 +1,226 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Accelerated GHASH implementation with ARMv8 ASIMD instructions.
+ *
+ * Copyright (C) 2014 - 2018 Linaro Ltd. <ard.biesheuvel@linaro.org>
+ */
+
+#include <linux/linkage.h>
+#include <linux/cfi_types.h>
+#include <asm/assembler.h>
+
+	SHASH		.req	v0
+	SHASH2		.req	v1
+	T1		.req	v2
+	T2		.req	v3
+	XM		.req	v5
+	XL		.req	v6
+	XH		.req	v7
+	IN1		.req	v7
+
+	k00_16		.req	v8
+	k32_48		.req	v9
+
+	t3		.req	v10
+	t4		.req	v11
+	t5		.req	v12
+	t6		.req	v13
+	t7		.req	v14
+	t8		.req	v15
+	t9		.req	v16
+
+	perm1		.req	v17
+	perm2		.req	v18
+	perm3		.req	v19
+
+	sh1		.req	v20
+	sh2		.req	v21
+	sh3		.req	v22
+	sh4		.req	v23
+
+	ss1		.req	v24
+	ss2		.req	v25
+	ss3		.req	v26
+	ss4		.req	v27
+
+	.text
+
+	.macro		__pmull_p8, rq, ad, bd
+	ext		t3.8b, \ad\().8b, \ad\().8b, #1		// A1
+	ext		t5.8b, \ad\().8b, \ad\().8b, #2		// A2
+	ext		t7.8b, \ad\().8b, \ad\().8b, #3		// A3
+
+	__pmull_p8_\bd	\rq, \ad
+	.endm
+
+	.macro		__pmull2_p8, rq, ad, bd
+	tbl		t3.16b, {\ad\().16b}, perm1.16b		// A1
+	tbl		t5.16b, {\ad\().16b}, perm2.16b		// A2
+	tbl		t7.16b, {\ad\().16b}, perm3.16b		// A3
+
+	__pmull2_p8_\bd	\rq, \ad
+	.endm
+
+	.macro		__pmull_p8_SHASH, rq, ad
+	__pmull_p8_tail	\rq, \ad\().8b, SHASH.8b, 8b,, sh1, sh2, sh3, sh4
+	.endm
+
+	.macro		__pmull_p8_SHASH2, rq, ad
+	__pmull_p8_tail	\rq, \ad\().8b, SHASH2.8b, 8b,, ss1, ss2, ss3, ss4
+	.endm
+
+	.macro		__pmull2_p8_SHASH, rq, ad
+	__pmull_p8_tail	\rq, \ad\().16b, SHASH.16b, 16b, 2, sh1, sh2, sh3, sh4
+	.endm
+
+	.macro		__pmull_p8_tail, rq, ad, bd, nb, t, b1, b2, b3, b4
+	pmull\t		t3.8h, t3.\nb, \bd			// F = A1*B
+	pmull\t		t4.8h, \ad, \b1\().\nb			// E = A*B1
+	pmull\t		t5.8h, t5.\nb, \bd			// H = A2*B
+	pmull\t		t6.8h, \ad, \b2\().\nb			// G = A*B2
+	pmull\t		t7.8h, t7.\nb, \bd			// J = A3*B
+	pmull\t		t8.8h, \ad, \b3\().\nb			// I = A*B3
+	pmull\t		t9.8h, \ad, \b4\().\nb			// K = A*B4
+	pmull\t		\rq\().8h, \ad, \bd			// D = A*B
+
+	eor		t3.16b, t3.16b, t4.16b			// L = E + F
+	eor		t5.16b, t5.16b, t6.16b			// M = G + H
+	eor		t7.16b, t7.16b, t8.16b			// N = I + J
+
+	uzp1		t4.2d, t3.2d, t5.2d
+	uzp2		t3.2d, t3.2d, t5.2d
+	uzp1		t6.2d, t7.2d, t9.2d
+	uzp2		t7.2d, t7.2d, t9.2d
+
+	// t3 = (L) (P0 + P1) << 8
+	// t5 = (M) (P2 + P3) << 16
+	eor		t4.16b, t4.16b, t3.16b
+	and		t3.16b, t3.16b, k32_48.16b
+
+	// t7 = (N) (P4 + P5) << 24
+	// t9 = (K) (P6 + P7) << 32
+	eor		t6.16b, t6.16b, t7.16b
+	and		t7.16b, t7.16b, k00_16.16b
+
+	eor		t4.16b, t4.16b, t3.16b
+	eor		t6.16b, t6.16b, t7.16b
+
+	zip2		t5.2d, t4.2d, t3.2d
+	zip1		t3.2d, t4.2d, t3.2d
+	zip2		t9.2d, t6.2d, t7.2d
+	zip1		t7.2d, t6.2d, t7.2d
+
+	ext		t3.16b, t3.16b, t3.16b, #15
+	ext		t5.16b, t5.16b, t5.16b, #14
+	ext		t7.16b, t7.16b, t7.16b, #13
+	ext		t9.16b, t9.16b, t9.16b, #12
+
+	eor		t3.16b, t3.16b, t5.16b
+	eor		t7.16b, t7.16b, t9.16b
+	eor		\rq\().16b, \rq\().16b, t3.16b
+	eor		\rq\().16b, \rq\().16b, t7.16b
+	.endm
+
+	.macro		__pmull_pre_p8
+	ext		SHASH2.16b, SHASH.16b, SHASH.16b, #8
+	eor		SHASH2.16b, SHASH2.16b, SHASH.16b
+
+	// k00_16 := 0x0000000000000000_000000000000ffff
+	// k32_48 := 0x00000000ffffffff_0000ffffffffffff
+	movi		k32_48.2d, #0xffffffff
+	mov		k32_48.h[2], k32_48.h[0]
+	ushr		k00_16.2d, k32_48.2d, #32
+
+	// prepare the permutation vectors
+	mov_q		x5, 0x080f0e0d0c0b0a09
+	movi		T1.8b, #8
+	dup		perm1.2d, x5
+	eor		perm1.16b, perm1.16b, T1.16b
+	ushr		perm2.2d, perm1.2d, #8
+	ushr		perm3.2d, perm1.2d, #16
+	ushr		T1.2d, perm1.2d, #24
+	sli		perm2.2d, perm1.2d, #56
+	sli		perm3.2d, perm1.2d, #48
+	sli		T1.2d, perm1.2d, #40
+
+	// precompute loop invariants
+	tbl		sh1.16b, {SHASH.16b}, perm1.16b
+	tbl		sh2.16b, {SHASH.16b}, perm2.16b
+	tbl		sh3.16b, {SHASH.16b}, perm3.16b
+	tbl		sh4.16b, {SHASH.16b}, T1.16b
+	ext		ss1.8b, SHASH2.8b, SHASH2.8b, #1
+	ext		ss2.8b, SHASH2.8b, SHASH2.8b, #2
+	ext		ss3.8b, SHASH2.8b, SHASH2.8b, #3
+	ext		ss4.8b, SHASH2.8b, SHASH2.8b, #4
+	.endm
+
+	.macro		__pmull_reduce_p8
+	eor		XM.16b, XM.16b, T1.16b
+
+	mov		XL.d[1], XM.d[0]
+	mov		XH.d[0], XM.d[1]
+
+	shl		T1.2d, XL.2d, #57
+	shl		T2.2d, XL.2d, #62
+	eor		T2.16b, T2.16b, T1.16b
+	shl		T1.2d, XL.2d, #63
+	eor		T2.16b, T2.16b, T1.16b
+	ext		T1.16b, XL.16b, XH.16b, #8
+	eor		T2.16b, T2.16b, T1.16b
+
+	mov		XL.d[1], T2.d[0]
+	mov		XH.d[0], T2.d[1]
+
+	ushr		T2.2d, XL.2d, #1
+	eor		XH.16b, XH.16b, XL.16b
+	eor		XL.16b, XL.16b, T2.16b
+	ushr		T2.2d, T2.2d, #6
+	ushr		XL.2d, XL.2d, #1
+	.endm
+
+	/*
+	 * void pmull_ghash_update_p8(int blocks, u64 dg[], const char *src,
+	 *			      u64 const h[][2], const char *head)
+	 */
+SYM_TYPED_FUNC_START(pmull_ghash_update_p8)
+	ld1		{SHASH.2d}, [x3]
+	ld1		{XL.2d}, [x1]
+
+	__pmull_pre_p8
+
+	/* do the head block first, if supplied */
+	cbz		x4, 0f
+	ld1		{T1.2d}, [x4]
+	mov		x4, xzr
+	b		3f
+
+0:	ld1		{T1.2d}, [x2], #16
+	sub		w0, w0, #1
+
+3:	/* multiply XL by SHASH in GF(2^128) */
+CPU_LE(	rev64		T1.16b, T1.16b	)
+
+	ext		T2.16b, XL.16b, XL.16b, #8
+	ext		IN1.16b, T1.16b, T1.16b, #8
+	eor		T1.16b, T1.16b, T2.16b
+	eor		XL.16b, XL.16b, IN1.16b
+
+	__pmull2_p8	XH, XL, SHASH			// a1 * b1
+	eor		T1.16b, T1.16b, XL.16b
+	__pmull_p8 	XL, XL, SHASH			// a0 * b0
+	__pmull_p8	XM, T1, SHASH2			// (a1 + a0)(b1 + b0)
+
+	eor		T2.16b, XL.16b, XH.16b
+	ext		T1.16b, XL.16b, XH.16b, #8
+	eor		XM.16b, XM.16b, T2.16b
+
+	__pmull_reduce_p8
+
+	eor		T2.16b, T2.16b, XH.16b
+	eor		XL.16b, XL.16b, T2.16b
+
+	cbnz		w0, 0b
+
+	st1		{XL.2d}, [x1]
+	ret
+SYM_FUNC_END(pmull_ghash_update_p8)
-- 
2.53.0


