Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A73CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CwjL7bkH4unTtwPCu3wLjbd3w9oCpsBG3X+F5Tx8tHI=; b=tzoLHErquGetUhbWo+xKbJBgDG
	BzrPSNCrlPCanME2e28OGx9aJV7epscsQq8A5msobpFTnZRZUUDrUTxHFah/zSwa7ksLGYe5H9Awl
	dEw/gJDTZP7T7A5QAcnKqT7WPNm4QlaEJfSoIsi8VE9DqXfB6DJzPMc8ZpV5wtdeScolY0ke8jebo
	uh+/VpCYwC/N1JW/ORx5NXW6noCrzYemO7YG95JNN5BHgTLXW/Y+ShFK4n04l2QWe/qW0KTnLFrIq
	vW5GO3l0nq6QZlthSg24Ro0fP3vXcdBJQbPsQVAaBhibvveIXe9Uv4sVjoO1P4JYJmPCUMr/rTfu4
	lqvOteEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFL0-000000003XT-2LmC;
	Thu, 18 Sep 2025 14:10:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFKr-000000003Re-3YP1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 14:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21F6540826;
	Thu, 18 Sep 2025 14:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767C8C4CEE7;
	Thu, 18 Sep 2025 14:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758204609;
	bh=7ctlDOwNiFgZVAZcPGLZSJOnlazVmdQdCYwzHXR5exA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oyqwu64BZu6RjG9CnpKCr3myw4HDldvhOSfCWTkgNiDvrlE8uIAhIfcBCeVXmGVZ1
	 7umCbbQ1rkX/ipSoOD/4RSe4fc3dPqQlnTQQPXW5mgROoLKyXZGyhuVeRO8vVC4Bm4
	 Ya5UjyQSZykWjAs/mbE6JiW1lGgrnuInyF64+7D0FD+3db1GQBVAoxo7SV2P7U2vO/
	 XrBA0HfGqAPvG/9WZFcnNE3y7efxI0z4oHvfJRZDszI58XGdtYFbilpCXKZX1Q7ai2
	 +C+GLYL87J6QpD7PHzQDnkJX7tmCDP6r6jfMMWEd+mSevtuOibCVA8pXdo+pUAobaV
	 SyMXCEQEsZLOA==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	iommu@lists.linux.dev,
	Juergen Gross <jgross@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 3/6] ARM: dma-mapping: Reduce struct page exposure in arch_sync_dma*()
Date: Thu, 18 Sep 2025 17:09:26 +0300
Message-ID: <2f20069c2b616808c034ba4e75905820b94e0e22.1758203802.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758203802.git.leon@kernel.org>
References: <cover.1758203802.git.leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_071009_958551_197E08AE 
X-CRM114-Status: GOOD (  18.11  )
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

From: Leon Romanovsky <leonro@nvidia.com>

As a preparation to changing from .map_page to use .map_phys DMA
callbacks, convert arch_sync_dma*() functions to use physical addresses
instead of struct page.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/arm/mm/dma-mapping.c | 82 +++++++++++++++------------------------
 1 file changed, 31 insertions(+), 51 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 88c2d68a69c9e..449fe6bf525e5 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -624,16 +624,14 @@ static void __arm_dma_free(struct device *dev, size_t size, void *cpu_addr,
 	kfree(buf);
 }
 
-static void dma_cache_maint_page(struct page *page, unsigned long offset,
-	size_t size, enum dma_data_direction dir,
+static void dma_cache_maint_page(phys_addr_t phys, size_t size,
+	enum dma_data_direction dir,
 	void (*op)(const void *, size_t, int))
 {
-	unsigned long pfn;
+	unsigned long offset = offset_in_page(phys);
+	unsigned long pfn = __phys_to_pfn(phys);
 	size_t left = size;
 
-	pfn = page_to_pfn(page) + offset / PAGE_SIZE;
-	offset %= PAGE_SIZE;
-
 	/*
 	 * A single sg entry may refer to multiple physically contiguous
 	 * pages.  But we still need to process highmem pages individually.
@@ -644,17 +642,18 @@ static void dma_cache_maint_page(struct page *page, unsigned long offset,
 		size_t len = left;
 		void *vaddr;
 
-		page = pfn_to_page(pfn);
-
-		if (PageHighMem(page)) {
+		phys = __pfn_to_phys(pfn);
+		if (PhysHighMem(phys)) {
 			if (len + offset > PAGE_SIZE)
 				len = PAGE_SIZE - offset;
 
 			if (cache_is_vipt_nonaliasing()) {
-				vaddr = kmap_atomic(page);
+				vaddr = kmap_atomic_pfn(pfn);
 				op(vaddr + offset, len, dir);
 				kunmap_atomic(vaddr);
 			} else {
+				struct page *page = phys_to_page(phys);
+
 				vaddr = kmap_high_get(page);
 				if (vaddr) {
 					op(vaddr + offset, len, dir);
@@ -662,7 +661,8 @@ static void dma_cache_maint_page(struct page *page, unsigned long offset,
 				}
 			}
 		} else {
-			vaddr = page_address(page) + offset;
+			phys += offset;
+			vaddr = phys_to_virt(phys);
 			op(vaddr, len, dir);
 		}
 		offset = 0;
@@ -676,14 +676,11 @@ static void dma_cache_maint_page(struct page *page, unsigned long offset,
  * Note: Drivers should NOT use this function directly.
  * Use the driver DMA support - see dma-mapping.h (dma_sync_*)
  */
-static void __dma_page_cpu_to_dev(struct page *page, unsigned long off,
-	size_t size, enum dma_data_direction dir)
+void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
+			      enum dma_data_direction dir)
 {
-	phys_addr_t paddr;
-
-	dma_cache_maint_page(page, off, size, dir, dmac_map_area);
+	dma_cache_maint_page(paddr, size, dir, dmac_map_area);
 
-	paddr = page_to_phys(page) + off;
 	if (dir == DMA_FROM_DEVICE) {
 		outer_inv_range(paddr, paddr + size);
 	} else {
@@ -692,17 +689,15 @@ static void __dma_page_cpu_to_dev(struct page *page, unsigned long off,
 	/* FIXME: non-speculating: flush on bidirectional mappings? */
 }
 
-static void __dma_page_dev_to_cpu(struct page *page, unsigned long off,
-	size_t size, enum dma_data_direction dir)
+void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
+			   enum dma_data_direction dir)
 {
-	phys_addr_t paddr = page_to_phys(page) + off;
-
 	/* FIXME: non-speculating: not required */
 	/* in any case, don't bother invalidating if DMA to device */
 	if (dir != DMA_TO_DEVICE) {
 		outer_inv_range(paddr, paddr + size);
 
-		dma_cache_maint_page(page, off, size, dir, dmac_unmap_area);
+		dma_cache_maint_page(paddr, size, dir, dmac_unmap_area);
 	}
 
 	/*
@@ -1205,7 +1200,7 @@ static int __map_sg_chunk(struct device *dev, struct scatterlist *sg,
 		unsigned int len = PAGE_ALIGN(s->offset + s->length);
 
 		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-			__dma_page_cpu_to_dev(sg_page(s), s->offset, s->length, dir);
+			arch_sync_dma_for_device(sg_phys(s), s->length, dir);
 
 		prot = __dma_info_to_prot(dir, attrs);
 
@@ -1307,8 +1302,7 @@ static void arm_iommu_unmap_sg(struct device *dev,
 			__iommu_remove_mapping(dev, sg_dma_address(s),
 					       sg_dma_len(s));
 		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-			__dma_page_dev_to_cpu(sg_page(s), s->offset,
-					      s->length, dir);
+			arch_sync_dma_for_cpu(sg_phys(s), s->length, dir);
 	}
 }
 
@@ -1330,7 +1324,7 @@ static void arm_iommu_sync_sg_for_cpu(struct device *dev,
 		return;
 
 	for_each_sg(sg, s, nents, i)
-		__dma_page_dev_to_cpu(sg_page(s), s->offset, s->length, dir);
+		arch_sync_dma_for_cpu(sg_phys(s), s->length, dir);
 
 }
 
@@ -1352,7 +1346,7 @@ static void arm_iommu_sync_sg_for_device(struct device *dev,
 		return;
 
 	for_each_sg(sg, s, nents, i)
-		__dma_page_cpu_to_dev(sg_page(s), s->offset, s->length, dir);
+		arch_sync_dma_for_device(sg_phys(s), s->length, dir);
 }
 
 /**
@@ -1374,7 +1368,7 @@ static dma_addr_t arm_iommu_map_page(struct device *dev, struct page *page,
 	int ret, prot, len = PAGE_ALIGN(size + offset);
 
 	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		__dma_page_cpu_to_dev(page, offset, size, dir);
+		arch_sync_dma_for_device(page_to_phys(page), offset, size, dir);
 
 	dma_addr = __alloc_iova(mapping, len);
 	if (dma_addr == DMA_MAPPING_ERROR)
@@ -1407,7 +1401,6 @@ static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
 	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page;
 	int offset = handle & ~PAGE_MASK;
 	int len = PAGE_ALIGN(size + offset);
 
@@ -1415,8 +1408,9 @@ static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
 		return;
 
 	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-		__dma_page_dev_to_cpu(page, offset, size, dir);
+		phys_addr_t phys = iommu_iova_to_phys(mapping->domain, iova);
+
+		arch_sync_dma_for_cpu(phys + offset, size, dir);
 	}
 
 	iommu_unmap(mapping->domain, iova, len);
@@ -1485,14 +1479,14 @@ static void arm_iommu_sync_single_for_cpu(struct device *dev,
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
 	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page;
 	unsigned int offset = handle & ~PAGE_MASK;
+	phys_addr_t phys;
 
 	if (dev->dma_coherent || !iova)
 		return;
 
-	page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-	__dma_page_dev_to_cpu(page, offset, size, dir);
+	phys = iommu_iova_to_phys(mapping->domain, iova);
+	arch_sync_dma_for_cpu(phys + offset, size, dir);
 }
 
 static void arm_iommu_sync_single_for_device(struct device *dev,
@@ -1500,14 +1494,14 @@ static void arm_iommu_sync_single_for_device(struct device *dev,
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
 	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page;
 	unsigned int offset = handle & ~PAGE_MASK;
+	phys_addr_t phys;
 
 	if (dev->dma_coherent || !iova)
 		return;
 
-	page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-	__dma_page_cpu_to_dev(page, offset, size, dir);
+	phys = iommu_iova_to_phys(mapping->domain, iova);
+	arch_sync_dma_for_device(phys + offset, size, dir);
 }
 
 static const struct dma_map_ops iommu_ops = {
@@ -1794,20 +1788,6 @@ void arch_teardown_dma_ops(struct device *dev)
 	set_dma_ops(dev, NULL);
 }
 
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
-{
-	__dma_page_cpu_to_dev(phys_to_page(paddr), paddr & (PAGE_SIZE - 1),
-			      size, dir);
-}
-
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
-{
-	__dma_page_dev_to_cpu(phys_to_page(paddr), paddr & (PAGE_SIZE - 1),
-			      size, dir);
-}
-
 void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		gfp_t gfp, unsigned long attrs)
 {
-- 
2.51.0


