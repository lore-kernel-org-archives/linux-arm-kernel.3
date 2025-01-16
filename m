Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCB9C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 15:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vFB1t3fDT7QsP/fwJl9+Sv5BXq1ikBIr9Ig2GfxqrOw=; b=yqrHRD2ok+dp8k58k+UXd/yh6v
	cJv26fPknMQ484T52VfBIkaFAfWIklxn2tOG5wllwMiZph3+6vta8gj5YDsganhWSD7QEnCcr7Nzr
	sYQBRIIqs52E6v57OoEhVMV9cd72fK9t0bF/Ot4lxZJACwwibE6ALFnK2cYui6QG0YhscOLUTaL0f
	iX4fdqrgNxauTcCVjDJURvo/uJefadq+5CPLlobo3+MEXJ3yDhw4S3h6N6MGrvN5+vWdqCNSGtRsY
	1HjA43AVOh/8i8kFjr41FS35DCglHw+WgcWrOR4vsH2ZJk44hXO4ZlILG3GxkK96/M1Y+K7eTA5e6
	Ow7iMErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRsf-0000000FLVE-3Rdt;
	Thu, 16 Jan 2025 15:34:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRrP-0000000FLKs-14EZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 15:32:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 63E49A41EA4;
	Thu, 16 Jan 2025 15:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04DDC4CEE1;
	Thu, 16 Jan 2025 15:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737041562;
	bh=9SUodvvg1rGYUqIXFOOqwLz+xUmk/vUWLOe/vZPWUjE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ghZsGw/aRdpoR6kljKlJeaZeVo3Vc94QQPFpq7jm7p8/L5LlkzigFUX56+Mb9Vq0P
	 8U0rN3ApGsb5ZZkN4/Lvqap9/VFcr5u62bjBP2E5s3jl6GZa9QS8KiKQuui1rxYxzG
	 qlc31wRqjgk37E7qPX1/riy9n8XeyY1dzDc0Zy9THmsIg7mn1i3xBEKvdrZ85O39+W
	 vKIg1TSpoia+kqD+EQp1FsP0Viip4hMsvMdz9VhNrKWdZyQ47+y6FLXGcBNDLXC0md
	 u5FdFkdQaMYA261Cu3/w2ZMatQDC05PCJady8+6rAoCoU6a4kvfD0FiXUxIfQPSTrD
	 tQ8gWAokc/FCw==
Date: Thu, 16 Jan 2025 09:32:39 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v8 3/7] PCI: dwc: ep: Add bus_addr_base for outbound
 window
Message-ID: <20250116153239.GA582080@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119-pci_fixup_addr-v8-3-c4bfa5193288@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_073243_432008_E87CFA55 
X-CRM114-Status: GOOD (  33.91  )
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

On Tue, Nov 19, 2024 at 02:44:21PM -0500, Frank Li wrote:
>                    Endpoint
>   ┌───────────────────────────────────────────────┐
>   │                             pcie-ep@5f010000  │
>   │                             ┌────────────────┐│
>   │                             │   Endpoint     ││
>   │                             │   PCIe         ││
>   │                             │   Controller   ││
>   │           bus@5f000000      │                ││
>   │           ┌──────────┐      │                ││
>   │           │          │ Outbound Transfer     ││
>   │┌─────┐    │  Bus     ┼─────►│ ATU  ──────────┬┬─────►
>   ││     │    │  Fabric  │Bus   │                ││PCI Addr
>   ││ CPU ├───►│          │Addr  │                ││0xA000_0000
>   ││     │CPU │          │0x8000_0000            ││
>   │└─────┘Addr└──────────┘      │                ││
>   │       0x7000_0000           └────────────────┘│
>   └───────────────────────────────────────────────┘
> 
> Use 'ranges' property in DT to configure the iATU outbound window address.
> The bus fabric generally passes the same address to the PCIe EP controller,
> but some bus fabrics map the address before sending it to the PCIe EP
> controller.
> 
> Above diagram, CPU write data to outbound windows address 0x7000_0000, Bus
> fabric map it to 0x8000_0000. ATU should use bus address 0x8000_0000 as
> input address and map to PCI address 0xA000_0000.
> 
> Previously, 'cpu_addr_fixup()' was used to handle address conversion. Now,
> the device tree provides this information, preferring a common method.
> 
> bus@5f000000 {
> 	compatible = "simple-bus";
> 	ranges = <0x80000000 0x0 0x70000000 0x10000000>;
> 
> 	pcie-ep@5f010000 {
> 		reg = <0x80000000 0x10000000>;
> 		reg-names ="addr_space";
> 		...
> 	};
> 	...
> };
> 
> 'ranges' in bus@5f000000 descript how address map from CPU address to bus
> address.

Shouldn't there also be a pcie-ep@5f010000 'ranges' property to
describe the translation for the window from bus addr 0x8000_0000 to
PCI addr 0xA000_0000?

I assume the pcie-ep@5f010000 controller also has its own registers in
the bus addr space, separate from the window to PCI, and its 'reg'
property would describe those?

The similar patch at [1] includes:

  pcie@5f010000 {
    reg = <0x5f010000 0x10000>, <0x8ff00000 0x80000>;

I assumed that [bus 0x5f010000-0x5f01ffff] is PCIe controller register
space and [bus 0x8ff00000-0x8ff7ffff] is ECAM space.

But that can't be right because ECAM requires 1MB per bus, and
[bus 0x8ff00000-0x8ff7ffff] is only 512KB.

> Use `of_property_read_reg()` to obtain the bus address and set it to the
> ATU correctly, eliminating the need for vendor-specific cpu_addr_fixup().

Why is this different from [1], where parent_bus_addr comes from the
'ranges' property?  Isn't this the same exact kind of address
translation for both RC and EP mode?

> Add 'using_dtbus_info' to indicate device tree reflect correctly bus
> address translation in case break compatibility.

'using_dtbus_info' doesn't exist; I assume this should be
'use_parent_dt_ranges'?

Sorry I'm so confused, please help me out :)

[1] https://lore.kernel.org/r/20241119-pci_fixup_addr-v8-1-c4bfa5193288@nxp.com

> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v7 to v8
> - Add Mani's reviewedby tag
> - s/convert/map in commit message
> - update comments for of_property_read_reg()
> - use 'use_parent_dt_ranges'
> 
> Change from v6 to v7
> - none
> 
> Change from v5 to v6
> - update diagram
> - Add comments for of_property_read_reg()
> - Remove unrelated 0x5f00_0000 in commit message
> 
> Change from v3 to v4
> - change bus_addr_base to u64 to fix 32bit build error
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410230328.BTHareG1-lkp@intel.com/
> 
> Change from v2 to v3
> - Add using_dtbus_info to control if use device tree bus ranges
> information.
> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 18 +++++++++++++++++-
>  drivers/pci/controller/dwc/pcie-designware.h    |  1 +
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 43ba5c6738df1..42719ad263b11 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -9,6 +9,7 @@
>  #include <linux/align.h>
>  #include <linux/bitfield.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  
>  #include "pcie-designware.h"
> @@ -294,7 +295,7 @@ static int dw_pcie_ep_map_addr(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  
>  	atu.func_no = func_no;
>  	atu.type = PCIE_ATU_TYPE_MEM;
> -	atu.cpu_addr = addr;
> +	atu.cpu_addr = addr - ep->phys_base + ep->bus_addr_base;
>  	atu.pci_addr = pci_addr;
>  	atu.size = size;
>  	ret = dw_pcie_ep_outbound_atu(ep, &atu);
> @@ -861,6 +862,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	struct device *dev = pci->dev;
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct device_node *np = dev->of_node;
> +	int index;
>  
>  	INIT_LIST_HEAD(&ep->func_list);
>  
> @@ -873,6 +875,20 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  		return -EINVAL;
>  
>  	ep->phys_base = res->start;
> +	ep->bus_addr_base = ep->phys_base;
> +
> +	if (pci->use_parent_dt_ranges) {
> +		index = of_property_match_string(np, "reg-names", "addr_space");
> +		if (index < 0)
> +			return -EINVAL;
> +
> +		/*
> +		 * Get the untranslated bus address from devicetree to use it
> +		 * as the iATU CPU address in dw_pcie_ep_map_addr().
> +		 */
> +		of_property_read_reg(np, index, &ep->bus_addr_base, NULL);
> +	}
> +
>  	ep->addr_size = resource_size(res);
>  
>  	if (ep->ops->pre_init)
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 4f31d4259a0de..5c14ed2cb91ed 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -410,6 +410,7 @@ struct dw_pcie_ep {
>  	struct list_head	func_list;
>  	const struct dw_pcie_ep_ops *ops;
>  	phys_addr_t		phys_base;
> +	u64			bus_addr_base;
>  	size_t			addr_size;
>  	size_t			page_size;
>  	u8			bar_to_atu[PCI_STD_NUM_BARS];
> 
> -- 
> 2.34.1
> 

