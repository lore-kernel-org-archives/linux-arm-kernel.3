Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298A4CFD35A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 21:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=8oIBrvHko/lX9bzUlxWKJ8mx6VtKopnpRkYxrgoALC4=; b=hSvMlN5JqB+5g2
	lh2cInieCA4w1ePOSbBAfvn9sBwvMn46fax8oAvRZ+Veau++wkla6Rn4TKMloKSdRKzcmOv8UZQLk
	n4YB38tg/VY9Lt9G/MGpqRG0/j2YHC4vz3QosQykqEom7ljza2nag505dPVOggcRXZZe5wLI36Esq
	BdoqwoG0FBTamUJHEUrT8g7rsv8/W0IdSehIvnvncH5z3IdEeRvzEurYtrQl0/1WS9Db6IVgZfQM7
	qXYb9YwbkXcCcuws49wlfNqeGJFybM4gw8V0pyE6lE3fT6c6uNU4pvTuIAnF7ftjxCAr793WL8z9m
	1vB/orX+l43gn6mvFiCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNdwG-0000000CKJg-49Aw;
	Mon, 24 Nov 2025 21:17:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNdwG-0000000CKJX-084w;
	Mon, 24 Nov 2025 21:17:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F00AA6016B;
	Mon, 24 Nov 2025 21:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C776C4CEF1;
	Mon, 24 Nov 2025 21:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764019054;
	bh=zNscfGKNv8hOqltmXFupMlNTAemel39zeYpn0jPX3vU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cVxo5EX/R2ICIvKcH/weXjupo/uWy6PvclGfFyub18qbj/qqn+BV+Zhk466UmgpJf
	 SeKSng0Rv1ctPCUzCh6kymHgMU2YrzY6Qojs1MQtPcobL7W/tqqWYVSzaKa68yB28W
	 EJhwdmokiSXpWG6Z/56omkP7MXeLYhhEA6Jm1vOKgdOWkzYzj4kvNok9IigFNPyqhS
	 YtUYlCPYj6kKsMVHprA+65OzaipVnn8PtcuNMzIXFaW6YE8EfdhkHISCY7nNjK3NCT
	 agsMK5BeKtOygvJCO9wlLu+NCSNplvmvG6U6gxyBIrNK4B/b1jwA7JagAxJWlJu0kN
	 /ifcj8YO2ZVQQ==
Date: Mon, 24 Nov 2025 15:17:33 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
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
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 1/4] PCI: dwc: Advertise L1 PM Substates only if driver
 requests it
Message-ID: <20251124211733.GA2712491@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118202210.GA2586610@bhelgaas>
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

On Tue, Nov 18, 2025 at 02:22:13PM -0600, Bjorn Helgaas wrote:
> On Wed, Nov 12, 2025 at 11:21:07PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Nov 12, 2025 at 09:22:36AM +0100, Niklas Cassel wrote:
> > > On Tue, Nov 11, 2025 at 04:16:08PM -0600, Bjorn Helgaas wrote:
> > > > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > > @@ -1060,6 +1060,8 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
> > > >  		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
> > > >  	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
> > > >  
> > > > +	dw_pcie_config_l1ss(pci);
> 
> > > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > @@ -1067,6 +1067,8 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
> > > >  	val &= ~REQ_NOT_ENTR_L1;
> > > >  	writel(val, pcie->parf + PARF_PM_CTRL);
> > > >  
> > > > +	pci->l1ss_support = true;
> > > > +
> > > >  	val = readl(pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
> > > >  	val |= EN;
> > > >  	writel(val, pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
> > > 
> > > While it seems like ops_2_7_0 is the only type that explicitly does a
> > > register write to enable L1ss, other versions might have the register
> > > as enabled by default, so it would be nice if Mani could confirm exactly
> > > which versions that should set l1ss_support = true.
> > > 
> > 
> > Yes, on the rest of the platforms, this bit is supposed to be enabled by
> > default. AFAIK, all Qcom platforms should support L1SS, atleast the
> > non-IPQ/APQ ones.
> > 
> > We should set it for below cfgs:
> > 
> > cfg_fw_managed
> > cfg_sc8280xp
> > cfg_1_34_0
> > cfg_1_9_0
> > cfg_2_7_0
> 
> Except for cfg_fw_managed, the above are all covered by
> qcom_pcie_init_2_7_0(), either via ops_2_7_0, ops_1_9_0, or
> ops_1_21_0.
> 
> cfg_fw_managed is harder because we don't use dw_pcie_host_init() or
> dw_pcie_setup_rc().
> 
> We do allocate a struct dw_pcie (where l1ss_support is) in
> qcom_pcie_ecam_host_init(), but only so we can call
> dw_pcie_msi_host_init() and dw_pcie_msi_init().

I'm just back from vacation so might be forgetting something, but I
think cfg_fw_managed is OK here because in that case we never call
dw_pcie_host_init(), so we never call dw_pcie_setup_rc() where
dw_pcie_hide_unsupported_l1ss().

So the L1SS cap should remain untouched and presumably advertises the
L1SS support we want for cfg_fw_managed.

Bjorn

