Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F306CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPMVkSo7vb48jv7YwJ0Vd+mCEf6970EXP9V58QWiGq0=; b=SsRjx/R7GvAX6kliiNCNmda1D9
	Ty5nwbb5nWxkrliHmoUp7Y3RD4CnlWgQK1F1gXt+nDCzFHId6EHIhYOMCDnETJ0jE3s2U54n6WJvI
	B5hCQQtolPjIs6vu+0GHzOeUZ8f+ivjhZQtj8hoQJ9uIj9nZCnY4MAiXUZK87gL/20/faruvIiG2G
	cxYa92jyKTV4/LDB2il6aXtzKMA2J/MH01BQi7OuwQEuftnLfbpPnWZBVVXLiXcSjSUPb5/PXesKd
	JQacDJJXdXx+lJgq+EPZjuHs0V3hE/xEmIPkP/9Ew+pOEYW0s37J1CfNRdeT+IeoJu3pbkWtdClzR
	vbIBrgGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA6w-00000002qvD-17b5;
	Wed, 13 May 2026 13:58:54 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA6t-00000002qtt-1rGk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:58:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so3555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778680729; x=1779285529; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tPMVkSo7vb48jv7YwJ0Vd+mCEf6970EXP9V58QWiGq0=;
        b=t0ZQnx/mzelPJPh7MHF/pkMQpxcdJr8A4imMLS3dhFug2Z8m+pM8ThAc5OIMAqfIIM
         1lTC2MuCkEJxzPP6lcZo7g0GG+/kP57Xuyo20ixHHi4LQM3sIaJEHnQUm+rwZi/1/P0m
         hZjfWWr3wTzc47mxKUB0hRn7/Wmfy2QIT4m0t4x5h7+jSvYq7OwiTvHCYQ8nTOVxEMXK
         Sv3Sr8KQhC5tXp8uXqGz45iExqn1nIpH4rr7cr7H74TSsLID40TG7Ww7ZoKZoioRFYVX
         WvQjZtrTl5CmPjqZL45hrhCJgUrfW+dryscwCev7aA5QQAvcNwU6YjpsGB1qOeVA/TCU
         IvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680729; x=1779285529;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tPMVkSo7vb48jv7YwJ0Vd+mCEf6970EXP9V58QWiGq0=;
        b=C017NVdDf1Ibs/HK/RCpinPTcIuU7UQHeSPuZ4L4Vybq//GXW57xDFEOVCsKIRAltB
         28pW8JJaCzR40rhaujnNNEdAbO0SIVaCSE8ww9ZblOMp3naGBij7qIUIJLx7A4wJvMG4
         1tBK+/PpwKHJMcaXLItEkY+aU18wKsBD6Lk6N/Se5UKVWUpMcPavAqPyD5JTM4Hx06cs
         CHdrdDTKy39fhxi59r5FLptDbKw6XXUVjC+J3TEHdfdaxXVnW/PYnddMWuEHSg1Xc5Dc
         SrPnvXunSYOKz63XL7BIXCqUmBc0CWx1JIJdAWKFkaFjOTTYrTIVZjwkGvjbhEGiWQfN
         Zq+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8O0jBvFsUclRj5T+WjN22OAqiPjy4MAYLlsyype9bAzHKMNjMpIFSf72dQxWztHeGBdLqTocErWC4ityn64HpG@lists.infradead.org
X-Gm-Message-State: AOJu0YxHWZM3FpVY3Ke5HoLKu1DBd2TJgIzuMjNbXY42tpfjbAImWP1M
	+EBp1z15/lb/L+qFrsMFTH90aaQf2zdBeht92m29LcD6yp2ssE2QS6K+SBZm5H261Q==
X-Gm-Gg: Acq92OHMrPtMrK2Z28NQTHemZGPQAoktFc4wXk6QXrBuxjFoJFMsF3qh2qQmpUORPZo
	/W/FjvgFrIlGKuPVKfYgbvcbksAmenUgAvaT9UQ2D1vqpH4idbbG3NeC4BKUv66kis2jbHIPpFl
	H8Ns726Vudcf5ZICkpD6WvYD7E0Kcy+F7hu0QLZ3U2Ks36CVg79ZoEBDXrQZ4QDNXOJzta6GVyS
	P7HJYyRnRVcWox4SjL/hqwqr7+btvjrKt6IE1QCZzsvwqXmXT5uSgZEj259udICRZwLLSQtv/Dw
	9j4p9qMmko7nbvQmYb+KGHVJM9v+RVf5KAZVBm8Cc8lVUDoAouK2UdgHVsQIzjO1LQhQ6oLMiGb
	T0mZTT71MchQx2Ba8VNl2Be7qG1DbfnSiofo+M1uiuzj7eEeASKfiIC8oFZNDSNJzfeedfDr3Nq
	7Phs6oQrbOjQalIXgXTd/3n7bdKwsQLEPRk4swwxD2NOoaW7ONSDUHEg4UrxTuNEf/GSI=
X-Received: by 2002:a05:600c:8a16:10b0:48a:5618:b4d4 with SMTP id 5b1f17b1804b1-48fcacd0d81mr589735e9.1.1778680729194;
        Wed, 13 May 2026 06:58:49 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6cd75sm39576190f8f.16.2026.05.13.06.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:58:48 -0700 (PDT)
Date: Wed, 13 May 2026 13:58:43 +0000
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
Subject: Re: [PATCH v4 02/13] dma-direct: use DMA_ATTR_CC_SHARED in
 alloc/free paths
Message-ID: <agSDk0QsEM0ZBCTA@google.com>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-3-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260512090408.794195-3-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_065851_510824_88944300 
X-CRM114-Status: GOOD (  28.36  )
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

On Tue, May 12, 2026 at 02:33:57PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Propagate force_dma_unencrypted() into DMA_ATTR_CC_SHARED in the
> dma-direct allocation path and use the attribute to drive the related
> decisions.
> 
> This updates dma_direct_alloc(), dma_direct_free(), and
> dma_direct_alloc_pages() to fold the forced unencrypted case into attrs.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  kernel/dma/direct.c | 44 ++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index b958f150718a..0c2e1f8436ce 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -201,16 +201,31 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
>  {
>  	bool remap = false, set_uncached = false;
> -	bool mark_mem_decrypt = true;
> +	bool mark_mem_decrypt = false;
>  	struct page *page;
>  	void *ret;
>  
> +	/*
> +	 * DMA_ATTR_CC_SHARED is not a caller-visible dma_alloc_*()
> +	 * attribute. The direct allocator uses it internally after it has
> +	 * decided that the backing pages must be shared/decrypted, so the
> +	 * rest of the allocation path can consistently select DMA addresses,
> +	 * choose compatible pools and restore encryption on free.
> +	 */
> +	if (attrs & DMA_ATTR_CC_SHARED)
> +		return NULL;
> +
> +	if (force_dma_unencrypted(dev)) {
> +		attrs |= DMA_ATTR_CC_SHARED;
> +		mark_mem_decrypt = true;
> +	}
> +
>  	size = PAGE_ALIGN(size);
>  	if (attrs & DMA_ATTR_NO_WARN)
>  		gfp |= __GFP_NOWARN;
>  
> -	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> -	    !force_dma_unencrypted(dev) && !is_swiotlb_for_alloc(dev))
> +	if (((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | DMA_ATTR_CC_SHARED)) ==
> +	     DMA_ATTR_NO_KERNEL_MAPPING) && !is_swiotlb_for_alloc(dev))
>  		return dma_direct_alloc_no_mapping(dev, size, dma_handle, gfp);
>  
>  	if (!dev_is_dma_coherent(dev)) {
> @@ -244,7 +259,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  	 * Remapping or decrypting memory may block, allocate the memory from
>  	 * the atomic pools instead if we aren't allowed block.
>  	 */
> -	if ((remap || force_dma_unencrypted(dev)) &&
> +	if ((remap || (attrs & DMA_ATTR_CC_SHARED)) &&
>  	    dma_direct_use_pool(dev, gfp))
>  		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>  
> @@ -318,11 +333,20 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  void dma_direct_free(struct device *dev, size_t size,
>  		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
>  {
> -	bool mark_mem_encrypted = true;
> +	bool mark_mem_encrypted = false;
>  	unsigned int page_order = get_order(size);
>  
> -	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> -	    !force_dma_unencrypted(dev) && !is_swiotlb_for_alloc(dev)) {
> +	/*
> +	 * if the device had requested for an unencrypted buffer,
> +	 * convert it to encrypted on free
> +	 */
> +	if (force_dma_unencrypted(dev)) {
> +		attrs |= DMA_ATTR_CC_SHARED;
> +		mark_mem_encrypted = true;
> +	}
> +
> +	if (((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | DMA_ATTR_CC_SHARED)) ==
> +	     DMA_ATTR_NO_KERNEL_MAPPING) && !is_swiotlb_for_alloc(dev)) {
>  		/* cpu_addr is a struct page cookie, not a kernel address */
>  		dma_free_contiguous(dev, cpu_addr, size);
>  		return;
> @@ -365,10 +389,14 @@ void dma_direct_free(struct device *dev, size_t size,
>  struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
>  {
> +	unsigned long attrs = 0;
>  	struct page *page;
>  	void *ret;
>  
> -	if (force_dma_unencrypted(dev) && dma_direct_use_pool(dev, gfp))
> +	if (force_dma_unencrypted(dev))
> +		attrs |= DMA_ATTR_CC_SHARED;
> +
> +	if ((attrs & DMA_ATTR_CC_SHARED) && dma_direct_use_pool(dev, gfp))
>  		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);

What about dma_direct_free_pages()? Nothing inside uses attrs, but
that’s quite similar to dma_direct_alloc_pages()

Also, at this point, shouldn’t this patch also remove
force_dma_unencrypted() calls from dma_set_decrypted() and
dma_set_encrypted()?

Thanks,
Mostafa

>  
>  	if (is_swiotlb_for_alloc(dev)) {
> -- 
> 2.43.0
> 

