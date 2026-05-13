Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA9FCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFS+fpNwj5CoQBfOxdsT86bztMTzUd1XUisAgFNuBCE=; b=klfoGvmVc9sW8+9bDj/wE4nBHQ
	Op6ve2p0LGqBC0dDGZ0OGBhfpywY5fwyyEj+j5Lbvg7ywqKGpey7ImtF5laZRcxEUop15Ex2hJ5Zc
	Ejgy/RyUXZXaFHrXl+B698eIbYxOcvwX3QjEI/ZExEjZplTpzsA/zsllX+F1zFMYEkvlMD7LW1faz
	EZRK17GMuFeUJ9fGbi8tFDCDCgW5Z1BUcQBs+LsWa3qg8QxI6TW/PBALPycBrpTFyz4KenFRiLLHL
	NVjqUzmMv0lOofK4f7iLLKDLeSdXHH1JB+pZtmPRQQd0QkXs8kHAQUfYrRNSoWAQxzm0TYVYDYWPX
	+izilmzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wND6u-00000003JFI-24vV;
	Wed, 13 May 2026 17:11:04 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wND6r-00000003JEe-3zfq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:11:03 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-8b3d6b215cfso107179076d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 10:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778692260; x=1779297060; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LFS+fpNwj5CoQBfOxdsT86bztMTzUd1XUisAgFNuBCE=;
        b=HYY9MEshr+/oi/9ruWaF4DuWsVwqCElqCLJuoXSA3xe2lPXwfPgDQFXXyOp9EY3JaY
         vhFsGOUCj2sRGgofi7M39CYwef46sqJIQchbMh+lewADn4m9p1sS7C1OwriDayAC3ZmF
         D63XC2HfYU8crXG2w0AMZS/PU5fnSPP1fZB8dgmfY8ec/F5Iw5k1/Nl0eknAzwAOt2nD
         MKOTc2DZYUy7SiyEdmOMaLyuuMD1tWZOGk8VhU7y0kKAIvVp6Gv8bDg8vh6Jb4dEd5VE
         nd2n7R3x1++N1/hW+nnQR4M2n6572JQlaabB+O1teJp/hVxEH4OsDixFv7deSMd0mBQU
         1VJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692260; x=1779297060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFS+fpNwj5CoQBfOxdsT86bztMTzUd1XUisAgFNuBCE=;
        b=Qfw/Qw/SDNeY/mKa3Y4F9MVLWZt+fmmZ+iBE+pHst5OP+DODkBRovkWzuxACyRyE99
         KzpPVI5zDTnQ6+QNOOV/mLcqrpMtUh/QaP8dVRCGR0xwfRhg4wbeCkIqADMywthvLiwz
         xIJN6A1lZ2MuqOvHERmbVwnnrNlzdXOu4XhqEUDoWHa9Q3nI8dA16YWQC/dTsaGkl/vc
         dDjgvFuEr6qygjt+WGzAcb33/PJG0fLbWVPgUnbjQUZhlCIChC7HlVN9afjukx9uaLWy
         Ig0qVGacXKngqkXjdAauoULahjtACo1oZCUGflqnn/C3u+WoOCJaeEnlkI/bgY8a5vdO
         gPQw==
X-Forwarded-Encrypted: i=1; AFNElJ8JvtkhQBaezsWCJ1Hllq3ZlHbBtPv3M4Pzm9HrcIIP0c+itVISbl9X56VeF+4LGyN3CsZ5hohu12VqoXPeaOPy@lists.infradead.org
X-Gm-Message-State: AOJu0YzvnUX5t5GAxDg9Imt76aSPfH209GYHZcBq8HuZu2nYGK5pyo0i
	vCQ6Pf8j27rs4zAZ1NvGlfCpwBqBtuHBm7ps3NA/d6v6r2sAGccQSxOjh1tOSZ7Msyo=
X-Gm-Gg: Acq92OE+sffVDI8AVN9sduJWw0vSlSDkzskm0ZRBkZfLSDr1GCV5p9dnhIy35XnvBss
	DMsUiZAoZVPu1QHvb9LT6ZWOFHXAXmQ3YAbGHzh/Iq9SGIuYRNKnpSWHNwW/H3Eg4FHS8LwQFM1
	BVLjiV6cnrhh0lIhNzn22085vcobIW4/h99U/mhiItOecS1kVxyUrs5l6jDgrz4oDaiExyb94IW
	YyK9yJWYNYzdLGp6cUcG/FVCB3wO2GGnsUDwx9/lr9zodGu2O2QoaX5y6B/+zwUBggX0ZN1qnW7
	EqM0It0thd9DNysam0DncUIpwDHShYx/ntN4kxmtj53FMwvYw2bX0fXR+WXf68QiQXiH/etQahj
	yjiJu1oK0TE5OlTtUmflEpNPwEk7zFvDTexxPRc6Vyhn7TJden7Li9jv2s2f8h/blr8K9k9JDGy
	Udg2QpdNShj2cM3CcW34onWTc+F53odlAuN8zYCaniqRa6/kmRXDb+NBSwAs9rGr6M5hZ7bTytC
	FsECg==
X-Received: by 2002:a05:6214:4697:b0:8c6:1e19:80a4 with SMTP id 6a1803df08f44-8c7bc91b0d7mr58558936d6.26.1778692260161;
        Wed, 13 May 2026 10:11:00 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c358539sm710716d6.41.2026.05.13.10.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:10:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wND6p-00000003cRB-0Am8;
	Wed, 13 May 2026 14:10:59 -0300
Date: Wed, 13 May 2026 14:10:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Joonwon Kang <joonwonkang@google.com>
Cc: Alexander.Grest@microsoft.com, amhetre@nvidia.com,
	baolu.lu@linux.intel.com, easwar.hariharan@linux.microsoft.com,
	iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com,
	joro@8bytes.org, jpb@kernel.org, kees@kernel.org,
	kevin.tian@intel.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nicolinc@nvidia.com, praan@google.com,
	robin.murphy@arm.com, smostafa@google.com, will@kernel.org
Subject: Re: [PATCH RFC] iommu: Enable per-device SSID space for SVA
Message-ID: <20260513171059.GP7702@ziepe.ca>
References: <20260512151133.GD7702@ziepe.ca>
 <20260513170333.1235601-1-joonwonkang@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513170333.1235601-1-joonwonkang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_101102_001798_CBC33985 
X-CRM114-Status: GOOD (  22.74  )
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

On Wed, May 13, 2026 at 05:03:33PM +0000, Joonwon Kang wrote:
> > On Tue, May 12, 2026 at 02:51:38PM +0000, Joonwon Kang wrote:
> > 
> > > Appreciate all your clarifications here. So, my understanding is that if
> > > our system does not support ST64BV and ST64BV0 or if our device does not
> > > distinguish between the posted write and the non-posted write regarding
> > > PASID, then we can lift the use of the global PASID space. Can I say this?
> > 
> > You should do what Robin said - just have your driver use a per-device
> > PASID that it allocates and never use the global pasid allocator.
> > 
> > To do this lightly re-organize the SVA code so the driver can supply
> > its own PASID, and in this mode we wouldn't activate the ENQCMD
> > features in the mm.
> 
> Ah, we could actively disallow EL0 to execute ENQCMD-like instructions
> when the device driver explicitly shows the intention via a new API like
> `iommu_sva_bind_device_pasid()` that Tian mentioned earlier. 

You shouldn't need to do anything like this. 

All you need is to ensure that mm_get_enqcmd_pasid() returns
IOMMU_PASID_INVALID so long as a the normal iommu_sva_bind_device()
hasn't been called. Once it is called it is fine to allow the ENQCMD.

Your new iommu_sva_bind_device_pasid() needs to establish the SVA and
attach it without triggering mm_get_enqcmd_pasid().

The arch code is required to block the ENQCMD like instructions when
IOMMU_PASID_INVALID.

Devices that can mmap an ENQCMD sensitive BAR region must not do so
unless iommu_sva_bind_device() has been called.

> To allocate a per-device PASID, I think we should do it using
> `dev->iommu_group->pasid_array` instead of making the device driver

No, make the driver manage this, don't mess with the core code. PASID
isn't supported with multi-device groups already.

Jason

