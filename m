Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05F610F9312
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 00:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gtEzoO04YNru+Rum8sLYTL29QYV3sPisTqHVPTrUqdc=; b=0lZJGORpi2oihriDbTfu3wCujW
	UFky3n4MhJPYIv3p8yd9CCbyxYWjgEj/KnPAcFV3MQYmR1R72tkXM2/ply8oHkA3zFWdi6Tix+mTe
	Y5FzEIONX/vCQgbdGFm1jM/dRkf47jisQ0Xz8aNlbqDNRdEuzs+/VaOTpbj3oFlo+N8bEqyhX1SHg
	tFnf0Gg1ppNd/I5rw8H+EFNZnf09JBjZ5jpkKZr3qaA/aGfMFxJ/m++fjw4xdGZj1i6dwH1dooc4I
	PiV7YkLx+ukEi9MwubqpF8NLXLFY/9mtqDMkhHdOVv9j3pzDhER2uHqWp+KOCwuowxw+A9QaLN1TU
	70S2vVfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7jhH-0000000Dkj4-4BtU;
	Wed, 01 Apr 2026 00:44:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7jhF-0000000Dkik-2lQB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 00:44:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0371443548
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Apr 2026 00:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4780C19423;
	Wed,  1 Apr 2026 00:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775004276;
	bh=t9YRv1FqbSlnih+jiMm26EVjV/zSLNM1/2jxkIcSIjs=;
	h=From:To:Cc:Subject:Date:From;
	b=ERvBGU2NLCwuIPnM0xNf5xHUWYs8lLiFAMvnctaKqOI4d8PhhNaRPsPUfjsX8dY2+
	 pI3SzoCS0DtOm/SZnfYT80dczPAyx85cS+P1AEngy2TZRxt1tTJZ1bP3rTb3gb6cy5
	 eiFrxPCurR5Q9X2DKq8/H4RAlZ3Q6NXLX6/DMmgZfrCX1/V8CagNPR+KVHF3ZLpPhE
	 RaLW1bNyKlUdt4+79UzYC5brz0OWpfXcUmOBOsBSQaj/woYgJ+VC95snOmqSz5zjA7
	 E5KEds5pKtTgw11l1jmpcKqAMbYgGjk1kxAWv1DhrE3BzUwBeZmxrhw5rQ5hf9FtlF
	 SoP9duTZWsnwg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] lib/crc: arm64: Assume a little-endian kernel
Date: Tue, 31 Mar 2026 17:44:31 -0700
Message-ID: <20260401004431.151432-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_174437_766246_29092028 
X-CRM114-Status: UNSURE (   9.27  )
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

Since support for big-endian arm64 kernels was removed, the CPU_LE()
macro now unconditionally emits the code it is passed, and the CPU_BE()
macro now unconditionally discards the code it is passed.

Simplify the assembly code in lib/crc/arm64/ accordingly.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---

This patch is targeting crc-next

 lib/crc/arm64/crc-t10dif-core.S | 56 ++++++++++++++++-----------------
 lib/crc/arm64/crc32-core.S      |  9 ++----
 2 files changed, 30 insertions(+), 35 deletions(-)

diff --git a/lib/crc/arm64/crc-t10dif-core.S b/lib/crc/arm64/crc-t10dif-core.S
index 87dd6d46224d8..71388466825b9 100644
--- a/lib/crc/arm64/crc-t10dif-core.S
+++ b/lib/crc/arm64/crc-t10dif-core.S
@@ -179,17 +179,17 @@ SYM_FUNC_END(__pmull_p8_16x64)
 	.macro		fold_32_bytes, p, reg1, reg2
 	ldp		q11, q12, [buf], #0x20
 
 	pmull16x64_\p	fold_consts, \reg1, v8
 
-CPU_LE(	rev64		v11.16b, v11.16b		)
-CPU_LE(	rev64		v12.16b, v12.16b		)
+	rev64		v11.16b, v11.16b
+	rev64		v12.16b, v12.16b
 
 	pmull16x64_\p	fold_consts, \reg2, v9
 
-CPU_LE(	ext		v11.16b, v11.16b, v11.16b, #8	)
-CPU_LE(	ext		v12.16b, v12.16b, v12.16b, #8	)
+	ext		v11.16b, v11.16b, v11.16b, #8
+	ext		v12.16b, v12.16b, v12.16b, #8
 
 	eor		\reg1\().16b, \reg1\().16b, v8.16b
 	eor		\reg2\().16b, \reg2\().16b, v9.16b
 	eor		\reg1\().16b, \reg1\().16b, v11.16b
 	eor		\reg2\().16b, \reg2\().16b, v12.16b
@@ -218,26 +218,26 @@ CPU_LE(	ext		v12.16b, v12.16b, v12.16b, #8	)
 	ldp		q0, q1, [buf]
 	ldp		q2, q3, [buf, #0x20]
 	ldp		q4, q5, [buf, #0x40]
 	ldp		q6, q7, [buf, #0x60]
 	add		buf, buf, #0x80
-CPU_LE(	rev64		v0.16b, v0.16b			)
-CPU_LE(	rev64		v1.16b, v1.16b			)
-CPU_LE(	rev64		v2.16b, v2.16b			)
-CPU_LE(	rev64		v3.16b, v3.16b			)
-CPU_LE(	rev64		v4.16b, v4.16b			)
-CPU_LE(	rev64		v5.16b, v5.16b			)
-CPU_LE(	rev64		v6.16b, v6.16b			)
-CPU_LE(	rev64		v7.16b, v7.16b			)
-CPU_LE(	ext		v0.16b, v0.16b, v0.16b, #8	)
-CPU_LE(	ext		v1.16b, v1.16b, v1.16b, #8	)
-CPU_LE(	ext		v2.16b, v2.16b, v2.16b, #8	)
-CPU_LE(	ext		v3.16b, v3.16b, v3.16b, #8	)
-CPU_LE(	ext		v4.16b, v4.16b, v4.16b, #8	)
-CPU_LE(	ext		v5.16b, v5.16b, v5.16b, #8	)
-CPU_LE(	ext		v6.16b, v6.16b, v6.16b, #8	)
-CPU_LE(	ext		v7.16b, v7.16b, v7.16b, #8	)
+	rev64		v0.16b, v0.16b
+	rev64		v1.16b, v1.16b
+	rev64		v2.16b, v2.16b
+	rev64		v3.16b, v3.16b
+	rev64		v4.16b, v4.16b
+	rev64		v5.16b, v5.16b
+	rev64		v6.16b, v6.16b
+	rev64		v7.16b, v7.16b
+	ext		v0.16b, v0.16b, v0.16b, #8
+	ext		v1.16b, v1.16b, v1.16b, #8
+	ext		v2.16b, v2.16b, v2.16b, #8
+	ext		v3.16b, v3.16b, v3.16b, #8
+	ext		v4.16b, v4.16b, v4.16b, #8
+	ext		v5.16b, v5.16b, v5.16b, #8
+	ext		v6.16b, v6.16b, v6.16b, #8
+	ext		v7.16b, v7.16b, v7.16b, #8
 
 	// XOR the first 16 data *bits* with the initial CRC value.
 	movi		v8.16b, #0
 	mov		v8.h[7], init_crc
 	eor		v0.16b, v0.16b, v8.16b
@@ -286,12 +286,12 @@ CPU_LE(	ext		v7.16b, v7.16b, v7.16b, #8	)
 	b.lt		.Lfold_16_bytes_loop_done_\@
 .Lfold_16_bytes_loop_\@:
 	pmull16x64_\p	fold_consts, v7, v8
 	eor		v7.16b, v7.16b, v8.16b
 	ldr		q0, [buf], #16
-CPU_LE(	rev64		v0.16b, v0.16b			)
-CPU_LE(	ext		v0.16b, v0.16b, v0.16b, #8	)
+	rev64		v0.16b, v0.16b
+	ext		v0.16b, v0.16b, v0.16b, #8
 	eor		v7.16b, v7.16b, v0.16b
 	subs		len, len, #16
 	b.ge		.Lfold_16_bytes_loop_\@
 
 .Lfold_16_bytes_loop_done_\@:
@@ -308,12 +308,12 @@ CPU_LE(	ext		v0.16b, v0.16b, v0.16b, #8	)
 	// chunk of 16 bytes, then fold the first chunk into the second.
 
 	// v0 = last 16 original data bytes
 	add		buf, buf, len
 	ldr		q0, [buf, #-16]
-CPU_LE(	rev64		v0.16b, v0.16b			)
-CPU_LE(	ext		v0.16b, v0.16b, v0.16b, #8	)
+	rev64		v0.16b, v0.16b
+	ext		v0.16b, v0.16b, v0.16b, #8
 
 	// v1 = high order part of second chunk: v7 left-shifted by 'len' bytes.
 	adr_l		x4, .Lbyteshift_table + 16
 	sub		x4, x4, len
 	ld1		{v2.16b}, [x4]
@@ -342,12 +342,12 @@ CPU_LE(	ext		v0.16b, v0.16b, v0.16b, #8	)
 
 	adr_l		fold_consts_ptr, .Lfold_across_16_bytes_consts
 
 	// Load the first 16 data bytes.
 	ldr		q7, [buf], #0x10
-CPU_LE(	rev64		v7.16b, v7.16b			)
-CPU_LE(	ext		v7.16b, v7.16b, v7.16b, #8	)
+	rev64		v7.16b, v7.16b
+	ext		v7.16b, v7.16b, v7.16b, #8
 
 	// XOR the first 16 data *bits* with the initial CRC value.
 	movi		v0.16b, #0
 	mov		v0.h[7], init_crc
 	eor		v7.16b, v7.16b, v0.16b
@@ -380,12 +380,12 @@ SYM_FUNC_START(crc_t10dif_pmull_p8)
 	zip1		perm.16b, perm.16b, perm.16b
 	zip1		perm.16b, perm.16b, perm.16b
 
 	crc_t10dif_pmull p8
 
-CPU_LE(	rev64		v7.16b, v7.16b			)
-CPU_LE(	ext		v7.16b, v7.16b, v7.16b, #8	)
+	rev64		v7.16b, v7.16b
+	ext		v7.16b, v7.16b, v7.16b, #8
 	str		q7, [x3]
 
 	frame_pop
 	ret
 SYM_FUNC_END(crc_t10dif_pmull_p8)
diff --git a/lib/crc/arm64/crc32-core.S b/lib/crc/arm64/crc32-core.S
index 68825317460fc..49d02cc485b3e 100644
--- a/lib/crc/arm64/crc32-core.S
+++ b/lib/crc/arm64/crc32-core.S
@@ -27,28 +27,23 @@
 	rbit		\reg, \reg
 	lsr		\reg, \reg, #24
 	.endm
 
 	.macro		hwordle, reg
-CPU_BE(	rev16		\reg, \reg	)
 	.endm
 
 	.macro		hwordbe, reg
-CPU_LE(	rev		\reg, \reg	)
+	rev		\reg, \reg
 	rbit		\reg, \reg
-CPU_BE(	lsr		\reg, \reg, #16	)
 	.endm
 
 	.macro		le, regs:vararg
-	.irp		r, \regs
-CPU_BE(	rev		\r, \r		)
-	.endr
 	.endm
 
 	.macro		be, regs:vararg
 	.irp		r, \regs
-CPU_LE(	rev		\r, \r		)
+	rev		\r, \r
 	.endr
 	.irp		r, \regs
 	rbit		\r, \r
 	.endr
 	.endm

base-commit: 63432fd625372a0e79fb00a4009af204f4edc013
-- 
2.53.0


