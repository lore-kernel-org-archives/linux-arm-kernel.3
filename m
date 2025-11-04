Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B718CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQhul4cMDDgKZF8+R+CUc4XMRuYdhJd5+7fypVv/XWs=; b=yK07V2bFX7iIbMWBtLTIuSmNEI
	0KIL+EGfq+rdgRplL+tgAC+YhlCzcAqq+JbRho/epDInNimJ8n/1KWb1nCKte2/oSbc8xIwF0fsyR
	+DkpBkB9wz1ffdqNMXF0HwPNpB1QpE1lKaSUi2T9HkxIn3XIzkh/iQ975cpUljzjVo3A7Mq0BSU+s
	wyzZb/p4ldzbUL0adaEPeyjKkFgn1YlHskiXAa1pc8u/bd9skq+QjvFU42uMcUngoFJYZX71OlE92
	babcHX8sxGpKlY3RaB383i93I6IzMB2o6hjnXdBtNtjMYotiA19i3ZzJgbmoAlEj4fi3YfSnWDhYn
	Q8qkdjVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGXV-0000000Boam-1KZd;
	Tue, 04 Nov 2025 12:53:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGXU-0000000BoaO-1e0r;
	Tue, 04 Nov 2025 12:53:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 25F90601EC;
	Tue,  4 Nov 2025 12:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2BCC4CEF7;
	Tue,  4 Nov 2025 12:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762260810;
	bh=kBePapwwI6HFP1Ie8oXMdV7JbHo8eVO/XYn+bJLYsGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VIA/GT6LcnpY1SQ6WzNn5tWDCswWcoo+0OjfE3aZ6aeRCCSQtgSQunc6Sz7/PrZlo
	 rC2BRHSAwdd4jSR3HqZEIDR2Nwcb4hSwBtnreLnuRyuzKLliNIyzE2KAnDrVnmSl1E
	 +nkJfJjlpHabGBCx6LuvjhQ0eaD7RhCus8bX9mIJ72a0ryeYCVU1FgdONOdUCAqZIY
	 MxR1zDUPtDaQVbmBQIe2J0VcJIEt2WizRNMWJCVAAZ1Viuvzth3CP3f/8bvCT+FTu+
	 qP3OUo2hxAf/8OTryFgQQNo+J0IiAo6H3z3UxMMJRBLZQbFgnI5RPYnDL8xWd/k6Fi
	 Cy/8GVaE/aAAQ==
Date: Tue, 4 Nov 2025 13:53:24 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
	Diederik de Haas <diederik@cknow-tech.com>, stable@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3] PCI: dw-rockchip: Prevent advertising L1 Substates
 support
Message-ID: <aQn3RGrJi1lb0EO1@ryzen>
References: <20251028190218.GA1525614@bhelgaas>
 <20251103213206.GA1818418@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103213206.GA1818418@bhelgaas>
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

Hello Bjorn,

On Mon, Nov 03, 2025 at 03:32:06PM -0600, Bjorn Helgaas wrote:
> On Tue, Oct 28, 2025 at 02:02:18PM -0500, Bjorn Helgaas wrote:
> > On Fri, Oct 17, 2025 at 06:32:53PM +0200, Niklas Cassel wrote:
> > > The L1 substates support requires additional steps to work, namely:
> > > -Proper handling of the CLKREQ# sideband signal. (It is mostly handled by
> > >  hardware, but software still needs to set the clkreq fields in the
> > >  PCIE_CLIENT_POWER_CON register to match the hardware implementation.)
> > > -Program the frequency of the aux clock into the
> > >  DSP_PCIE_PL_AUX_CLK_FREQ_OFF register. (During L1 substates the core_clk
> > >  is turned off and the aux_clk is used instead.)
> > ...
> 
> > > +static void rockchip_pcie_disable_l1sub(struct dw_pcie *pci)
> > > +{
> > > +	u32 cap, l1subcap;
> > > +
> > > +	cap = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
> > > +	if (cap) {
> > > +		l1subcap = dw_pcie_readl_dbi(pci, cap + PCI_L1SS_CAP);
> > > +		l1subcap &= ~(PCI_L1SS_CAP_L1_PM_SS | PCI_L1SS_CAP_ASPM_L1_1 |
> > > +			      PCI_L1SS_CAP_ASPM_L1_2 | PCI_L1SS_CAP_PCIPM_L1_1 |
> > > +			      PCI_L1SS_CAP_PCIPM_L1_2);
> > > +		dw_pcie_writel_dbi(pci, cap + PCI_L1SS_CAP, l1subcap);
> > > +	}
> > > +}
> > 
> > I like this.  But why should we do it just for dw-rockchip?  Is there
> > something special about dw-rockchip that makes this a problem?  Maybe
> > we should consider doing this in the dwc, cadence, mobiveil, and plda
> > cores instead of trying to do it for every driver individually?
> > 
> > Advertising L1SS support via PCI_EXT_CAP_ID_L1SS means users can
> > enable L1SS via CONFIG_PCIEASPM_POWER_SUPERSAVE=y or sysfs, and that
> > seems likely to cause problems unless CLKREQ# is supported.
> 
> Any thoughts on this?  There's nothing rockchip-specific in this
> patch.  What I'm proposing is something like this:
> 
>     PCI: dwc: Prevent advertising L1 PM Substates
>     
>     L1 PM Substates require the CLKREF# signal and driver-specific support.  If
>     CLKREF# is not supported or the driver support is lacking, enabling L1.1 or
>     L1.2 may cause errors when accessing devices, e.g.,
>     
>       nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0x10
>     
>     If both ends of a link advertise support for L1 PM Substates, and the
>     kernel is built with CONFIG_PCIEASPM_POWER_SUPERSAVE=y or users enable L1.x
>     via sysfs, Linux tries to enable them.
>     
>     To prevent errors when L1.x may not work, disable advertising the L1 PM
>     Substates.  Drivers can enable advertising them if they know CLKREF# is
>     present and the Root Port is configured correctly.
>     
>     Based on Niklas's patch from
>     https://patch.msgid.link/20251017163252.598812-2-cassel@kernel.org
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 20c9333bcb1c..83b5330c9e45 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -950,6 +950,27 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> +static void dw_pcie_clear_l1ss_advert(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	u16 l1ss;
> +	u32 l1ss_cap;
> +
> +	l1ss = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
> +	if (!l1ss)
> +		return;
> +
> +	/*
> +	 * By default, don't advertise L1 PM Substates because they require
> +	 * CLKREF# and other driver-specific support.
> +	 */
> +	l1ss_cap = dw_pcie_readl_dbi(pci, l1ss + PCI_L1SS_CAP);
> +	l1ss_cap &= ~(PCI_L1SS_CAP_PCIPM_L1_1 | PCI_L1SS_CAP_ASPM_L1_1 |
> +		      PCI_L1SS_CAP_PCIPM_L1_2 | PCI_L1SS_CAP_ASPM_L1_2 |
> +		      PCI_L1SS_CAP_L1_PM_SS);
> +	dw_pcie_writel_dbi(pci, l1ss + PCI_L1SS_CAP, l1ss_cap);
> +}
> +
>  static void dw_pcie_program_presets(struct dw_pcie_rp *pp, enum pci_bus_speed speed)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -1060,6 +1081,7 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
>  		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
>  	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
>  
> +	dw_pcie_clear_l1ss_advert(pp);
>  	dw_pcie_config_presets(pp);
>  	/*
>  	 * If the platform provides its own child bus config accesses, it means

My patch disables L1 substates when running the controller in both root
complex mode and endpoint mode.

Your patch above only disables L1 substates when running the the controller
in root complex mode.

I think this code has to be in pcie-designware.c and then e.g.
dw_pcie_setup_rc() (pcie-designware-host.c) and
dw_pcie_ep_init_registers() (pcie-designware-ep.c) can both use it.


And like Shawn mentions. Disabling it by default for all DWC based
platforms could introduce regressions where L1 substates already is working
fine.

Sure, the only driver that checks for the DT property 'supports-clkreq' is
drivers/pci/controller/dwc/pcie-tegra194.c. However Mani claimed that the
qcom driver also has support for L1 substates already, even though it does
not check the 'supports-clkreq' DT property.


Kind regards,
Niklas

