Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4B7C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKoCbKydWc4Mvwm50s3elQOU6BDPIGH2uXJVEWSMP9g=; b=yg+5cRrlE3CYve4ZKxzXpBFVpS
	tStbSmLhP5mQ5wFr4uGsYIYRNrSiLEm3j4yQ0XdfAp7itxhAlXcUGdBGXCQH3i6ACDU3HrXxRzyGR
	UJOpzmVMvEWjUinG6DDn03rPSX2G6xZ5fTdVuEF7vBLjZ3YwN72Rhlp2AXJTl8yTnJzLjw/Lf02vQ
	CcoVMUeXtvc9RJVi8Az+9qoI41Nu8RmcJ/iAkPTBAvuD6GTxRENkP1DEWxpMF17KCwWx7jW1okNFa
	uRCFsagqGRq4BzB0DyhprW7di6stglrSs3I0HFLM911fruFQb0aYonKBJ9JG6OOmDpfwSdX/TMAS+
	tp7hkdzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZOE-0000000EgpR-2gCa;
	Fri, 18 Sep 2026 14:16:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZOC-0000000Egp7-15bQ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 14:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EKoCbKydWc4Mvwm50s3elQOU6BDPIGH2uXJVEWSMP9g=; b=otlJ1qIyilZcSlGxJ4uTiT9AnV
	/lVkUjbcmLeVZaU9GRYnLVaJwlJHRc4OpVeHa97RPtAIDfcfVuaahnEpI0ESykNSvwH3hRynsZx77
	gnjBRDcznOJb1o/xxM5kH4wtpTRbrr005ggOLjTDAN7J20mjgCQ7/kJhpZnbGuQyLU2nK1sYXwgiW
	qLR4xCgw2JtZmy+DmS5IyRD09dFg210MusdHj0MqCNpn/kd7AVYPcRlJxf2mWCz4whnggRpEIrMNj
	dllY2NstYCS2NxWVb0IK6C6k4sYCOKMa+aqzhbeA7EOKbnDya+Qy7uCB3VrzpOZNTPxPTYvk5d2Nh
	HV1WhmrQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7ZO8-0000000ABxM-11rw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:16:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB9761C00;
	Fri, 18 Sep 2026 07:16:22 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65BA43F86C;
	Fri, 18 Sep 2026 07:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789740986; bh=YqrCUZ8I8X0j3hoH420Py4EkqpAdfkVvBg2xqWOej2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWU9O+GwOITgZTuxF750EuQlx6vzKzmlnFP69ErXUkCFrjt3Z6vDWsBmGYWKcQs/H
	 Q/dSP51xK3EEDoSKaO1VGr9wUiu9nMwmEDt9EzLrDBYZRKzOiZ5KKcpd4WcgJ2C7+I
	 y9Gg2hEfTEY8s1kVGK/+6Uf2nGbYt25MII5AT5fw=
Date: Fri, 18 Sep 2026 15:16:21 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 4/9] dma-direct: Align CoCo shared DMA allocations to
 the shared granule size
Message-ID: <aq1HtSvwDHouhgZl@arm.com>
References: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
 <20260904103452.1197239-5-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904103452.1197239-5-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_151628_512751_A5F19A8E 
X-CRM114-Status: GOOD (  16.62  )
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

On Fri, Sep 04, 2026 at 04:04:47PM +0530, Aneesh Kumar K.V (Arm) wrote:
> @@ -419,6 +420,14 @@ struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp,
>  #ifdef CONFIG_DMA_NUMA_CMA
>  	int nid = dev_to_node(dev);
>  #endif
> +	/*
> +	 * CoCo shared allocations require CMA alignment large enough for the
> +	 * architecture's shared-buffer granule.
> +	 */
> +	if (attrs & __DMA_ATTR_ALLOC_CC_SHARED) {
> +		if (get_order(mem_cc_shared_granule_size()) > CONFIG_CMA_ALIGNMENT)
> +			return NULL;
> +	}

[...]

> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> index 00f422a1e896..fc4a834aaa14 100644
> --- a/kernel/dma/pool.c
> +++ b/kernel/dma/pool.c
> @@ -91,7 +91,9 @@ static int atomic_pool_expand(struct dma_gen_pool *dma_pool, size_t pool_size,
>  	void *addr;
>  	int ret = -ENOMEM;
>  	pgprot_t prot __maybe_unused;
> +	unsigned int min_encrypt_order = get_order(mem_cc_shared_granule_size());
>  
> +	pool_size = mem_cc_align_to_shared_granule(pool_size);
>  	/* Cannot allocate larger than MAX_PAGE_ORDER */
>  	order = min(get_order(pool_size), MAX_PAGE_ORDER);
>  
> @@ -102,7 +104,7 @@ static int atomic_pool_expand(struct dma_gen_pool *dma_pool, size_t pool_size,
>  							 order, false);
>  		if (!page)
>  			page = alloc_pages(gfp | __GFP_NOWARN, order);
> -	} while (!page && order-- > 0);
> +	} while (!page && order-- > min_encrypt_order);

I can see dma_alloc_from_contiguous() called by atomic_pool_expand()
clamps the alignment to CONFIG_CMA_ALIGNMENT and this one has a minimum
value of 2. Allocation will silently succeed. Not sure of the best fix,
maybe do a check here before calling the dma alloc function or just
return NULL as in dma_alloc_contiguous().

-- 
Catalin

