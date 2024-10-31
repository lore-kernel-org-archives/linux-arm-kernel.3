Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D2EE68958
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 07:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNBdPAsrnOmqWK0U0TBcMn9TQ3qUMjxBB0WNgwsZ1F4=; b=frsHLLp6wimTEx+ZqNPbgnSQUQ
	9qgmJfMB5h8HzijCkr0A391MavsUTAPTEsOhK2M74BnLZeK0S4uiXVgqu+K+ImQ9PSR2M8/TW+E/F
	fThLmAvJHPvgzEAQ5/yE4lDo5YFPT2iDcnTDa4UvvHqmE7gx7NQvlmztuowKbXOxijGIMpVSEZP2O
	GEHjro3uetv/+E4uMxgr8csL9MN1UCe6k0Y0QbZ6zr9wv2xhEafjFdXOCx47lXv/km11mlatfwxTx
	4ppfl4z0YZAXPIiC6a4OV8V/4zkrMxfiYWTPuVXoOnQkKOsRFpmvSy8/+PPewcQ3uxgWHRpfIbeg5
	Pr1h4SvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PwD-00000002r17-4BCx;
	Thu, 31 Oct 2024 07:49:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PuX-00000002qb6-3QFy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 07:48:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2A84EA43654;
	Thu, 31 Oct 2024 07:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2353C4CEC3;
	Thu, 31 Oct 2024 07:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730360884;
	bh=xVfQPG7c9kz2nTYeQBPjigzco5tjWo7NDZm98MMLSNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e+MBvecD+FNfmK+aw5GkA3e30OejL8ZM3OYiPmWZ3pF4mJM2HJLFHXDYDY4iBnYkg
	 LAH/qR22Ld4W1tqLKcw2/YPC2s1AVhElL4CjIyWaR1+52Fy/1zSoGGKs0ZxkyL8AAS
	 Uh7jWbyN0uy8BHEK7l1vFZNtw6Y2i0A5xj3qU6K0tuBuGHFpMv9NhsQelcsGmTv0ps
	 YdnI5t9aWT8NBrDs2FpVCVYUNcWGVPwhL8EMldtY9V8CcIK9w359aeL/nrQdh8GiRL
	 VepR8v0WqozJaxqKJTgG8gKW8MC1Pw3kF1tibaQoIx2MPGudNRRW/2Rk8IsfL/oIbN
	 jVtSa8QKKXY5g==
Date: Thu, 31 Oct 2024 08:48:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 03/10] clk: renesas: clk-vbattb: Add VBATTB clock
 driver
Message-ID: <mg2ugyg65ke3tngzqyyixfkawf4iop4o373dc6fosy7bfydbe5@pm43dhkd7asu>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
 <20241030110120.332802-4-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241030110120.332802-4-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_004806_003485_5384EAD7 
X-CRM114-Status: GOOD (  34.24  )
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

On Wed, Oct 30, 2024 at 01:01:13PM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that is used
> by the RTC. The input to the VBATTB could be a 32KHz crystal
> or an external clock device.
> 
> The HW block diagram for the clock generator is as follows:
> 
>            +----------+ XC   `\
> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>            | 32K clock|      |  |----->|gate|----------->
>            | osc      | XBYP |  |      +----+
> RTXOUT --->|          |----->| /
>            +----------+      ,
> 
> After discussions w/ Stephen Boyd the clock tree associated with this
> hardware block was exported in Linux as:
> 
> vbattb-xtal
>    xbyp
>    xc
>       mux
>          vbattbclk
> 
> where:
> - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
> - xc, xbyp are mux inputs
> - mux is the internal mux
> - vbattclk is the gate clock that feeds in the end the RTC
> 
> to allow selecting the input of the MUX though assigned-clock DT
> properties, using the already existing clock drivers and avoid adding
> other DT properties. If the crystal is connected on RTXIN,
> RTXOUT pins the XC will be selected as mux input. If an external clock
> device is connected on RTXIN, RTXOUT pins the XBYP will be selected as
> mux input.
> 
> The load capacitance of the internal crystal can be configured
> with renesas,vbattb-load-nanofarads DT property.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v5:
> - collected tags
> 
> Changes in v4:
> - dropped oscillator from patch description
> - s/on-board/internal in patch description
> - updated dt-binding included file name in the driver as it has been
>   renamed to include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
> - dropped the "_BIT" from driver macros
> - used "quartz-load-femtofarads" dt property instead of adding a new one
> - register the "vbattclk" as critical clock as this feeds the RTC counter
>   logic and it needs to stay on from the moment the RTC is configured;
>   along with it, added a comment to express this.
> 
> Changes in v3:
> - updated patch description
> - dropped dependency on MFD_RENESAS_VBATTB as now there is no
>   driver built under this flag
> - dropped include/clk.h
> - added pm_runtime and reset control support
> - updated register offsets
> - registered 4 clocks: xc, xbyp, mux, vbattclk using generic
>   clock drivers
> - added MODULE_DEVICE_TABLE()
> 
> Changes in v2:
> - updated patch description
> - added vendor name in Kconfig flag
> - used cleanup.h lock helpers
> - dropped the MFD code
> - updated registers offsets
> - added vbattb_clk_update_bits() and used it where possible
> - added vbattb_clk_need_bypass() to detect the bypass setup necessity
> - changed the compatible and driver names
> 
> 
>  drivers/clk/renesas/Kconfig      |   4 +
>  drivers/clk/renesas/Makefile     |   1 +
>  drivers/clk/renesas/clk-vbattb.c | 205 +++++++++++++++++++++++++++++++
>  3 files changed, 210 insertions(+)
>  create mode 100644 drivers/clk/renesas/clk-vbattb.c
> 
> diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
> index 76791a1c50ac..4e835a3f1ab4 100644
> --- a/drivers/clk/renesas/Kconfig
> +++ b/drivers/clk/renesas/Kconfig
> @@ -237,6 +237,10 @@ config CLK_RZV2H
>  	bool "RZ/V2H(P) family clock support" if COMPILE_TEST
>  	select RESET_CONTROLLER
>  
> +config CLK_RENESAS_VBATTB
> +	bool "Renesas VBATTB clock controller"

tristate

> +	select RESET_CONTROLLER
> +

...

> +
> +static const struct of_device_id vbattb_clk_match[] = {
> +	{ .compatible = "renesas,r9a08g045-vbattb" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, vbattb_clk_match);
> +
> +static struct platform_driver vbattb_clk_driver = {
> +	.driver		= {
> +		.name	= "renesas-vbattb-clk",
> +		.of_match_table = vbattb_clk_match,
> +	},
> +	.probe = vbattb_clk_probe,
> +};
> +module_platform_driver(vbattb_clk_driver);

That's a module, isn't it?

> +
> +MODULE_DESCRIPTION("Renesas VBATTB Clock Driver");
> +MODULE_AUTHOR("Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.39.2
> 

