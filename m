Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A76CD98F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElWjBVhbO2IQzO43OlPWnTyijSop9myiCxf+4rjWyeA=; b=zj9s/RU707+5TdlAXsOSvDAJg/
	fYe2QJsmDtvRhV2/m7yAN604Ir2yGOavVwAt2ijoDZKk7KIckzauA0AndMUQ5q2gWT+eCe2Cowxqg
	uZmI6KT8C4LFAsdJLYg3omgjoJckfS5FnFnPvoxiJ+uXcQRSpP1h+wC6naZmb6WunPj7hExmuriF/
	FWpTOIzMXJGJtONC5gYRKysoac932QGRbMeq6CE02VzopkZ0QFAIrA4tBW8zSiujW7Zk5wV9j6AhF
	dvu11cYMURJYtz4s9C8dEwOJoJl5Ku7RIIO1jvG9qLclLk1Bu2ZMLwxTpMFsNrvYcxpYVYAcHreZf
	eXfRsljw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZsO4-0000000HZa5-2z40;
	Wed, 17 Jun 2026 15:41:10 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZsO1-0000000HZZf-3qb0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 15:41:07 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-517760dc3c2so39006521cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 08:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781710864; x=1782315664; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ElWjBVhbO2IQzO43OlPWnTyijSop9myiCxf+4rjWyeA=;
        b=P9AIPJxh3YqWABgauGH/E2em0d0v0xhNOGVOSggeFxQExcgVhY7b7LgoYlfVIXw/RB
         iPct8xpptv1sHnWD1nHNq5N1ZIdz5sFC3VySSbAgbB2Ke0b+7f31IpYnINORCkcTvwfb
         W9aS+gSRq1bQThTNN35VpZwiRgr2l50u0cokQH/ccqcZ5g+ATutZptiv8gPnUzh15luT
         DHd3CFFUtZ5A/V99BLFjCZkJBaJ/EWSlkoEERu2PCGhi+Uz/aIlrpfIMU0hBuUSAtep7
         s1liKELl+NEiwsw0Lxm7V/taLiyUc7SnmEfIlEakdyhZLVkV99xBrxVG3yjwyDKqQ5rp
         YOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781710864; x=1782315664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElWjBVhbO2IQzO43OlPWnTyijSop9myiCxf+4rjWyeA=;
        b=REU9up9HD+dRoR5x42EdLHJS7kCRF17t39RRyNMUJ+xpiWEQuqJdQuEL34JJ9TTlVJ
         dfmhQMClcSU9Hy29xWoMtAzNA/S3TalajnCChakZwSjFZMSe+ErP62gGAulNwIahiO1o
         LkNwzHGiXLIPgIngBTn78FtLTEqaFPCma873PDl+kGrOJur4t0HeBPfZHcjnoUxSvOIn
         A2AUxwyHOdW2cOsc2o8+NQ6UwIszzc9L1HI6ErgA4G5P7CULZ/voPvP5Ljpjrrb8BMV5
         R8irPR1GHl9shEzT88QnObxXemwdJ/aSapZ8gezc2iaowhwVFstzlAUpyf+qbAOZC1U3
         FVXA==
X-Forwarded-Encrypted: i=1; AFNElJ8Rq/STNo7oBRr3GooLt7ZEM0td3PLuYv7oHoWAupSpfz4ivSpgP+G1825SOEZqdxNhkYElvYqzwib5gLuBci1y@lists.infradead.org
X-Gm-Message-State: AOJu0YxtfYcmfTDsrolZGZEKdcD0mDpgqvf1mLigqpaTkBbQHreijoih
	+cPHpHtAswh+QN04cN/MhpFQDS5NRdVIPanUwS20FhGFymBdMmf8eb3PUu08lf9xk94=
X-Gm-Gg: Acq92OGcYz4Wba8q/iPolSMKA+8OWpKJAcnRvRRnJy+wbjEp8LmH0mKaWuKWTA82JAu
	U8IV0MsE6KLGgvUEzXd0hD6EStJ0Pxjb8ci6Tee2BI2xxPgCj9HF7l/vgIkrRSBlnlkrm4AEqt8
	wAZw7PAhnRc1gkAyeKmBMCW/QJQlrzTeYN+rLzpzYe+cP0oDWHFlaYxSEtKb8Hl6qrrBimmKAig
	FcdHstA3RnFCWxb5kdHVgpoDbqkZOGhgLoyDfw8OyEh2Z6q+P8ifr8hxkrwHryyGxbvYFuROJ3c
	/yc4j053n/E9uoYphGnhgceE06PXETpq2tZo6lw3WP59wxJMIfX2erswZSkfQReW05IVuwz0pPh
	HdDJU5Bl4gCY+gv0cJEOu4iI6ckWmXR90TKPIv59xux0T1azdD9DrzTQxvAQ6yGndf8VWG0lIf+
	KlDsRo3m1BOvVbUDXU5mc+/1teQ4nGiDIvrjWHaAQgpfZoUgJoK+XpWZriAO6b6E8xO0eyHmSCT
	pqa2A==
X-Received: by 2002:ac8:638b:0:b0:517:7620:20f9 with SMTP id d75a77b69052e-519a8e01895mr53967651cf.19.1781710863733;
        Wed, 17 Jun 2026 08:41:03 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7a3c4asm171544001cf.14.2026.06.17.08.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:41:02 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wZsNx-00000000iiO-3Q8i;
	Wed, 17 Jun 2026 12:41:01 -0300
Date: Wed, 17 Jun 2026 12:41:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
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
	Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>,
	"Cheloha, Scott" <Scott.Cheloha@amd.com>
Subject: Re: [PATCH v6 03/20] dma-direct: use DMA_ATTR_CC_SHARED in
 alloc/free paths
Message-ID: <20260617154101.GE3577091@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-4-aneesh.kumar@kernel.org>
 <845d0c8a-6d51-47aa-8e0b-8381e733444a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <845d0c8a-6d51-47aa-8e0b-8381e733444a@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_084106_174482_0C6BEFAA 
X-CRM114-Status: GOOD (  16.50  )
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

On Wed, Jun 17, 2026 at 10:50:39AM +1000, Alexey Kardashevskiy wrote:
> > @@ -193,16 +193,31 @@ void *dma_direct_alloc(struct device *dev, size_t size,
> >   		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
> >   {
> >   	bool remap = false, set_uncached = false;
> > -	bool mark_mem_decrypt = true;
> > +	bool mark_mem_decrypt = false;
> >   	struct page *page;
> >   	void *ret;
> > +	/*
> > +	 * DMA_ATTR_CC_SHARED is not a caller-visible dma_alloc_*()
> > +	 * attribute. The direct allocator uses it internally after it has
> > +	 * decided that the backing pages must be shared/decrypted, so the
> > +	 * rest of the allocation path can consistently select DMA addresses,
> > +	 * choose compatible pools and restore encryption on free.
> 
> Why this limit?
> 
> Context: I am looking for a memory pool for a few shared pages (to
> do some guest<->host communication), SWIOTLB seems like the right
> fit but swiotlb_alloc() is not exported and
> dma_direct_alloc(DMA_ATTR_CC_SHARED) is not allowed.  Thanks,

Then setup your struct device so that the DMA API knows the
guest<->host channel requires unecrypted and it will work correctly.

I think this is a reasonable API to use for that, and I was just
advocating that hyperv should be using it too.

But it all relies on a properly setup struct device.

Jason

