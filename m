Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C96CF46442
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoGlOimHfHzN8euhg2o8iGnxBlJJD4ffvhCyAnDqdJs=; b=g5TA2qpUMDVUicHCkmqsGhNAlf
	Kbrwlz3CDTFhm6E3UJ+RDqk+byJFCb3M8nPns/znX3KRH0BicH9ii6K+5XhzHrpmODxsjZL9FQbPg
	9BGwRPoE8nnUS+cghugAXmafCSulzzAPymMpF3kR/aNTg89TCBjnOFXTHA3BZe2ssiLJUPDMyP5pU
	kA2mFNmEkL+rjQLsuTzyJiYHrESXw4BHU3/QUloXFrtA8MqybgoDfC8imLqqJidszbqJJk9cQKQit
	+aYJiCJmIgtjrSUIU5kyKZ3bPOhaKKV2WpVAHi0ymHHR1eBqfrk6ZJH8dhCLv33E8SrE8H3tfirMB
	z/s/aCWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24i4-00000003iUS-1FD6;
	Mon, 16 Mar 2026 09:58:04 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24i1-00000003iU5-2euK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:58:02 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w24hm-0001bl-SR; Mon, 16 Mar 2026 10:57:46 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w24hm-000Y29-0W;
	Mon, 16 Mar 2026 10:57:46 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w24hh-00000000iLn-0IUd;
	Mon, 16 Mar 2026 10:57:41 +0100
Message-ID: <0658c04655fc96829723cad1f17b3d899a1b2bbf.camel@pengutronix.de>
Subject: Re: [PATCH 2/7] soc: aspeed: Introduce core eSPI controller support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: aspeedyh <yh_chung@aspeedtech.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen
	 <ryan_chen@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, maciej.lawniczak@intel.com
Date: Mon, 16 Mar 2026 10:57:40 +0100
In-Reply-To: <20260313-upstream_espi-v1-2-9504428e1f43@aspeedtech.com>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
	 <20260313-upstream_espi-v1-2-9504428e1f43@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_025801_699849_3D840C99 
X-CRM114-Status: GOOD (  23.02  )
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

On Fr, 2026-03-13 at 18:07 +0800, aspeedyh wrote:
> Add core eSPI controller support and common code for ASPEED SoCs. The
> eSPI engine is a slave device in BMC to communicate with the Host over
> the eSPI interface.
>=20
> The initial support includes basic eSPI driver probe/remove operations,
> and provides operators for ASPEED SoCs to implement their own eSPI slave
> device drivers that are different among SoC models.
>=20
> Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
> ---
>  drivers/soc/aspeed/Kconfig            |   7 ++
>  drivers/soc/aspeed/Makefile           |   1 +
>  drivers/soc/aspeed/espi/Makefile      |   1 +
>  drivers/soc/aspeed/espi/aspeed-espi.c | 143 ++++++++++++++++++++++++++++=
++++++
>  drivers/soc/aspeed/espi/aspeed-espi.h |  27 +++++++
>  5 files changed, 179 insertions(+)
>=20
[...]
> diff --git a/drivers/soc/aspeed/espi/aspeed-espi.c b/drivers/soc/aspeed/e=
spi/aspeed-espi.c
> new file mode 100644
> index 000000000000..15d58b38bbe4
> --- /dev/null
> +++ b/drivers/soc/aspeed/espi/aspeed-espi.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Unified Aspeed eSPI driver framework for different generation SoCs
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#include "aspeed-espi.h"
> +
> +struct aspeed_espi_ops {
> +	void (*espi_pre_init)(struct aspeed_espi *espi);
> +	void (*espi_post_init)(struct aspeed_espi *espi);
> +	void (*espi_deinit)(struct aspeed_espi *espi);
> +	irqreturn_t (*espi_isr)(int irq, void *espi);
> +};
> +
> +static const struct of_device_id aspeed_espi_of_matches[] =3D {
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, aspeed_espi_of_matches);
> +
> +static int aspeed_espi_probe(struct platform_device *pdev)
> +{
> +	const struct of_device_id *match;
> +	struct aspeed_espi *espi;
> +	struct resource *res;
> +	struct device *dev;
> +	int rc;
> +
> +	dev =3D &pdev->dev;
> +	espi =3D devm_kzalloc(dev, sizeof(*espi), GFP_KERNEL);
> +	if (!espi)
> +		return -ENOMEM;
> +
[...]
> +
> +	espi->irq =3D platform_get_irq(pdev, 0);
> +	if (espi->irq < 0) {
> +		dev_err(dev, "cannot get IRQ number\n");
> +		return espi->irq;
> +	}
> +
> +	espi->rst =3D devm_reset_control_get_optional(dev, NULL);

Please use devm_reset_control_get_optional_exclusive() directly.

> +	if (IS_ERR(espi->rst)) {
> +		dev_err(dev, "cannot get reset control\n");
> +		return PTR_ERR(espi->rst);

Consider using dev_err_probe, same for the other errors.
That way the driver won't print incorrect error messages on
-EPROBE_DEFER.

[...]
> diff --git a/drivers/soc/aspeed/espi/aspeed-espi.h b/drivers/soc/aspeed/e=
spi/aspeed-espi.h
> new file mode 100644
> index 000000000000..f4ad7f61fef6
> --- /dev/null
> +++ b/drivers/soc/aspeed/espi/aspeed-espi.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Unified eSPI driver header file and data structures
> + * Copyright 2026 Aspeed Technology Inc.
> + */
> +#ifndef ASPEED_ESPI_H
> +#define ASPEED_ESPI_H
> +
> +#include <linux/irqreturn.h>
> +#include <linux/miscdevice.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +#define DEVICE_NAME		"aspeed-espi"
> +
> +struct aspeed_espi {
> +	struct platform_device *pdev;
> +	struct device *dev;

Storing both pdev and &pdev->dev seems unnecessary.
Is pdev used at all?

> +	void __iomem *regs;
> +	struct reset_control *rst;

This is missing a forward declaration for struct reset_control.


regards
Philipp

