Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C09ED597A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 21:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Ttw+JISJOGcRQgpEPxx8JIz/ydyIIuBMFwDqu1PohhI=; b=OPf93xhkHBuvHX
	6SsVrUSJ8PkddC7YaAf6vE61oZAhtxjQXo+FRm9Kqx2QsoyMk6BZth2P4KjjR1VRjP0Z+WBxv3+ov
	qirKOM+jGfLFHyDnc9J/QZRv/UANRpVv9S4FYWLQhzZj90JFUFGhxorTYZMZ29lnc93ihRxwktsYU
	ql8aRK/5boAiXpQkjPfFJxwzOVRW/7wAWpl46nmyNPXmvR4kc+GjEOKZdyNckGLBGbqqslfYGTaoG
	gI9GZy+VHSqSDb1vSEuA32ws2svTBJBH9hVZML1se+gqNxy58OYFvNtm9JlQ6RUojFkga/FbiwC6w
	YyY4U3aSTubpqHeFjtkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAyaK-000000052CB-13XI;
	Tue, 12 Nov 2024 21:38:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAyYW-000000051xa-1bOt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 21:36:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 593F9A4263B;
	Tue, 12 Nov 2024 21:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BCFC4CECD;
	Tue, 12 Nov 2024 21:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731447371;
	bh=YT8QiaKYc6WikadvMwOhGhXCA4jctxjY4UC9dlIgrcA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ElakLreoUElzFc7nu+uUsrDpPS++A0T23q9ciRXNhxC/vItSuDw56NpCqpiFxi7QK
	 vEvTsi/Pbdi8S96yxwOII1A5naDXEQ4ffh+1vyaw3dpzrkGhsNb/Gc5mDahZOpP2cZ
	 wJiVxI+shzQqIcniXTTKnr1NDwX7858vpglbmRj67KkQXYwoGke+TODCw0Gshy5FH8
	 uVlyvrTpkWdyz/ZHXIi2JytmXQ7uIGo4+V9sGOy3/rUFVBD8TSM/ezEJrn9d/G1Wra
	 d2rqYXbIpDZRPUHSUV7Zc+8/vY8bkhdq1VF7BwEfB8GYtgJFTZCsAj5lOKyDNcuwRL
	 gwF3luLnvkVTQ==
Date: Tue, 12 Nov 2024 15:36:08 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
Cc: lpieralisi@kernel.org, thomas.petazzoni@bootlin.com, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	salee@marvell.com, dingwei@marvell.com
Subject: Re: [PATCH 1/1] PCI: armada8k: add device reset to link-down handle
Message-ID: <20241112213608.GA1861480@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112070310.757856-1-jpatel2@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_133612_569718_EABFF6FE 
X-CRM114-Status: GOOD (  25.11  )
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

In subject, follow capitalization convention.  Use "git log
--oneline".

On Mon, Nov 11, 2024 at 11:03:10PM -0800, Jenishkumar Maheshbhai Patel wrote:
> Added pcie reset via gpio support as described in the
> designware-pcie.txt DT binding document.
> In cases link down cause still exist in device.
> The device need to be reset to reestablish the link.
> If reset-gpio pin provided in the device tree, then the linkdown
> handle resets the device before reestablishing link.

s/pcie/PCIe/
s/gpio/GPIO/

Add blank lines between paragraphs.  Rewrap to fill 75 columns.

> Signed-off-by: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
> ---
>  drivers/pci/controller/dwc/pcie-armada8k.c | 24 ++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
> index b1b48c2016f7..9a48ef60be51 100644
> --- a/drivers/pci/controller/dwc/pcie-armada8k.c
> +++ b/drivers/pci/controller/dwc/pcie-armada8k.c
> @@ -23,6 +23,7 @@
>  #include <linux/of_pci.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
> +#include <linux/of_gpio.h>

Preserve (mostly) alpha sorted list of includes.

>  #include "pcie-designware.h"
>  
> @@ -37,6 +38,8 @@ struct armada8k_pcie {
>  	struct regmap *sysctrl_base;
>  	u32 mac_rest_bitmask;
>  	struct work_struct recover_link_work;
> +	enum of_gpio_flags flags;
> +	struct gpio_desc *reset_gpio;
>  };
>  
>  #define PCIE_VENDOR_REGS_OFFSET		0x8000
> @@ -238,9 +241,18 @@ static void armada8k_pcie_recover_link(struct work_struct *ws)
>  	}
>  	pci_lock_rescan_remove();
>  	pci_stop_and_remove_bus_device(root_port);
> +	/* Reset device if reset gpio is set */
> +	if (pcie->reset_gpio) {
> +		/* assert and then deassert the reset signal */
> +		gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> +		msleep(100);

Needs some sort of #define for this 100 ms.

> +		gpiod_set_value_cansleep(pcie->reset_gpio,
> +					 (pcie->flags & OF_GPIO_ACTIVE_LOW) ? 0 : 1);
> +	}
>  	/*
> -	 * Sleep needed to make sure all pcie transactions and access
> -	 * are flushed before resetting the mac
> +	 * Sleep used for two reasons.
> +	 * First make sure all pcie transactions and access are flushed before resetting the mac
> +	 * and second to make sure pci device is ready in case we reset the device
>  	 */
>  	msleep(100);

s/pcie/PCIe/ (throughout)
s/mac/MAC/

Explain the 100ms.  Hopefully this is something defined by PCIe base
or CEM spec.  Use or add #define as needed.

> @@ -376,6 +388,7 @@ static int armada8k_pcie_probe(struct platform_device *pdev)
>  	struct armada8k_pcie *pcie;
>  	struct device *dev = &pdev->dev;
>  	struct resource *base;
> +	int reset_gpio;
>  	int ret;
>  
>  	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> @@ -420,6 +433,13 @@ static int armada8k_pcie_probe(struct platform_device *pdev)
>  		goto fail_clkreg;
>  	}
>  
> +	/* Config reset gpio for pcie if the reset connected to gpio */
> +	reset_gpio = of_get_named_gpio_flags(pdev->dev.of_node,
> +					     "reset-gpios", 0,
> +					     &pcie->flags);
> +	if (gpio_is_valid(reset_gpio))
> +		pcie->reset_gpio = gpio_to_desc(reset_gpio);
> +
>  	pcie->sysctrl_base = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
>  						       "marvell,system-controller");
>  	if (IS_ERR(pcie->sysctrl_base)) {
> -- 
> 2.25.1
> 

