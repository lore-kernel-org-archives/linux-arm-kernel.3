Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1226C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 19:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=6dBTiX4xAO3JV4ryYMi2B6agwtg8EoTxOEevYmBg6jY=; b=tMeerZX4BY4khgMUC0lGPrCmnW
	C99vCbwa4gKW7GK4EyktQoEzqpWGGv54asgWmEimY8RfzjVzDO9Oocy2T5kz2J7egRUmM9FqiQF2g
	6KrqD7C79l+GzuSjuZbX0QYY2e/7U6ePiNc9Ag0CLyr4txC9cqL7UURrFidUj/VvoaIE90cCzjpYB
	tFqrdJKql0yeEQLe8k961kaGPROt66B6saIeEd4NEBtSLQMsvzv8zA9fyoze5yrOPLil/BwjE9rIx
	OrxhVmM45eOunACtBXEdY+s9hzctDETVm6fzK6mD/gW0ylq/ddn6YhZvAaMUC67wnHwatIjuSRPPt
	1+0pWRPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56hl-0000000HVwl-0yUo;
	Fri, 11 Sep 2026 19:14:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56hj-0000000HVwf-3eVJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 19:14:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E9D8600AA;
	Fri, 11 Sep 2026 19:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5731F000FF;
	Fri, 11 Sep 2026 19:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789154070;
	bh=6dBTiX4xAO3JV4ryYMi2B6agwtg8EoTxOEevYmBg6jY=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=KEalvI/2bEBdkDuKN4fDoYIKLX7rAzEfZt8bke8EBvHnfyzM7P2NknWBSV2RDem7Q
	 nhaUbLczJcFxoJ2dWu9IENtTm3GibRW0LJjdgS+08etBmUihh9/mu3OrOuss+dmBk8
	 5ywqAybM2Oes8BjZDd5OendLHvt7KVyTiPdnapbIF1HjYXhC8LMf/lmyuJx3wKgJSz
	 94NeaGgX75Ry5f+8KjxF/nthw1h2JoGfRDyarbp7DU2eXY4rvxW+Ai+7oVxL22fjW2
	 zbE261wRJJnNpV/wDW8to41BavEmjVlRTfgeYlESIwNN6TDpN/5HpdiHXEyQVKoou6
	 8bRA/EtABB+QA==
Date: Fri, 11 Sep 2026 14:14:29 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Semih Baskan <strst.gs@gmail.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	rafal@milecki.pl, florian.fainelli@broadcom.com, arnd@arndb.de,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, rosenp@gmail.com, rani.hod@gmail.com
Subject: Re: [PATCH v3] PCI: iproc: Use the EROM outbound window on BCMA
Message-ID: <20260911191429.GA549927@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260807160526.379-1-strst.gs@gmail.com>
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

[+to Rafał; probably same as rafal@milecki.pl, but MAINTAINERS lists
zajec5@gmail.com for BCMA]

On Fri, Aug 07, 2026 at 07:05:26PM +0300, Semih Baskan wrote:
> The PCIe outbound window base on Northstar depends on the PCIe Gen2 core
> revision. Revision 0x01 uses 0x08000000, 0x40000000 and 0x48000000 for
> controllers 0 to 2, while revision 0x07 (NS-B0) uses 0x08000000,
> 0x20000000 and 0x28000000. Broadcom's own driver branches on the core
> revision for exactly this reason.
> 
> bcm-ns.dtsi is shared by every Northstar SoC, so it cannot carry a value
> that is correct on both. Commit 767012397976 ("ARM: dts: BCM5301X:
> Describe PCIe controllers fully") gave the controllers a ranges property.
> The commit shipped in v7.1.
> 
> With that property present, two things go wrong with this driver:
> 
>  - devm_pci_alloc_host_bridge() parses those ranges and requests them,
>    then this driver adds its own window and requests the whole list a
>    second time, so every controller fails to probe with -EBUSY.
> 
>  - The DT window itself is only correct on core revision 0x07. On
>    revision 0x01 it points at an address the hardware does not decode,
>    and the first MMIO access to a BAR takes an imprecise external
>    abort.
> 
> The enumeration ROM reports the correct base for the revision actually
> present, and bcma already provides it as addr_s[0]. Drop any memory
> window that came from the device tree and use that instead, requesting
> only the window this driver owns. This makes the driver correct whether
> or not the DT describes a window.
> 
> When a dropped window does not match what the EROM reports, print a
> warning naming both. The mismatch means the devicetree describes a
> window the hardware does not decode, and that should be fixed in the
> dts rather than ignored silently.
> 
> The same commit also added compatible = "brcm,iproc-pcie", so these
> nodes now match pcie-iproc-platform. With CONFIG_PCIE_IPROC_PLATFORM
> enabled, which is the default on ARCH_BCM_IPROC, that driver binds them
> first and this driver's probe fails inside devm_pci_alloc_host_bridge().
> This patch fixes the configurations where the BCMA driver is the one in
> use; OpenWrt builds that way, with PCIE_IPROC_PLATFORM disabled. The
> platform path takes the DT window as-is and has the same wrong address
> on core revision 0x01, so that side needs a devicetree fix either way.
> 
> Tested on an ASUS RT-N18U (BCM47081) and a Linksys EA9200 (BCM4709),
> both core revision 0x01.
> 
> Fixes: 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully")
> Tested-by: Rani Hod <rani.hod@gmail.com>
> Cc: stable@vger.kernel.org # v7.1+
> Signed-off-by: Semih Baskan <strst.gs@gmail.com>
> ---
> v2 -> v3: format the two problem descriptions as bullet points.
> Requested by Bjorn Helgaas.
> 
> v1 -> v2: print a warning for every devicetree memory window that does
> not match the EROM window. Requested by Arnd Bergmann:
> https://lore.kernel.org/all/d05ffeca-f289-42dd-b454-5a7c7741c6d5@app.fastmail.com/
> 
> v2: https://lore.kernel.org/all/20260807035726.387-1-strst.gs@gmail.com/
> v1: https://lore.kernel.org/all/20260727140939.389-1-strst.gs@gmail.com/
> 
>  drivers/pci/controller/pcie-iproc-bcma.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-iproc-bcma.c b/drivers/pci/controller/pcie-iproc-bcma.c
> index 593418c2b..06a471f4a 100644
> --- a/drivers/pci/controller/pcie-iproc-bcma.c
> +++ b/drivers/pci/controller/pcie-iproc-bcma.c
> @@ -36,6 +36,7 @@ static int iproc_bcma_pcie_probe(struct bcma_device *bdev)
>  	struct device *dev = &bdev->dev;
>  	struct iproc_pcie *pcie;
>  	struct pci_host_bridge *bridge;
> +	struct resource_entry *win, *tmp;
>  	int ret;
>  
>  	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
> @@ -59,8 +60,22 @@ static int iproc_bcma_pcie_probe(struct bcma_device *bdev)
>  	pcie->mem.end = bdev->addr_s[0] + SZ_128M - 1;
>  	pcie->mem.name = "PCIe MEM space";
>  	pcie->mem.flags = IORESOURCE_MEM;
> +
> +	resource_list_for_each_entry_safe(win, tmp, &bridge->windows) {
> +		if (resource_type(win->res) != IORESOURCE_MEM)
> +			continue;
> +
> +		if (win->res->start != pcie->mem.start ||
> +		    win->res->end != pcie->mem.end)
> +			dev_warn(dev, "DT window %pR does not match EROM window %pR, using EROM\n",
> +				 win->res, &pcie->mem);
> +
> +		devm_release_resource(dev, win->res);
> +		resource_list_destroy_entry(win);
> +	}
> +
>  	pci_add_resource(&bridge->windows, &pcie->mem);
> -	ret = devm_request_pci_bus_resources(dev, &bridge->windows);
> +	ret = devm_request_resource(dev, &iomem_resource, &pcie->mem);

If the EROM supplies the information the driver needs, why does this
BCMA driver use DT at all?

AFAICS, pcie-iproc-bcma.c doesn't use any of the information from DT.
devm_pci_alloc_host_bridge() *looks* in DT, parses it, and fills in
bridge->windows, and requests those windows, but I don't think
iproc-bcma ever uses them.

iproc_bcma_pcie_probe() passes &bridge->windows to iproc_pcie_setup(),
where I think it's ignored because pcie->need_ob_cfg is never set for
iproc_bcma.

It looks like iproc_bcma_pcie_probe() should just call
pci_alloc_host_bridge() directly and skip devm_pci_alloc_host_bridge()
and the DT things it does.

>  	if (ret)
>  		return ret;
>  
> -- 
> 2.43.0
> 

