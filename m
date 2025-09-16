Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A312ACAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 07:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFXltkILK+8Vy8i8jg0BfQ6s7P2nkakve86NOL7qTJ8=; b=P7X8AoT9E4qb/FWZj5Bm1GoW54
	mnUGPHxIhRIsQKwVZzfcTk+wo3/l6PGwqLbnwM7wGuBJuyLp1qj1SHDPH9zM4Bty8kMLVwwE0DPhP
	x1/yG7EyV7qA+0MAW+wT1k7TrGqwY2wuBJIikQnce5XfmrRoCxGYjKiW/ppmx9C1SuvNhMKDUO8i8
	ivZ/Wc3dhmwAo7+ffXgEWhoiZgoL/N8nPdWkfnW9S2PYlYUNmXTPLIMQSVJNeaf98svs04hpCEzfx
	JVx6eF6h4Rg7uNEiEssHivopSpQ++dLc4kMfbjTo/bcYrFlke2nFLYa5Bvmiwq4Hqc8yC7UujWNPV
	sF5qRHpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQB5-000000071Na-2StL;
	Tue, 16 Sep 2025 07:32:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQB3-000000071MJ-1H8A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 07:32:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B7A4D6013D;
	Tue, 16 Sep 2025 07:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D34EC4CEEB;
	Tue, 16 Sep 2025 07:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758007956;
	bh=QmB5cU3WsOuAc70Oza/a6LIj7SuUDUAWg6OzrXu3RmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GLX/m403Aze3V+QK3+8X4qMcKQS15jdmPBT9/nGeV6R0IPTmsmRqXz8XKQOGKkzXG
	 YPvfAGsvo8dpDokk7Peh0u/8+gmHtgpu8DOxm0pFc9o6bIt/h2LddRmKehlHmi6ozh
	 d9SJGNYDO+8ys6AYRBF30dn/DMdCQ/6PrkbhGeaclhpPcj5Z8jJro58tV1mMFmywdR
	 S44xs3icGSIFYD5johV5YZeEdyqjZT3jcTrIsITo8wFdPCsdDiBNNDSE3+UolUUTO0
	 z2A2AB1bJl3ZA3r9grcGitdbmHpi1WdQXKW+kZ3hU8W44d+4qRaOTEO1TV+7lo0gwP
	 SeX6J4FyFzJTA==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 4/4] dma-mapping: remove unused mapping resource callbacks
Date: Tue, 16 Sep 2025 10:32:07 +0300
Message-ID: <087c29da71fb41245b8c03f641f53d624be10d59.1758006942.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758006942.git.leon@kernel.org>
References: <cover.1758006942.git.leon@kernel.org>
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

From: Leon Romanovsky <leonro@nvidia.com>

After ARM conversion to use physical addresses for the mapping,
there is no in-kernel users for map_resource/unmap_resource callbacks,
so remove it.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 include/linux/dma-map-ops.h |  6 ------
 kernel/dma/mapping.c        | 16 ++++------------
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 25603cb273769..a2ec1566aa270 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -53,12 +53,6 @@ struct dma_map_ops {
 			enum dma_data_direction dir, unsigned long attrs);
 	void (*unmap_sg)(struct device *dev, struct scatterlist *sg, int nents,
 			enum dma_data_direction dir, unsigned long attrs);
-	dma_addr_t (*map_resource)(struct device *dev, phys_addr_t phys_addr,
-			size_t size, enum dma_data_direction dir,
-			unsigned long attrs);
-	void (*unmap_resource)(struct device *dev, dma_addr_t dma_handle,
-			size_t size, enum dma_data_direction dir,
-			unsigned long attrs);
 	void (*sync_single_for_cpu)(struct device *dev, dma_addr_t dma_handle,
 			size_t size, enum dma_data_direction dir);
 	void (*sync_single_for_device)(struct device *dev,
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 4080aebe5debb..32a85bfdf873a 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -157,7 +157,7 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	bool is_mmio = attrs & DMA_ATTR_MMIO;
-	dma_addr_t addr;
+	dma_addr_t addr = DMA_MAPPING_ERROR;
 
 	BUG_ON(!valid_dma_direction(dir));
 
@@ -171,18 +171,13 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
 	else if (ops->map_phys)
 		addr = ops->map_phys(dev, phys, size, dir, attrs);
-	else if (is_mmio) {
-		if (!ops->map_resource)
-			return DMA_MAPPING_ERROR;
-
-		addr = ops->map_resource(dev, phys, size, dir, attrs);
-	} else {
+	else if (!is_mmio && ops->map_page) {
 		struct page *page = phys_to_page(phys);
 		size_t offset = offset_in_page(phys);
 
 		/*
 		 * The dma_ops API contract for ops->map_page() requires
-		 * kmappable memory, while ops->map_resource() does not.
+		 * kmappable memory.
 		 */
 		addr = ops->map_page(dev, page, offset, size, dir, attrs);
 	}
@@ -227,10 +222,7 @@ void dma_unmap_phys(struct device *dev, dma_addr_t addr, size_t size,
 		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
 	else if (ops->unmap_phys)
 		ops->unmap_phys(dev, addr, size, dir, attrs);
-	else if (is_mmio) {
-		if (ops->unmap_resource)
-			ops->unmap_resource(dev, addr, size, dir, attrs);
-	} else
+	else
 		ops->unmap_page(dev, addr, size, dir, attrs);
 	trace_dma_unmap_phys(dev, addr, size, dir, attrs);
 	debug_dma_unmap_phys(dev, addr, size, dir);
-- 
2.51.0


