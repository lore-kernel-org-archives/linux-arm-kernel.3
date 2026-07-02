Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0312C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXdo5/aahv4y37zZlNB/IfEwUv0GT4AThr4Fpd6s7JI=; b=h4bPdDI8HZ24SeUcBbXIrEvXbp
	rsp6ltsEXAyS04UZnpxKGqKUV80dunLiX2m22qlCD4LO9eev6vK7MD1iz3ueGd9I6RUuAU6a9bcoh
	kPP80OJMowQf0w2q5RGHz1AxgOaM4by0NlBAYrwwH49L/7CQOYujPoqGJY8rZ8sM19ZZsj6M4ljVP
	k1bFlkYYNDUj2lsomLjdbwmAmJUqBp23zfBfqko7KV9etqB5hWPXkgm3T5rl5xKULx9iNN5U3nEso
	lJjFtaxuNT/KCf92F2zmNb+g82zi9X94jDwIR2d0vEcn6vQYGyurPz1syn7RhsEjvzifV3GQn+rh8
	Ho5SB7DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfK4C-00000004ydD-1083;
	Thu, 02 Jul 2026 16:15:08 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfK49-00000004ycE-1sgR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:15:06 +0000
Received: from roadster.musicnaut.iki.fi (85-76-33-40-nat.elisa-mobile.fi [85.76.33.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4grhmY5zzmzyPv;
	Thu, 02 Jul 2026 19:14:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1783008900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lXdo5/aahv4y37zZlNB/IfEwUv0GT4AThr4Fpd6s7JI=;
	b=Yvk0nudlf/4pq3Au1Uks0V+9tcCN/GI+dSgUijChIgoDgMOaPnOL/XMF36O32QGXRD1QGr
	GKRya//cfZuycTMNb3zjQfUoK2Msl4cdYq/iuahrgx3oYdUNZn9wLGS4qTQvat9M5y1cel
	Mne/c18kqwv9jM5WRXZFB0ARJ2F6mmU=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1783008900;
	b=tQgfVBlCUVAE3oRixcWlGPb9npGhAnJfJjr2NT9mwmBZHQQiOi6hAfJ6D/yG4/wSKFg9Ny
	GcsJpz5AlZydwxoyJSemflTB0HVUB0bs6M97rKKdXGRXthqML4r5zs999GoO/QDTWomDmn
	jZOJp1JBG3q0jWk+iYzvvsfW8KUWHfg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1783008900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lXdo5/aahv4y37zZlNB/IfEwUv0GT4AThr4Fpd6s7JI=;
	b=ScD9E2eIwHcftb3jnTP9LYPe0rS9dNpgP5CpiqJdCAzJsoYMFBTsWz2VQqgznRGdYHOevi
	WJ6kShnTFLQGkdkfMPJRHKP7t3oh6V18YjTILovTXJdRa7SdRYWJCi+cjMCNvgKVU0789h
	O1B/P0HxT0pXmah+56ZVgOh4k8+n6qU=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
Date: Thu, 2 Jul 2026 19:14:51 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Ard Biesheuvel <ardb@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Mack <daniel@zonque.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Stefan Wiehler <stefan.wiehler@nokia.com>,
	Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 03/19] ARM: rework ARM11 CPU selection logic
Message-ID: <akaOe1waglVC5ZQT@roadster.musicnaut.iki.fi>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-4-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701212353.2196041-4-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_091505_662466_649D7CE3 
X-CRM114-Status: GOOD (  38.37  )
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

On Wed, Jul 01, 2026 at 11:23:37PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Support for SMP on ARM1136r0 has been broken for a while, and nobody
> is working on fixing it. I had a plan to change ARMv6 support to no
> longer coexist in a common kernel with ARMv7 CPUs but instead ARMv5 and
> below. This would have addressed the problem, but after a recent mailing
> list discussion, we concluded that an easier approach is to just forbid
> ARM1136r0 CPU support on SMP-enabled kernels.
> 
> This mainly affects users of the Nokia N800/N810 tablets using an
> OMAP2420 SoC, which is the only commercial product with an ARM1136r0
> that is still supported by the kernel.
> 
> The other machines that are still in the same hardware catogory are:
> 
>  - TI OMAP2420 H4 reference board
>  - TI OMAP2430 SDP software development platform
>  - Freescale/NXP i.MX31 Lite Development Kit
>  - Buglabs i.MX31 Bug 1.x prototype
>  - Arm Integrator/AP with CM1136JF-S core module
> 
> To my knowledge, none of these have any actual users aside from
> reference boards being used more easily test the platforms.
> 
> There are also a few ARM1136r1 machines, which implement the
> ARMv6K SMP support (barriers, atomics and TLS):
> 
>  - Eukrea CPUIMX35 reference platform
>  - Freescale/NXP i.MX35 Product Development Kit
>  - ARM Integrator/CP/IM-LT3 with ARM1136J Core Tile
>  - ARM Realview/EB with ARM1136J Core Tile
> 
> Again, these are mainly reference implementations rather than
> actual products, but since they support ARMv6K, they should
> continue to work correctly in SMP-enabled kernels. For the
> ARM Core Tile, I have not found a datasheet but instead use
> the revision based on what the respective virtual models
> report.
> 
> All the other ARMv6 platforms use an ARM1176 with ARMv6K,
> VMSAv7 and Trustzone support.
> 
> To avoid the broken configuration, annotate the ARM1136 based
> machines with specific CPU_ARM1136R0 or CPU_ARM1136R2 symbols
> in Kconfig and make the r0 variants depend on !SMP.
> 
> Link: https://lore.kernel.org/linux-arm-kernel/2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com/T/
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi> # OMAP

> ---
>  arch/arm/Kconfig.platforms      |  2 +-
>  arch/arm/mach-imx/Kconfig       |  4 +++-
>  arch/arm/mach-omap2/Kconfig     |  3 ++-
>  arch/arm/mach-versatile/Kconfig | 10 +++++-----
>  arch/arm/mm/Kconfig             | 24 +++++++++++++++++++++++-
>  5 files changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/Kconfig.platforms b/arch/arm/Kconfig.platforms
> index 386eccc81868..2e118b65f93b 100644
> --- a/arch/arm/Kconfig.platforms
> +++ b/arch/arm/Kconfig.platforms
> @@ -33,7 +33,7 @@ config ARCH_MULTI_V4_V5
>  config ARCH_MULTI_V6
>  	bool "ARMv6 based platforms (ARM11)"
>  	select ARCH_MULTI_V6_V7
> -	select CPU_V6K
> +	select CPU_ARM1176
>  
>  config ARCH_MULTI_V7
>  	bool "ARMv7 based platforms (Cortex-A, PJ4, Scorpion, Krait)"
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index a361840d7a04..041e73ad203a 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -41,13 +41,15 @@ comment "ARM1136 platforms"
>  
>  config SOC_IMX31
>  	bool "i.MX31 support"
> -	select CPU_V6
> +	depends on !SMP
> +	select CPU_ARM1136R0
>  	select MXC_AVIC
>  	help
>  	  This enables support for Freescale i.MX31 processor
>  
>  config SOC_IMX35
>  	bool "i.MX35 support"
> +	select CPU_ARM1136R1
>  	select MXC_AVIC
>  	help
>  	  This enables support for Freescale i.MX35 processor
> diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
> index f3f19bcfca2c..13987ffbba00 100644
> --- a/arch/arm/mach-omap2/Kconfig
> +++ b/arch/arm/mach-omap2/Kconfig
> @@ -8,8 +8,9 @@ config OMAP_HWMOD
>  config ARCH_OMAP2
>  	bool "TI OMAP2"
>  	depends on ARCH_MULTI_V6
> +	depends on !SMP
>  	select ARCH_OMAP2PLUS
> -	select CPU_V6
> +	select CPU_ARM1136R0
>  	select OMAP_HWMOD
>  	select SOC_HAS_OMAP2_SDRC
>  
> diff --git a/arch/arm/mach-versatile/Kconfig b/arch/arm/mach-versatile/Kconfig
> index 513618078440..de42da7de8c8 100644
> --- a/arch/arm/mach-versatile/Kconfig
> +++ b/arch/arm/mach-versatile/Kconfig
> @@ -113,7 +113,8 @@ config INTEGRATOR_CM1136JFS
>  	bool "Integrator/CM1136JF-S core module"
>  	depends on ARCH_INTEGRATOR_AP
>  	depends on ARCH_MULTI_V6
> -	select CPU_V6
> +	depends on !SMP
> +	select CPU_ARM1136R0
>  
>  config ARCH_INTEGRATOR_CP
>  	bool "Support Integrator/CP platform"
> @@ -135,7 +136,7 @@ config INTEGRATOR_CTB36
>  	bool "Integrator/CTB36 (ARM1136JF-S) core tile"
>  	depends on ARCH_INTEGRATOR_CP
>  	depends on ARCH_MULTI_V6
> -	select CPU_V6
> +	select CPU_ARM1136R1
>  
>  config ARCH_CINTEGRATOR
>  	depends on ARCH_INTEGRATOR_CP
> @@ -182,7 +183,7 @@ config MACH_REALVIEW_EB
>  config REALVIEW_EB_ARM1136
>  	bool "Support ARM1136J(F)-S Tile"
>  	depends on MACH_REALVIEW_EB && ARCH_MULTI_V6
> -	select CPU_V6
> +	select CPU_ARM1136R1
>  	help
>  	  Enable support for the ARM1136 tile fitted to the
>  	  Realview(R) Emulation Baseboard platform.
> @@ -201,11 +202,10 @@ config REALVIEW_EB_A9MP
>  	  Enable support for the Cortex-A9MPCore tile fitted to the
>  	  Realview(R) Emulation Baseboard platform.
>  
> -# ARMv6 CPU without K extensions, but does have the new exclusive ops
>  config MACH_REALVIEW_PB1176
>  	bool "Support RealView(R) Platform Baseboard for ARM1176JZF-S"
>  	depends on ARCH_MULTI_V6
> -	select CPU_V6
> +	select CPU_ARM1176
>  	select HAVE_TCM
>  	help
>  	  Include support for the ARM(R) RealView(R) Platform Baseboard for
> diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
> index 871bd58d2ccc..f3d71e89a31f 100644
> --- a/arch/arm/mm/Kconfig
> +++ b/arch/arm/mm/Kconfig
> @@ -376,6 +376,7 @@ config CPU_PJ4B
>  # ARMv6
>  config CPU_V6
>  	bool
> +	depends on !SMP
>  	select CPU_32v6
>  	select CPU_ABRT_EV6
>  	select CPU_CACHE_V6
> @@ -386,7 +387,6 @@ config CPU_V6
>  	select CPU_PABRT_V6
>  	select CPU_THUMB_CAPABLE
>  	select CPU_TLB_V6 if MMU
> -	select SMP_ON_UP if SMP
>  
>  # ARMv6k
>  config CPU_V6K
> @@ -403,6 +403,28 @@ config CPU_V6K
>  	select CPU_THUMB_CAPABLE
>  	select CPU_TLB_V6 if MMU
>  
> +config CPU_ARM1136R0
> +	bool
> +	select CPU_V6
> +	depends on !SMP
> +	help
> +	  These early revisions of ARM1136 lack support for the
> +	  ARMv6k extensions for multiprocessing.
> +
> +config CPU_ARM1136R1
> +	bool
> +	select CPU_V6K
> +	help
> +	  Later revisions of ARM1136 add ARMv6k (atomics, barriers
> +	  and TLS register) in addition to the features from r0.
> +
> +config CPU_ARM1176
> +	bool
> +	select CPU_V6K
> +	help
> +	  ARM1176 implements ARMv6k, VMSAv7 and Trustzone in
> +	  addition to the ARMv6 baseline.
> +
>  # ARMv7 and ARMv8 architectures
>  config CPU_V7
>  	bool
> -- 
> 2.39.5
> 

