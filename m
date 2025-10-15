Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C59CCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdtHWxZ6P2NkYgYfq08A1DpxEqWfwtgmlHw9aB3IZ2I=; b=KJDyA8OZKAyieasPqYCxdhn3Dr
	4HRJR3khfGHxUy+QcLxzq+JgRoaFZ61cY8kKFm7gdEYklPHTRXC4rHA0KwKdsB6KzWgvQTLxOKe6G
	nbmWd88hl0/LG/73tpnfuDtj70m2Poe89l2ABO3ZuT5crZL/PLASqTnReru2D1N1tChQ+O9yc9ctJ
	DHaGvygLUBXzuNwxlD7/I7ZbuGndAILnGkWd5s+jsVEXb+eZTycXFLkFy8OmDZndmM8U8ha5J9YFD
	NO/JQ93R3yefttvPSf2qo6nejNRMIvYD+V0WmiOwgUxF/7rRZr/gevxjrGox6/L1ifSFpTKKO2VxU
	BMBwucHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xZR-00000001483-2hBI;
	Wed, 15 Oct 2025 09:13:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xZQ-0000000146t-0mcw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 09:13:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A04462562;
	Wed, 15 Oct 2025 09:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DD9C4CEF9;
	Wed, 15 Oct 2025 09:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519599;
	bh=qYoZvd4lyrIfbZIzXqdWJj+pS2O0SyaBOmNGoxPhV3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K32xE455hl5TVMpibUH5sKxJsNq9bwl5OqqfqVfG5T1vfNx7YwavLcHlsjOg3GXwk
	 hYqGo/fxqXFWovR0Ub9T4nwB8lubtw9t5kO3T/yVWfEI02WjdOoMVuxpkn06foahvf
	 sCVnSkss7qhKvKOg84UqhQPZbxa2z7aRAPqjuXLuQA/2tXC87ALNSFNv6SwLZS5wLb
	 ZtHADNp8XqlLR/fauneGBjdte7ABPRafvH+H9rc2EsWGvV7fvYhEWAX5RAYQJxorEL
	 dAClqqYD5IOiBqqCH6VsD/gsHKz9zVZ8+cK3BADKhGGNtvNSNqIggZpAYTaHEXLL8Z
	 JjKx5x8PvYazQ==
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
Subject: [PATCH v5 01/14] dma-mapping: prepare dma_map_ops to conversion to physical address
Date: Wed, 15 Oct 2025 12:12:47 +0300
Message-ID: <20251015-remove-map-page-v5-1-3bbfe3a25cdf@kernel.org>
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

Add new .map_phys() and .unmap_phys() callbacks to dma_map_ops as a
preparation to replace .map_page() and .unmap_page() respectively.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 include/linux/dma-map-ops.h |  7 +++++++
 kernel/dma/mapping.c        |  4 ++++
 kernel/dma/ops_helpers.c    | 12 ++++++++++--
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 10882d00cb17..79d2a74d4b49 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -37,6 +37,13 @@ struct dma_map_ops {
 	void (*unmap_page)(struct device *dev, dma_addr_t dma_handle,
 			size_t size, enum dma_data_direction dir,
 			unsigned long attrs);
+
+	dma_addr_t (*map_phys)(struct device *dev, phys_addr_t phys,
+			size_t size, enum dma_data_direction dir,
+			unsigned long attrs);
+	void (*unmap_phys)(struct device *dev, dma_addr_t dma_handle,
+			size_t size, enum dma_data_direction dir,
+			unsigned long attrs);
 	/*
 	 * map_sg should return a negative error code on error. See
 	 * dma_map_sgtable() for a list of appropriate error codes
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index fe7472f13b10..4080aebe5deb 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -169,6 +169,8 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 		addr = dma_direct_map_phys(dev, phys, size, dir, attrs);
 	else if (use_dma_iommu(dev))
 		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
+	else if (ops->map_phys)
+		addr = ops->map_phys(dev, phys, size, dir, attrs);
 	else if (is_mmio) {
 		if (!ops->map_resource)
 			return DMA_MAPPING_ERROR;
@@ -223,6 +225,8 @@ void dma_unmap_phys(struct device *dev, dma_addr_t addr, size_t size,
 		dma_direct_unmap_phys(dev, addr, size, dir, attrs);
 	else if (use_dma_iommu(dev))
 		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
+	else if (ops->unmap_phys)
+		ops->unmap_phys(dev, addr, size, dir, attrs);
 	else if (is_mmio) {
 		if (ops->unmap_resource)
 			ops->unmap_resource(dev, addr, size, dir, attrs);
diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
index 6f9d604d9d40..1eccbdbc99c1 100644
--- a/kernel/dma/ops_helpers.c
+++ b/kernel/dma/ops_helpers.c
@@ -64,6 +64,7 @@ struct page *dma_common_alloc_pages(struct device *dev, size_t size,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	struct page *page;
+	phys_addr_t phys;
 
 	page = dma_alloc_contiguous(dev, size, gfp);
 	if (!page)
@@ -71,9 +72,13 @@ struct page *dma_common_alloc_pages(struct device *dev, size_t size,
 	if (!page)
 		return NULL;
 
+	phys = page_to_phys(page);
 	if (use_dma_iommu(dev))
-		*dma_handle = iommu_dma_map_phys(dev, page_to_phys(page), size,
-						 dir, DMA_ATTR_SKIP_CPU_SYNC);
+		*dma_handle = iommu_dma_map_phys(dev, phys, size, dir,
+						 DMA_ATTR_SKIP_CPU_SYNC);
+	else if (ops->map_phys)
+		*dma_handle = ops->map_phys(dev, phys, size, dir,
+					    DMA_ATTR_SKIP_CPU_SYNC);
 	else
 		*dma_handle = ops->map_page(dev, page, 0, size, dir,
 					    DMA_ATTR_SKIP_CPU_SYNC);
@@ -94,6 +99,9 @@ void dma_common_free_pages(struct device *dev, size_t size, struct page *page,
 	if (use_dma_iommu(dev))
 		iommu_dma_unmap_phys(dev, dma_handle, size, dir,
 				     DMA_ATTR_SKIP_CPU_SYNC);
+	else if (ops->unmap_phys)
+		ops->unmap_phys(dev, dma_handle, size, dir,
+				DMA_ATTR_SKIP_CPU_SYNC);
 	else if (ops->unmap_page)
 		ops->unmap_page(dev, dma_handle, size, dir,
 				DMA_ATTR_SKIP_CPU_SYNC);

-- 
2.51.0


