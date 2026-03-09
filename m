Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB67EA854C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 02:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkkW63rd7Ov2/idT11bBKBSlwE8v+ZjzfAfwhUTAfEQ=; b=Jm4+Z4H8h1xSd5MAwhjN1xzuX/
	XuHqeatyCYw+XZrroK8OGa4mr9osJh+c09n4blbGTiMwTQlh3iSxQagukqsZ9EE99kdb7ZziEIAP5
	snR0S62Ddt/99/TBHL+Os8nz0WJo6ZzNyQ/us+JB1P6IesYVzL68p3N2cL/5ZWSodXiWWqNdbQXXH
	Z4beWC/Fn+J3v5CZa6jvcWw8PJxRAH6sXKrYLxrQji+GMePcDQHOuKvhsVcNenJ/6IkqU87cEVQ2n
	uZdFdUeIFL5XE66QsnY6wTnqumLtvr86ZcvKscZTz6Q75yYzXtK53e5PbX1MnKv+qKBsgiBD0aZMd
	/8li9ngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzQoS-00000006ZHz-2lzv;
	Mon, 09 Mar 2026 02:57:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzQoK-00000006ZG3-220T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 02:57:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89E5B1D6F;
	Sun,  8 Mar 2026 19:57:28 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 69BF73F694;
	Sun,  8 Mar 2026 19:57:33 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Christoph Lameter <cl@gentwo.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 2/2] arm64/mm: Reject memory removal that splits a kernel leaf mapping
Date: Mon,  9 Mar 2026 02:57:25 +0000
Message-Id: <20260309025725.455004-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260309025725.455004-1-anshuman.khandual@arm.com>
References: <20260309025725.455004-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_195736_846182_5C383207 
X-CRM114-Status: GOOD (  19.90  )
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

Linear and vmemmap mappings that get torn down during a memory hot remove
operation might contain leaf level entries on any page table level. If the
requested memory range's linear or vmemmap mappings falls within such leaf
entries, new mappings need to be created for the remaining memory mapped on
the leaf entry earlier, following standard break before make aka BBM rules.
But kernel cannot tolerate BBM and hence remapping to fine grained leaves
would not be possible on systems without BBML2_NOABORT.

Currently memory hot remove operation does not perform such restructuring,
and so removing memory ranges that could split a kernel leaf level mapping
need to be rejected.

While memory_hotplug.c does appear to permit hot removing arbitrary ranges
of memory, the higher layers that drive memory_hotplug (e.g. ACPI, virtio,
...) all appear to treat memory as fixed size devices. So it is impossible
to hot unplug a different amount than was previously hot plugged, and hence
we should never see a rejection in practice, but adding the check makes us
robust against a future change.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Link: https://lore.kernel.org/all/aWZYXhrT6D2M-7-N@willie-the-truck/
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/mm/mmu.c | 120 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 114 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 5dbf988120c8..5fb9a66f0754 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2014,6 +2014,107 @@ void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 	__remove_pgd_mapping(swapper_pg_dir, __phys_to_virt(start), size);
 }
 
+
+static bool addr_splits_kernel_leaf(unsigned long addr)
+{
+	pgd_t *pgdp, pgd;
+	p4d_t *p4dp, p4d;
+	pud_t *pudp, pud;
+	pmd_t *pmdp, pmd;
+	pte_t *ptep, pte;
+
+	/*
+	 * If the given address points at a the start address of
+	 * a possible leaf, we certainly won't split. Otherwise,
+	 * check if we would actually split a leaf by traversing
+	 * the page tables further.
+	 */
+	if (IS_ALIGNED(addr, PGDIR_SIZE))
+		return false;
+
+	pgdp = pgd_offset_k(addr);
+	pgd = pgdp_get(pgdp);
+	if (!pgd_present(pgd))
+		return false;
+
+	if (IS_ALIGNED(addr, P4D_SIZE))
+		return false;
+
+	p4dp = p4d_offset(pgdp, addr);
+	p4d = p4dp_get(p4dp);
+	if (!p4d_present(p4d))
+		return false;
+
+	if (IS_ALIGNED(addr, PUD_SIZE))
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
+	if (IS_ALIGNED(addr, CONT_PMD_SIZE))
+		return false;
+
+	pmdp = pmd_offset(pudp, addr);
+	pmd = pmdp_get(pmdp);
+	if (!pmd_present(pmd))
+		return false;
+
+	if (pmd_cont(pmd))
+		return true;
+
+	if (IS_ALIGNED(addr, PMD_SIZE))
+		return false;
+
+	if (pmd_leaf(pmd))
+		return true;
+
+	if (IS_ALIGNED(addr, CONT_PTE_SIZE))
+		return false;
+
+	ptep = pte_offset_kernel(pmdp, addr);
+	pte = __ptep_get(ptep);
+	if (!pte_present(pte))
+		return false;
+
+	if (pte_cont(pte))
+		return true;
+
+	return !IS_ALIGNED(addr, PAGE_SIZE);
+}
+
+static bool can_unmap_without_split(unsigned long pfn, unsigned long nr_pages)
+{
+	unsigned long phys_start, phys_end, start, end;
+
+	phys_start = PFN_PHYS(pfn);
+	phys_end = phys_start + nr_pages * PAGE_SIZE;
+
+	/* PFN range's linear map edges are leaf entry aligned */
+	start = __phys_to_virt(phys_start);
+	end =  __phys_to_virt(phys_end);
+	if (addr_splits_kernel_leaf(start) || addr_splits_kernel_leaf(end)) {
+		pr_warn("[%lx %lx] splits a leaf entry in linear map\n",
+			phys_start, phys_end);
+		return false;
+	}
+
+	/* PFN range's vmemmap edges are leaf entry aligned */
+	BUILD_BUG_ON(!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP));
+	start = (unsigned long)pfn_to_page(pfn);
+	end = (unsigned long)pfn_to_page(pfn + nr_pages);
+	if (addr_splits_kernel_leaf(start) || addr_splits_kernel_leaf(end)) {
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
@@ -2022,8 +2123,11 @@ void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
  * In future if and when boot memory could be removed, this notifier
  * should be dropped and free_hotplug_page_range() should handle any
  * reserved pages allocated during boot.
+ *
+ * This also blocks any memory remove that would have caused a split
+ * in leaf entry in kernel linear or vmemmap mapping.
  */
-static int prevent_bootmem_remove_notifier(struct notifier_block *nb,
+static int prevent_memory_remove_notifier(struct notifier_block *nb,
 					   unsigned long action, void *data)
 {
 	struct mem_section *ms;
@@ -2069,11 +2173,15 @@ static int prevent_bootmem_remove_notifier(struct notifier_block *nb,
 			return NOTIFY_DONE;
 		}
 	}
+
+	if (!can_unmap_without_split(pfn, arg->nr_pages))
+		return NOTIFY_BAD;
+
 	return NOTIFY_OK;
 }
 
-static struct notifier_block prevent_bootmem_remove_nb = {
-	.notifier_call = prevent_bootmem_remove_notifier,
+static struct notifier_block prevent_memory_remove_nb = {
+	.notifier_call = prevent_memory_remove_notifier,
 };
 
 /*
@@ -2123,7 +2231,7 @@ static void validate_bootmem_online(void)
 	}
 }
 
-static int __init prevent_bootmem_remove_init(void)
+static int __init prevent_memory_remove_init(void)
 {
 	int ret = 0;
 
@@ -2131,13 +2239,13 @@ static int __init prevent_bootmem_remove_init(void)
 		return ret;
 
 	validate_bootmem_online();
-	ret = register_memory_notifier(&prevent_bootmem_remove_nb);
+	ret = register_memory_notifier(&prevent_memory_remove_nb);
 	if (ret)
 		pr_err("%s: Notifier registration failed %d\n", __func__, ret);
 
 	return ret;
 }
-early_initcall(prevent_bootmem_remove_init);
+early_initcall(prevent_memory_remove_init);
 #endif
 
 pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
-- 
2.30.2


