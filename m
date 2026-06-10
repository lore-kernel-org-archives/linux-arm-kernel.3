Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE155CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 12:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2V/Cihmx8+MRzY0Hdl7XrVi7PKe0HBA8Aa2yRrbRRo=; b=cTVw5Dy8uRxmgAF9cUnAduqeH6
	GPizfohtAIzcfgXtvKBUiGZ550R3ODQW4OmkcmXS0bnMje/iBZ1YLPbqf8ThMrxh0Cz1X7rlMMWwx
	4Ozghx3lbYPy+/znaoDUHIhmeZ16/j/owCa9zQagd4wYt0bs76a4KV/nqpSAM/T9sGhhWRc1edhgU
	lL98eYfM/XrHcRFGI9u0o7MlAj3dcrZSu8cXhmPdCqcz+K8g/TVnHv+WtCJrv0JBRAYBbM7oLhz+a
	CBSLqo7J1W5ViliJuVR/LC7G85JXTt41nS5DwGzjRB2ZmUVsyP5jhTusbtuRfpziYVzlUGJkGf/9Q
	crf2VZOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXI88-00000007e9P-1l66;
	Wed, 10 Jun 2026 12:34:00 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXI85-00000007e8p-01og
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 12:33:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781094830;
	bh=N2V/Cihmx8+MRzY0Hdl7XrVi7PKe0HBA8Aa2yRrbRRo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UdHi6yljkiy6+c/fxCQ5x4iDwaWCzOorP1NhcvjQDWUjbKo6nMa+3muQd2BD1rVLu
	 qJX0zJqzSUeVZd7Yj2a2FzADtYMotgalKz2fN0Qb+EISpMW+ko5StLbB89SNDPF//T
	 Xxy38IvLCby4O2wzSYlzltWg/SIZIdUMTC+SGB0X0mxVfTXc5Wf4WFb/lJjFA1V6Iq
	 H1001qHAZHWhbIpl9NVBROuHDL06/prSKMkrWCTGyjz6exdzu1kX7D/eZWmSiUPm6v
	 E+NeKqnmeVahF+VDzKg0eJGgHpJAIbbtfcNAtR1vywCCEzXjrAZwf3gEex8jTTVpNh
	 8AJNmW5qhGoJQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E847560A14;
	Wed, 10 Jun 2026 20:33:49 +0800 (AWST)
Message-ID: <4839c31f666b612799a795bb47c884901fd2a903.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/2] soc: aspeed: add BMC-side PCIe BMC device driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>, 
	joel@jms.id.au
Cc: andrew@lunn.ch, jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, 
	ninad@linux.ibm.com, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 10 Jun 2026 22:03:49 +0930
In-Reply-To: <af322e76d34ad504e0bdec470293a017b489cfd7.1780929570.git.gregoire.layet@9elements.com>
References: <cover.1780929570.git.gregoire.layet@9elements.com>
	 <af322e76d34ad504e0bdec470293a017b489cfd7.1780929570.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_053357_293212_294DA1B7 
X-CRM114-Status: GOOD (  32.11  )
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

Hello Gr=C3=A9goire,

On Mon, 2026-06-08 at 14:51 +0000, Gr=C3=A9goire Layet wrote:
> Taken from ASPEED 6.18 Kernel SDK

It's probably best to use ASPEED's SDK as a source of inspiration for
fixing obscure bugs, but not send drivers directly extracted from it.

>=20
> Add support for VUART over PCIe between BMC and host.
> This add BMC side driver.
>=20
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> Tested-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> ---
> =C2=A0drivers/soc/aspeed/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 ++
> =C2=A0drivers/soc/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/soc/aspeed/aspeed-bmc-dev.c | 187 +++++++++++++++++++++++++=
+++

We should avoid adding more drivers in drivers/soc/aspeed where we can.

Is this really necessary?

> =C2=A03 files changed, 195 insertions(+)
> =C2=A0create mode 100644 drivers/soc/aspeed/aspeed-bmc-dev.c
>=20
> diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> index f579ee0b5afa..3e1fcf3c3268 100644
> --- a/drivers/soc/aspeed/Kconfig
> +++ b/drivers/soc/aspeed/Kconfig
> @@ -4,6 +4,13 @@ if ARCH_ASPEED || COMPILE_TEST
> =C2=A0
> =C2=A0menu "ASPEED SoC drivers"
> =C2=A0
> +config ASPEED_BMC_DEV
> +	tristate "ASPEED BMC Device"
> +	default n
> +	help
> +	=C2=A0 Enable support for the ASPEED AST2600 BMC Device.
> +	=C2=A0 This exposes the PCIe-to-LPC bridge of the BMC to the host over =
PCIe.
> +
> =C2=A0config ASPEED_LPC_CTRL
> =C2=A0	tristate "ASPEED LPC firmware cycle control"
> =C2=A0	select REGMAP
> diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
> index b35d74592964..fab0d247df66 100644
> --- a/drivers/soc/aspeed/Makefile
> +++ b/drivers/soc/aspeed/Makefile
> @@ -1,4 +1,5 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_ASPEED_BMC_DEV)		+=3D aspeed-bmc-dev.o
> =C2=A0obj-$(CONFIG_ASPEED_LPC_CTRL)		+=3D aspeed-lpc-ctrl.o
> =C2=A0obj-$(CONFIG_ASPEED_LPC_SNOOP)		+=3D aspeed-lpc-snoop.o
> =C2=A0obj-$(CONFIG_ASPEED_UART_ROUTING)	+=3D aspeed-uart-routing.o
> diff --git a/drivers/soc/aspeed/aspeed-bmc-dev.c b/drivers/soc/aspeed/asp=
eed-bmc-dev.c
> new file mode 100644
> index 000000000000..7a204b543c97
> --- /dev/null
> +++ b/drivers/soc/aspeed/aspeed-bmc-dev.c
> @@ -0,0 +1,187 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (C) ASPEED Technology Inc.
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/errno.h>
> +
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +
> +#include <linux/regmap.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/syscon.h>
> +
> +#define SCU_TRIGGER_MSI
> +
> +/* AST2600 SCU */
> +#define ASPEED_SCU04			0x04
> +#define AST2600A3_SCU04				0x05030303
> +#define ASPEED_SCUC20			0xC20
> +#define ASPEED_SCUC24			0xC24

These could all use properly descriptive names.

Pinctrl is an exception because of how the documentation is structured.

> +#define MSI_ROUTING_MASK			GENMASK(11, 10)
> +#define PCIDEV1_INTX_MSI_HOST2BMC_EN		BIT(18)
> +#define MSI_ROUTING_PCIe2LPC_PCIDEV0		(0x1 << 10)
> +#define MSI_ROUTING_PCIe2LPC_PCIDEV1		(0x2 << 10)
> +
> +#define ASPEED_SCU_PCIE_CONF_CTRL	0xC20
> +#define=C2=A0 SCU_PCIE_CONF_BMC_DEV_EN			 BIT(8)
> +#define=C2=A0 SCU_PCIE_CONF_BMC_DEV_EN_MMIO		 BIT(9)
> +#define=C2=A0 SCU_PCIE_CONF_BMC_DEV_EN_MSI		 BIT(11)
> +#define=C2=A0 SCU_PCIE_CONF_BMC_DEV_EN_IRQ		 BIT(13)
> +#define=C2=A0 SCU_PCIE_CONF_BMC_DEV_EN_DMA		 BIT(14)
> +#define=C2=A0 SCU_PCIE_CONF_BMC_DEV_EN_E2L		 BIT(15)
> +#define=C2=A0 SCU_PCIE_CONF_BMC_DEV_EN_LPC_DECODE BIT(21)
> +
> +#define ASPEED_SCU_BMC_DEV_CLASS	0xC68
> +
> +
> +struct aspeed_platform {
> +	int (*init)(struct platform_device *pdev);
> +};
> +
> +struct aspeed_bmc_device {
> +	struct device *dev;
> +	int id;
> +	void __iomem *reg_base;
> +
> +	int pcie2lpc;
> +	int irq;
> +
> +	const struct aspeed_platform *platform;
> +
> +	struct regmap *scu;
> +	int pcie_irq;
> +};
> +
> +
> +static int aspeed_ast2600_init(struct platform_device *pdev)
> +{
> +	struct aspeed_bmc_device *bmc_device =3D platform_get_drvdata(pdev);
> +	struct device *dev =3D &pdev->dev;
> +	u32 pcie_config_ctl =3D SCU_PCIE_CONF_BMC_DEV_EN_IRQ |
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SCU_PCIE_CONF_BMC_DEV_EN_MMIO | SCU_PC=
IE_CONF_BMC_DEV_EN;
> +	u32 scu_id;
> +
> +	bmc_device->scu =3D syscon_regmap_lookup_by_phandle(dev->of_node, "aspe=
ed,scu");

We should rather look at auxbus for the SCU.

> +	if (IS_ERR(bmc_device->scu)) {
> +		dev_err(&pdev->dev, "failed to find SCU regmap\n");
> +		return PTR_ERR(bmc_device->scu);
> +	}
> +
> +	if (bmc_device->pcie2lpc)
> +		pcie_config_ctl |=3D SCU_PCIE_CONF_BMC_DEV_EN_E2L |
> +				=C2=A0=C2=A0 SCU_PCIE_CONF_BMC_DEV_EN_LPC_DECODE;
> +
> +	regmap_update_bits(bmc_device->scu, ASPEED_SCU_PCIE_CONF_CTRL,
> +			=C2=A0=C2=A0 pcie_config_ctl, pcie_config_ctl);
> +
> +	/* update class code to others as it is a MFD device */
> +	regmap_write(bmc_device->scu, ASPEED_SCU_BMC_DEV_CLASS, 0xff000000);
> +
> +#ifdef SCU_TRIGGER_MSI

I don't see that this needs to be a CPP test. This could be a C test.
The construct would be optimised because of the constant and we'd get
compile time coverage of both sides without additional configuration.

Have you tested both sides?

> +	//SCUC24[17]: Enable PCI device 1 INTx/MSI from SCU560[15]. Will be add=
ed in next version
> +	regmap_update_bits(bmc_device->scu, ASPEED_SCUC20, BIT(11) | BIT(14), B=
IT(11) | BIT(14));

These bits need descriptive macros.

> +
> +	regmap_read(bmc_device->scu, ASPEED_SCU04, &scu_id);
> +	if (scu_id =3D=3D AST2600A3_SCU04)
> +		regmap_update_bits(bmc_device->scu, ASPEED_SCUC24,
> +				=C2=A0=C2=A0 PCIDEV1_INTX_MSI_HOST2BMC_EN | MSI_ROUTING_MASK,
> +				=C2=A0=C2=A0 PCIDEV1_INTX_MSI_HOST2BMC_EN | MSI_ROUTING_PCIe2LPC_PCI=
DEV1);
> +	else
> +		regmap_update_bits(bmc_device->scu, ASPEED_SCUC24,
> +				=C2=A0=C2=A0 BIT(17) | BIT(14) | BIT(11), BIT(17) | BIT(14) | BIT(11=
));

As do these

> +#else
> +	//SCUC24[18]: Enable PCI device 1 INTx/MSI from Host-to-BMC controller.
> +	regmap_update_bits(bmc_device->scu, 0xc24, BIT(18) | BIT(14), BIT(18) |=
 BIT(14));

And these.

> +#endif
> +
> +
> +	return 0;
> +}
> +
> +
> +static struct aspeed_platform ast2600_plaform =3D {
> +	.init =3D aspeed_ast2600_init
> +};
> +
> +
> +static const struct of_device_id aspeed_bmc_device_of_matches[] =3D {
> +	{ .compatible =3D "aspeed,ast2600-bmc-device", .data =3D &ast2600_plafo=
rm },

This compatible isn't documented in this series and isn't present in
linux-next at a87737435cfa ("Add linux-next specific files for
20260608"). You'll need to address that if it's reasonable to continue
down this path. I expect you'll want to avoid it, and define any
necessary properties on the SCU node rather than add further children.

> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, aspeed_bmc_device_of_matches);
> +
> +static int aspeed_bmc_device_probe(struct platform_device *pdev)
> +{
> +	struct aspeed_bmc_device *bmc_device;
> +	struct device *dev =3D &pdev->dev;

This shortcut is defined but inconsistently used.

> +	const void *md =3D of_device_get_match_data(dev);

I think we can do without this, see below.

> +	int ret =3D 0;
> +
> +	if (!md)
> +		return -ENODEV;
> +
> +	bmc_device =3D devm_kzalloc(&pdev->dev, sizeof(struct aspeed_bmc_device=
), GFP_KERNEL);
> +	if (!bmc_device)
> +		return -ENOMEM;
> +	dev_set_drvdata(dev, bmc_device);
> +
> +	bmc_device->platform =3D md;
> +
> +	bmc_device->id =3D of_alias_get_id(dev->of_node, "bmcdev");
> +	if (bmc_device->id < 0)
> +		bmc_device->id =3D 0;
> +
> +	bmc_device->dev =3D dev;
> +	bmc_device->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(bmc_device->reg_base))
> +		return PTR_ERR(bmc_device->reg_base);
> +
> +	bmc_device->irq =3D platform_get_irq(pdev, 0);

This seems unnecessary.

> +	if (bmc_device->irq < 0) {
> +		dev_err(&pdev->dev, "platform get of irq[=3D%d] failed!\n", bmc_device=
->irq);
> +		return bmc_device->irq;
> +	}
> +
> +	if (of_property_read_bool(dev->of_node, "pcie2lpc"))

This property isn't documented.

> +		bmc_device->pcie2lpc =3D 1;
> +
> +	ret =3D bmc_device->platform->init(pdev);

The driver only supports one SoC, this indirection seems unnecessary
right now. We can add that later when there's a need to differentiate.
I'd rather you call the setup function directly for now.

> +	if (ret) {
> +		dev_err(dev, "Initialize bmc device failed\n");
> +		goto out;
> +	}
> +
> +	dev_info(dev, "aspeed bmc device: driver successfully loaded.\n");
> +
> +	return 0;
> +
> +out:
> +	dev_warn(dev, "aspeed bmc device: driver init failed (ret=3D%d)!\n", re=
t);
> +	return ret;
> +}
> +
> +static void aspeed_bmc_device_remove(struct platform_device *pdev)
> +{
> +	struct aspeed_bmc_device *bmc_device =3D platform_get_drvdata(pdev);
> +
> +	devm_free_irq(&pdev->dev, bmc_device->irq, bmc_device);
> +	devm_kfree(&pdev->dev, bmc_device);

These are unnecessary due to cleanup of devres on release.

Andrew

