Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792EBCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 14:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPktgwoU4d02NAyObkW/YkTJGCpEY2Svs/Yqm0svHPU=; b=zlf4C0eYZQO5VUDIhFX+88Mkul
	wYtHfjySBSLFcfF528TUPvDx7a6wTTs+AR4Romkz3JNoF22Kw+2hAB+1n/JTRaimgtrl6Iw3E54ku
	/SBSRKAcPomFO2tDyTWoQESsDV3XNEf3LK+W70/WLAdyyrA6dJwGl95Gq+ZLldCbAnLt7/fo4OSKS
	Phots1/RXbflytlRI67VC1o0QbBEofXKRf1KdJ+uKWIAfnpwsq44J7d3RKzm1PTnxDdg9Epz/b7Jv
	1sEg9XeLWSzOLJ3k/UE/8NfpyrKVVmkukST7k/AWO5hFDSuK5+buhufHw3vJXV2tyf6EAwFsjketI
	mt52sIZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAYa-00000002vIi-3IdM;
	Wed, 13 May 2026 14:27:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAYX-00000002vHv-23Oi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 14:27:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4891b4934ffso1505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 07:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778682444; x=1779287244; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xPktgwoU4d02NAyObkW/YkTJGCpEY2Svs/Yqm0svHPU=;
        b=Pa+31fsiE8+Du4Ik1URVgsK9uUXrfvmq0QzXvJA/7B+8irUC0aGWEDpEE1HlVYqvIC
         gqOKznPpaJR7U08S07m5dIQpxH4D2PX2y+g0G3K+qij5FWg1XM6nVQwfdrEghxTTiuFD
         roM0SpPzPBmEohxUvdnK6W3563c92rfbOrRUCvHarwzrrztweOIoa4JrGjbciKVyasI9
         pTwrwKGldRe5Q0tEjm3T6doozEE7oTPV9RyUEAFchEAEWh7ds3DJxrA8ZJxd9b68Wcfy
         wGTHzIdscrMXYSe4Pj15gbbesGA+O1+fxI9Z99rC8oRMPpXZx1ssZTeWT1XMCmt93t4o
         NvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682444; x=1779287244;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPktgwoU4d02NAyObkW/YkTJGCpEY2Svs/Yqm0svHPU=;
        b=rvcax7v2G7i0SKBgw6iJBGASl4uS13s54qA0PXQYqEQtC7qeQZE7MjsMsDBoBmivDm
         1m3u2xMpAMUELauBCNwAPoKFhKX3qpLQTWrDdXkGtkRrf+bbJuyhY/CSZ51loBRxFowm
         naBMowH5Vi00pGXaso0E1i/f3MsS2zEMuWuO+s48/8wqn06iPGYlRJdtbQ+iDIYK79Dy
         iQxk8S/+20eYRY1dfK549RCyx2UlATeQFAuoyz+OwRKsHGWO3V1au4aJzHBoxGcc3fnI
         Ed2sBE/H4iZmyQCJIa7l2SwlhppCdt0zp/d2MRLjvwI+I1Frab1xRxQRUsOOsO4sNP4f
         RgIw==
X-Forwarded-Encrypted: i=1; AFNElJ93DyoVVgo8MalaxxeYfg4wXtHagOksUggEpS6j5RLVEzY5HiNPBEai9Fj1XZAUCs87qsr/qf+0t/sRDFjp7ay8@lists.infradead.org
X-Gm-Message-State: AOJu0YxVh3559+04ISq9CKliV7NiclemrxTaU6CNvgLPiv5ivKHpLQrQ
	Ab+3WMtY372iRUrPMKvlzTCc/qFEZEe97j6fqWNwcF2/XQOyMhxEVDVd23cIm7oxUQ==
X-Gm-Gg: Acq92OFDPVyO4u5fHkiD2oYGu0+nEwLUPqoTWR1Y3chsCh5NBkuPyFGd5CHWHNaIWDN
	HP0VZ8CBucABh/NUaEPPzhm5RUFv1W9U/d/IJ724jleIin+B0k6ASxvBFA42iY0/3wRESTAFB1h
	gfAbrRJwjcOM4bmHIc26hBoQncQnElk9C8Jp0/BPMfEWe2iqcyw2eI6UvPiQAGBxyTil24QHbj9
	Kx11kxRog/Ngi+qPom2eQ9x53WjfcqEGKAJZyPKOYu0wHYTx9xT+NyIGBqeiAmiAkYj35QRtjFk
	nFsjV0Ehh2VGBak9lenFTEBM6YEGmA3ylfZpu0zCxZ1NHRsUaIX9s+dkv+XBo3wFuCWVgV0jqRe
	mMJvU/DECjVIxih1P8NCeZ39b2vJNjVIh5NszhDN2HufsHOG7/jokD2iEquhC91QegZCI2ZrvT2
	Ydkblt54/MjcBhpU7RpI8gphz3cVGgjDUzgbHcBfrzzyGOb2fI2hSdq9wCP9xz//pcE1o=
X-Received: by 2002:a05:600c:694:b0:489:1f6a:4ac0 with SMTP id 5b1f17b1804b1-48fc90e57famr722265e9.0.1778682442946;
        Wed, 13 May 2026 07:27:22 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e7491edsm45411285e9.13.2026.05.13.07.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:27:22 -0700 (PDT)
Date: Wed, 13 May 2026 14:27:14 +0000
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <agSKQrSIhizCXKwx@google.com>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260512090408.794195-5-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_072725_690972_F87B28DA 
X-CRM114-Status: GOOD (  36.66  )
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

On Tue, May 12, 2026 at 02:33:59PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Teach swiotlb to distinguish between encrypted and decrypted bounce
> buffer pools, and make allocation and mapping paths select a pool whose
> state matches the requested DMA attributes.
> 
> Add a decrypted flag to io_tlb_mem, initialize it for the default and
> restricted pools, and propagate DMA_ATTR_CC_SHARED into swiotlb pool
> allocation. Reject swiotlb alloc/map requests when the selected pool does
> not match the required encrypted/decrypted state.
> 
> Also return DMA addresses with the matching phys_to_dma_{encrypted,
> unencrypted} helper so the DMA address encoding stays consistent with the
> chosen pool.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  include/linux/dma-direct.h |  10 ++++
>  include/linux/swiotlb.h    |   8 ++-
>  kernel/dma/direct.c        |  14 +++--
>  kernel/dma/swiotlb.c       | 108 +++++++++++++++++++++++++++----------
>  4 files changed, 107 insertions(+), 33 deletions(-)
> 
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index c249912456f9..94fad4e7c11e 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -77,6 +77,10 @@ static inline dma_addr_t dma_range_map_max(const struct bus_dma_region *map)
>  #ifndef phys_to_dma_unencrypted
>  #define phys_to_dma_unencrypted		phys_to_dma
>  #endif
> +
> +#ifndef phys_to_dma_encrypted
> +#define phys_to_dma_encrypted		phys_to_dma
> +#endif
>  #else
>  static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>  {
> @@ -90,6 +94,12 @@ static inline dma_addr_t phys_to_dma_unencrypted(struct device *dev,
>  {
>  	return dma_addr_unencrypted(__phys_to_dma(dev, paddr));
>  }
> +
> +static inline dma_addr_t phys_to_dma_encrypted(struct device *dev,
> +		phys_addr_t paddr)
> +{
> +	return dma_addr_encrypted(__phys_to_dma(dev, paddr));
> +}
>  /*
>   * If memory encryption is supported, phys_to_dma will set the memory encryption
>   * bit in the DMA address, and dma_to_phys will clear it.
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 3dae0f592063..b3fa3c6e0169 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -81,6 +81,7 @@ struct io_tlb_pool {
>  	struct list_head node;
>  	struct rcu_head rcu;
>  	bool transient;
> +	bool unencrypted;
>  #endif
>  };
>  
> @@ -111,6 +112,7 @@ struct io_tlb_mem {
>  	struct dentry *debugfs;
>  	bool force_bounce;
>  	bool for_alloc;
> +	bool unencrypted;
>  #ifdef CONFIG_SWIOTLB_DYNAMIC
>  	bool can_grow;
>  	u64 phys_limit;
> @@ -282,7 +284,8 @@ static inline void swiotlb_sync_single_for_cpu(struct device *dev,
>  extern void swiotlb_print_info(void);
>  
>  #ifdef CONFIG_DMA_RESTRICTED_POOL
> -struct page *swiotlb_alloc(struct device *dev, size_t size);
> +struct page *swiotlb_alloc(struct device *dev, size_t size,
> +		unsigned long attrs);
>  bool swiotlb_free(struct device *dev, struct page *page, size_t size);
>  
>  static inline bool is_swiotlb_for_alloc(struct device *dev)
> @@ -290,7 +293,8 @@ static inline bool is_swiotlb_for_alloc(struct device *dev)
>  	return dev->dma_io_tlb_mem->for_alloc;
>  }
>  #else
> -static inline struct page *swiotlb_alloc(struct device *dev, size_t size)
> +static inline struct page *swiotlb_alloc(struct device *dev, size_t size,
> +		unsigned long attrs)
>  {
>  	return NULL;
>  }
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index dc2907439b3d..97ae4fa10521 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -104,9 +104,10 @@ static void __dma_direct_free_pages(struct device *dev, struct page *page,
>  	dma_free_contiguous(dev, page, size);
>  }
>  
> -static struct page *dma_direct_alloc_swiotlb(struct device *dev, size_t size)
> +static struct page *dma_direct_alloc_swiotlb(struct device *dev, size_t size,
> +		unsigned long attrs)
>  {
> -	struct page *page = swiotlb_alloc(dev, size);
> +	struct page *page = swiotlb_alloc(dev, size, attrs);
>  
>  	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
>  		swiotlb_free(dev, page, size);
> @@ -266,8 +267,12 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  						  gfp, attrs);
>  
>  	if (is_swiotlb_for_alloc(dev)) {
> -		page = dma_direct_alloc_swiotlb(dev, size);
> +		page = dma_direct_alloc_swiotlb(dev, size, attrs);
>  		if (page) {
> +			/*
> +			 * swiotlb allocations comes from pool already marked
> +			 * decrypted
> +			 */
>  			mark_mem_decrypt = false;
>  			goto setup_page;
>  		}
> @@ -374,6 +379,7 @@ void dma_direct_free(struct device *dev, size_t size,
>  		return;
>  
>  	if (swiotlb_find_pool(dev, dma_to_phys(dev, dma_addr)))
> +		/* Swiotlb doesn't need a page attribute update on free */
>  		mark_mem_encrypted = false;
>  
>  	if (is_vmalloc_addr(cpu_addr)) {
> @@ -403,7 +409,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  						  gfp, attrs);
>  
>  	if (is_swiotlb_for_alloc(dev)) {
> -		page = dma_direct_alloc_swiotlb(dev, size);
> +		page = dma_direct_alloc_swiotlb(dev, size, attrs);
>  		if (!page)
>  			return NULL;
>  
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index ab4eccbaa076..065663be282c 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -259,10 +259,21 @@ void __init swiotlb_update_mem_attributes(void)
>  	struct io_tlb_pool *mem = &io_tlb_default_mem.defpool;
>  	unsigned long bytes;
>  
> +	/*
> +	 * if platform support memory encryption, swiotlb buffers are
> +	 * decrypted by default.
> +	 */
> +	if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
> +		io_tlb_default_mem.unencrypted = true;
> +	else
> +		io_tlb_default_mem.unencrypted = false;
> +
>  	if (!mem->nslabs || mem->late_alloc)
>  		return;
>  	bytes = PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT);
> -	set_memory_decrypted((unsigned long)mem->vaddr, bytes >> PAGE_SHIFT);
> +
> +	if (io_tlb_default_mem.unencrypted)
> +		set_memory_decrypted((unsigned long)mem->vaddr, bytes >> PAGE_SHIFT);
>  }
>  
>  static void swiotlb_init_io_tlb_pool(struct io_tlb_pool *mem, phys_addr_t start,
> @@ -505,8 +516,10 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  	if (!mem->slots)
>  		goto error_slots;
>  
> -	set_memory_decrypted((unsigned long)vstart,
> -			     (nslabs << IO_TLB_SHIFT) >> PAGE_SHIFT);
> +	if (io_tlb_default_mem.unencrypted)
> +		set_memory_decrypted((unsigned long)vstart,
> +				     (nslabs << IO_TLB_SHIFT) >> PAGE_SHIFT);
> +
>  	swiotlb_init_io_tlb_pool(mem, virt_to_phys(vstart), nslabs, true,
>  				 nareas);
>  	add_mem_pool(&io_tlb_default_mem, mem);
> @@ -539,7 +552,9 @@ void __init swiotlb_exit(void)
>  	tbl_size = PAGE_ALIGN(mem->end - mem->start);
>  	slots_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), mem->nslabs));
>  
> -	set_memory_encrypted(tbl_vaddr, tbl_size >> PAGE_SHIFT);
> +	if (io_tlb_default_mem.unencrypted)
> +		set_memory_encrypted(tbl_vaddr, tbl_size >> PAGE_SHIFT);
> +
>  	if (mem->late_alloc) {
>  		area_order = get_order(array_size(sizeof(*mem->areas),
>  			mem->nareas));
> @@ -563,6 +578,7 @@ void __init swiotlb_exit(void)
>   * @gfp:	GFP flags for the allocation.
>   * @bytes:	Size of the buffer.
>   * @phys_limit:	Maximum allowed physical address of the buffer.
> + * @unencrypted: true to allocate unencrypted memory, false for encrypted memory
>   *
>   * Allocate pages from the buddy allocator. If successful, make the allocated
>   * pages decrypted that they can be used for DMA.
> @@ -570,7 +586,8 @@ void __init swiotlb_exit(void)
>   * Return: Decrypted pages, %NULL on allocation failure, or ERR_PTR(-EAGAIN)
>   * if the allocated physical address was above @phys_limit.
>   */
> -static struct page *alloc_dma_pages(gfp_t gfp, size_t bytes, u64 phys_limit)
> +static struct page *alloc_dma_pages(gfp_t gfp, size_t bytes,
> +		u64 phys_limit, bool unencrypted)
>  {
>  	unsigned int order = get_order(bytes);
>  	struct page *page;
> @@ -588,13 +605,13 @@ static struct page *alloc_dma_pages(gfp_t gfp, size_t bytes, u64 phys_limit)
>  	}
>  
>  	vaddr = phys_to_virt(paddr);
> -	if (set_memory_decrypted((unsigned long)vaddr, PFN_UP(bytes)))
> +	if (unencrypted && set_memory_decrypted((unsigned long)vaddr, PFN_UP(bytes)))
>  		goto error;
>  	return page;
>  
>  error:
>  	/* Intentional leak if pages cannot be encrypted again. */
> -	if (!set_memory_encrypted((unsigned long)vaddr, PFN_UP(bytes)))
> +	if (unencrypted && !set_memory_encrypted((unsigned long)vaddr, PFN_UP(bytes)))
>  		__free_pages(page, order);
>  	return NULL;
>  }
> @@ -604,30 +621,26 @@ static struct page *alloc_dma_pages(gfp_t gfp, size_t bytes, u64 phys_limit)
>   * @dev:	Device for which a memory pool is allocated.
>   * @bytes:	Size of the buffer.
>   * @phys_limit:	Maximum allowed physical address of the buffer.
> + * @attrs:	DMA attributes for the allocation.
>   * @gfp:	GFP flags for the allocation.
>   *
>   * Return: Allocated pages, or %NULL on allocation failure.
>   */
>  static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
> -		u64 phys_limit, gfp_t gfp)
> +		u64 phys_limit, unsigned long attrs, gfp_t gfp)
>  {
>  	struct page *page;
> -	unsigned long attrs = 0;
>  
>  	/*
>  	 * Allocate from the atomic pools if memory is encrypted and
>  	 * the allocation is atomic, because decrypting may block.
>  	 */
> -	if (!gfpflags_allow_blocking(gfp) && dev && force_dma_unencrypted(dev)) {
> +	if (!gfpflags_allow_blocking(gfp) && (attrs & DMA_ATTR_CC_SHARED)) {
>  		void *vaddr;
>  
>  		if (!IS_ENABLED(CONFIG_DMA_COHERENT_POOL))
>  			return NULL;
>  
> -		/* swiotlb considered decrypted by default */
> -		if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
> -			attrs = DMA_ATTR_CC_SHARED;
> -
>  		return dma_alloc_from_pool(dev, bytes, &vaddr, gfp,
>  					   attrs, dma_coherent_ok);
>  	}
> @@ -638,7 +651,8 @@ static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
>  	else if (phys_limit <= DMA_BIT_MASK(32))
>  		gfp |= __GFP_DMA32;
>  
> -	while (IS_ERR(page = alloc_dma_pages(gfp, bytes, phys_limit))) {
> +	while (IS_ERR(page = alloc_dma_pages(gfp, bytes, phys_limit,
> +					     !!(attrs & DMA_ATTR_CC_SHARED)))) {
>  		if (IS_ENABLED(CONFIG_ZONE_DMA32) &&
>  		    phys_limit < DMA_BIT_MASK(64) &&
>  		    !(gfp & (__GFP_DMA32 | __GFP_DMA)))
> @@ -657,15 +671,18 @@ static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
>   * swiotlb_free_tlb() - free a dynamically allocated IO TLB buffer
>   * @vaddr:	Virtual address of the buffer.
>   * @bytes:	Size of the buffer.
> + * @unencrypted: true if @vaddr was allocated decrypted and must be
> + *	re-encrypted before being freed
>   */
> -static void swiotlb_free_tlb(void *vaddr, size_t bytes)
> +static void swiotlb_free_tlb(void *vaddr, size_t bytes, bool unencrypted)
>  {
>  	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
>  	    dma_free_from_pool(NULL, vaddr, bytes))
>  		return;
>  
>  	/* Intentional leak if pages cannot be encrypted again. */
> -	if (!set_memory_encrypted((unsigned long)vaddr, PFN_UP(bytes)))
> +	if (!unencrypted ||
> +	    !set_memory_encrypted((unsigned long)vaddr, PFN_UP(bytes)))
>  		__free_pages(virt_to_page(vaddr), get_order(bytes));
>  }
>  
> @@ -676,6 +693,7 @@ static void swiotlb_free_tlb(void *vaddr, size_t bytes)
>   * @nslabs:	Desired (maximum) number of slabs.
>   * @nareas:	Number of areas.
>   * @phys_limit:	Maximum DMA buffer physical address.
> + * @attrs:	DMA attributes for the allocation.
>   * @gfp:	GFP flags for the allocations.
>   *
>   * Allocate and initialize a new IO TLB memory pool. The actual number of
> @@ -686,7 +704,8 @@ static void swiotlb_free_tlb(void *vaddr, size_t bytes)
>   */
>  static struct io_tlb_pool *swiotlb_alloc_pool(struct device *dev,
>  		unsigned long minslabs, unsigned long nslabs,
> -		unsigned int nareas, u64 phys_limit, gfp_t gfp)
> +		unsigned int nareas, u64 phys_limit, unsigned long attrs,
> +		gfp_t gfp)
>  {
>  	struct io_tlb_pool *pool;
>  	unsigned int slot_order;
> @@ -704,9 +723,10 @@ static struct io_tlb_pool *swiotlb_alloc_pool(struct device *dev,
>  	if (!pool)
>  		goto error;
>  	pool->areas = (void *)pool + sizeof(*pool);
> +	pool->unencrypted = !!(attrs & DMA_ATTR_CC_SHARED);
>  
>  	tlb_size = nslabs << IO_TLB_SHIFT;
> -	while (!(tlb = swiotlb_alloc_tlb(dev, tlb_size, phys_limit, gfp))) {
> +	while (!(tlb = swiotlb_alloc_tlb(dev, tlb_size, phys_limit, attrs, gfp))) {
>  		if (nslabs <= minslabs)
>  			goto error_tlb;
>  		nslabs = ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
> @@ -724,7 +744,8 @@ static struct io_tlb_pool *swiotlb_alloc_pool(struct device *dev,
>  	return pool;
>  
>  error_slots:
> -	swiotlb_free_tlb(page_address(tlb), tlb_size);
> +	swiotlb_free_tlb(page_address(tlb), tlb_size,
> +			 !!(attrs & DMA_ATTR_CC_SHARED));
>  error_tlb:
>  	kfree(pool);
>  error:
> @@ -742,7 +763,9 @@ static void swiotlb_dyn_alloc(struct work_struct *work)
>  	struct io_tlb_pool *pool;
>  
>  	pool = swiotlb_alloc_pool(NULL, IO_TLB_MIN_SLABS, default_nslabs,
> -				  default_nareas, mem->phys_limit, GFP_KERNEL);
> +				  default_nareas, mem->phys_limit,
> +				  mem->unencrypted ? DMA_ATTR_CC_SHARED : 0,
> +				  GFP_KERNEL);
>  	if (!pool) {
>  		pr_warn_ratelimited("Failed to allocate new pool");
>  		return;
> @@ -762,7 +785,7 @@ static void swiotlb_dyn_free(struct rcu_head *rcu)
>  	size_t tlb_size = pool->end - pool->start;
>  
>  	free_pages((unsigned long)pool->slots, get_order(slots_size));
> -	swiotlb_free_tlb(pool->vaddr, tlb_size);
> +	swiotlb_free_tlb(pool->vaddr, tlb_size, pool->unencrypted);
>  	kfree(pool);
>  }
>  
> @@ -1232,6 +1255,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
>  	nslabs = nr_slots(alloc_size);
>  	phys_limit = min_not_zero(*dev->dma_mask, dev->bus_dma_limit);
>  	pool = swiotlb_alloc_pool(dev, nslabs, nslabs, 1, phys_limit,
> +				  mem->unencrypted ? DMA_ATTR_CC_SHARED : 0,
>  				  GFP_NOWAIT);
>  	if (!pool)
>  		return -1;
> @@ -1394,6 +1418,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
>  		enum dma_data_direction dir, unsigned long attrs)
>  {
>  	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
> +	bool require_decrypted = false;
>  	unsigned int offset;
>  	struct io_tlb_pool *pool;
>  	unsigned int i;
> @@ -1411,6 +1436,16 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
>  	if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
>  		pr_warn_once("Memory encryption is active and system is using DMA bounce buffers\n");
>  
> +	/*
> +	 * if we are trying to swiotlb map a decrypted paddr or the paddr is encrypted
> +	 * but the device is forcing decryption, use decrypted io_tlb_mem
> +	 */
> +	if ((attrs & DMA_ATTR_CC_SHARED) || force_dma_unencrypted(dev))
> +		require_decrypted = true;
> +
> +	if (require_decrypted != mem->unencrypted)
> +		return (phys_addr_t)DMA_MAPPING_ERROR;
> +
>  	/*
>  	 * The default swiotlb memory pool is allocated with PAGE_SIZE
>  	 * alignment. If a mapping is requested with larger alignment,
> @@ -1608,8 +1643,14 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
>  	if (swiotlb_addr == (phys_addr_t)DMA_MAPPING_ERROR)
>  		return DMA_MAPPING_ERROR;
>  
> -	/* Ensure that the address returned is DMA'ble */
> -	dma_addr = phys_to_dma_unencrypted(dev, swiotlb_addr);
> +	/*
> +	 * Use the allocated io_tlb_mem encryption type to determine dma addr.
> +	 */
> +	if (dev->dma_io_tlb_mem->unencrypted)
> +		dma_addr = phys_to_dma_unencrypted(dev, swiotlb_addr);
> +	else
> +		dma_addr = phys_to_dma_encrypted(dev, swiotlb_addr);
> +
>  	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
>  		__swiotlb_tbl_unmap_single(dev, swiotlb_addr, size, dir,
>  			attrs | DMA_ATTR_SKIP_CPU_SYNC,
> @@ -1773,7 +1814,8 @@ static inline void swiotlb_create_debugfs_files(struct io_tlb_mem *mem,
>  
>  #ifdef CONFIG_DMA_RESTRICTED_POOL
>  
> -struct page *swiotlb_alloc(struct device *dev, size_t size)
> +struct page *swiotlb_alloc(struct device *dev, size_t size,
> +		unsigned long attrs)
>  {
>  	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>  	struct io_tlb_pool *pool;
> @@ -1784,6 +1826,9 @@ struct page *swiotlb_alloc(struct device *dev, size_t size)
>  	if (!mem)
>  		return NULL;
>  
> +	if (mem->unencrypted != !!(attrs & DMA_ATTR_CC_SHARED))
> +		return NULL;
> +
>  	align = (1 << (get_order(size) + PAGE_SHIFT)) - 1;
>  	index = swiotlb_find_slots(dev, 0, size, align, &pool);
>  	if (index == -1)
> @@ -1853,9 +1898,18 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
>  			kfree(mem);
>  			return -ENOMEM;
>  		}
> +		/*
> +		 * if platform supports memory encryption,
> +		 * restricted mem pool is decrypted by default
> +		 */
> +		if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
> +			mem->unencrypted = true;
> +			set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
> +					     rmem->size >> PAGE_SHIFT);
> +		} else {
> +			mem->unencrypted = false;
> +		}

This breaks pKVM as it doesn’t set CC_ATTR_MEM_ENCRYPT, so all virtio
traffic now fails.

Also, by design, some drivers are clueless about bouncing, so
I believe that the pool should have a way to control it’s property
(encrypted or decrypted) and that takes priority over whatever
attributes comes from allocation.
And that brings us to the same point whether it’s better to return
the memory along with it’s state or we pass the requested state.
I think for other cases it’s fine for the device/DMA-API to dictate
the attrs, but not in restricted-dma case, the firmware just knows better.

Thanks,
Mostafa

>  
> -		set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
> -				     rmem->size >> PAGE_SHIFT);
>  		swiotlb_init_io_tlb_pool(pool, rmem->base, nslabs,
>  					 false, nareas);
>  		mem->force_bounce = true;
> -- 
> 2.43.0
> 

