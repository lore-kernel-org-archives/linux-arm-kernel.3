Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F93F8FA94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C/zETneSXdt4Qa99E3e+0wvtKf5m0NGH+avSAJ+gITY=; b=w09I0kA6V9QBFyDh1Bw011ttxe
	jYFoXwW6WRca+P/PhXgDllYz4/VtWrfBSz2jBFCcReoBpz+s5LxDpCbo3X5h72TKiwD2AybURQbOk
	yDWIvb8tuEKVSvY8no/4AHPLgqSYxYEzM6iWufK0jqdKOxIYRDKgfLwRYv3NtgNyxsXAIDk7LbtpG
	ABLdbaFSql8EDdE8W77iS53L14AlFROfXNMRR1Fch34SupHm5EcHgpAl1yFK5rRzPYLC0v2e5ZosH
	t7sRDxvm+12wufiQU/8QZdE0uwE3pI3F81t6fky0NbYUeeT1Jp+tzrEXqO3iT/R6ym/o2vbFFQwwI
	1sEsJfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDC4-00000008qNE-1DKK;
	Tue, 21 Apr 2026 15:39:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDC2-00000008qMt-00iO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 15:39:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 311CF4151B;
	Tue, 21 Apr 2026 15:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74479C2BCB6;
	Tue, 21 Apr 2026 15:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776785957;
	bh=Ik9BfKVfhf9yZ3LiURODlQpyNGNrs0AnoKj75WR+DEs=;
	h=From:Date:Subject:To:Cc:From;
	b=DolYikg4H+7mnTbsnAlHUOtejFyckSeDJsZa0O/KWPbowntUsHTsFthTt2vYLcUKO
	 n4ibgl7imYZNrM6J0+PbmHuuRWivxHQXAU3aYCe2Qplntj+ueiR3wkzCABpt+oMNGE
	 1hvNlZZFJoZSYSsr3804XezMrmndYGYHDcCXhM57Mx3CyLyFOyCGEd+V0qxFAOm447
	 A5kekRRFZP6GiSY/nwS4uPO2prdRQwW23XzReaDYX1RgrtxB0ifppG3EyoAnVVVJ6I
	 1xuAQapdwHznNrlaASa1C0jaaKzawk8hZK28N0xA3xJ3eUTFbmTNlHuBwXousJEdPr
	 j1/sVa5TeUllA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Tue, 21 Apr 2026 17:39:07 +0200
Subject: [PATCH v2] mm/page_alloc: fix initialization of tags of the huge
 zero folio with init_on_free
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-zerotags-v2-1-05cb1035482e@kernel.org>
X-B4-Tracking: v=1; b=H4sIABqa52kC/0XMSwrCMBSF4a2UOzaSl6115D6kg7S5pkFJ5KYEt
 WTvxiI4/A+Hb4WE5DHBqVmBMPvkY6ghdw1MswkOmbe1QXLZci069kaKi3GJKa2MajuF4mih3h+
 EV//cqMtQe/ZpifTa5Cy+6w+R/I9kwQRTaKdeYX8YR32+IQW87yM5GEopH77SdXuhAAAA
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Zi Yan <ziy@nvidia.com>, Lance Yang <lance.yang@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Mark Brown <broonie@kernel.org>, 
 Dev Jain <dev.jain@arm.com>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, stable@vger.kernel.org, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_083918_109862_4A564308 
X-CRM114-Status: GOOD (  25.71  )
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

Invert the meaning of the tag_clear_highpages() return value to have
clearer semantics.

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
decoupling __GFP_ZEROTAGS from __GFP_SKIP_KASAN.

Fixes: adfb6609c680 ("mm/huge_memory: initialise the tags of the huge zero folio")
Cc: stable@vger.kernel.org
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
Changes in v2:
- Drop kasan_hw_tags_enabled() handling, as it missed the case of
  user-space MTE without KASAN.
- Keep letting_clear_highpages() return a bool and re-instantiate
  system_supports_mte() handling in the arm64 variant.
- Rephrase __GFP_ZEROTAGS comment, making it clearer that this is not
  just a performance improvement.
- Retested and more excessively build tested
- Using a new b4 template, hopefully that doesn't mess things up
- Link to v1: https://lore.kernel.org/r/20260420-zerotags-v1-1-3edc93e95bb4@kernel.org
---
 arch/arm64/include/asm/page.h |  2 +-
 arch/arm64/mm/fault.c         | 11 +++++++----
 include/linux/gfp_types.h     | 10 +++++-----
 include/linux/highmem.h       |  7 ++++---
 mm/page_alloc.c               |  8 ++++----
 5 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.h
index e25d0d18f6d7..58200de8a221 100644
--- a/arch/arm64/include/asm/page.h
+++ b/arch/arm64/include/asm/page.h
@@ -33,7 +33,7 @@ struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
 						unsigned long vaddr);
 #define vma_alloc_zeroed_movable_folio vma_alloc_zeroed_movable_folio
 
-bool tag_clear_highpages(struct page *to, int numpages);
+bool tag_clear_highpages(struct page *to, int numpages, bool clear_pages);
 #define __HAVE_ARCH_TAG_CLEAR_HIGHPAGES
 
 #define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0f3c5c7ca054..739800835920 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -1018,7 +1018,7 @@ struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
 	return vma_alloc_folio(flags, 0, vma, vaddr);
 }
 
-bool tag_clear_highpages(struct page *page, int numpages)
+bool tag_clear_highpages(struct page *page, int numpages, bool clear_pages)
 {
 	/*
 	 * Check if MTE is supported and fall back to clear_highpage().
@@ -1026,13 +1026,16 @@ bool tag_clear_highpages(struct page *page, int numpages)
 	 * post_alloc_hook() will invoke tag_clear_highpages().
 	 */
 	if (!system_supports_mte())
-		return false;
+		return clear_pages;
 
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
+	return false;
 }
diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
index 6c75df30a281..d79049291b1a 100644
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
+ * %__GFP_ZEROTAGS zeroes memory tags at allocation time. Setting memory tags at
+ * the same time as zeroing memory (e.g., with __GPF_ZERO) has minimal
+ * additional performance impact. However, __GFP_ZEROTAGS also zeroes the tags
+ * even if memory is not getting zeroed at allocation time (e.g.,
+ * with init_on_free).
  *
  * %__GFP_SKIP_KASAN makes KASAN skip unpoisoning on page allocation.
  * Used for userspace and vmalloc pages; the latter are unpoisoned by
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index af03db851a1d..d7aac9de1c8a 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -347,10 +347,11 @@ static inline void clear_highpage_kasan_tagged(struct page *page)
 
 #ifndef __HAVE_ARCH_TAG_CLEAR_HIGHPAGES
 
-/* Return false to let people know we did not initialize the pages */
-static inline bool tag_clear_highpages(struct page *page, int numpages)
+/* Returns true if the caller has to initialize the pages */
+static inline bool tag_clear_highpages(struct page *page, int numpages,
+		bool clear_pages)
 {
-	return false;
+	return clear_pages;
 }
 
 #endif
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 65e205111553..71859993dd54 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1808,9 +1808,9 @@ static inline bool should_skip_init(gfp_t flags)
 inline void post_alloc_hook(struct page *page, unsigned int order,
 				gfp_t gfp_flags)
 {
+	const bool zero_tags = gfp_flags & __GFP_ZEROTAGS;
 	bool init = !want_init_on_free() && want_init_on_alloc(gfp_flags) &&
 			!should_skip_init(gfp_flags);
-	bool zero_tags = init && (gfp_flags & __GFP_ZEROTAGS);
 	int i;
 
 	set_page_private(page, 0);
@@ -1832,11 +1832,11 @@ inline void post_alloc_hook(struct page *page, unsigned int order,
 	 */
 
 	/*
-	 * If memory tags should be zeroed
-	 * (which happens only when memory should be initialized as well).
+	 * Clearing tags can efficiently clear the memory for us as well, if
+	 * required.
 	 */
 	if (zero_tags)
-		init = !tag_clear_highpages(page, 1 << order);
+		init = tag_clear_highpages(page, 1 << order, /* clear_pages= */init);
 
 	if (!should_skip_kasan_unpoison(gfp_flags) &&
 	    kasan_unpoison_pages(page, order, init)) {

---

base-commit: f1541b40cd422d7e22273be9b7e9edfc9ea4f0d7

change-id: 20260417-zerotags-343a3673e18d

--

Cheers,

David


