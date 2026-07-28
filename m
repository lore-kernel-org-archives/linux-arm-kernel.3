Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7271C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7ks/Fyt5IClzQtUiNDuj+0oa2UT627bnJeYPNERE0g=; b=FErbErRHEiLnVFvY+JgzgEIE4J
	nzdBwsNUU4kphZMGskaB/YB+6DzcUIQgWRZEXP2qcii3iUKgn1w8kR/NhffQGCPCqEDHmyP48+WWC
	UvxsBZqVlkYnQwA06KGSvlJLMh720xpuRsoeZGtKKJ2m6Z62laejDIzLbue0bwdwvhMs8+zpuobjo
	DtQ/OZ0lM1biR7QNCio4lU8GLPJDLGN+F+C6141rmEIWZgXTi7KnVA7sYSx7Oxz5G7WvNGdh+kHl1
	zVEe1jmRTGlV9WrL1zSIqd22zuHG/YNHK4vCMsfxWLdtzbIlVOXI1sIQUay1eNRf7bCgbLsZzL9Sk
	57VevK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woipc-00000005Uz8-2ud2;
	Tue, 28 Jul 2026 14:30:56 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woipN-00000005UnI-2Ahf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:30:55 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493be0fbcc5so62895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 07:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785249040; x=1785853840; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n7ks/Fyt5IClzQtUiNDuj+0oa2UT627bnJeYPNERE0g=;
        b=nNGhFpwEPDLvQ7SuybCogflCwEdQkaMi6EXEAGjITk4KXyzI/ZRV8hmEoZXhd8abCN
         KjNnO3tuJkuvn6OPJEqrnvW/bHfYoJTM8bk6d5Q+OmKONO1ebQjjU4liVcPMXVOzNByU
         J8HugAzEnZrW/P/NyUcu1pyuluj0yU+5fupBUGttLnDWr1z81NDwY042zNiq85+I/dGN
         HZ3PjbWvZ1R3UvAt8I6yEnQ7LWdjQNUxEgnU3f4TUokbDHgio24j5Cg3Q70GTONcaJtj
         jY/QJxbiRbZ+mEgnWC5A7HBQXvbkpi0fWZ4W/hijXIoEEeevkJUFEowp085g4Yx5nda4
         XBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249040; x=1785853840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7ks/Fyt5IClzQtUiNDuj+0oa2UT627bnJeYPNERE0g=;
        b=aZbkNIPFUWeZwwcJNr3FaP/69IyzYQtG0IAyScLhnk+ezpHOra/lGvfIJE4hNVTL6T
         GBdSbdbWj6uZsGKWFPnYBQaFvvZdV5Iui7Mdc3rmX+bVh6zoiiii9yFLEcB6w19ubf9m
         1XfT/Mp4LMTZydhHb5ljqxVSVk+rHBaZox76G/GS+cGhjVM96/RD/Olqi1orzMeyK53Q
         ZyYGurr26adtTTYV8T/qnGqN9eQLgDE7r2NB+iuX9plVYPvrIlfg5ZLFa3v4R6fHxmAu
         09nTDo41ncPIC6/FkL0FX3eooyLiLQhbhVxe+hUpg9a2flztSCxMgYEXsBTCYGLKy6wQ
         AEdQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLGDlIhF8YQ/alv+CAR7301pFJ9trn/j1aCw50H/VhpF66I6lIJqXQ30WrVlHkCPenAsT6Q30N5OS78/0+bC4O@lists.infradead.org
X-Gm-Message-State: AOJu0YxpUMOUxAhbcq6vlDiSD4P/JneknTxg/Nqd115RNoB43qLfC/po
	GWMKOeyW9bPmhMB3GhcMlchCoHPctX2vwfCAlabTaXvBt5Oj4ZXyH6O3pEczmMMLWw==
X-Gm-Gg: AR+sD13p/7LeAKQ0fywbk47tRd31/s/GjQ5klRlCYoO8KB+1RZlH5o6hpA1EiXF7rUa
	FpFVUUJ3U/+nCHo1TwCoYRThjXpA69kf8FS1BV+mVtRR8NkULOmqYFoZBR4OGV8VMxnLsaiwNNo
	/h/R0jkit6DhWFWFzjHOzTwVAJzPtzhPEk+Lqd9Qy5Iy4Fhhm11wHcQCeMzBVOBsbssHKoCJDa1
	TcYa8VH7XsIhbqsGvLdRRgavTotDw+7B5KHJqvYQ9GNeHA2k9BUDQL6BGx8ivZeu1RFSpxFydY7
	Yh7VmoIP+rDi8wPfZ7SDBE7Gn0rjF1uoLNE/XadP2cR8GCxZhflIaYxW82wrcrND42yraDndfkD
	YMfK9FKs0B8LdWJLFvW/H45i+WbFwKHFWOt47uiwmygObrPFkesYmynG0F9WRBeNJDQzuByJXfh
	0XJWB2TlM/V2mau0BnuJSYOkk6khq3cTtt5wJiRmjR3b17CIkWKlUexQ==
X-Received: by 2002:a05:600c:c0d2:20b0:495:6d47:59b5 with SMTP id 5b1f17b1804b1-496b4d2f828mr44175e9.6.1785249039185;
        Tue, 28 Jul 2026 07:30:39 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm89342385e9.15.2026.07.28.07.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:30:38 -0700 (PDT)
Date: Tue, 28 Jul 2026 14:30:32 +0000
From: Mostafa Saleh <smostafa@google.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>, Jiri Pirko <jiri@nvidia.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v8 15/23] dma-direct: pass attrs to dma_capable() for
 DMA_ATTR_CC_SHARED checks
Message-ID: <ami9CIGanuQX3lxb@google.com>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-16-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717180442.110954-16-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_073041_608256_D2F6F7C7 
X-CRM114-Status: GOOD (  31.81  )
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

On Fri, Jul 17, 2026 at 11:34:33PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Teach dma_capable() about DMA_ATTR_CC_SHARED so the capability
> check can reject encrypted DMA addresses for devices that require
> unencrypted/shared DMA.
> 
> Also propagate DMA_ATTR_CC_SHARED in swiotlb_map() when the selected
> SWIOTLB pool is decrypted so the capability check sees the correct DMA
> address attribute.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/x86/kernel/amd_gart_64.c | 30 ++++++++++++++++--------------
>  drivers/xen/swiotlb-xen.c     |  6 +++---
>  include/linux/dma-direct.h    | 10 +++++++++-
>  kernel/dma/direct.h           |  6 +++---
>  kernel/dma/swiotlb.c          |  2 +-
>  5 files changed, 32 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
> index e8000a56732e..b5f1f031d45b 100644
> --- a/arch/x86/kernel/amd_gart_64.c
> +++ b/arch/x86/kernel/amd_gart_64.c
> @@ -180,22 +180,23 @@ static void iommu_full(struct device *dev, size_t size, int dir)
>  }
>  
>  static inline int
> -need_iommu(struct device *dev, unsigned long addr, size_t size)
> +need_iommu(struct device *dev, unsigned long addr, size_t size, unsigned long attrs)
>  {
> -	return force_iommu || !dma_capable(dev, addr, size, true);
> +	return force_iommu || !dma_capable(dev, addr, size, true, attrs);
>  }
>  
>  static inline int
> -nonforced_iommu(struct device *dev, unsigned long addr, size_t size)
> +nonforced_iommu(struct device *dev, unsigned long addr, size_t size,
> +		unsigned long attrs)
>  {
> -	return !dma_capable(dev, addr, size, true);
> +	return !dma_capable(dev, addr, size, true, attrs);
>  }
>  
>  /* Map a single continuous physical area into the IOMMU.
>   * Caller needs to check if the iommu is needed and flush.
>   */
>  static dma_addr_t dma_map_area(struct device *dev, dma_addr_t phys_mem,
> -				size_t size, int dir, unsigned long align_mask)
> +		size_t size, int dir, unsigned long align_mask, unsigned long attrs)
>  {
>  	unsigned long npages = iommu_num_pages(phys_mem, size, PAGE_SIZE);
>  	unsigned long iommu_page;
> @@ -206,7 +207,7 @@ static dma_addr_t dma_map_area(struct device *dev, dma_addr_t phys_mem,
>  
>  	iommu_page = alloc_iommu(dev, npages, align_mask);
>  	if (iommu_page == -1) {
> -		if (!nonforced_iommu(dev, phys_mem, size))
> +		if (!nonforced_iommu(dev, phys_mem, size, attrs))
>  			return phys_mem;
>  		if (panic_on_overflow)
>  			panic("dma_map_area overflow %lu bytes\n", size);
> @@ -231,10 +232,10 @@ static dma_addr_t gart_map_phys(struct device *dev, phys_addr_t paddr,
>  	if (unlikely(attrs & DMA_ATTR_MMIO))
>  		return DMA_MAPPING_ERROR;
>  
> -	if (!need_iommu(dev, paddr, size))
> +	if (!need_iommu(dev, paddr, size, attrs))
>  		return paddr;
>  
> -	bus = dma_map_area(dev, paddr, size, dir, 0);
> +	bus = dma_map_area(dev, paddr, size, dir, 0, attrs);
>  	flush_gart();
>  
>  	return bus;
> @@ -289,7 +290,7 @@ static void gart_unmap_sg(struct device *dev, struct scatterlist *sg, int nents,
>  
>  /* Fallback for dma_map_sg in case of overflow */
>  static int dma_map_sg_nonforce(struct device *dev, struct scatterlist *sg,
> -			       int nents, int dir)
> +		int nents, int dir, unsigned long attrs)
>  {
>  	struct scatterlist *s;
>  	int i;
> @@ -301,8 +302,8 @@ static int dma_map_sg_nonforce(struct device *dev, struct scatterlist *sg,
>  	for_each_sg(sg, s, nents, i) {
>  		unsigned long addr = sg_phys(s);
>  
> -		if (nonforced_iommu(dev, addr, s->length)) {
> -			addr = dma_map_area(dev, addr, s->length, dir, 0);
> +		if (nonforced_iommu(dev, addr, s->length, attrs)) {
> +			addr = dma_map_area(dev, addr, s->length, dir, 0, attrs);
>  			if (addr == DMA_MAPPING_ERROR) {
>  				if (i > 0)
>  					gart_unmap_sg(dev, sg, i, dir, 0);
> @@ -401,7 +402,7 @@ static int gart_map_sg(struct device *dev, struct scatterlist *sg, int nents,
>  		s->dma_address = addr;
>  		BUG_ON(s->length == 0);
>  
> -		nextneed = need_iommu(dev, addr, s->length);
> +		nextneed = need_iommu(dev, addr, s->length, attrs);
>  
>  		/* Handle the previous not yet processed entries */
>  		if (i > start) {
> @@ -449,7 +450,7 @@ static int gart_map_sg(struct device *dev, struct scatterlist *sg, int nents,
>  
>  	/* When it was forced or merged try again in a dumb way */
>  	if (force_iommu || iommu_merge) {
> -		out = dma_map_sg_nonforce(dev, sg, nents, dir);
> +		out = dma_map_sg_nonforce(dev, sg, nents, dir, attrs);
>  		if (out > 0)
>  			return out;
>  	}
> @@ -473,7 +474,8 @@ gart_alloc_coherent(struct device *dev, size_t size, dma_addr_t *dma_addr,
>  		return vaddr;
>  
>  	*dma_addr = dma_map_area(dev, virt_to_phys(vaddr), size,
> -			DMA_BIDIRECTIONAL, (1UL << get_order(size)) - 1);
> +				 DMA_BIDIRECTIONAL,
> +				 (1UL << get_order(size)) - 1, attrs);
>  	flush_gart();
>  	if (unlikely(*dma_addr == DMA_MAPPING_ERROR))
>  		goto out_free;
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 8c4abe65cd49..e2538824ef52 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -212,7 +212,7 @@ static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
>  	BUG_ON(dir == DMA_NONE);
>  
>  	if (attrs & DMA_ATTR_MMIO) {
> -		if (unlikely(!dma_capable(dev, phys, size, false))) {
> +		if (unlikely(!dma_capable(dev, phys, size, false, attrs))) {
>  			dev_err_once(
>  				dev,
>  				"DMA addr %pa+%zu overflow (mask %llx, bus limit %llx).\n",
> @@ -231,7 +231,7 @@ static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
>  	 * we can safely return the device addr and not worry about bounce
>  	 * buffering it.
>  	 */
> -	if (dma_capable(dev, dev_addr, size, true) &&
> +	if (dma_capable(dev, dev_addr, size, true, attrs) &&
>  	    !dma_kmalloc_needs_bounce(dev, size, dir) &&
>  	    !range_straddles_page_boundary(phys, size) &&
>  		!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
> @@ -253,7 +253,7 @@ static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
>  	/*
>  	 * Ensure that the address returned is DMA'ble
>  	 */
> -	if (unlikely(!dma_capable(dev, dev_addr, size, true))) {
> +	if (unlikely(!dma_capable(dev, dev_addr, size, true, attrs))) {
>  		__swiotlb_tbl_unmap_single(dev, map, size, dir,
>  				attrs | DMA_ATTR_SKIP_CPU_SYNC,
>  				swiotlb_find_pool(dev, map));
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index 94fad4e7c11e..daa31a1adf7b 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -135,12 +135,20 @@ static inline bool force_dma_unencrypted(struct device *dev)
>  #endif /* CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED */
>  
>  static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size,
> -		bool is_ram)
> +		bool is_ram, unsigned long attrs)
>  {
>  	dma_addr_t end = addr + size - 1;
>  
>  	if (addr == DMA_MAPPING_ERROR)
>  		return false;
> +	/*
> +	 * The DMA address was derived from encrypted RAM, but this device
> +	 * requires unencrypted DMA addresses. Treat it as not DMA-capable
> +	 * so the caller can fall back to a suitable SWIOTLB pool.
> +	 */
> +	if (!(attrs & DMA_ATTR_CC_SHARED) && force_dma_unencrypted(dev))
> +		return false;
> +

I guess it does not make sense to check the other way? I'd be worried if
some a confidential device uses shared memory which might leak info.

Thanks,
Mostafa

>  	if (is_ram && !IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT) &&
>  	    min(addr, end) < phys_to_dma(dev, PFN_PHYS(min_low_pfn)))
>  		return false;
> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
> index 7140c208c123..e05dc7649366 100644
> --- a/kernel/dma/direct.h
> +++ b/kernel/dma/direct.h
> @@ -101,15 +101,15 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
>  
>  	if (attrs & DMA_ATTR_MMIO) {
>  		dma_addr = phys;
> -		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
> +		if (unlikely(!dma_capable(dev, dma_addr, size, false, attrs)))
>  			goto err_overflow;
>  	} else if (attrs & DMA_ATTR_CC_SHARED) {
>  		dma_addr = phys_to_dma_unencrypted(dev, phys);
> -		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
> +		if (unlikely(!dma_capable(dev, dma_addr, size, false, attrs)))
>  			goto err_overflow;
>  	} else {
>  		dma_addr = phys_to_dma(dev, phys);
> -		if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
> +		if (unlikely(!dma_capable(dev, dma_addr, size, true, attrs)) ||
>  		    dma_kmalloc_needs_bounce(dev, size, dir)) {
>  			if (is_swiotlb_active(dev) &&
>  			    !(attrs & DMA_ATTR_REQUIRE_COHERENT))
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 335e27bc1e1f..b5960c2e98d8 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -1697,7 +1697,7 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
>  	else
>  		dma_addr = phys_to_dma_encrypted(dev, swiotlb_addr);
>  
> -	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
> +	if (unlikely(!dma_capable(dev, dma_addr, size, true, attrs))) {
>  		__swiotlb_tbl_unmap_single(dev, swiotlb_addr, size, dir,
>  			attrs | DMA_ATTR_SKIP_CPU_SYNC,
>  			swiotlb_find_pool(dev, swiotlb_addr));
> -- 
> 2.43.0
> 

