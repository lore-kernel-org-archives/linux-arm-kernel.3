Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32596CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 16:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcSuL4+fBcC8SeCa+tlTSs00pii8MZZ+rCZs+NXP3JM=; b=tZwpBo9xbLlOrS7F5DpZiZfzfX
	itKgm00TKCYhICgy9KoMtWQxxvdfhYnxdc+jhaRz8IlVo94lMu0coHY1zChyql6N/NzJGDxrZlLlL
	W+cCSLVXw33LtChhjNFwc56XlJxyByJw7zOKemQTOArxwNSyMRum3Le4L5X0H422bVX/5L3TyAiN/
	duWE0JyEUxkl2JASadUpu004E2D1xqo2OTuBciPJHqmAioBih6TVNIEeOJ9A3o3FXCwGwYA0KjBqb
	VniZWyTaiZ627t8X+167Zw2+9jiQH5FwcmYsYW8splwzMDBmyVHjLcAoFflyyw8IXpRQLxg6ESCod
	V3OxUPTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPN2U-00000002Bcm-2GeV;
	Tue, 19 May 2026 16:11:26 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPN2Q-00000002BbM-48Gd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 16:11:26 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-65dbe04fc1bso3971549d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 09:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779207082; x=1779811882; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UcSuL4+fBcC8SeCa+tlTSs00pii8MZZ+rCZs+NXP3JM=;
        b=mJzgGRwjtT9YGLhjOz8OGPckJH2Y6bgCBmcaJl9CsomjzGwwh5EGYYIgYN8wk1egmM
         daQme75baJkkFAV67QtXXh+JVx+uXCYs13vI7h2kKifv4DpInDqqrGwUyJaz/pIXIqr0
         iXqeVH2hxF0ruPzYVddUsZ+x3SvtlCFvp2pvHvIk5AFydVEWWeiuMmvOQVvl6TC4RXvJ
         ZcCmhfnyxrpMbsUslTqXmk++Lt4ltKVh5Ln4StZRFCUXy+qVlHfkWUucL36TYWdJt5Yf
         tI8FDYimOOWVdDgBTVNO+9HW44RQGIdcNwCL2/L6mRN9WNXziw8XrWVHWj+J6o8Fj5Y9
         vdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779207082; x=1779811882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcSuL4+fBcC8SeCa+tlTSs00pii8MZZ+rCZs+NXP3JM=;
        b=jn4rEX1GvI4ehT38pxX8SwJBsHzQwzPasHFPofTzlbZowuRHfw3FCEouNkpbtC3bYF
         XjwBxOOGTYdq+nS3CwIZwMe5ykpdtstjx0snpJBOY8Ir3EPXYsM/oTTl2GL7i3a9CEur
         XUlTMAgWcXT/JsAi/2Txj3cFdr+TYwffcNP+vwIgRwLv/IJEVv9+LrXrNX43h4axSqdA
         2RgyshteA1Pp3I/zKzGhknZpeLy2H9Ah5iNGmISx0b5bI4LVouKp7n6XOyS2Nsm1jNBD
         7Rr0Ht1ZRGiOrW6kWctJ4r2srTASRytXxjDQI8nD+WhwRGhqQ5cgMWZQoIpLr+AdXscG
         Ww3g==
X-Forwarded-Encrypted: i=1; AFNElJ8Ct126xjWMbbkMeD7dPDaT+4ShOwgBfmfbm8W84cefF4PeJpgPZ2hQ060lJUq25g2HPJb1ND1rfEG5qz4cjqMF@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqrbc6aOfFQjk2X6eYXPZgEnHqaH7FFzejBvNTFi3S4ZLj+sSv
	oAou6Ntvt2jZMFqmlX44L4YApw2GyWTseZFMozQe1eY/FM9fT4iOx7kj0+GGKm+MSzw=
X-Gm-Gg: Acq92OEBf+Ty+jY8ffb5s+Z1hQ7+/CtbEp/id0EPIfG/VTFZwtONm74xn6lgJmT8l49
	u2CW9DiKFR5g0wbjxkfC3WLfvgRojGRk/Da1o9wL4oCGgu72uxcIHrHxm3z2nGiCMV3GOxECSn2
	xOURnjkFORatxG4F08bb0fA6GYSg34i58+RdfJROcRmfREUqbuT0EZP6IlZ3PnT0uxbUESzKtzk
	VfSJyfJ3cZLceNE03RYHuk34yUoRvbm33B01HFPcafeKY2Xu7JARoTd659NbqOPT7K7w4y9M0e2
	ErVRamUgf0wMd7IW2qJMmDHYp4GznXzmYDvG+cll/lZ8wEARIXqEchxuu21Us2GKQK3f/HF2E9w
	ZmZbf58yK6If3ZedIJuOhLF4+DEK8g7rHKMMKrbap4IXrhQtqaACv3mPQnuSdeyhbF8D+DYgBgS
	DAX3+pyDOjSe1s2fwSISUh0ONeJ1hU/6wJsrLWZxd2PCWwmZc69ei1CfUPt3ZqPufhLXoG8QPJx
	YFMZQ==
X-Received: by 2002:a05:690e:148b:b0:65e:18a4:3021 with SMTP id 956f58d0204a3-65e22839e72mr21408719d50.52.1779207081601;
        Tue, 19 May 2026 09:11:21 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca36086a61sm95500586d6.4.2026.05.19.09.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:11:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wPN2O-0000000FGo6-1YPM;
	Tue, 19 May 2026 13:11:20 -0300
Date: Tue, 19 May 2026 13:11:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <20260519161120.GO7702@ziepe.ca>
References: <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
 <yq5amrxvshxg.fsf@kernel.org>
 <yq5abjebsaid.fsf@kernel.org>
 <20260519152741.GM7702@ziepe.ca>
 <yq5a8q9fs7ud.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5a8q9fs7ud.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_091124_867999_D4221B6A 
X-CRM114-Status: GOOD (  14.69  )
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

On Tue, May 19, 2026 at 09:35:30PM +0530, Aneesh Kumar K.V wrote:
> Yes, that also resulted in simpler and cleaner code.
> 
> swiotlb_tbl_map_single
> 	/*
> 	 * If the physical address is encrypted but the device requires
> 	 * decrypted DMA, use a decrypted io_tlb_mem and update the
> 	 * attributes so the caller knows that a decrypted io_tlb_mem
> 	 * was used.
> 	 */
> 	if (!(*attrs & DMA_ATTR_CC_SHARED) && force_dma_unencrypted(dev))
> 		*attrs |= DMA_ATTR_CC_SHARED;
> 
> 	if (mem->unencrypted != !!(*attrs & DMA_ATTR_CC_SHARED))
> 		return (phys_addr_t)DMA_MAPPING_ERROR;

Yeah, exactly that is so much clearer now that the mem->unecrypted is
tied directly.

That logic is reversed though, the incoming ATTR_CC doesn't matter for
swiotlb, that is just the source of the memcpy.

/* swiotlb pool is incorrect for this device */
if (mem->unencrypted != force_dma_unencrypted(dev))
    return (phys_addr_t)DMA_MAPPING_ERROR;

/* Force attrs to match the kind of memory in the pool */
if (mem->unencrypted)
     *attrs |= DMA_ATTR_CC_SHARED;
else
     *attrs &= ~DMA_ATTR_CC_SHARED;


Attrs should be forced to whatever memory swiotlb selected.

Jason

