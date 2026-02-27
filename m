Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC78FEFB72
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfi3Q++xXYheivY+0y2o2X3K9NE+07hD6no9yvrXlL4=; b=pdoFffattceAEJIofOJFLbkAVO
	iAVB9rxXR/x2JbSgTBUOCuWHynbTCsh/Cf4rk6nGQ6rdsndnIsxchHObaNptT0/M7pH2RdliTd8xf
	+NXwORGeKUwXwO5ym7tPTIfRkqaczSRS8Q22tGlcAMrxD+0f0QekxiU1BaiEpZQDk/aUvTzfqfkwY
	9T+UVFa8OcV2nPbBrK91qqVEQ8hGT0My31wwnd+OOQUd79qZyB/glwYVo5+kqbFbD/fg7QsHE5yDA
	yXNNLbLjHs99t1oDRdwAdDaakE8T+J5Sh/y2TZzPjq561m91YpLd79cAxsrbtBMmiLkpnfhGj4ewy
	bviCaGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw25B-00000008r7V-0HTx;
	Fri, 27 Feb 2026 17:56:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw254-00000008qzn-0KuR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:56:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E612819F0;
	Fri, 27 Feb 2026 09:56:42 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1CA13F73B;
	Fri, 27 Feb 2026 09:56:44 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v6 14/30] mm: kpkeys: Introduce block-based page table allocator
Date: Fri, 27 Feb 2026 17:55:02 +0000
Message-ID: <20260227175518.3728055-15-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227175518.3728055-1-kevin.brodsky@arm.com>
References: <20260227175518.3728055-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_095650_907146_78F08F66 
X-CRM114-Status: GOOD (  33.09  )
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

If the kpkeys_hardened_pgtables feature is enabled, page table pages
(PTPs) should be protected by modifying the linear mapping to map
them with a privileged pkey (KPKEYS_PKEY_PGTABLES). This patch
introduces a new page allocator for that purpose:

* kpkeys_pgtable_alloc() allocates a new PTP and sets the linear
  mapping to KPKEYS_PKEY_PGTABLES for that page

* kpkeys_pgtable_free() frees such a PTP and restores the linear
  mapping to the default pkey

If the linear map is fully PTE-mapped (as per
arch_has_pte_only_direct_map()), there is no need to introduce extra
state - the functions above directly call into the buddy allocator
and set the pkey for the given page.

Such an approach is however insufficient when block mappings are
used, because setting the pkey for individual pages is likely to
result in blocks getting split up: for a PMD block, (1 << PMD_ORDER)
PTEs are created, and the pkey is then set in the appropriate PTE.
This is doubly expensive: 1. a new PTE page must be allocated and
the entries updated accordingly; and 2. TLB pressure increases due
to the additional entries. Worse still, 1. is likely to be
recursive, as allocating a new PTE page with the appropriate pkey
could in turn require splitting a PMD.

This patch introduces a simple allocator for this specific use-case.
All PTPs are allocated from a global pool mapped with
KPKEYS_PKEY_PGTABLES; the pool is refilled with whole blocks if
possible (setting the pkey at PMD level). This greatly reduces the
number of blocks getting split - splitting should only occur under
memory pressure.

Important limitations:

* Special handling is required when refilling the cache, since
  set_memory_pkey() may split a PUD/PMD block, requiring a new
  PMD/PTE page to be allocated. This will be addressed in subsequent
  patches.

* Cached pages should be reclaimable under memory pressure. This
  will also be handled in a later patch.

* Only PTP allocations of order 0 and a small set of GFP flags
  (PBA_GFP_OPT_MASK) are supported. That should be good enough to
  cover the architectures that support pkeys (arm64, x86, powerpc).

* Pages are zeroed on alloc if requested (__GFP_ZERO). There is no
  support for init_on_free, PAGE_POISONING and other debug features.

Also noteworthy: spin_lock_bh is used as PTPs may be freed in
softirq context (RCU).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/kpkeys.h        |  10 ++
 include/linux/mm.h            |  14 +-
 mm/kpkeys_hardened_pgtables.c | 307 ++++++++++++++++++++++++++++++++++
 3 files changed, 329 insertions(+), 2 deletions(-)

diff --git a/include/linux/kpkeys.h b/include/linux/kpkeys.h
index 49af2ec76923..303ddef6752c 100644
--- a/include/linux/kpkeys.h
+++ b/include/linux/kpkeys.h
@@ -121,6 +121,9 @@ static inline bool kpkeys_hardened_pgtables_enabled(void)
 	return static_branch_unlikely(&kpkeys_hardened_pgtables_key);
 }
 
+struct page *kpkeys_pgtable_alloc(gfp_t gfp);
+void kpkeys_pgtable_free(struct page *page);
+
 /*
  * Should be called from mem_init(): as soon as the buddy allocator becomes
  * available and before any call to pagetable_alloc().
@@ -134,6 +137,13 @@ static inline bool kpkeys_hardened_pgtables_enabled(void)
 	return false;
 }
 
+static inline struct page *kpkeys_pgtable_alloc(gfp_t gfp)
+{
+	return NULL;
+}
+
+static inline void kpkeys_pgtable_free(struct page *page) {}
+
 static inline void kpkeys_hardened_pgtables_init(void) {}
 
 #endif /* CONFIG_KPKEYS_HARDENED_PGTABLES */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5be3d8a8f806..c3eab0228608 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -38,6 +38,7 @@
 #include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/iommu-debug-pagealloc.h>
+#include <linux/kpkeys.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -3401,7 +3402,12 @@ static inline bool ptdesc_test_kernel(const struct ptdesc *ptdesc)
  */
 static inline struct ptdesc *pagetable_alloc_noprof(gfp_t gfp, unsigned int order)
 {
-	struct page *page = alloc_pages_noprof(gfp | __GFP_COMP, order);
+	struct page *page;
+
+	if (kpkeys_hardened_pgtables_enabled() && !WARN_ON_ONCE(order != 0))
+		page = kpkeys_pgtable_alloc(gfp);
+	else
+		page = alloc_pages_noprof(gfp | __GFP_COMP, order);
 
 	return page_ptdesc(page);
 }
@@ -3410,8 +3416,12 @@ static inline struct ptdesc *pagetable_alloc_noprof(gfp_t gfp, unsigned int orde
 static inline void __pagetable_free(struct ptdesc *pt)
 {
 	struct page *page = ptdesc_page(pt);
+	unsigned int order = compound_order(page);
 
-	__free_pages(page, compound_order(page));
+	if (kpkeys_hardened_pgtables_enabled() && order == 0)
+		kpkeys_pgtable_free(page);
+	else
+		__free_pages(page, order);
 }
 
 #ifdef CONFIG_ASYNC_KERNEL_PGTABLE_FREE
diff --git a/mm/kpkeys_hardened_pgtables.c b/mm/kpkeys_hardened_pgtables.c
index 9e4771263ad2..da5695da518d 100644
--- a/mm/kpkeys_hardened_pgtables.c
+++ b/mm/kpkeys_hardened_pgtables.c
@@ -1,13 +1,320 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <linux/gfp.h>
+#include <linux/list.h>
+#include <linux/highmem.h>
 #include <linux/kpkeys.h>
+#include <linux/memcontrol.h>
 #include <linux/mm.h>
+#include <linux/set_memory.h>
 
 __ro_after_init DEFINE_STATIC_KEY_FALSE(kpkeys_hardened_pgtables_key);
 
+static int set_pkey_pgtable(struct page *page, unsigned int nr_pages)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+	int ret;
+
+	ret = set_memory_pkey(addr, nr_pages, KPKEYS_PKEY_PGTABLES);
+
+	WARN_ON(ret);
+	return ret;
+}
+
+static int set_pkey_default(struct page *page, unsigned int nr_pages)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+	int ret;
+
+	ret = set_memory_pkey(addr, nr_pages, KPKEYS_PKEY_DEFAULT);
+
+	WARN_ON(ret);
+	return ret;
+}
+
+/* pkeys block allocator (PBA) - implemented below */
+static bool pba_enabled(void);
+static struct page *pba_pgtable_alloc(gfp_t gfp);
+static void pba_pgtable_free(struct page *page);
+static void pba_init(void);
+
+/* Trivial allocator in case the linear map is PTE-mapped (no block mapping) */
+static struct page *noblock_pgtable_alloc(gfp_t gfp)
+{
+	struct page *page;
+	int ret;
+
+	page = alloc_pages_noprof(gfp, 0);
+	if (!page)
+		return page;
+
+	ret = set_pkey_pgtable(page, 1);
+	if (ret) {
+		__free_page(page);
+		return NULL;
+	}
+
+	return page;
+}
+
+static void noblock_pgtable_free(struct page *page)
+{
+	set_pkey_default(page, 1);
+	__free_page(page);
+}
+
+/* Public interface */
+struct page *kpkeys_pgtable_alloc(gfp_t gfp)
+{
+	if (pba_enabled())
+		return pba_pgtable_alloc(gfp);
+	else
+		return noblock_pgtable_alloc(gfp);
+}
+
+void kpkeys_pgtable_free(struct page *page)
+{
+	if (pba_enabled())
+		pba_pgtable_free(page);
+	else
+		noblock_pgtable_free(page);
+}
+
 void __init kpkeys_hardened_pgtables_init(void)
 {
 	if (!arch_kpkeys_enabled())
 		return;
 
+	pba_init();
 	static_branch_enable(&kpkeys_hardened_pgtables_key);
 }
+
+/*
+ * pkeys block allocator (PBA): dedicated page table allocator for block-mapped
+ * linear map. Block splitting is minimised by prioritising the allocation and
+ * freeing of full blocks.
+ */
+#define PBA_GFP_ALLOC		GFP_KERNEL
+#define PBA_GFP_OPT_MASK	(__GFP_ZERO | __GFP_ACCOUNT)
+
+#define BLOCK_ORDER		PMD_ORDER
+
+/*
+ * Refilling the cache is done by attempting allocation in decreasing orders
+ * (higher orders may not be available due to memory pressure). The specific
+ * orders are tweaked based on the page size.
+ *
+ * - A whole block (PMD_ORDER) is the preferred size. A lower order is used
+ *   for page sizes above 16K to avoid reserving too much memory for page
+ *   tables (a PMD block is 512 MB for 64K pages on arm64).
+ *
+ * - The next order corresponds to the contpte size on arm64, which helps to
+ *   reduce TLB pressure. Other architectures may prefer other values.
+ *
+ * - The last order *must* be 2 (4 pages) to guarantee that __refill_pages()
+ *   actually increases the number of cached pages - up to 2 cached pages
+ *   may be used up by set_memory_pkey() for splitting the linear map.
+ */
+static const unsigned int refill_orders[] =
+#if PAGE_SHIFT <= 12
+	{ BLOCK_ORDER, 4, 2 }	/* 4K pages */
+#elif PAGE_SHIFT <= 14
+	{ BLOCK_ORDER, 7, 2 }	/* 16K pages */
+#else
+	{ 9, 5, 2 }		/* 64K pages */
+#endif
+;
+
+struct pkeys_block_allocator {
+	struct list_head cached_list;
+	unsigned long nr_cached;
+	spinlock_t lock;
+};
+
+static struct pkeys_block_allocator pkeys_block_allocator = {
+	.cached_list = LIST_HEAD_INIT(pkeys_block_allocator.cached_list),
+	.nr_cached = 0,
+	.lock = __SPIN_LOCK_UNLOCKED(pkeys_block_allocator.lock),
+};
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(pba_enabled_key);
+
+static bool pba_enabled(void)
+{
+	return static_branch_likely(&pba_enabled_key);
+}
+
+static void cached_list_add_pages(struct page *page, unsigned int nr_pages)
+{
+	struct pkeys_block_allocator *pba = &pkeys_block_allocator;
+
+	for (unsigned int i = 0; i < nr_pages; i++)
+		list_add(&page[i].lru, &pba->cached_list);
+
+	pba->nr_cached += nr_pages;
+}
+
+static void cached_list_del_page(struct page *page)
+{
+	struct pkeys_block_allocator *pba = &pkeys_block_allocator;
+
+	list_del(&page->lru);
+	pba->nr_cached--;
+}
+
+static void __refill_pages_add_to_cache(struct page *page, unsigned int order,
+					bool alloc_one)
+{
+	struct pkeys_block_allocator *pba = &pkeys_block_allocator;
+	unsigned int nr_pages = 1 << order;
+
+	if (alloc_one) {
+		page++;
+		nr_pages--;
+	}
+
+	guard(spinlock_bh)(&pba->lock);
+
+	cached_list_add_pages(page, nr_pages);
+}
+
+static struct page *__refill_pages(bool alloc_one)
+{
+	struct page *page;
+	unsigned int order;
+	int ret;
+
+	for (int i = 0; i < ARRAY_SIZE(refill_orders); ++i) {
+		order = refill_orders[i];
+		page = alloc_pages_noprof(PBA_GFP_ALLOC, order);
+		if (page)
+			break;
+	}
+
+	if (!page)
+		return NULL;
+
+	pr_debug("%s: order=%d, pfn=%lx\n", __func__, order, page_to_pfn(page));
+
+	ret = set_pkey_pgtable(page, 1 << order);
+
+	if (ret) {
+		__free_pages(page, order);
+		return NULL;
+	}
+
+	/* Each page is going to be allocated individually */
+	split_page(page, order);
+
+	__refill_pages_add_to_cache(page, order, alloc_one);
+
+	return page;
+}
+
+static struct page *refill_pages_and_alloc_one(void)
+{
+	return __refill_pages(true);
+}
+
+static bool cached_page_available(void)
+{
+	struct pkeys_block_allocator *pba = &pkeys_block_allocator;
+
+	return pba->nr_cached > 0;
+}
+
+static struct page *get_cached_page(gfp_t gfp)
+{
+	struct pkeys_block_allocator *pba = &pkeys_block_allocator;
+	struct page *page;
+
+	guard(spinlock_bh)(&pba->lock);
+
+	if (!cached_page_available())
+		return NULL;
+
+	page = list_first_entry_or_null(&pba->cached_list, struct page, lru);
+	if (WARN_ON(!page))
+		return NULL;
+
+	cached_list_del_page(page);
+	return page;
+}
+
+static void check_gfp(gfp_t gfp)
+{
+	VM_WARN_ON_ONCE((gfp & PBA_GFP_ALLOC) != PBA_GFP_ALLOC);
+
+	gfp &= ~(PBA_GFP_ALLOC | PBA_GFP_OPT_MASK);
+
+	VM_WARN_ONCE(gfp, "Unexpected gfp: %pGg\n", &gfp);
+}
+
+static int prepare_page(struct page *page, gfp_t gfp)
+{
+	if (gfp & __GFP_ACCOUNT) {
+		int ret = memcg_kmem_charge_page(page, gfp, 0);
+
+		if (unlikely(ret))
+			return ret;
+	}
+
+	/*
+	 * __refill_pages() only guarantees that page_private is zeroed for the
+	 * head page, so it is safer to zero it every time we allocate a new
+	 * page.
+	 */
+	set_page_private(page, 0);
+
+	if (gfp & __GFP_ZERO) {
+		u64 saved_pkey_reg;
+
+		/*
+		 * The page is mapped with KPKEYS_PKEY_PGTABLES so we need
+		 * to switch to the corresponding kpkeys level to write to it.
+		 */
+		saved_pkey_reg = kpkeys_set_level(KPKEYS_LVL_PGTABLES);
+		clear_highpage(page);
+		kpkeys_restore_pkey_reg(saved_pkey_reg);
+	}
+
+	return 0;
+}
+
+static struct page *pba_pgtable_alloc(gfp_t gfp)
+{
+	struct page *page;
+
+	check_gfp(gfp);
+
+	page = get_cached_page(gfp);
+
+	if (!page)
+		page = refill_pages_and_alloc_one();
+	WARN_ON(!page);
+
+	if (page && prepare_page(page, gfp)) {
+		kpkeys_pgtable_free(page);
+		return NULL;
+	}
+
+	return page;
+}
+
+static void pba_pgtable_free(struct page *page)
+{
+	struct pkeys_block_allocator *pba = &pkeys_block_allocator;
+
+	memcg_kmem_uncharge_page(page, 0);
+
+	guard(spinlock_bh)(&pba->lock);
+
+	cached_list_add_pages(page, 1);
+}
+
+static void __init pba_init(void)
+{
+	if (arch_has_pte_only_direct_map())
+		return;
+
+	static_branch_enable(&pba_enabled_key);
+}
-- 
2.51.2


