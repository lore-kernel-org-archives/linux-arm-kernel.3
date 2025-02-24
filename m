Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181E2C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 07:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbEG05bjKWi4zdJTZUEcJ76stLxvBi8Ypf83cOcK1e0=; b=Uz2e7Htrf0I8BLqYvdMBEcnfHI
	XTqxYm6PvphT5NzBlq9OaK3FkXRyitEQsTBEQGXMEFGW5533MSrWCT276xHr5ghboXYkoYSwejbkM
	XdDt748gq8Y2cNfjOo2Fr6DXh7zmodyi0q7K0uyD6mT5WfY+3aWMiQmZSDX0p3Om/eJVPQ+h5V8tI
	SwNhY6jQm+OCYP2+bFR/3QWgf9tsztlzmYMwveSFAYZyCCQP5AsL3gqy18NE7wVAIK8aRH7zAUh5q
	SyplPjXU6ivN1Ia3JJn9hrwRY2ajqz/VHpxHLtX84FnY47jvYHwpmv/ozawK9l69kckZE4UAxQcCi
	7zn5pdVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTLH-0000000CboY-3STC;
	Mon, 24 Feb 2025 07:57:31 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTJj-0000000CbfS-3L6C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 07:55:57 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tmTJS-00024I-Up; Mon, 24 Feb 2025 08:55:38 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tmTJS-002YWc-1Y;
	Mon, 24 Feb 2025 08:55:38 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tmTJS-00FNGw-1D;
	Mon, 24 Feb 2025 08:55:38 +0100
Date: Mon, 24 Feb 2025 08:55:38 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: Re: [PATCH 3/5] bus: add driver for IMX AIPSTZ bridge
Message-ID: <20250224075538.7oetjzllqqr2mlnt@pengutronix.de>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
 <20250221191909.31874-4-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221191909.31874-4-laurentiumihalcea111@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_235555_851142_EAA740BD 
X-CRM114-Status: GOOD (  35.14  )
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

Hi Laurentiu,

thanks for your patch.

On 25-02-21, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The secure AHB to IP Slave (AIPSTZ) bus bridge provides access control
> configurations meant to restrict access to certain peripherals.
> Some of the configurations include:
> 
> 	1) Marking masters as trusted for R/W. Based on this
> 	(and the configuration of the accessed peripheral), the bridge
> 	may choose to abort the R/W transactions issued by certain
> 	masters.

Setting these bits requires very often that the core is running at EL3
(e.g. secure-monitor) which is not the case for Linux. Can you please
provide more information how Linux can set these bits?

Regards,
  Marco


> 
> 	2) Allowing/disallowing write accesses to peripherals.
> 
> Add driver for this IP. Since there's currently no framework for
> access controllers (and since there's currently no need for having
> flexibility w.r.t the configurations) all this driver does is it
> applies a relaxed, "default" configuration, in which all masters
> are trusted for R/W.
> 
> Note that some instances of this IP may be tied to a power domain and may
> lose their configuration when the domain is powered off. This is why the
> configuration has to be restored when the domain is powered on.
> 
> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  drivers/bus/Kconfig      |  6 +++
>  drivers/bus/Makefile     |  1 +
>  drivers/bus/imx-aipstz.c | 92 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 99 insertions(+)
>  create mode 100644 drivers/bus/imx-aipstz.c
> 
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index ff669a8ccad9..fe7600283e70 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -87,6 +87,12 @@ config HISILICON_LPC
>  	  Driver to enable I/O access to devices attached to the Low Pin
>  	  Count bus on the HiSilicon Hip06/7 SoC.
>  
> +config IMX_AIPSTZ
> +	tristate "Support for IMX Secure AHB to IP Slave bus (AIPSTZ) bridge"
> +	depends on ARCH_MXC
> +	help
> +	  Enable support for IMX AIPSTZ bridge.
> +
>  config IMX_WEIM
>  	bool "Freescale EIM DRIVER"
>  	depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> index cddd4984d6af..8e693fe8a03a 100644
> --- a/drivers/bus/Makefile
> +++ b/drivers/bus/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_FSL_MC_BUS)	+= fsl-mc/
>  
>  obj-$(CONFIG_BT1_APB)		+= bt1-apb.o
>  obj-$(CONFIG_BT1_AXI)		+= bt1-axi.o
> +obj-$(CONFIG_IMX_AIPSTZ)	+= imx-aipstz.o
>  obj-$(CONFIG_IMX_WEIM)		+= imx-weim.o
>  obj-$(CONFIG_INTEL_IXP4XX_EB)	+= intel-ixp4xx-eb.o
>  obj-$(CONFIG_MIPS_CDMM)		+= mips_cdmm.o
> diff --git a/drivers/bus/imx-aipstz.c b/drivers/bus/imx-aipstz.c
> new file mode 100644
> index 000000000000..75696eac8ba2
> --- /dev/null
> +++ b/drivers/bus/imx-aipstz.c
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#define IMX_AIPSTZ_MPR0 0x0
> +
> +struct imx_aipstz_config {
> +	u32 mpr0;
> +};
> +
> +static void imx_aipstz_apply_default(void __iomem *base,
> +				     const struct imx_aipstz_config *default_cfg)
> +{
> +	writel(default_cfg->mpr0, base + IMX_AIPSTZ_MPR0);
> +}
> +
> +static int imx_aipstz_probe(struct platform_device *pdev)
> +{
> +	void __iomem *base;
> +	const struct imx_aipstz_config *default_cfg;
> +
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (IS_ERR(base))
> +		return dev_err_probe(&pdev->dev, -ENOMEM,
> +				     "failed to get/ioremap memory\n");
> +
> +	default_cfg = of_device_get_match_data(&pdev->dev);
> +
> +	imx_aipstz_apply_default(base, default_cfg);
> +
> +	dev_set_drvdata(&pdev->dev, base);
> +
> +	pm_runtime_set_active(&pdev->dev);
> +	devm_pm_runtime_enable(&pdev->dev);
> +
> +	return devm_of_platform_populate(&pdev->dev);
> +}
> +
> +static int imx_aipstz_runtime_resume(struct device *dev)
> +{
> +	void __iomem *base;
> +	const struct imx_aipstz_config *default_cfg;
> +
> +	base = dev_get_drvdata(dev);
> +	default_cfg = of_device_get_match_data(dev);
> +
> +	/* restore potentially lost configuration during domain power-off */
> +	imx_aipstz_apply_default(base, default_cfg);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops imx_aipstz_pm_ops = {
> +	RUNTIME_PM_OPS(NULL, imx_aipstz_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +};
> +
> +/*
> + * following configuration is equivalent to:
> + *	masters 0-7 => trusted for R/W + use AHB's HPROT[1] to det. privilege
> + */
> +static const struct imx_aipstz_config imx8mp_aipstz_default_cfg = {
> +	.mpr0 = 0x77777777,
> +};
> +
> +static const struct of_device_id imx_aipstz_of_ids[] = {
> +	{ .compatible = "fsl,imx8mp-aipstz", .data = &imx8mp_aipstz_default_cfg },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, imx_aipstz_of_ids);
> +
> +static struct platform_driver imx_aipstz_of_driver = {
> +	.probe = imx_aipstz_probe,
> +	.driver = {
> +		.name = "imx-aipstz",
> +		.of_match_table = imx_aipstz_of_ids,
> +		.pm = pm_ptr(&imx_aipstz_pm_ops),
> +	},
> +};
> +module_platform_driver(imx_aipstz_of_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("IMX secure AHB to IP Slave bus (AIPSTZ) bridge driver");
> +MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
> -- 
> 2.34.1
> 
> 
> 

