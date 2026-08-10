Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD5DC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 11:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCRqoeWNWtgyOE15SAxF1YS8N0xnzH3d7d2rFiQqAvQ=; b=4fX5eDPj8zLxsOfYnjJhSBJji4
	MoouqUkZ+g1SKckYPZURS7U4XDC9Ycpe10dvnWcecfS6f34vbEC4Q9P7NgNL14P7j3zVTUDSPOTuv
	SPnR77c1I5RlO8Cyk0eQc4DQoamMkV1CAihHTGyov7j7PN7OPesrVQXFuIh56bxIufoR6OgUDKBQR
	WNxCfa/PZg0+zAhR81WPf53b8JuPqKXN7vEw1IpzrqzlU525wpLw/MnKUpmmM5oggC8FN4zVRBfRe
	hnYmgUU9AmgIVHGYaAGDIpvbnz8qy1dmlDi16LbcgFrwVrKDUtW1l9mTLdWV+zn5YQkIe1bj1klpl
	oU9Z5kQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOT7-0000000BfA9-2ENa;
	Mon, 10 Aug 2026 11:47:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOT6-0000000Bf9g-0adl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 11:47:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB24243E05;
	Mon, 10 Aug 2026 11:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2455F1F000E9;
	Mon, 10 Aug 2026 11:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786362419;
	bh=fCRqoeWNWtgyOE15SAxF1YS8N0xnzH3d7d2rFiQqAvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZdqOARlqNVXG2WPdY64KIFiiHy7+iL34WY5SFGKkpbDKTPzoxcrf8GlztQOTzotYK
	 Kg5HPHwLV+5NhAnFpPy2M0d3tpks7urO5LVdtaYhr6+MuPr6zb4pRlRwSp3hiSM9Aj
	 vCAxgQFWgzY6cDHelMHj4C/jXVkJj7f+QtrE7Yt3Gg22QfoyAeZM99oD0he866L/DY
	 F2KZG03kM1xVZJQxLaqFMXnxi4i4KMM/sYLsNWaGEVRErraJAxad6KiDUUDo+NPuEt
	 O2mzWp+GVkyfqSfgZBJpiQWioD1g/jvLk6/XCtjYgdXIs9llPpIPtA7fDAT8VOn/Ix
	 ydjL4LdODFn+Q==
Date: Mon, 10 Aug 2026 12:46:51 +0100
From: Will Deacon <will@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
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
	Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH] arm64: swiotlb: Keep the default size for protected
 guests
Message-ID: <anm6K2umtx4iKnyZ@willie-the-truck>
References: <20260807135810.GA200537@ziepe.ca>
 <anX7F7dnKOtAOIIe@google.com>
 <20260807164734.GE200537@ziepe.ca>
 <anYgXSR4VAi3TpOj@google.com>
 <CGME20260807182023eucas1p1f653436207b2b00338e99ea1d8f847df@eucas1p1.samsung.com>
 <20260807182017.GH200537@ziepe.ca>
 <7d22482f-d5fd-4cf4-9d32-6a54e02f2fbb@samsung.com>
 <yq5av79iiard.fsf@kernel.org>
 <anml6lLRERm1Iv-_@willie-the-truck>
 <28442500-1d53-4776-bae5-459c3ffc1cc6@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28442500-1d53-4776-bae5-459c3ffc1cc6@samsung.com>
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

On Mon, Aug 10, 2026 at 01:37:11PM +0200, Marek Szyprowski wrote:
> On 10.08.2026 12:20, Will Deacon wrote:
> > On Mon, Aug 10, 2026 at 02:59:42PM +0530, Aneesh Kumar K.V wrote:
> >> Marek Szyprowski <m.szyprowski@samsung.com> writes:
> >>
> >>> On 07.08.2026 20:20, Jason Gunthorpe wrote:
> >>>> On Fri, Aug 07, 2026 at 06:13:49PM +0000, Mostafa Saleh wrote:
> >>>>> But the whole thing is best effort anyway, the kernel picks
> >>>>> IO_TLB_DEFAULT_SIZE which does not depend on the system topology or
> >>>>> how many devices or how much DMA they do.
> >>>>> SWIOTLB memory is wasted if unused so we should be careful around
> >>>>> that as it would be the other way around and users would have to
> >>>>> decrease it manually.
> >>>> Yeah, it is why the arch code shouldn't really be sizing it directly,
> >>>> it should be done in common code and, yes, we are probably going to
> >>>> have to do something alot smarter to have the common code better
> >>>> auto-tune this for the CC case..
> >>> What about the $subject patch? I assume that it is still needed to
> >>>
> >>> restore the behavior that was altered by the "[PATCH v8 00/23]
> >>>
> >>> dma-mapping: Track shared DMA state through direct, pool and swiotlb
> >>>
> >>> paths?" patchset?
> >>>
> >> I would request that we pick this patch to fix the regression described
> >> in https://lore.kernel.org/all/yq5azeyxyfol.fsf@kernel.org/.
> > I really don't think we need it. CCA hardware isn't exactly widespread
> > and the KVM host side patches don't appear close to being merged.
> 
> Does this mean that the branch for-next/coco [1] won't go to v7.3-rc1?

Argh, no, I'm definitely planning to send that!

I'm just saying that this specific fixup patch (which is a PATCH sent
in reply to another patch in the middle of a series...):

https://lore.kernel.org/all/20260807092612.2202005-1-aneesh.kumar@kernel.org/

isn't something we should take for the upcoming merge window. There are
better, alternative ways to tackle the issue (as discussed in the thread)
and it's really not as urgent as Aneesh is trying to make it sound.

Will

