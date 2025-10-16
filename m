Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DA2CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=mSDue7PEiB99ltn/JLU8yrmhkfrCwSIemv7RoGtZdy0=; b=DhS91drzCpXJj+
	pUanblqODpVvy1uR00gvQaR4abak6Fe269i2fjCa8IfsGEu+kPTdhqk2VWQCwFm8RbYBWfzo5VKuf
	CcGQD07m81KiXmJsoQQDDNY3coW40xFKAwDySa0wcUqZdDMVtKqYq/rCftsDG4g7Ll2reBmDYfhCh
	4JWqCTW1/ye0I3oWOYyUB7267FYRN8myhMJWGKU3/zWsvaRz4lyODBK+ziQPVeH5mPK8BWLR7LWHd
	d7RTwfPtpC7EXHcl1bHbi+1BBiDthwpnhXdQtfmp6jjt4/4vguk6Ex9udVs5pgReipoJ/KTCWaMe4
	U9ijCFSwKXxRbISOmBjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Rit-00000005Yxf-39lN;
	Thu, 16 Oct 2025 17:25:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ris-00000005YxW-2pWz;
	Thu, 16 Oct 2025 17:25:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C08BC602A0;
	Thu, 16 Oct 2025 17:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476A6C4CEF1;
	Thu, 16 Oct 2025 17:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760635505;
	bh=G6gflAdnfqtYv6X1AmICnxsRIfUHX7Y5Khj5yu5Kdxw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=sRVlh2pBX6NDS7gsIFGctuMKVFo1D8iL3lbXMjQsOI+YOy3NDjQ336qjLZU2lnots
	 5ChxGMnP2fCioMwCnckgGwJON0FpEb3zyydV8p/12tby1gpPCyoTDF300s+1Kt0zkD
	 i6YrNagHIkaOGiocng95zHqHCjbifWOm5y2Oqw2dwNZN4HHg4pZixWzbnNKLy/Xmvu
	 rgdgD73wtKtC44yS139PRpjjZDiqPxaXcsWkyDMvqpn6JJQN15horDXhVE9RxOSLVm
	 NjAem8fcbx4eKcDKQgddivvB2Q4v9Z9yGt+iKq7Jb8XnA2WJB1cr+qGgKFzWwTKYhU
	 pNrZDAAI8/+wg==
Date: Thu, 16 Oct 2025 12:25:04 -0500
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
Subject: Re: [PATCH v2] PCI: dw-rockchip: Disable L1 substates
Message-ID: <20251016172504.GA991252@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016090422.451982-2-cassel@kernel.org>
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

On Thu, Oct 16, 2025 at 11:04:22AM +0200, Niklas Cassel wrote:
> The L1 substates support requires additional steps to work, see e.g.
> section '11.6.6.4 L1 Substate' in the RK3588 TRM V1.0.
> 
> These steps are currently missing from the driver.

Can we outline here specifically what is missing?

> While this has always been a problem when using e.g.
> CONFIG_PCIEASPM_POWER_SUPERSAVE=y, the problem became more apparent after
> commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for
> devicetree platforms"), which enabled ASPM also for
> CONFIG_PCIEASPM_DEFAULT=y.

Should also be able to trigger this problem regardless of
CONFIG_PCIEASPM_* by using /sys/bus/pci/devices/.../link/l1_2_aspm.

> Disable L1 substates until proper support is added.

I would word this more like "prevent advertising L1 Substates support"
since we're not actually *disabling* anything here.

If the RK3588 TRM is publicly available, a URL here would be helpful.

> Cc: stable@vger.kernel.org
> Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host controller driver")
> Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
> Changes since v1:
> -Remove superfluous dw_pcie_readl_dbi()
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

I suspect this problem is specifically related to L1.2 and CLKREQ#,
and L1.1 might work fine.  If so, can we update this so we still
advertise L1.1 support?

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

