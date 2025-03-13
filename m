Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE7CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 22:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Lgx1vNHYoa6EZDyUM21rFwGBZVje1iLAh35K84txcto=; b=rkwesDa75X4qfke0ChCPJi9Dhr
	v1doOz3kFBW+XhJ4pHO5Ead2fIa7Muihd833JAOMGn3P3jfRRs6OWePQU72WU38SMx/v4ZZvjX4D6
	EWzlT9V3DmiBtNtT/v4cQZnNoPYYdocvGp2LExGz6yR2Ma2za51CMuKxl1tORBteM1x2DKuCc2GaE
	x1182fnh9SD300kou8ijByaBLxobK0T/LqsPD90oKMkJ22JuofOXqp0RSrvtV2BRM+aqtw7P4QfFA
	CTdkepH3RffCFx0OgL3uN9a6SyS4DyY98hyxyrCW04V9r5zLIBjivlVzYhlpwyAmnNpoXLaX2s9hH
	kFIN7row==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqhK-0000000CaOn-0bTZ;
	Thu, 13 Mar 2025 22:06:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqfd-0000000Ca6N-04Fi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 22:04:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 54B9FA45E02;
	Thu, 13 Mar 2025 21:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A65BC4CEDD;
	Thu, 13 Mar 2025 22:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741903491;
	bh=n/fMIbk7/ofFY+LwCDcEeg0lmVjyMvGkhfy6qwppqPI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=NzLWuZS7oIEAF19Ms/byzIr0r2Ey7Lqizbb3ASZ+H1G9aXXx/e75fXptCLMSETOVw
	 vtUmM4AX43OxHsDLoq+qQVhRpCtEYqZ0RgTqD7UJSMjj24dXdFWDcHHBhD7LmQzeLr
	 Rw49mqMJwmmIc8ZtfEsoOaaYq42olzBPJwz1QtZkq41oy/BT8iSQSd+ZY7DCIVXf3o
	 Lc3sb8HLCcKPYECFF3uBgiGmZuDrqMEhwypWWXSe2UtoKNw/jk355vXyN2Z4VxYcLA
	 1PHzCr17ZO2bebssWu/3IwjJoDqv4hmbK+o/KTzvXoXYxu96YLKYPs8wPCrulmHj5G
	 AkyFkXg62gydw==
Date: Thu, 13 Mar 2025 17:04:50 -0500
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
Subject: Re: [PATCH v11 06/11] PCI: dwc: Use devicetree 'ranges' property to
 get rid of cpu_addr_fixup() callback
Message-ID: <20250313220450.GA755590@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-pci_fixup_addr-v11-6-01d2313502ab@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_150453_185602_39CCF680 
X-CRM114-Status: GOOD (  22.69  )
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

On Thu, Mar 13, 2025 at 11:38:42AM -0400, Frank Li wrote:
> The 'ranges' property at PCI controller parent bus can indicate address
> translation information. Most system's bus fabric use 1:1 map between input
> and output address. but some hardware like i.MX8QXP doesn't use 1:1 map.

I think you've used reg["addr_space"] to get the offset for Endpoints
forever.

I just noticed that through v9, you used 'ranges' to get the offset
for the Root Complex (with "Add parent_bus_offset to resource_entry"),
and I think v10 switched to use reg["config"] instead.

I think I originally proposed the idea of "Add parent_bus_offset to
resource_entry" patch, but I think it turned out to be kind of an ugly
approach.

Anyway, IIUC this v11 patch actually uses reg["config"] to compute the
offset, not 'ranges', so we should probably update the subject and
commit log to reflect that, and maybe remove the now-unused bits of
the devicetree example.

I do worry a little bit about the assumption that the offset of
reg["config"] is the same as the offset of the other pieces.  The main
place we use the offset on RCs is for the ATU, and isn't the ATU in
the MemSpace area at 0x8000_0000 below?

It's great that in this case the 0x7ff0_0000 to 0x8ff0_0000 "config"
offset is the same as the 0x7000_0000 to 0x8000_0000 MemSpace offset,
but I don't know that this is guaranteed for all designs.

v9:
  [PATCH v9 3/7] PCI: Add parent_bus_offset to resource_entry
    https://lore.kernel.org/r/20250128-pci_fixup_addr-v9-3-3c4bb506f665@nxp.com
  [PATCH v9 5/7] PCI: dwc: ep: Add parent_bus_addr for outbound window
    https://lore.kernel.org/r/20250128-pci_fixup_addr-v9-5-3c4bb506f665@nxp.com

v10:
  [PATCH v10 05/10] PCI: dwc: Use devicetree 'ranges' property to get rid of cpu_addr_fixup() callback
    https://lore.kernel.org/r/20250310-pci_fixup_addr-v10-5-409dafc950d1@nxp.com
  [PATCH v10 06/10] PCI: dwc: ep: Add parent_bus_addr for outbound window
    https://lore.kernel.org/r/20250310-pci_fixup_addr-v10-6-409dafc950d1@nxp.com

> See below diagram:
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
> Term Intermediate address (IA) here means the address just before PCIe
> controller. After ATU use this IA instead CPU address, cpu_addr_fixup() can
> be removed.
> 
> Use reg-name "config" to detect parent_bus_addr_offset. Suppose the offset
> is the same for all kinds of address translation.
> 
> Just set parent_bus_offset, but doesn't use it, so no functional change
> intended yet.

> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -474,6 +474,15 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  		pp->io_base = pci_pio_to_address(win->res->start);
>  	}
>  
> +	/*
> +	 * visconti_pcie_cpu_addr_fixup() use pp->io_base,
> +	 * so have to call dw_pcie_init_parent_bus_offset() after init
> +	 * pp->io_base.
> +	 */
> +	ret = dw_pcie_init_parent_bus_offset(pci, "config", pp->cfg0_base);
> +	if (ret)
> +		return ret;
> +
>  	/* Set default bus ops */
>  	bridge->ops = &dw_pcie_ops;
>  	bridge->child_ops = &dw_child_pcie_ops;
> 
> -- 
> 2.34.1
> 

