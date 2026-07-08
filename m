Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A41C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvVAlEJVuGFLkU8Sx+0lCwd7KQJAZlMmHPeMITO1ozY=; b=p/e4Mnm2aZoxGDpfsjHp7Qw1qn
	qrBcjuGvhpILh2VgydzQOdSD1YCK2Bmle1Q3Rh2la0xAdIdL1KT3gZC8FSPXuwBBWXBLwemgVz0l+
	8H/sRpkmwKJ99tRplU2Ck5BYo5+3pkQaD2Bpp++5xaBZfyfQSeWSLfJMw5n0QUlybkFQR/emklOQb
	MMtc1WxHPIWJ+x5eqoEggCHpgUfRTIqA/FK5s6510lSQ+ItM1Tk8osmdozts9B01xJt5q4ggXot+U
	IrjH08jIYHhyZdl2rw9NTFnT4UbeBsBdOWbS55GWXESLYWIF1YgBjJX8ZAwsoanObHm6/n00URmNL
	SWgrZq3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQZP-0000000H1lK-27bI;
	Wed, 08 Jul 2026 11:36:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQZK-0000000H1im-2sH7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 11:35:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00BCE1E5E;
	Wed,  8 Jul 2026 04:35:53 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E39E3F85F;
	Wed,  8 Jul 2026 04:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783510557; bh=skF61y21KgPsVGfJvwoIpH8oYC/C836tWg/Zi0aByAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BDUtEDVyOjE2X987uSwyfq3z9RD7lBFkhkdA5EBvVEUJF3xFy0wXNZao/bpBtdGJT
	 bzEIyGgplNZ8FteGaCdPd8M9i1hu4qN4jloW+AkzdgaaYEgqMwYQieSh7ECTVL08I/
	 ukOcYIu1QhMGKdh1zDxGves8zlEW6X1jwQ6tkJ14=
Date: Wed, 8 Jul 2026 12:35:51 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
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
Message-ID: <ak42F240d-53QeFN@arm.com>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-17-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-17-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_043558_830485_D85D2869 
X-CRM114-Status: GOOD (  18.74  )
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

On Wed, Jul 01, 2026 at 11:19:20AM +0530, Aneesh Kumar K.V (Arm) wrote:
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 97987f850a33..acf67c7064db 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -338,10 +338,8 @@ void __init arch_mm_preinit(void)
>  	unsigned int flags = SWIOTLB_VERBOSE;
>  	bool swiotlb = max_pfn > PFN_DOWN(arm64_dma_phys_limit);
>  
> -	if (is_realm_world()) {
> +	if (is_realm_world())
>  		swiotlb = true;
> -		flags |= SWIOTLB_FORCE;
> -	}

For this part:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
> index e05dc7649366..f3fc28f352ba 100644
> --- a/kernel/dma/direct.h
> +++ b/kernel/dma/direct.h
> @@ -88,37 +88,40 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
>  {
>  	dma_addr_t dma_addr;
>  
> +	/*
> +	 * For a device requiring unencrypted DMA, MMIO memory is treated
> +	 * as shared by default.
> +	 */
> +	if (force_dma_unencrypted(dev) && (attrs & DMA_ATTR_MMIO))
> +		attrs |= DMA_ATTR_CC_SHARED;
> +
>  	if (is_swiotlb_force_bounce(dev)) {
> -		if (!(attrs & DMA_ATTR_CC_SHARED)) {
> -			if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
> -				return DMA_MAPPING_ERROR;
> +		if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
> +			return DMA_MAPPING_ERROR;
>  
> -			return swiotlb_map(dev, phys, size, dir, attrs);
> -		}
> -	} else if (attrs & DMA_ATTR_CC_SHARED) {
> -		return DMA_MAPPING_ERROR;
> +		return swiotlb_map(dev, phys, size, dir, attrs);
>  	}
>  
> -	if (attrs & DMA_ATTR_MMIO) {
> -		dma_addr = phys;
> -		if (unlikely(!dma_capable(dev, dma_addr, size, false, attrs)))
> -			goto err_overflow;
> -	} else if (attrs & DMA_ATTR_CC_SHARED) {
> +	if (attrs & DMA_ATTR_CC_SHARED)
>  		dma_addr = phys_to_dma_unencrypted(dev, phys);
> +	else
> +		dma_addr = phys_to_dma_encrypted(dev, phys);

For AMD/SME, on host with memory encryption we now end up setting the C
bit for DMA_ATTR_MMIO. This is fine for RAM but not sure whether
some other MMIO bus understands this attribute. Maybe we should stick to
something like __phys_to_dma() for the !CC_SHARED && MMIO path. Or,
since this is not universally defined, just use the old dma_addr = phys
if MMIO and ignore any unlikely DMA offsets.

In the other case, for an arm CCA guest, if the MMIO is shared we end up
setting the shared attribute but that's fine, it's only an IPA address.

-- 
Catalin

