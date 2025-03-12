Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08D4C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 21:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=V9qQqg6pqdw/rOOBYRWv6Gy7D2nIfQojfv4cbt1kF2E=; b=FMKllyGeaKiWhK
	4mXmYrgwzyIE9Yy7omPe4Cr+EEEYR+xHk7ER5oVWLtdrrZxSKZ4MYoZHxrE4ig6pqH07Qm4AmO96R
	9ALyX4xzaXsln4RLLKl/QMbcp1XzNYNPzbtzRjKwNS5AVyPrIC0K64BUknpKTVBZhrGGCRFGo/h5d
	ay/0u+sL+7Wzld7OmksKyjcoccs5zh5V/MvGzMBOhBPISsj4g1wedkUhGjSA4i8zqPtM723pAyyVJ
	AmTsG2R0JF+419dYuaP9mf5TrGvpQ7vZrfWAvz355Dfhls65YAgi+kRtVnOCLPRsFIE0j0Nlvq2xa
	aOtx+ZqUsGfSnLqcawPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTnj-00000009Ylq-1c9J;
	Wed, 12 Mar 2025 21:39:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTm4-00000009Ye6-1dQq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 21:38:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B6A13A410D3;
	Wed, 12 Mar 2025 21:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CDB7C4CEDD;
	Wed, 12 Mar 2025 21:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741815479;
	bh=IpQ0kTcSTHlo9xweNH6Hk4r0BhULhn+PB1miZjUBO1A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=MDGGa/Jv/K0Tp8ERu+/t3wzW7sjaxvdm9hxpl+5UoReGjOfXsZEUMLmJ8i5MVeMlV
	 XeA2C97XH7anXUQGlEE6SVvRhIpLBl6pFfLAthj7lAZp2C/dYWR+GBTD8nDhKwCYgq
	 tqZrUMIgKxpAaqBqF7lZbO2x/MYwf3dUppQaR+iG91sfhT26Xvv+Dolr56QGJTzjWK
	 L14bZ23veCU1pLPH6jgX33hOxtSCx0yGUzkww9EokaA9s7HtG6sFGbrpf0+QH0d1ly
	 vjv1AmRcos0k3ivTC+xpEoQzszFTjEn4n8//t5lilrs56r1+8LwrvgJlXovRdze1/b
	 +qD7qbsLoY/zg==
Date: Wed, 12 Mar 2025 16:37:57 -0500
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
Subject: Re: [PATCH v10 05/10] PCI: dwc: Use devicetree 'ranges' property to
 get rid of cpu_addr_fixup() callback
Message-ID: <20250312213757.GA709739@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310-pci_fixup_addr-v10-5-409dafc950d1@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_143800_556109_43F29523 
X-CRM114-Status: GOOD (  12.46  )
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

On Mon, Mar 10, 2025 at 04:16:43PM -0400, Frank Li wrote:
> parent_bus_offset in resource_entry can indicate address information just
> ahead of PCIe controller. Most system's bus fabric use 1:1 map between
> input and output address. but some hardware like i.MX8QXP doesn't use 1:1
> map. See below diagram:

> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -478,6 +478,15 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	bridge->ops = &dw_pcie_ops;
>  	bridge->child_ops = &dw_child_pcie_ops;
>  
> +	/*
> +	 * visconti_pcie_cpu_addr_fixup() use pp->io_base,
> +	 * so have to call dw_pcie_init_parent_bus_offset() after init
> +	 * pp->io_base.
> +	 */
> +	ret = dw_pcie_init_parent_bus_offset(pci, "config", pp->cfg0_base);
> +	if (ret)
> +		return ret;

The ordering in dw_pcie_host_init() doesn't look right to me.  We have
this:

  dw_pcie_host_init
    dw_pcie_get_resources
    dw_pcie_cfg0_setup
    devm_pci_alloc_host_bridge
    win = resource_list_first_type(&bridge->windows, IORESOURCE_IO)
    pp->io_base = pci_pio_to_address(win->res->start)
    bridge->ops = ...
    bridge->child_ops = ...
    dw_pcie_init_parent_bus_offset
    pp->ops->init

devm_pci_alloc_host_bridge() is generic, so it obviously can't depend
on any dwc-specific things.  I think the ordering should be more like
this:

  dw_pcie_host_init
    devm_pci_alloc_host_bridge             # generic
    dw_pcie_get_resources                  # dwc RP and EP

    dw_pcie_cfg0_setup
    win = resource_list_first_type(&bridge->windows, IORESOURCE_IO)
    pp->io_base = pci_pio_to_address(win->res->start)
    dw_pcie_init_parent_bus_offset

    bridge->ops = ...
    bridge->child_ops = ...
    pp->ops->init

and everything in the second block (dw_pcie_cfg0_setup() through
dw_pcie_init_parent_bus_offset()) is strictly DT-related resource
setup and could all go in a dw_pcie_host_get_resources() or similar.

>  	if (pp->ops->init) {
>  		ret = pp->ops->init(pp);
>  		if (ret)
> 
> -- 
> 2.34.1
> 

