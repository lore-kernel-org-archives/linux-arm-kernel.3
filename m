Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C0ECDC19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 13:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFNsOfxFwkne3bOtLTL3sXMIJsY9jH9okRI+7zsz7ys=; b=F5mvT8kY1TMuG+PjIvkug/pbjo
	VXyeY+ktM0IUGCQqTKQuCra8qSwmChegMF15ZUZ70AnuYaI6FVhc8QAz7g1inonmgGnBgk8s+Cjxk
	xTo7mKcxQCspFDhY7VtghgYY+T4Yrp0V00OktQGrsZFvC44zJ9wuuI4NEs6iU4R9OLfj5apULIXqe
	dYsL7/76AqQ7Xbm5JNqjvUa9tZ6lVEZ2M2vSIogizjbV17MknyqJT2ku6qFfYDFYaqlQTBM1UveLw
	i2xicu+xJnHKqXYe00a1/ItPx0gbLXtKLJ2sFViyDo/IjLhGDQLI6/UblxJpsbB6KYPI7h1eSFIlE
	4A68jLNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7Eg-0000000D6rF-3vJS;
	Tue, 06 Jan 2026 13:36:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7Ef-0000000D6r2-0SyK;
	Tue, 06 Jan 2026 13:36:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23D086011E;
	Tue,  6 Jan 2026 13:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C11FC116C6;
	Tue,  6 Jan 2026 13:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767706591;
	bh=nHXV1LgeY+ybeHMb4BYaUT8tHK4MVM5/lrtO7MTBwbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUU36bGsPCyB1zwaKXyEiDn53MGc9yjEYD31Zip37sFZB+brbZTX3m7w0iwNuq7IH
	 72DGfxFCWXCqiLsY8+XmppJV3vMyl9utdvjSkRq4eYLLSYIxHwaePttTnNwgJVlV9S
	 yo4OGgL8HqK5QEzBbTHIUQC4kFeLA0b8Ol0AtOWXs0KtFEoU3Kjbr7zzDHj1vEEqOA
	 ov6owVdvvRQ5jTCgEpuO01wIavR0tftMBH+dag9ZJibe6vjy4rKacjtHL2kj3xUkrs
	 g9d2b3AVkqj0I5VyiGRhfDCra2bWPRZaB1lLEZUpFGWN2tyIU4i+LW4259Dd9oCvO7
	 fpddhn/lQs+Kg==
Date: Tue, 6 Jan 2026 19:06:23 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] PCI: dw-rockchip: Add runtime PM support to Rockchip
 PCIe
Message-ID: <ald3sxdzggbhqvpc7ra7x5nkf36xoamgwfumz5r4jwgirdzyes@nwvka2h256f6>
References: <20260102131819.123745-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260102131819.123745-1-linux.amoon@gmail.com>
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

On Fri, Jan 02, 2026 at 06:47:50PM +0530, Anand Moon wrote:
> Add runtime powwe manageement functionality into the Rockchip DesignWare
> PCIe controller driver. Calling devm_pm_runtime_enable() during device
> probing allows the controller to report its runtime PM status, enabling
> power management controls to be applied consistently across the entire
> connected PCIe hierarchy.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v2:
>    improve the commit message
>    Drop the .remove patch
>    Drop the disable_pm_runtime
> v1:
>  https://lore.kernel.org/all/20251027145602.199154-3-linux.amoon@gmail.com/
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index f8605fe61a415..2498ff5146a5a 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -20,6 +20,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  
> @@ -709,6 +710,20 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto deinit_phy;
>  
> +	ret = pm_runtime_set_suspended(dev);
> +	if (ret)
> +		goto deinit_clk;

Seriously? Why do you need this? Default PM status is 'suspended'.

> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret) {
> +		ret = dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +		goto deinit_clk;
> +	}
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		goto deinit_clk;
> +
>  	switch (data->mode) {
>  	case DW_PCIE_RC_TYPE:
>  		ret = rockchip_pcie_configure_rc(pdev, rockchip);
> @@ -730,6 +745,8 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
>  
>  deinit_clk:
>  	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
> +	pm_runtime_disable(dev);

You used devm_ for enable.

> +	pm_runtime_no_callbacks(dev);

Why? Where is pm_runtime_put()? Please read Documentation/power/runtime_pm.rst.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

