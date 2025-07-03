Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FEEC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=z8GgfWrnJFJHxADsbByj/O1WY+W+lK44BD1usBbr6PQ=; b=CaAj7XiLv/6biR
	MIIFGWR1LM2T29zTMyCC6hAhGDj2jeA6jTeveBU4esGP6zBinp87uVnOulRRdVPpazxcooTvQrFJe
	H0oThCsi+Ri1tw9QliFgQpYbRmBtIIrSWCs0jLyKxMTT4SflBE3On5EiT2dBSUiKQaPCCbWVg+Uoq
	Nm0A+FflvISRyWoImhC0NICj5m32GpOWW4asBF1mRcyTabNksM5c3Gf5YKYuxoRnlufg0AWw8X4oh
	U9LQB4i38zm38NASEMdQF2aRtNtKlfgDZsPTrUJ7POTKr9ZI0neiQn+mK/hk7ruHoMF57PyCEPsVY
	ua2j8Ea9XAw7yYN+Muog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXS4f-0000000CgDg-3jtC;
	Thu, 03 Jul 2025 22:06:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNjA-0000000C8na-2MFz;
	Thu, 03 Jul 2025 17:28:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7831C61453;
	Thu,  3 Jul 2025 17:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D73C4CEE3;
	Thu,  3 Jul 2025 17:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751563683;
	bh=7DItQyd/iDiXcaQ1oEjOGACHtzfWw4WzefkYn8OTkwU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=H5ZftxTxWMfwxHZ+Pz3upY30k01iBoXdImqR+W/HMOoyYzD3f9V7nCF4lK/kiNDZk
	 Iv/a4u5MSqT8IyVdWMKt/77YNztWhnMVkI9jWlOVKXqlAoxQpMObMsOsZNgt3mrBzd
	 azBm0mh/xpH1TaR6W097mqBwLGUYZw+hfLFuqmy0dHTsMlEx3NfczGuOn3DQJBYmTs
	 rmwl0RQjoupydZDcb1P37q76NVU3kFSi5kZwkrCDNvz1ducn1Tc2kKbXh0JmDQBSVI
	 hQjavWGtQqoz8VzpB9ZusWsjtax/P5fIQ0C+xaskpPdNwILfdXtRyVYmu4AXYp6DXJ
	 eN5ZOW0iYQJgA==
Date: Thu, 3 Jul 2025 12:28:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Joyce Ooi <joyce.ooi@intel.com>, Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Michal Simek <michal.simek@amd.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/16] PCI: MSI parent domain conversion
Message-ID: <20250703172801.GA1934994@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1750858083.git.namcao@linutronix.de>
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

On Thu, Jun 26, 2025 at 04:47:50PM +0200, Nam Cao wrote:
> The initial implementation of PCI/MSI interrupt domains in the hierarchical
> interrupt domain model used a shortcut by providing a global PCI/MSI
> domain.
> 
> This works because the PCI/MSI[X] hardware is standardized and uniform, but
> it violates the basic design principle of hierarchical interrupt domains:
> Each hardware block involved in the interrupt delivery chain should have a
> separate interrupt domain.
> 
> For PCI/MSI[X], the interrupt controller is per PCI device and not a global
> made-up entity.
> 
> Unsurprisingly, the shortcut turned out to have downsides as it does not
> allow dynamic allocation of interrupt vectors after initialization and it
> prevents supporting IMS on PCI. For further details, see:
> 
> https://lore.kernel.org/lkml/20221111120501.026511281@linutronix.de/
> 
> The solution is implementing per device MSI domains, this means the
> entities which provide global PCI/MSI domain so far have to implement MSI
> parent domain functionality instead.
> 
> This series converts the PCI controller drivers to implement MSI parent
> domain.
> 
>  drivers/pci/Kconfig                           |   1 +
>  drivers/pci/controller/Kconfig                |  11 +
>  drivers/pci/controller/dwc/Kconfig            |   1 +
>  .../pci/controller/dwc/pcie-designware-host.c |  68 ++----
>  drivers/pci/controller/dwc/pcie-designware.h  |   1 -
>  drivers/pci/controller/mobiveil/Kconfig       |   1 +
>  .../controller/mobiveil/pcie-mobiveil-host.c  |  42 ++--
>  .../pci/controller/mobiveil/pcie-mobiveil.h   |   1 -
>  drivers/pci/controller/pci-aardvark.c         |  59 ++---
>  drivers/pci/controller/pci-hyperv.c           |  98 ++++++--
>  drivers/pci/controller/pcie-altera-msi.c      |  44 ++--
>  drivers/pci/controller/pcie-brcmstb.c         |  44 ++--
>  drivers/pci/controller/pcie-iproc-msi.c       |  45 ++--
>  drivers/pci/controller/pcie-mediatek-gen3.c   |  67 ++---
>  drivers/pci/controller/pcie-mediatek.c        |  46 ++--
>  drivers/pci/controller/pcie-rcar-host.c       |  69 ++----
>  drivers/pci/controller/pcie-xilinx-dma-pl.c   |  48 ++--
>  drivers/pci/controller/pcie-xilinx-nwl.c      |  45 ++--
>  drivers/pci/controller/pcie-xilinx.c          |  55 +++--
>  drivers/pci/controller/plda/Kconfig           |   1 +
>  drivers/pci/controller/plda/pcie-plda-host.c  |  44 ++--
>  drivers/pci/controller/plda/pcie-plda.h       |   1 -
>  drivers/pci/controller/vmd.c                  | 229 +++++++++---------
>  23 files changed, 504 insertions(+), 517 deletions(-)

Looks good to me, thanks!  I think Mani will probably pick this up.

I might have included the specific "legacy MSI domain" thing you're
replacing.  It looks like you're replacing pci_msi_create_irq_domain()
with msi_create_parent_irq_domain()?

Minor merge conflict in pcie-mediatek-gen3.c with dcbea1c7e94e ("PCI:
mediatek-gen3: Use dev_fwnode() for irq_domain_create_linear()").  No
problem, we can easily fix that up.

The "++i" in vmd.c stuck out to me since "i++" is so much more common.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

