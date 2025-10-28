Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23155CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 19:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=HrP+2iGNgekQID2vGUg95zrVwxoY2iDLaDmPEXZ6k1Y=; b=BP5tHZgkQLL3do
	yI03tal8QQxIOuDmVO2Lb6B6C1owE5JmX/X5iLpWFgjH+MEAAowcHRueROrVxxw5CJzgcrhLKEtxw
	P4UKrTYlRf9/PPBiZ20Tc62mWqDYT8uGe8pVejgPknv+H5PZhjIGF+l8ADsX+lUhnVTVNSUQdfRB2
	kftITpsEusWVzm+4v/FjOPF1yrykvBzNiLuM1OLpFjKqOK7mpAuNej2Pg7ObhcbJjJa6UoMzMtVja
	TGrkvBEuWLYlbvIJFqrmRIF4YiAX0ntMFdzmoigXGw95N9VTfWQJTCqGL1a92T5pqaUctfg7J7A1w
	vzseOk3dSSfVktEt+bYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDoxc-0000000GWxx-04zO;
	Tue, 28 Oct 2025 19:02:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDoxZ-0000000GWxQ-2lyk;
	Tue, 28 Oct 2025 19:02:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B63840B8C;
	Tue, 28 Oct 2025 19:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB35C4CEE7;
	Tue, 28 Oct 2025 19:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761678140;
	bh=FphJo2SDn8RkNNoEowQmoek17vzitC3fE1fUYqVA91k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=spaiYdVM2oh+Rg2HGD4pv16liq4KvSXnsknDcLkGpJIzFAaTlNs5jDfxLZ/IepDvY
	 62UimWM5lX8csDBaI77mWy6Ili7I1d6a85CvHCYgH2jbQVz307BqBPGfcvrLMw7SnG
	 Zewk9g4GF1VWuwl0bjqY9H9jUfNSmgolqL+Gbxuzm08sMa6X6j2GTtnCZyMbn84fiM
	 TCdgT72Uwz6FKvpot1gfnFfQPObge1LD0k1OkeAUt/H3fS4zYKMl+1XQzP6zYNXidO
	 7LXPE3BF/xZsNZMK1K1EzUjZjEd5L7eo3RjgIMGZUecvDUQgvBe9TmINHFC5KGHn6t
	 UMeALpMErElyQ==
Date: Tue, 28 Oct 2025 14:02:18 -0500
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
Message-ID: <20251028190218.GA1525614@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017163252.598812-2-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_120221_745713_FC069195 
X-CRM114-Status: GOOD (  29.83  )
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

[+cc Daire, Karthikeyan, Hou]

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
> 
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

I like this.  But why should we do it just for dw-rockchip?  Is there
something special about dw-rockchip that makes this a problem?  Maybe
we should consider doing this in the dwc, cadence, mobiveil, and plda
cores instead of trying to do it for every driver individually?

Advertising L1SS support via PCI_EXT_CAP_ID_L1SS means users can
enable L1SS via CONFIG_PCIEASPM_POWER_SUPERSAVE=y or sysfs, and that
seems likely to cause problems unless CLKREQ# is supported.

Bjorn

