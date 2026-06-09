Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17499CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 12:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mQLuvtz3glfIEIPFlr7hcRvFUTFmCVW/e4HDdH4bW4=; b=y3iuzbYc6CdV//+TWeE6lJEPTX
	xwGbWNvQsCk2HLiSi+5xGPEZ7IIV07VIeM4Ysih+N0bpBdVv4PgjP8wNMJm/r1ZeoEv1l9ewSrmwt
	crPlEmzuosE78YVL+quGv8LQ8L66CAvKP025sy7rLvHuF00QLobWzuYLoc1dtq1JjFBBjZmKdemDW
	itgS3rSJLJLK4vUdAaljuzNr7v+dAu3Z/cVIGnV6woI9+uGVO+gTUj4zE+pt51Ww4M9WRwFZvoILN
	eXtVaAYl9ZyXmOKo2cxjaDQ91+31THYJiJd6lX5+3ljKm1L0Xamev3Mp6+U/B5jQE3g+N6aPY3j3C
	PbgqZKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvUQ-00000005WGM-3jth;
	Tue, 09 Jun 2026 12:23:30 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvUO-00000005WFj-2YUI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 12:23:30 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490ae0812c9so4300465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 05:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781007807; x=1781612607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mQLuvtz3glfIEIPFlr7hcRvFUTFmCVW/e4HDdH4bW4=;
        b=REy2jk+2E0kBVRYNz3rlw5TltCvbrCo0UYVGjw82+CUysIuOuqFBN8yD4VQjWRcwQU
         JQOM73WUVTHmBu3WzLFjfqjSy9dGrlNzsY3GrkQ5kWUGre+k0xR/SVZAqBg7bg3FVcOe
         d/LtuvWcEhCvQ6ySrNe5JPgWL6NVmWkgQ6iNpt7XzawnVIVt5daSMT0tbfs0wcoHi5dH
         3YOnpRsZl4qmWZc7+q4NeLM6qcwKkYQWVexKwhxD6+9lSFcTS8joZP4o7vwFWgMO6qgp
         VNEm0yMYMVr6XyhY4MOedjllYgQNF6RULZOdBEMNKbBRgQgxxjzW9j/hnuXFHKNWdt9s
         SQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007807; x=1781612607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3mQLuvtz3glfIEIPFlr7hcRvFUTFmCVW/e4HDdH4bW4=;
        b=GtA0Bed1juTzaO8hC8n7ho198006fyTiphLKXH/An02oMxedB4J/jLhw9wAALqHg3n
         XAE/bGtdSJUMIxvaPfDLkLmqZ0rBDsFikNRa7qtN8o/FgrpOnHnoBMloV8HmbbPughO+
         EEvi1ORykGDotsB6H1nExH9xWX/xYGJxcu9WI9DX/4NaRaxQ4EWsZe/EVVNSm8wnmdQY
         OT57OvCoyRuZzEZqTQrTxRikGA3dgWDjocxlrXWcm+aui0Uu2SLCK+oh9wYpitQ++1W+
         6XSFZC+FK1EMIYeh1E61PG2QUopaU6fojXL4lDa6Qp5mGW+8KC0T9rO7q3XckP6OGJO8
         KdPA==
X-Forwarded-Encrypted: i=1; AFNElJ8QWtmGaLlj5nq9cpC7Y4nx4hKgZ3N0QQctbqg4AUtqM7y8ykstxpdtE3cZA/SCPK2Ipno35qbSMosnOcb/lprw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0rzne9a3SbiCZmPUrzDZ8CHyweWRkC2q+SsPqp8ySHuBRsL6w
	BafeffuQiNnNKbC6xc/w9/sposQfAMzQu+H+r3bNb4ejOKZ30JB78hVmHswvJn7kOto=
X-Gm-Gg: Acq92OENqfcPrB9oTsZ2+/6VYTWb/rddPMiC4dzdJx8K6KENzZ5WofUuBAe8fVp95dk
	9ennfd10e238vA9XxTi9WsqkIHeXvEPVK8qWKI0dQyaPdGsHO+VFrbkKnAEeVvJvk24tZiZIjmc
	8I7DlDvcS3+22F1RId9vgh+K2/ZhjkcWA/+kEzgxe8Ug2vu5FbWYsY/IaJcs0coru4lWHZDzjy2
	xVoXXdfWY6nm4TADP12J+RIEiKEaRVUL9PsivIOvJcw+ZHZLV+/sr+f6UBvVeaOYA1FgRzW1kn3
	2pcgPBLj+kHhSL4BHQNgRHiih42MkelfZK1L3u34da6uSXIouF0bSPYxM+QvxN2+uEotu1OicFM
	yFkwL9n9UdckJz32FgoPaDaJXnJLBctB1jnSNEpC8MXlAqZI2pJZdzDdDTVtVgIiRFWRJ7LTwxY
	L2K8WK1E1EpIcFyft55mlU/qc=
X-Received: by 2002:a05:600c:5286:b0:490:a2f4:c498 with SMTP id 5b1f17b1804b1-490c2618175mr140985815e9.6.1781007806640;
        Tue, 09 Jun 2026 05:23:26 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413541sm514472945e9.14.2026.06.09.05.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:23:26 -0700 (PDT)
Date: Tue, 9 Jun 2026 14:23:17 +0200
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
Subject: Re: [PATCH v6 04/20] dma-pool: track decrypted atomic pools and
 select them via attrs
Message-ID: <20260609142317.46569b8a@mordecai>
In-Reply-To: <20260604083959.1265923-5-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-5-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_052328_874755_7522B95A 
X-CRM114-Status: GOOD (  32.77  )
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

On Thu,  4 Jun 2026 14:09:43 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> Teach the atomic DMA pool code to distinguish between encrypted and
> unencrypted pools, and make pool allocation select the matching pool based
> on DMA attributes.
> 
> Introduce a dma_gen_pool wrapper that records whether a pool is
> unencrypted, initialize that state when the atomic pools are created, and
> use it when expanding and resizing the pools. Update dma_alloc_from_pool()
> to take attrs and skip pools whose encrypted state does not match
> DMA_ATTR_CC_SHARED. Update dma_free_from_pool() accordingly.
> 
> Also pass DMA_ATTR_CC_SHARED from the swiotlb atomic allocation path so
> decrypted swiotlb allocations are taken from the correct atomic pool.
> 
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

FWIW this also looks good to me, but I don't think I'm the best person
to review changed to DMA generic pools.

Petr T

> ---
>  drivers/iommu/dma-iommu.c   |   2 +-
>  include/linux/dma-map-ops.h |   2 +-
>  kernel/dma/direct.c         |  11 ++-
>  kernel/dma/pool.c           | 167 +++++++++++++++++++++++-------------
>  kernel/dma/swiotlb.c        |   7 +-
>  5 files changed, 123 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 54d96e847f16..c2595bee3d41 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1673,7 +1673,7 @@ void *iommu_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
>  	if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
>  	    !gfpflags_allow_blocking(gfp) && !coherent)
>  		page = dma_alloc_from_pool(dev, PAGE_ALIGN(size), &cpu_addr,
> -					       gfp, NULL);
> +					   gfp, attrs, NULL);
>  	else
>  		cpu_addr = iommu_dma_alloc_pages(dev, size, &page, gfp, attrs);
>  	if (!cpu_addr)
> diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
> index 6a1832a73cad..696b2c3a2305 100644
> --- a/include/linux/dma-map-ops.h
> +++ b/include/linux/dma-map-ops.h
> @@ -212,7 +212,7 @@ void *dma_common_pages_remap(struct page **pages, size_t size, pgprot_t prot,
>  void dma_common_free_remap(void *cpu_addr, size_t size);
>  
>  struct page *dma_alloc_from_pool(struct device *dev, size_t size,
> -		void **cpu_addr, gfp_t flags,
> +		void **cpu_addr, gfp_t flags, unsigned long attrs,
>  		bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t));
>  bool dma_free_from_pool(struct device *dev, void *start, size_t size);
>  
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 90dc5057a0c0..681f16a984ab 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -154,7 +154,7 @@ static bool dma_direct_use_pool(struct device *dev, gfp_t gfp)
>  }
>  
>  static void *dma_direct_alloc_from_pool(struct device *dev, size_t size,
> -		dma_addr_t *dma_handle, gfp_t gfp)
> +		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
>  {
>  	struct page *page;
>  	u64 phys_limit;
> @@ -164,7 +164,8 @@ static void *dma_direct_alloc_from_pool(struct device *dev, size_t size,
>  		return NULL;
>  
>  	gfp |= dma_direct_optimal_gfp_mask(dev, &phys_limit);
> -	page = dma_alloc_from_pool(dev, size, &ret, gfp, dma_coherent_ok);
> +	page = dma_alloc_from_pool(dev, size, &ret, gfp, attrs,
> +				   dma_coherent_ok);
>  	if (!page)
>  		return NULL;
>  	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
> @@ -253,7 +254,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  	 */
>  	if ((remap || (attrs & DMA_ATTR_CC_SHARED)) &&
>  	    dma_direct_use_pool(dev, gfp))
> -		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
> +		return dma_direct_alloc_from_pool(dev, size, dma_handle,
> +						  gfp, attrs);
>  
>  	if (is_swiotlb_for_alloc(dev)) {
>  		page = dma_direct_alloc_swiotlb(dev, size);
> @@ -401,7 +403,8 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  		attrs |= DMA_ATTR_CC_SHARED;
>  
>  	if ((attrs & DMA_ATTR_CC_SHARED) && dma_direct_use_pool(dev, gfp))
> -		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
> +		return dma_direct_alloc_from_pool(dev, size, dma_handle,
> +						  gfp, attrs);
>  
>  	if (is_swiotlb_for_alloc(dev)) {
>  		page = dma_direct_alloc_swiotlb(dev, size);
> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> index 2b2fbb709242..be78474a6c49 100644
> --- a/kernel/dma/pool.c
> +++ b/kernel/dma/pool.c
> @@ -12,12 +12,18 @@
>  #include <linux/set_memory.h>
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
> +#include <linux/cc_platform.h>
>  
> -static struct gen_pool *atomic_pool_dma __ro_after_init;
> +struct dma_gen_pool {
> +	bool unencrypted;
> +	struct gen_pool *pool;
> +};
> +
> +static struct dma_gen_pool atomic_pool_dma __ro_after_init;
>  static unsigned long pool_size_dma;
> -static struct gen_pool *atomic_pool_dma32 __ro_after_init;
> +static struct dma_gen_pool atomic_pool_dma32 __ro_after_init;
>  static unsigned long pool_size_dma32;
> -static struct gen_pool *atomic_pool_kernel __ro_after_init;
> +static struct dma_gen_pool atomic_pool_kernel __ro_after_init;
>  static unsigned long pool_size_kernel;
>  
>  /* Size can be defined by the coherent_pool command line */
> @@ -76,11 +82,12 @@ static bool cma_in_zone(gfp_t gfp)
>  	return true;
>  }
>  
> -static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
> +static int atomic_pool_expand(struct dma_gen_pool *dma_pool, size_t pool_size,
>  			      gfp_t gfp)
>  {
>  	unsigned int order;
>  	struct page *page = NULL;
> +	bool leak_pages = false;
>  	void *addr;
>  	int ret = -ENOMEM;
>  
> @@ -113,12 +120,17 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>  	 * Memory in the atomic DMA pools must be unencrypted, the pools do not
>  	 * shrink so no re-encryption occurs in dma_direct_free().
>  	 */
> -	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
> -				   1 << order);
> -	if (ret)
> -		goto remove_mapping;
> -	ret = gen_pool_add_virt(pool, (unsigned long)addr, page_to_phys(page),
> -				pool_size, NUMA_NO_NODE);
> +	if (dma_pool->unencrypted) {
> +		ret = set_memory_decrypted((unsigned long)page_to_virt(page),
> +					   1 << order);
> +		if (ret) {
> +			leak_pages = true;
> +			goto remove_mapping;
> +		}
> +	}
> +
> +	ret = gen_pool_add_virt(dma_pool->pool, (unsigned long)addr,
> +				page_to_phys(page), pool_size, NUMA_NO_NODE);
>  	if (ret)
>  		goto encrypt_mapping;
>  
> @@ -126,62 +138,67 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>  	return 0;
>  
>  encrypt_mapping:
> -	ret = set_memory_encrypted((unsigned long)page_to_virt(page),
> -				   1 << order);
> -	if (WARN_ON_ONCE(ret)) {
> -		/* Decrypt succeeded but encrypt failed, purposely leak */
> -		goto out;
> -	}
> +	if (dma_pool->unencrypted &&
> +	    set_memory_encrypted((unsigned long)page_to_virt(page), 1 << order))
> +		leak_pages = true;
> +
>  remove_mapping:
>  #ifdef CONFIG_DMA_DIRECT_REMAP
>  	dma_common_free_remap(addr, pool_size);
>  free_page:
> -	__free_pages(page, order);
> +	if (!leak_pages)
> +		__free_pages(page, order);
>  #endif
>  out:
>  	return ret;
>  }
>  
> -static void atomic_pool_resize(struct gen_pool *pool, gfp_t gfp)
> +static void atomic_pool_resize(struct dma_gen_pool *dma_pool, gfp_t gfp)
>  {
> -	if (pool && gen_pool_avail(pool) < atomic_pool_size)
> -		atomic_pool_expand(pool, gen_pool_size(pool), gfp);
> +	if (dma_pool->pool && gen_pool_avail(dma_pool->pool) < atomic_pool_size)
> +		atomic_pool_expand(dma_pool, gen_pool_size(dma_pool->pool), gfp);
>  }
>  
>  static void atomic_pool_work_fn(struct work_struct *work)
>  {
>  	if (IS_ENABLED(CONFIG_ZONE_DMA))
> -		atomic_pool_resize(atomic_pool_dma,
> +		atomic_pool_resize(&atomic_pool_dma,
>  				   GFP_KERNEL | GFP_DMA);
>  	if (IS_ENABLED(CONFIG_ZONE_DMA32))
> -		atomic_pool_resize(atomic_pool_dma32,
> +		atomic_pool_resize(&atomic_pool_dma32,
>  				   GFP_KERNEL | GFP_DMA32);
> -	atomic_pool_resize(atomic_pool_kernel, GFP_KERNEL);
> +	atomic_pool_resize(&atomic_pool_kernel, GFP_KERNEL);
>  }
>  
> -static __init struct gen_pool *__dma_atomic_pool_init(size_t pool_size,
> -						      gfp_t gfp)
> +static __init struct dma_gen_pool *__dma_atomic_pool_init(struct dma_gen_pool *dma_pool,
> +		size_t pool_size, gfp_t gfp)
>  {
> -	struct gen_pool *pool;
>  	int ret;
>  
> -	pool = gen_pool_create(PAGE_SHIFT, NUMA_NO_NODE);
> -	if (!pool)
> +	dma_pool->pool = gen_pool_create(PAGE_SHIFT, NUMA_NO_NODE);
> +	if (!dma_pool->pool)
>  		return NULL;
>  
> -	gen_pool_set_algo(pool, gen_pool_first_fit_order_align, NULL);
> +	gen_pool_set_algo(dma_pool->pool, gen_pool_first_fit_order_align, NULL);
> +
> +	/* if platform is using memory encryption atomic pools are by default decrypted. */
> +	if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
> +		dma_pool->unencrypted = true;
> +	else
> +		dma_pool->unencrypted = false;
>  
> -	ret = atomic_pool_expand(pool, pool_size, gfp);
> +	ret = atomic_pool_expand(dma_pool, pool_size, gfp);
>  	if (ret) {
> -		gen_pool_destroy(pool);
> +		gen_pool_destroy(dma_pool->pool);
> +		dma_pool->pool = NULL;
>  		pr_err("DMA: failed to allocate %zu KiB %pGg pool for atomic allocation\n",
>  		       pool_size >> 10, &gfp);
>  		return NULL;
>  	}
>  
>  	pr_info("DMA: preallocated %zu KiB %pGg pool for atomic allocations\n",
> -		gen_pool_size(pool) >> 10, &gfp);
> -	return pool;
> +		gen_pool_size(dma_pool->pool) >> 10, &gfp);
> +	return dma_pool;
>  }
>  
>  #ifdef CONFIG_ZONE_DMA32
> @@ -207,21 +224,22 @@ static int __init dma_atomic_pool_init(void)
>  
>  	/* All memory might be in the DMA zone(s) to begin with */
>  	if (has_managed_zone(ZONE_NORMAL)) {
> -		atomic_pool_kernel = __dma_atomic_pool_init(atomic_pool_size,
> -						    GFP_KERNEL);
> -		if (!atomic_pool_kernel)
> +		__dma_atomic_pool_init(&atomic_pool_kernel, atomic_pool_size, GFP_KERNEL);
> +		if (!atomic_pool_kernel.pool)
>  			ret = -ENOMEM;
>  	}
> +
>  	if (has_managed_dma()) {
> -		atomic_pool_dma = __dma_atomic_pool_init(atomic_pool_size,
> -						GFP_KERNEL | GFP_DMA);
> -		if (!atomic_pool_dma)
> +		__dma_atomic_pool_init(&atomic_pool_dma, atomic_pool_size,
> +				       GFP_KERNEL | GFP_DMA);
> +		if (!atomic_pool_dma.pool)
>  			ret = -ENOMEM;
>  	}
> +
>  	if (has_managed_dma32) {
> -		atomic_pool_dma32 = __dma_atomic_pool_init(atomic_pool_size,
> -						GFP_KERNEL | GFP_DMA32);
> -		if (!atomic_pool_dma32)
> +		__dma_atomic_pool_init(&atomic_pool_dma32, atomic_pool_size,
> +				       GFP_KERNEL | GFP_DMA32);
> +		if (!atomic_pool_dma32.pool)
>  			ret = -ENOMEM;
>  	}
>  
> @@ -230,19 +248,44 @@ static int __init dma_atomic_pool_init(void)
>  }
>  postcore_initcall(dma_atomic_pool_init);
>  
> -static inline struct gen_pool *dma_guess_pool(struct gen_pool *prev, gfp_t gfp)
> +static inline struct dma_gen_pool *__dma_guess_pool(struct dma_gen_pool *first,
> +		struct dma_gen_pool *second, struct dma_gen_pool *third)
>  {
> -	if (prev == NULL) {
> +	if (first->pool)
> +		return first;
> +	if (second && second->pool)
> +		return second;
> +	if (third && third->pool)
> +		return third;
> +	return NULL;
> +}
> +
> +static inline struct dma_gen_pool *dma_guess_pool(struct dma_gen_pool *prev,
> +		gfp_t gfp)
> +{
> +	if (!prev) {
>  		if (gfp & GFP_DMA)
> -			return atomic_pool_dma ?: atomic_pool_dma32 ?: atomic_pool_kernel;
> +			return __dma_guess_pool(&atomic_pool_dma,
> +						&atomic_pool_dma32,
> +						&atomic_pool_kernel);
> +
>  		if (gfp & GFP_DMA32)
> -			return atomic_pool_dma32 ?: atomic_pool_dma ?: atomic_pool_kernel;
> -		return atomic_pool_kernel ?: atomic_pool_dma32 ?: atomic_pool_dma;
> +			return __dma_guess_pool(&atomic_pool_dma32,
> +						&atomic_pool_dma,
> +						&atomic_pool_kernel);
> +
> +		return __dma_guess_pool(&atomic_pool_kernel,
> +					&atomic_pool_dma32,
> +					&atomic_pool_dma);
>  	}
> -	if (prev == atomic_pool_kernel)
> -		return atomic_pool_dma32 ? atomic_pool_dma32 : atomic_pool_dma;
> -	if (prev == atomic_pool_dma32)
> -		return atomic_pool_dma;
> +
> +	if (prev == &atomic_pool_kernel)
> +		return __dma_guess_pool(&atomic_pool_dma32,
> +					&atomic_pool_dma, NULL);
> +
> +	if (prev == &atomic_pool_dma32)
> +		return __dma_guess_pool(&atomic_pool_dma, NULL, NULL);
> +
>  	return NULL;
>  }
>  
> @@ -272,16 +315,20 @@ static struct page *__dma_alloc_from_pool(struct device *dev, size_t size,
>  }
>  
>  struct page *dma_alloc_from_pool(struct device *dev, size_t size,
> -		void **cpu_addr, gfp_t gfp,
> +		void **cpu_addr, gfp_t gfp, unsigned long attrs,
>  		bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t))
>  {
> -	struct gen_pool *pool = NULL;
> +	struct dma_gen_pool *dma_pool = NULL;
>  	struct page *page;
>  	bool pool_found = false;
>  
> -	while ((pool = dma_guess_pool(pool, gfp))) {
> +	while ((dma_pool = dma_guess_pool(dma_pool, gfp))) {
> +
> +		if (dma_pool->unencrypted != !!(attrs & DMA_ATTR_CC_SHARED))
> +			continue;
> +
>  		pool_found = true;
> -		page = __dma_alloc_from_pool(dev, size, pool, cpu_addr,
> +		page = __dma_alloc_from_pool(dev, size, dma_pool->pool, cpu_addr,
>  					     phys_addr_ok);
>  		if (page)
>  			return page;
> @@ -296,12 +343,14 @@ struct page *dma_alloc_from_pool(struct device *dev, size_t size,
>  
>  bool dma_free_from_pool(struct device *dev, void *start, size_t size)
>  {
> -	struct gen_pool *pool = NULL;
> +	struct dma_gen_pool *dma_pool = NULL;
> +
> +	while ((dma_pool = dma_guess_pool(dma_pool, 0))) {
>  
> -	while ((pool = dma_guess_pool(pool, 0))) {
> -		if (!gen_pool_has_addr(pool, (unsigned long)start, size))
> +		if (!gen_pool_has_addr(dma_pool->pool, (unsigned long)start, size))
>  			continue;
> -		gen_pool_free(pool, (unsigned long)start, size);
> +
> +		gen_pool_free(dma_pool->pool, (unsigned long)start, size);
>  		return true;
>  	}
>  
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index ac03a6856c2e..be4d418d92ac 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -612,6 +612,7 @@ static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
>  		u64 phys_limit, gfp_t gfp)
>  {
>  	struct page *page;
> +	unsigned long attrs = 0;
>  
>  	/*
>  	 * Allocate from the atomic pools if memory is encrypted and
> @@ -623,8 +624,12 @@ static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
>  		if (!IS_ENABLED(CONFIG_DMA_COHERENT_POOL))
>  			return NULL;
>  
> +		/* swiotlb considered decrypted by default */
> +		if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
> +			attrs = DMA_ATTR_CC_SHARED;
> +
>  		return dma_alloc_from_pool(dev, bytes, &vaddr, gfp,
> -					   dma_coherent_ok);
> +					   attrs, dma_coherent_ok);
>  	}
>  
>  	gfp &= ~GFP_ZONEMASK;


