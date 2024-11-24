Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782ECE668B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQsDVb7F2iz9b9KgCIAt+p1CapfKtmuyCi0nc0rEfIc=; b=BHgBguQ3FMfpiauZCkNyLk/3oQ
	Oam2Hte4jnJN31lACbZqP3rERe4TLcA6vs6sSNaORnaGktKNh7bN+JQQqNPGTAzXSosBJNgufN6RY
	yoElCi5+p+DO5uxmIHyYgrERN1SkA+3LwXuj0CuxNnQBff9IolLRqHqtlaFNrantyAHdXyllxbyaH
	njitBOevaOdFTEEUAlhOR1cMpO7e2A4b4jYJXG/FPYLpttD9NAGprfE8CxH/2cS7XfsoUZEDjTjm4
	poB6sjUO1/MH8tkbF9zT8b54Vbb7c1GgifswVO3brbFN3+0W2ATrHUpgaYtPDzdCXsnGIP1hdGqqj
	3wNBNFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFDh6-000000067Og-16ec;
	Sun, 24 Nov 2024 14:34:36 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFDg8-000000067FG-2hwc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 14:33:38 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-724e1b08fc7so1914959b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 06:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732458815; x=1733063615; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qQsDVb7F2iz9b9KgCIAt+p1CapfKtmuyCi0nc0rEfIc=;
        b=d5j/RWETRpngWLrsrUGioT5BNF/+voadE8rVxErKIEwi4LXWhP35geDAr59KZJkQgb
         Z8hErPA7NZklA0ZuXl2QOn2Hv2KF9EKMSgovQ9YNw8P/3rmSZe/f0Y+FbFHf5hXbbywc
         rkJvQoUbgupM4WGPPb3JKUaA3Eq5aA7nEBEFc7/wPlbXwv3M9rpVE98I9erNHSMNcjLm
         +MOlGbdNBiWPEkD6CBDmLDx2WBqf155UXnmIFlzdddCd9y8ihgxrp+/mCIarR6vTPO9I
         Cx2N5h1GwpJq8A7L78QNUWkPxDy/IXJ03epW3wS2CkoRTafxUDD0buVjAM7/E70CTIJ3
         bAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732458815; x=1733063615;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQsDVb7F2iz9b9KgCIAt+p1CapfKtmuyCi0nc0rEfIc=;
        b=b8+sc+mcS2Q26tdzoeMB5hxUnTwS2xs5MVH9TEfo0j5u/8Aw1+gCSF4nfKFPAo8+gn
         bX2XJIGtd7zrPOHnWhy+dMFU3Z2OwjShT5qr/waUlNlo/tChMhcRNZwSyqbRoICYjQqL
         vl0+l50jeRspPpUd2oL8RbbpHMFOpPd3vHCa1/i462LRuJYdVS+wfkf4trMIYYNQVSxM
         BGgrWhvK9yvFuRbxhDEbGOvVlY3f/CtN5nYDP2dvBFxerBAR1aQksYiPVutoTuz8BhyR
         kZVbI556jgeE1JHUR4CjXHyq4BaAbrT1pCwcaBpwhqqBNNC54dnEcPgAETg4OiPQOBj6
         QeWw==
X-Forwarded-Encrypted: i=1; AJvYcCUrgAKF5W9JkFL38XP+a77RkatjwbnAad0hPNr1pccc1Ha/iqbUHOFYtnCOja0P6k5KJwHJqEXww/liljuRe2eR@lists.infradead.org
X-Gm-Message-State: AOJu0YzGLnZZSs3wtlLh/IMjJ4iyTzQGEkBbxfgIK7t18KlLKkieVezJ
	q/n2fDCFa/ubAsNTa5HrdTA4xY3p6mSOWu2PiXik35d07ZsqSqowjLXAg2eDVQ==
X-Gm-Gg: ASbGncu7+2w+WS7bTnL8BOLXupLmmdTnG8LYz3Jmw7fm4jHRPVZ1ctkW/SBy3VIpjB4
	ZLjmF9wMYKRIFqRmyrEwx4vHRsOqOwEKu+FfAAxOdbmklhAOjuF0i7d7ivRzb9iZDwB9yc5LuVv
	JXKow3+uR5yMBAFD2ZGtvCSDdegGT/ZxAPsrk7fdiDtouqyFBR3rTw+/iXvAgYedfyPIQtJ9g8r
	e0MDwFPgyxzqUe7n9xJVSuhB7j+jjp+TwKMFh6mX85MDoogDCzuKnWh2ftC
X-Google-Smtp-Source: AGHT+IEXdIY8HdO7q0GsWQpaA8gaDP2oPUf00iydOaa8Lv2vpwZRDX+byC5eu+a3QGb7Pw0MmbQxmg==
X-Received: by 2002:a17:903:2cd:b0:20c:a387:7dc9 with SMTP id d9443c01a7336-2129f7b4e55mr144454115ad.29.1732458815130;
        Sun, 24 Nov 2024 06:33:35 -0800 (PST)
Received: from thinkpad ([36.255.17.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db87dafsm47492325ad.43.2024.11.24.06.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 06:33:34 -0800 (PST)
Date: Sun, 24 Nov 2024 20:03:27 +0530
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
Subject: Re: [PATCH v8 2/7] PCI: dwc: Use devicetree 'ranges' property to get
 rid of cpu_addr_fixup() callback
Message-ID: <20241124143327.6cuxrw76pr6olfor@thinkpad>
References: <20241119-pci_fixup_addr-v8-0-c4bfa5193288@nxp.com>
 <20241119-pci_fixup_addr-v8-2-c4bfa5193288@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119-pci_fixup_addr-v8-2-c4bfa5193288@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_063336_698648_54EB1D91 
X-CRM114-Status: GOOD (  37.13  )
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

On Tue, Nov 19, 2024 at 02:44:20PM -0500, Frank Li wrote:
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

The newly added warning should be mentioned in the commit message. But no need
to respin just for this. I hope Krzysztof can add it while applying.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Change from v7 to v8
> - Add dev_warning_once at dw_pcie_iatu_detect() to reminder
> cpu_addr_fixup() user to correct their code
> - use 'use_parent_dt_ranges' control enable use dt parent bus node ranges.
> - rename dw_pcie_get_untranslate_addr to dw_pcie_get_parent_addr().
> - of_property_read_reg() already have comments, so needn't add more.
> - return actual err code from function
> 
> Change from v6 to v7
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
>  drivers/pci/controller/dwc/pcie-designware-host.c | 57 ++++++++++++++++++++++-
>  drivers/pci/controller/dwc/pcie-designware.c      |  9 ++++
>  drivers/pci/controller/dwc/pcie-designware.h      |  7 +++
>  3 files changed, 72 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 3e41865c72904..f882b11fd7b94 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -418,6 +418,34 @@ static void dw_pcie_host_request_msg_tlp_res(struct dw_pcie_rp *pp)
>  	}
>  }
>  
> +static int dw_pcie_get_parent_addr(struct dw_pcie *pci, resource_size_t pci_addr,
> +				   resource_size_t *i_addr)
> +{
> +	struct device *dev = pci->dev;
> +	struct device_node *np = dev->of_node;
> +	struct of_range_parser parser;
> +	struct of_range range;
> +	int ret;
> +
> +	if (!pci->use_parent_dt_ranges) {
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
> +		if (pci->use_parent_dt_ranges) {
> +			index = of_property_match_string(np, "reg-names", "config");
> +			if (index < 0)
> +				return -EINVAL;
> +			/*
> +			 * Retrieve the parent bus address of PCI config space.
> +			 * If the parent bus ranges in the device tree provide
> +			 * the correct address conversion information, set
> +			 * 'use_parent_dt_ranges' to true, The
> +			 * 'cpu_addr_fixup()' can be eliminated.
> +			 */
> +			of_property_read_reg(np, index, &pp->cfg0_base, NULL);
> +		}
> +
>  		pp->va_cfg0_base = devm_pci_remap_cfg_resource(dev, res);
>  		if (IS_ERR(pp->va_cfg0_base))
>  			return PTR_ERR(pp->va_cfg0_base);
> @@ -462,6 +505,10 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  		pp->io_base = pci_pio_to_address(win->res->start);
>  	}
>  
> +	ret = dw_pcie_get_parent_addr(pci, pp->io_bus_addr, &pp->io_base);
> +	if (ret)
> +		return ret;
> +
>  	/* Set default bus ops */
>  	bridge->ops = &dw_pcie_ops;
>  	bridge->child_ops = &dw_child_pcie_ops;
> @@ -722,6 +769,8 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
>  
>  	i = 0;
>  	resource_list_for_each_entry(entry, &pp->bridge->windows) {
> +		resource_size_t parent_bus_addr;
> +
>  		if (resource_type(entry->res) != IORESOURCE_MEM)
>  			continue;
>  
> @@ -730,9 +779,15 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
>  
>  		atu.index = i;
>  		atu.type = PCIE_ATU_TYPE_MEM;
> -		atu.cpu_addr = entry->res->start;
> +		parent_bus_addr = entry->res->start;
>  		atu.pci_addr = entry->res->start - entry->offset;
>  
> +		ret = dw_pcie_get_parent_addr(pci, entry->res->start, &parent_bus_addr);
> +		if (ret)
> +			return ret;
> +
> +		atu.cpu_addr = parent_bus_addr;
> +
>  		/* Adjust iATU size if MSG TLP region was allocated before */
>  		if (pp->msg_res && pp->msg_res->parent == entry->res)
>  			atu.size = resource_size(entry->res) -
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 6d6cbc8b5b2c6..e1ac9c81ad531 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -840,6 +840,15 @@ void dw_pcie_iatu_detect(struct dw_pcie *pci)
>  	pci->region_align = 1 << fls(min);
>  	pci->region_limit = (max << 32) | (SZ_4G - 1);
>  
> +	if (pci->ops && pci->ops->cpu_addr_fixup) {
> +		/*
> +		 * If the parent 'ranges' property in DT correctly describes
> +		 * the address translation, cpu_addr_fixup() callback is not
> +		 * needed.
> +		 */
> +		dev_warn_once(pci->dev, "cpu_addr_fixup() usage detected. Please fix DT!\n");
> +	}
> +
>  	dev_info(pci->dev, "iATU: unroll %s, %u ob, %u ib, align %uK, limit %lluG\n",
>  		 dw_pcie_cap_is(pci, IATU_UNROLL) ? "T" : "F",
>  		 pci->num_ob_windows, pci->num_ib_windows,
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 347ab74ac35aa..4f31d4259a0de 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -463,6 +463,13 @@ struct dw_pcie {
>  	struct reset_control_bulk_data	core_rsts[DW_PCIE_NUM_CORE_RSTS];
>  	struct gpio_desc		*pe_rst;
>  	bool			suspended;
> +	/*
> +	 * This flag indicates that the vendor driver uses devicetree 'ranges'
> +	 * property to allow iATU to use the Intermediate Address (IA) for
> +	 * outbound mapping. Using this flag also avoids the usage of
> +	 * 'cpu_addr_fixup' callback implementation in the driver.
> +	 */
> +	bool			use_parent_dt_ranges;
>  };
>  
>  #define to_dw_pcie_from_pp(port) container_of((port), struct dw_pcie, pp)
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

