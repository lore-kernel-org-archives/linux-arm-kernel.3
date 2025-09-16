Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C3CCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 07:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zBGTQHU+tUnMcnrcBx3QSuJr8npPbJ6gtNOeRRq01E=; b=wG4pIRj7TgynbjoOXkwyfwGfxO
	OVE8h3778EzN+oypeIamTZhFv676JB3cMOVgy3oYvG8sj3TFSBz4OcMfI/uQ9P6tC/1Z+c+hppEsd
	qb4bAh0ZHk7rFlEunPEnIiyJfWFzXG5Ep9WedgdrRRxpjXIU0fm6z1PRAMK0W59YThh0QqFTboXjk
	BLGb9NYJ8DM7Aw/b+5xhJQieD+VOLDdkDnkZjVLKsTIHEIKPdC5S3tFzBMGbwjujNa8APKXNiuBza
	Z4RZofFaTR7ZRr9+aexbDIXy0+Xj+WLt4GC2kPzbklLAhA8LxurUianwp+1xE7Q9WzCgFbgIXuw/W
	ZUk/0Z2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQAx-000000071HX-16eQ;
	Tue, 16 Sep 2025 07:32:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQAt-000000071G5-3pRN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 07:32:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF6604082F;
	Tue, 16 Sep 2025 07:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F654C4CEF9;
	Tue, 16 Sep 2025 07:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758007946;
	bh=SVYxxrO+Wiw9QRhQmJDc9G1iV7Y+Q+GC+uaaZIVFlE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q5l/YYnGeY5KmQe4DG4hjF78LVZ8OXOQ+pB82BBUmJn6edzLHgSuj2CWbR9tHQxuz
	 V+i2NLz/v8SB/2m9fmgh7Aayf1tH00ZDyW2uEyAVSZYOm01e1H2+8efBN6AHWQoxx+
	 cFMIiv6Uh4+Xl2Gd0lgkakm1LudKj5e8guvsK2h+fFY3lMpaM+oT5lVnMCPWb0ALfC
	 1KJroWeewgWN9weAh82UzGzikEEJFZFkZGjEoumsterOmHtgbHTVHFvm9ZGc1NjzEk
	 pJ3YP3SnB0PUJUy+TNkIYziVcZGcUIh2xoe3przgP0AhnQXr0IRZnYGJbOcMWn3vS4
	 SZgbnZULDbOuw==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 2/4] dma-mapping: convert dummy ops to physical address mapping
Date: Tue, 16 Sep 2025 10:32:05 +0300
Message-ID: <3b54fbe896086adc0f3fb90a2a1a2e3bb3ff9de4.1758006942.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758006942.git.leon@kernel.org>
References: <cover.1758006942.git.leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_003227_977948_F0E8431A 
X-CRM114-Status: GOOD (  10.90  )
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

Change dma_dummy_map_page and dma_dummy_unmap_page routines
to accept physical address and rename them.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 kernel/dma/dummy.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/kernel/dma/dummy.c b/kernel/dma/dummy.c
index 92de80e5b057e..16a51736a2a39 100644
--- a/kernel/dma/dummy.c
+++ b/kernel/dma/dummy.c
@@ -11,17 +11,16 @@ static int dma_dummy_mmap(struct device *dev, struct vm_area_struct *vma,
 	return -ENXIO;
 }
 
-static dma_addr_t dma_dummy_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
+static dma_addr_t dma_dummy_map_phys(struct device *dev, phys_addr_t phys,
+		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	return DMA_MAPPING_ERROR;
 }
-static void dma_dummy_unmap_page(struct device *dev, dma_addr_t dma_handle,
+static void dma_dummy_unmap_phys(struct device *dev, dma_addr_t dma_handle,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	/*
-	 * Dummy ops doesn't support map_page, so unmap_page should never be
+	 * Dummy ops doesn't support map_phys, so unmap_page should never be
 	 * called.
 	 */
 	WARN_ON_ONCE(true);
@@ -51,8 +50,8 @@ static int dma_dummy_supported(struct device *hwdev, u64 mask)
 
 const struct dma_map_ops dma_dummy_ops = {
 	.mmap                   = dma_dummy_mmap,
-	.map_page               = dma_dummy_map_page,
-	.unmap_page             = dma_dummy_unmap_page,
+	.map_phys               = dma_dummy_map_phys,
+	.unmap_phys             = dma_dummy_unmap_phys,
 	.map_sg                 = dma_dummy_map_sg,
 	.unmap_sg               = dma_dummy_unmap_sg,
 	.dma_supported          = dma_dummy_supported,
-- 
2.51.0


