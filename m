Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF372C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 12:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsoV/LvY+nhEMjljzompPtNYOVC1vuKo/PhocupCgIA=; b=lVdIM6ohmkk8fqyqlFehk1LB5s
	V6Oegof+K9cpt90yzQMju6s5WihbpuKpEiPjEi3Qx12TWwf1OrfXiweaiBMmcXXmlle+kGiwqJVkk
	HWm0QKnDBE7vpWVwyTIZgIQyV9b9d/i9R9u4lGPYSYyr/UmlIyBNMjLbrMJYZgX0XiTLBERimeEYK
	CrBFMJEQ8MgRO+06g7jcTcINs0tbvIkmF3rsFvwCxY8BZKJf8gaJKYz+HjGj9jfdy1ZvGOXLDKbSK
	8FiqV0iE4zszcTUpjxcbmTsAWFc0y/Apy3fHaBpu0tCvYkwlg9Vu8eIFxbVZHyNnhdl/caUFGxX9U
	0A8XIhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td70g-00000006v7t-0e3z;
	Wed, 29 Jan 2025 12:17:34 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td6zM-00000006v2S-1E9e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 12:16:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-438d9c391fcso85195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 04:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738152970; x=1738757770; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KsoV/LvY+nhEMjljzompPtNYOVC1vuKo/PhocupCgIA=;
        b=O+8wk2mo3tXbzi9B6o2W7gWk0+yxLXCaSCp01r9TkkyY88hFjYDNV9sLTJyiibS/O6
         Oq5sWR2LP+iDjjzdEzQuUCVGNmvYcxO4sD0SFq27+gekoedd9sTcbmj2jMoiuN2pV52M
         FWj/x7hb4GrMOVuPf8e2tA0U9ACBliu+697+CzG+66klFpmtOSRSb2whKnSCmtXt+UnU
         P2uAKs+FR7zn5ZKZRVB/F6hV2diveyyip+FYCGwkBwjCBquGG4Z2ZGWKx3+QgQ9ew1UF
         1OetjPMX5W4gU7TOCbO9pnoicYiP3BGSlj9sXVH3nEWkCNVInWn2JkMSq/Fe8pP7bn1C
         kNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738152970; x=1738757770;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KsoV/LvY+nhEMjljzompPtNYOVC1vuKo/PhocupCgIA=;
        b=FgvujHEllZc66o11ssLBs2gJ+tWd4A8gqRDOOUzQoRE2YQULmzas3mT92UMC7gUU3d
         I5q76biVRqHiR/pgLW7BUiT1+T54Ou2DK8g8XFCoBHpDZPd9qqqH/EdSWOToBh5FcJl2
         RpLcpj6JrLwGOEs/cKFCi+w8ZSqS4waTSxwY0ME6vXhfAPRqY4n5po6yvYxvdfstyKF4
         pAWVueXVxKO8uij0ifm4RKcpoxN5dTvNCCR4/FEzwc2cAazsj6kZiPidhQsSPdpeCuKK
         fL2qITUoZOrqI8HE/2Re7msBSnE5GGW1q8BwS6c8ITU8LC8hPZavASwDVxmlXdadZsv+
         A8QA==
X-Forwarded-Encrypted: i=1; AJvYcCXneSQchj3IxeoSPEXB1GfRB/bHo+dJMuAm0/sHDrxNZYxtKZ0bT4a8SbvtcCyVs32G7NF4zGJc3vmCe6+W0hA/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+6b0cihgX3Zs5+/88j6ejKFPiLjHDeM5REl4zSgZzAiu5y68N
	s2LiW0bE1dIkrASePkt+GST0PjVp/a2OrrkPD9g2/4sw3WdeabMtBZEMRBSF7w==
X-Gm-Gg: ASbGncsDfmfa80Gh8OTW7qSirGUtDwiwp4+IZtEeujElfvW3GLaTPhwYQSI6doGz/mk
	Crukh+8f5vvZJFgxrI2XMMpg6gNB7EnSUTpdDECA3wxY31aMyv7yESu+F/7U7PME9c8wKCdpfmU
	tdPLLHzLfz0vvTy/EJyvn07+9Q1P5yC6sJBGdzsrajoZlqky/RlVIYCrh8E6i5pQ/rFkMIa+dAh
	g/pmK+b3ORe6DOZUpPUgldFs6HhTYa9JMy1oy6G2vOUcGc7q4bsim7U3DYsrUud5YlbaS9XR+hY
	ClOf6HxHq8TFcEMXULV9Jyp2CpIlq6onng7k3Zt4OGE+KdkHsSk=
X-Google-Smtp-Source: AGHT+IHdxx2hNjGazr2D3TklGqwL4KUAhuNB+hsGlC38PJET1VJkzQdQAU4y4v+hrBc5bwG0U2GAiA==
X-Received: by 2002:a7b:c3d8:0:b0:42c:9e35:cde6 with SMTP id 5b1f17b1804b1-438dc37d9aemr978295e9.2.1738152970287;
        Wed, 29 Jan 2025 04:16:10 -0800 (PST)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c3ec83e20sm10167480f8f.23.2025.01.29.04.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 04:16:09 -0800 (PST)
Date: Wed, 29 Jan 2025 12:16:05 +0000
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
Message-ID: <Z5ocBVxDnqZVINXQ@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212194119.GA4679@ziepe.ca>
 <Z1yNWI9lBNIZg6Le@google.com>
 <20250102201614.GA26854@ziepe.ca>
 <Z35rEeSVwfZVA9IF@google.com>
 <BN9PR11MB52767756EE35DA2359C351F08C1A2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250116191455.GC674319@ziepe.ca>
 <BN9PR11MB52766732572A17627D16CBAC8C1B2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Z5DQuNn3GoU1vYPV@google.com>
 <BN9PR11MB52760945FBCF542F77DCF4CA8CE02@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BN9PR11MB52760945FBCF542F77DCF4CA8CE02@BN9PR11MB5276.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_041612_360467_4E132E80 
X-CRM114-Status: GOOD (  51.49  )
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

On Thu, Jan 23, 2025 at 08:13:34AM +0000, Tian, Kevin wrote:
> > From: Mostafa Saleh <smostafa@google.com>
> > Sent: Wednesday, January 22, 2025 7:04 PM
> > 
> > On Fri, Jan 17, 2025 at 06:57:12AM +0000, Tian, Kevin wrote:
> > > > From: Jason Gunthorpe <jgg@ziepe.ca>
> > > > Sent: Friday, January 17, 2025 3:15 AM
> > > >
> > > > On Thu, Jan 16, 2025 at 06:39:31AM +0000, Tian, Kevin wrote:
> > > > > > From: Mostafa Saleh <smostafa@google.com>
> > > > > > Sent: Wednesday, January 8, 2025 8:10 PM
> > > > > >
> > > > > > On Thu, Jan 02, 2025 at 04:16:14PM -0400, Jason Gunthorpe wrote:
> > > > > > > On Fri, Dec 13, 2024 at 07:39:04PM +0000, Mostafa Saleh wrote:
> > > > > > > > Yeah, SVA is tricky, I guess for that we would have to use nesting,
> > > > > > > > but tbh, I don’t think it’s a deal breaker for now.
> > > > > > >
> > > > > > > Again, it depends what your actual use case for translation is inside
> > > > > > > the host/guest environments. It would be good to clearly spell this
> > out..
> > > > > > > There are few drivers that directly manpulate the iommu_domains
> > of a
> > > > > > > device. a few gpus, ath1x wireless, some tegra stuff, "venus". Which
> > > > > > > of those are you targetting?
> > > > > > >
> > > > > >
> > > > > > Not sure I understand this point about manipulating domains.
> > > > > > AFAIK, SVA is not that common, including mobile spaces but I can be
> > > > wrong,
> > > > > > that’s why it’s not a priority here.
> > > > >
> > > > > Nested translation is required beyond SVA. A scenario which requires
> > > > > a vIOMMU and multiple device domains within the guest would like to
> > > > > embrace nesting. Especially for ARM vSMMU nesting is a must.
> > 
> > We can still do para-virtualization for guests the same way we do for the
> > host and use a single stage IOMMU.
> 
> same way but both require a nested setup.
> 
> In concept there are two layers of address translations: GVA->GPA via
> guest page table, and GPA->HPA via pKVM page table.
> 
> The difference between host/guest is just on the GPA mapping. For host
> it's 1:1 with additional hardening for which portion can be mapped and
> which cannot. For guest it's non-identical with the mapping established
> from the host.
> 
> A nested translation naturally fits that conceptual layers.
> 
> Using a single-stage IOMMU means you need to combine two layers
> into one layer i.e. GVA->HPA by removing GPA. Then you have to
> paravirt guest page table so every guest PTE change is intercepted
> to replace GPA with HPA.
> 
> Doing so completely kills the benefit of SVA, which is why Jason said
> a no-go.

I agree, this can’t work with SVA, in order to make that work we would
need some new para-virt operation to install the S1 table, and the
hypervisor has to configure the device in nested translation.

But, for guests that doesn’t need SVA, they can just use single-stage
para-virt (like virtio-iommu)

> 
> > 
> > > >
> > > > Right, if you need an iommu domain in the guest there are only three
> > > > mainstream ways to get this in Linux:
> > > >  1) Use the DMA API and have the iommu group be translating. This is
> > > >     optional in that the DMA API usually supports identity as an option.
> > > >  2) A driver directly calls iommu_paging_domain_alloc() and manually
> > > >     attaches it to some device, and does not use the DMA API. My list
> > > >     above of ath1x/etc are examples doing this
> > > >  3) Use VFIO
> > > >
> > > > My remark to Mostafa is to be specific, which of the above do you want
> > > > to do in your mobile guest (and what driver exactly if #2) and why.
> > > >
> > > > This will help inform what the performance profile looks like and
> > > > guide if nesting/para virt is appropriate.
> > >
> > 
> > AFAIK, the most common use cases would be:
> > - Devices using DMA API because it requires a lot of memory to be
> >   contiguous in IOVA, which is hard to do with identity
> > - Devices with security requirements/constraints to be isolated from the
> >   rest of the system, also using DMA API
> > - VFIO is something we are looking at the moment and have prototyped with
> >   pKVM, and it should be supported soon in Android (only for platform
> >   devices for now)
> 
> what really matters is the frequency of map/unmap.
Yes, though it differs between devices/systems :/ that’s why I reckon we
would need both on the long term. However, starting with some benchmarks
for these cases can help to understand the magnitude of both solutions
and prioritise which one is more suitable to start with for upstream.

Thanks,
Mostafa
> 
> > 
> > > Yeah that part would be critical to help decide which route to pursue
> > > first. Even when all options might be required in the end when pKVM
> > > is scaled to more scenarios, as you mentioned in another mail, a staging
> > > approach would be much preferrable to evolve.
> > 
> > I agree that would probably be the case. I will work on more staging
> > approach for v3, mostly without the pv part as Jason suggested.
> > 
> > >
> > > The pros/cons between nesting/para virt is clear - more static the
> > > mapping is, more gain from the para approach due to less paging
> > > walking and smaller tlb footprint, while vice versa nesting performs
> > > much better by avoiding frequent para calls on page table mgmt. 😊
> > 
> > I am also working to get the numbers for both cases so we know
> > the order of magnitude of each case, as I guess it won't be as clear
> > for large systems with many DMA initiators what approach is best.
> > 
> > 
> 
> That'd be great!

