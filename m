Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1959CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMiZSMFdM56iT7i//29GA+eRMEhcqKKBOVTZB/kicf8=; b=OAFZGhzrHgoSFxb2uzUf7ahXCV
	4WrQFKaUnVACb3zojYWVm9RQtgwT9XGmvSS9LIhJzg6ydj0tpZM7I7jUSn4NHx1m7f1aePU40MREb
	WbLjFlRl7rJSonSIhN5hOB9RkrHykRZRdW0JfYiSt2uL/3JVICiwirKfl56NHDy29w6rw9fqw4tNp
	GfLb9JKZYsYOZTaptfCZReraByt78cAETFtJQN+rt6TV+YnbIiHBC0SiItdGJ+rn40p1pVViLAIZQ
	NzhcAHKnxKbVigwFzelozIDYcRKqddpgK9cQpDkoEvjYPOxnzF4BW3a2p3P2sMjkKkcFgcv/np4rf
	7g92xkOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVk-0000000CnPV-3lwy;
	Sat, 03 Oct 2026 00:21:56 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVe-0000000CnEZ-1CqL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:51 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-88b686ed759so70129b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986909; x=1791591709; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMiZSMFdM56iT7i//29GA+eRMEhcqKKBOVTZB/kicf8=;
        b=cMDASmLZf1C+tKTYHqbXB8MfDWTMGni7I2cHIDgWNFa3HkvtRi/lhh2EyhUxGatmQv
         aPED8nvxWvP2JTdHWELg9TPruZGkVQajIiAsc9y6OkLXVNzkakMOYod/ZMP27SVgu1ki
         D+HIECgCJLj5b1HSCaohRIvAnOdIdB2eojQOH/6KPVJ2rSjqht7zTvtGTewkNCvA+x4Q
         lF08BITM/qCxUD3X0KUgk8K+XDWKCPHruW+PBw4zWB3Cojt0mSphD0Nbh4yIw0OMmf3v
         PpxXze+IWohhVNNXAPZbF1cMKshDQ0c9FBbuMj9qmxiFZ/ejXwFQ0KsvLb2lTgyjP4sR
         5KSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986909; x=1791591709;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMiZSMFdM56iT7i//29GA+eRMEhcqKKBOVTZB/kicf8=;
        b=is2MQCm+Q2N/An8h8eI0H+2TpWoZjmuZe5PKtanZCodWDcU3Op8M2BnlkXiIkrpaVe
         eYFkCXi5k9JaKgRVHXx0bfZB89GWJtCcfiQ+Vusg433khLexzi7g2ZlJUUSwlBOymoks
         Ogg6qKFjlUnDSpcvXUz/XUPIisEIvEh4631wW/EQZEQI8aYS1CYUdHZ0Ggz8LsnLN4+j
         qGZpNV+m406JulRIzWacTfTn9tupKz4HQRS+Mnt9ySsiF53g/6US9jIEIGuS9ByFGpgc
         6HWc8DDpJU9g2W47W/AKbBGIF9SfmHmhGD7ZGLudeqwpkEL/9cWKS59IcqBvD6p95Ht5
         JSPg==
X-Forwarded-Encrypted: i=1; AKwUvBy9i+kmY5itQE+ZyrrBrLNlVP9qnBxhe++u1IDa8gwtKfd1FQ45pcZDHvNpGUmH3zl2uNWpJAoSjINPkUx2I4RU@lists.infradead.org
X-Gm-Message-State: AFuF++kQ2qtst8a0DNpFpu0lXGrvtWeTwC3MPNf33hjzVQecdIouTlgB
	2eG/1/PUomaNW8RdzGpQBOrwJvHxCMAZRg4J6TfT/Hhc1i6att8VNSTpYB9ybadPhpNbwSdujnR
	QBKkomAVhuRL1HAxsKJnuwg==
X-Received: from pgdo3-n2.prod.google.com ([2002:a05:6a02:6203:20b0:cc7:492f:3ac1])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:4327:b0:3e0:df81:23ef with SMTP id adf61e73a8af0-3e0df815706mr74686637.74.1790986908868;
 Fri, 02 Oct 2026 17:21:48 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:19 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-17-jthoughton@google.com>
Subject: [PATCH v2 16/20 DO-NOT-MERGE] hugetlb_vmemmap: Use
 try_populate_vmemmap_pmd for replacing in-use PMDs
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
X-CRM114-CacheID: sfid-20261002_172150_343855_88C9508A 
X-CRM114-Status: GOOD (  22.14  )
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
not require BBML3.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/pgalloc.h     |  8 ++++++++
 arch/loongarch/include/asm/pgalloc.h |  2 ++
 arch/riscv/include/asm/pgalloc.h     |  2 ++
 arch/x86/include/asm/pgalloc.h       |  2 ++
 include/linux/pgalloc.h              | 21 +++++++++++++++++++++
 mm/hugetlb_vmemmap.c                 | 25 ++++++++++++++-----------
 6 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 1b4509d3382c..0263329fb7b3 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -121,4 +121,12 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, pgtable_t ptep)
 		       PMD_TYPE_TABLE | PMD_TABLE_AF | PMD_TABLE_PXN);
 }
 
+static inline int try_populate_vmemmap_pmd(unsigned long addr, pmd_t *pmdp,
+					   pte_t *pgtable)
+{
+	/* BBLM3 is required. Its presence has been checked. */
+	pmd_populate_kernel(&init_mm, pmdp, pgtable);
+	return 0;
+}
+
 #endif
diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 248f62d0b590..0553addb0afa 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -24,6 +24,8 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd, pgtable_t pte)
 	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
 }
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PMD
+
 #ifndef __PAGETABLE_PMD_FOLDED
 
 static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 770ce18a7328..b9b4b25fc6f0 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -31,6 +31,8 @@ static inline void pmd_populate(struct mm_struct *mm,
 	set_pmd(pmd, __pmd((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
 }
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PMD
+
 #ifndef __PAGETABLE_PMD_FOLDED
 static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
 {
diff --git a/arch/x86/include/asm/pgalloc.h b/arch/x86/include/asm/pgalloc.h
index c88691b15f3c..f8d24b97cbf5 100644
--- a/arch/x86/include/asm/pgalloc.h
+++ b/arch/x86/include/asm/pgalloc.h
@@ -82,6 +82,8 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 	set_pmd(pmd, __pmd(((pteval_t)pfn << PAGE_SHIFT) | _PAGE_TABLE));
 }
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PMD
+
 #if CONFIG_PGTABLE_LEVELS > 2
 extern void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd);
 
diff --git a/include/linux/pgalloc.h b/include/linux/pgalloc.h
index 9174fa59bbc5..1dbecb748028 100644
--- a/include/linux/pgalloc.h
+++ b/include/linux/pgalloc.h
@@ -26,4 +26,25 @@
 			arch_sync_kernel_mappings(addr, addr);		\
 	} while (0)
 
+#ifdef ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PMD
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
+static inline int try_populate_vmemmap_pmd(unsigned long addr, pmd_t *pmdp,
+					   pte_t *pgtable)
+{
+	pmd_populate_kernel(&init_mm, pmdp, pgtable);
+	return 0;
+}
+#endif
+
 #endif /* _LINUX_PGALLOC_H */
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 1eca03a3def3..9e0f52474bdb 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -88,6 +88,7 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 			     struct vmemmap_remap_walk *walk)
 {
 	pmd_t __pmd;
+	int ret;
 	int i;
 	unsigned long addr = start;
 	pte_t *pgtable;
@@ -107,8 +108,15 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 		set_pte_at(&init_mm, addr, pte, entry);
 	}
 
+	ret = 0;
 	spin_lock(&init_mm.page_table_lock);
 	if (likely(pmd_leaf(*pmd))) {
+		/* Make pte visible before pmd. See comment in pmd_install(). */
+		smp_wmb();
+		ret = try_populate_vmemmap_pmd(start, pmd, pgtable);
+		if (ret)
+			goto free;
+
 		/*
 		 * Higher order allocations from buddy allocator must be able to
 		 * be treated as independent small pages (as they can be freed
@@ -117,21 +125,16 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 		if (!PageReserved(head))
 			split_page(head, get_order(PMD_SIZE));
 
-		/* Make pte visible before pmd. See comment in pmd_install(). */
-		smp_wmb();
-		/*
-		 * On arm64, this requires BBML3. Its support has already been
-		 * checked.
-		 */
-		pmd_populate_kernel(&init_mm, pmd, pgtable);
 		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
 			flush_tlb_kernel_range(start, start + PMD_SIZE);
-	} else {
-		pte_free_kernel(&init_mm, pgtable);
+		goto out;
 	}
-	spin_unlock(&init_mm.page_table_lock);
 
-	return 0;
+free:
+	pte_free_kernel(&init_mm, pgtable);
+out:
+	spin_unlock(&init_mm.page_table_lock);
+	return ret;
 }
 
 static int vmemmap_pmd_entry(pmd_t *pmd, unsigned long addr,
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


