Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CE0F30273
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 06:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBD7Uc3zHqReqtckIde1iVRGSA2FuW/NFMytwmn8KXw=; b=fnnz7clbaHaZk1Ue92hRFS6bEp
	2H7XcX1MPmvDACN9JExcI2tGPHCoqVUZPj/fwzpIq2l+UjGWTa+h79puMxS7pWzL4didILEWfGm2P
	dcbp1BXBVc8Pqx8S9MRtvfKEePuy3yLNceN3/WvyqyM4dWFQGsdRPSluFpqSBZTpzj4ZrtC7po16C
	zfgao36fUO6qXG3sUvRl0UK9r0PmK5yIXAM76G+Pg/EluZ5jhmtxuxrBW2Bme4Vk3NQJrbl79z9q+
	9OyNbrrUVCwfqy03GCEJ0/5w3V8ZtAFQAZjwkN65i9tU1rKELnTO2jtIVcFffWlQth8k0tYOt060N
	R2jM7NkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2144-00000003Nj3-1rvO;
	Mon, 16 Mar 2026 06:04:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2143-00000003Niw-1Cgk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 06:04:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 29A3B60008;
	Mon, 16 Mar 2026 06:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85D3C19421;
	Mon, 16 Mar 2026 06:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773641069;
	bh=WN3yfJ3zXoQ2ZODFv7YUiHHYTyhwghsV8HJyM/YeQxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u34hZwGMuEW2JI7wclq1OZIFStesOurFL/TuE9PgjLLMekXAQ2vRJBrZ3Kp/Hiree
	 Re9JAyFzRRqFJxw4j38F6/ea/imVR2KURPJ9ZjTTBkV8y3HNaU2VRD5aVxHsWq6/tw
	 XbtS9FyBH5vJ8017vayj/7+9feiJZcwUeCvLaFqqrqcVjHn/5c9J66v+tJVH3Xe6MS
	 2iHhso8KZ2RY1UyCTNft5yRdPqBfl7DJUrrgq4GEDePvZOXySrGOuUFVRZ1yX42P8R
	 hprKy1IF4oT2azCBEBkbZVYN3fJOeQI0WjSm7v6fJ3NWXb1UktAQ2XeXo9ghIiUfVF
	 O06DmAwy/Tzfg==
Date: Mon, 16 Mar 2026 11:34:20 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, Frank.Li@nxp.com, 
	bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, kernel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V8 05/13] PCI: imx6: Add support for parsing the reset
 property in new Root Port binding
Message-ID: <tot7suhdkydo5er4zjcxkdvfalii7k72kqyw54o5frtoklkxif@l6x6ipaezlmq>
References: <20260313020823.1592389-1-sherry.sun@nxp.com>
 <20260313020823.1592389-6-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313020823.1592389-6-sherry.sun@nxp.com>
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

On Fri, Mar 13, 2026 at 10:08:15AM +0800, Sherry Sun wrote:
> The current DT binding for pci-imx6 specifies the 'reset-gpios' property
> in the host bridge node. However, the PERST# signal logically belongs to
> individual Root Ports rather than the host bridge itself. This becomes
> important when supporting PCIe KeyE connector and PCI power control
> framework for pci-imx6 driver, which requires properties to be specified
> in Root Port nodes.
> 
> With the common Root Port parsing now handled in dw_pcie_host_init(),
> update the reset GPIO handling to use the parsed port list from
> bridge->ports. To maintain DT backwards compatibility, fallback to the
> legacy method of parsing the host bridge node if the reset property is
> not present in the Root Port node (indicated by an empty ports list).
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 74 +++++++++++++++++++++------
>  1 file changed, 59 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 83beca5a1fc2..cb18e1579788 100644
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
> @@ -150,7 +151,6 @@ struct imx_lut_data {
>  
>  struct imx_pcie {
>  	struct dw_pcie		*pci;
> -	struct gpio_desc	*reset_gpiod;
>  	struct clk_bulk_data	*clks;
>  	int			num_clks;
>  	bool			supports_clkreq;
> @@ -1222,6 +1222,44 @@ static void imx_pcie_disable_device(struct pci_host_bridge *bridge,
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
> +	if (!bridge) {
> +		dev_err(dev, "Bridge not allocated yet\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * For DT backward compatibility: if no Root Port nodes were parsed
> +	 * (indicated by empty ports list), parse reset-gpios from the host
> +	 * bridge node.
> +	 */
> +	if (!list_empty(&bridge->ports))

You should move this check and the comment to imx_pcie_host_init() and call
imx_pcie_parse_legacy_binding() conditionally to make it clear that this is a
fallback.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

