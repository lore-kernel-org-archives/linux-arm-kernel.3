Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6498D25930
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 03:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+wJDvvkLgH2UDTYsi9MlTpptgvACrcwt0Fqg9GukiA=; b=IHBl2aHwvvX9a9fexd8BvS0ubc
	EgYUCBiYCKqWmxvBQcpsKZy/sl0GFB9TmKZGmxhz31Lqbzhl2eE5c+Ziubev2meP8B6CFp+VsftCt
	7WB7fzdp50th0WXobjiM/bUrGbT+Y9R5ms1pX5+b9NxmUIiNqNz8gH0zKo1O4Xh3ZOafTq+f7LYrQ
	ukZ7gOCaBADI3/kDmEYE62EbU7LbfunOWLDXdOTfLr9iu1LHj9XmTSzF4wp6C9K9YA6/XET3qJJuZ
	7ibV9lnziDatWejL3yjmGTrroAY+8Z4gi5hoXX9maQLVeZUyczgIqv7Xz2kVXz+rEHFLIzZuEOw6B
	3L2bm/2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZvY-0000000DblX-3Dd5;
	Tue, 27 Jan 2026 03:39:40 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZvV-0000000DblC-3U6n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 03:39:39 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c227206e6dcso3491990a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 19:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769485176; x=1770089976; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S+wJDvvkLgH2UDTYsi9MlTpptgvACrcwt0Fqg9GukiA=;
        b=aWNLnpGa+p743uZSt5LhGf+dwpHP+9dY/7dVQLiI3deju9K6/hXVUu1WVVdXSPApi0
         HG8FroLkzNNOC/F9cCtWvPaS9sYqtv+8ExP2vrEVhyUhKNC1/HILRq0JBb3T1ui26FLH
         SKuwzyE+71EfVo1DHnTSxO17UOnX2ayAJb+oD4SxWUoO42ruZP/bqNnkOM5pr5BB0S+Z
         JicIkLBpUhINHuAzPIKYbQuCPe3HFvlYiFiWIK9q7fu/U3l4ZV5IgXOhV+o7a8FhCLiU
         Id/niPX3qA6duwZLxCsip8EWdchThXSP6lhz67GhIUnGBafrxZAPvjfW0/VVHDYO30d/
         kRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769485176; x=1770089976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+wJDvvkLgH2UDTYsi9MlTpptgvACrcwt0Fqg9GukiA=;
        b=LzjqfkBCHaNVsyDMeuuhMUz/20s50JrAcZXSOuaEK++zjaWL/WlvvPA3gW2R5bzjPA
         yv+ZkIGI2VrK09/Yq2cm+zOsp0rv36LO/yyhDYl0xnQx1SaLI+6pmiVwrnEhzg/U1GnM
         uIOwp3w87zQ9Q02PChxUAk/4WudOtMr0PUKOBxe4iXU5SvS1UpaMN2Pstm7rYPjhDo8Z
         59I+SXaSFUN48CskzY1Wagsfrs1Qk/0wTBGFiQR0jM9jAL5BEh4UrhYCBTU1+JGNbyAc
         SmzRCjFCo4lhM8ep4j910W/UVNAvGKGj6ARDjFnKrD48qf5s96yhc7CNQ4ak9hAdCWyA
         Qisg==
X-Forwarded-Encrypted: i=1; AJvYcCVxW7EQbcsRGq4k1EUDOIGz+k7qubG+6sbjIYpLAmmyyFl6IVMe97T1hve8nZbMIrFVhWx7a1DZz7nP27r5aNrP@lists.infradead.org
X-Gm-Message-State: AOJu0YwR4grSU/t/s+YI2QDXiTnfjg09+9XIv7d984bgmfemC4i0/klz
	KiXYP3O6PvsFE5QXQOi/bk6YQTPI39fPye9YKSdUcdnBYDO88EO7BzH5
X-Gm-Gg: AZuq6aKyh7amJ9LXKk5J1ZdjZxyNNbVuvRbb5VkNMMtl7GfI/FjKx3dMe8jD19533B0
	hLvG1Ir4CL4GfNvmumVL72MzMWbIVN8qPSzCZU5BAXxnCSB0h0cuAOIjWEfT6YeUUut7pLSR6Qd
	5pQQfM8hhGV9OQht0VB4soT6BLIuMtEVjG7a3EJ0tsmJZT5SDkqttgYs0k3AZPv9UQslfn0LQnb
	23RbEXjEO9yL8dC4uJshTXKyPtLhop31tGee0c+JKY6tczm2l+VRBOxCq6JppVbnkCo+CKKIZR7
	B/18yOhfv+0eiDveZFLgPYk/vRAy6c2PI672NAVUdrsLaqMaz/yj3V9z+ck6Nl2RoRQCF/5G7tq
	kxadaf6lt+bSSlHofmO10vHBVbR399KRosNbCl4VDRXPkTnnOeYeKUMVAv7X/Tadz7tiyqVXItE
	y0ASf0YF845ZsK/rQWcCBjp+uXMarQbO0WCj10dJNFlJo57dCQk274XmbZhgNavVDw
X-Received: by 2002:a17:902:db02:b0:29e:e925:1abb with SMTP id d9443c01a7336-2a870dc06ddmr4403575ad.27.1769485176393;
        Mon, 26 Jan 2026 19:39:36 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa62fsm102726925ad.18.2026.01.26.19.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 19:39:35 -0800 (PST)
Message-ID: <debbde23-d040-46de-9ecc-45e17f537b19@gmail.com>
Date: Tue, 27 Jan 2026 11:39:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/nuvoton: add MA35D1 display controller driver
To: Maxime Ripard <mripard@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
 yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260126085727.2568958-1-a0987203069@gmail.com>
 <20260126085727.2568958-4-a0987203069@gmail.com>
 <20260126-caracara-of-sudden-unity-b4dcd7@houat>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260126-caracara-of-sudden-unity-b4dcd7@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_193937_947820_99FBB547 
X-CRM114-Status: GOOD (  24.45  )
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


On 1/26/2026 8:50 PM, Maxime Ripard wrote:
> On Mon, Jan 26, 2026 at 04:57:27PM +0800, Joey Lu wrote:
>> +static int ma35_crtc_atomic_set_property(struct drm_crtc *drm_crtc,
>> +					 struct drm_crtc_state *state,
>> +					 struct drm_property *property,
>> +					 uint64_t value)
>> +{
>> +	struct ma35_crtc *crtc = ma35_crtc(drm_crtc);
>> +
>> +	if (property == crtc->dpi_format_prop)
>> +		crtc->dpi_format = value;
>> +	else if (property == crtc->dither_enable_prop)
>> +		crtc->dither_enable = value;
>> +	else if (property == crtc->dither_depth_prop)
>> +		crtc->dither_depth = value;
>> +	else
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ma35_crtc_atomic_get_property(struct drm_crtc *drm_crtc,
>> +					 const struct drm_crtc_state *state,
>> +					 struct drm_property *property,
>> +					 uint64_t *value)
>> +{
>> +	struct ma35_crtc *crtc = ma35_crtc(drm_crtc);
>> +
>> +	if (property == crtc->dpi_format_prop)
>> +		*value = crtc->dpi_format;
>> +	else if (property == crtc->dither_enable_prop)
>> +		*value = crtc->dither_enable;
>> +	else if (property == crtc->dither_depth_prop)
>> +		*value = crtc->dither_depth;
>> +	else
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
> You shouldn't have any driver specific properties.
>
> The bar to add new ones is pretty high too (see
> https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#requirements and
> https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-userspace-requirements)
>
> So I'd suggest you to drop them for now.
Got it. I'll drop them and rely on internal defaults.
>> +int ma35_crtc_init(struct ma35_drm *priv)
>> +{
>> +	struct drm_device *drm_dev = &priv->drm_dev;
>> +	struct device *dev = drm_dev->dev;
>> +	struct ma35_crtc *crtc;
>> +	struct ma35_layer *layer_primary, *layer_cursor;
>> +	struct drm_plane *cursor_plane = NULL;
>> +	int ret;
>> +
>> +	crtc = devm_kzalloc(dev, sizeof(*crtc), GFP_KERNEL);
>> +	if (!crtc)
>> +		return -ENOMEM;
> Allocating a crtc with a devm helper isn't memory safe. You must use a
> drmm helper.
I'll fix it.
>> +static int ma35_drm_probe(struct platform_device *pdev)
>> +{
>> +	struct device_node *of_node = pdev->dev.of_node;
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *mem_node;
>> +	struct resource res;
>> +	struct ma35_drm *priv;
>> +	struct drm_device *drm_dev;
>> +	void __iomem *base;
>> +	struct regmap *regmap = NULL;
>> +	int irq;
>> +	int ret;
>> +
>> +	/* Check for reserved memory. Fallback to dynamic allocation if undefined */
>> +	mem_node = of_parse_phandle(of_node, "memory-region", 0);
>> +	if (mem_node) {
>> +		ret = of_address_to_resource(mem_node, 0, &res);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to parse reserved memory resource: %d\n", ret);
>> +			of_node_put(mem_node);
>> +			return ret;
>> +		}
>> +		of_node_put(mem_node);
>> +		dev_info(dev, "registering reserved memory %pR\n", &res);
>> +
>> +		ret = of_reserved_mem_device_init(dev);
>> +		if (ret && ret != -ENODEV) {
>> +			dev_err(dev, "Failed to init memory region\n");
>> +			goto error_early;
>> +		}
>> +	}
> That part doesn't make much sense to me. Can you explain / add a comment
> on why simply calling of_reserved_mem_device_init doesn't work?
You're right. I'll simplify the code to rely solely on that helper and 
remove the misleading comment.
>> +	base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(base)) {
>> +		dev_err(dev, "Failed to map I/O base\n");
>> +		ret = PTR_ERR(base);
>> +		goto error_reserved_mem;
>> +	}
>> +	regmap = devm_regmap_init_mmio(dev, base, &ma35_drm_regmap_config);
>> +	if (IS_ERR(regmap)) {
>> +		dev_err(dev, "Failed to create regmap for I/O\n");
>> +		ret = PTR_ERR(regmap);
>> +		goto error_reserved_mem;
>> +	}
>> +
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (irq < 0) {
>> +		ret = -ENODEV;
>> +		goto error_reserved_mem;
>> +	}
>> +
>> +	priv = devm_drm_dev_alloc(dev, &ma35_drm_driver,
>> +				     struct ma35_drm, drm_dev);
>> +	if (IS_ERR(priv)) {
>> +		ret = PTR_ERR(priv);
>> +		goto error_reserved_mem;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, priv);
>> +	drm_dev = &priv->drm_dev;
>> +	priv->regmap = regmap;
>> +	INIT_LIST_HEAD(&priv->layers_list);
>> +
>> +	ret = ma35_clocks_prepare(priv);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to prepare clocks\n");
>> +		goto error_reserved_mem;
>> +	}
>> +
>> +	ret = devm_request_irq(dev, irq, ma35_drm_irq_handler, 0,
>> +			       dev_name(dev), priv);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to request IRQ\n");
>> +		goto error_clocks;
>> +	}
>> +
>> +	/* modeset */
>> +	ret = ma35_mode_init(priv);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to initialize KMS\n");
>> +		goto error_clocks;
>> +	}
>> +
>> +	/* plane */
>> +	ret = ma35_plane_init(priv);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to initialize layers\n");
>> +		goto error_clocks;
>> +	}
>> +
>> +	/* crtc */
>> +	ret = ma35_crtc_init(priv);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to initialize CRTC\n");
>> +		goto error_clocks;
>> +	}
>> +
>> +	/* interface */
>> +	ret = ma35_interface_init(priv);
>> +	if (ret) {
>> +		if (ret != -EPROBE_DEFER)
>> +			drm_err(drm_dev, "Failed to initialize interface\n");
>> +
>> +		goto error_clocks;
>> +	}
>> +
>> +	drm_mode_config_reset(drm_dev);
>> +
>> +	ret = drm_dev_register(drm_dev, 0);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to register DRM device\n");
>> +		goto error_mode;
>> +	}
>> +
>> +	drm_client_setup(drm_dev, NULL);
>> +
>> +	return 0;
>> +
>> +error_mode:
>> +	ma35_mode_fini(priv);
>> +
>> +error_clocks:
>> +	ma35_clocks_unprepare(priv);
>> +
>> +error_reserved_mem:
>> +	of_reserved_mem_device_release(dev);
>> +
>> +error_early:
>> +	return ret;
>> +}
>> +
>> +static void ma35_drm_remove(struct platform_device *pdev)
>> +{
>> +	struct ma35_drm *priv = platform_get_drvdata(pdev);
>> +	struct device *dev = &pdev->dev;
>> +	struct drm_device *drm_dev = &priv->drm_dev;
>> +
>> +	drm_dev_unregister(drm_dev);
>> +	drm_atomic_helper_shutdown(drm_dev);
>> +
>> +	ma35_mode_fini(priv);
>> +
>> +	ma35_clocks_unprepare(priv);
>> +
>> +	of_reserved_mem_device_release(dev);
>> +}
>> +
>> +static void ma35_drm_shutdown(struct platform_device *pdev)
>> +{
>> +	struct ma35_drm *priv = platform_get_drvdata(pdev);
>> +	struct drm_device *drm_dev = &priv->drm_dev;
>> +
>> +	drm_atomic_helper_shutdown(drm_dev);
>> +}
>> +
>> +static __maybe_unused int ma35_drm_suspend(struct device *dev)
>> +{
>> +	struct ma35_drm *priv = dev_get_drvdata(dev);
>> +	struct drm_device *drm_dev = &priv->drm_dev;
>> +
>> +	return drm_mode_config_helper_suspend(drm_dev);
>> +}
>> +
>> +static __maybe_unused int ma35_drm_resume(struct device *dev)
>> +{
>> +	struct ma35_drm *priv = dev_get_drvdata(dev);
>> +	struct drm_device *drm_dev = &priv->drm_dev;
>> +
>> +	return drm_mode_config_helper_resume(drm_dev);
>> +}
>> +
>> +static const struct of_device_id ma35_drm_of_table[] = {
>> +	{ .compatible = "nuvoton,ma35d1-dcu" },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, ma35_drm_of_table);
>> +
>> +static const struct dev_pm_ops ma35_pm_ops = {
>> +	SET_SYSTEM_SLEEP_PM_OPS(ma35_drm_suspend, ma35_drm_resume)
>> +};
>> +
>> +static struct platform_driver ma35_drm_platform_driver = {
>> +	.probe		= ma35_drm_probe,
>> +	.remove		= ma35_drm_remove,
>> +	.shutdown	= ma35_drm_shutdown,
>> +	.driver		= {
>> +		.name		= "ma35-drm",
>> +		.of_match_table	= ma35_drm_of_table,
>> +		.pm = &ma35_pm_ops,
>> +	},
>> +};
>> +
>> +module_platform_driver(ma35_drm_platform_driver);
>> +
>> +MODULE_AUTHOR("Joey Lu <a0987203069@gmail.com>");
>> +MODULE_DESCRIPTION("Nuvoton MA35 series DRM driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/gpu/drm/nuvoton/ma35_drm.h b/drivers/gpu/drm/nuvoton/ma35_drm.h
>> new file mode 100644
>> index 000000000000..68da6b11a323
>> --- /dev/null
>> +++ b/drivers/gpu/drm/nuvoton/ma35_drm.h
>> @@ -0,0 +1,48 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Nuvoton DRM driver
>> + *
>> + * Copyright (C) 2026 Nuvoton Technology Corp.
>> + *
>> + * Author: Joey Lu <a0987203069@gmail.com>
>> + */
>> +
>> +#ifndef _MA35_DRM_H_
>> +#define _MA35_DRM_H_
>> +
>> +#include <linux/regmap.h>
>> +#include <linux/types.h>
>> +#include <drm/drm_device.h>
>> +
>> +#include "ma35_regs.h"
>> +#include "ma35_plane.h"
>> +#include "ma35_crtc.h"
>> +#include "ma35_interface.h"
>> +
>> +#define DRIVER_MAJOR	1
>> +#define DRIVER_MINOR	0
>> +
>> +#define MA35_INT_STATE_DISP0	BIT(0)
>> +
>> +#define MA35_DISPLAY_ALIGN_PIXELS	32
>> +#define MA35_DISPLAY_PREFER_DEPTH	32
>> +
>> +#define MA35_CURSOR_WIDTH	32
>> +#define MA35_CURSOR_HEIGHT	32
>> +
>> +#define MA35_DISPLAY_MAX_ZPOS	3
>> +
>> +#define ma35_drm(d) \
>> +	container_of(d, struct ma35_drm, drm_dev)
>> +
>> +struct ma35_drm {
>> +	struct drm_device drm_dev;
>> +	struct regmap *regmap;
>> +	struct list_head layers_list;
>> +	struct ma35_crtc *crtc;
>> +	struct ma35_interface *interface;
>> +	struct clk *dcuclk;
>> +	struct clk *dcupclk;
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/nuvoton/ma35_interface.c b/drivers/gpu/drm/nuvoton/ma35_interface.c
>> new file mode 100644
>> index 000000000000..48d1535ace2f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/nuvoton/ma35_interface.c
>> @@ -0,0 +1,192 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Nuvoton DRM driver
>> + *
>> + * Copyright (C) 2026 Nuvoton Technology Corp.
>> + *
>> + * Author: Joey Lu <a0987203069@gmail.com>
>> + */
>> +
>> +#include <linux/types.h>
>> +#include <linux/clk.h>
>> +
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_bridge.h>
>> +#include <drm/drm_connector.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_edid.h>
>> +#include <drm/drm_encoder.h>
>> +#include <drm/drm_gem_dma_helper.h>
>> +#include <drm/drm_modeset_helper_vtables.h>
>> +#include <drm/drm_of.h>
>> +#include <drm/drm_panel.h>
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_probe_helper.h>
>> +#include <drm/drm_simple_kms_helper.h>
>> +
>> +#include "ma35_drm.h"
>> +
>> +#define ma35_encoder(e) \
>> +	container_of(e, struct ma35_interface, drm_encoder)
>> +#define ma35_connector(c) \
>> +	container_of(c, struct ma35_interface, drm_connector)
>> +
>> +static void ma35_encoder_mode_set(struct drm_encoder *encoder,
>> +	struct drm_crtc_state *crtc_state,
>> +	struct drm_connector_state *conn_state)
>> +{
>> +	struct drm_device *drm_dev = encoder->dev;
>> +	struct ma35_drm *priv = ma35_drm(drm_dev);
>> +	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
>> +	int result;
>> +
>> +	clk_set_rate(priv->dcupclk, adjusted_mode->clock * 1000);
>> +	result = DIV_ROUND_UP(clk_get_rate(priv->dcupclk), 1000);
>> +	drm_dbg(drm_dev, "Pixel clock: %d kHz; request : %d kHz\n", result, adjusted_mode->clock);
>> +}
>> +
>> +static int ma35_encoder_atomic_check(struct drm_encoder *encoder,
>> +					struct drm_crtc_state *crtc_state,
>> +					struct drm_connector_state *conn_state)
>> +{
>> +	struct ma35_interface *interface = ma35_encoder(encoder);
>> +	struct drm_display_info *display_info = &conn_state->connector->display_info;
>> +
>> +	interface->bus_flags = display_info->bus_flags;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct drm_encoder_helper_funcs ma35_encoder_helper_funcs = {
>> +	.atomic_mode_set	= ma35_encoder_mode_set,
>> +	.atomic_check		= ma35_encoder_atomic_check,
>> +};
>> +
>> +static const struct drm_connector_funcs ma35_connector_funcs = {
>> +	.reset			= drm_atomic_helper_connector_reset,
>> +	.fill_modes		= drm_helper_probe_single_connector_modes,
>> +	.destroy		= drm_connector_cleanup,
>> +	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
>> +	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
>> +};
>> +
>> +static int ma35_connector_get_modes(struct drm_connector *drm_connector)
>> +{
>> +	struct ma35_drm *priv = ma35_drm(drm_connector->dev);
>> +	struct drm_device *drm_dev = &priv->drm_dev;
>> +	struct drm_mode_config *mode_config = &drm_dev->mode_config;
>> +	struct ma35_interface *interface = ma35_connector(drm_connector);
>> +	int count;
>> +
>> +	if (!interface->drm_panel) {
>> +		/* Use the default modes */
>> +		count = drm_add_modes_noedid(drm_connector,
>> +				mode_config->max_width, mode_config->max_height);
>> +		drm_set_preferred_mode(drm_connector,
>> +				mode_config->max_width, mode_config->max_height);
>> +
>> +		return count;
>> +	} else {
>> +		return drm_panel_get_modes(interface->drm_panel, drm_connector);
>> +	}
>> +}
>> +
>> +static const struct drm_connector_helper_funcs ma35_connector_helper_funcs = {
>> +	.get_modes		= ma35_connector_get_modes,
>> +};
>> +
>> +static void ma35_encoder_attach_crtc(struct ma35_drm *priv)
>> +{
>> +	uint32_t possible_crtcs = drm_crtc_mask(&priv->crtc->drm_crtc);
>> +
>> +	priv->interface->drm_encoder.possible_crtcs = possible_crtcs;
>> +}
>> +
>> +static int ma35_bridge_try_attach(struct ma35_drm *priv, struct ma35_interface *interface)
>> +{
>> +	struct drm_device *drm_dev = &priv->drm_dev;
>> +	struct device *dev = drm_dev->dev;
>> +	struct device_node *of_node = dev->of_node;
>> +	struct drm_bridge *bridge;
>> +	struct drm_panel *panel;
>> +	int ret;
>> +
>> +	ret = drm_of_find_panel_or_bridge(of_node, 0, 0, &panel, &bridge);
>> +
>> +	if (ret) {
>> +		drm_info(drm_dev, "No panel or bridge found\n");
>> +		return ret;
>> +	}
>> +
>> +	if (panel) {
>> +		bridge = drm_panel_bridge_add_typed(panel, DRM_MODE_CONNECTOR_DPI);
>> +		if (IS_ERR(bridge))
>> +			return PTR_ERR(bridge);
>> +	}
>> +
>> +	interface->drm_panel = panel;
>> +	interface->drm_bridge = bridge;
>> +
>> +	ret = drm_bridge_attach(&interface->drm_encoder, bridge,
>> +				NULL, 0);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to attach bridge to encoder\n");
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int ma35_interface_init(struct ma35_drm *priv)
>> +{
>> +	struct ma35_interface *interface;
>> +	struct drm_device *drm_dev = &priv->drm_dev;
>> +	struct drm_encoder *drm_encoder;
>> +	int ret;
>> +
>> +	/* encoder */
>> +	interface = drmm_simple_encoder_alloc(drm_dev,
>> +					struct ma35_interface, drm_encoder, DRM_MODE_ENCODER_DPI);
>> +	if (!interface) {
>> +		drm_err(drm_dev, "Failed to initialize encoder\n");
>> +		goto error_early;
>> +	}
>> +	priv->interface = interface;
>> +	drm_encoder = &interface->drm_encoder;
>> +	drm_encoder_helper_add(drm_encoder,
>> +			       &ma35_encoder_helper_funcs);
>> +
>> +	/* attach encoder to crtc */
>> +	ma35_encoder_attach_crtc(priv);
>> +
>> +	/* attach bridge to encoder if found one in device tree */
>> +	ret = ma35_bridge_try_attach(priv, interface);
>> +	if (!ret)
>> +		return 0;
>> +
>> +	/* fallback to raw dpi connector */
>> +	ret = drm_connector_init(drm_dev, &interface->drm_connector,
>> +					&ma35_connector_funcs,
>> +					DRM_MODE_CONNECTOR_DPI);
> drmm_connector_init
I'll fix it.
>> +static int ma35_plane_atomic_check(struct drm_plane *drm_plane,
>> +				      struct drm_atomic_state *state)
>> +{
>> +	struct drm_device *drm_dev = drm_plane->dev;
>> +	struct ma35_layer *layer = ma35_layer(drm_plane);
>> +	struct drm_plane_state *new_state =
>> +		drm_atomic_get_new_plane_state(state, drm_plane);
>> +	struct drm_crtc *crtc = new_state->crtc;
>> +	struct drm_framebuffer *fb = new_state->fb;
>> +	struct drm_crtc_state *crtc_state;
>> +	bool can_position;
>> +	u32 format;
>> +
>> +	if (!crtc)
>> +		return 0;
>> +
>> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>> +	if (WARN_ON(!crtc_state))
>> +		return -EINVAL;
> You don't necessarily have a crtc state in drm_atomic_state. You should
> use drm_atomic_get_crtc_state.
I'll fix it.
>> +static int ma35_cursor_plane_atomic_check(struct drm_plane *drm_plane,
>> +				      struct drm_atomic_state *state)
>> +{
>> +	struct drm_device *drm_dev = drm_plane->dev;
>> +	struct drm_plane_state *new_state =
>> +		drm_atomic_get_new_plane_state(state, drm_plane);
>> +	struct drm_framebuffer *fb = new_state->fb;
>> +	struct drm_crtc *crtc = new_state->crtc;
>> +	struct drm_crtc_state *crtc_state;
>> +
>> +	if (!fb)
>> +		return 0;
>> +
>> +	if (!crtc)
>> +		return -EINVAL;
>> +
>> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>> +	if (WARN_ON(!crtc_state))
>> +		return -EINVAL;
> Ditto
>
I'll fix it.
>> +static int ma35_plane_set_property(struct drm_plane *drm_plane,
>> +	struct drm_plane_state *state, struct drm_property *property,
>> +	uint64_t val)
>> +{
>> +	struct ma35_layer *layer = ma35_layer(drm_plane);
>> +
>> +	if (property == layer->blend_mode_prop)
>> +		layer->config.blend_mode = val;
>> +	else if (property == layer->src_alpha_mode_prop)
>> +		layer->config.alpha_mode[0] = val;
>> +	else if (property == layer->dst_alpha_mode_prop)
>> +		layer->config.alpha_mode[1] = val;
>> +	else if (property == layer->src_color_prop)
>> +		layer->config.src_color = val;
>> +	else if (property == layer->dst_color_prop)
>> +		layer->config.dst_color = val;
>> +	else if (property == layer->swizzle_prop)
>> +		layer->config.swizzle = val;
>> +	else if (property == layer->colorkeylo_prop)
>> +		layer->config.colorkeylo = val;
>> +	else if (property == layer->colorkeyup_prop)
>> +		layer->config.colorkeyup = val;
>> +	else if (property == layer->background_prop)
>> +		layer->config.background = val;
>> +	else if (property == layer->foreground_prop)
>> +		layer->config.foreground = val;
>> +	else if (property == drm_plane->hotspot_x_property)
>> +		state->hotspot_x = val;
>> +	else if (property == drm_plane->hotspot_y_property)
>> +		state->hotspot_y = val;
>> +	else
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ma35_plane_get_property(struct drm_plane *drm_plane,
>> +	const struct drm_plane_state *state, struct drm_property *property,
>> +	uint64_t *val)
>> +{
>> +	struct ma35_layer *layer = ma35_layer(drm_plane);
>> +
>> +	if (property == layer->blend_mode_prop)
>> +		*val = layer->config.blend_mode;
>> +	else if (property == layer->src_alpha_mode_prop)
>> +		*val = layer->config.alpha_mode[0];
>> +	else if (property == layer->dst_alpha_mode_prop)
>> +		*val = layer->config.alpha_mode[1];
>> +	else if (property == layer->src_color_prop)
>> +		*val = layer->config.src_color;
>> +	else if (property == layer->dst_color_prop)
>> +		*val = layer->config.dst_color;
>> +	else if (property == layer->swizzle_prop)
>> +		*val = layer->config.swizzle;
>> +	else if (property == layer->colorkeylo_prop)
>> +		*val = layer->config.colorkeylo;
>> +	else if (property == layer->colorkeyup_prop)
>> +		*val = layer->config.colorkeyup;
>> +	else if (property == layer->background_prop)
>> +		*val = layer->config.background;
>> +	else if (property == layer->foreground_prop)
>> +		*val = layer->config.foreground;
>> +	else if (property == drm_plane->hotspot_x_property)
>> +		*val = state->hotspot_x;
>> +	else if (property == drm_plane->hotspot_y_property)
>> +		*val = state->hotspot_y;
>> +	else
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
> Same comment for the properties than for the CRTC.
I'll drop them and rely on internal defaults.
>> +static int ma35_layer_create(struct ma35_drm *priv,
>> +			      struct device_node *of_node, u32 index,
>> +			      enum drm_plane_type type)
>> +{
>> +	struct drm_device *drm_dev = &priv->drm_dev;
>> +	struct device *dev = drm_dev->dev;
>> +	struct ma35_layer *layer;
>> +	int ret;
>> +
>> +	layer = devm_kzalloc(dev, sizeof(*layer), GFP_KERNEL);
>> +	if (!layer) {
>> +		ret = -ENOMEM;
>> +		goto error;
>> +	}
> This needs to be allocated using drmm
I'll fix it.
> Maxime

Thank you very much for the detailed and careful review.

Joey


