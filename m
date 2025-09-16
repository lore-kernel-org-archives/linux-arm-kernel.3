Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C8DCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 07:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/Qp0WIyWLGH8fmRGF/SrL4viFzbBeiVghNiUa9qgwA=; b=PDxcDMIJNlc9iftacbDztC+1hG
	FfkDyvEUK2UwLkmL89o5Llc8pM5IrYo7VNhxqj7vMQXHM0LR4hrfFGvDRPOD535yjEqYyb98GdVBP
	UEqenaeC4YaH/Vk+4f4srKn5rV2eI56wLLXte9Zlr46wmlqxaSrZEWnKKteh99XC8tUYKDkrNEQ+3
	sBuiy3/+J9Dz8sjSlvgwKuKl5ujxJV8AiPGgNBczdxodHH1Wfyy/+l8Dk+ev2HIcHLxGZ058Ua1XA
	B+azbQAW/wao7P+ZL/Z6H5RTRBsBpWknNftS/qjrvcFQ/Qn7Dbop4C89AxT4LhYytGo8nT4ALuk8X
	0wEPEV6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQB8-000000071Q0-41Lz;
	Tue, 16 Sep 2025 07:32:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQB6-000000071OL-3Wv9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 07:32:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A05C4054B;
	Tue, 16 Sep 2025 07:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77D5C4CEEB;
	Tue, 16 Sep 2025 07:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758007960;
	bh=kUYFBenADcxWEIkMcS5X6cr9mnZCRnsHRUZt71pILDk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=slkDelnUvu1wE1DNBRGuDkLKyC9fJzIbH4HwqeHaMZMTJUCcJeCozRfAwVYllPllC
	 O0/L5xJpkA9hHF7R4hDCj0RqxzRU+WUdn370WWgCQ8oW4FX01BoLV/d+4Yx3SZeJXS
	 j0oYZYHN7uVp4IYnczIjCbrkvkfUDESxBAII/mkPrGGH5embRxwO77HbHhybkY85qC
	 vOTuB7WnVaX0YTItdigV8lPkUyR807sue67pMqMQWLhCiHorAjt9dp4Jl/Wvtyw25E
	 LsB0zLd59TLPrflh8wHQwIDCHcN1oI8NDFz8MACAwmCznmjo/0tRZi8vjafxf6GKb+
	 LuYTSlH26EbHw==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 3/4] ARM: dma-mapping: Switch to physical address mapping callbacks
Date: Tue, 16 Sep 2025 10:32:06 +0300
Message-ID: <5f96e44b1fb5d92a6a5f25fc9148a733a1a53b9d.1758006942.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758006942.git.leon@kernel.org>
References: <cover.1758006942.git.leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_003240_942414_05C8A47F 
X-CRM114-Status: GOOD (  16.87  )
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

Combine resource and page mappings routines to one function, which
handles both these flows at the same manner. This conversion allows
us to remove .map_resource/.unmap_resource callbacks completely.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/arm/mm/dma-mapping.c | 98 +++++++++------------------------------
 1 file changed, 22 insertions(+), 76 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 88c2d68a69c9e..e0d65414b39e1 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -737,6 +737,9 @@ static int __dma_info_to_prot(enum dma_data_direction dir, unsigned long attrs)
 	if (attrs & DMA_ATTR_PRIVILEGED)
 		prot |= IOMMU_PRIV;
 
+	if (attrs & DMA_ATTR_MMIO)
+		prot |= IOMMU_MMIO;
+
 	switch (dir) {
 	case DMA_BIDIRECTIONAL:
 		return prot | IOMMU_READ | IOMMU_WRITE;
@@ -1356,25 +1359,27 @@ static void arm_iommu_sync_sg_for_device(struct device *dev,
 }
 
 /**
- * arm_iommu_map_page
+ * arm_iommu_map_phys
  * @dev: valid struct device pointer
- * @page: page that buffer resides in
- * @offset: offset into page for start of buffer
+ * @phys: physical address that buffer resides in
  * @size: size of buffer to map
  * @dir: DMA transfer direction
+ * @attrs: DMA mapping attributes
  *
  * IOMMU aware version of arm_dma_map_page()
  */
-static dma_addr_t arm_iommu_map_page(struct device *dev, struct page *page,
-	     unsigned long offset, size_t size, enum dma_data_direction dir,
-	     unsigned long attrs)
+static dma_addr_t arm_iommu_map_phys(struct device *dev, phys_addr_t phys,
+	     size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
+	int len = PAGE_ALIGN(size + offset_in_page(phys));
+	phys_addr_t addr = phys_addr & PAGE_MASK;
 	dma_addr_t dma_addr;
-	int ret, prot, len = PAGE_ALIGN(size + offset);
+	int ret, prot;
 
-	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		__dma_page_cpu_to_dev(page, offset, size, dir);
+	if (!dev->dma_coherent &&
+	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
+		__dma_page_cpu_to_dev(phys_to_page(phys), offset, size, dir);
 
 	dma_addr = __alloc_iova(mapping, len);
 	if (dma_addr == DMA_MAPPING_ERROR)
@@ -1382,8 +1387,7 @@ static dma_addr_t arm_iommu_map_page(struct device *dev, struct page *page,
 
 	prot = __dma_info_to_prot(dir, attrs);
 
-	ret = iommu_map(mapping->domain, dma_addr, page_to_phys(page), len,
-			prot, GFP_KERNEL);
+	ret = iommu_map(mapping->domain, dma_addr, addr, len, prot, GFP_KERNEL);
 	if (ret < 0)
 		goto fail;
 
@@ -1399,10 +1403,11 @@ static dma_addr_t arm_iommu_map_page(struct device *dev, struct page *page,
  * @handle: DMA address of buffer
  * @size: size of buffer (same as passed to dma_map_page)
  * @dir: DMA transfer direction (same as passed to dma_map_page)
+ * @attrs: DMA mapping attributes
  *
- * IOMMU aware version of arm_dma_unmap_page()
+ * IOMMU aware version of arm_dma_unmap_phys()
  */
-static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
+static void arm_iommu_unmap_phys(struct device *dev, dma_addr_t handle,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
@@ -1414,7 +1419,8 @@ static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
 	if (!iova)
 		return;
 
-	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
+	if (!dev->dma_coherent &&
+	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
 		page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
 		__dma_page_dev_to_cpu(page, offset, size, dir);
 	}
@@ -1423,63 +1429,6 @@ static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
 	__free_iova(mapping, iova, len);
 }
 
-/**
- * arm_iommu_map_resource - map a device resource for DMA
- * @dev: valid struct device pointer
- * @phys_addr: physical address of resource
- * @size: size of resource to map
- * @dir: DMA transfer direction
- */
-static dma_addr_t arm_iommu_map_resource(struct device *dev,
-		phys_addr_t phys_addr, size_t size,
-		enum dma_data_direction dir, unsigned long attrs)
-{
-	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-	dma_addr_t dma_addr;
-	int ret, prot;
-	phys_addr_t addr = phys_addr & PAGE_MASK;
-	unsigned int offset = phys_addr & ~PAGE_MASK;
-	size_t len = PAGE_ALIGN(size + offset);
-
-	dma_addr = __alloc_iova(mapping, len);
-	if (dma_addr == DMA_MAPPING_ERROR)
-		return dma_addr;
-
-	prot = __dma_info_to_prot(dir, attrs) | IOMMU_MMIO;
-
-	ret = iommu_map(mapping->domain, dma_addr, addr, len, prot, GFP_KERNEL);
-	if (ret < 0)
-		goto fail;
-
-	return dma_addr + offset;
-fail:
-	__free_iova(mapping, dma_addr, len);
-	return DMA_MAPPING_ERROR;
-}
-
-/**
- * arm_iommu_unmap_resource - unmap a device DMA resource
- * @dev: valid struct device pointer
- * @dma_handle: DMA address to resource
- * @size: size of resource to map
- * @dir: DMA transfer direction
- */
-static void arm_iommu_unmap_resource(struct device *dev, dma_addr_t dma_handle,
-		size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
-{
-	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-	dma_addr_t iova = dma_handle & PAGE_MASK;
-	unsigned int offset = dma_handle & ~PAGE_MASK;
-	size_t len = PAGE_ALIGN(size + offset);
-
-	if (!iova)
-		return;
-
-	iommu_unmap(mapping->domain, iova, len);
-	__free_iova(mapping, iova, len);
-}
-
 static void arm_iommu_sync_single_for_cpu(struct device *dev,
 		dma_addr_t handle, size_t size, enum dma_data_direction dir)
 {
@@ -1516,8 +1465,8 @@ static const struct dma_map_ops iommu_ops = {
 	.mmap		= arm_iommu_mmap_attrs,
 	.get_sgtable	= arm_iommu_get_sgtable,
 
-	.map_page		= arm_iommu_map_page,
-	.unmap_page		= arm_iommu_unmap_page,
+	.map_phys		= arm_iommu_map_phys,
+	.unmap_phys		= arm_iommu_unmap_phys,
 	.sync_single_for_cpu	= arm_iommu_sync_single_for_cpu,
 	.sync_single_for_device	= arm_iommu_sync_single_for_device,
 
@@ -1525,9 +1474,6 @@ static const struct dma_map_ops iommu_ops = {
 	.unmap_sg		= arm_iommu_unmap_sg,
 	.sync_sg_for_cpu	= arm_iommu_sync_sg_for_cpu,
 	.sync_sg_for_device	= arm_iommu_sync_sg_for_device,
-
-	.map_resource		= arm_iommu_map_resource,
-	.unmap_resource		= arm_iommu_unmap_resource,
 };
 
 /**
-- 
2.51.0


