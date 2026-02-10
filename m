Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D37AE94627
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 01:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDsSp8JnEXugJ+ejZmX1Dy3hck/c2mrVpwZocOeM8Gc=; b=G1y/k/C3y404jeiFuMuJFj0U68
	iJO6maMUASEmZc+EXwsctVjI0/bCfyfMwWBZeUjnQLCS5A/gjj3Bk6Te/a7mhkU5sf1Ci31BeWq+f
	T8Yeh5TeDgMcbKo2Ah0BvTafEHQqMMrnN98E3r/SEb7xl8GNuqJlexP9kg7DbOUph2f1LW+Hhe8U3
	Fg5wmIG39vOkB0Qy/RkauHnG3wFTjkp9Q/AqZGAdlmki7bQTB01NmBtWreLOvYHCxNcNwFAvDwcXC
	zYvkmxs5kiFBMjkuNkJpmwDT8onY7HGcaGPkrFozwr63n/8J/NrIWYAd8AQ051BIJHsaii3VVeRQe
	GhtJDRXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpcwM-0000000GIYA-07SW;
	Tue, 10 Feb 2026 01:53:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpcwJ-0000000GIXm-2BzR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 01:53:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A80484392C;
	Tue, 10 Feb 2026 01:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5500C116C6;
	Tue, 10 Feb 2026 01:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1770688397;
	bh=VsCzRTzENQvdbYEZ9wbxc31//QaNgPdb2GF/3ORsK/c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=POnnUt0yg6asAn/zifiuUgLA8LbsgRMM4IXlot5xx+dMJgXHwFv0dqHys90sGVZAo
	 zgy7nOIeGYEDN6IAQPVE5zL9mUVJdMum5Q9gPUboowt1dE1WjBPNbz7h3xRG49Ae0b
	 ec3eBKlC5bL8h/UvEl4losmqkU1lCtpYsMTc4NFM=
Date: Mon, 9 Feb 2026 17:53:16 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: david@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, dev.jain@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/5] support batch checking of references and
 unmapping for large folios
Message-Id: <20260209175316.2ef64ee244599765a74a6975@linux-foundation.org>
In-Reply-To: <cover.1770645603.git.baolin.wang@linux.alibaba.com>
References: <cover.1770645603.git.baolin.wang@linux.alibaba.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_175319_640894_AAF1485E 
X-CRM114-Status: GOOD (  24.31  )
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

On Mon,  9 Feb 2026 22:07:23 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:

> Currently, folio_referenced_one() always checks the young flag for each PTE
> sequentially, which is inefficient for large folios. This inefficiency is
> especially noticeable when reclaiming clean file-backed large folios, where
> folio_referenced() is observed as a significant performance hotspot.
> 
> Moreover, on Arm architecture, which supports contiguous PTEs, there is already
> an optimization to clear the young flags for PTEs within a contiguous range.
> However, this is not sufficient. We can extend this to perform batched operations
> for the entire large folio (which might exceed the contiguous range: CONT_PTE_SIZE).
> 
> Similar to folio_referenced_one(), we can also apply batched unmapping for large
> file folios to optimize the performance of file folio reclamation. By supporting
> batched checking of the young flags, flushing TLB entries, and unmapping, I can
> observed a significant performance improvements in my performance tests for file
> folios reclamation. Please check the performance data in the commit message of
> each patch.
> 

Thanks, I updated mm.git to this version.  Below is how v6 altered
mm.git.

I notice that this fix:

https://lore.kernel.org/all/de141225-a0c1-41fd-b3e1-bcab09827ddd@linux.alibaba.com/T/#u

was not carried forward.  Was this deliberate?

Also, regarding the 80-column tricks in folio_referenced_one(): we're
allowed to do this ;)


				unsigned long end_addr;
				unsigned int max_nr;

				end_addr = pmd_addr_end(address, vma->vm_end);
				max_nr = (end_addr - address) >> PAGE_SHIFT;




 arch/arm64/include/asm/pgtable.h |    2 +-
 include/linux/pgtable.h          |   16 ++++++++++------
 mm/rmap.c                        |    9 +++------
 3 files changed, 14 insertions(+), 13 deletions(-)

--- a/arch/arm64/include/asm/pgtable.h~b
+++ a/arch/arm64/include/asm/pgtable.h
@@ -1843,7 +1843,7 @@ static inline int clear_flush_young_ptes
 					 unsigned long addr, pte_t *ptep,
 					 unsigned int nr)
 {
-	if (likely(nr == 1 && !pte_valid_cont(__ptep_get(ptep))))
+	if (likely(nr == 1 && !pte_cont(__ptep_get(ptep))))
 		return __ptep_clear_flush_young(vma, addr, ptep);
 
 	return contpte_clear_flush_young_ptes(vma, addr, ptep, nr);
--- a/include/linux/pgtable.h~b
+++ a/include/linux/pgtable.h
@@ -1070,8 +1070,8 @@ static inline void wrprotect_ptes(struct
 
 #ifndef clear_flush_young_ptes
 /**
- * clear_flush_young_ptes - Clear the access bit and perform a TLB flush for PTEs
- *			    that map consecutive pages of the same folio.
+ * clear_flush_young_ptes - Mark PTEs that map consecutive pages of the same
+ *			    folio as old and flush the TLB.
  * @vma: The virtual memory area the pages are mapped into.
  * @addr: Address the first page is mapped at.
  * @ptep: Page table pointer for the first entry.
@@ -1087,13 +1087,17 @@ static inline void wrprotect_ptes(struct
  * pages that belong to the same folio.  The PTEs are all in the same PMD.
  */
 static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
-					 unsigned long addr, pte_t *ptep,
-					 unsigned int nr)
+		unsigned long addr, pte_t *ptep, unsigned int nr)
 {
-	int i, young = 0;
+	int young = 0;
 
-	for (i = 0; i < nr; ++i, ++ptep, addr += PAGE_SIZE)
+	for (;;) {
 		young |= ptep_clear_flush_young(vma, addr, ptep);
+		if (--nr == 0)
+			break;
+		ptep++;
+		addr += PAGE_SIZE;
+	}
 
 	return young;
 }
--- a/mm/rmap.c~b
+++ a/mm/rmap.c
@@ -963,10 +963,8 @@ static bool folio_referenced_one(struct
 				referenced++;
 		} else if (pvmw.pte) {
 			if (folio_test_large(folio)) {
-				unsigned long end_addr =
-					pmd_addr_end(address, vma->vm_end);
-				unsigned int max_nr =
-					(end_addr - address) >> PAGE_SHIFT;
+				unsigned long end_addr = pmd_addr_end(address, vma->vm_end);
+				unsigned int max_nr = (end_addr - address) >> PAGE_SHIFT;
 				pte_t pteval = ptep_get(pvmw.pte);
 
 				nr = folio_pte_batch(folio, pvmw.pte,
@@ -974,8 +972,7 @@ static bool folio_referenced_one(struct
 			}
 
 			ptes += nr;
-			if (clear_flush_young_ptes_notify(vma, address,
-						pvmw.pte, nr))
+			if (clear_flush_young_ptes_notify(vma, address, pvmw.pte, nr))
 				referenced++;
 			/* Skip the batched PTEs */
 			pvmw.pte += nr - 1;
_


