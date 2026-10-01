Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E13CCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJAmo5De7N9MtzX8gmGKxFdRcV0+ieIy9fXA7bntHRg=; b=zz4+FYsOUUc+IPX0kvvIcXGUit
	NdGxnzcWPO0DLZpoY3cSP7vkpTyYPGAze/uYxpCdSVN4g52VLE8drVfupT/tB/MyTgA/lob/y4Gip
	C7zBIlqIVZxe6dwzv6c1d1es7A5yQodBXi/mpCO4v6Wdgj/yb+/zS/WL9VFMPm/09OTn+kR5LUGod
	D5/JB3k/grxuaXX/2PzDvOYXCDE/Yvm7RkGqg3kca64jMXaqNEcWdw2YGP3jpLTeneYzXMjGLmnkK
	oh0ioMH9mPDXIGqt6Lg/dwTd1A1/050QnvrLQBbNHWtpa+1SOvKF+3yY44HEDIS0q1aDaC7iBM996
	dA9D3TEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCVC-00000008H3z-3NzS;
	Thu, 01 Oct 2026 08:50:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCVA-00000008H2B-03ur
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:50:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1712143D;
	Thu,  1 Oct 2026 01:50:45 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24C843F85F;
	Thu,  1 Oct 2026 01:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790844649; bh=2kY249iXK1XN+Jzjq1WLtXqjbaLI/K1j1QQJaBsCd30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPIkQhDY1Ob6l+HM5YeoQ/kvYHLCPf55eGtkqabmyP5H8Cv7at7+ZtLBnZfwWHORs
	 GsgRNDQODM4ceParSgw1N/9Brx8nvydEWGeKuJoFPSLuecz74uDBvYepaBq1USulMh
	 1BW7kKcuYpvRv/zOADhVcE/iSXy+9rdJmpop6CFU=
Date: Thu, 1 Oct 2026 10:50:44 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, suzuki.poulose@arm.com, James.Morse@arm.com,
	xuewen.yan94@gmail.com, seanwang1@lenovo.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: errata: Factor out broken AMU const
 counter cap
Message-ID: <ar4e5A5tytSaTWg5@arm.com>
References: <20260929154325.3416271-1-beata.michalska@arm.com>
 <20260929154325.3416271-2-beata.michalska@arm.com>
 <0dc8a173-2d8f-4a05-9624-6d95c2fdb622@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dc8a173-2d8f-4a05-9624-6d95c2fdb622@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_015052_134422_E3D37046 
X-CRM114-Status: GOOD (  28.39  )
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

On Wed, Sep 30, 2026 at 10:21:28AM +0100, Vladimir Murzin wrote:
> Hi Beata,
Hi Vladimir,
> 
> On 9/29/26 16:42, Beata Michalska wrote:
> > Move the workaround from the erratum 2457168-specific cpucap to a generic
> > broken AMU constant-counter one. This keeps the existing Cortex-A510
> > handling unchanged while allowing other errata with similar AMU constant
> > counter issue to share the capability bit and call sites.
> > 
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> > ---
> >  arch/arm64/Kconfig             |  8 ++++++++
> >  arch/arm64/kernel/cpu_errata.c | 23 +++++++++++++++++------
> >  arch/arm64/kernel/cpufeature.c |  2 +-
> >  arch/arm64/kernel/topology.c   |  7 ++++---
> >  arch/arm64/tools/cpucaps       |  2 +-
> >  5 files changed, 31 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index b5a51b0ef9440..3b6c052d46a18 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -1040,9 +1040,17 @@ config ARM64_ERRATUM_1902691
> >  
> >  	  If unsure, say Y.
> >  
> > +config ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> > +	bool
> > +	# Targeting errata affecting AMEVCNTR01, the AMU constant counter.
> > +	# On affected CPUs the counter may not increment at the expected rate,
> > +	# making it unreliable. As a result, AMU users should treat it as
> > +	# unavailable rather than relying on misleading counter values.
> > +
> >  config ARM64_ERRATUM_2457168
> >  	bool "Cortex-A510: 2457168: workaround for AMEVCNTR01 incrementing incorrectly"
> >  	depends on ARM64_AMU_EXTN
> > +	select ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> >  	default y
> >  	help
> >  	  This option adds the workaround for ARM Cortex-A510 erratum 2457168.
> > diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> > index 5db8f0619e4bc..f18683e56184b 100644
> > --- a/arch/arm64/kernel/cpu_errata.c
> > +++ b/arch/arm64/kernel/cpu_errata.c
> > @@ -381,6 +381,18 @@ static const struct arm64_cpu_capabilities arm64_repeat_tlbi_list[] = {
> >  };
> >  #endif
> >  
> > +#ifdef CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> > +static const struct arm64_cpu_capabilities arm64_repeat_amu_constcnt_list[] = {
>                                                     ^^^^^^
>                                            There is nothing to repeat :)
> 
> > +#ifdef CONFIG_ARM64_ERRATUM_2457168
> > +	{
> > +		/* Cortex-A510 r0p0-r1p1 */
> > +		CAP_MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1)
> > +	},
> > +#endif
> > +	{}
> > +};
> > +#endif /* CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT */
> > +
> >  #ifdef CONFIG_CAVIUM_ERRATUM_23154
> >  static const struct midr_range cavium_erratum_23154_cpus[] = {
> >  	MIDR_ALL_VERSIONS(MIDR_THUNDERX),
> > @@ -916,14 +928,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
> >  		ERRATA_MIDR_REV_RANGE(MIDR_CORTEX_A510, 0, 0, 2)
> >  	},
> >  #endif
> > -#ifdef CONFIG_ARM64_ERRATUM_2457168
> > +#ifdef CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> >  	{
> > -		.desc = "ARM erratum 2457168",
> > -		.capability = ARM64_WORKAROUND_2457168,
> > +		.desc = "Broken AMU AMEVCNTR01 (const counter)",
> > +		.capability = ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT,
> >  		.type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
> > -
> > -		/* Cortex-A510 r0p0-r1p1 */
> > -		CAP_MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1)
> 
> I think it should be
> 
>                 CAP_MIDR_RANGE_LIST(amu_broken_constcnt_cpus)
True, that's more appropriate here.
Thanks

---
BR
Beata
> 
> where amu_broken_constcnt_cpus is
> 
> static const struct midr_range amu_broken_constcnt_cpus[] = {
> #ifdef CONFIG_ARM64_ERRATUM_2457168
>        /* Cortex-A510 r0p0-r1p1 */
>        MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1),
> #endif
>        {}
> };
> 
> so in the next patch you would add new entry
> 
> #ifdef CONFIG_ARM64_ERRATUM_3821522
>        /* Cortex-A725 r0p0 - r0p2 */
>        MIDR_RANGE(MIDR_CORTEX_A725, 0, 0, 0, 2),
> #endif
> 
> 
> Cheers
> Vladimir
> 

