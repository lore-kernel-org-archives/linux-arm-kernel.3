Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E1EC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 21:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvIMtdRr40PIJXHTXV5dA+VuRJC9zWGQHYN/tBqzOHI=; b=Do4oD6KFrOtDAg3GPOiq1zgvJw
	1Ez2QVy31Dfnp/zTlunlqHqRItGJ8tS5LPZlPshg0XNcC0krTCVrPiOvEsN1y0KwMze7em3tdD8RD
	5SvOQqAZSR9F8aFzQAzsOvolR7Y9ju/iVbuMeWemvCT2NHAlEtA1fEn5GesOkGAB2w3fxEwZsZ4Jq
	JREiDhSW6lRQ1zmMkaHg+FXoxEHlCrRwNinun+9DfiGdnMRnltGqYrUykUxmb4mUeqWSDDwvPbsk7
	U+qRMBdICqaMf+pzBWXm0Mto8TjWTuxvkj4hb9NQK+62PWhGDoYg63vNJo6/GncUUS0jfXK8AfB4Y
	4Po1O0Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg9gK-00000007bnF-47jp;
	Thu, 06 Feb 2025 21:45:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg9ew-00000007ba6-1TXQ;
	Thu, 06 Feb 2025 21:43:43 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43E45227;
	Thu,  6 Feb 2025 22:42:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738878145;
	bh=vCJladhhKUfbgbqOYBTWjl54ZrM+0wQvVN3ul7hgg0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oQeNubVmqwP0rNji7oxX4H3Mf/fHcr4G+HBPlSc/WSHb5AQNVrZXuwM2fSpFT/eoK
	 5BQrGd0okwH5BjozdDBczw+qdGE/GexPkekQjE2Vp4Xf5uXzapxLDRZVY66cp2B4qT
	 iiOiSDc2tQSAOGTJoSgG0kuJW4whvOMrZxrBjDbA=
Date: Thu, 6 Feb 2025 23:43:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Robby Cai <robby.cai@nxp.com>,
	Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v2 02/14] phy: freescale: Add MIPI CSI PHY driver for
 i.MX8Q
Message-ID: <20250206214334.GB24886@pendragon.ideasonboard.com>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
 <20250205-8qxp_camera-v2-2-731a3edf2744@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250205-8qxp_camera-v2-2-731a3edf2744@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_134342_672595_61F95ED3 
X-CRM114-Status: GOOD (  32.38  )
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

Hi Frank,

Thank you for the patch.

On Wed, Feb 05, 2025 at 12:18:11PM -0500, Frank Li wrote:
> Add MIPI CSI PHY driver for i.MX8QM, i.MX8QXP.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v1 to v2
> - remove un-test code for 8ulp.
> - remove unused regiser define
> ---
>  drivers/phy/freescale/Kconfig                   |   9 ++
>  drivers/phy/freescale/Makefile                  |   1 +
>  drivers/phy/freescale/phy-fsl-imx8q-mipi-cphy.c | 185 ++++++++++++++++++++++++
>  3 files changed, 195 insertions(+)
> 
> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> index dcd9acff6d01a..f412fa405b9b6 100644
> --- a/drivers/phy/freescale/Kconfig
> +++ b/drivers/phy/freescale/Kconfig
> @@ -35,6 +35,15 @@ config PHY_FSL_IMX8M_PCIE
>  	  Enable this to add support for the PCIE PHY as found on
>  	  i.MX8M family of SOCs.
>  
> +config PHY_FSL_IMX8Q_MIPI_CPHY
> +        tristate "Freescale MIPI CSI PHY support"
> +        depends on OF && HAS_IOMEM
> +        select GENERIC_PHY
> +        select REGMAP_MMIO
> +        help
> +          Enable this to add support for the MIPI CSI PHY as found
> +          on NXP's i.MX8 family of SOCs.
> +
>  config PHY_FSL_IMX8QM_HSIO
>  	tristate "Freescale i.MX8QM HSIO PHY"
>  	depends on OF && HAS_IOMEM
> diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
> index 658eac7d0a622..8ff72dfdcf654 100644
> --- a/drivers/phy/freescale/Makefile
> +++ b/drivers/phy/freescale/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)	+= phy-fsl-imx8mq-usb.o
>  obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)	+= phy-fsl-imx8qm-lvds-phy.o
>  obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)	+= phy-fsl-imx8-mipi-dphy.o
>  obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)	+= phy-fsl-imx8m-pcie.o
> +obj-$(CONFIG_PHY_FSL_IMX8Q_MIPI_CPHY)	+= phy-fsl-imx8q-mipi-cphy.o
>  obj-$(CONFIG_PHY_FSL_IMX8QM_HSIO)	+= phy-fsl-imx8qm-hsio.o
>  obj-$(CONFIG_PHY_FSL_LYNX_28G)		+= phy-fsl-lynx-28g.o
>  obj-$(CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY)	+= phy-fsl-samsung-hdmi.o
> diff --git a/drivers/phy/freescale/phy-fsl-imx8q-mipi-cphy.c b/drivers/phy/freescale/phy-fsl-imx8q-mipi-cphy.c
> new file mode 100644
> index 0000000000000..3137c89eab057
> --- /dev/null
> +++ b/drivers/phy/freescale/phy-fsl-imx8q-mipi-cphy.c
> @@ -0,0 +1,185 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +struct imx8_mipi_phy {
> +	struct phy *phy;
> +	struct device *dev;
> +	struct regmap *phy_gpr;
> +	int speed;
> +	const struct imx8_mipi_drvdata *drvdata;
> +};
> +
> +#define CSI2SS_PL_CLK_INTERVAL_US		10000
> +#define CSI2SS_PL_CLK_TIMEOUT_US		100000
> +
> +#define CSI2SS_PLM_CTRL				0x0
> +#define CSI2SS_PLM_CTRL_PL_CLK_RUN		BIT(31)
> +#define CSI2SS_PLM_CTRL_VSYNC_OVERRIDE		BIT(9)
> +#define CSI2SS_PLM_CTRL_HSYNC_OVERRIDE		BIT(10)
> +#define CSI2SS_PLM_CTRL_VALID_OVERRIDE		BIT(11)
> +#define CSI2SS_PLM_CTRL_POLARITY_MASK		BIT(12)
> +#define CSI2SS_PLM_CTRL_ENABLE_PL		BIT(0)
> +
> +#define CSI2SS_PHY_CTRL				0x4
> +#define CSI2SS_PHY_CTRL_PD			BIT(22)
> +#define CSI2SS_PHY_CTRL_RTERM_SEL		BIT(21)
> +#define CSI2SS_PLM_CTRL_POLARITY		BIT(12)
> +#define CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK	GENMASK(9, 4)
> +#define CSI2SS_PHY_CTRL_CONT_CLK_MODE		BIT(3)
> +#define CSI2SS_PHY_CTRL_DDRCLK_EN		BIT(2)
> +#define CSI2SS_PHY_CTRL_AUTO_PD_EN		BIT(1)
> +#define CSI2SS_PHY_CTRL_RX_ENABLE		BIT(0)
> +
> +#define CSI2SS_DATA_TYPE			0x38
> +#define CSI2SS_DATA_TYPE_MASK			GENMASK(23, 0)
> +
> +#define CSI2SS_CTRL_CLK_RESET			0x44
> +#define CSI2SS_CTRL_CLK_RESET_EN		BIT(0)
> +
> +static int imx8_mipi_phy_power_on(struct phy *phy)
> +{
> +	struct imx8_mipi_phy *imx8_phy = phy_get_drvdata(phy);
> +	int ret;
> +	u32 val;
> +
> +	/* clear format */
> +	regmap_clear_bits(imx8_phy->phy_gpr, CSI2SS_DATA_TYPE, CSI2SS_DATA_TYPE_MASK);
> +
> +	/* clear polarity */
> +	regmap_clear_bits(imx8_phy->phy_gpr, CSI2SS_PLM_CTRL,
> +			  CSI2SS_PLM_CTRL_VSYNC_OVERRIDE |
> +			  CSI2SS_PLM_CTRL_HSYNC_OVERRIDE |
> +			  CSI2SS_PLM_CTRL_VALID_OVERRIDE |
> +			  CSI2SS_PLM_CTRL_POLARITY_MASK);
> +
> +	regmap_update_bits(imx8_phy->phy_gpr, CSI2SS_PHY_CTRL, CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK,
> +			   FIELD_PREP(CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK, imx8_phy->speed));

Quite annoying the .set_speed() operation is badly documented, the speed
unit is not specified. Wouldn't it still be better to pass the speed as
a link frequency in Hz, and do the conversion here ?

> +
> +	regmap_set_bits(imx8_phy->phy_gpr, CSI2SS_PHY_CTRL,
> +			CSI2SS_PHY_CTRL_RX_ENABLE | CSI2SS_PHY_CTRL_DDRCLK_EN |
> +			CSI2SS_PHY_CTRL_CONT_CLK_MODE | CSI2SS_PHY_CTRL_PD |
> +			CSI2SS_PHY_CTRL_RTERM_SEL | CSI2SS_PHY_CTRL_AUTO_PD_EN);
> +
> +	ret = regmap_read_poll_timeout(imx8_phy->phy_gpr, CSI2SS_PLM_CTRL,
> +				       val, !(val & CSI2SS_PLM_CTRL_PL_CLK_RUN),
> +				       CSI2SS_PL_CLK_INTERVAL_US,
> +				       CSI2SS_PL_CLK_TIMEOUT_US);
> +
> +	if (ret) {
> +		dev_err(imx8_phy->dev, "Timeout waiting for Pixel-Link clock");
> +		return ret;
> +	}
> +
> +	/* Enable Pixel link Master*/
> +	regmap_set_bits(imx8_phy->phy_gpr, CSI2SS_PLM_CTRL,
> +			CSI2SS_PLM_CTRL_ENABLE_PL | CSI2SS_PLM_CTRL_VALID_OVERRIDE);
> +
> +	/* PHY Enable */
> +	regmap_clear_bits(imx8_phy->phy_gpr, CSI2SS_PHY_CTRL,
> +			  CSI2SS_PHY_CTRL_PD | CSI2SS_PLM_CTRL_POLARITY);

While this register is PHY-related, the others are not. They control the
pixel link interface at the output of the CSI-2 receiver, the clock
gate, or the VC/DT filtering. Modeling all this as a PHY driver works
for now, but it's a hack. How will this support other features in the
future ?

> +
> +	/* Release Reset */
> +	regmap_set_bits(imx8_phy->phy_gpr, CSI2SS_CTRL_CLK_RESET, CSI2SS_CTRL_CLK_RESET_EN);
> +
> +	return ret;
> +}
> +
> +static int imx8_mipi_phy_power_off(struct phy *phy)
> +{
> +	struct imx8_mipi_phy *imx8_phy = phy_get_drvdata(phy);
> +
> +	/* Disable Pixel Link */
> +	regmap_write(imx8_phy->phy_gpr, CSI2SS_PLM_CTRL, 0x0);
> +
> +	/* Disable  PHY */
> +	regmap_write(imx8_phy->phy_gpr, CSI2SS_PHY_CTRL, 0x0);
> +
> +	return 0;
> +};
> +
> +static int imx8_mipi_phy_set_speed(struct phy *phy, int speed)
> +{
> +	struct imx8_mipi_phy *imx8_phy = phy_get_drvdata(phy);
> +
> +	imx8_phy->speed = speed;
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops imx8_mipi_phy_ops = {
> +	.power_on = imx8_mipi_phy_power_on,
> +	.power_off = imx8_mipi_phy_power_off,
> +	.set_speed = imx8_mipi_phy_set_speed,
> +	.owner = THIS_MODULE,
> +};
> +
> +static const struct of_device_id imx8_mipi_phy_of_match[] = {
> +	{ .compatible = "fsl,imx8qxp-mipi-cphy" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, imx8_mipi_phy_of_match);
> +
> +static const struct regmap_config regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +static int imx8_mipi_phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +	struct imx8_mipi_phy *imx8_phy;
> +	void __iomem *base;
> +
> +	imx8_phy = devm_kzalloc(dev, sizeof(*imx8_phy), GFP_KERNEL);
> +	if (!imx8_phy)
> +		return -ENOMEM;
> +
> +	imx8_phy->dev = dev;
> +	imx8_phy->drvdata = of_device_get_match_data(dev);
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return dev_err_probe(dev, IS_ERR(base), "missed phy base register\n");
> +
> +	imx8_phy->phy_gpr = devm_regmap_init_mmio(dev, base, &regmap_config);
> +	if (IS_ERR(imx8_phy->phy_gpr))
> +		return dev_err_probe(dev, PTR_ERR(imx8_phy->phy_gpr),
> +				     "unable to find iomuxc registers\n");
> +
> +	imx8_phy->phy = devm_phy_create(dev, NULL, &imx8_mipi_phy_ops);
> +	if (IS_ERR(imx8_phy->phy))
> +		return PTR_ERR(imx8_phy->phy);
> +
> +	phy_set_drvdata(imx8_phy->phy, imx8_phy);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static struct platform_driver imx8_mipi_phy_driver = {
> +	.probe = imx8_mipi_phy_probe,
> +	.driver = {
> +		.name = "imx8-mipi-cphy",
> +		.of_match_table = imx8_mipi_phy_of_match,
> +	}
> +};
> +module_platform_driver(imx8_mipi_phy_driver);
> +
> +MODULE_DESCRIPTION("FSL IMX8 MIPI CSI PHY driver");
> +MODULE_LICENSE("GPL");

-- 
Regards,

Laurent Pinchart

