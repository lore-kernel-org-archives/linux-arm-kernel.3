Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E7DCD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0syXDbvsxMHU2qFtHkGrYSSCi/zfIXRFYXzTsoQZCg=; b=bCWpmEDkF7budbFu90Vghgpx2g
	zRVtb5CA00Ast5YElIHFT0BJla0ePT1ae7yal/ljZNknjiI7cWWFu5yxzw/DJHBK6i45mEUn9GwxE
	rSRPc+Vbt9aoWF3VdCe5W4PVnBWMG5K7aoqJAh2R8z5R4xKW22urp8vvew8FR5KYoPP3k5/HfWxnU
	XvF+onVURvJ6+V+/5KZml41dkXBisSGGw2Gx93PvxII7v4XOAkYEotGfRwf2C28BaKzqPOYsBF2Ap
	T3/vXHOBl+KmRAvYwncZGcZrZSWoYdLBdA0T5h/oKk2ra4mOs5JDHhsZEHi6kzyDYDPVz49GncHla
	16Y+ZvkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVHr-00000005TDl-1u4y;
	Thu, 14 May 2026 12:35:35 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVHo-00000005TCt-2xDh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 12:35:33 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-911449d9d03so44255985a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 05:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778762131; x=1779366931; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x0syXDbvsxMHU2qFtHkGrYSSCi/zfIXRFYXzTsoQZCg=;
        b=C/RqM2ZJZeuLxssvO+abQ5gkehMzjfJSZkLeUIXEqGCtvWTb8ueYLFKx5v2z2oHPgb
         028subVTALz73vy7OxtkrwprBTUAFbjonHHZ6TP8pRGtTzeIDVEKnGDbas3ppY/SP0is
         U6zIMzuusyccxty0GN2/xMEc4ZYq5mXt3IOEtBJMSllyBNVdEOJhzxEZO7zoEJCc3aAa
         H9iYuVenJxEk+c2mfVlDs5a7Hjwrus76pwYO54d/XmuCmQOMScLaigSWgqqO36/Scp9z
         Hx6+zlO3k30pRXtTfPP6zkoa+gE/qogdFhlbyCXFv309dY3jFf/oB9EfGMp3azEV2Nex
         nHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778762131; x=1779366931;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x0syXDbvsxMHU2qFtHkGrYSSCi/zfIXRFYXzTsoQZCg=;
        b=AKbWAAc9zPk7DcfAGRiaaJ+QyPsLcfq36iV2ji1KUPeq6zLbgqJIeHaJ0YZWOnBTry
         yXALaBR4Spycu0cYPzI7Ev2GeJqHS6JnCJFVlkcUu/udH0yJqqtm/yvEQoOTsKVkZkhe
         PSukREgkBhv1fRPKQ3w+fWglkm231hh5Bda5ipNZYE7OZxxhgzSQTS/90im/1LiqaAfR
         470eNnrjBiLIubQJCd+tr2Wex8KdIYx020gHsoRTdHFfAChJvuenkqHaHwF/KDSlASt6
         WLf4deBBEOB9XwiYrzh0oo90sPVaMQk9mt9nvLq0tfkzgBtfcQYJpB0rYP2f8i16OKKp
         BOUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8h0FTtCt3BvKtKkzytpDRSo86u3pDLOtZGHXRa9Tg7LZ+EN6fy24tdNkH6MKxFaY9z5W3ZCiNIjBrDtNb0ykrK@lists.infradead.org
X-Gm-Message-State: AOJu0YzvWuDaXjYV4me7aiGtt5WRqyZrM7O5AVdrpfCvXqY12ZPmJXAv
	PP9G2IJ0OKt4/9RQdsbATd796cft2wlVKEAIyod9Jfc4KgEVogpgQrRNIRGnmrT2oc8=
X-Gm-Gg: Acq92OFOcM8YE0hqb+TCI/MoXJSkHBRbQSatnPneAQj+z+yInu50ZTexiLBHFkj30Bc
	+rBVI2aPdH3vMB1/C3z8armXSReqxvJkJOsB5Tr/90hq06gi4ksmpuOUAP5ty68rjJxJax4RJjU
	/gx6/HoP7hNxnUjhLFtm3bX9J2bNjvcHWIl48ub9Xpcbipdx3PZUt37U70Pg+6Ust9NrmGd3j8+
	DwurpT2ykSWYyhFIPpwAHw0xuu2qLElSYUGXIKzzL0+jUH1PjEP0dvklHl73u9hczFuNWDMlJP+
	gZi3utQbVAQ+PeokgrqluAcgC0zJSb+hp3TX8C1AJnw+upicdUUwRV/ZTgWPXmx6OkV33IhFw7S
	WW08/ylD8obQJoUVHGtDdU7C3b7TVMjulMwO15+RJtdcnl9ioIFF6SjeJa0H5C+4Yli/awszNu1
	j8vtYKKz85dzac/5f0aMVMnxPyg7Oz3IV/iRtd/NuyTrvxFYjG+jqmSeAZo6Q3njXZAmRwZCHFw
	6ra+g==
X-Received: by 2002:a05:620a:4114:b0:8ef:c472:cd71 with SMTP id af79cd13be357-90facfa13d8mr999953285a.31.1778762131005;
        Thu, 14 May 2026 05:35:31 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba182540sm234520585a.4.2026.05.14.05.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 05:35:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wNVHl-00000005B3F-3Oru;
	Thu, 14 May 2026 09:35:29 -0300
Date: Thu, 14 May 2026 09:35:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <20260514123529.GZ7702@ziepe.ca>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
 <20260513172450.GR7702@ziepe.ca>
 <agW2lzJI-20DyJVe@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agW2lzJI-20DyJVe@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_053532_759287_2D734B89 
X-CRM114-Status: GOOD (  42.34  )
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

> > How will pKVM signal what kind of memory the DMA needs then?
> > 
> > Does it use set_memory_decrypted()? How can it use
> > set_memory_decrypted() without offering CC_ATTR_MEM_ENCRYPT ?
> 
> pKVM (hypervisor) doesn’t signal anything.
> The VMM when running protected guests will use restricted dma-pools
> for emulated vritio devices in the guest, which gets decrypted by
> the guest kernel and hence shared with the host kernel, and then
> traffic is bounced via the pool.

That really does sound like CC and set_memory_decrypted() to me..

> It’s also worth noting that bouncing here isn't just about visibility.
> Because memory sharing operates at page granularity, bouncing sub-page
> allocations through the restricted pool prevents adjacent, sensitive
> guest data from being exposed to the untrusted host.

That's a somewhat different problem, we have the dev->trusted stuff
that is supposed to deal with this kind of security. We need it for
IOMMU based systems too, eg hot plug thunderbolt should have it.

Then CC issue is more that the DMA API can't decrypt random passed in
memory because doing so often requires changing the PTEs pointing at
the page so it would break everything if done transparently.

> > > I believe that the pool should have a way to control it’s property
> > > (encrypted or decrypted) and that takes priority over whatever
> > > attributes comes from allocation.
> > 
> > We should get here because dma_capable() fails, and then swiotlb needs
> > to return something that makes dma_capable() succeed. Yes, it should
> > return details about the thing it decided, but it shouldn't have been
> > pre-created with some idea how to make dma_capable() work.
> 
> That sounds neat, but at the end we have force_dma_unencrypted() in
> dma_capable() which is just hardcoded to true/false by the platform.

For now, the next step is it becomes per-device and dynamic during the
device lifecycle.

> How is that different from having the state static by the pool?

statically attached pools to the device are not so flexible when
devices have dynamically changing capabilities..

> > If dma_capable() can fail, then swiotlb should know exactly what to do
> > to fix it.
> 
> dma_capable() returns a bool, I don’t think it can know what exactly
> went wrong (based on address, size, attrs, dev...)

Yes, but I think the design is swiotlb is supposed to re-inspect what
is going on against the limits dma_capable checks and then select the
correct remedy..

> While we can debate the aesthetics of the setup , this is
> the exisitng behaviour for Linux, which existed for years
> and pKVM relies on and is used extensively.
> And, this patch alters that long-standing logic and introduces
> a functional regression.

Yeah, Aneesh needs to do something here, I'm pointing out it is
entirely seperate thing from the CC path we are working on which is
decoupling CC from reylying on force swiotlb.

> We can address this by either adjusting this patch or by changing
> pKVM guests to be more aligned with other CCA guests which is
> something I have been wondering about if it would help reduce
> bouncing.

Every time I look at pkvm I think it is just ARM CCA with a different
design and no access to the unique HW features..

> > If we can make that work then maybe the flows are designed correctly.
> 
> Mmm, I am not sure I understand this one, shouldn’t the device also be
> notified about the switch in memory state, if it expects to read/write
> decrypted memory, how would that work if the kernel changes it to an
> encrypted one?

Nothing on the device changes. In a CC world we put the device in a
T=0 or T=1 state before the driver loads and the expectation from the
DMA API is that the device will only use that T=x DMA type during
operation.

A T=1 state device can access all of memory, private or shared. Any
information the platform may need is encoded in the dma_addr_t or in
the S1 IOPTEs.

So we never need to tell the device driver what kind of memory the DMA
is targetting, and we NEVER expect a device in T=1 mode to have to
issue a T=0 DMA to use the DMA API.

In a pkvm world it should be the same, the S2 table for the SMMU will
control what the device can access, and if the SMMU points to a
"private" or "shared" page is not something the device needs to know
or care about.

Jason

