Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F229FEEF49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpC3KeQIUFsUJQcXGdbWYVgNQGL+uPAGbSvCTwpm+qk=; b=PaqGOuta3IlUQzqQ3Tyd9Om5Md
	g0vj8w3mhKIyydSP7gI6uq1wpTlWde0ZYN1vRHZwTbBW+1WotBtkltNXJREVSSpc6uEMa2V0ur7ze
	0M2G9KL1Kuj6MLvOaCHWDYl530LmhfR4/vcnx1iz4T0GBMPcSZwGDqQrkwpWRQtSE4JlQ+Ub8j7mX
	DkhtDwCZxFJqTNN6plsSTln/qq19ZRWl7vlJFoll5ly9az+zwISBmxp8sZ+8iziveAYzFQfOGhfTO
	UjuJJallu9zomb3wyNcp/Cp0jMTj73sFcXa0wMT7zpVPe+i04Ft+f6h93h7JVb7jqY6hX1OvQsivQ
	EDpzeXjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6vy-00000006YQA-3LiN;
	Tue, 07 Apr 2026 13:57:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6vx-00000006YPy-0UYd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:57:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D432600AC;
	Tue,  7 Apr 2026 13:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2485EC116C6;
	Tue,  7 Apr 2026 13:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775570255;
	bh=XapT16KA/LZ1Mf7VUVJ1UO30jbRieGjhqyjoieFHP00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n1VP5kihEakJCHYXy+nt86eaQxnA0CFtGqzKEZqa6p9XJAqK1p4r+EHfyOkHsMpAd
	 Kgtd5fhGGVds+JapfT90oJVZlX4TwM+NJRd2NuWV2XsvwHJMPJNqeTrQN96sSesZ4n
	 1bsiK8Gnmu2erNuO0UD3kjewFgy6XRh4NrFBy9a7SRw1aKdKTUHy+Tw+OU29dYEHwU
	 3uA4nzPvlxSZbuN1n5x97PMTanghtvfQxRyED99xpCO0/OYHyOlT49iDy8MFq91TgC
	 0QHGfXhbGBjHPoGlWfsaKXbzk+19xXv5IJODS4YUL5wxRXdG2xgss46LQyxLA0LBq7
	 /7NIX/mmJ0RMA==
Date: Tue, 7 Apr 2026 19:27:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	bhelgaas@google.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de, 
	imx@lists.linux.dev, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V11 04/12] PCI: imx6: Add support for parsing the reset
 property in new Root Port binding
Message-ID: <7ewnbwdo5qtasbxj4uel6a6uthczq2l6udbvoqqkwm776lvseb@v54ri2gknwxn>
References: <20260407104154.2842132-1-sherry.sun@nxp.com>
 <20260407104154.2842132-5-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260407104154.2842132-5-sherry.sun@nxp.com>
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

On Tue, Apr 07, 2026 at 06:41:46PM +0800, Sherry Sun wrote:
> The current DT binding for pci-imx6 specifies the 'reset-gpios' property
> in the host bridge node. However, the PERST# signal logically belongs to
> individual Root Ports rather than the host bridge itself. This becomes
> important when supporting PCIe KeyE connector and PCI power control
> framework for pci-imx6 driver, which requires properties to be specified
> in Root Port nodes.
> 
> Add support for parsing 'reset-gpios' from Root Port child nodes using
> the common helper pci_host_common_parse_ports(), and update the reset
> GPIO handling to use the parsed port list from bridge->ports. To
> maintain DT backwards compatibility, fallback to the legacy method of
> parsing the host bridge node if the reset property is not present in the
> Root Port node.
> 
> Since now the reset GPIO is obtained with GPIOD_ASIS flag, it may be in
> input mode, using gpiod_direction_output() instead of
> gpiod_set_value_cansleep() to ensure the reset GPIO is properly
> configured as output before setting its value.
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 75 +++++++++++++++++++++------
>  1 file changed, 60 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index d99da7e42590..dd8f9c0fcec4 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -34,6 +34,7 @@
>  #include <linux/pm_runtime.h>
>  
>  #include "../../pci.h"
> +#include "../pci-host-common.h"
>  #include "pcie-designware.h"
>  
>  #define IMX8MQ_GPR_PCIE_REF_USE_PAD		BIT(9)
> @@ -152,7 +153,6 @@ struct imx_lut_data {
>  
>  struct imx_pcie {
>  	struct dw_pcie		*pci;
> -	struct gpio_desc	*reset_gpiod;
>  	struct clk_bulk_data	*clks;
>  	int			num_clks;
>  	bool			supports_clkreq;
> @@ -1224,6 +1224,32 @@ static void imx_pcie_disable_device(struct pci_host_bridge *bridge,
>  	imx_pcie_remove_lut(imx_pcie, pci_dev_id(pdev));
>  }
>  
> +static int imx_pcie_parse_legacy_binding(struct imx_pcie *pcie)
> +{
> +	struct device *dev = pcie->pci->dev;
> +	struct pci_host_bridge *bridge = pcie->pci->pp.bridge;
> +	struct pci_host_port *port;
> +	struct gpio_desc *reset;
> +
> +	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_ASIS);
> +	if (IS_ERR(reset))
> +		return PTR_ERR(reset);
> +
> +	if (!reset)
> +		return 0;
> +
> +	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	port->reset = reset;
> +	INIT_LIST_HEAD(&port->list);
> +	list_add_tail(&port->list, &bridge->ports);
> +
> +	return devm_add_action_or_reset(dev, pci_host_common_delete_ports,
> +					&bridge->ports);
> +}
> +
>  static void imx_pcie_vpcie_aux_disable(void *data)
>  {
>  	struct regulator *vpcie_aux = data;
> @@ -1233,13 +1259,22 @@ static void imx_pcie_vpcie_aux_disable(void *data)
>  
>  static void imx_pcie_assert_perst(struct imx_pcie *imx_pcie, bool assert)
>  {
> -	if (assert) {
> -		gpiod_set_value_cansleep(imx_pcie->reset_gpiod, 1);
> -	} else {
> -		if (imx_pcie->reset_gpiod) {
> -			msleep(PCIE_T_PVPERL_MS);
> -			gpiod_set_value_cansleep(imx_pcie->reset_gpiod, 0);
> -			msleep(PCIE_RESET_CONFIG_WAIT_MS);
> +	struct dw_pcie *pci = imx_pcie->pci;
> +	struct pci_host_bridge *bridge = pci->pp.bridge;
> +	struct pci_host_port *port;
> +
> +	if (!bridge)
> +		return;
> +
> +	list_for_each_entry(port, &bridge->ports, list) {
> +		if (assert) {
> +			gpiod_direction_output(port->reset, 1);
> +		} else {
> +			if (port->reset) {
> +				msleep(PCIE_T_PVPERL_MS);
> +				gpiod_direction_output(port->reset, 0);
> +				msleep(PCIE_RESET_CONFIG_WAIT_MS);
> +			}

Sashiko flagged this loop:

```
Does this loop multiply the initialization delays?
If a controller has multiple Root Ports, the msleep calls will run
sequentially for each port, linearly increasing the delay. Could we optimize
this by asserting all reset GPIOs, waiting the pre-delay once, de-asserting
all GPIOs, and waiting the post-delay once for the entire bus?
```

Maybe you should do:

	if (!list_empty(&bridge->ports) && !assert)
		msleep(PCIE_T_PVPERL_MS);

	list_for_each_entry(port, &bridge->ports, list) {
		...
		gpiod_direction_output(port->reset, 0);
		...
	}

	if (!list_empty(&bridge->ports) && !assert)
		msleep(PCIE_RESET_CONFIG_WAIT_MS);

And then this:

```
Also, since this function is called from imx_pcie_resume_noirq, which
executes with hardware interrupts disabled, does the use of msleep here
trigger a 'sleeping while atomic' bug?
```

This is a valid concern. You should use mdelay(). But I'd recommend
switching to IRQ enabled callback, resume() instead. There is no complelling
reason to use resume_noirq() in this driver and adding delays in noirq()
callbacks is not recommended as it may increase the overall system resume time.

I will submit a separate series to convert dw_pcie_resume_noirq() and its
callers to IRQ enabled callbacks since this dw_pcie_resume_noirq() could
potentially cause delay up to 1sec.

>  		}
>  	}
>  }
> @@ -1249,8 +1284,25 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>  	struct device *dev = pci->dev;
>  	struct imx_pcie *imx_pcie = to_imx_pcie(pci);
> +	struct pci_host_bridge *bridge = pp->bridge;
>  	int ret;
>  
> +	if (bridge && list_empty(&bridge->ports)) {
> +		/* Parse Root Port nodes if present */
> +		ret = pci_host_common_parse_ports(dev, bridge);
> +		if (ret) {
> +			if (ret != -ENOENT) {
> +				dev_err(dev, "Failed to parse Root Port nodes: %d\n", ret);
> +				return ret;
> +			}
> +
> +			/* Fallback to legacy binding for DT backwards compatibility */
> +			ret = imx_pcie_parse_legacy_binding(imx_pcie);

This is also flagged by Sashiko:

```
Could this error handling corrupt the port state and trigger an invalid legacy
fallback?

If a device tree defines multiple Root Ports and one lacks the optional
reset GPIO, pci_host_common_parse_ports returns -ENOENT. This causes
the code to fall back to imx_pcie_parse_legacy_binding.

Since the already-parsed child ports remain in bridge->ports without
rollback, the legacy host bridge GPIO will be appended alongside them.
Valid child nodes are skipped, and both child and legacy GPIOs will be
toggled simultaneously.
```

You should try to cleanup Root Port resources if pci_host_common_parse_ports()
fails with -ENOENT.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

