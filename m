Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA573CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgNiBBf4cu32q0ZEEYeIX25WTZd4hvVr+vxDhDI/sgY=; b=b9TIoXSjv4QwCmG4ZDjj/Xp0wN
	D0Ru8JI4bx+kklf9NrmfLZvF+dbNd1WEXGm+Av9tSxm53S4TNNtWusdcoZpR/05fGCMbluMoxJaoZ
	TD94Fc+TZkA6N1i6p9H8QWivM3QKco2C5jCp2S6swm6LllPPvOV5itYZKl9s5gPj2bz6QbXAJ3j1V
	WLiTi391NzRJSf6cKB4aSvzcCxRxTedDY8eOnZSnQEjJOhqUZGqXFL99cXve46mxxwXbU8uWoTPhR
	RJb/360oU90tj4SdSf5ma532aHKUqx4E5xT6+MmybjwWQbiI48cuFaYfWE3KGIvx68ULDax2c376Y
	BDIAZfFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbyrM-000000067mZ-3KT2;
	Tue, 23 Jun 2026 11:00:04 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbyrI-000000067jv-1UIK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:00:01 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1782212387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bgNiBBf4cu32q0ZEEYeIX25WTZd4hvVr+vxDhDI/sgY=;
	b=HYa5RqwlJ97bZG6XkmSoo1V2BG9Sl5u3bd9B979ewpsl0t7WfPVOgbblAc9tppbn8W81IF
	ws3PmW4qlw5MDLAaSsT47fneTsbFfeWdM8GpbxLKDEUR6iXpzuncovQpZn0HOawytQ96OD
	smvR8ur1LVCWoZE+c0ZuUfVD2pkaUnCCWPs7pzuhq/5/5hIC2xO+eLdMjL+o4inKUWrf0y
	W+AZTc3j/AMmNkGi2FLd4uqNB1W+jtKIEu7TvC3PY8+CQrtAMWd8JGLPV1y7B5wvqlBAD3
	Eotg7rAGQ5w54BsUVGBXghHV7esKFYng9FeAy4MqfP53ZogSiISQPVJJ4MoVQg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 12:59:42 +0200
Message-Id: <DJGDK9WA46IK.AH6NJASRAR0J@cknow-tech.com>
Cc: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Ricardo Pardini" <ricardo@pardini.net>
Subject: Re: [PATCH v3 4/4] clk: rockchip: rk3588: add GATE_GRF clocks for
 I2S MCLK output to IO
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Daniele Briguglio" <hello@superkali.me>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20260320-rk3588-mclk-gate-grf-v3-0-980338eacd2c@superkali.me>
 <20260320-rk3588-mclk-gate-grf-v3-4-980338eacd2c@superkali.me>
In-Reply-To: <20260320-rk3588-mclk-gate-grf-v3-4-980338eacd2c@superkali.me>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_040000_533547_52B9759D 
X-CRM114-Status: GOOD (  20.86  )
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

On Fri Mar 20, 2026 at 11:34 AM CET, Daniele Briguglio wrote:
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
>     clocks =3D <&cru I2S0_8CH_MCLKOUT_TO_IO>;
>
> Tested on the Youyeetoo YY3588 (RK3588) with an ES8388 codec on I2S0.

Doesn't this break audio on a lot of RK3588 based boards?
I have a kernel with this patch set and since then analog audio on my NanoP=
C-T6
LTS and my WIP NanoPC-T6 Plus stopped working.
Until I did s/I2S0_8CH_MCLKOUT/I2S0_8CH_MCLKOUT_TO_IO/ in my dts[i] files.

And I wouldn't be surprised if the same thing applies to other RK3588 based
boards? The same dtb file with a 7.1 kernel, without this patch set, works.

Cheers,
  Diederik

> [1] https://lore.kernel.org/r/20250305-rk3576-sai-v1-2-64e6cf863e9a@colla=
bora.com/
>
> Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Tested-by: Ricardo Pardini <ricardo@pardini.net>
> Signed-off-by: Daniele Briguglio <hello@superkali.me>
> ---
>  drivers/clk/rockchip/clk-rk3588.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk=
-rk3588.c
> index 1694223f4f84..2cc85fb5b2cc 100644
> --- a/drivers/clk/rockchip/clk-rk3588.c
> +++ b/drivers/clk/rockchip/clk-rk3588.c
> @@ -5,11 +5,14 @@
>   */
> =20
>  #include <linux/clk-provider.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/of.h>
> +#include <linux/slab.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  #include <linux/syscore_ops.h>
>  #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +#include <soc/rockchip/rk3588_grf.h>
>  #include "clk.h"
> =20
>  #define RK3588_GRF_SOC_STATUS0		0x600
> @@ -892,6 +895,8 @@ static struct rockchip_clk_branch rk3588_early_clk_br=
anches[] __initdata =3D {
>  			RK3588_CLKGATE_CON(8), 0, GFLAGS),
>  	MUX(I2S2_2CH_MCLKOUT, "i2s2_2ch_mclkout", i2s2_2ch_mclkout_p, CLK_SET_R=
ATE_PARENT,
>  			RK3588_CLKSEL_CON(30), 2, 1, MFLAGS),
> +	GATE_GRF(I2S2_2CH_MCLKOUT_TO_IO, "i2s2_2ch_mclkout_to_io", "i2s2_2ch_mc=
lkout",
> +			0, RK3588_SYSGRF_SOC_CON6, 2, GFLAGS, grf_type_sys),
> =20
>  	COMPOSITE(CLK_I2S3_2CH_SRC, "clk_i2s3_2ch_src", gpll_aupll_p, 0,
>  			RK3588_CLKSEL_CON(30), 8, 1, MFLAGS, 3, 5, DFLAGS,
> @@ -907,6 +912,8 @@ static struct rockchip_clk_branch rk3588_early_clk_br=
anches[] __initdata =3D {
>  			RK3588_CLKGATE_CON(8), 4, GFLAGS),
>  	MUX(I2S3_2CH_MCLKOUT, "i2s3_2ch_mclkout", i2s3_2ch_mclkout_p, CLK_SET_R=
ATE_PARENT,
>  			RK3588_CLKSEL_CON(32), 2, 1, MFLAGS),
> +	GATE_GRF(I2S3_2CH_MCLKOUT_TO_IO, "i2s3_2ch_mclkout_to_io", "i2s3_2ch_mc=
lkout",
> +			0, RK3588_SYSGRF_SOC_CON6, 7, GFLAGS, grf_type_sys),
>  	GATE(PCLK_ACDCDIG, "pclk_acdcdig", "pclk_audio_root", 0,
>  			RK3588_CLKGATE_CON(7), 11, GFLAGS),
>  	GATE(HCLK_I2S0_8CH, "hclk_i2s0_8ch", "hclk_audio_root", 0,
> @@ -935,6 +942,8 @@ static struct rockchip_clk_branch rk3588_early_clk_br=
anches[] __initdata =3D {
>  			RK3588_CLKGATE_CON(7), 10, GFLAGS),
>  	MUX(I2S0_8CH_MCLKOUT, "i2s0_8ch_mclkout", i2s0_8ch_mclkout_p, CLK_SET_R=
ATE_PARENT,
>  			RK3588_CLKSEL_CON(28), 2, 2, MFLAGS),
> +	GATE_GRF(I2S0_8CH_MCLKOUT_TO_IO, "i2s0_8ch_mclkout_to_io", "i2s0_8ch_mc=
lkout",
> +			0, RK3588_SYSGRF_SOC_CON6, 0, GFLAGS, grf_type_sys),
> =20
>  	GATE(HCLK_PDM1, "hclk_pdm1", "hclk_audio_root", 0,
>  			RK3588_CLKGATE_CON(9), 6, GFLAGS),
> @@ -2220,6 +2229,8 @@ static struct rockchip_clk_branch rk3588_early_clk_=
branches[] __initdata =3D {
>  			RK3588_PMU_CLKGATE_CON(2), 13, GFLAGS),
>  	MUX(I2S1_8CH_MCLKOUT, "i2s1_8ch_mclkout", i2s1_8ch_mclkout_p, CLK_SET_R=
ATE_PARENT,
>  			RK3588_PMU_CLKSEL_CON(9), 2, 2, MFLAGS),
> +	GATE_GRF(I2S1_8CH_MCLKOUT_TO_IO, "i2s1_8ch_mclkout_to_io", "i2s1_8ch_mc=
lkout",
> +			0, RK3588_SYSGRF_SOC_CON6, 1, GFLAGS, grf_type_sys),
>  	GATE(PCLK_PMU1, "pclk_pmu1", "pclk_pmu0_root", CLK_IS_CRITICAL,
>  			RK3588_PMU_CLKGATE_CON(1), 0, GFLAGS),
>  	GATE(CLK_DDR_FAIL_SAFE, "clk_ddr_fail_safe", "clk_pmu0", CLK_IGNORE_UNU=
SED,
> @@ -2439,6 +2450,8 @@ static struct rockchip_clk_branch rk3588_clk_branch=
es[] =3D {
>  static void __init rk3588_clk_early_init(struct device_node *np)
>  {
>  	struct rockchip_clk_provider *ctx;
> +	struct rockchip_aux_grf *sys_grf_e;
> +	struct regmap *sys_grf;
>  	unsigned long clk_nr_clks, max_clk_id1, max_clk_id2;
>  	void __iomem *reg_base;
> =20
> @@ -2479,6 +2492,17 @@ static void __init rk3588_clk_early_init(struct de=
vice_node *np)
>  			&rk3588_cpub1clk_data, rk3588_cpub1clk_rates,
>  			ARRAY_SIZE(rk3588_cpub1clk_rates));
> =20
> +	/* Register SYS_GRF for I2S MCLK output to IO gate clocks */
> +	sys_grf =3D syscon_regmap_lookup_by_compatible("rockchip,rk3588-sys-grf=
");
> +	if (!IS_ERR(sys_grf)) {
> +		sys_grf_e =3D kzalloc_obj(*sys_grf_e);
> +		if (sys_grf_e) {
> +			sys_grf_e->grf =3D sys_grf;
> +			sys_grf_e->type =3D grf_type_sys;
> +			hash_add(ctx->aux_grf_table, &sys_grf_e->node, grf_type_sys);
> +		}
> +	}
> +
>  	rockchip_clk_register_branches(ctx, rk3588_early_clk_branches,
>  				       ARRAY_SIZE(rk3588_early_clk_branches));
> =20


