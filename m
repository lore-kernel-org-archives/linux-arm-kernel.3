Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D84E606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EccQOxva;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=HlphPP4x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z52AWMMx/NPlxXG7BPdw5LHgxa12llcgL1Kha+Q5UfY=; b=EccQOxvas7cYVfVGynQBsra5XS
	aynBcORb2c1RlMbG4hqL3tO/KglpWSFzAmPZMcV+kqONFxxUPAbYZZ4wsZG42iS802UMsLkX98717
	h1cSlUm21Ih4yw0C2uBynewCwOKzI52cJBnYEAaogt0yBtVEGvw5CrZfmCl9EqalhSa+a5XcAwkhU
	WmTjN5oQlFhtnnadY0gcd1PW50n75K6FWhZ/n2y2/TKlRwJS+Fa1XwN99h3ySWzZEY8RdsK0N54cS
	RM0pMk4Oc6R10WOpjERTjCX4ROA63eYkSv6XOGQ7sGYe9pGxMxdtHtuLd7DXf8c/0KApOzi2hpA6c
	kKrBjPWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3lZ-0000000AWXh-36Cl;
	Thu, 05 Nov 2026 20:08:57 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3kL-0000000AVqQ-2Ytj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:08:04 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-99071945aa7so1202109241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 12:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793909257; x=1794514057; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z52AWMMx/NPlxXG7BPdw5LHgxa12llcgL1Kha+Q5UfY=;
        b=HlphPP4xLBLRi1hlP0ahqJJcXlD4dyWrqh2X5aMz7HNQcvs3yuLb+fKqiDc0onnPch
         fNjKegUL581xUcW0qqePLMrE0Q6QOuk1zaO1QqtcB4OM7wz1SQtlEvaiWgibbz8BIUqx
         1kIPw+lI1QQKxim+Lbs8Pr2atMST6RlGGHuuVbo0cLhyxYx38rlrkhMvOjqkvlQBUsPq
         p5S7XtFX9hQfLfPeKCjb18nGPUBFeDdPaPrx3+ljCRWVO7vVZHlCajFKdOSE7N90TDZ8
         YzOeDw9F9tcd1G4mMuVslh2kn0V+/naMVuBJaMB51RxV+nJVlY/DV3rcl1VYAtGilJfn
         iUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909257; x=1794514057;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z52AWMMx/NPlxXG7BPdw5LHgxa12llcgL1Kha+Q5UfY=;
        b=R+e8H8XpefN2wqWhrT/yRLkdxeKvXp18eXDw5wxc93yQTb0mjlYzp9bDfZZEVWgXBR
         2flqOxdttpVOGG0pHYLHADBtOMMQTCNUUMhT4XX+nzWcez6tHHboh28KVFpvWG9Uztph
         RrXkDnpHY5ssC27zw+b4yVs79z6Kmo9LvnMpIwJAyVEXG2TtmSp8raim8txdbgIDNZR5
         BVnItZF27Ufh0OeVtRH0A6Ci6wEKQ4t9t/if0rjSCcnMxfmnoEX6Bzf76VQaWLJPOWxy
         S1kVt6cN9YnN3DN7Ua28laGHxSgBM3FrbY+2TfkICS+KfJZzo/O9pPYkiiFhFenh5xoF
         m9Cg==
X-Forwarded-Encrypted: i=1; AKwUvBwvGXG5/7qVv3zd6cGhUhiDrWqiG1/chthh1g822N0NP73hcJl75m2hYuBh3V9HkA4X8GeVH2i8ZV/An8Vfs/9/@lists.infradead.org
X-Gm-Message-State: APuU4Z8p95b8uwgk/GQMMtAd45s4CeoqCMMF2ZB7YZRdL8jxMCWndNId
	ppWYNUqU6HcPSqDrbQpGIrXLonMR6yPpbGtBVjpT3h97sz5LXHTNzmZOzGqVxVC9uL8=
X-Gm-Gg: AYBFou0/zUqXrhyGShWDmMNy5t1TzDNBFVZItk40Jx0Yfv0pHeOqLn+/mnLUXvky8wr
	UG3eMsiiwT/E03Z/kX+SKhK9JDXu6hTOo7K6NLIj89Lsd6MeTo16FDhH9LX5bhJ+nAHW0tSGaDE
	+LRczjfKM90+FdRLBJ/1DcaSQhB7QWWxUpdO1VCXyN6GhzuOR573zvOa7LMW/Baut6v3R6zWWyQ
	Gv5glIgaURFPVQAX/zrb0J13BvrrmB2JbweOKqCPmJMBpT8rwPI6JuEt0dMbcQTb7R+Pu9qseag
	JXazz2SDWAzemUZjDfKk8YIJQBHZ3UNIYJQNNTfYIMDxVATpWI4bFLfEys9pu1DbOEkMO1NqJyP
	2L8nQonDEsK4IGRGj8qfkW2I1f335LBJh3Vw0dbO2cZQB9na2wcFobnuTFtUJmauhAkWtodwSJ0
	6L2hecIhiriAB4Ei8A3bDPkjWGKDl7uXMkWIgKJfqTDhgIG0jA5x621/iMLXzojKAVGVQBITQdR
	SFZMPFZiYgzP3eNhHj4+Yq4S0Fbti6s/bFAw8F0RdnH/dVDpnIcHcvFe/YNILbesmjYMd6NmGEH
	T7iVCSLxLXXYTkHMhCQGk+tSYT9kymjmaQUlcGjZGlQyrAEbxJb42lYevbq3H9xuz26AT8mzOwN
	Wz7KmP2wQRQ==
X-Received: by 2002:a05:6102:390f:b0:7c3:99a3:314a with SMTP id ada2fe7eead31-7d2a1509e88mr658597137.9.1793909257584;
        Thu, 05 Nov 2026 12:07:37 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecb6d79d9fsm2610604e0c.7.2026.11.05.12.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:07:36 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP3kF-00000003dYX-3Q5c;
	Thu, 05 Nov 2026 16:07:35 -0400
Date: Thu, 5 Nov 2026 16:07:35 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 13/15] iommufd/viommu: Allow vIOMMUs without a parent
 HWPT
Message-ID: <20261105200735.GF663069@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-14-aneesh.kumar@kernel.org>
 <auuBjRjQwXl7UvvO@nvidia.com>
 <20261104193139.GB3889730@ziepe.ca>
 <yq5afqxf97a1.fsf@kernel.org>
 <auzAivzpzSUHjEQj@nvidia.com>
 <20261105182106.GD663069@ziepe.ca>
 <auzNkAGFLH6da8fq@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auzNkAGFLH6da8fq@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_120741_787377_A04A52A1 
X-CRM114-Status: GOOD (  21.55  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 10:40:16AM -0800, Nicolin Chen wrote:
> On Thu, Nov 05, 2026 at 02:21:06PM -0400, Jason Gunthorpe wrote:
> > On Thu, Nov 05, 2026 at 09:44:42AM -0800, Nicolin Chen wrote:
> > > On Thu, Nov 05, 2026 at 10:58:06AM +0530, Aneesh Kumar K.V wrote:
> > > > Jason Gunthorpe <jgg@ziepe.ca> writes:
> > > > > On Wed, Nov 04, 2026 at 11:03:41AM -0800, Nicolin Chen wrote:
> > > > >> By dropping the nesting parent from VIOMMU, it just simplifies the
> > > > >> attachment to an S1 paging hwpt, right?
> > > > >
> > > > > Yes.
> > > > >
> > > > > The VMM must always maintain a S1 paging attachment that is the
> > > > > identity map of the VM on all devices, same action as when there is no
> > > > > viommu.
> > > > >
> > > > 
> > > > I am currently creating an S2 paging attachment. This results in a
> > > > configuration with S1 disabled and S2 enabled, which is used by all
> > > > untrusted devices.
> > > 
> > > For validation, that would work. Yet "no viommu" should would be S1
> > > paging, i.e. hwpt allocated without IOMMU_HWPT_ALLOC_NEST_PARENT.
> > 
> > It doesn't matter, consistently using a single S2 for everything is
> > probably better..
> 
> Hmm, I am confused: if we use a nesting parent, why do we need to
> allow a viommu without a parent HWPT here?

It is because it doesn't *use* it. It is a confusing to pass in a hwpt
that is never used for anything.

Jason

