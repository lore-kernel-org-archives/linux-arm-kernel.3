Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF19D11193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 18:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mq2XBIpsGc4011DX1gJd43x1R00OiU+60gqNwlElNlI=; b=shc25MhgTr4xYXcUdiu5Yq2D96
	R4tBIYAYXoZTFvFtK8C1xMy6kyoknuYHh0iJCf0oh44Qv41mTOmDm2OxK2lGCU/vI25H6gSDgEouf
	V1Xbha2i4PFJsADAab3VB8vtp3xh85ik2ecgUapYlKcUZQX9/6VI0LB9/dxLYVhnVKnJtd+0m1HfS
	atlQ93Wd2ZxwKZWuC+frLSJ6wjIiln0c+8eZGiqwblnU0Q7B1h2dqfYO7glAxyuMMuhISpU0fM/hN
	3XpGP3dVUIPxt6zLaSAXKi5YuK5dXa7CZ1ukLcRNrEDtzcRbsMms+L7YIfblnej+jbQa+f8v/utDT
	/3fFZMeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKeG-0000000FWEc-2cSc;
	Wed, 26 Nov 2025 18:53:52 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKeE-0000000FWE2-2klR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 18:53:51 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7ade456b6abso21845b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 10:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764183229; x=1764788029; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mq2XBIpsGc4011DX1gJd43x1R00OiU+60gqNwlElNlI=;
        b=YYMBkK2IX5Bd18A9Yci5iD3AHE4ZQUjTmKXUS/2NeXYmeXFC4Wie+VW4BspvbLNeeu
         lPTGtbnoAGuEz+Q8VOSqLSFVH8Ac4lClxVozDrYB4vUqMJatw5XB5+hCP9v/RCq005lP
         5lfHgHlATnWEzS47E6Yk1RDK9cr07ZAon5gjuDnIAxQogxkTlkIx+YQTjS/gUrbSSgF2
         ICPP+tOb90RdPv5yICuSWuZy6kWuXy4Yf7dd/c2ZrsWWl6v0WcCjDM2a8v9EoZrxS8Zx
         RFIVI1x5gT13sI51NMLpbur4xLn2PfLDc4zYv/rOjb4taqox0Mf74h2bdSqvd68QpGEN
         F9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764183229; x=1764788029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mq2XBIpsGc4011DX1gJd43x1R00OiU+60gqNwlElNlI=;
        b=bU3jwGr99gnHlq0q0P/0+x51c7EfiYoWwKOnUCRwgf55EZ4D1p98TSnOnAYFC43tQl
         s4efXWPI6ow9SkT5qCvVx+k7UlVVm5knB/0mWFAnYIRXnPt/JxtefTxvdul4eMVMWjN9
         bkNZO2uXexui//MCqdBEgC38l9Ar2hdxjFLYS6snaXaWrTa3BjW6RJVmeAMbzbTSarQf
         Ps3PvNQo7ujKYR2TZRPJcKW66QymXGkyQ1coKr1T9HHP946nwvR+Obf0Xa7Q6WAdE+Ip
         8gFs908gvmKFrJPZpHYjWWga4qtU2uQzNy9B0fmi9EJdwrRBlP0BaQnLTwkV2joUdfhW
         FIfA==
X-Forwarded-Encrypted: i=1; AJvYcCVgbUlP5CRKd/YXA5kRaovW4l2o+BEKHfZjue51owBUWBWjEeBvftDLO2R/hNA6Cnn2RiDLABOY9Yb/lUTyjxrM@lists.infradead.org
X-Gm-Message-State: AOJu0YzUH42m6PQ7r6CcaeEowP3zT2oavkc/g7iLfofiCUrVGGdONQbN
	4c9UY8nRF5r72/JtDVTB4m/lXEmwF+6/fNzNoQCwz+dAgfIthRGse6Po7XV06GNjopM=
X-Gm-Gg: ASbGnctQAYL+GmVawvtwjd2zOnBMexHlkYptiMG7gFueweFp53kX9RZZSgLomlNy1Ol
	NkjVfIcMx8y1OGtPMZhG+MWdKWmoU0gnwhfhKI759vdLNtcuo0F86AUY6pzyXrv+EmleMQsyfZR
	daUe0zQ2RFtbRJmOWbTZZDCBpGExnmm0n7lKG835t8Dpx3PBuDFNw38UGvE7LEtnYH1RtxPHjPe
	GZowCODitSNW2nTqyrqU8Dz95Zi79XntmIgf11wuNAM+2hcpFusVeFH1DjyWDMdKrpewzUqzX4P
	4d5veBhbQOHpUfUjATrbh05bluqrd/3bd2byrbmAiYWnHwDGsISl0FZ1DnRYHNYXnkSkdQdtECq
	ItIj3vDVM3TkWgBCekj6llxJaP39jZ2Uy2V3S9BQZ1N0Zq9AnPT5L0TDua1NHKKtwIh7gwSFR0t
	kxbtnc88BcACKiiA==
X-Google-Smtp-Source: AGHT+IH6yf/l+DZHbySczlM5JQ+ydQaTEtDsP6GNL6XJXjhvoQuOXgdT0L/+TxBw8IVakjgXnzUsdw==
X-Received: by 2002:a05:6a00:1aca:b0:781:9ae1:1be6 with SMTP id d2e1a72fcca58-7c58c2b0d3amr24554854b3a.6.1764183229163;
        Wed, 26 Nov 2025 10:53:49 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:2740:a6c4:e7f4:165e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f024ace6sm22571815b3a.34.2025.11.26.10.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:53:48 -0800 (PST)
Date: Wed, 26 Nov 2025 11:53:45 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Message-ID: <aSdMufLCeqvVyKsp@p14s>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-3-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203315.85706-3-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_105350_713093_37CD5C93 
X-CRM114-Status: GOOD (  30.98  )
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

On Tue, Nov 04, 2025 at 02:33:12PM -0600, Shenwei Wang wrote:
> Register the RPMsg channel driver and populate remote devices defined
> under the "rpmsg" subnode upon receiving their notification messages.
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
> 			rpmsg-i2c-channel {
> 				i2c@0 {
> 					compatible = "fsl,imx-rpmsg-i2c";
> 					reg = <0>;
> 				};
> 			};
> 
> 			...
> 		};
> 	};
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c  | 146 ++++++++++++++++++++++++++++++++
>  include/linux/rpmsg/imx_rpmsg.h |  48 +++++++++++
>  2 files changed, 194 insertions(+)
>  create mode 100644 include/linux/rpmsg/imx_rpmsg.h
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index a6eef0080ca9..e21a7980c490 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> +#include <linux/rpmsg/imx_rpmsg.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/mailbox_client.h>
> @@ -15,6 +16,8 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> @@ -22,6 +25,7 @@
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/rpmsg.h>
>  #include <linux/workqueue.h>
>  
>  #include "imx_rproc.h"
> @@ -1084,6 +1088,144 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
>  	return NOTIFY_DONE;
>  }
>  
> +struct imx_rpmsg_driver {
> +	struct rpmsg_driver rpdrv;
> +	void *driver_data;
> +};
> +
> +static char *channel_device_map[][2] = {
> +	{"rpmsg-io-channel", "fsl,imx-rpmsg-gpio"},
> +	{"rpmsg-i2c-channel", "fsl,imx-rpmsg-i2c"},
> +};
> +
> +static int imx_rpmsg_endpoint_cb(struct rpmsg_device *rpdev, void *data,
> +				 int len, void *priv, u32 src)
> +{
> +	struct imx_rpmsg_driver_data *drvdata;
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

Where does the rpmsg_device come from?  Usually there is a call to
rpmsg_register_device() and I don't see it anywhere in this patchset.  I also
don't see a link to the remote processor.  I can't continue with this set for as
long as I don't have this information.

> +	struct imx_rpmsg_driver_data *drvdata;
> +	struct imx_rpmsg_driver *imx_rpdrv;
> +	struct device *dev = &rpdev->dev;
> +	struct of_dev_auxdata *auxdata;
> +	struct rpmsg_driver *rpdrv;
> +	int i;
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
> +	i = drvdata->map_idx;
> +	if (i >= ARRAY_SIZE(channel_device_map))
> +		return -ENODEV;
> +
> +	auxdata = devm_kzalloc(dev, sizeof(*auxdata) * 2, GFP_KERNEL);
> +	if (!auxdata)
> +		return -ENOMEM;
> +
> +	drvdata->rpdev = rpdev;
> +	auxdata[0].compatible = channel_device_map[i][1];
> +	auxdata[0].platform_data = drvdata;
> +	dev_set_drvdata(dev, drvdata);
> +
> +	of_platform_populate(drvdata->channel_node, NULL, auxdata, dev);
> +	of_node_put(drvdata->channel_node);
> +
> +	return 0;
> +}
> +
> +static int imx_of_rpmsg_is_in_map(const char *name)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(channel_device_map); i++) {
> +		if (strcmp(name, channel_device_map[i][0]) == 0)
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
> +static int imx_of_rpmsg_register_rpdriver(struct device_node *channel,
> +					  struct device *dev, int idx)
> +{
> +	struct imx_rpmsg_driver_data *driver_data;
> +	struct imx_rpmsg_driver *rp_driver;
> +	struct rpmsg_device_id *rpdev_id;
> +
> +	rpdev_id = devm_kzalloc(dev, sizeof(*rpdev_id) * 2, GFP_KERNEL);
> +	if (!rpdev_id)
> +		return -ENOMEM;
> +
> +	strscpy(rpdev_id[0].name, channel_device_map[idx][0], RPMSG_NAME_SIZE);
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
> +	driver_data->map_idx = idx;
> +
> +	rp_driver->rpdrv.drv.name = channel_device_map[idx][0];
> +	rp_driver->rpdrv.id_table = rpdev_id;
> +	rp_driver->rpdrv.probe = imx_rpmsg_endpoint_probe;
> +	rp_driver->rpdrv.remove = imx_rpmsg_endpoint_remove;
> +	rp_driver->rpdrv.callback = imx_rpmsg_endpoint_cb;
> +	rp_driver->driver_data = driver_data;
> +
> +	register_rpmsg_driver(&rp_driver->rpdrv);
> +
> +	return 0;
> +}
> +
> +static int imx_of_rpmsg_node_init(struct platform_device *pdev)
> +{
> +	struct device_node *np __free(device_node);
> +	struct device *dev = &pdev->dev;
> +	int idx, ret;
> +
> +	np = of_get_child_by_name(dev->of_node, "rpmsg");
> +	if (!np)
> +		return 0;
> +
> +	for_each_child_of_node_scoped(np, child) {
> +		idx = imx_of_rpmsg_is_in_map(child->name);
> +		if (idx < 0)
> +			ret = of_platform_default_populate(child, NULL, dev);
> +		else
> +			ret = imx_of_rpmsg_register_rpdriver(child, dev, idx);
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
> @@ -1177,6 +1319,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		goto err_put_clk;
>  	}
>  
> +	ret = imx_of_rpmsg_node_init(pdev);
> +	if (ret < 0)
> +		dev_info(dev, "populating 'rpmsg' node failed\n");
> +
>  	return 0;
>  
>  err_put_clk:
> diff --git a/include/linux/rpmsg/imx_rpmsg.h b/include/linux/rpmsg/imx_rpmsg.h
> new file mode 100644
> index 000000000000..04a5ad2d4a1d
> --- /dev/null
> +++ b/include/linux/rpmsg/imx_rpmsg.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2025 NXP */
> +
> +/*
> + * @file linux/imx_rpmsg.h
> + *
> + * @brief Global header file for iMX RPMSG
> + *
> + * @ingroup RPMSG
> + */
> +#ifndef __LINUX_IMX_RPMSG_H__
> +#define __LINUX_IMX_RPMSG_H__
> +
> +/* Category define */
> +#define IMX_RMPSG_LIFECYCLE	1
> +#define IMX_RPMSG_PMIC		2
> +#define IMX_RPMSG_AUDIO		3
> +#define IMX_RPMSG_KEY		4
> +#define IMX_RPMSG_GPIO		5
> +#define IMX_RPMSG_RTC		6
> +#define IMX_RPMSG_SENSOR	7
> +
> +/* rpmsg version */
> +#define IMX_RMPSG_MAJOR		1
> +#define IMX_RMPSG_MINOR		0
> +
> +#define MAX_DEV_PER_CHANNEL	10
> +
> +struct imx_rpmsg_head {
> +	u8 cate;	/* Category */
> +	u8 major;	/* Major version */
> +	u8 minor;	/* Minor version */
> +	u8 type;	/* Message type */
> +	u8 cmd;		/* Command code */
> +	u8 reserved[5];
> +} __packed;
> +
> +struct imx_rpmsg_driver_data {
> +	int map_idx;
> +	const char *rproc_name;
> +	struct rpmsg_device *rpdev;
> +	struct device_node *channel_node;
> +	int (*rx_callback)(struct rpmsg_device *rpdev, void *data,
> +			   int len, void *priv, u32 src);
> +	void *channel_devices[MAX_DEV_PER_CHANNEL];
> +};
> +
> +#endif /* __LINUX_IMX_RPMSG_H__ */
> -- 
> 2.43.0
> 

