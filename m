Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57471C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 17:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f45umwqcFILCfkJ3WF2cEnwwzyWnCqKxgdhZ39iBVps=; b=KHvFX/KFEpsH3eUwC0cbXOdWed
	qyMxl/c6yNBpYCj/kMUowYs/PjTFUaMCVytbH3JY6ZgMZFirwAyYfsh+ciWHL6opqdCYECjd85Hgu
	M52v9EKS4yUysSmxY7ETY06efjMyfhSIfjAjvpjGc7XGuAAtNHgoi9vbKmce8kCllMO8TzCTYLWWV
	aD72508w/xOKkNkTEUQDPsPxn14Xd9gmKkCpKyfKSsh9GtulJ6+RRo0+vevqDJoVcJwkm1eJuojZs
	uM6/4Mv8nkuJYeD4H8EUi8WoY4fcIc7/7Gf5JwKxXGSySYi+dxGho57t0JnHsJPxwH7gICzyIl2Ud
	q7fMGBFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKmd-000000055BG-2jeF;
	Thu, 02 Jul 2026 17:01:03 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKmb-000000055AF-181L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 17:01:02 +0000
Received: from roadster.musicnaut.iki.fi (85-76-33-40-nat.elisa-mobile.fi [85.76.33.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4grjnZ3HHWzyPv;
	Thu, 02 Jul 2026 20:00:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1783011654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f45umwqcFILCfkJ3WF2cEnwwzyWnCqKxgdhZ39iBVps=;
	b=U4I0J55qihecPB49uYuX0R+q81rJDNi4vD6+RKmsKIJX05w9bEtXF7OC4xI30E8JRgkd4E
	+v/b+eiQxU266btF1TnqeYHP5peiRepaoOIQWBeajVLmdPySB5cxop4wgM4BubdqA4rtu6
	o/G/NR7a7HD9JN0vObfee2IWUGGL2uw=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1783011654;
	b=meDmzpgFXkWxUv5hpw+EphJSAvaT5x6m+j2PE73WZ72CjoKkEzPBQ99jFW1qtCZYOxIctH
	UAaOr/LJ7o1niBj9NyrgPQ54Xv1kjq8nmjxs3UWFgIr8/J2RZ5IkuAiZN6v/yuEq1Uiwxz
	Yj4wkREP+CQgbj9E2XaM6XvipNrzCLU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1783011654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f45umwqcFILCfkJ3WF2cEnwwzyWnCqKxgdhZ39iBVps=;
	b=X6tfdeTRKcQjCH0yUxvLb43t9Xcsbemkbw82TIWsA0Wu1M3kgepuTzESKZZizyaQE2myG7
	KOj5nSiYyEUGZhpy+Ot9FniC+dFZfQE15EoRaSWCROfdfgxpt/mvXezT85Kh6qHRdma6Tm
	LPL/VAh/fpKp/8Uj6r4hM53ZoCt7Hzg=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
Date: Thu, 2 Jul 2026 20:00:48 +0300
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
Subject: Re: [PATCH v2 05/19] ARM: turn CONFIG_ATAGS off by default
Message-ID: <akaZQHr0y4dSTvXc@roadster.musicnaut.iki.fi>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-6-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701212353.2196041-6-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_100101_632534_FC248BAE 
X-CRM114-Status: GOOD (  33.06  )
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

Hi,

On Wed, Jul 01, 2026 at 11:23:39PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Only a very small number of machines remain that rely on
> traditional board files with the ATAGS boot data instead
> of devicetree, and we have not accepted new ones for
> a decade.
> 
> Most of the remaining ones are on their way out of the
> kernel, but the Kconfig option that controls ATAGS
> is still enabled by default.
> 
> To reflect the actual status of ATAGS support and alert
> the remaining users of upstream and out-of-tree platforms
> with this, chanyge it to being default-disabled and
> add a dependency on CONFIG_EXPERT.
> 
> The board specific defconfig files that rely on ATAGS
> are changed to turn on both EXPERT and ATAGS if they
> were not doing thath already, and the ones that explicitly
> turned it off before no longer need to.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi> # OMAP

A.

> ---
>  arch/arm/Kconfig                       | 13 ++++++++-----
>  arch/arm/configs/am200epdkit_defconfig |  1 +
>  arch/arm/configs/aspeed_g4_defconfig   |  1 -
>  arch/arm/configs/aspeed_g5_defconfig   |  1 -
>  arch/arm/configs/assabet_defconfig     |  2 ++
>  arch/arm/configs/at91_dt_defconfig     |  1 -
>  arch/arm/configs/collie_defconfig      |  1 +
>  arch/arm/configs/dove_defconfig        |  1 +
>  arch/arm/configs/footbridge_defconfig  |  1 +
>  arch/arm/configs/h3600_defconfig       |  2 ++
>  arch/arm/configs/integrator_defconfig  |  1 -
>  arch/arm/configs/jornada720_defconfig  |  2 ++
>  arch/arm/configs/moxart_defconfig      |  1 -
>  arch/arm/configs/mps2_defconfig        |  1 -
>  arch/arm/configs/multi_v4t_defconfig   |  1 -
>  arch/arm/configs/mv78xx0_defconfig     |  1 +
>  arch/arm/configs/neponset_defconfig    |  2 ++
>  arch/arm/configs/netwinder_defconfig   |  2 ++
>  arch/arm/configs/omap1_defconfig       |  1 +
>  arch/arm/configs/rpc_defconfig         |  2 ++
>  arch/arm/configs/s3c6400_defconfig     |  2 ++
>  arch/arm/configs/sama5_defconfig       |  1 -
>  arch/arm/configs/sama7_defconfig       |  1 -
>  arch/arm/configs/spitz_defconfig       |  1 +
>  arch/arm/configs/stm32_defconfig       |  3 ++-
>  arch/arm/configs/wpcm450_defconfig     |  1 -
>  26 files changed, 31 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 3b2316dc9d13..0033d861e378 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1390,12 +1390,15 @@ config ARCH_WANT_FLAT_DTB_INSTALL
>  
>  config ATAGS
>  	bool "Support for the traditional ATAGS boot data passing"
> -	default y
> +	depends on EXPERT
>  	help
> -	  This is the traditional way of passing data to the kernel at boot
> -	  time. If you are solely relying on the flattened device tree (or
> -	  the ARM_ATAG_DTB_COMPAT option) then you may unselect this option
> -	  to remove ATAGS support from your kernel binary.
> +	  This is the traditional way of passing data to the kernel at
> +	  boot but is now only used by a few of the oldest ARMv4 and
> +	  ARMv5 machines.  Users that still rely on ATAGS should plan
> +	  on migrating to devicetree based booting.
> +
> +	  Support for ATAGS will be removed when the last machine using
> +	  it is either converted to DT or removed.
>  
>  config DEPRECATED_PARAM_STRUCT
>  	bool "Provide old way to pass kernel parameters"
> diff --git a/arch/arm/configs/am200epdkit_defconfig b/arch/arm/configs/am200epdkit_defconfig
> index d4745b0f3dcb..61beac88e863 100644
> --- a/arch/arm/configs/am200epdkit_defconfig
> +++ b/arch/arm/configs/am200epdkit_defconfig
> @@ -7,6 +7,7 @@ CONFIG_EXPERT=y
>  # CONFIG_ARCH_MULTI_V7 is not set
>  CONFIG_ARCH_PXA=y
>  CONFIG_ARCH_GUMSTIX=y
> +CONFIG_ATAGS=y
>  CONFIG_CMDLINE="console=ttyS0,115200n8 root=1f01 rootfstype=jffs2"
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
> index 3dcb80157f77..f86dd4ce7d0d 100644
> --- a/arch/arm/configs/aspeed_g4_defconfig
> +++ b/arch/arm/configs/aspeed_g4_defconfig
> @@ -23,7 +23,6 @@ CONFIG_ARCH_ASPEED=y
>  CONFIG_MACH_ASPEED_G4=y
>  CONFIG_VMSPLIT_2G=y
>  CONFIG_UACCESS_WITH_MEMCPY=y
> -# CONFIG_ATAGS is not set
>  CONFIG_JUMP_LABEL=y
>  CONFIG_STRICT_KERNEL_RWX=y
>  # CONFIG_BLK_DEBUG_FS is not set
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
> index ec558e57d081..45b937419dbd 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -29,7 +29,6 @@ CONFIG_VMSPLIT_2G=y
>  CONFIG_NR_CPUS=2
>  CONFIG_HIGHMEM=y
>  CONFIG_UACCESS_WITH_MEMCPY=y
> -# CONFIG_ATAGS is not set
>  CONFIG_VFP=y
>  CONFIG_NEON=y
>  CONFIG_KERNEL_MODE_NEON=y
> diff --git a/arch/arm/configs/assabet_defconfig b/arch/arm/configs/assabet_defconfig
> index df63889b0c4c..e4264fdac2e5 100644
> --- a/arch/arm/configs/assabet_defconfig
> +++ b/arch/arm/configs/assabet_defconfig
> @@ -1,11 +1,13 @@
>  CONFIG_SYSVIPC=y
>  CONFIG_LOG_BUF_SHIFT=14
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_EXPERT=y
>  CONFIG_ARCH_MULTI_V4=y
>  # CONFIG_ARCH_MULTI_V7 is not set
>  CONFIG_ARCH_SA1100=y
>  CONFIG_SA1100_ASSABET=y
>  # CONFIG_AEABI is not set
> +CONFIG_ATAGS=y
>  CONFIG_CMDLINE="mem=32M console=ttySA0,38400n8 initrd=0xc0800000,3M root=/dev/ram"
>  CONFIG_FPE_NWFPE=y
>  CONFIG_PM=y
> diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
> index 320eb27a6a2e..830c6c0dbdaf 100644
> --- a/arch/arm/configs/at91_dt_defconfig
> +++ b/arch/arm/configs/at91_dt_defconfig
> @@ -19,7 +19,6 @@ CONFIG_SOC_SAM9X60=y
>  CONFIG_SOC_SAM9X7=y
>  # CONFIG_ATMEL_CLOCKSOURCE_PIT is not set
>  CONFIG_UACCESS_WITH_MEMCPY=y
> -# CONFIG_ATAGS is not set
>  CONFIG_ARM_APPENDED_DTB=y
>  CONFIG_ARM_ATAG_DTB_COMPAT=y
>  CONFIG_CMDLINE="console=ttyS0,115200 initrd=0x21100000,25165824 root=/dev/ram0 rw"
> diff --git a/arch/arm/configs/collie_defconfig b/arch/arm/configs/collie_defconfig
> index 165202960438..570a5f8bc57b 100644
> --- a/arch/arm/configs/collie_defconfig
> +++ b/arch/arm/configs/collie_defconfig
> @@ -9,6 +9,7 @@ CONFIG_ARCH_MULTI_V4=y
>  # CONFIG_ARCH_MULTI_V7 is not set
>  CONFIG_ARCH_SA1100=y
>  CONFIG_SA1100_COLLIE=y
> +CONFIG_ATAGS=y
>  CONFIG_CMDLINE="noinitrd root=/dev/mtdblock2 rootfstype=jffs2 fbcon=rotate:1"
>  CONFIG_PM=y
>  # CONFIG_SWAP is not set
> diff --git a/arch/arm/configs/dove_defconfig b/arch/arm/configs/dove_defconfig
> index 08271e6719d7..917a864fec74 100644
> --- a/arch/arm/configs/dove_defconfig
> +++ b/arch/arm/configs/dove_defconfig
> @@ -8,6 +8,7 @@ CONFIG_ARCH_MULTI_V7=y
>  CONFIG_ARCH_DOVE=y
>  CONFIG_MACH_CM_A510=y
>  CONFIG_HIGHMEM=y
> +CONFIG_ATAGS=y
>  CONFIG_ARM_APPENDED_DTB=y
>  CONFIG_ARM_ATAG_DTB_COMPAT=y
>  CONFIG_VFP=y
> diff --git a/arch/arm/configs/footbridge_defconfig b/arch/arm/configs/footbridge_defconfig
> index e8bf9847d35d..0872dba5de79 100644
> --- a/arch/arm/configs/footbridge_defconfig
> +++ b/arch/arm/configs/footbridge_defconfig
> @@ -10,6 +10,7 @@ CONFIG_ARCH_FOOTBRIDGE=y
>  CONFIG_ARCH_EBSA285_HOST=y
>  CONFIG_ARCH_NETWINDER=y
>  # CONFIG_AEABI is not set
> +CONFIG_ATAGS=y
>  CONFIG_FPE_NWFPE=y
>  CONFIG_FPE_NWFPE_XP=y
>  CONFIG_MODULES=y
> diff --git a/arch/arm/configs/h3600_defconfig b/arch/arm/configs/h3600_defconfig
> index 0923d331190a..3e8da62d959d 100644
> --- a/arch/arm/configs/h3600_defconfig
> +++ b/arch/arm/configs/h3600_defconfig
> @@ -4,11 +4,13 @@ CONFIG_HIGH_RES_TIMERS=y
>  CONFIG_PREEMPT=y
>  CONFIG_LOG_BUF_SHIFT=14
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_EXPERT=y
>  CONFIG_ARCH_MULTI_V4=y
>  # CONFIG_ARCH_MULTI_V7 is not set
>  CONFIG_ARCH_SA1100=y
>  CONFIG_SA1100_H3600=y
>  # CONFIG_CPU_FREQ_STAT is not set
> +CONFIG_ATAGS=y
>  CONFIG_MODULES=y
>  CONFIG_NET=y
>  CONFIG_UNIX=y
> diff --git a/arch/arm/configs/integrator_defconfig b/arch/arm/configs/integrator_defconfig
> index ba38ec810a61..82180381bf3c 100644
> --- a/arch/arm/configs/integrator_defconfig
> +++ b/arch/arm/configs/integrator_defconfig
> @@ -13,7 +13,6 @@ CONFIG_ARCH_INTEGRATOR=y
>  CONFIG_ARCH_INTEGRATOR_AP=y
>  CONFIG_INTEGRATOR_IMPD1=y
>  CONFIG_ARCH_INTEGRATOR_CP=y
> -# CONFIG_ATAGS is not set
>  CONFIG_CMDLINE="console=ttyAM0,38400n8 root=/dev/nfs ip=bootp"
>  CONFIG_CPU_FREQ=y
>  CONFIG_CPU_FREQ_GOV_POWERSAVE=y
> diff --git a/arch/arm/configs/jornada720_defconfig b/arch/arm/configs/jornada720_defconfig
> index 0ebddd083b36..a96cfb81aba5 100644
> --- a/arch/arm/configs/jornada720_defconfig
> +++ b/arch/arm/configs/jornada720_defconfig
> @@ -1,11 +1,13 @@
>  CONFIG_SYSVIPC=y
>  CONFIG_LOG_BUF_SHIFT=14
> +CONFIG_EXPERT=y
>  CONFIG_ARCH_MULTI_V4=y
>  # CONFIG_ARCH_MULTI_V7 is not set
>  CONFIG_ARCH_SA1100=y
>  CONFIG_SA1100_JORNADA720=y
>  CONFIG_SA1100_JORNADA720_SSP=y
>  CONFIG_PM=y
> +CONFIG_ATAGS=y
>  CONFIG_MODULES=y
>  CONFIG_NET=y
>  CONFIG_PACKET=y
> diff --git a/arch/arm/configs/moxart_defconfig b/arch/arm/configs/moxart_defconfig
> index d97d9ea5c34d..699d7ad98dd2 100644
> --- a/arch/arm/configs/moxart_defconfig
> +++ b/arch/arm/configs/moxart_defconfig
> @@ -16,7 +16,6 @@ CONFIG_ARCH_MULTI_V4=y
>  # CONFIG_ARCH_MULTI_V7 is not set
>  CONFIG_ARCH_MOXART=y
>  CONFIG_MACH_UC7112LX=y
> -# CONFIG_ATAGS is not set
>  CONFIG_ARM_APPENDED_DTB=y
>  # CONFIG_SWAP is not set
>  # CONFIG_COMPAT_BRK is not set
> diff --git a/arch/arm/configs/mps2_defconfig b/arch/arm/configs/mps2_defconfig
> index e995e50537ef..cacf3876f6e4 100644
> --- a/arch/arm/configs/mps2_defconfig
> +++ b/arch/arm/configs/mps2_defconfig
> @@ -16,7 +16,6 @@ CONFIG_ARCH_MPS2=y
>  CONFIG_SET_MEM_PARAM=y
>  CONFIG_DRAM_BASE=0x21000000
>  CONFIG_DRAM_SIZE=0x1000000
> -# CONFIG_ATAGS is not set
>  # CONFIG_SUSPEND is not set
>  # CONFIG_BLOCK is not set
>  CONFIG_BINFMT_FLAT=y
> diff --git a/arch/arm/configs/multi_v4t_defconfig b/arch/arm/configs/multi_v4t_defconfig
> index 14c93bb59ad6..7b592345db21 100644
> --- a/arch/arm/configs/multi_v4t_defconfig
> +++ b/arch/arm/configs/multi_v4t_defconfig
> @@ -17,7 +17,6 @@ CONFIG_INTEGRATOR_IMPD1=y
>  CONFIG_INTEGRATOR_CM720T=y
>  CONFIG_INTEGRATOR_CM920T=y
>  CONFIG_INTEGRATOR_CM922T_XA10=y
> -# CONFIG_ATAGS is not set
>  CONFIG_CPU_IDLE=y
>  CONFIG_ARM_CPUIDLE=y
>  CONFIG_ARM_CLPS711X_CPUIDLE=y
> diff --git a/arch/arm/configs/mv78xx0_defconfig b/arch/arm/configs/mv78xx0_defconfig
> index 823f7963b8b3..e3cc8de7c1c2 100644
> --- a/arch/arm/configs/mv78xx0_defconfig
> +++ b/arch/arm/configs/mv78xx0_defconfig
> @@ -12,6 +12,7 @@ CONFIG_ARCH_MULTI_V5=y
>  CONFIG_ARCH_MV78XX0=y
>  CONFIG_MACH_TERASTATION_WXL=y
>  CONFIG_HIGHMEM=y
> +CONFIG_ATAGS=y
>  CONFIG_VFP=y
>  CONFIG_KPROBES=y
>  CONFIG_MODULES=y
> diff --git a/arch/arm/configs/neponset_defconfig b/arch/arm/configs/neponset_defconfig
> index 16f0afd770c1..d5d6d57f8fea 100644
> --- a/arch/arm/configs/neponset_defconfig
> +++ b/arch/arm/configs/neponset_defconfig
> @@ -1,12 +1,14 @@
>  CONFIG_SYSVIPC=y
>  CONFIG_LOG_BUF_SHIFT=14
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_EXPERT=y
>  CONFIG_ARCH_MULTI_V4=y
>  # CONFIG_ARCH_MULTI_V7 is not set
>  CONFIG_ARCH_SA1100=y
>  CONFIG_SA1100_ASSABET=y
>  CONFIG_ASSABET_NEPONSET=y
>  # CONFIG_AEABI is not set
> +CONFIG_ATAGS=y
>  CONFIG_ZBOOT_ROM_TEXT=0x80000
>  CONFIG_ZBOOT_ROM_BSS=0xc1000000
>  CONFIG_ZBOOT_ROM=y
> diff --git a/arch/arm/configs/netwinder_defconfig b/arch/arm/configs/netwinder_defconfig
> index 7ff70439458d..77d4a2b5916b 100644
> --- a/arch/arm/configs/netwinder_defconfig
> +++ b/arch/arm/configs/netwinder_defconfig
> @@ -1,10 +1,12 @@
>  CONFIG_SYSVIPC=y
>  CONFIG_LOG_BUF_SHIFT=14
> +CONFIG_EXPERT=y
>  CONFIG_ARCH_MULTI_V4=y
>  # CONFIG_ARCH_MULTI_V7 is not set
>  CONFIG_ARCH_FOOTBRIDGE=y
>  CONFIG_ARCH_NETWINDER=y
>  # CONFIG_AEABI is not set
> +CONFIG_ATAGS=y
>  CONFIG_DEPRECATED_PARAM_STRUCT=y
>  CONFIG_CMDLINE="root=0x801"
>  CONFIG_FPE_NWFPE=y
> diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
> index 8d11ba724204..fcbaaf37bc9b 100644
> --- a/arch/arm/configs/omap1_defconfig
> +++ b/arch/arm/configs/omap1_defconfig
> @@ -28,6 +28,7 @@ CONFIG_MACH_OMAP_PALMTE=y
>  CONFIG_MACH_SX1=y
>  CONFIG_MACH_NOKIA770=y
>  CONFIG_MACH_AMS_DELTA=y
> +CONFIG_ATAGS=y
>  CONFIG_CMDLINE="root=1f03 rootfstype=jffs2"
>  # CONFIG_SUSPEND is not set
>  CONFIG_PM=y
> diff --git a/arch/arm/configs/rpc_defconfig b/arch/arm/configs/rpc_defconfig
> index 8d73ec43cb41..edb52d56f679 100644
> --- a/arch/arm/configs/rpc_defconfig
> +++ b/arch/arm/configs/rpc_defconfig
> @@ -2,12 +2,14 @@
>  CONFIG_SYSVIPC=y
>  CONFIG_LOG_BUF_SHIFT=14
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_EXPERT=y
>  CONFIG_ARCH_MULTI_V4=y
>  # CONFIG_ARCH_MULTI_V7 is not set
>  CONFIG_ARCH_RPC=y
>  CONFIG_CPU_SA110=y
>  CONFIG_FPE_NWFPE=y
>  # CONFIG_AEABI is not set
> +CONFIG_ATAGS=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
>  CONFIG_PARTITION_ADVANCED=y
> diff --git a/arch/arm/configs/s3c6400_defconfig b/arch/arm/configs/s3c6400_defconfig
> index 7bf28a83946a..a0707707d960 100644
> --- a/arch/arm/configs/s3c6400_defconfig
> +++ b/arch/arm/configs/s3c6400_defconfig
> @@ -2,8 +2,10 @@ CONFIG_BLK_DEV_INITRD=y
>  CONFIG_KALLSYMS_ALL=y
>  CONFIG_ARCH_MULTI_V6=y
>  # CONFIG_ARCH_MULTI_V7 is not set
> +CONFIG_EXPERT=y
>  CONFIG_ARCH_S3C64XX=y
>  CONFIG_MACH_WLF_CRAGG_6410=y
> +CONFIG_ATAGS=y
>  CONFIG_CMDLINE="console=ttySAC0,115200 root=/dev/ram init=/linuxrc initrd=0x51000000,6M ramdisk_size=6144"
>  CONFIG_VFP=y
>  CONFIG_MODULES=y
> diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
> index bd7f0b5f7d66..1eafad9139f1 100644
> --- a/arch/arm/configs/sama5_defconfig
> +++ b/arch/arm/configs/sama5_defconfig
> @@ -13,7 +13,6 @@ CONFIG_SOC_SAMA5D3=y
>  CONFIG_SOC_SAMA5D4=y
>  # CONFIG_ATMEL_CLOCKSOURCE_PIT is not set
>  CONFIG_UACCESS_WITH_MEMCPY=y
> -# CONFIG_ATAGS is not set
>  CONFIG_CMDLINE="console=ttyS0,115200 initrd=0x21100000,25165824 root=/dev/ram0 rw"
>  CONFIG_VFP=y
>  CONFIG_NEON=y
> diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
> index cc7f6daf9fc7..4af87c57483d 100644
> --- a/arch/arm/configs/sama7_defconfig
> +++ b/arch/arm/configs/sama7_defconfig
> @@ -20,7 +20,6 @@ CONFIG_ATMEL_CLOCKSOURCE_TCB=y
>  # CONFIG_CPU_SW_DOMAIN_PAN is not set
>  CONFIG_ARCH_FORCE_MAX_ORDER=14
>  CONFIG_UACCESS_WITH_MEMCPY=y
> -# CONFIG_ATAGS is not set
>  CONFIG_CMDLINE="console=ttyS0,115200 earlyprintk ignore_loglevel"
>  CONFIG_CPU_FREQ=y
>  CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=y
> diff --git a/arch/arm/configs/spitz_defconfig b/arch/arm/configs/spitz_defconfig
> index d68a8f9cdad4..c7cf089001bf 100644
> --- a/arch/arm/configs/spitz_defconfig
> +++ b/arch/arm/configs/spitz_defconfig
> @@ -10,6 +10,7 @@ CONFIG_ARCH_PXA=y
>  CONFIG_PXA_SHARPSL=y
>  CONFIG_MACH_AKITA=y
>  CONFIG_MACH_BORZOI=y
> +CONFIG_ATAGS=y
>  CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 noinitrd root=/dev/mtdblock2 rootfstype=jffs2   debug"
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
> index 82190b155b14..bdf3bb9e03a8 100644
> --- a/arch/arm/configs/stm32_defconfig
> +++ b/arch/arm/configs/stm32_defconfig
> @@ -20,7 +20,8 @@ CONFIG_ARCH_STM32=y
>  CONFIG_CPU_V7M_NUM_IRQ=240
>  CONFIG_SET_MEM_PARAM=y
>  CONFIG_DRAM_BASE=0x90000000
> -# CONFIG_ATAGS is not set
> +CONFIG_FLASH_MEM_BASE=0x08000000
> +CONFIG_FLASH_SIZE=0x00200000
>  CONFIG_XIP_KERNEL=y
>  CONFIG_XIP_PHYS_ADDR=0x08008000
>  # CONFIG_SUSPEND is not set
> diff --git a/arch/arm/configs/wpcm450_defconfig b/arch/arm/configs/wpcm450_defconfig
> index 9cb379077d70..7512ec4292a0 100644
> --- a/arch/arm/configs/wpcm450_defconfig
> +++ b/arch/arm/configs/wpcm450_defconfig
> @@ -14,7 +14,6 @@ CONFIG_ARCH_NPCM=y
>  CONFIG_ARCH_WPCM450=y
>  CONFIG_CPU_DCACHE_WRITETHROUGH=y
>  CONFIG_UACCESS_WITH_MEMCPY=y
> -# CONFIG_ATAGS is not set
>  CONFIG_ARM_APPENDED_DTB=y
>  CONFIG_CPU_IDLE=y
>  CONFIG_KPROBES=y
> -- 
> 2.39.5
> 

