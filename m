Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AD0C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hhyo6VG61tN8AV0h0asytp+Vqc/+CnuTmYLnyeoXGkw=; b=Z6mPLHVnhrLw5l/uTElvgzUBiD
	fPoABXdWrzV4TBkRbvoAig5xlRwse4EFz6G5RYvMlSJQtiL0LZ1PjAGhPpwDRhrQ4jUaagQfzFzSi
	cj+I2c5MF7g1dtuazf/td0CO46ODWKDQJLpurExNPgQYRQwaV+r683Bfjb0lQiGY10f26vq8GRTAe
	Z4wa96iT6UVBEB/FVwfw1g1NJDcHgvxn/Qy+Bs0wNaSWpVZzVw/9isP4h08gR1uypEFt46C9e4Jmt
	0h7m9VyKgFGj2dCtI99k+DLDN2irZZQl2j3DvgtuxesIS1uDDXNdS0Q2A4CB1Xuaprs+uCFqU2DXO
	6SDKPeYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woikJ-00000005TSH-2JE3;
	Tue, 28 Jul 2026 14:25:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woikE-00000005TQZ-2lIT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:25:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4954bb689dfso42465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785248721; x=1785853521; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hhyo6VG61tN8AV0h0asytp+Vqc/+CnuTmYLnyeoXGkw=;
        b=Bw4KqBjyQnwBvYPqqFfd8sTyqHK76Up9DYnSy5+meMov20ondcfVb7DyY0N09zjO4d
         oXW3xBn0xMlErGXQHvmgWBMOAujY6YftTgJtT7xc+YKE31ZYKwbRA0wUdMamsx3qwATk
         CludGcJ8u4R7bfoapBY7afp8NkX294HtDkYOQXX/fuzu0FPbAq8qUY8MK8uJDc7eXIul
         OqGh4dO+/OKxbDenlzx/+dyPkX4KmSRc2k4iUwovYGb2svB5LRB5IyCYFc4QtEzNEBHC
         V5/5wOmZHkmfEYYNnztnk3tIcfP2/BXbIlGydn5Xo5f60cK9EWq//EQR3TG/DBg02E9f
         ZyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248721; x=1785853521;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hhyo6VG61tN8AV0h0asytp+Vqc/+CnuTmYLnyeoXGkw=;
        b=IPS4WWbvZDXLlIQp2TQ8HT1xeSKotqdz3NMNoJN+wOknLLmWCK9B3eVZchV+pIn8Ep
         osniEqZHePMQ715tNZLQoM57RqhysuGBlCocJ4MJFl1NgAVusaUsjrUG4NJE2xA/s1Oz
         s764bkXMjRLOlEXOOvdw+Bd6oW+9NpCQph9X5jjrjLkS0mldN8xunmh6wvcp6RJ0n1Au
         yAxaSNyDTslHSy3omngXCta4nEPpXSxijKa3zdNcdP/MGL0Ge2xIK+4XDRXZOYOooTnH
         7UocohdMfneRuP5XSGrjXye/ZpmwFSWgGKoB4FdxECq+TYOAVoG9k//UM7Yk3cdIa6RB
         WMHg==
X-Forwarded-Encrypted: i=1; AHgh+RqgtS7s38q7lV+EtImtdV/GUoGQ6fHjZjcozi+aNxU3fzcuXjTnabSayOcbWHcB6dqBCa5UXeAQAOnLt8kfre88@lists.infradead.org
X-Gm-Message-State: AOJu0YyFHOu9BJJ8mmz3jmx0r5/K9FsWPrmoC6KMgTN6o8CTEP+hZZn7
	6ZjOkOCN2QSmnRK9NCIYVaXO0KvYvxx51+8sVbnELbHB7c++/BlQsiR6xTq4JoPhKQ==
X-Gm-Gg: AR+sD12I0vuqnCCmTh0SnUBmbd5Q6eIWOWjFMeaPk/bQ96WmIBnSqqzUauv6Tjrar2S
	YUbyNUA5FibbTQbnfTazg4JB8x3irT15cBa4MnwOdv9rQDnfcrjkRdjpAWaLFr4TN/oqfcCecyv
	xGvuxfLnj2SKqIeAd66yWf8ilN8CyymXT+iXKBjkwHs7FwLFcgPl1JWPb0woiUephq23wOTw6xq
	6If1IuMu2Cs2EjQiAmoFuzGEc0Boyh8R40cc5m2L1USZWT8II0+or6c4gxNhci8ZvNJmUCe5UeB
	lVGOkdaloyBPMEr7C8IdbrcgQLSkv60jKCrQRvy3wgiB4Z0rIy2xHqw4rLoAI+vN/YT1iLG0x4R
	/xcSkWmigp0f43xmqKQtcDc/cwMVBpea8RLV5iIrb/Q8aGSgoB9e7NjHa+iyXABlIKbXgwMC+RE
	tjOKTZEIGqQ0rfqVs/MjvReScgTkzk2YqdV6x0i+kXPBw=
X-Received: by 2002:a05:600c:6a8d:b0:493:b47f:a24 with SMTP id 5b1f17b1804b1-496b4d2f236mr4342575e9.6.1785248720307;
        Tue, 28 Jul 2026 07:25:20 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45e0424sm84654015e9.13.2026.07.28.07.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:25:19 -0700 (PDT)
Date: Tue, 28 Jul 2026 14:25:11 +0000
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
	Jason Gunthorpe <jgg@nvidia.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v8 05/23] swiotlb: Preserve allocation virtual address
 for dynamic pools
Message-ID: <ami7x9uXfRLmjVhK@google.com>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-6-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717180442.110954-6-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_072522_739880_C471194D 
X-CRM114-Status: GOOD (  27.76  )
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

On Fri, Jul 17, 2026 at 11:34:23PM +0530, Aneesh Kumar K.V (Arm) wrote:
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
> Fixes: 79636caad361 ("swiotlb: if swiotlb is full, fall back to a transient memory pool")
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  kernel/dma/swiotlb.c | 31 +++++++++++++++++++------------
>  1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 1abd3e6146f4..6e8db52866bf 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -266,9 +266,9 @@ void __init swiotlb_update_mem_attributes(void)
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
> @@ -409,7 +409,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
>  		return;
>  	}
>  
> -	swiotlb_init_io_tlb_pool(mem, __pa(tlb), nslabs, false, nareas);
> +	swiotlb_init_io_tlb_pool(mem, __pa(tlb), tlb, nslabs, false, nareas);
>  	add_mem_pool(&io_tlb_default_mem, mem);
>  
>  	if (flags & SWIOTLB_VERBOSE)
> @@ -507,7 +507,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  
>  	set_memory_decrypted((unsigned long)vstart,
>  			     (nslabs << IO_TLB_SHIFT) >> PAGE_SHIFT);
> -	swiotlb_init_io_tlb_pool(mem, virt_to_phys(vstart), nslabs, true,
> +	swiotlb_init_io_tlb_pool(mem, virt_to_phys(vstart), vstart, nslabs, true,
>  				 nareas);
>  	add_mem_pool(&io_tlb_default_mem, mem);
>  
> @@ -605,25 +605,26 @@ static struct page *alloc_dma_pages(gfp_t gfp, size_t bytes, u64 phys_limit)
>   * @bytes:	Size of the buffer.
>   * @phys_limit:	Maximum allowed physical address of the buffer.
>   * @gfp:	GFP flags for the allocation.
> + * @vaddr:	Receives the virtual address for the allocated buffer.
>   *
>   * Return: Allocated pages, or %NULL on allocation failure.
>   */
>  static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
> -		u64 phys_limit, gfp_t gfp)
> +		u64 phys_limit, gfp_t gfp, void **vaddr)
>  {
>  	struct page *page;
>  
> +	*vaddr = NULL;
> +
>  	/*
>  	 * Allocate from the atomic pools if memory is encrypted and
>  	 * the allocation is atomic, because decrypting may block.
>  	 */
>  	if (!gfpflags_allow_blocking(gfp) && dev && force_dma_unencrypted(dev)) {
> -		void *vaddr;
> -
>  		if (!IS_ENABLED(CONFIG_DMA_COHERENT_POOL))
>  			return NULL;
>  
> -		return dma_alloc_from_pool(dev, bytes, &vaddr, gfp,
> +		return dma_alloc_from_pool(dev, bytes, vaddr, gfp,
>  					   dma_coherent_ok);
>  	}
>  
> @@ -645,6 +646,8 @@ static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
>  			return NULL;
>  	}
>  
> +	if (page)
> +		*vaddr = phys_to_virt(page_to_phys(page));
>  	return page;
>  }
>  
> @@ -685,6 +688,7 @@ static struct io_tlb_pool *swiotlb_alloc_pool(struct device *dev,
>  {
>  	struct io_tlb_pool *pool;
>  	unsigned int slot_order;
> +	void *tlb_vaddr;
>  	struct page *tlb;
>  	size_t pool_size;
>  	size_t tlb_size;
> @@ -701,7 +705,8 @@ static struct io_tlb_pool *swiotlb_alloc_pool(struct device *dev,
>  	pool->areas = (void *)pool + sizeof(*pool);
>  
>  	tlb_size = nslabs << IO_TLB_SHIFT;
> -	while (!(tlb = swiotlb_alloc_tlb(dev, tlb_size, phys_limit, gfp))) {
> +	while (!(tlb = swiotlb_alloc_tlb(dev, tlb_size, phys_limit, gfp,
> +					 &tlb_vaddr))) {
>  		if (nslabs <= minslabs)
>  			goto error_tlb;
>  		nslabs = ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
> @@ -715,11 +720,12 @@ static struct io_tlb_pool *swiotlb_alloc_pool(struct device *dev,
>  	if (!pool->slots)
>  		goto error_slots;
>  
> -	swiotlb_init_io_tlb_pool(pool, page_to_phys(tlb), nslabs, true, nareas);
> +	swiotlb_init_io_tlb_pool(pool, page_to_phys(tlb), tlb_vaddr, nslabs,
> +				 true, nareas);
>  	return pool;
>  
>  error_slots:
> -	swiotlb_free_tlb(page_address(tlb), tlb_size);
> +	swiotlb_free_tlb(tlb_vaddr, tlb_size);
>  error_tlb:
>  	kfree(pool);
>  error:
> @@ -1851,7 +1857,8 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
>  
>  		set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
>  				     rmem->size >> PAGE_SHIFT);
> -		swiotlb_init_io_tlb_pool(pool, rmem->base, nslabs,
> +		swiotlb_init_io_tlb_pool(pool, rmem->base, phys_to_virt(rmem->base),
> +					 nslabs,
>  					 false, nareas);
>  		mem->force_bounce = true;
>  		mem->for_alloc = true;
> -- 
> 2.43.0
> 

