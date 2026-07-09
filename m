Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D900C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MiE3f5DSGiw98Mw9G+hMtGLlBv3oVMuvCosguIRCRIE=; b=oFCDDvGHKOb857elDUjSXLO//9
	YLwGwZL3lgzPPeDQvtd7WAFfaX3XWQJaanwyaZ4Y8jkFY/n3qunj8vkmv5tNitrdXNxGpCpx6nqtP
	I+ruQfYE28dhXcX5fn5VHuq4Bjhk/ZX8rwrFDayudgj2D8cdU6+eCJs3UOF6h9hSRA3a+gww+k3sF
	5296orqUXaVksIGeWAeyPEW0d5tHDkga7XWTTMI+S3PONvkBM1q8k9Gpcg/KP+VYt/jYeQEPeYT+B
	8D5/EBM/J9FMBOl0fYAw3KH/K5HJt1WNV9jfXrx1evy+y9p+WMzZuchYknoHsGtjgeaM2vy7K9Oq5
	awFuKZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmh9-000000025tZ-1y0s;
	Thu, 09 Jul 2026 11:13:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmh5-000000025sL-3aZO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:13:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25E443570;
	Thu,  9 Jul 2026 04:13:22 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E40B83FE53;
	Thu,  9 Jul 2026 04:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783595606; bh=SAV3PQ7+eCtje2uVxH/LefEDAxakMvTJxqH9sWGHNjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqr2VgVo4J5uM+joPiCCMcuMryXYkHoDl8Yseh7vn5qnsw8KiVm31/w5zxn+qHZz6
	 FQ+PFakz3CMKt8/wA88yoTOV9CvFtW55mtYdapJsL6VEivjrkA7AVCtB4s+WoNPG6B
	 FEJ4cXCyQS9OxIYWx7h63mAscI4uPmXdfA6VwK+M=
Date: Thu, 9 Jul 2026 12:13:19 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 16/22] dma-direct: make dma_direct_map_phys() honor
 DMA_ATTR_CC_SHARED
Message-ID: <ak-CT3oanlDfgTy4@arm.com>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-17-aneesh.kumar@kernel.org>
 <ak42F240d-53QeFN@arm.com>
 <yq5apl0xgy89.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5apl0xgy89.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_041327_991258_5D4F75AC 
X-CRM114-Status: GOOD (  24.08  )
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

On Wed, Jul 08, 2026 at 11:28:14PM +0530, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> 
> > On Wed, Jul 01, 2026 at 11:19:20AM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> >> index 97987f850a33..acf67c7064db 100644
> >> --- a/arch/arm64/mm/init.c
> >> +++ b/arch/arm64/mm/init.c
> >> @@ -338,10 +338,8 @@ void __init arch_mm_preinit(void)
> >>  	unsigned int flags = SWIOTLB_VERBOSE;
> >>  	bool swiotlb = max_pfn > PFN_DOWN(arm64_dma_phys_limit);
> >>  
> >> -	if (is_realm_world()) {
> >> +	if (is_realm_world())
> >>  		swiotlb = true;
> >> -		flags |= SWIOTLB_FORCE;
> >> -	}
> >
> > For this part:
> >
> > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> >
> >> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
> >> index e05dc7649366..f3fc28f352ba 100644
> >> --- a/kernel/dma/direct.h
> >> +++ b/kernel/dma/direct.h
> >> @@ -88,37 +88,40 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
> >>  {
> >>  	dma_addr_t dma_addr;
> >>  
> >> +	/*
> >> +	 * For a device requiring unencrypted DMA, MMIO memory is treated
> >> +	 * as shared by default.
> >> +	 */
> >> +	if (force_dma_unencrypted(dev) && (attrs & DMA_ATTR_MMIO))
> >> +		attrs |= DMA_ATTR_CC_SHARED;
> >> +
> >>  	if (is_swiotlb_force_bounce(dev)) {
> >> -		if (!(attrs & DMA_ATTR_CC_SHARED)) {
> >> -			if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
> >> -				return DMA_MAPPING_ERROR;
> >> +		if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
> >> +			return DMA_MAPPING_ERROR;
> >>  
> >> -			return swiotlb_map(dev, phys, size, dir, attrs);
> >> -		}
> >> -	} else if (attrs & DMA_ATTR_CC_SHARED) {
> >> -		return DMA_MAPPING_ERROR;
> >> +		return swiotlb_map(dev, phys, size, dir, attrs);
> >>  	}
> >>  
> >> -	if (attrs & DMA_ATTR_MMIO) {
> >> -		dma_addr = phys;
> >> -		if (unlikely(!dma_capable(dev, dma_addr, size, false, attrs)))
> >> -			goto err_overflow;
> >> -	} else if (attrs & DMA_ATTR_CC_SHARED) {
> >> +	if (attrs & DMA_ATTR_CC_SHARED)
> >>  		dma_addr = phys_to_dma_unencrypted(dev, phys);
> >> +	else
> >> +		dma_addr = phys_to_dma_encrypted(dev, phys);
> >
> > For AMD/SME, on host with memory encryption we now end up setting the C
> > bit for DMA_ATTR_MMIO. This is fine for RAM but not sure whether
> > some other MMIO bus understands this attribute. Maybe we should stick to
> > something like __phys_to_dma() for the !CC_SHARED && MMIO path. Or,
> > since this is not universally defined, just use the old dma_addr = phys
> > if MMIO and ignore any unlikely DMA offsets.
> >
> 
> Considering for AMD/SME system an unencrypted dma addr is one without C
> bit, will this be good?
> 
> 	/*
> 	 * For host memory encryption and device requiring unencrypted DMA,
> 	 * MMIO memory is treated as shared by default.
> 	 */
> 	if (attrs & DMA_ATTR_MMIO) {
> 		if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT) || force_dma_unencrypted(dev))
> 			attrs |= DMA_ATTR_CC_SHARED;
> 	}

Yes, I think it does the trick, preserves the current semantics for AMD.
I guess you could use a single 'if' for all checks (up to you).

-- 
Catalin

