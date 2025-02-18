Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E27CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhvrnTGwObc5Ecn88wdhnhwUIQnwKjV+65PHj9OxylM=; b=vs6OT8EAXeJpx3wRgM1HgVDytw
	bcV4BGNjJVCmFbDY/0tpJLo559KiOFZpcknAbgdCzBxsPcDlRxnKMsNWCp/OpxVvVzMxn9EdYKBPX
	rGT5eILk9Q+UmohGmNyX15DIvr1cdcNmnMptSBgaCMgW3jtmI8QzSaa4uenCeydqCSUBXMSc3Lxcd
	H94GT5cp1jFoEWLmYukjqx6C1losz4riWkM3X8huXl56kkobop1IUNT3ltynIxFrP66e/htwEX0YF
	WYN6fHe8bMxFTGwIs/yyx+06olt2hFQ2QhsDnWBGhOp5s51iB1EorvKo3+JtPdZHCJE0xmrFLe8I/
	M1zfEpyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKJq-00000007cT3-0Xal;
	Tue, 18 Feb 2025 09:55:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJsW-00000007VXG-3P2o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 09:26:57 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJsU-0001Pv-W7; Tue, 18 Feb 2025 10:26:55 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJsU-001Yuf-1d;
	Tue, 18 Feb 2025 10:26:54 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJsU-0003Kt-1P;
	Tue, 18 Feb 2025 10:26:54 +0100
Message-ID: <86ba9d0c48441a5cb725fb31a7d43dc0d97ee7ea.camel@pengutronix.de>
Subject: Re: [PATCH 2/5] reset: imx8mp-audiomix: Prepare the code for more
 reset bits
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, 
	mathieu.poirier@linaro.org
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, Frank.Li@nxp.com, 
	krzk@kernel.org
Date: Tue, 18 Feb 2025 10:26:54 +0100
In-Reply-To: <20250218085712.66690-3-daniel.baluta@nxp.com>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
	 <20250218085712.66690-3-daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_012656_855437_3D124DC0 
X-CRM114-Status: GOOD (  19.91  )
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

Hi Daniel,

On Di, 2025-02-18 at 10:57 +0200, Daniel Baluta wrote:
> Current code supports EARC PHY Software Reset and EARC 	Software
> Reset but it is not easily extensible to more reset bits.
>=20
> So, refactor the code in order to easily allow more reset bits
> in the future.
>=20
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 53 ++++++++++++++++++++++-----
>  1 file changed, 43 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-=
imx8mp-audiomix.c
> index 1fe21980a66c..6b1666c4e069 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -12,7 +12,30 @@
>  #include <linux/reset-controller.h>
> =20
>  #define IMX8MP_AUDIOMIX_EARC_OFFSET		0x200
> -#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x3
> +#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x1
> +#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	0x2

Will any of the reset controls manipulate multiple bits at once?
I'd use BIT(0) and BIT(1) here.

> +
> +#define IMX8MP_AUDIOMIX_EARC		0
> +#define IMX8MP_AUDIOMIX_EARC_PHY	1
> +
> +#define IMX8MP_AUDIOMIX_RESET_NUM	2
> +
> +struct imx8mp_reset_map {
> +	unsigned int offset;
> +	unsigned int mask;
> +};
> +
> +static const struct imx8mp_reset_map reset_map[IMX8MP_AUDIOMIX_RESET_NUM=
] =3D {

If you make this reset_map[], drop IMX8MP_AUDIOMIX_RESET_NUM, and use
.nr_resets =3D ARRAY_SIZE(reset_map) below, followup patches that add new
bits will be simplified.

> +	[IMX8MP_AUDIOMIX_EARC] =3D {
> +		.offset	=3D IMX8MP_AUDIOMIX_EARC_OFFSET,
> +		.mask	=3D IMX8MP_AUDIOMIX_EARC_RESET_MASK,
> +	},
> +	[IMX8MP_AUDIOMIX_EARC_PHY] =3D {
> +		.offset	=3D IMX8MP_AUDIOMIX_EARC_OFFSET,
> +		.mask	=3D IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
> +	},
> +

Please drop this empty line.

> +};
> =20
>  struct imx8mp_audiomix_reset {
>  	struct reset_controller_dev rcdev;
> @@ -30,13 +53,18 @@ static int imx8mp_audiomix_reset_assert(struct reset_=
controller_dev *rcdev,
>  {
>  	struct imx8mp_audiomix_reset *priv =3D to_imx8mp_audiomix_reset(rcdev);
>  	void __iomem *reg_addr =3D priv->base;
> -	unsigned int mask, reg;
> +	unsigned int mask, offset, reg;
>  	unsigned long flags;
> =20
> -	mask =3D BIT(id);
> +	if (id >=3D  IMX8MP_AUDIOMIX_RESET_NUM)

Whitespace error. But also, this check is not necessary.
The reset core will not return reset controls that fail the same check
in of_reset_simple_xlate(), so we can never get here with the wrong id
if rcdev.nr_resets correctly is set to ARRAY_SIZE(reset_map).

> +		return -EINVAL;
> +
> +	mask =3D reset_map[id].mask;
> +	offset =3D reset_map[id].offset;
> +
>  	spin_lock_irqsave(&priv->lock, flags);
> -	reg =3D readl(reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
> -	writel(reg & ~mask, reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
> +	reg =3D readl(reg_addr + offset);
> +	writel(reg & ~mask, reg_addr + offset);
>  	spin_unlock_irqrestore(&priv->lock, flags);
> =20
>  	return 0;
> @@ -47,13 +75,18 @@ static int imx8mp_audiomix_reset_deassert(struct rese=
t_controller_dev *rcdev,
>  {
>  	struct imx8mp_audiomix_reset *priv =3D to_imx8mp_audiomix_reset(rcdev);
>  	void __iomem *reg_addr =3D priv->base;
> -	unsigned int mask, reg;
> +	unsigned int mask, offset, reg;
>  	unsigned long flags;
> =20
> -	mask =3D BIT(id);
> +	if (id >=3D  IMX8MP_AUDIOMIX_RESET_NUM)
> +		return -EINVAL;

Same as above.

> +
> +	mask =3D reset_map[id].mask;
> +	offset =3D reset_map[id].offset;
> +
>  	spin_lock_irqsave(&priv->lock, flags);
> -	reg =3D readl(reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
> -	writel(reg | mask, reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
> +	reg =3D readl(reg_addr + offset);
> +	writel(reg | mask, reg_addr + offset);
>  	spin_unlock_irqrestore(&priv->lock, flags);
> =20
>  	return 0;
> @@ -78,7 +111,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliar=
y_device *adev,
>  	spin_lock_init(&priv->lock);
> =20
>  	priv->rcdev.owner     =3D THIS_MODULE;
> -	priv->rcdev.nr_resets =3D fls(IMX8MP_AUDIOMIX_EARC_RESET_MASK);
> +	priv->rcdev.nr_resets =3D IMX8MP_AUDIOMIX_RESET_NUM;

Could use ARRAY_SIZE(reset_map) here.

regards
Philipp

