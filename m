Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BCACD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 12:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXHIZ/2QHQoePaQPKzlHVwUBufWD4eofcOnZPnw7FJQ=; b=hmggqaikuRfRmn4T82wftqLfx+
	/PFm1pCVwkvLf8it/mikGN6dPXsz3asTBo8LdBUfXYy0EMtsJN3h4MdVQS+xTi+F3jFATK6VfmabG
	0ehW8Br+xrBjNLw35Z5YC6+bPvGue8XF1USKSssh2dccKwJGxYjHbsWDyWmgfyrXeTDTlA3Xv8jgF
	fIye1ru684N3ySlBfuTjXe9ugrABnuAuCynqwfqlUVMpLZBVYFjR3+pgOFs8YVmnzU3ui1Kd1dI+n
	evy9FlTmOtKJRrEUWILsI7sPI6tKXrFWGFlxMI3v7gPZmjgJT7cdmBOxeeXLmdC/ZakZnplnL2eWE
	XQXuq+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIPL-00000007fvd-1DDv;
	Wed, 10 Jun 2026 12:51:47 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIPJ-00000007fud-0GLM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 12:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781095902;
	bh=dXHIZ/2QHQoePaQPKzlHVwUBufWD4eofcOnZPnw7FJQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ki3xHBHQFRlzQi7vyUqcTCUOi5xajOpaqBdePmaGu0KgucW2sncQFVUtpbD3cDfLL
	 96OJHaygIW3HAjdtf+Z795GR7xUrSXIjkrNBoyQiWeiOnUxybW6t+vo8zh+M1nagIQ
	 gS8sjGxRi3nn9QyUS7Tu2tfnfMQ/hIx55x6yc582MX2KPgfY/KrmWTTLcKqnYVlM1H
	 iZJyitgJjH0eQJaiXIf+SmO7j9ij9vVv1y4ODF6Kqs+pYhxl5CaksfknXz8osyrj1D
	 RkiF2C2o2Zj3LK4tVdjFIpYuoccTSqUuHFsseI2QpSHMjAkXOlL4eM6pnHwxurql6K
	 ISvv6KmEpNgew==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8702360A17;
	Wed, 10 Jun 2026 20:51:42 +0800 (AWST)
Message-ID: <66df26f7ec827a0f48cd44c454bfd36968ca4dd0.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] soc: aspeed: add host-side PCIe BMC device driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>, 
	joel@jms.id.au
Cc: andrew@lunn.ch, jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, 
	ninad@linux.ibm.com, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 10 Jun 2026 22:21:42 +0930
In-Reply-To: <13d18d25f53e0a084a8c17219804b305d4667c6b.1780929570.git.gregoire.layet@9elements.com>
References: <cover.1780929570.git.gregoire.layet@9elements.com>
	 <13d18d25f53e0a084a8c17219804b305d4667c6b.1780929570.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_055145_357826_F6BD9BB4 
X-CRM114-Status: GOOD (  33.72  )
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

On Mon, 2026-06-08 at 14:51 +0000, Gr=C3=A9goire Layet wrote:
> Taken from ASPEED 6.18 Kernel SDK
>=20
> Add support for VUART over PCIe between BMC and host.
> This add host side driver.
>=20
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> Tested-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> ---
> =C2=A0drivers/soc/aspeed/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +
> =C2=A0drivers/soc/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/soc/aspeed/aspeed-host-bmc-dev.c | 249 ++++++++++++++++++++=
+++

Again, I'd rather we avoid drivers/soc/aspeed.

> =C2=A03 files changed, 258 insertions(+)
> =C2=A0create mode 100644 drivers/soc/aspeed/aspeed-host-bmc-dev.c
>=20
> diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> index 3e1fcf3c3268..5deefb64e8c7 100644
> --- a/drivers/soc/aspeed/Kconfig
> +++ b/drivers/soc/aspeed/Kconfig
> @@ -11,6 +11,14 @@ config ASPEED_BMC_DEV
> =C2=A0	=C2=A0 Enable support for the ASPEED AST2600 BMC Device.
> =C2=A0	=C2=A0 This exposes the PCIe-to-LPC bridge of the BMC to the host =
over PCIe.
> =C2=A0
> +config ASPEED_HOST_BMC_DEV
> +	tristate "ASPEED Host BMC Device"
> +	depends on PCI
> +	depends on SERIAL_8250
> +	help
> +	=C2=A0 Enable support for the ASPEED AST2600 BMC Device on the Host.
> +	=C2=A0 This configure the PCIe and setup two 8250 compatible VUART port=
s.
> +
> =C2=A0config ASPEED_LPC_CTRL
> =C2=A0	tristate "ASPEED LPC firmware cycle control"
> =C2=A0	select REGMAP
> diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
> index fab0d247df66..3fd3f6d8d36e 100644
> --- a/drivers/soc/aspeed/Makefile
> +++ b/drivers/soc/aspeed/Makefile
> @@ -1,5 +1,6 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> =C2=A0obj-$(CONFIG_ASPEED_BMC_DEV)		+=3D aspeed-bmc-dev.o
> +obj-$(CONFIG_ASPEED_HOST_BMC_DEV)	+=3D aspeed-host-bmc-dev.o
> =C2=A0obj-$(CONFIG_ASPEED_LPC_CTRL)		+=3D aspeed-lpc-ctrl.o
> =C2=A0obj-$(CONFIG_ASPEED_LPC_SNOOP)		+=3D aspeed-lpc-snoop.o
> =C2=A0obj-$(CONFIG_ASPEED_UART_ROUTING)	+=3D aspeed-uart-routing.o
> diff --git a/drivers/soc/aspeed/aspeed-host-bmc-dev.c b/drivers/soc/aspee=
d/aspeed-host-bmc-dev.c
> new file mode 100644
> index 000000000000..7cb52a770fb6
> --- /dev/null
> +++ b/drivers/soc/aspeed/aspeed-host-bmc-dev.c
> @@ -0,0 +1,249 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (C) ASPEED Technology Inc.
> +
> +#include <linux/init.h>
> +#include <linux/version.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/errno.h>
> +#include <linux/pci.h>
> +#include <linux/serial_core.h>
> +#include <linux/serial_8250.h>
> +
> +static DEFINE_IDA(bmc_device_ida);
> +
> +#define VUART_MAX_PARMS	2

Given the one supported piece of hardware we could avoid the associated
loops and rather extract loop bodies to functions and call the function
twice.

> +#define MAX_MSI_NUM		8
> +#define BMC_MULTI_MSI	32
> +
> +#define DRIVER_NAME "aspeed-host-bmc-dev"
> +
> +enum aspeed_platform_id {
> +	ASPEED,
> +};
> +
> +enum msi_index {
> +	VUART0_MSI,
> +	VUART1_MSI,
> +};
> +
> +/* Match msi_index */
> +static int ast2600_msi_idx_table[MAX_MSI_NUM] =3D { 16, 15 };
> +
> +struct aspeed_platform {
> +	int (*setup)(struct pci_dev *pdev);
> +};
> +
> +struct aspeed_pci_bmc_dev {
> +	struct device *dev;
> +	struct aspeed_platform *platform;
> +	kernel_ulong_t driver_data;
> +	int id;
> +
> +	unsigned long message_bar_base;
> +	unsigned long message_bar_size;
> +	void __iomem *msg_bar_reg;
> +
> +	struct uart_8250_port uart[VUART_MAX_PARMS];
> +	int uart_line[VUART_MAX_PARMS];
> +
> +	/* Interrupt
> +	 * The index of array is using to enum msi_index
> +	 */
> +	int *msi_idx_table;
> +};
> +
> +static void aspeed_pci_setup_irq_resource(struct pci_dev *pdev)
> +{
> +	struct aspeed_pci_bmc_dev *pci_bmc_dev =3D pci_get_drvdata(pdev);
> +
> +	/* Assign static msi index table by platform */
> +	pci_bmc_dev->msi_idx_table =3D ast2600_msi_idx_table;
> +
> +	if (pci_alloc_irq_vectors(pdev, 1, BMC_MULTI_MSI, PCI_IRQ_INTX | PCI_IR=
Q_MSI) <=3D 1)
> +		/* Set all msi index to the first vector */
> +		memset(pci_bmc_dev->msi_idx_table, 0, sizeof(int) * MAX_MSI_NUM);
> +}
> +
> +static int aspeed_pci_bmc_device_setup_vuart(struct pci_dev *pdev)
> +{
> +	struct aspeed_pci_bmc_dev *pci_bmc_dev =3D pci_get_drvdata(pdev);
> +	struct device *dev =3D &pdev->dev;
> +	u16 vuart_ioport;
> +	int ret, i;
> +
> +	for (i =3D 0; i < VUART_MAX_PARMS; i++) {
> +		/* Assign the line to non-exist device */
> +		pci_bmc_dev->uart_line[i] =3D -ENOENT;
> +		vuart_ioport =3D 0x3F8 - (i * 0x100);
> +		pci_bmc_dev->uart[i].port.flags =3D UPF_SKIP_TEST | UPF_BOOT_AUTOCONF =
| UPF_SHARE_IRQ;
> +		pci_bmc_dev->uart[i].port.uartclk =3D 115200 * 16;
> +		pci_bmc_dev->uart[i].port.irq =3D
> +			pci_irq_vector(pdev, pci_bmc_dev->msi_idx_table[VUART0_MSI + i]);
> +		pci_bmc_dev->uart[i].port.dev =3D dev;
> +		pci_bmc_dev->uart[i].port.iotype =3D UPIO_MEM32;
> +		pci_bmc_dev->uart[i].port.iobase =3D 0;
> +		pci_bmc_dev->uart[i].port.mapbase =3D
> +			pci_bmc_dev->message_bar_base + (vuart_ioport << 2);
> +		pci_bmc_dev->uart[i].port.membase =3D 0;
> +		pci_bmc_dev->uart[i].port.type =3D PORT_16550A;
> +		pci_bmc_dev->uart[i].port.flags |=3D (UPF_IOREMAP | UPF_FIXED_PORT | U=
PF_FIXED_TYPE);
> +		pci_bmc_dev->uart[i].port.regshift =3D 2;
> +		ret =3D serial8250_register_8250_port(&pci_bmc_dev->uart[i]);
> +		if (ret < 0) {
> +			dev_err_probe(dev, ret, "Can't setup PCIe VUART\n");
> +			return ret;
> +		}
> +		pci_bmc_dev->uart_line[i] =3D ret;
> +	}
> +	return 0;
> +}
> +
> +static void aspeed_pci_host_bmc_device_release_vuart(struct pci_dev *pde=
v)
> +{
> +	struct aspeed_pci_bmc_dev *pci_bmc_dev =3D pci_get_drvdata(pdev);
> +	int i;
> +
> +	for (i =3D 0; i < VUART_MAX_PARMS; i++) {
> +		if (pci_bmc_dev->uart_line[i] >=3D 0)
> +			serial8250_unregister_port(pci_bmc_dev->uart_line[i]);
> +	}
> +}
> +
> +static int aspeed_pci_host_setup(struct pci_dev *pdev)
> +{
> +	struct aspeed_pci_bmc_dev *pci_bmc_dev =3D pci_get_drvdata(pdev);
> +	int rc =3D 0;
> +
> +	/* Get Message BAR */
> +	pci_bmc_dev->message_bar_base =3D pci_resource_start(pdev, 1);
> +	pci_bmc_dev->message_bar_size =3D pci_resource_len(pdev, 1);
> +	pci_bmc_dev->msg_bar_reg =3D pci_ioremap_bar(pdev, 1);
> +	if (!pci_bmc_dev->msg_bar_reg)
> +		return -ENOMEM;
> +
> +	if (pdev->revision < 0x27) {
> +		/* AST2600 ERRTA40: dummy read */

Can you please rather document what problem this is actually solving.

> +		(void)__raw_readl((void __iomem *)pci_bmc_dev->msg_bar_reg);
> +	} else {
> +		/* AST2700 not supported */
> +		pr_err("AST2700 detected but not supported");

This logs an error but rc =3D 0 on return. Perhaps drop the log message
and return an appropriate error code?

> +		goto out_free0;
> +	}
> +
> +	rc =3D aspeed_pci_bmc_device_setup_vuart(pdev);
> +	if (rc) {
> +		pr_err("Cannot setup Virtual UART");
> +		goto out_free0;
> +	}
> +
> +	return 0;
> +
> +out_free0:
> +	pci_iounmap(pdev, pci_bmc_dev->msg_bar_reg);
> +
> +	return rc;
> +}
> +
> +static struct aspeed_platform aspeed_pcie_host[] =3D {
> +	{ .setup =3D aspeed_pci_host_setup },
> +	{ 0 }
> +};
> +
> +static int aspeed_pci_host_bmc_device_probe(struct pci_dev *pdev, const =
struct pci_device_id *ent)
> +{
> +	struct aspeed_pci_bmc_dev *pci_bmc_dev;
> +	int rc =3D 0;
> +
> +	pr_info("ASPEED BMC PCI ID %04x:%04x, IRQ=3D%u\n", pdev->vendor, pdev->=
device, pdev->irq);

I think we could do without this.

> +
> +	pci_bmc_dev =3D devm_kzalloc(&pdev->dev, sizeof(*pci_bmc_dev), GFP_KERN=
EL);
> +	if (!pci_bmc_dev)
> +		return -ENOMEM;
> +
> +	/* Get platform id */
> +	pci_bmc_dev->driver_data =3D ent->driver_data;
> +	pci_bmc_dev->platform =3D &aspeed_pcie_host[ent->driver_data];
> +
> +	pci_bmc_dev->id =3D ida_alloc(&bmc_device_ida, GFP_KERNEL);

This seems unnecessary.

> +	if (pci_bmc_dev->id < 0)
> +		return pci_bmc_dev->id;
> +
> +	rc =3D pci_enable_device(pdev);
> +	if (rc) {
> +		dev_err(&pdev->dev, "pci_enable_device() returned error %d\n", rc);
> +		return rc;
> +	}
> +
> +	pci_set_master(pdev);
> +	pci_set_drvdata(pdev, pci_bmc_dev);
> +
> +	/* Prepare IRQ resource */
> +	aspeed_pci_setup_irq_resource(pdev);
> +
> +	/* Setup BMC PCI device */
> +	rc =3D pci_bmc_dev->platform->setup(pdev);

As with patch 1 this indirection seems unnecessary.

> +	if (rc) {
> +		dev_err(&pdev->dev, "ASPEED PCIe Host device returned error %d\n", rc)=
;
> +		pci_free_irq_vectors(pdev);
> +		pci_disable_device(pdev);
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static void aspeed_pci_host_bmc_device_remove(struct pci_dev *pdev)
> +{
> +	struct aspeed_pci_bmc_dev *pci_bmc_dev =3D pci_get_drvdata(pdev);
> +
> +	if (pci_bmc_dev->driver_data =3D=3D ASPEED)

This condition seems unnecessary as the value shouldn't be anything
else.

> +		aspeed_pci_host_bmc_device_release_vuart(pdev);
> +
> +	ida_free(&bmc_device_ida, pci_bmc_dev->id);
> +
> +	pci_iounmap(pdev, pci_bmc_dev->msg_bar_reg);
> +
> +	pci_free_irq_vectors(pdev);
> +	pci_disable_device(pdev);
> +}
> +
> +/**
> + * This table holds the list of (VendorID,DeviceID) supported by this dr=
iver
> + *
> + */

I think that's self-evident and prefer the comment be removed.

> +static struct pci_device_id aspeed_host_bmc_dev_pci_ids[] =3D {
> +	/* ASPEED BMC Device */
> +	{ PCI_DEVICE(0x1A03, 0x2402), .class =3D 0xFF0000, .class_mask =3D 0xFF=
FF00,
> +	=C2=A0 .driver_data =3D ASPEED },
> +	{
> +		0,
> +	}
> +};
> +
> +MODULE_DEVICE_TABLE(pci, aspeed_host_bmc_dev_pci_ids);
> +
> +static struct pci_driver aspeed_host_bmc_dev_driver =3D {
> +	.name		=3D DRIVER_NAME,
> +	.id_table	=3D aspeed_host_bmc_dev_pci_ids,
> +	.probe		=3D aspeed_pci_host_bmc_device_probe,
> +	.remove		=3D aspeed_pci_host_bmc_device_remove,
> +};
> +
> +static int __init aspeed_host_bmc_device_init(void)
> +{
> +	return pci_register_driver(&aspeed_host_bmc_dev_driver);
> +}
> +
> +static void aspeed_host_bmc_device_exit(void)
> +{
> +	/* unregister pci driver */
> +	pci_unregister_driver(&aspeed_host_bmc_dev_driver);
> +}
> +
> +late_initcall(aspeed_host_bmc_device_init);
> +module_exit(aspeed_host_bmc_device_exit);

module_driver() could be used here.

> +
> +MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
> +MODULE_DESCRIPTION("ASPEED Host BMC DEVICE Driver");
> +MODULE_LICENSE("GPL");

