Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157DD108B8E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbW1WgDaf1eCMvjrjt561imFtuF6LeXvYMAHw1qjH7Y=; b=PqVbvmWmmAi40lFN9CRmGZ7HYP
	WS2p6EElcHr8oywPht2WpPtE5tP0McEI2BCR1gnu2juOZ2EDsFlsjEOaFuNovnRQ2jXdzei9of7Nf
	6+fWviiKEaqAo/xMbWbkif/xx6iEUAj0V50DpjKH70P3RXI/ZFXTRgSWaX63s6oi94sW97osjfhZD
	sL61ZOBPP09sHFDO+iLEtdXfVlJydjO0PXRzERIkh/SziZDqobGKi0bhbLs12Q6rKsU6ME76ijGfD
	evxB26xS8WXcRKpOfNQbkRiBFfQhBP26VIklik2KDP0o9vwhwjm0TUy3RhDM4UjmItNRQT+PJVe27
	7C6oYBrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WZz-0000000CWgn-2gnp;
	Fri, 20 Mar 2026 09:55:43 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WZw-0000000CWfm-13AX;
	Fri, 20 Mar 2026 09:55:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1774000532; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h0DSz51kEzkzD5GQxFGjqVlpS7fRuOcz1+18dOsFoqbVpm7PlH2mXWGefkUqCKuf/pqkpEX4b2ggBz+JP2V+rA3RDLnMpN5DrAPIuh9SzyiT+x+OC1dR73Yl8kCatmD6idBMGxENVF9TcXRrcurP+NmW5uOd7ZRr+D1J4EzmVuA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774000532; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AbW1WgDaf1eCMvjrjt561imFtuF6LeXvYMAHw1qjH7Y=; 
	b=ZUgxzLriiYGd0y9C/QTADSzZgOphs0UJ4BTTMPMWqmHsYw6xdKFqnMoVkDNuNMLmwhcdjINU7WlU7Xp2WrdkKdhoD4zrKkedad4CC6oq23ys/XcXsjp05NFUmg/MPp7jwJGFcfGuBWQeNX41ZDGoRNEwyUfAFe07nKF3IWuCWx0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774000532;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=AbW1WgDaf1eCMvjrjt561imFtuF6LeXvYMAHw1qjH7Y=;
	b=VwYWx9VdOLZfpfhEf+y7/F2ogA5hJJwee0qc8vmzx6LXP5NZffrOUNZXFmPI0W4d
	KkNKXUbZfdzNjuUagWEACMZTe2CVHR1wy+TmhJkyeyN9nhwEu/FYKwfynGSxUebbGqf
	0+FZEkaPc9V8Hlgx8i7dScQin7/hLFCjqvDX2gCE=
Received: by mx.zohomail.com with SMTPS id 1774000531385803.538354463539;
	Fri, 20 Mar 2026 02:55:31 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Daniele Briguglio <hello@superkali.me>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniele Briguglio <hello@superkali.me>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/3] clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK
 output to IO
Date: Fri, 20 Mar 2026 10:55:26 +0100
Message-ID: <6947155.31r3eYUQgx@workhorse>
In-Reply-To: <20260319-rk3588-mclk-gate-grf-v2-3-c4c8daab0762@superkali.me>
References: <20260319-rk3588-mclk-gate-grf-v2-0-c4c8daab0762@superkali.me>
 <20260319-rk3588-mclk-gate-grf-v2-3-c4c8daab0762@superkali.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_025540_365520_FC5B186C 
X-CRM114-Status: GOOD (  25.16  )
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

On Thursday, 19 March 2026 08:34:01 Central European Standard Time Daniele Briguglio wrote:
> The I2S MCLK outputs on RK3588 are gated by bits in the SYS_GRF
> register SOC_CON6 (offset 0x318). These gates control whether the
> internal CRU MCLK signals reach the external IO pins connected to
> audio codecs.
> 
> The kernel should explicitly manage these gates so that audio
> functionality does not depend on bootloader register state. This is
> analogous to what was done for RK3576 SAI MCLK outputs [1].
> 
> Register the SYS_GRF as an auxiliary GRF with grf_type_sys in the
> early clock init, and add GATE_GRF entries for all four I2S MCLK
> output gates:
> 
>   - I2S0_8CH_MCLKOUT_TO_IO (bit 0)
>   - I2S1_8CH_MCLKOUT_TO_IO (bit 1)
>   - I2S2_2CH_MCLKOUT_TO_IO (bit 2)
>   - I2S3_2CH_MCLKOUT_TO_IO (bit 7)
> 
> Board DTS files that need MCLK on an IO pin can reference these
> clocks, e.g.:
> 
>     clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
> 
> Tested on the Youyeetoo YY3588 (RK3588) with an ES8388 codec on I2S0.
> 
> [1] https://lore.kernel.org/r/20250305-rk3576-sai-v1-2-64e6cf863e9a@collabora.com/
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603191419.MH6EuPga-lkp@intel.com/

I think you can drop these two tags, the patch wasn't merged yet.

> Signed-off-by: Daniele Briguglio <hello@superkali.me>
> ---
>  drivers/clk/rockchip/clk-rk3588.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
> index 1694223f4f84..4611b6ce8217 100644
> --- a/drivers/clk/rockchip/clk-rk3588.c
> +++ b/drivers/clk/rockchip/clk-rk3588.c
> @@ -5,7 +5,9 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/of.h>
> +#include <linux/slab.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  #include <linux/syscore_ops.h>
> @@ -892,6 +894,8 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
>  			RK3588_CLKGATE_CON(8), 0, GFLAGS),
>  	MUX(I2S2_2CH_MCLKOUT, "i2s2_2ch_mclkout", i2s2_2ch_mclkout_p, CLK_SET_RATE_PARENT,
>  			RK3588_CLKSEL_CON(30), 2, 1, MFLAGS),
> +	GATE_GRF(I2S2_2CH_MCLKOUT_TO_IO, "i2s2_2ch_mclkout_to_io", "i2s2_2ch_mclkout",
> +			0, 0x0318, 2, GFLAGS, grf_type_sys),

For the register offset, please add another patch which adds a
#define RK3588_SYSGRF_SOC_CON6 0x318
to `include/soc/rockchip/rk3588_grf.h`, and then use that name
here by including that header. Alternatively, just define it
in this file (though it's up to Heiko to decide what he prefers.)

>  
>  	COMPOSITE(CLK_I2S3_2CH_SRC, "clk_i2s3_2ch_src", gpll_aupll_p, 0,
>  			RK3588_CLKSEL_CON(30), 8, 1, MFLAGS, 3, 5, DFLAGS,
> @@ -907,6 +911,8 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
>  			RK3588_CLKGATE_CON(8), 4, GFLAGS),
>  	MUX(I2S3_2CH_MCLKOUT, "i2s3_2ch_mclkout", i2s3_2ch_mclkout_p, CLK_SET_RATE_PARENT,
>  			RK3588_CLKSEL_CON(32), 2, 1, MFLAGS),
> +	GATE_GRF(I2S3_2CH_MCLKOUT_TO_IO, "i2s3_2ch_mclkout_to_io", "i2s3_2ch_mclkout",
> +			0, 0x0318, 7, GFLAGS, grf_type_sys),
>  	GATE(PCLK_ACDCDIG, "pclk_acdcdig", "pclk_audio_root", 0,
>  			RK3588_CLKGATE_CON(7), 11, GFLAGS),
>  	GATE(HCLK_I2S0_8CH, "hclk_i2s0_8ch", "hclk_audio_root", 0,
> @@ -935,6 +941,8 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
>  			RK3588_CLKGATE_CON(7), 10, GFLAGS),
>  	MUX(I2S0_8CH_MCLKOUT, "i2s0_8ch_mclkout", i2s0_8ch_mclkout_p, CLK_SET_RATE_PARENT,
>  			RK3588_CLKSEL_CON(28), 2, 2, MFLAGS),
> +	GATE_GRF(I2S0_8CH_MCLKOUT_TO_IO, "i2s0_8ch_mclkout_to_io", "i2s0_8ch_mclkout",
> +			0, 0x0318, 0, GFLAGS, grf_type_sys),
>  
>  	GATE(HCLK_PDM1, "hclk_pdm1", "hclk_audio_root", 0,
>  			RK3588_CLKGATE_CON(9), 6, GFLAGS),
> @@ -2220,6 +2228,8 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
>  			RK3588_PMU_CLKGATE_CON(2), 13, GFLAGS),
>  	MUX(I2S1_8CH_MCLKOUT, "i2s1_8ch_mclkout", i2s1_8ch_mclkout_p, CLK_SET_RATE_PARENT,
>  			RK3588_PMU_CLKSEL_CON(9), 2, 2, MFLAGS),
> +	GATE_GRF(I2S1_8CH_MCLKOUT_TO_IO, "i2s1_8ch_mclkout_to_io", "i2s1_8ch_mclkout",
> +			0, 0x0318, 1, GFLAGS, grf_type_sys),
>  	GATE(PCLK_PMU1, "pclk_pmu1", "pclk_pmu0_root", CLK_IS_CRITICAL,
>  			RK3588_PMU_CLKGATE_CON(1), 0, GFLAGS),
>  	GATE(CLK_DDR_FAIL_SAFE, "clk_ddr_fail_safe", "clk_pmu0", CLK_IGNORE_UNUSED,
> @@ -2439,6 +2449,8 @@ static struct rockchip_clk_branch rk3588_clk_branches[] = {
>  static void __init rk3588_clk_early_init(struct device_node *np)
>  {
>  	struct rockchip_clk_provider *ctx;
> +	struct rockchip_aux_grf *sys_grf_e;
> +	struct regmap *sys_grf;
>  	unsigned long clk_nr_clks, max_clk_id1, max_clk_id2;
>  	void __iomem *reg_base;
>  
> @@ -2479,6 +2491,17 @@ static void __init rk3588_clk_early_init(struct device_node *np)
>  			&rk3588_cpub1clk_data, rk3588_cpub1clk_rates,
>  			ARRAY_SIZE(rk3588_cpub1clk_rates));
>  
> +	/* Register SYS_GRF for I2S MCLK output to IO gate clocks */
> +	sys_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3588-sys-grf");
> +	if (!IS_ERR(sys_grf)) {
> +		sys_grf_e = kzalloc_obj(*sys_grf_e);
> +		if (sys_grf_e) {
> +			sys_grf_e->grf = sys_grf;
> +			sys_grf_e->type = grf_type_sys;
> +			hash_add(ctx->aux_grf_table, &sys_grf_e->node, grf_type_sys);
> +		}
> +	}
> +
>  	rockchip_clk_register_branches(ctx, rk3588_early_clk_branches,
>  				       ARRAY_SIZE(rk3588_early_clk_branches));
>  
> 
> 

With that addressed, you can add a
Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Kind regards,
Nicolas Frattaroli



