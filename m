Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110FDCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHNhBtoYwrB9YyqIt9GLAXnr440pJOE81ya/0qTY4us=; b=Iu4Ox8sdlxFTKDy0yaDVo8mSxs
	8xKbvqvZlq+Lqsaq0/8yaGK+igy58bCwaJ1df/N+oo4GrDcWet0eojS9ri4qs+6fQ8n5pTdjKf5lo
	lDKEQVnQE6bHB30QyAK+/BAXOODePVS57WC9HfYuEBgAmb5vuh3FYJuljDzYR64XIjZkfYR26IYFd
	n/aD7wcPUCjw6gQMnjTRuoWzyJnUTJqKsMTQtzAD3IZEnb9+zTTbdbZDvPj7TUcRwhTDXSW20Xw/F
	19e6gnyS6zneEfL7gpUMdn3bh3Nmz60JNC9PckhrdfNRRi8vDTrIRrxWHpWdUmaBJ4dcvOC4plUmB
	d4PKXufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFL9-000000003cz-0qzA;
	Thu, 18 Sep 2025 14:10:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFL0-000000003Wl-1Ici
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 14:10:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05B6240336;
	Thu, 18 Sep 2025 14:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D2CC4CEE7;
	Thu, 18 Sep 2025 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758204617;
	bh=m3D6g8FDHOZH6474XMcPOpnGaU1UwHseRqgAFUOfdrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LsgW3cFpYtCJcNpT12ghofulEYz5SE3I1+MEc+VZwiV2aowmuN6OaLrwwHtaY3r62
	 Un7zmoh5+VozkXySig2p0YiWfk7Loy24bLch1JLoDULUJlZ0+s1bosOrGr6Qzps9G4
	 bTciv3Y9YjxxtlFXDXQOA/OUJnji3JaqIfapiByz1FAfMeEl6gUdz3r0CsibDAXsSL
	 hBODJnZhl/XMFnr2oqiyEBEmThANZ2dqKjUTgYaQXdmtJvFNokS+KVbOb2zKA5lM33
	 faKpQN6yt9V/166f9jvRgOthV1TZoTwvTEz1KV3BkmMtdElPbfE7H1ZPamvbmLHuL+
	 Z5qCSgG53oUHA==
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
Subject: [PATCH v4 5/6] xen: swiotlb: Switch to physical address mapping callbacks
Date: Thu, 18 Sep 2025 17:09:28 +0300
Message-ID: <997c0122a24c355b4d7ee353902041a7617f4c9e.1758203802.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758203802.git.leon@kernel.org>
References: <cover.1758203802.git.leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_071018_399235_C70FFC58 
X-CRM114-Status: GOOD (  17.22  )
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

Combine resource and page mappings routines to one function
and remove .map_resource/.unmap_resource callbacks completely.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/xen/swiotlb-xen.c | 63 ++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 34 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index dd7747a2de879..48936179c940b 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -200,17 +200,32 @@ xen_swiotlb_free_coherent(struct device *dev, size_t size, void *vaddr,
  * physical address to use is returned.
  *
  * Once the device is given the dma address, the device owns this memory until
- * either xen_swiotlb_unmap_page or xen_swiotlb_dma_sync_single is performed.
+ * either xen_swiotlb_unmap_phys or xen_swiotlb_dma_sync_single is performed.
  */
-static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
-				unsigned long offset, size_t size,
-				enum dma_data_direction dir,
+static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
+				size_t size, enum dma_data_direction dir,
 				unsigned long attrs)
 {
-	phys_addr_t map, phys = page_to_phys(page) + offset;
-	dma_addr_t dev_addr = xen_phys_to_dma(dev, phys);
+	dma_addr_t dev_addr;
+	phys_addr_t map;
 
 	BUG_ON(dir == DMA_NONE);
+
+	if (attrs & DMA_ATTR_MMIO) {
+		if (unlikely(!dma_capable(dev, phys, size, false))) {
+			dev_err_once(
+				dev,
+				"DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
+				&dma_addr, size, *dev->dma_mask,
+				dev->bus_dma_limit);
+			WARN_ON_ONCE(1);
+			return DMA_MAPPING_ERROR;
+		}
+		return phys;
+	}
+
+	dev_addr = xen_phys_to_dma(dev, phys);
+
 	/*
 	 * If the address happens to be in the device's DMA window,
 	 * we can safely return the device addr and not worry about bounce
@@ -257,13 +272,13 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 
 /*
  * Unmap a single streaming mode DMA translation.  The dma_addr and size must
- * match what was provided for in a previous xen_swiotlb_map_page call.  All
+ * match what was provided for in a previous xen_swiotlb_map_phys call.  All
  * other usages are undefined.
  *
  * After this call, reads by the cpu to the buffer are guaranteed to see
  * whatever the device wrote there.
  */
-static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
+static void xen_swiotlb_unmap_phys(struct device *hwdev, dma_addr_t dev_addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	phys_addr_t paddr = xen_dma_to_phys(hwdev, dev_addr);
@@ -325,7 +340,7 @@ xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
 
 /*
  * Unmap a set of streaming mode DMA translations.  Again, cpu read rules
- * concerning calls here are the same as for swiotlb_unmap_page() above.
+ * concerning calls here are the same as for swiotlb_unmap_phys() above.
  */
 static void
 xen_swiotlb_unmap_sg(struct device *hwdev, struct scatterlist *sgl, int nelems,
@@ -337,7 +352,7 @@ xen_swiotlb_unmap_sg(struct device *hwdev, struct scatterlist *sgl, int nelems,
 	BUG_ON(dir == DMA_NONE);
 
 	for_each_sg(sgl, sg, nelems, i)
-		xen_swiotlb_unmap_page(hwdev, sg->dma_address, sg_dma_len(sg),
+		xen_swiotlb_unmap_phys(hwdev, sg->dma_address, sg_dma_len(sg),
 				dir, attrs);
 
 }
@@ -352,8 +367,8 @@ xen_swiotlb_map_sg(struct device *dev, struct scatterlist *sgl, int nelems,
 	BUG_ON(dir == DMA_NONE);
 
 	for_each_sg(sgl, sg, nelems, i) {
-		sg->dma_address = xen_swiotlb_map_page(dev, sg_page(sg),
-				sg->offset, sg->length, dir, attrs);
+		sg->dma_address = xen_swiotlb_map_phys(dev, sg_phys(sg),
+				sg->length, dir, attrs);
 		if (sg->dma_address == DMA_MAPPING_ERROR)
 			goto out_unmap;
 		sg_dma_len(sg) = sg->length;
@@ -392,25 +407,6 @@ xen_swiotlb_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
 	}
 }
 
-static dma_addr_t xen_swiotlb_direct_map_resource(struct device *dev,
-						  phys_addr_t paddr,
-						  size_t size,
-						  enum dma_data_direction dir,
-						  unsigned long attrs)
-{
-	dma_addr_t dma_addr = paddr;
-
-	if (unlikely(!dma_capable(dev, dma_addr, size, false))) {
-		dev_err_once(dev,
-			     "DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
-			     &dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
-		WARN_ON_ONCE(1);
-		return DMA_MAPPING_ERROR;
-	}
-
-	return dma_addr;
-}
-
 /*
  * Return whether the given device DMA address mask can be supported
  * properly.  For example, if your device can only drive the low 24-bits
@@ -437,13 +433,12 @@ const struct dma_map_ops xen_swiotlb_dma_ops = {
 	.sync_sg_for_device = xen_swiotlb_sync_sg_for_device,
 	.map_sg = xen_swiotlb_map_sg,
 	.unmap_sg = xen_swiotlb_unmap_sg,
-	.map_page = xen_swiotlb_map_page,
-	.unmap_page = xen_swiotlb_unmap_page,
+	.map_phys = xen_swiotlb_map_phys,
+	.unmap_phys = xen_swiotlb_unmap_phys,
 	.dma_supported = xen_swiotlb_dma_supported,
 	.mmap = dma_common_mmap,
 	.get_sgtable = dma_common_get_sgtable,
 	.alloc_pages_op = dma_common_alloc_pages,
 	.free_pages = dma_common_free_pages,
 	.max_mapping_size = swiotlb_max_mapping_size,
-	.map_resource = xen_swiotlb_direct_map_resource,
 };
-- 
2.51.0


