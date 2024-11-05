Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C6FD12676
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lI0+wgr82TyZrEEBx1bZzjaMASK7/afLHffU5gbfVA=; b=a/V9OhNycJ01HyEGSUhiAsEgVW
	mjBXPXzCE/SPfgQ3OSfAAjwwHn8+R74lhtCwDOM2KyqkZs7EjVImQdRh9hf/YL/a4VbcCoqcPvEzC
	gN5VkO0t5xpnylY203Uw+g0sRaC9y7vvJR65a0xC4usyk+vBoDOPlZrUDPDvxwn7ICZfRSeb1/eI0
	tYKdALSI0OX4hc6aDg2/gwRRNzC1q02EezkWG0xKFhFM0yVN+avOjvXn90TrxTVnvBnIebcljS6Xg
	gfWkW18w/RS2/3Ls3r1hYdu5d3oQQnvy4jJ2dtxFfSJ3ACHedTlt27Doo0ThxHYZOoJEO/MSzWyKY
	oP/a2IMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GMM-0000000Gbgd-0jsp;
	Tue, 05 Nov 2024 10:00:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GKW-0000000GbHH-0Eiq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 09:58:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BEA7D5C32DC;
	Tue,  5 Nov 2024 09:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E3CC4CECF;
	Tue,  5 Nov 2024 09:58:28 +0000 (UTC)
Date: Tue, 5 Nov 2024 09:58:26 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Yicong Yang <yangyicong@huawei.com>, will@kernel.org,
	mark.rutland@arm.com, broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev,
	ryan.roberts@arm.com, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com,
	wangkefeng.wang@huawei.com, yangyicong@hisilicon.com
Subject: Re: [PATCH v4 3/5] arm64: Add support for FEAT_HAFT
Message-ID: <ZynsQl6vpA8tOHY8@arm.com>
References: <20241102104235.62560-1-yangyicong@huawei.com>
 <20241102104235.62560-4-yangyicong@huawei.com>
 <ZykEUGdkyYClM8Zi@arm.com>
 <87cyjat6vs.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cyjat6vs.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_015832_157427_B2E528FB 
X-CRM114-Status: GOOD (  24.63  )
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

On Tue, Nov 05, 2024 at 08:35:51AM +0000, Marc Zyngier wrote:
> On Mon, 04 Nov 2024 17:28:48 +0000,
> Catalin Marinas <catalin.marinas@arm.com> wrote:
> > On Sat, Nov 02, 2024 at 06:42:33PM +0800, Yicong Yang wrote:
> > > diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> > > index ccbae4525891..0bc88df7cb35 100644
> > > --- a/arch/arm64/mm/proc.S
> > > +++ b/arch/arm64/mm/proc.S
> > > @@ -498,6 +498,10 @@ alternative_else_nop_endif
> > >  	and	x9, x9, ID_AA64MMFR1_EL1_HAFDBS_MASK
> > >  	cbz	x9, 1f
> > >  	orr	tcr, tcr, #TCR_HA		// hardware Access flag update
> > > +
> > > +#ifdef CONFIG_ARM64_HAFT
> > > +	orr	tcr2, tcr2, TCR2_EL1x_HAFT
> > > +#endif /* CONFIG_ARM64_HAFT */
> > >  1:
> > >  #endif	/* CONFIG_ARM64_HW_AFDBM */
> > >  	msr	mair_el1, mair
> > 
> > If you still want #ifdefs, I'd have left it outside the HW_AFDBM. We
> > already have a dependency in the Kconfig. Anyway, I can fix this up.
> > 
> > I think as an additional patch we can also remove the ID checks for the
> > tcr bit in tge HW_AFDBM case. But that's unrelated to this series.
> 
> I think you want to be careful with this one. I know of at least one
> implementation that has a broken FEAT_HAFDBS implementation, that
> removes it from the ID registers, but where the control bit in TCR_ELx
> still takes effect.
> 
> Please see 6df696cd9bc1 ("arm64: errata: Mitigate Ampere1 erratum
> AC03_CPU_38 at stage-2") which indicates how we actually rely on the
> check for S1 translation.

Ah, thanks for this. So the hardware with the erratum above can still
update the pte after it has been marked invalid, hence we can't turn it
on in TCR_EL1 even if the rest of the kernel considers the feature
disabled. So yes, the HAFDBS code needs to stay as is.

Let's hope the hardware people learnt and we won't have similar errata
for FEAT_HAFT.

-- 
Catalin

