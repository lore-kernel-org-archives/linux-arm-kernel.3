Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903ABC021AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 14:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cElz/iHfGJIJrYOZM+nGWb3qr/VxQv3tlR6HOGX+84=; b=rT8NirQ3OKrrxO8QTwdTUWlrYj
	N47o0TIn9hHday7A4IgIGwLjGHdLHAtwsOTPY1PeK87rn059HrZaQidXtz6o0P8T2/64Kl4T0brWl
	b2ciSHpY3jsJxbWSUdNc/rKenojuSe35ANajZsuxtOddt7q01AOytpiNbc4aB0kKcjfoAf5tDJ2eo
	tBCIw4E7lNkCPx9RcvxjKazPCiCAhDFPR+6FTZtngyKeUEmGUV/OLiFs5vuzYkMD82tvMPNCQJprj
	gh0/ntoJlQ9XS58WW78UtdVtGE8i2t9OED8EpF+2lJF55I7ZfBafu3BWQsZyN5FRt0zroDIZftPVP
	g5uylgQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1zV-00000004pPK-2Z12;
	Mon, 17 Feb 2025 14:20:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1nV-00000004mNo-1Uqp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:08:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45EC71A2D;
	Mon, 17 Feb 2025 06:08:52 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC4143F6A8;
	Mon, 17 Feb 2025 06:08:30 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/14] arm64: hugetlb: Use set_ptes_anysz() and ptep_get_and_clear_anysz()
Date: Mon, 17 Feb 2025 14:07:57 +0000
Message-ID: <20250217140809.1702789-6-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217140809.1702789-1-ryan.roberts@arm.com>
References: <20250217140809.1702789-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_060833_486487_9F0A9493 
X-CRM114-Status: GOOD (  16.04  )
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

Refactor the huge_pte helpers to use the new common set_ptes_anysz() and
ptep_get_and_clear_anysz() APIs.

This provides 2 benefits; First, when page_table_check=on, hugetlb is
now properly/fully checked. Previously only the first page of a hugetlb
folio was checked. Second, instead of having to call __set_ptes(nr=1)
for each pte in a loop, the whole contiguous batch can now be set in one
go, which enables some efficiencies and cleans up the code.

One detail to note is that huge_ptep_clear_flush() was previously
calling ptep_clear_flush() for a non-contiguous pte (i.e. a pud or pmd
block mapping). This has a couple of disadvantages; first
ptep_clear_flush() calls ptep_get_and_clear() which transparently
handles contpte. Given we only call for non-contiguous ptes, it would be
safe, but a waste of effort. It's preferable to go straight to the layer
below. However, more problematic is that ptep_get_and_clear() is for
PAGE_SIZE entries so it calls page_table_check_pte_clear() and would not
clear the whole hugetlb folio. So let's stop special-casing the non-cont
case and just rely on get_clear_contig_flush() to do the right thing for
non-cont entries.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/mm/hugetlbpage.c | 52 +++++++------------------------------
 1 file changed, 10 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index b7434ed1b93b..8ac86cd180b3 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -166,12 +166,12 @@ static pte_t get_clear_contig(struct mm_struct *mm,
 	pte_t pte, tmp_pte;
 	bool present;
 
-	pte = __ptep_get_and_clear(mm, addr, ptep);
+	pte = ptep_get_and_clear_anysz(mm, ptep, pgsize);
 	present = pte_present(pte);
 	while (--ncontig) {
 		ptep++;
 		addr += pgsize;
-		tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
+		tmp_pte = ptep_get_and_clear_anysz(mm, ptep, pgsize);
 		if (present) {
 			if (pte_dirty(tmp_pte))
 				pte = pte_mkdirty(pte);
@@ -215,7 +215,7 @@ static void clear_flush(struct mm_struct *mm,
 	unsigned long i, saddr = addr;
 
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
-		__ptep_get_and_clear(mm, addr, ptep);
+		ptep_get_and_clear_anysz(mm, ptep, pgsize);
 
 	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
 }
@@ -226,32 +226,20 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 	size_t pgsize;
 	int i;
 	int ncontig;
-	unsigned long pfn, dpfn;
-	pgprot_t hugeprot;
 
 	ncontig = num_contig_ptes(sz, &pgsize);
 
 	if (!pte_present(pte)) {
 		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
-			__set_ptes(mm, addr, ptep, pte, 1);
+			set_ptes_anysz(mm, ptep, pte, 1, pgsize);
 		return;
 	}
 
-	if (!pte_cont(pte)) {
-		__set_ptes(mm, addr, ptep, pte, 1);
-		return;
-	}
-
-	pfn = pte_pfn(pte);
-	dpfn = pgsize >> PAGE_SHIFT;
-	hugeprot = pte_pgprot(pte);
-
 	/* Only need to "break" if transitioning valid -> valid. */
-	if (pte_valid(__ptep_get(ptep)))
+	if (pte_cont(pte) && pte_valid(__ptep_get(ptep)))
 		clear_flush(mm, addr, ptep, pgsize, ncontig);
 
-	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
-		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
+	set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
 }
 
 pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
@@ -441,11 +429,9 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 			       unsigned long addr, pte_t *ptep,
 			       pte_t pte, int dirty)
 {
-	int ncontig, i;
+	int ncontig;
 	size_t pgsize = 0;
-	unsigned long pfn = pte_pfn(pte), dpfn;
 	struct mm_struct *mm = vma->vm_mm;
-	pgprot_t hugeprot;
 	pte_t orig_pte;
 
 	VM_WARN_ON(!pte_present(pte));
@@ -454,7 +440,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 		return __ptep_set_access_flags(vma, addr, ptep, pte, dirty);
 
 	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
-	dpfn = pgsize >> PAGE_SHIFT;
 
 	if (!__cont_access_flags_changed(ptep, pte, ncontig))
 		return 0;
@@ -469,19 +454,14 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	if (pte_young(orig_pte))
 		pte = pte_mkyoung(pte);
 
-	hugeprot = pte_pgprot(pte);
-	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
-		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
-
+	set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
 	return 1;
 }
 
 void huge_ptep_set_wrprotect(struct mm_struct *mm,
 			     unsigned long addr, pte_t *ptep)
 {
-	unsigned long pfn, dpfn;
-	pgprot_t hugeprot;
-	int ncontig, i;
+	int ncontig;
 	size_t pgsize;
 	pte_t pte;
 
@@ -494,16 +474,11 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 	}
 
 	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
-	dpfn = pgsize >> PAGE_SHIFT;
 
 	pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
 	pte = pte_wrprotect(pte);
 
-	hugeprot = pte_pgprot(pte);
-	pfn = pte_pfn(pte);
-
-	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
-		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
+	set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
 }
 
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
@@ -512,13 +487,6 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 	struct mm_struct *mm = vma->vm_mm;
 	size_t pgsize;
 	int ncontig;
-	pte_t pte;
-
-	pte = __ptep_get(ptep);
-	VM_WARN_ON(!pte_present(pte));
-
-	if (!pte_cont(pte))
-		return ptep_clear_flush(vma, addr, ptep);
 
 	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
 	return get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
-- 
2.43.0


