Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D407AC5CFE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAPLA2gyZMmJKtLaawT2NRgSYtkIFiQ0jrrsW/pUmD4=; b=K/Ee8xgBiOUr7dzKr76Dno/8Mu
	RcTLKB/oVzNkpR2bxNrXbFvUWdNuGdUNZf7BP0eAQCIiUO1vBMEA8O2zxDmMPdettC+Td6DSRBasC
	STx4Vq1GCav2X1OE+rdwVPwKvdnJZjVvlTTdpi/LEqGzQg5DejCImF2em4BBBN0Y+HDrQNzX/yL3H
	W4nAeI/TeSaCEisTYCBnqFIW8/dN2Xgn7FHQKxOHgp95eFFHxYDkDrspqStdYQWy02QfeK/GByTrd
	nYzy6DfU+zkSmzgoL9g0dbk/sFxt8LDo/D5VE7ECv5J1lmb9reKhdWuH1QxwdI2XEjUyP1X8iDi4f
	Yn0G7usA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn3J-0000000E9T9-3hne;
	Tue, 11 Aug 2026 14:02:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn3D-0000000E9Q2-2V2G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 14:01:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F386960A5D;
	Tue, 11 Aug 2026 14:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B1E1F000E9;
	Tue, 11 Aug 2026 14:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456914;
	bh=dAPLA2gyZMmJKtLaawT2NRgSYtkIFiQ0jrrsW/pUmD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BLuBVQE6djx5vpkzdr8ju3sDOeCsWzj1C/sY939b4ZV9lpDSO3lnNFyDNe0Axolow
	 hGVKockE9AGVpTbWTyxyexIGINiJZcJg/yLfkGQU/i+rqGsB2O21A+BSU/qA2F2xAa
	 ToZCGB13WqM7o7rki3F7kDOuJfQPcoTQZtP3MijX5j/F2piXAP9VLXLH+ewThWiBCm
	 lpTyPGG+8kz4FGTnIzqfBo5PESzFezdP38RGthIXT+CbKvghSxpe+iWeYAZX4PPjDp
	 Fk62ZOg37VsV4EQSKCGWrqOnfDgoCotfYNBAQfT6oJyNPs4aVwYNEfvsGlp5I/PdxH
	 lYsQgxkAtI6WA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 05/12] arm64: lib: Assume a little-endian kernel in optimised string routines
Date: Tue, 11 Aug 2026 15:01:24 +0100
Message-ID: <20260811140132.22778-6-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260811140132.22778-1-will@kernel.org>
References: <20260811140132.22778-1-will@kernel.org>
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

Big-endian support on arm64 depends on BROKEN. In preparation for
removing the dead code altogether, remove the big-endian-specific
support from the arm64 optimised string routines. Although these
started life as a fork of Arm's "cortex strings" library and later got
updated with the "optimized-routines" code, the in-kernel implementation
has always been different enough that removing the unused big-endian
portion still makes sense.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/lib/memcmp.S  |  2 -
 arch/arm64/lib/strcmp.S  | 34 +--------------
 arch/arm64/lib/strlen.S  | 26 -----------
 arch/arm64/lib/strncmp.S | 93 +++-------------------------------------
 arch/arm64/lib/strnlen.S | 16 +------
 5 files changed, 8 insertions(+), 163 deletions(-)

diff --git a/arch/arm64/lib/memcmp.S b/arch/arm64/lib/memcmp.S
index a5ccf2c55f91..1f528ce046e4 100644
--- a/arch/arm64/lib/memcmp.S
+++ b/arch/arm64/lib/memcmp.S
@@ -103,10 +103,8 @@ L(last_bytes):
 
 	/* Compare data bytes and set return value to 0, -1 or 1.  */
 L(return):
-#ifndef __AARCH64EB__
 	rev	data1, data1
 	rev	data2, data2
-#endif
 	cmp	data1, data2
 L(ret_eq):
 	cset	result, ne
diff --git a/arch/arm64/lib/strcmp.S b/arch/arm64/lib/strcmp.S
index 9b89b4533607..2389b47dca22 100644
--- a/arch/arm64/lib/strcmp.S
+++ b/arch/arm64/lib/strcmp.S
@@ -38,14 +38,6 @@
 #define shift		x9
 #define off2		x10
 
-/* On big-endian early bytes are at MSB and on little-endian LSB.
-   LS_FW means shifting towards early bytes.  */
-#ifdef __AARCH64EB__
-# define LS_FW lsl
-#else
-# define LS_FW lsr
-#endif
-
 /* NUL detection works on the principle that (X - 1) & (~X) & 0x80
    (=> (X - 1) & ~(X | 0x7f)) is non-zero iff a byte is zero, and
    can be done in parallel across the entire word.
@@ -67,28 +59,17 @@ L(loop_aligned):
 	ldr	data2, [src1, off2]
 	ldr	data1, [src1], 8
 L(start_realigned):
-#ifdef __AARCH64EB__
-	rev	tmp, data1
-	sub	has_nul, tmp, zeroones
-	orr	tmp, tmp, REP8_7f
-#else
 	sub	has_nul, data1, zeroones
 	orr	tmp, data1, REP8_7f
-#endif
 	bics	has_nul, has_nul, tmp	/* Non-zero if NUL terminator.  */
 	ccmp	data1, data2, 0, eq
 	b.eq	L(loop_aligned)
-#ifdef __AARCH64EB__
-	rev	has_nul, has_nul
-#endif
 	eor	diff, data1, data2
 	orr	syndrome, diff, has_nul
 L(end):
-#ifndef __AARCH64EB__
 	rev	syndrome, syndrome
 	rev	data1, data1
 	rev	data2, data2
-#endif
 	clz	shift, syndrome
 	/* The most-significant-non-zero bit of the syndrome marks either the
 	   first bit that is different, or the top bit of the first zero byte.
@@ -113,7 +94,7 @@ L(mutual_align):
 	ldr	data1, [src1], 8
 	neg	shift, src2, lsl 3	/* Bits to alignment -64.  */
 	mov	tmp, -1
-	LS_FW	tmp, tmp, shift
+	lsr	tmp, tmp, shift
 	orr	data1, data1, tmp
 	orr	data2, data2, tmp
 	b	L(start_realigned)
@@ -135,9 +116,6 @@ L(src1_aligned):
 	neg	shift, src2, lsl 3
 	bic	src2, src2, 7
 	ldr	data3, [src2], 8
-#ifdef __AARCH64EB__
-	rev	data3, data3
-#endif
 	lsr	tmp, zeroones, shift
 	orr	data3, data3, tmp
 	sub	has_nul, data3, zeroones
@@ -152,9 +130,6 @@ L(src1_aligned):
 L(loop_unaligned):
 	ldr	data3, [src1, off1]
 	ldr	data2, [src1, off2]
-#ifdef __AARCH64EB__
-	rev	data3, data3
-#endif
 	sub	has_nul, data3, zeroones
 	orr	tmp, data3, REP8_7f
 	ldr	data1, [src1], 8
@@ -163,9 +138,6 @@ L(loop_unaligned):
 	b.eq	L(loop_unaligned)
 
 	lsl	tmp, has_nul, shift
-#ifdef __AARCH64EB__
-	rev	tmp, tmp
-#endif
 	eor	diff, data1, data2
 	orr	syndrome, diff, tmp
 	cbnz	syndrome, L(end)
@@ -174,10 +146,6 @@ L(tail):
 	neg	shift, shift
 	lsr	data2, data3, shift
 	lsr	has_nul, has_nul, shift
-#ifdef __AARCH64EB__
-	rev     data2, data2
-	rev	has_nul, has_nul
-#endif
 	eor	diff, data1, data2
 	orr	syndrome, diff, has_nul
 	b	L(end)
diff --git a/arch/arm64/lib/strlen.S b/arch/arm64/lib/strlen.S
index 4919fe81ae54..a8c49a3886f6 100644
--- a/arch/arm64/lib/strlen.S
+++ b/arch/arm64/lib/strlen.S
@@ -85,14 +85,6 @@ SYM_FUNC_START(__pi_strlen)
 	cmp	tmp1, MIN_PAGE_SIZE - 16
 	b.gt	L(page_cross)
 	ldp	data1, data2, [srcin]
-#ifdef __AARCH64EB__
-	/* For big-endian, carry propagation (if the final byte in the
-	   string is 0x01) means we cannot use has_nul1/2 directly.
-	   Since we expect strings to be small and early-exit,
-	   byte-swap the data now so has_null1/2 will be correct.  */
-	rev	data1, data1
-	rev	data2, data2
-#endif
 	sub	tmp1, data1, zeroones
 	orr	tmp2, data1, REP8_7f
 	sub	tmp3, data2, zeroones
@@ -144,19 +136,7 @@ L(page_cross_entry):
 
 	/* Enter with C = has_nul1 == 0.  */
 L(tail):
-#ifdef __AARCH64EB__
-	/* For big-endian, carry propagation (if the final byte in the
-	   string is 0x01) means we cannot use has_nul1/2 directly.  The
-	   easiest way to get the correct byte is to byte-swap the data
-	   and calculate the syndrome a second time.  */
-	csel	data1, data1, data2, cc
-	rev	data1, data1
-	sub	tmp1, data1, zeroones
-	orr	tmp2, data1, REP8_7f
-	bic	has_nul1, tmp1, tmp2
-#else
 	csel	has_nul1, has_nul1, has_nul2, cc
-#endif
 	sub	len, src, srcin
 	rev	has_nul1, has_nul1
 	add	tmp2, len, 8
@@ -194,13 +174,7 @@ L(page_cross):
 	ldp	data1, data2, [src]
 	lsl	tmp1, srcin, 3
 	mov	tmp4, -1
-#ifdef __AARCH64EB__
-	/* Big-endian.	Early bytes are at MSB.	 */
-	lsr	tmp1, tmp4, tmp1	/* Shift (tmp1 & 63).  */
-#else
-	/* Little-endian.  Early bytes are at LSB.  */
 	lsl	tmp1, tmp4, tmp1	/* Shift (tmp1 & 63).  */
-#endif
 	orr	tmp1, tmp1, REP8_80
 	orn	data1, data1, tmp1
 	orn	tmp2, data2, tmp1
diff --git a/arch/arm64/lib/strncmp.S b/arch/arm64/lib/strncmp.S
index fe7bbc0b42a7..e4fde8586089 100644
--- a/arch/arm64/lib/strncmp.S
+++ b/arch/arm64/lib/strncmp.S
@@ -45,19 +45,6 @@
 #define offset		pos
 #define neg_offset	x15
 
-/* Define endian dependent shift operations.
-   On big-endian early bytes are at MSB and on little-endian LSB.
-   LS_FW means shifting towards early bytes.
-   LS_BK means shifting towards later bytes.
-   */
-#ifdef __AARCH64EB__
-#define LS_FW lsl
-#define LS_BK lsr
-#else
-#define LS_FW lsr
-#define LS_BK lsl
-#endif
-
 SYM_FUNC_START(__pi_strncmp)
 	cbz	limit, L(ret0)
 	eor	tmp1, src1, src2
@@ -86,7 +73,6 @@ L(start_realigned):
 	/* End of main loop */
 
 L(full_check):
-#ifndef __AARCH64EB__
 	orr	syndrome, diff, has_nul
 	add	limit, limit, 8	/* Rewind limit to before last subs. */
 L(syndrome_check):
@@ -105,55 +91,6 @@ L(syndrome_check):
 	sub	result, data1, data2, lsr #56
 	csel result, result, xzr, hi
 	ret
-#else
-	/* Not reached the limit, must have found the end or a diff.  */
-	tbz	limit, #63, L(not_limit)
-	add	tmp1, limit, 8
-	cbz	limit, L(not_limit)
-
-	lsl	limit, tmp1, #3	/* Bits -> bytes.  */
-	mov	mask, #~0
-	lsr	mask, mask, limit
-	bic	data1, data1, mask
-	bic	data2, data2, mask
-
-	/* Make sure that the NUL byte is marked in the syndrome.  */
-	orr	has_nul, has_nul, mask
-
-L(not_limit):
-	/* For big-endian we cannot use the trick with the syndrome value
-	   as carry-propagation can corrupt the upper bits if the trailing
-	   bytes in the string contain 0x01.  */
-	/* However, if there is no NUL byte in the dword, we can generate
-	   the result directly.  We can't just subtract the bytes as the
-	   MSB might be significant.  */
-	cbnz	has_nul, 1f
-	cmp	data1, data2
-	cset	result, ne
-	cneg	result, result, lo
-	ret
-1:
-	/* Re-compute the NUL-byte detection, using a byte-reversed value.  */
-	rev	tmp3, data1
-	sub	tmp1, tmp3, zeroones
-	orr	tmp2, tmp3, #REP8_7f
-	bic	has_nul, tmp1, tmp2
-	rev	has_nul, has_nul
-	orr	syndrome, diff, has_nul
-	clz	pos, syndrome
-	/* The most-significant-non-zero bit of the syndrome marks either the
-	   first bit that is different, or the top bit of the first zero byte.
-	   Shifting left now will bring the critical information into the
-	   top bits.  */
-L(end_quick):
-	lsl	data1, data1, pos
-	lsl	data2, data2, pos
-	/* But we need to zero-extend (char is unsigned) the value and then
-	   perform a signed 32-bit subtraction.  */
-	lsr	data1, data1, #56
-	sub	result, data1, data2, lsr #56
-	ret
-#endif
 
 L(mutual_align):
 	/* Sources are mutually aligned, but are not currently at an
@@ -167,7 +104,7 @@ L(mutual_align):
 	neg	tmp3, count, lsl #3	/* 64 - bits(bytes beyond align). */
 	ldr	data2, [src2], #8
 	mov	tmp2, #~0
-	LS_FW	tmp2, tmp2, tmp3	/* Shift (count & 63).  */
+	lsr	tmp2, tmp2, tmp3	/* Shift (count & 63).  */
 	/* Adjust the limit and ensure it doesn't overflow.  */
 	adds	limit, limit, count
 	csinv	limit, limit, xzr, lo
@@ -236,15 +173,15 @@ L(src1_aligned):
 	neg	neg_offset, offset
 	ldr	data1, [src1], #8
 	ldp	tmp1, tmp2, [src2], #16
-	LS_BK	mask, mask, neg_offset
+	lsl	mask, mask, neg_offset
 	and	neg_offset, neg_offset, #63	/* Need actual value for cmp later. */
 	/* Skip the first compare if data in tmp1 is irrelevant. */
 	tbnz	offset, 6, L(misaligned_mid_loop)
 
 L(loop_misaligned):
 	/* STEP_A: Compare full 8 bytes when there is enough data from SRC2.*/
-	LS_FW	data2, tmp1, offset
-	LS_BK	tmp1, tmp2, neg_offset
+	lsr	data2, tmp1, offset
+	lsl	tmp1, tmp2, neg_offset
 	subs	limit, limit, #8
 	orr	data2, data2, tmp1	/* 8 bytes from SRC2 combined from two regs.*/
 	sub	has_nul, data1, zeroones
@@ -258,23 +195,12 @@ L(loop_misaligned):
 	ldr	data1, [src1], #8
 L(misaligned_mid_loop):
 	/* STEP_B: Compare first part of data1 to second part of tmp2. */
-	LS_FW	data2, tmp2, offset
-#ifdef __AARCH64EB__
-	/* For big-endian we do a byte reverse to avoid carry-propagation
-	problem described above. This way we can reuse the has_nul in the
-	next step and also use syndrome value trick at the end. */
-	rev	tmp3, data1
-	#define data1_fixed tmp3
-#else
+	lsr	data2, tmp2, offset
 	#define data1_fixed data1
-#endif
 	sub	has_nul, data1_fixed, zeroones
 	orr	tmp3, data1_fixed, #REP8_7f
 	eor	diff, data2, data1	/* Non-zero if differences found.  */
 	bic	has_nul, has_nul, tmp3	/* Non-zero if NUL terminator.  */
-#ifdef __AARCH64EB__
-	rev	has_nul, has_nul
-#endif
 	cmp	limit, neg_offset, lsr #3
 	orr	syndrome, diff, has_nul
 	bic	syndrome, syndrome, mask	/* Ignore later bytes. */
@@ -284,7 +210,7 @@ L(misaligned_mid_loop):
 	/* STEP_C: Compare second part of data1 to first part of tmp1. */
 	ldp	tmp1, tmp2, [src2], #16
 	cmp	limit, #8
-	LS_BK	data2, tmp1, neg_offset
+	lsl	data2, tmp1, neg_offset
 	eor	diff, data2, data1	/* Non-zero if differences found.  */
 	orr	syndrome, diff, has_nul
 	and	syndrome, syndrome, mask	/* Ignore earlier bytes. */
@@ -295,13 +221,6 @@ L(misaligned_mid_loop):
 	sub	limit, limit, #8
 	b	L(loop_misaligned)
 
-#ifdef	__AARCH64EB__
-L(syndrome_check):
-	clz	pos, syndrome
-	cmp	pos, limit, lsl #3
-	b.lo	L(end_quick)
-#endif
-
 L(ret0):
 	mov	result, #0
 	ret
diff --git a/arch/arm64/lib/strnlen.S b/arch/arm64/lib/strnlen.S
index d5ac0e10a01d..b20011d559f1 100644
--- a/arch/arm64/lib/strnlen.S
+++ b/arch/arm64/lib/strnlen.S
@@ -91,22 +91,10 @@ SYM_FUNC_START(__pi_strnlen)
 	*/
 	sub	len, src, srcin
 	cbz	has_nul1, .Lnul_in_data2
-CPU_BE( mov	data2, data1 )	/*perpare data to re-calculate the syndrome*/
 
 	sub	len, len, #8
 	mov	has_nul2, has_nul1
 .Lnul_in_data2:
-	/*
-	* For big-endian, carry propagation (if the final byte in the
-	* string is 0x01) means we cannot use has_nul directly.  The
-	* easiest way to get the correct byte is to byte-swap the data
-	* and calculate the syndrome a second time.
-	*/
-CPU_BE( rev	data2, data2 )
-CPU_BE( sub	tmp1, data2, zeroones )
-CPU_BE( orr	tmp2, data2, #REP8_7f )
-CPU_BE( bic	has_nul2, tmp1, tmp2 )
-
 	sub	len, len, #8
 	rev	has_nul2, has_nul2
 	clz	pos, has_nul2
@@ -139,10 +127,8 @@ CPU_BE( bic	has_nul2, tmp1, tmp2 )
 	lsl	tmp4, tmp4, #3  /* Bytes beyond alignment -> bits.  */
 
 	mov	tmp2, #~0
-	/* Big-endian.  Early bytes are at MSB.  */
-CPU_BE( lsl	tmp2, tmp2, tmp4 )	/* Shift (tmp1 & 63).  */
 	/* Little-endian.  Early bytes are at LSB.  */
-CPU_LE( lsr	tmp2, tmp2, tmp4 )	/* Shift (tmp1 & 63).  */
+	lsr	tmp2, tmp2, tmp4	/* Shift (tmp1 & 63).  */
 
 	cmp	tmp1, #8
 
-- 
2.55.0.679.g6767b8d81c-goog


