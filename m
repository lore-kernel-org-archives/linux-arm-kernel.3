Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2F7CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mPxLEL7QNlZDWS6jDA+27QrQoLVjop8vjZVTIhYnr8=; b=iYClKQ3+SlT1ZWpH1u1DowF04I
	5l1a2OAnI1/2p/DYf4oOIrT1mIvEYe2TMaEIAxWizPs6InqwRzQXrNjoLsEZtiLmls45MlO0H8S9a
	JAdVcK6l5u2ZwTXXvL7ueQgKSwLMd1L6h06IKvFLXrkYsJlWXHSCqYmUUhV+/dKapSDmIw0rf3Gll
	yX8JBQwh9Y3LEx6idpwr9DQ441s1+ftu0SAN9J4RLnqUxVtNxPv27SqWYb2rR5au3vMGk7h9GOjpB
	+p9Gyqk+7KrTy1IYkBCMjl01bIU+AA9l4C64R8Rb5VOurgZmsrxxHZTlSZ1Oua0RX97KS8uL7UFqp
	1Le62RCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkfK-00000005feI-2x7s;
	Fri, 31 Oct 2025 08:39:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkfI-00000005fds-0TjR;
	Fri, 31 Oct 2025 08:39:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B472240787;
	Fri, 31 Oct 2025 08:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8112EC4CEE7;
	Fri, 31 Oct 2025 08:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761899959;
	bh=k79R0Hpx74QOJ14uPbnMxmO5AYu0XzyA/jnOzGhcDXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WVthp2o3amxt2TBTbBgyM45rfymEwJoPZwEW9FhdA7296shiaUGS1dax/8mhMdXH7
	 ogY9IlrGVeamaW8vqfi0VaLkm+60ibSG6d1B+ANO+kJi53cf/BOFIi130riPokoKgA
	 qg38nsA5JflgYuxLpSBOpzWbClZVWwVodc0jvx0y1EDuLIpRj2zgH+zRQ5hvMP3yfs
	 Y7eyaTzvuXq4BVseuffgmanbQIwniOfpzthdZGLnGR6wmR/7VJGS/ijIg10UHph/pv
	 /ybpYX75EQuKWzIOn3BVIVpsva8pvLZFEGITebmzL311N0Bci+62OhdiB/Z5lFnhfZ
	 f7p0Tq13gdDlg==
Date: Fri, 31 Oct 2025 14:09:06 +0530
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
Subject: Re: [PATCH v1 2/2] PCI: dw-rockchip: Add runtime PM support to
 Rockchip PCIe driver
Message-ID: <ukgkfetbggzon4ppndl7gpitlsz7hjhzhyx3dgxqhdo52exguy@bqksd7d27lpy>
References: <20251027145602.199154-1-linux.amoon@gmail.com>
 <20251027145602.199154-3-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251027145602.199154-3-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_013920_324051_FB3967FA 
X-CRM114-Status: GOOD (  20.61  )
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

On Mon, Oct 27, 2025 at 08:25:30PM +0530, Anand Moon wrote:
> Add runtime power management support to the Rockchip DesignWare PCIe
> controller driver by enabling devm_pm_runtime() in the probe function.
> These changes allow the PCIe controller to suspend and resume dynamically,
> improving power efficiency on supported platforms.
> 

Seriously? How can this patch improve the power efficiency if it is not doing
any PM operation on its own?

Again a pointless patch.

- Mani

> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index b878ae8e2b3e..5026598d09f8 100644
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
> @@ -690,6 +691,20 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto deinit_phy;
>  
> +	ret = pm_runtime_set_suspended(dev);
> +	if (ret)
> +		goto disable_pm_runtime;
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret) {
> +		ret = dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +		goto deinit_clk;
> +	}
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		goto disable_pm_runtime;
> +
>  	switch (data->mode) {
>  	case DW_PCIE_RC_TYPE:
>  		ret = rockchip_pcie_configure_rc(pdev, rockchip);
> @@ -709,7 +724,10 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> +disable_pm_runtime:
> +	pm_runtime_disable(dev);
>  deinit_clk:
> +	pm_runtime_no_callbacks(dev);
>  	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
>  deinit_phy:
>  	rockchip_pcie_phy_deinit(rockchip);
> @@ -725,6 +743,9 @@ static void rockchip_pcie_remove(struct platform_device *pdev)
>  	/* Perform other cleanups as necessary */
>  	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
>  	rockchip_pcie_phy_deinit(rockchip);
> +	pm_runtime_put_sync(dev);
> +	pm_runtime_disable(dev);
> +	pm_runtime_no_callbacks(dev);
>  }
>  
>  static const struct rockchip_pcie_of_data rockchip_pcie_rc_of_data_rk3568 = {
> -- 
> 2.50.1
> 

-- 
மணிவண்ணன் சதாசிவம்

