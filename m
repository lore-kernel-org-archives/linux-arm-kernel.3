Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4DCC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 00:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ZBDbEceDyNUQfJ5OG+FXrXC0YeixEXLzKxZ8VbDid/U=; b=R1KF1XxpVvLAxF
	akkcUxbZ+D/Pt5syYswAsEza+nedhfAyN94+HfxKrig4C47kPKzUvhJfKkwsfmGXJu8wrB6foOsJW
	TRtdKPhJ7uMYz/XB6WaCLkW17QBO/c6O7LzSN+CFXZOvSl3ORMKwZsxfWXy8+rveMkWFw/7hVQ3lZ
	vx7wCD9YEY5JRzdnXXt3ZjnXAkssEElcCmdhXLDByaSWCbAjntiur/N3zDnGcCRHNP2gRmP9gdlMn
	GpmN5bJ7xRUSRWXzD2uHXmcU6KcuctwCs65WW7THmz7/IrC3FB0eVcs+HnMrnmAh9cDJxgSgYMsbi
	g1aOtwWjtxKYrGw0eqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRi5-00000005oLK-0acL;
	Thu, 27 Feb 2025 00:25:05 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRgY-00000005oAR-0Rqk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 00:23:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C92C612CD;
	Thu, 27 Feb 2025 00:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E91C4CED6;
	Thu, 27 Feb 2025 00:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740615808;
	bh=Snbn7RL/BEWOlEKJMOnfQXtsEkFO1ZODqdbhYhfuwis=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tL83cyzxc1jmWFi+Npy+ataI7BSMe3WmInn/gZ433hDXbfcUXE43I1HFOv1mKSDWe
	 R/TFB1Y9hNmlzeSjIGXMoN8W7IC6rVYbyd1y7+fccn56zqBsfk2eok2QCDSkA+wKOs
	 Vgin+CiJAEZyxgCZE4vw4l7TrWuolCUeRW3QXgWQSn++AUAFdEvoL4P9n3swqBWzxs
	 jWySl0T4WQ9LQIg4poVHPxMxnIi68JL9rxSVx0uRSJOKynxbfviWne7o5czp4jxMQs
	 vfdNO2dsIFSz4HFDF1jUDeopba30bsGitUiyXKL864E4UsNQ0EDs9pppksASriq5hb
	 s1VOyJ48mrG8A==
Date: Wed, 26 Feb 2025 18:23:26 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v9 3/7] PCI: Add parent_bus_offset to resource_entry
Message-ID: <20250227002326.GA566507@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-pci_fixup_addr-v9-3-3c4bb506f665@nxp.com>
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

On Tue, Jan 28, 2025 at 05:07:36PM -0500, Frank Li wrote:
> Introduce `parent_bus_offset` in `resource_entry` and a new API,
> `pci_add_resource_parent_bus_offset()`, to provide necessary information
> for PCI controllers with address translation units.
> 
> Typical PCI data flow involves:
>   CPU (CPU address) -> Bus Fabric (Intermediate address) ->
>   PCI Controller (PCI bus address) -> PCI Bus.
> 
> While most bus fabrics preserve address consistency, some modify addresses
> to intermediate values. The `parent_bus_offset` enables PCI controllers to
> translate these intermediate addresses correctly to PCI bus addresses.
> 
> Pave the road to remove hardcoded cpu_addr_fixup() and similar patterns in
> PCI controller drivers.
> ...

> +++ b/drivers/pci/of.c
> @@ -402,7 +402,17 @@ static int devm_of_pci_get_host_bridge_resources(struct device *dev,
>  			res->flags &= ~IORESOURCE_MEM_64;
>  		}
>  
> -		pci_add_resource_offset(resources, res,	res->start - range.pci_addr);
> +		/*
> +		 * IORESOURCE_IO res->start is io space start address.
> +		 * IORESOURCE_MEM res->start is cpu start address, which is the
> +		 * same as range.cpu_addr.
> +		 *
> +		 * Use (range.cpu_addr - range.parent_bus_addr) to align both
> +		 * IO and MEM's parent_bus_offset always offset to cpu address.
> +		 */
> +
> +		pci_add_resource_parent_bus_offset(resources, res, res->start - range.pci_addr,
> +						   range.cpu_addr - range.parent_bus_addr);

I don't know exactly where it needs to go, but I think we can call
.cpu_addr_fixup() once at startup on the base of the region.  This
will tell us the offset that applies to the entire region, i.e.,
parent_bus_offset.

Then we can remove all the .cpu_addr_fixup() calls in
cdns_pcie_host_init_address_translation(),
cdns_pcie_set_outbound_region(), and dw_pcie_prog_outbound_atu().

Until we can get rid of all the .cpu_addr_fixup() implementations,
We'll still have that single call at startup (I guess once for cadence
and another for designware), but it should simplify the current
callers quite a bit.

>  	}
>  
>  	/* Check for dma-ranges property */
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 47b31ad724fa5..0d7e67b47be47 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1510,6 +1510,8 @@ static inline void pci_release_config_region(struct pci_dev *pdev,
>  void pci_add_resource(struct list_head *resources, struct resource *res);
>  void pci_add_resource_offset(struct list_head *resources, struct resource *res,
>  			     resource_size_t offset);
> +void pci_add_resource_parent_bus_offset(struct list_head *resources, struct resource *res,
> +					resource_size_t offset, resource_size_t parent_bus_offset);
>  void pci_free_resource_list(struct list_head *resources);
>  void pci_bus_add_resource(struct pci_bus *bus, struct resource *res);
>  struct resource *pci_bus_resource_n(const struct pci_bus *bus, int n);
> diff --git a/include/linux/resource_ext.h b/include/linux/resource_ext.h
> index ff0339df56afc..b6ec6cc318203 100644
> --- a/include/linux/resource_ext.h
> +++ b/include/linux/resource_ext.h
> @@ -24,6 +24,7 @@ struct resource_entry {
>  	struct list_head	node;
>  	struct resource		*res;	/* In master (CPU) address space */
>  	resource_size_t		offset;	/* Translation offset for bridge */
> +	resource_size_t		parent_bus_offset; /* Parent bus address offset for bridge */
>  	struct resource		__res;	/* Default storage for res */
>  };
>  
> 
> -- 
> 2.34.1
> 

