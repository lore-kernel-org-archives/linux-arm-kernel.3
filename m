Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108FDF5A8BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 21:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ns1DV6x0fHsLnc3zRjkL0inNdeAPzDm/07YqeMaVlZs=; b=kvU7XxMXx+8zWOhQSag5PNO6GE
	BeDSEl2DKHBtDshMQFipDQkGt/b7i0AY3CxiiuXwNuQOpRLi6rP8urYF4Xffq3sJ38za6qOHYzKFC
	6757sDoDWBZn0TFpPEVimSTM0Af+D+zYLqIlWD/nBYWTsWK/JtJ4p1glFW+OEw5QdSvOdmgdHV/vC
	mF+JSUACE5xeSK7DcpxMR10L/BaEWS8beJKuF8MRlFMWWj32X/pKrecsqxVVOtgc+hgxrzIJV1Vd3
	lFNpVh0Qk76hxrmLBrBiG3stgYJaDg4zRPdPnyHvzUR7ynH3WrSEmrCpxO0DT6q5K0ywWrCN8jrfs
	d91bS23g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvzF-00000007fD0-3aMl;
	Mon, 20 Apr 2026 21:16:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvzD-00000007fCK-1Tf3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 21:16:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86C6043E94;
	Mon, 20 Apr 2026 21:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812B1C19425;
	Mon, 20 Apr 2026 21:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776719814;
	bh=1ICWP0aN3tVVPF3/42lRvuEcmakoBEeZExkl+2SI7Ww=;
	h=From:Date:Subject:To:Cc:From;
	b=IuNxAYrNXUb9BmToowo6po+Fxyb9mtPdJmisDUt1BHHZMx7xAEvRO5WOjADqoigxn
	 mCGqO4Sf4iw34SOxhzT8gxgsxLt+TTFb2Cy2EW7mGxjkMeJUw1FN4MHVuEcZ475lF2
	 GJnFJyZIPRqVbGDO0vwIrNUYA5ZI2nJ29h+PpsVao10354j+ORUIypyOZCkqMGmgXM
	 5IhdFIiUQA9JjnKPo/z2nZ23kp9dZG9f0b1TxOlmqbG654sPuNtXTCKsonNpEtjRqI
	 BQeQ9otxY37/bIYeec8vJ4Ha0RzZzGSCHYxn2g9zL9Skt0cseGJha8UPwMfqEKt7Jb
	 U0KKMfWexADoA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Mon, 20 Apr 2026 23:16:46 +0200
Subject: [PATCH] mm/page_alloc: fix initialization of tags of the huge zero
 folio with init_on_free
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-zerotags-v1-1-3edc93e95bb4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAL2X5mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Nz3arUovySxPRiXWMT40RjM3PjVEOLFCWg8oKi1LTMCrBR0bG1tQC
 gW2W7WgAAAA==
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Zi Yan <ziy@nvidia.com>, Lance Yang <lance.yang@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, stable@vger.kernel.org, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_141655_462935_67195620 
X-CRM114-Status: GOOD (  23.44  )
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

__GFP_ZEROTAGS semantics are currently a bit weird, but effectively this
flag is only ever set alongside __GFP_ZERO and __GFP_SKIP_KASAN.

If we run with init_on_free, we will zero out pages during
__free_pages_prepare(), to skip zeroing on the allocation path.

However, when allocating with __GFP_ZEROTAG set, post_alloc_hook() will
consequently not only skip clearing page content, but also skip
clearing tag memory.

Not clearing tags through __GFP_ZEROTAGS is irrelevant for most pages that
will get mapped to user space through set_pte_at() later: set_pte_at() and
friends will detect that the tags have not been initialized yet
(PG_mte_tagged not set), and initialize them.

However, for the huge zero folio, which will be mapped through a PMD
marked as special, this initialization will not be performed, ending up
exposing whatever tags were still set for the pages.

The docs (Documentation/arch/arm64/memory-tagging-extension.rst) state
that allocation tags are set to 0 when a page is first mapped to user
space. That no longer holds with the huge zero folio when init_on_free
is enabled.

Fix it by decoupling __GFP_ZEROTAGS from __GFP_ZERO, passing to
tag_clear_highpages() whether we want to also clear page content.

As we are touching the interface either way, just clean it up by
only calling it when HW tags are enabled, dropping the return value, and
dropping the common code stub.

Reproduced with the huge zero folio by modifying the check_buffer_fill
arm64/mte selftest to use a 2 MiB area, after making sure that pages have
a non-0 tag set when freeing (note that, during boot, we will not
actually initialize tags, but only set KASAN_TAG_KERNEL in the page
flags).

	$ ./check_buffer_fill
	1..20
	...
	not ok 17 Check initial tags with private mapping, sync error mode and mmap memory
	not ok 18 Check initial tags with private mapping, sync error mode and mmap/mprotect memory
	...

This code needs more cleanups; we'll tackle that next, like
decoupling __GFP_ZEROTAGS from __GFP_SKIP_KASAN, moving all the
KASAN magic into a separate helper, and consolidating HW-tag handling.

Fixes: adfb6609c680 ("mm/huge_memory: initialise the tags of the huge zero folio")
Cc: stable@vger.kernel.org
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/arm64/include/asm/page.h |  3 ---
 arch/arm64/mm/fault.c         | 16 +++++-----------
 include/linux/gfp_types.h     | 10 +++++-----
 include/linux/highmem.h       | 10 +---------
 mm/page_alloc.c               | 12 +++++++-----
 5 files changed, 18 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.h
index e25d0d18f6d7..5c6cbfbbd34c 100644
--- a/arch/arm64/include/asm/page.h
+++ b/arch/arm64/include/asm/page.h
@@ -33,9 +33,6 @@ struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
 						unsigned long vaddr);
 #define vma_alloc_zeroed_movable_folio vma_alloc_zeroed_movable_folio
 
-bool tag_clear_highpages(struct page *to, int numpages);
-#define __HAVE_ARCH_TAG_CLEAR_HIGHPAGES
-
 #define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
 
 typedef struct page *pgtable_t;
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0f3c5c7ca054..32a3723f2d34 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -1018,21 +1018,15 @@ struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
 	return vma_alloc_folio(flags, 0, vma, vaddr);
 }
 
-bool tag_clear_highpages(struct page *page, int numpages)
+void tag_clear_highpages(struct page *page, int numpages, bool clear_pages)
 {
-	/*
-	 * Check if MTE is supported and fall back to clear_highpage().
-	 * get_huge_zero_folio() unconditionally passes __GFP_ZEROTAGS and
-	 * post_alloc_hook() will invoke tag_clear_highpages().
-	 */
-	if (!system_supports_mte())
-		return false;
-
 	/* Newly allocated pages, shouldn't have been tagged yet */
 	for (int i = 0; i < numpages; i++, page++) {
 		WARN_ON_ONCE(!try_page_mte_tagging(page));
-		mte_zero_clear_page_tags(page_address(page));
+		if (clear_pages)
+			mte_zero_clear_page_tags(page_address(page));
+		else
+			mte_clear_page_tags(page_address(page));
 		set_page_mte_tagged(page);
 	}
-	return true;
 }
diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
index 6c75df30a281..fd53a6fba33f 100644
--- a/include/linux/gfp_types.h
+++ b/include/linux/gfp_types.h
@@ -273,11 +273,11 @@ enum {
  *
  * %__GFP_ZERO returns a zeroed page on success.
  *
- * %__GFP_ZEROTAGS zeroes memory tags at allocation time if the memory itself
- * is being zeroed (either via __GFP_ZERO or via init_on_alloc, provided that
- * __GFP_SKIP_ZERO is not set). This flag is intended for optimization: setting
- * memory tags at the same time as zeroing memory has minimal additional
- * performance impact.
+ * %__GFP_ZEROTAGS zeroes memory tags at allocation time. This flag is intended
+ * for optimization: setting memory tags at the same time as zeroing memory
+ * (e.g., with __GPF_ZERO) has minimal additional performance impact. However,
+ * __GFP_ZEROTAGS also zeroes the tags even if memory is not getting zeroed at
+ * allocation time (e.g., with init_on_free).
  *
  * %__GFP_SKIP_KASAN makes KASAN skip unpoisoning on page allocation.
  * Used for userspace and vmalloc pages; the latter are unpoisoned by
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index af03db851a1d..62f589baa343 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -345,15 +345,7 @@ static inline void clear_highpage_kasan_tagged(struct page *page)
 	kunmap_local(kaddr);
 }
 
-#ifndef __HAVE_ARCH_TAG_CLEAR_HIGHPAGES
-
-/* Return false to let people know we did not initialize the pages */
-static inline bool tag_clear_highpages(struct page *page, int numpages)
-{
-	return false;
-}
-
-#endif
+void tag_clear_highpages(struct page *to, int numpages, bool clear_pages);
 
 /*
  * If we pass in a base or tail page, we can zero up to PAGE_SIZE.
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 65e205111553..8c6821d25a00 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1808,9 +1808,9 @@ static inline bool should_skip_init(gfp_t flags)
 inline void post_alloc_hook(struct page *page, unsigned int order,
 				gfp_t gfp_flags)
 {
+	const bool zero_tags = kasan_hw_tags_enabled() && (gfp_flags & __GFP_ZEROTAGS);
 	bool init = !want_init_on_free() && want_init_on_alloc(gfp_flags) &&
 			!should_skip_init(gfp_flags);
-	bool zero_tags = init && (gfp_flags & __GFP_ZEROTAGS);
 	int i;
 
 	set_page_private(page, 0);
@@ -1832,11 +1832,13 @@ inline void post_alloc_hook(struct page *page, unsigned int order,
 	 */
 
 	/*
-	 * If memory tags should be zeroed
-	 * (which happens only when memory should be initialized as well).
+	 * Clearing tags can efficiently clear the memory for us as well, if
+	 * required.
 	 */
-	if (zero_tags)
-		init = !tag_clear_highpages(page, 1 << order);
+	if (zero_tags) {
+		tag_clear_highpages(page, 1 << order, /* clear_pages= */init);
+		init = false;
+	}
 
 	if (!should_skip_kasan_unpoison(gfp_flags) &&
 	    kasan_unpoison_pages(page, order, init)) {

---
base-commit: f1541b40cd422d7e22273be9b7e9edfc9ea4f0d7
change-id: 20260417-zerotags-343a3673e18d

Best regards,
-- 
David Hildenbrand (Arm) <david@kernel.org>


