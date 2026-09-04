Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D3DC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EuedylNKiE7ESkNTtxpDw1qbH4jeqTmoc4JjBxjnyw=; b=3gp4u7RMD+ASYiH01IPc2JuEMX
	CC9xPqFST4NIXpD6ukWuCwxWTyS8d/YoNjxxUtNtgOQjaFu5LQorqcKjrySzAQ6okD4zq0t2bYJJ1
	TSHkJlJVZnG/cYsI1yEafBkVOR7IbSX9KSlgg65UxIQGmAKwfXRPKoPY30lV25VTBgRYMcA18RBTo
	HzTV9989IGaQRWyXM0NSbGMfgkxq+FEfCQLVq2D1587YyjV8IlZByU7ppnI2HCFQ5aT0slZKhFG75
	+IclzKlXaJnTvk9764r8v/CPJZbXtsC2/QyaEZOY7VYM8byKT/vevaoEdpHML2dCFa/QVoPzrokQo
	h271qaRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGX-00000001gWN-3a5Y;
	Fri, 04 Sep 2026 10:35:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGX-00000001gVz-0ltp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:35:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB3FB43AC5;
	Fri,  4 Sep 2026 10:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95B51F00A3D;
	Fri,  4 Sep 2026 10:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788518124;
	bh=0EuedylNKiE7ESkNTtxpDw1qbH4jeqTmoc4JjBxjnyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DzJ5y2s2Lk3yhHg7G8gVHWh8a7mUbxegmFMHbirWwQe6NOpltJ/f+yOKVT2vO+Ppe
	 Arp0qFl/MPEotc+9IVq2D1MnwgsEMwE4BsV44VjXvZyhVnYtyMt+xWMo5/vreWYLWe
	 mmp8gQEaI84XpKo68NpNj4B2SE7G/B8G3JTKlpVA1IBLmD2OYrL9zJ1z1f9OGVO369
	 QLgB2R+oL94voNlgdwKqvB7kFG45UOkJT8dGVYJMS9SiDs/E5oS6RKiyHjxFv8hij+
	 jUvTcZbxy9A7CFnX2wAxi/BgLlA3m/BuIwafoPnOFzeGG+E/qIIbq1VDrTbAba/U/N
	 /hJr8CbHJzQUg==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v6 4/9] dma-direct: Align CoCo shared DMA allocations to the shared granule size
Date: Fri,  4 Sep 2026 16:04:47 +0530
Message-ID: <20260904103452.1197239-5-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
References: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

DMA allocations that create shared backing pages for confidential-computing
guests are converted between private and shared memory before being used
for DMA. On some architecture, the conversion granule may be larger than
PAGE_SIZE, so converting only the requested size can leave the rest of the
host-managed granule private.

Use the internal __DMA_ATTR_ALLOC_CC_SHARED allocation attribute to
identify those allocations in the DMA allocation paths. Round the allocated
and converted size up to mem_cc_shared_granule_size(), and use the same
aligned size when restoring encryption on free.

Also reject CMA allocations for CoCo shared backing pages when CMA cannot
provide alignment at the required shared granule size, and keep atomic DMA
pool expansion from falling below the order needed for shared-buffer
conversions.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 kernel/dma/contiguous.c |  9 +++++++++
 kernel/dma/direct.c     | 16 ++++++++++++++--
 kernel/dma/pool.c       |  4 +++-
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 18cd423fbc67..6bdd4f264733 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -45,6 +45,7 @@
 #include <linux/dma-map-ops.h>
 #include <linux/cma.h>
 #include <linux/nospec.h>
+#include <linux/mem_encrypt.h>
 
 #ifdef CONFIG_CMA_SIZE_MBYTES
 #define CMA_SIZE_MBYTES CONFIG_CMA_SIZE_MBYTES
@@ -419,6 +420,14 @@ struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp,
 #ifdef CONFIG_DMA_NUMA_CMA
 	int nid = dev_to_node(dev);
 #endif
+	/*
+	 * CoCo shared allocations require CMA alignment large enough for the
+	 * architecture's shared-buffer granule.
+	 */
+	if (attrs & __DMA_ATTR_ALLOC_CC_SHARED) {
+		if (get_order(mem_cc_shared_granule_size()) > CONFIG_CMA_ALIGNMENT)
+			return NULL;
+	}
 
 	/* CMA can be used only in the context which permits sleeping */
 	if (!gfpflags_allow_blocking(gfp))
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index fe02e8a3c0bb..82d3ce39db0a 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -285,6 +285,9 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 		return NULL;
 	}
 
+	if (mark_mem_decrypt)
+		size = mem_cc_align_to_shared_granule(size);
+
 	/* we always manually zero the memory once we are done */
 	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO,
 					allow_highmem, attrs);
@@ -407,6 +410,9 @@ void dma_direct_free(struct device *dev, size_t size,
 		/* Swiotlb doesn't need a page attribute update on free */
 		mark_mem_encrypted = false;
 
+	if (mark_mem_encrypted && force_dma_unencrypted(dev))
+		size = mem_cc_align_to_shared_granule(size);
+
 	if (is_vmalloc_addr(cpu_addr)) {
 		vunmap(cpu_addr);
 	} else {
@@ -453,6 +459,9 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 		goto setup_page;
 	}
 
+	if (attrs & __DMA_ATTR_ALLOC_CC_SHARED)
+		size = mem_cc_align_to_shared_granule(size);
+
 	page = __dma_direct_alloc_pages(dev, size, gfp, false, attrs);
 	if (!page)
 		return NULL;
@@ -493,8 +502,11 @@ void dma_direct_free_pages(struct device *dev, size_t size,
 	if (swiotlb_pool)
 		mark_mem_encrypted = false;
 
-	if (mark_mem_encrypted && dma_set_encrypted(dev, vaddr, size))
-		return;
+	if (mark_mem_encrypted) {
+		size = mem_cc_align_to_shared_granule(size);
+		if (dma_set_encrypted(dev, vaddr, size))
+			return;
+	}
 
 	if (swiotlb_pool)
 		swiotlb_free_from_pool(dev, phys, swiotlb_pool);
diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index 00f422a1e896..fc4a834aaa14 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -91,7 +91,9 @@ static int atomic_pool_expand(struct dma_gen_pool *dma_pool, size_t pool_size,
 	void *addr;
 	int ret = -ENOMEM;
 	pgprot_t prot __maybe_unused;
+	unsigned int min_encrypt_order = get_order(mem_cc_shared_granule_size());
 
+	pool_size = mem_cc_align_to_shared_granule(pool_size);
 	/* Cannot allocate larger than MAX_PAGE_ORDER */
 	order = min(get_order(pool_size), MAX_PAGE_ORDER);
 
@@ -102,7 +104,7 @@ static int atomic_pool_expand(struct dma_gen_pool *dma_pool, size_t pool_size,
 							 order, false);
 		if (!page)
 			page = alloc_pages(gfp | __GFP_NOWARN, order);
-	} while (!page && order-- > 0);
+	} while (!page && order-- > min_encrypt_order);
 	if (!page)
 		goto out;
 
-- 
2.43.0


