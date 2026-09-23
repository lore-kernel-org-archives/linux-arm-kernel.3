Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EDEC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLOUNMxbH4leB6t2EuFHXMPMUGDuNnfudM9PRhQyXZg=; b=FJCowBpNHaIeZhS/BXUpXizdFv
	l/nt8y9iu3Dc7tWW8BI7JoIz+yYEuoZUuScohTXdmIOG6rmskqCdzaeDSkf7DKLRO7YmzUhkbsXtH
	TTPahWcPMCcWKyHhy7ZV70FW31IcBhXmdkP0ko6TOewSfvHEH2v+P5rGdZ1+IFM5YUjRVspCvhgv8
	w0s3hVcAuuWFLUl7jTGHnDH1mcAOCswMyvid+1ozBXG3tzXU/wFEDnbq4+DxGBkTZ7vnC49UFEnq3
	zUDjcWuLhRQis2BBGqCwv91le6UUyC+SPYUG6l1O0B2lZcTvWoSOMzyXIncpfBZmcNTfvbxvyOrn9
	zKOwj20g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KKR-00000007upf-0dFG;
	Wed, 23 Sep 2026 10:35:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KKO-00000007uou-1Tot
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:35:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 451161570;
	Wed, 23 Sep 2026 03:35:47 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5ABC3F86C;
	Wed, 23 Sep 2026 03:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790159750; bh=v9G6lJSh6OMVo7mppK0Hk+jifrbC6I47Gu6icD1n1fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ewmaVXkxLy98D6T0jp9a151FmO0Op77gHcimtZp1SgvTUTUKuJQ5luNggprLpjZMg
	 JZOuDeYoO+3y/I6Omc7mGGCSkjuReFAYGypqx14TBycfBylH51cJ9b2S2q0oi4rNBO
	 xrDH/ShQcUVeiWgWolvO3OpJNpP1DHa8nrUOGvJA=
Date: Wed, 23 Sep 2026 11:35:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 06/13] dma-contiguous: Accept an explicit minimum
 alignment
Message-ID: <arOrgRfi1k12clT7@arm.com>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-7-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921144847.501151-7-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_033552_454605_14F51E97 
X-CRM114-Status: GOOD (  10.64  )
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

On Mon, Sep 21, 2026 at 08:18:40PM +0530, Aneesh Kumar K.V (Arm) wrote:
> @@ -125,7 +126,8 @@ static inline int dma_contiguous_reserve_area(phys_addr_t size,
>  	return -ENOSYS;
>  }
>  static inline struct page *dma_alloc_from_contiguous(struct device *dev,
> -		size_t count, unsigned int order, bool no_warn)
> +		size_t count, unsigned int order, unsigned int required_order,
> +		bool no_warn)
>  {
>  	return NULL;
>  }
> @@ -136,7 +138,7 @@ static inline bool dma_release_from_contiguous(struct device *dev,
>  }
>  /* Use fallback alloc() and free() when CONFIG_DMA_CMA=n */
>  static inline struct page *dma_alloc_contiguous(struct device *dev, size_t size,
> -		gfp_t gfp)
> +		gfp_t gfp, unsigned int align_order)

Can we not just bake the alignment further down in these functions
rather than getting the callers to pass the {required,align}_order?

-- 
Catalin

