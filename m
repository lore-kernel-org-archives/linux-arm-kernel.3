Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85330C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BX2UaWCHKnZlnRlGbciXGlVJIQ6Ou97PMfyffmMqTaI=; b=ek6qSDIhE67l0X/moXrxOvcWL4
	0OWLLWQyFjaueft5Z+FSM276bTBjx3kNjKxND2Lmt3y/hPoHCT9mfyshnmq1D9i5lfiaezAQHHfBL
	uq/VPzbVWx3jWrPKmya5h0H4ZsT86NQvy96jcumZ7UyrsKXwOH90xAIdyNMu4O1nfD/CigKx/HlZs
	vUEvnGdP87fxTrLlTom18PoABSQoqeRfi3ppqeInIgM9qlEkG8Y4f27xCLnDYsaEuOPosH2aOU+vp
	Py+qlJuoal0S9pf4RGBuFMMaHu0BQsjGSSdplA+3/B/hdcum+BAojyldlHxJxm2Pmgv34dUh8HcxW
	Kr7EkRGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPNE-00000000DKR-2zpP;
	Thu, 16 Jul 2026 16:55:48 +0000
Received: from latitanza.investici.org ([185.218.207.228])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPNB-00000000DJn-2WGk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1784220939;
	bh=BX2UaWCHKnZlnRlGbciXGlVJIQ6Ou97PMfyffmMqTaI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=c+Uw6flDgEdX81nuFbZo7jhYPItSVzJoaD9lFGwMXKbW0Vmuo8Za8RKf0guBLC0zm
	 SujJcU/Qmu6Nt6KJaR0c6wUtuabT/DpYfA5g2dtm58HLCGD3ndTinQor1EHALDNB2z
	 TAcF0YQ/ojyg4zz7yM9/TqmHjioR2+87EvVvmOe8=
Received: from mx3.investici.org (unknown [127.0.0.1])
	by latitanza.investici.org (Postfix) with ESMTP id 4h1K170g5gzGpMM;
	Thu, 16 Jul 2026 16:55:39 +0000 (UTC)
Received: by mx3.investici.org (Postfix) id 4h1K163LYSzGpM9;
	Thu, 16 Jul 2026 16:55:38 +0000 (UTC)
Date: Thu, 16 Jul 2026 17:55:38 +0100
From: Bradley Morgan <include@grrlz.net>
To: Will Deacon <will@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: sleep: dedup the sleep_save_stash slot lookup
In-Reply-To: <aljsRBIEzeNVdzvn@willie-the-truck>
References: <20260705192331.23150-1-include@grrlz.net> <20260705192331.23150-3-include@grrlz.net> <aljsRBIEzeNVdzvn@willie-the-truck>
Message-ID: <EFA466A8-F9E9-422D-B10D-BC1B324050AC@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_095545_807095_E2B1E8CE 
X-CRM114-Status: GOOD (  21.78  )
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

On July 16, 2026 3:35:48 PM GMT+01:00, Will Deacon <will@kernel.org> wrote:
>On Sun, Jul 05, 2026 at 07:23:31PM +0000, Bradley Morgan wrote:
>> Both __cpu_suspend_enter() and _cpu_resume() open code the same MPIDR
>> hash lookup. Factor it into a get_sleep_stash_slot macro.
>> 
>> Signed-off-by: Bradley Morgan <include@grrlz.net>
>> ---
>>  arch/arm64/kernel/sleep.S | 55 +++++++++++++++++++++------------------
>>  1 file changed, 30 insertions(+), 25 deletions(-)
>> 
>> diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
>> index e112b8537f10..8820a131aef7 100644
>> --- a/arch/arm64/kernel/sleep.S
>> +++ b/arch/arm64/kernel/sleep.S
>> @@ -64,6 +64,31 @@
>>  	lsr	\mask ,\mask, \rs3
>>  	orr	\dst, \dst, \mask		// dst|=(aff3>>rs3)
>>  	.endm
>> +
>> +/*
>> + * Compute the address of the current CPU's entry in sleep_save_stash,
>> + * i.e. &sleep_save_stash[hash(MPIDR_EL1)].
>> + *
>> + * @slot: output register
>> + *
>> + * Clobbers: x2 - x8
>> + */
>> +	.macro get_sleep_stash_slot slot
>> +	mpidr_hash_assert_distinct \slot, x2
>> +	mrs	x3, mpidr_el1
>> +	adr_l	x2, mpidr_hash
>> +	ldr	x8, [x2, #MPIDR_HASH_MASK]
>> +	/*
>> +	 * Following code relies on the struct mpidr_hash
>> +	 * members size.
>> +	 */
>> +	ldp	w4, w5, [x2, #MPIDR_HASH_SHIFTS]
>> +	ldp	w6, w7, [x2, #(MPIDR_HASH_SHIFTS + 8)]
>> +	compute_mpidr_hash x2, x4, x5, x6, x7, x3, x8
>> +	ldr_l	\slot, sleep_save_stash
>> +	add	\slot, \slot, x2, lsl #3
>> +	.endm
>
>I think this would now be the only user of compute_mpidr_hash, so it's
>probably better to inline that macro here and then we don't need to
>bother with mpidr_hash_assert_distinct at all (i.e. your first patch
>isn't needed).
>
>Will
>


Will! What do you think of this?

Subject: [PATCH v2] arm64: suspend: factor sleep_save_stash slot lookup into a macro

Both __cpu_suspend_enter() and _cpu_resume() open code the same
MPIDR_EL1 hash lookup to find the current CPU's slot in
sleep_save_stash. Let's just factor it into a get_sleep_stash_slot macro.

Since that macro would be the only remaining user of
compute_mpidr_hash, inline the hash computation into
get_sleep_stash_slot and remove compute_mpidr_hash altogether.

No functional change intended.

Signed-off-by: Bradley Morgan <include@grrlz.net>
---
Changes in v2 (suggested by Will):
 - inline compute_mpidr_hash into get_sleep_stash_slot and drop it
 - drop former patch 1, it's not needed.

 arch/arm64/kernel/sleep.S | 62 +++++++++++++--------------------   1 file changed, 41 insertions(+), 62 deletions(-)

--- a/arch/arm64/kernel/sleep.S
+++ b/arch/arm64/kernel/sleep.S
@@ -7,48 +7,48 @@

        .text                                                       /*
- * Implementation of MPIDR_EL1 hash algorithm through shifting
+ * Compute the address of the current CPU's entry in sleep_save_stash,
+ * i.e. &sleep_save_stash[hash(MPIDR_EL1)], where the hash is an
+ * implementation of the MPIDR_EL1 hash algorithm through shifting
  * and OR'ing.
  *
- * @dst: register containing hash result
- * @rs0: register containing affinity level 0 bit shift
- * @rs1: register containing affinity level 1 bit shift
- * @rs2: register containing affinity level 2 bit shift           - * @rs3: register containing affinity level 3 bit shift
- * @mpidr: register containing MPIDR_EL1 value                    - * @mask: register containing MPIDR mask                          - *
  * Pseudo C-code:                                                   *
- *u32 dst;
+ *     u64 mpidr = MPIDR_EL1 & mpidr_hash.mask;                   + *     u32 hash = ((mpidr & 0xff) >> mpidr_hash.shift_aff[0]) |   + *                ((mpidr & 0xff00) >> mpidr_hash.shift_aff[1]) | + *                ((mpidr & 0xff0000) >> mpidr_hash.shift_aff[2]) |                                                                  + *                ((mpidr & 0xff00000000) >> mpidr_hash.shift_aff[3]);                                                               + *     slot = &sleep_save_stash[hash];
+ *
+ * @slot: output register
  *
- *compute_mpidr_hash(u32 rs0, u32 rs1, u32 rs2, u32 rs3, u64 mpidr, u64 mask) {                                                      - *     u32 aff0, aff1, aff2, aff3;                                - *     u64 mpidr_masked = mpidr & mask;                           - *     aff0 = mpidr_masked & 0xff;
- *     aff1 = mpidr_masked & 0xff00;
- *     aff2 = mpidr_masked & 0xff0000;
- *     aff3 = mpidr_masked & 0xff00000000;                        - *     dst = (aff0 >> rs0 | aff1 >> rs1 | aff2 >> rs2 | aff3 >> rs3);
- *}
- * Input registers: rs0, rs1, rs2, rs3, mpidr, mask
- * Output register: dst
- * Note: input and output registers must be disjoint register sets
-         (eg: a macro instance with mpidr = x1 and dst = x1 is invalid)
+ * Clobbers: x2 - x8
  */                                                               -       .macro compute_mpidr_hash dst, rs0, rs1, rs2, rs3, mpidr, mask
-       and     \mpidr, \mpidr, \mask           // mask out MPIDR bits
-       and     \dst, \mpidr, #0xff             // mask=aff0
-       lsr     \dst ,\dst, \rs0                // dst=aff0>>rs0
-       and     \mask, \mpidr, #0xff00          // mask = aff1     -       lsr     \mask ,\mask, \rs1
-       orr     \dst, \dst, \mask               // dst|=(aff1>>rs1)
-       and     \mask, \mpidr, #0xff0000        // mask = aff2
-       lsr     \mask ,\mask, \rs2
-       orr     \dst, \dst, \mask               // dst|=(aff2>>rs2)
-       and     \mask, \mpidr, #0xff00000000    // mask = aff3
-       lsr     \mask ,\mask, \rs3
-       orr     \dst, \dst, \mask               // dst|=(aff3>>rs3)
+       .macro get_sleep_stash_slot slot
+       mrs     x3, mpidr_el1
+       adr_l   x2, mpidr_hash
+       ldr     x8, [x2, #MPIDR_HASH_MASK]
+       /*
+        * Following code relies on the struct mpidr_hash
+        * members size.
+        */
+       ldp     w4, w5, [x2, #MPIDR_HASH_SHIFTS]
+       ldp     w6, w7, [x2, #(MPIDR_HASH_SHIFTS + 8)]
+       and     x3, x3, x8                      // mask out MPIDR bits
+       and     x2, x3, #0xff                   // aff0
+       lsr     x2, x2, x4                      // hash = aff0 >> rs0
+       and     x8, x3, #0xff00                 // aff1
+       lsr     x8, x8, x5
+       orr     x2, x2, x8                      // hash |= aff1 >> rs1                                                                +       and     x8, x3, #0xff0000               // aff2
+       lsr     x8, x8, x6
+       orr     x2, x2, x8                      // hash |= aff2 >> rs2
+       and     x8, x3, #0xff00000000           // aff3
+       lsr     x8, x8, x7
+       orr     x2, x2, x8                      // hash |= aff3 >> rs3                                                                +       ldr_l   \slot, sleep_save_stash
+       add     \slot, \slot, x2, lsl #3        // slot = &sleep_save_stash[hash]                                                             .endm
 /*
  * Save CPU state in the provided sleep_stack_data area, and publish its                                                             @@ -74,20 +74,8 @@
        mov     x2, sp
        str     x2, [x0, #SLEEP_STACK_DATA_SYSTEM_REGS + CPU_CTX_SP]

-       /* find the mpidr_hash */
-       ldr_l   x1, sleep_save_stash
-       mrs     x7, mpidr_el1
-       adr_l   x9, mpidr_hash
-       ldr     x10, [x9, #MPIDR_HASH_MASK]
-       /*                                                         -        * Following code relies on the struct mpidr_hash
-        * members size.
-        */
-       ldp     w3, w4, [x9, #MPIDR_HASH_SHIFTS]                   -       ldp     w5, w6, [x9, #(MPIDR_HASH_SHIFTS + 8)]
-       compute_mpidr_hash x8, x3, x4, x5, x6, x7, x10
-       add     x1, x1, x8, lsl #3                                 -
+       /* publish this CPU's sleep_stack_data area in its stash slot */
+       get_sleep_stash_slot x1
        str     x0, [x1]
        add     x0, x0, #SLEEP_STACK_DATA_SYSTEM_REGS
        stp     x29, lr, [sp, #-16]!
@@ -117,18 +105,9 @@
        mov     x0, x19
        bl      finalise_el2

-       mrs     x1, mpidr_el1                                      -       adr_l   x8, mpidr_hash          // x8 = struct mpidr_hash virt address                                                        -
-       /* retrieve mpidr_hash members to compute the hash */
-       ldr     x2, [x8, #MPIDR_HASH_MASK]                         -       ldp     w3, w4, [x8, #MPIDR_HASH_SHIFTS]
-       ldp     w5, w6, [x8, #(MPIDR_HASH_SHIFTS + 8)]
-       compute_mpidr_hash x7, x3, x4, x5, x6, x1, x2
-
-       /* x7 contains hash index, let's use it to grab context pointer */
-       ldr_l   x0, sleep_save_stash
-       ldr     x0, [x0, x7, lsl #3]                               +       /* retrieve this CPU's context pointer from its stash slot */
+       get_sleep_stash_slot x1
+       ldr     x0, [x1]
        add     x29, x0, #SLEEP_STACK_DATA_CALLEE_REGS
        add     x0, x0, #SLEEP_STACK_DATA_SYSTEM_REGS
        /* load sp from context */
--
2.53.0

Thanks!

