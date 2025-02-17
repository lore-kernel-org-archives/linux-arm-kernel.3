Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15078C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 14:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjvR6b5BjqryM3DMHxFhTSbOzPrvcdNa2MPAXtRZ3A4=; b=3p2+xtRpIOv3/iHsfWHe7LzINB
	CqjAmRdjrAlNFEhQ/KTNC2L3E74vLAI2DOw/SE0fEzOuVIOfNW/Z9lkqoCgmeG1k/6kbhGG+hs4+d
	voO9QAJ4lmcX+9IMyxrHKkYmvEuH51Lacsty9Lurucs7js7vM82HUSIcoAha3PQ+yMaDTx82g6Dgt
	EM/xUjdocD1KK3hLqqO1tsOJ8eWL4N0tPOSDd7X/PqxgSf2leUvDySqiLMuXATE8++E2XKUl9qb/c
	qx8n/F8cly6Ty2WJ6MYTt+DaxtjXtKp9ag3E79Px0QFUlWbsqw1RmARj5K8BWsoKOb2oLKT46mEW+
	fZQ/mV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1tk-00000004nya-3NaY;
	Mon, 17 Feb 2025 14:15:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1nL-00000004mG4-0uhk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:08:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DD911A2D;
	Mon, 17 Feb 2025 06:08:42 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3E023F6A8;
	Mon, 17 Feb 2025 06:08:20 -0800 (PST)
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
Subject: [PATCH v2 01/14] arm64: hugetlb: Cleanup huge_pte size discovery mechanisms
Date: Mon, 17 Feb 2025 14:07:53 +0000
Message-ID: <20250217140809.1702789-2-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217140809.1702789-1-ryan.roberts@arm.com>
References: <20250217140809.1702789-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_060823_385814_8DAD3132 
X-CRM114-Status: GOOD (  17.15  )
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

Not all huge_pte helper APIs explicitly provide the size of the
huge_pte. So the helpers have to depend on various methods to determine
the size of the huge_pte. Some of these methods are dubious.

Let's clean up the code to use preferred methods and retire the dubious
ones. The options in order of preference:

 - If size is provided as parameter, use it together with
   num_contig_ptes(). This is explicit and works for both present and
   non-present ptes.

 - If vma is provided as a parameter, retrieve size via
   huge_page_size(hstate_vma(vma)) and use it together with
   num_contig_ptes(). This is explicit and works for both present and
   non-present ptes.

 - If the pte is present and contiguous, use find_num_contig() to walk
   the pgtable to find the level and infer the number of ptes from
   level. Only works for *present* ptes.

 - If the pte is present and not contiguous and you can infer from this
   that only 1 pte needs to be operated on. This is ok if you don't care
   about the absolute size, and just want to know the number of ptes.

 - NEVER rely on resolving the PFN of a present pte to a folio and
   getting the folio's size. This is fragile at best, because there is
   nothing to stop the core-mm from allocating a folio twice as big as
   the huge_pte then mapping it across 2 consecutive huge_ptes. Or just
   partially mapping it.

Where we require that the pte is present, add warnings if not-present.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/mm/hugetlbpage.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 614b2feddba2..31ea826a8a09 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -136,7 +136,7 @@ pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 	if (!pte_present(orig_pte) || !pte_cont(orig_pte))
 		return orig_pte;
 
-	ncontig = num_contig_ptes(page_size(pte_page(orig_pte)), &pgsize);
+	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
 	for (i = 0; i < ncontig; i++, ptep++) {
 		pte_t pte = __ptep_get(ptep);
 
@@ -445,16 +445,19 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	pgprot_t hugeprot;
 	pte_t orig_pte;
 
+	VM_WARN_ON(!pte_present(pte));
+
 	if (!pte_cont(pte))
 		return __ptep_set_access_flags(vma, addr, ptep, pte, dirty);
 
-	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
+	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
 	dpfn = pgsize >> PAGE_SHIFT;
 
 	if (!__cont_access_flags_changed(ptep, pte, ncontig))
 		return 0;
 
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
+	VM_WARN_ON(!pte_present(orig_pte));
 
 	/* Make sure we don't lose the dirty or young state */
 	if (pte_dirty(orig_pte))
@@ -479,7 +482,10 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 	size_t pgsize;
 	pte_t pte;
 
-	if (!pte_cont(__ptep_get(ptep))) {
+	pte = __ptep_get(ptep);
+	VM_WARN_ON(!pte_present(pte));
+
+	if (!pte_cont(pte)) {
 		__ptep_set_wrprotect(mm, addr, ptep);
 		return;
 	}
@@ -503,11 +509,15 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 	struct mm_struct *mm = vma->vm_mm;
 	size_t pgsize;
 	int ncontig;
+	pte_t pte;
+
+	pte = __ptep_get(ptep);
+	VM_WARN_ON(!pte_present(pte));
 
-	if (!pte_cont(__ptep_get(ptep)))
+	if (!pte_cont(pte))
 		return ptep_clear_flush(vma, addr, ptep);
 
-	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
+	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
 	return get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
 }
 
-- 
2.43.0


