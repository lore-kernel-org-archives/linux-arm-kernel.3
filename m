Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BEDC369D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 19:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=UWrw2K+DJxZiUdAiv47lEp5rgNTBWk9DpqUEQ8tweDA=; b=ZjEYe5dpIrJ0xZ
	dFtTA7CYQ5J0Vm+T/eZ2yW7BwZg0EPtdg/1obEbNegCOGXORcQkOeDGdWUHUK01aZ+5YfPM0+Petd
	iC2+zHhYAM5D5GdcHhRYfczDaiVsXxBecTVGvQN4TesX/RPAldY4cQda9GSm96OopK5LZ6DaTLTUx
	hK5R6aeOnSUbclKOXBhxnWln/PlUXdarYobaKdbkoqJ4b5NCfnfldbMGo5v7c22Sjq4Q+mO6Tbd00
	mN9i8219N3am6rWxVS12oo9El1k/WpJwBREzyzEWsYdROekRL/DJ7Yu2dVJ84FdAgCZPIGA7gjJuX
	bDiTTQDuXuYnbIQ2OFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Jag-00000008Loa-1vOB;
	Tue, 22 Apr 2025 19:47:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GoU-00000007y4B-2HSY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 16:49:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D00B5C5D33;
	Tue, 22 Apr 2025 16:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940C1C4CEE9;
	Tue, 22 Apr 2025 16:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745340575;
	bh=s9kMwJjDJ2rcuOzb9LFbxhZCz0C30M7jGjVo/6qeYK4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ae9PaHLIH2pXGK2vvhTyEi/fVGiLgSKV4bCaKMpxmdsSaiLLWnZqNuS4RAWP3Ppc1
	 czwixz4vaqciUviy4ZyA5cTYsFXWnFNkvVLSdc96cu84GvEpu5vZFRPCS6j4nx1WOJ
	 s7rH2IZeDPUtON+2lVgPeSoIAQpvH3FV0AucL6BANOrTyIhrVv5NvD8KwjR2fZ4JEj
	 m1j7NI9i/5kGbRWvlvrcB6IUMKSY/thPOJc09MpEGq15sUqADWF7keSXCuXbBaHCP5
	 UrvpBGwig4QBQYxOJHvAs4ehuBg0gVVnzDgfGFfWNllCDiSk0EnVLm/amLooatEfVi
	 3VdUuE8Fz+rBw==
Date: Tue, 22 Apr 2025 11:49:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
	robh@kernel.org, bhelgaas@google.com, vigneshr@ti.com,
	kishon@kernel.org, 18255117159@163.com, cassel@kernel.org,
	wojciech.jasko-EXT@continental-corporation.com,
	thomas.richard@bootlin.com, bwawrzyn@cisco.com,
	linux-pci@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH v4 2/4] PCI: cadence-host: Introduce
 cdns_pcie_host_disable helper for cleanup
Message-ID: <20250422164934.GA333709@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417124408.2752248-3-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_094938_687934_E91BC5A6 
X-CRM114-Status: GOOD (  23.23  )
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

On Thu, Apr 17, 2025 at 06:14:06PM +0530, Siddharth Vadapalli wrote:
> Introduce the helper function cdns_pcie_host_disable() which will undo
> the configuration performed by cdns_pcie_host_setup(). Also, export it
> for use by existing callers of cdns_pcie_host_setup(), thereby allowing
> them to cleanup on their exit path.

For the merge commit log and eventual pull request, can you give me a
hint about the motivation for this?  Based on the other patches in
this series, my guess is that this is required for making the j721e
driver buildable as a module and removable?

> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> 
> v3 patch is at:
> https://lore.kernel.org/r/20250410104426.463453-3-s-vadapalli@ti.com/
> No changes since v3.
> 
> Regards,
> Siddharth.
> 
>  .../controller/cadence/pcie-cadence-host.c    | 104 ++++++++++++++++++
>  drivers/pci/controller/cadence/pcie-cadence.h |   5 +
>  2 files changed, 109 insertions(+)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
> index 96055edeb099..741508738f88 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-host.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
> @@ -152,6 +152,14 @@ static int cdns_pcie_retrain(struct cdns_pcie *pcie)
>  	return ret;
>  }
>  
> +static void cdns_pcie_host_disable_ptm_response(struct cdns_pcie *pcie)
> +{
> +	u32 val;
> +
> +	val = cdns_pcie_readl(pcie, CDNS_PCIE_LM_PTM_CTRL);
> +	cdns_pcie_writel(pcie, CDNS_PCIE_LM_PTM_CTRL, val & ~CDNS_PCIE_LM_TPM_CTRL_PTMRSEN);
> +}
> +
>  static void cdns_pcie_host_enable_ptm_response(struct cdns_pcie *pcie)
>  {
>  	u32 val;
> @@ -177,6 +185,26 @@ static int cdns_pcie_host_start_link(struct cdns_pcie_rc *rc)
>  	return ret;
>  }
>  
> +static void cdns_pcie_host_deinit_root_port(struct cdns_pcie_rc *rc)
> +{
> +	struct cdns_pcie *pcie = &rc->pcie;
> +	u32 value, ctrl;
> +
> +	cdns_pcie_rp_writew(pcie, PCI_CLASS_DEVICE, 0xffff);
> +	cdns_pcie_rp_writeb(pcie, PCI_CLASS_PROG, 0xff);
> +	cdns_pcie_rp_writeb(pcie, PCI_CLASS_REVISION, 0xff);
> +	cdns_pcie_writel(pcie, CDNS_PCIE_LM_ID, 0xffffffff);
> +	cdns_pcie_rp_writew(pcie, PCI_DEVICE_ID, 0xffff);
> +	ctrl = CDNS_PCIE_LM_BAR_CFG_CTRL_DISABLED;
> +	value = ~(CDNS_PCIE_LM_RC_BAR_CFG_BAR0_CTRL(ctrl) |
> +		CDNS_PCIE_LM_RC_BAR_CFG_BAR1_CTRL(ctrl) |
> +		CDNS_PCIE_LM_RC_BAR_CFG_PREFETCH_MEM_ENABLE |
> +		CDNS_PCIE_LM_RC_BAR_CFG_PREFETCH_MEM_64BITS |
> +		CDNS_PCIE_LM_RC_BAR_CFG_IO_ENABLE |
> +		CDNS_PCIE_LM_RC_BAR_CFG_IO_32BITS);
> +	cdns_pcie_writel(pcie, CDNS_PCIE_LM_RC_BAR_CFG, value);
> +}
> +
>  static int cdns_pcie_host_init_root_port(struct cdns_pcie_rc *rc)
>  {
>  	struct cdns_pcie *pcie = &rc->pcie;
> @@ -393,6 +421,32 @@ static int cdns_pcie_host_dma_ranges_cmp(void *priv, const struct list_head *a,
>          return resource_size(entry2->res) - resource_size(entry1->res);
>  }
>  
> +static void cdns_pcie_host_unmap_dma_ranges(struct cdns_pcie_rc *rc)
> +{
> +	struct cdns_pcie *pcie = &rc->pcie;
> +	enum cdns_pcie_rp_bar bar;
> +	u32 value;
> +
> +	/* Reset inbound configuration for all BARs which were being used */
> +	for (bar = RP_BAR0; bar <= RP_NO_BAR; bar++) {
> +		if (rc->avail_ib_bar[bar])
> +			continue;
> +
> +		cdns_pcie_writel(pcie, CDNS_PCIE_AT_IB_RP_BAR_ADDR0(bar), 0);
> +		cdns_pcie_writel(pcie, CDNS_PCIE_AT_IB_RP_BAR_ADDR1(bar), 0);
> +
> +		if (bar == RP_NO_BAR)
> +			continue;
> +
> +		value = ~(LM_RC_BAR_CFG_CTRL_MEM_64BITS(bar) |
> +			  LM_RC_BAR_CFG_CTRL_PREF_MEM_64BITS(bar) |
> +			  LM_RC_BAR_CFG_CTRL_MEM_32BITS(bar) |
> +			  LM_RC_BAR_CFG_CTRL_PREF_MEM_32BITS(bar) |
> +			  LM_RC_BAR_CFG_APERTURE(bar, bar_aperture_mask[bar] + 2));
> +		cdns_pcie_writel(pcie, CDNS_PCIE_LM_RC_BAR_CFG, value);
> +	}
> +}
> +
>  static int cdns_pcie_host_map_dma_ranges(struct cdns_pcie_rc *rc)
>  {
>  	struct cdns_pcie *pcie = &rc->pcie;
> @@ -430,6 +484,29 @@ static int cdns_pcie_host_map_dma_ranges(struct cdns_pcie_rc *rc)
>  	return 0;
>  }
>  
> +static void cdns_pcie_host_deinit_address_translation(struct cdns_pcie_rc *rc)
> +{
> +	struct cdns_pcie *pcie = &rc->pcie;
> +	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(rc);
> +	struct resource_entry *entry;
> +	int r;
> +
> +	cdns_pcie_host_unmap_dma_ranges(rc);
> +
> +	/*
> +	 * Reset outbound region 0 which was reserved for configuration space
> +	 * accesses.
> +	 */
> +	cdns_pcie_reset_outbound_region(pcie, 0);
> +
> +	/* Reset rest of the outbound regions */
> +	r = 1;
> +	resource_list_for_each_entry(entry, &bridge->windows) {
> +		cdns_pcie_reset_outbound_region(pcie, r);
> +		r++;
> +	}
> +}
> +
>  static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
>  {
>  	struct cdns_pcie *pcie = &rc->pcie;
> @@ -487,6 +564,12 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
>  	return cdns_pcie_host_map_dma_ranges(rc);
>  }
>  
> +static void cdns_pcie_host_deinit(struct cdns_pcie_rc *rc)
> +{
> +	cdns_pcie_host_deinit_address_translation(rc);
> +	cdns_pcie_host_deinit_root_port(rc);
> +}
> +
>  int cdns_pcie_host_init(struct cdns_pcie_rc *rc)
>  {
>  	int err;
> @@ -499,6 +582,14 @@ int cdns_pcie_host_init(struct cdns_pcie_rc *rc)
>  }
>  EXPORT_SYMBOL_GPL(cdns_pcie_host_init);
>  
> +static void cdns_pcie_host_link_disable(struct cdns_pcie_rc *rc)
> +{
> +	struct cdns_pcie *pcie = &rc->pcie;
> +
> +	cdns_pcie_stop_link(pcie);
> +	cdns_pcie_host_disable_ptm_response(pcie);
> +}
> +
>  int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
>  {
>  	struct cdns_pcie *pcie = &rc->pcie;
> @@ -524,6 +615,19 @@ int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
>  }
>  EXPORT_SYMBOL_GPL(cdns_pcie_host_link_setup);
>  
> +void cdns_pcie_host_disable(struct cdns_pcie_rc *rc)
> +{
> +	struct pci_host_bridge *bridge;
> +
> +	bridge = pci_host_bridge_from_priv(rc);
> +	pci_stop_root_bus(bridge->bus);
> +	pci_remove_root_bus(bridge->bus);
> +
> +	cdns_pcie_host_deinit(rc);
> +	cdns_pcie_host_link_disable(rc);
> +}
> +EXPORT_SYMBOL_GPL(cdns_pcie_host_disable);
> +
>  int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
>  {
>  	struct device *dev = rc->pcie.dev;
> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
> index 4b7f295e24e7..0b6bed1ac146 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence.h
> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
> @@ -523,6 +523,7 @@ static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
>  int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc);
>  int cdns_pcie_host_init(struct cdns_pcie_rc *rc);
>  int cdns_pcie_host_setup(struct cdns_pcie_rc *rc);
> +void cdns_pcie_host_disable(struct cdns_pcie_rc *rc);
>  void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
>  			       int where);
>  #else
> @@ -541,6 +542,10 @@ static inline int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
>  	return 0;
>  }
>  
> +static inline void cdns_pcie_host_disable(struct cdns_pcie_rc *rc)
> +{
> +}
> +
>  static inline void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
>  					     int where)
>  {
> -- 
> 2.34.1
> 

