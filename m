Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94225CD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LapnW6RyijtMlBbcLjGQ51I+00mOkKRbnIVzAqqw2OE=; b=GuUovF/bCGX5no3EZ3muofIgmt
	ZaUBzeP4KCeaRfF3f6DLURkttuMwLq5f+B0HD9fO2TJDzlUjH6ohpPwXJYTPS5PsAst0AnmCJ5ys9
	C7eqalDsB2tTq4RqLfx6Hb2IYg/0AkFbxF6Wck3AMQsMfq5meSgwO4LlN6CikzfAjGAMHPfe3stmI
	iXl8rFyUlpTKSTIRPoHoa73JS9SvskIsdS+GbQbzwcmlGBAdnteyn0Pq6XOxiK54IzkRgd7C5uFjF
	RP/IWdhGA5qE9yrUAILpmcTwZTFKrJf1VhE6JGR6ryNjLU2g00QXH/+Mri4OWKtlU2eKlpqzQ1I3M
	J2NV41rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwgu-00000005gZN-0i82;
	Tue, 09 Jun 2026 13:40:28 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwgo-00000005gYw-443w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:40:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490a767521dso6144655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781012421; x=1781617221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LapnW6RyijtMlBbcLjGQ51I+00mOkKRbnIVzAqqw2OE=;
        b=BuB+hhCLF/sJZCCjKDNuDgM49VI/Ws3sSTZWDK8K1PSdyNXoWrsJwoKw9Zv35cfjvX
         EQ6/nnFHfYElJCRrkdBNmk4gkokzlFof6iRjtRXR7hWT+VGMC4hA2NkPqg2u0T4doWeV
         1RF6M36/7zqlCk6Saj6T1xBUrsPGPSe7olkceF63VNs0pUM9ICzEUxfJgSRZ2kjBXBt/
         j6jlogqpymg8KSfcpEZKdGPla665aUslyuYa8hizqpG08YD5OTjrx0nfBT0z/jGr74th
         K5S//A5eIMuS1vv8yydtDbf2zxZrHLX68Jc8pFnTkjnhz3F7rjSOJFC8K4Poj/Po4cZN
         vT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012421; x=1781617221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LapnW6RyijtMlBbcLjGQ51I+00mOkKRbnIVzAqqw2OE=;
        b=AbieY7AirdqocNRtOzJBxW5cXUD5Z4FeD4PJfscnWInw9wwtp1AX5oiKEp3gAXbjTa
         B5WU1sfjJYjDw6ywnneu0qn73BuoFcB/RTeQ3g6U8CLzuCeGdiHL20D008vq9iGLDVR0
         DHbj1kVBFF9GWbGieDI+WjCYGHpQ6jIcyEL81jUylObLRf6TXY+kyqD4MRiur8A6a8cf
         Kx++MvPpUKB6X91eRT18oP3y+KQ4FMYDgcCq+GzfE0cEDfdekRTlPUb24i4pc3vfAzti
         5B8IIhVi43yF6W7faEsYEhlpwm6j29rlzuSXiGTTvm/tAslE1Ne4BcYeDtdCGjv7QKBS
         pHfw==
X-Forwarded-Encrypted: i=1; AFNElJ/1AgiT0LLdEOefph6pAu0ZMNCFjjIg4IE4+ug6qfOI7n4kLsGOeQf5U1fzgW0cFdiAKxbmg8vd/dCNVcvSs3d5@lists.infradead.org
X-Gm-Message-State: AOJu0YwpxAf2cbZW4qGhIlMBOgTa9r7kGQ9ddYTDzH7UTH0Uly+W3tZb
	qpZqDEnJQRzIP0npghDvMzhKHujLk3OxgxD6czxC7KOznguDcU2FzACEuXd5nAklkG0=
X-Gm-Gg: Acq92OGIjVkk6WQpZccUQIu1N5KYBRTU1x1XMr4loyE/X9g+sAr5QplSqwEPfjBe0zV
	YNJv3TBjwgnrE8Q6oSWGoNSnBoNwFARZhHXdjNMLMQH2R6pZLkK7Lvhv7803bFJankD4ftytqsg
	ogA7nKW2O05aylBIo2BhwAgr2B/fGSs/H3fm0SxM4ycwCqADZYDPETHtQxzN2JKXPPuBbf/olM/
	r0tUxblDlfIR87w7IoE+lD1ItnBRVbzthGf7ggYxU2mk1QRHnIj8NPkHk/5vB9dbst7gp0HgEGj
	l1h8+CusZb2Jxf3+b19DBGorzSznBzIpDcfQ20JawWgedvWCUKAmmN2iF677VuZEI8DiAvtVGdy
	0XsMnewI+zNkxKuFjAIHD6d0qJTGcL88YrXjtPOroaTGh2DvgGaSKcuRh5Xz5l69AgaryIohJ4M
	fjYguiud5FuUqqFAHCNZ9idcWWChoiCW/uJw==
X-Received: by 2002:a05:600c:8b82:b0:490:abf1:2ddb with SMTP id 5b1f17b1804b1-490c2603825mr146744795e9.6.1781012421133;
        Tue, 09 Jun 2026 06:40:21 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm68263785f8f.5.2026.06.09.06.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:40:20 -0700 (PDT)
Date: Tue, 9 Jun 2026 15:40:18 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, Robin Murphy
 <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Will
 Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Steven Price
 <steven.price@arm.com>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>, Jason
 Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Alexey
 Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, Xu
 Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, x86@kernel.org, Michael Kelley
 <mhklinux@outlook.com>
Subject: Re: [PATCH v6 19/20] swiotlb: Preserve allocation virtual address
 for dynamic pools
Message-ID: <20260609154018.554e5448@mordecai>
In-Reply-To: <20260604083959.1265923-20-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-20-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_064024_769373_773ADC0A 
X-CRM114-Status: GOOD (  27.06  )
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

On Thu,  4 Jun 2026 14:09:58 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> swiotlb_alloc_tlb() can allocate from the DMA atomic pool when a decrypted
> pool is needed from atomic context. With CONFIG_DMA_DIRECT_REMAP, the
> atomic pool is backed by remapped virtual addresses, which are not the same
> as the direct-map addresses returned by phys_to_virt().
> 
> swiotlb_init_io_tlb_pool() currently reconstructs the pool virtual address
> from the physical start address. For atomic-pool backed allocations this
> stores the wrong address in pool->vaddr. Later, swiotlb_free_tlb() passes
> that address to dma_free_from_pool(), which will fail to recognize the
> chunk
> 
> Pass the virtual address returned by the allocation path into
> swiotlb_init_io_tlb_pool(), and store that address in pool->vaddr. This
> keeps the pool free path using the same virtual address as the allocator.
> 
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Hm, so the old code was broken; you may want to add:

Fixes: 79636caad361 ("swiotlb: if swiotlb is full, fall back to a transient memory pool")

And of course:

Reviewed-by: Petr Tesarik <ptesarik@suse.com>

Thank you!
Petr T

> ---
>  kernel/dma/swiotlb.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 14d834ca298b..e4bd8c9eaeda 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -302,9 +302,9 @@ void __init swiotlb_update_mem_attributes(void)
>  }
>  
>  static void swiotlb_init_io_tlb_pool(struct io_tlb_pool *mem, phys_addr_t start,
> -		unsigned long nslabs, bool late_alloc, unsigned int nareas)
> +		void *vaddr, unsigned long nslabs, bool late_alloc,
> +		unsigned int nareas)
>  {
> -	void *vaddr = phys_to_virt(start);
>  	unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
>  
>  	mem->nslabs = nslabs;
> @@ -445,7 +445,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
>  		return;
>  	}
>  
> -	swiotlb_init_io_tlb_pool(mem, __pa(tlb), nslabs, false, nareas);
> +	swiotlb_init_io_tlb_pool(mem, __pa(tlb), tlb, nslabs, false, nareas);
>  	add_mem_pool(&io_tlb_default_mem, mem);
>  
>  	if (flags & SWIOTLB_VERBOSE)
> @@ -553,7 +553,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  		}
>  	}
>  
> -	swiotlb_init_io_tlb_pool(mem, virt_to_phys(vstart), nslabs, true,
> +	swiotlb_init_io_tlb_pool(mem, virt_to_phys(vstart), vstart, nslabs, true,
>  				 nareas);
>  	add_mem_pool(&io_tlb_default_mem, mem);
>  
> @@ -664,25 +664,26 @@ static struct page *alloc_dma_pages(gfp_t gfp, size_t bytes,
>   * @phys_limit:	Maximum allowed physical address of the buffer.
>   * @attrs:	DMA attributes for the allocation.
>   * @gfp:	GFP flags for the allocation.
> + * @vaddr:	Receives the virtual address for the allocated buffer.
>   *
>   * Return: Allocated pages, or %NULL on allocation failure.
>   */
>  static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
> -		u64 phys_limit, unsigned long attrs, gfp_t gfp)
> +		u64 phys_limit, unsigned long attrs, gfp_t gfp, void **vaddr)
>  {
>  	struct page *page;
>  
> +	*vaddr = NULL;
> +
>  	/*
>  	 * Allocate from the atomic pools if memory is encrypted and
>  	 * the allocation is atomic, because decrypting may block.
>  	 */
>  	if (!gfpflags_allow_blocking(gfp) && (attrs & DMA_ATTR_CC_SHARED)) {
> -		void *vaddr;
> -
>  		if (!IS_ENABLED(CONFIG_DMA_COHERENT_POOL))
>  			return NULL;
>  
> -		return dma_alloc_from_pool(dev, bytes, &vaddr, gfp,
> +		return dma_alloc_from_pool(dev, bytes, vaddr, gfp,
>  					   attrs, dma_coherent_ok);
>  	}
>  
> @@ -705,6 +706,8 @@ static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
>  			return NULL;
>  	}
>  
> +	if (page)
> +		*vaddr = phys_to_virt(page_to_phys(page));
>  	return page;
>  }
>  
> @@ -750,6 +753,7 @@ static struct io_tlb_pool *swiotlb_alloc_pool(struct device *dev,
>  {
>  	struct io_tlb_pool *pool;
>  	unsigned int slot_order;
> +	void *tlb_vaddr;
>  	struct page *tlb;
>  	size_t pool_size;
>  	size_t tlb_size;
> @@ -767,7 +771,8 @@ static struct io_tlb_pool *swiotlb_alloc_pool(struct device *dev,
>  	pool->unencrypted = !!(attrs & DMA_ATTR_CC_SHARED);
>  
>  	tlb_size = nslabs << IO_TLB_SHIFT;
> -	while (!(tlb = swiotlb_alloc_tlb(dev, tlb_size, phys_limit, attrs, gfp))) {
> +	while (!(tlb = swiotlb_alloc_tlb(dev, tlb_size, phys_limit, attrs, gfp,
> +					 &tlb_vaddr))) {
>  		if (nslabs <= minslabs)
>  			goto error_tlb;
>  		nslabs = ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
> @@ -781,12 +786,12 @@ static struct io_tlb_pool *swiotlb_alloc_pool(struct device *dev,
>  	if (!pool->slots)
>  		goto error_slots;
>  
> -	swiotlb_init_io_tlb_pool(pool, page_to_phys(tlb), nslabs, true, nareas);
> +	swiotlb_init_io_tlb_pool(pool, page_to_phys(tlb), tlb_vaddr, nslabs,
> +				 true, nareas);
>  	return pool;
>  
>  error_slots:
> -	swiotlb_free_tlb(page_address(tlb), tlb_size,
> -			 !!(attrs & DMA_ATTR_CC_SHARED));
> +	swiotlb_free_tlb(tlb_vaddr, tlb_size, !!(attrs & DMA_ATTR_CC_SHARED));
>  error_tlb:
>  	kfree(pool);
>  error:
> @@ -1995,7 +2000,8 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
>  			mem->unencrypted = false;
>  		}
>  
> -		swiotlb_init_io_tlb_pool(pool, rmem->base, nslabs,
> +		swiotlb_init_io_tlb_pool(pool, rmem->base, phys_to_virt(rmem->base),
> +					 nslabs,
>  					 false, nareas);
>  		mem->force_bounce = true;
>  		mem->for_alloc = true;


