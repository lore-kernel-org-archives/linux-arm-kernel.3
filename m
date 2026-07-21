Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E26C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 23:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auMz2LN5tHJag03mf+TQgvTRqEM9EzBNH8krKUgiijs=; b=1D/xHotDmiRbSVaU9fbfjOyWgE
	6Iym+OJjIhMLjOYFkZkA0x/bgsSIPdfWfMNCqRjz3VyIxnpKAhkXL1pP/0DZfCo54wL80rP3HUcly
	0FimPBEPubFrJ4Lc4K48UMYuXvyAzarEvFPdBZPYphTZrkrqBRW8wobIdo3Z9Tke3BlwN4slp3Buj
	ZJsQPFUb5Ct74+nky2qADXM3MpNTteiK32gLKsA5l1TfZ7icW/N7zDstHFRab6aEC5fgeWx+qsSFW
	HdcS4O84q9PONxl6uVL/c88GF+SIWPifw7TA0leotzPaaCGLJy6i6ZmbLSFTC1CnEXx3py4MFYd5L
	wd2T7wjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJyH-0000000Aao5-1DB0;
	Tue, 21 Jul 2026 23:33:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJyD-0000000AanL-3Ndx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 23:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784676832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=auMz2LN5tHJag03mf+TQgvTRqEM9EzBNH8krKUgiijs=;
	b=Dp9chIdOXIML/8DmN4j62mf/5irX2HDKruX9LU7TNq2jsp7H8bDrk65vEWbBqfehDLBTwe
	t83ihASJ3hFCAj75H8k0pCtcrPr9tvQ+iXbRc3Nye7vbgHiwYoSi19V2MtpzBgrnTkWpy6
	DIhck4i2Asi8m4RLSadG8hukqXgPsoM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-zS4w9TcmP36aDlE_MmTqew-1; Tue, 21 Jul 2026 19:33:50 -0400
X-MC-Unique: zS4w9TcmP36aDlE_MmTqew-1
X-Mimecast-MFC-AGG-ID: zS4w9TcmP36aDlE_MmTqew_1784676830
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so1530384585a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 16:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676830; x=1785281630;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auMz2LN5tHJag03mf+TQgvTRqEM9EzBNH8krKUgiijs=;
        b=Oux3/z6KWDG1qrK8dok9OEuRCsWSxVVv4vu9aUYyn3r6eAZeGPP61AzgeneKOpdkP2
         Y56nhNjyyQrrOt2mDW9E/Sgj/yjHpezImElNvLAifZUmyeaynt94IqtqiiR000O5MkOR
         dd9K6i7TJYDGBh2H4Hm0NnEuZR/ZZrYuobjugsiBdmpGGj+T7AgqW02lvrzvmvZpYvQb
         M31rsgam20Msc9sqxAlA3RxqoXNvGmgn8jMVAK8MK3/PVUO7ZdZFuxt5y/CocrWEOqlY
         65Y+Oxf1aljdqetnXFvg4eIgaQZz0gW+W2xsnkDo2YbahMZBguRyDy27nQ0Y0F/B8RQQ
         bvlA==
X-Forwarded-Encrypted: i=1; AHgh+RrfDAcDhNEdiRitZ2+QpGlmbwdpaPQwe2eZAexVKPfILuABoTpiGfXQ3b99IDqq1jxbzgd6ldhHyoOXqjYqRcYX@lists.infradead.org
X-Gm-Message-State: AOJu0YxaE8LAIIkZeMKhNraqf0821BfwGeeib3ucPJSNGzk6vz+V70Lh
	Wo7GPRpxG/z1Vu8Xaaf21KCqHkaCqxqHUP5mLsjAIVMCZBV9b/z3Y6YrfcQcH83Fkq7tpzTUU2s
	FEE6t9p/stxZ70RkkNLkl81MSe4+wfzWVU4o8fsjhYdRW4Xj8fuxnV7mpYyHYf0HItPuc9R9ypd
	b8
X-Gm-Gg: AR+sD132gtMDrxHDebIXTvkpiFufRR8GXzErUmRtLROwj3PA3ulFNYHxm8A+ddOKYoS
	DTe1loFlXULIcFEUoX8A/W59AwWp7sWejVD8XIH/dNMYWb8daICMfJ4Wydqm2Pxn89Ya1tVcvWD
	yZDFwGqYLhJyN1jHs26/6rabYVViPaXbu20+e358Cbm4BJmjiqIPL6Krlk06xGI4BH8iwhI28fd
	9VMXybikFE49bBZR7Ak30B6cP0orCaX6WEgW+3Qg2AgwmbCj60xvI1fc1urDhrTpDU9sUQSrLPd
	v+VBS/AjGVKnQi/sh9rprAjbTNzI4Lj18aiYtPy0XJxrugOvV+K6iTY7XTmfou9dcMuDx/2y1Nl
	8yirNsmQX/+KXeE9aMBgiPM2NZ82szLiudow=
X-Received: by 2002:a05:620a:1711:b0:916:1a02:1965 with SMTP id af79cd13be357-930b41b1a22mr2261450485a.50.1784676830129;
        Tue, 21 Jul 2026 16:33:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1711:b0:916:1a02:1965 with SMTP id af79cd13be357-930b41b1a22mr2261448185a.50.1784676829600;
        Tue, 21 Jul 2026 16:33:49 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a88b88sm15993885a.42.2026.07.21.16.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:33:48 -0700 (PDT)
Date: Tue, 21 Jul 2026 19:33:46 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v10 04/11] clk: realtek: Introduce a common probe()
Message-ID: <amAB2rr8UxY7QsCn@redhat.com>
References: <20260713155630.3054636-1-eleanor.lin@realtek.com>
 <20260713155630.3054636-5-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260713155630.3054636-5-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vBpX1zLOeRtRo6F5S79nycowAioUqmf9Cg4KFRgLWnI_1784676830
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_163354_258967_7D2A4C62 
X-CRM114-Status: GOOD (  33.74  )
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

On Mon, Jul 13, 2026 at 11:56:23PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
> and add the clock provider.
> 
> Additionally, if the "#reset-cells" property is present in the device tree,
> it creates and registers an auxiliary device using the provided aux_name.
> This allows the dedicated reset driver to bind to this device, enabling
> both clock and reset drivers to share the same regmap.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v10:
> Add 'aux_name' to 'struct rtk_clk_desc'
> ---
>  MAINTAINERS                          |  1 +
>  drivers/clk/Kconfig                  |  1 +
>  drivers/clk/Makefile                 |  1 +
>  drivers/clk/realtek/Kconfig          | 30 ++++++++++++
>  drivers/clk/realtek/Makefile         |  4 ++
>  drivers/clk/realtek/clk-rtk-common.c | 70 ++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-rtk-common.h | 37 +++++++++++++++
>  7 files changed, 144 insertions(+)
>  create mode 100644 drivers/clk/realtek/Kconfig
>  create mode 100644 drivers/clk/realtek/Makefile
>  create mode 100644 drivers/clk/realtek/clk-rtk-common.c
>  create mode 100644 drivers/clk/realtek/clk-rtk-common.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 02b34a53b258..1fffb1fc5de1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22742,6 +22742,7 @@ L:	devicetree@vger.kernel.org
>  L:	linux-clk@vger.kernel.org
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
> index 000000000000..cea7d94313da
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.c
> @@ -0,0 +1,70 @@
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
> +
> +	if (!adev)

Remove extra newline

> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	int i, ret;
> +
> +	regmap = device_node_to_regmap(dev->of_node);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "failed to get regmap\n");
> +
> +	for (i = 0; i < desc->num_clks; i++)
> +		desc->clks[i]->regmap = regmap;
> +
> +	for (i = 0; i < desc->clk_data->num; i++) {
> +		struct clk_hw *hw = desc->clk_data->hws[i];
> +
> +		if (!hw)

Remove extra newline.

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
> +	return rtk_reset_controller_register(dev, desc->aux_name, regmap);
> +}
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_probe, "REALTEK_CLK");
> +
> +MODULE_DESCRIPTION("Realtek clock infrastructure");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/realtek/clk-rtk-common.h b/drivers/clk/realtek/clk-rtk-common.h
> new file mode 100644
> index 000000000000..d2aee7f421b4
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2016-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_COMMON_H
> +#define __CLK_REALTEK_COMMON_H
> +
> +#include <linux/clk-provider.h>
> +
> +#define __clk_regmap_hw(_p) ((_p)->hw)
> +
> +struct device;
> +struct platform_device;
> +struct regmap;
> +
> +struct clk_regmap {

Please rename this to clk_rtk_regmap. drivers/clk/qcom/clk-regmap.h
already has this name, and they won't collide, but it makes things like
grep less ambiguous with a unique name.

Brian


