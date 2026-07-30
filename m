Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EC5C55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0D6aNdXcDuOmXMxLvCN0Nd57j+uSSynSX566kWvt88=; b=ZU56+80KPp+OAUg97nf064CMwi
	pcqszni34BzkdTRXo8m5/8t2opXDPfGuCWTU8bPMMVH34fzVJXtW4L5bG/XhqQmwKdPmjDVL2BAoh
	/kOx4/+/O69x63aZljtJwD3XpysAWtA1HX022TkQCxzwqGlJLjaKQs0Kmxzn3UHFFhT/gv0jyKeh9
	jwvkGrmbguND0xaBdmApVuffmSIRG2v+Y1kTSekYibsa1GCBj4yda2FepqcfqCzOYjC23G9Ux8k4z
	KP8zgaZSMfjE2PScrkUKGA6xDarYqvO+scT3raNcE0WE+hqcVFBk8MEJ5OnMYDLp7Up3pNysBtG0p
	kHwOLwkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpU3E-0000000B3OJ-2psO;
	Thu, 30 Jul 2026 16:56:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpU3B-0000000B3NK-2tTy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785430564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W0D6aNdXcDuOmXMxLvCN0Nd57j+uSSynSX566kWvt88=;
	b=XuWZZA/W0xCj9QXeTw90MP4WKg8aESD/s46QSwuvmg6mXFv9iz2XqjuDmYOGEZkOpcjwXC
	bpMx4Ht0HTzafeecSUtcLymSpwSeytV8Z9tYF/DHFuKl9YXVUPNSPGD9u2J8iS6AP0BH+5
	yZKvy+fbQrKVdxhKcYs8TsdaiRaq8Dk=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-uRl7wZ7KOHCF9sp8e6ijIQ-1; Thu, 30 Jul 2026 12:56:03 -0400
X-MC-Unique: uRl7wZ7KOHCF9sp8e6ijIQ-1
X-Mimecast-MFC-AGG-ID: uRl7wZ7KOHCF9sp8e6ijIQ_1785430563
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-80ee3cb097eso1246227b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785430562; x=1786035362;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0D6aNdXcDuOmXMxLvCN0Nd57j+uSSynSX566kWvt88=;
        b=Tr5NPXvZv6yLLy333qbHwDklJyNxaDno//K/kuSheyirVEpe/+bA3sdeccy1Wpcfd8
         fMv581TmOXVdtfQKVudsz8J/rqeVC8W/wKKH9FQWoeuspAccCZUq5XiPAPWOV7QIntrh
         +eeqyfnkRFvYcFD4a1Xyq/HINl+t0Bum/gGTy0nZBzDDhR5DsvcwPZZxZ0sca2Tjh231
         2JKMGTclJhpAPfR6sz8XYQ3cPTC06/2wzvdP31x2+EdXxtYE7jm5uJRVAhmETDnxKtOW
         ScDjIUgqPDsSXuWQuB6t8Dug5HDOD2IamDiftMjt9xqqoU3WN6bfhz+3QmYEGrB1dwFK
         naxg==
X-Forwarded-Encrypted: i=1; AHgh+Ro13uPuCKpMFnSVbB9JO9AVq9AMRELazYQw7IZ6+pwm8Zf1idgYkMAngPugB1wt5Yz1xXO16YAClMMgEmX4R5yK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6oddzKhDdgbN8kfjnIG0ZTx+kU5d+OAZgmauP7Oh68fu75G0s
	Rvxu+11ryu/YS4JLSuScwe18Zr0cbvDATCPsx3+3QTgX94Ael+9wyZcDUTFHoYwmOAqDgoIymk6
	Oet/3hgRPsUEGJ2dK/Df9UTLP7QT/JRR4Z74ihMTri7GaJTXljBWNxoy9oI+BJ+kEk25rtC7X7L
	QG
X-Gm-Gg: AR+sD11Dolr3j0JfapDkMN02TSzMgdKoNiu97V3PO9qV+E7kX2We02d4GVIc5af7m5L
	a/u2ECGYdmddSA5wafmrt490X0og5tx6ymt+0m+VP/ArYjsbHdxmR+hGhPf4k2i7RjxEwHK/Vw1
	FtXZaUqmKi/mIK+X2oevUGGgUlfCGHSBifYiVirvXTuNiOmRtLK9jq8OkiS1w53HnMfqmeC3DEb
	dkGWvRU3FrfZTIDOpqaveYwN2oY+UOH5U+IMz9TxVE6esX5lFRcDwdSG5xXi5hKeEh6lNG/7Fpa
	/DEAmzzxCBLWaLFabMVNL9s5t4eznZnn7H3rpptmbZs0NOC3nMM5GiFQtTDyRHdZ9GVvMpkHzlz
	KnY9t0KJKRBqOOf8wXcDcuH84kXzzVdzPwj4=
X-Received: by 2002:a05:690c:63c2:b0:81f:a9e8:f7ef with SMTP id 00721157ae682-81fb88c61bamr24950957b3.1.1785430562503;
        Thu, 30 Jul 2026 09:56:02 -0700 (PDT)
X-Received: by 2002:a05:690c:63c2:b0:81f:a9e8:f7ef with SMTP id 00721157ae682-81fb88c61bamr24950527b3.1.1785430561816;
        Thu, 30 Jul 2026 09:56:01 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb88c4a92sm13487757b3.7.2026.07.30.09.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:56:01 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:55:58 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v11 10/11] clk: realtek: Add RTD1625-ISO clock controller
 driver
Message-ID: <amuCHnDAvLpdN9Sv@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-11-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260728142806.1954638-11-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FVg1FaDvfWr0XI43Xep4AmdYPH5GEdj5WhFE5Y2gjb0_1785430563
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_095606_563450_3FA7E43D 
X-CRM114-Status: GOOD (  29.02  )
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

On Tue, Jul 28, 2026 at 10:28:05PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add support for the ISO (Isolation) domain clock controller on the Realtek
> RTD1625 SoC. This controller manages clocks in the always-on power domain,
> ensuring essential services remain functional even when the main system
> power is gated.
> 
> Because the reset controller shares the same register space with this ISO
> clock controller, this driver also acts as the parent device and registers
> the reset controller as an auxiliary device on the auxiliary bus.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v11:
> - Drop the unused two MACRO.
> - Add 'rtk_' prefix into struct names and function names.
> ---
>  drivers/clk/realtek/Makefile          |   1 +
>  drivers/clk/realtek/clk-rtd1625-iso.c | 145 ++++++++++++++++++++++++++
>  2 files changed, 146 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-rtd1625-iso.c
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 15b9eec74e36..fbf8cb0db2f0 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -9,3 +9,4 @@ clk-rtk-y += clk-regmap-mux.o
>  
>  clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
>  obj-$(CONFIG_CLK_RTD1625) += clk-rtd1625-crt.o
> +obj-$(CONFIG_CLK_RTD1625) += clk-rtd1625-iso.o
> diff --git a/drivers/clk/realtek/clk-rtd1625-iso.c b/drivers/clk/realtek/clk-rtd1625-iso.c
> new file mode 100644
> index 000000000000..cd328d3961c5
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-iso.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <dt-bindings/clock/realtek,rtd1625-clk.h>
> +#include <linux/array_size.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include "clk-regmap-gate.h"
> +
> +#define RTD1625_ISO_CLK_MAX	19
> +#define RTD1625_ISO_S_CLK_MAX	5
> +
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_p4, 0, 0x4, 0, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_p3, 0, 0x4, 1, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_misc_cec0, "clk_en_misc", 0, 0x4, 2, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_cbusrx_sys, 0, 0x4, 3, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_cbustx_sys, 0, 0x4, 4, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_cbus_sys, 0, 0x4, 5, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_cbus_osc, 0, 0x4, 6, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_i2c0, 0, 0x4, 9, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_i2c1, 0, 0x4, 10, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_etn_250m, 0, 0x4, 11, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_etn_sys, 0, 0x4, 12, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_drd, 0, 0x4, 13, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_host, 0, 0x4, 14, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_u3_host, 0, 0x4, 15, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_usb, 0, 0x4, 16, 0);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_vtc, 0, 0x4, 17, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_misc_vfd, "clk_en_misc", 0, 0x4, 18, 0);
> +
> +static struct rtk_clk_regmap * const rtd1625_clk_regmap_list[] = {
> +	&clk_en_usb_p4.clkr,
> +	&clk_en_usb_p3.clkr,
> +	&clk_en_misc_cec0.clkr,
> +	&clk_en_cbusrx_sys.clkr,
> +	&clk_en_cbustx_sys.clkr,
> +	&clk_en_cbus_sys.clkr,
> +	&clk_en_cbus_osc.clkr,
> +	&clk_en_i2c0.clkr,
> +	&clk_en_i2c1.clkr,
> +	&clk_en_etn_250m.clkr,
> +	&clk_en_etn_sys.clkr,
> +	&clk_en_usb_drd.clkr,
> +	&clk_en_usb_host.clkr,
> +	&clk_en_usb_u3_host.clkr,
> +	&clk_en_usb.clkr,
> +	&clk_en_vtc.clkr,
> +	&clk_en_misc_vfd.clkr,
> +};
> +
> +static struct clk_hw_onecell_data rtd1625_iso_clk_data = {
> +	.num = RTD1625_ISO_CLK_MAX,
> +	.hws = {
> +		[RTD1625_ISO_CLK_EN_USB_P4]      = &__rtk_clk_regmap_gate_hw(&clk_en_usb_p4),
> +		[RTD1625_ISO_CLK_EN_USB_P3]      = &__rtk_clk_regmap_gate_hw(&clk_en_usb_p3),
> +		[RTD1625_ISO_CLK_EN_MISC_CEC0]   = &__rtk_clk_regmap_gate_hw(&clk_en_misc_cec0),
> +		[RTD1625_ISO_CLK_EN_CBUSRX_SYS]  = &__rtk_clk_regmap_gate_hw(&clk_en_cbusrx_sys),
> +		[RTD1625_ISO_CLK_EN_CBUSTX_SYS]  = &__rtk_clk_regmap_gate_hw(&clk_en_cbustx_sys),
> +		[RTD1625_ISO_CLK_EN_CBUS_SYS]    = &__rtk_clk_regmap_gate_hw(&clk_en_cbus_sys),
> +		[RTD1625_ISO_CLK_EN_CBUS_OSC]    = &__rtk_clk_regmap_gate_hw(&clk_en_cbus_osc),
> +		[RTD1625_ISO_CLK_EN_I2C0]        = &__rtk_clk_regmap_gate_hw(&clk_en_i2c0),
> +		[RTD1625_ISO_CLK_EN_I2C1]        = &__rtk_clk_regmap_gate_hw(&clk_en_i2c1),
> +		[RTD1625_ISO_CLK_EN_ETN_250M]    = &__rtk_clk_regmap_gate_hw(&clk_en_etn_250m),
> +		[RTD1625_ISO_CLK_EN_ETN_SYS]     = &__rtk_clk_regmap_gate_hw(&clk_en_etn_sys),
> +		[RTD1625_ISO_CLK_EN_USB_DRD]     = &__rtk_clk_regmap_gate_hw(&clk_en_usb_drd),
> +		[RTD1625_ISO_CLK_EN_USB_HOST]    = &__rtk_clk_regmap_gate_hw(&clk_en_usb_host),
> +		[RTD1625_ISO_CLK_EN_USB_U3_HOST] = &__rtk_clk_regmap_gate_hw(&clk_en_usb_u3_host),
> +		[RTD1625_ISO_CLK_EN_USB]         = &__rtk_clk_regmap_gate_hw(&clk_en_usb),
> +		[RTD1625_ISO_CLK_EN_VTC]         = &__rtk_clk_regmap_gate_hw(&clk_en_vtc),
> +		[RTD1625_ISO_CLK_EN_MISC_VFD]    = &__rtk_clk_regmap_gate_hw(&clk_en_misc_vfd),
> +	},
> +};
> +
> +static const struct rtk_clk_desc rtd1625_iso_desc = {
> +	.clk_data = &rtd1625_iso_clk_data,
> +	.clks     = rtd1625_clk_regmap_list,
> +	.num_clks = ARRAY_SIZE(rtd1625_clk_regmap_list),
> +	.aux_name = "rtd1625_iso_rst",
> +};
> +
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_irda, 0, 0x4, 6, 1);
> +static RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_ur10, 0, 0x4, 8, 1);
> +
> +static struct rtk_clk_regmap * const rtd1625_iso_s_clk_regmap_list[] = {
> +	&clk_en_irda.clkr,
> +	&clk_en_ur10.clkr,
> +};
> +
> +static struct clk_hw_onecell_data rtd1625_iso_s_clk_data = {
> +	.num = RTD1625_ISO_S_CLK_MAX,
> +	.hws = {
> +		[RTD1625_ISO_S_CLK_EN_IRDA] = &__rtk_clk_regmap_gate_hw(&clk_en_irda),
> +		[RTD1625_ISO_S_CLK_EN_UR10] = &__rtk_clk_regmap_gate_hw(&clk_en_ur10),
> +	},
> +};
> +
> +static const struct rtk_clk_desc rtd1625_iso_s_desc = {
> +	.clk_data = &rtd1625_iso_s_clk_data,
> +	.clks     = rtd1625_iso_s_clk_regmap_list,
> +	.num_clks = ARRAY_SIZE(rtd1625_iso_s_clk_regmap_list),
> +	.aux_name = "rtd1625_iso_s_rst",
> +};
> +
> +static int rtd1625_iso_probe(struct platform_device *pdev)
> +{
> +	const struct rtk_clk_desc *desc;
> +
> +	desc = of_device_get_match_data(&pdev->dev);

Same comment as previous patch. This function is deprecated.

> +	if (!desc)
> +		return -EINVAL;
> +
> +	return rtk_clk_probe(pdev, desc);
> +}
> +
> +static const struct of_device_id rtd1625_iso_match[] = {
> +	{.compatible = "realtek,rtd1625-iso-clk", .data = &rtd1625_iso_desc},
> +	{.compatible = "realtek,rtd1625-iso-s-clk", .data = &rtd1625_iso_s_desc},

Add space after the { and before the closing }

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rtd1625_iso_match);
> +
> +static struct platform_driver rtd1625_iso_driver = {
> +	.probe = rtd1625_iso_probe,
> +	.driver = {
> +		.name = "rtk-rtd1625-iso-clk",
> +		.of_match_table = rtd1625_iso_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +
> +static int __init rtd1625_iso_init(void)
> +{
> +	return platform_driver_register(&rtd1625_iso_driver);
> +}
> +subsys_initcall(rtd1625_iso_init);

Same comment as previous patch about whether or not this can use
module_platform_driver()?

> +
> +MODULE_DESCRIPTION("Realtek RTD1625 ISO Clock Controller Driver");
> +MODULE_AUTHOR("Cheng-Yu Lee <cylee12@realtek.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("REALTEK_CLK");

CLK_REALTEK

Brian


> -- 
> 2.43.0
> 


