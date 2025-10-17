Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FADCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=wea9AWCXiS17qpCfiCGN+u2XfvZ62ulYDs1Frnt6olI=; b=i7ud3ZvZvVqz0c
	5Vg1kZd3Pg7UVz1FQOFcmHLBOT8Lw9NKqCjlZqzH8lmUb5EGJfwhRERP/zOlYbVDocLCCOfJF4VuP
	xH39PCu0Hje8oxeqd2w+GPGs+vrCeqTe9EnZcqTQS5SbJ5jwRi2o3+k2NxGhjXRPkx/YFxruFCqu2
	XWX1kVvJrVsCKskBMvjotOhFl4EzYQu9geelxyv6PDxRopmqNRMeHZI9FjZaDLrB7ebE02t5sqvod
	J+YoSG4vbRk9JCb38LljtJTYnn4WvdzeXpgimrU6t6aSnQBAsvGqO47f1aP/U1AAmnqhwXQ7dbT6Z
	q07vNi6xbmqhPfbw0X0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nas-00000008UCQ-1ZwO;
	Fri, 17 Oct 2025 16:46:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nar-00000008UC7-0MMS;
	Fri, 17 Oct 2025 16:46:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:References;
	bh=wea9AWCXiS17qpCfiCGN+u2XfvZ62ulYDs1Frnt6olI=; b=LyorBbAU49PhHksBRoS4NxepOs
	jc9FUojiLyHwqHJtQFnfhUgdMwLGCveAr0bJsNrR576iT+yxwz0MhJwpaKtzcH2KMtNUwJ93RO5eU
	UbdwOIIhhRoaf3NP5yJEDKJYOgQ6zS5R9CufIQfgaIebJJDbKgIVM5P23e0md+cyaO6vbInthJLS2
	e+ggTalIC2oGHeG0lblNhGY3kBEMbL3d9VxneypzYtc2aQ4bPF+b+MkvnZmsqzBLA+n4OtSPP5E19
	zfXX/LKGloCALGeBnRaxUOSW7bVfnU/c1t/IYXfjuDwdad+nKYp5pcZCbyEXELGQcx4G0SfRuyxYn
	QGKe0kcA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9naj-00000007mKY-1dwf;
	Fri, 17 Oct 2025 16:46:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A3A54B339;
	Fri, 17 Oct 2025 16:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E8BC4CEE7;
	Fri, 17 Oct 2025 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760719560;
	bh=h08opjvAv8/xQo7w63XSdz3MO0fB63xMecJbpuPxEA8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=q1Y+SVCHTzDrmoW2qRAb6zFIadjOKdsDbR8JKZ2gD3h8bYtt3wiqJKMhrjREHnDbW
	 5mA42qA94tol3Ub4cYxKNUjwi2nVNZld535l/Y4+Q1ekr/r780LFdm5LRNk9Bn185N
	 peLLCqcRx1Tl7ewnpgeOevUX3uygIIHa3mxslR+docEKkatTZaz12dhCc1jK9Y8b8D
	 KMAsLQ5/F2laMwfOgUcEpeeIfCZqSvRKW5CaaGKdJD7GH3mKrwXe1iT8/nIN4NSil4
	 fiyC76ZMOqbXLBgdTuHSxNEFbZ3mvyUXH4q6sKyIOSmz9/tuP7KLrx8veMx05oS2Kh
	 OCHBzteTI9+mw==
Date: Fri, 17 Oct 2025 11:45:58 -0500
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
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3] PCI: dw-rockchip: Prevent advertising L1 Substates
 support
Message-ID: <20251017164558.GA1034609@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017163252.598812-2-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_174611_041019_92EA9EBE 
X-CRM114-Status: GOOD (  31.51  )
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

On Fri, Oct 17, 2025 at 06:32:53PM +0200, Niklas Cassel wrote:
> The L1 substates support requires additional steps to work, namely:
> -Proper handling of the CLKREQ# sideband signal. (It is mostly handled by
>  hardware, but software still needs to set the clkreq fields in the
>  PCIE_CLIENT_POWER_CON register to match the hardware implementation.)
> -Program the frequency of the aux clock into the
>  DSP_PCIE_PL_AUX_CLK_FREQ_OFF register. (During L1 substates the core_clk
>  is turned off and the aux_clk is used instead.)
> 
> These steps are currently missing from the driver.
> 
> For more details, see section '18.6.6.4 L1 Substate' in the RK3658 TRM 1.1
> Part 2, or section '11.6.6.4 L1 Substate' in the RK3588 TRM 1.0 Part2.
> 
> While this has always been a problem when using e.g.
> CONFIG_PCIEASPM_POWER_SUPERSAVE=y, or when modifying
> /sys/bus/pci/devices/.../link/l1_2_aspm, the lacking driver support for L1
> substates became more apparent after commit f3ac2ff14834 ("PCI/ASPM:
> Enable all ClockPM and ASPM states for devicetree platforms"), which
> enabled ASPM also for CONFIG_PCIEASPM_DEFAULT=y.
> 
> When using e.g. an NVMe drive connected to the PCIe controller, the
> problem will be seen as:
> nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0x10
> nvme nvme0: Does your device have a faulty power saving mode enabled?
> nvme nvme0: Try "nvme_core.default_ps_max_latency_us=0 pcie_aspm=off pcie_port_pm=off" and report a bug
> 
> Thus, prevent advertising L1 Substates support until proper driver support
> is added.

I think Mani is planning a change so we don't try to enable L1
Substates by default, which should avoid the regression even without a
patch like this.

That will still leave the existing CONFIG_PCIEASPM_POWER_SUPERSAVE=y
and sysfs l1_1_aspm problems.

And we'll need to figure out a way to allow L1.x to be enabled based
on 'supports-clkreq' and possibly other info.  That would likely be
v6.19 material since it's new functionality.

> Cc: stable@vger.kernel.org
> Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host controller driver")
> Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
> Acked-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
> Changes since v2:
> -Improve commit message (Bjorn)
> 
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 3e2752c7dd09..84f882abbca5 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -200,6 +200,25 @@ static bool rockchip_pcie_link_up(struct dw_pcie *pci)
>  	return FIELD_GET(PCIE_LINKUP_MASK, val) == PCIE_LINKUP;
>  }
>  
> +/*
> + * See e.g. section '11.6.6.4 L1 Substate' in the RK3588 TRM V1.0 for the steps
> + * needed to support L1 substates. Currently, not a single rockchip platform
> + * performs these steps, so disable L1 substates until there is proper support.
> + */
> +static void rockchip_pcie_disable_l1sub(struct dw_pcie *pci)
> +{
> +	u32 cap, l1subcap;
> +
> +	cap = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
> +	if (cap) {
> +		l1subcap = dw_pcie_readl_dbi(pci, cap + PCI_L1SS_CAP);
> +		l1subcap &= ~(PCI_L1SS_CAP_L1_PM_SS | PCI_L1SS_CAP_ASPM_L1_1 |
> +			      PCI_L1SS_CAP_ASPM_L1_2 | PCI_L1SS_CAP_PCIPM_L1_1 |
> +			      PCI_L1SS_CAP_PCIPM_L1_2);
> +		dw_pcie_writel_dbi(pci, cap + PCI_L1SS_CAP, l1subcap);
> +	}
> +}
> +
>  static void rockchip_pcie_enable_l0s(struct dw_pcie *pci)
>  {
>  	u32 cap, lnkcap;
> @@ -264,6 +283,7 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
>  	irq_set_chained_handler_and_data(irq, rockchip_pcie_intx_handler,
>  					 rockchip);
>  
> +	rockchip_pcie_disable_l1sub(pci);
>  	rockchip_pcie_enable_l0s(pci);
>  
>  	return 0;
> @@ -301,6 +321,7 @@ static void rockchip_pcie_ep_init(struct dw_pcie_ep *ep)
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	enum pci_barno bar;
>  
> +	rockchip_pcie_disable_l1sub(pci);
>  	rockchip_pcie_enable_l0s(pci);
>  	rockchip_pcie_ep_hide_broken_ats_cap_rk3588(ep);
>  
> -- 
> 2.51.0
> 

