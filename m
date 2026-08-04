Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B36C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zwuypOHj/Ii0XRBdXzwDpzD6vf01Tj0qT2kfSwm8UeY=; b=weibSJ5aMcfPVnk2KinPjaA6xR
	8wJ7GtZlUxf/v7dUhFX7SODXpBJM2VtC7tku6iSONbNBzQ/vPL5GcUZvrvMYM1zbdd2YSvpGyVJ8y
	9x4hiZhVaEb9OQsgzr4ljOHBrtR5GbHB4QgcBp2VCLGJpn5IOQRfEX1kRmKWivdM2CyjPbqtlL62M
	u0RhedmzgzXvYCGVixoEYRfigSS0ue8Uh08V6Vdw/AlxYnPDqGXpkVPxR2ow+SSX+rYBqFfqbvvk4
	CGTUCgMPUFkpdBOtEaJxs9rW4enVFBIE5IO5fxouOOdy0veBbLQe35rXJ+XtR+atypk+HVhzk1SoY
	7dpoMBFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGEo-000000025nd-02f0;
	Tue, 04 Aug 2026 14:35:26 +0000
Received: from confino.investici.org ([93.190.126.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGEl-000000025nA-0BeJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1785854117;
	bh=zwuypOHj/Ii0XRBdXzwDpzD6vf01Tj0qT2kfSwm8UeY=;
	h=From:To:Subject:Date:From;
	b=YEEzrawwd0190siVUD+VAfflk4+sCnTZGP501DJarf8mFBAoaBaI4YTAgF/COYz0T
	 y8iOgMB4FNDw1RYHXPG49WbcynAYFcvwRyUzotFlgbSbLX18XlR03sPfrGvZIeUjQr
	 /DpB2nde/XLy6XsFlBFB08ZrHFjQjrYYQiYa0vrk=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with UTF8SMTP id 4hDx0P60SGz12Rn;
	Tue, 04 Aug 2026 14:35:17 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4hDx0P2q8Vz12Rl;
	Tue, 04 Aug 2026 14:35:17 +0000 (UTC)
From: Bradley Morgan <include@grrlz.net>
To: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: sleep: factor sleep_save_stash slot lookup into a macro
Date: Tue,  4 Aug 2026 14:35:17 +0000
Message-ID: <20260804143517.17524-1-include@grrlz.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_073523_240226_3CD1E2E7 
X-CRM114-Status: GOOD (  15.86  )
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

Both __cpu_suspend_enter() and _cpu_resume() open code the same
MPIDR_EL1 hash lookup to find the current CPU's slot in
sleep_save_stash. Factor it into a get_sleep_stash_slot
macro.

Since that macro would be the only remaining user of
compute_mpidr_hash, inline the hash computation into
get_sleep_stash_slot and just remove compute_mpidr_hash
altogether.

No functional change intended.

Signed-off-by: Bradley Morgan <include@grrlz.net>
---
Changes since V2:
- Drop the stale rs0-rs3 names from the comments, the shifts
  now come from mpidr_hash.shift_aff. (Will)

Changes since V1:
- Inline the macro, there only is one user. (Will)
- Also change the C pseudocode to be correct

 arch/arm64/kernel/sleep.S | 103 +++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 62 deletions(-)

diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
index f093cdf71be1..c1bec489ea76 100644
--- a/arch/arm64/kernel/sleep.S
+++ b/arch/arm64/kernel/sleep.S
@@ -7,48 +7,48 @@
 
 	.text
 /*
- * Implementation of MPIDR_EL1 hash algorithm through shifting
+ * Compute the address of the current CPU's entry in sleep_save_stash,
+ * i.e. &sleep_save_stash[hash(MPIDR_EL1)], where the hash is an
+ * implementation of the MPIDR_EL1 hash algorithm through shifting
  * and OR'ing.
  *
- * @dst: register containing hash result
- * @rs0: register containing affinity level 0 bit shift
- * @rs1: register containing affinity level 1 bit shift
- * @rs2: register containing affinity level 2 bit shift
- * @rs3: register containing affinity level 3 bit shift
- * @mpidr: register containing MPIDR_EL1 value
- * @mask: register containing MPIDR mask
- *
  * Pseudo C-code:
  *
- *u32 dst;
+ *	u64 mpidr = MPIDR_EL1 & mpidr_hash.mask;
+ *	u32 hash = ((mpidr & 0xff) >> mpidr_hash.shift_aff[0]) |
+ *		   ((mpidr & 0xff00) >> mpidr_hash.shift_aff[1]) |
+ *		   ((mpidr & 0xff0000) >> mpidr_hash.shift_aff[2]) |
+ *		   ((mpidr & 0xff00000000) >> mpidr_hash.shift_aff[3]);
+ *	slot = &sleep_save_stash[hash];
+ *
+ * @slot: output register
  *
- *compute_mpidr_hash(u32 rs0, u32 rs1, u32 rs2, u32 rs3, u64 mpidr, u64 mask) {
- *	u32 aff0, aff1, aff2, aff3;
- *	u64 mpidr_masked = mpidr & mask;
- *	aff0 = mpidr_masked & 0xff;
- *	aff1 = mpidr_masked & 0xff00;
- *	aff2 = mpidr_masked & 0xff0000;
- *	aff3 = mpidr_masked & 0xff00000000;
- *	dst = (aff0 >> rs0 | aff1 >> rs1 | aff2 >> rs2 | aff3 >> rs3);
- *}
- * Input registers: rs0, rs1, rs2, rs3, mpidr, mask
- * Output register: dst
- * Note: input and output registers must be disjoint register sets
-         (eg: a macro instance with mpidr = x1 and dst = x1 is invalid)
+ * Clobbers: x2 - x8
  */
-	.macro compute_mpidr_hash dst, rs0, rs1, rs2, rs3, mpidr, mask
-	and	\mpidr, \mpidr, \mask		// mask out MPIDR bits
-	and	\dst, \mpidr, #0xff		// mask=aff0
-	lsr	\dst ,\dst, \rs0		// dst=aff0>>rs0
-	and	\mask, \mpidr, #0xff00		// mask = aff1
-	lsr	\mask ,\mask, \rs1
-	orr	\dst, \dst, \mask		// dst|=(aff1>>rs1)
-	and	\mask, \mpidr, #0xff0000	// mask = aff2
-	lsr	\mask ,\mask, \rs2
-	orr	\dst, \dst, \mask		// dst|=(aff2>>rs2)
-	and	\mask, \mpidr, #0xff00000000	// mask = aff3
-	lsr	\mask ,\mask, \rs3
-	orr	\dst, \dst, \mask		// dst|=(aff3>>rs3)
+	.macro get_sleep_stash_slot slot
+	mrs	x3, mpidr_el1
+	adr_l	x2, mpidr_hash
+	ldr	x8, [x2, #MPIDR_HASH_MASK]
+	/*
+	 * Following code relies on the struct mpidr_hash
+	 * members size.
+	 */
+	ldp	w4, w5, [x2, #MPIDR_HASH_SHIFTS]
+	ldp	w6, w7, [x2, #(MPIDR_HASH_SHIFTS + 8)]
+	and	x3, x3, x8			// mask out MPIDR bits
+	and	x2, x3, #0xff			// aff0
+	lsr	x2, x2, x4			// hash = aff0 >> shift_aff[0]
+	and	x8, x3, #0xff00			// aff1
+	lsr	x8, x8, x5
+	orr	x2, x2, x8			// hash |= aff1 >> shift_aff[1]
+	and	x8, x3, #0xff0000		// aff2
+	lsr	x8, x8, x6
+	orr	x2, x2, x8			// hash |= aff2 >> shift_aff[2]
+	and	x8, x3, #0xff00000000		// aff3
+	lsr	x8, x8, x7
+	orr	x2, x2, x8			// hash |= aff3 >> shift_aff[3]
+	ldr_l	\slot, sleep_save_stash
+	add	\slot, \slot, x2, lsl #3	// slot = &sleep_save_stash[hash]
 	.endm
 /*
  * Save CPU state in the provided sleep_stack_data area, and publish its
@@ -74,20 +74,8 @@ SYM_FUNC_START(__cpu_suspend_enter)
 	mov	x2, sp
 	str	x2, [x0, #SLEEP_STACK_DATA_SYSTEM_REGS + CPU_CTX_SP]
 
-	/* find the mpidr_hash */
-	ldr_l	x1, sleep_save_stash
-	mrs	x7, mpidr_el1
-	adr_l	x9, mpidr_hash
-	ldr	x10, [x9, #MPIDR_HASH_MASK]
-	/*
-	 * Following code relies on the struct mpidr_hash
-	 * members size.
-	 */
-	ldp	w3, w4, [x9, #MPIDR_HASH_SHIFTS]
-	ldp	w5, w6, [x9, #(MPIDR_HASH_SHIFTS + 8)]
-	compute_mpidr_hash x8, x3, x4, x5, x6, x7, x10
-	add	x1, x1, x8, lsl #3
-
+	/* publish this CPU's sleep_stack_data area in its stash slot */
+	get_sleep_stash_slot x1
 	str	x0, [x1]
 	add	x0, x0, #SLEEP_STACK_DATA_SYSTEM_REGS
 	stp	x29, lr, [sp, #-16]!
@@ -117,18 +105,9 @@ SYM_FUNC_START(_cpu_resume)
 	mov	x0, x19
 	bl	finalise_el2
 
-	mrs	x1, mpidr_el1
-	adr_l	x8, mpidr_hash		// x8 = struct mpidr_hash virt address
-
-	/* retrieve mpidr_hash members to compute the hash */
-	ldr	x2, [x8, #MPIDR_HASH_MASK]
-	ldp	w3, w4, [x8, #MPIDR_HASH_SHIFTS]
-	ldp	w5, w6, [x8, #(MPIDR_HASH_SHIFTS + 8)]
-	compute_mpidr_hash x7, x3, x4, x5, x6, x1, x2
-
-	/* x7 contains hash index, let's use it to grab context pointer */
-	ldr_l	x0, sleep_save_stash
-	ldr	x0, [x0, x7, lsl #3]
+	/* retrieve this CPU's context pointer from its stash slot */
+	get_sleep_stash_slot x1
+	ldr	x0, [x1]
 	add	x29, x0, #SLEEP_STACK_DATA_CALLEE_REGS
 	add	x0, x0, #SLEEP_STACK_DATA_SYSTEM_REGS
 	/* load sp from context */
-- 
2.47.3


