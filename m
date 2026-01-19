Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3C9D29C53
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hp+K2+1QjkV/oCCB+1YPOC4BtNKHhEq8hwJbSPeRP2U=; b=Eh0NEaa0Qwrq3NUu7hq4rjcrqJ
	aQF2NS4FD7frIsNixNfTO5/fQm62yvQgZBphjdCAKGG1+OAP45NmfJ0qzf1V12fy1bCjNKthjW/pk
	6zfzlmE5bd+5APE+94JmwuDZewz5kKnBpDNuaRU0SRp9KiiJQ/oHNCUBDSLJ/L7wbIjhBpPQdhFLJ
	oX+S2wpWCyDEiJ/ZNX4vveeV5BbxMSpIXArM1NU8QvUf7W5BzmUQGC6ot1cOqXwjTORoCZKqWW9uc
	S4iFp/+6sHHosm8vous8DyI2ZfunG9ETqTbhuwrnPTtYslJHFpym4YSayb+Rro2NkYc3V9mDQqMN7
	b9k29O8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsxP-00000002cct-3CSl;
	Mon, 19 Jan 2026 17:22:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsxI-00000002cZK-35Qq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:22:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD0AA1517;
	Mon, 19 Jan 2026 09:22:13 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF2CA3F632;
	Mon, 19 Jan 2026 09:22:18 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Linu Cherian <Linu.Cherian@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/13] arm64: mm: Implicitly invalidate user ASID based on TLBI operation
Date: Mon, 19 Jan 2026 17:21:50 +0000
Message-ID: <20260119172202.1681510-4-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119172202.1681510-1-ryan.roberts@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_092220_891905_2B749BE7 
X-CRM114-Status: GOOD (  13.25  )
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

When kpti is enabled, separate ASIDs are used for userspace and
kernelspace, requiring ASID-qualified TLB invalidation by virtual
address to invalidate both of them.

Push the logic for invalidating the two ASIDs down into the low-level
tlbi-op-specific functions and remove the burden from the caller to
handle the kpti-specific behaviour.

Co-developed-by: Will Deacon <will@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index acd59bc61e00..0e5a30eee447 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -110,6 +110,7 @@ typedef void (*tlbi_op)(u64 arg);
 static __always_inline void vae1is(u64 arg)
 {
 	__tlbi(vae1is, arg);
+	__tlbi_user(vae1is, arg);
 }
 
 static __always_inline void vae2is(u64 arg)
@@ -120,11 +121,13 @@ static __always_inline void vae2is(u64 arg)
 static __always_inline void vale1(u64 arg)
 {
 	__tlbi(vale1, arg);
+	__tlbi_user(vale1, arg);
 }
 
 static __always_inline void vale1is(u64 arg)
 {
 	__tlbi(vale1is, arg);
+	__tlbi_user(vale1is, arg);
 }
 
 static __always_inline void vale2is(u64 arg)
@@ -160,11 +163,6 @@ static __always_inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
 	op(arg);
 }
 
-#define __tlbi_user_level(op, arg, level) do {				\
-	if (arm64_kernel_unmapped_at_el0())				\
-		__tlbi_level(op, (arg | USER_ASID_FLAG), level);	\
-} while (0)
-
 /*
  * This macro creates a properly formatted VA operand for the TLB RANGE. The
  * value bit assignments are:
@@ -433,8 +431,6 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
  * @stride:	Flush granularity
  * @asid:	The ASID of the task (0 for IPA instructions)
  * @tlb_level:	Translation Table level hint, if known
- * @tlbi_user:	If 'true', call an additional __tlbi_user()
- *              (typically for user ASIDs). 'flase' for IPA instructions
  * @lpa2:	If 'true', the lpa2 scheme is used as set out below
  *
  * When the CPU does not support TLB range operations, flush the TLB
@@ -460,16 +456,19 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 static __always_inline void rvae1is(u64 arg)
 {
 	__tlbi(rvae1is, arg);
+	__tlbi_user(rvae1is, arg);
 }
 
 static __always_inline void rvale1(u64 arg)
 {
 	__tlbi(rvale1, arg);
+	__tlbi_user(rvale1, arg);
 }
 
 static __always_inline void rvale1is(u64 arg)
 {
 	__tlbi(rvale1is, arg);
+	__tlbi_user(rvale1is, arg);
 }
 
 static __always_inline void rvaale1is(u64 arg)
@@ -488,7 +487,7 @@ static __always_inline void __tlbi_range(tlbi_op op, u64 arg)
 }
 
 #define __flush_tlb_range_op(op, start, pages, stride,			\
-				asid, tlb_level, tlbi_user, lpa2)	\
+				asid, tlb_level, lpa2)			\
 do {									\
 	typeof(start) __flush_start = start;				\
 	typeof(pages) __flush_pages = pages;				\
@@ -503,8 +502,6 @@ do {									\
 		    (lpa2 && __flush_start != ALIGN(__flush_start, SZ_64K))) {	\
 			addr = __TLBI_VADDR(__flush_start, asid);	\
 			__tlbi_level(op, addr, tlb_level);		\
-			if (tlbi_user)					\
-				__tlbi_user_level(op, addr, tlb_level);	\
 			__flush_start += stride;			\
 			__flush_pages -= stride >> PAGE_SHIFT;		\
 			continue;					\
@@ -515,8 +512,6 @@ do {									\
 			addr = __TLBI_VADDR_RANGE(__flush_start >> shift, asid, \
 						scale, num, tlb_level);	\
 			__tlbi_range(r##op, addr);			\
-			if (tlbi_user)					\
-				__tlbi_user(r##op, addr);		\
 			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
 			__flush_pages -= __TLBI_RANGE_PAGES(num, scale);\
 		}							\
@@ -525,7 +520,7 @@ do {									\
 } while (0)
 
 #define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
-	__flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, false, kvm_lpa2_is_enabled());
+	__flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, kvm_lpa2_is_enabled());
 
 static inline bool __flush_tlb_range_limit_excess(unsigned long start,
 		unsigned long end, unsigned long pages, unsigned long stride)
@@ -565,10 +560,10 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
 
 	if (last_level)
 		__flush_tlb_range_op(vale1is, start, pages, stride, asid,
-				     tlb_level, true, lpa2_is_enabled());
+				     tlb_level, lpa2_is_enabled());
 	else
 		__flush_tlb_range_op(vae1is, start, pages, stride, asid,
-				     tlb_level, true, lpa2_is_enabled());
+				     tlb_level, lpa2_is_enabled());
 
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
 }
@@ -593,7 +588,7 @@ static inline void local_flush_tlb_contpte(struct vm_area_struct *vma,
 	dsb(nshst);
 	asid = ASID(vma->vm_mm);
 	__flush_tlb_range_op(vale1, addr, CONT_PTES, PAGE_SIZE, asid,
-			     3, true, lpa2_is_enabled());
+			     3, lpa2_is_enabled());
 	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, addr,
 						    addr + CONT_PTE_SIZE);
 	dsb(nsh);
@@ -627,7 +622,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 
 	dsb(ishst);
 	__flush_tlb_range_op(vaale1is, start, pages, stride, 0,
-			     TLBI_TTL_UNKNOWN, false, lpa2_is_enabled());
+			     TLBI_TTL_UNKNOWN, lpa2_is_enabled());
 	dsb(ish);
 	isb();
 }
@@ -678,6 +673,7 @@ static inline bool huge_pmd_needs_flush(pmd_t oldpmd, pmd_t newpmd)
 }
 #define huge_pmd_needs_flush huge_pmd_needs_flush
 
+#undef __tlbi_user
 #endif
 
 #endif
-- 
2.43.0


