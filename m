Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF980E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CidlJbNCaCbOtuaoIS2s9YYuSee+UrD4KaGM964Hko=; b=Y8gFQltaN6XtM20wQk2YPqBNVS
	9AL9v7/HcGTbhUDodp16fzgUKzWFWvU60LeDkZo2gxuQX6DLd581ujOimbEOXasWiAtD6e4gwEZ0F
	wnPBv7ZT/HOulQ11ENTof3fsiAtIuVLDb64lpKClrJGM6e+39BUKq5gh5qme1YU1B1mibIpJNpX4K
	IAYi62S60UO2NMYy0kwTDamMrMAP3+Zh/xY5sfmJcYVyKxlqRXaBV5oYiJ2OSN2DgLEOh/fV+fWZM
	fcRVO3k0/dWOQae+cr2y3r2DxMPB92E04WmlUvyLLyGyS7JII3JmxIW7zXaHYRrZSucyjpVch+3Ur
	jGPxerVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFyH-00000001rrn-4B9R;
	Thu, 19 Dec 2024 12:49:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFxA-00000001rkf-37Qc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 12:48:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21DFC1477;
	Thu, 19 Dec 2024 04:49:00 -0800 (PST)
Received: from [10.57.1.39] (unknown [10.57.1.39])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9E2C3F7B4;
	Thu, 19 Dec 2024 04:48:28 -0800 (PST)
Message-ID: <ce4c8db4-4895-426b-8d9d-97dc5d74fbc4@arm.com>
Date: Thu, 19 Dec 2024 12:48:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 55/58] drivers/iommu: Add deferred map_sg
 operations
To: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org,
 jean-philippe@linaro.org, jgg@ziepe.ca, nicolinc@nvidia.com,
 vdonnefort@google.com, qperret@google.com, tabba@google.com,
 danielmentz@google.com, tzukui@google.com
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212180423.1578358-56-smostafa@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241212180423.1578358-56-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_044832_892291_1DC18BE4 
X-CRM114-Status: GOOD (  33.54  )
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

On 2024-12-12 6:04 pm, Mostafa Saleh wrote:
> With pKVM SMMUv3 driver which para-virtualizes the IOMMU in the
> hypervisor, has an extra overhead with map_sg, as it loops over
> iommu_map, and for each map requires context switching, disabling
> interrupts...
> 
> Instead, add an new domain operations:
> - alloc_cookie_sg: Allocate a new sg deferred cookie
> - add_deferred_map_sg: Add a mapping to the cookie
> - consume_deferred_map_sg: Consume and release the cookie
> 
> Alternativly, we can pass the sg list as is. However, this would
> duplicate some of the logic and it would make more sense to
> conolidate all the sg list parsing for IOMMU drivers in one place.

But why bother with fiddly overly-specific machinery at all when you can 
already make ->map_pages asynchronous and consolidate the expensive part 
into ->iotlb_sync_map in general, like s390 does?

Thanks,
Robin.

> virtio-iommu is another IOMMU that can benfit from this, but it
> would need to have a new operation that standerdize passing
> an sglist based on these ops.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>   drivers/iommu/iommu.c | 53 +++++++++++++++++++++++++++++++++++++++++--
>   include/linux/iommu.h | 19 ++++++++++++++++
>   2 files changed, 70 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 83c8e617a2c5..3a3c48631dd6 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2608,6 +2608,37 @@ size_t iommu_unmap_fast(struct iommu_domain *domain,
>   }
>   EXPORT_SYMBOL_GPL(iommu_unmap_fast);
>   
> +static int __iommu_add_sg(struct iommu_map_cookie_sg *cookie_sg,
> +			  unsigned long iova, phys_addr_t paddr, size_t size)
> +{
> +	struct iommu_domain *domain = cookie_sg->domain;
> +	const struct iommu_domain_ops *ops = domain->ops;
> +	unsigned int min_pagesz;
> +	size_t pgsize, count;
> +
> +	if (unlikely(!(domain->type & __IOMMU_DOMAIN_PAGING)))
> +		return -EINVAL;
> +
> +	if (WARN_ON(domain->pgsize_bitmap == 0UL))
> +		return -ENODEV;
> +
> +	/* find out the minimum page size supported */
> +	min_pagesz = 1 << __ffs(domain->pgsize_bitmap);
> +
> +	/*
> +	 * both the virtual address and the physical one, as well as
> +	 * the size of the mapping, must be aligned (at least) to the
> +	 * size of the smallest page supported by the hardware
> +	 */
> +	if (!IS_ALIGNED(iova | paddr | size, min_pagesz)) {
> +		pr_err("unaligned: iova 0x%lx pa %pa size 0x%zx min_pagesz 0x%x\n",
> +		       iova, &paddr, size, min_pagesz);
> +		return -EINVAL;
> +	}
> +	pgsize = iommu_pgsize(domain, iova, paddr, size, &count);
> +	return ops->add_deferred_map_sg(cookie_sg, paddr, pgsize, count);
> +}
> +
>   ssize_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
>   		     struct scatterlist *sg, unsigned int nents, int prot,
>   		     gfp_t gfp)
> @@ -2617,6 +2648,9 @@ ssize_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
>   	phys_addr_t start;
>   	unsigned int i = 0;
>   	int ret;
> +	bool deferred_sg = ops->alloc_cookie_sg && ops->add_deferred_map_sg &&
> +			   ops->consume_deferred_map_sg;
> +	struct iommu_map_cookie_sg *cookie_sg;
>   
>   	might_sleep_if(gfpflags_allow_blocking(gfp));
>   
> @@ -2625,12 +2659,24 @@ ssize_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
>   				__GFP_HIGHMEM)))
>   		return -EINVAL;
>   
> +	if (deferred_sg) {
> +		cookie_sg = ops->alloc_cookie_sg(iova, prot, nents, gfp);
> +		if (!cookie_sg) {
> +			pr_err("iommu: failed alloc cookie\n");
> +			return -ENOMEM;
> +		}
> +		cookie_sg->domain = domain;
> +	}
> +
>   	while (i <= nents) {
>   		phys_addr_t s_phys = sg_phys(sg);
>   
>   		if (len && s_phys != start + len) {
> -			ret = __iommu_map(domain, iova + mapped, start,
> -					len, prot, gfp);
> +			if (deferred_sg)
> +				ret = __iommu_add_sg(cookie_sg, iova + mapped, start, len);
> +			else
> +				ret = __iommu_map(domain, iova + mapped, start,
> +						  len, prot, gfp);
>   
>   			if (ret)
>   				goto out_err;
> @@ -2654,6 +2700,9 @@ ssize_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
>   			sg = sg_next(sg);
>   	}
>   
> +	if (deferred_sg)
> +		ops->consume_deferred_map_sg(cookie_sg);
> +
>   	if (ops->iotlb_sync_map) {
>   		ret = ops->iotlb_sync_map(domain, iova, mapped);
>   		if (ret)
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index c75877044185..5e60ac349228 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -601,6 +601,14 @@ struct iommu_ops {
>   	u8 user_pasid_table:1;
>   };
>   
> +/**
> + * struct iommu_map_cookie_sg - Cookie for a deferred map sg
> + * @domain: Domain for the sg lit
> + */
> +struct iommu_map_cookie_sg {
> +	struct iommu_domain *domain;
> +};
> +
>   /**
>    * struct iommu_domain_ops - domain specific operations
>    * @attach_dev: attach an iommu domain to a device
> @@ -638,6 +646,11 @@ struct iommu_ops {
>    * @enable_nesting: Enable nesting
>    * @set_pgtable_quirks: Set io page table quirks (IO_PGTABLE_QUIRK_*)
>    * @free: Release the domain after use.
> + * @alloc_cookie_sg: Allocate a cookie that would be used to create
> + *		     a sg list, filled from the next functions
> + * @add_deferred_map_sg: Add a mapping to a cookie of a sg list.
> + * @consume_deferred_map_sg: Consume the sg list as now all mappings are added,
> + *			     it should also release the cookie as it's not used.
>    */
>   struct iommu_domain_ops {
>   	int (*attach_dev)(struct iommu_domain *domain, struct device *dev);
> @@ -668,6 +681,12 @@ struct iommu_domain_ops {
>   				  unsigned long quirks);
>   
>   	void (*free)(struct iommu_domain *domain);
> +
> +	struct iommu_map_cookie_sg *(*alloc_cookie_sg)(unsigned long iova, int prot,
> +						       unsigned int nents, gfp_t gfp);
> +	int (*add_deferred_map_sg)(struct iommu_map_cookie_sg *cookie,
> +				   phys_addr_t paddr, size_t pgsize, size_t pgcount);
> +	int (*consume_deferred_map_sg)(struct iommu_map_cookie_sg *cookie);
>   };
>   
>   /**


