Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA20EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 13:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a16tm2NhiTne+1lXjXJlhQ7Tf5Powst6myZXNs7qA7E=; b=uBO1H0i5toVT5Mw06v1YieXpXI
	5JfiL/7bWHT199RhIEbJ1Xs71uwILF65GhbENdwrOktlxaOLOByiH8j3gt5/c45nNA69xD1s0LkRf
	FMlIVaB9tBk3gbr84EXgQAzxjFplf+hdDR0KjtH2Xhb1doliLbgzdX5QdrbAq9FUmya1LRFqAFX6e
	RDe53UYXa8qOijmQVSMsdLm/L6QJXDACaGSjAFW+kvTIUk6nd0MGmF7C62XH3yzscrpZ+KLsWyFaV
	Ec5IC05J5jpjf9Dg8MocqczxwewHJMnkWvkAbCvoPhCLHiscgJINhZ14Ymcymxp6lxW8i7vs+x7pe
	achYOtCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHas-00000004XRg-1YFY;
	Thu, 02 Jul 2026 13:36:42 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHap-00000004XRH-2OrZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 13:36:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DC3671A0DDF;
	Thu,  2 Jul 2026 13:36:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A291A5FF03;
	Thu,  2 Jul 2026 13:36:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39A7B104C956E;
	Thu,  2 Jul 2026 15:36:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782999396; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=a16tm2NhiTne+1lXjXJlhQ7Tf5Powst6myZXNs7qA7E=;
	b=fdnvvopWgqbtWtEz8WhUMnX3zY5v2cAFM43T83AQuwA64vNtGODqt4NZPDIvSsuUlkeSme
	SanI3IYyxCzw0kC/TyM5ohh6qYWQYiQUN0BAI+0nURDJRIjbvmSzh75so1xY2pjXim31jP
	vgEOZmHmT2RaRs9rDytbXenO1xnkwu/Y8VQxufMEN+XwzWBnlXwwv2hux2sdU1BRBwK6DY
	KzSOF9729sQLYwBw4kLGd2kA0md4BbmxEmFtYf2vnXaYpfwKdWhTbGIFezLqW6MCMjBRKz
	caA8LVxvEO1adRsqqEsV6ChzIkz6/9As0UGIEOzAIGEAtePElPtFH8Uz7inO3w==
Date: Thu, 2 Jul 2026 15:36:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
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
Subject: Re: [PATCH v2 02/19] ARM: limit OABI support to StrongARM CPUs
Message-ID: <20260702133626d12c29ad@mail.local>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701212353.2196041-3-arnd@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_063639_754525_8263E18C 
X-CRM114-Status: GOOD (  37.93  )
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

On 01/07/2026 23:23:36+0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As discussed on the mailing lists, there is no way to build OABI userspace
> binaries any more since gcc-4.8, and now support is also getting dropped in
> binutils, which will make it impossible to build pure OABI kernels at some
> point in the future.
> 
> I found no evidence of anyone still sing OABI userspace on embedded systems
> that keep getting kernel updates, but there are a few desktop-class machines
> that date back to the 1990s using Intel StrongARM processors that were
> supported by old versions of Debian, Red Hat or the official Corel
> Netwinder distribution.
> 
> Add a much stricter Kconfig dependency for both native OABI and OABI_COMPAT
> enabled kernels, only allowing either of them to be selected when building
> a kernel that targets a StrongARM based machine.
> 
> Link: https://lore.kernel.org/lkml/2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com/
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/Kconfig                       | 14 +++++++-------
>  arch/arm/configs/am200epdkit_defconfig |  1 -
>  arch/arm/configs/axm55xx_defconfig     |  1 -
>  arch/arm/configs/footbridge_defconfig  |  2 +-
>  arch/arm/configs/neponset_defconfig    |  2 +-
>  arch/arm/configs/versatile_defconfig   |  1 -
>  6 files changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index ccc0114d30de..3b2316dc9d13 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1151,8 +1151,7 @@ config ARM_PATCH_IDIV
>  	  code to do integer division.
>  
>  config AEABI
> -	bool "Use the ARM EABI to compile the kernel" if !CPU_V7 && \
> -		!CPU_V7M && !CPU_V6 && !CPU_V6K && !CC_IS_CLANG
> +	bool "Use the ARM EABI to compile the kernel" if CPU_SA110 || CPU_SA1100
>  	default y
>  	help
>  	  The Arm EABI is the default ABI on all modern Linux
> @@ -1162,9 +1161,13 @@ config AEABI
>  	  Everyone should enable this, as support for OABI user space
>  	  was dropped in gcc-4.8 and most distributions after ca. 2013.
>  
> +	  Support for OABI mode will be removed from the kernel
> +	  once Intel StrongARM CPUs are phased out.
> +
>  config OABI_COMPAT
>  	bool "Allow old ABI binaries to run with this kernel (EXPERIMENTAL)"
>  	depends on AEABI && !THUMB2_KERNEL
> +	depends on CPU_SA110 || CPU_SA1100
>  	help
>  	  This option preserves the old syscall interface along with the
>  	  new (ARM EABI) one. It also provides a compatibility layer to
> @@ -1177,11 +1180,8 @@ config OABI_COMPAT
>  	  selected, since there is no way yet to sensibly distinguish
>  	  between calling conventions during filtering.
>  
> -	  If you know you'll be using only pure EABI user space then you
> -	  can say N here. If this option is not selected and you attempt
> -	  to execute a legacy ABI binary then the result will be
> -	  UNPREDICTABLE (in fact it can be predicted that it won't work
> -	  at all). If in doubt say N.
> +	  Support for OABI_COMPAT will be removed from the kernel
> +	  once Intel StrongARM CPUs are phased out.
>  
>  config ARCH_SELECT_MEMORY_MODEL
>  	def_bool y
> diff --git a/arch/arm/configs/am200epdkit_defconfig b/arch/arm/configs/am200epdkit_defconfig
> index b3f81237c6e1..d4745b0f3dcb 100644
> --- a/arch/arm/configs/am200epdkit_defconfig
> +++ b/arch/arm/configs/am200epdkit_defconfig
> @@ -7,7 +7,6 @@ CONFIG_EXPERT=y
>  # CONFIG_ARCH_MULTI_V7 is not set
>  CONFIG_ARCH_PXA=y
>  CONFIG_ARCH_GUMSTIX=y
> -# CONFIG_OABI_COMPAT is not set
>  CONFIG_CMDLINE="console=ttyS0,115200n8 root=1f01 rootfstype=jffs2"
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> diff --git a/arch/arm/configs/axm55xx_defconfig b/arch/arm/configs/axm55xx_defconfig
> index 12c59a4ee504..541e38e2205b 100644
> --- a/arch/arm/configs/axm55xx_defconfig
> +++ b/arch/arm/configs/axm55xx_defconfig
> @@ -38,7 +38,6 @@ CONFIG_PCIE_AXXIA=y
>  CONFIG_SMP=y
>  CONFIG_NR_CPUS=16
>  CONFIG_HOTPLUG_CPU=y
> -CONFIG_OABI_COMPAT=y
>  CONFIG_HIGHMEM=y
>  CONFIG_ARM_APPENDED_DTB=y
>  CONFIG_ARM_ATAG_DTB_COMPAT=y
> diff --git a/arch/arm/configs/footbridge_defconfig b/arch/arm/configs/footbridge_defconfig
> index 589b7b1df8c6..e8bf9847d35d 100644
> --- a/arch/arm/configs/footbridge_defconfig
> +++ b/arch/arm/configs/footbridge_defconfig
> @@ -9,9 +9,9 @@ CONFIG_ARCH_MULTI_V4=y
>  CONFIG_ARCH_FOOTBRIDGE=y
>  CONFIG_ARCH_EBSA285_HOST=y
>  CONFIG_ARCH_NETWINDER=y
> +# CONFIG_AEABI is not set
>  CONFIG_FPE_NWFPE=y
>  CONFIG_FPE_NWFPE_XP=y
> -# CONFIG_AEABI is not set

I'm not objecting to the change this reordering is not directly related
to the current patch, maybe this should be squashed in 1/19

>  CONFIG_MODULES=y
>  CONFIG_PARTITION_ADVANCED=y
>  CONFIG_ACORN_PARTITION=y
> diff --git a/arch/arm/configs/neponset_defconfig b/arch/arm/configs/neponset_defconfig
> index c3010a4d93a8..16f0afd770c1 100644
> --- a/arch/arm/configs/neponset_defconfig
> +++ b/arch/arm/configs/neponset_defconfig
> @@ -6,12 +6,12 @@ CONFIG_ARCH_MULTI_V4=y
>  CONFIG_ARCH_SA1100=y
>  CONFIG_SA1100_ASSABET=y
>  CONFIG_ASSABET_NEPONSET=y
> +# CONFIG_AEABI is not set
>  CONFIG_ZBOOT_ROM_TEXT=0x80000
>  CONFIG_ZBOOT_ROM_BSS=0xc1000000
>  CONFIG_ZBOOT_ROM=y
>  CONFIG_CMDLINE="console=ttySA0,38400n8 cpufreq=221200 rw root=/dev/mtdblock2 mtdparts=sa1100:512K(boot),1M(kernel),2560K(initrd),4M(root) mem=32M noinitrd initrd=0xc0800000,3M"
>  CONFIG_FPE_NWFPE=y
> -# CONFIG_AEABI is not set

Ditto

>  CONFIG_PM=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> diff --git a/arch/arm/configs/versatile_defconfig b/arch/arm/configs/versatile_defconfig
> index 8e89debb5a5b..bb9eb9ccbbde 100644
> --- a/arch/arm/configs/versatile_defconfig
> +++ b/arch/arm/configs/versatile_defconfig
> @@ -6,7 +6,6 @@ CONFIG_LOG_BUF_SHIFT=14
>  CONFIG_BLK_DEV_INITRD=y
>  # CONFIG_ARCH_MULTI_V7 is not set
>  CONFIG_ARCH_VERSATILE=y
> -CONFIG_OABI_COMPAT=y
>  CONFIG_CMDLINE="root=1f03 mem=32M"
>  CONFIG_FPE_NWFPE=y
>  CONFIG_VFP=y
> -- 
> 2.39.5
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

