Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF81C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCCmK+o9wKQf5+3Ew8M4Jk3nTsjcUPa/yWersiCGiuk=; b=gxVz5UvAgufZo1fkis2ZKDGFlW
	3FhOZhVP7uNkvQeQlxeFHpRv2RQY9jpjrxfnT/9HhALkDFZR8XWoT8I88Mmpfnl5VDcxxlmhk2qQh
	aq31FOMiBC6YmYmDJTlAkRKbzRlKWZRFZ0mP+G+/hMsR2GQ3hS0qKw3HwwDuG/dNI8vKyjKEtzv0t
	KXpPxlB4BKojWrPBzWRvBhGeyNFUFQpixZbtpAMm9U1mt9CZuIeRoQM09XOA9duRxaPN8YFFe6UeB
	yCnAhuwvlpCdewD19g94auAG4fPLDf9fBvxSqbH09oUjEx8rlIw7zaepCMkdumic+NEBQDPy5WTaS
	UN8qVs/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhQ-0000000GCGS-2Vl7;
	Wed, 08 Jul 2026 03:11:48 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhH-0000000GC7A-1MhH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:42 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2cc640dfde3so3710485ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480298; x=1784085098; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCCmK+o9wKQf5+3Ew8M4Jk3nTsjcUPa/yWersiCGiuk=;
        b=BD1kC5EJUSCdz14biTHbJ9QNTKXto9U49zmvDIx2+R6eK1i6/1zcjihcMDPQQ/0j4y
         bSg5/+TaCQx1t4iTurmHsC7zM5EIy2sdh3Y2tHdmiB39rzyTdbJpxKhGIJJe2D8u+RiJ
         eFF4KFt9wX7yAqSggdmGKus5Ld4uTvs/QGap5GVE/OtQ2p7Dy0uxfh8W5E5MpQzT0VkJ
         97B7jbypFvSRAoQJ1YNHm1yYB9vI0mhYcB6AeQLUBhmaw4pY7TVX09bhbaNNgb7sfdn1
         bJidWeo+U/xN7sFI27Y2xqtzxRbGS181QKh54ZGoS2TOMahssErI2+lbnY0kA7DMhK75
         k9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480298; x=1784085098;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCCmK+o9wKQf5+3Ew8M4Jk3nTsjcUPa/yWersiCGiuk=;
        b=ZXZcz3R0f2Q/1lWYQ1Rkuls66OJUypkMdp3aw2Ce09Y6PtUWmb526TZTdO2A1FfmHQ
         9CVqJwR5owbUjaIvwYtVuZRox5ohAukeUm7EGwBqL2DS5Om7Of8IzAT9QLN/n1kHPgRN
         VuX0Xi+Ja+bwK8uhtaNHPfmva3NSaxvOP+hwkEXTil8cT5nzD1jbHXqXV3Zbg9zcqfgB
         pPtQXMZJbA0o+1N9tzesD9C1F1pKnkb6ka64sNq19Mywfu5sxDn3bKNokuwAGqP0xRd8
         bHV62EuFOpnLyPnI/RVIqOn5HxlrHrI7WMbUtSCx5qBDwnTyGVAOw8jbjX2M3unCV+eU
         7OIg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1Tsv6HswIp+zEoBqxNnUzP7X1HdKFPqTsd1JRvWMuKMrbrYCmWQcMXyG6xnR8CT8qs9u8DeJmgME8Xji9tVAf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/clPm3PtVzQG7ES+2X5k36+Kw78oqV5Nt4ywu8a5sNZvmsFL/
	IuXgM51mXHrkozZg+4gw3eCFPgmDFfBKNaF7BCE8gJv5Nd11XaS1efed/81yGtyv2uLOf+Ymup6
	jrPzMfsNLhCjk5SUkv8n6Lg==
X-Received: from plmp1.prod.google.com ([2002:a17:903:f01:b0:2ca:eea9:9845])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e943:b0:2c9:2ee6:693e with SMTP id d9443c01a7336-2ccea3c1987mr5977265ad.18.1783480297144;
 Tue, 07 Jul 2026 20:11:37 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:14 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-5-jthoughton@google.com>
Subject: [PATCH 04/18] hugetlb_vmemmap: Use try_update_vmemmap_pte to update
 in-use PTEs
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_201139_532248_5D19D93B 
X-CRM114-Status: GOOD (  26.22  )
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

set_pte_at() cannot be used to replace in-use vmemmap PTEs on arm64, so
replace it with a more specific routine, try_update_vmemmap_pte().

try_update_vmemmap_pte() is used for modifying page table entries such
that there is a guarantee that no fault will be taken.

For the x86, riscv, and loongarch implementations, please note one
difference: set_pte() does not invoke page_table_check_ptes_set(), but
set_pte_at(), the call we are about to replace, does. However, this is a
functional no-op because page_table_check_ptes_set() does nothing for
init_mm PTEs, which vmemmap PTEs are.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/loongarch/include/asm/pgtable.h |  8 ++++
 arch/riscv/include/asm/pgtable.h     |  8 ++++
 arch/x86/include/asm/pgtable.h       |  8 ++++
 include/linux/pgtable.h              | 21 +++++++++++
 mm/hugetlb_vmemmap.c                 | 56 +++++++++++++++++++---------
 5 files changed, 84 insertions(+), 17 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 223528c04d73..e7b65056ef73 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -638,6 +638,14 @@ static inline long pmd_protnone(pmd_t pmd)
 #define pmd_leaf(pmd)		((pmd_val(pmd) & _PAGE_HUGE) != 0)
 #define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
 
+#define __HAVE_ARCH_TRY_UPDATE_VMEMMAP_PTE
+static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *ptep,
+					 pte_t pte)
+{
+	set_pte(ptep, pte);
+	return 0;
+}
+
 /*
  * We provide our own get_unmapped area to cope with the virtual aliasing
  * constraints placed on us by the cache architecture.
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5d5756bda82e..a11c569ee2f0 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1162,6 +1162,14 @@ static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
 
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+#define __HAVE_ARCH_TRY_UPDATE_VMEMMAP_PTE
+static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *ptep,
+					 pte_t pte)
+{
+	set_pte(ptep, pte);
+	return 0;
+}
+
 /*
  * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
  * are !pte_none() && !pte_present().
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index ac295ca6c92f..974151564071 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1372,6 +1372,14 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 }
 #endif
 
+#define __HAVE_ARCH_TRY_UPDATE_VMEMMAP_PTE
+static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *ptep,
+					 pte_t pte)
+{
+	set_pte(ptep, pte);
+	return 0;
+}
+
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static inline pud_t pudp_establish(struct vm_area_struct *vma,
 		unsigned long address, pud_t *pudp, pud_t pud)
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 2981e386da7b..e1abccf76bb4 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -457,6 +457,27 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 #endif
 #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
 
+#ifndef __HAVE_ARCH_TRY_UPDATE_VMEMMAP_PTE
+/*
+ * try_update_vmemmap_pte - Remap PTEs used by the vmemmap.
+ * @addr: Base address of the remapped PTE.
+ * @ptep: Page table pointer to be overwritten.
+ * @pte: Page table entry to write.
+ *
+ * This function is only to be used to update PTEs that map the vmemmap. The
+ * only valid transitions supported by this function are: leaf-level
+ * (PAGE_SIZE), valid-to-valid. The pfn and prot bits may be changed.
+ *
+ * Implementations of this function must ensure that, while the update is taking
+ * place, CPUs will not fault on the remapped virtual address.
+ */
+static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *ptep,
+					 pte_t pte)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 extern int ptep_set_access_flags(struct vm_area_struct *vma,
 				 unsigned long address, pte_t *ptep,
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 5fee01bf5b34..3951c043164a 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -34,7 +34,7 @@
  *			operations.
  */
 struct vmemmap_remap_walk {
-	void			(*remap_pte)(pte_t *pte, unsigned long addr,
+	int			(*remap_pte)(pte_t *pte, unsigned long addr,
 					     struct vmemmap_remap_walk *walk);
 
 	unsigned long		nr_walked;
@@ -141,11 +141,13 @@ static int vmemmap_pte_entry(pte_t *pte, unsigned long addr,
 			     unsigned long next, struct mm_walk *walk)
 {
 	struct vmemmap_remap_walk *vmemmap_walk = walk->private;
+	int ret = 0;
 
-	vmemmap_walk->remap_pte(pte, addr, vmemmap_walk);
-	vmemmap_walk->nr_walked++;
+	ret = vmemmap_walk->remap_pte(pte, addr, vmemmap_walk);
+	if (!ret)
+		vmemmap_walk->nr_walked++;
 
-	return 0;
+	return ret;
 }
 
 static const struct mm_walk_ops vmemmap_remap_ops = {
@@ -197,18 +199,20 @@ static void free_vmemmap_page_list(struct list_head *list)
 		free_vmemmap_page(page);
 }
 
-static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
-			      struct vmemmap_remap_walk *walk)
+static int vmemmap_remap_pte(pte_t *pte, unsigned long addr,
+			     struct vmemmap_remap_walk *walk)
 {
 	struct page *page = pte_page(ptep_get(pte));
 	pte_t entry;
+	bool head;
+	int ret;
+
+	head = walk->nr_walked == 0 && walk->vmemmap_head;
 
 	/* Remapping the head page requires r/w */
-	if (unlikely(walk->nr_walked == 0 && walk->vmemmap_head)) {
+	if (unlikely(head)) {
 		VM_WARN_ON_ONCE(!PageHead((const struct page *)addr));
 
-		list_del(&walk->vmemmap_head->lru);
-
 		/*
 		 * Makes sure that preceding stores to the page contents from
 		 * vmemmap_remap_free() become visible before the set_pte_at()
@@ -227,17 +231,30 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 		entry = mk_pte(walk->vmemmap_tail, PAGE_KERNEL_RO);
 	}
 
+	ret = try_update_vmemmap_pte(addr, pte, entry);
+	if (ret)
+		return ret;
+
+	/* We successfully overwrote the vmemmap PTE, so we can free
+	 * the vmemmap page that was just unmapped, and if we mapped
+	 * the new head page, remove it from the list so that it
+	 * doesn't get freed later.
+	 */
 	list_add(&page->lru, walk->vmemmap_pages);
-	set_pte_at(&init_mm, addr, pte, entry);
+	if (head)
+		list_del(&walk->vmemmap_head->lru);
+
+	return 0;
 }
 
-static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
-				struct vmemmap_remap_walk *walk)
+static int vmemmap_restore_pte(pte_t *pte, unsigned long addr,
+			       struct vmemmap_remap_walk *walk)
 {
 	struct page *src = pte_page(ptep_get(pte)), *dst;
+	int ret;
 
 	if (WARN_ON_ONCE(!walk->vmemmap_tail))
-		return;
+		return -EINVAL;
 
 	/*
 	 * When restoring a partially-HVOed page, keep the copied head page
@@ -245,20 +262,25 @@ static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 	 * page.
 	 */
 	if (walk->vmemmap_tail != src)
-		return;
+		return 0;
 
 	VM_WARN_ON_ONCE(PageHead((const struct page *)addr));
 
 	dst = list_first_entry(walk->vmemmap_pages, struct page, lru);
-	list_del(&dst->lru);
 	copy_page(page_to_virt(dst), page_to_virt(src));
 
 	/*
 	 * Makes sure that preceding stores to the page contents become visible
-	 * before the set_pte_at() write.
+	 * before the try_update_vmemmap_pte() write.
 	 */
 	smp_wmb();
-	set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
+
+	ret = try_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
+	if (ret)
+		return ret;
+
+	list_del(&dst->lru);
+	return 0;
 }
 
 /**
-- 
2.55.0.795.g602f6c329a-goog


