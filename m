Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E35E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 10:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6r856xGgyMu9LY+c6OXplqMr2kXhhQWtK9gqJyFTKM=; b=M910Ip25Le1r3uZheD52PkTsWH
	OE6O42d26TPJ+OI0cgzM9sp816mvsi+yJRW87OcAFDVkWBUlnR7rcrqUO8ql8cv1/hxa2U98fT2p2
	OfuPuKL5k5A/GylQcUlu7XsFWIhUmeZUFFqZucyhrCrWQW4pEi43k6SAQ/mqIdp8JwjdhaP+cRUew
	4g6l5NB7XYdUVh/cUPNxbZRdoz8IMF+KVd01f8SKaPvGw3UfBhr+qXy7Tv3zlzjapp4ZsHbyFqrcj
	YJ8Q28Hvl+9+ujFW8lcDYF7tFWSJ2UMCyQr70xB4I1e6TQ7doPRVw5M8yKgOGBLU4NBaWIjXaCQIv
	LKKByyDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ99A-0000000FWjw-3zVg;
	Thu, 05 Dec 2024 10:31:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ98A-0000000FWaF-2Kfq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 10:30:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A4B9BA42FB5;
	Thu,  5 Dec 2024 10:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E31C4CED1;
	Thu,  5 Dec 2024 10:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733394645;
	bh=FI6UYkSCZ6hPHYb64d6jRjQ640jUV6Orgx4R74ZtjbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aptJ9V03xMpXPdUljnOGsQXYqupX9KE4kvdJLvyemKaq4FEqzigvxUVLNUIeglBdq
	 giaBOxhzO2kHp+LbklEWs51yxVa/yuClwvVS+ADH/E6AMHmttvxkVzzDAQjvsJsGRK
	 /Yk+PFB5cVWozXkd1/7wR6oRBM/7pgS4yXu4fbpSxwvVD+2yyM66YAboJNlbg1NRVw
	 Z+KaeSdY4qPo1wqD4trDR8bIlHbKoOYHcsYE/Wbfv2xsJlVawK9xuhK+aUK8pIUFl8
	 7obzUum+TeqhAz6QI2XEvMbRybDC89kQ8jbwkN2faaq8o+WVuOl5qkuPIG1Me991wl
	 Bsx4nbTw0C46Q==
Date: Thu, 5 Dec 2024 11:30:36 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, alyssa@rosenzweig.io, bpf@vger.kernel.org,
	broonie@kernel.org, jgg@ziepe.ca, joro@8bytes.org,
	lgirdwood@gmail.com, maz@kernel.org, p.zabel@pengutronix.de,
	robin.murphy@arm.com, will@kernel.org
Subject: Re: [PATCH v7 1/2] PCI: Add enable_device() and disable_device()
 callbacks for bridges
Message-ID: <Z1GAzI+tNqVv5Fbg@lpieralisi>
References: <20241203-imx95_lut-v7-0-d0cd6293225e@nxp.com>
 <20241203-imx95_lut-v7-1-d0cd6293225e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203-imx95_lut-v7-1-d0cd6293225e@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023046_726511_50597A1A 
X-CRM114-Status: GOOD (  31.63  )
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

On Tue, Dec 03, 2024 at 06:27:15PM -0500, Frank Li wrote:
> Some PCIe host bridges require special handling when enabling or disabling
> PCIe Endpoints. For example, the i.MX95 platform has a lookup table to map
> Requester IDs to StreamIDs, which are used by the SMMU and MSI controller
> to identify the source of DMA accesses.
> 
> Without this mapping, DMA accesses may target unintended memory, which
> would corrupt memory or read the wrong data.
> 
> Add a host bridge .enable_device() hook the imx6 driver can use to
> configure the Requester ID to StreamID mapping. The hardware table isn't
> big enough to map all possible Requester IDs, so this hook may fail if no
> table space is available. In that case, return failure from
> pci_enable_device().
> 
> It might make more sense to make pci_set_master() decline to enable bus
> mastering and return failure, but it currently doesn't have a way to return
> failure.
> 
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Tested-by: Marc Zyngier <maz@kernel.org>
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v5 to v6
> - Add Marc testedby and Reviewed-by tag
> - Add Mani's acked tag
> 
> Change from v4 to v5
> - Add two static help functions
> int pci_host_bridge_enable_device(dev);
> void pci_host_bridge_disable_device(dev);
> - remove tags because big change
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>

I can pick it up when Bjorn acks it.

> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Tested-by: Marc Zyngier <maz@kernel.org>
> 
> Change from v3 to v4
> - Add Bjorn's ack tag
> 
> Change from v2 to v3
> - use Bjorn suggest's commit message.
> - call disable_device() when error happen.
> 
> Change from v1 to v2
> - move enable(disable)device ops to pci_host_bridge
> ---
>  drivers/pci/pci.c   | 36 +++++++++++++++++++++++++++++++++++-
>  include/linux/pci.h |  2 ++
>  2 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 0b29ec6e8e5e2..773ca3cbd3221 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -2059,6 +2059,28 @@ int __weak pcibios_enable_device(struct pci_dev *dev, int bars)
>  	return pci_enable_resources(dev, bars);
>  }
>  
> +static int pci_host_bridge_enable_device(struct pci_dev *dev)
> +{
> +	struct pci_host_bridge *host_bridge = pci_find_host_bridge(dev->bus);
> +	int err;
> +
> +	if (host_bridge && host_bridge->enable_device) {
> +		err = host_bridge->enable_device(host_bridge, dev);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static void pci_host_bridge_disable_device(struct pci_dev *dev)
> +{
> +	struct pci_host_bridge *host_bridge = pci_find_host_bridge(dev->bus);
> +
> +	if (host_bridge && host_bridge->disable_device)
> +		host_bridge->disable_device(host_bridge, dev);
> +}
> +
>  static int do_pci_enable_device(struct pci_dev *dev, int bars)
>  {
>  	int err;
> @@ -2074,9 +2096,13 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
>  	if (bridge)
>  		pcie_aspm_powersave_config_link(bridge);
>  
> +	err = pci_host_bridge_enable_device(dev);
> +	if (err)
> +		return err;
> +
>  	err = pcibios_enable_device(dev, bars);

Next in line is removing pcibios_enable_device() arch callbacks and move
that code into bridge callbacks to do the same, we can do it later.

Lorenzo

>  	if (err < 0)
> -		return err;
> +		goto err_enable;
>  	pci_fixup_device(pci_fixup_enable, dev);
>  
>  	if (dev->msi_enabled || dev->msix_enabled)
> @@ -2091,6 +2117,12 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
>  	}
>  
>  	return 0;
> +
> +err_enable:
> +	pci_host_bridge_disable_device(dev);
> +
> +	return err;
> +
>  }
>  
>  /**
> @@ -2274,6 +2306,8 @@ void pci_disable_device(struct pci_dev *dev)
>  	if (atomic_dec_return(&dev->enable_cnt) != 0)
>  		return;
>  
> +	pci_host_bridge_disable_device(dev);
> +
>  	do_pci_disable_device(dev);
>  
>  	dev->is_busmaster = 0;
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index db9b47ce3eefd..bcbef004dd561 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -595,6 +595,8 @@ struct pci_host_bridge {
>  	u8 (*swizzle_irq)(struct pci_dev *, u8 *); /* Platform IRQ swizzler */
>  	int (*map_irq)(const struct pci_dev *, u8, u8);
>  	void (*release_fn)(struct pci_host_bridge *);
> +	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
> +	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>  	void		*release_data;
>  	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
>  	unsigned int	no_ext_tags:1;		/* No Extended Tags */
> 
> -- 
> 2.34.1
> 

