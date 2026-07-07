Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76ED6C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTfR+wHBxAreRe0VNbdWPjK32qxCiRZ4OQnybQ+8rCc=; b=xa8kXRVaR50GmIqDiSv+gtIZ76
	zYoOW7uPOlNi6g5LB2NINTz2z42+qYvQbKO92gBM1UL0DwoXYTVhMHI/ZPAp3MANf5Lk35A/hEJhk
	/dapagaRNm9ur8J4sSQNuLJ287DfaZp2fW/Go5w8rgu8t4DQWmc89nEJpQjrmgGKD+uvzy4l/VzFa
	/qdaixnSJV27zi/gZGt1dbE4CPhREJTgiwyo9EW23wbJkqgYj7sO6MUvu6guy2Fc11yVSfLPRvBjM
	WcIXZDhw8I9tpgMGWeU5Jeo/G+i5R/IjRyguIjDcavNwFtGsb1ImfoJLIaRA0OXyUTCMD9zC3vhXs
	jrspXaSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4Qy-0000000EuBO-0dz4;
	Tue, 07 Jul 2026 11:57:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4Qw-0000000EuAU-0vau
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:57:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493b8d92a4eso29065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 04:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783425468; x=1784030268; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NTfR+wHBxAreRe0VNbdWPjK32qxCiRZ4OQnybQ+8rCc=;
        b=vWweM/qhxYBX1aW4PRvP++JpWe/9i9e/D7kHILMpMJ//PaY/l44ou9TqT/xx+NKsSI
         dNmUZXB6qZcW1mwFz8v1VTRJ/VFPI9h5H+EzlcDtvh2gq3HLNmaGRzFUScgZdeGxCTNm
         RJC61yZpZckGd5s+yWiFQn2MSRVBMM3BvpdpUgUH4rWrL+6s3wBdykHPy2rrCHiPsA1M
         5yJJXATj3mmRgYGRtVp0qesSOObAWjpuEoWrIymzB5FtSia/XLpT/9uV64A72QR0boG/
         tZ2I2aeOdR321YjMXEzH3Jz4WtF/tXYgDGyUq01ERZoOKgmpx2Tt5GGUoWJIGdgamebB
         N6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783425468; x=1784030268;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NTfR+wHBxAreRe0VNbdWPjK32qxCiRZ4OQnybQ+8rCc=;
        b=L/X81Q1y1uw3/9FZYh8bIAd673VlvK7LPm+PyV8w6VTZHEjBrmb4VqBrcNFjGaNz1C
         XETPTpzVZ/lsnsFzSpRyXTu4vrUe/Q9MqjSsg84T6EXC5+5elEzUIvLvC6RUi2ymIK2e
         q7qePgVX2MiB18ap1Va7SSV5Wz43n61237ZDFyoLNplshqwYBDiDKtdVjWmCeMAeXcdp
         6uVxFAwaUvMnXSl6RhwUGoOU/L6unA2Ch/04catVerEr6fDbt6BdeYNodiRJRAsc0tX+
         Qm2a335+WVpvassisx56lqbSDZrwWCSzL69y9DsWPPICXtrRLwk+f76nQLftjtYkSAgs
         9Dlg==
X-Forwarded-Encrypted: i=1; AHgh+RrEABZB7ofZ4La40U/83iqbEbRtsDiVPnDl7mrKhZBW8VB0uDfBNWvYiBPAe91pDoA7MmW8OKborRGRLhUZX+/T@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc62um9h38H4JDyBFqZxL+UjxAT+ZRGE6V8R1mUQg9o7xYF6X+
	ysfhJbrl18JV/siGDBW7m+NLE6ww6X/2WP8VonrO2pZsT7tjB1N62+NNPEEP9jwf0A==
X-Gm-Gg: AfdE7cmxf1M518uTWDsJphjfZOIC6Llq0il0Md3sYUeItMzNRwfpn7MJHiaUp6NXBG4
	et8ic0F85YrtDJRwD2zOPOIpXTBG6vgZgn7WR4B9gh9ezPrPtsGRSjIcbvyH1CyTp5950YFj+bg
	AUhhAL8xEvrJhBAKx7Go8XIGW9oMHA7NFlB1Xx0HXlfm+wmHKoIprsYK8TKE1XIdUsWovBHXGBM
	85t+IhkoBRL49veej6DgCSrH+v+2CDP8Ykq2Fizwg/WmAzTZNjOBr4npHJf5p0wQACrdugjHa2w
	lqE7GgXkxCShHdbPVezFe/AhXHeEf6cN1Nodfj3DzPiMqawJMAw/Cxhs8xynl5TApr+J9huVki8
	vY/3iRHH8OoNEKE+7O0UOzjyzU2cJqmmIJscEFPq+k8vBtLmKuDPm/+aNItsgHllqNVFPbqhmi9
	4s7o9KvmMycz6Rsid8SopuElyjSQRJn3ZfdHVOfNrfxlGslSZk
X-Received: by 2002:a05:600c:e489:20b0:493:a96b:f9fe with SMTP id 5b1f17b1804b1-493e10ce831mr496815e9.4.1783425468224;
        Tue, 07 Jul 2026 04:57:48 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f4ef53sm56007625e9.8.2026.07.07.04.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:57:47 -0700 (PDT)
Date: Tue, 7 Jul 2026 11:57:41 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v2 6/8] iommu/arm-smmu-v3: Populate the tlbi at the top
 of the call chain
Message-ID: <akzptWVIihnH79Hb@google.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <6-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_045750_298672_AFAEA5DD 
X-CRM114-Status: GOOD (  28.74  )
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

On Mon, Jul 06, 2026 at 01:26:43PM -0300, Jason Gunthorpe wrote:
> Each of these has their own unique situation, populate the tlbi right
> at the top and pass it into arm_smmu_domain_inv_range(). They will
> diverge further when the iommupt invalidation scheme is introduced.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   | 21 ++++----
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 51 +++++++++----------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 13 +++--
>  3 files changed, 45 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> index 5d4dde3d1cfe87..e6001913e2b043 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> @@ -139,16 +139,19 @@ static void arm_smmu_mm_arch_invalidate_secondary_tlbs(struct mmu_notifier *mn,
>  {
>  	struct arm_smmu_domain *smmu_domain =
>  		container_of(mn, struct arm_smmu_domain, mmu_notifier);
> -	size_t size;
> +	struct arm_smmu_tlbi tlbi = {
> +		.smmu_domain = smmu_domain,
> +		.iova = start,
> +		/*
> +		 * The mm_types defines vm_end as the first byte after the end
> +		 * address, different from IOMMU subsystem using the last
> +		 * address of an address range.
> +		 */
> +		.size = end - start,
> +		.iopte_granule = PAGE_SIZE,
> +	};
>  
> -	/*
> -	 * The mm_types defines vm_end as the first byte after the end address,
> -	 * different from IOMMU subsystem using the last address of an address
> -	 * range. So do a simple translation here by calculating size correctly.
> -	 */
> -	size = end - start;
> -
> -	arm_smmu_domain_inv_range(smmu_domain, start, size, PAGE_SIZE, false);
> +	arm_smmu_domain_tlbi(&tlbi);
>  }
>  
>  static void arm_smmu_mm_release(struct mmu_notifier *mn, struct mm_struct *mm)
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index fbe3e5dc42f964..2e477f15080148 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2661,25 +2661,12 @@ static void arm_smmu_domain_tlbi_inv(struct arm_smmu_tlbi *tlbi,
>  	}
>  }
>  
> -void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
> -			       unsigned long iova, size_t size,
> -			       unsigned int granule, bool leaf)
> +void arm_smmu_domain_tlbi(struct arm_smmu_tlbi *tlbi)
>  {
> -	struct arm_smmu_tlbi tlbi = {
> -		.smmu_domain = smmu_domain,
> -		.iova = iova,
> -		.size = size,
> -		.iopte_granule = granule,
> -		.leaf_only = leaf,
> -	};
>  	struct arm_smmu_invs *invs;
>  
> -	if (!size || size == SIZE_MAX) {
> -		tlbi.single.use_full_inv = true;
> -		tlbi.range.use_full_inv = true;
> -	} else {
> -		arm_smmu_tlbi_calc_single(&tlbi);
> -	}
> +	if (!tlbi->single.use_full_inv)
> +		arm_smmu_tlbi_calc_single(tlbi);
>  
>  	/*
>  	 * An invalidation request must follow some IOPTE change and then load

The rest of the comment still refers to the old name
arm_smmu_domain_inv_range()

> @@ -2709,14 +2696,14 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
>  	smp_mb();
>  
>  	rcu_read_lock();
> -	invs = rcu_dereference(smmu_domain->invs);
> +	invs = rcu_dereference(tlbi->smmu_domain->invs);
>  
>  	/* Only precaculate RIL if it will be used. */
>  	if (invs->has_range_inv) {
> -		if (!tlbi.range.use_full_inv)
> -			arm_smmu_tlbi_calc_range(&tlbi);
> +		if (!tlbi->range.use_full_inv)
> +			arm_smmu_tlbi_calc_range(tlbi);
>  	} else {
> -		tlbi.range.use_full_inv = true;
> +		tlbi->range.use_full_inv = true;
>  	}
>  
>  	/*
> @@ -2727,10 +2714,10 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
>  		unsigned long flags;
>  
>  		read_lock_irqsave(&invs->rwlock, flags);
> -		arm_smmu_domain_tlbi_inv(&tlbi, invs);
> +		arm_smmu_domain_tlbi_inv(tlbi, invs);
>  		read_unlock_irqrestore(&invs->rwlock, flags);
>  	} else {
> -		arm_smmu_domain_tlbi_inv(&tlbi, invs);
> +		arm_smmu_domain_tlbi_inv(tlbi, invs);
>  	}
>  
>  	rcu_read_unlock();
> @@ -2750,8 +2737,14 @@ static void arm_smmu_tlb_inv_walk(unsigned long iova, size_t size,
>  				  size_t granule, void *cookie)
>  {
>  	struct arm_smmu_domain *smmu_domain = cookie;
> +	struct arm_smmu_tlbi tlbi = {
> +		.smmu_domain = smmu_domain,
> +		.iova = iova,
> +		.size = size,
> +		.iopte_granule = granule,
> +	};
>  
> -	arm_smmu_domain_inv_range(smmu_domain, iova, size, granule, false);
> +	arm_smmu_domain_tlbi(&tlbi);
>  }
>  
>  static const struct iommu_flush_ops arm_smmu_flush_ops = {
> @@ -4018,14 +4011,18 @@ static void arm_smmu_flush_iotlb_all(struct iommu_domain *domain)
>  static void arm_smmu_iotlb_sync(struct iommu_domain *domain,
>  				struct iommu_iotlb_gather *gather)
>  {
> -	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> +	struct arm_smmu_tlbi tlbi = {
> +		.smmu_domain = to_smmu_domain(domain),
> +		.iova = gather->start,
> +		.size = gather->end - gather->start + 1,
> +		.iopte_granule = gather->pgsize,
> +		.leaf_only = true,
> +	};
>  
>  	if (!gather->pgsize)
>  		return;
>  
> -	arm_smmu_domain_inv_range(smmu_domain, gather->start,
> -				  gather->end - gather->start + 1,
> -				  gather->pgsize, true);
> +	arm_smmu_domain_tlbi(&tlbi);
>  }
>  
>  static phys_addr_t
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 9d262ef6076225..5f97d1a63ebbfd 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -1169,13 +1169,18 @@ int arm_smmu_set_pasid(struct arm_smmu_master *master,
>  		       struct arm_smmu_domain *smmu_domain, ioasid_t pasid,
>  		       struct arm_smmu_cd *cd, struct iommu_domain *old);
>  
> -void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
> -			       unsigned long iova, size_t size,
> -			       unsigned int granule, bool leaf);
> +void arm_smmu_domain_tlbi(struct arm_smmu_tlbi *tlbi);
>  
>  static inline void arm_smmu_domain_inv(struct arm_smmu_domain *smmu_domain)
>  {
> -	arm_smmu_domain_inv_range(smmu_domain, 0, 0, 0, false);
> +	/* Prefilled for invalidate all */
> +	struct arm_smmu_tlbi tlbi = {
> +		.smmu_domain = smmu_domain,
> +		.single.use_full_inv = true,
> +		.range.use_full_inv = true,

Those were introduced last patch, but I am wondering if use_full_inv
should be a common field instead of having it in both single and range.

Thanks,
Mostafa

> +	};
> +
> +	arm_smmu_domain_tlbi(&tlbi);
>  }
>  
>  void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
> -- 
> 2.43.0
> 

