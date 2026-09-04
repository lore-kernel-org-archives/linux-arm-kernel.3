Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68060C79F83
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deNgVt7ciPtB7l7NDMR4M7LD1BBWC7NklwngiaCMYjA=; b=NgUtRdum2lXW1FORPfzpEa4NxA
	fuL+xDCNlYdm0JmIyAkZpllcEKkRHbV2OV7rdjglEhRlxKIUv9fEMVWzfdiyjv/dUQFao9PpdQ7yf
	0I+UWPU3DsvI29Rlcf7ip8dPW2ifsI69KikAXpzK9G+hXeZ7/WGizTUsSXkmvEzvSo+9uII35k8CX
	3w+8cgnLW+tiSEbkvGKRU69LEVJA3z6vJNccHmq+nULlRUYU9NF8NrHYQsJKEwVd9l/mDoTyp+2FD
	FKpufxfmA1wCg/zi7ZErr1iposRjeCLDFSFIX0S0ix+Wnekhpwzw6eAiIy73FfvGk0SBNATMCVO4J
	5NOe58DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGT-00000001gTk-39r2;
	Fri, 04 Sep 2026 10:35:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGR-00000001gSx-43Fj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:35:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 69CBB6020C;
	Fri,  4 Sep 2026 10:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0CF1F00A3E;
	Fri,  4 Sep 2026 10:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788518119;
	bh=deNgVt7ciPtB7l7NDMR4M7LD1BBWC7NklwngiaCMYjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JnK/F57NCSLAFS4tb4UmbDOaxP5eAXzT7vbIkby3GOToo7rw1Fn6Cn1dC5TaQvRWu
	 4wk1swPdEGpIW5oASq9Ozwk8z/SBseM8vKtbh+2EoZE4iFPQm2t5CrduR46udup1Za
	 5QJ4YShYCmjlBBLyWZaVjYVO8jcHaG3oEj1tJeZ6dAI5YPzzQJndOcR9new3Hp+06x
	 2jghwWdX3KEM8md2wFtFCM+H5mamEpi7CimSx7RIpceaLRibZ4Wz+naChC2CcdnHzy
	 uysWHmj7iukrGU09X9bZa3cqYd6MGEX0WxSTrabPiG/iAdc08OXBfZ0+67zGmSoUsP
	 Kyr1LBHjkMV+Q==
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
Subject: [PATCH v6 3/9] dma-mapping: Pass allocation attrs to contiguous allocation helpers
Date: Fri,  4 Sep 2026 16:04:46 +0530
Message-ID: <20260904103452.1197239-4-aneesh.kumar@kernel.org>
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

Prepare for handling CoCo shared allocation requirements in the common
contiguous allocation path by passing DMA allocation attributes down to the
helpers that may allocate from CMA.

The next patch uses this to apply shared-granule alignment only to
allocations that are actually creating CoCo shared backing pages.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/iommu/dma-iommu.c   |  2 +-
 include/linux/dma-map-ops.h |  5 +++--
 kernel/dma/contiguous.c     |  4 +++-
 kernel/dma/direct.c         | 11 ++++++-----
 kernel/dma/ops_helpers.c    |  3 ++-
 5 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 58c624513cd4..32ed56aff12a 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1627,7 +1627,7 @@ static void *iommu_dma_alloc_pages(struct device *dev, size_t size,
 	struct page *page = NULL;
 	void *cpu_addr;
 
-	page = dma_alloc_contiguous(dev, alloc_size, gfp);
+	page = dma_alloc_contiguous(dev, alloc_size, gfp, attrs);
 	if (!page)
 		page = alloc_pages_node(node, gfp, get_order(alloc_size));
 	if (!page)
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 8fae2b7deb20..1849f352fb88 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -102,7 +102,8 @@ struct page *dma_alloc_from_contiguous(struct device *dev, size_t count,
 				       unsigned int order, bool no_warn);
 bool dma_release_from_contiguous(struct device *dev, struct page *pages,
 				 int count);
-struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp);
+struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp,
+		unsigned long attrs);
 void dma_free_contiguous(struct device *dev, struct page *page, size_t size);
 
 void dma_contiguous_early_fixup(phys_addr_t base, unsigned long size);
@@ -136,7 +137,7 @@ static inline bool dma_release_from_contiguous(struct device *dev,
 }
 /* Use fallback alloc() and free() when CONFIG_DMA_CMA=n */
 static inline struct page *dma_alloc_contiguous(struct device *dev, size_t size,
-		gfp_t gfp)
+		gfp_t gfp, unsigned long attrs)
 {
 	return NULL;
 }
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 66093460584e..18cd423fbc67 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -402,6 +402,7 @@ static struct page *cma_alloc_aligned(struct cma *cma, size_t size, gfp_t gfp)
  * @dev:   Pointer to device for which the allocation is performed.
  * @size:  Requested allocation size.
  * @gfp:   Allocation flags.
+ * @attrs: DMA attributes.
  *
  * tries to use device specific contiguous memory area if available, or it
  * tries to use per-numa cma, if the allocation fails, it will fallback to
@@ -412,7 +413,8 @@ static struct page *cma_alloc_aligned(struct cma *cma, size_t size, gfp_t gfp)
  * there is no need to waste CMA pages for that kind; it also helps reduce
  * fragmentations.
  */
-struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp)
+struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp,
+		unsigned long attrs)
 {
 #ifdef CONFIG_DMA_NUMA_CMA
 	int nid = dev_to_node(dev);
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index da665ca22d5c..fe02e8a3c0bb 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -115,7 +115,7 @@ static struct page *dma_direct_alloc_swiotlb(struct device *dev, size_t size,
 }
 
 static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
-		gfp_t gfp, bool allow_highmem)
+		gfp_t gfp, bool allow_highmem, unsigned long attrs)
 {
 	int node = dev_to_node(dev);
 	struct page *page;
@@ -124,7 +124,7 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 	WARN_ON_ONCE(!PAGE_ALIGNED(size));
 
 	gfp |= dma_direct_optimal_gfp_mask(dev, &phys_limit);
-	page = dma_alloc_contiguous(dev, size, gfp);
+	page = dma_alloc_contiguous(dev, size, gfp, attrs);
 	if (page) {
 		if (dma_coherent_ok(dev, page_to_phys(page), size) &&
 		    (allow_highmem || !PageHighMem(page)))
@@ -184,7 +184,7 @@ static void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
 {
 	struct page *page;
 
-	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO, true);
+	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO, true, 0);
 	if (!page)
 		return NULL;
 
@@ -286,7 +286,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	}
 
 	/* we always manually zero the memory once we are done */
-	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO, allow_highmem);
+	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO,
+					allow_highmem, attrs);
 	if (!page)
 		return NULL;
 
@@ -452,7 +453,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 		goto setup_page;
 	}
 
-	page = __dma_direct_alloc_pages(dev, size, gfp, false);
+	page = __dma_direct_alloc_pages(dev, size, gfp, false, attrs);
 	if (!page)
 		return NULL;
 
diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
index 6b5f9208d31c..43e5f8008a9c 100644
--- a/kernel/dma/ops_helpers.c
+++ b/kernel/dma/ops_helpers.c
@@ -66,7 +66,8 @@ struct page *dma_common_alloc_pages(struct device *dev, size_t size,
 	struct page *page;
 	phys_addr_t phys;
 
-	page = dma_alloc_contiguous(dev, size, gfp);
+	/* __DMA_ATTR_ALLOC_CC_SHARED is not yet supported here, attrs = 0 */
+	page = dma_alloc_contiguous(dev, size, gfp, 0);
 	if (!page)
 		page = alloc_pages_node(dev_to_node(dev), gfp, get_order(size));
 	if (!page)
-- 
2.43.0


