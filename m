Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58049CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IGMDvz2yV4/0JfvZ6QXLMRT5Pnmj7yCzlHePnPqn7A=; b=NyKwS/pengX3cnE5QMnFYhq+iw
	XxNXXc6xSIuOB0iDUiJQ31GXe/GortJNSYF82G7slD8Ey+HvP+UKZ38ep1VvIBQ7jq0CIl6JCl/YC
	corWDm76BQz3Yr0hEKxFPMjuSBU5jzHtOyRV3KS/uw2611bSO1ublDqBtQIlFTTYD389qcz1pek8b
	rdxbUmLi741//yPQ0+lglZ+X9pO9S0qqxWtyy8Oh0F7mhnxtzGopbTZMubksv0auLOe9RqQGnJFum
	iG+vBdjfi07AvdU8OOqLGAchageg3puYndHqj9KvPlCq/oJDFQQfExxdxM4P93ObO2OXlhmgnO5By
	kjmA4uwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIJX-0000000GnS0-1Org;
	Tue, 05 May 2026 16:08:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIJW-0000000GnQq-3326
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 16:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3IGMDvz2yV4/0JfvZ6QXLMRT5Pnmj7yCzlHePnPqn7A=; b=J4Mc6of1aGkwOSXz0gRUKj+TFm
	JGYbea7PELNno4gG3tHA1h/N1AKOzmRAKTNmXogfodQfjHcMrGUuc54mhIJ+b0Nw5OGczP/JIR3of
	MSZ5/BVdywgNID/hacVhZ8D1cUPZoWUg2MAYV1fdHSKWPgFRR4ytDyGY9/1xVitCYAQdTIMK+vWlR
	gQTCpoInyU5XEuc4giHe4VutPkvf3Afkhq0IasagyDBUWd7IQBmx8afdyxcjJevGQC5/hbIuSOzLG
	4uVLoTHcCPvlzt8AkhgPGZx6iOe8xPwlfrsh3qVfilML6h2sydNhR6o7v3a3gzy3QeBUOHgSRrYkp
	nigMe7AA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIJT-0000000Dyuv-1JuQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:08:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A8A714BF;
	Tue,  5 May 2026 09:07:53 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43D0A3F763;
	Tue,  5 May 2026 09:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777997278; bh=7pzU3b7DWaYhX0sffzNlwFRd/XRrt+LdkFDa48ecpjg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cBR/6v4Hv4Sr3C+f8YDgEMZpwRWX1wtvmFmvJ4Q2erUf2USp4d9GAswyqWIF4sbnG
	 GLczzGyxydeIfR6a0yyGKRWCwOyymK1qljTki04APrLxiztckPYDhTly8QWWwWVkWp
	 T9E7LuRUPGl4uZfQnqobNvCfJI5rRz0OdpVFUCK8=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Tue, 05 May 2026 17:06:01 +0100
Subject: [PATCH RFC v7 12/24] mm: kpkeys: Protect regular page tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-kpkeys-v7-12-20c0bdd97197@arm.com>
References: <20260505-kpkeys-v7-0-20c0bdd97197@arm.com>
In-Reply-To: <20260505-kpkeys-v7-0-20c0bdd97197@arm.com>
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
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, 
 Yang Shi <yang@os.amperecomputing.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org, 
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777997220; l=5204;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=7pzU3b7DWaYhX0sffzNlwFRd/XRrt+LdkFDa48ecpjg=;
 b=gnCgSobzbTfSdcQyyWLGAZ1VLNECP5e8FFcomVkcQfwTIUG7UQTxpTJUfrmF0R9blBKBKk2dU
 7NsCVzqmZ4hC2NzC38FxkayBoIYqxn8krJSXX+7okMc6XTHfLzpc8aQ
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_170759_944319_02876653 
X-CRM114-Status: GOOD (  18.42  )
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
index 1ed0299ad5ac..c9f63415162b 100644
--- a/include/linux/kpkeys.h
+++ b/include/linux/kpkeys.h
@@ -131,6 +131,9 @@ static inline bool kpkeys_hardened_pgtables_early_enabled(void)
 	return arch_supports_kpkeys_early();
 }
 
+struct page *kpkeys_pgtable_alloc(gfp_t gfp, unsigned int order);
+void kpkeys_pgtable_free(struct page *page, unsigned int order);
+
 /*
  * Should be called from mem_init(): as soon as the buddy allocator becomes
  * available and before any call to pagetable_alloc().
@@ -149,6 +152,13 @@ static inline bool kpkeys_hardened_pgtables_early_enabled(void)
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


