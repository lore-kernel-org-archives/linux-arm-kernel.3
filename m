Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35394CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0RSIhug9e9ydgjudmmhXvwA5s3usVBKmgWxJQR/YPg=; b=ZF6Ot3byXZiIwKci1qx8JjJtUA
	uTYk23M9vNx9dM/ZrN+qLVt3NEmtxMm6GUmYKKRunNaOqkzzi/MjopR7jzJl+ARenEX9oOlnkDSai
	P3zXF9bt6OiaHdM9phzjIFZ4MQaaxF5dqE3ksj2U0ZKRaI0SeA2FJeyEezObix8QEtRNCBrcNEVjF
	fY9WagF+KVD0dBwbssWCU5BtTPqBgVt1PEgcUMnXwuLV3GWz5l2ApP25GhlH9mnMcxqz+lfgVPwKX
	APIxfocl+IXXYDv3SWxHryvGb3xO6BqhMKsRNxYWkK+ULvuQk91Hx81R5AbfVQN7VWW0l9zxRyH/r
	cJfENkRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBWw-00000006Rss-3fTq;
	Fri, 09 Oct 2026 14:25:02 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBWs-00000006Rs2-2pXy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 14:25:00 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261009142450euoutp020aa0c88be8ea75b1531f0ec7e0815418~c4pc4Kji92877128771euoutp02R
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 14:24:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261009142450euoutp020aa0c88be8ea75b1531f0ec7e0815418~c4pc4Kji92877128771euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791555890;
	bh=i0RSIhug9e9ydgjudmmhXvwA5s3usVBKmgWxJQR/YPg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=aiqEJSWOpDfUL1AKnBKqTlwcfxTrq/0miLWX+Wzd1JbYG3hVbE9drv9eNOifHgEql
	 emZ8+9HPeiodQIG7JntklpErISRudBQfgtd3p/eahry/SnuvXYkbKxhpz59KMOb5mG
	 M+q0tsnIp/g6YDhqptVYzJndtyaOadY4kv31Cj78=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261009142450eucas1p22aec6df61384870aa07eecf8ca4f269c~c4pcwGLoI2048820488eucas1p2r;
	Fri,  9 Oct 2026 14:24:50 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261009142449eusmtip113f1886f9735f58850eaf51a840c30dd~c4pb_Pa1X1436814368eusmtip1V;
	Fri,  9 Oct 2026 14:24:49 +0000 (GMT)
Message-ID: <a4e7873b-f5eb-47cf-91f6-ad3e70f7b0cd@samsung.com>
Date: Fri, 9 Oct 2026 16:24:49 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] dma-direct: Restore arch_dma_alloc() for the
 DMA_ATTR_NO_KERNEL_MAPPING case
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Russell King
	<linux@armlinux.org.uk>, "Claude Opus 5 . 5" <noreply@anthropic.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260930135734.1013905-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261009142450eucas1p22aec6df61384870aa07eecf8ca4f269c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260930135751eucas1p1c3b8b79ed87c3bf6f473d26e4663e7e4
X-EPHeader: CA
X-CMS-RootMailID: 20260930135751eucas1p1c3b8b79ed87c3bf6f473d26e4663e7e4
References: <CGME20260930135751eucas1p1c3b8b79ed87c3bf6f473d26e4663e7e4@eucas1p1.samsung.com>
	<20260930135734.1013905-1-m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_072459_339702_60B9CCD5 
X-CRM114-Status: GOOD (  24.08  )
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

On 30.09.2026 15:57, Marek Szyprowski wrote:
> Commit 849facea92fa ("dma-direct: simplify the DMA_ATTR_NO_KERNEL_MAPPING
> handling") moved the DMA_ATTR_NO_KERNEL_MAPPING shortcut in
> dma_direct_alloc() in front of the arch_dma_alloc() call. Architectures
> providing their own DMA coherent allocator (CONFIG_ARCH_HAS_DMA_ALLOC)
> therefore no longer see such requests. ARM 32bit is one of such. Lack of
> the call to arch_dma_alloc() results in the lack of proper cache
> management on HighMem pages.
>
> Take the dma-direct shortcut only for coherent devices or when the
> architecture doesn't provide arch_dma_alloc(). While touching this,
> move that check into separate function to avoid duplication in alloc
> and free paths.
>
> Fixes: 849facea92fa ("dma-direct: simplify the DMA_ATTR_NO_KERNEL_MAPPING handling")
> Reported-by: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Closes: https://lore.kernel.org/all/yq5ams2akznl.fsf@kernel.org/
> Assisted-by: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Applied to dma-mapping-for-next, because it looks that this case has no
active users, so it is not the urgent fix.

> ---
>  kernel/dma/direct.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index da665ca22d5c..a31bd3129f3f 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -179,6 +179,22 @@ static struct page *dma_direct_alloc_from_pool(struct device *dev, size_t size,
>  	return page;
>  }
>  
> +/*
> + * Check if the allocation can skip the kernel mapping and return the page
> + * pointer as the cookie.
> + */
> +static bool dma_direct_use_no_mapping(struct device *dev, unsigned long attrs)
> +{
> +	if ((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | __DMA_ATTR_ALLOC_CC_SHARED)) !=
> +	    DMA_ATTR_NO_KERNEL_MAPPING)
> +		return false;
> +	if (is_swiotlb_for_alloc(dev))
> +		return false;
> +	if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_ALLOC) && !dev_is_dma_coherent(dev))
> +		return false;
> +	return true;
> +}
> +
>  static void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
>  		dma_addr_t *dma_handle, gfp_t gfp)
>  {
> @@ -226,8 +242,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  	if (attrs & DMA_ATTR_NO_WARN)
>  		gfp |= __GFP_NOWARN;
>  
> -	if (((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | __DMA_ATTR_ALLOC_CC_SHARED)) ==
> -	     DMA_ATTR_NO_KERNEL_MAPPING) && !is_swiotlb_for_alloc(dev))
> +	if (dma_direct_use_no_mapping(dev, attrs))
>  		return dma_direct_alloc_no_mapping(dev, size, dma_handle, gfp);
>  
>  	if (!dev_is_dma_coherent(dev)) {
> @@ -374,8 +389,7 @@ void dma_direct_free(struct device *dev, size_t size,
>  	if (attrs & __DMA_ATTR_ALLOC_CC_SHARED)
>  		mark_mem_encrypted = true;
>  
> -	if (((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | __DMA_ATTR_ALLOC_CC_SHARED)) ==
> -	     DMA_ATTR_NO_KERNEL_MAPPING) && !is_swiotlb_for_alloc(dev)) {
> +	if (dma_direct_use_no_mapping(dev, attrs)) {
>  		/* cpu_addr is a struct page cookie, not a kernel address */
>  		dma_free_contiguous(dev, cpu_addr, size);
>  		return;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


