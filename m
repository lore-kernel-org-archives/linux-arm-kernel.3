Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A5ACD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 12:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cgmjA35OZT82unFdAfj17g91mhG8pXqbVF134yH8ow=; b=HBgX8mtezhAWAJwap/yoUNXuIE
	6Tezhmm66566SBrGH+KVlwaxZ/+Ov2nbqnh3hKyLyaWbv2qjbwn5zyENDqSJJKEiNxvvM0WwN5Rt5
	qNAb/GmVzZlf8Ht77K8ES3xzADLIrhx19eE/qUzJiWTg52sidoT8nY5lZRSmZeYtFh486SCZYSUTG
	f5mYx0j/jKpwcGl778M4/q4+xAceOgfDsXhGKvddzHQVMRwU7qkqdKuHN58HtaRAsPapU7rkR4b8c
	F+tdGsPBSFBlaqRPGbqMrc6uAZhXkWb3Ej83bY55Iqn4pvpm6UkL12hM5ETQFVjxyO7pQz2lZGm9W
	fE/A5u+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvPY-00000005Vn9-1aBZ;
	Tue, 09 Jun 2026 12:18:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvPV-00000005Vmk-2lM3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 12:18:26 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490b1c39fe4so5484435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 05:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781007504; x=1781612304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cgmjA35OZT82unFdAfj17g91mhG8pXqbVF134yH8ow=;
        b=OWCl12MwLZ0/xIq2LUNkJzJGEoo5IW00jZM6K+kIwBbRgnzUmAvubC5HEBBGVWV1Gt
         1ZD9PrEX26ArEA0Mqy2YAPPOororz+jHIhkUfU8Tx1OhsWt+7avFGaMff32Bz9738Ali
         hqbV6NDzqQifNSqjEXBbUuNdPm2YLnoU7+527O+o9w2hJssFlOzLKowkf3NaRpOlZI7R
         FuAKLri7IZ1zuwgfuID+JIoGW7brUwqnoShU8ah1v720A20bY5xNukNpEz3hxFHdRt8d
         RcPpDNcxauerHwyJg7+/C2WcML17u+3A3YW23Xon/tRaB7rCDrweuZXN4T708h7v6hql
         a6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007504; x=1781612304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5cgmjA35OZT82unFdAfj17g91mhG8pXqbVF134yH8ow=;
        b=UvBRLW3WZ4hi8WfV+a3Nh/kee3Qq9K8ayIGdGKncyp/UMBSdAGFr1iZpURdfU9I/Nc
         nwkGMQdj3WqiOalyG0EidJrXbmMVkxLDCr8gd4n8UehL95YNKvf7pPbi3ITKTdgQZ+Bx
         A5Iiq65N25W7EjCqIQ5spEDNkMlQwn/8KWBFqNji4M3ZvbcrTErqa4qrnNhs/eTX9nNl
         Mlz0PhueOW/EHZmANs1lD4dAoWD1SYd/wCT0dj155V02KnsKKU0ubLbr2LDbZQQaBVma
         oqoGYSmcYw/rfO0EQyHnBxswKdem1cmnvX2MKJmykTLw4VooI1iWuoSr1F70/jxAqB4L
         UV6w==
X-Forwarded-Encrypted: i=1; AFNElJ9JBfRCZNKpkmZiCnniqyFxEe1mCN9AvByS7tOe0Af88frrTm+rIxEiq1sLwxsolbFUWNuhQDzH84Go57A/e4ub@lists.infradead.org
X-Gm-Message-State: AOJu0YzfUNnKsPSaJx5aa4X54euP/ni4uaxDb2KlQ9UaOK518Q10Kk8V
	ybHJTuLV2k1/nXjz/xQ/3eKw+lPn0HjDL6BMO8tyT4gzFyX7BpJocI4SMLS4+AjeU7Y=
X-Gm-Gg: Acq92OFYUs5alysGGgf1JYMG/Mf1sUln4agZu53s3bUBxfEjvVd4K9oDQBxM8I/pglm
	rrG4zLa4bhSp/8uttWDikCgn8nwPqVOPVxLsWadPybA+HXbUNLWwZiiBAgWKDcW1jAyq+Z8tGil
	1/tIk7dQL3lZFdIh9ZzbEpGKmBUHgCfhVxdQxCHwhFfw32BuQd6ZBvL3u4iaW5g9vwgWXXUQ/Qv
	fV4ZQIsapL1fZ7zZ65KrGPJqjmppWJJy7Qf6rjrhh0q9zLytEL4TfTrMwswVIhXPqpCCKb3GgzQ
	OQ8KK408DBPsr2Tu0ZYS3KXvpEKbFu71yPRJsGWj+ADPBflDIfQjdN6LIgXaejIvm3d/KIxJ1Fi
	BoSdJtDwJ1NBssxDx1Cmk6s7Hz8MNkL3SQphdxiBwSVGt+wyFIbGT8RJ3f1aBD6VMhay6xn57Fd
	r/QEKhi6Y+2SD8jh6noQvDxQ8=
X-Received: by 2002:a05:600c:6990:b0:490:c123:3b7a with SMTP id 5b1f17b1804b1-490c25f5864mr145239965e9.4.1781007503651;
        Tue, 09 Jun 2026 05:18:23 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm61851766f8f.20.2026.06.09.05.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:18:22 -0700 (PDT)
Date: Tue, 9 Jun 2026 14:18:14 +0200
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
 <svens@linux.ibm.com>, x86@kernel.org, Jiri Pirko <jiri@nvidia.com>,
 Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v6 03/20] dma-direct: use DMA_ATTR_CC_SHARED in
 alloc/free paths
Message-ID: <20260609141814.413c1f2f@mordecai>
In-Reply-To: <20260604083959.1265923-4-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-4-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_051825_820803_BB10BC8C 
X-CRM114-Status: GOOD (  27.93  )
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

On Thu,  4 Jun 2026 14:09:42 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> Propagate force_dma_unencrypted() into DMA_ATTR_CC_SHARED in the
> dma-direct allocation path and use the attribute to drive the related
> decisions.
> 
> This updates dma_direct_alloc(), dma_direct_free(), and
> dma_direct_alloc_pages() to fold the forced unencrypted case into attrs.
> 
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Petr Tesarik <ptesarik@suse.com>

Petr T

> ---
>  kernel/dma/direct.c | 53 +++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 44 insertions(+), 9 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index a741c8a2ee66..90dc5057a0c0 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -193,16 +193,31 @@ void *dma_direct_alloc(struct device *dev, size_t size,
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
> @@ -236,7 +251,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  	 * Remapping or decrypting memory may block, allocate the memory from
>  	 * the atomic pools instead if we aren't allowed block.
>  	 */
> -	if ((remap || force_dma_unencrypted(dev)) &&
> +	if ((remap || (attrs & DMA_ATTR_CC_SHARED)) &&
>  	    dma_direct_use_pool(dev, gfp))
>  		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>  
> @@ -312,12 +327,24 @@ void dma_direct_free(struct device *dev, size_t size,
>  		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
>  {
>  	phys_addr_t phys;
> -	bool mark_mem_encrypted = true;
> +	bool mark_mem_encrypted = false;
>  	struct io_tlb_pool *swiotlb_pool;
>  	unsigned int page_order = get_order(size);
>  
> -	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> -	    !force_dma_unencrypted(dev) && !is_swiotlb_for_alloc(dev)) {
> +	/* see dma_direct_alloc() for details */
> +	WARN_ON(attrs & DMA_ATTR_CC_SHARED);
> +
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
> @@ -366,10 +393,14 @@ void dma_direct_free(struct device *dev, size_t size,
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
>  
>  	if (is_swiotlb_for_alloc(dev)) {
> @@ -403,7 +434,11 @@ void dma_direct_free_pages(struct device *dev, size_t size,
>  	phys_addr_t phys;
>  	void *vaddr = page_address(page);
>  	struct io_tlb_pool *swiotlb_pool;
> -	bool mark_mem_encrypted = true;
> +	/*
> +	 * if the device had requested for an unencrypted buffer,
> +	 * convert it to encrypted on free
> +	 */
> +	bool mark_mem_encrypted = force_dma_unencrypted(dev);
>  
>  	/* If cpu_addr is not from an atomic pool, dma_free_from_pool() fails */
>  	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&


