Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A9CCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APJ3/i0Qwt68My5sl3F+6dc+O4UltIlrkWW1kSuJpio=; b=jAvfd9nR5e0UBHy1jmJL3el2Q3
	B/gA2hvIrQ9McZN6SOqB37eas/lRvCgvIkIpv1L1uqBz4ru9lvXFQcH7sZGPIqBOjiQusNPL1Mafg
	gTShxSwJz1DgnOvFp5FpDr2yN8KZMOQww/iNn4Xs9hSNUhls2Qf3gSaI5vLg91x4Tk8AizAq9FcUG
	zyXj9rRpzCMp+jPMw2YW3lQ6TGo6BdoH9wHWUgcWqMqDF7sdQdYZWcjVgVJIdN9UPx+dEN6SV0rK0
	ca/Ydsuo2CJtW66xQRy8yWggfokHgyVR3CyRKVcGLZ3pYjxRhU68+cwwtgK+MtLxmMzdijJoLV5dW
	hyaovWmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8iF-00000008e3f-3PwX;
	Wed, 12 Nov 2025 11:08:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8iD-00000008e27-2JtX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:08:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F0BE1515;
	Wed, 12 Nov 2025 03:08:21 -0800 (PST)
Received: from MacBook-Pro.blr.arm.com.com (unknown [10.164.18.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0DF393F66E;
	Wed, 12 Nov 2025 03:08:23 -0800 (PST)
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
Subject: [RFC PATCH 2/2] arm64/mm: Enable vmalloc-huge by default
Date: Wed, 12 Nov 2025 16:38:07 +0530
Message-Id: <20251112110807.69958-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20251112110807.69958-1-dev.jain@arm.com>
References: <20251112110807.69958-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_030829_673962_AD45EF93 
X-CRM114-Status: GOOD (  18.94  )
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

For BBML2-noabort arm64 systems, enable vmalloc cont mappings and PMD
mappings by default.

There is benefit to be gained in any code path which maps >= 16 pages using
vmalloc, since any usage of that mapping will now come with reduced TLB
pressure.

Currently, I am not being able to produce a reliable statistically
significant improvement for the benchmarks which we have. I am optimistic
that xfs benchmarks should give some benefit.

Upon running test_vmalloc.sh, this series produces an optimization and
some regressions. I conclude that we should ignore the results of this
testsuite. I explain the regression in the long_busy_list_alloc_test below:
upon running ./test_vmalloc.sh run_test_mask=4 nr_threads=1, a regression
of approx 17% is observed (which increases to 31% if we do *not* apply the
previous patch ("mm/vmalloc: Do not align size to huge size")).

The long_busy_list_alloc_test first maps a lot of single pages to fragment
the vmalloc space. Then, it does the following in a loop: map 100 pages,
map a single page, then vfree both of them. My investigation reveals that
the majority of time is *not* spent in finding a free space in the vmalloc
region (which is exactly the time which the setup of this particular
test wants to increase), but in the interaction with the physical memory
allocator.

It turns out that mapping 100 pages in a contiguous way is *faster* than
bulk mapping 100 single pages. The regression is actually carried by
vfree(). When we contpte map 100 pages, we get 6 * 16 = 96 pages from
the free lists of the buddy allocator, and not the pcp lists. Then, vmalloc
subsystem splits this page into individual pages because drivers can
operate on individual pages, messing up the refcounts. As a result, vfree
frees these pages as single 4k pages, freeing them into the pcp lists.
Thus, now we have got a behaviour of taking from the freelists of the
buddy, and freeing into the pcp lists, which forces pcp draining into the
freelists. By playing with the following code in mm/page_alloc.c:

	high = nr_pcp_high(pcp, zone, batch, free_high);
	if (pcp->count < high)
		return;
The time taken by the test is highly sensitive to the value returned by
nr_pcp_high (although, increasing the value of high does not reduce the
regression).

Summarizing, the regression is due to messing up the state of the buddy
system by rapidly stealing from the freelists and not giving back to them.

If we insert an msleep(1) just before we vfree() both the regions, the
regression reduces. This proves that the regression is due to the unnatural
behaviour of the test - it allocates memory, does absolutely nothing with
that memory, and releases it. No workload is expected to map memory without
actually utilizing it for some time. The time between vmalloc() and vfree()
will give time for the buddy to stabilize, and the regression is
eliminated.

The optimization is observed in fix_size_alloc_test with nr_pages = 512,
because both vmalloc() and vfree() will now operate to and from the pcp.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/include/asm/vmalloc.h | 6 ++++++
 arch/arm64/mm/pageattr.c         | 4 +---
 include/linux/vmalloc.h          | 7 +++++++
 mm/vmalloc.c                     | 6 +++++-
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 4ec1acd3c1b3..c72ae9bd7360 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -6,6 +6,12 @@
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
 
+#define arch_wants_vmalloc_huge_always arch_wants_vmalloc_huge_always
+static inline bool arch_wants_vmalloc_huge_always(void)
+{
+	return system_supports_bbml2_noabort();
+}
+
 #define arch_vmap_pud_supported arch_vmap_pud_supported
 static inline bool arch_vmap_pud_supported(pgprot_t prot)
 {
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 5135f2d66958..b800e3a3fe85 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -163,8 +163,6 @@ static int change_memory_common(unsigned long addr, int numpages,
 	 * we are operating on does not result in such splitting.
 	 *
 	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
-	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
-	 * mappings are updated and splitting is never needed.
 	 *
 	 * So check whether the [addr, addr + size) interval is entirely
 	 * covered by precisely one VM area that has the VM_ALLOC flag set.
@@ -172,7 +170,7 @@ static int change_memory_common(unsigned long addr, int numpages,
 	area = find_vm_area((void *)addr);
 	if (!area ||
 	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
-	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
+	    ((area->flags & VM_ALLOC) != VM_ALLOC))
 		return -EINVAL;
 
 	if (!numpages)
diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index eb54b7b3202f..b0f04f7e8cfa 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -84,6 +84,13 @@ struct vmap_area {
 	unsigned long flags; /* mark type of vm_map_ram area */
 };
 
+#ifndef arch_wants_vmalloc_huge_always
+static inline bool arch_wants_vmalloc_huge_always(void)
+{
+	return false;
+}
+#endif
+
 /* archs that select HAVE_ARCH_HUGE_VMAP should override one or more of these */
 #ifndef arch_vmap_p4d_supported
 static inline bool arch_vmap_p4d_supported(pgprot_t prot)
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index ddd9294a4634..99da3d256360 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3857,7 +3857,8 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
 		return NULL;
 	}
 
-	if (vmap_allow_huge && (vm_flags & VM_ALLOW_HUGE_VMAP)) {
+	if (vmap_allow_huge && ((arch_wants_vmalloc_huge_always()) ||
+	    (vm_flags & VM_ALLOW_HUGE_VMAP))) {
 		/*
 		 * Try huge pages. Only try for PAGE_KERNEL allocations,
 		 * others like modules don't yet expect huge pages in
@@ -3871,6 +3872,9 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
 			shift = arch_vmap_pte_supported_shift(size);
 
 		align = max(original_align, 1UL << shift);
+
+		/* If arch wants huge by default, set flag unconditionally */
+		vm_flags |= VM_ALLOW_HUGE_VMAP;
 	}
 
 again:
-- 
2.30.2


