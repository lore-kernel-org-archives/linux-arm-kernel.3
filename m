Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCB6D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 07:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32BAxWckHLwkYB2C56W78r4SAJIppfl7dI4ZyHqzntA=; b=vikUtM3cawOXYtC2y9GzxEtxIJ
	TM3jdlNY8TOSB3n7H6egvO1zPYwJsMUimV6y6Ld+P2I+eVU7rifU2ehgs+y/ZovpRl9KBWKowPf44
	NEWsNGR1HZ4DMk9sWawMAG/ONr1m5z4cx84JSKYvdSm8MCZAV2QnNsS/ZI+7dzAAP/mk03c/Oe/gj
	qtM8MN/Y1zM/vsUQGSzq+v+I9CHM5Hx4l6HmP3UkEwaL+rO3ed1YCyBJRgi2oV3hQdRT8Rhk/cBzx
	uglfGa+DucYRU/YjWDs1G0wUrIzJIabQgtmNr6Fr3cxuMdVpQ2W3UW/q/Z5BZZl4CBecAVdGmL19T
	0cA5FhmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrsz-0000000Dvwg-3gLb;
	Tue, 09 Dec 2025 07:11:49 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrsx-0000000Dvw3-0Mf8;
	Tue, 09 Dec 2025 07:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765264307; x=1796800307;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SH8eXOb4vxle56Oueo5T+yDS2KBqYJ4WT8/+V5Dz+Cc=;
  b=CJggX5xqifpPEQbp1gAF4M9PetGXm154OAjsWmG03xMyL8Jd05+Cwjwp
   2KdoELdHfeanZZo0OamUrgle3kcziE8nmLJxhfkR9tvePfUSp3o/Q5tsF
   aMYyel9MgVfpVzwlww2NSt3kid2i9tcP0QadevUZZj8hrUEPjxuLVWMoO
   Q04us87I7HkKAjo1Ona6T+tDMmdXURWGANU/P9/Nkz/9YA0bGnqS12O9X
   lK+ml0wQQHDrpyQO3jGMLjdegkE3VojZ+v7IEaSh4RMDKNlDMx8rMqjGW
   S9NMOx5nZTqYCDo/4oYnqxaAB2SYsXRQVbC5gC2vCICMgL29nm+sWr+9m
   w==;
X-CSE-ConnectionGUID: y3qcdSUTSlK7mznGjrHWrw==
X-CSE-MsgGUID: PC6jMngzSIuJwkglEm2g4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="66398922"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="66398922"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 23:11:45 -0800
X-CSE-ConnectionGUID: Bh+IhTC0Tmyq8zAUnVNylg==
X-CSE-MsgGUID: GQpBTE6wQgqBadg7vVHgBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="196439851"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.139])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 23:11:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Dec 2025 09:11:37 +0200 (EET)
To: Niklas Cassel <cassel@kernel.org>
cc: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, 
    Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
    Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
    linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dwc: Make Link Up IRQ logic handle already
 powered on PCIe switches
In-Reply-To: <20251201063634.4115762-2-cassel@kernel.org>
Message-ID: <5cdf685c-5a37-1b65-3e87-9262f3ed7bd4@linux.intel.com>
References: <20251201063634.4115762-2-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_231147_153641_2D60527F 
X-CRM114-Status: GOOD (  43.15  )
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

On Mon, 1 Dec 2025, Niklas Cassel wrote:

> The DWC glue drivers always call pci_host_probe() during probe(), which
> will allocate upstream bridge resources and enumerate the bus.
> 
> For controllers without Link Up IRQ support, pci_host_probe() is called
> after dw_pcie_wait_for_link(), which will also wait the time required by
> the PCIe specification before performing PCI Configuration Space reads.
> 
> For controllers with Link Up IRQ support, the pci_host_probe() call (which
> will perform PCI Configuration Space reads) is done without any of the
> delays mandated by the PCIe specification.
> 
> For controllers with Link Up IRQ support, since the pci_host_probe() call
> is done without any delay (link training might still be ongoing), it is
> very unlikely that this scan will find any devices. Once the Link Up IRQ
> triggers, the Link Up IRQ handler will call pci_rescan_bus().
> 
> This works fine for PCIe endpoints connected to the Root Port, since they
> don't extend the bus. However, if the pci_rescan_bus() call detects a PCIe
> switch, then there will be a problem when the downstream busses starts
> showing up, because the PCIe controller is not hotplug capable, so we are
> not allowed to extend the subordinate bus number after the initial scan,
> resulting in error messages such as:
> 
> pci_bus 0004:43: busn_res: can not insert [bus 43-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:43: busn_res: [bus 43-41] end is updated to 43
> pci_bus 0004:43: busn_res: can not insert [bus 43] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:00.0: devices behind bridge are unusable because [bus 43] cannot be assigned for them
> pci_bus 0004:44: busn_res: can not insert [bus 44-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:44: busn_res: [bus 44-41] end is updated to 44
> pci_bus 0004:44: busn_res: can not insert [bus 44] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:02.0: devices behind bridge are unusable because [bus 44] cannot be assigned for them
> pci_bus 0004:45: busn_res: can not insert [bus 45-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:45: busn_res: [bus 45-41] end is updated to 45
> pci_bus 0004:45: busn_res: can not insert [bus 45] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:06.0: devices behind bridge are unusable because [bus 45] cannot be assigned for them
> pci_bus 0004:46: busn_res: can not insert [bus 46-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:46: busn_res: [bus 46-41] end is updated to 46
> pci_bus 0004:46: busn_res: can not insert [bus 46] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:0e.0: devices behind bridge are unusable because [bus 46] cannot be assigned for them
> pci_bus 0004:42: busn_res: [bus 42-41] end is updated to 46
> pci_bus 0004:42: busn_res: can not insert [bus 42-46] under [bus 41] (conflicts with (null) [bus 41])
> pci 0004:41:00.0: devices behind bridge are unusable because [bus 42-46] cannot be assigned for them
> pcieport 0004:40:00.0: bridge has subordinate 41 but max busn 46
> 
> While we would like to set the is_hotplug_bridge flag
> (quirk_hotplug_bridge()), many embedded SoCs that use the DWC controller
> have synthesized the controller without hot-plug support.
> Thus, the Link Up IRQ logic is only mimicking hot-plug functionality, i.e.
> it is not compliant with the PCI Hot-Plug Specification, so we cannot make
> use of the is_hotplug_bridge flag.
> 
> In order to let the Link Up IRQ logic handle PCIe switches that are already
> powered on (PCIe switches that not powered on already need to implement a
> pwrctrl driver), don't perform a pci_host_probe() call during probe()
> (which disregards the delays required by the PCIe specification).
> 
> Instead let the first Link Up IRQ call pci_host_probe(). Any follow up
> Link Up IRQ will call pci_rescan_bus().
> 
> The IRQ name in /proc/interrupts for the pcie-qcom driver is renamed in
> order to not dereference pp->bridge->bus before it has been assigned.
> 
> Fixes: ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can detect Link Up")
> Fixes: 0e0b45ab5d77 ("PCI: dw-rockchip: Enumerate endpoints based on dll_link_up IRQ")
> Reported-by: FUKAUMI Naoki <naoki@radxa.com>
> Closes: https://lore.kernel.org/linux-pci/1E8E4DB773970CB5+5a52c9e1-01b8-4872-99b7-021099f04031@radxa.com/
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

Hi Niklas,

Now this patch looks interesting (and managed to catch my attention 
despite being a controllers/ patch).

You're only talking about bus number allocations here but we did hit a 
similar problem with bridge window allocations where not enough 
information is available at the time of the initial scan + resource 
allocation (currently it is one of the issues that prevents fixing one 
resource overlap bug):

https://lore.kernel.org/linux-pci/8f9c9950-1612-6e2d-388a-ce69cf3aae1a@linux.intel.com/

(Please check also Mani's reply that relates to pwrctrl.)

So I definitely like the general direction this patch goes (though I'm a 
bit worried though if the downstream busses trickle in, the resource 
allocation problems will not be fully solved but maybe that fear is not 
warranted, I don't know).

-- 
 i.

> ---
> Changes since v1:
> -Rename the IRQ on pcie-qcom to not depend on pp->bridge->bus (Mani)
> -Make sure that ret is initialized in dw_pcie_host_init() error path (Dan)
> 
>  .../pci/controller/dwc/pcie-designware-host.c | 71 ++++++++++++++++---
>  drivers/pci/controller/dwc/pcie-designware.h  |  5 ++
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c |  5 +-
>  drivers/pci/controller/dwc/pcie-qcom.c        |  9 +--
>  4 files changed, 71 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index e92513c5bda51..bed7b309f6d9e 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -565,6 +565,59 @@ static int dw_pcie_host_get_resources(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> +static int dw_pcie_host_initial_scan(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct pci_host_bridge *bridge = pp->bridge;
> +	int ret;
> +
> +	ret = pci_host_probe(bridge);
> +	if (ret)
> +		return ret;
> +
> +	if (pp->ops->post_init)
> +		pp->ops->post_init(pp);
> +
> +	dwc_pcie_debugfs_init(pci, DW_PCIE_RC_TYPE);
> +
> +	return 0;
> +}
> +
> +void dw_pcie_handle_link_up_irq(struct dw_pcie_rp *pp)
> +{
> +	if (!pp->initial_linkup_irq_done) {
> +		int ret;
> +
> +		ret = dw_pcie_host_initial_scan(pp);
> +		if (ret) {
> +			struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +			struct device *dev = pci->dev;
> +
> +			dev_err(dev, "Initial scan from IRQ failed: %d\n", ret);
> +
> +			dw_pcie_stop_link(pci);
> +
> +			dw_pcie_edma_remove(pci);
> +
> +			if (pp->has_msi_ctrl)
> +				dw_pcie_free_msi(pp);
> +
> +			if (pp->ops->deinit)
> +				pp->ops->deinit(pp);
> +
> +			if (pp->cfg)
> +				pci_ecam_free(pp->cfg);
> +		} else {
> +			pp->initial_linkup_irq_done = true;
> +		}
> +	} else {
> +		/* Rescan the bus to enumerate endpoint devices */
> +		pci_lock_rescan_remove();
> +		pci_rescan_bus(pp->bridge->bus);
> +		pci_unlock_rescan_remove();
> +	}
> +}
> +
>  int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -669,18 +722,18 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	 * If there is no Link Up IRQ, we should not bypass the delay
>  	 * because that would require users to manually rescan for devices.
>  	 */
> -	if (!pp->use_linkup_irq)
> +	if (!pp->use_linkup_irq) {
>  		/* Ignore errors, the link may come up later */
>  		dw_pcie_wait_for_link(pci);
>  
> -	ret = pci_host_probe(bridge);
> -	if (ret)
> -		goto err_stop_link;
> -
> -	if (pp->ops->post_init)
> -		pp->ops->post_init(pp);
> -
> -	dwc_pcie_debugfs_init(pci, DW_PCIE_RC_TYPE);
> +		/*
> +		 * For platforms with Link Up IRQ, initial scan will be done
> +		 * on first Link Up IRQ.
> +		 */
> +		ret = dw_pcie_host_initial_scan(pp);
> +		if (ret)
> +			goto err_stop_link;
> +	}
>  
>  	return 0;
>  
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index e995f692a1ecd..a31bd93490dcd 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -427,6 +427,7 @@ struct dw_pcie_rp {
>  	int			msg_atu_index;
>  	struct resource		*msg_res;
>  	bool			use_linkup_irq;
> +	bool			initial_linkup_irq_done;
>  	struct pci_eq_presets	presets;
>  	struct pci_config_window *cfg;
>  	bool			ecam_enabled;
> @@ -807,6 +808,7 @@ void dw_pcie_msi_init(struct dw_pcie_rp *pp);
>  int dw_pcie_msi_host_init(struct dw_pcie_rp *pp);
>  void dw_pcie_free_msi(struct dw_pcie_rp *pp);
>  int dw_pcie_setup_rc(struct dw_pcie_rp *pp);
> +void dw_pcie_handle_link_up_irq(struct dw_pcie_rp *pp);
>  int dw_pcie_host_init(struct dw_pcie_rp *pp);
>  void dw_pcie_host_deinit(struct dw_pcie_rp *pp);
>  int dw_pcie_allocate_domains(struct dw_pcie_rp *pp);
> @@ -844,6 +846,9 @@ static inline int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> +static inline void dw_pcie_handle_link_up_irq(struct dw_pcie_rp *pp)
> +{ }
> +
>  static inline int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  {
>  	return 0;
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 3e2752c7dd096..8f2cc1ef25e3d 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -466,10 +466,7 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
>  		if (rockchip_pcie_link_up(pci)) {
>  			msleep(PCIE_RESET_CONFIG_WAIT_MS);
>  			dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
> -			/* Rescan the bus to enumerate endpoint devices */
> -			pci_lock_rescan_remove();
> -			pci_rescan_bus(pp->bridge->bus);
> -			pci_unlock_rescan_remove();
> +			dw_pcie_handle_link_up_irq(pp);
>  		}
>  	}
>  
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index c48a20602d7fa..04f29cd8d8881 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1617,10 +1617,7 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
>  	if (FIELD_GET(PARF_INT_ALL_LINK_UP, status)) {
>  		msleep(PCIE_RESET_CONFIG_WAIT_MS);
>  		dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
> -		/* Rescan the bus to enumerate endpoint devices */
> -		pci_lock_rescan_remove();
> -		pci_rescan_bus(pp->bridge->bus);
> -		pci_unlock_rescan_remove();
> +		dw_pcie_handle_link_up_irq(pp);
>  
>  		qcom_pcie_icc_opp_update(pcie);
>  	} else {
> @@ -1937,8 +1934,8 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  		goto err_phy_exit;
>  	}
>  
> -	name = devm_kasprintf(dev, GFP_KERNEL, "qcom_pcie_global_irq%d",
> -			      pci_domain_nr(pp->bridge->bus));
> +	name = devm_kasprintf(dev, GFP_KERNEL, "qcom_pcie_global_irq_%pOFP",
> +			      dev->of_node);
>  	if (!name) {
>  		ret = -ENOMEM;
>  		goto err_host_deinit;
> 

