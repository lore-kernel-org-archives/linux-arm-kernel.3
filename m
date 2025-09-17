Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3E6CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 10:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhTDMGA3joIX+sHVeuhZFv3kyUkWMK2MaklJfiHDBOY=; b=wNec+KyXOL6E0QP4dJ9le7G3PX
	co0/yFR2tSM+ORkmu8ZWQSUR3D0oFAvI56weNJsSAUWqQcvKRXjDBwrVl4hHVZGjQpV8uCn0oCDS2
	s/MW01xWnk+rbIslBdWe8Jr9aCB1coDfjIyj3PuKk8B8oSDD2uJF6ZnytasDtp2rJOEO5KAcWZfNA
	Eo9kJ8iZPLCVo+vyouUaRVQSZSwwB8d62+lfY8uDdY+wBACLB56Px12Wwmkz8mAs+1eWUjiFe9KZ6
	0kowlwNyBzVeWsq8z1qqa1SOYQr3z6GaOC+swgCGJrJNCXybxvMN/k/mtHyblbxDUDJXEaVNDb64k
	7D0A4psA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypWt-0000000B0PX-1GAH;
	Wed, 17 Sep 2025 10:36:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypWr-0000000B0P1-3pcL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 10:36:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B96DD4432D;
	Wed, 17 Sep 2025 10:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2481FC4CEFC;
	Wed, 17 Sep 2025 10:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758105408;
	bh=9+CfYEPcX9RBMZk8bYI4Kxv/QQTIj2Zq3577UGdLueI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QCefrIWDpyeDN3tXCB94u2Q5MHcY4yejTjtLsnQVEmKCthEh6xZgfJLbg0LQHPSrA
	 nSRFKqERWoVpqSJRGh2DasAyTzco1FZJiQ6RV8TxkrkGc6jukqP6yo3IsgptEsd7b9
	 ZPjqCne7q7h0dMm/687O7OdUOK4Sx3X1cX5N7PnoEz1D4z93ewUSVpM6AJLAoz+qLQ
	 tB4jan9ZQqw8jp1Mp9F67+yZRi2ivSd+Xs5sHJOxM1s9jbSS2eGenOP4oD7vtFmg2P
	 7UnjEMEaBp8ZKfTszdcjLZOf2Ezycnw6joQfJW/BWvhcuIOSFMdO0eAw/bx6/+U2Of
	 FAOvNCNFqe7QQ==
Date: Wed, 17 Sep 2025 13:36:44 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 3/4] ARM: dma-mapping: Switch to physical address
 mapping callbacks
Message-ID: <20250917103644.GB6464@unreal>
References: <cover.1758006942.git.leon@kernel.org>
 <5f96e44b1fb5d92a6a5f25fc9148a733a1a53b9d.1758006942.git.leon@kernel.org>
 <20250916184617.GW1086830@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916184617.GW1086830@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_033649_993638_DB944794 
X-CRM114-Status: GOOD (  22.48  )
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

On Tue, Sep 16, 2025 at 03:46:17PM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 16, 2025 at 10:32:06AM +0300, Leon Romanovsky wrote:
> > +	if (!dev->dma_coherent &&
> > +	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
> > +		__dma_page_cpu_to_dev(phys_to_page(phys), offset, size, dir);
> 
> I'd keep going and get rid of the page here too, maybe as a second
> patch in this series:

Thanks, it is always unclear how far to go with cleanups.

> 
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index 88c2d68a69c9ee..a84d12cd0ba4a9 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -624,16 +624,14 @@ static void __arm_dma_free(struct device *dev, size_t size, void *cpu_addr,
>  	kfree(buf);
>  }
>  
> -static void dma_cache_maint_page(struct page *page, unsigned long offset,
> +static void dma_cache_maint_page(phys_addr_t paddr,
>  	size_t size, enum dma_data_direction dir,
>  	void (*op)(const void *, size_t, int))
>  {
> -	unsigned long pfn;
> +	unsigned long pfn = paddr / PAGE_SIZE;
> +	unsigned int offset = paddr % PAGE_SIZE;
>  	size_t left = size;
>  
> -	pfn = page_to_pfn(page) + offset / PAGE_SIZE;
> -	offset %= PAGE_SIZE;
> -
>  	/*
>  	 * A single sg entry may refer to multiple physically contiguous
>  	 * pages.  But we still need to process highmem pages individually.
> @@ -644,17 +642,17 @@ static void dma_cache_maint_page(struct page *page, unsigned long offset,
>  		size_t len = left;
>  		void *vaddr;
>  
> -		page = pfn_to_page(pfn);
> -
> -		if (PageHighMem(page)) {
> +		if (PhysHighMem(pfn << PAGE_SHIFT)) {
>  			if (len + offset > PAGE_SIZE)
>  				len = PAGE_SIZE - offset;
>  
>  			if (cache_is_vipt_nonaliasing()) {
> -				vaddr = kmap_atomic(page);
> +				vaddr = kmap_atomic_pfn(pfn);
>  				op(vaddr + offset, len, dir);
>  				kunmap_atomic(vaddr);
>  			} else {
> +				struct page *page = pfn_to_page(pfn);
> +
>  				vaddr = kmap_high_get(page);
>  				if (vaddr) {
>  					op(vaddr + offset, len, dir);
> @@ -662,7 +660,7 @@ static void dma_cache_maint_page(struct page *page, unsigned long offset,
>  				}
>  			}
>  		} else {
> -			vaddr = page_address(page) + offset;
> +			vaddr = phys_to_virt(pfn) + offset;
>  			op(vaddr, len, dir);
>  		}
>  		offset = 0;
> @@ -676,14 +674,11 @@ static void dma_cache_maint_page(struct page *page, unsigned long offset,
>   * Note: Drivers should NOT use this function directly.
>   * Use the driver DMA support - see dma-mapping.h (dma_sync_*)
>   */
> -static void __dma_page_cpu_to_dev(struct page *page, unsigned long off,
> +static void __dma_page_cpu_to_dev(phys_addr_t paddr,
>  	size_t size, enum dma_data_direction dir)
>  {
> -	phys_addr_t paddr;
> +	dma_cache_maint_page(paddr, size, dir, dmac_map_area);
>  
> -	dma_cache_maint_page(page, off, size, dir, dmac_map_area);
> -
> -	paddr = page_to_phys(page) + off;
>  	if (dir == DMA_FROM_DEVICE) {
>  		outer_inv_range(paddr, paddr + size);
>  	} else {
> 
> > +	if (!dev->dma_coherent &&
> > +	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
> >  		page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
> >  		__dma_page_dev_to_cpu(page, offset, size, dir);
> 
> Same treatment here..
> 
> Looks Ok though, I didn't notice any pitfalls
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Jason
> 

