Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E752CCF2D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GW5y5JyizHyML3aevhNNUvy0qMgIhQU77uGp6dID1Rc=; b=YlcYd4tIXKk2n5oCTMUf00rOSk
	3KU76mKanzvrwgsO/NoC11X28K02aIHStkvpKzXJ7fXZ9tQDN4IP4w46+S8IdVBVinHwDIDgjIoKA
	+sCVBoF6h2hbR+bD5K3fJFJz+5oIbwWOmVTGqKkvu1NHi++pvpJMQi7MW4b6jXQfnMCdUZ8NeFwKf
	+VvFYbRZ4I+yhCwTt7xyTTNtR0Q0uMHcezaPY27UezhfMQqIJJ2wARYAz9282n9ZSbK0/moI9suln
	x2Pqx/UK4pOZv48/nbeWi7b41qafkVttvwktiSF3OevQR18fGU98n8ZkpbDh6XWmFFGy5vMqBQjzZ
	gkMUxmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmBR-00000001id6-1p4S;
	Mon, 19 Jan 2026 10:08:29 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmBO-00000001icj-1MZR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:08:27 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1vhmB0-0001Mu-T6; Mon, 19 Jan 2026 11:08:02 +0100
Message-ID: <f31eef1eb99542e99486f3df84c90c304b7f2c9c.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] Fix the imx8mm gpu hang due to adb400 reset wrongly
From: Lucas Stach <l.stach@pengutronix.de>
To: Jacky Bai <ping.bai@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 19 Jan 2026 11:08:01 +0100
In-Reply-To: <20260119-imx8mm_gpu_power_domain-v1-1-34d81c766916@nxp.com>
References: <20260119-imx8mm_gpu_power_domain-v1-0-34d81c766916@nxp.com>
	 <20260119-imx8mm_gpu_power_domain-v1-1-34d81c766916@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_020826_537348_DF551CB9 
X-CRM114-Status: GOOD (  30.43  )
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

Am Montag, dem 19.01.2026 um 16:53 +0800 schrieb Jacky Bai:
> Due to the HW limitation on i.MX8MM, the gpumix, gpu2d and
> gpu3d share the same reset domain, that means when gpu2d/3d
> go through the power off/on cycle, the gpu2d/3d reset will
> also reset the gpumix domain, The GPUMIX ADB400 port also be
> reset. But the ADB400 must be put into power down before reset
> it.
>=20
> currently, gpumix, gpu2d/3d power domain use the pm runtime_pm
> to handle these power domain dependency, but in some corner case,
> the gpumix power off will be skipped, then the ADB400 port will
> be in active while gpu2d/3d doing the reset. The GPUMIX the ADB400
> port will be reset wrongly, so lead to unpredictable bus behavior.
>=20
> To simplify these domain on/off order & dependency, refine the
> code to directly handle GPUMIX domain on/off along with the
> gpu2d/3d power on/off flow.
>=20
I don't like that we are adding quite a bit of code to this driver just
to work around a issue on a single domain on a single SoC.

Wouldn't it be much easier and produce much the same results if we just
move the ADB hsk bits from the gpumix to the gpu domain? This would
mean we don't trigger the handshake when the gpumix domain is powered
up/down, but I guess that should be fine.

Regards,
Lucas

> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  drivers/pmdomain/imx/gpcv2.c | 100 ++++++++++++++++++++++++++++++++++++-=
------
>  1 file changed, 84 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index b7cea89140ee8923f32486eab953c0e1a36bf06d..3a13aa7f1888863048106c243=
2eec80c7364c462 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -53,8 +53,7 @@
>  #define IMX8MM_VPUG1_A53_DOMAIN			BIT(13)
>  #define IMX8MM_DISPMIX_A53_DOMAIN		BIT(12)
>  #define IMX8MM_VPUMIX_A53_DOMAIN		BIT(10)
> -#define IMX8MM_GPUMIX_A53_DOMAIN		BIT(9)
> -#define IMX8MM_GPU_A53_DOMAIN			(BIT(8) | BIT(11))
> +#define IMX8MM_GPU_A53_DOMAIN			(BIT(8) | BIT(9) | BIT(11))
>  #define IMX8MM_DDR1_A53_DOMAIN			BIT(7)
>  #define IMX8MM_OTG2_A53_DOMAIN			BIT(5)
>  #define IMX8MM_OTG1_A53_DOMAIN			BIT(4)
> @@ -292,6 +291,13 @@ struct imx_pgc_domain {
>  		u32 hskack;
>  	} bits;
> =20
> +	const struct {
> +		u32 pxx;
> +		u32 hskreq;
> +		u32 hskack;
> +		unsigned long pgc;
> +	} parent_bits;
> +
>  	const int voltage;
>  	const bool keep_clocks;
>  	struct device *dev;
> @@ -335,6 +341,30 @@ static int imx_pgc_power_up(struct generic_pm_domain=
 *genpd)
>  		}
>  	}
> =20
> +	/* Need to do special handling for parent domain like GPUMIX on i.MX8MM=
 */
> +	if (domain->parent_bits.pxx) {
> +			/* request the domain to power up */
> +		regmap_update_bits(domain->regmap, domain->regs->pup,
> +				   domain->parent_bits.pxx, domain->parent_bits.pxx);
> +		/*
> +		 * As per "5.5.9.4 Example Code 4" in IMX7DRM.pdf wait
> +		 * for PUP_REQ/PDN_REQ bit to be cleared
> +		 */
> +		ret =3D regmap_read_poll_timeout(domain->regmap,
> +					       domain->regs->pup, reg_val,
> +					       !(reg_val & domain->parent_bits.pxx),
> +					       0, USEC_PER_MSEC);
> +		if (ret)
> +			dev_err(domain->dev, "failed to command parent PGC\n");
> +
> +		/* disable power control */
> +		for_each_set_bit(pgc, &domain->parent_bits.pgc, 32) {
> +			regmap_clear_bits(domain->regmap, GPC_PGC_CTRL(pgc),
> +					  GPC_PGC_CTRL_PCR);
> +		}
> +
> +	}
> +
>  	reset_control_assert(domain->reset);
> =20
>  	/* Enable reset clocks for all devices in the domain */
> @@ -376,6 +406,11 @@ static int imx_pgc_power_up(struct generic_pm_domain=
 *genpd)
> =20
>  	reset_control_deassert(domain->reset);
> =20
> +	/* request parent ADB400 to power up */
> +	if (domain->parent_bits.hskreq)
> +		regmap_update_bits(domain->regmap, domain->regs->hsk,
> +				   domain->parent_bits.hskreq, domain->parent_bits.hskreq);
> +
>  	/* request the ADB400 to power up */
>  	if (domain->bits.hskreq) {
>  		regmap_update_bits(domain->regmap, domain->regs->hsk,
> @@ -438,6 +473,21 @@ static int imx_pgc_power_down(struct generic_pm_doma=
in *genpd)
>  		}
>  	}
> =20
> +	/* request the Parent domain ADB400 to power down */
> +	if (domain->parent_bits.hskreq) {
> +		regmap_clear_bits(domain->regmap, domain->regs->hsk,
> +				  domain->parent_bits.hskreq);
> +
> +		ret =3D regmap_read_poll_timeout(domain->regmap, domain->regs->hsk,
> +					       reg_val,
> +					       !(reg_val & domain->parent_bits.hskack),
> +					       0, USEC_PER_MSEC);
> +		if (ret) {
> +			dev_err(domain->dev, "failed to power down parent ADB400\n");
> +			goto out_clk_disable;
> +		}
> +	}
> +
>  	/* request the ADB400 to power down */
>  	if (domain->bits.hskreq) {
>  		regmap_clear_bits(domain->regmap, domain->regs->hsk,
> @@ -477,6 +527,30 @@ static int imx_pgc_power_down(struct generic_pm_doma=
in *genpd)
>  		}
>  	}
> =20
> +	if (domain->parent_bits.pxx) {
> +		/* enable power control */
> +		for_each_set_bit(pgc, &domain->parent_bits.pgc, 32) {
> +			regmap_update_bits(domain->regmap, GPC_PGC_CTRL(pgc),
> +					   GPC_PGC_CTRL_PCR, GPC_PGC_CTRL_PCR);
> +		}
> +
> +		/* request the domain to power down */
> +		regmap_update_bits(domain->regmap, domain->regs->pdn,
> +				   domain->parent_bits.pxx, domain->parent_bits.pxx);
> +		/*
> +		 * As per "5.5.9.4 Example Code 4" in IMX7DRM.pdf wait
> +		 * for PUP_REQ/PDN_REQ bit to be cleared
> +		 */
> +		ret =3D regmap_read_poll_timeout(domain->regmap,
> +					       domain->regs->pdn, reg_val,
> +					       !(reg_val & domain->parent_bits.pxx),
> +					       0, USEC_PER_MSEC);
> +		if (ret) {
> +			dev_err(domain->dev, "failed to command Parent PGC\n");
> +			goto out_clk_disable;
> +		}
> +	}
> +
>  	/* Disable reset clocks for all devices in the domain */
>  	clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
> =20
> @@ -787,20 +861,6 @@ static const struct imx_pgc_domain imx8mm_pgc_domain=
s[] =3D {
>  		.pgc   =3D BIT(IMX8MM_PGC_OTG2),
>  	},
> =20
> -	[IMX8MM_POWER_DOMAIN_GPUMIX] =3D {
> -		.genpd =3D {
> -			.name =3D "gpumix",
> -		},
> -		.bits  =3D {
> -			.pxx =3D IMX8MM_GPUMIX_SW_Pxx_REQ,
> -			.map =3D IMX8MM_GPUMIX_A53_DOMAIN,
> -			.hskreq =3D IMX8MM_GPUMIX_HSK_PWRDNREQN,
> -			.hskack =3D IMX8MM_GPUMIX_HSK_PWRDNACKN,
> -		},
> -		.pgc   =3D BIT(IMX8MM_PGC_GPUMIX),
> -		.keep_clocks =3D true,
> -	},
> -
>  	[IMX8MM_POWER_DOMAIN_GPU] =3D {
>  		.genpd =3D {
>  			.name =3D "gpu",
> @@ -811,6 +871,14 @@ static const struct imx_pgc_domain imx8mm_pgc_domain=
s[] =3D {
>  			.hskreq =3D IMX8MM_GPU_HSK_PWRDNREQN,
>  			.hskack =3D IMX8MM_GPU_HSK_PWRDNACKN,
>  		},
> +
> +		.parent_bits =3D {
> +			.pxx =3D IMX8MM_GPUMIX_SW_Pxx_REQ,
> +			.hskreq =3D IMX8MM_GPUMIX_HSK_PWRDNREQN,
> +			.hskack =3D IMX8MM_GPUMIX_HSK_PWRDNACKN,
> +			.pgc =3D BIT(IMX8MM_PGC_GPUMIX),
> +		},
> +
>  		.pgc   =3D BIT(IMX8MM_PGC_GPU2D) | BIT(IMX8MM_PGC_GPU3D),
>  	},
> =20
>=20


