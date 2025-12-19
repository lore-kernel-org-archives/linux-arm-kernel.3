Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AD4D7879C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 16:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oG9kzwziN2rWpW0J23ulZ8PPa8l4j1tYoxfToGcGa/c=; b=FxrpSrdWqRPnOxv7XOWi1eJYtt
	fM2zcgklf7euBoWIgtE57YKLBmIiI/M0zxGA0mci5AvsOvds5M9IyFSvWc4qIzLUEMcjT/ErTzcdW
	+iZsbFovU0uwV1ZTm4nzT0/oUmMmKYpaJ9aPaOIQNcNa24XmXmRDlLX0EjAz9FvMMgo+TlR5UUUwn
	YXEYJ3PgflhlWDcUrzyrVCneqTRnp0J8DxzC9K/O0rEZ9zT+U9wT+PPpiiJ6GzPDwMJs39CtF3uTj
	nYhz8WULMxUSrYJWNwjFoCvfB/W16TND9561Y8u84A7hJamMIyKOB+1y6ZGwUzRevoTHNcFxwQqLA
	y0W10R5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdA4-0000000AdEF-2tRi;
	Fri, 19 Dec 2025 16:17:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWd9z-0000000AdB1-1W6b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 16:16:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F3C3241747;
	Fri, 19 Dec 2025 16:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC90C4CEF1;
	Fri, 19 Dec 2025 16:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766161014;
	bh=F/duNi/R+z4Zxeogcma6jsyj8uMoppVrtRXoOSW/Mnw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dr1njzt/ZA2YkMrI9vlpvAk58EeOXzfZgvm82fooWsxvAjI+WLQL7Q/izIntoUvci
	 lNYwSN6zJDeOAv7Py5/fvtKwuZt6c2r6QNzKrLsZia6iFqr8ljf+27wmsA5sQxOs6C
	 NLuL6dY8TCD75VnCUFjGlNOmAgKtpE7NrmheisGdmSORBdfWQXvrwt02aM4URw2mmn
	 cKZVwFvtZcBGtj/TYUN05rtShkZUV5gWS9VMqCZm0z665W4wfFZKeO8C4ZqI5hJBmB
	 aNNcdeMS86UdNRfi3hcsDCaqTY/hITk5Gev5USZjW4RHdd+QAmsh8MnJGwlJmyb3a9
	 fJ9AM8CkZhLuA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthew Wilcox <willy@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 4/4] mm: remove ARCH_NEEDS_KMAP_HIGH_GET
Date: Fri, 19 Dec 2025 17:15:59 +0100
Message-Id: <20251219161559.556737-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251219161559.556737-1-arnd@kernel.org>
References: <20251219161559.556737-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_081655_464981_DCCBBB3E 
X-CRM114-Status: GOOD (  22.13  )
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

From: Arnd Bergmann <arnd@arndb.de>

Arm has stopped setting ARCH_NEEDS_KMAP_HIGH_GET, so this
is handled using the same wrappers across all architectures
now, which leaves room for simplification.

Replace lock_kmap()/unlock_kmap() with open-coded spinlocks
and drop the now empty arch_kmap_local_high_get() and
kmap_high_unmap_local() helpers.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 mm/highmem.c | 100 ++++++---------------------------------------------
 1 file changed, 10 insertions(+), 90 deletions(-)

diff --git a/mm/highmem.c b/mm/highmem.c
index b5c8e4c2d5d4..bdeec56471c9 100644
--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -143,25 +143,6 @@ static  __cacheline_aligned_in_smp DEFINE_SPINLOCK(kmap_lock);
 
 pte_t *pkmap_page_table;
 
-/*
- * Most architectures have no use for kmap_high_get(), so let's abstract
- * the disabling of IRQ out of the locking in that case to save on a
- * potential useless overhead.
- */
-#ifdef ARCH_NEEDS_KMAP_HIGH_GET
-#define lock_kmap()             spin_lock_irq(&kmap_lock)
-#define unlock_kmap()           spin_unlock_irq(&kmap_lock)
-#define lock_kmap_any(flags)    spin_lock_irqsave(&kmap_lock, flags)
-#define unlock_kmap_any(flags)  spin_unlock_irqrestore(&kmap_lock, flags)
-#else
-#define lock_kmap()             spin_lock(&kmap_lock)
-#define unlock_kmap()           spin_unlock(&kmap_lock)
-#define lock_kmap_any(flags)    \
-		do { spin_lock(&kmap_lock); (void)(flags); } while (0)
-#define unlock_kmap_any(flags)  \
-		do { spin_unlock(&kmap_lock); (void)(flags); } while (0)
-#endif
-
 struct page *__kmap_to_page(void *vaddr)
 {
 	unsigned long base = (unsigned long) vaddr & PAGE_MASK;
@@ -237,9 +218,9 @@ static void flush_all_zero_pkmaps(void)
 
 void __kmap_flush_unused(void)
 {
-	lock_kmap();
+	spin_lock(&kmap_lock);
 	flush_all_zero_pkmaps();
-	unlock_kmap();
+	spin_unlock(&kmap_lock);
 }
 
 static inline unsigned long map_new_virtual(struct page *page)
@@ -273,10 +254,10 @@ static inline unsigned long map_new_virtual(struct page *page)
 
 			__set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(pkmap_map_wait, &wait);
-			unlock_kmap();
+			spin_unlock(&kmap_lock);
 			schedule();
 			remove_wait_queue(pkmap_map_wait, &wait);
-			lock_kmap();
+			spin_lock(&kmap_lock);
 
 			/* Somebody else might have mapped it while we slept */
 			if (page_address(page))
@@ -312,60 +293,32 @@ void *kmap_high(struct page *page)
 	 * For highmem pages, we can't trust "virtual" until
 	 * after we have the lock.
 	 */
-	lock_kmap();
+	spin_lock(&kmap_lock);
 	vaddr = (unsigned long)page_address(page);
 	if (!vaddr)
 		vaddr = map_new_virtual(page);
 	pkmap_count[PKMAP_NR(vaddr)]++;
 	BUG_ON(pkmap_count[PKMAP_NR(vaddr)] < 2);
-	unlock_kmap();
+	spin_unlock(&kmap_lock);
 	return (void *) vaddr;
 }
 EXPORT_SYMBOL(kmap_high);
 
-#ifdef ARCH_NEEDS_KMAP_HIGH_GET
-/**
- * kmap_high_get - pin a highmem page into memory
- * @page: &struct page to pin
- *
- * Returns the page's current virtual memory address, or NULL if no mapping
- * exists.  If and only if a non null address is returned then a
- * matching call to kunmap_high() is necessary.
- *
- * This can be called from any context.
- */
-void *kmap_high_get(const struct page *page)
-{
-	unsigned long vaddr, flags;
-
-	lock_kmap_any(flags);
-	vaddr = (unsigned long)page_address(page);
-	if (vaddr) {
-		BUG_ON(pkmap_count[PKMAP_NR(vaddr)] < 1);
-		pkmap_count[PKMAP_NR(vaddr)]++;
-	}
-	unlock_kmap_any(flags);
-	return (void *) vaddr;
-}
-#endif
-
 /**
  * kunmap_high - unmap a highmem page into memory
  * @page: &struct page to unmap
  *
- * If ARCH_NEEDS_KMAP_HIGH_GET is not defined then this may be called
- * only from user context.
+ * This may be called only from user context.
  */
 void kunmap_high(const struct page *page)
 {
 	unsigned long vaddr;
 	unsigned long nr;
-	unsigned long flags;
 	int need_wakeup;
 	unsigned int color = get_pkmap_color(page);
 	wait_queue_head_t *pkmap_map_wait;
 
-	lock_kmap_any(flags);
+	spin_lock(&kmap_lock);
 	vaddr = (unsigned long)page_address(page);
 	BUG_ON(!vaddr);
 	nr = PKMAP_NR(vaddr);
@@ -392,7 +345,7 @@ void kunmap_high(const struct page *page)
 		pkmap_map_wait = get_pkmap_wait_queue_head(color);
 		need_wakeup = waitqueue_active(pkmap_map_wait);
 	}
-	unlock_kmap_any(flags);
+	spin_unlock(&kmap_lock);
 
 	/* do wake-up, if needed, race-free outside of the spin lock */
 	if (need_wakeup)
@@ -507,30 +460,11 @@ static inline void kmap_local_idx_pop(void)
 #define arch_kmap_local_unmap_idx(idx, vaddr)	kmap_local_calc_idx(idx)
 #endif
 
-#ifndef arch_kmap_local_high_get
-static inline void *arch_kmap_local_high_get(const struct page *page)
-{
-	return NULL;
-}
-#endif
-
 #ifndef arch_kmap_local_set_pte
 #define arch_kmap_local_set_pte(mm, vaddr, ptep, ptev)	\
 	set_pte_at(mm, vaddr, ptep, ptev)
 #endif
 
-/* Unmap a local mapping which was obtained by kmap_high_get() */
-static inline bool kmap_high_unmap_local(unsigned long vaddr)
-{
-#ifdef ARCH_NEEDS_KMAP_HIGH_GET
-	if (vaddr >= PKMAP_ADDR(0) && vaddr < PKMAP_ADDR(LAST_PKMAP)) {
-		kunmap_high(pte_page(ptep_get(&pkmap_page_table[PKMAP_NR(vaddr)])));
-		return true;
-	}
-#endif
-	return false;
-}
-
 static pte_t *__kmap_pte;
 
 static pte_t *kmap_get_pte(unsigned long vaddr, int idx)
@@ -574,8 +508,6 @@ EXPORT_SYMBOL_GPL(__kmap_local_pfn_prot);
 
 void *__kmap_local_page_prot(const struct page *page, pgprot_t prot)
 {
-	void *kmap;
-
 	/*
 	 * To broaden the usage of the actual kmap_local() machinery always map
 	 * pages when debugging is enabled and the architecture has no problems
@@ -584,11 +516,6 @@ void *__kmap_local_page_prot(const struct page *page, pgprot_t prot)
 	if (!IS_ENABLED(CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP) && !PageHighMem(page))
 		return page_address(page);
 
-	/* Try kmap_high_get() if architecture has it enabled */
-	kmap = arch_kmap_local_high_get(page);
-	if (kmap)
-		return kmap;
-
 	return __kmap_local_pfn_prot(page_to_pfn(page), prot);
 }
 EXPORT_SYMBOL(__kmap_local_page_prot);
@@ -606,14 +533,7 @@ void kunmap_local_indexed(const void *vaddr)
 			WARN_ON_ONCE(1);
 			return;
 		}
-		/*
-		 * Handle mappings which were obtained by kmap_high_get()
-		 * first as the virtual address of such mappings is below
-		 * PAGE_OFFSET. Warn for all other addresses which are in
-		 * the user space part of the virtual address space.
-		 */
-		if (!kmap_high_unmap_local(addr))
-			WARN_ON_ONCE(addr < PAGE_OFFSET);
+		WARN_ON_ONCE(addr < PAGE_OFFSET);
 		return;
 	}
 
-- 
2.39.5


