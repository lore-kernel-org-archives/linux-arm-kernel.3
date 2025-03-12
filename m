Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2658C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 22:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=TdxSL7XnkDN9kmFWxyEiA7ftN/30UcSR08tCE0yQKVA=; b=qeACTxGn+BvY5N
	JbvQvrTdMzPTiklDG2NF/asa+Tn8zOzArJLaHH0+RowzRS522xkSU8wFOFD2Sa3RaIX/dhzw8hAPb
	bhMxSaCNeO5GoCLw8XI7/1omJX1m0f0vNkQ0JLJr802IqpbnZV6PxQj5faAFESKG2MRDMtpDrkWoT
	TH56LzI39rZuzRcREul49JLjq19PCqVNcUGvCuSa0E1ccpKXegMlyYAEmi1ViKg4TA7y4fSNEbyoR
	z4P8ie7oisLQdxq61G12uRn/eFcBh5bVoOIqrN6gA3LMAZdpO4ChhFB5xepaMvzeVABLylinKWxow
	8SimxEkF8ysRVGr4idxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsUOw-00000009cMa-3x67;
	Wed, 12 Mar 2025 22:18:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsUNI-00000009c6s-1f46
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 22:16:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D98B25C06B3;
	Wed, 12 Mar 2025 22:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E89C4CEDD;
	Wed, 12 Mar 2025 22:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741817787;
	bh=vkr3KopYdWUircBEEhav2hH+I7B84ECNwkPnSpSsVCg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=acqC/clqSUvbGHLoM6HoKK3d+FnFC5UsLEm/ESofPeZh4zRHSzxQ8xZEwpyEwa+UE
	 jCDXndb9lcYvm38L+aHEmjl7AH1nJ7wY5UHJGZI1WmNBaseG2KnH+QJ6I53vDtwBVA
	 XuSguY4U+5wmTqZIYYBHQ3ptELul5IR/8DtVlVbcpuVe/V2UxSrxA12AnXPt+ogIim
	 n/wD0cM0OnqpyqotCR6b1AopO0XXa6cKiYgpYweKJQ5U8RZnKeuCWN8jun0j3RD1LW
	 mKlNEHtDpGI+8pmm8XHLK76mBYiPX9h8vFyWBk/fA3c5yotJxMPU2gOLetbVN5Z13F
	 em3cPp2n4qqHA==
Date: Wed, 12 Mar 2025 17:16:25 -0500
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
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v10 04/10] PCI: dwc: Add helper
 dw_pcie_init_parent_bus_offset()
Message-ID: <20250312221625.GA711258@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310-pci_fixup_addr-v10-4-409dafc950d1@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_151628_547262_7BFD3975 
X-CRM114-Status: GOOD (  26.00  )
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

On Mon, Mar 10, 2025 at 04:16:42PM -0400, Frank Li wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Set pci->parent_bus_offset based on the parent bus address from the
> "config" (Root complex mode) and "addr_space" (Endpoint mode).
> 
> .cpu_addr_fixup(cpu_phy_addr). (if implemented) should return the parent
> bus address corresponding according to cpu_phy_addr.
> 
> Sets pp->parent_bus_offset, but doesn't use it, so no functional change
> intended yet.
> 
> Add use_parent_dt_ranges to detect some fake bus translation at platform,
> which have not .cpu_addr_fixup(). Set use_parent_dt_ranges true explicitly
> at platform that have .cpu_addr_fixup() and fixed DTB's range. If not one
> report "fake bus translation" for sometime, this flags can be removed
> safely.

> +int dw_pcie_init_parent_bus_offset(struct dw_pcie *pci, const char *reg_name,
> +				   resource_size_t cpu_phy_addr)
> +{
> +	struct device *dev = pci->dev;
> +	struct device_node *np = dev->of_node;
> +	u64 (*fixup)(struct dw_pcie *pcie, u64 cpu_addr);
> +	u64 reg_addr, fixup_addr;
> +	int index;
> +
> +	/* Look up reg_name address on parent bus */
> +	index = of_property_match_string(np, "reg-names", reg_name);
> +
> +	if (index < 0) {
> +		dev_err(dev, "Missed reg-name: %s, Broken DTB file\n", reg_name);
> +		return -EINVAL;
> +	}
> +
> +	of_property_read_reg(np, index, &reg_addr, NULL);
> +
> +	fixup = pci->ops->cpu_addr_fixup;
> +	if (fixup) {
> +		fixup_addr = fixup(pci, cpu_phy_addr);
> +		if (reg_addr == fixup_addr) {
> +			dev_info(dev, "%#010llx %s reg[%d] == %#010llx; %ps is redundant\n",
> +				 cpu_phy_addr, reg_name, index,
> +				 fixup_addr, fixup);
> +		} else {
> +			dev_warn_once(dev, "%#010llx %s reg[%d] != %#010llx fixed up addr; DT is broken\n",
> +				      cpu_phy_addr, reg_name,
> +				      index, fixup_addr);
> +			reg_addr = fixup_addr;
> +		}
> +	} else if (!pci->use_parent_dt_ranges) {
> +		if (reg_addr != cpu_phy_addr) {
> +			dev_warn_once(dev, "Your DTB try to use fake translation, Please check parent's ranges property,");
> +			return 0;

IIUC the point of this is to catch a DT that describes a non-zero
offset when the driver did not implement .cpu_addr_fixup() and
therefore assumed "reg_addr == cpu_phy_addr".

I guess that makes sense.  But I think we should include both
addresses in the message to help understand the issue.

> +		}
> +	}
> +
> +	pci->parent_bus_offset = cpu_phy_addr - reg_addr;
> +	dev_info(dev, "%s parent bus offset is %#010llx\n",
> +		 reg_name, pci->parent_bus_offset);
> +
> +	return 0;
> +}

> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -465,6 +466,16 @@ struct dw_pcie {
>  	struct reset_control_bulk_data	core_rsts[DW_PCIE_NUM_CORE_RSTS];
>  	struct gpio_desc		*pe_rst;
>  	bool			suspended;
> +	/*
> +	 * This flag indicates that the vendor driver uses devicetree 'ranges'
> +	 * property to allow iATU to use the Intermediate Address (IA) for
> +	 * outbound mapping. Using this flag also avoids the usage of
> +	 * 'cpu_addr_fixup' callback implementation in the driver.

This part of the comment is now wrong.

> +	 * If use_parent_dt_ranges is false, warning will print if IA is not
> +	 * equal to cpu physical address. Indicate dtb use a fake translation.
> +	 */
> +	bool			use_parent_dt_ranges;
>  };

