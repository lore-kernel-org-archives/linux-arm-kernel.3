Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A55E9128E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 08:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4/wyuMfqOfl1bn2aWsTzUvkuL6SQTjtDWEmx9LrTJo=; b=NLIoNYADGCR6hgw09uiaViZyGo
	CXhwxnSs567FshCSGyb5d7lV9nD9O+2T8M69X0lkjAEBmxaZMhCbu90FbtqYBT9/XPK2kjmIYQuLn
	WAmG/PMEXYrQBAnAakNHKncvWX2TauUxzpX6EPqFtLNn3eaiizTv7AYumCuZFkMbj3tAM6nFTOHJx
	pYpcRK25Dd9jdhXybjHz1UbvFX+D+ILzftVruw6KHQM9Cts7hsh/kbFc64hvCr6ZtSx5h4f8axe0H
	ZjybeoaNA1cZGqmP7y8GJJxx8dGYmAmMCXK/WUgR7PGx30wCX1m/zKFXDm1iAKDe9oCVq7Ux3GVOL
	g2AeBpRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnuJd-00000009aqZ-3wW2;
	Thu, 05 Feb 2026 08:02:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnuJa-00000009aqD-3ubJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 08:02:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vnuJT-0001FB-3r; Thu, 05 Feb 2026 09:02:07 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vnuJT-004Ciy-1W;
	Thu, 05 Feb 2026 09:02:06 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vnuJS-000000001Wv-33Rb;
	Thu, 05 Feb 2026 09:02:06 +0100
Message-ID: <68979ef7dbd839e4e601bd579f2d3b199a0d350e.camel@pengutronix.de>
Subject: Re: [PATCH] reset: imx7: Check return value of regmap_attach_dev()
 in imx7_reset_probe()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Chen Ni <nichen@iscas.ac.cn>, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 05 Feb 2026 09:02:06 +0100
In-Reply-To: <20260205034219.2531280-1-nichen@iscas.ac.cn>
References: <20260205034219.2531280-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_000214_972112_3752414F 
X-CRM114-Status: GOOD (  17.78  )
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

On Do, 2026-02-05 at 11:42 +0800, Chen Ni wrote:
> Add error checking for regmap_attach_dev() call in imx7_reset_probe()
> function to ensure proper error propagation.
>=20
> Return the value of regmap_attach_dev() if it fails to prevent
> proceeding with an incomplete regmap setup.
>=20
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/reset/reset-imx7.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c
> index dd01fe11c5cb..59d0435302bb 100644
> --- a/drivers/reset/reset-imx7.c
> +++ b/drivers/reset/reset-imx7.c
> @@ -364,6 +364,7 @@ static int imx7_reset_probe(struct platform_device *p=
dev)
>  	struct device *dev =3D &pdev->dev;
>  	struct regmap_config config =3D { .name =3D "src" };
>  	const struct imx7_src_variant *variant =3D of_device_get_match_data(dev=
);
> +	int ret;
> =20
>  	imx7src =3D devm_kzalloc(dev, sizeof(*imx7src), GFP_KERNEL);
>  	if (!imx7src)
> @@ -375,7 +376,9 @@ static int imx7_reset_probe(struct platform_device *p=
dev)
>  		dev_err(dev, "Unable to get imx7-src regmap");
>  		return PTR_ERR(imx7src->regmap);
>  	}
> -	regmap_attach_dev(dev, imx7src->regmap, &config);
> +	ret =3D regmap_attach_dev(dev, imx7src->regmap, &config);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "regmap attach failed\n");

regmap_attach_dev() only returns -ENOMEM errors. The dev_err_probe() is
unnecessary here, as it does not print anything [1].

[1] 2f3cfd2f4b7c ("driver core: Make dev_err_probe() silent for -ENOMEM")

regards
Philipp

