Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD694C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGsZNW66zFo4mTPQ6ULtWG3KXt/fdlFbCgUmJIue0mw=; b=mO46Ju8hpaamaGMUl/6ZQJhShM
	aICgBwU/g2CjAcMA6qNTSN2qdVkM9H/YUWVHz5ywAFiWZ3A/RrqJsJNYlC/tzwMwF0dUY556LQyys
	5VEU7wpGA/4zvOyohgnm/IXRf1pLsq161kEPDBrD3FivrjeD1TyHfrCQpAVEP8WIzQZBJzAvI1hg8
	7YywPobK2WNcQflKm1arGlDRPzGfecjTW4AQMJqKd3uVmsmfNuyaQuisxxmp7wYBmAuIWrivphWkg
	4Y5Sf67qNf8of1LVJk7RUbsaAl8tlTAYbuxfvMC8Ts4WNezegS3W2SraxvRHa4jLToQ0XfzK/ZWzQ
	HcrWYvbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMON-0000000AIST-2bNV;
	Mon, 13 Jul 2026 19:32:39 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMOK-0000000AIS1-3Utv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:32:38 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-517dc520840so25078891cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783971155; x=1784575955; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hGsZNW66zFo4mTPQ6ULtWG3KXt/fdlFbCgUmJIue0mw=;
        b=Yp+d4l3YcRoOQXcUM98tcSTWUthC78LA3OaLn21mJp0CmkmvZ3Ra3T3gaywVim3mi7
         BPstfbQAlWMAW9VnZ9zchfIHhNOp09UhymEvUDWjzZJTS6qYNggIPdqkSCFmykvF5wtR
         mKDvg0qWtk6/wjQKkqjjPRKs9iXVj0HS09bPtM37kGY5DGrMLCJAKBFrNcpwzo8quSZj
         ztdWVFAtacpB+YsHCvVFUGAkD3ZJyXuPZXShv2gcAmv8l30YZ7YzQr6jhyjvfnsBPV7p
         eN921lR6u54zH4igYTX2z8iiiU9EqJoIKhikp2yuBgVVjuIOu2yJyUsJ/QeffhXP2AG7
         hySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971155; x=1784575955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGsZNW66zFo4mTPQ6ULtWG3KXt/fdlFbCgUmJIue0mw=;
        b=WybLFn2CVePPrNEczOu8JGlMEujSFN3Zu2D43jdxL7ivfJjXVd3tiDYn9GNo2JfBl5
         P5vVH2EyVhzm3qGGA1f8iMUM60bHTM9XqsZTbWrNI8cmg2Oe6DKrsQ9Qzjej15GPCzum
         zKObwTIsxVnA1XEawsgt6X5hpqZvT5r7hlxhIPK0Sc7KcjbJHDNfYrLLDI/7ixzDJ047
         Nij3l7NDkk/nIYAuWR+905b7S04PThubG8cECjyec1Cou0tgwolm7ebp0mmVRZsYfBSt
         EL7YCGTNeDWr8qqJDqSikgGfhX0sBFmBBRsOI9UAW38vu7UDDquxVL6Xecl6sgr2Huvh
         D//Q==
X-Forwarded-Encrypted: i=1; AHgh+RpTXFSWM2QwxZmrhRalh1OQj2ZVCYM9k24G1UZN9YebWCY1VamNIDCemRs9heNtg7/kr+0EeiUs5Rx0juWWJnFZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzPvu2RgLx361l+zb7kmrLoMO/8Ro7PTAo7oeLzyIZN7+CCTf8h
	sMJxiLMB2HWyz0GddEczHxm1Z98uqp/f6ezzl+Rrepeorf0Fuq8p8HjkCGZkAynsAdo=
X-Gm-Gg: AfdE7cllgWXSXHh62LLFYmm8H0MooJE1p+pPcOFos/bsARfXXQmXjyO39zFaOfa0h9o
	mmRagIY6l54L7BXHmeUrMkaE5ENPeS4UM7+x7zvM1JzoyOX1r7jX1cCuUv9DEHSZ+6HXWtBcoIG
	poZVrVZTBGpMlGl89TI/MHiPUxp7zFnall1rAM+uaIPCKowZT/YchuF4lFhF4UF7dZydhh8NK9r
	5ljoADL33u5x9e0es+NOORhaTrisSrYkqWRTcLaMgmHPTChqe1ycLw2yDx0P+ChlVmxJ/jNQb5d
	A66njqvHJ91ZAtqRGXosz7+o/Rvxw6oze/2qunsB2U/4li+ZnBdrw1WkhIe222U3pcCMMVFxYsr
	Y6Kl0aAkb67pNr83zv0j4LjngpqxY3Zy++/lrCGeYD8JB9ImlrvgjNl+sf2jb
X-Received: by 2002:a05:622a:1b22:b0:51c:18e4:38ab with SMTP id d75a77b69052e-51cbf2ee945mr103155851cf.66.1783971155509;
        Mon, 13 Jul 2026 12:32:35 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1ec84sm138505026d6.29.2026.07.13.12.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:32:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMOI-0000000E5wx-1usj;
	Mon, 13 Jul 2026 16:32:34 -0300
Date: Mon, 13 Jul 2026 16:32:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
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
Message-ID: <20260713193234.GV3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-17-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-17-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_123236_883899_01649801 
X-CRM114-Status: GOOD (  15.72  )
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

Maybe things should be adjusted so this can be
  phys_to_dma_direct(dev, phys, (attrs & DMA_ATTR_CC_SHARED) 

?

It would also be nice if swiotlb.c could do the same

Stated another way, maybe we should get rid of
phys_to_dma_unencrypted/encrypted() entirely and just have the bool
variation since that seems to be what everyone wants.

Jason

