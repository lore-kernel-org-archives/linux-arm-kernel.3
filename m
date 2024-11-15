Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B36D68BCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 17:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsIDulqPVm11kvME4lSY/OQMyOCr+gV0M7N3MMcJtZE=; b=2VNy3cU6gZF4ZgmFhH6xi9CL3t
	+GJ1ahD+jPCYu/BAe/r5SjzKkCGOmZwYw7oVIBbZVGp8Aqzy9FyCr8e9t3BmCrU1u4vE2qOL2RX7r
	Q9drYIzZDPbqLeDKnjacfE+oBNgkSI9k8dxyWbLViq3l7AfvUSrsqhDvN7t9RRHeLvkTvdRO+LFol
	fqarmi8L3MFuvec3TUR8ypgbVDW/G0gKnu3YQ8QwuzYsXy0jygFi0jQC1QX8BqEHgRucOlN1hv05E
	j7rMJtV8DgqHyVuVR7Vii5lf4ZN0fUIblGoW2A2P8StWlhQlx82w8wFOl0dTVnTvL2VPSPcTKa+LG
	70knm4LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC0V7-00000003cK4-1Ppb;
	Fri, 15 Nov 2024 17:52:57 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC0UB-00000003cAF-40CT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 17:52:01 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21145812538so17399465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 09:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731693118; x=1732297918; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HsIDulqPVm11kvME4lSY/OQMyOCr+gV0M7N3MMcJtZE=;
        b=t2JP78KnX8bnwi7DhdAoYlnS2LuPvRTd/lIeHCUQzMCcq5K4Cw+pJoD8F/gH22F/1O
         2qcXwzk9udEV/dBloyeGAfqdj0Vgy9ZW/clf0S8hbnOWjStlGvy2uA9b753WMQqWt3hh
         nZlSw/4+cKl5ks/yXwV9nUpJF9XCIG9VTRzOzpQ0Olqn129YaWE4hp0IyUj27+10iC+z
         vZSCuXlv5rih6YrwF8qHo4LPkX6XW/jaAWiayU4sVsWKYxbRNACKCEOI5WYZfLqWr+jr
         r0NmklTigd0v+W29z3rHCNyqRezb2NYKQtPR45n03184jdIXC4VeCnUJrAqHSdDy4WEA
         YQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731693118; x=1732297918;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HsIDulqPVm11kvME4lSY/OQMyOCr+gV0M7N3MMcJtZE=;
        b=sIaPxx8o8J68IKCk6R4Nb63BWn/pTRhu1eKVr9STbhxAh80LNXn3SclIvELpdFJ/3P
         XiwD9HQekfG2GwWhyqgnHLHS0dLZN08JzO3kOvY3ZMLcDnLkbfE/2RfZdjmj/si2IWfo
         RGypSMBEOQQEapUkACJzG1QUsAt4Oj+sHhUxLdKGWrf5bZ4hpKe4WwycrpB4DBE1IU3b
         6m9v5jJDf5b/hX1jy311IECrrBjv4fbpC6ag/ns8FfKbYgoYer7qU1Gnd//b8g8v0Dee
         nAsNw8hjcGji7wL5YLlIeypwdp9C2KigcqKkxKID5Y6r89JzK+f5S9yNyrGjhpa0a2WZ
         E6XA==
X-Forwarded-Encrypted: i=1; AJvYcCXXmYTXMcJkxxcFQqvhX43vDHqCw4uqkmsh5pKmWPkOOAxWCY8/x4oCzOB+d1PfHHEbblYecP9vkELrCPMhvgGb@lists.infradead.org
X-Gm-Message-State: AOJu0YyhxNa34HgUMCztN6iXTIAaqFspBETzK9Ve6LHgMLVfL/PXLNJs
	NmBsKTbL515O/8A7BRTWfTyWcN6E6C6K79mHSCOVB1uqfHGe4qA9OxCf9aXzQg==
X-Google-Smtp-Source: AGHT+IEo8KIx+IDClFIGzyYawx9wyWhggQfWSS3I5L/7qTi+6XFaoyQ//P5mcasYulpv7qLH/9m62A==
X-Received: by 2002:a17:902:d4ca:b0:20c:f3cf:50e6 with SMTP id d9443c01a7336-211d0ebc492mr54783415ad.38.1731693118199;
        Fri, 15 Nov 2024 09:51:58 -0800 (PST)
Received: from thinkpad ([117.193.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211e9d0c389sm793705ad.161.2024.11.15.09.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 09:51:57 -0800 (PST)
Date: Fri, 15 Nov 2024 23:21:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
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
Subject: Re: [PATCH v7 2/7] PCI: dwc: Using parent_bus_addr in of_range to
 eliminate cpu_addr_fixup()
Message-ID: <20241115175148.tqzqiv53mccz52tq@thinkpad>
References: <20241029-pci_fixup_addr-v7-0-8310dc24fb7c@nxp.com>
 <20241029-pci_fixup_addr-v7-2-8310dc24fb7c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029-pci_fixup_addr-v7-2-8310dc24fb7c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_095159_995441_1241F3A1 
X-CRM114-Status: GOOD (  37.12  )
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

On Tue, Oct 29, 2024 at 12:36:35PM -0400, Frank Li wrote:

Please reword the subject as:

PCI: dwc: Use devicetree 'ranges' property to get rid of cpu_addr_fixup() callback

> parent_bus_addr in struct of_range can indicate address information just
> ahead of PCIe controller. Most system's bus fabric use 1:1 map between
> input and output address. but some hardware like i.MX8QXP doesn't use 1:1
> map. See below diagram:
> 
>             ┌─────────┐                    ┌────────────┐
>  ┌─────┐    │         │ IA: 0x8ff8_0000    │            │
>  │ CPU ├───►│   ┌────►├─────────────────┐  │ PCI        │
>  └─────┘    │   │     │ IA: 0x8ff0_0000 │  │            │
>   CPU Addr  │   │  ┌─►├─────────────┐   │  │ Controller │
> 0x7ff8_0000─┼───┘  │  │             │   │  │            │
>             │      │  │             │   │  │            │   PCI Addr
> 0x7ff0_0000─┼──────┘  │             │   └──► IOSpace   ─┼────────────►
>             │         │             │      │            │    0
> 0x7000_0000─┼────────►├─────────┐   │      │            │
>             └─────────┘         │   └──────► CfgSpace  ─┼────────────►
>              BUS Fabric         │          │            │    0
>                                 │          │            │
>                                 └──────────► MemSpace  ─┼────────────►
>                         IA: 0x8000_0000    │            │  0x8000_0000
>                                            └────────────┘
> 
> bus@5f000000 {
> 	compatible = "simple-bus";
> 	#address-cells = <1>;
> 	#size-cells = <1>;
> 	ranges = <0x80000000 0x0 0x70000000 0x10000000>;
> 
> 	pcie@5f010000 {
> 		compatible = "fsl,imx8q-pcie";
> 		reg = <0x5f010000 0x10000>, <0x8ff00000 0x80000>;
> 		reg-names = "dbi", "config";
> 		#address-cells = <3>;
> 		#size-cells = <2>;
> 		device_type = "pci";
> 		bus-range = <0x00 0xff>;
> 		ranges = <0x81000000 0 0x00000000 0x8ff80000 0 0x00010000>,
> 			 <0x82000000 0 0x80000000 0x80000000 0 0x0ff00000>;
> 	...
> 	};
> };
> 
> Term internal address (IA) here means the address just before PCIe
> controller. After ATU use this IA instead CPU address, cpu_addr_fixup() can
> be removed.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Add a resource_size_t parent_bus_addr local varible to fix 32bit build
> error.
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410291546.kvgEWJv7-lkp@intel.com/
> 
> Chagne from v5 to v6
> -add comments for of_property_read_reg().
> 
> Change from v4 to v5
> - remove confused 0x5f00_0000 range in sample dts.
> - reorder address at above diagram.
> 
> Change from v3 to v4
> - none
> 
> Change from v2 to v3
> - %s/cpu_untranslate_addr/parent_bus_addr/g
> - update diagram.
> - improve commit message.
> 
> Change from v1 to v2
> - update because patch1 change get untranslate address method.
> - add using_dtbus_info in case break back compatibility for exited platform.
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 55 ++++++++++++++++++++++-
>  drivers/pci/controller/dwc/pcie-designware.h      |  8 ++++
>  2 files changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 3e41865c72904..ea01b7bda0a76 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -418,6 +418,34 @@ static void dw_pcie_host_request_msg_tlp_res(struct dw_pcie_rp *pp)
>  	}
>  }
>  
> +static int dw_pcie_get_untranslate_addr(struct dw_pcie *pci, resource_size_t pci_addr,
> +					resource_size_t *i_addr)

dw_pcie_get_parent_addr()? Since this function is anyway reading the parent
address from DT.

> +{
> +	struct device *dev = pci->dev;
> +	struct device_node *np = dev->of_node;
> +	struct of_range_parser parser;
> +	struct of_range range;
> +	int ret;
> +
> +	if (!pci->using_dtbus_info) {
> +		*i_addr = pci_addr;
> +		return 0;
> +	}
> +
> +	ret = of_range_parser_init(&parser, np);
> +	if (ret)
> +		return ret;
> +
> +	for_each_of_pci_range(&parser, &range) {
> +		if (pci_addr == range.bus_addr) {
> +			*i_addr = range.parent_bus_addr;
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -427,6 +455,7 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	struct resource_entry *win;
>  	struct pci_host_bridge *bridge;
>  	struct resource *res;
> +	int index;
>  	int ret;
>  
>  	raw_spin_lock_init(&pp->lock);
> @@ -440,6 +469,20 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  		pp->cfg0_size = resource_size(res);
>  		pp->cfg0_base = res->start;
>  
> +		if (pci->using_dtbus_info) {
> +			index = of_property_match_string(np, "reg-names", "config");
> +			if (index < 0)
> +				return -EINVAL;
> +			/*
> +			 * Retrieve the parent bus address of PCI config space.
> +			 * If the parent bus ranges in the device tree provide
> +			 * the correct address conversion information, set
> +			 * 'using_dtbus_info' to true, The 'cpu_addr_fixup()'
> +			 * can be eliminated.
> +			 */

Nobody will switch to 'ranges' property if you mention it in comments. We
usually add dev_warn_once() to print a warning for broken DT so that the users
will try to fix it. You can use below diff (as a separate patch ofc):

```
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 6d6cbc8b5b2c..d1e5395386fe 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -844,6 +844,9 @@ void dw_pcie_iatu_detect(struct dw_pcie *pci)
                 dw_pcie_cap_is(pci, IATU_UNROLL) ? "T" : "F",
                 pci->num_ob_windows, pci->num_ib_windows,
                 pci->region_align / SZ_1K, (pci->region_limit + 1) / SZ_1G);
+
+       if (pci->ops && pci->ops->cpu_addr_fixup)
+               dev_warn_once(pci->dev, "Broken \"ranges\" property detected. Please fix DT!\n");
 }
 
 static u32 dw_pcie_readl_dma(struct dw_pcie *pci, u32 reg)
```

> +			of_property_read_reg(np, index, &pp->cfg0_base, NULL);

Can you explain what is going on here?

> +		}
> +
>  		pp->va_cfg0_base = devm_pci_remap_cfg_resource(dev, res);
>  		if (IS_ERR(pp->va_cfg0_base))
>  			return PTR_ERR(pp->va_cfg0_base);
> @@ -462,6 +505,9 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  		pp->io_base = pci_pio_to_address(win->res->start);
>  	}
>  
> +	if (dw_pcie_get_untranslate_addr(pci, pp->io_bus_addr, &pp->io_base))
> +		return -ENODEV;

Use actual return value here and below.

> +
>  	/* Set default bus ops */
>  	bridge->ops = &dw_pcie_ops;
>  	bridge->child_ops = &dw_child_pcie_ops;
> @@ -722,6 +768,8 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
>  
>  	i = 0;
>  	resource_list_for_each_entry(entry, &pp->bridge->windows) {
> +		resource_size_t parent_bus_addr;
> +
>  		if (resource_type(entry->res) != IORESOURCE_MEM)
>  			continue;
>  
> @@ -730,9 +778,14 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
>  
>  		atu.index = i;
>  		atu.type = PCIE_ATU_TYPE_MEM;
> -		atu.cpu_addr = entry->res->start;
> +		parent_bus_addr = entry->res->start;
>  		atu.pci_addr = entry->res->start - entry->offset;
>  
> +		if (dw_pcie_get_untranslate_addr(pci, entry->res->start, &parent_bus_addr))
> +			return -EINVAL;
> +
> +		atu.cpu_addr = parent_bus_addr;
> +
>  		/* Adjust iATU size if MSG TLP region was allocated before */
>  		if (pp->msg_res && pp->msg_res->parent == entry->res)
>  			atu.size = resource_size(entry->res) -
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 347ab74ac35aa..f8067393ad35a 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -463,6 +463,14 @@ struct dw_pcie {
>  	struct reset_control_bulk_data	core_rsts[DW_PCIE_NUM_CORE_RSTS];
>  	struct gpio_desc		*pe_rst;
>  	bool			suspended;
> +	/*
> +	 * Use device tree 'ranges' property of bus node instead using
> +	 * cpu_addr_fixup(). Some old platform dts 'ranges' in bus node may not
> +	 * reflect real hardware's behavior. In case break these platform back
> +	 * compatibility, add below flags. Set it true if dts already correct
> +	 * indicate bus fabric address convert.

	/*
	 * This flag indicates that the vendor driver uses devicetree 'ranges'
	 * property to allow iATU to use the Intermediate Address (IA) for
	 * outbound mapping. Using this flag also avoids the usage of
	 * 'cpu_addr_fixup' callback implementation in the driver.
	 */

> +	 */
> +	bool			using_dtbus_info;

'use_dt_ranges'?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

