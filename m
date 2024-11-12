Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8E4D597A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 21:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=3FRveSiWRD7RApQ8BEo1EHMWmuIBJT0aO5zQ1vtMs8g=; b=R9XUOeJ+HHZYep
	NgGwfvPg1XmpIKF/CIvqOd95OdMpTAS+mipaK8Lls/99/JNiss2nG803rfwUBiWL0Siw53ZeY2oWN
	gLa6iGGfxPCDk39zbVqIp1q1oyDAfxU6Asg2e/nAkklIjOgCqgKQsCWevOGD6gwx9++uQNvtJIPOW
	EcBVqd8B9+ove4bUppo4iSiT0eJWBIGkrfK84w4qNxVJGKN+DaL68b+3VZM9igmrpB/viB7UPXD4w
	U7oNwWoDOioNuHwKQVHvL9w6YGuFOQyDxQtecn3cBPceR/9FW+MYBYkv6z+aSK6IDplY8LoRizxe+
	U60vin95Cf76+G5RUIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAyXC-000000051iE-25Os;
	Tue, 12 Nov 2024 21:34:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAyVO-000000051UP-3dlS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 21:33:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 64AA5A42165;
	Tue, 12 Nov 2024 21:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D4AC4CECD;
	Tue, 12 Nov 2024 21:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731447177;
	bh=ApKX+4cu9ZbBmnkzhOTLuP5wHHLAxK8wxcPwFeAA5tE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=g1L6Of83xy5e9DTMpuc+UgYYvaePl0u6G95G4My7ddrZ6KhsjLx4lhkk2s0TT3pJg
	 93UvmziBFu0SQOgDk1t7o9mjJtA/yOokeo7aI9ku4wp6x2ljwOXBN323w3UMPR6zLJ
	 f/ziXjOf56BGbQ6QVFg8OQ2y1RqQ325cBHWXFV7iu4YYS+qLLn0PcdQ8cGYUgs8NHL
	 eo2kh4sKoSH5j2wbpovPQDbt+YCH+a+sIYKO6DFtP99Ouru1MvIeBVcZwo1tEntOY2
	 dnc6uhN6vEI9pHSjSZx49Wl14fAwtoyVkEc4wGJ6E4g8mDfCXc2cummESwBcQ41Km5
	 uhijlWd0WvCpg==
Date: Tue, 12 Nov 2024 15:32:55 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
Cc: lpieralisi@kernel.org, thomas.petazzoni@bootlin.com, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	salee@marvell.com, dingwei@marvell.com
Subject: Re: [PATCH 1/1] PCI: armada8k: Add link-down handle
Message-ID: <20241112213255.GA1861331@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112064813.751736-1-jpatel2@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_133259_057430_09FD474C 
X-CRM114-Status: GOOD (  28.68  )
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

In subject:

  PCI: armada8k: Add link-down handling

On Mon, Nov 11, 2024 at 10:48:13PM -0800, Jenishkumar Maheshbhai Patel wrote:
> In PCIE ISR routine caused by RST_LINK_DOWN
> we schedule work to handle the link-down procedure.
> Link-down procedure will:
> 1. Remove PCIe bus
> 2. Reset the MAC
> 3. Reconfigure link back up
> 4. Rescan PCIe bus

s/PCIE/PCIe/

Rewrap to fill 75 columns.

I assume this basically removes a Root Port (and the hierarchy below
it) if the link goes down, and then resets the MAC and tries to bring
up the link and enumerate the hierarchy again.

No other drivers do this, so why does armada8k need it?  Is this to
work around some unreliable link?

I would think this would be reported via AER and possibly handled
there already, but apparently not?

> Signed-off-by: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
> ---
>  drivers/pci/controller/dwc/pcie-armada8k.c | 84 ++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
> index 07775539b321..b1b48c2016f7 100644
> --- a/drivers/pci/controller/dwc/pcie-armada8k.c
> +++ b/drivers/pci/controller/dwc/pcie-armada8k.c
> @@ -21,6 +21,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/resource.h>
>  #include <linux/of_pci.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
>  
>  #include "pcie-designware.h"
>  
> @@ -32,6 +34,9 @@ struct armada8k_pcie {
>  	struct clk *clk_reg;
>  	struct phy *phy[ARMADA8K_PCIE_MAX_LANES];
>  	unsigned int phy_count;
> +	struct regmap *sysctrl_base;
> +	u32 mac_rest_bitmask;
> +	struct work_struct recover_link_work;
>  };
>  
>  #define PCIE_VENDOR_REGS_OFFSET		0x8000
> @@ -72,6 +77,8 @@ struct armada8k_pcie {
>  #define AX_USER_DOMAIN_MASK		0x3
>  #define AX_USER_DOMAIN_SHIFT		4
>  
> +#define UNIT_SOFT_RESET_CONFIG_REG	0x268
> +
>  #define to_armada8k_pcie(x)	dev_get_drvdata((x)->dev)
>  
>  static void armada8k_pcie_disable_phys(struct armada8k_pcie *pcie)
> @@ -216,6 +223,65 @@ static int armada8k_pcie_host_init(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> +static void armada8k_pcie_recover_link(struct work_struct *ws)
> +{
> +	struct armada8k_pcie *pcie = container_of(ws, struct armada8k_pcie, recover_link_work);
> +	struct dw_pcie_rp *pp = &pcie->pci->pp;
> +	struct pci_bus *bus = pp->bridge->bus;
> +	struct pci_dev *root_port;
> +	int ret;
> +
> +	root_port = pci_get_slot(bus, 0);
> +	if (!root_port) {
> +		dev_err(pcie->pci->dev, "failed to get root port\n");
> +		return;
> +	}
> +	pci_lock_rescan_remove();
> +	pci_stop_and_remove_bus_device(root_port);

Add blank line.

> +	/*
> +	 * Sleep needed to make sure all pcie transactions and access
> +	 * are flushed before resetting the mac
> +	 */
> +	msleep(100);

s/pcie/PCIe/
s/mac/MAC/ (also below)

What PCIe spec parameter is the 100ms?  If we don't already have a
#define for it, add one in drivers/pci/pci.h with spec citation.

> +	/* Reset mac */
> +	regmap_update_bits_base(pcie->sysctrl_base, UNIT_SOFT_RESET_CONFIG_REG,
> +				pcie->mac_rest_bitmask, 0, NULL, false, true);
> +	udelay(1);
> +	regmap_update_bits_base(pcie->sysctrl_base, UNIT_SOFT_RESET_CONFIG_REG,
> +				pcie->mac_rest_bitmask, pcie->mac_rest_bitmask,
> +				NULL, false, true);
> +	udelay(1);
> +
> +	ret = dw_pcie_setup_rc(pp);
> +	if (ret)
> +		goto fail;
> +
> +	ret = armada8k_pcie_host_init(pp);
> +	if (ret) {
> +		dev_err(pcie->pci->dev, "failed to initialize host: %d\n", ret);
> +		goto fail;
> +	}
> +
> +	if (!dw_pcie_link_up(pcie->pci)) {
> +		ret = dw_pcie_start_link(pcie->pci);
> +		if (ret)
> +			goto fail;
> +	}
> +
> +	/* Wait until the link becomes active again */
> +	if (dw_pcie_wait_for_link(pcie->pci))
> +		dev_err(pcie->pci->dev, "Link not up after reconfiguration\n");
> +
> +	bus = NULL;
> +	while ((bus = pci_find_next_bus(bus)) != NULL)
> +		pci_rescan_bus(bus);
> +
> +fail:
> +	pci_unlock_rescan_remove();
> +	pci_dev_put(root_port);
> +}
> +
>  static irqreturn_t armada8k_pcie_irq_handler(int irq, void *arg)
>  {
>  	struct armada8k_pcie *pcie = arg;
> @@ -253,6 +319,9 @@ static irqreturn_t armada8k_pcie_irq_handler(int irq, void *arg)
>  		 * initiate a link retrain. If link retrains were
>  		 * possible, that is.
>  		 */
> +		if (pcie->sysctrl_base && pcie->mac_rest_bitmask)
> +			schedule_work(&pcie->recover_link_work);
> +
>  		dev_dbg(pci->dev, "%s: link went down\n", __func__);
>  	}
>  
> @@ -322,6 +391,8 @@ static int armada8k_pcie_probe(struct platform_device *pdev)
>  
>  	pcie->pci = pci;
>  
> +	INIT_WORK(&pcie->recover_link_work, armada8k_pcie_recover_link);
> +
>  	pcie->clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(pcie->clk))
>  		return PTR_ERR(pcie->clk);
> @@ -349,6 +420,19 @@ static int armada8k_pcie_probe(struct platform_device *pdev)
>  		goto fail_clkreg;
>  	}
>  
> +	pcie->sysctrl_base = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> +						       "marvell,system-controller");
> +	if (IS_ERR(pcie->sysctrl_base)) {
> +		dev_warn(dev, "failed to find marvell,system-controller\n");
> +		pcie->sysctrl_base = 0x0;
> +	}
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "marvell,mac-reset-bit-mask",
> +				   &pcie->mac_rest_bitmask);
> +	if (ret < 0) {
> +		dev_warn(dev, "couldn't find mac reset bit mask: %d\n", ret);
> +		pcie->mac_rest_bitmask = 0x0;
> +	}
>  	ret = armada8k_pcie_setup_phys(pcie);
>  	if (ret)
>  		goto fail_clkreg;
> -- 
> 2.25.1
> 

