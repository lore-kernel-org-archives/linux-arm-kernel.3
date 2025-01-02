Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008A2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 20:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2a4dqMVLYy1RoN4xN8k6L4FT1iFqHXekN0TayfuDGM=; b=p6Ii2ZMnYWPJ4CqARFagMWzCCp
	lBVG/jXMTagdmKvCVz4ekVnyo6N4MW9HaNHcXM7+0m5/NCxWF1OOvzxaz2vBmyrsy95sRHIxnNehG
	euyxFIKinAfDRSRnBbdzNd3ykLr4eX5yX+l9l6Qk3V5BX30dtr3God+4Qp3PUvhIz5js6eMb9OM6i
	V3xk/hlojJFhULbA4jVVOZMWxWtqm7cEajIW6/KCMPuOyfKAMjt7rMVwAF+J8b3PERrcqfoBcdiLW
	3kH4I99v2vNL/1NKdGm5AR/6auBSfxu+YxTBCRhn2kCv3YOAwOTgu2S7j7ofZZdZWQ/envwPBrW8F
	2ZiPWC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTRdN-0000000BN3K-0YDE;
	Thu, 02 Jan 2025 20:17:33 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTRc9-0000000BMsK-40cV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 20:16:19 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6dd420f82e2so64306786d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 12:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1735848976; x=1736453776; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e2a4dqMVLYy1RoN4xN8k6L4FT1iFqHXekN0TayfuDGM=;
        b=nojD15YbLVQ4ZrDfWIO+YzU7J7CumKW803E/w/oO5bblj/wiTc3IoCfQTlmih1NbD8
         Y/lvx8AuZ4DMCphX70aUuS38GhwViBU1TaycUrIpiPpPDnKRlEF0UCrslarE5uNVGMMI
         rAr9cRda4+8B1LrrpZEzZFkA4JOlcrjD+nXLiKRypXGC60oGOt0pELaljzOgb1jiiTta
         m2M/aDtcfc9MiwOK/wvGRUfJbvZHI6Kwv7dEPEwB3cjbaaBPvSTgrdAEXyyq6lQ2PFgB
         AX0tjr1EsXpEfQo24SAUqnui+QwvCNs0i4P5zOadxz+FMP64/OLscQG9aWs5WQCu+E3h
         pZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735848976; x=1736453776;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e2a4dqMVLYy1RoN4xN8k6L4FT1iFqHXekN0TayfuDGM=;
        b=EXY795t2zZ4Dtku03IYXDKn6ysIT41MaDtOxuDSu5vGVxfFIYHL0lQGiU3TYUtBVA8
         Gctpxf2d851KV0Ybawm/IwzD7YvNp6FZiX08Hgl2sgDz+u5ZDvPNOkIYAfiNkDQs0RwC
         shUapQbB9OfqLVn3Pn2kH0y7mBEbyWAmFfiGCcmLtxoy26ftjYg/tZhDu05ugmhmEaq4
         zKVM2gDZBWtVWSRUCOUeGnfhIYwpD2xmPOSb0KsAkQ19nK06DB4+UyjRXTVUEZTlW/ZZ
         +nGYLU/0fvl24glfOZKArast37RWzetI4Hqdf536F5vGLWj6bSVv5Nk03VTGA4d+9Slr
         T5Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWf9AxfnPSgPzD0YqG1/DOplD7cDxrxQD27JBRTpTYxbxOo7a3n2zxAvkefR9Q+S/GzvnGkjcFr2r3YNFDABQxD@lists.infradead.org
X-Gm-Message-State: AOJu0YyZFv9+WMlYEjR4yw3W8IpHbfVJkQJVE8q+GlPhmU/ZzoK6cC5C
	7qlpTVkTAE08mtN4siuk8BuQ+fVS6JLnY5LCL6CONRQ5a+9V7sSAFP4dub3wSYk=
X-Gm-Gg: ASbGncu56LRo8u/cz95oiKyvqIsdGeBQgeX99zxs6m2hX4JutaL3FmnfRtJvG2SnTxb
	Ba4KJ0t3Z3YdDGi00S9hH/kjBaKqeTaEdtKX8X2wugLZFyAnterl7hRxioZrymbHyha76t2w1ld
	23uBBd69W8diZwNjckPG6WlPvvQ2Q3NT9irMjVXUiKYZpAYalX7AIr3vSBjFHnqwWfNYtMwBHO0
	9M1WKTT8vafAUr+y0nhvzhUMXo6TNDdfs5WDgsWnPk/sw9Wo2RmfVMfYNFuMkmJ0JoPq4Q0pQO8
	MeIx0KUbp5a1PNqQxa0stH4QufS8Fg==
X-Google-Smtp-Source: AGHT+IG1lsiTAkszVzWv4dKENAN1XpNcbgLjo9B5AvUmLgMSUNBzBN1F+M1fOLMzRfxQBJioY5NWAg==
X-Received: by 2002:a05:6214:27e8:b0:6d4:1662:348c with SMTP id 6a1803df08f44-6dd233383f0mr669824266d6.17.1735848976076;
        Thu, 02 Jan 2025 12:16:16 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ddc5a56c40sm1904426d6.32.2025.01.02.12.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 12:16:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tTRc6-00000000MEA-1FCS;
	Thu, 02 Jan 2025 16:16:14 -0400
Date: Thu, 2 Jan 2025 16:16:14 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org,
	robin.murphy@arm.com, jean-philippe@linaro.org, nicolinc@nvidia.com,
	vdonnefort@google.com, qperret@google.com, tabba@google.com,
	danielmentz@google.com, tzukui@google.com
Subject: Re: [RFC PATCH v2 00/58] KVM: Arm SMMUv3 driver for pKVM
Message-ID: <20250102201614.GA26854@ziepe.ca>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212194119.GA4679@ziepe.ca>
 <Z1yNWI9lBNIZg6Le@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1yNWI9lBNIZg6Le@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_121618_104394_CF52C63A 
X-CRM114-Status: GOOD (  55.20  )
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

On Fri, Dec 13, 2024 at 07:39:04PM +0000, Mostafa Saleh wrote:
> Thanks a lot for taking the time to review this, I tried to reply to all
> points. However I think a main source of confusion was that this is only
> for the host kernel not guests, with this series guests still have no
> access to DMA under pKVM. I hope that clarifies some of the points.

I think I just used different words, I ment the direct guest of pvkm,
including what you are calling the host kernel.

> > The cover letter doesn't explain why someone needs page tables in the
> > guest at all?
> 
> This is not for guests but for the host, the hypervisor needs to
> establish DMA isolation between the host and the hypervisor/guests.

Why isn't this done directly in pkvm by setting up IOMMU tables that
identity map the host/guest's CPU mapping? Why does the host kernel or
guest kernel need to have page tables?

> However, guest DMA support is optional and only needed for device
> passthrough, 

Why? The CC cases are having the pkvm layer control the translation,
so when the host spawns a guest the pkvm will setup a contained IOMMU
translation for that guest as well.

Don't you also want to protect the guests from the host in this model?

> We can do that for the host also, which is discussed in the v1 cover
> letter. However, we try to keep feature parity with the normal (VHE)
> KVM arm64 support, so constraining KVM support to not have IOVA spaces
> for devices seems too much and impractical on modern systems (phones for
> example).

But why? Do you have current use cases on phone where you need to have
device-specific iommu_domains? What are they? Answering this goes a
long way to understanding the real performance of a para virt approach.

> There is no hacking for the arm-smmu-v3 driver, but mostly splitting
> the driver so it can be re-used + introduction for a separate
> hypervisor

I understood splitting some of it so you could share code with the
pkvm side, but I don't see that it should be connected to the
host/guest driver. Surely that should be a generic pkvm-iommu driver
that is arch neutral, like virtio-iommu.

> With pKVM, the host kernel is not trusted, and if compromised it can
> instrument such attacks to corrupt hypervisor memory, so the hypervisor
> would lock io-pgtable-arm operations in EL2 to avoid that.

io-pgtable-arm has a particular set of locking assumptions, the caller
has to follow it. When pkvm converts the hypercalls for the
para-virtualization into io-pgtable-arm calls it has to also ensure it
follows io-pgtable-arm's locking model if it is going to use that as
its code base. This has nothing to do with the guest or trust, it is
just implementing concurrency correctly in pkvm..

> Yeah, SVA is tricky, I guess for that we would have to use nesting,
> but tbh, I don’t think it’s a deal breaker for now.

Again, it depends what your actual use case for translation is inside
the host/guest environments. It would be good to clearly spell this out..
There are few drivers that directly manpulate the iommu_domains of a
device. a few gpus, ath1x wireless, some tegra stuff, "venus". Which
of those are you targetting?

> > Lots of people have now done this, it is not really so bad. In
> > exchange you get a full architected feature set, better performance,
> > and are ready for HW optimizations.
> 
> It’s not impossible, it’s just more complicated doing it in the
> hypervisor which has limited features compared to the kernel + I haven’t
> seen any open source implementation for that except for Qemu which is in
> userspace.

People are doing it in their CC stuff, which is about the same as
pkvm. I'm not sure if it will be open source, I hope so since it needs
security auditing..

> > > - Add IDENTITY_DOMAIN support, I already have some patches for that, but
> > >   didn’t want to complicate this series, I can send them separately.
> > 
> > This seems kind of pointless to me. If you can tolerate identity (ie
> > pin all memory) then do nested, and maybe don't even bother with a
> > guest iommu.
> 
> As mentioned, the choice for para-virt was not only to avoid pinning,
> as this is the host, for IDENTITY_DOMAIN we either share the page table,
> then we have to deal with lazy mapping (SMMU features, BBM...) or mirror
> the table in a shadow SMMU only identity page table.

AFAIK you always have to mirror unless you significantly change how
the KVM S1 page table stuff is working. The CC people have made those
changes and won't mirror, so it is doable..

> > My advice for merging would be to start with the pkvm side setting up
> > a fully pinned S2 and do not have a guest driver. Nesting without
> > emulating smmuv3. Basically you get protected identity DMA support. I
> > think that would be a much less sprawling patch series. From there it
> > would be well positioned to add both smmuv3 emulation and a paravirt
> > iommu flow.
> 
> I am open to any suggestions, but I believe any solution considered for
> merge, should have enough features to be usable on actual systems (translating
> IOMMU can be used for example) so either para-virt as this series or full
> nesting as the PoC above (or maybe both?), which IMO comes down to the
> trade-off mentioned above.

IMHO no, you can have a completely usable solution without host/guest
controlled translation. This is equivilant to a bare metal system with
no IOMMU HW. This exists and is still broadly useful. The majority of
cloud VMs out there are in this configuration.

That is the simplest/smallest thing to start with. Adding host/guest
controlled translation is a build-on-top excercise that seems to have
a lot of options and people may end up wanting to do all of them.

I don't think you need to show that host/guest controlled translation
is possible to make progress, of course it is possible. Just getting
to the point where pkvm can own the SMMU HW and provide DMA isolation
between all of it's direct host/guest is a good step.

Jason

