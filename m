Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F91DCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 21:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=YPUOr2qC6U74IJQf22r6U+hQB40aWZ9zGCecld04I/0=; b=l23/N42Kv+d0NM
	RQ04S4xRsHXWGCc1S9PPZf9buIW8xADDD4fDbcnNdFuEdYdApfV1QP00LiRL36n1TZJg4F7EXuK/T
	FE64WjB8tVQ8QN2VogD8g56y+toSfwyBXJJ42HDV2rAmH2bjNOQRmsCaejrWeB9f8dqZdgLdwKH8N
	aHp3ZLp1WUswhP0SxtsUcKzXN2Aa2GXfx3g73Lpq9HiNkN6h9bLjDrU3CJLLsNjmPKHlBZlvyz1SA
	iJ9/15hzlv2IGg3N4b/dVezLOeP18LLm7SdGeIYuKhnJndJO/6dVkqblqPHFOUc195OviptunemiD
	kGSYQsYiF4HPigqSs67w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG29r-0000000Aebt-0qrF;
	Mon, 03 Nov 2025 21:32:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG29o-0000000AebM-3rQr;
	Mon, 03 Nov 2025 21:32:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BEF3D439A6;
	Mon,  3 Nov 2025 21:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B9BC4CEF8;
	Mon,  3 Nov 2025 21:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762205527;
	bh=ssYPXPPovf2wqM/ImHK3XaebFTE3pSTxGXauyycDp1s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=HA2Y7jLUZquaUCK75bZKPHJXEr5Sumg5l12Op+piRCuWuQSIeDZTjhXnAEWodtEgs
	 eVrCJXC8t2B09HakFD1MYgMlBYeSNuYGwKdVrLdvaeJFasZD0uQ6YJ8jjVhGWKH9a/
	 dt/ZUoChk9U0WMJIGYNgT2mpk8Uxz3uAnRa6PwtbQ1/iQrPrqAEltzz1Mb1Um2TXox
	 zkYcFvz+5T3WyGjK0zc4ZzNTd3EJYDUWG3uinkBbgnr41ZCrSQMNiB8lhNMaJhHA7x
	 AA+8yMZnsFdmDJNrRunuLuXr2/RdQyiMVVOj2cLVWvjm8c+bE6+lkBO5URJBGe+jJI
	 Qxr99z6g/N7pA==
Date: Mon, 3 Nov 2025 15:32:06 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
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
Message-ID: <20251103213206.GA1818418@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028190218.GA1525614@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_133209_020102_441341A8 
X-CRM114-Status: GOOD (  26.40  )
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

On Tue, Oct 28, 2025 at 02:02:18PM -0500, Bjorn Helgaas wrote:
> On Fri, Oct 17, 2025 at 06:32:53PM +0200, Niklas Cassel wrote:
> > The L1 substates support requires additional steps to work, namely:
> > -Proper handling of the CLKREQ# sideband signal. (It is mostly handled by
> >  hardware, but software still needs to set the clkreq fields in the
> >  PCIE_CLIENT_POWER_CON register to match the hardware implementation.)
> > -Program the frequency of the aux clock into the
> >  DSP_PCIE_PL_AUX_CLK_FREQ_OFF register. (During L1 substates the core_clk
> >  is turned off and the aux_clk is used instead.)
> ...

> > +static void rockchip_pcie_disable_l1sub(struct dw_pcie *pci)
> > +{
> > +	u32 cap, l1subcap;
> > +
> > +	cap = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
> > +	if (cap) {
> > +		l1subcap = dw_pcie_readl_dbi(pci, cap + PCI_L1SS_CAP);
> > +		l1subcap &= ~(PCI_L1SS_CAP_L1_PM_SS | PCI_L1SS_CAP_ASPM_L1_1 |
> > +			      PCI_L1SS_CAP_ASPM_L1_2 | PCI_L1SS_CAP_PCIPM_L1_1 |
> > +			      PCI_L1SS_CAP_PCIPM_L1_2);
> > +		dw_pcie_writel_dbi(pci, cap + PCI_L1SS_CAP, l1subcap);
> > +	}
> > +}
> 
> I like this.  But why should we do it just for dw-rockchip?  Is there
> something special about dw-rockchip that makes this a problem?  Maybe
> we should consider doing this in the dwc, cadence, mobiveil, and plda
> cores instead of trying to do it for every driver individually?
> 
> Advertising L1SS support via PCI_EXT_CAP_ID_L1SS means users can
> enable L1SS via CONFIG_PCIEASPM_POWER_SUPERSAVE=y or sysfs, and that
> seems likely to cause problems unless CLKREQ# is supported.

Any thoughts on this?  There's nothing rockchip-specific in this
patch.  What I'm proposing is something like this:

    PCI: dwc: Prevent advertising L1 PM Substates
    
    L1 PM Substates require the CLKREF# signal and driver-specific support.  If
    CLKREF# is not supported or the driver support is lacking, enabling L1.1 or
    L1.2 may cause errors when accessing devices, e.g.,
    
      nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0x10
    
    If both ends of a link advertise support for L1 PM Substates, and the
    kernel is built with CONFIG_PCIEASPM_POWER_SUPERSAVE=y or users enable L1.x
    via sysfs, Linux tries to enable them.
    
    To prevent errors when L1.x may not work, disable advertising the L1 PM
    Substates.  Drivers can enable advertising them if they know CLKREF# is
    present and the Root Port is configured correctly.
    
    Based on Niklas's patch from
    https://patch.msgid.link/20251017163252.598812-2-cassel@kernel.org

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 20c9333bcb1c..83b5330c9e45 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -950,6 +950,27 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
 	return 0;
 }
 
+static void dw_pcie_clear_l1ss_advert(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	u16 l1ss;
+	u32 l1ss_cap;
+
+	l1ss = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
+	if (!l1ss)
+		return;
+
+	/*
+	 * By default, don't advertise L1 PM Substates because they require
+	 * CLKREF# and other driver-specific support.
+	 */
+	l1ss_cap = dw_pcie_readl_dbi(pci, l1ss + PCI_L1SS_CAP);
+	l1ss_cap &= ~(PCI_L1SS_CAP_PCIPM_L1_1 | PCI_L1SS_CAP_ASPM_L1_1 |
+		      PCI_L1SS_CAP_PCIPM_L1_2 | PCI_L1SS_CAP_ASPM_L1_2 |
+		      PCI_L1SS_CAP_L1_PM_SS);
+	dw_pcie_writel_dbi(pci, l1ss + PCI_L1SS_CAP, l1ss_cap);
+}
+
 static void dw_pcie_program_presets(struct dw_pcie_rp *pp, enum pci_bus_speed speed)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -1060,6 +1081,7 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
 		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
 	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
 
+	dw_pcie_clear_l1ss_advert(pp);
 	dw_pcie_config_presets(pp);
 	/*
 	 * If the platform provides its own child bus config accesses, it means

