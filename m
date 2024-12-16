Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B113E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 12:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwTwE885XqheLkc815UCDkB8FRXTN15YEa45oX2s8Jc=; b=G5mnXVX3cUlMkK1Etoru1H9mXx
	BcYC6oYRA7wlBbdM9ZDrZ+viiM8CK6rASLI5J5531ZV4ZvN1ZGnmtPqsjW5IGPMAAViMhucxpd29p
	meBVE9uBFdjI4lunoK8jDQxeUU0UxOzc1+SQw67frxQDyMmhyZJLd2MtMEZ03/gtK+Dm0A2ln1w+t
	d8oWwPFZfDmZiwrtk9puzblCL+9sLqeehyq89TCrmM6LYrVvjzHazV2m0flUa1j66sFqEcdcZMZel
	3eNIeDsGYhWjw9wed6uVvA3M8HeLZLv151upwh1j011gU7U77dJNtunvQJIjGJfgG8p0FeTfkL4KI
	yLs90bjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNANq-00000009zGY-2hFV;
	Mon, 16 Dec 2024 12:39:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNAMk-00000009z7w-2yIO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 12:38:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9125111FB;
	Mon, 16 Dec 2024 04:38:53 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBAFD3F58B;
	Mon, 16 Dec 2024 04:38:23 -0800 (PST)
Date: Mon, 16 Dec 2024 12:38:17 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Peter Collingbourne <pcc@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64/sme: Move storage of reg_smidr to
 __cpuinfo_store_cpu()
Message-ID: <Z2AfOZ82QG_ukWry@J2N7QTR9R3>
References: <20241214-arm64-fix-boot-cpu-smidr-v1-1-0745c40772dd@kernel.org>
 <87a5cysfci.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5cysfci.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_043826_833448_468609CC 
X-CRM114-Status: GOOD (  39.47  )
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

On Sat, Dec 14, 2024 at 10:56:13AM +0000, Marc Zyngier wrote:
> [+ Mark]
> On Sat, 14 Dec 2024 00:52:08 +0000,
> Mark Brown <broonie@kernel.org> wrote:
> > 
> > In commit 892f7237b3ff ("arm64: Delay initialisation of
> > cpuinfo_arm64::reg_{zcr,smcr}") we moved access to ZCR, SMCR and SMIDR
> > later in the boot process in order to ensure that we don't attempt to
> > interact with them if SVE or SME is disabled on the command line.
> > Unfortunately when initialising the boot CPU in init_cpu_features() we work
> > on a copy of the struct cpuinfo_arm64 for the boot CPU used only during
> > boot, not the percpu copy used by the sysfs code.
> > 
> > Fix this by moving the handling for SMIDR_EL1 for the boot CPU to
> > cpuinfo_store_boot_cpu() so it can operate on the percpu copy of the data.
> > This reduces the potential for error that could come from having both the
> > percpu and boot CPU copies in init_cpu_features().
> > 
> > This issue wasn't apparent when testing on emulated platforms that do not
> > report values in this ID register.
> > 
> > Fixes: 892f7237b3ff ("arm64: Delay initialisation of cpuinfo_arm64::reg_{zcr,smcr}")
> > Signed-off-by: Mark Brown <broonie@kernel.org>
> > Cc: stable@vger.kernel.org
> > ---
> >  arch/arm64/kernel/cpufeature.c |  6 ------
> >  arch/arm64/kernel/cpuinfo.c    | 11 +++++++++++
> >  2 files changed, 11 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index 6ce71f444ed84f9056196bb21bbfac61c9687e30..b88102fd2c20f77e25af6df513fda09a484e882e 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -1167,12 +1167,6 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
> >  	    id_aa64pfr1_sme(read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1))) {
> >  		unsigned long cpacr = cpacr_save_enable_kernel_sme();
> >  
> > -		/*
> > -		 * We mask out SMPS since even if the hardware
> > -		 * supports priorities the kernel does not at present
> > -		 * and we block access to them.
> > -		 */
> > -		info->reg_smidr = read_cpuid(SMIDR_EL1) & ~SMIDR_EL1_SMPS;
> >  		vec_init_vq_map(ARM64_VEC_SME);
> >  
> >  		cpacr_restore(cpacr);
> > diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> > index d79e88fccdfce427507e7a34c5959ce6309cbd12..b7d403da71e5a01ed3943eb37e7a00af238771a2 100644
> > --- a/arch/arm64/kernel/cpuinfo.c
> > +++ b/arch/arm64/kernel/cpuinfo.c
> > @@ -499,4 +499,15 @@ void __init cpuinfo_store_boot_cpu(void)
> >  
> >  	boot_cpu_data = *info;
> >  	init_cpu_features(&boot_cpu_data);
> > +
> > +	/* SMIDR_EL1 needs to be stored in the percpu data for sysfs */
> > +	if (IS_ENABLED(CONFIG_ARM64_SME) &&
> > +	    id_aa64pfr1_sme(read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1))) {
> > +		/*
> > +		 * We mask out SMPS since even if the hardware
> > +		 * supports priorities the kernel does not at present
> > +		 * and we block access to them.
> > +		 */
> > +		info->reg_smidr = read_cpuid(SMIDR_EL1) & ~SMIDR_EL1_SMPS;
> > +	}
> >  }
> 
> I don't understand the need to single out SMIDR_EL1. It seems to only
> make things even more fragile than they already are by adding more
> synchronisation phases.
> 
> Why isn't the following a good enough fix? It makes it plain that
> boot_cpu_data is only a copy of CPU0's initial boot state.
> 
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index d79e88fccdfce..0cbb42fd48850 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -497,6 +497,6 @@ void __init cpuinfo_store_boot_cpu(void)
>  	struct cpuinfo_arm64 *info = &per_cpu(cpu_data, 0);
>  	__cpuinfo_store_cpu(info);
>  
> +	init_cpu_features(info);
>  	boot_cpu_data = *info;
> -	init_cpu_features(&boot_cpu_data);
>  }

I think that change in isolation is fine, but I don't think that's the
right fix.

I think that what we did in commit:

   892f7237b3ff ("arm64: Delay initialisation of cpuinfo_arm64::reg_{zcr,smcr}")

... introduces an anti-pattern that'd be nice to avoid. That broke the
existing split of __cpuinfo_store_cpu() and init_cpu_features(), where
the former read the ID regs, and the latter set up the features
*without* altering the copy of the ID regs that was read. i.e.
init_cpu_features() shouldn't write to its info argument at all.

I understand that we have to do something as a bodge for broken FW which
traps SME, but I'd much rather we did that within __cpuinfo_store_cpu().

Can we add something to check whether SME was disabled on the command
line, and use that in __cpuinfo_store_cpu(), effectively reverting
892f7237b3ff?

Mark.

