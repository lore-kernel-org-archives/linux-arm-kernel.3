Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FB8F89244
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCLzvcqIk1v8nUUbR/XSXyTRleQW2vhxIqsURb8UTik=; b=Be5+lGWUPC3ML31aCL9DsMnvdQ
	xVTdJ9l0uMB4DCl4kdPLf37p+f6WbDqDMiY0/ibNxfEvRKfS0k9MX+8C+VPX2azy3vL63WxRJVPCq
	xP63uo8sfzRfzD9HtcJ5I/FLociTYgLTPe2ZrM+Y+nMBlro4yT049Fr3qLpUUtrIwhFrwYHoxJB1N
	uklyfezoSn7WiSCH/LzJ+UYOqZIZuSCMLQAG2MAUeyBp7z1+0gmAxsrIIMW8WzqpxJXgjmwTPxcUS
	pSoIdrhRftGeHhKcfsj6tnRszVEUJi+dqKpUKu19Q/78VZS1E/Kp7eCCGPF4vzc4yC+h6ujdUZPlH
	DmbxMunw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7uR-00000008OE9-0FUI;
	Tue, 21 Apr 2026 10:00:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7uK-00000008O9k-2VXG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Apr 2026 10:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KCLzvcqIk1v8nUUbR/XSXyTRleQW2vhxIqsURb8UTik=; b=jJTwEht5AMIiATC8jJrGeqAi+e
	B49FaS7TeJC5mVD1w4EsD2rv3VxBMUDpG+DAKccfXzkR05O7mY1eKEsSf24r8zYelP9eUPl+Q9h5F
	j8yJXMJa21gtNP8zXVv+RN+iry+uvAVwfdQU/yQJZSeKnKEu/6qAsh6W+Nopwn8w4+s/Iz1tYTte8
	KOU9yoYqTX/T3yIavxR1jECDfJdvdA5ak/OVMi38Kpif5fNMXO2frLg4PNmhL3YsN29TeNIcGFIhq
	GpNYqLUnZb5rw5NQnK6bULc9RLZ9cbtO/IPX1GngG1tnpKqFO3fnBkASHI0ru/0UzZ5kHLeqfUs1y
	Uv+3HgdA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7u8-00000009XLs-1epS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:00:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB5FE2F7E;
	Tue, 21 Apr 2026 03:00:20 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.57.89.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8340D3FBCB;
	Tue, 21 Apr 2026 03:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776765626; bh=nflQVaNZHOXoy2iBSaEGg7gQEVLpTOBIgemi44NhKzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aHFxV8sM3ZPqGMCqPAqNoFWFiPhYSIffaaW0YNWYN0+ApzK8qa7MxrzGaXQFcXwIy
	 +K5qAbDLmrTnqDxKHLmID0mMwX0Juh5D7cGjX5xujStvgifuH7rtpu60rTGypmtUVD
	 KUIue0/kmYUdMUBu+u/YEUF+ezxV2OLTr91VebeY=
From: Catalin Marinas <catalin.marinas@arm.com>
To: stable@vger.kernel.org
Cc: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6.18.y 2/6] arm64: tlb: Optimize ARM64_WORKAROUND_REPEAT_TLBI
Date: Tue, 21 Apr 2026 11:00:13 +0100
Message-ID: <20260421100018.335793-3-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260421100018.335793-1-catalin.marinas@arm.com>
References: <20260421100018.335793-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_110028_978098_1AA9986D 
X-CRM114-Status: GOOD (  25.37  )
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

From: Mark Rutland <mark.rutland@arm.com>

commit a8f78680ee6bf795086384e8aea159a52814f827 upstream.

The ARM64_WORKAROUND_REPEAT_TLBI workaround is used to mitigate several
errata where broadcast TLBI;DSB sequences don't provide all the
architecturally required synchronization. The workaround performs more
work than necessary, and can have significant overhead. This patch
optimizes the workaround, as explained below.

The workaround was originally added for Qualcomm Falkor erratum 1009 in
commit:

  d9ff80f83ecb ("arm64: Work around Falkor erratum 1009")

As noted in the message for that commit, the workaround is applied even
in cases where it is not strictly necessary.

The workaround was later reused without changes for:

* Arm Cortex-A76 erratum #1286807
  SDEN v33: https://developer.arm.com/documentation/SDEN-885749/33-0/

* Arm Cortex-A55 erratum #2441007
  SDEN v16: https://developer.arm.com/documentation/SDEN-859338/1600/

* Arm Cortex-A510 erratum #2441009
  SDEN v19: https://developer.arm.com/documentation/SDEN-1873351/1900/

The important details to note are as follows:

1. All relevant errata only affect the ordering and/or completion of
   memory accesses which have been translated by an invalidated TLB
   entry. The actual invalidation of TLB entries is unaffected.

2. The existing workaround is applied to both broadcast and local TLB
   invalidation, whereas for all relevant errata it is only necessary to
   apply a workaround for broadcast invalidation.

3. The existing workaround replaces every TLBI with a TLBI;DSB;TLBI
   sequence, whereas for all relevant errata it is only necessary to
   execute a single additional TLBI;DSB sequence after any number of
   TLBIs are completed by a DSB.

   For example, for a sequence of batched TLBIs:

       TLBI <op1>[, <arg1>]
       TLBI <op2>[, <arg2>]
       TLBI <op3>[, <arg3>]
       DSB ISH

   ... the existing workaround will expand this to:

       TLBI <op1>[, <arg1>]
       DSB ISH                  // additional
       TLBI <op1>[, <arg1>]     // additional
       TLBI <op2>[, <arg2>]
       DSB ISH                  // additional
       TLBI <op2>[, <arg2>]     // additional
       TLBI <op3>[, <arg3>]
       DSB ISH                  // additional
       TLBI <op3>[, <arg3>]     // additional
       DSB ISH

   ... whereas it is sufficient to have:

       TLBI <op1>[, <arg1>]
       TLBI <op2>[, <arg2>]
       TLBI <op3>[, <arg3>]
       DSB ISH
       TLBI <opX>[, <argX>]     // additional
       DSB ISH                  // additional

   Using a single additional TBLI and DSB at the end of the sequence can
   have significantly lower overhead as each DSB which completes a TLBI
   must synchronize with other PEs in the system, with potential
   performance effects both locally and system-wide.

4. The existing workaround repeats each specific TLBI operation, whereas
   for all relevant errata it is sufficient for the additional TLBI to
   use *any* operation which will be broadcast, regardless of which
   translation regime or stage of translation the operation applies to.

   For example, for a single TLBI:

       TLBI ALLE2IS
       DSB ISH

   ... the existing workaround will expand this to:

       TLBI ALLE2IS
       DSB ISH
       TLBI ALLE2IS             // additional
       DSB ISH                  // additional

   ... whereas it is sufficient to have:

       TLBI ALLE2IS
       DSB ISH
       TLBI VALE1IS, XZR        // additional
       DSB ISH                  // additional

   As the additional TLBI doesn't have to match a specific earlier TLBI,
   the additional TLBI can be implemented in separate code, with no
   memory of the earlier TLBIs. The additional TLBI can also use a
   cheaper TLBI operation.

5. The existing workaround is applied to both Stage-1 and Stage-2 TLB
   invalidation, whereas for all relevant errata it is only necessary to
   apply a workaround for Stage-1 invalidation.

   Architecturally, TLBI operations which invalidate only Stage-2
   information (e.g. IPAS2E1IS) are not required to invalidate TLB
   entries which combine information from Stage-1 and Stage-2
   translation table entries, and consequently may not complete memory
   accesses translated by those combined entries. In these cases,
   completion of memory accesses is only guaranteed after subsequent
   invalidation of Stage-1 information (e.g. VMALLE1IS).

Taking the above points into account, this patch reworks the workaround
logic to reduce overhead:

* New __tlbi_sync_s1ish() and __tlbi_sync_s1ish_hyp() functions are
  added and used in place of any dsb(ish) which is used to complete
  broadcast Stage-1 TLB maintenance. When the
  ARM64_WORKAROUND_REPEAT_TLBI workaround is enabled, these helpers will
  execute an additional TLBI;DSB sequence.

  For consistency, it might make sense to add __tlbi_sync_*() helpers
  for local and stage 2 maintenance. For now I've left those with
  open-coded dsb() to keep the diff small.

* The duplication of TLBIs in __TLBI_0() and __TLBI_1() is removed. This
  is no longer needed as the necessary synchronization will happen in
  __tlbi_sync_s1ish() or __tlbi_sync_s1ish_hyp().

* The additional TLBI operation is chosen to have minimal impact:

  - __tlbi_sync_s1ish() uses "TLBI VALE1IS, XZR". This is only used at
    EL1 or at EL2 with {E2H,TGE}=={1,1}, where it will target an unused
    entry for the reserved ASID in the kernel's own translation regime,
    and have no adverse affect.

  - __tlbi_sync_s1ish_hyp() uses "TLBI VALE2IS, XZR". This is only used
    in hyp code, where it will target an unused entry in the hyp code's
    TTBR0 mapping, and should have no adverse effect.

* As __TLBI_0() and __TLBI_1() no longer replace each TLBI with a
  TLBI;DSB;TLBI sequence, batching TLBIs is worthwhile, and there's no
  need for arch_tlbbatch_should_defer() to consider
  ARM64_WORKAROUND_REPEAT_TLBI.

When building defconfig with GCC 15.1.0, compared to v6.19-rc1, this
patch saves ~1KiB of text, makes the vmlinux ~42KiB smaller, and makes
the resulting Image 64KiB smaller:

| [mark@lakrids:~/src/linux]% size vmlinux-*
|    text    data     bss     dec     hex filename
| 21179831        19660919         708216 41548966        279fca6 vmlinux-after
| 21181075        19660903         708216 41550194        27a0172 vmlinux-before
| [mark@lakrids:~/src/linux]% ls -l vmlinux-*
| -rwxr-xr-x 1 mark mark 157771472 Feb  4 12:05 vmlinux-after
| -rwxr-xr-x 1 mark mark 157815432 Feb  4 12:05 vmlinux-before
| [mark@lakrids:~/src/linux]% ls -l Image-*
| -rw-r--r-- 1 mark mark 41007616 Feb  4 12:05 Image-after
| -rw-r--r-- 1 mark mark 41073152 Feb  4 12:05 Image-before

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 59 ++++++++++++++++++-------------
 arch/arm64/kernel/sys_compat.c    |  2 +-
 arch/arm64/kvm/hyp/nvhe/mm.c      |  2 +-
 arch/arm64/kvm/hyp/nvhe/tlb.c     |  8 ++---
 arch/arm64/kvm/hyp/pgtable.c      |  2 +-
 arch/arm64/kvm/hyp/vhe/tlb.c      | 10 +++---
 6 files changed, 47 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 0ddb344f83b4..c87d13bee37d 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -31,18 +31,10 @@
  */
 #define __TLBI_0(op, arg) asm (ARM64_ASM_PREAMBLE			       \
 			       "tlbi " #op "\n"				       \
-		   ALTERNATIVE("nop\n			nop",		       \
-			       "dsb ish\n		tlbi " #op,	       \
-			       ARM64_WORKAROUND_REPEAT_TLBI,		       \
-			       CONFIG_ARM64_WORKAROUND_REPEAT_TLBI)	       \
 			    : : )
 
 #define __TLBI_1(op, arg) asm (ARM64_ASM_PREAMBLE			       \
 			       "tlbi " #op ", %x0\n"			       \
-		   ALTERNATIVE("nop\n			nop",		       \
-			       "dsb ish\n		tlbi " #op ", %x0",    \
-			       ARM64_WORKAROUND_REPEAT_TLBI,		       \
-			       CONFIG_ARM64_WORKAROUND_REPEAT_TLBI)	       \
 			    : : "rZ" (arg))
 
 #define __TLBI_N(op, arg, n, ...) __TLBI_##n(op, arg)
@@ -181,6 +173,34 @@ static inline unsigned long get_trans_granule(void)
 		(__pages >> (5 * (scale) + 1)) - 1;			\
 	})
 
+#define __repeat_tlbi_sync(op, arg...)						\
+do {										\
+	if (!alternative_has_cap_unlikely(ARM64_WORKAROUND_REPEAT_TLBI))	\
+		break;								\
+	__tlbi(op, ##arg);							\
+	dsb(ish);								\
+} while (0)
+
+/*
+ * Complete broadcast TLB maintenance issued by the host which invalidates
+ * stage 1 information in the host's own translation regime.
+ */
+static inline void __tlbi_sync_s1ish(void)
+{
+	dsb(ish);
+	__repeat_tlbi_sync(vale1is, 0);
+}
+
+/*
+ * Complete broadcast TLB maintenance issued by hyp code which invalidates
+ * stage 1 translation information in any translation regime.
+ */
+static inline void __tlbi_sync_s1ish_hyp(void)
+{
+	dsb(ish);
+	__repeat_tlbi_sync(vale2is, 0);
+}
+
 /*
  *	TLB Invalidation
  *	================
@@ -266,7 +286,7 @@ static inline void flush_tlb_all(void)
 {
 	dsb(ishst);
 	__tlbi(vmalle1is);
-	dsb(ish);
+	__tlbi_sync_s1ish();
 	isb();
 }
 
@@ -278,7 +298,7 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
 	asid = __TLBI_VADDR(0, ASID(mm));
 	__tlbi(aside1is, asid);
 	__tlbi_user(aside1is, asid);
-	dsb(ish);
+	__tlbi_sync_s1ish();
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
 
@@ -305,20 +325,11 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
 				  unsigned long uaddr)
 {
 	flush_tlb_page_nosync(vma, uaddr);
-	dsb(ish);
+	__tlbi_sync_s1ish();
 }
 
 static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
 {
-	/*
-	 * TLB flush deferral is not required on systems which are affected by
-	 * ARM64_WORKAROUND_REPEAT_TLBI, as __tlbi()/__tlbi_user() implementation
-	 * will have two consecutive TLBI instructions with a dsb(ish) in between
-	 * defeating the purpose (i.e save overall 'dsb ish' cost).
-	 */
-	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_REPEAT_TLBI))
-		return false;
-
 	return true;
 }
 
@@ -334,7 +345,7 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
  */
 static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 {
-	dsb(ish);
+	__tlbi_sync_s1ish();
 }
 
 /*
@@ -469,7 +480,7 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
 {
 	__flush_tlb_range_nosync(vma->vm_mm, start, end, stride,
 				 last_level, tlb_level);
-	dsb(ish);
+	__tlbi_sync_s1ish();
 }
 
 static inline void flush_tlb_range(struct vm_area_struct *vma,
@@ -501,7 +512,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 	dsb(ishst);
 	__flush_tlb_range_op(vaale1is, start, pages, stride, 0,
 			     TLBI_TTL_UNKNOWN, false, lpa2_is_enabled());
-	dsb(ish);
+	__tlbi_sync_s1ish();
 	isb();
 }
 
@@ -515,7 +526,7 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
 
 	dsb(ishst);
 	__tlbi(vaae1is, addr);
-	dsb(ish);
+	__tlbi_sync_s1ish();
 	isb();
 }
 
diff --git a/arch/arm64/kernel/sys_compat.c b/arch/arm64/kernel/sys_compat.c
index 4a609e9b65de..b9d4998c97ef 100644
--- a/arch/arm64/kernel/sys_compat.c
+++ b/arch/arm64/kernel/sys_compat.c
@@ -37,7 +37,7 @@ __do_compat_cache_op(unsigned long start, unsigned long end)
 			 * We pick the reserved-ASID to minimise the impact.
 			 */
 			__tlbi(aside1is, __TLBI_VADDR(0, 0));
-			dsb(ish);
+			__tlbi_sync_s1ish();
 		}
 
 		ret = caches_clean_inval_user_pou(start, start + chunk);
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index ae8391baebc3..218976287d3f 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -271,7 +271,7 @@ static void fixmap_clear_slot(struct hyp_fixmap_slot *slot)
 	 */
 	dsb(ishst);
 	__tlbi_level(vale2is, __TLBI_VADDR(addr, 0), level);
-	dsb(ish);
+	__tlbi_sync_s1ish_hyp();
 	isb();
 }
 
diff --git a/arch/arm64/kvm/hyp/nvhe/tlb.c b/arch/arm64/kvm/hyp/nvhe/tlb.c
index 48da9ca9763f..3dc1ce0d27fe 100644
--- a/arch/arm64/kvm/hyp/nvhe/tlb.c
+++ b/arch/arm64/kvm/hyp/nvhe/tlb.c
@@ -169,7 +169,7 @@ void __kvm_tlb_flush_vmid_ipa(struct kvm_s2_mmu *mmu,
 	 */
 	dsb(ish);
 	__tlbi(vmalle1is);
-	dsb(ish);
+	__tlbi_sync_s1ish_hyp();
 	isb();
 
 	exit_vmid_context(&cxt);
@@ -226,7 +226,7 @@ void __kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
 
 	dsb(ish);
 	__tlbi(vmalle1is);
-	dsb(ish);
+	__tlbi_sync_s1ish_hyp();
 	isb();
 
 	exit_vmid_context(&cxt);
@@ -240,7 +240,7 @@ void __kvm_tlb_flush_vmid(struct kvm_s2_mmu *mmu)
 	enter_vmid_context(mmu, &cxt, false);
 
 	__tlbi(vmalls12e1is);
-	dsb(ish);
+	__tlbi_sync_s1ish_hyp();
 	isb();
 
 	exit_vmid_context(&cxt);
@@ -266,5 +266,5 @@ void __kvm_flush_vm_context(void)
 	/* Same remark as in enter_vmid_context() */
 	dsb(ish);
 	__tlbi(alle1is);
-	dsb(ish);
+	__tlbi_sync_s1ish_hyp();
 }
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index c351b4abd5db..cbf8cd2e1673 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -483,7 +483,7 @@ static int hyp_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 		*unmapped += granule;
 	}
 
-	dsb(ish);
+	__tlbi_sync_s1ish_hyp();
 	isb();
 	mm_ops->put_page(ctx->ptep);
 
diff --git a/arch/arm64/kvm/hyp/vhe/tlb.c b/arch/arm64/kvm/hyp/vhe/tlb.c
index ec2569818629..35855dadfb1b 100644
--- a/arch/arm64/kvm/hyp/vhe/tlb.c
+++ b/arch/arm64/kvm/hyp/vhe/tlb.c
@@ -115,7 +115,7 @@ void __kvm_tlb_flush_vmid_ipa(struct kvm_s2_mmu *mmu,
 	 */
 	dsb(ish);
 	__tlbi(vmalle1is);
-	dsb(ish);
+	__tlbi_sync_s1ish_hyp();
 	isb();
 
 	exit_vmid_context(&cxt);
@@ -176,7 +176,7 @@ void __kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
 
 	dsb(ish);
 	__tlbi(vmalle1is);
-	dsb(ish);
+	__tlbi_sync_s1ish_hyp();
 	isb();
 
 	exit_vmid_context(&cxt);
@@ -192,7 +192,7 @@ void __kvm_tlb_flush_vmid(struct kvm_s2_mmu *mmu)
 	enter_vmid_context(mmu, &cxt);
 
 	__tlbi(vmalls12e1is);
-	dsb(ish);
+	__tlbi_sync_s1ish_hyp();
 	isb();
 
 	exit_vmid_context(&cxt);
@@ -217,7 +217,7 @@ void __kvm_flush_vm_context(void)
 {
 	dsb(ishst);
 	__tlbi(alle1is);
-	dsb(ish);
+	__tlbi_sync_s1ish_hyp();
 }
 
 /*
@@ -358,7 +358,7 @@ int __kvm_tlbi_s1e2(struct kvm_s2_mmu *mmu, u64 va, u64 sys_encoding)
 	default:
 		ret = -EINVAL;
 	}
-	dsb(ish);
+	__tlbi_sync_s1ish_hyp();
 	isb();
 
 	if (mmu)

