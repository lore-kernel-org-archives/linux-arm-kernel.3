Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB148CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CW0PrPzO/He6EZ9NlACY98E/BL7OIKImRa0WQareyfQ=; b=UU6XHI2tWP8E9Gfj2hCf/rDeAs
	OIELXGgLlcSSGd6JAWBK8hDiYqnDWr1QXYqFje5BlgQe0Vnlr3xF4jqfb5whmOyzkRcNCSlCBv22n
	eyNDSdn2dqYeMRjcdYcV9gRijSwFM9SOaD+HqDBsvJM1BkaUSKapLqNOjFHZcwwYDqEy1UWanDjtk
	1zkOmXSQgFdzG4dMmCK/Qd4jDW+bar5NmGhZSmXEIOlaWpfufrmT8bLIJkhUxKH01puoRH1UGasYk
	YTMz89MG+njnyxO4uOwIrkaUgl4rJb18MdHGKSCLFfUliZ0OhBEmUROmmh5HWIaT7leW0s419+bGH
	e745G46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVa-0000000Cn9Z-0BZU;
	Sat, 03 Oct 2026 00:21:46 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVU-0000000Cn2G-1cRF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:43 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cc7e6720b31so73361a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986899; x=1791591699; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CW0PrPzO/He6EZ9NlACY98E/BL7OIKImRa0WQareyfQ=;
        b=XO3P0vZcT7kBo6jGlFDwJwHIc1WC7pQyydVHhANfQNzf4Q/mchLqEpLUanesxIeAkP
         x77ggKClnJsG7G0uBaKnOhHaOoo3lsUWfy/3UvsH+c+XKFa4uy4BR8ALB4AE5DGaAxuM
         0hwbTcXFb2PA+M+bg4ApUljjlM78LSPdihNLmJKjIoMvDCNPxjgxHmIEu5nINQobBPqs
         0InTG4+psqiTgm/rpWhxm7iiykGbFgYVMNRRHeOIEeVAiTDD5DWqfRsbUM9FfRqXk7OK
         4g+AZcE10hUZsrTE0tLgyoKwsPYEKbRdsnzl08DCxPq11kvwoTcR/zRFfgsWTSDHnrzW
         dwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986899; x=1791591699;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CW0PrPzO/He6EZ9NlACY98E/BL7OIKImRa0WQareyfQ=;
        b=ILQBZDkedpbwoM/KP9L6gJNvKuCz9ry9lIdRppIu+EA9wCqeMqT6iOdYQRIPj4r7FX
         DVnzSerDwk78Pw0RqM/0S5vUdQxx2mjkkibYL3gtbo/Xzl05n7+S7jml6FOjecRSCsgG
         ojXbYUEmkTLD4mfqLCKI8d1nvimMgnmbLejICyO2doql/4YrlfvLyWzuNddRotijws1R
         xMnE4A94ZgcSk67WCzw2cwYHdP6KFZlY52Z03Au6UVpzc719OWPLAnfCNDH34ju6P0I1
         mlMMIAfu9YJwDE9gHfPiPJdS3cGL2/dXGolkJryV80agmnkKXxB2G1yxcYuusYOn+XhW
         FXWw==
X-Forwarded-Encrypted: i=1; AKwUvBwvmyTjOcgmIrIDgBydOchcYcP8z5pCDOeBxErAwyH4HfzBvZa5T7l15gVvz7sK4152F/ldjxcULkYAnq5zxD/R@lists.infradead.org
X-Gm-Message-State: AFq9FYJ177GGiWOoCzPmIgbfp9HRDfSFS7JgWzvlRzo9G9CUwUZYzDLD
	odzlyeKwjgINUrwrsCsttUbAhUhuOnSGOS4b9YVE50+ylno9acwV2olbvjMd6Nv2g1TIaoUBWg2
	ew50cXCEP6Urrv11ztQAApQ==
X-Received: from pgby27-n2.prod.google.com ([2002:a05:6a02:651b:20b0:cc7:d8ea:a7b5])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:134c:b0:39e:6a7e:ee1b with SMTP id 98e67ed59e1d1-3a6ce7db233mr2804158a91.39.1790986898532;
 Fri, 02 Oct 2026 17:21:38 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:08 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-6-jthoughton@google.com>
Subject: [PATCH v2 05/20] hugetlb_vmemmap: Use try_update_vmemmap_pte to
 update in-use PTEs
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_172140_603317_82EAB276 
X-CRM114-Status: GOOD (  25.99  )
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

For the generic implementation, please note one difference: set_pte()
does not invoke page_table_check_ptes_set(), but set_pte_at(), the call
we are about to replace, does. However, this is a functional no-op
because page_table_check_ptes_set() does nothing for init_mm PTEs, which
vmemmap PTEs are.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/loongarch/include/asm/pgtable.h |  2 +
 arch/riscv/include/asm/pgtable.h     |  2 +
 arch/x86/include/asm/pgtable.h       |  2 +
 include/linux/pgtable.h              | 22 +++++++++++
 mm/hugetlb_vmemmap.c                 | 56 +++++++++++++++++++---------
 5 files changed, 67 insertions(+), 17 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index f87603135131..123eda3f6035 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -633,6 +633,8 @@ static inline long pmd_protnone(pmd_t pmd)
 #define pmd_leaf(pmd)		((pmd_val(pmd) & _PAGE_HUGE) != 0)
 #define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
+
 /*
  * We provide our own get_unmapped area to cope with the virtual aliasing
  * constraints placed on us by the cache architecture.
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4c8fc6845503..6cfae7720882 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1165,6 +1165,8 @@ static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
 
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
+
 /*
  * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
  * are !pte_none() && !pte_present().
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index ef0252a09c28..f60c09cdf1ec 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1368,6 +1368,8 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 }
 #endif
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
+
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static inline pud_t pudp_establish(struct vm_area_struct *vma,
 		unsigned long address, pud_t *pudp, pud_t pud)
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 780fe849ff8b..59ab7ca93548 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -457,6 +457,28 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 #endif
 #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
 
+#ifdef ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
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
+	set_pte(ptep, pte);
+	return 0;
+}
+#endif
+
 #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 extern int ptep_set_access_flags(struct vm_area_struct *vma,
 				 unsigned long address, pte_t *ptep,
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 90db4d069ff6..3fdb1e4ce1a1 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -33,7 +33,7 @@
  *			operations.
  */
 struct vmemmap_remap_walk {
-	void			(*remap_pte)(pte_t *pte, unsigned long addr,
+	int			(*remap_pte)(pte_t *pte, unsigned long addr,
 					     struct vmemmap_remap_walk *walk);
 
 	unsigned long		nr_walked;
@@ -140,11 +140,13 @@ static int vmemmap_pte_entry(pte_t *pte, unsigned long addr,
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
@@ -196,18 +198,20 @@ static void free_vmemmap_page_list(struct list_head *list)
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
@@ -226,17 +230,30 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
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
@@ -244,20 +261,25 @@ static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
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
2.56.0.rc1.315.gc6ed9934b7-goog


