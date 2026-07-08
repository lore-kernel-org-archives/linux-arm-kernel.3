Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85561C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyOZS/IOogCiOtSe1oniQEutV7yDNXcShcSAXMB8Vac=; b=L+ZE3rG+plNmkE+WxOV7Vo+IBT
	iQsG5NjiH22vslmP8DJtOimwLoDxDMCb9INTdWJiQHbnL42qKWC9h5HUKG6ZxXhusDPBFqG7USkbX
	aAJ35KramAlDfaDpfoydNKdcMvR8o2Bfq9nlW8etrKwpqchRrnl/SgwDkQfM+5AItm91WOK0L3i82
	l6XM5KSrqIpVfhWlBXz6nmcudCXQtJJGh4UxQnQ7+SXeFCq+TcsoRvwrhaC+fFVNuXWrN8kIDsRal
	Z+tuZXbHqSE7O1w7hTyOIgkL7a3hZEDhhrqhQkQLbOkmyRB+c2oeZAGwW8WUMhFqTnzhrDhkXf9D2
	s0hddWxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhs-0000000GCvB-1On2;
	Wed, 08 Jul 2026 03:12:16 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhM-0000000GCAi-1CKr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:46 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2cca3673560so4408845ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480303; x=1784085103; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nyOZS/IOogCiOtSe1oniQEutV7yDNXcShcSAXMB8Vac=;
        b=qfHvyx2Erro3R5M7zXxBAV1IFYk8cCR4DkHXkF448zFcmrGMjWnjXHlz96KUIGPLk9
         5dK4mW4UqVXz0LMq9qa+f1oCdAfywya4xmwMjd/X30TxPnZJ6cAdKlpteRZmrbLNhAUR
         4KxC3jOA5pJszpaZbAxhRgSvftvlqwjcjs0sR5pW9u0roHgUPGTbt8ebT6Yt4rKny93w
         x42iMoM/CQjQ7QTE5SVqkWDg5TX+jhS8AlxLMAoWWgP3b22i1McKiJ+useRN61H6BAEI
         B/xFYl35OgCEth8GArCOfzSwauNXKDFEleAaX6YQ+avM2Ji+zZUxUyQU3a/yPeffulan
         gfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480303; x=1784085103;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nyOZS/IOogCiOtSe1oniQEutV7yDNXcShcSAXMB8Vac=;
        b=pgXFYNYjbCI/NFa1Ip1IKWwF8Ehz/FKaFz5v2aX/GpB59nmmXncHWjMkljC/Bebb5z
         X5rpqUp9eT/DAl+nYkRT8GG6LAOi+6fbj6xaGCohZPk9KobzpceqiF9DKxMa9M600E8i
         0LtDYrgswWM9drhcyfhHujGFm0q6AtnxYmjOsUXp7OCDpLV4xFpcHjXQfiyl8CZIrfhs
         cjRrCqrLmJPdb5f3eMHlDIruKxS6j/8qbDUR9pvsKreMSA5P2CCM+V/VsQIwujuRps/T
         Eeh7S72yrWDc3JRBDhCjYmYPXn82HXBcCmD3tUe56OvbaK7mWoffC+oAKn38mrNqY8xx
         Pa8A==
X-Forwarded-Encrypted: i=1; AHgh+RqngOX2ImAw5+OTphCFD5jrl00KHE47B8S3mb0ZL3LsORsmXrbXtC9ck9ec57CM5nOGggN72rsS2TKtmTvQ3niQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7ySzokctgTppMa1Vd9WC2AbB6Nato384uKobGJNHWV/bdlW0K
	OK8wqlQwc5S92J/m2dCO+MvnlB+NuMujpSSHtKFYG2wKSl/cK0HHKmynByLwKf4dhOvDnYcD8eL
	fBuaZKeLqLxzFABhtlzFZXw==
X-Received: from plbmk12.prod.google.com ([2002:a17:903:2bcc:b0:2cc:e106:f652])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:4684:b0:2ca:9ab:e723 with SMTP id d9443c01a7336-2ccea481a57mr6652835ad.33.1783480302952;
 Tue, 07 Jul 2026 20:11:42 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:21 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-12-jthoughton@google.com>
Subject: [PATCH 11/18] hugetlb_vmemmap: Use try_populate_vmemmap_pmd for
 replacing in-use PMDs
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
X-CRM114-CacheID: sfid-20260707_201144_348926_3395B218 
X-CRM114-Status: GOOD (  22.60  )
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

This routine is to be used for updating in-use, leaf-level PMDs in the
vmemmap without introducing a window where vmemmap accesses might fault.

Because try_populate_vmemmap_pmd() can fail, the split_page() call needs
to be moved to after the PMD update. Because both split_page() and the
PMD update are done under the page table lock, this rearrangement is
safe.

Only leaf-level PMD to non-leaf PMD (mapping the same physical pages) is
the only transition that needs to be supported.

Collapsing a non-leaf PMD to a leaf-level PMD is not used by HVO, so
try_populate_vmemmap_pmd() need not support it.

This patch allows arm64's implementation to replaced with one that does
not require BBML2_NOABORT.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/pgalloc.h     |  9 +++++++++
 arch/loongarch/include/asm/pgalloc.h |  8 ++++++++
 arch/riscv/include/asm/pgalloc.h     |  8 ++++++++
 arch/x86/include/asm/pgalloc.h       |  8 ++++++++
 include/linux/pgalloc.h              | 20 ++++++++++++++++++++
 mm/hugetlb_vmemmap.c                 | 28 ++++++++++++++++------------
 6 files changed, 69 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 1b4509d3382c..c8946250d431 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -121,4 +121,13 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, pgtable_t ptep)
 		       PMD_TYPE_TABLE | PMD_TABLE_AF | PMD_TABLE_PXN);
 }
 
+#define __HAVE_ARCH_TRY_POPULATE_VMEMMAP_PMD
+static inline int try_populate_vmemmap_pmd(pmd_t *pmdp, pte_t *pgtable,
+					   unsigned long addr)
+{
+	/* BBML2_NOABORT is required. Its presence has been checked. */
+	pmd_populate_kernel(&init_mm, pmdp, pgtable);
+	return 0;
+}
+
 #endif
diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 248f62d0b590..9322d962c9cc 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -24,6 +24,14 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd, pgtable_t pte)
 	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
 }
 
+#define __HAVE_ARCH_TRY_POPULATE_VMEMMAP_PMD
+static inline int try_populate_vmemmap_pmd(pmd_t *pmdp, pte_t *pgtable,
+					   unsigned long addr)
+{
+	pmd_populate_kernel(&init_mm, pmdp, pgtable);
+	return 0;
+}
+
 #ifndef __PAGETABLE_PMD_FOLDED
 
 static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 770ce18a7328..8dbbe62b2574 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -31,6 +31,14 @@ static inline void pmd_populate(struct mm_struct *mm,
 	set_pmd(pmd, __pmd((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
 }
 
+#define __HAVE_ARCH_TRY_POPULATE_VMEMMAP_PMD
+static inline int try_populate_vmemmap_pmd(pmd_t *pmdp, pte_t *pgtable,
+					   unsigned long addr)
+{
+	pmd_populate_kernel(&init_mm, pmdp, pgtable);
+	return 0;
+}
+
 #ifndef __PAGETABLE_PMD_FOLDED
 static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
 {
diff --git a/arch/x86/include/asm/pgalloc.h b/arch/x86/include/asm/pgalloc.h
index c88691b15f3c..47b56bbd6236 100644
--- a/arch/x86/include/asm/pgalloc.h
+++ b/arch/x86/include/asm/pgalloc.h
@@ -82,6 +82,14 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 	set_pmd(pmd, __pmd(((pteval_t)pfn << PAGE_SHIFT) | _PAGE_TABLE));
 }
 
+#define __HAVE_ARCH_TRY_POPULATE_VMEMMAP_PMD
+static inline int try_populate_vmemmap_pmd(pmd_t *pmdp, pte_t *pgtable,
+					   unsigned long addr)
+{
+	pmd_populate_kernel(&init_mm, pmdp, pgtable);
+	return 0;
+}
+
 #if CONFIG_PGTABLE_LEVELS > 2
 extern void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd);
 
diff --git a/include/linux/pgalloc.h b/include/linux/pgalloc.h
index 9174fa59bbc5..ed446d95ca37 100644
--- a/include/linux/pgalloc.h
+++ b/include/linux/pgalloc.h
@@ -26,4 +26,24 @@
 			arch_sync_kernel_mappings(addr, addr);		\
 	} while (0)
 
+#ifndef __HAVE_ARCH_TRY_POPULATE_VMEMMAP_PMD
+/*
+ * try_populate_vmemmap_pmd - Populate a PMD that is in use by the vmemmap.
+ * @addr: Base address of the remapped PMD.
+ * @pmdp: Page table pointer to be overwritten.
+ * @pgtable: Pointer to the page table that the new PMD will point to.
+ *
+ * This function is only to be used to update PMDs that map the vmemmap to
+ * point to a page of already-populated PTEs that map the same pages.
+ *
+ * Implementations of this function must ensure that, while the update is taking
+ * place, CPUs will not fault on the remapped virtual address range.
+ */
+static inline int try_populate_vmemmap_pmd(pmd_t *pmdp, pte_t *pgtable,
+					   unsigned long addr)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 #endif /* _LINUX_PGALLOC_H */
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 977249e22ed0..b445febac0d2 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -55,6 +55,7 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 			     struct vmemmap_remap_walk *walk)
 {
 	pmd_t __pmd;
+	int ret;
 	int i;
 	unsigned long addr = start;
 	pte_t *pgtable;
@@ -74,8 +75,15 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 		set_pte_at(&init_mm, addr, pte, entry);
 	}
 
+	ret = 0;
 	spin_lock(&init_mm.page_table_lock);
 	if (likely(pmd_leaf(*pmd))) {
+		/* Make pte visible before pmd. See comment in pmd_install(). */
+		smp_wmb();
+		ret = try_populate_vmemmap_pmd(pmd, pgtable, start);
+		if (ret)
+			goto free;
+
 		/*
 		 * Higher order allocations from buddy allocator must be able to
 		 * be treated as independent small pages (as they can be freed
@@ -84,21 +92,17 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 		if (!PageReserved(head))
 			split_page(head, get_order(PMD_SIZE));
 
-		/* Make pte visible before pmd. See comment in pmd_install(). */
-		smp_wmb();
-		/*
-		 * On arm64, this requires BBML2_NOABORT. Its support has
-		 * already been checked.
-		 */
-		pmd_populate_kernel(&init_mm, pmd, pgtable);
 		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
 			flush_tlb_kernel_range(start, start + PMD_SIZE);
-	} else {
-		pte_free_kernel(&init_mm, pgtable);
-	}
-	spin_unlock(&init_mm.page_table_lock);
+	} else
+		goto free;
 
-	return 0;
+out:
+	spin_unlock(&init_mm.page_table_lock);
+	return ret;
+free:
+	pte_free_kernel(&init_mm, pgtable);
+	goto out;
 }
 
 static int vmemmap_pmd_entry(pmd_t *pmd, unsigned long addr,
-- 
2.55.0.795.g602f6c329a-goog


