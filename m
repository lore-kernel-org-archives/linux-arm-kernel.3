Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4368FC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+oFe8u9FxKBuH4K/iHPol/vApb7aiLAQIa3mJ+POQHI=; b=HLiQww6xJbGGh7GzmZIVB07kK2
	gwmdQnpXB2TAznRe7yd52FwbPZ2C5w0u/UNMV4FMno/513+uXwUnCgBtFdYmypb1/qwoXvnVGH+yk
	CUpQt3LfFr7I8BeRiUM35PsRtM1S0fTDWOEmkIi6fCsxBS+fbgukBPbk42XiC7q3cCFIbzT3xxJUZ
	Q8egG1VDJuD7W97H8rmkKlAdulNKCZTwi2jH8rcq5R1A6umxVk0z5P6hnRsrY9qXlKZXwRLO3YxPu
	aySiYTZYYj1NH6nTS484HY+9SD6HYeqiE8TvRmO0k1ZKLIfqo8qqpeAlioBRaneJOm8vxpbAnbBcM
	5tr221Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Q4g-00000006S9U-3pMk;
	Wed, 09 Apr 2025 07:42:19 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Q2t-00000006Rv5-3S2h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 07:40:29 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so7652325a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 00:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744184427; x=1744789227; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+oFe8u9FxKBuH4K/iHPol/vApb7aiLAQIa3mJ+POQHI=;
        b=OIVISscKWCbgQ6FKwwt3R6SxG3RRNhmuknzHMy9k9dwLVP1pZ8CbKw01ba307Jbtd3
         XUWaEOHrB+v6dp04RXDF6gnDbZJU7DpC9XfeJ9aGHPxGk/FHqRUt7O9QC/7hnT0i8to6
         fOw90hYsAaSuVrW1vfslWL7HRaxkgTlsSz09Qp23FHCc7eiEO/Ma/C9vMjUnSo/CJkkP
         2+yTDA/eG/T1imOJtG20cOcjxRFmwmOtB7fsrQ2+utNzMeQVTdstqjyuw14FuRRR86Rw
         xsmacpuG+2Owj1jsoFZT9NoxUU2f41b3I5hpzgmruXV0W7i9qXDECIAHnGOM+julbc8F
         UClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744184427; x=1744789227;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+oFe8u9FxKBuH4K/iHPol/vApb7aiLAQIa3mJ+POQHI=;
        b=T2CHEkTZcTFmjjFonI1oUkFrNFU3NCMRp8mWXKrQS4AAM6keL56XxIVTGOxbkSXyjo
         mRBOXulp+brU9lvjuk4Vtp3bXZLjxnW4g9zNdBP5bV7vkRnW5QvM31zQfxe29hUX89mh
         M8HN5b3yhjKDh+MoiqV2cSHOEmb4reF4V3qvSIQXDXq/279LWAMAGT+TpCFvaZTmmD+j
         5Q/Zd2cY6bA8+WLq8sQZF7qyay0xKmB6gKixPOmE1q8eUf0seT/5qDet6O9i/bMaLTMx
         LPalRK0fHjfwt6Z41mDsotrrHABKvEw9WT31jmIgZe+XlT7G5DSgTiRq980+KvngxwR8
         pskw==
X-Forwarded-Encrypted: i=1; AJvYcCWFufnu4T/G/JyYcu2G0q2UdgEHD/RrnpP0kiOp+dH2BZwEpWvsAnQtpgZPgRXj6oWV8VE8OfyxpaYhIFZZsrBc@lists.infradead.org
X-Gm-Message-State: AOJu0YxUjlTm8k3uyjk0I9ITL8yvvmaNgEIOL7qZSV3bNtvier/P6fLZ
	KtzPWTNp97Ti5LIiFuSB4IQuOWAntOP//7xKYD7c1jl8NVOGRzwSTUd9E54WfA==
X-Gm-Gg: ASbGncuQy04KqtSnMiniQ90L04vuza/gIhsDj1x7d4+knmJG57nlq3mylRRVzL+BKyl
	8ASygQbnGQ3Kq4DNlmRPAjrqQsm4ArQcD0yCD4BqjVkr301f9v+P5WZvBka4Tz97LhIAZju+GCi
	DZGZPmdo1O2DrtageocbFiSyeu+klUvH8Meob9RGHN6/K7N12iqKf6t3+pQAOgAANdPKbn0vVR6
	m7RM+1objkPqv5TnenC0vwnHtMIK5DtjaSFEmwB5n9GEhE0T18PN0+bVqxOkC+D6qvu3aZ2bgNm
	eWBpnJfYrcimTL28r7S8SVhGLpSemVIGLi/GIMFt0sqIsJ41AmE=
X-Google-Smtp-Source: AGHT+IFzdnJzxhvhrD0BDt0+1Tqyf41zBSU8dtNoZbiYIb/yvsvm6G4GtmJ26GxqNSWOJa1ka3OoZQ==
X-Received: by 2002:a17:90b:2811:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-306dbbb0b9bmr3596481a91.12.1744184426800;
        Wed, 09 Apr 2025 00:40:26 -0700 (PDT)
Received: from thinkpad ([120.56.198.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e79fsm880237a91.19.2025.04.09.00.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:40:25 -0700 (PDT)
Date: Wed, 9 Apr 2025 13:10:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, p.zabel@pengutronix.de, 
	johan+linaro@kernel.org, cassel@kernel.org, quic_schintav@quicinc.com, 
	fabrice.gasnier@foss.st.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/9 RESEND] PCI: stm32: Add PCIe host support for
 STM32MP25
Message-ID: <bfwrsby7okn3huuwijfkeurtldr2xszfkpvzzc5m72bzj3mdmj@ypcwl5chipbx>
References: <20250325065935.908886-1-christian.bruel@foss.st.com>
 <20250325065935.908886-3-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250325065935.908886-3-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_004027_888767_82AA40EB 
X-CRM114-Status: GOOD (  31.73  )
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

On Tue, Mar 25, 2025 at 07:59:28AM +0100, Christian Bruel wrote:
> Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
> controller based on the DesignWare PCIe core.
> 
> Supports MSI via GICv2m, Single Virtual Channel, Single Function
> 
> Supports WAKE# GPIO.
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  drivers/pci/controller/dwc/Kconfig      |  12 +
>  drivers/pci/controller/dwc/Makefile     |   1 +
>  drivers/pci/controller/dwc/pcie-stm32.c | 367 ++++++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-stm32.h |  15 +
>  4 files changed, 395 insertions(+)
>  create mode 100644 drivers/pci/controller/dwc/pcie-stm32.c
>  create mode 100644 drivers/pci/controller/dwc/pcie-stm32.h
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index b6d6778b0698..0c18879b604c 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -389,6 +389,18 @@ config PCIE_SPEAR13XX
>  	help
>  	  Say Y here if you want PCIe support on SPEAr13XX SoCs.
>  
> +config PCIE_STM32

PCIE_STM32_HOST since you are adding the PCIE_STM32_EP Kconfig.

> +	tristate "STMicroelectronics STM32MP25 PCIe Controller (host mode)"
> +	depends on ARCH_STM32 || COMPILE_TEST
> +	depends on PCI_MSI
> +	select PCIE_DW_HOST
> +	help
> +	  Enables support for the DesignWare core based PCIe host controller
> +	  found in STM32MP25 SoC.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called pcie-stm32.
> +
>  config PCI_DRA7XX
>  	tristate
>  
> diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
> index a8308d9ea986..576d99cb3bc5 100644
> --- a/drivers/pci/controller/dwc/Makefile
> +++ b/drivers/pci/controller/dwc/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_PCIE_UNIPHIER) += pcie-uniphier.o
>  obj-$(CONFIG_PCIE_UNIPHIER_EP) += pcie-uniphier-ep.o
>  obj-$(CONFIG_PCIE_VISCONTI_HOST) += pcie-visconti.o
>  obj-$(CONFIG_PCIE_RCAR_GEN4) += pcie-rcar-gen4.o
> +obj-$(CONFIG_PCIE_STM32) += pcie-stm32.o
>  
>  # The following drivers are for devices that use the generic ACPI
>  # pci_root.c driver but don't support standard ECAM config access.
> diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
> new file mode 100644
> index 000000000000..3937777d9eb9
> --- /dev/null
> +++ b/drivers/pci/controller/dwc/pcie-stm32.c
> @@ -0,0 +1,367 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * STMicroelectronics STM32MP25 PCIe root complex driver.
> + *
> + * Copyright (C) 2025 STMicroelectronics
> + * Author: Christian Bruel <christian.bruel@foss.st.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of_platform.h>
> +#include <linux/phy/phy.h>
> +#include <linux/pinctrl/devinfo.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/pm_wakeirq.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include "pcie-designware.h"
> +#include "pcie-stm32.h"
> +#include "../../pci.h"
> +
> +struct stm32_pcie {
> +	struct dw_pcie pci;
> +	struct regmap *regmap;
> +	struct reset_control *rst;
> +	struct phy *phy;
> +	struct clk *clk;
> +	struct gpio_desc *perst_gpio;
> +	struct gpio_desc *wake_gpio;
> +};
> +
> +static void stm32_pcie_deassert_perst(struct stm32_pcie *stm32_pcie)
> +{

You should add a delay of PCIE_T_PVPERL_MS to satisfy the PERST# deassertion
requirement as per the spec.

> +	gpiod_set_value(stm32_pcie->perst_gpio, 0);
> +
> +	if (stm32_pcie->perst_gpio)
> +		msleep(PCIE_T_RRS_READY_MS);
> +}
> +
> +static void stm32_pcie_assert_perst(struct stm32_pcie *stm32_pcie)
> +{
> +	gpiod_set_value(stm32_pcie->perst_gpio, 1);
> +}
> +
> +static int stm32_pcie_start_link(struct dw_pcie *pci)
> +{
> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> +
> +	return regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> +				  STM32MP25_PCIECR_LTSSM_EN,
> +				  STM32MP25_PCIECR_LTSSM_EN);
> +}
> +
> +static void stm32_pcie_stop_link(struct dw_pcie *pci)
> +{
> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> +
> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> +			   STM32MP25_PCIECR_LTSSM_EN, 0);
> +}
> +
> +static int stm32_pcie_suspend_noirq(struct device *dev)
> +{
> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = dw_pcie_suspend_noirq(&stm32_pcie->pci);
> +	if (ret) {
> +		stm32_pcie_deassert_perst(stm32_pcie);
> +		return ret;
> +	}
> +
> +	stm32_pcie_assert_perst(stm32_pcie);
> +	
> +	clk_disable_unprepare(stm32_pcie->clk);
> +
> +	if (!device_wakeup_path(dev))
> +		phy_exit(stm32_pcie->phy);
> +
> +	return pinctrl_pm_select_sleep_state(dev);
> +}
> +
> +static int stm32_pcie_resume_noirq(struct device *dev)
> +{
> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/*
> +	 * The core clock is gated with CLKREQ# from the COMBOPHY REFCLK,
> +	 * thus if no device is present, must force it low with an init pinmux
> +	 * to be able to access the DBI registers.
> +	 */
> +	if (!IS_ERR(dev->pins->init_state))
> +		ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
> +	else
> +		ret = pinctrl_pm_select_default_state(dev);
> +
> +	if (ret) {
> +		dev_err(dev, "Failed to activate pinctrl pm state: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (!device_wakeup_path(dev)) {
> +		ret = phy_init(stm32_pcie->phy);
> +		if (ret) {
> +			pinctrl_pm_select_default_state(dev);
> +			return ret;
> +		}
> +	}
> +
> +	ret = clk_prepare_enable(stm32_pcie->clk);
> +	if (ret)
> +		goto err_phy_exit;
> +
> +	stm32_pcie_deassert_perst(stm32_pcie);
> +
> +	ret = dw_pcie_resume_noirq(&stm32_pcie->pci);
> +	if (ret)
> +		goto err_disable_clk;
> +
> +	pinctrl_pm_select_default_state(dev);
> +
> +	return 0;
> +
> +err_disable_clk:
> +	stm32_pcie_assert_perst(stm32_pcie);
> +	clk_disable_unprepare(stm32_pcie->clk);
> +
> +err_phy_exit:
> +	phy_exit(stm32_pcie->phy);
> +	pinctrl_pm_select_default_state(dev);
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops stm32_pcie_pm_ops = {
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(stm32_pcie_suspend_noirq,
> +				  stm32_pcie_resume_noirq)
> +};
> +
> +static const struct dw_pcie_host_ops stm32_pcie_host_ops = {
> +};
> +
> +static const struct dw_pcie_ops dw_pcie_ops = {
> +	.start_link = stm32_pcie_start_link,
> +	.stop_link = stm32_pcie_stop_link
> +};
> +
> +static int stm32_add_pcie_port(struct stm32_pcie *stm32_pcie,
> +			       struct platform_device *pdev)
> +{
> +	struct device *dev = stm32_pcie->pci.dev;
> +	unsigned int wake_irq;
> +	int ret;
> +
> +	/* Start to enable resources with PERST# asserted from GPIO */
> +

'Start to enable resources with PERST# asserted'

> +	ret = phy_set_mode(stm32_pcie->phy, PHY_MODE_PCIE);
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_init(stm32_pcie->phy);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> +				 STM32MP25_PCIECR_TYPE_MASK,
> +				 STM32MP25_PCIECR_RC);
> +	if (ret)
> +		goto err_phy_exit;
> +
> +	stm32_pcie_deassert_perst(stm32_pcie);
> +
> +	if (stm32_pcie->wake_gpio) {
> +		wake_irq = gpiod_to_irq(stm32_pcie->wake_gpio);
> +		ret = dev_pm_set_dedicated_wake_irq(dev, wake_irq);
> +		if (ret) {
> +			dev_info(dev, "Failed to enable wake# %d\n", ret);
> +			goto err_disable_clk;

err_assert_perst

Reset LGTM!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

