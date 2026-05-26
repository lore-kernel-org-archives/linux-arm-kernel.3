Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3418CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 11:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRvHDNjzbBPS+rFbmPB2gJALNMuybb/07mdk5EJCKxw=; b=15HIkD4SAVsnluyrmqJqkbSDv4
	BYtGxJEK8Y1ADZ0ulIF7aXulD5lnDulHQJZqT2BhnK6/xFFKyidbgky+m5CjCy71ppbDu+BDteAWz
	HZkh+uFl/TG+CN6Y1wqwNr5N6K6T8yLoG7DCRBISQLi66FC8lahEPeL7M812hDDCjBzHtEa4R1eTy
	A8f8U0UrAJt/Nb4PPVunD36DXVxsADOGAeDUUDenB0+39U0zIBeYs+8Dir+aVF0Og7LbesRqP8za2
	IMyR5tIq7fECr9uWQDr+rJLKN64Wqo2jUIOEk8XKBKi/RJJIssq6LGZSqD7gyiYRYrxywfmadu+gW
	NXwK/Jyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpnW-00000001krZ-1QwW;
	Tue, 26 May 2026 11:18:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpnM-00000001kiG-2Suw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 11:18:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E91B4169C;
	Tue, 26 May 2026 04:17:54 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 250563F7D8;
	Tue, 26 May 2026 04:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779794280; bh=6UbRYk/YvXUAWtpLYZu6wDPS/Pd5/nUfgqkLWHxrJ7c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PePxMqzVehj2UIBIbvm64QPCtnTfHakL0X6eYCYG5J1vb7mX7Z/Psv1CjxGeS/4QO
	 IsEBBZDmeJFpvUK/kTgDkv3PDWQbzu8JWM8A0PpE16sxAkCdbkmo/xXA9mCxO7cLv0
	 DMI3tXJJzIrziKlnKHRV0juOFlczSPj0yPtA3hhg=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Tue, 26 May 2026 12:16:01 +0100
Subject: [PATCH RFC v8 12/24] mm: kpkeys: Protect regular page tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-kpkeys-v8-12-eaaacdacc67c@arm.com>
References: <20260526-kpkeys-v8-0-eaaacdacc67c@arm.com>
In-Reply-To: <20260526-kpkeys-v8-0-eaaacdacc67c@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, x86@kernel.org, Lorenzo Stoakes <ljs@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779794212; l=5204;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=6UbRYk/YvXUAWtpLYZu6wDPS/Pd5/nUfgqkLWHxrJ7c=;
 b=AfN7/YEevro//gMjkeXy1J5hlaMTGq9n0DUXKz40Zk4xYFsOdqkZJNxCNaiTUVJj9XCfiB7uO
 IVqsUweiiGOD1AQZhV/Z19fptOVNk7FpYunOkPfOIhc3Pm70S4uyOt0
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_041800_743493_C873C0E4 
X-CRM114-Status: GOOD (  18.38  )
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

This interface is then hooked into pagetable_alloc() and
pagetable_free(), protecting all page tables created once the buddy
allocator is available. Early page tables are allocated in other
ways and will be protected in subsequent patches.

This implementation of kpkeys_pgtable_{alloc,free}() is minimal and
relies on the linear map being fully PTE-mapped - otherwise
calling set_memory_pkey() on a single page may result in splitting a
block mapping, which in turn requires allocating a new PTP. A more
elaborate implementation could be added later to handle this
situation.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/kpkeys.h        | 10 +++++++++
 include/linux/mm.h            | 14 +++++++++++--
 mm/kpkeys_hardened_pgtables.c | 47 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/include/linux/kpkeys.h b/include/linux/kpkeys.h
index d413a17f8882..c7529f9e9f97 100644
--- a/include/linux/kpkeys.h
+++ b/include/linux/kpkeys.h
@@ -135,6 +135,9 @@ static inline bool kpkeys_hardened_pgtables_early_enabled(void)
 	return arch_supports_kpkeys_early();
 }
 
+struct page *kpkeys_pgtable_alloc(gfp_t gfp, unsigned int order);
+void kpkeys_pgtable_free(struct page *page, unsigned int order);
+
 /*
  * Should be called from mem_init(): as soon as the buddy allocator becomes
  * available and before any call to pagetable_alloc().
@@ -153,6 +156,13 @@ static inline bool kpkeys_hardened_pgtables_early_enabled(void)
 	return false;
 }
 
+static inline struct page *kpkeys_pgtable_alloc(gfp_t gfp, unsigned int order)
+{
+	return NULL;
+}
+
+static inline void kpkeys_pgtable_free(struct page *page, unsigned int order) {}
+
 static inline void kpkeys_hardened_pgtables_init(void) {}
 
 #endif /* CONFIG_KPKEYS_HARDENED_PGTABLES */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index af23453e9dbd..7b95b2351763 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -37,6 +37,7 @@
 #include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/iommu-debug-pagealloc.h>
+#include <linux/kpkeys.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -3648,7 +3649,12 @@ static inline bool ptdesc_test_kernel(const struct ptdesc *ptdesc)
  */
 static inline struct ptdesc *pagetable_alloc_noprof(gfp_t gfp, unsigned int order)
 {
-	struct page *page = alloc_pages_noprof(gfp | __GFP_COMP, order);
+	struct page *page;
+
+	if (kpkeys_hardened_pgtables_enabled())
+		page = kpkeys_pgtable_alloc(gfp | __GFP_COMP, order);
+	else
+		page = alloc_pages_noprof(gfp | __GFP_COMP, order);
 
 	return page_ptdesc(page);
 }
@@ -3657,8 +3663,12 @@ static inline struct ptdesc *pagetable_alloc_noprof(gfp_t gfp, unsigned int orde
 static inline void __pagetable_free(struct ptdesc *pt)
 {
 	struct page *page = ptdesc_page(pt);
+	unsigned int order = compound_order(page);
 
-	__free_pages(page, compound_order(page));
+	if (kpkeys_hardened_pgtables_enabled())
+		kpkeys_pgtable_free(page, order);
+	else
+		__free_pages(page, order);
 }
 
 #ifdef CONFIG_ASYNC_KERNEL_PGTABLE_FREE
diff --git a/mm/kpkeys_hardened_pgtables.c b/mm/kpkeys_hardened_pgtables.c
index 763f267bbfe4..fff7e2a64b64 100644
--- a/mm/kpkeys_hardened_pgtables.c
+++ b/mm/kpkeys_hardened_pgtables.c
@@ -1,12 +1,59 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/kpkeys.h>
 #include <linux/mm.h>
+#include <linux/set_memory.h>
 
 #include <kunit/visibility.h>
 
 __ro_after_init DEFINE_STATIC_KEY_FALSE(kpkeys_hardened_pgtables_key);
 EXPORT_SYMBOL_IF_KUNIT(kpkeys_hardened_pgtables_key);
 
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
+struct page *kpkeys_pgtable_alloc(gfp_t gfp, unsigned int order)
+{
+	struct page *page;
+	int ret;
+
+	page = alloc_pages_noprof(gfp, order);
+	if (!page)
+		return page;
+
+	ret = set_pkey_pgtable(page, 1 << order);
+	if (ret) {
+		__free_pages(page, order);
+		return NULL;
+	}
+
+	return page;
+}
+
+void kpkeys_pgtable_free(struct page *page, unsigned int order)
+{
+	set_pkey_default(page, 1 << order);
+	__free_pages(page, order);
+}
+
 void __init kpkeys_hardened_pgtables_init(void)
 {
 	if (!kpkeys_enabled())

-- 
2.51.2


