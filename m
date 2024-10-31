Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311F1D767E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 16:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:Mime-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rD0z2KjUaSRPGMKlVLBitkGSyEg/HiSrNCotyBt3Ws=; b=KoaX527ykfh+4AdtJ1+IMrjUd7
	wGeua9AnYaRMXp3P/ef28UwhSsyFqp/EasuwwP8/HBARc8uE2dAy8gLITI7za56Y+2wCnUGWEeE/Y
	YcwrIZ71j7f5VDbLs5LPfG8w6swDY89F24pSBHQgda1fULbELyE5/LYOYUuN/NZPXyfIRXeIXzNlD
	FGZjTzSPB2nsVA/zser95ZD5FUKSU59ige7DPGhpycFSSrDZxtDKUYb7LraUYmTF393tPG/bC+Xv9
	PnI3d/BqoAlKYjoCXbYT2Eu/EDbecpnAm9s24tK7xCDUAa0h56jg8rizPjVbqria9AuRynGnJ+6SH
	t5nUL7kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YN9-00000004Fqz-3H3N;
	Thu, 31 Oct 2024 16:50:11 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YLS-00000004Fc0-3lBA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 16:48:29 +0000
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C8D473F857
	for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 16:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1730393302;
	bh=6rD0z2KjUaSRPGMKlVLBitkGSyEg/HiSrNCotyBt3Ws=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=iUGUd+f/AX5ttlAbjz8pde3061uqkoVMUwhegHHbhMM0/YCGo5X1QdWlLRh/YuEaz
	 g/TRI3vfo476Dq6+YN6hxsvcIWFRUtZZbNEdz0DufP5BR0u6DeTwxpkvtIwGQduem2
	 WILfi+4QIDniY+6hyAuIMXrQyDHD6mtrCyM72qG12/eoDhjXFUdX3fa6g4cyhfdIQ6
	 PKAaceNdN0ESFPI+nvezRgYc3x1kNZpSgjF/Wztj/6fs29IczDCNqkNeOoe19a0JnA
	 lqIkX2PCAlEHhcUdZ4vTjSUWT3cITXRuSBSawyhnRtgmXGd2c6rypY0aAtEd391hMt
	 nMy5sIGNCUx0A==
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2892ea5bf68so865610fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 09:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730393301; x=1730998101;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6rD0z2KjUaSRPGMKlVLBitkGSyEg/HiSrNCotyBt3Ws=;
        b=RA52ZHA/U8FJChq/yIHqvZViY4tHFiUQyLLBFEbsML+jeD4u3wJUZ5BBhWF8kAPGOe
         e35SGvkKwZLYPvlp8SxxHO9u9WRiWSViitTOjNObbcGfml0eAO9SIpsEDc4Dz1m9ljy2
         b16ekbBo1oV76eHWOLAtwWldxdE7//JTpMOae/dglWmaD2T+d+EyWGz6M7lQ05uBDC11
         dD5od5YL4rN7XJQUh+Ety5qpsejKMHXMo+gZjz2ajR25ZW2xzzSLH5JdquM8FiHhJ2z3
         4YtdSYoV8Fz6zq6ZSX7RwsvY6jM2YXYBDJn2qVKr/N/Q8XNKZbQwv5kgyEq9mNpMikAX
         PE+A==
X-Forwarded-Encrypted: i=1; AJvYcCUxgEt0PlxS4mong2SnEXfT9TRKEfaEOcv59rEexY5OQHNczGMwQBdlLZWasCyZEIfWviJqbduX+A85G3TT/4mb@lists.infradead.org
X-Gm-Message-State: AOJu0YzDgWdR7151Fss76wdvI9Il6nIiAY4YqqxDpTj/byNkQBs3nbK7
	Y8KOZ7u0ZqGsrYpXx6g1lsfKZ6G67cRY8nqfh5liMaiRkXzBuaASc2++dtnvjtVvzhDpo2CTUOY
	e6NEn4GEC5Sgr2XqT2ue89EdqBOH1qchEEnV3WMKmAl714+VPW9aXch8wEeT7UPxsjy3MVKMJkm
	YcqThDeJ1ueI7JMWRfMosEB9yubCC6Y5s3QENn7wfCwh5VB4qmd2rltnmScs41Wyw=
X-Received: by 2002:a05:6870:3104:b0:260:e678:b653 with SMTP id 586e51a60fabf-2949f0b1c41mr310203fac.42.1730393301187;
        Thu, 31 Oct 2024 09:48:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcLWPA2sHrr6NrasPeNZw6K1Qi5CQGRqL6tW9K0s/YVklC0WVl3ghDGFgtxEGm8Vc8BVDTmxMlMQ225xy0QCI=
X-Received: by 2002:a05:6870:3104:b0:260:e678:b653 with SMTP id
 586e51a60fabf-2949f0b1c41mr310175fac.42.1730393300747; Thu, 31 Oct 2024
 09:48:20 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 31 Oct 2024 12:48:20 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241030-th1520-gmac-v6-2-e48176d45116@tenstorrent.com>
References: <20241030-th1520-gmac-v6-0-e48176d45116@tenstorrent.com> <20241030-th1520-gmac-v6-2-e48176d45116@tenstorrent.com>
Mime-Version: 1.0
Date: Thu, 31 Oct 2024 12:48:20 -0400
Message-ID: <CAJM55Z-8hQXV+n9JH6qAJOxV=KXo4XmUB3MzFOgy9Fqip4x89g@mail.gmail.com>
Subject: Re: [PATCH net-next v6 2/2] net: stmmac: Add glue layer for T-HEAD
 TH1520 SoC
To: Drew Fustini <dfustini@tenstorrent.com>, Andrew Lunn <andrew@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Drew Fustini <drew@pdp7.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_094827_417113_1D0777D6 
X-CRM114-Status: GOOD (  30.36  )
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

Drew Fustini wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Add dwmac glue driver to support the DesignWare-based GMAC controllers
> on the T-HEAD TH1520 SoC.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> [esmil: rename plat->interface -> plat->mac_interface,
>         use devm_stmmac_probe_config_dt()]
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [drew: convert from stmmac_dvr_probe() to devm_stmmac_pltfr_probe(),
>        convert register access from regmap to regular mmio]
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  MAINTAINERS                                       |   1 +
>  drivers/net/ethernet/stmicro/stmmac/Kconfig       |  10 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile      |   1 +
>  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 268 ++++++++++++++++++++++
>  4 files changed, 280 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 72dee6d07ced..b53f9f6b3e04 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19830,6 +19830,7 @@ F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
>  F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
>  F:	arch/riscv/boot/dts/thead/
>  F:	drivers/clk/thead/clk-th1520-ap.c
> +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
>
>  RNBD BLOCK DRIVERS
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 05cc07b8f48c..6658536a4e17 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -228,6 +228,16 @@ config DWMAC_SUN8I
>  	  stmmac device driver. This driver is used for H3/A83T/A64
>  	  EMAC ethernet controller.
>
> +config DWMAC_THEAD
> +	tristate "T-HEAD dwmac support"
> +	depends on OF && (ARCH_THEAD || COMPILE_TEST)
> +	help
> +	  Support for ethernet controllers on T-HEAD RISC-V SoCs
> +
> +	  This selects the T-HEAD platform specific glue layer support for
> +	  the stmmac device driver. This driver is used for T-HEAD TH1520
> +	  ethernet controller.
> +
>  config DWMAC_IMX8
>  	tristate "NXP IMX8 DWMAC support"
>  	default ARCH_MXC
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index c2f0e91f6bf8..d065634c6223 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
>  obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
>  obj-$(CONFIG_DWMAC_SUNXI)	+= dwmac-sunxi.o
>  obj-$(CONFIG_DWMAC_SUN8I)	+= dwmac-sun8i.o
> +obj-$(CONFIG_DWMAC_THEAD)	+= dwmac-thead.o
>  obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+= dwmac-dwc-qos-eth.o
>  obj-$(CONFIG_DWMAC_INTEL_PLAT)	+= dwmac-intel-plat.o
>  obj-$(CONFIG_DWMAC_LOONGSON1)	+= dwmac-loongson1.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> new file mode 100644
> index 000000000000..8c7ec156ebb0
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * T-HEAD DWMAC platform driver
> + *
> + * Copyright (C) 2021 Alibaba Group Holding Limited.
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + *
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_net.h>
> +#include <linux/platform_device.h>
> +
> +#include "stmmac_platform.h"
> +
> +#define GMAC_CLK_EN			0x00
> +#define  GMAC_TX_CLK_EN			BIT(1)
> +#define  GMAC_TX_CLK_N_EN		BIT(2)
> +#define  GMAC_TX_CLK_OUT_EN		BIT(3)
> +#define  GMAC_RX_CLK_EN			BIT(4)
> +#define  GMAC_RX_CLK_N_EN		BIT(5)
> +#define  GMAC_EPHY_REF_CLK_EN		BIT(6)
> +#define GMAC_RXCLK_DELAY_CTRL		0x04
> +#define  GMAC_RXCLK_BYPASS		BIT(15)
> +#define  GMAC_RXCLK_INVERT		BIT(14)
> +#define  GMAC_RXCLK_DELAY_MASK		GENMASK(4, 0)
> +#define  GMAC_RXCLK_DELAY_VAL(x)	FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))

May I suggest you just do

#define GMAC_RXCLK_DELAY	GENMASK(4, 0)

..and then use FIELD_PREP(GMAC_RXCLK_DELAY, x) directly instead of wrapping it
in the GMAC_RXCLK_DELAY_VAL() macro.
This goes for GMAC_TXCLK_DELAY_{MASK,VAL} and GMAC_PLLCLK_DIV_{MASK,NUM} below
too.

> +#define GMAC_TXCLK_DELAY_CTRL		0x08
> +#define  GMAC_TXCLK_BYPASS		BIT(15)
> +#define  GMAC_TXCLK_INVERT		BIT(14)
> +#define  GMAC_TXCLK_DELAY_MASK		GENMASK(4, 0)
> +#define  GMAC_TXCLK_DELAY_VAL(x)	FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))
> +#define GMAC_PLLCLK_DIV			0x0c
> +#define  GMAC_PLLCLK_DIV_EN		BIT(31)
> +#define  GMAC_PLLCLK_DIV_MASK		GENMASK(7, 0)
> +#define  GMAC_PLLCLK_DIV_NUM(x)		FIELD_PREP(GMAC_PLLCLK_DIV_MASK, (x))
> +#define GMAC_GTXCLK_SEL			0x18
> +#define  GMAC_GTXCLK_SEL_PLL		BIT(0)
> +#define GMAC_INTF_CTRL			0x1c
> +#define  PHY_INTF_MASK			BIT(0)
> +#define  PHY_INTF_RGMII			FIELD_PREP(PHY_INTF_MASK, 1)
> +#define  PHY_INTF_MII_GMII		FIELD_PREP(PHY_INTF_MASK, 0)
> +#define GMAC_TXCLK_OEN			0x20
> +#define  TXCLK_DIR_MASK			BIT(0)
> +#define  TXCLK_DIR_OUTPUT		FIELD_PREP(TXCLK_DIR_MASK, 0)
> +#define  TXCLK_DIR_INPUT		FIELD_PREP(TXCLK_DIR_MASK, 1)
> +
> +#define GMAC_GMII_RGMII_RATE	125000000
> +#define GMAC_MII_RATE		25000000
> +
> +struct thead_dwmac {
> +	struct plat_stmmacenet_data *plat;
> +	void __iomem *apb_base;
> +	struct device *dev;
> +};
> +
> +static int thead_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
> +{
> +	struct thead_dwmac *dwmac = plat->bsp_priv;
> +	u32 phyif;
> +
> +	switch (plat->mac_interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		phyif = PHY_INTF_MII_GMII;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		phyif = PHY_INTF_RGMII;
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->mac_interface);
> +		return -EINVAL;
> +	}
> +
> +	writel(phyif, dwmac->apb_base + GMAC_INTF_CTRL);
> +	return 0;
> +}
> +
> +static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
> +{
> +	struct thead_dwmac *dwmac = plat->bsp_priv;
> +	u32 txclk_dir;
> +
> +	switch (plat->mac_interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		txclk_dir = TXCLK_DIR_INPUT;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		txclk_dir = TXCLK_DIR_OUTPUT;
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->mac_interface);
> +		return -EINVAL;
> +	}
> +
> +	writel(txclk_dir, dwmac->apb_base + GMAC_TXCLK_OEN);
> +	return 0;
> +}
> +
> +static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
> +{
> +	struct plat_stmmacenet_data *plat;
> +	struct thead_dwmac *dwmac = priv;
> +	unsigned long rate;
> +	u32 div, reg;
> +
> +	plat = dwmac->plat;
> +
> +	switch (plat->mac_interface) {
> +	/* For MII, rxc/txc is provided by phy */
> +	case PHY_INTERFACE_MODE_MII:
> +		return;
> +
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		rate = clk_get_rate(plat->stmmac_clk);
> +		if (!rate || rate % GMAC_GMII_RGMII_RATE != 0 ||
> +		    rate % GMAC_MII_RATE != 0) {
> +			dev_err(dwmac->dev, "invalid gmac rate %ld\n", rate);
> +			return;
> +		}
> +
> +		writel(FIELD_PREP(GMAC_PLLCLK_DIV_EN, 0), dwmac->apb_base + GMAC_PLLCLK_DIV);
> +
> +		switch (speed) {
> +		case SPEED_1000:
> +			div = rate / GMAC_GMII_RGMII_RATE;
> +			break;
> +		case SPEED_100:
> +			div = rate / GMAC_MII_RATE;
> +			break;
> +		case SPEED_10:
> +			div = rate * 10 / GMAC_MII_RATE;
> +			break;
> +		default:
> +			dev_err(dwmac->dev, "invalid speed %u\n", speed);
> +			return;
> +		}
> +
> +		reg = FIELD_PREP(GMAC_PLLCLK_DIV_EN, 1) |
> +		      FIELD_PREP(GMAC_PLLCLK_DIV_MASK, GMAC_PLLCLK_DIV_NUM(div));

..and here is an example why. You accidentally end up using
FIELD_PREP() twice here.

> +		writel(reg, dwmac->apb_base + GMAC_PLLCLK_DIV);
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->mac_interface);
> +		return;
> +	}
> +}
> +
> +static int thead_dwmac_enable_clk(struct plat_stmmacenet_data *plat)
> +{
> +	struct thead_dwmac *dwmac = plat->bsp_priv;
> +	u32 reg;
> +
> +	switch (plat->mac_interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		reg = GMAC_RX_CLK_EN | GMAC_TX_CLK_EN;
> +		break;
> +
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		/* use pll */
> +		writel(GMAC_GTXCLK_SEL_PLL, dwmac->apb_base + GMAC_GTXCLK_SEL);
> +		reg = GMAC_TX_CLK_EN | GMAC_TX_CLK_N_EN | GMAC_TX_CLK_OUT_EN |
> +		      GMAC_RX_CLK_EN | GMAC_RX_CLK_N_EN;
> +		break;
> +
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->mac_interface);
> +		return -EINVAL;
> +	}
> +
> +	writel(reg, dwmac->apb_base + GMAC_CLK_EN);
> +	return 0;
> +}
> +
> +static int thead_dwmac_init(struct platform_device *pdev, void *priv)
> +{
> +	struct thead_dwmac *dwmac = priv;
> +	int ret;
> +
> +	ret = thead_dwmac_set_phy_if(dwmac->plat);
> +	if (ret)
> +		return ret;
> +
> +	ret = thead_dwmac_set_txclk_dir(dwmac->plat);
> +	if (ret)
> +		return ret;
> +
> +	writel(GMAC_RXCLK_DELAY_VAL(0), dwmac->apb_base + GMAC_RXCLK_DELAY_CTRL);
> +	writel(GMAC_TXCLK_DELAY_VAL(0), dwmac->apb_base + GMAC_TXCLK_DELAY_CTRL);

I know Jisheng's original driver also did this too, but here you
unconditionally set both registers to 0 including the bypass and invert bits.
I'd suggest you either do

  writel(0, dwmac->apb_base + GMAC_RXCLK_DELAY_CTRL);
  writel(0, dwmac->apb_base + GMAC_TXCLK_DELAY_CTRL);

..to make this obvious, or do a proper read-modify-write to change just the
FIELD_PREP()'d bits.

> +
> +	return thead_dwmac_enable_clk(dwmac->plat);
> +}
> +
> +static int thead_dwmac_probe(struct platform_device *pdev)
> +{
> +	struct stmmac_resources stmmac_res;
> +	struct plat_stmmacenet_data *plat;
> +	struct thead_dwmac *dwmac;
> +	void __iomem *apb;
> +	int ret;
> +
> +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to get resources\n");

Here you're not capitalizing the error message.

> +
> +	plat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(plat),
> +				     "dt configuration failed\n");
> +
> +	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> +	if (!dwmac)
> +		return -ENOMEM;
> +
> +	apb = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(apb))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(apb),
> +				     "Failed to remap gmac apb registers\n");

..and here you are. Please be consistent in the whole driver.

> +
> +	dwmac->dev = &pdev->dev;
> +	dwmac->plat = plat;
> +	dwmac->apb_base = apb;
> +	plat->bsp_priv = dwmac;
> +	plat->fix_mac_speed = thead_dwmac_fix_speed;
> +	plat->init = thead_dwmac_init;
> +
> +	return devm_stmmac_pltfr_probe(pdev, plat, &stmmac_res);
> +}
> +
> +static const struct of_device_id thead_dwmac_match[] = {
> +	{ .compatible = "thead,th1520-gmac" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, thead_dwmac_match);
> +
> +static struct platform_driver thead_dwmac_driver = {
> +	.probe = thead_dwmac_probe,
> +	.driver = {
> +		.name = "thead-dwmac",
> +		.pm = &stmmac_pltfr_pm_ops,
> +		.of_match_table = thead_dwmac_match,
> +	},
> +};
> +module_platform_driver(thead_dwmac_driver);
> +
> +MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
> +MODULE_AUTHOR("Drew Fustini <drew@pdp7.com>");
> +MODULE_DESCRIPTION("T-HEAD DWMAC platform driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

