Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6449C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLfb2r43LhpOq5XaDQidvHA9iO5v22wjpIkEIg1fwG4=; b=y7cvzO8rLCntGZSyzX/F/RCjwT
	r0urhOffVdBibfFGegTLMxPTMDl5PIBeFiT4MqDSbPEV2WS1uccLwigkFsRZl9usH0gl6HDvXlE2a
	zdvNM7bYtIVQuoz/H8t04yh9nwZApupwE+Z+4XTcJxvMZ4BGE+Y5zt+CfB1h+bq9+Uw/D7yol6IAF
	Yrfnys7228AplWcXMnKagkBUX+7zRXNpBtailUBQOCLWwp2Sm9Iou7doivCGZLiqE8XfRSDup4NUL
	p0bd7VAwHUfRvAgLFG5wriv03uCYc8vm2hEHTbXKD9QQj9y2sHmoIrDpica+MuzkN9al4CCMJmZKD
	a8kCP8ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NLZ-00000008SBC-1ogh;
	Wed, 23 Sep 2026 13:49:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NLW-00000008SAL-3Vbv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:49:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F5BE1516;
	Wed, 23 Sep 2026 06:49:09 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 115DE3F86F;
	Wed, 23 Sep 2026 06:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790171352; bh=XZjpz87fWuq0xeTRn18TokdKjnI48O4gDE75aIXRo/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mQ/W8ZyCxdppzKi6TjFPjx+SnN6nJs1Q0ck64jZseOqja959/n3ZX/3vuBXryqiVy
	 OL6BsCU2pOXRu8nZ7Rw2k3kSXnD9/Eum+CdiLMgaM+zfOhJSn9F4DHjrcdbTXpAfoQ
	 tqz7RvO89PTGnZD7MrNYoOLeOeYFrJCzF3uTP37o=
Date: Wed, 23 Sep 2026 14:49:07 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 06/13] dma-contiguous: Accept an explicit minimum
 alignment
Message-ID: <arPY05E2xYflek07@arm.com>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-7-aneesh.kumar@kernel.org>
 <arOrgRfi1k12clT7@arm.com>
 <yq5a33v02nmn.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5a33v02nmn.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_064915_140212_6540A1EA 
X-CRM114-Status: GOOD (  19.70  )
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

On Wed, Sep 23, 2026 at 05:19:52PM +0530, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> > On Mon, Sep 21, 2026 at 08:18:40PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> @@ -125,7 +126,8 @@ static inline int dma_contiguous_reserve_area(phys_addr_t size,
> >>  	return -ENOSYS;
> >>  }
> >>  static inline struct page *dma_alloc_from_contiguous(struct device *dev,
> >> -		size_t count, unsigned int order, bool no_warn)
> >> +		size_t count, unsigned int order, unsigned int required_order,
> >> +		bool no_warn)
> >>  {
> >>  	return NULL;
> >>  }
> >> @@ -136,7 +138,7 @@ static inline bool dma_release_from_contiguous(struct device *dev,
> >>  }
> >>  /* Use fallback alloc() and free() when CONFIG_DMA_CMA=n */
> >>  static inline struct page *dma_alloc_contiguous(struct device *dev, size_t size,
> >> -		gfp_t gfp)
> >> +		gfp_t gfp, unsigned int align_order)
> >
> > Can we not just bake the alignment further down in these functions
> > rather than getting the callers to pass the {required,align}_order?
> >
> 
> But, we need this to be conditional on CoCo shared allocations. We could
> derive that from attrs and pass attrs instead of align_order, i.e.
> something like:
> 
> 
>  struct page *dma_alloc_from_contiguous(struct device *dev, size_t count,
> -		unsigned int align, unsigned int required_align, bool no_warn)
> +		unsigned int align, unsigned long attrs, bool no_warn)
>  {
> -	if (required_align > CONFIG_CMA_ALIGNMENT)
> +	if (!dma_contiguous_resolve_alignment(attrs, &align))
>  		return NULL;
> -	align = min(max(align, required_align), CONFIG_CMA_ALIGNMENT);
>  
>  	return cma_alloc(dev_get_cma_area(dev), count, align, no_warn);
>  }
> 
> 
> with
> 
> +static bool dma_contiguous_resolve_alignment(unsigned long attrs,
> +					     unsigned int *align)
> +{
> +	unsigned int required_align = 0;
> +
> +	if (attrs & __DMA_ATTR_ALLOC_CC_SHARED)
> +		required_align = get_order(cc_shared_granule_size());
> +	if (required_align > CONFIG_CMA_ALIGNMENT)
> +		return false;
> +
> +	*align = min(max(*align, required_align), CONFIG_CMA_ALIGNMENT);
> +	return true;
> +}

Yes, I think this would work.

-- 
Catalin

