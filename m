Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CB2CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 09:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAq9xJzmOoXx3xcoKMi/etKK6dz4o3cn8Zx5XPgyK40=; b=bC1A+BIvlbHzu2TmvCo+oU+z6a
	LgVrFL4VEm2/S1Ev7JxkzNQlIDpGoAAORUXNg9D6TevSjSu8rd6Kv+7htXlEq83wGjI76/jinlihK
	7MzMEGzS4F4Gl9L8w1rzK86oM8SrFgbHJMt1XVsilIrjbR+yNp0vdIc+BcuC0+X7xfNHyIPgkpkAX
	uMPyjwbvjd/Dhm56B469sfV98RizGM5HLVBv1sEG+rZbj1CYR0sIwTfh5wFt3jd4/OGJFcYEorx66
	N1USRurn4pW8yfuod+3ycPlNLTwF68L0Qv77E0qkFWv41HbVZo1CwMYxaj5yxBG5YQ9FN7u6L0mNk
	VELJ08xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xa4-0000000153Q-3XYk;
	Wed, 15 Oct 2025 09:14:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xZw-000000014oK-1Mhp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 09:13:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 61E8763BEB;
	Wed, 15 Oct 2025 09:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68352C116B1;
	Wed, 15 Oct 2025 09:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519631;
	bh=mdWMUlQx33yhQCgB9g+eGxCMPJQasErUwNks3U6bpsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rEwULnAPmCOdwy2UrV0khdEVG+QC189t+pWVTdsvqzsG8ClpvXbpHIclLUeiChJit
	 Asjzi2wPxyCyNS+yOeqOuZbyh1kzi+RASrkeH6L9WKgqJ4Nep3XyQdWIfGef5UXtLl
	 4fNLbyDWUuVqDpN4V/R/QJ801iNpMtBJyEWeF8cCn3lbsNgTFYpOnqdjul2qpJ86io
	 H6krcrHfE21Xptwb5fJAnvBqNCMlN327+oD4pwEgkzc1w47bMq0cyHHDbS9H+MSG3D
	 R2WhQOt9JKWoeo1Q4OK3KDX5S1JjA3cA5tf/m6FzVx9EfGIR1d1Mk/IWVTz8mEMZz4
	 6XQHEQ8GGkWUw==
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
Subject: [PATCH v5 13/14] xen: swiotlb: Convert mapping routine to rely on physical address
Date: Wed, 15 Oct 2025 12:12:59 +0300
Message-ID: <20251015-remove-map-page-v5-13-3bbfe3a25cdf@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev
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

From: Leon Romanovsky <leonro@nvidia.com>

Switch to .map_phys callback instead of .map_page.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/xen/grant-dma-ops.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 29257d2639db..14077d23f2a1 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -163,18 +163,22 @@ static void xen_grant_dma_free_pages(struct device *dev, size_t size,
 	xen_grant_dma_free(dev, size, page_to_virt(vaddr), dma_handle, 0);
 }
 
-static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
-					 unsigned long offset, size_t size,
+static dma_addr_t xen_grant_dma_map_phys(struct device *dev, phys_addr_t phys,
+					 size_t size,
 					 enum dma_data_direction dir,
 					 unsigned long attrs)
 {
 	struct xen_grant_dma_data *data;
+	unsigned long offset = offset_in_page(phys);
 	unsigned long dma_offset = xen_offset_in_page(offset),
 			pfn_offset = XEN_PFN_DOWN(offset);
 	unsigned int i, n_pages = XEN_PFN_UP(dma_offset + size);
 	grant_ref_t grant;
 	dma_addr_t dma_handle;
 
+	if (unlikely(attrs & DMA_ATTR_MMIO))
+		return DMA_MAPPING_ERROR;
+
 	if (WARN_ON(dir == DMA_NONE))
 		return DMA_MAPPING_ERROR;
 
@@ -190,7 +194,7 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
 
 	for (i = 0; i < n_pages; i++) {
 		gnttab_grant_foreign_access_ref(grant + i, data->backend_domid,
-				pfn_to_gfn(page_to_xen_pfn(page) + i + pfn_offset),
+				pfn_to_gfn(page_to_xen_pfn(phys_to_page(phys)) + i + pfn_offset),
 				dir == DMA_TO_DEVICE);
 	}
 
@@ -199,7 +203,7 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
 	return dma_handle;
 }
 
-static void xen_grant_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
+static void xen_grant_dma_unmap_phys(struct device *dev, dma_addr_t dma_handle,
 				     size_t size, enum dma_data_direction dir,
 				     unsigned long attrs)
 {
@@ -242,7 +246,7 @@ static void xen_grant_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
 		return;
 
 	for_each_sg(sg, s, nents, i)
-		xen_grant_dma_unmap_page(dev, s->dma_address, sg_dma_len(s), dir,
+		xen_grant_dma_unmap_phys(dev, s->dma_address, sg_dma_len(s), dir,
 				attrs);
 }
 
@@ -257,7 +261,7 @@ static int xen_grant_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		return -EINVAL;
 
 	for_each_sg(sg, s, nents, i) {
-		s->dma_address = xen_grant_dma_map_page(dev, sg_page(s), s->offset,
+		s->dma_address = xen_grant_dma_map_phys(dev, sg_phys(s),
 				s->length, dir, attrs);
 		if (s->dma_address == DMA_MAPPING_ERROR)
 			goto out;
@@ -286,8 +290,8 @@ static const struct dma_map_ops xen_grant_dma_ops = {
 	.free_pages = xen_grant_dma_free_pages,
 	.mmap = dma_common_mmap,
 	.get_sgtable = dma_common_get_sgtable,
-	.map_page = xen_grant_dma_map_page,
-	.unmap_page = xen_grant_dma_unmap_page,
+	.map_phys = xen_grant_dma_map_phys,
+	.unmap_phys = xen_grant_dma_unmap_phys,
 	.map_sg = xen_grant_dma_map_sg,
 	.unmap_sg = xen_grant_dma_unmap_sg,
 	.dma_supported = xen_grant_dma_supported,

-- 
2.51.0


