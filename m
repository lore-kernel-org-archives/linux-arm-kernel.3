Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA73AC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ag0nVTCxAggDNo5CYe8f3SMCM5W4gRKpqRncKaCNLoQ=; b=vtBWfMtB+nDGpavxLCG+EZnuNG
	IPG3u6mWwAdC1rQo6H8VHZ1KNoT1dJG3PR5Nswb8x3sA0F5ogo6biDlSkIsBEij30dzOVNBszOMu9
	JexX0jIEKayMFfeE9xUzHY50r1amWnwj5H3SK55BP+6JRsaxOqYyTl8yZ9UZ4UxiNeuUswC3ZzOqp
	fbJsBqPIVgh8Dazc2eRITUTqtlDE8yXIKROudSdTRC1mJDC1UZPL2pzURqIJjxb/Ge/LkP51eCOaW
	OGZUjtrxWHWFOCTypNXNsOmfIROVtzzF3Oi/9tqFvA1BKnfXv8/x9S8RX3QbOtU5ntpbHa2KSANzS
	3Zu6x99w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl3nm-00000000I4o-3fx8;
	Thu, 20 Feb 2025 10:29:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl3mH-00000000HfJ-2r6D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 10:27:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0F741BB0;
	Thu, 20 Feb 2025 02:27:48 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F5183F59E;
	Thu, 20 Feb 2025 02:27:29 -0800 (PST)
Date: Thu, 20 Feb 2025 10:25:15 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Philippe Simons <simons.philippe@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi
 SoC support), linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi
 SoC support), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v2] clk: sunxi-ng: h616: Reparent GPU clock during
 frequency changes
Message-ID: <20250220102515.05991e9d@minigeek.lan>
In-Reply-To: <20250212173640.396404-1-simons.philippe@gmail.com>
References: <20250212173640.396404-1-simons.philippe@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_022733_820313_9D2EB731 
X-CRM114-Status: GOOD (  27.99  )
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

On Wed, 12 Feb 2025 18:36:39 +0100
Philippe Simons <simons.philippe@gmail.com> wrote:

Hi,

> The H616 manual does not state that the GPU PLL supports
> dynamic frequency configuration, so we must take extra care when changing
> the frequency. Currently any attempt to do device DVFS on the GPU lead
> to panfrost various ooops, and GPU hangs.
> 
> The manual describes the algorithm for changing the PLL
> frequency, which the CPU PLL notifier code already support, so we reuse
> that to reparent the GPU clock to GPU1 clock during frequency
> changes.
> 
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 38 ++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> index 190816c35..884f9a6b5 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -328,10 +328,16 @@ static SUNXI_CCU_M_WITH_MUX_GATE(gpu0_clk, "gpu0", gpu0_parents, 0x670,
>  				       24, 1,	/* mux */
>  				       BIT(31),	/* gate */
>  				       CLK_SET_RATE_PARENT);
> -static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674,
> +
> +/*
> + * This clk is needed as a temporary fall back during GPU PLL freq changes.
> + * Set CLK_IS_CRITICAL flag to prevent from being disabled.
> + */
> + #define SUN50I_H616_GPU_CLK1_REG        0x674
> + static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674,

There seems to be a stray space there at the beginning of those two
lines.

>  					0, 2,	/* M */
>  					BIT(31),/* gate */
> -					0);
> +					CLK_IS_CRITICAL);
>  
>  static SUNXI_CCU_GATE(bus_gpu_clk, "bus-gpu", "psi-ahb1-ahb2",
>  		      0x67c, BIT(0), 0);
> @@ -1120,6 +1126,19 @@ static struct ccu_pll_nb sun50i_h616_pll_cpu_nb = {
>  	.lock		= BIT(28),
>  };
>  
> +static struct ccu_mux_nb sun50i_h616_gpu_nb = {
> +	.common			= &gpu0_clk.common,
> +	.cm				= &gpu0_clk.mux,
> +	.delay_us		= 1, /* manual doesn't really say */

Indentation is off here. Please align to the last line here below.

> +	.bypass_index	= 1, /* GPU_CLK1@400MHz */
> +};
> +
> +static struct ccu_pll_nb sun50i_h616_pll_gpu_nb = {
> +	.common		= &pll_gpu_clk.common,
> +	.enable		= BIT(29),	/* LOCK_ENABLE */
> +	.lock		= BIT(28),
> +};
> +
>  static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>  {
>  	void __iomem *reg;
> @@ -1170,6 +1189,14 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>  	val |= BIT(0);
>  	writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
>  
> +	/*
> +	 * Set the input-divider for the gpu1 clock to 3.

Can you extend the comment, like:
 ... clock to 3, to reach a safe 400 MHz.

> +	 */
> +	val = readl(reg + SUN50I_H616_GPU_CLK1_REG);
> +	val &= ~GENMASK(1, 0);
> +	val |= BIT(1);

Can you replace the BIT(1) with a "2" here? At the moment it looks like
it's a single flag to be set, whereas we really just want to write the
value 2 (3 - 1) into that field.

The rest looks alright, so with those smaller things fixed:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> +	writel(val, reg + SUN50I_H616_GPU_CLK1_REG);
> +
>  	/*
>  	 * First clock parent (osc32K) is unusable for CEC. But since there
>  	 * is no good way to force parent switch (both run with same frequency),
> @@ -1190,6 +1217,13 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>  	/* Re-lock the CPU PLL after any rate changes */
>  	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
>  
> +	/* Reparent GPU during GPU PLL rate changes */
> +	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
> +				  &sun50i_h616_gpu_nb);
> +
> +	/* Re-lock the GPU PLL after any rate changes */
> +	ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
> +
>  	return 0;
>  }
>  


