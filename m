Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6723CEE34D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 19:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4AcW3VVWujuIJdD6ZXh6+UIRR/a5dZ8DeL/rswLKX7Q=; b=Qqa9DlwayfTrzHCckK1MFhUSOg
	UnJC+XDYnvKmvQymN+CWoZQOa2ylUKqT6wgEUsL+889Mh2sf5ZG6ZcreDahw8rCVTL6APVrazj9zt
	KTp4At8lp1+ZTHPBAOL8RN2dgNPsP0vJplJJSGEMPZbHlGyKZaMYCsrFTnk4qJ6ECcuHQ+YfvMURP
	gx+9MQ9N9zwCyg7CVmd5DGNKg3v2OJpV7/dzdEYcI7ouoZcEcZz0jHplpm/5zzCcDqsebR5nQbf+f
	xeOzxnJcslvJ3imRri2rMfQEOwmjepUrJIRMbNv3F+ZX2d5k0FcVdYcvb1VKb5KHWDEFFltln95nu
	SnboO6ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLRgP-000000012AX-1l2w;
	Tue, 18 Nov 2025 19:48:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLRgM-000000012A3-4BIV;
	Tue, 18 Nov 2025 19:48:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99C80443BD;
	Tue, 18 Nov 2025 19:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2664C19423;
	Tue, 18 Nov 2025 19:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763495286;
	bh=LTuF70HwzOWawLdegHtHahnCjvkdLsBPOGc8x/siiEs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=AYYTFY4fRD9asNUz2r0O/g27bM4cmK/R9iU3u8cK3Bol6afFg6BVOZsZF7TjZ6fgF
	 i7kQAVclLkSCfZMkyNdawpx7s8cvzpsEZbLY4dcaqw2kjmc/0+GPQbXbTTrwVbR5tw
	 ggaCT4uZK5oUCbUg+7LTKRsvnwMs9hD4T4YW62BK9SwR7+TtV167YGOPRhCh0fVAe0
	 gdTf4qmtt5gTAKz1nNyIqK6FuoNKOc6thXWjeuwSVB5Gw+dxBm9jL1axPDuM0UsclM
	 g2h9DjUeFf/4Nszr5lDsO/osPDs2MnSPDIviRPG5U/3ro/RZEpC/ZIr/effvdC8PuL
	 AiTohfVDoa5ZQ==
Date: Tue, 18 Nov 2025 13:48:03 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Richard Zhu <hongxing.zhu@nxp.com>, Frank Li <Frank.li@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hans Zhang <hans.zhang@cixtech.com>, linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@pengutronix.de,
	Bjorn Helgaas <bhelgaas@google.com>,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH 1/4] PCI: dwc: Advertise L1 PM Substates only if driver
 requests it
Message-ID: <20251118194803.GA2586265@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79a8c3cc-2b60-4bce-b1ba-7ab5f033f924@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_114807_078374_F669241F 
X-CRM114-Status: GOOD (  30.41  )
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

On Wed, Nov 12, 2025 at 09:03:38AM +0800, Shawn Lin wrote:
> 在 2025/11/12 星期三 6:16, Bjorn Helgaas 写道:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > L1 PM Substates require the CLKREF# signal and may also require
> > device-specific support.  If CLKREF# is not supported or driver support is
> > lacking, enabling L1.1 or L1.2 may cause errors when accessing devices,
> > e.g.,
> > 
> >    nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0x10
> > 
> > If the kernel is built with CONFIG_PCIEASPM_POWER_SUPERSAVE=y or users
> > enable L1.x via sysfs, users may trip over these errors even if L1
> > Substates haven't been enabled by firmware or the driver.
> > 
> > To prevent such errors, disable advertising the L1 PM Substates unless the
> > driver sets "dw_pcie.l1ss_support" to indicate that it knows CLKREF# is
> > present and any device-specific configuration has been done.
> > 
> > Set "dw_pcie.l1ss_support" in tegra194 (if DT includes the
> > "supports-clkreq' property) and qcom (for 2.7.0 controllers) so they can
> > continue to use L1 Substates.
> > 
> > Based on Niklas's patch:
> > https://patch.msgid.link/20251017163252.598812-2-cassel@kernel.org
> 
> 
> Except the issue Fank pointed out, the commit msg says CLKREF# 3 times
> which seems not a term from spec. Should it be CLKREQ# ?

Yes!  Thank you, fixed locally.

> Otherwise,
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
> 
> > 
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > ---
> >   .../pci/controller/dwc/pcie-designware-ep.c   |  2 ++
> >   .../pci/controller/dwc/pcie-designware-host.c |  2 ++
> >   drivers/pci/controller/dwc/pcie-designware.c  | 24 +++++++++++++++++++
> >   drivers/pci/controller/dwc/pcie-designware.h  |  2 ++
> >   drivers/pci/controller/dwc/pcie-qcom.c        |  2 ++
> >   drivers/pci/controller/dwc/pcie-tegra194.c    |  3 +++
> >   6 files changed, 35 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > index 7f2112c2fb21..c94cff6eeb01 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > @@ -966,6 +966,8 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
> >   	if (ep->ops->init)
> >   		ep->ops->init(ep);
> > +	dw_pcie_config_l1ss(pci);
> > +
> >   	ptm_cap_base = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
> >   	/*
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > index 20c9333bcb1c..f1d5b45a3214 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > @@ -1060,6 +1060,8 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
> >   		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
> >   	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
> > +	dw_pcie_config_l1ss(pci);
> > +
> >   	dw_pcie_config_presets(pp);
> >   	/*
> >   	 * If the platform provides its own child bus config accesses, it means
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > index c644216995f6..ede686623fad 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > @@ -1081,6 +1081,30 @@ void dw_pcie_edma_remove(struct dw_pcie *pci)
> >   	dw_edma_remove(&pci->edma);
> >   }
> > +void dw_pcie_config_l1ss(struct dw_pcie *pci)
> > +{
> > +	u16 l1ss;
> > +	u32 l1ss_cap;
> > +
> > +	if (!pci->l1ss_support)
> > +		return;
> > +
> > +	l1ss = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
> > +	if (!l1ss)
> > +		return;
> > +
> > +	/*
> > +	 * Unless the driver claims "l1ss_support", don't advertise L1 PM
> > +	 * Substates because they require CLKREF# and possibly other
> > +	 * device-specific configuration.
> > +	 */
> > +	l1ss_cap = dw_pcie_readl_dbi(pci, l1ss + PCI_L1SS_CAP);
> > +	l1ss_cap &= ~(PCI_L1SS_CAP_PCIPM_L1_1 | PCI_L1SS_CAP_ASPM_L1_1 |
> > +		      PCI_L1SS_CAP_PCIPM_L1_2 | PCI_L1SS_CAP_ASPM_L1_2 |
> > +		      PCI_L1SS_CAP_L1_PM_SS);
> > +	dw_pcie_writel_dbi(pci, l1ss + PCI_L1SS_CAP, l1ss_cap);
> > +}
> > +
> >   void dw_pcie_setup(struct dw_pcie *pci)
> >   {
> >   	u32 val;
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > index e995f692a1ec..8d14b1fe2280 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > @@ -516,6 +516,7 @@ struct dw_pcie {
> >   	int			max_link_speed;
> >   	u8			n_fts[2];
> >   	struct dw_edma_chip	edma;
> > +	bool			l1ss_support;	/* L1 PM Substates support */
> >   	struct clk_bulk_data	app_clks[DW_PCIE_NUM_APP_CLKS];
> >   	struct clk_bulk_data	core_clks[DW_PCIE_NUM_CORE_CLKS];
> >   	struct reset_control_bulk_data	app_rsts[DW_PCIE_NUM_APP_RSTS];
> > @@ -573,6 +574,7 @@ int dw_pcie_prog_ep_inbound_atu(struct dw_pcie *pci, u8 func_no, int index,
> >   				int type, u64 parent_bus_addr,
> >   				u8 bar, size_t size);
> >   void dw_pcie_disable_atu(struct dw_pcie *pci, u32 dir, int index);
> > +void dw_pcie_config_l1ss(struct dw_pcie *pci);
> >   void dw_pcie_setup(struct dw_pcie *pci);
> >   void dw_pcie_iatu_detect(struct dw_pcie *pci);
> >   int dw_pcie_edma_detect(struct dw_pcie *pci);
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 805edbbfe7eb..61c2f4e2f74d 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -1067,6 +1067,8 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
> >   	val &= ~REQ_NOT_ENTR_L1;
> >   	writel(val, pcie->parf + PARF_PM_CTRL);
> > +	pci->l1ss_support = true;
> > +
> >   	val = readl(pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
> >   	val |= EN;
> >   	writel(val, pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
> > diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> > index 10e74458e667..3934757baa30 100644
> > --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> > +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> > @@ -703,6 +703,9 @@ static void init_host_aspm(struct tegra_pcie_dw *pcie)
> >   	val |= (pcie->aspm_pwr_on_t << 19);
> >   	dw_pcie_writel_dbi(pci, pcie->cfg_link_cap_l1sub, val);
> > +	if (pcie->supports_clkreq)
> > +		pci->l1ss_support = true;
> > +
> >   	/* Program L0s and L1 entrance latencies */
> >   	val = dw_pcie_readl_dbi(pci, PCIE_PORT_AFR);
> >   	val &= ~PORT_AFR_L0S_ENTRANCE_LAT_MASK;
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

