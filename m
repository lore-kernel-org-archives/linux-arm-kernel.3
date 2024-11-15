Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AD1D68BCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 18:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CnwJEhoyWWs0hfunP5nkD+KmYCyarErjrVddNp9cu4=; b=KnnbFkUAG9xg703SipfKePS4qi
	C4P/eY164lnQlQENhUIx8CjYj7bXJxbuteUtCBaffQIu6NmYzwONsPgMMdICX87LnLgjI1mZ0hamM
	fzJiXiMU7hQmhSeMwNpmtwDb68IaIShmhlG0MfEnZpfasDTqZeJVNFfHpLbxENmHHCGmzXC25HRyq
	kswWfx28C/DiCYDVKa/cHI17fZvLyQJ9I4Z1K87Vrvwhnltl/1b6dbUBCCIzg6jgyX8Vb0rq44d5n
	FCVrABXbpLWAuPHIKspkiKdjZ8fabfi1v3zf6WAQ/Xdo034r9g+b7PU0KY0LAOBMtSbzMoYbQpOaI
	zuCJDUqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC0zt-00000003gll-0gbE;
	Fri, 15 Nov 2024 18:24:45 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC0yx-00000003gcj-2ATJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 18:23:48 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21145812538so17619635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 10:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731695026; x=1732299826; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1CnwJEhoyWWs0hfunP5nkD+KmYCyarErjrVddNp9cu4=;
        b=Xmu8w7yY130l373mNSqDlWlt2W2bGjvdLN93HXJ1rWc7QSEA3CODHISCwWiMPEIFhx
         LaHxLKd7BY47R7NWKj3YMKk0WiVFhcodEZZMV3V7B//jkCZaKWr5h06YQYB6yoUwPGPl
         q5zSRI25JyQT7DNSwNuFoV+AMq5x5Z4g/wy2+iLO0sMIDJu5gG/Do/Hp9mETO5gpfPSV
         DjpJdbKnWk8zQmS83fCNkRJgxkiAMs0ONV4pge4hr5V2zBMQT7tLSxc6QQKd+yRXQK1s
         h7baqN4SX9OGBXBQ2nvC/J7SnvGCibDOLMlEdaF01m4yWOj81P541VWkm0oUP+yKxHoF
         CpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731695026; x=1732299826;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1CnwJEhoyWWs0hfunP5nkD+KmYCyarErjrVddNp9cu4=;
        b=ZFXoADlAf6KJP4IA6Zl1XfTu3+WdMSc4jYvNN74UC5CMvTNPlYb+5JDeWzUEw+ZWfx
         q2Yhxk+YH/cON+3TrEGEDNUzUOtTIdLJAxRkNBM6KNvGE6TNKaxrqmyJS//neyTUxK+f
         oALpBjd/Ea4TTX5/TDP4eJVJPF+jtNFqoeyu4vWSiNGGVeM5HX68fJXtprEpOicl70Ue
         ZXe8Ii7YOZWy8oLw1OGgGO7zWq6X9i+scZCz+nZFPo82fJh11/ZIlKtKbk4Z1TCGZbmA
         DWEX4vdFPNWhBqiu7vKcsQqpPdKZmIK7OTQncAUUGKCGw5egzCwFmahxHKwtuJCEmIm4
         Pn5w==
X-Forwarded-Encrypted: i=1; AJvYcCU1c/kvg5u0C5eKddSubB9maSrM6ZZI03WkC/nEAOYLYqNVHEBYKsFpt9t+LMQ23Q2Y7KVE7ijul/pgVYE+pdmQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxva6MvpOuOxIYlttMxVozKqPcbAI9fJuss4lC2WzIgdtlYhLn+
	ctETgYBfp9fivv25NmNELF9x3ErmZse6NpqHUP4+zKBUxeGB6zSShQCV6RJytA==
X-Google-Smtp-Source: AGHT+IEwWbdg7azduaJi6v/1T3xzOGMgr6uhezauDZeHmiw5GXWdDs8QfnFyhbpVqwXNdilvnfJezQ==
X-Received: by 2002:a17:903:1d0:b0:20e:5792:32ed with SMTP id d9443c01a7336-211d0ebc0c5mr44114045ad.41.1731695026118;
        Fri, 15 Nov 2024 10:23:46 -0800 (PST)
Received: from thinkpad ([117.193.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f51fe0sm15266645ad.233.2024.11.15.10.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 10:23:45 -0800 (PST)
Date: Fri, 15 Nov 2024 23:53:36 +0530
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
Subject: Re: [PATCH v7 3/7] PCI: dwc: ep: Add bus_addr_base for outbound
 window
Message-ID: <20241115182336.7jy63pt7n66h6pa2@thinkpad>
References: <20241029-pci_fixup_addr-v7-0-8310dc24fb7c@nxp.com>
 <20241029-pci_fixup_addr-v7-3-8310dc24fb7c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029-pci_fixup_addr-v7-3-8310dc24fb7c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_102347_587463_5F8F54B7 
X-CRM114-Status: GOOD (  33.00  )
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

On Tue, Oct 29, 2024 at 12:36:36PM -0400, Frank Li wrote:
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
> Add 'bus_addr_base' to configure the outbound window address for CPU write.

This doesn't make a lot of sense to readers. Use something like,

"Use 'ranges' property in DT to configure the iATU outbound window address."

> The bus fabric generally passes the same address to the PCIe EP controller,
> but some bus fabrics convert the address before sending it to the PCIe EP
> controller.
> 
> Above diagram, CPU write data to outbound windows address 0x7000_0000,
> Bus fabric convert it to 0x8000_0000. ATU should use bus address
> 0x8000_0000 as input address and convert to PCI address 0xA000_0000.

s/convert/map

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
> 'ranges' in bus@5f000000 descript how address convert from CPU address
> to bus address.
> 
> Use `of_property_read_reg()` to obtain the bus address and set it to the
> ATU correctly, eliminating the need for vendor-specific cpu_addr_fixup().
> 
> Add 'using_dtbus_info' to indicate device tree reflect correctly bus
> address translation in case break compatibility.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

One comment below. With that addressed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
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
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 21 ++++++++++++++++++++-
>  drivers/pci/controller/dwc/pcie-designware.h    |  1 +
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 43ba5c6738df1..a5b40c32aadf5 100644
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
> @@ -873,6 +875,23 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  		return -EINVAL;
>  
>  	ep->phys_base = res->start;
> +	ep->bus_addr_base = ep->phys_base;
> +
> +	if (pci->using_dtbus_info) {
> +		index = of_property_match_string(np, "reg-names", "addr_space");
> +		if (index < 0)
> +			return -EINVAL;
> +
> +		/*
> +		 * Retrieve the local bus address information, which is sent to
> +		 * the PCIe Endpoint (EP) controller. If the parent bus
> +		 * 'ranges' in the device tree provide the correct address
> +		 * conversion information, set 'using_dtbus_info' to true. This
> +		 * allows 'cpu_addr_fixup()' to be eliminated.
> +		 */

		/*
		 * Get the untranslated bus address from devicetree to use it as
		 * the iATU CPU address in dw_pcie_ep_map_addr().
		 */

- Mani

> +		of_property_read_reg(np, index, &ep->bus_addr_base, NULL);
> +	}
> +
>  	ep->addr_size = resource_size(res);
>  
>  	if (ep->ops->pre_init)
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index f8067393ad35a..f10b533b04f77 100644
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

-- 
மணிவண்ணன் சதாசிவம்

