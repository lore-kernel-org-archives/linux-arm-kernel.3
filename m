Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEB3CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 22:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=immH+g/3RYXTN+iTjjy3LaccswRoDpZE21Qsh/sCfkE=; b=MdqKQj/KkHCZCgY1UYiPrTaRBI
	iWTFrG1JjQ0v8W6w8tVN/Y/g5T9poQMIQRbeC5aCGtjXS94O5PqmbV4JK+30HoVZgHhbT18m9eLeC
	bfLwJN50gBStxiASgGhReaaHZ2JszEndF6qfTTfsyD3CIfJq88bnjSCLer1ra8SP2/shO6uzGFAYK
	7f0WPXPTk8pax4rUy+dw/C7EJQVV5ruikhZ23ULcvyR/kR6OT6El8yium+yzdN9nsrNw3E9GGGZyC
	RFRpMd3+G9HuF63TkEAHHCXxxKR5LoRf7RccMWL+FyZ5dJPP2bs6J2vLEL9f5h40qNIcyubGOF/Gc
	CMQ3HiVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO1NH-00000009fRg-3gSh;
	Fri, 15 May 2026 22:51:19 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO1NE-00000009fQo-2er9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 22:51:18 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-50e5c7eb565so5552001cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 15:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778885475; x=1779490275; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=immH+g/3RYXTN+iTjjy3LaccswRoDpZE21Qsh/sCfkE=;
        b=DYdm9DzLyXPLC4j+Z8VgVuXqO5Yvzd/2GYCEvCgHD1Erq2q4t+F3p0Uu/wP/zv/2RZ
         T31ZRePA0xPrDUvyTQoPpxJOo3kkotRogKH7UGFe5+qAstP3GkESdNkset5oIgMiEvew
         np1kuhL9lUxD6rRC0p+yoQlhXkUTfFhTAi4PC1FAJnyoRBniauIe0zLGkjaz+/f6jN3c
         ojHWsOS+WafznFmJcfeQ4V1iDnDSgesteqJuh9Dx0Li6QlB+U2qXpBZRKfBPNbd7vRFY
         b5J8YtaXRtis6ywMlXwapSmGlXzWPG9jJrEXnG2LyYfBkERWwyUpnWYteog5FVtYDkSZ
         KmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778885475; x=1779490275;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=immH+g/3RYXTN+iTjjy3LaccswRoDpZE21Qsh/sCfkE=;
        b=bWEF0pTqPMjHHpOKH4RTkcohM7E+QntJGE4L6r194/SYN/q7Xa9jiNiHno8qIYqP1O
         v3gVdUWhIvG234fhJChoSmMPaYfqQgGVj3Hkycqzat7K1/s8TwjgolOBzMsqef0VjvRT
         U+4AMFTRLd3wj4CuvBNahUt/8DkxdDjji7IBAKGgMrC2qfm5WQVmz1TTi8+bplO4WE1T
         QMeaUE75DaXLrBlMaPJ4ATKq7ejoV+LoB1HaeyqhpdZEbLEfp3eGihgNbDQO33eLZgiQ
         mIryV2qBEPLxeDkRHFIQHQ2JCW0ZttGb98Cpeg5rRBvx1fjNsyw9bjAnqy8eZvyaI7yh
         Bjqw==
X-Forwarded-Encrypted: i=1; AFNElJ+QrwfnmKIpGU8gTnvqzRimSlr5klJXJRHDI4OUBWUlYeyqGfYvHqhDPrVjZQPWlzub+T7A+e3blVyYZJb1333U@lists.infradead.org
X-Gm-Message-State: AOJu0YxRTJELaiyn6KNF3m8YwlklzUMLn235v/PFK7dl8yLTkIiIxrro
	43DplE9hykocF8CiCy7TFYUX6SWdt2tGlAkZMJU+acaANFtDV5wlEJvlyNJ5+eydQ68=
X-Gm-Gg: Acq92OEelZAV4UEOzooFcwZ82ireDURY0PHRe/5LvTHIQe9uDJSPW1hJgS8wAzjH/a7
	gy4cDDLfTVjWF0cqJZQjJBHagu5Q+KwYFjzKgUBHAbjWyqwqxJabuQeN9BIHqWCwGMvK+jgYVgl
	XagQWvpxR2CrPNfl/B/mCTX5IBECYhziZ/QGqLxwFAijRrm8WlwdcPCvuMDe6cf1UzhTz0hwEvU
	6Lw+CImTlI5LZuldFu6vO+x7rppUJvnH6EsQZxOCc+7V22OPk8Lumonu78SBF1aY5h6KVLbpdD1
	qGnNWjqWO1Bty05sXcDR+oQWFCBYi3Dk0bAxX0QfmamVKpmMoQp/JZrrBF714tiMmYtoc9J2DxX
	Qdu6pTZVe1GQDvTdxLLVtoGY4yS3c+Z4266idsDv2orAZz3r0AsA8Vzd/y6/dR/Abnynm74Ah3I
	0/AbgopIi62B4iYS7Lq92VBB34Zmqr5JNmbirpAPWZ9vDIVhCI1g7PbdKNmz7XTki+o7Q/GVZ0Z
	zrMVg==
X-Received: by 2002:a05:622a:590c:b0:50e:fcbc:6b7e with SMTP id d75a77b69052e-5165a275f74mr79497231cf.29.1778885475017;
        Fri, 15 May 2026 15:51:15 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5164585c5e0sm56735501cf.29.2026.05.15.15.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 15:51:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wO1NC-00000008Fgc-00Mh;
	Fri, 15 May 2026 19:51:14 -0300
Date: Fri, 15 May 2026 19:51:13 -0300
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
Message-ID: <20260515225113.GN7702@ziepe.ca>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
 <20260513172450.GR7702@ziepe.ca>
 <agW2lzJI-20DyJVe@google.com>
 <20260514123529.GZ7702@ziepe.ca>
 <agXfm3mS_M3fvRrN@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agXfm3mS_M3fvRrN@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_155116_688652_23D93CC2 
X-CRM114-Status: GOOD (  34.02  )
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

On Thu, May 14, 2026 at 02:43:39PM +0000, Mostafa Saleh wrote:
> > That's a somewhat different problem, we have the dev->trusted stuff
> > that is supposed to deal with this kind of security. We need it for
> > IOMMU based systems too, eg hot plug thunderbolt should have it.
> 
> I see that it is used only for dma-iommu and for PCI devices.
> However, I think that should be a problem with other CCA solutions
> with emulated devices as they are untrusted. As I'd expect they
> would have virtio devices.

Yes, any security solution with an out of TCB device should be using either
memory encryption so the kernel already bounces or this trusted stuff
and a force strict dma-iommu so the dma layer is careful.

This is more policy from userspace what devices they want in or out of
their TCB. Like you make accept the device into T=1 but then still
want to keep it out of your TCB with the vIOMMU, I can see good
arguments for something like that.

> > > While we can debate the aesthetics of the setup , this is
> > > the exisitng behaviour for Linux, which existed for years
> > > and pKVM relies on and is used extensively.
> > > And, this patch alters that long-standing logic and introduces
> > > a functional regression.
> > 
> > Yeah, Aneesh needs to do something here, I'm pointing out it is
> > entirely seperate thing from the CC path we are working on which is
> > decoupling CC from reylying on force swiotlb.
> 
> I am looking into converting pKVM to use the CC stuff, I replied with
> a patch to Aneesh in this thread. However, I need to do more testing
> and make sure there are not any unwanted consequences.

Yeah, it is a nice patch and I think it will help reduce the
complexity if it aligns to CCA type stuff.

> > In a pkvm world it should be the same, the S2 table for the SMMU will
> > control what the device can access, and if the SMMU points to a
> > "private" or "shared" page is not something the device needs to know
> > or care about.
> 
> I see that's because dma-iommu chooses the attrs for iommu_map().

Long term the DMA API path through the dma-iommu will pass the
ATTR_CC_SHARED through to iommu_map so when the arch requires a
different IOPTE it can construct it.

> In pKVM, dma_addr_t and IOPTE are the same for private and shared,
> so nothing differs in that case.

Yes, so you don't have to worry.

> We don’t expect pass-through devices to interact with shared
> memory (T=0) at the moment.
> However, I can see use cases for that, where the host and the guest
> collaborate with device passthrough and require zero copy.

Once you add the CC patch it becomes immediately possible though
because the user can allocate a CC shared DMA HEAP and feed that all
over the place.

> One other interesting case for device-passthrough is non-coherent
> devices which then require private pools for bouncing.

Why does shared/private matter for bouncing? Why do you need to bounce
at all? Do cmo's not work in pkvm guests?

Jason

