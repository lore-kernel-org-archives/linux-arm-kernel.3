Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD906D172C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 04:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bp1GoSAVURn+ajIdvsX4NLJ2kLcBwh0pa16LEr0wz+g=; b=npA4pFA+WQ6ZpO/72TISjDOk+X
	91zekoO3PpW9THlfBIGSydO/57HHueY7icTY3CndsyAT/7ZWd2skYbrif1glRY7H6DPM6fXV/TkVE
	o+wozI9K8gK/TP2dB/86sb/oXGH/6Sw3uT3jEY/LBJ5gDJxp76ORW7SyNidv3LU2bfh/qt0gjCFpL
	oCj/h5FqXikrExv66Ee0kfMgWxxj+a9+zVC6nDfgPkdqXAVCev/P8eLLOUTXVlyGG5YxGlZ86i0ka
	nfnt+f94j7rCmMHHJWes3XHZZyi0xBgcs+fX+y7CvVAGgGgF4gW/z0aUi83n1WfC+FLr+1HweoLGu
	rrQPP1YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmlWO-00000004Pv4-2nqY;
	Mon, 02 Feb 2026 04:26:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmlW9-00000004PsG-1Yl3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 04:26:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C100D1042;
	Sun,  1 Feb 2026 20:26:20 -0800 (PST)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D2D5E3F740;
	Sun,  1 Feb 2026 20:26:25 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Christoph Lameter <cl@gentwo.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] arm64/mm: Reject memory removal that splits a kernel leaf mapping
Date: Mon,  2 Feb 2026 04:26:17 +0000
Message-Id: <20260202042617.504183-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260202042617.504183-1-anshuman.khandual@arm.com>
References: <20260202042617.504183-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_202629_642417_516ED7FA 
X-CRM114-Status: GOOD (  12.02  )
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

Linear and vmemmap mapings that get teared down during a memory hot remove
operation might contain leaf level entries on any page table level. If the
requested memory range's linear or vmemmap mappings falls within such leaf
entries, new mappings need to be created for the remaning memory mapped on
the leaf entry earlier, following standard break before make aka BBM rules.

Currently memory hot remove operation does not perform such restructuring,
and so removing memory ranges that could split a kernel leaf level mapping
need to be rejected.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Closes: https://lore.kernel.org/all/aWZYXhrT6D2M-7-N@willie-the-truck/
Fixes: bbd6ec605c0f ("arm64/mm: Enable memory hot remove")
Cc: stable@vger.kernel.org
Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/mm/mmu.c | 126 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 8ec8a287aaa1..9d59e10fb3de 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2063,6 +2063,129 @@ void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 	__remove_pgd_mapping(swapper_pg_dir, __phys_to_virt(start), size);
 }
 
+
+static bool split_kernel_leaf_boundary(unsigned long addr)
+{
+	pgd_t *pgdp, pgd;
+	p4d_t *p4dp, p4d;
+	pud_t *pudp, pud;
+	pmd_t *pmdp, pmd;
+	pte_t *ptep, pte;
+
+	/*
+	 * PGD: If addr is PGD aligned then addr already
+	 * describes a leaf boundary.
+	 */
+	if (ALIGN_DOWN(addr, PGDIR_SIZE) == addr)
+		return false;
+
+	pgdp = pgd_offset_k(addr);
+	pgd = pgdp_get(pgdp);
+	if (!pgd_present(pgd))
+		return false;
+
+	/*
+	 * P4D: If addr is P4D aligned then addr already
+	 * describes a leaf boundary.
+	 */
+	if (ALIGN_DOWN(addr, P4D_SIZE) == addr)
+		return false;
+
+	p4dp = p4d_offset(pgdp, addr);
+	p4d = p4dp_get(p4dp);
+	if (!p4d_present(p4d))
+		return false;
+
+	/*
+	 * PUD: If addr is PUD aligned then addr already
+	 * describes a leaf boundary.
+	 */
+	if (ALIGN_DOWN(addr, PUD_SIZE) == addr)
+		return false;
+
+	pudp = pud_offset(p4dp, addr);
+	pud = pudp_get(pudp);
+	if (!pud_present(pud))
+		return false;
+
+	if (pud_leaf(pud))
+		return true;
+
+	/*
+	 * CONT_PMD: If addr is CONT_PMD aligned then
+	 * addr already describes a leaf boundary.
+	 */
+	if (ALIGN_DOWN(addr, CONT_PMD_SIZE) == addr)
+		return false;
+
+	pmdp = pmd_offset(pudp, addr);
+	pmd = pmdp_get(pmdp);
+	if (!pmd_present(pmd))
+		return false;
+
+	if (pmd_leaf(pmd) && pmd_cont(pmd))
+		return true;
+
+	/*
+	 * PMD: If addr is PMD aligned then addr already
+	 * describes a leaf boundary.
+	 */
+	if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
+		return false;
+
+	if (pmd_leaf(pmd))
+		return true;
+
+	/*
+	 * CONT_PTE: If addr is CONT_PTE aligned then addr
+	 * already describes a leaf boundary.
+	 */
+	if (ALIGN_DOWN(addr, CONT_PTE_SIZE) == addr)
+		return false;
+
+	ptep = pte_offset_kernel(pmdp, addr);
+	pte = __ptep_get(ptep);
+	if (!pte_present(pte))
+		return false;
+
+	if (pte_valid(pte) && pte_cont(pte))
+		return true;
+
+	if (ALIGN_DOWN(addr, PAGE_SIZE) == addr)
+		return false;
+	return true;
+}
+
+static bool can_unmap_without_split(unsigned long pfn, unsigned long nr_pages)
+{
+	unsigned long linear_start, linear_end, phys_start, phys_end;
+	unsigned long vmemmap_size, vmemmap_start, vmemmap_end;
+
+	/* Assert linear map edges do not split a leaf entry */
+	phys_start = PFN_PHYS(pfn);
+	phys_end = phys_start + nr_pages * PAGE_SIZE;
+	linear_start = __phys_to_virt(phys_start);
+	linear_end =  __phys_to_virt(phys_end);
+	if (split_kernel_leaf_boundary(linear_start) ||
+	    split_kernel_leaf_boundary(linear_end)) {
+		pr_warn("[%lx %lx] splits a leaf entry in linear map\n",
+			phys_start, phys_end);
+		return false;
+	}
+
+	/* Assert vmemmap edges do not split a leaf entry */
+	vmemmap_size = nr_pages * sizeof(struct page);
+	vmemmap_start = (unsigned long) pfn_to_page(pfn);
+	vmemmap_end = vmemmap_start + vmemmap_size;
+	if (split_kernel_leaf_boundary(vmemmap_start) ||
+	    split_kernel_leaf_boundary(vmemmap_end)) {
+		pr_warn("[%lx %lx] splits a leaf entry in vmemmap\n",
+			phys_start, phys_end);
+		return false;
+	}
+	return true;
+}
+
 /*
  * This memory hotplug notifier helps prevent boot memory from being
  * inadvertently removed as it blocks pfn range offlining process in
@@ -2083,6 +2206,9 @@ static int prevent_bootmem_remove_notifier(struct notifier_block *nb,
 	if ((action != MEM_GOING_OFFLINE) && (action != MEM_OFFLINE))
 		return NOTIFY_OK;
 
+	if (!can_unmap_without_split(pfn, arg->nr_pages))
+		return NOTIFY_BAD;
+
 	for (; pfn < end_pfn; pfn += PAGES_PER_SECTION) {
 		unsigned long start = PFN_PHYS(pfn);
 		unsigned long end = start + (1UL << PA_SECTION_SHIFT);
-- 
2.30.2


