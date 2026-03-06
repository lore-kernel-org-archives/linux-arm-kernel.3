Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8DAF5140F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 06:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4BjQGeH+bBO/rkeXAJzuycBDkicdFTW/HZEtAQ/wv8=; b=VSzA5qc67Au4g20jrI7h127GCE
	BO8+aCIh3MlqLhdc9nAKGD2D8I4SkJjHJMyYAZ6uZmXAvKOp1hkWArCZESiD/UvK6fXi/ijd1L5F7
	u7rb16rBaK7dqVWFVS2arjyNdC3i89QFIj5OMG08C53evfHa3+/4Elh3gUg2XmsaEi3T2thZditPQ
	MLzFlqTVlwwrP6pwxoCNuepGaz5XnndTey8oHtFCuDQJGtvT6rvA2hXEQAiImj7EoqYiBbll2OVBW
	i4+iqrKW142tDq9KgxzXK7v0Oa0+eexXo1rsCw4VSXnPsIacEFPBeLWKyWh24UaPUDaLwDI9Ns3SN
	vAhajZ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOv2-0000000360w-1FXr;
	Fri, 06 Mar 2026 06:44:16 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOuv-000000035wO-19o5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 06:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772779447; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=t4BjQGeH+bBO/rkeXAJzuycBDkicdFTW/HZEtAQ/wv8=;
	b=d8QiygG4RmkGU1MpeceZQXNhYOW22M0viUDXkhKPS7QKixh6albKxGUbJ0E3NhnkKgG+2rjOmCWd2LLzHd5xmJJEbDDv3VTshDfHzZg3J/ii0UDtFzPRbQzW/4U2JGkEaUXZHe8YaTWBFRFcc8uCtP0Yk8Yp/CmihdDXdW83CMA=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X-MLorm_1772779445 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Mar 2026 14:44:05 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	lorenzo.stoakes@oracle.com,
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
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	hannes@cmpxchg.org,
	zhengqi.arch@bytedance.com,
	shakeel.butt@linux.dev,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] mm: support batched checking of the young flag for MGLRU
Date: Fri,  6 Mar 2026 14:43:41 +0800
Message-ID: <378f4acf7d07410aa7c2e4b49d56bb165918eb34.1772778858.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772778858.git.baolin.wang@linux.alibaba.com>
References: <cover.1772778858.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_224409_644065_F8C180DB 
X-CRM114-Status: GOOD (  22.03  )
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

Use the batched helper test_and_clear_young_ptes_notify() to check and clear
the young flag to improve the performance during large folio reclamation when
MGLRU is enabled.

Meanwhile, we can also support batched checking the young and dirty flag
when MGLRU walks the mm's pagetable to update the folios' generation
counter. Since MGLRU also checks the PTE dirty bit, use folio_pte_batch_flags()
with FPB_MERGE_YOUNG_DIRTY set to detect batches of PTEs for a large folio.

Then we can remove the ptep_test_and_clear_young_notify() since it has
no users now.

Note that we also update the 'young' counter and 'mm_stats[MM_LEAF_YOUNG]'
counter with the batched count in the lru_gen_look_around() and walk_pte_range().
However, the batched operations may inflate these two counters, because in
a large folio not all PTEs may have been accessed. (Additionally, tracking
how many PTEs have been accessed within a large folio is not very meaningful,
since the mm core actually tracks access/dirty on a per-folio basis, not per
page). The impact analysis is as follows:

1. The 'mm_stats[MM_LEAF_YOUNG]' counter has no functional impact and is
mainly for debugging.

2. The 'young' counter is used to decide whether to place the current PMD
entry into the bloom filters by suitable_to_scan() (so that next time we
can check whether it has been accessed again), which may set the hash bit
in the bloom filters for a PMD entry that hasn’t seen much access. However,
bloom filters inherently allow some error, so this effect appears negligible.

Reviewed-by: Rik van Riel <riel@surriel.com>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 include/linux/mmzone.h |  5 +++--
 mm/internal.h          |  6 ------
 mm/rmap.c              | 28 +++++++++++++--------------
 mm/vmscan.c            | 43 +++++++++++++++++++++++++++++++-----------
 4 files changed, 49 insertions(+), 33 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index b53b95abe287..7bd0134c241c 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -684,7 +684,7 @@ struct lru_gen_memcg {
 
 void lru_gen_init_pgdat(struct pglist_data *pgdat);
 void lru_gen_init_lruvec(struct lruvec *lruvec);
-bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw);
+bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw, unsigned int nr);
 
 void lru_gen_init_memcg(struct mem_cgroup *memcg);
 void lru_gen_exit_memcg(struct mem_cgroup *memcg);
@@ -706,7 +706,8 @@ static inline void lru_gen_init_lruvec(struct lruvec *lruvec)
 {
 }
 
-static inline bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
+static inline bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw,
+		unsigned int nr)
 {
 	return false;
 }
diff --git a/mm/internal.h b/mm/internal.h
index 8cdd5d8e43fb..95b583e7e4f7 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1848,10 +1848,4 @@ static inline int pmdp_test_and_clear_young_notify(struct vm_area_struct *vma,
 
 #endif /* CONFIG_MMU_NOTIFIER */
 
-static inline int ptep_test_and_clear_young_notify(struct vm_area_struct *vma,
-		unsigned long addr, pte_t *ptep)
-{
-	return test_and_clear_young_ptes_notify(vma, addr, ptep, 1);
-}
-
 #endif	/* __MM_INTERNAL_H */
diff --git a/mm/rmap.c b/mm/rmap.c
index 2d94b3ba52da..6398d7eef393 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -958,25 +958,20 @@ static bool folio_referenced_one(struct folio *folio,
 			return false;
 		}
 
+		if (pvmw.pte && folio_test_large(folio)) {
+			const unsigned long end_addr = pmd_addr_end(address, vma->vm_end);
+			const unsigned int max_nr = (end_addr - address) >> PAGE_SHIFT;
+			pte_t pteval = ptep_get(pvmw.pte);
+
+			nr = folio_pte_batch(folio, pvmw.pte, pteval, max_nr);
+		}
+
 		if (lru_gen_enabled() && pvmw.pte) {
-			if (lru_gen_look_around(&pvmw))
+			if (lru_gen_look_around(&pvmw, nr))
 				referenced++;
 		} else if (pvmw.pte) {
-			if (folio_test_large(folio)) {
-				unsigned long end_addr = pmd_addr_end(address, vma->vm_end);
-				unsigned int max_nr = (end_addr - address) >> PAGE_SHIFT;
-				pte_t pteval = ptep_get(pvmw.pte);
-
-				nr = folio_pte_batch(folio, pvmw.pte,
-						     pteval, max_nr);
-			}
-
-			ptes += nr;
 			if (clear_flush_young_ptes_notify(vma, address, pvmw.pte, nr))
 				referenced++;
-			/* Skip the batched PTEs */
-			pvmw.pte += nr - 1;
-			pvmw.address += (nr - 1) * PAGE_SIZE;
 		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
 			if (pmdp_clear_flush_young_notify(vma, address,
 						pvmw.pmd))
@@ -986,6 +981,7 @@ static bool folio_referenced_one(struct folio *folio,
 			WARN_ON_ONCE(1);
 		}
 
+		ptes += nr;
 		pra->mapcount -= nr;
 		/*
 		 * If we are sure that we batched the entire folio,
@@ -995,6 +991,10 @@ static bool folio_referenced_one(struct folio *folio,
 			page_vma_mapped_walk_done(&pvmw);
 			break;
 		}
+
+		/* Skip the batched PTEs */
+		pvmw.pte += nr - 1;
+		pvmw.address += (nr - 1) * PAGE_SIZE;
 	}
 
 	if (referenced)
diff --git a/mm/vmscan.c b/mm/vmscan.c
index e3425b4db755..33287ba4a500 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3470,6 +3470,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 	struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
 	DEFINE_MAX_SEQ(walk->lruvec);
 	int gen = lru_gen_from_seq(max_seq);
+	unsigned int nr;
 	pmd_t pmdval;
 
 	pte = pte_offset_map_rw_nolock(args->mm, pmd, start & PMD_MASK, &pmdval, &ptl);
@@ -3488,11 +3489,13 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 
 	lazy_mmu_mode_enable();
 restart:
-	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
+	for (i = pte_index(start), addr = start; addr != end; i += nr, addr += nr * PAGE_SIZE) {
 		unsigned long pfn;
 		struct folio *folio;
-		pte_t ptent = ptep_get(pte + i);
+		pte_t *cur_pte = pte + i;
+		pte_t ptent = ptep_get(cur_pte);
 
+		nr = 1;
 		total++;
 		walk->mm_stats[MM_LEAF_TOTAL]++;
 
@@ -3504,7 +3507,16 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 		if (!folio)
 			continue;
 
-		if (!ptep_test_and_clear_young_notify(args->vma, addr, pte + i))
+		if (folio_test_large(folio)) {
+			const unsigned int max_nr = (end - addr) >> PAGE_SHIFT;
+
+			nr = folio_pte_batch_flags(folio, NULL, cur_pte, &ptent,
+						   max_nr, FPB_MERGE_YOUNG_DIRTY);
+			total += nr - 1;
+			walk->mm_stats[MM_LEAF_TOTAL] += nr - 1;
+		}
+
+		if (!test_and_clear_young_ptes_notify(args->vma, addr, cur_pte, nr))
 			continue;
 
 		if (last != folio) {
@@ -3517,8 +3529,8 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 		if (pte_dirty(ptent))
 			dirty = true;
 
-		young++;
-		walk->mm_stats[MM_LEAF_YOUNG]++;
+		young += nr;
+		walk->mm_stats[MM_LEAF_YOUNG] += nr;
 	}
 
 	walk_update_folio(walk, last, gen, dirty);
@@ -4162,7 +4174,7 @@ static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_control *sc)
  * the PTE table to the Bloom filter. This forms a feedback loop between the
  * eviction and the aging.
  */
-bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
+bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw, unsigned int nr)
 {
 	int i;
 	bool dirty;
@@ -4185,7 +4197,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	lockdep_assert_held(pvmw->ptl);
 	VM_WARN_ON_ONCE_FOLIO(folio_test_lru(folio), folio);
 
-	if (!ptep_test_and_clear_young_notify(vma, addr, pte))
+	if (!test_and_clear_young_ptes_notify(vma, addr, pte, nr))
 		return false;
 
 	if (spin_is_contended(pvmw->ptl))
@@ -4225,10 +4237,12 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 
 	pte -= (addr - start) / PAGE_SIZE;
 
-	for (i = 0, addr = start; addr != end; i++, addr += PAGE_SIZE) {
+	for (i = 0, addr = start; addr != end;
+	     i += nr, pte += nr, addr += nr * PAGE_SIZE) {
 		unsigned long pfn;
-		pte_t ptent = ptep_get(pte + i);
+		pte_t ptent = ptep_get(pte);
 
+		nr = 1;
 		pfn = get_pte_pfn(ptent, vma, addr, pgdat);
 		if (pfn == -1)
 			continue;
@@ -4237,7 +4251,14 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 		if (!folio)
 			continue;
 
-		if (!ptep_test_and_clear_young_notify(vma, addr, pte + i))
+		if (folio_test_large(folio)) {
+			const unsigned int max_nr = (end - addr) >> PAGE_SHIFT;
+
+			nr = folio_pte_batch_flags(folio, NULL, pte, &ptent,
+						   max_nr, FPB_MERGE_YOUNG_DIRTY);
+		}
+
+		if (!test_and_clear_young_ptes_notify(vma, addr, pte, nr))
 			continue;
 
 		if (last != folio) {
@@ -4250,7 +4271,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 		if (pte_dirty(ptent))
 			dirty = true;
 
-		young++;
+		young += nr;
 	}
 
 	walk_update_folio(walk, last, gen, dirty);
-- 
2.47.3


