Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BACC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 05:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/20LB1X5B9UIAsWQg9CIMjdnP2NH0A5ph1HNBiUb2s=; b=UKemXjXNTrKt8EnjaiJPZ1Hawd
	aZQ/F+v8IMBJDjcKSIPG7faEbEVslEWBRemswExZYeCy3SNp5gidN32KPsoLwKhoNqNrKab2cZS7R
	A3gfI4ScPz27tAohsO1D28YSRYIpOdE0ymv7stD1w92XG3oatF7A07mTZDeC0iqBTAaWIa3Uad3Pm
	aJbkocCHqme1uasEX5sZTSsgIm/yyrEsk+lyqQggDRxyUpia5/PwE0lspnT84hZdxqBQogjqU1DkU
	/fWAdveXcGrGU1SPjC3vCqJh3+66ev3cuziucD/5eUDoqkr/ZS1dXzzd04/YgVgGjaoYxm9TRDJ9A
	0sVER8iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhmL-000000016NU-0BcB;
	Thu, 09 Jul 2026 05:58:33 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhmH-000000016M8-1Aq4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 05:58:31 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260709055826euoutp023d86d60c0a36a76d3177b2b51894753e~AiZB92--d0702107021euoutp022
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jul 2026 05:58:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260709055826euoutp023d86d60c0a36a76d3177b2b51894753e~AiZB92--d0702107021euoutp022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783576706;
	bh=e/20LB1X5B9UIAsWQg9CIMjdnP2NH0A5ph1HNBiUb2s=;
	h=Date:Subject:To:From:In-Reply-To:References:From;
	b=MP0U9dVqd0CJ/AKGfokoSH+HtUqi77fLsv4ooUnMLRLkEVW0tt+jXfl0yWdmIpUGJ
	 upEbXGDcCEnIU3YNrDZOzEG6Ltio6vHC9XqOye7xjt/+hljjXUwGfgPAdr/JC2J8Zv
	 e8Ia4MK+cczbiSWiElCe1dyDhZnBlpujrqV4VtvE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260709055825eucas1p1ef36374810c89ada4c37e20ca5d1ad95~AiZBu4Rxl0814308143eucas1p1K;
	Thu,  9 Jul 2026 05:58:25 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260709055825eusmtip2279b9fd8bc2ef0e07e96e965ed7a6765~AiZBBEbra0301703017eusmtip2S;
	Thu,  9 Jul 2026 05:58:25 +0000 (GMT)
Message-ID: <acf7d2c0-071f-41d2-a65e-a5313a1b55c6@samsung.com>
Date: Thu, 9 Jul 2026 07:58:24 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 1/5] ARM: dma-mapping: Treat bitmap size as allocation
 failure
To: Yury Norov <ynorov@nvidia.com>, Russell King <linux@armlinux.org.uk>,
	Jason Gunthorpe <jgg@ziepe.ca>, Danilo Krummrich <dakr@kernel.org>, Leon
	Romanovsky <leon@kernel.org>, "Matthew Wilcox (Oracle)"
	<willy@infradead.org>, Douglas Anderson <dianders@chromium.org>, Kees Cook
	<kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260709020312.133977-2-ynorov@nvidia.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260709055825eucas1p1ef36374810c89ada4c37e20ca5d1ad95
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260709020326eucas1p26246ea775b0aaf1f799ac14a3a691c2d
X-EPHeader: CA
X-CMS-RootMailID: 20260709020326eucas1p26246ea775b0aaf1f799ac14a3a691c2d
References: <20260709020312.133977-1-ynorov@nvidia.com>
	<CGME20260709020326eucas1p26246ea775b0aaf1f799ac14a3a691c2d@eucas1p2.samsung.com>
	<20260709020312.133977-2-ynorov@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_225829_795368_C300640C 
X-CRM114-Status: GOOD (  15.99  )
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

On 09.07.2026 04:03, Yury Norov wrote:
> bitmap_find_next_zero_area() uses an out-of-range return value to
> indicate failure. Check for values greater than or equal to the bitmap
> size so the caller does not depend on the exact failure sentinel.
>
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/mm/dma-mapping.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index f9bc53b60f99..7761099dde9e 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -773,7 +773,7 @@ static inline dma_addr_t __alloc_iova(struct dma_iommu_mapping *mapping,
>  		start = bitmap_find_next_zero_area(mapping->bitmaps[i],
>  				mapping->bits, 0, count, align);
>  
> -		if (start > mapping->bits)
> +		if (start >= mapping->bits)
>  			continue;
>  
>  		bitmap_set(mapping->bitmaps[i], start, count);
> @@ -794,7 +794,7 @@ static inline dma_addr_t __alloc_iova(struct dma_iommu_mapping *mapping,
>  		start = bitmap_find_next_zero_area(mapping->bitmaps[i],
>  				mapping->bits, 0, count, align);
>  
> -		if (start > mapping->bits) {
> +		if (start >= mapping->bits) {
>  			spin_unlock_irqrestore(&mapping->lock, flags);
>  			return DMA_MAPPING_ERROR;
>  		}

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


