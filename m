Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F43EE8FDA2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 06:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQOblmo1Xq9Mi6sOjwcZDMqeM3HaJgfSORShcGuHoSU=; b=MqN8xHOOwnX8+ajDU6LMaSfACh
	VKxjMRYmYDAR+mPXrFSV3zV4skRAR8dWNW3l/p5dlkAxLVlePKIygG2YQGrUvc88cYonKDdQnusd+
	dwtwCZUHY3d1rCFUP8iitiBE83cUAdX7CUhz0p4RsyAz5ZVbD0bE11avWkY5bu8EvfQS+5RWEgxWI
	UzHljstZ1ZQPp6aQnS2ymLaYlJsdXiEATzqUiToY39e+Di9TWRCkEKuszpfEeien97fhjUCtOXEiV
	0CzQqdsWKxPzwpWRr29V1EfZBUP5gBEgL7UmzpxFaIf8yD9hEm/8PXEDIFZXCyAHiYB2sIc+nVgrt
	CjDy1thQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ0zv-00000000wW4-3fjS;
	Fri, 26 Dec 2025 06:08:23 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ0zo-00000000wSg-2Cuw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 06:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766729292; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=nQOblmo1Xq9Mi6sOjwcZDMqeM3HaJgfSORShcGuHoSU=;
	b=sA8r4oFaDZrrvqq8XSwQKAPHp/JfwQVEvo4S3WmPAwleRMum+eLT5ve9zWgPvZIx7sP5E0EsatDqrlG2kjHgNDef59LFeyTb3Kn3OKvVUBBRyea8HGtAe/KcFDH2wPZ+Cd0o83v/11DqES96QbIMdg4xvQtKsBhIYjGzhQaWu38=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WvgaV0W_1766729286 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 26 Dec 2025 14:08:07 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	riel@surriel.com,
	harry.yoo@oracle.com,
	jannh@google.com,
	willy@infradead.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/5] mm: rmap: support batched checks of the references for large folios
Date: Fri, 26 Dec 2025 14:07:55 +0800
Message-ID: <18b3eb9c730d16756e5d23c7be22efe2f6219911.1766631066.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_220817_367142_1A2D79F9 
X-CRM114-Status: GOOD (  18.61  )
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

Currently, folio_referenced_one() always checks the young flag for each PTE
sequentially, which is inefficient for large folios. This inefficiency is
especially noticeable when reclaiming clean file-backed large folios, where
folio_referenced() is observed as a significant performance hotspot.

Moreover, on Arm64 architecture, which supports contiguous PTEs, there is already
an optimization to clear the young flags for PTEs within a contiguous range.
However, this is not sufficient. We can extend this to perform batched operations
for the entire large folio (which might exceed the contiguous range: CONT_PTE_SIZE).

Introduce a new API: clear_flush_young_ptes() to facilitate batched checking
of the young flags and flushing TLB entries, thereby improving performance
during large folio reclamation. And it will be overridden by the architecture
that implements a more efficient batch operation in the following patches.

While we are at it, rename ptep_clear_flush_young_notify() to
clear_flush_young_ptes_notify() to indicate that this is a batch operation.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 include/linux/mmu_notifier.h |  9 +++++----
 include/linux/pgtable.h      | 31 +++++++++++++++++++++++++++++++
 mm/rmap.c                    | 31 ++++++++++++++++++++++++++++---
 3 files changed, 64 insertions(+), 7 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index d1094c2d5fb6..07a2bbaf86e9 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -515,16 +515,17 @@ static inline void mmu_notifier_range_init_owner(
 	range->owner = owner;
 }
 
-#define ptep_clear_flush_young_notify(__vma, __address, __ptep)		\
+#define clear_flush_young_ptes_notify(__vma, __address, __ptep, __nr)	\
 ({									\
 	int __young;							\
 	struct vm_area_struct *___vma = __vma;				\
 	unsigned long ___address = __address;				\
-	__young = ptep_clear_flush_young(___vma, ___address, __ptep);	\
+	unsigned int ___nr = __nr;					\
+	__young = clear_flush_young_ptes(___vma, ___address, __ptep, ___nr);	\
 	__young |= mmu_notifier_clear_flush_young(___vma->vm_mm,	\
 						  ___address,		\
 						  ___address +		\
-							PAGE_SIZE);	\
+						  ___nr * PAGE_SIZE);	\
 	__young;							\
 })
 
@@ -650,7 +651,7 @@ static inline void mmu_notifier_subscriptions_destroy(struct mm_struct *mm)
 
 #define mmu_notifier_range_update_to_read_only(r) false
 
-#define ptep_clear_flush_young_notify ptep_clear_flush_young
+#define clear_flush_young_ptes_notify clear_flush_young_ptes
 #define pmdp_clear_flush_young_notify pmdp_clear_flush_young
 #define ptep_clear_young_notify ptep_test_and_clear_young
 #define pmdp_clear_young_notify pmdp_test_and_clear_young
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 2f0dd3a4ace1..eb8aacba3698 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1087,6 +1087,37 @@ static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
 }
 #endif
 
+#ifndef clear_flush_young_ptes
+/**
+ * clear_flush_young_ptes - Clear the access bit and perform a TLB flush for PTEs
+ *			    that map consecutive pages of the same folio.
+ * @vma: The virtual memory area the pages are mapped into.
+ * @addr: Address the first page is mapped at.
+ * @ptep: Page table pointer for the first entry.
+ * @nr: Number of entries to clear access bit.
+ *
+ * May be overridden by the architecture; otherwise, implemented as a simple
+ * loop over ptep_clear_flush_young().
+ *
+ * Note that PTE bits in the PTE range besides the PFN can differ. For example,
+ * some PTEs might be write-protected.
+ *
+ * Context: The caller holds the page table lock.  The PTEs map consecutive
+ * pages that belong to the same folio.  The PTEs are all in the same PMD.
+ */
+static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
+					 unsigned long addr, pte_t *ptep,
+					 unsigned int nr)
+{
+	int i, young = 0;
+
+	for (i = 0; i < nr; ++i, ++ptep, addr += PAGE_SIZE)
+		young |= ptep_clear_flush_young(vma, addr, ptep);
+
+	return young;
+}
+#endif
+
 /*
  * On some architectures hardware does not set page access bit when accessing
  * memory page, it is responsibility of software setting this bit. It brings
diff --git a/mm/rmap.c b/mm/rmap.c
index e805ddc5a27b..985ab0b085ba 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -828,9 +828,11 @@ static bool folio_referenced_one(struct folio *folio,
 	struct folio_referenced_arg *pra = arg;
 	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
 	int ptes = 0, referenced = 0;
+	unsigned int nr;
 
 	while (page_vma_mapped_walk(&pvmw)) {
 		address = pvmw.address;
+		nr = 1;
 
 		if (vma->vm_flags & VM_LOCKED) {
 			ptes++;
@@ -875,9 +877,24 @@ static bool folio_referenced_one(struct folio *folio,
 			if (lru_gen_look_around(&pvmw))
 				referenced++;
 		} else if (pvmw.pte) {
-			if (ptep_clear_flush_young_notify(vma, address,
-						pvmw.pte))
+			if (folio_test_large(folio)) {
+				unsigned long end_addr =
+					pmd_addr_end(address, vma->vm_end);
+				unsigned int max_nr =
+					(end_addr - address) >> PAGE_SHIFT;
+				pte_t pteval = ptep_get(pvmw.pte);
+
+				nr = folio_pte_batch(folio, pvmw.pte,
+						     pteval, max_nr);
+			}
+
+			ptes += nr;
+			if (clear_flush_young_ptes_notify(vma, address,
+						pvmw.pte, nr))
 				referenced++;
+			/* Skip the batched PTEs */
+			pvmw.pte += nr - 1;
+			pvmw.address += (nr - 1) * PAGE_SIZE;
 		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
 			if (pmdp_clear_flush_young_notify(vma, address,
 						pvmw.pmd))
@@ -887,7 +904,15 @@ static bool folio_referenced_one(struct folio *folio,
 			WARN_ON_ONCE(1);
 		}
 
-		pra->mapcount--;
+		pra->mapcount -= nr;
+		/*
+		 * If we are sure that we batched the entire folio,
+		 * we can just optimize and stop right here.
+		 */
+		if (ptes == pvmw.nr_pages) {
+			page_vma_mapped_walk_done(&pvmw);
+			break;
+		}
 	}
 
 	if (referenced)
-- 
2.47.3


