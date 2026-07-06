Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37533C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+bPfSuQARImroV5BkbmoGryt8x5TsbegRK/YB3WTqw=; b=sF7slwX5iF87LErkrD6zFGOSqF
	VH8OWiuw/CscEQzL03hDy0lXsAgMgdWrkWwcByfPKXDtP7FghpfFT9h+9XaALuIe3bF0Z3rh5SlAQ
	Hj7WndVuRpooryDPW/KOWI+vVCfVppk1CXhFrpNi/3FXeZSh4nZqbfEbzOGf2qt/sh5ev8iZrR4hj
	/ieTKZTtKghVBQ0tDG4kagKyOy0lVdSqDonw+Enuy1UIfF+OFqiOdRk9IIP4JjFoTELIni6g/FfoD
	wfxuGcPpXshlHNSE/D2Q/pj9n6oAP5sGk+5KJ3+32/NUtHBndCpmn7RxIVH4KR5vFdtF9WA4eVHdX
	C6lUYJtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcSF-0000000BZEf-03De;
	Mon, 06 Jul 2026 06:05:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcSC-0000000BZDs-49bZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:05:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FEB760018;
	Mon,  6 Jul 2026 06:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8507A1F000E9;
	Mon,  6 Jul 2026 06:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783317916;
	bh=z+bPfSuQARImroV5BkbmoGryt8x5TsbegRK/YB3WTqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AGq5LAK2N1saAxqSz5Vt6bmFurZ7JFxzV/U+nWXFTylLAZiE1DEl4C5XD2g20oK+Y
	 2fsdg49V3jrpAIg2uqIzleiq2C0QdbPUTERFuk3kOGLxJ7XVYXV4WsWpc55feBywC9
	 iSSs2HM6CjCTu+aS+sH02WI7p/465mZKkhW3ImZSp2CHz1TW0ROAAYyWoOEKZh+u0o
	 EM5EgjeLAcByJT3tWVvTDwMgo5atfQ79cmG5huP7rMPaEOkTDe8ro2PZDGwdIl94rX
	 K4aiQDkyVCDr0/9UtK+9MbEPTUfzkqwkDjUvDDkmL3qSSwI1y8oOEK2d/9NcQMLcq4
	 CgpWH8GynLScw==
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
Subject: [PATCH v5 04/10] dma-direct: Align CoCo shared DMA allocations to the shared granule size
Date: Mon,  6 Jul 2026 11:34:26 +0530
Message-ID: <20260706060432.1375570-5-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706060432.1375570-1-aneesh.kumar@kernel.org>
References: <20260706060432.1375570-1-aneesh.kumar@kernel.org>
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
index 6c8a61ab5456..3d0eac2e2a20 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -45,6 +45,7 @@
 #include <linux/dma-map-ops.h>
 #include <linux/cma.h>
 #include <linux/nospec.h>
+#include <linux/mem_encrypt.h>
 
 #ifdef CONFIG_CMA_SIZE_MBYTES
 #define CMA_SIZE_MBYTES CONFIG_CMA_SIZE_MBYTES
@@ -417,6 +418,14 @@ struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp,
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
index 80f9f7d23ad4..6d0e485fdc34 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -280,6 +280,9 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 		return NULL;
 	}
 
+	if (mark_mem_decrypt)
+		size = mem_cc_align_to_shared_granule(size);
+
 	/* we always manually zero the memory once we are done */
 	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO,
 					allow_highmem, attrs);
@@ -402,6 +405,9 @@ void dma_direct_free(struct device *dev, size_t size,
 		/* Swiotlb doesn't need a page attribute update on free */
 		mark_mem_encrypted = false;
 
+	if (mark_mem_encrypted && force_dma_unencrypted(dev))
+		size = mem_cc_align_to_shared_granule(size);
+
 	if (is_vmalloc_addr(cpu_addr)) {
 		vunmap(cpu_addr);
 	} else {
@@ -448,6 +454,9 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 		goto setup_page;
 	}
 
+	if (attrs & __DMA_ATTR_ALLOC_CC_SHARED)
+		size = mem_cc_align_to_shared_granule(size);
+
 	page = __dma_direct_alloc_pages(dev, size, gfp, false, attrs);
 	if (!page)
 		return NULL;
@@ -488,8 +497,11 @@ void dma_direct_free_pages(struct device *dev, size_t size,
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
index 5115a3e8c722..d02b630e80fc 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -90,7 +90,9 @@ static int atomic_pool_expand(struct dma_gen_pool *dma_pool, size_t pool_size,
 	bool leak_pages = false;
 	void *addr;
 	int ret = -ENOMEM;
+	unsigned int min_encrypt_order = get_order(mem_cc_shared_granule_size());
 
+	pool_size = mem_cc_align_to_shared_granule(pool_size);
 	/* Cannot allocate larger than MAX_PAGE_ORDER */
 	order = min(get_order(pool_size), MAX_PAGE_ORDER);
 
@@ -101,7 +103,7 @@ static int atomic_pool_expand(struct dma_gen_pool *dma_pool, size_t pool_size,
 							 order, false);
 		if (!page)
 			page = alloc_pages(gfp | __GFP_NOWARN, order);
-	} while (!page && order-- > 0);
+	} while (!page && order-- > min_encrypt_order);
 	if (!page)
 		goto out;
 
-- 
2.43.0


