Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F8FCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tFo5essobaEqsDYPH/x0r8jtOSnXE2VLtt1WA7iAnw=; b=BSDwtzIBR9/LOxpUnJhXL9dKj8
	jtKmnyGVdbQ0cRoilS9a3yq1nz8+BCLn/BLXTJxbOwcJ3fWQtMI9kzQ9OK7fG+oew53XQ6sFFr5CI
	QJ2zKDnBr3KfhdgFmm++LORKq31WE2oMThtFXGZJbxRDAPETc7pudgTAYaBH4aEsZ4BYWZj9sGZ0y
	hYNjL9RdiyC+bpMpHhFLRRiw2uI6H+ZYctl4Noxj8BuV/CH94B6F9GPTEKjJarLYE5Y7PkGqejJ6Z
	w0tHs/dRFWRpVtJLMFYliQ2txhfTdfJLW+B3AAfJpZFenX8g8fq1YWsSmBxOdbFCvbWkQ3rvJ5cvH
	8Q8kXYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkds-00000004SG0-3PZv;
	Sat, 23 Aug 2025 09:34:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRqA-00000002d9u-0Sny
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1755869398; x=1787405398;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JmipXnXVqs0bo7rBOQEowa8CcQd7VSNge6eEHRVSm0g=;
  b=CoN1EBNRuApjOIBGwSTCqkl0wNtrGw5KGLH8BQQhSyf7HzfoA13gq6Bq
   3qvKZR4tJAl0/24VteAr6ZVutVUDi62aYUiOfD/MmRnfA8yqGTX7IKPrx
   LXXZoVMra8Rc4papdCtciEOdx1RpfOGvgQdgfyty3LCfnexTlyX6ZT5Uv
   d67Z3HJDSNRHU96bl/lhDyYocJ2QzrPVQCNstHiXo0+X9o13UWBiUUKpT
   SnVPiqinPAPWD0c8ibXWjuu2eAsUf38ykGjmIRz4+abD3RTcIH1pZloxr
   NWiQITEk+GyYO0gylzJL91Je+MZ/hb1MkjMcLZdDJL+2SCApMnqdsY8Ok
   Q==;
X-CSE-ConnectionGUID: dttGCdfnRrSwT0WQldL3yA==
X-CSE-MsgGUID: AeSCvjSPQYS0LsPuRv0RiQ==
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="276925274"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Aug 2025 06:29:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 22 Aug 2025 06:29:25 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 22 Aug 2025 06:29:21 -0700
Message-ID: <76b1062f-a4e3-4392-9549-86d63616a5ca@microchip.com>
Date: Fri, 22 Aug 2025 15:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/9] arm64: Add config for Microchip SoC platforms
To: Robert Marko <robert.marko@sartura.hr>, <linux@armlinux.org.uk>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <olivia@selenic.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<andi.shyti@kernel.org>, <lee@kernel.org>, <broonie@kernel.org>,
	<gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <arnd@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<o.rempel@pengutronix.de>, <daniel.machon@microchip.com>
CC: <luka.perkov@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-2-robert.marko@sartura.hr>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250813174720.540015-2-robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_062958_271885_7DFF98A1 
X-CRM114-Status: GOOD (  18.08  )
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

On 13/08/2025 at 19:44, Robert Marko wrote:
> Currently, Microchip SparX-5 SoC is supported and it has its own symbol.
> 
> However, this means that new Microchip platforms that share drivers need
> to constantly keep updating depends on various drivers.
> 
> So, to try and reduce this lets add ARCH_MICROCHIP symbol that drivers
> could instead depend on.
> 
> LAN969x is being worked on and it will be added under ARCH_MICROCHIP.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Ok, according to the compromise that we discussed during v8 that's fine 
with me:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Robert! Regards,
   Nicolas

> ---
> Changes in v9:
> * Make ARCH_MICROCHIP hidden symbol that is selected by SparX-5 directly,
> this avoids breaking existing configs with ARCH_SPARX5
> 
>   arch/arm64/Kconfig.platforms | 36 ++++++++++++++++++++++--------------
>   1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index a88f5ad9328c..bfea380100a6 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -131,20 +131,6 @@ config ARCH_EXYNOS
>          help
>            This enables support for ARMv8 based Samsung Exynos SoC family.
> 
> -config ARCH_SPARX5
> -       bool "Microchip Sparx5 SoC family"
> -       select PINCTRL
> -       select DW_APB_TIMER_OF
> -       help
> -         This enables support for the Microchip Sparx5 ARMv8-based
> -         SoC family of TSN-capable gigabit switches.
> -
> -         The SparX-5 Ethernet switch family provides a rich set of
> -         switching features such as advanced TCAM-based VLAN and QoS
> -         processing enabling delivery of differentiated services, and
> -         security through TCAM-based frame processing using versatile
> -         content aware processor (VCAP).
> -
>   config ARCH_K3
>          bool "Texas Instruments Inc. K3 multicore SoC architecture"
>          select SOC_TI
> @@ -186,6 +172,28 @@ config ARCH_MESON
>            This enables support for the arm64 based Amlogic SoCs
>            such as the s905, S905X/D, S912, A113X/D or S905X/D2
> 
> +menu "Microchip SoC support"
> +
> +config ARCH_MICROCHIP
> +       bool
> +
> +config ARCH_SPARX5
> +       bool "Microchip Sparx5 SoC family"
> +       select PINCTRL
> +       select DW_APB_TIMER_OF
> +       select ARCH_MICROCHIP
> +       help
> +         This enables support for the Microchip Sparx5 ARMv8-based
> +         SoC family of TSN-capable gigabit switches.
> +
> +         The SparX-5 Ethernet switch family provides a rich set of
> +         switching features such as advanced TCAM-based VLAN and QoS
> +         processing enabling delivery of differentiated services, and
> +         security through TCAM-based frame processing using versatile
> +         content aware processor (VCAP).
> +
> +endmenu
> +
>   config ARCH_MMP
>          bool "Marvell MMP SoC Family"
>          select PINCTRL
> --
> 2.50.1
> 


