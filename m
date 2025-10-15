Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C203FCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 09:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkOLY0bMOAegRX2PLwNVc1xekduhJqcvNYaejGV6Jnk=; b=ZKNKmCuXTEQuP1MuGIABVKNnX0
	WtE6jTjmhbMFiSXkvMn58J7R6lxGrWu4khGorsLlQqK8gFhQ5dRTlOb+bqr0giLMPi+fyx7Bt/nJ+
	NgbLDFq0kSeJVYA6E8NZWVFY1zU4Or667gIC5PXostaOUS9WpQJxHgj0lpakP94/7+gk6qcV6/xGy
	itzadfT28y+R1GKwuQ1s4XiZBiNxXWDI0xbx41i249Wp7j6KDA/wv0Zb2j/7ZBvqG0cI/fjGOrSiS
	088FYze7iQXI/3j9EFNzRHh111CVHA5ecct/R68C4gwbay5r1zVBmhh++qmkWOZG7ikWT6VKCozqU
	IwI/0Unw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xZV-000000014DN-45hc;
	Wed, 15 Oct 2025 09:13:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xZT-0000000149Y-1Z1y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 09:13:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFF4940246;
	Wed, 15 Oct 2025 09:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DE5C19421;
	Wed, 15 Oct 2025 09:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519602;
	bh=VnMG1AI6BvgRLCN60ENFie/apQCA7LYrL0xFWoo7RpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qIrMBqnuHuFqyNXyGEUvjAWSrGuP7BHKNjv3W6RybkmzvAtE/8s4IA/VJ9GgZGWEB
	 7bm6DuwWphduE+9B2nQ+hsAaoABhi1mvrnEwifkp0w0oOcXl5GDl8SFAl/4Hsn2XU3
	 qHwmOdQ7pqCuYsn/djnTr4K19DmpdZaqVnSDdvaMvNqskBH0ZJwkuOQDubU0sCtpq5
	 W+VFnqQwdlPVM8EnzBLjjI3VgMDfGi1EtCEG8d7wYwOwwWXwNpe/pcGzB9IKEGu2uL
	 HHQzw8zSVXRKXjzRor9TvOjzpRxPPnksJzz0TpmzYizTMT+05dps2oNMrK/FjdOH2y
	 mqyatvpalS22Q==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v5 05/14] xen: swiotlb: Switch to physical address mapping callbacks
Date: Wed, 15 Oct 2025 12:12:51 +0300
Message-ID: <20251015-remove-map-page-v5-5-3bbfe3a25cdf@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_021323_466906_557EC2B3 
X-CRM114-Status: GOOD (  18.41  )
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/xen/swiotlb-xen.c | 63 ++++++++++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 34 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index dd7747a2de87..ccf25027bec1 100644
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
+				"DMA addr %pa+%zu overflow (mask %llx, bus limit %llx).\n",
+				&phys, size, *dev->dma_mask,
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


