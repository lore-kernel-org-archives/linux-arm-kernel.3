Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B309CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 11:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CsqKJTBvj+SobIiLXzFxApwnBR8BVsF1yARBI6K1lw=; b=XZnjCon+Db0jI+VZ8Owu/IMA6U
	+ieRKkdGHW6z1/zghB7TLwopqg33YylOniYKx01VodStIaY++7KVdoORPOZGJex6hxsObekegOfVh
	yyIpLqu9xL6tZJk2Q+fZ/KFKTd59Lml/2FJl2UidhX9/lkR0+zAk9X0gqMHtl4iTMN6PmqM0asTdo
	/SIb4yRSijW/7ix5dwwg8B/UB173KqCbemb8O31JyNjclF72u+UvdWY2zkOI4bKrSgcnVQR5P+8Pf
	416+YFY576Wql4D5iSz/XDW70Km1lva6PF/X1SVqF4I0dlyMG8rmfzZp8L+HSsXzaVSwcj++tJD0u
	cVAenxhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdjF-00000009K7s-3wfW;
	Thu, 11 Jun 2026 11:37:45 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdjC-00000009K7C-3mPZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 11:37:44 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-8ce3876a50cso80032036d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 04:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781177862; x=1781782662; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4CsqKJTBvj+SobIiLXzFxApwnBR8BVsF1yARBI6K1lw=;
        b=bns4+nym/eMevjCOJwdzW6twgnUFgpwucjkDepzLbe0W4gobyjdGAwmOqYAOhFxtrM
         KAKUXG/W0vmtwC1+EjIQgR8tKs6vF7pGgBUTG363sOZaXcpdXz6tJJqwdwMO9gqPPKU9
         2kf9wfxpu+Ppm1zgKuUBAn0+7HiIzYciZ4Kd07dyfUmaN/51lklSM0I08LSjgDUdwUaA
         b/kL9eJNhx7lHD5neL0PWQUq8+IhfvIDDSgYU36vIxOaVJnWjBBXSTR11IFhMbV3X3OD
         KGkpOY9tw7phUEArCuP9wP3Vp0fkudWjnwMP/lG/t3Ag4vuQu0Xb79sq8oJpfpMGIsuJ
         S3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177862; x=1781782662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CsqKJTBvj+SobIiLXzFxApwnBR8BVsF1yARBI6K1lw=;
        b=cBtgPRqJcVtO+TfP1EkfQMDtNOaRteND5KgPgJ5nHGoJV4rsBiLLmGyrwSraA+yVZk
         8yyrDYTtVOeSMet7nuBlzlYYFp6Rv1FZERG2YH+1tbPCAZO02C9SqiOiLYvN5K4XOws+
         DirMnXh6jpYnPSM4rNnbLousRCmcKnLN94BZZ24kzCRRGYJTWuiDrvkxhYocwq8rTXX1
         nvLrWw/vFv6IAAOvXEaMMEZe7KCUvz55M3l9brSeOMZd5stGD8Ja9ySC8kirzYpx+hio
         Bf55tOUEHxVq8vD3/v3rCU13ctAurrWi+CiWknKlvvLvOy6uRCWlhBVZYn05DAIUxgjv
         eajQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LUveaDAW1s2nRfPHRAF5/vlvkxDHK47KhWjdexAgvp5YVkACAPLsc8QU4A6dSMGW5QHAZQMxK3hlS5tEScxvg@lists.infradead.org
X-Gm-Message-State: AOJu0YzLHaZ6J8lqjDGvUIvGdsRN+Q9DVk1g5Wm1vB4OQ4SPV7SdcDbk
	/y0XqaYXyIy/RqUyEFkgeKgS+kNw0Ciq8P3qej4y4I4CcDca9kB6mXt4qftBwVdDHok=
X-Gm-Gg: Acq92OHzVCvLWg9V4EHvB8l7up7/rUdO8oBEqt//6MfPHVQmnf6dUBNHi2NrdNepeYE
	xyU6lo6m4ECasr3OwcxcTDyNR5e6JWwsEi3S/gsXLEWOYtiiPWqP3TTIJJ+4xrIHMPbRNDOR3/Y
	d076Rz7PLEpKx3fk6eUFow0fCzDRFG/BPpNKdBMLl/R3xYYfpKBu6IRp4hTcvBK+dnAEKGycd2P
	ZIiMsc8zXGPJNseGVF61WyitHgcq7/eUHMpU8QliDF/XeoRxQfAWJ4mZvCr7+8sK0oHF/H7YMfZ
	i/UVJ1EDRLo/oq840u75EqapDgmSSZ1rwPtxery653mLrubprgdAZjVGSl6nA88eD/ZLUFjRrN6
	3o0bmrJ6NXVubaY1hPCuJtyMQB6lqc7OqqcWJwCdul60bamB/qd4A+vXxogquSYR3Ogzx82M3CG
	hzhQHJofBBwzvF1vseOPlac1DzIYk685kxAegjkZT/Nad5f0OJrB5qPkcOSoyWhcytODt5fMi0b
	RfMpfIXWEDGS+qj
X-Received: by 2002:a05:6214:410b:b0:8ce:b2e9:a4c1 with SMTP id 6a1803df08f44-8d1d8cfbdc0mr38674016d6.14.1781177861623;
        Thu, 11 Jun 2026 04:37:41 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d1e838f586sm15478786d6.20.2026.06.11.04.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:37:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wXdjA-00000005ezW-0ftx;
	Thu, 11 Jun 2026 08:37:40 -0300
Date: Thu, 11 Jun 2026 08:37:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
Subject: Re: [PATCH v6 04/20] dma-pool: track decrypted atomic pools and
 select them via attrs
Message-ID: <20260611113740.GB1066031@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-5-aneesh.kumar@kernel.org>
 <20260609143242.GK2764304@ziepe.ca>
 <yq5aa4t1myw4.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aa4t1myw4.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_043742_950487_1C141D49 
X-CRM114-Status: GOOD (  18.57  )
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

On Thu, Jun 11, 2026 at 10:55:47AM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > The sashiko note does look legit though:
> >
> > 	if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> > 	    !gfpflags_allow_blocking(gfp) && !coherent) {
> > 		page = dma_alloc_from_pool(dev, PAGE_ALIGN(size), &cpu_addr,
> > 					   gfp, attrs, NULL);
> > 		if (!page)
> > 			return NULL;
> >
> > I don't see anything doing the force_dma_unencrypted test along this
> > callchain..
> >
> > I guess it should be done one step up in dma_alloc_attrs() instead of
> > in dma_direct_alloc()?
> >
> 
> I think we should do something similar to what dma_map_phys() does here,
> considering that we only support DMA direct with DMA_ATTR_CC_SHARED/DMA_ATTR_ALLOC_CC_SHARED.

Yeah, I think that's the right idea for now..

> +	if (force_dma_unencrypted(dev))
> +		attrs |= DMA_ATTR_ALLOC_CC_SHARED;
> +
> +	is_cc_shared = attrs & DMA_ATTR_CC_SHARED;
> +
>  	if (dma_alloc_direct(dev, ops) || arch_dma_alloc_direct(dev)) {
>  		cpu_addr = dma_direct_alloc(dev, size, dma_handle, flag, attrs);
> +	} else if (is_cc_shared) {
> +		trace_dma_alloc(dev, NULL, 0, size, DMA_BIDIRECTIONAL, flag,
> +				attrs);

But it would be clearer to put the test in the iommu_ functions I
think, since they are the ones that have the issue. We will need to
fix it someday..

I think we can ignore the op-> functions, arches cannot support CC and
still use dma_map_ops..

Jason

