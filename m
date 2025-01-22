Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469F1C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 11:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6x8SiYYYUQFFMCokfouR/mswZBMHq350sgLQtsTuQB0=; b=GhOxbfGUAAQie965jHhmg3/hOG
	teFBDf2pmGgZLQeV8rY2Oo9hBol2i+mV/oA9SWs4lvG5FrzP3pAIxWgwphaQqxj2n1jGjlIJLs+hl
	1Z9G4OhVGC7Wdh6zl/iKYJgpS/Fo5u8VCxs3JDx5/RgtxTChZ8tMtHscmRgsgkfE0rU3jBafHa6ma
	LpkU0kG6kfc3qAOE+q5ryj5zaefK1PG/lQtuUiMfRQlhL5Hm7Y3SRl0GU22rNra/nKQDUCj2++p/6
	EfLdZioA9qoe52eMTeMQoDb42qy2fzvXiqOScAWFsSzkktrxKG6PHNiZY7cTcvLar7vmfyzH/Tps+
	DaJEK9IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taYYU-0000000A0Xp-3SNX;
	Wed, 22 Jan 2025 11:05:54 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taYXB-0000000A0LU-0mWo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 11:04:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4368a290e0dso36385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 03:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737543871; x=1738148671; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6x8SiYYYUQFFMCokfouR/mswZBMHq350sgLQtsTuQB0=;
        b=2y1VWPBJnt7cQ68ch90z4dgeQ4fgM9/NtekSh5cMMIH++iwrBlZHbCYc7vcQTPTe3v
         DFH1H25vVju9zZGJ/KBlCP0E00p5YhTdGiiWKXjveexjnusKE0ytgF020r8gjLz1SfQw
         inxn0QUysKlaI9KysQgTTf09Kb45xxZykT+HqCgYIqdmRgwKSvGgM5lBEgCPsL5k/4N4
         F42nR69aHh18f3VPPRqBwhftBcS3kijU71bYsiYwJDwZcxVGO4ah1YXAnu7+q7aVzvkI
         HCAxyunv3TPxqGzXsC6bQo5PLTNs8Sh7Vfq8K6fwJBWUfbE8zHFb7jRGABxOWAIdvr8f
         hL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737543871; x=1738148671;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6x8SiYYYUQFFMCokfouR/mswZBMHq350sgLQtsTuQB0=;
        b=ZnmXJC93L3PD4JridavXXfSM9hlcdHwrQ/VQRccLCVAgblEV/ER31Kx1EMgOeYNZB7
         vDE7EkSb1aVZ+7ND4reEA7zIv0aSjqYhDhduGYP5na74brDfrmTx36uAv9wLUy8vDI7a
         x0UYTb5U8ojy5TR+7H0nKHL5DZBnxe4zMLYu78EbZyaRru65tRUyx8YnDJJaebwQnVOz
         TBda1H6pCLswZD7WSHS8Zra0pTk96wfjNdGmwvfZXzDyJg2+GUeohQgbu1JkRWQdrVUY
         FSsmbxMnVl2crdWdM/daYo1D0T2h5fVtgHrDAoYBRpf15aVQpbOWyL+kSaU7EkCT9gdD
         nYRg==
X-Forwarded-Encrypted: i=1; AJvYcCUBWeqxXyT0ByQVunDZ7KWdJb8Svw8dl3rSzQ4U+znQf/s7iuv4bkqXSBP9731wLXRLd41+C+TB3QyEKqLFIuVH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7/aAvC1IBxSUv1xhU18CiODF7pameeEvnNASmkD6+PRWqjbnW
	MzdcRd0NR/aYO+O9Vx9uFfvnS1Wnme88mSeHzkA5Bh2qMKFl3ePgPpY79YZaSQ==
X-Gm-Gg: ASbGncuBWiyJ7RL7q8OLi2zHV3/DU9u9i3JZSjh3+H3bNEFubl8eL78hRXEqahUFfnA
	tH83icEgr2Cgy4wWBb+cgvqvXKQv5Dk+yM55PJ34OGNx3d9IDNOYn4oNs9b3WuADi1jaPmkcgjY
	T+XFGTccthRJ4uIQx5TFo0EkXVZWnPx4CNi4CrlsudVwgNFFt2ctNrUwTyAOj6idDCtiTpl5W15
	/uvTytmpj8Fo1fXq9gCxl6HjgDsC3FGZSLWPxWAEzzzW7cUsY8a+AYAv1XT40mTKH1SS9prn/5y
	MTrtP60wzEMt8i1eAu/1cjwbixmzEw==
X-Google-Smtp-Source: AGHT+IHCcPrZhJYSQbULZrw9Pp5790wT0aW6WD0dYCBGNGReHretNQSCRXdvXPT2A8uBJ9bQ0Dv2SQ==
X-Received: by 2002:a05:600c:1d8f:b0:436:ed00:9e3 with SMTP id 5b1f17b1804b1-438b21c931dmr1151165e9.6.1737543870607;
        Wed, 22 Jan 2025 03:04:30 -0800 (PST)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221baasm16122838f8f.35.2025.01.22.03.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 03:04:30 -0800 (PST)
Date: Wed, 22 Jan 2025 11:04:24 +0000
From: Mostafa Saleh <smostafa@google.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"robdclark@gmail.com" <robdclark@gmail.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"vdonnefort@google.com" <vdonnefort@google.com>,
	"qperret@google.com" <qperret@google.com>,
	"tabba@google.com" <tabba@google.com>,
	"danielmentz@google.com" <danielmentz@google.com>,
	"tzukui@google.com" <tzukui@google.com>
Subject: Re: [RFC PATCH v2 00/58] KVM: Arm SMMUv3 driver for pKVM
Message-ID: <Z5DQuNn3GoU1vYPV@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212194119.GA4679@ziepe.ca>
 <Z1yNWI9lBNIZg6Le@google.com>
 <20250102201614.GA26854@ziepe.ca>
 <Z35rEeSVwfZVA9IF@google.com>
 <BN9PR11MB52767756EE35DA2359C351F08C1A2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250116191455.GC674319@ziepe.ca>
 <BN9PR11MB52766732572A17627D16CBAC8C1B2@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BN9PR11MB52766732572A17627D16CBAC8C1B2@BN9PR11MB5276.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_030433_233927_B689504A 
X-CRM114-Status: GOOD (  46.29  )
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

On Fri, Jan 17, 2025 at 06:57:12AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@ziepe.ca>
> > Sent: Friday, January 17, 2025 3:15 AM
> > 
> > On Thu, Jan 16, 2025 at 06:39:31AM +0000, Tian, Kevin wrote:
> > > > From: Mostafa Saleh <smostafa@google.com>
> > > > Sent: Wednesday, January 8, 2025 8:10 PM
> > > >
> > > > On Thu, Jan 02, 2025 at 04:16:14PM -0400, Jason Gunthorpe wrote:
> > > > > On Fri, Dec 13, 2024 at 07:39:04PM +0000, Mostafa Saleh wrote:
> > > > > > Yeah, SVA is tricky, I guess for that we would have to use nesting,
> > > > > > but tbh, I don’t think it’s a deal breaker for now.
> > > > >
> > > > > Again, it depends what your actual use case for translation is inside
> > > > > the host/guest environments. It would be good to clearly spell this out..
> > > > > There are few drivers that directly manpulate the iommu_domains of a
> > > > > device. a few gpus, ath1x wireless, some tegra stuff, "venus". Which
> > > > > of those are you targetting?
> > > > >
> > > >
> > > > Not sure I understand this point about manipulating domains.
> > > > AFAIK, SVA is not that common, including mobile spaces but I can be
> > wrong,
> > > > that’s why it’s not a priority here.
> > >
> > > Nested translation is required beyond SVA. A scenario which requires
> > > a vIOMMU and multiple device domains within the guest would like to
> > > embrace nesting. Especially for ARM vSMMU nesting is a must.

We can still do para-virtualization for guests the same way we do for the
host and use a single stage IOMMU.

> > 
> > Right, if you need an iommu domain in the guest there are only three
> > mainstream ways to get this in Linux:
> >  1) Use the DMA API and have the iommu group be translating. This is
> >     optional in that the DMA API usually supports identity as an option.
> >  2) A driver directly calls iommu_paging_domain_alloc() and manually
> >     attaches it to some device, and does not use the DMA API. My list
> >     above of ath1x/etc are examples doing this
> >  3) Use VFIO
> > 
> > My remark to Mostafa is to be specific, which of the above do you want
> > to do in your mobile guest (and what driver exactly if #2) and why.
> > 
> > This will help inform what the performance profile looks like and
> > guide if nesting/para virt is appropriate.
> 

AFAIK, the most common use cases would be:
- Devices using DMA API because it requires a lot of memory to be
  contiguous in IOVA, which is hard to do with identity
- Devices with security requirements/constraints to be isolated from the
  rest of the system, also using DMA API
- VFIO is something we are looking at the moment and have prototyped with
  pKVM, and it should be supported soon in Android (only for platform
  devices for now)

> Yeah that part would be critical to help decide which route to pursue
> first. Even when all options might be required in the end when pKVM
> is scaled to more scenarios, as you mentioned in another mail, a staging
> approach would be much preferrable to evolve.

I agree that would probably be the case. I will work on more staging
approach for v3, mostly without the pv part as Jason suggested.

> 
> The pros/cons between nesting/para virt is clear - more static the 
> mapping is, more gain from the para approach due to less paging 
> walking and smaller tlb footprint, while vice versa nesting performs
> much better by avoiding frequent para calls on page table mgmt. 😊

I am also working to get the numbers for both cases so we know
the order of magnitude of each case, as I guess it won't be as clear
for large systems with many DMA initiators what approach is best.


Thanks,
Mostafa

> 
> > 
> > > But I'm not sure that I got Jason's point about " there is no way to get
> > > SVA support with para-virtualization." virtio-iommu is a para-virtualized
> > > model and SVA support is in its plan. The main requirement is to pass
> > > the base pointer of the guest CPU page table to backend and PRI faults/
> > > responses back forth.
> > 
> > That's nesting, you have a full page table under the control of the
> > guest, and the guest needs to have a level of HW-specific
> > knowledge. It is just an alternative to using the native nesting
> > vIOMMU.
> > 
> > What I mean by "para-virtualization" is the guest does map/unmap calls
> > to the hypervisor and has no page tbale.
> > 
> 
> Yes, that should never happen for SVA.

