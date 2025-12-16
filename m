Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4204D5E391
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 14:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JriAd/0dAhJ18yHGqsyRqKFFo2I/l0d2pT/Wm0KstOk=; b=DggfKTv42Cb5ICT+Zn5Ma55DWt
	w4VqZEDAByESn6LlMfjCs1Cc4ZZgpjIejg4V/whQpUrcEZxGm1u40ZyKhqTC8jRr7sHWDO7sqpzRG
	FlTP+2GBkwS8Fp8FVt7uh0W1IAesPQPy4d3TTRsOXqCCnxgmh1Sd8f6fSP8JFqc2s9TnAtlAnltyF
	a8btvitCFDLlaRNli3dD+EzMF2la1/JAE7nNsa81r64kip7aGPmzqXr9JemiI1O+E/g1/w4EYrmYG
	obLOik6VztsEoffqZiclxx50EV6sWhe83UCnVPoP7KKgQBaoYeJJZrbMPE3o9y2Ce+Ul0ytCg/lI1
	UQzKrjZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWJx-00000005Mrh-1Lgx;
	Tue, 16 Dec 2025 14:46:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWJh-00000005MgX-3FcH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 14:46:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CD72168F;
	Tue, 16 Dec 2025 06:46:14 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E43D93F73F;
	Tue, 16 Dec 2025 06:46:19 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Linu Cherian <Linu.Cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/13] arm64: mm: Re-implement the __flush_tlb_range_op macro in C
Date: Tue, 16 Dec 2025 14:45:51 +0000
Message-ID: <20251216144601.2106412-7-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216144601.2106412-1-ryan.roberts@arm.com>
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_064623_175565_29625E5C 
X-CRM114-Status: GOOD (  14.58  )
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

The __flush_tlb_range_op() macro is horrible and has been a previous
source of bugs thanks to multiple expansions of its arguments (see
commit f7edb07ad7c6 ("Fix mmu notifiers for range-based invalidates")).

Rewrite the thing in C.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Co-developed-by: Will Deacon <will@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 84 +++++++++++++++++--------------
 1 file changed, 46 insertions(+), 38 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 887dd1f05a89..d2a144a09a8f 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -419,12 +419,13 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 /*
  * __flush_tlb_range_op - Perform TLBI operation upon a range
  *
- * @op:	TLBI instruction that operates on a range (has 'r' prefix)
+ * @lop:	TLBI level operation to perform
+ * @rop:	TLBI range operation to perform
  * @start:	The start address of the range
  * @pages:	Range as the number of pages from 'start'
  * @stride:	Flush granularity
  * @asid:	The ASID of the task (0 for IPA instructions)
- * @tlb_level:	Translation Table level hint, if known
+ * @level:	Translation Table level hint, if known
  * @lpa2:	If 'true', the lpa2 scheme is used as set out below
  *
  * When the CPU does not support TLB range operations, flush the TLB
@@ -491,36 +492,44 @@ static __always_inline void __tlbi_range(tlbi_op op, u64 addr,
 	op(arg);
 }
 
-#define __flush_tlb_range_op(op, start, pages, stride,			\
-				asid, tlb_level, lpa2)			\
-do {									\
-	typeof(start) __flush_start = start;				\
-	typeof(pages) __flush_pages = pages;				\
-	int num = 0;							\
-	int scale = 3;							\
-									\
-	while (__flush_pages > 0) {					\
-		if (!system_supports_tlb_range() ||			\
-		    __flush_pages == 1 ||				\
-		    (lpa2 && __flush_start != ALIGN(__flush_start, SZ_64K))) {	\
-			__tlbi_level_asid(op, __flush_start, tlb_level, asid);	\
-			__flush_start += stride;			\
-			__flush_pages -= stride >> PAGE_SHIFT;		\
-			continue;					\
-		}							\
-									\
-		num = __TLBI_RANGE_NUM(__flush_pages, scale);		\
-		if (num >= 0) {						\
-			__tlbi_range(r##op, __flush_start, asid, scale, num, tlb_level, lpa2); \
-			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
-			__flush_pages -= __TLBI_RANGE_PAGES(num, scale);\
-		}							\
-		scale--;						\
-	}								\
-} while (0)
+static __always_inline void __flush_tlb_range_op(tlbi_op lop, tlbi_op rop,
+						 u64 start, size_t pages,
+						 u64 stride, u16 asid,
+						 u32 level, bool lpa2)
+{
+	u64 addr = start, end = start + pages * PAGE_SIZE;
+	int scale = 3;
+
+	while (addr != end) {
+		int num;
+
+		pages = (end - addr) >> PAGE_SHIFT;
+
+		if (!system_supports_tlb_range() || pages == 1)
+			goto invalidate_one;
+
+		if (lpa2 && !IS_ALIGNED(addr, SZ_64K))
+			goto invalidate_one;
+
+		num = __TLBI_RANGE_NUM(pages, scale);
+		if (num >= 0) {
+			__tlbi_range(rop, addr, asid, scale, num, level, lpa2);
+			addr += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT;
+		}
+
+		scale--;
+		continue;
+invalidate_one:
+		__tlbi_level_asid(lop, addr, level, asid);
+		addr += stride;
+	}
+}
+
+#define __flush_s1_tlb_range_op(op, start, pages, stride, asid, tlb_level) \
+	__flush_tlb_range_op(op, r##op, start, pages, stride, asid, tlb_level, lpa2_is_enabled())
 
 #define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
-	__flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, kvm_lpa2_is_enabled());
+	__flush_tlb_range_op(op, r##op, start, pages, stride, 0, tlb_level, kvm_lpa2_is_enabled())
 
 static inline bool __flush_tlb_range_limit_excess(unsigned long start,
 		unsigned long end, unsigned long pages, unsigned long stride)
@@ -559,11 +568,11 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
 	asid = ASID(mm);
 
 	if (last_level)
-		__flush_tlb_range_op(vale1is, start, pages, stride, asid,
-				     tlb_level, lpa2_is_enabled());
+		__flush_s1_tlb_range_op(vale1is, start, pages, stride,
+				     asid, tlb_level);
 	else
-		__flush_tlb_range_op(vae1is, start, pages, stride, asid,
-				     tlb_level, lpa2_is_enabled());
+		__flush_s1_tlb_range_op(vae1is, start, pages, stride,
+				     asid, tlb_level);
 
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
 }
@@ -587,8 +596,7 @@ static inline void local_flush_tlb_contpte(struct vm_area_struct *vma,
 
 	dsb(nshst);
 	asid = ASID(vma->vm_mm);
-	__flush_tlb_range_op(vale1, addr, CONT_PTES, PAGE_SIZE, asid,
-			     3, true, lpa2_is_enabled());
+	__flush_s1_tlb_range_op(vale1, addr, CONT_PTES, PAGE_SIZE, asid, 3);
 	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, addr,
 						    addr + CONT_PTE_SIZE);
 	dsb(nsh);
@@ -621,8 +629,8 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 	}
 
 	dsb(ishst);
-	__flush_tlb_range_op(vaale1is, start, pages, stride, 0,
-			     TLBI_TTL_UNKNOWN, lpa2_is_enabled());
+	__flush_s1_tlb_range_op(vaale1is, start, pages, stride, 0,
+				TLBI_TTL_UNKNOWN);
 	dsb(ish);
 	isb();
 }
-- 
2.43.0


