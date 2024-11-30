Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D5ED735F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpRQspEiuHgaK9/cz1EDevOchifMLvBhbguqiLnF3lA=; b=fQLbFdqMfLBwOI2MC4ebfxAaM4
	kfjeok8IubB8rM6RhLpvQphs4mQb4rYJtmuSaksDlqq1bUJduAGDAfBlKBadqNBnwwpK58reI0706
	tPi5ZPYs/EUb9LJjfmlEQ1+JWrHJVLBawqnc2VfQ8A0c6FSIoSEZwKERBzA15QsbDVPisrT+OwPEh
	qqR5EnZzaRz8n+MGmEkiv8i2iReixohSAHNstm2FaqRwOO27TRRblTMk5+/9D69CvAUxiA8IcWa8k
	PozVKdtv9FyWxRpwOyf3DuLTQMAyj7hk52Tu860NPqcBTcnu2lFboxBa923em8nAUrQM+Z+74O6dk
	Oqo8yxgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHJnr-00000001gcD-2INW;
	Sat, 30 Nov 2024 09:30:15 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHJmr-00000001gR1-2Qzl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 09:29:15 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-53dd59a2bc1so2946998e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 01:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732958951; x=1733563751; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IpRQspEiuHgaK9/cz1EDevOchifMLvBhbguqiLnF3lA=;
        b=dfrFcWYUau6liSH61A4SJIgWceR8o+fhn/Pi4TL7QDfMOgUe32Rfk5hqlB73d7WHZ3
         VcL1WFvWNmUCK/J/e8PKLUZAX61+Ff1L7W/Jn/deCzo5wnvMraDB0n6QvrhZcMdk/Rit
         Ie2+Fk49dH3eBSNgbF8gROhRy+hpZ0xe6I2k73EkljtaeQYVfkhrelefvxt27ZvB5L4p
         UeaatcoGfrVF9PuqqvbM8wHnT9G8bLBp0B6eTQLR9X8M04Vh/tGXbcjaXgxVVbGossU8
         uDHWfiYdpC6yC6+7F8Ox0HGO2WGnWz/SSz0Qsi2p9DG4qnyVnme2rCY25HW7TFMGnvXS
         LTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732958951; x=1733563751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpRQspEiuHgaK9/cz1EDevOchifMLvBhbguqiLnF3lA=;
        b=n/lBv8YUEmYk3iWSUKOXcvA75XgwhJOv0hKL4VD26JVj55vyCz0VTS/KFp3bnf9C0P
         WjtLr6ZV9p0/vrPv79775IsckX05nehuPDXIPvyFAwzAnTM8QyDp+SRc4nRTylhxRrtd
         iisnCsRBiEnvnKeMqJtURRie13GxpzKZ262t7i4AsRUh/DELkUajs6TdA5drjwQiSjii
         FLJEyhpWJYHoed1spPOMRjnUp+pO7jGXNwSBn2YiIKEEWMgV/ECH1ur+BKxZJQ6G86fq
         gJ/Nhi+64Oal8p4fTK4bwmOT8QZghMbzmRfCxN+sKrSed9/aCx7g9KPWZpw1hpxc6+gU
         7YIg==
X-Forwarded-Encrypted: i=1; AJvYcCWJnpwHqFHypeXJaGuptRC8/58kAr7L8xq/Mem6wUSIi0ue2qT/9JqUcAg/JkiF8f506W8Ng1xkx1c+OHtvArcC@lists.infradead.org
X-Gm-Message-State: AOJu0YyF3EFTy4Xl76iRGBjmHLhuQOK2mxoJ3t5otF4smszQ685zytd4
	DOMeObGSOKNWuQcF1Nq3YNoHnxP4BxkjroIeBoC4rK6PfOSYbqLdRyr9tjGd6U4=
X-Gm-Gg: ASbGncvYkM0UdgY2Q923EdG4Sg7vKL+kAcqR1+nE0d2W+7SU13XvcWZRrooYWPvYrJQ
	B02nBGohVX5CGBzsy/WHDbTu/hdBblxgs32JAujDdwLpi08zghcwSKueLRjaGgMmormp1yr6vlW
	NYB7z+4FbW7Yua3tSWvYhkjcLtgA+mlGPlfllbE1C1xj6EF79oyUpvEod1xpjJU0zgDi1rvBXPX
	YI2pTFwgP2F+rZkHf51jSbmTnUh++VwKCvOhRnytHUhTrviFS4xNZ4r8aIH+kJ7OXzcjWB8/WXQ
	pcZ087RCLnqDL0JzTrNBAZYDYB4pLg==
X-Google-Smtp-Source: AGHT+IEoAUpP4j461xugrDIohAeQkQyYVO7kZSMRugj2wAeGKt3piuntKdnV5mmKD7056IcVvwlsIQ==
X-Received: by 2002:a05:6512:3e08:b0:53d:d3cb:debb with SMTP id 2adb3069b0e04-53df0016150mr9333515e87.0.1732958951285;
        Sat, 30 Nov 2024 01:29:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f328sm722481e87.149.2024.11.30.01.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 01:29:09 -0800 (PST)
Date: Sat, 30 Nov 2024 11:29:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v2 3/5] drm: panel: Add a panel driver for the Summit
 display
Message-ID: <pokf4zrrm7utx4dlq7sfob3pb4m2dh47eyw2g345tvh75x3s2s@ylajym3brih3>
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
 <20241126-adpdrm-v2-3-c90485336c09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-adpdrm-v2-3-c90485336c09@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_012913_653155_C517AA21 
X-CRM114-Status: GOOD (  29.95  )
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

On Tue, Nov 26, 2024 at 05:34:22PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> This is the display panel used for the touchbar on laptops that have it.
> 
> Co-developed-by: Nick Chan <towinchenmi@gmail.com>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/gpu/drm/panel/Kconfig        |   9 +++
>  drivers/gpu/drm/panel/Makefile       |   1 +
>  drivers/gpu/drm/panel/panel-summit.c | 143 +++++++++++++++++++++++++++++++++++
>  3 files changed, 153 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d7469c565d1db8b8e974dd6c45d03d9352d99d63..5085a82e4bc695e85cabbc3200859bbe10cb0f91 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -925,6 +925,15 @@ config DRM_PANEL_SIMPLE
>  	  that it can be automatically turned off when the panel goes into a
>  	  low power state.
>  
> +config DRM_PANEL_SUMMIT
> +	tristate "Apple Summit display panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y if you want to enable support for the "Summit" display panel
> +	  used as a touchbar on certain Apple laptops.
> +
>  config DRM_PANEL_SYNAPTICS_R63353
>  	tristate "Synaptics R63353-based panels"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 7dcf72646cacff11bab90c78e3b8b1f357e5f14a..10ac2e850f5cd6d6546439de75483466e4015d1a 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -89,6 +89,7 @@ obj-$(CONFIG_DRM_PANEL_SHARP_LS060T1SX01) += panel-sharp-ls060t1sx01.o
>  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
>  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
>  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
> +obj-$(CONFIG_DRM_PANEL_SUMMIT) += panel-summit.o
>  obj-$(CONFIG_DRM_PANEL_SYNAPTICS_R63353) += panel-synaptics-r63353.o
>  obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
>  obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) += panel-sony-td4353-jdi.o
> diff --git a/drivers/gpu/drm/panel/panel-summit.c b/drivers/gpu/drm/panel/panel-summit.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..16bd9fa1213d7bc3f022b878ea5cfeadbd468995
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-summit.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/backlight.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_mode.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <video/mipi_display.h>
> +
> +struct summit_data {
> +	struct mipi_dsi_device *dsi;
> +	struct backlight_device *bl;
> +	struct drm_panel panel;
> +};
> +
> +static int summit_set_brightness(struct device *dev)
> +{
> +	struct summit_data *s_data = dev_get_drvdata(dev);
> +	int level = backlight_get_brightness(s_data->bl);
> +
> +	return mipi_dsi_dcs_set_display_brightness(s_data->dsi, level);
> +}

Inline this function.

> +
> +static int summit_bl_update_status(struct backlight_device *dev)
> +{
> +	return summit_set_brightness(&dev->dev);
> +}
> +
> +static int summit_bl_get_brightness(struct backlight_device *dev)
> +{
> +	return backlight_get_brightness(dev);
> +}

Should not be necessary, please drop. Moreover
backlight_get_brightness() uses blanking information to override
brightness. As such it is not suitable for the .get_brightness()
callback.

> +
> +static const struct backlight_ops summit_bl_ops = {
> +	.get_brightness = summit_bl_get_brightness,
> +	.update_status	= summit_bl_update_status,
> +};
> +
> +static int summit_get_modes(struct drm_panel *panel,
> +			    struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode = drm_mode_create(connector->dev);
> +
> +	connector->display_info.non_desktop = true;
> +	drm_object_property_set_value(&connector->base,
> +				      connector->dev->mode_config.non_desktop_property,
> +				      connector->display_info.non_desktop);
> +
> +	mode->vdisplay = 2008;
> +	mode->hdisplay = 60;
> +	mode->hsync_start = mode->hdisplay + 8;
> +	mode->hsync_end = mode->hsync_start + 80;
> +	mode->htotal = mode->hsync_end + 40;
> +	mode->vsync_start = mode->vdisplay + 1;
> +	mode->vsync_end = mode->vsync_start + 15;
> +	mode->vtotal = mode->vsync_end + 6;
> +	mode->clock = (mode->vtotal * mode->htotal * 60) / 1000;
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	mode->flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC;
> +	drm_mode_set_name(mode);
> +	drm_mode_probed_add(connector, mode);
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs summit_panel_funcs = {
> +	.get_modes = summit_get_modes,
> +};
> +
> +static int summit_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct backlight_properties props = { 0 };
> +	struct device *dev = &dsi->dev;
> +	struct summit_data *s_data;
> +	int ret;
> +
> +	s_data = devm_kzalloc(dev, sizeof(*s_data), GFP_KERNEL);
> +	if (!s_data)
> +		return -ENOMEM;
> +
> +	mipi_dsi_set_drvdata(dsi, s_data);
> +	s_data->dsi = dsi;
> +
> +	ret = device_property_read_u32(dev, "max-brightness", &props.max_brightness);
> +	if (ret)
> +		return ret;
> +	props.type = BACKLIGHT_RAW;
> +
> +	s_data->bl = devm_backlight_device_register(dev, dev_name(dev),
> +						   dev, s_data, &summit_bl_ops, &props);
> +	if (IS_ERR(s_data->bl))
> +		return PTR_ERR(s_data->bl);
> +
> +	drm_panel_init(&s_data->panel, dev, &summit_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	drm_panel_add(&s_data->panel);
> +
> +	return mipi_dsi_attach(dsi);
> +}
> +
> +static void summit_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct summit_data *s_data = mipi_dsi_get_drvdata(dsi);
> +
> +	mipi_dsi_detach(dsi);
> +	drm_panel_remove(&s_data->panel);
> +}
> +
> +static int summit_resume(struct device *dev)
> +{
> +	return summit_set_brightness(dev);

Doesn't the generic code already handle that for you?

> +}
> +
> +static int summit_suspend(struct device *dev)
> +{
> +	struct summit_data *s_data = dev_get_drvdata(dev);
> +
> +	return mipi_dsi_dcs_set_display_brightness(s_data->dsi, 0);

And here too.

> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(summit_pm_ops, summit_suspend,
> +				summit_resume);
> +
> +static const struct of_device_id summit_of_match[] = {
> +	{ .compatible = "apple,summit" },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, summit_of_match);
> +
> +static struct mipi_dsi_driver summit_driver = {
> +	.probe = summit_probe,
> +	.remove = summit_remove,
> +	.driver = {
> +		.name = "panel-summit",
> +		.of_match_table = summit_of_match,
> +		.pm = pm_sleep_ptr(&summit_pm_ops),
> +	},
> +};
> +module_mipi_dsi_driver(summit_driver);
> +
> +MODULE_DESCRIPTION("Summit Display Panel Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.47.1
> 
> 

-- 
With best wishes
Dmitry

