Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324BFEFCE4C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 22:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=XmEm4z45i+ysaRsehxPHQ88Jcw87ewPm7K9i/p8JfWE=; b=eqMllkjjLnAte4
	OgCJVMcjI+zSVEbaHLPJ0u/VaiZ8qnAkC6yOS7Pem1pCjpRWNsPNPOH1lbVQtfH3Kx6M61x4aUewG
	hTktMm0IQqRLzRqto+f8HWbGlRaOEAMOhg6s9wcBppQfgsZFTGGeuZVzS4ST4O0VX6qeyLCU0eTHO
	2ACA7TLmutO+pGpa1sEtjiIE/QH7RSG+H3CH9dYUYlAjr3gG2r+1rfQ9rVFBHVRTysJ8eSvS+w92I
	vbzxY8iN0VbYk1dhADXd44c+1xeextlPtS/3cvO93l0SU3VS9ZYazlgckCRHpESR64GvtNf6WUan4
	bwlfqp8ahUShO2NbxM2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuna-00000000axT-2Zhx;
	Wed, 04 Mar 2026 22:34:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxunZ-00000000axE-0Krn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 22:34:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 150CA60053;
	Wed,  4 Mar 2026 22:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93CB9C4CEF7;
	Wed,  4 Mar 2026 22:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772663671;
	bh=xtXiT6HoQdMIWu8cMUXATW0+N0I6AwrbMofSK5cScOo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=nftlr+2Kn5zf3LbCRv8rT1Uqt20lvfH1sSG7gDi2AIWBjEkSvUXrNTSyefzr0YfX2
	 ooAr07FsoZDHZJM2vVaReF/OGfw8hxlllUyfMpX9cBuNRd3CwV6vok8tKSGSr6W9gf
	 HYH+8LicxHj+WbAflJo7llMdOe4wCHHGb0xBww6kiqSlPIZN27U2YNkR+OG7ymx2j6
	 k+ZAMh5QNlKQJOkIpmtgCPjjDZAu+Og7oc7bRm5wlpR1wIOlZTv7w0M42DyPDBIUAB
	 RLzLa+tBB1mKCCuRKudYupgp+qUGllTJQl5etZ+KJreLpoQqi2KqZvlJ9D1idV5rd6
	 fOJZ7tdyyJ6Xg==
Date: Wed, 4 Mar 2026 16:34:30 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, imx@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v9 1/3] of: Add convenience wrappers for of_map_id()
Message-ID: <20260304223430.GA41322@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-parse_iommu_cells-v9-1-4d1bceecc5e1@oss.qualcomm.com>
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

On Sun, Mar 01, 2026 at 02:04:19PM +0530, Vijayanand Jitta wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> Since we now have quite a few users parsing "iommu-map" and "msi-map"
> properties, give them some wrappers to conveniently encapsulate the
> appropriate sets of property names. This will also make it easier to
> then change of_map_id() to correctly account for specifier cells.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/cdx/cdx_msi.c                    |  3 +--
>  drivers/iommu/of_iommu.c                 |  4 +---
>  drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
>  drivers/of/irq.c                         |  3 +--
>  drivers/pci/controller/dwc/pci-imx6.c    |  6 ++----
>  drivers/pci/controller/pcie-apple.c      |  3 +--

Acked-by: Bjorn Helgaas <bhelgaas@google.com> # drivers/pci/

>  drivers/xen/grant-dma-ops.c              |  3 +--
>  include/linux/of.h                       | 14 ++++++++++++++
>  8 files changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
> index 91b95422b263..63b3544ec997 100644
> --- a/drivers/cdx/cdx_msi.c
> +++ b/drivers/cdx/cdx_msi.c
> @@ -128,8 +128,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
>  	int ret;
>  
>  	/* Retrieve device ID from requestor ID using parent device */
> -	ret = of_map_id(parent->of_node, cdx_dev->msi_dev_id, "msi-map", "msi-map-mask",
> -			NULL, &dev_id);
> +	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &dev_id);
>  	if (ret) {
>  		dev_err(dev, "of_map_id failed for MSI: %d\n", ret);
>  		return ret;
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index 6b989a62def2..a511ecf21fcd 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -48,9 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
>  	struct of_phandle_args iommu_spec = { .args_count = 1 };
>  	int err;
>  
> -	err = of_map_id(master_np, *id, "iommu-map",
> -			 "iommu-map-mask", &iommu_spec.np,
> -			 iommu_spec.args);
> +	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
> index d36b278ae66c..b63343a227a9 100644
> --- a/drivers/irqchip/irq-gic-its-msi-parent.c
> +++ b/drivers/irqchip/irq-gic-its-msi-parent.c
> @@ -180,7 +180,7 @@ static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u
>  
>  	struct device_node *msi_ctrl __free(device_node) = NULL;
>  
> -	return of_map_id(dev->of_node, dev->id, "msi-map", "msi-map-mask", &msi_ctrl, dev_id);
> +	return of_map_msi_id(dev->of_node, dev->id, &msi_ctrl, dev_id);
>  }
>  
>  static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 6367c67732d2..e37c1b3f8736 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -817,8 +817,7 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
>  	 * "msi-map" or an "msi-parent" property.
>  	 */
>  	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
> -		if (!of_map_id(parent_dev->of_node, id_in, "msi-map",
> -				"msi-map-mask", msi_np, &id_out))
> +		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &id_out))
>  			break;
>  		if (!of_check_msi_parent(parent_dev->of_node, msi_np))
>  			break;
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index a5b8d0b71677..bff8289f804a 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1144,8 +1144,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>  	u32 sid = 0;
>  
>  	target = NULL;
> -	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask",
> -			  &target, &sid_i);
> +	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
>  	if (target) {
>  		of_node_put(target);
>  	} else {
> @@ -1158,8 +1157,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>  	}
>  
>  	target = NULL;
> -	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask",
> -			  &target, &sid_m);
> +	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
>  
>  	/*
>  	 *   err_m      target
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 2d92fc79f6dd..a0937b7b3c4d 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -764,8 +764,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>  		pci_name(pdev->bus->self), port->idx);
>  
> -	err = of_map_id(port->pcie->dev->of_node, rid, "iommu-map",
> -			"iommu-map-mask", NULL, &sid);
> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index c2603e700178..1b7696b2d762 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -325,8 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>  		struct pci_dev *pdev = to_pci_dev(dev);
>  		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
>  
> -		if (of_map_id(np, rid, "iommu-map", "iommu-map-mask", &iommu_spec.np,
> -				iommu_spec.args)) {
> +		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
>  			dev_dbg(dev, "Cannot translate ID\n");
>  			return -ESRCH;
>  		}
> diff --git a/include/linux/of.h b/include/linux/of.h
> index be6ec4916adf..824649867810 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -1457,6 +1457,20 @@ static inline int of_property_read_s32(const struct device_node *np,
>  	return of_property_read_u32(np, propname, (u32*) out_value);
>  }
>  
> +static inline int of_map_iommu_id(const struct device_node *np, u32 id,
> +				  struct device_node **target, u32 *id_out)
> +{
> +	return of_map_id(np, id, "iommu-map", "iommu-map-mask",
> +			 target, id_out);
> +}
> +
> +static inline int of_map_msi_id(const struct device_node *np, u32 id,
> +				struct device_node **target, u32 *id_out)
> +{
> +	return of_map_id(np, id, "msi-map", "msi-map-mask",
> +			 target, id_out);
> +}
> +
>  #define of_for_each_phandle(it, err, np, ln, cn, cc)			\
>  	for (of_phandle_iterator_init((it), (np), (ln), (cn), (cc)),	\
>  	     err = of_phandle_iterator_next(it);			\
> 
> -- 
> 2.34.1
> 

