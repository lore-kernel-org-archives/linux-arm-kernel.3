Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D18CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 07:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fH5TzJJbKo0rBLKWqT0uLuLjv2Tghq9ms3cCHBZtYf0=; b=gZTT3dlbXJDvTikDFui/s9KzJ3
	B/gwj5MA8d/uh45yaQJ1u2Gucsr1Qms4e2GaZy8jctSYfXTFe/UvsEtgzNWATUWBhi4d+dFFuH8uv
	L+F53FSfhIn+loklgxH4qUjlNBz1W6IVBtowVhTIr8sYi+s/JvyBEuVx994OpOYHX73LT+0BJuR6m
	3gag8qjZL+g8XVfjvNiS8/BVWLOqEXzHUcC91RQKAmQxbORwg3AXoa3wuffOnKYCGWeyJF4wYIDBI
	C2O/9T4Gp/98dCXJOtot5BerXNzWanlprxrYEGYj6FSuvpd0ukliPiCcxAC9SENSDYHb2cANvS3EN
	jVLmGBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQB1-000000071Ku-0wsE;
	Tue, 16 Sep 2025 07:32:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQAy-000000071Hw-14uD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 07:32:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 540EF43826;
	Tue, 16 Sep 2025 07:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526A2C4CEFD;
	Tue, 16 Sep 2025 07:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758007951;
	bh=IWZzOtyPCKRdI0+hToW/fnJJYkRULeN+gzOWf1AjNkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GHnKv1Pp0tvFEz3pCbixGilPKt8kobdgb8+pVMCk+aJ83OEJyYkpq4oNPL5tRF1fD
	 9d260B+Az8pQw3/SDCczfKbakugUDvMaEw4JnkRyOWrs97qcYrrDmDvo0vaYvqiOf6
	 lJxPVkhf5f3cYhABiK9zWvgKFBUYR4xxpYfuKS4ca//1IBhK+9j02CTQVN60OO0Ava
	 hQw9GvszlxU14IwMJrI4jU2k+MWFXsI4vLcD7KSVoQg6MTFSDdYTnUHOC3eBfxNjS8
	 7e7QvqbTfJC9HAjZH+i157DTyDOHDy2ZSnNgo11ErKUX+6dsBwifkTnkfHAsvinTXK
	 QzaKdm9+yyg5Q==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 1/4] dma-mapping: prepare dma_map_ops to conversion to physical address
Date: Tue, 16 Sep 2025 10:32:04 +0300
Message-ID: <f40855cc9733160c9ba842bf6e7cac58f0bf1dbb.1758006942.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758006942.git.leon@kernel.org>
References: <cover.1758006942.git.leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_003232_378958_FC0042E6 
X-CRM114-Status: GOOD (  10.84  )
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

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 include/linux/dma-map-ops.h | 7 +++++++
 kernel/dma/mapping.c        | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 71f5b30254159..25603cb273769 100644
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
index fe7472f13b106..4080aebe5debb 100644
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
-- 
2.51.0


