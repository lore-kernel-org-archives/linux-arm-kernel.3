Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEFFCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 11:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=By5jxDRfMhWNJ3zdMqbqgKEuQjBAiR2dgY0SOpXrO1o=; b=s40cRXRXRVf4hTF+KgPCd6aUxU
	tMG90YWXnU+9k+UYLviG41v0IRzcMsJGJDt6Lz5xZs6pgtEVVc6ygWdq2Xk3RMGszvFo2HNM46tJw
	ELaaAizMXwupzZ9wPKKtVhJWntoPer5bIwuFEPkxSuk0Aei4hhQRA4clqpLcUHn1S9i1WoGfzflHR
	KBmQkelTrPXtSqJN4NvIIJzqXtQQsQ8Tr/iBieWrJNrFwcA0IqZopnug0/w4lmwltGqhtq6DRlah0
	C/rwLhbaIIKU4WBN0pjhelmTvGWrcbGYOH4CvJsfq+qR1yUihDRfWEPmMkxs11RQiPg0P4sSH+IA0
	NDf2CbZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdvP-00000009Ky0-2Paq;
	Thu, 11 Jun 2026 11:50:19 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdvN-00000009KxE-2BDm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 11:50:18 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45ef14d4200so761729f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 04:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781178615; x=1781783415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=By5jxDRfMhWNJ3zdMqbqgKEuQjBAiR2dgY0SOpXrO1o=;
        b=f7gi8rfmIXJNePxVy3mQrltBUD7TQjt350zWgYxzuY8xzXxfA15pYGvfz2BNY0uJP7
         0Ts3KwmonlnrahFWsRAWIa+IMjaXq8Xeqh69fAPS2j7Id9G+XUZDbca4AT+4DzqwqHi7
         t7NCUZiQt90V8LnHiLb9TLhAT5mxnla7/Sqjex3bTPrwqdNLjFF+e+HSJCZmsa7eKvi9
         WU4LkQvLNFmQ5rSJ0ti7JlKnYwyo1/wA2n1R17cutCRevmQNi7flPS4T/oML8jv38cZS
         Kz9YSO9W3sQKAi2Yt7aOLKBFcyI0I/bLuYsUY0f1+Q9mxsblBkC5s1DavmY5+62BHup+
         vwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781178615; x=1781783415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=By5jxDRfMhWNJ3zdMqbqgKEuQjBAiR2dgY0SOpXrO1o=;
        b=rBsvUNJSmjnWmY5pxsRJvBu0w9sHGbopiMR3Mg0hB0sAEdcquXyA/SRZsnwzr099dD
         KR7OyDT2/g9d7px7h9MzRWqaTZloo6ufXJVn3c7cpduEd0eQePsfuq0sK4crh6zORI87
         ekMqm/ilaxr6GjNdDXH8y8csaOL3JaDw0WwNGYZXT4tvdlKiRcQXOPZDgHG0/dAJeXkm
         PeXOkmsQIbqNNAR/yqbVAlo0Fqcrh8d1QLmwCOy4N+xlKohG5e7ednvGmYFeqVcGMT8T
         HoWVGPitSURxssKjFt4w29E+NmWmHVoSCi6HlGb++PMSBbIlX5t/MdRUC5+anIdSvWmT
         9h9A==
X-Forwarded-Encrypted: i=1; AFNElJ8PP9qfURhw2P+Tf0J3tDyRC/TWtcJwLUDbG84GPmx9DBBVkWvWh6eO9TI59ZOxl+LfOSXuTpsFsN0oastnPwFJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2wna1vq3aCnxnIXL6iiibtI3DV0vCTwNEAkhubthxor5vspij
	V48yF3HDRFY0D3cjf2I2BTCZT64yCJgdv5WdnFvDsdLN+ClR31KeLd6DbyBTKz3sU3w=
X-Gm-Gg: Acq92OFRkBOFJY8ZlFQWzsjbCGGpnJaBwKWFKVyl8qLnNqPUzgTmpk2DzOCMgP3A4QA
	7AuKp29ByelFShFedi2QmXXwTsBBYN2PbN/OSmFa/wdnh//5vPrR/fH5dzYrHAWh8aK8UmCYnCo
	MQFXV/Gq6njF9/dQj7wXOpEPU4R10/96LYLHmdUlE+Yre2L/nrkX2UP/HK+t/CQm5l1t0q83SRD
	gKr0kz1JGZbp4MsXT9NdBEu/GE6HcqGh+D52TN+bHtsD7YBLczeDsKZgjbny4Gn28G2QrnoG7bu
	1odm+8aVjM7AKhlbUhBtDZXJ2z/5P5u/hCWsw9kylI4FPoTzk943Zh7R4HDrmpy4n/UGOeiWtdw
	68uJMh9tVgd9VvYFyP8eqXYXnZ8P50WaOQzlRWC5lrHkx7VSNAcrvSXNKaXO8ICYESLfGoQsKdm
	TcrBBBGx2dPGj0Fp7ErKKFIcZ82WpxIwGIGc/uq4mNYKgpCRdjl/cT+BVrhP9/2CfuFJ7PtmgS4
	ZB2w2ffUT1fam0We2RqWBFgFIsJNEX1ZF5xTA==
X-Received: by 2002:a05:6000:2508:b0:460:1bf8:c959 with SMTP id ffacd0b85a97d-460673e3ae5mr1690022f8f.0.1781178614930;
        Thu, 11 Jun 2026 04:50:14 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2ed944sm83042430f8f.13.2026.06.11.04.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:50:14 -0700 (PDT)
Date: Thu, 11 Jun 2026 13:50:04 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Will Deacon <will@kernel.org>, Marc
 Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>, Suzuki K
 Poulose <Suzuki.Poulose@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh
 <smostafa@google.com>, Alexey Kardashevskiy <aik@amd.com>, Dan Williams
 <dan.j.williams@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald
 Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, x86@kernel.org, Jiri Pirko <jiri@nvidia.com>,
 Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v6 04/20] dma-pool: track decrypted atomic pools and
 select them via attrs
Message-ID: <20260611135004.70d48daa@mordecai>
In-Reply-To: <20260611113740.GB1066031@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-5-aneesh.kumar@kernel.org>
	<20260609143242.GK2764304@ziepe.ca>
	<yq5aa4t1myw4.fsf@kernel.org>
	<20260611113740.GB1066031@ziepe.ca>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_045017_582272_AAC6A471 
X-CRM114-Status: GOOD (  22.04  )
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

On Thu, 11 Jun 2026 08:37:40 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Thu, Jun 11, 2026 at 10:55:47AM +0530, Aneesh Kumar K.V wrote:
> > Jason Gunthorpe <jgg@ziepe.ca> writes:
> >   
> > > The sashiko note does look legit though:
> > >
> > > 	if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> > > 	    !gfpflags_allow_blocking(gfp) && !coherent) {
> > > 		page = dma_alloc_from_pool(dev, PAGE_ALIGN(size), &cpu_addr,
> > > 					   gfp, attrs, NULL);
> > > 		if (!page)
> > > 			return NULL;
> > >
> > > I don't see anything doing the force_dma_unencrypted test along this
> > > callchain..
> > >
> > > I guess it should be done one step up in dma_alloc_attrs() instead of
> > > in dma_direct_alloc()?
> > >  
> > 
> > I think we should do something similar to what dma_map_phys() does here,
> > considering that we only support DMA direct with DMA_ATTR_CC_SHARED/DMA_ATTR_ALLOC_CC_SHARED.  
> 
> Yeah, I think that's the right idea for now..
> 
> > +	if (force_dma_unencrypted(dev))
> > +		attrs |= DMA_ATTR_ALLOC_CC_SHARED;
> > +
> > +	is_cc_shared = attrs & DMA_ATTR_CC_SHARED;
> > +
> >  	if (dma_alloc_direct(dev, ops) || arch_dma_alloc_direct(dev)) {
> >  		cpu_addr = dma_direct_alloc(dev, size, dma_handle, flag, attrs);
> > +	} else if (is_cc_shared) {
> > +		trace_dma_alloc(dev, NULL, 0, size, DMA_BIDIRECTIONAL, flag,
> > +				attrs);  
> 
> But it would be clearer to put the test in the iommu_ functions I
> think, since they are the ones that have the issue. We will need to
> fix it someday..
> 
> I think we can ignore the op-> functions, arches cannot support CC and
> still use dma_map_ops..

Hm, sounds reasonable. Should we probably enforce this at configure or
build time?

Petr T

