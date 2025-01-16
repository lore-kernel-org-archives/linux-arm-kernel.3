Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE5AC02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 00:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=FUBHHTVnBobY8RvnCIsOGJmj4gjCFyqyduIm+i7JxKw=; b=0+v/6W7yzqLrbBtflkTrMvuTDE
	WGzL1oidfem8cL+U4UtjO6FnTstTrbsofZLfJAYpFG/5WcFnvSqsc2OzdL6vDv4v4VS518Gjl0R/2
	izbuxOS5jKmQ7TH1QIp8eHxepaUw/6w431EcUhqNA3+l/ehYGWPOEl2JDLSjZmLhFeVDh3yd9fVZj
	UeqL4p/pMfanSFaLBTGp9chM+DYRZs0fLtFR53arP47WDl8Vunj9SaFV+ZaQjr/im1+AekFer95Ai
	QBvYoGi1RIIprLFwy3spYTGoJ6pjv1QZD6/Meu+63XNgTmBqHbU/BiuxQtR7173+TDDMR/3fZyNJS
	h4JndtpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYa3U-0000000GgQh-2VxS;
	Fri, 17 Jan 2025 00:17:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZ3p-0000000GLdo-49ZX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:14:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C47B4A42917;
	Thu, 16 Jan 2025 23:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36126C4CED6;
	Thu, 16 Jan 2025 23:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737069240;
	bh=M8EIC7pg0Wzyi0pL5SQg5Thdf/ff+JRgC1JyfSUFHds=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=nlBbMT1Ijt2VrpfQTtch051uILthsjl//w99RARSxLK3YBLv5BvNBb2BYRXTH1TBI
	 ttnTjtts6lruViF6D4uMZRH3ba6GNopequdvdcWqn+zygPVTCOOmAlSG248KrGiQrF
	 w4EJcEVl1RePa9HP6TLcgwey3zjOIo6b+o4dzycz7dNTk8QDAqxmqxqR5So3XldrS6
	 pyIwzVNl5QN2HN9sviZmUfobLrsUD0PMB/SkNu6VcpJRP+BxRowy/sfuxGJxw6w6pK
	 Q9UmlxFxuR+JqS2Sjn+Qab6IWO+WGGCFI01bfthuPDz4G/6gqjb4N9uMNrAf5Qplae
	 foqxXHSkyCzKQ==
Date: Thu, 16 Jan 2025 17:13:58 -0600
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
Subject: Re: [PATCH v8 2/7] PCI: dwc: Use devicetree 'ranges' property to get
 rid of cpu_addr_fixup() callback
Message-ID: <20250116231358.GA616783@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119-pci_fixup_addr-v8-2-c4bfa5193288@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_151402_159366_38A889A2 
X-CRM114-Status: GOOD (  15.96  )
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

Here you set atu.cpu_addr to the intermediate bus address instead
of the CPU physical address before calling
dw_pcie_prog_outbound_atu().

But what about other callers of dw_pcie_prog_outbound_atu()?  Don't
all of them need to use the intermediate bus address?

Maybe struct dw_pcie_ob_atu_cfg.cpu_addr should be renamed since it is
not necessarily a CPU physical address?

> +	if (pci->ops && pci->ops->cpu_addr_fixup) {
> +		/*
> +		 * If the parent 'ranges' property in DT correctly describes
> +		 * the address translation, cpu_addr_fixup() callback is not
> +		 * needed.
> +		 */
> +		dev_warn_once(pci->dev, "cpu_addr_fixup() usage detected. Please fix DT!\n");
> +	}

I kinda wish this warning were in a separate patch because it will be
a little cleaner if we ever want to revert or remove the warning.

