Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6FCE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFoA++ZcNOhgLjB3Q058Exgbh7EvjH9LZnu0U8IFVRg=; b=h5Em9hrkmRNgUmxE0K2/dtSOW9
	JGAszURPJ/oeflfUT0ue1iNSqg0fxxm3J026t8SGLq+jEKM8fZVDXtZkeRUdXXJfSJ/2jDPYEY6y9
	nAYHL+lh7E/xPficp7xCc9ZH0Sbvpo86TVRgvFW+3tJC+xuI+GvHiGj+xWvYadOT1A5jFeOkIhBXL
	IAjyUdOrcaJqEb3hQiX3+2/PkRkng6XgyDvgh2wx4EjLG3u2M4EKx1LZqFwSUuDUrOE/Wa2m00v3A
	nGkgfU9wRuTDcfYUxJdUWAG+OZiETbeTym4gNML1myPZv4l57VUcVVOQzVzH1QXpsCaE2qqzvX3If
	L18QpTmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNChy-0000000AM19-32Uj;
	Mon, 16 Dec 2024 15:08:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCgs-0000000ALqJ-0TXr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:07:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 177A0113E;
	Mon, 16 Dec 2024 07:07:47 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2FC93F528;
	Mon, 16 Dec 2024 07:07:17 -0800 (PST)
Date: Mon, 16 Dec 2024 15:07:15 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Peter Collingbourne <pcc@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64/sme: Move storage of reg_smidr to
 __cpuinfo_store_cpu()
Message-ID: <Z2BCI61c9QWG7mMB@J2N7QTR9R3.cambridge.arm.com>
References: <20241214-arm64-fix-boot-cpu-smidr-v1-1-0745c40772dd@kernel.org>
 <87a5cysfci.wl-maz@kernel.org>
 <Z2AfOZ82QG_ukWry@J2N7QTR9R3>
 <865xnjsnqo.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865xnjsnqo.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_070722_239451_C8355635 
X-CRM114-Status: GOOD (  31.20  )
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

On Mon, Dec 16, 2024 at 02:31:43PM +0000, Marc Zyngier wrote:
> On Mon, 16 Dec 2024 12:38:17 +0000,
> Mark Rutland <mark.rutland@arm.com> wrote:
> > I think that what we did in commit:
> > 
> >    892f7237b3ff ("arm64: Delay initialisation of cpuinfo_arm64::reg_{zcr,smcr}")
> > 
> > ... introduces an anti-pattern that'd be nice to avoid. That broke the
> > existing split of __cpuinfo_store_cpu() and init_cpu_features(), where
> > the former read the ID regs, and the latter set up the features
> > *without* altering the copy of the ID regs that was read. i.e.
> > init_cpu_features() shouldn't write to its info argument at all.
> > 
> > I understand that we have to do something as a bodge for broken FW which
> > traps SME, but I'd much rather we did that within __cpuinfo_store_cpu().
> 
> Honestly, I'd rather revert that patch, together with b3000e2133d8
> ("arm64: Add the arm64.nosme command line option"). I'm getting tired
> of the FW nonsense, and we are only allowing vendors to ship untested
> crap.
> 
> Furthermore, given the state of SME in the kernel, I don't think this
> is makes any difference. So maybe this is the right time to reset
> everything to a sane state.

Looking again, a revert does look to be the best option.

We removed reg_zcr and reg_smcr in v6.7 in commits:

  abef0695f9665c3d ("arm64/sve: Remove ZCR pseudo register from cpufeature code")
  391208485c3ad50f ("arm64/sve: Remove SMCR pseudo register from cpufeature code")

As of those commits, ZCR and SCMR no longer matter to
__cpuinfo_store_cpu(), and only SMIDR_EL1 remains...

Per ARM DDI 0487 L.a, accesses to SMIDR_EL1 never trap to EL3, so we can
read that safely as long as ID_AA64PFR1_EL1.SME indicates that SME is
implemented.

Which is to say that if we revert the remaining portion of 892f7237b3ff
and restore the read of SMIDR, that should be good as far back as v6.7,
which sounds good to me.

Mark.

> > Can we add something to check whether SME was disabled on the command
> > line, and use that in __cpuinfo_store_cpu(), effectively reverting
> > 892f7237b3ff?
> 
> Maybe, but that'd be before any sanitisation of the overrides, so it
> would have to severely limit its scope. Something like this, which I
> haven't tested:
> 
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index d79e88fccdfce..9e9295e045009 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -492,10 +492,22 @@ void cpuinfo_store_cpu(void)
>  	update_cpu_features(smp_processor_id(), info, &boot_cpu_data);
>  }
>  
> +static void cpuinfo_apply_overrides(struct cpuinfo_arm64 *info)
> +{
> +	if (FIELD_GET(ID_AA64PFR0_EL1_SVE, id_aa64pfr0_override.mask) &&
> +	    !FIELD_GET(ID_AA64PFR0_EL1_SVE, id_aa64pfr0_override.val))
> +		info->reg_id_aa64pfr0 &= ~ID_AA64PFR0_EL1_SVE;
> +
> +	if (FIELD_GET(ID_AA64PFR1_EL1_SME, id_aa64pfr1_override.mask) &&
> +	    !FIELD_GET(ID_AA64PFR1_EL1_SME, id_aa64pfr1_override.val))
> +		info->reg_id_aa64pfr1 &= ~ID_AA64PFR1_EL1_SME;
> +}
> +
>  void __init cpuinfo_store_boot_cpu(void)
>  {
>  	struct cpuinfo_arm64 *info = &per_cpu(cpu_data, 0);
>  	__cpuinfo_store_cpu(info);
> +	cpuinfo_apply_overrides(info);
>  
>  	boot_cpu_data = *info;
>  	init_cpu_features(&boot_cpu_data);
> 
> But this will have ripple effects on the rest of the override code
> (the kernel messages are likely to be wrong).
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

