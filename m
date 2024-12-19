Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76DCE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 14:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mF0heT2EsQndTEIg+1n0gHprFJ8BxQdp0xOf3Xlv8A=; b=b2XP3Nt/j+60RnBrgObaydR7wD
	zEEwOu2r30Hbi9v2J3Iy6H795X5zN+T/mqSxKHrhQHQ/vr+GZrIgTaysVN5o0cLVAS3432ZZIczjL
	JkrXE0lU1lBzVKr6ArbR6WaYOU1or90GzPOEgC4Gbe6b1qHu57MWVtpovQS5jbJEnG5pigWMkeMbF
	uWdJbzWDW7QAifx+Qb3qFdyHOkg5wdFC5AAqeUA0dz0SwzaqEMIAREXyCecjHjcr3mOGGYSd/QJTY
	aFc6juu1ROvehWAtvd3StRl3gAepnItk1fdpPr77O6LwksFf2FhC0wvQ6o3jzhmMbJeE7ew431idp
	DszJ1oNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHT4-000000023Ml-0tEE;
	Thu, 19 Dec 2024 14:25:34 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHRk-0000000237U-1WiQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 14:24:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4361d5730caso44035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 06:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734618250; x=1735223050; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0mF0heT2EsQndTEIg+1n0gHprFJ8BxQdp0xOf3Xlv8A=;
        b=ZtzbFhnMwlQw+AYANnbek8f9ODGok/wOadLFt2IBKIzFOBNI3ZSUwr2O83HtcGVPJf
         1zgRQQjz2n0ZZlHnJDuevW0bbwjSUBM16Ha0ZGsHFfDokbC5JnE6X29e/5cLtw2piLBH
         rdYAuTOKP9yzzH66npyph9zhSgOyUfeF3QY07eE9t59UPDWKQibFYr/ke0qDKTgbU+dK
         ViJ88WzOKX6PHhyV8UIw1ngS5p6OgM+5IdCtYfA2TOqV4NTWIBP8DYsAI6ZJ4k8VX0DV
         9biZ7jXCCPQG7/Lry8e1PYo3lXk/YHvr/y8p8runs37ghQ+6jLfmjZZnNBXr1k2IYWj4
         HO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734618250; x=1735223050;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0mF0heT2EsQndTEIg+1n0gHprFJ8BxQdp0xOf3Xlv8A=;
        b=iVCJf0/04bdlx/mIr/Lgupukjuewb+CAtXgKArUZsj6MIUeZWvQcqaDyc1kkxhqfFm
         OVnV2x5qYlOgROBvEtavC0wslyMuGZU8UsE9XjdrcME3+LKUEeqgjReVYTtJ6TX7rHcd
         24RB3vCG9YRV21vKFa20YdSfZCZ3z8pVRqDorJMadpZuiqboKWAV3kuVvhUrjtwkEotX
         vpmMQZcbE2L/EkrjYQDbDR8AkN1Znp0/V9s7JGvHRp6vQ06IaQ+pv0tIxjDFq6/7HRn6
         bY9Ihbj0Il3GnC0bfFiuc2I0TN1FRDqym+m+c4i2TlF/zUNdX33nL0H2NzWHDLA4rcjK
         xJKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0b7aQbuw9Z1+NDygytJdectMEM00Nfu1kKfyYyuzEnbs6pMcRQ/CGNJgNBGs9sGq1RC3nfOYqiX59u07XsHHg@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3+1fgyCgoyGy6/7ZgyUH+iRK+kkjl1UWDjR0N6NGrBVluRVwo
	CXSjSTf7VIxnRPVUeQ3LgsbJ9eXKX9uclEiv3ZUO+KzCD9SiJWyYuH7AHgS3Wg==
X-Gm-Gg: ASbGnctq0THgYJ1K/R5NyXu3YnpOPSKkWEQ1dH74a3jvdfXUQDEpwkAa94A4BKXU6x7
	lVYJJ8Y17gczkXYdiOmGTJaH3lJbnFMclnS367YAc5UiRfbwnZMd9250zsbo/PjIbJNcrrf6Cx9
	XWpE9woIyy+sCT6nu7IdDdCJPWMg8ziOdtmMfKp+Pq5qAEOJhlDbT5cIHf7LNuFKVYlxdnDV+q9
	b45/byooQGDg9wBs3MKcGaD1nu8vK6zV43J1/vBGmpRx6x5fYDepr4xMZZKn+tV4Z3qpA/u1Wbp
	CEPNoeo7zBMDyeIQ2nQ=
X-Google-Smtp-Source: AGHT+IFPdnsOq4Xdu3lmcHrohZg3ZaDg9fAxDEjwde7d0y24seJ+Gf3Cv6GehVm5ybmSKZZ/QDT42w==
X-Received: by 2002:a05:600c:1c21:b0:436:186e:13a6 with SMTP id 5b1f17b1804b1-4365e6f26b9mr1380595e9.6.1734618250380;
        Thu, 19 Dec 2024 06:24:10 -0800 (PST)
Received: from google.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c829235sm1658623f8f.15.2024.12.19.06.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 06:24:09 -0800 (PST)
Date: Thu, 19 Dec 2024 14:24:05 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org,
	jean-philippe@linaro.org, jgg@ziepe.ca, nicolinc@nvidia.com,
	vdonnefort@google.com, qperret@google.com, tabba@google.com,
	danielmentz@google.com, tzukui@google.com
Subject: Re: [RFC PATCH v2 55/58] drivers/iommu: Add deferred map_sg
 operations
Message-ID: <Z2Qshft8lQjI-x7c@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212180423.1578358-56-smostafa@google.com>
 <ce4c8db4-4895-426b-8d9d-97dc5d74fbc4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce4c8db4-4895-426b-8d9d-97dc5d74fbc4@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_062412_407904_65663EEF 
X-CRM114-Status: GOOD (  44.70  )
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

Hi Robin,

On Thu, Dec 19, 2024 at 12:48:27PM +0000, Robin Murphy wrote:
> On 2024-12-12 6:04 pm, Mostafa Saleh wrote:
> > With pKVM SMMUv3 driver which para-virtualizes the IOMMU in the
> > hypervisor, has an extra overhead with map_sg, as it loops over
> > iommu_map, and for each map requires context switching, disabling
> > interrupts...
> > 
> > Instead, add an new domain operations:
> > - alloc_cookie_sg: Allocate a new sg deferred cookie
> > - add_deferred_map_sg: Add a mapping to the cookie
> > - consume_deferred_map_sg: Consume and release the cookie
> > 
> > Alternativly, we can pass the sg list as is. However, this would
> > duplicate some of the logic and it would make more sense to
> > conolidate all the sg list parsing for IOMMU drivers in one place.
> 
> But why bother with fiddly overly-specific machinery at all when you can
> already make ->map_pages asynchronous and consolidate the expensive part
> into ->iotlb_sync_map in general, like s390 does?

This was my initial idea too. But I believe there is no enough context in
iotlb_sync_map, so we either have to create a per-domain deferred_map list
which is synced on any iotlb_sync_map, but that would require to lock the
map operation, hence impacting concurrency.

Or we have to use some complex logic to extract context from iotlb_sync_map,
(something like range iova tree in map and then on sync we can retrieve that)
That’s why I proposed this approach, where the IOMMU subsystem by design is
aware of the semantics and “helps” by providing the right data structures/calls.

I had a quick look now at s390, and it seems a bit different as they only
notify the hypervisor about the iova range being changed, and don’t need
to provide iova->paddr mapping which pKVM does.

Thanks,
Mostafa
> 
> Thanks,
> Robin.
> 
> > virtio-iommu is another IOMMU that can benfit from this, but it
> > would need to have a new operation that standerdize passing
> > an sglist based on these ops.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >   drivers/iommu/iommu.c | 53 +++++++++++++++++++++++++++++++++++++++++--
> >   include/linux/iommu.h | 19 ++++++++++++++++
> >   2 files changed, 70 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > index 83c8e617a2c5..3a3c48631dd6 100644
> > --- a/drivers/iommu/iommu.c
> > +++ b/drivers/iommu/iommu.c
> > @@ -2608,6 +2608,37 @@ size_t iommu_unmap_fast(struct iommu_domain *domain,
> >   }
> >   EXPORT_SYMBOL_GPL(iommu_unmap_fast);
> > +static int __iommu_add_sg(struct iommu_map_cookie_sg *cookie_sg,
> > +			  unsigned long iova, phys_addr_t paddr, size_t size)
> > +{
> > +	struct iommu_domain *domain = cookie_sg->domain;
> > +	const struct iommu_domain_ops *ops = domain->ops;
> > +	unsigned int min_pagesz;
> > +	size_t pgsize, count;
> > +
> > +	if (unlikely(!(domain->type & __IOMMU_DOMAIN_PAGING)))
> > +		return -EINVAL;
> > +
> > +	if (WARN_ON(domain->pgsize_bitmap == 0UL))
> > +		return -ENODEV;
> > +
> > +	/* find out the minimum page size supported */
> > +	min_pagesz = 1 << __ffs(domain->pgsize_bitmap);
> > +
> > +	/*
> > +	 * both the virtual address and the physical one, as well as
> > +	 * the size of the mapping, must be aligned (at least) to the
> > +	 * size of the smallest page supported by the hardware
> > +	 */
> > +	if (!IS_ALIGNED(iova | paddr | size, min_pagesz)) {
> > +		pr_err("unaligned: iova 0x%lx pa %pa size 0x%zx min_pagesz 0x%x\n",
> > +		       iova, &paddr, size, min_pagesz);
> > +		return -EINVAL;
> > +	}
> > +	pgsize = iommu_pgsize(domain, iova, paddr, size, &count);
> > +	return ops->add_deferred_map_sg(cookie_sg, paddr, pgsize, count);
> > +}
> > +
> >   ssize_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
> >   		     struct scatterlist *sg, unsigned int nents, int prot,
> >   		     gfp_t gfp)
> > @@ -2617,6 +2648,9 @@ ssize_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
> >   	phys_addr_t start;
> >   	unsigned int i = 0;
> >   	int ret;
> > +	bool deferred_sg = ops->alloc_cookie_sg && ops->add_deferred_map_sg &&
> > +			   ops->consume_deferred_map_sg;
> > +	struct iommu_map_cookie_sg *cookie_sg;
> >   	might_sleep_if(gfpflags_allow_blocking(gfp));
> > @@ -2625,12 +2659,24 @@ ssize_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
> >   				__GFP_HIGHMEM)))
> >   		return -EINVAL;
> > +	if (deferred_sg) {
> > +		cookie_sg = ops->alloc_cookie_sg(iova, prot, nents, gfp);
> > +		if (!cookie_sg) {
> > +			pr_err("iommu: failed alloc cookie\n");
> > +			return -ENOMEM;
> > +		}
> > +		cookie_sg->domain = domain;
> > +	}
> > +
> >   	while (i <= nents) {
> >   		phys_addr_t s_phys = sg_phys(sg);
> >   		if (len && s_phys != start + len) {
> > -			ret = __iommu_map(domain, iova + mapped, start,
> > -					len, prot, gfp);
> > +			if (deferred_sg)
> > +				ret = __iommu_add_sg(cookie_sg, iova + mapped, start, len);
> > +			else
> > +				ret = __iommu_map(domain, iova + mapped, start,
> > +						  len, prot, gfp);
> >   			if (ret)
> >   				goto out_err;
> > @@ -2654,6 +2700,9 @@ ssize_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
> >   			sg = sg_next(sg);
> >   	}
> > +	if (deferred_sg)
> > +		ops->consume_deferred_map_sg(cookie_sg);
> > +
> >   	if (ops->iotlb_sync_map) {
> >   		ret = ops->iotlb_sync_map(domain, iova, mapped);
> >   		if (ret)
> > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > index c75877044185..5e60ac349228 100644
> > --- a/include/linux/iommu.h
> > +++ b/include/linux/iommu.h
> > @@ -601,6 +601,14 @@ struct iommu_ops {
> >   	u8 user_pasid_table:1;
> >   };
> > +/**
> > + * struct iommu_map_cookie_sg - Cookie for a deferred map sg
> > + * @domain: Domain for the sg lit
> > + */
> > +struct iommu_map_cookie_sg {
> > +	struct iommu_domain *domain;
> > +};
> > +
> >   /**
> >    * struct iommu_domain_ops - domain specific operations
> >    * @attach_dev: attach an iommu domain to a device
> > @@ -638,6 +646,11 @@ struct iommu_ops {
> >    * @enable_nesting: Enable nesting
> >    * @set_pgtable_quirks: Set io page table quirks (IO_PGTABLE_QUIRK_*)
> >    * @free: Release the domain after use.
> > + * @alloc_cookie_sg: Allocate a cookie that would be used to create
> > + *		     a sg list, filled from the next functions
> > + * @add_deferred_map_sg: Add a mapping to a cookie of a sg list.
> > + * @consume_deferred_map_sg: Consume the sg list as now all mappings are added,
> > + *			     it should also release the cookie as it's not used.
> >    */
> >   struct iommu_domain_ops {
> >   	int (*attach_dev)(struct iommu_domain *domain, struct device *dev);
> > @@ -668,6 +681,12 @@ struct iommu_domain_ops {
> >   				  unsigned long quirks);
> >   	void (*free)(struct iommu_domain *domain);
> > +
> > +	struct iommu_map_cookie_sg *(*alloc_cookie_sg)(unsigned long iova, int prot,
> > +						       unsigned int nents, gfp_t gfp);
> > +	int (*add_deferred_map_sg)(struct iommu_map_cookie_sg *cookie,
> > +				   phys_addr_t paddr, size_t pgsize, size_t pgcount);
> > +	int (*consume_deferred_map_sg)(struct iommu_map_cookie_sg *cookie);
> >   };
> >   /**
> 

