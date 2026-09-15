Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF4BC88E7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSXuxco/xIMIgeK0msm6noQ0z/sdWL5ZlVJapMHGK5U=; b=C1sh3pMrK7LLcnnR4hPgH3luBN
	1n/FOMieHiOJHFifW0m4tIn9GpUhLI+x2LDqp5uozZdnG2/jhGMdsbt0oyS/BlqljXWgM9YX+MZjN
	/QbSfFzB8WsgaH33qSosH2SVgb8WTms4uBe7gFsfzugGlcVan+WxXk7jOWTqVlf/bz2VvlZMluYKE
	GDmMyCY8t4fGMWc6KgqghcUaapz9Cg2mPHDl7TuW7shKtQaSg/IXeTqqO9HqXtW4dDn4itUdREsxf
	yCdTIGCmymQHVcH+0AAsYIBBi1/vHtTu/XKEwSZ+U0s42EO1uYEh9TrTMJXoBIBD0QumJVcB3I6Yy
	TgTnmuew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TRU-00000006mNz-3xgX;
	Tue, 15 Sep 2026 13:43:24 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TRR-00000006mMl-2nU5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 13:43:24 +0000
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-530c602630bso34606741cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 06:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789479800; x=1790084600; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bSXuxco/xIMIgeK0msm6noQ0z/sdWL5ZlVJapMHGK5U=;
        b=kTrDiF4dBneZR2SoyXVzYrABkibQwyB9f17ZHwYMLpgQAzdbpk5I0IEq7xNsmhg+dV
         qll4X9Mmgag4Q2mRG3FeJD80LLlT7LGCNBmR2F+Ea16mhFf7xJ7mjerkVWzSJ62g/jIC
         YT9ScEwvXDwrTTmwoU9cuXrePEppfVzkstph27HSP+q15iqf7Q8Hk5XioGIoeUuT+eAJ
         3KfKUJCAXc/3L1jQewy+CtvuvtHSp5RhHZfZf3ur297L5+RlEAvwD9uIK9lc7jUnGZzn
         t00DRy8qaZ6MlMUi6+Bkg/0dXKMH0DKqFCwPoxDYhlj6iUorjdggEGmPRr1tDlRRd8Ci
         odRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789479800; x=1790084600;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bSXuxco/xIMIgeK0msm6noQ0z/sdWL5ZlVJapMHGK5U=;
        b=YTVpetc5Nm3qzHPouuoq6a7AlAgzXWOBNtUJF6wwrbx4Yy27aTZ23JkuDVX5oNwSyK
         ipVV85k0/HkVrnB72B+gy2qYaSOwlHGGBlDn7xzBDcVtghTRu5ey3mF9eGukAwYe2Nsl
         9tVxquGxTiglge+NMMsWHr1nTgqrVZ2ecRGeBjfx8j0zi4M0KAdJLaNEgEA9sSwrUyIl
         Lm/jdtamm0cSHcFPU13GcG4Z4s6xo5tkL1A5TOiaQJ2E2PITGyrzbojeKMW8Vq3FQbbw
         0maitzkCgbLsDrlixX8CuSFAlsKSe3y0sb0xQZmL0kVk7yWSozKVazU26IVc/9zWsg+i
         0nSg==
X-Forwarded-Encrypted: i=1; AKwUvBwvNunbAolXr+8SbohV48DO7h1lJ/ZtQRKDtbm2igZk+uqzY8y21SIa+wnjbJMGuumT0hK6HJJdYNg/DY0Ju+n2@lists.infradead.org
X-Gm-Message-State: AFuF++nqPP8evj9sWlAuqbpVYDBCfzJTDM8vy+mJrzVjXWMurJQEi3/f
	vEU1sOJ+KJyOQm5CNXYOdBm7CuD964+zqLHTteM2ndbTgoP0bF63XlddeMs1KrEFSVs=
X-Gm-Gg: AYBFou3Y3rW1LV51kHLctaTC/W4oAKjnVume/tZAHUQxEqdLEDLLwOJ/gJbbg2tzuZj
	6In9JTjwpMayeMJJsT0psb2tJ5CQsuEd6bC88lZO/sZxOf9QvlMdqg7gMoYjJJmYt8GD3tL82T/
	LR9ryoErjWUcybg4WI/PBUt4iC1yQJrXGLEaVdID0Jjq8xKFNRP/wV/P6IiAgTF9XURItJjfO6M
	PXaKHhIVCybDCBBNgyFLg3+l2uggqf5p1ivU1hcDDqERsquVwQSPm3LRwpcuhJFunD9ct+iNRuN
	G0GpxqHwbdg3/NNlfqy5HVkX/JShhAs9AI2+o7LXFFmG2wbyM2/dhJNFR59VRZJdv/n4Fd+Vldv
	OOcWnxGbiIE/WaUA+9t4DtR79Wc+fgaeuJmfLNlceYpX3MI1sSXPKC588MacFiCiKO2UiXCbod2
	52szLqKFczCYYZ5q+MuGAJ2S6f5aAqJj3urgv28RdA2a2czeAzcb0UAvNR8UpDI+hsv/PUDaBRA
	5cihOHUn7aX25KOKGLUbE8P6fSu2zuf7flrm7QOZ7rrfeIm9Nw5nVTu
X-Received: by 2002:a05:6214:4986:b0:90c:d6fc:e284 with SMTP id 6a1803df08f44-9122e54a861mr120216456d6.17.1789479799946;
        Tue, 15 Sep 2026 06:43:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d51ffsm124036106d6.45.2026.09.15.06.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:43:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x6TRO-00000004bnd-23bE;
	Tue, 15 Sep 2026 10:43:18 -0300
Date: Tue, 15 Sep 2026 10:43:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260915134318.GB3196566@ziepe.ca>
References: <20260902235609.GG2890729@ziepe.ca>
 <yq5a8q5izxz4.fsf@kernel.org>
 <20260903171704.GK2890729@ziepe.ca>
 <yq5acxupjsy2.fsf@kernel.org>
 <20260907125228.GB667892@ziepe.ca>
 <yq5atsnyag84.fsf@kernel.org>
 <20260909124628.GH2543240@ziepe.ca>
 <CO1PR11MB4835512E374074A5F4AD0A6C8CBF2@CO1PR11MB4835.namprd11.prod.outlook.com>
 <20260910124632.GB4083318@ziepe.ca>
 <CO1PR11MB4835FF972283C09D7D683DAE8CBA2@CO1PR11MB4835.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB4835FF972283C09D7D683DAE8CBA2@CO1PR11MB4835.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_064321_904760_8D3B50A1 
X-CRM114-Status: GOOD (  28.22  )
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

On Tue, Sep 15, 2026 at 07:13:48AM +0000, Tian, Kevin wrote:
> > Yes, this already has to be true or our lifecylce model is
> > nonsense. Once the iommufd creates the vdevice the guest is running
> > and we cannot disconnect it without unplugging it from the guest. Thus
> > the locking can rely on that. Within an iommufd ioctl context the vdev
> > and underlying connection must be stable.
> 
> btw looks a related suggestion is having the tsm driver (arm-cca-host
> here) implement the viommu ops while leaving the original smmu driver
> largely intact, and "obtain the viommu through tsm_ops not through
> iommu_ops".
> 
> It's not super clear to me about the implication behind after reading
> related discussions and what the "obtain" part means. 
> 
> Could you help elaborate this part?
> 
> The old way is kind of:
> 
> vdevice_tsm_ops -> tsm_ops -> tsm driver -> iommu driver
> 
> then it will become:
> 
> viommu_ops (tsm related) -> tsm_driver
> 
> where tsm driver will fully handle tsm related viommu_ops?

At least for ARM there is effectively no entanglement with the actual
host iommu driver. The viommu is entirely provided by software in the
RMM world, so it can have its own dedicated driver. In ARM T=1
transactions are alwayus routed to the RMM's iommu and there is no
relation to the host.

I am interested how Intel works here, but I thought it was similar.

AMD is different and I suspect AMD will have to continue to use the
viommu from the AMD iommu driver, but I am not sure.

> btw I held the impression of blocked operations from past discussion [1].
> Initial attempt tried to proactively unbind the TDI upon any operations 
> which may transit the TDI to the ERROR state. Then the suggestion at
> the moment was:

With this construction the iommufd vdev is created and permanently
exist as long as the VM and viommu exist.

How/when the tsm driver links this to a arch specific "bind/unbind"
operation is more up to that driver, but I would expect what is
thought of as "bind" should be the affiliation of the device's T=1
stream with the viommu and the target VM. It should not be sensitive
to the TDISP state.

That is not prohibited, the TSM driver could do some auto
"bind/unbind" whatever that means triggered by ops or tdisp state
changing under the covers. But this cannot leak out as some kind of
asynchronous vdev destruction.

> " But now the suggestion is never let VFIO do unbind, instead VFIO
> should block these operations when device is bound. "
> 
> [1] https://lore.kernel.org/all/aEFmPaYorqaYCKBY@yilunxu-OptiPlex-7050/

IDK, if the host wants to put a device into error I don't see why the
kernel should block it? There are many reasons a device can reach
error, that needs to be handled.

Jason

