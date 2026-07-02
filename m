Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA46C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 07:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYh7q6RSbKWcDRMKWi9zI46wMwDgypJxkkElAWaOFcU=; b=ny6IZr745SAYCtRDDR6vo89JDM
	1PcaqPlw4WKE9qTx6YxzgPLSW41d9c1HBsm71PEfRQjFXQz4K8Yn53XW62qOlS7SXD/a2i685ChV6
	pFUk/z5sY/dTzfa3lEPGOQMFNeSd+2ViXaZ7tu6G0h9YnuJvdv9vQ/p1Bf2Or1oSYoz/BPtMGQcxn
	kM9AKE5QhbHTOyUe9nNvDLXUh0FS0eTlW7H5IebbmF6CW8tfosYxiQEh+rnDwNzU66uhIWvfxLZWa
	zzjI53Ue8lNiU9R/XDKySxQIB68+LB93EcFhaYP7Ff+Yx0uI2gTq4WXB1ICRJAXou1TUp9Hja+U0I
	6zQqRhZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfC4R-00000003lGl-2N0M;
	Thu, 02 Jul 2026 07:42:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfC4P-00000003lGR-13Wt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 07:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782978170; x=1814514170;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Q16L4lQS2Tr+VdpWyy/ghPTBgiRV6OAWgVssS8yE+2M=;
  b=FYPh5O5q25MGe5tCZBr0DedkntgDp5jS4BEMbRD7W66EgGLmOkdn1+OR
   KwV1+I8My3Y4Y233cNcobXzFs1oC2LffWsegZo5hzyyeGZgZBz3MxA0by
   8Kpnn5wJQe2XPbHZU66UAybDAsjkoUwONQr/quQF4Iw3dWDfdfedhujhH
   n6M5bbl1V3fE4M3o8Xrx0ZyldZou8bXMwB4NC9sIug2Vo/2LwFtrfxv6T
   /l1eC8IQciiEfOFhrXl0dAtWeVOB8CDpBRsZUFeVdkX7WO1rnkD/OMKdC
   BWTwTDs5q+izmupy4Cw+flmmR6ee5Ji9cnx6AEC/oiJ9iTHdp4AtvZMNk
   A==;
X-CSE-ConnectionGUID: TRnAy3d8RJuqTtqUi4UcQQ==
X-CSE-MsgGUID: f491JbzFQ5GN0S892OKiug==
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="291394538"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 00:42:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.43; Thu, 2 Jul 2026 00:42:47 -0700
Received: from [10.171.248.30] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 2 Jul 2026 00:42:38 -0700
Message-ID: <d48d79ad-6a30-4a86-8895-17d4e4fa2940@microchip.com>
Date: Thu, 2 Jul 2026 09:42:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/19] ARM: use CONFIG_AEABI by default everywhere
To: Arnd Bergmann <arnd@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<soc@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin
	<alexander.sverdlin@siemens.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, Ard Biesheuvel
	<ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Mack
	<daniel@zonque.org>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, Frank Li
	<Frank.Li@nxp.com>, Gregory Clement <gregory.clement@bootlin.com>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, "Jeremy J. Peper"
	<jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, Mike Rapoport
	<rppt@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, Ralph
 Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner
	<stefan@agner.ch>, Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren
	<tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, Will Deacon
	<will@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-2-arnd@kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20260701212353.2196041-2-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_004249_301787_A7D2FA67 
X-CRM114-Status: GOOD (  20.81  )
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

On 01/07/2026 at 23:23, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> On ARMv4 and ARMv5, the default is still to build for OABI, with
> CONFIG_AEABI disabled, even though distros and toolchains no longer
> support OABI as a target.
> 
> Change the default to EABI for all architecture levels and change
> the defconfig entries as follows:
> 
>   - All machines that used to explicitly enable EABI can drop that line now
>   - Machines that are likely to actually use old distros and had NWFPE
>     enabled in combination with OABI (rpc, footrbridge, netwinder,
>     assabet, neponset) explicitly turn it on now.
>   - Machines that already had both EABI and NWFPE disabled in defconfig
>     (at91_dt, collie, ep93xx, gemini, h3600, imx_v4_v5, integrator, jornada,

For at91_dt, EABI was explicitly enabled (see below)...

>     moxart, multi_v4t, omap1) were likely not usable with either OABI or
>     EABI and now use EABI instead implicitly, making it more likely that
>     they could work.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/arm/Kconfig                        | 15 ++++++---------
>   arch/arm/configs/am200epdkit_defconfig  |  1 -
>   arch/arm/configs/aspeed_g4_defconfig    |  1 -
>   arch/arm/configs/assabet_defconfig      |  1 +
>   arch/arm/configs/at91_dt_defconfig      |  1 -

[..]

> diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
> index e331242dece7..320eb27a6a2e 100644
> --- a/arch/arm/configs/at91_dt_defconfig
> +++ b/arch/arm/configs/at91_dt_defconfig
> @@ -18,7 +18,6 @@ CONFIG_SOC_AT91SAM9=y
>   CONFIG_SOC_SAM9X60=y
>   CONFIG_SOC_SAM9X7=y
>   # CONFIG_ATMEL_CLOCKSOURCE_PIT is not set
> -CONFIG_AEABI=y
>   CONFIG_UACCESS_WITH_MEMCPY=y
>   # CONFIG_ATAGS is not set
>   CONFIG_ARM_APPENDED_DTB=y

As AEABI is by default to y:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

[..]

Thanks, best regards,
   Nicolas


