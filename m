Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3177606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 13:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MsJ4jT9Q;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Po2Gv+pN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=95gIZ/rOhUqAkfRUZlhwY8It1fpNlrmqRnyk+6vFBTo=; b=MsJ4jT9Qb7Ie7n
	mcTmTThCimssVN5g+tCxieDSBXcUWl3Jfu/7w2t9WaLqd6/FYONwSj8hIsW5itgy96vyKUS+kwndh
	vnJ7D/m1aVzmaH4op4hS5yTvFMMCTA5dMFH/z40jWBL3DL+YPU8N0IwYsCnaEf2hWh/UfR3fNIjRE
	nU6Lt9693Sy93BBuNG18w63DtuqifXjmbXto5Rq0o5JDqmL7u7BIHOf209InrC1e308vQfUpd03rF
	WPZbV3cuu2LDVmn/HyJcCqxBH+QQ1Ds5Luxy11ZlplH79CFiC/4Gp4q5AzF1Xa2XmhyuE+RDrLgtH
	YOoW7cx02nUuFecWrBig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsen-0000000EA4s-2vUV;
	Thu, 22 Oct 2026 13:16:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsel-0000000EA44-0eCw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 13:16:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B2C01476;
	Thu, 22 Oct 2026 06:16:25 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9A693F673;
	Thu, 22 Oct 2026 06:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792674988; bh=VtjlyhfnDPej66ib6QAEpVj/N8t0KLq/+awBY3pvJWI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Po2Gv+pN5qUlVoTfmfm6+EiT9jkBnsjCdYxUB1uttjzopZ2ujfpPncmF8NG5AUHA/
	 ntV3DmM0O4FOtoaFsSCaE9vCLLGuGeVUWR3sgYLD5Vfg3x3t/YZ8m3si9+Ow2OnH08
	 xitDAI80+tuIJ7Q2ABl3pIfc3FZeSehoHXU+QxHE=
Message-ID: <6406c7b1-5e37-4c22-83c2-089c35ef54bf@arm.com>
Date: Thu, 22 Oct 2026 14:16:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] ARM: dma-mapping: Implement and expose DMA setup
 functions
To: Mikko Perttunen <mperttunen@nvidia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>,
 Thierry Reding <thierry.reding@kernel.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20261016-b4-arm32-iommu-dma-cookie-v2-0-b06842a01938@nvidia.com>
 <20261016-b4-arm32-iommu-dma-cookie-v2-4-b06842a01938@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20261016-b4-arm32-iommu-dma-cookie-v2-4-b06842a01938@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_061631_305537_55161C0A 
X-CRM114-Status: GOOD (  46.89  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/10/2026 7:46 am, Mikko Perttunen wrote:
> ARM DMA domains are currently allocated by the ARM DMA code, with struct
> dma_iommu_mapping owning the domain and the IOVA bookkeeping. To allow
> the IOMMU core to own DMA domains as is the case with other
> architectures, we have to allow that code to allocate the domain and get
> the cookie from the ARM DMA code.
> 
> Implement ARM versions of iommu_get/put_dma_cookie that create a struct
> dma_iommu_mapping that doesn't have its own domain, as well as
> iommu_setup/teardown_dma_ops that set the device's archdata.mapping,
> allowing ARM DMA ops to seamlessly work on these devices.
> 
> The code is protected by CONFIG_ARM_DMA_USE_IOMMU and mutually exclusive
> with the same-named functions in the dma-iommu code; and not reachable
> yet.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>   arch/arm/include/asm/dma-iommu.h |  17 ++++++
>   arch/arm/mm/dma-mapping.c        | 118 ++++++++++++++++++++++++++++++++++-----
>   drivers/iommu/dma-iommu.h        |  50 +++++++++++------
>   3 files changed, 154 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/arm/include/asm/dma-iommu.h b/arch/arm/include/asm/dma-iommu.h
> index 2ce4c5683e6d..85cf9b05faab 100644
> --- a/arch/arm/include/asm/dma-iommu.h
> +++ b/arch/arm/include/asm/dma-iommu.h
> @@ -19,6 +19,14 @@ struct dma_iommu_mapping {
>   	size_t			bits;		/* per bitmap */
>   	dma_addr_t		base;
>   
> +	/*
> +	 * Set for mappings created by arm_iommu_create_mapping(), where
> +	 * @domain is owned by the mapping.
> +	 * Clear for mappings that are a cookie of a domain owned by the IOMMU
> +	 * core.
> +	 */
> +	bool			owns_domain;

Do we strictly need this, or could we in fact already tell the 
difference via iommu_is_dma_domain()? (Since ARM-API-owned domains via 
iommu_paging_domain_alloc() will be IOMMU_DOMAIN_UNMANAGED)

> +
>   	spinlock_t		lock;
>   	struct kref		kref;
>   };
> @@ -32,5 +40,14 @@ int arm_iommu_attach_device(struct device *dev,
>   					struct dma_iommu_mapping *mapping);
>   void arm_iommu_detach_device(struct device *dev);
>   
> +#ifdef CONFIG_ARM_DMA_USE_IOMMU
> +struct iommu_domain;
> +
> +void iommu_setup_dma_ops(struct device *dev, struct iommu_domain *domain);
> +void iommu_teardown_dma_ops(struct device *dev);
> +int iommu_get_dma_cookie(struct iommu_domain *domain);
> +void iommu_put_dma_cookie(struct iommu_domain *domain);
> +#endif
> +
>   #endif /* __KERNEL__ */
>   #endif
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index 4284950a9246..f2d3e8ec3487 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -1531,6 +1531,79 @@ static void __arm_iommu_free_mapping(struct dma_iommu_mapping *mapping)
>   	kfree(mapping);
>   }
>   
> +static int __arm_iommu_init_cookie(struct iommu_domain *domain,
> +				   dma_addr_t base, u64 size)
> +{
> +	struct dma_iommu_mapping *mapping;
> +
> +	if (domain->cookie_type != IOMMU_COOKIE_NONE)
> +		return -EEXIST;
> +
> +	mapping = __arm_iommu_alloc_mapping(base, size);
> +	if (IS_ERR(mapping))
> +		return PTR_ERR(mapping);
> +
> +	mapping->domain = domain;
> +	domain->cookie_type = IOMMU_COOKIE_ARM_DMA;
> +	domain->arm_cookie = mapping;
> +
> +	return 0;
> +}
> +
> +/**
> + * iommu_get_dma_cookie - Set up a domain cookie for ARM IOMMU-based DMA API
> + * @domain: IOMMU_DOMAIN_DMA domain being configured
> + *
> + * Allocates IOVA bookkeeping for the domain based on the domain's specified
> + * geometry. The aperture can currently be at most 4GB in size, otherwise
> + * fails with -ERANGE.

Bit of a corner case, but I think that might technically break on 
stage-2-only arm-smmu implementations like MMU-400 where the default 
aperture will be 40 bits. It's probably better to explicitly cap our 
request to 4GB here to preserve the current behaviour.

> + */
> +int iommu_get_dma_cookie(struct iommu_domain *domain)
> +{
> +	dma_addr_t base = domain->geometry.aperture_start;
> +	u64 size;
> +
> +	if (base > domain->geometry.aperture_end)
> +		return -EINVAL;
> +
> +	size = (u64)domain->geometry.aperture_end - base + 1;
> +
> +	return __arm_iommu_init_cookie(domain, base, size);
> +}
> +
> +/**
> + * iommu_put_dma_cookie - Free domain cookie for ARM IOMMU-based DMA API
> + * @domain: the domain being freed
> + */
> +void iommu_put_dma_cookie(struct iommu_domain *domain)
> +{
> +	__arm_iommu_free_mapping(domain->arm_cookie);
> +}
> +
> +/**
> + * iommu_setup_dma_ops - Record a device's DMA API domain cookie
> + * @dev: the device
> + * @domain: the group's new default domain
> + *
> + * Records the cookie of @domain on @dev, or clears it if @domain is not a DMA
> + * API domain. The DMA ops themselves are per driver binding and are installed
> + * by arch_setup_dma_ops().
> + */
> +void iommu_setup_dma_ops(struct device *dev, struct iommu_domain *domain)
> +{
> +	to_dma_iommu_mapping(dev) = iommu_is_dma_domain(domain) ?
> +				    domain->arm_cookie : NULL;

It feels like we should actually set the dma_ops here for a real default 
domain. Sure it might make things a little more complex in the interim, 
but it'll be more logical when we come to remove the other path.

> +}
> +
> +/**
> + * iommu_teardown_dma_ops - Clear a device's DMA API domain cookie
> + * @dev: the device
> + */
> +void iommu_teardown_dma_ops(struct device *dev)
> +{
> +	to_dma_iommu_mapping(dev) = NULL;
> +}
> +
>   /**
>    * arm_iommu_create_mapping
>    * @dev: pointer to the client device (for IOMMU calls)
> @@ -1541,28 +1614,32 @@ static void __arm_iommu_free_mapping(struct dma_iommu_mapping *mapping)
>    * IO address ranges, which is required to perform memory allocation and
>    * mapping with IOMMU aware functions.
>    *
> + * Unlike a default domain set up by the IOMMU core, the returned mapping owns
> + * the domain it describes and releases it along with the last reference.
> + *
>    * The client device need to be attached to the mapping with
>    * arm_iommu_attach_device function.
>    */
>   struct dma_iommu_mapping *
>   arm_iommu_create_mapping(struct device *dev, dma_addr_t base, u64 size)
>   {
> -	struct dma_iommu_mapping *mapping;
> -
> -	mapping = __arm_iommu_alloc_mapping(base, size);
> -	if (IS_ERR(mapping))
> -		return mapping;
> +	struct iommu_domain *domain;
> +	int err;
>   
> -	mapping->domain = iommu_paging_domain_alloc(dev);
> -	if (IS_ERR(mapping->domain)) {
> -		int err = PTR_ERR(mapping->domain);
> +	domain = iommu_paging_domain_alloc(dev);
> +	if (IS_ERR(domain))
> +		return ERR_CAST(domain);
>   
> -		__arm_iommu_free_mapping(mapping);
> +	err = __arm_iommu_init_cookie(domain, base, size);
> +	if (err) {
> +		iommu_domain_free(domain);
>   		return ERR_PTR(err);
>   	}
>   
> -	kref_init(&mapping->kref);
> -	return mapping;
> +	domain->arm_cookie->owns_domain = true;
> +	kref_init(&domain->arm_cookie->kref);
> +
> +	return domain->arm_cookie;
>   }
>   EXPORT_SYMBOL_GPL(arm_iommu_create_mapping);
>   
> @@ -1571,8 +1648,8 @@ static void release_iommu_mapping(struct kref *kref)
>   	struct dma_iommu_mapping *mapping =
>   		container_of(kref, struct dma_iommu_mapping, kref);
>   
> +	/* Frees mapping too, via iommu_put_dma_cookie(). */
>   	iommu_domain_free(mapping->domain);
> -	__arm_iommu_free_mapping(mapping);
>   }
>   
>   static int extend_iommu_mapping(struct dma_iommu_mapping *mapping)
> @@ -1595,8 +1672,13 @@ static int extend_iommu_mapping(struct dma_iommu_mapping *mapping)
>   
>   void arm_iommu_release_mapping(struct dma_iommu_mapping *mapping)
>   {
> -	if (mapping)
> -		kref_put(&mapping->kref, release_iommu_mapping);
> +	if (!mapping)
> +		return;
> +
> +	if (WARN_ON(!mapping->owns_domain))
> +		return;
> +
> +	kref_put(&mapping->kref, release_iommu_mapping);
>   }
>   EXPORT_SYMBOL_GPL(arm_iommu_release_mapping);
>   
> @@ -1660,6 +1742,14 @@ void arm_iommu_detach_device(struct device *dev)
>   		return;
>   	}
>   
> +	/*
> +	 * This pairs with arm_iommu_attach_device() on a driver-owned mapping.
> +	 * A mapping which is merely the cookie of a core-owned default domain
> +	 * must not be torn down from here.
> +	 */
> +	if (WARN_ON(!mapping->owns_domain))

As mentioned, if we can't reasonably hide the proper default domains 
from external users of to_dma_iommu_mapping(), then I don't think we 
should warn here, just treat it as a quiet no-op - the reason for the 
"kick out the ARM domain" idiom is that it's in the way of attaching to 
a driver-owned domain (whether that be a bare iommu_domain or another 
ARM dma_iommu_mapping), but a real default domain is inherently out of 
the way already. That way we can freely convert the rest of the drivers 
to use default domains without impacting their users, then clean up the 
detach pattern from the client drivers separately afterwards.

Thanks,
Robin.

> +		return;
> +
>   	iommu_detach_device(mapping->domain, dev);
>   	kref_put(&mapping->kref, release_iommu_mapping);
>   	to_dma_iommu_mapping(dev) = NULL;
> diff --git a/drivers/iommu/dma-iommu.h b/drivers/iommu/dma-iommu.h
> index 349d6a57e5a0..71b23cb698c0 100644
> --- a/drivers/iommu/dma-iommu.h
> +++ b/drivers/iommu/dma-iommu.h
> @@ -7,25 +7,24 @@
>   
>   #include <linux/iommu.h>
>   
> -#ifdef CONFIG_IOMMU_DMA
> +/*
> + * Both dma-iommu.c and arch/arm/mm/dma-mapping.c implement functions to set up
> + * IOMMU_DOMAIN_DMA default domains. Only one provider can be compiled in at a
> + * time.
> + */
> +#if defined(CONFIG_ARM_DMA_USE_IOMMU)
> +
> +#include <asm/dma-iommu.h>
> +
> +#elif defined(CONFIG_IOMMU_DMA)
>   
>   void iommu_setup_dma_ops(struct device *dev, struct iommu_domain *domain);
>   void iommu_teardown_dma_ops(struct device *dev);
>   
>   int iommu_get_dma_cookie(struct iommu_domain *domain);
>   void iommu_put_dma_cookie(struct iommu_domain *domain);
> -void iommu_put_msi_cookie(struct iommu_domain *domain);
>   
> -int iommu_dma_init_fq(struct iommu_domain *domain);
> -
> -void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list);
> -
> -int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
> -		     phys_addr_t msi_addr);
> -
> -extern bool iommu_dma_forcedac;
> -
> -#else /* CONFIG_IOMMU_DMA */
> +#else
>   
>   static inline void iommu_setup_dma_ops(struct device *dev,
>   				       struct iommu_domain *domain)
> @@ -36,11 +35,6 @@ static inline void iommu_teardown_dma_ops(struct device *dev)
>   {
>   }
>   
> -static inline int iommu_dma_init_fq(struct iommu_domain *domain)
> -{
> -	return -EINVAL;
> -}
> -
>   static inline int iommu_get_dma_cookie(struct iommu_domain *domain)
>   {
>   	return -ENODEV;
> @@ -50,6 +44,28 @@ static inline void iommu_put_dma_cookie(struct iommu_domain *domain)
>   {
>   }
>   
> +#endif
> +
> +#ifdef CONFIG_IOMMU_DMA
> +
> +void iommu_put_msi_cookie(struct iommu_domain *domain);
> +
> +int iommu_dma_init_fq(struct iommu_domain *domain);
> +
> +void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list);
> +
> +int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
> +		     phys_addr_t msi_addr);
> +
> +extern bool iommu_dma_forcedac;
> +
> +#else /* CONFIG_IOMMU_DMA */
> +
> +static inline int iommu_dma_init_fq(struct iommu_domain *domain)
> +{
> +	return -EINVAL;
> +}
> +
>   static inline void iommu_put_msi_cookie(struct iommu_domain *domain)
>   {
>   }
> 


