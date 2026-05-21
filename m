Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA011CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qomyt6SRN6loAiKuzG+mnZMN+9NDAav5uB2vD7COXYY=; b=YQZGzTR5T+E1tsIOhR8VcRnhgn
	xa3/pwbIVCiIr0yjbb1OloC9cL7lB3HARzinqmpiw6rGzAVQbbWzt6245VjulsCYvbCbUXpyAG6vj
	kzsEsxShRc0ncupSzWbcTKeHmRlon0vkPIAKjZXNdRZ4WQmUCOrAxVBBYrQIXZkv4llh03Q+jCjFG
	0bwgOdPZXvK4qw/sIGpkIhCwtAxQmAiq7+AQWzcDIlNKwjl4/6TnQD/x1VZkAWViHmAA1Phcd47HD
	O0cK9fiL6ArmfYDy6NumKaY/9NlCXzxjlG7eER/5pjKoYpZtURz6KBpkTMDyR1txUVZ2fpjSYjIth
	CJAVEtrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5TK-00000008LpL-2bPt;
	Thu, 21 May 2026 15:38:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5TH-00000008Lnl-2Z3S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:38:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FFBF44148;
	Thu, 21 May 2026 15:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055241F000E9;
	Thu, 21 May 2026 15:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779377883;
	bh=Qomyt6SRN6loAiKuzG+mnZMN+9NDAav5uB2vD7COXYY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=SKjGQCP1jUHZn8lGcvNb16fhytEsPovJvUrNUllKBoXBnYhKzZyiWFp5SXoR00qSh
	 4Yi1RUq4BpLuoEGXd/ZfpfHeWAgR0+SKGaVyCv/OICsvCL8QuRGyjiXEjI5giDln+y
	 nPHP27gGY79//Ncb34+zHprzV63ewWoOHLFrps3BSWb2kqL1XebtXJJN3TVZe3EV/k
	 urWUK7qq4xQ19I8ijQAMN6p1ereVXTWRx1/nsAg3dl09jZhyb9oK04vIX/Z5RdNTgn
	 97oMJkfi8HsdKYrcl3kj4rpuwHeCO8ecnTXfnja7vDYtRCrTlYPo8c5gdohMtv0jZ2
	 UZTZ7iyYKVbCg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
Cc: Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 07/13] dma-direct: make dma_direct_map_phys() honor
 DMA_ATTR_CC_SHARED
In-Reply-To: <20260512090408.794195-8-aneesh.kumar@kernel.org>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-8-aneesh.kumar@kernel.org>
Date: Thu, 21 May 2026 21:07:49 +0530
Message-ID: <yq5awlww6aeq.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_083803_697020_B0F4B0C2 
X-CRM114-Status: GOOD (  16.04  )
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

"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:

> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
> index e05dc7649366..4e35264ab6f8 100644
> --- a/kernel/dma/direct.h
> +++ b/kernel/dma/direct.h
> @@ -89,36 +89,32 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
>  	dma_addr_t dma_addr;
>  
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
> +
> +	if (attrs & DMA_ATTR_MMIO) {
>  		if (unlikely(!dma_capable(dev, dma_addr, size, false, attrs)))
>  			goto err_overflow;
> -	} else {
> -		dma_addr = phys_to_dma(dev, phys);
> -		if (unlikely(!dma_capable(dev, dma_addr, size, true, attrs)) ||
> -		    dma_kmalloc_needs_bounce(dev, size, dir)) {
> -			if (is_swiotlb_active(dev) &&
> -			    !(attrs & DMA_ATTR_REQUIRE_COHERENT))
> -				return swiotlb_map(dev, phys, size, dir, attrs);
> +		goto dma_mapped;
> +	}
>  
> -			goto err_overflow;
> -		}
> +	if (unlikely(!dma_capable(dev, dma_addr, size, true, attrs)) ||
> +	    dma_kmalloc_needs_bounce(dev, size, dir)) {
> +		if (is_swiotlb_active(dev) &&
> +		    !(attrs & DMA_ATTR_REQUIRE_COHERENT))
> +			return swiotlb_map(dev, phys, size, dir, attrs);
> +		goto err_overflow;
>  	}
>  
> +dma_mapped:
>  	if (!dev_is_dma_coherent(dev) &&
>  	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
>  		arch_sync_dma_for_device(phys, size, dir);
> -- 
> 2.43.0

I guess we need this change on top of the above

modified   kernel/dma/direct.h
@@ -88,6 +88,13 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 {
 	dma_addr_t dma_addr;
 
+	/*
+	 * For a device requiring unencrypted DMA, MMIO memory is treated
+	 * as shared by default.
+	 */
+	if (force_dma_unencrypted(dev) && (attrs & DMA_ATTR_MMIO))
+		attrs |= DMA_ATTR_CC_SHARED;
+
 	if (is_swiotlb_force_bounce(dev)) {
 		if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
 			return DMA_MAPPING_ERROR;

