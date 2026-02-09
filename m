Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D73BE81BCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUWGRaUIkWeZeuS3iAci2uAMPNQlTvUSjRkLaCjx/zg=; b=jqt5BekspFIwJo9PTI0mcEMkPA
	icGFHFQudDbngky8HVFXz+T3Rp8lgVklTAIq7DXSTwlrmi4tptYQD187EloCDwiSN+uRP36j4OZdg
	jTj1+Id4Smke93s6HvBaPtZLfX9UoCqMdlOlk9xUOGYicjPlFMwj8OG0OYUY5IrnKZPoJPMHYcLoE
	uv2nkDpMDzyAZu2kfqYUum73iQaxtUvrg1cSpVEioRAny9LZFT4EZKoeqEgB6xsZeHgFB27Ft6uCt
	ogfytvQiEExUFj3QiQyWkYuPwzhdySDASEWeghxRG7WiggNG43M/Uw7gVTgy3VNMRi2AGS0fBlVnR
	EXtSJa5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpRvb-0000000FTsf-2UPN;
	Mon, 09 Feb 2026 14:07:51 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpRvX-0000000FTqT-03iX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 14:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770646063; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=zUWGRaUIkWeZeuS3iAci2uAMPNQlTvUSjRkLaCjx/zg=;
	b=qix3nvV1UKBvOnsp76pHr23NKxU8mI4sAmcs+oGi+VY6rDqcPVosRkc2kTeLHrBFhHqA/5+gti1f7joxbTuY1ZBhNPCRpTHrnWUwAGMvddoLWUlTHMdwPPiJOteho966gSHgb0I1pl2koAENaY77gKxB1Pmd2RWjzZAoSjccauc=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wyt2i5O_1770646061 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Feb 2026 22:07:41 +0800
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
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/5] arm64: mm: support batch clearing of the young flag for large folios
Date: Mon,  9 Feb 2026 22:07:26 +0800
Message-ID: <5644250dcc0417278c266ad37118d27f541fd052.1770645603.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770645603.git.baolin.wang@linux.alibaba.com>
References: <cover.1770645603.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_060747_292204_1D3EADA2 
X-CRM114-Status: GOOD (  12.92  )
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
patches, adding a new parameter to specify the number of PTEs that map consecutive
pages of the same large folio in a single VMA and a single page table.

While we are at it, rename the functions to maintain consistency with other
contpte_*() functions.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 arch/arm64/include/asm/pgtable.h | 12 ++++++------
 arch/arm64/mm/contpte.c          | 33 ++++++++++++++++++--------------
 2 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index d94445b4f3df..3dabf5ea17fa 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1648,10 +1648,10 @@ extern void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
 extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
 				unsigned long addr, pte_t *ptep,
 				unsigned int nr, int full);
-extern int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
-				unsigned long addr, pte_t *ptep);
-extern int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
-				unsigned long addr, pte_t *ptep);
+int contpte_test_and_clear_young_ptes(struct vm_area_struct *vma,
+				unsigned long addr, pte_t *ptep, unsigned int nr);
+int contpte_clear_flush_young_ptes(struct vm_area_struct *vma,
+				unsigned long addr, pte_t *ptep, unsigned int nr);
 extern void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, unsigned int nr);
 extern int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
@@ -1823,7 +1823,7 @@ static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
 	if (likely(!pte_valid_cont(orig_pte)))
 		return __ptep_test_and_clear_young(vma, addr, ptep);
 
-	return contpte_ptep_test_and_clear_young(vma, addr, ptep);
+	return contpte_test_and_clear_young_ptes(vma, addr, ptep, 1);
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
@@ -1835,7 +1835,7 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 	if (likely(!pte_valid_cont(orig_pte)))
 		return __ptep_clear_flush_young(vma, addr, ptep);
 
-	return contpte_ptep_clear_flush_young(vma, addr, ptep);
+	return contpte_clear_flush_young_ptes(vma, addr, ptep, 1);
 }
 
 #define wrprotect_ptes wrprotect_ptes
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index e4ddeb46f25d..b929a455103f 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -508,8 +508,9 @@ pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
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
@@ -518,41 +519,45 @@ int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
 	 * contig range when the range is covered by a single folio, we can get
 	 * away with clearing young for the whole contig range here, so we avoid
 	 * having to unfold.
+	 *
+	 * The 'nr' means consecutive (present) PTEs that map consecutive pages
+	 * of the same large folio in a single VMA and a single page table.
 	 */
 
+	unsigned long end = addr + nr * PAGE_SIZE;
 	int young = 0;
-	int i;
 
-	ptep = contpte_align_down(ptep);
-	addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
-
-	for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE)
+	ptep = contpte_align_addr_ptep(&addr, &end, ptep, nr);
+	for (; addr != end; ptep++, addr += PAGE_SIZE)
 		young |= __ptep_test_and_clear_young(vma, addr, ptep);
 
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
+		unsigned long end = addr + nr * PAGE_SIZE;
+
+		contpte_align_addr_ptep(&addr, &end, ptep, nr);
 		/*
 		 * See comment in __ptep_clear_flush_young(); same rationale for
 		 * eliding the trailing DSB applies here.
 		 */
-		addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
-		__flush_tlb_range_nosync(vma->vm_mm, addr, addr + CONT_PTE_SIZE,
+		__flush_tlb_range_nosync(vma->vm_mm, addr, end,
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


