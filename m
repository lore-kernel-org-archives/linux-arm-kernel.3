Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0723DCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 23:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jT2+faPEqgvyyrZj7GkiI+MQEalHKPFUv4mZyF5by/U=; b=McdLpxhzDT4gsdklqOEPqa8M58
	OU83xjnpcG9Xko4nkOJbBmNDnxiqbNkQA3PnL2CUxNIDSVxY0oI5O4JyfMPJRvZm4aBbcFsJza9NM
	dJkptfMYmTvi3+YNsu1mV8Xksc5fuMd7s7JudN37eheXU+x4dJOD7Y9pWPRfjQba2Mj8kBsqfwbCQ
	w7xUPZLSmYAE7b3ZBrxsE9GvU/9b5cI+ZthTAy/iYRmoGcE/29wHQGM7N93FO77HTAFWuHL/N5b5n
	u/UdIbq6Vu/KPEG6tFdV3qfz3hmquDNRzPQzpsOnBlIb4Oqe9ZHyV4j2f8JAXBFqczM+YeRnksGwM
	i4+6MLXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTpwh-00000009ydA-2tVC;
	Sun, 31 May 2026 23:51:55 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTpwe-00000009yck-2lAo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 23:51:54 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-914ae4101b4so1244052585a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 16:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780271511; x=1780876311; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jT2+faPEqgvyyrZj7GkiI+MQEalHKPFUv4mZyF5by/U=;
        b=nlKdKAvK2OrhF4cI+lMoQ0I5UGrqhz9oDhuSGRHlWQT1nRyVvNIi+cOXydynx85P57
         wEwUTg+duGiPvGOkFXOsHx7QMlSDpOZ9dpzCYNvdFODoFi1WyQeXnT9cFMETf/ki47Qy
         aXly7tEh7saZAooQi8yakUByxyhs9bfXqJlpzi22vVtBhEJztJfU39Ol9sz7As27nuXy
         0dkKJZtc6gKYDAe/RVwHf5YHrZdT/9pJO1abhU0/YpB0IWn+jaUUdsLOxCAp6yHNGuy0
         6O7vPoeuCojF4IbqmPDW50U8hNEyUWumAfFwIkv2GrdXxSz2N0geR3EUTQwvqJaG2afA
         R64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780271511; x=1780876311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jT2+faPEqgvyyrZj7GkiI+MQEalHKPFUv4mZyF5by/U=;
        b=BfidC1MkTmERwOCWvIIbLVzPYeBAcJqCIUzFPK7gPCBTVJCxL/V1BMongzEl2R6tlP
         X9JPv81NrO85CQg2+/swnRc30zIhLCuUbypzAK5agfbDBGPfoefve9rV4sXWjFANDptY
         OC6y3Nh+HUOzDXj73c+sg/imadKuREouqMTT+TXsxgrIXww8ZQ5Edm2I1md6WVE9+hLa
         uKC/MpJj7OmawUfmDjwJFoyuS8ZDeInEBtKR4Ts0ztwojSAKLGH30FtZE130GsdAHl0e
         kPGfZUPE5KEANKmuwilfVzksxfGDMGuU12hRRBgqn4HuCXLfBJ9sY59J6FFTgAJRGPZo
         bbVw==
X-Forwarded-Encrypted: i=1; AFNElJ/38LV/dG21nYBxjTyQfKy0MlOsCeZTYTEt66rpQnrRcbijqLIP87v44rN4OJB8WhtYhI5KDzQV9agUh+gmYh/E@lists.infradead.org
X-Gm-Message-State: AOJu0Yz23PGJADVljYtTwcxIfbN6XwIKhGU9dz6pxzr0sYOsaIkdq0Tn
	nzW0DaKJPc+1fsa8FwVRbqzerfb2kQ83FvjGtsU3UeHEU8skmXcYWFu9oj+DxZ+psJh0UnoxId+
	F2bML
X-Gm-Gg: Acq92OFM1FdhsGk7Cv1be+x991fUOP1xBYrU0OMa9dDH6GnUm7huF+6fhZfQuU3hXvW
	vfZ3zhzcOedhBq8wU7+aWl3HnVpHPXItsTD2zTW7AsG2hyDGjwFlC3Ucdo/y938aiK9vphUApYU
	5TyVfB4bpVHc90G8RZPufmLM1JuNjwqiahYKMlSSD6YfvSqCYX7J9fDpO2QaldqsGCXPM2evjyA
	y7N3fJxqB6XH2ksavQckx96MvPJm9qdyVK5FHVbvbATNr0NwbQdHNQrIFKAp1cjJPrPWwn0isBi
	a1j3Azu/hGl4ZedAlHhgrR1lWumDBTo7FNp2GwRMw9hweZD9JJzXhHv8D79Hl64oR/IrmQFs/JF
	AOnri1Z3kI5ma/+FKM492+WbVg+1AAxaKi5BIZOgwy/fKvsdSlni/QuErkZWd6re35nzlvYXTM4
	Lh7Nj4/jDByZfLB/G3n1d9wuoxcPKttaUIWZnP+EPrNItwVCLz9S0u8sp1AVVxDw8+qi4wRjeRc
	IBHII5WgWjQPMrV
X-Received: by 2002:a05:620a:439b:b0:913:7bc8:79b9 with SMTP id af79cd13be357-9153d9b617bmr1323643185a.22.1780271510817;
        Sun, 31 May 2026 16:51:50 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91532473bb9sm854276585a.11.2026.05.31.16.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 16:51:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wTpwa-00000001LoH-3dmS;
	Sun, 31 May 2026 20:51:48 -0300
Date: Sun, 31 May 2026 20:51:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
	adrian.larumbe@collabora.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	liviu.dudau@arm.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, alex@shazbot.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, suravee.suthikulpanit@amd.com,
	dwmw2@infradead.org, xlpang@linux.alibaba.com,
	oliver.yang@linux.alibaba.com, shiyu.zsq@linux.alibaba.com,
	wei.guo.simon@linux.alibaba.com
Subject: Re: [PATCH 1/9] iommu: introduce iova_to_phys_length in
 iommu_domain_ops
Message-ID: <20260531235148.GV2487554@ziepe.ca>
References: <20260529115116.GR2487554@ziepe.ca>
 <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260531093637.3893199-2-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531093637.3893199-2-guanghuifeng@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_165152_820706_543B197B 
X-CRM114-Status: GOOD (  26.07  )
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

On Sun, May 31, 2026 at 05:36:29PM +0800, Guanghui Feng wrote:
> Add iova_to_phys_length callback to struct iommu_domain_ops alongside
> the existing iova_to_phys. The new callback returns both the physical
> address and the PTE mapping page size in a single page table walk.
> 
> Add iommu_iova_to_phys_length() core function that:
> - Checks ops->iova_to_phys_length first (preferred path)
> - Falls back to ops->iova_to_phys for unmigrated drivers
> 
> This enables callers like VFIO to efficiently traverse IOVA space
> by actual mapping granularity instead of fixed PAGE_SIZE steps.
> 
> Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
> Acked-by: Shiqiang Zhang <shiyu.zsq@linux.alibaba.com>
> Acked-by: Simon Guo <wei.guo.simon@linux.alibaba.com>
> ---
>  drivers/iommu/iommu.c | 34 ++++++++++++++++++++++++++++++++--
>  include/linux/iommu.h |  9 +++++++++
>  2 files changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index d1a9e713d3a0..43323229a1df 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2545,15 +2545,45 @@ void iommu_detach_group(struct iommu_domain *domain, struct iommu_group *group)
>  }
>  EXPORT_SYMBOL_GPL(iommu_detach_group);
>  
> -phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
> +/**
> + * iommu_iova_to_phys_length - Translate IOVA and return mapping page size
> + * @domain: IOMMU domain to query
> + * @iova: IO virtual address to translate
> + * @mapped_length: Output parameter for the PTE page size (e.g. 4KB/2MB/1GB)
> + *
> + * Like iommu_iova_to_phys() but additionally returns the page size of the
> + * PTE mapping at @iova through @mapped_length.
> + *
> + * Return: The physical address for the given IOVA, or 0 if no translation.
> + */

When introducing the new function I would like to fix this 0 error as
well, it should return PHYS_MAX for error

> +phys_addr_t iommu_iova_to_phys_length(struct iommu_domain *domain,
> +				       dma_addr_t iova,
> +				       size_t *mapped_length)
>  {
> +	if (mapped_length)
> +		*mapped_length = 0;
> +
>  	if (domain->type == IOMMU_DOMAIN_IDENTITY)
>  		return iova;
>  
>  	if (domain->type == IOMMU_DOMAIN_BLOCKED)
>  		return 0;

Any domain that doesn't have an op should fail, blocked is one example

>  
> -	return domain->ops->iova_to_phys(domain, iova);
> +	if (domain->ops->iova_to_phys_length)
> +		return domain->ops->iova_to_phys_length(domain, iova,
> +							mapped_length);
> +
> +	/* Fallback to legacy iova_to_phys without length info */
> +	if (domain->ops->iova_to_phys)
> +		return domain->ops->iova_to_phys(domain, iova);

If it falls back it should return something sensible for the length.

I suggest you approach the patch plan a little differently, the first
patches should implement the new function and an iommput
implementation

Arrange things so the normal iova_to_phys calls the new function if it
is available and discards the length.

Then convert callers that can take advantage of it. Have the fallback
path also compute the length by iterating internally.

Finally one patch per driver implementing the new op, this could even
be a second series.

Don't remove iova_to_phys(), it is fine for things that don't need the
length.

Jason

