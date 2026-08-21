Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775DAC5DF8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqJBuuSzNwmUI87Z+ICCLwbC3flAfpdwDJG+TeLAUhE=; b=eoU7ZWj/rygCZx+hDiW22BAVIx
	1tpgXE0jMQ878R9JnwfH7bfkVKdXas+vSHbyTuXERcHVk1s5l2s3KPoOYbL3U1TwLiIn4ZbWbn61w
	tMmItfiwjafeSTIGTq18HVTmA6rXBPOIDIP6SmVcUQJP0aKWlxaiudHLjRRKO4EvzvQLjChMjCM2U
	KJa36yB8anBwKwsOxuBLCotVXhYAULYD8iNBVJNtiIE6rebn49K4URsjXa5UoYEuDaO+FlwoxXtH+
	vWdZfTHLHDvzvJkgc6V4+hxCpF2A6SvoGiKwr1o7mOzcn9TNFHOCyEPRYGUkIuroJuV4dyoMkCjOq
	y/RZx0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPKb-0000000DQMa-0nBU;
	Fri, 21 Aug 2026 13:30:49 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPKX-0000000DQLH-43ez;
	Fri, 21 Aug 2026 13:30:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1787319037; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SbiHDux/1a0o4TWLUlxCEUP5CcGUMTbeFqo6R6OiYZsAMaeloAWqy8cL9q95jT1P+jTW0VhE9bvXGN3fuyYomu5NHolpwCFN5PYyKb2fxK0gK7ETwYrb+gBg/h1smd4Iqb0AK0GeqWfvpdBsudOEmb+ixKoYYaO0Jq9dCjxOTKE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787319037; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IqJBuuSzNwmUI87Z+ICCLwbC3flAfpdwDJG+TeLAUhE=; 
	b=ZDOoLU6SPUKM15z4vD/do6UdPNbEDV8qpXsCX7ezcSX+k+EQ9a5BhsncI6TjFPxUw2I4oX67++tSMMgwNrvgp+e7aEhJr6lK8yJ5q2DEsW1dVlYqjrOyJ7OD1QO1nZ6itUXysMBE3oN0K8imP5sxGn2moyrg446HKW/l5WcbIPM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787319037;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=IqJBuuSzNwmUI87Z+ICCLwbC3flAfpdwDJG+TeLAUhE=;
	b=D8W1f3eDNrSzxxc9U2YJ17o2TmQ+BGexxvxIQxojoglk+Db3LxDFpwezzgWjISR+
	Z8OhOmaCXfytLMPUrXaw1VN1S54ShR1oVr7mxDBy+FtwF1DbwMFEf8YSWKUtfzWt7Ml
	mvEi7KS7G84NVgBjBUmQzEY/2Gqg7Ne8lJJccu0o=
Received: by mx.zohomail.com with SMTPS id 1787319035059193.20813694866024;
	Fri, 21 Aug 2026 06:30:35 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 0F3C8181F47; Fri, 21 Aug 2026 15:30:31 +0200 (CEST)
Date: Fri, 21 Aug 2026 15:30:31 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: jason98166@gmail.com
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Heiko Stuebner <heiko.stuebner@cherry.de>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: rockchip-samsung-dcphy: Enable runtime PM at PHY
 core level
Message-ID: <aohRxwakzVgAbYff@venus>
References: <20260821-dcphy-rpm-v1-v1-1-a7db728b2539@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pzeob2d4d26oeuzd"
Content-Disposition: inline
In-Reply-To: <20260821-dcphy-rpm-v1-v1-1-a7db728b2539@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/287.291.86
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_063046_059795_6F024BED 
X-CRM114-Status: GOOD (  21.35  )
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


--pzeob2d4d26oeuzd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] phy: rockchip-samsung-dcphy: Enable runtime PM at PHY
 core level
MIME-Version: 1.0

Hi,

On Fri, Aug 21, 2026 at 07:44:19PM +0800, Jason Yang via B4 Relay wrote:
> From: Jason Yang <jason98166@gmail.com>
>=20
> phy_create() only enables runtime PM on the new PHY device if the parent
> already has it enabled, and this driver enables it afterwards. The PHY
> device therefore never gets runtime PM, and phy_pm_runtime_get_sync()
> returns -ENOTSUPP for every phy_init() and phy_power_on(). The block is
> still resumed today, but only through the supplier link fw_devlink builds
> from the phys phandle, which fw_devlink=3Doff and =3Dpermissive do not.
>=20
> Move devm_pm_runtime_enable() before devm_phy_create(), as done for the
> sibling HDPTX PHY in commit 10ba8479f460 ("phy:
> phy-rockchip-samsung-hdptx: Enable runtime PM at PHY core level").
>=20
> Fixes: b2a1a2ae7818 ("phy: rockchip: Add Samsung MIPI D-/C-PHY driver")
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/=
phy/rockchip/phy-rockchip-samsung-dcphy.c
> index cbd780556da8..11e872cc6611 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> @@ -1610,16 +1610,16 @@ static int samsung_mipi_dcphy_probe(struct platfo=
rm_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(samsung->grf_apb_rst),
>  				     "Failed to get system grf_apb_rst control\n");
> =20
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +
>  	samsung->phy =3D devm_phy_create(dev, NULL, &samsung_mipi_dcphy_ops);
>  	if (IS_ERR(samsung->phy))
>  		return dev_err_probe(dev, PTR_ERR(samsung->phy), "Failed to create MIP=
I DC-PHY\n");
> =20
>  	phy_set_drvdata(samsung->phy, samsung);
> =20
> -	ret =3D devm_pm_runtime_enable(dev);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> -
>  	phy_provider =3D devm_of_phy_provider_register(dev, samsung_mipi_dcphy_=
xlate);
>  	if (IS_ERR(phy_provider))
>  		return dev_err_probe(dev, PTR_ERR(phy_provider),
>=20
> ---
> base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
> change-id: 20260821-dcphy-rpm-v1-14c80daecbf7
>=20
> Best regards,
> --=20
> Jason Yang <jason98166@gmail.com>
>=20
>=20

--pzeob2d4d26oeuzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmqIUvMACgkQ2O7X88g7
+pp0lg/+K+Tvqs0Naq4IISlWGfBhxDa4pBVw+MqK2HM4jMEAvmnRExdRd78kFsfZ
cnbmGXjzq4sWdmJIaWq0LAOGvRURn0oYrzLtVFTS74k92iF9NVX2jXrywjNZmhUu
OQPsX79AJTRL3Fkf1Z6+Edgf/E5chHRnAoMQAZMFCmZrJKp+z5F1m3U9ma/NhDyz
I394sl+fzLP024Qy0qB2jL414/67pxGALNqwyRZfkjDF9BLpJl3gd+nf3uMpWoiw
u+9eMRgS7Kw1apuXOxU1dVjktgOYzqQ1Nd65QI5ciMZHSryNNurAImX8HpBwKwf0
YGLxsktqxO1jcidpOTDr2XTJ+C1sy6wXal+GpKGiDtKwx7Ods0FKRPvs+4skeJyq
euPGRoNeNmj0raVm6Z7HdmP6oU5EGEZqFu0T5hSsQdoLvH0cDqBUztgJ38JdWY7H
/BLigQDPUcXcs+9O1UAHyLLWWdEw4bYneQnsEPnAEd9i2UpoD/sbG1zCXOp79OHg
edsC7W77u+z/FshrTa6HZ5C4izM+C1FZSg9NB9CUCp0LeBpNJzGkfLLZaCNztdtQ
bWzeDSvWYmQG+I7P3LquXt98v9v2PmevGhwxkyKBLHuPd8NpuhAdhEyaa5vpSSg1
ri6JyUXyg2c9HduY31nxnamk/dh0BtRmjVCtFVv5wvJxHd3Gggs=
=kKPH
-----END PGP SIGNATURE-----

--pzeob2d4d26oeuzd--

