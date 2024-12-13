Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB815E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uwKzWXE2RzjZKjwJlroc5SdHzWlSGYHVXGkvD3Wxh8=; b=E07VbWNoyAHTAP++WielW02IGh
	UD7raqlRU1+roh9lVKBwZI+PEstvD6P0mvS/lPr/ezdDPxyfNzBQrBY0EjiKCYKOzOBextX4nHUJU
	vL8mlSvBftXb0EP+OVvul66n+NbCzoGDB/k0UZpk6sWLWOYAFJmPerC2ZadyYw2z4/rYUfc4pgaAM
	cZ6obSwE3eFnHqeaXUwBJDa1CWiwGnWDY42dYMopO9/YyXHOy287VvS0klNJm16o7pBnPLuDuwcRV
	Koost+ncL/9mtlz7pL4G1GylSrKaz7TZhC/s2gLuzFrfHO6GJ4wZnLXz65zWoeONutqq67zGrTOw4
	Ed10B7Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8Qi-00000004OII-06kZ;
	Fri, 13 Dec 2024 16:22:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8Pc-00000004O7u-163r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:21:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AD5D1595;
	Fri, 13 Dec 2024 08:21:35 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.1.196.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D90B53F5A1;
	Fri, 13 Dec 2024 08:21:05 -0800 (PST)
Date: Fri, 13 Dec 2024 16:21:03 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [RFC PATCH v1 3/5] arm64: Add errata and workarounds for systems
 with broken BBML2
Message-ID: <20241213162103.GB30314@mazurka.cambridge.arm.com>
References: <20241211154611.40395-1-miko.lenczewski@arm.com>
 <20241211154611.40395-4-miko.lenczewski@arm.com>
 <86pllyrwke.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86pllyrwke.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_082108_387221_6BBCE29F 
X-CRM114-Status: GOOD (  29.57  )
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

On Wed, Dec 11, 2024 at 04:52:49PM +0000, Marc Zyngier wrote:
> On Wed, 11 Dec 2024 15:45:04 +0000,
> Mikołaj Lenczewski <miko.lenczewski@arm.com> wrote:
> > 
> > There are systems which claim support for BBML2, but whose
> > implementation of this support is broken. Add a Kconfig erratum for each
> > of these systems, and a cpufeature workaround that forces the supported
> > BBM level on these systems to 0.
> > 
> > Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
> > ---
> >  Documentation/arch/arm64/silicon-errata.rst |  32 ++++
> >  arch/arm64/Kconfig                          | 164 ++++++++++++++++++++
> >  arch/arm64/kernel/cpufeature.c              |  32 +++-
> >  3 files changed, 227 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 100570a048c5..9ef8418e8410 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -1127,6 +1127,170 @@ config ARM64_ERRATUM_3194386
> >  
> >  	  If unsure, say Y.
> >  
> > +config ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT
> > +	bool
> > +
> > +config ARM64_ERRATUM_3696250
> > +	bool "Neoverse-N2: workaround for broken BBM level 2 support"
> > +	default y
> > +	select ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT
> > +	help
> > +	  Affected Neoverse-N2 cores (r0p0, r0p1, r0p2, r0p3) declare
> 
> So you list a number of affected revisions...
> 
> [...]
> 
> > +static bool has_bbml2(const struct arm64_cpu_capabilities *entry,
> > +		      int scope)
> > +{
> > +	if (IS_ENABLED(CONFIG_ARM64_WORKAROUND_BROKEN_BBML2_SUPPORT)) {
> > +		static const struct midr_range broken_bbml2_list[] = {
> > +			MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
> > +			MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
> > +			MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
> > +			MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
> > +			MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
> > +			MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
> > +			MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
> > +			MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),
> > +			MIDR_ALL_VERSIONS(MIDR_CORTEX_X4),
> > +			MIDR_ALL_VERSIONS(MIDR_CORTEX_X925),
> > +			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
> > +			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
> > +			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
> > +			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
> > +			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3),
> > +			{}
> 
> ... and yet you flag all versions as broken? So which one is it? If it
> is really the case that all versions are broken, then the text should
> be simplified. Otherwise, this should really list the broken versions.
> 
> The other thing is that I find it incredibly dangerous to rely on
> some config option to disable a feature that will absolutely eat your
> data if it is broken. I'd rather see the whole BBM-L2 being behind an
> option, and unconditionally check for b0rken CPUs.
> 
> Specially when it looks like there isn't a single CPU on the planet
> that implemented the feature correctly... :-/
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

Thanks for reviewing. Apologies for the delay in responding, and for
spam (replied instead of group-replied).

The workaround kconfig entries should be correct here. The MIDR
revisions will be fixed in the next respin.

I agree that having a BBML2 option and unconditionally guarding against
broken cpus is better, will make that change.

