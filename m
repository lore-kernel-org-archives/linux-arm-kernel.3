Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9376FCFD36E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 00:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ea6etQCpReM0Dd5R3qfwP463Goog5MVH76oxL1v2kk=; b=ehTLnG8gsUc1G3hNXkfjvZTUnA
	rBlnUWa9/VF2u1iT98/AVJpChi/DqCLcx4vTKNcZ3s7Z3RRtF4JHsCc/UVf2FLTW9M8gMMejmd6Td
	Dw8CuIXiEKOiFVHARK4v4UEfkMqVirPSdB5CNpWyaUyV+wB0or4aYx5L4ZXCeLBJ8cR1i22OiK+Iq
	fSwv8X0crNUyihbgoUD5jQ5sst3hcZ3ROe62bg9VCIVZ4ThJYYHoSafnRHJgPy3QLqRnegrCcWJoP
	GG0fWc8vTKCTo9DiIwSNzLjWnf2P5Mo6gT+aNZPSih3IOHIgZ6u7cT/5DxSKCeklpvoccgrurpq2o
	csG3vdOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNhMm-0000000CX2W-3AVv;
	Tue, 25 Nov 2025 00:57:12 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNhMi-0000000CX1R-24Ai
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 00:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1764032221; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=/ea6etQCpReM0Dd5R3qfwP463Goog5MVH76oxL1v2kk=;
	b=egCjUtvqAvX9qvvEpsZTTuumyfx+fx/5gdtMtb9hbiqUvp63Z73BlnmVem06JngLYlBofR19l80RjzZiQC/ISVR7SERlXWbBjlm8AnqaApDo2q4W4uvT/MchIPyR+fvP2dbdITprjYGRPNmMspzZBILOSUNOkLHdruYLECl89uw=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WtL1wub_1764032219 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 25 Nov 2025 08:56:59 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	riel@surriel.com,
	harry.yoo@oracle.com,
	jannh@google.com,
	willy@infradead.org,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: mm: support batch clearing of the young flag for large folios
Date: Tue, 25 Nov 2025 08:56:50 +0800
Message-ID: <1d71cf419726188dfc41c292dfac066be5cb1e33.1763976541.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1763976541.git.baolin.wang@linux.alibaba.com>
References: <cover.1763976541.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_165709_149899_6609ABF3 
X-CRM114-Status: GOOD (  13.32  )
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

Currently, contpte_ptep_test_and_clear_young() and contpte_ptep_clear_flush_young()
only clear the young flag and flush TLBs for PTEs within the contiguous range.
To support batch PTE operations for other sized large folios in the following
patches, adding a new parameter to specify the number of PTEs.

While we are at it, rename the functions to maintain consistency with other
contpte_*() functions.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 arch/arm64/include/asm/pgtable.h | 12 ++++-----
 arch/arm64/mm/contpte.c          | 44 ++++++++++++++++++++++----------
 2 files changed, 37 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 0944e296dd4a..e03034683156 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1679,10 +1679,10 @@ extern void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
 extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
 				unsigned long addr, pte_t *ptep,
 				unsigned int nr, int full);
-extern int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
-				unsigned long addr, pte_t *ptep);
-extern int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
-				unsigned long addr, pte_t *ptep);
+extern int contpte_test_and_clear_young_ptes(struct vm_area_struct *vma,
+				unsigned long addr, pte_t *ptep, unsigned int nr);
+extern int contpte_clear_flush_young_ptes(struct vm_area_struct *vma,
+				unsigned long addr, pte_t *ptep, unsigned int nr);
 extern void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, unsigned int nr);
 extern int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
@@ -1854,7 +1854,7 @@ static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
 	if (likely(!pte_valid_cont(orig_pte)))
 		return __ptep_test_and_clear_young(vma, addr, ptep);
 
-	return contpte_ptep_test_and_clear_young(vma, addr, ptep);
+	return contpte_test_and_clear_young_ptes(vma, addr, ptep, CONT_PTES);
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
@@ -1866,7 +1866,7 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 	if (likely(!pte_valid_cont(orig_pte)))
 		return __ptep_clear_flush_young(vma, addr, ptep);
 
-	return contpte_ptep_clear_flush_young(vma, addr, ptep);
+	return contpte_clear_flush_young_ptes(vma, addr, ptep, CONT_PTES);
 }
 
 #define wrprotect_ptes wrprotect_ptes
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index c0557945939c..19b122441be3 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -488,8 +488,9 @@ pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
 }
 EXPORT_SYMBOL_GPL(contpte_get_and_clear_full_ptes);
 
-int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
-					unsigned long addr, pte_t *ptep)
+int contpte_test_and_clear_young_ptes(struct vm_area_struct *vma,
+					unsigned long addr, pte_t *ptep,
+					unsigned int nr)
 {
 	/*
 	 * ptep_clear_flush_young() technically requires us to clear the access
@@ -500,39 +501,56 @@ int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
 	 * having to unfold.
 	 */
 
+	unsigned long start = addr;
+	unsigned long end = start + nr * PAGE_SIZE;
 	int young = 0;
 	int i;
 
-	ptep = contpte_align_down(ptep);
-	addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
+	if (pte_cont(__ptep_get(ptep + nr - 1)))
+		end = ALIGN(end, CONT_PTE_SIZE);
 
-	for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE)
-		young |= __ptep_test_and_clear_young(vma, addr, ptep);
+	if (pte_cont(__ptep_get(ptep))) {
+		start = ALIGN_DOWN(start, CONT_PTE_SIZE);
+		ptep = contpte_align_down(ptep);
+	}
+
+	nr = (end - start) / PAGE_SIZE;
+	for (i = 0; i < nr; i++, ptep++, start += PAGE_SIZE)
+		young |= __ptep_test_and_clear_young(vma, start, ptep);
 
 	return young;
 }
-EXPORT_SYMBOL_GPL(contpte_ptep_test_and_clear_young);
+EXPORT_SYMBOL_GPL(contpte_test_and_clear_young_ptes);
 
-int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
-					unsigned long addr, pte_t *ptep)
+int contpte_clear_flush_young_ptes(struct vm_area_struct *vma,
+				unsigned long addr, pte_t *ptep,
+				unsigned int nr)
 {
 	int young;
 
-	young = contpte_ptep_test_and_clear_young(vma, addr, ptep);
+	young = contpte_test_and_clear_young_ptes(vma, addr, ptep, nr);
 
 	if (young) {
+		unsigned long start = addr;
+		unsigned long end = start + nr * PAGE_SIZE;
+
+		if (pte_cont(__ptep_get(ptep + nr - 1)))
+			end = ALIGN(end, CONT_PTE_SIZE);
+
+		if (pte_cont(__ptep_get(ptep)))
+			start = ALIGN_DOWN(start, CONT_PTE_SIZE);
+
 		/*
 		 * See comment in __ptep_clear_flush_young(); same rationale for
 		 * eliding the trailing DSB applies here.
 		 */
-		addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
-		__flush_tlb_range_nosync(vma->vm_mm, addr, addr + CONT_PTE_SIZE,
+		__flush_tlb_range_nosync(vma->vm_mm, start, end,
 					 PAGE_SIZE, true, 3);
 	}
 
 	return young;
 }
-EXPORT_SYMBOL_GPL(contpte_ptep_clear_flush_young);
+EXPORT_SYMBOL_GPL(contpte_clear_flush_young_ptes);
 
 void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
 					pte_t *ptep, unsigned int nr)
-- 
2.47.3


