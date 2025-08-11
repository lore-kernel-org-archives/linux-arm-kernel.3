Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DA4CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwUhsFOiIi6zVcaJg3YrevuM/Efz5wgM79z0k/2+V58=; b=o5tbIxnDpzhurfHc6uQRnGEcK4
	8pVVt4DsLL+OJ+syj8fqt1OWNz3STBipbu34cLpxqnHBKmWfiTKK81C+R/4G36euI76+FhHES7Ge0
	CKK7F5I6BpVqoeLW7XRi73bTnWxnHekTo6/DnoTHDoB+4qihf17JurUMQBkHEk8kGoTZ/JqjXWV4C
	FiOPka3bOsuuegKwrMM0gVqNU77eQBM6X1+AskkFtlo7gwZ/za/W/1yo0EdlGh3HEfYUkVmqJRAno
	cYTMwdCplWQ4mdde7gqj5J+kD6hK2xuPFdojJVndjh8EmVJurZwxGYsQBws8svV/KkvMt0xlHqDvj
	ENqx/yfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulb90-00000009Io8-2k4t;
	Mon, 11 Aug 2025 22:37:30 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulb6O-00000009IfW-2p7G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 22:34:49 +0000
Received: from localhost (unknown [20.236.11.102])
	by linux.microsoft.com (Postfix) with ESMTPSA id 766862118279;
	Mon, 11 Aug 2025 15:34:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 766862118279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1754951686;
	bh=IwUhsFOiIi6zVcaJg3YrevuM/Efz5wgM79z0k/2+V58=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NC8fmStEktFHXs7Gwd5+MBF/sOxe/YRuwXQMP7Cdg+03h1qB9i7z25fjbxNTfeJB2
	 HJs+BEDX2sjBvRhUBvPOeI4Cvh3CkAvE1SK931K1TBY6QoisYwInK5UxEvhzD1jKiM
	 v1dAlPzV+DO2ajr4BftKMDV3pGyAsQQN4RRFhBPg=
Date: Mon, 11 Aug 2025 15:34:44 -0700
From: Jacob Pan <jacob.pan@linux.microsoft.com>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, virtualization@lists.linux.dev, jgg@ziepe.ca,
 will@kernel.org, eric.auger@redhat.com, code@tyhicks.com,
 eahariha@linux.microsoft.com, vijayb@linux.microsoft.com,
 bboscaccy@linux.microsoft.com
Subject: Re: [PATCH v3 3/3] arm-smmu: select suitable MSI IOVA
Message-ID: <20250811153444.000071ab@linux.microsoft.com>
In-Reply-To: <20250806215539.1240561-4-shyamsaini@linux.microsoft.com>
References: <20250806215539.1240561-1-shyamsaini@linux.microsoft.com>
	<20250806215539.1240561-4-shyamsaini@linux.microsoft.com>
Organization: LSG
X-Mailer: Claws Mail 3.21.0 (GTK+ 2.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_153448_766532_B7CA3EB6 
X-CRM114-Status: GOOD (  25.74  )
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

On Wed,  6 Aug 2025 14:55:39 -0700
Shyam Saini <shyamsaini@linux.microsoft.com> wrote:

> Currently ARM SMMU drivers hardcode PCI MSI IOVA address.
> Not all the platform have same memory mappings and some platform
> could have this address already being mapped for something else.
> This can lead to collision and as a consequence the MSI IOVA addr
> range is never reserved.
> 
> Fix this by reserving faulty IOVA range and selecting alternate
> MSI_IOVA suitable for the intended platform.
> 
> Example of reserving faulty IOVA range for PCIE device in the DTS:
> 
> reserved-memory {
> 	#address-cells = <2>;
> 	#size-cells = <2>;
> 	faulty_iova: resv_faulty {
> 		iommu-addresses = <&pcieX 0x0 0x8000000 0x0 0x100000>;
> 	};
> };
> 
> &pcieX {
> 	memory-region = <&faulty_iova>;
> };
> 
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Link: https://lore.kernel.org/linux-iommu/20250416181759.GF493866@ziepe.ca/
> Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 27
> +++++++++++++++------ drivers/iommu/arm/arm-smmu/arm-smmu.c       |
> 27 +++++++++++++++------ include/linux/iommu.h
> | 25 +++++++++++++++++++ 3 files changed, 65 insertions(+), 14
> deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c index
> 5f46140a8f3fa..0dfb522e173f0 100644 ---
> a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c +++
> b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c @@ -3642,17 +3642,30 @@
> static int arm_smmu_of_xlate(struct device *dev, static void
> arm_smmu_get_resv_regions(struct device *dev, struct list_head *head)
>  {
> -	struct iommu_resv_region *region;
>  	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
>  
> -	region = iommu_alloc_resv_region(MSI_IOVA_BASE,
> MSI_IOVA_LENGTH,
> -					 prot, IOMMU_RESV_SW_MSI,
> GFP_KERNEL);
> -	if (!region)
> -		return;
> -
> -	list_add_tail(&region->list, head);
> +	static const u64 msi_bases[] = { MSI_IOVA_BASE,
> MSI_IOVA_BASE2 }; 
>  	iommu_dma_get_resv_regions(dev, head);
> +
> +	/*
> +	 * Use the first msi_base that does not intersect with a
> platform
> +	 * reserved region. The SW MSI base selection is entirely
> arbitrary.
> +	 */
> +	for (int i = 0; i != ARRAY_SIZE(msi_bases); i++) {
nit: i < ARRAY_SIZE(msi_bases) is more robust

> +		struct iommu_resv_region *region;
> +
> +		if (resv_region_intersects(msi_bases[i],
> MSI_IOVA_LENGTH, head))
> +			continue;
> +
> +		region = iommu_alloc_resv_region(msi_bases[i],
> MSI_IOVA_LENGTH, prot,
> +						 IOMMU_RESV_SW_MSI,
> GFP_KERNEL);
> +		if (!region)
> +			return;
> +
> +		list_add_tail(&region->list, head);
> +		return;
> +	}

Maybe add a warning if both msi_bases are conflicting. Or you can keep
searching until a non-intersecting region is found. e.g. let
resv_region_intersects() return a valid region.

>  }
>  
>  /*
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> b/drivers/iommu/arm/arm-smmu/arm-smmu.c index
> 4a07650911991..84b74b8519386 100644 ---
> a/drivers/iommu/arm/arm-smmu/arm-smmu.c +++
> b/drivers/iommu/arm/arm-smmu/arm-smmu.c @@ -1600,17 +1600,30 @@
> static int arm_smmu_of_xlate(struct device *dev, static void
> arm_smmu_get_resv_regions(struct device *dev, struct list_head *head)
>  {
> -	struct iommu_resv_region *region;
>  	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
>  
> -	region = iommu_alloc_resv_region(MSI_IOVA_BASE,
> MSI_IOVA_LENGTH,
> -					 prot, IOMMU_RESV_SW_MSI,
> GFP_KERNEL);
> -	if (!region)
> -		return;
> -
> -	list_add_tail(&region->list, head);
> +	static const u64 msi_bases[] = { MSI_IOVA_BASE,
> MSI_IOVA_BASE2 }; 
>  	iommu_dma_get_resv_regions(dev, head);
> +
> +	/*
> +	 * Use the first msi_base that does not intersect with a
> platform
> +	 * reserved region. The SW MSI base selection is entirely
> arbitrary.
> +	 */
> +	for (int i = 0; i != ARRAY_SIZE(msi_bases); i++) {
> +		struct iommu_resv_region *region;
> +
> +		if (resv_region_intersects(msi_bases[i],
> MSI_IOVA_LENGTH, head))
> +			continue;
> +
> +		region = iommu_alloc_resv_region(msi_bases[i],
> MSI_IOVA_LENGTH, prot,
> +						 IOMMU_RESV_SW_MSI,
> GFP_KERNEL);
> +		if (!region)
> +			return;
> +
> +		list_add_tail(&region->list, head);
> +		return;
> +	}
>  }
>  
>  static int arm_smmu_def_domain_type(struct device *dev)
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 517f908296436..6750ecdebaa94 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -1509,14 +1509,39 @@ static inline void iommu_debugfs_setup(void)
> {} 
>  #ifdef CONFIG_IOMMU_DMA
>  #define MSI_IOVA_BASE        0x8000000
> +#define MSI_IOVA_BASE2       0xA0000000
>  #define MSI_IOVA_LENGTH      0x100000
>  
> +static inline bool resv_region_intersects(phys_addr_t msi_base,
> size_t length,
> +					  struct list_head
> *resv_region_list) +{
> +	struct iommu_resv_region *region;
> +	phys_addr_t start, end, resv_region_end;
> +
> +	start = msi_base;
> +	end = start + length - 1;
> +	list_for_each_entry(region, resv_region_list, list) {
> +		resv_region_end = region->start + region->length - 1;
> +		/* overlap detected */
> +		if (!(start > resv_region_end || end <
> region->start))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t
> base); #else /* CONFIG_IOMMU_DMA */
>  static inline int iommu_get_msi_cookie(struct iommu_domain *domain,
> dma_addr_t base) {
>  	return -ENODEV;
>  }
> +
> +static inline bool resv_region_intersects(phys_addr_t msi_base,
> size_t length,
> +					  struct list_head
> *resv_region_list) +{
> +	return false;
> +}
>  #endif	/* CONFIG_IOMMU_DMA */
>  
>  /*


