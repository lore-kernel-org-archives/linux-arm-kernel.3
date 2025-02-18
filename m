Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD836C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAEknCMRBsBoZDeVoIOjxikaoJOOyljCCaCwp5Ft+gQ=; b=qVWLND0HQQT9uYpgj70s2fBUuq
	CExkKmG1edfQs3yPpy1SA2GpmnHv7i2ri0Gn8o9AI0RZLnt3Q+9cOwcqVEsOrwdaEP60cl7Huy6Am
	g8e+9t5aC0GNIOM2G/SmjOLykFqH5IhNkN6jZ06fO0qHwAYAY2Me8cDZO/O304+5woHAhBKP2o1nx
	FsY0PWhdon4jnjoY5M923La5/f0YVqKFW4ytHrCptT0Kl7mlUQGGZWu3+u7eB9hgUa5zTwY5LApRC
	SjLnjj+eq6WNktRTMCegCke4kjaSHhYNCoOq3MnTNNvC2jPMcLQ8Con6eQTCUp4wD9846tnZrFSKr
	zhmqH6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKE4-00000007avW-3fAj;
	Tue, 18 Feb 2025 09:49:12 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkK1E-00000007Xvg-0WLE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 09:35:57 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkK1C-000388-9r; Tue, 18 Feb 2025 10:35:54 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkK1C-001Z42-07;
	Tue, 18 Feb 2025 10:35:54 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkK1B-0003co-37;
	Tue, 18 Feb 2025 10:35:53 +0100
Message-ID: <50c7055a676fb7f1bf27cb33a914df641c56dd15.camel@pengutronix.de>
Subject: Re: [PATCH 5/5] imx_dsp_rproc: Use reset controller API to control
 the DSP
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, 
	mathieu.poirier@linaro.org
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, Frank.Li@nxp.com, 
	krzk@kernel.org
Date: Tue, 18 Feb 2025 10:35:53 +0100
In-Reply-To: <20250218085712.66690-6-daniel.baluta@nxp.com>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
	 <20250218085712.66690-6-daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_013556_163718_1A73B157 
X-CRM114-Status: GOOD (  20.21  )
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

On Di, 2025-02-18 at 10:57 +0200, Daniel Baluta wrote:
> Use the reset controller API to control the DSP on i.MX8MP. This way
> we can have a better control of the resources and avoid using a syscon
> to access the audiomix bits.
>=20
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 25 +++++++++++++++++--------
>  drivers/remoteproc/imx_rproc.h     |  2 ++
>  2 files changed, 19 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_=
dsp_rproc.c
> index ea5024919c2f..2b97e4d0bb9e 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -19,6 +19,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
> =20
>  #include "imx_rproc.h"
> @@ -111,6 +112,7 @@ enum imx_dsp_rp_mbox_messages {
>   */
>  struct imx_dsp_rproc {
>  	struct regmap				*regmap;
> +	struct reset_control			*reset;
>  	struct rproc				*rproc;
>  	const struct imx_dsp_rproc_dcfg		*dsp_dcfg;
>  	struct clk_bulk_data			clks[DSP_RPROC_CLK_MAX];
> @@ -192,9 +194,7 @@ static int imx8mp_dsp_reset(struct imx_dsp_rproc *pri=
v)
>  	/* Keep reset asserted for 10 cycles */
>  	usleep_range(1, 2);
> =20
> -	regmap_update_bits(priv->regmap, IMX8M_AudioDSP_REG2,
> -			   IMX8M_AudioDSP_REG2_RUNSTALL,
> -			   IMX8M_AudioDSP_REG2_RUNSTALL);
> +	reset_control_assert(priv->reset);
> =20
>  	/* Take the DSP out of reset and keep stalled for FW loading */
>  	pwrctl =3D readl(dap + IMX8M_DAP_PWRCTL);
> @@ -231,13 +231,9 @@ static int imx8ulp_dsp_reset(struct imx_dsp_rproc *p=
riv)
> =20
>  /* Specific configuration for i.MX8MP */
>  static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp =3D {
> -	.src_reg	=3D IMX8M_AudioDSP_REG2,
> -	.src_mask	=3D IMX8M_AudioDSP_REG2_RUNSTALL,
> -	.src_start	=3D 0,
> -	.src_stop	=3D IMX8M_AudioDSP_REG2_RUNSTALL,
>  	.att		=3D imx_dsp_rproc_att_imx8mp,
>  	.att_size	=3D ARRAY_SIZE(imx_dsp_rproc_att_imx8mp),
> -	.method		=3D IMX_RPROC_MMIO,
> +	.method		=3D IMX_RPROC_RESET_CONTROLLER,
>  };
> =20
>  static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp =3D {
> @@ -329,6 +325,9 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  					  true,
>  					  rproc->bootaddr);
>  		break;
> +	case IMX_RPROC_RESET_CONTROLLER:
> +		ret =3D reset_control_deassert(priv->reset);
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -369,6 +368,9 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>  					  false,
>  					  rproc->bootaddr);
>  		break;
> +	case IMX_RPROC_RESET_CONTROLLER:
> +		ret =3D reset_control_assert(priv->reset);
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -995,6 +997,13 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_=
rproc *priv)
> =20
>  		priv->regmap =3D regmap;
>  		break;
> +	case IMX_RPROC_RESET_CONTROLLER:
> +		priv->reset =3D devm_reset_control_get_optional_exclusive(dev, NULL);

Is this optional on purpose? There is no mention of it in the commit
message. Where is this resets property documented in the dt-bindings?

regards
Philipp

