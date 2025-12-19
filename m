Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A90D711CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 02:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCSzHpKiXbb2bBkOT8GyK4MZaq/I5AYsXDZPsc1qwlU=; b=uN/XEDG9Kb1FO8y5MgSlEqCurS
	9ElY+Oe4ZowSvtxwSK4NvpDC/3n2hLt11uTUdMaiOw6+sM73d8X5ey8NbgSRvdjD84Gs76DPRMYO7
	cwwaqcDOqMw9UKzyriuShOp4n1d2BjaN6QGOjyvmktDTERLXFzKXblEWhrtneGmX0uoyhAIDMOpL0
	nc8rvdb9qi2gTpzR9RQW9SqOPOsBeZDTlvZxzCpuV6V3FcEGnj+IOlIcWzYSm53Z3l/If7AhnNmgU
	eEtlAIla3NtbPgRMEEvJ7bHPlPflF7/T9KxFp+DWgX/ZGaxeVs+nORQZIkdleva+AOi70SdBdhGGU
	0ZhGd6Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWQ9g-00000009UYf-0ctx;
	Fri, 19 Dec 2025 02:23:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWQ9f-00000009UYT-01TI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 02:23:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78A6160008;
	Fri, 19 Dec 2025 02:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6943C4CEFB;
	Fri, 19 Dec 2025 02:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766111021;
	bh=YMn92YFjibQFd4uQy8lgsIn/VXdzKH6AJxzu5Y6ObH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VpPnThretZotbcBVMPQW1t9O7+Yh/m7F7TEud1XO6zPSgmQrGnfoLLmJPoBxjgFdZ
	 wJcAT9UzJa9fqzIdZv4+InwvAKn9pGPK59sravitKlsrA/otSAMb3IDQtcQpn3GMhC
	 ex73Lv/P+MF2opYHp8Gl5AiCCV5FR3ncfhwNZSiUwBDQHLqhat8uGL3ZguHSj7dM1i
	 tVBSTOqLVpVmTt/pVpjq+3L3qgMoX81X6r1eJeotieyqDaLHUgf2FmAGXqBpsoN4t9
	 c0O3J1ykDnWmzn0wq8IFYnNyQ4vYoX6EZijQafNUgnSkjHpDYSXI1tDAnqg4yMuXpF
	 yjVAckNDSA+iA==
Date: Thu, 18 Dec 2025 20:23:37 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v6 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Message-ID: <3bbemd2vbsfss3sqpjpokytvvzweoqrtiqygffj5vqazqk3jyq@eobv6ruriiwb>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
 <20251212194341.966387-3-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212194341.966387-3-shenwei.wang@nxp.com>
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

On Fri, Dec 12, 2025 at 01:43:38PM -0600, Shenwei Wang wrote:
> Register the RPMsg channel driver and populate remote devices defined
> under the "rpmsg" subnode upon receiving their notification messages.

Please provide a proper description of what "problem" this patch solves.

> 
> The following illustrates the expected DTS layout structure:
> 
> 	cm33: remoteproc-cm33 {
> 		compatible = "fsl,imx8ulp-cm33";
> 
> 		rpmsg {
> 			rpmsg-io-channel {
> 				gpio@0 {
> 					compatible = "fsl,imx-rpmsg-gpio";
> 					reg = <0>;

Surely there needs to be some "gpio-controller" and "#gpio-cells" here?
Would be useful if the example is somewhat complete, to give a picture
of what's actually going on.

> 				};
> 
> 				gpio@1 {
> 					compatible = "fsl,imx-rpmsg-gpio";
> 					reg = <1>;
> 				};
> 
> 				...
> 			};
> 
> 			...
> 		};
> 	};
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c   | 143 +++++++++++++++++++++++++++++++
>  include/linux/rpmsg/rpdev_info.h |  33 +++++++
>  2 files changed, 176 insertions(+)
>  create mode 100644 include/linux/rpmsg/rpdev_info.h
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 33f21ab24c92..65ee16fd66d1 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -15,6 +15,8 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> @@ -22,6 +24,8 @@
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/rpmsg.h>
> +#include <linux/rpmsg/rpdev_info.h>
>  #include <linux/workqueue.h>
>  
>  #include "imx_rproc.h"
> @@ -1016,6 +1020,141 @@ static void imx_rproc_destroy_workqueue(void *data)
>  	destroy_workqueue(workqueue);
>  }
>  
> +struct imx_rpmsg_driver {
> +	struct rpmsg_driver rpdrv;
> +	const char *compat;
> +	void *driver_data;
> +};
> +
> +static const char *channel_device_map[][2] = {
> +	{"rpmsg-io-channel", "rpmsg-gpio"},
> +};
> +
> +static int imx_rpmsg_endpoint_cb(struct rpmsg_device *rpdev, void *data,
> +				 int len, void *priv, u32 src)
> +{
> +	struct rpdev_platform_info *drvdata;
> +
> +	drvdata = dev_get_drvdata(&rpdev->dev);
> +	if (drvdata && drvdata->rx_callback)
> +		return drvdata->rx_callback(rpdev, data, len, priv, src);
> +
> +	return 0;
> +}
> +
> +static void imx_rpmsg_endpoint_remove(struct rpmsg_device *rpdev)
> +{
> +	of_platform_depopulate(&rpdev->dev);
> +}
> +
> +static int imx_rpmsg_endpoint_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpdev_platform_info *drvdata;
> +	struct imx_rpmsg_driver *imx_rpdrv;
> +	struct device *dev = &rpdev->dev;
> +	struct of_dev_auxdata *auxdata;
> +	struct rpmsg_driver *rpdrv;
> +
> +	rpdrv = container_of(dev->driver, struct rpmsg_driver, drv);
> +	imx_rpdrv = container_of(rpdrv, struct imx_rpmsg_driver, rpdrv);
> +
> +	if (!imx_rpdrv->driver_data)
> +		return -EINVAL;
> +
> +	drvdata = devm_kmemdup(dev, imx_rpdrv->driver_data, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	auxdata = devm_kzalloc(dev, sizeof(*auxdata) * 2, GFP_KERNEL);
> +	if (!auxdata)
> +		return -ENOMEM;
> +
> +	drvdata->rpdev = rpdev;
> +	auxdata[0].compatible = devm_kstrdup(dev, imx_rpdrv->compat, GFP_KERNEL);
> +	auxdata[0].platform_data = drvdata;
> +	dev_set_drvdata(dev, drvdata);
> +
> +	of_platform_populate(drvdata->channel_node, NULL, auxdata, dev);

auxiliary_bus would be a better choice, but I don't understand why you
probe a rpmsg_device for each "gpio channel" and then from that create a
platform_device.

Why don't you just make the rpmsg_device register the gpio controller
directly?

> +
> +	return 0;
> +}
> +
> +static const char *imx_of_rpmsg_is_in_map(const char *name)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(channel_device_map); i++) {
> +		if (strcmp(name, channel_device_map[i][0]) == 0)
> +			return channel_device_map[i][1];
> +	}
> +
> +	return NULL;
> +}
> +
> +static int imx_of_rpmsg_register_rpdriver(struct device_node *channel,
> +					  struct device *dev,
> +					  const char *name,
> +					  const char *compat)
> +{
> +	struct rpdev_platform_info *driver_data;
> +	struct imx_rpmsg_driver *rp_driver;
> +	struct rpmsg_device_id *rpdev_id;
> +
> +	/* rpmsg_device_id is a NULL terminated array */
> +	rpdev_id = devm_kzalloc(dev, sizeof(*rpdev_id) * 2, GFP_KERNEL);
> +	if (!rpdev_id)
> +		return -ENOMEM;
> +
> +	strscpy(rpdev_id[0].name, name, RPMSG_NAME_SIZE);
> +
> +	rp_driver = devm_kzalloc(dev, sizeof(*rp_driver), GFP_KERNEL);
> +	if (!rp_driver)
> +		return -ENOMEM;
> +
> +	driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
> +	if (!driver_data)
> +		return -ENOMEM;
> +
> +	driver_data->rproc_name = dev->of_node->name;
> +	driver_data->channel_node = channel;
> +
> +	rp_driver->rpdrv.drv.name = name;
> +	rp_driver->rpdrv.id_table = rpdev_id;
> +	rp_driver->rpdrv.probe = imx_rpmsg_endpoint_probe;
> +	rp_driver->rpdrv.remove = imx_rpmsg_endpoint_remove;
> +	rp_driver->rpdrv.callback = imx_rpmsg_endpoint_cb;
> +	rp_driver->driver_data = driver_data;
> +	rp_driver->compat = compat;
> +
> +	register_rpmsg_driver(&rp_driver->rpdrv);

This would then also imply that it's the gpio driver that registers the
rpmsg_driver.

> +
> +	return 0;
> +}
> +
> +static int rproc_of_rpmsg_node_init(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const char *compat;
> +	int ret;
> +
> +	struct device_node *np __free(device_node) = of_get_child_by_name(dev->of_node, "rpmsg");
> +	if (!np)
> +		return 0;
> +
> +	for_each_child_of_node_scoped(np, child) {
> +		compat = imx_of_rpmsg_is_in_map(child->name);
> +		if (!compat)
> +			ret = of_platform_default_populate(child, NULL, dev);

So if you don't recognize the child device node name you just register
platform_devices for each of the children?

> +		else
> +			ret = imx_of_rpmsg_register_rpdriver(child, dev, child->name, compat);
> +
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1114,6 +1253,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		goto err_put_pm;
>  	}
>  
> +	ret = rproc_of_rpmsg_node_init(pdev);
> +	if (ret < 0)
> +		dev_info(dev, "populating 'rpmsg' node failed\n");
> +
>  	return 0;
>  
>  err_put_pm:
> diff --git a/include/linux/rpmsg/rpdev_info.h b/include/linux/rpmsg/rpdev_info.h
> new file mode 100644
> index 000000000000..13e020cd028b
> --- /dev/null
> +++ b/include/linux/rpmsg/rpdev_info.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2025 NXP */
> +
> +/*
> + * @file linux/rpdev_info.h
> + *
> + * @brief Global header file for RPDEV Info
> + *
> + * @ingroup RPMSG
> + */
> +#ifndef __LINUX_RPDEV_INFO_H__
> +#define __LINUX_RPDEV_INFO_H__
> +
> +#define MAX_DEV_PER_CHANNEL    10
> +
> +/**
> + * rpdev_platform_info - store the platform information of rpdev
> + * @rproc_name: the name of the remote proc.
> + * @rpdev: rpmsg channel device
> + * @device_node: pointer to the device node of the rpdev.
> + * @rx_callback: rx callback handler of the rpdev.
> + * @channel_devices: an array of the devices related to the rpdev.
> + */
> +struct rpdev_platform_info {

I don't understand what this structure represents. Why is this glue
between the rpmsg_device and a made up platform_device needed?

> +	const char *rproc_name;

You don't need this, because you can rproc_get_by_child(&self) and then
get the remoteproc name from that.

> +	struct rpmsg_device *rpdev;
> +	struct device_node *channel_node;
> +	int (*rx_callback)(struct rpmsg_device *rpdev, void *data,
> +			   int len, void *priv, u32 src);
> +	void *channel_devices[MAX_DEV_PER_CHANNEL];

Why 10? What does it mean?

I think this becomes the list of the 10 grandchildren of the remoteproc
(per child node). So what happens if those matches against two different
drivers, what will rx_callback point to?

> +};

Regards,
Bjorn

> +
> +#endif /* __LINUX_RPDEV_INFO_H__ */
> -- 
> 2.43.0
> 

