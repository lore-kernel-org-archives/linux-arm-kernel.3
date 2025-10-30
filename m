Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C917CCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4GifELMT62QPiUypuN588OmcfKNVRJKVaf/6Pif2qU=; b=nlVQ7ljZSfa2ueQ3rnZD5MoK2y
	4pTvHre+LqY/YJCCQ6P42Xh2cwRw7tjl5jxqykM+X2fOvePhuGuGQr+Pwuns63fJxooxYJ46fmqZ3
	DKTC0ztKfuodBK7DjujEMNpxKPqa5EdME+a4ArhEmhhq+NRH/npETkmX6z8xg9IYl0M3QIwgKLIzX
	YxVvbD2ljVQS6PhLFpvtGcTtFXKRI2ma/6e4zsjhNs1og0vO7PVfIT1uqNC+DVepR/pQcrYamS+zt
	UM1HlYpzNNXS+05TBw0ewz4+aPblFwV50kWePr/Z93XKZGeD5yULLFfe54cp2nXEvPnVRpcEAc+8N
	Q53Sx2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESMY-00000004B3n-0vet;
	Thu, 30 Oct 2025 13:06:46 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESMW-00000004B3L-0Eb9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 13:06:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vESMJ-0006ym-Cs; Thu, 30 Oct 2025 14:06:31 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vESMI-006DXP-03;
	Thu, 30 Oct 2025 14:06:30 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vESMH-000000009YP-3s7P;
	Thu, 30 Oct 2025 14:06:29 +0100
Message-ID: <105ed81ed67d8e4cacb63a83a606e206a4d6f310.camel@pengutronix.de>
Subject: Re: [PATCH v3 5/8] reset: imx8mp-audiomix: Switch to using regmap
 API
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Abel Vesa
	 <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael Turquette
	 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam
	 <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
	 <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  Pengutronix Kernel Team	
 <kernel@pengutronix.de>
Date: Thu, 30 Oct 2025 14:06:29 +0100
In-Reply-To: <20251029135229.890-6-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
	 <20251029135229.890-6-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_060644_267043_1312557D 
X-CRM114-Status: GOOD (  34.87  )
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

On Mi, 2025-10-29 at 06:52 -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>=20
> As far as the Linux kernel is concerned, block devices such as i.MX8MP's
> AUDIOMIX block control or i.MX8ULP's SIM LPAV can simultaneously act as
> clock controllers, reset controllers or mux controllers. Since these IPs
> offer different functionalities through different subsystem APIs, it's
> important to make sure that the register R-M-W cycles are performed under
> the same lock across all subsystem APIs. This will ensure that registers
> will not end up with the wrong values because of race conditions (e.g.
> clock consumer tries to update block control register A, while, at the
> same time, reset consumer tries to update the same block control register=
).
>=20
> However, the aforementioned race conditions will only impact block contro=
l
> IPs which use the same register for multiple functionalities. For example=
,
> i.MX8MP's AUDIOMIX block control IP provides clock gating functionalities
> and reset control functionalities through different registers. This is wh=
y
> the current approach (i.e. clock control and reset control work using
> different locks) has worked well so far.
>=20
> Since we want to extend this driver to be usable for i.MX8ULP's SIM LPAV
> block control IP, we need to make sure that clock control, reset control,
> and mux control APIs use the same lock since all of these functionalities
> are performed using the SYSCTRL0 register.
>=20
> To do so, we need to switch to the regmap API and, if possible, use the
> parent device's regmap, which, in the case of i.MX8ULP, will be the clock
> controller. This way, we can make sure that the clock gates and the reset
> controller will use the same lock to perform the register R-M-W cycles.
>=20
> This change will also work fine for cases where we don't really need to
> share the lock across multiple APIs (e.g. i.MX8MP's AUDIOMIX block
> control) since regmap will take care of the locking we were previously
> explicitly performing in the driver.
>=20
> The transition to the regmap API also involves some cleanup. Specifically=
,
> we can make use of devres to unmap the device's memory and get rid of the
> memory mapping-related error paths and the remove() function altogether.
>=20
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 91 +++++++++++++++++----------
>  1 file changed, 57 insertions(+), 34 deletions(-)
>=20
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-=
imx8mp-audiomix.c
> index e9643365a62c..3f6d11270918 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/regmap.h>
>  #include <linux/reset-controller.h>
> =20
>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
> @@ -42,8 +43,8 @@ static const struct imx8mp_reset_map reset_map[] =3D {
> =20
>  struct imx8mp_audiomix_reset {
>  	struct reset_controller_dev rcdev;
> -	spinlock_t lock; /* protect register read-modify-write cycle */
>  	void __iomem *base;

Drop base as well, better let devres handle this.

[...]

> +/* assumption: registered only if not using parent regmap */
> +static void imx8mp_audiomix_reset_iounmap(void *data)

Pass base instead of dev.

> +{
> +	struct imx8mp_audiomix_reset *priv =3D dev_get_drvdata(data);
> +
> +	iounmap(priv->base);

	void __iomem *base =3D data;

	iounmap(base);

> +}
> +
> +/* assumption: dev_set_drvdata() is called before this */

Why not just pass priv instead of dev?

> +static int imx8mp_audiomix_reset_get_regmap(struct device *dev)
> +{
> +	struct imx8mp_audiomix_reset *priv;
> +	int ret;
> +
> +	priv =3D dev_get_drvdata(dev);
> +
> +	/* try to use the parent's regmap */
> +	priv->regmap =3D dev_get_regmap(dev->parent, NULL);
> +	if (priv->regmap)
> +		return 0;
> +
> +	/* ... if that's not possible then initialize the regmap right now */
> +	priv->base =3D of_iomap(dev->parent->of_node, 0);

Make base a local variable ...

> +	if (!priv->base)
> +		return dev_err_probe(dev, -ENOMEM, "failed to iomap address space\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, imx8mp_audiomix_reset_iounmap, de=
v);

... and pass it as data instead of dev.

> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register action\n");
> +
> +	priv->regmap =3D devm_regmap_init_mmio(dev, priv->base, &regmap_config)=
;
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +				     "failed to initialize regmap\n");
> +
> +	return 0;
> +}
> +
>  static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>  				       const struct auxiliary_device_id *id)
>  {
> @@ -105,36 +139,26 @@ static int imx8mp_audiomix_reset_probe(struct auxil=
iary_device *adev,
>  	if (!priv)
>  		return -ENOMEM;
> =20
> -	spin_lock_init(&priv->lock);
> -
>  	priv->rcdev.owner     =3D THIS_MODULE;
>  	priv->rcdev.nr_resets =3D ARRAY_SIZE(reset_map);
>  	priv->rcdev.ops       =3D &imx8mp_audiomix_reset_ops;
>  	priv->rcdev.of_node   =3D dev->parent->of_node;
>  	priv->rcdev.dev	      =3D dev;
>  	priv->rcdev.of_reset_n_cells =3D 1;
> -	priv->base            =3D of_iomap(dev->parent->of_node, 0);
> -	if (!priv->base)
> -		return -ENOMEM;
> =20
> +	/* keep before call to imx8mp_audiomix_reset_init_regmap() */

Not needed if priv is passed to it directly.

regards
Philipp

