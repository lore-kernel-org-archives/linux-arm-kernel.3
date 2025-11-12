Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DD9CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eaY9qzSEuHwDMfDqM2mSbh8XyoCRrbKT1zEVawsT8+w=; b=jndibZavJhquT4EkA26wrxZcUE
	AJMrxpJaeT6ldMWdOktjxjhTVBWnEY8t8Ow6IfskUrTGg5jHqmHGR5rFc3ahDJZM9XwTHvUoeZO0D
	rxC+OVIz8ePrW/9NJtw7W7YAKs5Gxmxig4OoJm9XnR8jAzyJhYQgMfzoFGxQJ64VhzOQNzt1tEfMf
	LS6kymRR7W8T1EGe7+IbejEQJpImatXJ3hdL1P5VvXZKCP/j6gGHFDsYDoqMUSWoSKWh+k6lrkRVQ
	DgNe4rBtXs6PCUnC/AVRWopul0J7ejgxs2wQBFm4voy35DvryqvP2ATgjnYIwCZBjC/V4yUI+KXJa
	IHMpV9JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8iA-00000008e0g-21jy;
	Wed, 12 Nov 2025 11:08:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8i7-00000008dyy-3PY8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:08:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B70531595;
	Wed, 12 Nov 2025 03:08:15 -0800 (PST)
Received: from MacBook-Pro.blr.arm.com.com (unknown [10.164.18.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 58F5D3F66E;
	Wed, 12 Nov 2025 03:08:18 -0800 (PST)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	urezki@gmail.com,
	akpm@linux-foundation.org
Cc: ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	shijie@os.amperecomputing.com,
	yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	npiggin@gmail.com,
	willy@infradead.org,
	david@kernel.org,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [RFC PATCH 1/2] mm/vmalloc: Do not align size to huge size
Date: Wed, 12 Nov 2025 16:38:06 +0530
Message-Id: <20251112110807.69958-2-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20251112110807.69958-1-dev.jain@arm.com>
References: <20251112110807.69958-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_030823_931087_A4C0BDEF 
X-CRM114-Status: GOOD (  20.61  )
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

vmalloc() consists of the following:

(1) find empty space in the vmalloc space -> (2) get physical pages from
the buddy system -> (3) map the pages into the pagetable.

It turns out that the cost of (1) and (3) is pretty insignificant. Hence,
the cost of vmalloc becomes highly sensitive to physical memory allocation
time.

Currently, if we decide to use huge mappings, apart from aligning the start
of the target vm_struct region to the huge-alignment, we also align the
size. This does not seem to produce any benefit (apart from simplification
of the code), and there is a clear disadvantage - as mentioned above, the
main cost of vmalloc comes from its interaction with the buddy system, and
thus requesting more memory than was requested by the caller is suboptimal
and unnecessary.

This change is also motivated due to the next patch ("arm64/mm: Enable
vmalloc-huge by default"). Suppose that some user of vmalloc maps 17 pages,
uses that mapping for an extremely short time, and vfree's it. That patch,
without this patch, on arm64 will ultimately map 16 * 2 = 32 pages in a
contiguous way. Since the mapping is used for a very short time, it is
likely that the extra cost of mapping 15 pages defeats any benefit from
reduced TLB pressure, and regresses that code path. 

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/vmalloc.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 798b2ed21e46..ddd9294a4634 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -647,7 +647,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages, unsigned int page_shift)
 {
-	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
+	unsigned int i, step, nr = (end - addr) >> PAGE_SHIFT;
 
 	WARN_ON(page_shift < PAGE_SHIFT);
 
@@ -655,7 +655,8 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 			page_shift == PAGE_SHIFT)
 		return vmap_small_pages_range_noflush(addr, end, prot, pages);
 
-	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
+	step = 1U << (page_shift - PAGE_SHIFT);
+	for (i = 0; i < ALIGN_DOWN(nr, step); i += step) {
 		int err;
 
 		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
@@ -666,8 +667,9 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 
 		addr += 1UL << page_shift;
 	}
-
-	return 0;
+	if (IS_ALIGNED(nr, step))
+		return 0;
+	return vmap_small_pages_range_noflush(addr, end, prot, pages + i);
 }
 
 int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
@@ -3171,7 +3173,7 @@ struct vm_struct *__get_vm_area_node(unsigned long size,
 	unsigned long requested_size = size;
 
 	BUG_ON(in_interrupt());
-	size = ALIGN(size, 1ul << shift);
+	size = PAGE_ALIGN(size);
 	if (unlikely(!size))
 		return NULL;
 
@@ -3327,7 +3329,7 @@ static void vm_reset_perms(struct vm_struct *area)
 	 * Find the start and end range of the direct mappings to make sure that
 	 * the vm_unmap_aliases() flush includes the direct map.
 	 */
-	for (i = 0; i < area->nr_pages; i += 1U << page_order) {
+	for (i = 0; i < ALIGN_DOWN(area->nr_pages, 1U << page_order); i += (1U << page_order)) {
 		unsigned long addr = (unsigned long)page_address(area->pages[i]);
 
 		if (addr) {
@@ -3339,6 +3341,18 @@ static void vm_reset_perms(struct vm_struct *area)
 			flush_dmap = 1;
 		}
 	}
+	for (; i < area->nr_pages; ++i) {
+		unsigned long addr = (unsigned long)page_address(area->pages[i]);
+
+		if (addr) {
+			unsigned long page_size;
+
+			page_size = PAGE_SIZE;
+			start = min(addr, start);
+			end = max(addr + page_size, end);
+			flush_dmap = 1;
+		}
+	}
 
 	/*
 	 * Set direct map to something invalid so that it won't be cached if
@@ -3602,6 +3616,7 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
 	 * more permissive.
 	 */
 	if (!order) {
+page_map:
 		while (nr_allocated < nr_pages) {
 			unsigned int nr, nr_pages_request;
 
@@ -3633,13 +3648,18 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
 			 * If zero or pages were obtained partly,
 			 * fallback to a single page allocator.
 			 */
-			if (nr != nr_pages_request)
+			if (nr != nr_pages_request) {
+				order = 0;
 				break;
+			}
 		}
 	}
 
 	/* High-order pages or fallback path if "bulk" fails. */
 	while (nr_allocated < nr_pages) {
+		if (nr_pages - nr_allocated < (1UL << order))
+			goto page_map;
+
 		if (!(gfp & __GFP_NOFAIL) && fatal_signal_pending(current))
 			break;
 
@@ -5024,7 +5044,9 @@ static void show_numa_info(struct seq_file *m, struct vm_struct *v,
 
 	memset(counters, 0, nr_node_ids * sizeof(unsigned int));
 
-	for (nr = 0; nr < v->nr_pages; nr += step)
+	for (nr = 0; nr < ALIGN_DOWN(v->nr_pages, step); nr += step)
+		counters[page_to_nid(v->pages[nr])] += step;
+	for (; nr < v->nr_pages; ++nr)
 		counters[page_to_nid(v->pages[nr])] += step;
 	for_each_node_state(nr, N_HIGH_MEMORY)
 		if (counters[nr])
-- 
2.30.2


