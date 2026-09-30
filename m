Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8B3CA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=d5uhQBfMA9Bzna2lrXnXP49LmGR65Hwnuf+fvI59R6I=; b=LwPJA1h5iI65qGympxzpgQSyw6
	n/taJ9M/nX51n2QYvQJbTeTTnruT1wPFnCgwhL3vH5rjg+Is31qutplKPxEV2XTwiTHZtboDgea9R
	H9MQVsScxbLTu5C06rdp5Ju8QGa4LL9EiZWVABZovLgHQe+RkJr+m/sdbJKfQsXYw3gxC9Y39duJ7
	FaQdI2VPsLo2Wm3Li1JoDmSo4uEh/N+IpOBHsBaim5CEyjC2ZYTOp1hAnQ8vgg/K6gr2k8Jeam/P/
	v2PtngnMkVA1QXYdZZ1flxfFAhvpL2qQG1OfLxnNPM2jFpX1L1qmcunsFQBZyrPCRSDv2dwIdt3zX
	uZa8wIHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuoy-00000006CmE-1BKl;
	Wed, 30 Sep 2026 13:58:08 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuom-00000006Cfe-3Ngp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:58:05 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260930135751euoutp0191a566717bd36910ffcda056f7649627~aHeUN9sen2678326783euoutp01D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:57:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260930135751euoutp0191a566717bd36910ffcda056f7649627~aHeUN9sen2678326783euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790776671;
	bh=d5uhQBfMA9Bzna2lrXnXP49LmGR65Hwnuf+fvI59R6I=;
	h=From:To:Cc:Subject:Date:References:From;
	b=RYn0wow4k+GSnYkmQCsYEXlyTUhg7UQOTv8JtUMd+qJifKSJ8G5Fs636vRmxanzgS
	 gql6GS829w9bQ1pnaZq1n+Vqz9GTqx9aw7PXynk7nAkbgtktq1lJOJWPAxNGazyIRH
	 a2NCFQiL69OheRnqS31kchts8KdsS6jWpJPhnkHQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260930135751eucas1p1c3b8b79ed87c3bf6f473d26e4663e7e4~aHeUAc8mI1283412834eucas1p1t;
	Wed, 30 Sep 2026 13:57:51 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260930135750eusmtip2515e5cd38c347fe5f4bced4f58a9f9df~aHeTk2AOZ0736807368eusmtip27;
	Wed, 30 Sep 2026 13:57:50 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, "Aneesh Kumar K . V"
	<aneesh.kumar@kernel.org>, Russell King <linux@armlinux.org.uk>, "Claude
 Opus 5 . 5" <noreply@anthropic.com>
Subject: [PATCH] dma-direct: Restore arch_dma_alloc() for the
 DMA_ATTR_NO_KERNEL_MAPPING case
Date: Wed, 30 Sep 2026 15:57:32 +0200
Message-ID: <20260930135734.1013905-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260930135751eucas1p1c3b8b79ed87c3bf6f473d26e4663e7e4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260930135751eucas1p1c3b8b79ed87c3bf6f473d26e4663e7e4
X-EPHeader: CA
X-CMS-RootMailID: 20260930135751eucas1p1c3b8b79ed87c3bf6f473d26e4663e7e4
References: <CGME20260930135751eucas1p1c3b8b79ed87c3bf6f473d26e4663e7e4@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_065759_153204_2B3C2FD7 
X-CRM114-Status: GOOD (  16.49  )
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

Commit 849facea92fa ("dma-direct: simplify the DMA_ATTR_NO_KERNEL_MAPPING
handling") moved the DMA_ATTR_NO_KERNEL_MAPPING shortcut in
dma_direct_alloc() in front of the arch_dma_alloc() call. Architectures
providing their own DMA coherent allocator (CONFIG_ARCH_HAS_DMA_ALLOC)
therefore no longer see such requests. ARM 32bit is one of such. Lack of
the call to arch_dma_alloc() results in the lack of proper cache
management on HighMem pages.

Take the dma-direct shortcut only for coherent devices or when the
architecture doesn't provide arch_dma_alloc(). While touching this,
move that check into separate function to avoid duplication in alloc
and free paths.

Fixes: 849facea92fa ("dma-direct: simplify the DMA_ATTR_NO_KERNEL_MAPPING handling")
Reported-by: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Closes: https://lore.kernel.org/all/yq5ams2akznl.fsf@kernel.org/
Assisted-by: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 kernel/dma/direct.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index da665ca22d5c..a31bd3129f3f 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -179,6 +179,22 @@ static struct page *dma_direct_alloc_from_pool(struct device *dev, size_t size,
 	return page;
 }
 
+/*
+ * Check if the allocation can skip the kernel mapping and return the page
+ * pointer as the cookie.
+ */
+static bool dma_direct_use_no_mapping(struct device *dev, unsigned long attrs)
+{
+	if ((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | __DMA_ATTR_ALLOC_CC_SHARED)) !=
+	    DMA_ATTR_NO_KERNEL_MAPPING)
+		return false;
+	if (is_swiotlb_for_alloc(dev))
+		return false;
+	if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_ALLOC) && !dev_is_dma_coherent(dev))
+		return false;
+	return true;
+}
+
 static void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp)
 {
@@ -226,8 +242,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	if (attrs & DMA_ATTR_NO_WARN)
 		gfp |= __GFP_NOWARN;
 
-	if (((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | __DMA_ATTR_ALLOC_CC_SHARED)) ==
-	     DMA_ATTR_NO_KERNEL_MAPPING) && !is_swiotlb_for_alloc(dev))
+	if (dma_direct_use_no_mapping(dev, attrs))
 		return dma_direct_alloc_no_mapping(dev, size, dma_handle, gfp);
 
 	if (!dev_is_dma_coherent(dev)) {
@@ -374,8 +389,7 @@ void dma_direct_free(struct device *dev, size_t size,
 	if (attrs & __DMA_ATTR_ALLOC_CC_SHARED)
 		mark_mem_encrypted = true;
 
-	if (((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | __DMA_ATTR_ALLOC_CC_SHARED)) ==
-	     DMA_ATTR_NO_KERNEL_MAPPING) && !is_swiotlb_for_alloc(dev)) {
+	if (dma_direct_use_no_mapping(dev, attrs)) {
 		/* cpu_addr is a struct page cookie, not a kernel address */
 		dma_free_contiguous(dev, cpu_addr, size);
 		return;
-- 
2.43.0


