Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D808D12D55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 12:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIRFJPwP0f15vft5vgumWwaPC5ZJED/YEB3QGW0Pmdc=; b=xgbXx4aFeSW39ZdRIpOXXVauKp
	bARnuonvFZLhYSZdHgG4j8cRN2CnsDedNQKS/PGS08caKeULfUC1ijT9d4MefynStEUeeFbh6Kfj1
	raqUR0LEi9bI8YQXW5SEFHlOUK+16VJCLUxRWhDoc/hCOyIKfgaqlUwQgOgHWDvN9ExmgFqHVPkDW
	dDNQ3iplaTvwDhHBph1Jg6QoGGL9tzvz1OAmYDMCWR1ZqrXr7zMIPcgvT0abyPV6oe0leKLqXDBow
	Oz16ze6FqphDjrs996k7A+KHTCTsNiHLS6bmO8n45BqIQLwZ3OvtHhYac1+pElrE+l3hHe6LI/zmL
	rt4lIlFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlm6-00000006Xxs-3SA9;
	Wed, 03 Dec 2025 12:16:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlm4-00000006XxR-0q8P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 12:16:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB4E1408F6;
	Wed,  3 Dec 2025 12:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D009C4CEFB;
	Wed,  3 Dec 2025 12:15:55 +0000 (UTC)
Message-ID: <bd25e903-30fc-4905-986c-96d1b42e9f02@linux-m68k.org>
Date: Wed, 3 Dec 2025 22:15:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] m68k: coldfire: Add RNG support for MCF54418
To: jeanmichel.hautbois@yoseli.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
References: <20251126-b4-m5441x-add-rng-support-v4-0-5309548c9555@yoseli.org>
 <20251126-b4-m5441x-add-rng-support-v4-2-5309548c9555@yoseli.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20251126-b4-m5441x-add-rng-support-v4-2-5309548c9555@yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_041600_307946_EC7C6CAF 
X-CRM114-Status: GOOD (  30.34  )
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

Hi Jean-Michel,

On 26/11/25 17:08, Jean-Michel Hautbois via B4 Relay wrote:
> From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> 
> Add support for the hardware Random Number Generator (RNGB) found on
> MCF54418 ColdFire processors with clock enabled at platform
> initialization.
> 
> The RNGB block is compatible with the imx-rngc driver.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>   arch/m68k/coldfire/device.c       | 28 ++++++++++++++++++++++++++++
>   arch/m68k/coldfire/m5441x.c       |  2 +-
>   arch/m68k/include/asm/m5441xsim.h |  9 +++++++++
>   drivers/char/hw_random/Kconfig    |  3 ++-
>   drivers/char/hw_random/imx-rngc.c |  7 +++++++
>   5 files changed, 47 insertions(+), 2 deletions(-)

I am happy with the ColdFire arch parts, so from me:

     Acked-by: Greg Ungerer <gerg@linux-m68k.org>

I don't mind taking this commit via the m68knommu git tree if the hw_rng
maintainers are ok with that. Otherwise if you break out the arch/m68k
parts I can apply those on their own.

Regards
Greg



> diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
> index b6958ec2a220..9d8f844e319a 100644
> --- a/arch/m68k/coldfire/device.c
> +++ b/arch/m68k/coldfire/device.c
> @@ -622,6 +622,31 @@ static struct platform_device mcf_flexcan0 = {
>   };
>   #endif /* MCFFLEXCAN_SIZE */
>   
> +#ifdef MCF_RNG_BASE
> +/*
> + * Random Number Generator (RNG) - only on MCF54418
> + */
> +static struct resource mcf_rng_resource[] = {
> +	{
> +		.start = MCF_RNG_BASE,
> +		.end   = MCF_RNG_BASE + MCF_RNG_SIZE - 1,
> +		.flags = IORESOURCE_MEM,
> +	},
> +	{
> +		.start = MCF_IRQ_RNG,
> +		.end   = MCF_IRQ_RNG,
> +		.flags = IORESOURCE_IRQ,
> +	},
> +};
> +
> +static struct platform_device mcf_rng = {
> +	.name           = "imx-rngc",
> +	.id             = -1,
> +	.num_resources  = ARRAY_SIZE(mcf_rng_resource),
> +	.resource       = mcf_rng_resource,
> +};
> +#endif /* MCF_RNG_BASE */
> +
>   static struct platform_device *mcf_devices[] __initdata = {
>   	&mcf_uart,
>   #ifdef MCFFEC_BASE0
> @@ -660,6 +685,9 @@ static struct platform_device *mcf_devices[] __initdata = {
>   #ifdef MCFFLEXCAN_SIZE
>   	&mcf_flexcan0,
>   #endif
> +#ifdef MCF_RNG_BASE
> +	&mcf_rng,
> +#endif
>   };
>   
>   /*
> diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> index 7a25cfc7ac07..ab5b00637237 100644
> --- a/arch/m68k/coldfire/m5441x.c
> +++ b/arch/m68k/coldfire/m5441x.c
> @@ -158,6 +158,7 @@ static struct clk * const enable_clks[] __initconst = {
>   	&__clk_0_33, /* pit.1 */
>   	&__clk_0_37, /* eport */
>   	&__clk_0_48, /* pll */
> +	&__clk_0_49, /* rng */
>   	&__clk_0_51, /* esdhc */
>   
>   	&__clk_1_36, /* CCM/reset module/Power management */
> @@ -179,7 +180,6 @@ static struct clk * const disable_clks[] __initconst = {
>   	&__clk_0_44, /* usb otg */
>   	&__clk_0_45, /* usb host */
>   	&__clk_0_47, /* ssi.0 */
> -	&__clk_0_49, /* rng */
>   	&__clk_0_50, /* ssi.1 */
>   	&__clk_0_53, /* enet-fec */
>   	&__clk_0_54, /* enet-fec */
> diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
> index f48cf63bd782..dd64cdfcad3e 100644
> --- a/arch/m68k/include/asm/m5441xsim.h
> +++ b/arch/m68k/include/asm/m5441xsim.h
> @@ -198,6 +198,15 @@
>   #define MCFRTC_SIZE		(0xfc0a8840 - 0xfc0a8000)
>   #define MCF_IRQ_RTC		(MCFINT2_VECBASE + MCFINT2_RTC)
>   
> +/*
> + *  Random Number Generator (RNG) Module.
> + *  Note: Only present in MCF54418, not in MCF54410/54415/54417
> + */
> +#define MCF_RNG_BASE		0xfc0c4000
> +#define MCF_RNG_SIZE		0x1c
> +#define MCFINT2_RNG		28
> +#define MCF_IRQ_RNG		(MCFINT2_VECBASE + MCFINT2_RNG)
> +
>   /*
>    *  GPIO Module.
>    */
> diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
> index 492a2a61a65b..2f301e43db84 100644
> --- a/drivers/char/hw_random/Kconfig
> +++ b/drivers/char/hw_random/Kconfig
> @@ -270,12 +270,13 @@ config HW_RANDOM_MXC_RNGA
>   config HW_RANDOM_IMX_RNGC
>   	tristate "Freescale i.MX RNGC Random Number Generator"
>   	depends on HAS_IOMEM
> -	depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SLL || SOC_IMX6UL || COMPILE_TEST
> +	depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SLL || SOC_IMX6UL || COLDFIRE || COMPILE_TEST
>   	default HW_RANDOM
>   	help
>   	  This driver provides kernel-side support for the Random Number
>   	  Generator Version C hardware found on some Freescale i.MX
>   	  processors. Version B is also supported by this driver.
> +	  Also supports RNGB on Freescale MCF54418 (Coldfire V4e).
>   
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called imx-rngc.
> diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
> index d6a847e48339..44f20a05de0a 100644
> --- a/drivers/char/hw_random/imx-rngc.c
> +++ b/drivers/char/hw_random/imx-rngc.c
> @@ -353,12 +353,19 @@ static const struct of_device_id imx_rngc_dt_ids[] = {
>   };
>   MODULE_DEVICE_TABLE(of, imx_rngc_dt_ids);
>   
> +static const struct platform_device_id imx_rngc_devtype[] = {
> +	{ .name = "imx-rngc" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(platform, imx_rngc_devtype);
> +
>   static struct platform_driver imx_rngc_driver = {
>   	.driver = {
>   		.name = KBUILD_MODNAME,
>   		.pm = pm_ptr(&imx_rngc_pm_ops),
>   		.of_match_table = imx_rngc_dt_ids,
>   	},
> +	.id_table = imx_rngc_devtype,
>   };
>   
>   module_platform_driver_probe(imx_rngc_driver, imx_rngc_probe);
> 


