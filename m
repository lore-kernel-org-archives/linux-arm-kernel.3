Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413AFCA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxL7n/3UWWWOwdOFljVjoo5Q63lRoXtWruaJCcdTmfc=; b=WKjjv41WkRTElQWZl3UBCRzCrK
	jY98Brh57Sd8XshfbaoOkOsBhs3iKJpVmpp0Mt4kpp8f1YsznOmQx5iEsYUd57wSMQOe1+dVXQoL1
	PqrsDqFA3V1a4lf+TieIL4t41fklvjdP+dBKmzGlY3yAR8mcL9JomsbnDItFC6ImSowhQoGNeTJDo
	ZlSDnJC+fGoX6CXcPZd8Ygtp2HacYmqjmr9HPz3BOf3eNf7gM7oQUbIqG0SXVDDR7A8Zs3ZmWUkbp
	y4PVTjJ3s7U5wsXD9mCx8snHO3U68HoypYFnjOnrzrpw5U9ZokHd74yjWl3OzrG2pVL/I8jBKzNUL
	5IqlnOPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVaA-00000007n25-3VZS;
	Mon, 25 Aug 2025 11:41:50 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTim-00000007XGg-43oj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 09:42:38 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uqTiU-0002bt-GY; Mon, 25 Aug 2025 11:42:18 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uqTiS-0022ru-2W;
	Mon, 25 Aug 2025 11:42:16 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uqTiS-000J5K-2C;
	Mon, 25 Aug 2025 11:42:16 +0200
Message-ID: <0501e21d1b6c99d18fe7e660f38b9bfafc76de53.camel@pengutronix.de>
Subject: Re: [PATCH 4/7] phy: allwinner: a523: add USB3/PCIe PHY driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: iuncuim <iuncuim@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
Date: Mon, 25 Aug 2025 11:42:16 +0200
In-Reply-To: <20250816084700.569524-5-iuncuim@gmail.com>
References: <20250816084700.569524-1-iuncuim@gmail.com>
	 <20250816084700.569524-5-iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_024237_004614_EE364C6B 
X-CRM114-Status: GOOD (  26.91  )
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

On Sa, 2025-08-16 at 16:46 +0800, iuncuim wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>=20
> The A523 family of processors features a combophy for USB 3.0 and PCIe,
> developed by Innosilicon. Simultaneous operation of both interfaces is
> not supported by design.
> Currently, the driver only adds support for USB 3.0. PCIe support is
> currently unavailable and will be added later.
> All data on phy configuration is taken from the manufacturer's BSP driver=
.
>=20
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  drivers/phy/allwinner/Kconfig                |   9 +
>  drivers/phy/allwinner/Makefile               |   1 +
>  drivers/phy/allwinner/phy-sun55i-usb3-pcie.c | 267 +++++++++++++++++++
>  3 files changed, 277 insertions(+)
>  create mode 100644 drivers/phy/allwinner/phy-sun55i-usb3-pcie.c
>=20
> diff --git a/drivers/phy/allwinner/Kconfig b/drivers/phy/allwinner/Kconfi=
g
> index fb584518b..af2a82e51 100644
> --- a/drivers/phy/allwinner/Kconfig
> +++ b/drivers/phy/allwinner/Kconfig
> @@ -57,3 +57,12 @@ config PHY_SUN50I_USB3
>  	  part of Allwinner H6 SoC.
> =20
>  	  This driver controls each individual USB 2+3 host PHY combo.
> +
> +config PHY_SUN55I_USB3_PCIE
> +	tristate "Allwinner A523 Innosilicon USB3/PCIe Combophy Driver"
> +	depends on ARCH_SUNXI || COMPILE_TEST
> +	depends on RESET_CONTROLLER

This dependency is not necessary. The reset controller API is stubbed
out in case  RESET_CONTROLLER is disabled.

ARCH_SUNXI selects ARCH_HAS_RESET_CONTROLLER, which default-enables
RESET_CONTROLLER.

> +	select GENERIC_PHY
> +	help
> +	  Enable this to support the Allwinner PCIe/USB3.0 combo PHY
> +	  with Innosilicon IP block founded in A523/A527/H728/T527 SOC
> diff --git a/drivers/phy/allwinner/Makefile b/drivers/phy/allwinner/Makef=
ile
> index bd74901a1..5948a27ef 100644
> --- a/drivers/phy/allwinner/Makefile
> +++ b/drivers/phy/allwinner/Makefile
> @@ -3,3 +3,4 @@ obj-$(CONFIG_PHY_SUN4I_USB)		+=3D phy-sun4i-usb.o
>  obj-$(CONFIG_PHY_SUN6I_MIPI_DPHY)	+=3D phy-sun6i-mipi-dphy.o
>  obj-$(CONFIG_PHY_SUN9I_USB)		+=3D phy-sun9i-usb.o
>  obj-$(CONFIG_PHY_SUN50I_USB3)		+=3D phy-sun50i-usb3.o
> +obj-$(CONFIG_PHY_SUN55I_USB3_PCIE)		+=3D phy-sun55i-usb3-pcie.o
> diff --git a/drivers/phy/allwinner/phy-sun55i-usb3-pcie.c b/drivers/phy/a=
llwinner/phy-sun55i-usb3-pcie.c
> new file mode 100644
> index 000000000..905c54a67
> --- /dev/null
> +++ b/drivers/phy/allwinner/phy-sun55i-usb3-pcie.c
> @@ -0,0 +1,267 @@
[...]
> +static int sun55i_usb3_pcie_phy_init(struct phy *_phy)
> +{
> +	struct sun55i_usb3_pcie_phy *phy =3D phy_get_drvdata(_phy);
> +
> +	sun55i_usb3_phy_open(phy);

Given that sun55i_usb3_pcie_phy_exit() asserts the reset and disables
the clock, why isn't the clock enabled and the reset deasserted here?

As is, it looks like the code in sun55i_usb3_phy_open() could be just
folded into sun55i_usb3_pcie_phy_init().

> +	return 0;
> +}
[...]
> +static int sun55i_usb3_pcie_phy_probe(struct platform_device *pdev)
> +{
> +	struct sun55i_usb3_pcie_phy *phy;
> +	struct device *dev =3D &pdev->dev;
> +	struct phy_provider *phy_provider;
> +	int ret;
> +
> +	phy =3D devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	phy->dev =3D dev;
> +	phy->clk =3D devm_clk_get(dev, NULL);
> +	if (IS_ERR(phy->clk)) {
> +		if (PTR_ERR(phy->clk) !=3D -EPROBE_DEFER)
> +			dev_err(dev, "failed to get phy clock\n");
> +		return PTR_ERR(phy->clk);
> +	}
> +
> +	phy->reset =3D devm_reset_control_get(dev, NULL);

Please use devm_reset_control_get_exclusive() directly.

> +	if (IS_ERR(phy->reset)) {
> +		dev_err(dev, "failed to get reset control\n");

Consider using dev_err_probe().

regards
Philipp

