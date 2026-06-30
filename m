Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F34C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GI+sDv/bw0RypxsaDxkfRwNjpEKuAX+hIc2iRD1v3+Q=; b=wzP1pjKcNTm4iD++ar7OmHRrNJ
	1QeP8f/vCvFbgLC4E/4/SBktBpg/9fhIgwfS5JT37uqEiYHVF8/Qojr1tmFIGAq6gXvZ5P4fXCEAn
	g91hAuRYC2WUz6o5f8pWtZSJrQL4spI+6fpYuP12kPyQqC0v3NGYmqRxjLm4QX97CY4f7lO7EdjYx
	kdrZ9jC7CfzGzsmxklZpqICVq3mm1coI1hXX4IT2YGZG//Xoc45lolaG6/SJPvsrT7WxbPtsPIb9b
	kaPoAEdGKRaGp0NM8UKdCyV0MRn8pFpEstu6cyVITHd2Uuw2Ue7S9LgApcuryTPEXIrVzAiupPVh0
	9Yt75mnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weavD-0000000HQvz-0ZX7;
	Tue, 30 Jun 2026 16:02:51 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weavA-0000000HQuw-0FqL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 16:02:49 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-92c7a0a701aso231711585a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 09:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1782835366; x=1783440166; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GI+sDv/bw0RypxsaDxkfRwNjpEKuAX+hIc2iRD1v3+Q=;
        b=Fm/1rA1mMWxfeepCGLKL09ClgLAkUKbFMV/HTOUKuelUJyU7RfnxfuV+ug33KeW0P8
         GJ4OOEBLj5Bt4bdXjaA/oEAw2H+HywpSWfWGXW9HflpHrW++Mnuq6kmWE8flo7ix2gPH
         8rZL2r8XwztsyIn8Cie3dnTHOdfCrxSB5PugA1J4q8nimXEYSMzrdWYqh+kfbhNsp1ua
         fq1qWz8OT5fzJveuQhmKqrFGGCWofNlHv0THcc5w9TXSnSTfy0esenBlM2vD4ZxB2tFj
         CuE0Q4FA1K3A7rRZY9K/EGQp1YBn6IkyAAQn0jkB9ah3QfJVFdZKfnZ1SiyA2IYX3928
         BeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782835366; x=1783440166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI+sDv/bw0RypxsaDxkfRwNjpEKuAX+hIc2iRD1v3+Q=;
        b=epX9VpkFDRv9fYWZEd8u8vtPRn6HvASD6ClyKWGd2a1jHH7YN/EybZz2VJnwzvMs0c
         QVHtu9/GZmAP0yD12nHY6uWTGLov1nO4+CQh6H8mRYmWk9Rvh0Rk9sKIaIf09pBIBClA
         +dr+rFKH+KdcD5l116/oGMfLMe7dMlficPye8wbZCn9wNMQW9zDRysNyXSicEPkIy6XK
         5+2uyUQbMX580v3aOP7bsTS1Bp7U1dxj7itm49PGXOtrLtVaYmcexgbvu/op8/KPZStK
         wjwbjH1662nFRTxIvUNH5bwYtoNv46K5/lQMtXPHNkF3ORRThhCv1Br6UlusewT9C+9f
         BCsg==
X-Forwarded-Encrypted: i=1; AFNElJ9zLEn0jcqOfhQnfO65Cbkeuo9upe9YpZ+LsJmGyXRi+1Q0gD35bH6PrAfFF5rfX7cNwq3/oSSfj8LCzL/SXn9c@lists.infradead.org
X-Gm-Message-State: AOJu0YwfKdbowaR2FhbEuanY1H+Sw+XmdOi681tvvNDuiLxx6frYxepX
	szGL/YNv1yq/UKjycF1K4MBMlZwfETNKRlbaBWhxd2XMBf7tsU7As7hUJW4GTZX5eHYYYfzW8RK
	BLR3d
X-Gm-Gg: AfdE7cnNAc+HerFmCNug+1EOCdRRsVdbEX8Jp7LEgtnVXXheJk3rH9E3GaPGYyvLz0x
	azorw9aXS6CkqD1hSaVrNDcYKIE5jjVXgV1ghckjswYThcFrxjacdBw3v/IcMN7NrIWtlJZ51xS
	vS7qb3742v2bO+PObGmymlQLcB/QwfqnXK5KbO328ni+8ExfVbeJAp0u2x2N4WHMs152pCSVVFM
	2fkzeiBRTi3tZOhf+XX/O927vOBbdnD2peWFJuRnk9FKtr4t/U6ib4EJRiMoPEcY1wxNqR0CltW
	OcIoQPbo7ISfIvtcCdLUM37LKam79aOa42E5fTGSa7gz8c7smQZvvgUNpV1V8rfT6APPTEHmOb8
	kukE1f1WH/owqec9CbHjtutwOHNjksj5R4IuBusWTdwZ9HEyszZqWtXCpWEXolrfv0jbjL/bnJv
	5RHUuxTi3V7hrblFaDO2yvEws4c8PVuqovn4TpLr/JnF/RNslOFTLbGIhVsQzfmOq+fzU=
X-Received: by 2002:a05:620a:839b:b0:915:c4de:7ac0 with SMTP id af79cd13be357-92e6278d80fmr646181785a.31.1782835365891;
        Tue, 30 Jun 2026 09:02:45 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e6236b9fcsm262102385a.41.2026.06.30.09.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:02:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1weav4-000000027Ay-3dT0;
	Tue, 30 Jun 2026 13:02:42 -0300
Date: Tue, 30 Jun 2026 13:02:42 -0300
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
Message-ID: <20260630160242.GI7525@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-4-aneesh.kumar@kernel.org>
 <845d0c8a-6d51-47aa-8e0b-8381e733444a@amd.com>
 <20260617154101.GE3577091@ziepe.ca>
 <25155bd6-4348-4aa8-ba70-0a882fc84db9@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25155bd6-4348-4aa8-ba70-0a882fc84db9@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_090248_136974_AAA19F63 
X-CRM114-Status: GOOD (  28.82  )
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

On Thu, Jun 18, 2026 at 12:39:21PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 18/6/26 01:41, Jason Gunthorpe wrote:
> > On Wed, Jun 17, 2026 at 10:50:39AM +1000, Alexey Kardashevskiy wrote:
> > > > @@ -193,16 +193,31 @@ void *dma_direct_alloc(struct device *dev, size_t size,
> > > >    		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
> > > >    {
> > > >    	bool remap = false, set_uncached = false;
> > > > -	bool mark_mem_decrypt = true;
> > > > +	bool mark_mem_decrypt = false;
> > > >    	struct page *page;
> > > >    	void *ret;
> > > > +	/*
> > > > +	 * DMA_ATTR_CC_SHARED is not a caller-visible dma_alloc_*()
> > > > +	 * attribute. The direct allocator uses it internally after it has
> > > > +	 * decided that the backing pages must be shared/decrypted, so the
> > > > +	 * rest of the allocation path can consistently select DMA addresses,
> > > > +	 * choose compatible pools and restore encryption on free.
> > > 
> > > Why this limit?
> > > 
> > > Context: I am looking for a memory pool for a few shared pages (to
> > > do some guest<->host communication), SWIOTLB seems like the right
> > > fit but swiotlb_alloc() is not exported and
> > > dma_direct_alloc(DMA_ATTR_CC_SHARED) is not allowed.  Thanks,
> > 
> > Then setup your struct device so that the DMA API knows the
> > guest<->host channel requires unecrypted and it will work correctly.
> > 
> > I think this is a reasonable API to use for that, and I was just
> > advocating that hyperv should be using it too.
> > 
> > But it all relies on a properly setup struct device.
> 
> Sounds good but how do I do that in practice? 

I think we haven't got there yet, I understood Dan's plan was to add a
bit in the struct device that signals if the device must be
unencrypted or can support all memory.

Currently the dma api assumes all devices must have unencrypted by
default so it should be fine already, shouldn't it?

> not externally available so I'll have to trick the DMA layer into
> using SWIOTLB (which is still all shared, right?) as I specifically
> want to skip page conversions. Setting low DMA mask won't guarantee
> that the DMA layer won't allocate a page outside of SWIOTLB and
> convert it. Manually do

Why so particular? Any address that satisifies the constraints should
be good enough?

Jason

