Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BB5EA7195
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 10:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cIZIKbQ7Pd7y7RJcmWQkxedzciWlUxN3kKs/Q4+MAz0=; b=tpRQftNGa/vq7iLpu2Lq/LQD5G
	o3Pa8MBGVtQ1eK7x95abpN78VBembA1u6K9FbZfTOlMi12wscXFH8SXN2b1mNKWRbVYAgXnpbzR4p
	uLRRms+lUno8NsYkMaphfhzLDPb9tLFZIlQSUl6U102Ir6sCs/fTyhnXRLgrt2+TYLriAr+Q4KLBE
	9z0uVtKmVjpPn5y5m/fe8RWVRj0Fgm5/iWL7PBJ+imyfP7eBOKddvmfwwCLRskMeLEIv7JlF4Rqxz
	HbqlDj+tIdnsIkUNiJ8FpALtcK/p1+5B6kL0+FztVszUSTKdLgwwG0gYAAujmiD2rbzDUOma3OkAW
	aUQz+hyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEPpl-00000005ikU-1tSh;
	Sun, 19 Apr 2026 10:57:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEPpi-00000005ik6-1XjC;
	Sun, 19 Apr 2026 10:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=cIZIKbQ7Pd7y7RJcmWQkxedzciWlUxN3kKs/Q4+MAz0=; b=MHxs90zGbqPvKk41a0Pz2yFw8n
	M5HpOm9sgLU6c8D+ARSrjAO1tFJNcL1tJZuox9rkk25ktrMkCx27cNjp1ISV3QXG+NKnyft09219U
	YWi76jKMZzD+eBYXZ5NzIkSaaIUPqIrmyoEKKQDihWKWoAQLFyJsoWh8P+eIBVX44JWHD0ThK+kkh
	kSzFhitwem0vjviDtBtDLtSJtsSEXK9Q9xLqBDXErYtJysAGFi3THtq96JOwe4tm3hKBUh81aHBpi
	aRIRpIZABE/stPGgWt5T0/8iwTyMskTPeKUCthG1VMB8cVjRtrs8o3fgY9migxrF4wtH27H0Zdwph
	wRPRLHJQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniele Briguglio <hello@superkali.me>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniele Briguglio <hello@superkali.me>,
 Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH v3 4/4] clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK
 output to IO
Date: Sun, 19 Apr 2026 12:56:50 +0200
Message-ID: <3399175.N7aMVyhfb1@phil>
In-Reply-To: <20260320-rk3588-mclk-gate-grf-v3-4-980338eacd2c@superkali.me>
References: <20260320-rk3588-mclk-gate-grf-v3-0-980338eacd2c@superkali.me>
 <20260320-rk3588-mclk-gate-grf-v3-4-980338eacd2c@superkali.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_035658_411799_2D292C98 
X-CRM114-Status: GOOD (  23.79  )
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

Hi Daniele,

Am Freitag, 20. M=C3=A4rz 2026, 11:34:16 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Daniele Briguglio:
> The I2S MCLK outputs on RK3588 are gated by bits in the SYS_GRF
> register SOC_CON6 (offset 0x318). These gates control whether the
> internal CRU MCLK signals reach the external IO pins connected to
> audio codecs.
>=20
> The kernel should explicitly manage these gates so that audio
> functionality does not depend on bootloader register state. This is
> analogous to what was done for RK3576 SAI MCLK outputs [1].
>=20
> Register the SYS_GRF as an auxiliary GRF with grf_type_sys in the
> early clock init, and add GATE_GRF entries for all four I2S MCLK
> output gates:
>=20
>   - I2S0_8CH_MCLKOUT_TO_IO (bit 0)
>   - I2S1_8CH_MCLKOUT_TO_IO (bit 1)
>   - I2S2_2CH_MCLKOUT_TO_IO (bit 2)
>   - I2S3_2CH_MCLKOUT_TO_IO (bit 7)
>=20
> Board DTS files that need MCLK on an IO pin can reference these
> clocks, e.g.:
>=20
>     clocks =3D <&cru I2S0_8CH_MCLKOUT_TO_IO>;
>=20
> Tested on the Youyeetoo YY3588 (RK3588) with an ES8388 codec on I2S0.
>=20
> [1] https://lore.kernel.org/r/20250305-rk3576-sai-v1-2-64e6cf863e9a@colla=
bora.com/
>=20
> Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Tested-by: Ricardo Pardini <ricardo@pardini.net>
> Signed-off-by: Daniele Briguglio <hello@superkali.me>
> ---
>  drivers/clk/rockchip/clk-rk3588.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk=
=2Drk3588.c
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

sorry, took me a bit to articulate, what "issue" I have with this, which
is only that it open-codes adding GRFs. I.e. over time this likely won't
be the only place this might happen, so I envision a more central
function in the rockchip clock code, aka something like:

(1)
rockchip_clk_add_grf(struct rockchip_clk_provider *ctx,
		struct regmap *grf, enum rockchip_grf_type type)


I'm still unsure, if we want the sycon lookup also in there, like:

(2)
rockchip_clk_add_grf(struct rockchip_clk_provider *ctx,
		const char *compat, enum rockchip_grf_type type)

but then we would end up having to also define if it's optional, so I
guess variant (1) is the nicer one, as it at least abstracts away all
the struct rockchip_aux_grf handling from the clock driver itself.


Heiko


>  	rockchip_clk_register_branches(ctx, rk3588_early_clk_branches,
>  				       ARRAY_SIZE(rk3588_early_clk_branches));
> =20
>=20
>=20





