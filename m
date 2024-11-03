Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED277E67807
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 06:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYgEDruINISZGBX4Cd/tmdAf48brbc9RaFngJbqVRpo=; b=0CgzDmi4+G0WHbqyk3+lfdQkuH
	U77mScQukUMcsOSCfsxRquwd/Os65dXNNjafdLletaahLt2grEd2IfJNiMvyHoq3hpQUdILRJ04Ag
	OtTWDGfXTg4MWe9/a/VrMqAhOntRbmp4eXl+m+r5QV1UgFgxFouTUghqWyugsVnrIhlS343OHV0HC
	KrwLWUlC5iSpPGgqx8RPe5WdYAdh/SoOSYjywiHvbUwpUTvmYGabbfNpNgGBYIFuCHD9S7crJxMLQ
	Ffh8hwgn8vu1Calkym24kYeSKVABMbBTpOCTF/fHM+YZBQUGAPxBJ+TJ7r5asjdZfcs5jLEaX2BsK
	DSZcFf7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Tw1-0000000B1yi-37Fo;
	Sun, 03 Nov 2024 06:18:01 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7TuM-0000000B1rc-0apG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 06:16:19 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A36G5KK043083;
	Sun, 3 Nov 2024 01:16:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730614565;
	bh=NYgEDruINISZGBX4Cd/tmdAf48brbc9RaFngJbqVRpo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vjKdNDW4H4csRBs5v/BeVjhF9h0DOHS8283o3D2szP1vy4rsEwr+y8auPAJVTJg0j
	 uK6YW2xTixt7JzkDh1D655X6dpEmZefoCtHRRI9krRsLW1Or+kXbbM0HbZSE43DVbx
	 IfWGDaKUXB0Y9ZjqXButh15PRr/W8el9SWVp2RbI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A36G5u7129759
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 3 Nov 2024 01:16:05 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 3
 Nov 2024 01:16:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 3 Nov 2024 01:16:04 -0500
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A36Fxkc090807;
	Sun, 3 Nov 2024 01:16:00 -0500
Message-ID: <3d7abd75-68a2-4232-ad8c-e874c10df1ae@ti.com>
Date: Sun, 3 Nov 2024 11:45:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] PCI: keystone: Add support for PVU-based DMA
 isolation on AM654
To: Jan Kiszka <jan.kiszka@siemens.com>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-pci@vger.kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Bao Cheng Su
	<baocheng.su@siemens.com>,
        Hua Qian Li <huaqian.li@siemens.com>,
        Diogo Ivo
	<diogo.ivo@siemens.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas
	<bhelgaas@google.com>
References: <cover.1725901439.git.jan.kiszka@siemens.com>
 <f6ea60ec075e981a9b587b42baec33649e3f3918.1725901439.git.jan.kiszka@siemens.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <f6ea60ec075e981a9b587b42baec33649e3f3918.1725901439.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_231618_301173_734665E8 
X-CRM114-Status: GOOD (  29.40  )
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



On 09/09/24 22:33, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> The AM654 lacks an IOMMU, thus does not support isolating DMA requests
> from untrusted PCI devices to selected memory regions this way. Use
> static PVU-based protection instead. The PVU, when enabled, will only
> accept DMA requests that address previously configured regions.
> 
> Use the availability of a restricted-dma-pool memory region as trigger
> and register it as valid DMA target with the PVU. In addition, enable
> the mapping of requester IDs to VirtIDs in the PCI RC. Use only a single
> VirtID so far, catching all devices. This may be extended later on.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
> CC: Lorenzo Pieralisi <lpieralisi@kernel.org>
> CC: "Krzysztof Wilczyński" <kw@linux.com>
> CC: Bjorn Helgaas <bhelgaas@google.com>
> CC: linux-pci@vger.kernel.org
> ---
>  drivers/pci/controller/dwc/pci-keystone.c | 108 ++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index 2219b1a866fa..a5954cae6d5d 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -19,6 +19,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/msi.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_pci.h>
>  #include <linux/phy/phy.h>
> @@ -26,6 +27,7 @@
>  #include <linux/regmap.h>
>  #include <linux/resource.h>
>  #include <linux/signal.h>
> +#include <linux/ti-pvu.h>
>  
>  #include "../../pci.h"
>  #include "pcie-designware.h"
> @@ -111,6 +113,16 @@
>  
>  #define PCI_DEVICE_ID_TI_AM654X		0xb00c
>  
> +#define KS_PCI_VIRTID			0
> +
> +#define PCIE_VMAP_xP_CTRL		0x0
> +#define PCIE_VMAP_xP_REQID		0x4
> +#define PCIE_VMAP_xP_VIRTID		0x8
> +
> +#define PCIE_VMAP_xP_CTRL_EN		BIT(0)
> +
> +#define PCIE_VMAP_xP_VIRTID_VID_MASK	0xfff
> +
>  struct ks_pcie_of_data {
>  	enum dw_pcie_device_mode mode;
>  	const struct dw_pcie_host_ops *host_ops;
> @@ -1125,6 +1137,96 @@ static const struct of_device_id ks_pcie_of_match[] = {
>  	{ },
>  };
>  
> +#ifdef CONFIG_TI_PVU
> +static int ks_init_vmap(struct platform_device *pdev, const char *vmap_name)
> +{
> +	struct resource *res;
> +	void __iomem *base;
> +	u32 val;
> +

Nit:

	if (!IS_ENABLED(CONFIG_TI_PVU))
		return 0;


this looks cleaner than #ifdef.. #else..#endif .


Rest LGTM

> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, vmap_name);
> +	base = devm_pci_remap_cfg_resource(&pdev->dev, res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	writel(0, base + PCIE_VMAP_xP_REQID);
> +
> +	val = readl(base + PCIE_VMAP_xP_VIRTID);
> +	val &= ~PCIE_VMAP_xP_VIRTID_VID_MASK;
> +	val |= KS_PCI_VIRTID;
> +	writel(val, base + PCIE_VMAP_xP_VIRTID);
> +
> +	val = readl(base + PCIE_VMAP_xP_CTRL);
> +	val |= PCIE_VMAP_xP_CTRL_EN;
> +	writel(val, base + PCIE_VMAP_xP_CTRL);
> +
> +	return 0;
> +}
> +
> +static int ks_init_restricted_dma(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct of_phandle_iterator it;
> +	struct resource phys;
> +	int err;
> +
> +	/* Only process the first restricted dma pool, more are not allowed */
> +	of_for_each_phandle(&it, err, dev->of_node, "memory-region",
> +			    NULL, 0) {
> +		if (of_device_is_compatible(it.node, "restricted-dma-pool"))
> +			break;
> +	}
> +	if (err)
> +		return err == -ENOENT ? 0 : err;
> +
> +	err = of_address_to_resource(it.node, 0, &phys);
> +	if (err < 0) {
> +		dev_err(dev, "failed to parse memory region %pOF: %d\n",
> +			it.node, err);
> +		return 0;
> +	}
> +
> +	/* Map all incoming requests on low and high prio port to virtID 0 */
> +	err = ks_init_vmap(pdev, "vmap_lp");
> +	if (err)
> +		return err;
> +	err = ks_init_vmap(pdev, "vmap_hp");
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * Enforce DMA pool usage with the help of the PVU.
> +	 * Any request outside will be dropped and raise an error at the PVU.
> +	 */
> +	return ti_pvu_create_region(KS_PCI_VIRTID, &phys);
> +}
> +
> +static void ks_release_restricted_dma(struct platform_device *pdev)
> +{
> +	struct of_phandle_iterator it;
> +	struct resource phys;
> +	int err;
> +
> +	of_for_each_phandle(&it, err, pdev->dev.of_node, "memory-region",
> +			    NULL, 0) {
> +		if (of_device_is_compatible(it.node, "restricted-dma-pool") &&
> +		    of_address_to_resource(it.node, 0, &phys) == 0) {
> +			ti_pvu_remove_region(KS_PCI_VIRTID, &phys);
> +			break;
> +		}
> +	}
> +}
> +#else
> +static inline int ks_init_restricted_dma(struct platform_device *pdev)
> +{
> +	return 0;
> +}
> +
> +static inline void ks_release_restricted_dma(struct platform_device *pdev)
> +{
> +}
> +#endif
> +
>  static int ks_pcie_probe(struct platform_device *pdev)
>  {
>  	const struct dw_pcie_host_ops *host_ops;
> @@ -1273,6 +1375,10 @@ static int ks_pcie_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_get_sync;
>  
> +	ret = ks_init_restricted_dma(pdev);
> +	if (ret < 0)
> +		goto err_get_sync;
> +
>  	switch (mode) {
>  	case DW_PCIE_RC_TYPE:
>  		if (!IS_ENABLED(CONFIG_PCI_KEYSTONE_HOST)) {
> @@ -1354,6 +1460,8 @@ static void ks_pcie_remove(struct platform_device *pdev)
>  	int num_lanes = ks_pcie->num_lanes;
>  	struct device *dev = &pdev->dev;
>  
> +	ks_release_restricted_dma(pdev);
> +
>  	pm_runtime_put(dev);
>  	pm_runtime_disable(dev);
>  	ks_pcie_disable_phy(ks_pcie);

-- 
Regards
Vignesh

