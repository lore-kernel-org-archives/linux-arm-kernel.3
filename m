Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0287CEFB7E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 01:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUAU3X7Xx15v27pYap676B43gvtts/Dbo0nCLQJ/8ZQ=; b=xngGaHdJGuZtioN10N2tjuDds9
	6KjIY8zbOS0cAjsVAlHOYgX672Y15LKk2py+BvgC/Q4lN8Ss91GH3Wr2VHEjN+FTPzhNPK5E7TMr1
	4TV8fqvFNf67PzykOdKAMmOh5kXD8hl4umKoxhphf8Pqepky66Mfsxx1M8drNMe0VsiOFDtSMEKxY
	ThJ0VYSquCPbcrlG7dS4XYkDsk6cxm0dpz/t5msunIEjom5+5WKu1sx5hahXV5QACwDX5jwnipv09
	9DtXoWzn5VSYTdR2pQ4s1rtDmUGI5+auGcZBo/ZYn7OfTuBrNemk8E45dWt+gw04EZuxQLSQSiQ0D
	8QFTPadg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhfF-00000001Jbp-33Rw;
	Tue, 24 Feb 2026 01:56:41 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhfB-00000001JXd-47Ip
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 01:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1771898191; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=vUAU3X7Xx15v27pYap676B43gvtts/Dbo0nCLQJ/8ZQ=;
	b=ufEoZznAbZwfIkHB+xxbn/8mx0DxMh/yQWzv5SYO22e9I5I1WI7nNeUUODG0Y9Je2CA1NPX4rkvTolW515tQt1yu1TgUHs4Tkg7PTPUigoPySN00KRpS/oz5XYyEdxc4BqIJPoz0F8cORfYoF7bkuhLxmrv7qLho8zUl3MK93Gc=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wzhs.qI_1771898188 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Feb 2026 09:56:28 +0800
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
Subject: [PATCH 4/5] mm: support batched checking of the young flag for MGLRU
Date: Tue, 24 Feb 2026 09:56:07 +0800
Message-ID: <84d2426c63c1eafeaa0cfbad7c5cc11e9c11b980.1771897150.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771897150.git.baolin.wang@linux.alibaba.com>
References: <cover.1771897150.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_175638_262769_9EA3C3D1 
X-CRM114-Status: GOOD (  19.40  )
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

Use the batched helper clear_young_ptes_notify() to check and clear the
young flag to improve the performance during large folio reclamation when
MGLRU is enabled.

Meanwhile, we can also support batched checking the young and dirty flag
when MGLRU walks the mm's pagetable to update the folios' generation
counter. Since MGLRU also checks the PTE dirty bit, use folio_pte_batch_flags()
with FPB_MERGE_YOUNG_DIRTY set to detect batches of PTEs for a large folio.

Then we can remove the ptep_clear_young_notify() since it has no users now.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 include/linux/mmzone.h |  5 +++--
 mm/internal.h          | 12 ------------
 mm/rmap.c              | 30 ++++++++++++++++--------------
 mm/vmscan.c            | 37 +++++++++++++++++++++++++++++--------
 4 files changed, 48 insertions(+), 36 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index db41b18a919d..de9fee4244d9 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -630,7 +630,7 @@ struct lru_gen_memcg {
 
 void lru_gen_init_pgdat(struct pglist_data *pgdat);
 void lru_gen_init_lruvec(struct lruvec *lruvec);
-bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw);
+bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw, unsigned int batched);
 
 void lru_gen_init_memcg(struct mem_cgroup *memcg);
 void lru_gen_exit_memcg(struct mem_cgroup *memcg);
@@ -649,7 +649,8 @@ static inline void lru_gen_init_lruvec(struct lruvec *lruvec)
 {
 }
 
-static inline bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
+static inline bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw,
+				       unsigned int batched)
 {
 	return false;
 }
diff --git a/mm/internal.h b/mm/internal.h
index 1b59be99dc3f..4e8d37570f46 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1824,12 +1824,6 @@ static inline int clear_young_ptes_notify(struct vm_area_struct *vma,
 	return young;
 }
 
-static inline int ptep_clear_young_notify(struct vm_area_struct *vma,
-					  unsigned long addr, pte_t *ptep)
-{
-	return clear_young_ptes_notify(vma, addr, ptep, 1);
-}
-
 static inline int pmdp_clear_young_notify(struct vm_area_struct *vma,
 					  unsigned long addr, pmd_t *pmdp)
 {
@@ -1847,12 +1841,6 @@ static inline int pmdp_clear_young_notify(struct vm_area_struct *vma,
 #define clear_young_ptes_notify	test_and_clear_young_ptes
 #define pmdp_clear_young_notify	pmdp_test_and_clear_young
 
-static inline int ptep_clear_young_notify(struct vm_area_struct *vma,
-					  unsigned long addr, pte_t *ptep)
-{
-	return test_and_clear_young_ptes(vma, addr, ptep, 1);
-}
-
 #endif /* CONFIG_MMU_NOTIFIER */
 
 #endif	/* __MM_INTERNAL_H */
diff --git a/mm/rmap.c b/mm/rmap.c
index be785dfc9336..1c147251ae28 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -958,25 +958,21 @@ static bool folio_referenced_one(struct folio *folio,
 			return false;
 		}
 
+		if (pvmw.pte && folio_test_large(folio)) {
+			unsigned long end_addr = pmd_addr_end(address, vma->vm_end);
+			unsigned int max_nr = (end_addr - address) >> PAGE_SHIFT;
+			pte_t pteval = ptep_get(pvmw.pte);
+
+			nr = folio_pte_batch(folio, pvmw.pte, pteval, max_nr);
+			ptes += nr;
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
@@ -995,6 +991,12 @@ static bool folio_referenced_one(struct folio *folio,
 			page_vma_mapped_walk_done(&pvmw);
 			break;
 		}
+
+		/* Skip the batched PTEs */
+		if (nr > 1) {
+			pvmw.pte += nr - 1;
+			pvmw.address += (nr - 1) * PAGE_SIZE;
+		}
 	}
 
 	if (referenced)
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 728868c61750..d83962468b2e 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3494,6 +3494,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 	struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
 	DEFINE_MAX_SEQ(walk->lruvec);
 	int gen = lru_gen_from_seq(max_seq);
+	unsigned int nr;
 	pmd_t pmdval;
 
 	pte = pte_offset_map_rw_nolock(args->mm, pmd, start & PMD_MASK, &pmdval, &ptl);
@@ -3512,11 +3513,13 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 
 	lazy_mmu_mode_enable();
 restart:
-	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
+	for (i = pte_index(start), addr = start; addr != end; i += nr, addr += nr * PAGE_SIZE) {
 		unsigned long pfn;
 		struct folio *folio;
-		pte_t ptent = ptep_get(pte + i);
+		pte_t *ptep = pte + i;
+		pte_t ptent = ptep_get(ptep);
 
+		nr = 1;
 		total++;
 		walk->mm_stats[MM_LEAF_TOTAL]++;
 
@@ -3528,7 +3531,14 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 		if (!folio)
 			continue;
 
-		if (!ptep_clear_young_notify(args->vma, addr, pte + i))
+		if (folio_test_large(folio)) {
+			unsigned int max_nr = (end - addr) >> PAGE_SHIFT;
+
+			nr = folio_pte_batch_flags(folio, NULL, ptep, &ptent,
+						   max_nr, FPB_MERGE_YOUNG_DIRTY);
+		}
+
+		if (!clear_young_ptes_notify(args->vma, addr, ptep, nr))
 			continue;
 
 		if (last != folio) {
@@ -4186,7 +4196,7 @@ static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_control *sc)
  * the PTE table to the Bloom filter. This forms a feedback loop between the
  * eviction and the aging.
  */
-bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
+bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw, unsigned int batched)
 {
 	int i;
 	bool dirty;
@@ -4205,11 +4215,13 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	struct lru_gen_mm_state *mm_state = get_mm_state(lruvec);
 	DEFINE_MAX_SEQ(lruvec);
 	int gen = lru_gen_from_seq(max_seq);
+	unsigned int nr;
+	pte_t *ptep;
 
 	lockdep_assert_held(pvmw->ptl);
 	VM_WARN_ON_ONCE_FOLIO(folio_test_lru(folio), folio);
 
-	if (!ptep_clear_young_notify(vma, addr, pte))
+	if (!clear_young_ptes_notify(vma, addr, pte, batched))
 		return false;
 
 	if (spin_is_contended(pvmw->ptl))
@@ -4243,10 +4255,12 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 
 	pte -= (addr - start) / PAGE_SIZE;
 
-	for (i = 0, addr = start; addr != end; i++, addr += PAGE_SIZE) {
+	for (i = 0, addr = start, ptep = pte; addr != end;
+	     i += nr, ptep += nr, addr += nr * PAGE_SIZE) {
 		unsigned long pfn;
-		pte_t ptent = ptep_get(pte + i);
+		pte_t ptent = ptep_get(ptep);
 
+		nr = 1;
 		pfn = get_pte_pfn(ptent, vma, addr, pgdat);
 		if (pfn == -1)
 			continue;
@@ -4255,7 +4269,14 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 		if (!folio)
 			continue;
 
-		if (!ptep_clear_young_notify(vma, addr, pte + i))
+		if (folio_test_large(folio)) {
+			unsigned int max_nr = (end - addr) >> PAGE_SHIFT;
+
+			nr = folio_pte_batch_flags(folio, NULL, ptep, &ptent,
+						   max_nr, FPB_MERGE_YOUNG_DIRTY);
+		}
+
+		if (!clear_young_ptes_notify(vma, addr, ptep, nr))
 			continue;
 
 		if (last != folio) {
-- 
2.47.3


