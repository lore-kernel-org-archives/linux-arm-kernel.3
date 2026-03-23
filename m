Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD28F483C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b+4BHcdGnV7+hupwlBr12QbEzjrR6L4UpmF1+wQ8b9c=; b=qbfg68og5K9gvMd0PLDK7DEJlU
	zgaT2T/tOUVVGsu+bry5MEJ4Sio4Xy/CsTAS64mJO6a9XcNSSYZkGBsCtdnAaSs1bJlEHDWlawDXa
	KYJ7qIc1FWm3z7nwnmz4YJ9VTH4MrGu2HpfmYegjLmHcvCXcmmQjGSNstxJnXmmaWN4G4HH407yKf
	L6fus30NXfS8zSC4afd/QtNgSrHnbOvmy5BoKwfoQkfhoM5VPVfl1W5/UDv+4snBqmjXJ7lH9C+f+
	yMim4q0I9FZjpb9eWliqtvPeRjkm2AUbUHPlvzXqsdCWi2OM4SpTD7A8B2uT31xVqz8UTyxob8Vfa
	V2x0hLpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iJR-0000000H9eB-1eDq;
	Mon, 23 Mar 2026 16:39:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iJP-0000000H9dn-0WIK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 16:39:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 424D414BF;
	Mon, 23 Mar 2026 09:39:23 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37D8D3F73B;
	Mon, 23 Mar 2026 09:39:28 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: [PATCH v1] arm64: mm: __ptep_set_access_flags must hint correct TTL
Date: Mon, 23 Mar 2026 16:39:16 +0000
Message-ID: <20260323163918.2028109-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_093931_245313_D42D387E 
X-CRM114-Status: GOOD (  13.73  )
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

It has been reported that since commit 752a0d1d483e9 ("arm64: mm:
Provide level hint for flush_tlb_page()"), the arm64
check_hugetlb_options selftest has been locking up while running "Check
child hugetlb memory with private mapping, sync error mode and mmap
memory".

This is due to hugetlb (and THP) helpers casting their PMD/PUD entries
to PTE and calling __ptep_set_access_flags(), which issues a
__flush_tlb_page(). Now that this is hinted for level 3, in this case,
the TLB entry does not get evicted and we end up in a spurious fault
loop.

Fix this by creating a __ptep_set_access_flags_anysz() function which
takes the pgsize of the entry. It can then add the appropriate hint. The
"_anysz" approach is the established pattern for problems of this class.

Reported-by: Aishwarya TCV <Aishwarya.TCV@arm.com>
Fixes: 752a0d1d483e9 ("arm64: mm: Provide level hint for flush_tlb_page()")
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---

Applies on top of for-next/tlbflush. mm selftests run and pass in VM on Apple
M2. arm64 check_hugetlb_options selftest runs and passed on FVP configured with
MTE enabled.

Thanks,
Ryan


 arch/arm64/include/asm/pgtable.h | 19 ++++++++++++++-----
 arch/arm64/mm/fault.c            | 30 +++++++++++++++++++++++++-----
 arch/arm64/mm/hugetlbpage.c      |  6 +++---
 3 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index b1a96a8f2b17e..53e39d2182f5a 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1248,9 +1248,18 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 	return pte_pmd(pte_modify(pmd_pte(pmd), newprot));
 }

-extern int __ptep_set_access_flags(struct vm_area_struct *vma,
-				 unsigned long address, pte_t *ptep,
-				 pte_t entry, int dirty);
+extern int __ptep_set_access_flags_anysz(struct vm_area_struct *vma,
+					 unsigned long address, pte_t *ptep,
+					 pte_t entry, int dirty,
+					 unsigned long pgsize);
+
+static inline int __ptep_set_access_flags(struct vm_area_struct *vma,
+					  unsigned long address, pte_t *ptep,
+					  pte_t entry, int dirty)
+{
+	return __ptep_set_access_flags_anysz(vma, address, ptep, entry, dirty,
+					     PAGE_SIZE);
+}

 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_PMDP_SET_ACCESS_FLAGS
@@ -1258,8 +1267,8 @@ static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
 					unsigned long address, pmd_t *pmdp,
 					pmd_t entry, int dirty)
 {
-	return __ptep_set_access_flags(vma, address, (pte_t *)pmdp,
-							pmd_pte(entry), dirty);
+	return __ptep_set_access_flags_anysz(vma, address, (pte_t *)pmdp,
+					     pmd_pte(entry), dirty, PMD_SIZE);
 }
 #endif

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index f91aa686f1428..920a8b244d59e 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -204,12 +204,13 @@ static void show_pte(unsigned long addr)
  *
  * Returns whether or not the PTE actually changed.
  */
-int __ptep_set_access_flags(struct vm_area_struct *vma,
-			    unsigned long address, pte_t *ptep,
-			    pte_t entry, int dirty)
+int __ptep_set_access_flags_anysz(struct vm_area_struct *vma,
+				  unsigned long address, pte_t *ptep,
+				  pte_t entry, int dirty, unsigned long pgsize)
 {
 	pteval_t old_pteval, pteval;
 	pte_t pte = __ptep_get(ptep);
+	int level;

 	if (pte_same(pte, entry))
 		return 0;
@@ -238,8 +239,27 @@ int __ptep_set_access_flags(struct vm_area_struct *vma,
 	 * may still cause page faults and be invalidated via
 	 * flush_tlb_fix_spurious_fault().
 	 */
-	if (dirty)
-		__flush_tlb_page(vma, address, TLBF_NOBROADCAST);
+	if (dirty) {
+		switch (pgsize) {
+		case PAGE_SIZE:
+			level = 3;
+			break;
+		case PMD_SIZE:
+			level = 2;
+			break;
+#ifndef __PAGETABLE_PMD_FOLDED
+		case PUD_SIZE:
+			level = 1;
+			break;
+#endif
+		default:
+			level = TLBI_TTL_UNKNOWN;
+			WARN_ON(1);
+		}
+
+		__flush_tlb_range(vma, address, address + pgsize, pgsize, level,
+				  TLBF_NOWALKCACHE | TLBF_NOBROADCAST);
+	}
 	return 1;
 }

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 0b7ccd0cbb9ec..30772a909aea3 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -427,11 +427,11 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	pte_t orig_pte;

 	VM_WARN_ON(!pte_present(pte));
+	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);

 	if (!pte_cont(pte))
-		return __ptep_set_access_flags(vma, addr, ptep, pte, dirty);
-
-	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
+		return __ptep_set_access_flags_anysz(vma, addr, ptep, pte,
+						     dirty, pgsize);

 	if (!__cont_access_flags_changed(ptep, pte, ncontig))
 		return 0;
--
2.43.0


