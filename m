Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4497CC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uT29tK1X+zzdSzlTrvlxuqbFiFhBRPSANstyBBDVrSw=; b=WzWk3oi2ldo2VN0zXvhQGz1+LY
	VKvoW8r4/HP8JvWGX3UnL3o3nAa1WAtFTV/1oCnd5+zPzpunVmUzc6HuzXocfXemWA9yyv3Jzx7cu
	KSa3Mt7sUTTiNksc6Dtg9yI8dKJeS0ZyUoNB0nteZVc+vBiSq3K8m5Xywu6S5ztnHK3qtHh9uR59r
	v+WxoZrIk9/ERLp+xpPvqgfJEXNknKQ5mB1xOIXrDeOSQ8EYcz6FptgYt5GpU37Ku/p9ccLq79a0P
	ZKmIod1KaR8QW3oaB+u83ETxKG/mrTJSx+kotPKfuuIY8eSmrpE4rb9M7z4QtPBlX4aW5wl++beHZ
	U4Q23RBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXSJ-0000000H2Dr-0z2b;
	Mon, 24 Aug 2026 16:23:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXSH-0000000H2DC-1dWE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787588604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uT29tK1X+zzdSzlTrvlxuqbFiFhBRPSANstyBBDVrSw=;
	b=DzDUiQmFqyn8HNd/MlryR4ianoB0p6E5RNw2qGyhD5IceYli1xrFBPDxeufuYNJKqLv+Rv
	WUSHMFDK4+3zqiBIL5Drc0RcF1PMFSKK8N9osBV7Fcpv38KtiC3K207hcRVo3ldIHYQqdh
	rwcDQ/Q8z2l2A/lv/7GDP2IgbAWaCyE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-HgvhOy0MNMaeaUOPB9zoSA-1; Mon, 24 Aug 2026 12:23:20 -0400
X-MC-Unique: HgvhOy0MNMaeaUOPB9zoSA-1
X-Mimecast-MFC-AGG-ID: HgvhOy0MNMaeaUOPB9zoSA_1787588600
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52827090cc5so962491cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 09:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787588600; x=1788193400;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uT29tK1X+zzdSzlTrvlxuqbFiFhBRPSANstyBBDVrSw=;
        b=AL/Uswmun97mIzOWcRRKN90IXhEZxolpstUEOqFYqOP+YPJOweJiglhSlPxtneNQE4
         tZZtSEJ95rvUlcUWrNtWfB5v/VGpFrBGjW52DoPY5C15VPxdtqGDsVICLcWFggaKfoFJ
         okhuGw3c3pVZ6ey7whNij9XTETZOJCpQwUXdiCIh7SzTDX4Tg6+NayqEbgNJH4xUiJJq
         8c9Dnspu0x2abyCX6XcraX7ztasM61aZj8GYN1ZQSDbvaf8Jodemb2lIpRIb3uWgyxGS
         t5o4qBuN52+fSuRlraf21Cx4MuInjm6sr6ecR9t6Q86QkUJ7Fo1Epql9pjWsrcCiw47q
         5kcg==
X-Forwarded-Encrypted: i=1; AHgh+RpD8DeIKjiKArfwQbZFL0WNDEuQJEx9+CDR6kPTIYw/0Ci++maTRy5cGYBF/APPf25uDFlkYTvxef6vhn7u71uz@lists.infradead.org
X-Gm-Message-State: AFuF++ny5pNUTjD4dWtYCgd77f0fpUTKA0Isb6o1k0OUSeYiM3cmo44R
	diYPbY7BVcpaLgegsipQ7uIRkT0eps4496EOYuO60A9kzJlwr9yu0ogQRJJvdfJL23b7Y6gdEKa
	0hajRA+fyd2HEOfYCh/VXv06uO52o3QcYUP9LqMtABZOVk6+v/eCok8wDORjHtrd/KQKzMWmFcL
	XW
X-Gm-Gg: AR+sD13F5jghMuGB/slgjKtqTBkm18Opw4/2gRZyDMtVykEOBvP6AvWiTzO1vuqiUGk
	x+VhddNIAd5/9rfH9iHzAbkdDjKzthRzEu5z/pMqkhRElJpEqN0leYYP/HtPxNoXgpEg2rNNozK
	JpYXc9g+fO+Jvem1ZlQHPcXNUTLtuiDLZzj5ziysGoREXetalIfjueJJXDUjymHuv1UA0GSHuyn
	MoCD8LjQeI4mxRVOtk2cFzZOOdUsCWU/S8u1BHH7nnHPxPNwZC8XzATnKIv2jWIK9oBF8x2XP24
	QxWUL97Ul9P06LqpwhRQWenh4h5XvJyMYPbry1MSA3fZpqdr9VWoxCpk4JvbKh+Rs1wjMtPAZ0H
	n/+7Qxc98aUCg2fxT0MOJb+GH7/bny0v68oA=
X-Received: by 2002:a05:622a:11cf:b0:51b:fcc1:a0b7 with SMTP id d75a77b69052e-52e2ec51619mr4730651cf.8.1787588599993;
        Mon, 24 Aug 2026 09:23:19 -0700 (PDT)
X-Received: by 2002:a05:622a:11cf:b0:51b:fcc1:a0b7 with SMTP id d75a77b69052e-52e2ec51619mr4729811cf.8.1787588599474;
        Mon, 24 Aug 2026 09:23:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c935e1768sm65958086d6.3.2026.08.24.09.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:23:18 -0700 (PDT)
Date: Mon, 24 Aug 2026 12:23:16 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v13 04/11] clk: realtek: Introduce common probe() and
 remove()
Message-ID: <aoxv9PJd6r_8DaNA@redhat.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-5-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260812020009.3480538-5-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9XGY9b7Sw2q9MmdjrX6dG-tdySc5WPP2CDY5VGvCwgA_1787588600
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_092325_504981_886FB471 
X-CRM114-Status: GOOD (  37.45  )
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

Hi Yu-Chun,

On Wed, Aug 12, 2026 at 10:00:02AM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
> and add the clock provider.
> 
> Add rtk_clk_remove() to clear the regmap pointers in the clock descriptors
> during driver unbind to prevent dangling pointers.
> 
> Additionally, if the "#reset-cells" property is present in the device tree,
> it creates and registers an auxiliary device using the provided aux_name.
> This allows the dedicated reset driver to bind to this device, enabling
> both clock and reset drivers to share the same regmap.
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v13:
> - None.
> ---
>  MAINTAINERS                          |  1 +
>  drivers/clk/Kconfig                  |  1 +
>  drivers/clk/Makefile                 |  1 +
>  drivers/clk/realtek/Kconfig          | 30 ++++++++++
>  drivers/clk/realtek/Makefile         |  4 ++
>  drivers/clk/realtek/clk-rtk-common.c | 83 ++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-rtk-common.h | 38 +++++++++++++
>  7 files changed, 158 insertions(+)
>  create mode 100644 drivers/clk/realtek/Kconfig
>  create mode 100644 drivers/clk/realtek/Makefile
>  create mode 100644 drivers/clk/realtek/clk-rtk-common.c
>  create mode 100644 drivers/clk/realtek/clk-rtk-common.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a752551f32f9..e55eb1c06119 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22746,6 +22746,7 @@ M:	Cheng-Yu Lee <cylee12@realtek.com>
>  M:	Yu-Chun Lin <eleanor.lin@realtek.com>
>  S:	Supported
>  F:	Documentation/devicetree/bindings/clock/realtek*
> +F:	drivers/clk/realtek/*
>  F:	drivers/reset/realtek/*
>  F:	include/dt-bindings/clock/realtek*
>  F:	include/dt-bindings/reset/realtek*
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 1717ce75a907..97ad817457db 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -525,6 +525,7 @@ source "drivers/clk/nuvoton/Kconfig"
>  source "drivers/clk/pistachio/Kconfig"
>  source "drivers/clk/qcom/Kconfig"
>  source "drivers/clk/ralink/Kconfig"
> +source "drivers/clk/realtek/Kconfig"
>  source "drivers/clk/renesas/Kconfig"
>  source "drivers/clk/rockchip/Kconfig"
>  source "drivers/clk/samsung/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index cc108a75a900..b1aa373e9f84 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -141,6 +141,7 @@ obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
>  obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
>  obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
>  obj-y					+= ralink/
> +obj-$(CONFIG_COMMON_CLK_REALTEK)	+= realtek/
>  obj-y					+= renesas/
>  obj-$(CONFIG_COMMON_CLK_ROCKCHIP)	+= rockchip/
>  obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> new file mode 100644
> index 000000000000..ed97531e321d
> --- /dev/null
> +++ b/drivers/clk/realtek/Kconfig
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config COMMON_CLK_REALTEK
> +	tristate "Clock driver for Realtek SoCs"
> +	depends on ARCH_REALTEK || COMPILE_TEST
> +	default ARCH_REALTEK
> +	help
> +	  Enable the common clock framework infrastructure for Realtek
> +	  system-on-chip platforms.
> +
> +	  This provides the base support required by individual Realtek
> +	  clock controller drivers to expose clocks to peripheral devices.
> +
> +	  If you have a Realtek-based platform, say Y.
> +
> +if COMMON_CLK_REALTEK
> +
> +config RTK_CLK_COMMON
> +	tristate "Realtek Clock Common"
> +	depends on RESET_CONTROLLER
> +	select AUXILIARY_BUS
> +	select MFD_SYSCON
> +	select RESET_RTK_COMMON
> +	help
> +	  Common helper code shared by Realtek clock controller drivers.
> +
> +	  This provides utility functions and data structures used by
> +	  multiple Realtek clock implementations, and include integration
> +	  with reset controllers where required.
> +
> +endif
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> new file mode 100644
> index 000000000000..13000ed4ba11
> --- /dev/null
> +++ b/drivers/clk/realtek/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
> +
> +clk-rtk-y += clk-rtk-common.o
> diff --git a/drivers/clk/realtek/clk-rtk-common.c b/drivers/clk/realtek/clk-rtk-common.c
> new file mode 100644
> index 000000000000..e8422ecbad79
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include "clk-rtk-common.h"
> +
> +static int rtk_reset_controller_register(struct device *dev, const char *aux_name,
> +					 struct regmap *map)
> +{
> +	struct auxiliary_device *adev;
> +
> +	if (!of_property_present(dev->of_node, "#reset-cells"))
> +		return 0;
> +
> +	if (!aux_name) {
> +		dev_err(dev, "DTS requires reset controller, but aux_name is missing\n");
> +		return -EINVAL;
> +	}
> +
> +	adev = devm_auxiliary_device_create(dev, aux_name, (void *)map);
> +	if (!adev)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	struct clk_hw *hw;
> +	int i, ret;
> +
> +	regmap = device_node_to_regmap(dev->of_node);

Looking at the Sashiko comments for this series. device_node_to_regmap()
has this note in drivers/mfd/syscon.c:

/**
 * device_node_to_regmap() - Get or create a regmap for specified device node
 * @np: Device tree node
 *
 * Get a regmap for the specified device node. If there's not an existing
 * regmap, then one is instantiated. This function should not be used if the
 * device node has a custom regmap driver or has resources (clocks, resets) to
 * be managed. Use syscon_node_to_regmap() instead for those cases.
 *
 * Return: regmap ptr on success, negative error code on failure.
 */

Should this be moved to syscon_node_to_regmap()?

> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "failed to get regmap\n");
> +
> +	for (i = 0; i < desc->num_clks; i++)
> +		desc->clks[i]->regmap = regmap;
> +
> +	for (i = 0; i < desc->clk_data->num; i++) {
> +		hw = desc->clk_data->hws[i];
> +		if (!hw)
> +			continue;
> +
> +		ret = devm_clk_hw_register(dev, hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register hw of clk%d\n", i);
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					  desc->clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add clock provider\n");
> +
> +	platform_set_drvdata(pdev, (void *)desc);
> +
> +	return rtk_reset_controller_register(dev, desc->aux_name, regmap);
> +}
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_probe, "CLK_REALTEK");
> +
> +void rtk_clk_remove(struct platform_device *pdev)
> +{
> +	const struct rtk_clk_desc *desc = platform_get_drvdata(pdev);
> +
> +	if (!desc)
> +		return;
> +
> +	for (int i = 0; i < desc->num_clks; i++)
> +		desc->clks[i]->regmap = NULL;

Looking at the Sashiko comments, is this remove callback really needed?

Brian


