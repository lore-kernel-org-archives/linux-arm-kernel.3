Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DF2C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+mWcWcMIxrVNEpLUoztP/IL9REVDP7k5vN7H2EsZmY=; b=koLFgHAcnD2O1y/30WGow9OSam
	/Fq+NgXVNmZYZtVFNzNkUjXLIMDs8Pjewsw+Zf+bGH6A5TH7m5CWhAcyrFSq9jENt/1aUALezzkUN
	27KLcPg9q2u4LLtB4rvv9uOhUEZ/V4hm1ENzUOFET3e3dTcfke6uihZPk+DOCjLw8krykAoZdO6Je
	yv9XnY3KvXuQn5ZNl+0rWuGN3T27pXjpvV4KxUYx5oLXlOsikFii2zY1lvHjU5mKbmbUTjYH/1UjY
	lrDC1wxbE1rt5IwkiXNrLsRLSuiqQY3rAe+nNv/YzLJYA00KEetsZ+I1FhWXVxmGe/e0AsIz5c+MJ
	yYzrd8Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXLb-00000007ZEG-2hQV;
	Tue, 17 Jun 2025 14:31:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWBg-00000007Jhu-2sFJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:17:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B13A7437AC;
	Tue, 17 Jun 2025 13:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443A5C4CEE3;
	Tue, 17 Jun 2025 13:17:14 +0000 (UTC)
Date: Tue, 17 Jun 2025 14:17:11 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Christian Meissl <meissl.christian@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Christoph Hellwig <hch@lst.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] ARM/dma-mapping: invalidate caches on
 arch_dma_prep_coherent
Message-ID: <aFFq19W0D5JeOyeI@arm.com>
References: <43a834c8f871f8719368b3f3239f27ee4f6c6286.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43a834c8f871f8719368b3f3239f27ee4f6c6286.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_061716_741777_AEF2C968 
X-CRM114-Status: GOOD (  16.43  )
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

On Tue, Jun 17, 2025 at 09:54:46AM +0200, Christian Meissl wrote:
> since switching to dma-direct, memory using DMA_ATTR_NO_KERNEL_MAPPING
> is no longer allocated using the arch specific handlers and instead
> will use dma_direct_alloc_no_mapping. While the arm specific allocation
> handlers implicitly clear the allocated dma buffers and will flush any caches
> dma-direct relies on ARCH_HAS_DMA_PREP_COHERENT to flush the caches.
> 
> Without this flush video frame corruption can occur in drivers
> like the coda v4l2 driver which explicitly sets the DMA_ATTR_NO_KERNEL_MAPPING flag.
> 
> Fixes: ae626eb97376 ("ARM/dma-mapping: use dma-direct unconditionally")
> Signed-off-by: Christian Meissl <meissl.christian@gmail.com>
[...]
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index 88c2d68a69c9..bde7ae4ba31a 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -1821,3 +1821,11 @@ void arch_dma_free(struct device *dev, size_t size, void *cpu_addr,
>  {
>         __arm_dma_free(dev, size, cpu_addr, dma_handle, attrs, false);
>  }
> +
> +void arch_dma_prep_coherent(struct page *page, size_t size)
> +{
> +       void *ptr = page_address(page);
> +
> +       dmac_flush_range(ptr, ptr + size);
> +       outer_flush_range(__pa(ptr), __pa(ptr) + size);
> +}

It probably doesn't make any difference in practice, FWIW arm64 only
does a clean rather than flush (clean+invalidate) here.

What I noticed is that arch_dma_prep_coherent() is only called for
lowmem pages, so doing page_address() is safe. However, I don't think we
have anything to flush the caches for highmem pages.

-- 
Catalin

