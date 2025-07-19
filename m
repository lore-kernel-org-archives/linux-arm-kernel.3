Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B886C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 10:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+V4okcQg5oev0dJo7W9WyupRbgSuk/hNGg+xMr7j5I=; b=F6vqDUIHYZuhcVSNmJ/gfB/T4N
	iFg62wkt6gY4n72jH+O6xV4pO6X5sZGrGMbamqmG0qmj0icWqPqr+k5krHXYTUcUEGMzGg2WusYmz
	htjyDmfNDQCIRowtFNKLey787l2+mJW6BIoK6oAww6CIGxQ/yNLVETxie8KcD1CpSaOAr0RbghX1D
	x4y7tDPqVFHjsY63zc3e1HV6neT1BNgP8mYrnrNy0lWQk/LM4R6jXBOrDZ7Q3t5n1LfyR7sVblY2p
	dMpuAbwyDBde6b0dJEB9EikGnbbaEOLJkfkmGCQzDwyC9WLSak/gxs16RMJX5hTuyPxgWW/PSI8ne
	4JDhgzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud5HP-0000000EA9I-0vpf;
	Sat, 19 Jul 2025 10:58:59 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud5Eu-0000000E9vp-2GW5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 10:56:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0EAF71F68D;
	Sat, 19 Jul 2025 10:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752922581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+V4okcQg5oev0dJo7W9WyupRbgSuk/hNGg+xMr7j5I=;
	b=P4HrsYYqAhmsXl1kclEkZQG9JsrFGmEV54vH98kLPctV2Q6P14yJc5XQdbugAbDGEtBefU
	2NTFBx17uTgNhAYS8OJVSkgsFIvVErk9re1JfRlxzl3+hD2o8zk2VQP0f3jLaluiueuONu
	UVhOoySTeVWarG+s3JB/khD9TQ8H56+sC4O4tyyBtgflwXHXeD7yHuddsZI3yw1DT5EFJe
	IzQXU1/czG/fPBdnlEg3P0GVQ2T1nxUBq2DhTojmRUGwYVA4DtjYev5rQiCtlgMJWimVu8
	tX9GkfkKqqVB1nR3UuiircLA7AoVjiB5yBitGLYqAUEZU9V/MgefpOvQ0X7nqA==
Date: Sat, 19 Jul 2025 12:56:16 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v9 05/15] net: phy: dp83822: Add support for
 phy_port representation
Message-ID: <20250719125616.336ece14@kmaincent-XPS-13-7390>
In-Reply-To: <20250717073020.154010-6-maxime.chevallier@bootlin.com>
References: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
	<20250717073020.154010-6-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiieduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduheemfegvgeemtgehtddtmeejtggsvgemiedtieeimeeirgdufhemtggsuggunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduheemfegvgeemtgehtddtmeejtggsvgemiedtieeimeeirgdufhemtggsuggupdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtp
 hhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_035625_254734_1808C5C4 
X-CRM114-Status: GOOD (  25.41  )
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

Le Thu, 17 Jul 2025 09:30:09 +0200,
Maxime Chevallier <maxime.chevallier@bootlin.com> a =C3=A9crit :

> With the phy_port representation intrduced, we can use .attach_port to

*introduced

As you will have to resend a new version ;)

else
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!

> populate the port information based on either the straps or the
> ti,fiber-mode property. This allows simplifying the probe function and
> allow users to override the strapping configuration.
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/phy/dp83822.c | 71 +++++++++++++++++++++++++--------------
>  1 file changed, 45 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/net/phy/dp83822.c b/drivers/net/phy/dp83822.c
> index 33db21251f2e..2657be2e9034 100644
> --- a/drivers/net/phy/dp83822.c
> +++ b/drivers/net/phy/dp83822.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/phy.h>
> +#include <linux/phy_port.h>
>  #include <linux/netdevice.h>
>  #include <linux/bitfield.h>
> =20
> @@ -811,17 +812,6 @@ static int dp83822_of_init(struct phy_device *phydev)
>  	int i, ret;
>  	u32 val;
> =20
> -	/* Signal detection for the PHY is only enabled if the FX_EN and the
> -	 * SD_EN pins are strapped. Signal detection can only enabled if
> FX_EN
> -	 * is strapped otherwise signal detection is disabled for the PHY.
> -	 */
> -	if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> -		dp83822->fx_signal_det_low =3D device_property_present(dev,
> -
> "ti,link-loss-low");
> -	if (!dp83822->fx_enabled)
> -		dp83822->fx_enabled =3D device_property_present(dev,
> -
> "ti,fiber-mode"); -
>  	if (!device_property_read_string(dev, "ti,gpio2-clk-out", &of_val)) {
>  		if (strcmp(of_val, "mac-if") =3D=3D 0) {
>  			dp83822->gpio2_clk_out =3D DP83822_CLK_SRC_MAC_IF;
> @@ -950,6 +940,48 @@ static int dp83822_read_straps(struct phy_device *ph=
ydev)
>  	return 0;
>  }
> =20
> +static int dp83822_attach_port(struct phy_device *phydev, struct phy_port
> *port) +{
> +	struct dp83822_private *dp83822 =3D phydev->priv;
> +	int ret;
> +
> +	if (port->mediums) {
> +		if (phy_port_is_fiber(port))
> +			dp83822->fx_enabled =3D true;
> +	} else {
> +		ret =3D dp83822_read_straps(phydev);
> +		if (ret)
> +			return ret;
> +
> +#if IS_ENABLED(CONFIG_OF_MDIO)
> +		if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> +			dp83822->fx_signal_det_low =3D
> +				device_property_present(&phydev->mdio.dev,
> +							"ti,link-loss-low");
> +
> +		/* ti,fiber-mode is still used for backwards compatibility,
> but
> +		 * has been replaced with the mdi node definition, see
> +		 * ethernet-port.yaml
> +		 */
> +		if (!dp83822->fx_enabled)
> +			dp83822->fx_enabled =3D
> +				device_property_present(&phydev->mdio.dev,
> +							"ti,fiber-mode");
> +#endif /* CONFIG_OF_MDIO */
> +
> +		if (dp83822->fx_enabled) {
> +			port->lanes =3D 1;
> +			port->mediums =3D BIT(ETHTOOL_LINK_MEDIUM_BASEF);
> +		} else {
> +			/* This PHY can only to 100BaseTX max, so on 2 lanes
> */
> +			port->lanes =3D 2;
> +			port->mediums =3D BIT(ETHTOOL_LINK_MEDIUM_BASET);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int dp8382x_probe(struct phy_device *phydev)
>  {
>  	struct dp83822_private *dp83822;
> @@ -968,27 +1000,13 @@ static int dp8382x_probe(struct phy_device *phydev)
> =20
>  static int dp83822_probe(struct phy_device *phydev)
>  {
> -	struct dp83822_private *dp83822;
>  	int ret;
> =20
>  	ret =3D dp8382x_probe(phydev);
>  	if (ret)
>  		return ret;
> =20
> -	dp83822 =3D phydev->priv;
> -
> -	ret =3D dp83822_read_straps(phydev);
> -	if (ret)
> -		return ret;
> -
> -	ret =3D dp83822_of_init(phydev);
> -	if (ret)
> -		return ret;
> -
> -	if (dp83822->fx_enabled)
> -		phydev->port =3D PORT_FIBRE;
> -
> -	return 0;
> +	return dp83822_of_init(phydev);
>  }
> =20
>  static int dp83826_probe(struct phy_device *phydev)
> @@ -1172,6 +1190,7 @@ static int dp83822_led_hw_control_get(struct phy_de=
vice
> *phydev, u8 index, .led_hw_is_supported =3D dp83822_led_hw_is_supported,
> \ .led_hw_control_set =3D dp83822_led_hw_control_set,	\
>  		.led_hw_control_get =3D dp83822_led_hw_control_get,	\
> +		.attach_port =3D dp83822_attach_port		\
>  	}
> =20
>  #define DP83825_PHY_DRIVER(_id, _name)				\



--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

