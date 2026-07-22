Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5781C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 22:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9LnfC+rkBddPUTEmyrBeCB6it5XFBAKgLuygLa0ssI=; b=rMZty4tYsXzeMew8jih9HMd69d
	hm2R7VthuSGUjJSLBd17LpOT6KZA9RIABGl0Eykjl22YiJcyhiJbGXm1yeC+QOq7md5uGQt8lo5xC
	8TNu2il5mTb7iucFwLr2oC5KxoR+tI8T+CpFhSovOO/9udpS7VtgOSR6occty9/LSWcxH4s0z2ldG
	AfR+u73Z2azn8GbZwA4IEZTBtdy+9jkBlIZUWRHjuEnHDVmeiuGa62fsNefwRjftvqGKNeIKBAoR1
	Ct/Fb3hjy8zdw4tdND5+8jQacq4UzmK4MtMaIme7r2qfZTBOSUdn8Alp50VYPNUBzL+Lp3yzKa0z+
	DJJPpiBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmfJA-0000000CtWp-0JDP;
	Wed, 22 Jul 2026 22:20:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmfJ9-0000000CtWj-0arm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 22:20:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4698560051;
	Wed, 22 Jul 2026 22:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E561F000E9;
	Wed, 22 Jul 2026 22:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784758854;
	bh=P9LnfC+rkBddPUTEmyrBeCB6it5XFBAKgLuygLa0ssI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g9GUDb5WUEMSpsLSskIIIv5j9AtR0yLg7VUkYUsDCdLgbgPmbda6LlT797prLYM0W
	 9VbPd2CdYukOW03StQa2YF8vsmOD7gBd6QjoAPZB8nsXYsOCSLotSO9kX74+6RH3k2
	 3WCsOatO7btw+kfWSan9ZlEb4o6rJ4Nl457Tvs6ZiRdG5DW40H099XCHwMPDsdu3YU
	 dPeEiKDST/VhJfZ/r3jNXM/jkRHzuODEPevQvaEL9E+1RsHczxiEKZE2DMED17smVs
	 2zS/wuug7gQaf7U0/Q6KLFYq1HAHo+M8vy9LzQ94tglPJkBds2BKUgZuhBWQNuwwtu
	 YjUHYrjWMCJ2A==
Date: Wed, 22 Jul 2026 23:20:48 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>, jgg@ziepe.ca, nicolinc@nvidia.com
Cc: joro@8bytes.org, jpb@kernel.org, catalin.marinas@arm.com,
	yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add HAFT support for SVA
Message-ID: <amFCQDrEowvL28O_@willie-the-truck>
References: <878cd6bcbbe2d5677d2f63da13294c148268552c.1782927917.git.robin.murphy@arm.com>
 <amDEmlcyC3Tfmkel@willie-the-truck>
 <acd85a2a-af1f-4ebf-8370-773338d4fd15@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acd85a2a-af1f-4ebf-8370-773338d4fd15@arm.com>
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

On Wed, Jul 22, 2026 at 05:56:25PM +0100, Robin Murphy wrote:
> On 22/07/2026 2:24 pm, Will Deacon wrote:
> > On Wed, Jul 01, 2026 at 06:45:17PM +0100, Robin Murphy wrote:
> > > Since table access flags cannot be software-managed, if process
> > > pagetables are using HAFT then SVA must require the SMMU to support and
> > > enable it too, otherwise page aging is liable to get out of whack.
> > > 
> > > Cc: <stable@vger.kernel.org>
> > > Fixes: 62df5870ebf7 ("arm64: Enable ARCH_HAS_NONLEAF_PMD_YOUNG")
> > > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > > ---
> > >   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 5 +++++
> > >   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 6 ++++++
> > >   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 3 +++
> > >   3 files changed, 14 insertions(+)
> > 
> > This looks ok to *me*, but Sashiko raises two interesting points:
> > 
> > https://sashiko.dev/#/patchset/878cd6bcbbe2d5677d2f63da13294c148268552c.1782927917.git.robin.murphy@arm.com
> > 
> > 1. This may break hitless updates when transitioning to a faulting entry.
> 
> What does that even mean?

Hey, I'm not daft enough to spend time on all the Sashiko reviews going
on! That's why I pointed it out without trying to comprehend it :)

> We might block traffic in the process of _explicitly blocking traffic_!?
> Whoop-de-do, surely?

Hmm. I have very vague memories that there were some virtualisation (?)
cases where Jason and Nicolin cared about the type of event that would
be generated by concurrent DMA (e.g. bad CD vs translation fault) but
maybe I'm misremembering.

> But either way, HAFT has bog all to do with EPD0, and it must be cleared if
> HA is cleared, otherwise the CD becomes illegal.

That appears to be the case.

> > 2. IORT has HTTU overrides for HA/HD. Does it (will it?) have anything
> >     for HAFT? At the moment, it looks like you'll trigger a warning
> >     message.
> 
> Oh, seems I did miss that fiddly fw_features line, so I guess it has half a
> point that the warning can wonky if both IDR0 and IORT do (correctly) report
> HAFT. Pretty sure we're already a bit broken if IORT ever did try to
> override HTTU _upwards_, though.

Ah, I hadn't spotted that you'd already added the IORT part, so yes, this
just looks like the mask needs extending.

> > Given Jason's comments, it's probably worth sending the idreg override
> > patch as well...
> 
> Fair enough, I'm blessed with a moment of calm just now so I should be able
> to find time to have a crack at that tomorrow...

Brill, thank you.

Will

