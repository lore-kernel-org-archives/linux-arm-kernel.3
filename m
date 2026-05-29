Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154E9CD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUWeaNsfFgJU6Qp2lS9wdzvNAu5L3srRKzUtR510ldk=; b=AeolaCwhXFqLTg00PhR1e4sikP
	sLaY4GswzD31wGGNiYrJoEx/ymZq7Z6HiwaLefiD/ZkLNXm8Hr4nyTgCA2blozotZM13DhcEVgmsy
	HABRThTv0+vzTmLGSq4ZYM/M8GMZx+dDYkT3ybI2Sk47zBCFfCFhnhxznmc3OkE41/GvvadVjfdhV
	c2e6nAXF8bC62v+bNiNJ24zayU6akOMnZn8TijxP9PM18Q3lYwXbIM0dj9WUUP5e8U7aBR1l3tSnO
	lilBHL81wl2zMxdOqJfSkusLH4UfdkNvKvrRk9OssIHzY/JfH3Cg/LXgVM6Xofi0Hel7mDWsGA0mp
	YX32NH0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSykw-00000007d7x-2vgS;
	Fri, 29 May 2026 15:04:14 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSykt-00000007d5T-3oLQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:04:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2A604C62461;
	Fri, 29 May 2026 15:04:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68007601FA;
	Fri, 29 May 2026 15:04:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8289D10888CC2;
	Fri, 29 May 2026 17:04:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780067045; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fUWeaNsfFgJU6Qp2lS9wdzvNAu5L3srRKzUtR510ldk=;
	b=mgf3otVKPRUXFhpVnJ78Lp60lbpvE9XKk2jjeYH47r8V1MgE6/2/7CGUwnSZ5BbjM+ec2Q
	1a3MmW+WvM1X6MXUISKX9VbbPMOs3VTpwQ3yJkE0chnFTQ5lj3iga19mOl4E1U1/e5m9Gl
	ZwCPvE730Kp70jTlHWR7C1sEtlK+dPMUU6vAtQo5/7c4qqAA740HQ7UvGplbHoi6r5jcIK
	Wm3zdae3yU81FhvS2OMJN3OVOJ4lWi5OUe0AO5kzftu9S1HhwvzTJQHt0C6eer/PiJefBw
	BcM0i1ONwLzaJVERSNfcgPZbkcwrdXXHXv03nAJdIW9iUAEI5/xljJhlfnbs4g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>, soc@lists.linux.dev, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik
 <robert.jarzmik@free.fr>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: select legacy gpiolib interfaces where used
In-Reply-To: <20260428162757.540823-1-arnd@kernel.org>
References: <20260428162757.540823-1-arnd@kernel.org>
Date: Fri, 29 May 2026 17:04:00 +0200
Message-ID: <87h5nq1cm7.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_080412_104083_C1441442 
X-CRM114-Status: GOOD (  13.55  )
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

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> A few old machines have not been converted away from the old-style
> gpiolib interfaces. Make these select the new CONFIG_GPIOLIB_LEGACY
> symbol so the code still works where it is needed but can be left
> out otherwise.
>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

for mv78xx0 and orion5x

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory
> ---
>  arch/arm/mach-mv78xx0/Kconfig     | 1 +
>  arch/arm/mach-orion5x/Kconfig     | 1 +
>  arch/arm/mach-pxa/Kconfig         | 1 +
>  arch/arm/mach-s3c/Kconfig.s3c64xx | 1 +
>  arch/arm/mach-sa1100/Kconfig      | 1 +
>  5 files changed, 5 insertions(+)
>
> diff --git a/arch/arm/mach-mv78xx0/Kconfig b/arch/arm/mach-mv78xx0/Kconfig
> index 9de3bbc09c3a..670e6587827e 100644
> --- a/arch/arm/mach-mv78xx0/Kconfig
> +++ b/arch/arm/mach-mv78xx0/Kconfig
> @@ -6,6 +6,7 @@ menuconfig ARCH_MV78XX0
>  	depends on ATAGS
>  	select CPU_FEROCEON
>  	select GPIOLIB
> +	select GPIOLIB_LEGACY
>  	select MVEBU_MBUS
>  	select FORCE_PCI
>  	select PLAT_ORION_LEGACY
> diff --git a/arch/arm/mach-orion5x/Kconfig b/arch/arm/mach-orion5x/Kconfig
> index ee449ca032d2..cef19bea6164 100644
> --- a/arch/arm/mach-orion5x/Kconfig
> +++ b/arch/arm/mach-orion5x/Kconfig
> @@ -5,6 +5,7 @@ menuconfig ARCH_ORION5X
>  	depends on CPU_LITTLE_ENDIAN
>  	select CPU_FEROCEON
>  	select GPIOLIB
> +	select GPIOLIB_LEGACY
>  	select MVEBU_MBUS
>  	select FORCE_PCI
>  	select PCI_QUIRKS
> diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
> index 10e472f4fa43..66e26990e2c8 100644
> --- a/arch/arm/mach-pxa/Kconfig
> +++ b/arch/arm/mach-pxa/Kconfig
> @@ -10,6 +10,7 @@ menuconfig ARCH_PXA
>  	select CPU_XSCALE if !CPU_XSC3
>  	select GPIO_PXA
>  	select GPIOLIB
> +	select GPIOLIB_LEGACY
>  	select PLAT_PXA
>  	help
>  	  Support for Intel/Marvell's PXA2xx/PXA3xx processor line.
> diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfi=
g.s3c64xx
> index 8f40af063ad6..3f97fba8e4f5 100644
> --- a/arch/arm/mach-s3c/Kconfig.s3c64xx
> +++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
> @@ -101,6 +101,7 @@ config MACH_WLF_CRAGG_6410
>  	depends on ATAGS
>  	depends on I2C=3Dy
>  	select CPU_S3C6410
> +	select GPIOLIB_LEGACY
>  	select LEDS_GPIO_REGISTER
>  	select S3C64XX_DEV_SPI0
>  	select S3C64XX_SETUP_FB_24BPP
> diff --git a/arch/arm/mach-sa1100/Kconfig b/arch/arm/mach-sa1100/Kconfig
> index 0fb4c24cfad5..e23700e0d6c8 100644
> --- a/arch/arm/mach-sa1100/Kconfig
> +++ b/arch/arm/mach-sa1100/Kconfig
> @@ -13,6 +13,7 @@ menuconfig ARCH_SA1100
>  	select CPU_FREQ
>  	select CPU_SA1100
>  	select GPIOLIB
> +	select GPIOLIB_LEGACY
>  	select IRQ_DOMAIN
>  	select ISA
>  	select NEED_MACH_MEMORY_H
> --=20
> 2.39.5
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

