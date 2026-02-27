Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692F0FEFB6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1J0dE2vosTLnnVgFfjV6gqZro3Fayve5qjLEvAWdjok=; b=eOL9DPTG01naf9oR246eNv2Ug8
	7QZ8mNCeTPVA4zMqGgbu6FxZHxpdfNAXtFGSfK4LJqi1Dpp6jGehShzW391idzOLvfSEj8//t+5hp
	8ZgTxkDS3eT9OKTStJ+pGhN1IWpsio42sBDz7/w0xRojoRVkZ0IE1WHLS8wFmDBQ1wX8r6D2Ev7s0
	Ncs2DWp3Xdx7C+Ej1NTT4t4vPV+SM/gfMPn2fQfYdTnr6NeGSQI2thWXe7h1e/qvwj5yCv4gCMGoO
	P9La8fWgHFtpUyDPGZPTYSrfWgsvnwaaGucf4bLgDB3PX7Eh7yw1uF92I46Ots8L6FTYw12xh5rfs
	GrMyXzFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw25M-00000008rLs-1hQ0;
	Fri, 27 Feb 2026 17:57:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw25D-00000008rAI-2Van
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:57:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50B681516;
	Fri, 27 Feb 2026 09:56:52 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A3933F73B;
	Fri, 27 Feb 2026 09:56:54 -0800 (PST)
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
Subject: [PATCH v6 16/30] mm: kpkeys: Defer early call to set_memory_pkey()
Date: Fri, 27 Feb 2026 17:55:04 +0000
Message-ID: <20260227175518.3728055-17-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227175518.3728055-1-kevin.brodsky@arm.com>
References: <20260227175518.3728055-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_095659_802273_198C6DF7 
X-CRM114-Status: GOOD (  29.04  )
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

The kpkeys_hardened_pgtables feature requires all page table pages
to be mapped with a non-default pkey. When the linear map
uses large block mappings, setting the pkey for an arbitrary range
may require splitting an existing block.

The kpkeys page table allocator attempts to reduce such splitting,
but it cannot avoid it altogether. This is problematic during early
boot on some systems (arm64 with BBML2-noabort), because the linear
map may not be split until feature detection has completed on all
CPUs. This occurs after the buddy allocator becomes available, and
pagetable_alloc() is called multiple times by that point.

To address this, defer the first call to set_memory_pkey()
(triggered by the refill in pba_init()) until a point where it is
safe to do so. A late initialisation function is introduced to that
effect.

Only one such early region may be registered; further refills in
that early window will trigger a warning and leave the memory
unprotected. The underlying assumption is that there are relatively
few calls to pagetable_alloc() before
kpkeys_hardened_pgtables_init_late() is called. This seems to be the
case at least on arm64; the main user is vmalloc() while allocating
per-CPU IRQ stacks, and even with the largest possible NR_CPUS this
would not require allocating more than 16 PTE pages.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---

This patch is rather unpleasant (especially the arbitrary limit of pages
that can be deferred), but it seems difficult to avoid on arm64 as we
must wait to know whether all CPUs support BBML2-noabort before relying
on it to split blocks.

The case where the boot CPU supports BBML2-noabort but some other
doesn't is not explicitly supported. In that case, the linear map will
end up being PTE-mapped, but we will still use the block allocator for
page tables. This may be suboptimal, but it remains functionally
correct.

---
 include/linux/kpkeys.h        |  8 +++++
 mm/kpkeys_hardened_pgtables.c | 58 +++++++++++++++++++++++++++++++++--
 2 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/include/linux/kpkeys.h b/include/linux/kpkeys.h
index 983f55655dde..8cfeb6e5af56 100644
--- a/include/linux/kpkeys.h
+++ b/include/linux/kpkeys.h
@@ -133,6 +133,12 @@ bool kpkeys_ready_for_direct_map_split(void);
  */
 void kpkeys_hardened_pgtables_init(void);
 
+/*
+ * Should be called by architecture code as soon as it is safe to modify the
+ * pkey of arbitrary linear map ranges.
+ */
+void kpkeys_hardened_pgtables_init_late(void);
+
 #else /* CONFIG_KPKEYS_HARDENED_PGTABLES */
 
 static inline bool kpkeys_hardened_pgtables_enabled(void)
@@ -159,6 +165,8 @@ static inline void kpkeys_pgtable_free(struct page *page) {}
 
 static inline void kpkeys_hardened_pgtables_init(void) {}
 
+static inline void kpkeys_hardened_pgtables_init_late(void) {}
+
 #endif /* CONFIG_KPKEYS_HARDENED_PGTABLES */
 
 #endif /* _LINUX_KPKEYS_H */
diff --git a/mm/kpkeys_hardened_pgtables.c b/mm/kpkeys_hardened_pgtables.c
index 5b1231e1422a..223a0bb02df0 100644
--- a/mm/kpkeys_hardened_pgtables.c
+++ b/mm/kpkeys_hardened_pgtables.c
@@ -39,6 +39,7 @@ static void pba_pgtable_free(struct page *page);
 static int pba_prepare_direct_map_split(void);
 static bool pba_ready_for_direct_map_split(void);
 static void pba_init(void);
+static void pba_init_late(void);
 
 /* Trivial allocator in case the linear map is PTE-mapped (no block mapping) */
 static struct page *noblock_pgtable_alloc(gfp_t gfp)
@@ -107,6 +108,15 @@ void __init kpkeys_hardened_pgtables_init(void)
 	static_branch_enable(&kpkeys_hardened_pgtables_key);
 }
 
+void __init kpkeys_hardened_pgtables_init_late(void)
+{
+	if (!arch_kpkeys_enabled())
+		return;
+
+	if (pba_enabled())
+		pba_init_late();
+}
+
 /*
  * pkeys block allocator (PBA): dedicated page table allocator for block-mapped
  * linear map. Block splitting is minimised by prioritising the allocation and
@@ -174,7 +184,13 @@ static struct pkeys_block_allocator pkeys_block_allocator = {
 	.alloc_mutex = __MUTEX_INITIALIZER(pkeys_block_allocator.alloc_mutex)
 };
 
+static struct {
+	struct page *head_page;
+	unsigned int order;
+} pba_early_region __initdata;
+
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(pba_enabled_key);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(pba_can_set_pkey);
 
 static bool pba_enabled(void)
 {
@@ -188,6 +204,28 @@ static bool alloc_mutex_locked(void)
 	return mutex_get_owner(&pba->alloc_mutex) == (unsigned long)current;
 }
 
+/*
+ * __ref is used as this is called from __refill_pages() which is not __init.
+ * The call to pba_init_late() guarantees this is not called after boot has
+ * completed.
+ */
+static void __ref register_early_region(struct page *head_page,
+					unsigned int order)
+{
+	/*
+	 * Only one region is expected to be registered. Any further region
+	 * is left untracked (i.e. unprotected).
+	 */
+	if (WARN_ON(pba_early_region.head_page))
+		return;
+
+	pr_debug("%s: order=%d, pfn=%lx\n", __func__, order,
+		 page_to_pfn(head_page));
+
+	pba_early_region.head_page = head_page;
+	pba_early_region.order = order;
+}
+
 static void cached_list_add_pages(struct page *page, unsigned int nr_pages)
 {
 	struct pkeys_block_allocator *pba = &pkeys_block_allocator;
@@ -227,7 +265,7 @@ static struct page *__refill_pages(bool alloc_one)
 	struct pkeys_block_allocator *pba = &pkeys_block_allocator;
 	struct page *page;
 	unsigned int order;
-	int ret;
+	int ret = 0;
 
 	for (int i = 0; i < ARRAY_SIZE(refill_orders); ++i) {
 		order = refill_orders[i];
@@ -243,7 +281,10 @@ static struct page *__refill_pages(bool alloc_one)
 
 	guard(mutex)(&pba->alloc_mutex);
 
-	ret = set_pkey_pgtable(page, 1 << order);
+	if (static_branch_likely(&pba_can_set_pkey))
+		ret = set_pkey_pgtable(page, 1 << order);
+	else
+		register_early_region(page, order);
 
 	if (ret) {
 		__free_pages(page, order);
@@ -406,7 +447,20 @@ static void __init pba_init(void)
 	/*
 	 * Refill the cache so that the reserve pages are available for
 	 * splitting next time we need to refill.
+	 *
+	 * We cannot split the linear map at this stage, so the allocated
+	 * region will be registered as early region (pba_early_region) and
+	 * its pkey set later.
 	 */
 	ret = refill_pages();
 	WARN_ON(ret);
 }
+
+static void __init pba_init_late(void)
+{
+	static_branch_enable(&pba_can_set_pkey);
+
+	if (pba_early_region.head_page)
+		set_pkey_pgtable(pba_early_region.head_page,
+				 1 << pba_early_region.order);
+}
-- 
2.51.2


