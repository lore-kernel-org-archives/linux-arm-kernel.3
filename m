Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B779C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 10:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KO6eVlrCoGv7LRa95h7FC3E/wXet0JaIn2ciTJXwruE=; b=gbXRuxOKHLHZOI8kFl1RvXN4WS
	1TQq5ZSZ7pfyOpTpPJD/hd935I9gog+UkDmnhPKsP/f+RYrjbPtveTcOL/2F4YU+uuRZSff/Lj3lm
	2mNm7bL65aA+6/x9szMIrloGDHtQ7EDaIOUgFCfp99bCPZNrbcAYv1bW9sbO6dKa2EWpoxkaYpOhu
	ooIQ0P8OGfTiPYfh7H72PVGP4XPr0gVk1qepxfSkNCpjvUjBqz0fqmg3HbYn7o2PV9dofYir2FN0r
	czpGBc4UxUTvB18NAR4wMH/bCa979c5ZxOEvKBQQzJ7zpsCTCFFGBwVfiFBrv4aGP8TJ16vFNoXxt
	aaL2F1lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtN7W-0000000BUTK-0VJR;
	Mon, 10 Aug 2026 10:20:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtN7U-0000000BUT8-2iUm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 10:20:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0F9A600AB;
	Mon, 10 Aug 2026 10:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169771F000E9;
	Mon, 10 Aug 2026 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786357235;
	bh=KO6eVlrCoGv7LRa95h7FC3E/wXet0JaIn2ciTJXwruE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SOj+T9lcP3BfqhGI1ByG0Cv3PFMgqUXv8bHIyEGQ0Crx7WPJvpMXrDR6cnXA8haDH
	 cYjQmWETdYROJsgxJuY0xAnMz+qcsum4zhRddj5OuQmXFYimXS65x+nSJ/ri3Pl+I1
	 NNbWKQWfp+9tZN7Pqfs4BBq401HgnEBNwmndyyrcCDyiTbSvJXGLmyQauDbrl/5q/E
	 wSkKYR4xrnk2AmyDzRpVJfB47dSs8n1OBShCZjXa2N+CTMRHmZEtOsPiqUVTW8WnRr
	 dQPmOerSaod1zGxwRrnOVvRSAkC99DwkhJUjDCZDMb4jRWp+BTOJwOS++QcQwsQ0GI
	 RC8+hOhcdNwJA==
Date: Mon, 10 Aug 2026 11:20:26 +0100
From: Will Deacon <will@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
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
Message-ID: <anml6lLRERm1Iv-_@willie-the-truck>
References: <yq5acxvu2ict.fsf@kernel.org>
 <anXbJ2O4DWgPxCeg@willie-the-truck>
 <20260807135810.GA200537@ziepe.ca>
 <anX7F7dnKOtAOIIe@google.com>
 <20260807164734.GE200537@ziepe.ca>
 <anYgXSR4VAi3TpOj@google.com>
 <CGME20260807182023eucas1p1f653436207b2b00338e99ea1d8f847df@eucas1p1.samsung.com>
 <20260807182017.GH200537@ziepe.ca>
 <7d22482f-d5fd-4cf4-9d32-6a54e02f2fbb@samsung.com>
 <yq5av79iiard.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5av79iiard.fsf@kernel.org>
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

On Mon, Aug 10, 2026 at 02:59:42PM +0530, Aneesh Kumar K.V wrote:
> Marek Szyprowski <m.szyprowski@samsung.com> writes:
> 
> > On 07.08.2026 20:20, Jason Gunthorpe wrote:
> >> On Fri, Aug 07, 2026 at 06:13:49PM +0000, Mostafa Saleh wrote:
> >>> But the whole thing is best effort anyway, the kernel picks
> >>> IO_TLB_DEFAULT_SIZE which does not depend on the system topology or
> >>> how many devices or how much DMA they do.
> >>> SWIOTLB memory is wasted if unused so we should be careful around
> >>> that as it would be the other way around and users would have to
> >>> decrease it manually.
> >> Yeah, it is why the arch code shouldn't really be sizing it directly,
> >> it should be done in common code and, yes, we are probably going to
> >> have to do something alot smarter to have the common code better
> >> auto-tune this for the CC case..
> >
> > What about the $subject patch? I assume that it is still needed to
> >
> > restore the behavior that was altered by the "[PATCH v8 00/23]
> >
> > dma-mapping: Track shared DMA state through direct, pool and swiotlb
> >
> > paths?" patchset?
> >
> 
> I would request that we pick this patch to fix the regression described
> in https://lore.kernel.org/all/yq5azeyxyfol.fsf@kernel.org/.

I really don't think we need it. CCA hardware isn't exactly widespread
and the KVM host side patches don't appear close to being merged.

We have time to fix this properly, rather than papering over it in the
arch code.

Please consider this a NAK from the arm64 side on this patch.

Will

