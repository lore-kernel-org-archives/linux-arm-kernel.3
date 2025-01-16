Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5D8C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 19:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQt/5kPLKfcR/r6Q+UjR/d/646J1fzUVQYSmfGNoAZM=; b=LPy8PthadVKeHVa+W8Ipu+XhzK
	AcIYntLuvrIfHMJ6KW+1MRLDMaF4JPk1wNcbtwzl8rcaiLeIWK3kZEZNeWqndcaXobO8hFsYH83CT
	s3w+Vx6IsZEq2wqiPsaDxc+aReSTubl8QMWAKXdoclQokeKFSJTgZ3EpJddvgMUb3VdjmPOpfjXIN
	4ZyYCIaEcD11JpN96GBGYihn/iup5UOKWTXudMnnrjERFCCrzgZqCpz6h++kRT/9/J26U79Ad1+jZ
	HyWiZXGMnpQahzAD5AGjNLTBbflgHgjK+eEBMvY71jwXpWbDzWNIrCu+BV+WqOUOt/os16kw307zf
	Ik3e6tkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVLk-0000000Fs2i-3sOv;
	Thu, 16 Jan 2025 19:16:16 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVKU-0000000Frq6-2UPm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 19:14:59 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6dccccd429eso13669736d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 11:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1737054897; x=1737659697; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OQt/5kPLKfcR/r6Q+UjR/d/646J1fzUVQYSmfGNoAZM=;
        b=RNtbrpfeEPXY66ryy9zkuPK88Sg7c9zNsyKBDag87SI4Nq29RKjSUPCxPMHB0Fhp0U
         CDVZ5Un+1LaGiZSjmDf6iopY/pAmHVsX7TKV2MojHsPORwrSVDxwX+1pKOnXHQP2eg7D
         Mgle9WfXgYwhT4EkAQVgzS+VzNTmTZ4Vy2fmz6VBAFywtx3cmfVNLV8xIsXGcz2j6rlB
         llEbdqD7fxEXqitAaxo2kt9bsUaSTk4R+yHh23F+QUfgT80GXW0npOthV9U6tekaFV7a
         BWE00rh2yYRWRhVAEwWWPzeTYEeJZi6XWWB/ogkKyRGqaIFguDzC5Q/D0fKzwyQkb0uo
         xJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737054897; x=1737659697;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQt/5kPLKfcR/r6Q+UjR/d/646J1fzUVQYSmfGNoAZM=;
        b=nYxuZoNLLEx7VPlvGP9IT0LWqeW2zT6sm/Fbncev/WcGlHeeV+HkvFBaWcXWb7oPlP
         GWT+yKfyJGJZ1mMC2/SMVTatrRwQMhALnvQHCg6w9mjtF6TfdDPq7Sxu+t2KLQmmQIMj
         jH1gBjX9PY9qKZ41LNfZZyySZleavfVabedt0y5QM/eA0pTJzsXk2kjWfLXjDtk9eNKj
         TjQkgsDgGrQGn8e7rN87jCCsJS7RXax3NWvdC3SINOFnwZyEijDu2K0f4ZEiqayyVO6m
         5LZPSn06Y1Bg7xHFfS3oHpmLKRfx8f962fsQk176yQLd8KLpVWSKUirHqEUtyYpf94Ws
         B1rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMNaMPP8mzYlLIhsQ0PMwDd/Vcwt7IEWAYUUpnNBsui13KWjnMFY14RFKYQk56XGHDNiesFa89dW6VYL/ZPLtC@lists.infradead.org
X-Gm-Message-State: AOJu0Yy05SKTVvc81mOyaRKpOMq5EZoNxIMfi3aM1QOLR2p4y8lmw18V
	hLaxrtob8eNPP8yjFGYlI7oN1C36MkCkGS3f0uTJPMN+dBSRpxH6C4BLnRaQHqU=
X-Gm-Gg: ASbGncv3ZaZftaX5EMZHQIObKvZEe1o6cU5QWhqmJQH7oqEoiKSmu+MuVvaY/M2nPm1
	KWZWn6jppuxsm53IVi2ah6Va5O5LdaR2UhNnp96ON7rsbamkPsuV9eC62s1Ie6ue+p1h39duDMl
	bH2WZFjjpzvTxIggZhHNdHpecqqF3ItHQgM8eXIBNzY0Edh6fzo/ESwrRTmWy1rctMjrQz/3BD4
	BH28QmzJCvxQz6BeGMNw2jFyrt36NubvlhgqUgbCtLjzxWs/SYbZ+M7nMIu9N00Kiz3x4zpYFWy
	c2nGGKeJ6Jx1Pn+zAcL0B88Fnv9Z2A==
X-Google-Smtp-Source: AGHT+IEKLQFb6+AOsWzFxspuNmlLzUNEaMEFSc/MnRiIlEENEcAmYeVJMdkM047M2a18YZcxnlS9VA==
X-Received: by 2002:a05:6214:19c8:b0:6df:97a3:5e5a with SMTP id 6a1803df08f44-6df9b255d62mr623412166d6.28.1737054896839;
        Thu, 16 Jan 2025 11:14:56 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e1030e8dbsm2636371cf.44.2025.01.16.11.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 11:14:55 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tYVKR-00000002xdV-1jHj;
	Thu, 16 Jan 2025 15:14:55 -0400
Date: Thu, 16 Jan 2025 15:14:55 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Mostafa Saleh <smostafa@google.com>,
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
Message-ID: <20250116191455.GC674319@ziepe.ca>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212194119.GA4679@ziepe.ca>
 <Z1yNWI9lBNIZg6Le@google.com>
 <20250102201614.GA26854@ziepe.ca>
 <Z35rEeSVwfZVA9IF@google.com>
 <BN9PR11MB52767756EE35DA2359C351F08C1A2@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BN9PR11MB52767756EE35DA2359C351F08C1A2@BN9PR11MB5276.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_111458_739549_C2BD7B0D 
X-CRM114-Status: GOOD (  28.80  )
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

On Thu, Jan 16, 2025 at 06:39:31AM +0000, Tian, Kevin wrote:
> > From: Mostafa Saleh <smostafa@google.com>
> > Sent: Wednesday, January 8, 2025 8:10 PM
> > 
> > On Thu, Jan 02, 2025 at 04:16:14PM -0400, Jason Gunthorpe wrote:
> > > On Fri, Dec 13, 2024 at 07:39:04PM +0000, Mostafa Saleh wrote:
> > > > Yeah, SVA is tricky, I guess for that we would have to use nesting,
> > > > but tbh, I don’t think it’s a deal breaker for now.
> > >
> > > Again, it depends what your actual use case for translation is inside
> > > the host/guest environments. It would be good to clearly spell this out..
> > > There are few drivers that directly manpulate the iommu_domains of a
> > > device. a few gpus, ath1x wireless, some tegra stuff, "venus". Which
> > > of those are you targetting?
> > >
> > 
> > Not sure I understand this point about manipulating domains.
> > AFAIK, SVA is not that common, including mobile spaces but I can be wrong,
> > that’s why it’s not a priority here.
> 
> Nested translation is required beyond SVA. A scenario which requires
> a vIOMMU and multiple device domains within the guest would like to
> embrace nesting. Especially for ARM vSMMU nesting is a must.

Right, if you need an iommu domain in the guest there are only three
mainstream ways to get this in Linux:
 1) Use the DMA API and have the iommu group be translating. This is
    optional in that the DMA API usually supports identity as an option.
 2) A driver directly calls iommu_paging_domain_alloc() and manually
    attaches it to some device, and does not use the DMA API. My list
    above of ath1x/etc are examples doing this
 3) Use VFIO

My remark to Mostafa is to be specific, which of the above do you want
to do in your mobile guest (and what driver exactly if #2) and why.

This will help inform what the performance profile looks like and
guide if nesting/para virt is appropriate.

> But I'm not sure that I got Jason's point about " there is no way to get
> SVA support with para-virtualization." virtio-iommu is a para-virtualized
> model and SVA support is in its plan. The main requirement is to pass
> the base pointer of the guest CPU page table to backend and PRI faults/
> responses back forth.

That's nesting, you have a full page table under the control of the
guest, and the guest needs to have a level of HW-specific
knowledge. It is just an alternative to using the native nesting
vIOMMU.

What I mean by "para-virtualization" is the guest does map/unmap calls
to the hypervisor and has no page tbale.

Jason

