Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F53E909CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 15:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LruKeKC/fjXUvPTkIKWNFl+D4Tx0aomCO5Ia46BFijA=; b=T2Y4T7yhUl1lNKIzRwE863ZNf3
	PSpEvCR1h9k/sqdfLB6rdUdCDX+cJ1lXZfcf9+Guz7CoKC7Y0SwOo02HosZd37WQ3bLG9LzM6IUKe
	zl0NO2RM2YkGLBRsIClIpu3LU1cTBPs86JZLL14xC79VhD3HVx5FX6reg4F1ckOdz82qHlTxPZxEi
	NRknARMNoQ1DxgILFBRbehSRibkqyAcXdLqhwZM2u353TyzFSRlTFuGnELOBWeA+MuffzrLkzHj8w
	BIF46aw1fJAiHYPWUsJgHXZGZV3cNs6aLne1TdslZIDkLuaefmXgn7MANZjX4baFctxmO+qez42R+
	tsiQyRPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNSB-00000008Wxo-27nt;
	Tue, 17 Feb 2026 15:57:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNS8-00000008Wx6-1nTG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 15:57:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 573231477;
	Tue, 17 Feb 2026 07:57:23 -0800 (PST)
Received: from orionap.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E55553F632;
	Tue, 17 Feb 2026 07:57:27 -0800 (PST)
Date: Tue, 17 Feb 2026 15:57:17 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland
 <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module
 clock
Message-ID: <20260217155717.0b99c310@orionap.fritz.box>
In-Reply-To: <20260217093004.3239051-1-wens@kernel.org>
References: <20260217093004.3239051-1-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_075733_060022_18F98BD3 
X-CRM114-Status: GOOD (  20.77  )
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

On Tue, 17 Feb 2026 17:30:03 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi,

> When the PRCM clk driver was added, somehow the r-spi module clock
> was skipped over.
> 
> Add it so that r-spi can actually work.

The patch itself looks fine, compared against the manual, so for that:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

But I noticed one thing below....

> Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> index 0339c4af0fe5..db0e36d8838e 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> @@ -83,9 +83,22 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_pwmctrl_clk, "r-pwmctrl",
>  static SUNXI_CCU_GATE_HW(bus_r_pwmctrl_clk, "bus-r-pwmctrl",
>  			 &r_apb0_clk.common.hw, 0x13c, BIT(0), 0);
>  
> -/* SPI clock is /M/N (same as new MMC?) */

Ooops, looks like I saw that clock, but someone managed to dodge it :-(
Sorry about that.

> +static const struct clk_parent_data r_spi_parents[] = {
> +	{ .fw_name = "hosc" },
> +	{ .fw_name = "pll-periph" },
> +	{ .name = "pll-periph0-300M" },
> +	{ .name = "pll-periph1-300M" },
> +	{ .name = "pll-audio" },

Looking a bit closer, all the PRCM PLL-AUDIO clocks in the manual refer to
AUDIO1PLL4X, which is provided by the MCU CCU, not AUDIO0PLL4X provided by
the main CCU. So we would need to change the DT? I wonder if that breaks
boots with kernels which didn't know the MCU CCU yet (v6.15-v6.17)?

Cheers,
Andre.

> +};
> +static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi", r_spi_parents, 0x150,
> +				  0, 5,		/* M */
> +				  8, 5,		/* P */
> +				  24, 3,	/* mux */
> +				  BIT(31),	/* gate */
> +				  0);
>  static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi",
>  			 &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
> +
>  static SUNXI_CCU_GATE_HW(bus_r_spinlock_clk, "bus-r-spinlock",
>  			 &r_ahb_clk.common.hw, 0x16c, BIT(0), 0);
>  static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox",
> @@ -138,6 +151,7 @@ static struct ccu_common *sun55i_a523_r_ccu_clks[] = {
>  	&bus_r_twd_clk.common,
>  	&r_pwmctrl_clk.common,
>  	&bus_r_pwmctrl_clk.common,
> +	&r_spi_clk.common,
>  	&bus_r_spi_clk.common,
>  	&bus_r_spinlock_clk.common,
>  	&bus_r_msgbox_clk.common,
> @@ -169,6 +183,7 @@ static struct clk_hw_onecell_data sun55i_a523_r_hw_clks = {
>  		[CLK_BUS_R_TWD]		= &bus_r_twd_clk.common.hw,
>  		[CLK_R_PWMCTRL]		= &r_pwmctrl_clk.common.hw,
>  		[CLK_BUS_R_PWMCTRL]	= &bus_r_pwmctrl_clk.common.hw,
> +		[CLK_R_SPI]		= &r_spi_clk.common.hw,
>  		[CLK_BUS_R_SPI]		= &bus_r_spi_clk.common.hw,
>  		[CLK_BUS_R_SPINLOCK]	= &bus_r_spinlock_clk.common.hw,
>  		[CLK_BUS_R_MSGBOX]	= &bus_r_msgbox_clk.common.hw,


