Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704DDD597AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 21:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=6/zhGG6Juj2VyAj9fwliQgGaDNsgQINkNgJ8rS0aOFM=; b=z9kB1+33cxkkXj
	vaXxhxrb8/eBvdPCMgIv0mVtW036VU9D7v3I7Tw7Iw+U3UcPQJwBbcTIaVUSRwZDfOAPgTqkMQTb5
	/7owPtn5a3KmxUDf6M0wcnsiZEk/KW4gXb4nNKJochpMvQppNMvrWR5PfxNtmPnhsnU1yjfYhVe2t
	Yvr1VOkTZ9sCAZ5T/aFE3nKpC/qBpV3U2s0mfvOWhd34licji+INoDRH6bH7L3hdRt8/iquhBqgVd
	JiAVDDNUWaAvBCd3xbY17g/dfDNNiMxoNIszTlqJCXZ9HR29BqO4JlZLmshQRR68Iln2P50WIDdnU
	d0OaMzUorIFEmvLhj+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAyfa-000000053Ak-2XS8;
	Tue, 12 Nov 2024 21:43:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAydl-000000052nm-2ocv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 21:41:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 16B9D5C4D51;
	Tue, 12 Nov 2024 21:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013FBC4CED6;
	Tue, 12 Nov 2024 21:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731447696;
	bh=+r1zjWFmIgf8fAjGCmjFjRtm3GAxhQNL1/z2KLtcs9g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qK8PUPXg/DWALAXo3BBuqgdkp4YMaXv9aQkA5TNaW23k41Ku4q60rQWaXnQr7CvJX
	 ZAI4TeJa5/FmFwju6GXCUUMDaYND+pA9iQxbI0MmLP6EpY5u3EflRf5tPGuHFe2wTO
	 d+jnQ1f7iMEPiFCedEld/kRnoynqu127yAdbcCK9Tuj8eHSzOLhh1aftYo97RD+PeJ
	 f/1XN91h0rk4beRpQuSgNVpYllOorY3XcGEx8hYD9Zr1ODKf/Nr5+YqGM4dANa4pEA
	 AnBD+B6r+mMVvA7Im3xPW1v/AfE2Ia69phuOyxY9ACg3mka3hNV/Amw/lGyCvxmRNa
	 89PVAabGdknsg==
Date: Tue, 12 Nov 2024 15:41:34 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
Cc: lpieralisi@kernel.org, thomas.petazzoni@bootlin.com, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	salee@marvell.com, dingwei@marvell.com
Subject: Re: [PATCH 1/1] PCI: armada8k: use reset controller to reset mac
Message-ID: <20241112214134.GA1861807@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112070745.759678-1-jpatel2@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_134137_820723_2D5FD2F4 
X-CRM114-Status: GOOD (  19.59  )
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

Observe subject line capitalization convention.

On Mon, Nov 11, 2024 at 11:07:45PM -0800, Jenishkumar Maheshbhai Patel wrote:
> change mac reset and mac reset bits to reset controller

Capitalize sentence.

s/mac/MAC/

Explain why we want this.  Apparently you're changing from one MAC
reset method to another method?

Collect these into a series instead of posting individual random
patches.

> Signed-off-by: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
> ---
>  drivers/pci/controller/dwc/pcie-armada8k.c | 30 +++++++---------------
>  1 file changed, 9 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
> index 9a48ef60be51..f9d6907900d1 100644
> --- a/drivers/pci/controller/dwc/pcie-armada8k.c
> +++ b/drivers/pci/controller/dwc/pcie-armada8k.c
> @@ -21,7 +21,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/resource.h>
>  #include <linux/of_pci.h>
> -#include <linux/mfd/syscon.h>
> +#include <linux/reset.h>
>  #include <linux/regmap.h>
>  #include <linux/of_gpio.h>
>  
> @@ -35,11 +35,10 @@ struct armada8k_pcie {
>  	struct clk *clk_reg;
>  	struct phy *phy[ARMADA8K_PCIE_MAX_LANES];
>  	unsigned int phy_count;
> -	struct regmap *sysctrl_base;
> -	u32 mac_rest_bitmask;
>  	struct work_struct recover_link_work;
>  	enum of_gpio_flags flags;
>  	struct gpio_desc *reset_gpio;
> +	struct reset_control *reset;
>  };
>  
>  #define PCIE_VENDOR_REGS_OFFSET		0x8000
> @@ -257,12 +256,9 @@ static void armada8k_pcie_recover_link(struct work_struct *ws)
>  	msleep(100);
>  
>  	/* Reset mac */
> -	regmap_update_bits_base(pcie->sysctrl_base, UNIT_SOFT_RESET_CONFIG_REG,
> -				pcie->mac_rest_bitmask, 0, NULL, false, true);
> +	reset_control_assert(pcie->reset);
>  	udelay(1);
> -	regmap_update_bits_base(pcie->sysctrl_base, UNIT_SOFT_RESET_CONFIG_REG,
> -				pcie->mac_rest_bitmask, pcie->mac_rest_bitmask,
> -				NULL, false, true);
> +	reset_control_deassert(pcie->reset);
>  	udelay(1);
>  
>  	ret = dw_pcie_setup_rc(pp);
> @@ -331,7 +327,7 @@ static irqreturn_t armada8k_pcie_irq_handler(int irq, void *arg)
>  		 * initiate a link retrain. If link retrains were
>  		 * possible, that is.
>  		 */
> -		if (pcie->sysctrl_base && pcie->mac_rest_bitmask)
> +		if (pcie->reset)
>  			schedule_work(&pcie->recover_link_work);
>  
>  		dev_dbg(pci->dev, "%s: link went down\n", __func__);
> @@ -440,18 +436,10 @@ static int armada8k_pcie_probe(struct platform_device *pdev)
>  	if (gpio_is_valid(reset_gpio))
>  		pcie->reset_gpio = gpio_to_desc(reset_gpio);
>  
> -	pcie->sysctrl_base = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> -						       "marvell,system-controller");
> -	if (IS_ERR(pcie->sysctrl_base)) {
> -		dev_warn(dev, "failed to find marvell,system-controller\n");
> -		pcie->sysctrl_base = 0x0;
> -	}
> -
> -	ret = of_property_read_u32(pdev->dev.of_node, "marvell,mac-reset-bit-mask",
> -				   &pcie->mac_rest_bitmask);
> -	if (ret < 0) {
> -		dev_warn(dev, "couldn't find mac reset bit mask: %d\n", ret);
> -		pcie->mac_rest_bitmask = 0x0;
> +	pcie->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(pcie->reset)) {
> +		dev_warn(dev, "failed to find mac reset\n");
> +		pcie->reset = 0x0;
>  	}
>  	ret = armada8k_pcie_setup_phys(pcie);
>  	if (ret)
> -- 
> 2.25.1
> 

