Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD35E64AB7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 14:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OqtoDTcuDSPlXiGjMGD8T8dleAY1Lykd97YYdvjsFI=; b=pgKMgz/AX75k9LGWkJSBtnTIXN
	UOtmHhf7YY8s44+7rRvB0TZuX1P/ZT7V9HfzoE3TT+lnEN25KkNPDkk6FmShr0MZDZZL8iGqt+pcp
	aq4FjZSxLvkdSejwfYd4kdq5uFzLDXLOx9hIU/Ujqel8Bm/ac5YqFknyfQ+pqSQzu+fgfEy1yQ5AA
	56kktnHs3Zm4B5SK0XDgN/RJkiLS6Pf1Oi2qT98YWi4V7Orbu7lJSlaZq2yQPJBw0V2FJFSAWScwM
	Od/RG88CBcOOwdzl/kDOR6Tv7CbSQTpI2y8qHbXcW+B3JFf4yAdUqzv82tTXpmZXTms0Xnpz5a0PX
	0a+eA+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUHn-00000009q8h-3Lnl;
	Tue, 03 Dec 2024 14:53:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUGn-00000009pzT-2cJ0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 14:52:58 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-215b45a40d8so12036295ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 06:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733237576; x=1733842376; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+OqtoDTcuDSPlXiGjMGD8T8dleAY1Lykd97YYdvjsFI=;
        b=yhJsp9EgNOSIG9lw8orhiEThDJu4qWgv/pE00rUxROXcSmw26z6sfgsFq5o3AKhgUE
         rseMR9zZtCSErgblh7ZNkAel3cmLRuADMRBBzfNquo6Jv+U8YsQJ4h6xWw5TVR017sdw
         ns96HZfJpNKfz3JZYvu11VCSrxE5QV4Q7ZZqKc7WAC58IMdi6CVyVts3uHughEiG1YSF
         Y+sTjZiD0PescCq9fBcsGENR8VnFwfoihNo6o4o6lEvNhUIbGgAyHl1JoScBkC/hCKGC
         FGzw0jEcafegMIlxQl8QuLV8g5nJ1yExM8p77pUoOBNVjT/eqcyW6J8wbVS7610nSDpa
         A2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733237576; x=1733842376;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+OqtoDTcuDSPlXiGjMGD8T8dleAY1Lykd97YYdvjsFI=;
        b=urEXzwnZamWSkGvtlYNgX0KNXdDHuRUtfvvWVGups0jKAAvrkMj9B65fTQdFQKIAEK
         3q8qtI+MGiUhpdr36wiYJabxxO8sEz4hTUdzDPZPkuG/PtRHWphS6MAWIJPxujLqHw6M
         zjWXrrXufBYWs/JdjhK8CHJZhx2Rc7JGv1VnF/8A1Dss4xPCl47e08uGwjhWyQFpOmJm
         hv45BnAewLiy3ucGiaXJPu71F9Wj3EYSvRqo72QznKhYVeh1YIr/YwKQPbv7NcgCy7c5
         dOju5xkIvvxZJKTn/8xy0OqhtF53mT66/7divXYjmZ1B01ptvyuvQK+SnajUHYBS1P9o
         RBag==
X-Forwarded-Encrypted: i=1; AJvYcCW1/qJeogFHvVw5Rzoj6hJaMKEg4XUkFI4HJl6sD29/0uikQWWWUQjKk0XvaHOCwaDACLFCEA1j/dDVemVWeHRW@lists.infradead.org
X-Gm-Message-State: AOJu0YzCtIgSpmT2n4sqv6her7LZwBw8qi2+NwxWrbOcTij8RtKhMYCy
	X3A820C8zXYtTl7Z+m+27jVfiXdG+JkqRUcmLvYhgogsdNTu51DXLXSgrwfqsQ==
X-Gm-Gg: ASbGncsLdQrIFGTih/1o98V7HQY/11V15Uc835aF9s+NtDXZmTa8zS5Jf0GEOHnufCI
	6mxT0ajuDtoPE2311mghDqzR/UDUzHUBdYwAS9ygBPWOUuOc9HLh5kh3mGhZr0jhvuqRU/gkE7m
	6nshE5YImyCp+Wp8PXM4BZMYy8z/2E+Z4RVSpWzlNMwBbewccuh0LwoRxfXWDx6YJVQ99od0qyC
	DhDBa0wiVG7/2b45Z5g8nQwB/B3KK/aPIIDqp1N5+Y5AA2AKFnONuLZCN3P
X-Google-Smtp-Source: AGHT+IG2+O34hbdTJ6jI9K4DCqLyYnmrK/L3HYJwczUUv/4lkpV9ewWB4mibpWI78gxJlkRNGNzT+g==
X-Received: by 2002:a17:902:ecc7:b0:215:7b7b:5cc9 with SMTP id d9443c01a7336-215bd0e035emr36010635ad.22.1733237575835;
        Tue, 03 Dec 2024 06:52:55 -0800 (PST)
Received: from thinkpad ([120.60.48.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215964b6b76sm35813645ad.191.2024.12.03.06.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 06:52:55 -0800 (PST)
Date: Tue, 3 Dec 2024 20:22:44 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	p.zabel@pengutronix.de, cassel@kernel.org,
	quic_schintav@quicinc.com, fabrice.gasnier@foss.st.com,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] PCI: stm32: Add PCIe host support for STM32MP25
Message-ID: <20241203145244.trgrobtfmumtiwuc@thinkpad>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-3-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241126155119.1574564-3-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_065257_677014_FB6B87A0 
X-CRM114-Status: GOOD (  41.78  )
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

On Tue, Nov 26, 2024 at 04:51:16PM +0100, Christian Bruel wrote:
> Add driver for the STM32MP25 SoC PCIe Gen2 controller based on the
> DesignWare PCIe core.
> 
> Supports MSI via GICv2m, Single Virtual Channel, Single Function
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  drivers/pci/controller/dwc/Kconfig      |  12 +
>  drivers/pci/controller/dwc/Makefile     |   1 +
>  drivers/pci/controller/dwc/pcie-stm32.c | 402 ++++++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-stm32.h |  15 +
>  4 files changed, 430 insertions(+)
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
> index 000000000000..fa787406c0e4
> --- /dev/null
> +++ b/drivers/pci/controller/dwc/pcie-stm32.c
> @@ -0,0 +1,402 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * STMicroelectronics STM32MP25 PCIe root complex driver.
> + *
> + * Copyright (C) 2024 STMicroelectronics
> + * Author: Christian Bruel <christian.bruel@foss.st.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of_platform.h>
> +#include <linux/phy/phy.h>
> +#include <linux/pinctrl/devinfo.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include "pcie-designware.h"
> +#include "pcie-stm32.h"
> +#include "../../pci.h"
> +
> +struct stm32_pcie {
> +	struct dw_pcie *pci;
> +	struct regmap *regmap;
> +	struct reset_control *rst;
> +	struct phy *phy;
> +	struct clk *clk;
> +	struct gpio_desc *perst_gpio;
> +	struct gpio_desc *wake_gpio;
> +	unsigned int wake_irq;
> +	bool link_is_up;
> +};
> +
> +static int stm32_pcie_start_link(struct dw_pcie *pci)
> +{
> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> +	u32 ret;
> +
> +	if (stm32_pcie->perst_gpio) {

gpiod_set_value() will bail out if 'perst_gpio' is NULL. So no need to add a
check.

> +		/* Make sure PERST# is asserted. */

Why?

> +		gpiod_set_value(stm32_pcie->perst_gpio, 1);
> +
> +		fsleep(PCIE_T_PERST_CLK_US);
> +		gpiod_set_value(stm32_pcie->perst_gpio, 0);

Why can't you deassert PERST# in stm32_add_pcie_port()?

> +	}
> +
> +	ret = regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> +				 STM32MP25_PCIECR_LTSSM_EN,
> +				 STM32MP25_PCIECR_LTSSM_EN);
> +
> +	if (stm32_pcie->perst_gpio)

It doesn't hurt to call msleep() always.

> +		msleep(PCIE_T_RRS_READY_MS);
> +
> +	return ret;
> +}
> +
> +static void stm32_pcie_stop_link(struct dw_pcie *pci)
> +{
> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> +
> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> +			   STM32MP25_PCIECR_LTSSM_EN, 0);
> +
> +	/* Assert PERST# */
> +	if (stm32_pcie->perst_gpio)
> +		gpiod_set_value(stm32_pcie->perst_gpio, 1);

I don't like tying PERST# handling with start/stop link. PERST# should be
handled based on the power/clock state.

> +}
> +
> +static int stm32_pcie_suspend(struct device *dev)
> +{
> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev) || device_wakeup_path(dev))
> +		enable_irq_wake(stm32_pcie->wake_irq);
> +
> +	return 0;
> +}
> +
> +static int stm32_pcie_resume(struct device *dev)
> +{
> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev) || device_wakeup_path(dev))
> +		disable_irq_wake(stm32_pcie->wake_irq);
> +
> +	return 0;
> +}
> +
> +static int stm32_pcie_suspend_noirq(struct device *dev)
> +{
> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> +
> +	stm32_pcie->link_is_up = dw_pcie_link_up(stm32_pcie->pci);
> +
> +	stm32_pcie_stop_link(stm32_pcie->pci);

I don't understand how endpoint can wakeup the host if PERST# gets asserted.

> +	clk_disable_unprepare(stm32_pcie->clk);
> +
> +	if (!device_may_wakeup(dev) && !device_wakeup_path(dev))
> +		phy_exit(stm32_pcie->phy);
> +
> +	return pinctrl_pm_select_sleep_state(dev);
> +}
> +
> +static int stm32_pcie_resume_noirq(struct device *dev)
> +{
> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> +	struct dw_pcie *pci = stm32_pcie->pci;
> +	struct dw_pcie_rp *pp = &pci->pp;
> +	int ret;
> +
> +	/* init_state must be called first to force clk_req# gpio when no

CLKREQ#

Why RC should control CLKREQ#?

Also please use preferred style for multi-line comments:

	/*
	 * ...
	 */

> +	 * device is plugged.
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
> +	if (!device_may_wakeup(dev) && !device_wakeup_path(dev)) {
> +		ret = phy_init(stm32_pcie->phy);
> +		if (ret) {
> +			pinctrl_pm_select_default_state(dev);
> +			return ret;
> +		}
> +	}
> +
> +	ret = clk_prepare_enable(stm32_pcie->clk);
> +	if (ret)
> +		goto clk_err;

Please name the goto labels of their purpose. Like err_phy_exit.

> +
> +	ret = dw_pcie_setup_rc(pp);
> +	if (ret)
> +		goto pcie_err;

This should be, 'err_disable_clk'.

> +
> +	if (stm32_pcie->link_is_up) {

Why do you need this check? You cannot start the link in the absence of an
endpoint?

> +		ret = stm32_pcie_start_link(stm32_pcie->pci);
> +		if (ret)
> +			goto pcie_err;
> +
> +		/* Ignore errors, the link may come up later */
> +		dw_pcie_wait_for_link(stm32_pcie->pci);
> +	}
> +
> +	pinctrl_pm_select_default_state(dev);
> +
> +	return 0;
> +
> +pcie_err:
> +	dw_pcie_host_deinit(pp);
> +	clk_disable_unprepare(stm32_pcie->clk);
> +clk_err:
> +	phy_exit(stm32_pcie->phy);
> +	pinctrl_pm_select_default_state(dev);
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops stm32_pcie_pm_ops = {
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(stm32_pcie_suspend_noirq,
> +				  stm32_pcie_resume_noirq)

Can you make use of dw_pcie_{suspend/resume}_noirq() APIs?

> +	SYSTEM_SLEEP_PM_OPS(stm32_pcie_suspend, stm32_pcie_resume)
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

[...]

> +	if (device_property_read_bool(dev, "wakeup-source")) {
> +		stm32_pcie->wake_gpio = devm_gpiod_get_optional(dev, "wake",
> +								GPIOD_IN);
> +		if (IS_ERR(stm32_pcie->wake_gpio))
> +			return dev_err_probe(dev, PTR_ERR(stm32_pcie->wake_gpio),
> +					     "Failed to get wake GPIO\n");
> +	}
> +
> +	if (stm32_pcie->wake_gpio) {
> +		stm32_pcie->wake_irq = gpiod_to_irq(stm32_pcie->wake_gpio);
> +
> +		ret = devm_request_threaded_irq(&pdev->dev,
> +						stm32_pcie->wake_irq, NULL,
> +						stm32_pcie_wake_irq_handler,
> +						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +						"wake_irq", stm32_pcie);
> +
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to request WAKE IRQ: %d\n", ret);
> +	}

Can we move WAKE# gpio handling to DWC core? There is nothing STM32 specific
here.

> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable runtime PM %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get runtime PM %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = stm32_add_pcie_port(stm32_pcie, pdev);
> +	if (ret)  {
> +		pm_runtime_put_sync(&pdev->dev);
> +		return ret;
> +	}
> +
> +	if (stm32_pcie->wake_gpio)
> +		device_set_wakeup_capable(dev, true);
> +
> +	return 0;
> +}
> +
> +static void stm32_pcie_remove(struct platform_device *pdev)
> +{
> +	struct stm32_pcie *stm32_pcie = platform_get_drvdata(pdev);
> +	struct dw_pcie_rp *pp = &stm32_pcie->pci->pp;
> +
> +	if (stm32_pcie->wake_gpio)
> +		device_init_wakeup(&pdev->dev, false);
> +
> +	dw_pcie_host_deinit(pp);
> +	clk_disable_unprepare(stm32_pcie->clk);
> +
> +	phy_exit(stm32_pcie->phy);
> +
> +	pm_runtime_put_sync(&pdev->dev);
> +}
> +
> +static const struct of_device_id stm32_pcie_of_match[] = {
> +	{ .compatible = "st,stm32mp25-pcie-rc" },
> +	{},
> +};
> +
> +static struct platform_driver stm32_pcie_driver = {
> +	.probe = stm32_pcie_probe,
> +	.remove = stm32_pcie_remove,
> +	.driver = {
> +		.name = "stm32-pcie",
> +		.of_match_table = stm32_pcie_of_match,
> +		.pm		= &stm32_pcie_pm_ops,

Just use a single space instead of tab.

Could you also set PROBE_PREFER_ASYNCHRONOUS to allow async probing of
controller drivers?

> +	},
> +};
> +
> +static bool is_stm32_pcie_driver(struct device *dev)
> +{
> +	/* PCI bridge */
> +	dev = get_device(dev);
> +
> +	/* Platform driver */
> +	dev = get_device(dev->parent);
> +
> +	return (dev->driver == &stm32_pcie_driver.driver);
> +}
> +
> +/*
> + * DMA masters can only access the first 4GB of memory space,
> + * so we setup the bus DMA limit accordingly.
> + */
> +static int stm32_dma_limit(struct pci_dev *pdev, void *data)
> +{
> +	dev_dbg(&pdev->dev, "disabling DMA DAC for device");
> +
> +	pdev->dev.bus_dma_limit = DMA_BIT_MASK(32);
> +
> +	return 0;
> +}
> +
> +static void quirk_stm32_dma_mask(struct pci_dev *pci)
> +{
> +	struct pci_dev *root_port;
> +
> +	root_port = pcie_find_root_port(pci);
> +
> +	if (root_port && is_stm32_pcie_driver(root_port->dev.parent))
> +		pci_walk_bus(pci->bus, stm32_dma_limit, NULL);
> +}
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_SYNOPSYS, 0x0550, quirk_stm32_dma_mask);

This is not the correct way of using DMA masks as Bjorn noted.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

