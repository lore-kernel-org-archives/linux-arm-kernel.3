Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE39C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=SiEhUVQJ/TDO2qegrbz7y3eNVFA+s4RZ4K93w4IWgTQ=; b=M9b2UbuFCdaiVSxSXX59soM6Zk
	+z6BCc3HYPclm2Cg+Sp6J50bQecyv+qHD9q5E3MHp01/6oaZbV8G2uNIuX5Ls+bnTlcTZ6kZgJ1JH
	IvT64Q9dfTYK97PJeYGZYpoJoB91EkSD0TCLFEBFp3uhqAdvP+69MR0IuObkWebsn6itoZqcP6qly
	3CdfmAoka9F8mC03T8VRbXYrhfIok55Lf6jgwr2ymtNz69q5AaGWtx/YOjBOCJLJguQ+Lpg4aoAon
	aExjXWxT+F36gre8jG/5VZE5LGgh7FUt0lyTIerLQMPcB5p8SYIc4MdJbMwb/pPrallPcn0LLjl7h
	h8qEnhtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZSZ-0000000GYUl-2eiZ;
	Thu, 16 Jan 2025 23:39:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZIc-0000000GSUs-3KiQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:29:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E4BCCA42953;
	Thu, 16 Jan 2025 23:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D40C4CED6;
	Thu, 16 Jan 2025 23:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737070157;
	bh=dMwwqya1n7mouM0thH4tLEBVCAjWJzbR4JIYV6x+c8k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cp95TFTojT43ishZ8WQ4Mwsx3PoDWTZzdjzqZ2MTjofA4fLE8O8H2NZi0DrJToqfR
	 EN9p7UiHkjHhzTnEX/Nnfw+Cdxgdj/equtDNoIPcUVHou6MH8M6OCgjFKCjv+HGZwp
	 IC37Tez0mu7Tp2y+CJAlmCj4QkXPrCmdP4CEtIKKc0En35zUsz+1iuISun5r2YKuNS
	 xmEpPjEcmg9u+Y25j6aMDWqbPqIC5nVLoe7a2/zMsu6AmzR2eZeTWLJ18iDQAeUt8s
	 Qop6AaZZcCjRAJADxFbga5cNKEgIFrVBd0C5IEt1BxzWQFNGeeW+QfYjM6iTVNvmM0
	 QoTEoKHRcE27A==
Date: Thu, 16 Jan 2025 17:29:16 -0600
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
Message-ID: <20250116232916.GA617353@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116231358.GA616783@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_152918_963042_D9AC97E1 
X-CRM114-Status: GOOD (  17.71  )
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

On Thu, Jan 16, 2025 at 05:14:00PM -0600, Bjorn Helgaas wrote:
> On Tue, Nov 19, 2024 at 02:44:20PM -0500, Frank Li wrote:
> > parent_bus_addr in struct of_range can indicate address information just
> > ahead of PCIe controller. Most system's bus fabric use 1:1 map between
> > input and output address. but some hardware like i.MX8QXP doesn't use 1:1
> > map. See below diagram:
> > 
> >             ┌─────────┐                    ┌────────────┐
> >  ┌─────┐    │         │ IA: 0x8ff8_0000    │            │
> >  │ CPU ├───►│   ┌────►├─────────────────┐  │ PCI        │
> >  └─────┘    │   │     │ IA: 0x8ff0_0000 │  │            │
> >   CPU Addr  │   │  ┌─►├─────────────┐   │  │ Controller │
> > 0x7ff8_0000─┼───┘  │  │             │   │  │            │
> >             │      │  │             │   │  │            │   PCI Addr
> > 0x7ff0_0000─┼──────┘  │             │   └──► IOSpace   ─┼────────────►
> >             │         │             │      │            │    0
> > 0x7000_0000─┼────────►├─────────┐   │      │            │
> >             └─────────┘         │   └──────► CfgSpace  ─┼────────────►
> >              BUS Fabric         │          │            │    0
> >                                 │          │            │
> >                                 └──────────► MemSpace  ─┼────────────►
> >                         IA: 0x8000_0000    │            │  0x8000_0000
> >                                            └────────────┘
> > 
> > bus@5f000000 {
> > 	compatible = "simple-bus";
> > 	#address-cells = <1>;
> > 	#size-cells = <1>;
> > 	ranges = <0x80000000 0x0 0x70000000 0x10000000>;
> > 
> > 	pcie@5f010000 {
> > 		compatible = "fsl,imx8q-pcie";
> > 		reg = <0x5f010000 0x10000>, <0x8ff00000 0x80000>;
> > 		reg-names = "dbi", "config";
> > 		#address-cells = <3>;
> > 		#size-cells = <2>;
> > 		device_type = "pci";
> > 		bus-range = <0x00 0xff>;
> > 		ranges = <0x81000000 0 0x00000000 0x8ff80000 0 0x00010000>,
> > 			 <0x82000000 0 0x80000000 0x80000000 0 0x0ff00000>;
> > 	...
> > 	};
> > };
> > 
> > Term internal address (IA) here means the address just before PCIe
> > controller. After ATU use this IA instead CPU address, cpu_addr_fixup() can
> > be removed.
> 
> > @@ -730,9 +779,15 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
> >  
> >  		atu.index = i;
> >  		atu.type = PCIE_ATU_TYPE_MEM;
> > -		atu.cpu_addr = entry->res->start;
> > +		parent_bus_addr = entry->res->start;
> >  		atu.pci_addr = entry->res->start - entry->offset;
> >  
> > +		ret = dw_pcie_get_parent_addr(pci, entry->res->start, &parent_bus_addr);
> > +		if (ret)
> > +			return ret;
> > +
> > +		atu.cpu_addr = parent_bus_addr;
> 
> Here you set atu.cpu_addr to the intermediate bus address instead
> of the CPU physical address before calling
> dw_pcie_prog_outbound_atu().
> 
> But what about other callers of dw_pcie_prog_outbound_atu()?  Don't
> all of them need to use the intermediate bus address?

Somehow I expected the patch to skip calling ->cpu_addr_fixup() if the
driver had set 'use_parent_dt_ranges'.  In fact, I think that's a
requirement.

Since dw_pcie_prog_outbound_atu() is the only dwc caller, maybe the
parent_bus_addr change should go *there* instead of in the callers?

Bjorn

