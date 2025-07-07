Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB5EC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 06:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anF/Wj8fsyKklmHAUgWk6y5jxnKF7Qle5xkYzQ/yAiI=; b=MEPNJNmDCV/kpr2AdvLRARcmUb
	IM1ldkNOmr6Iwk1S47xINpmnM5LTzGZSzN1WUiqKU3z5ACWZ923sBzG6etIsbzCUhqWV0xmBK6bHL
	T6rmS8GTXoP43xgYcwfChTPO75xW9TYw1XZFIcMqJ0MPl7jD8vC5XkffP7GpRuoXeXkAw256aZaGa
	YV9vcgFNul4vjo3KXTstPCSVuCrJjdVtXeSu+7J++VyRdcBs0+rE7vRR6B/RqvarXR9Mo/XxurIem
	SA/zKa1xhrNEJ/rxbNmXDHCBuv4R0/er+X1PIt1LLlZvQ9O2BJeElsu9RjZO8s/Bufqd8mSpOzBRG
	jPgItWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfKF-00000001YGV-3nLV;
	Mon, 07 Jul 2025 06:27:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfDY-00000001XFW-2oRy;
	Mon, 07 Jul 2025 06:20:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7AEBA52A97;
	Mon,  7 Jul 2025 06:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EACC4CEE3;
	Mon,  7 Jul 2025 06:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751869243;
	bh=IJAq2PfQObnW6djmQ2Dn7nC/QiKTJAuTfPAiQ+HmqUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+QSi6mVE3+RjRIFYSr3Hg8Nz4FOiR65HQCzs89hgfLQp5zI5mS5pqQ+LBmW/lPaB
	 wlFGeFGAjxEzQt47UFAYMGyh/x1rEHYE9mxhxtod5uKBJ7Sdm3deCFEAFcBBUGk/Ti
	 kVl2yFB6eVRNxouJnOtBXZwB8E64GEMx96or66Os2jTNeMMZqVYQldoX2b2JqCKRtf
	 x2ntWAzxFhSPFundBgQWzekNuyzjlNlr9nFIx1cZZug/vvJ6yAlSTyvZ3kwwlduI60
	 IV3BlW6x4Zv1m5d+GZZjJR42JOmzSHlGu4X2wCEIstFcpNtOHlnncPDkDAfkEgLXR9
	 bs8y6hmZ97f+g==
Date: Mon, 7 Jul 2025 11:50:26 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Joyce Ooi <joyce.ooi@intel.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Michal Simek <michal.simek@amd.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/16] PCI: MSI parent domain conversion
Message-ID: <etrzv5627z5k4i2fbhkoqsmegukm7f6zbxunazipkokyctlfpd@epewaygdyxkq>
References: <cover.1750858083.git.namcao@linutronix.de>
 <20250703172801.GA1934994@bhelgaas>
 <20250704044806.7wtcOlGB@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704044806.7wtcOlGB@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_232044_831405_CE8ABBF5 
X-CRM114-Status: GOOD (  27.61  )
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

On Fri, Jul 04, 2025 at 06:48:06AM GMT, Nam Cao wrote:
> On Thu, Jul 03, 2025 at 12:28:01PM -0500, Bjorn Helgaas wrote:
> > On Thu, Jun 26, 2025 at 04:47:50PM +0200, Nam Cao wrote:
> > > The initial implementation of PCI/MSI interrupt domains in the hierarchical
> > > interrupt domain model used a shortcut by providing a global PCI/MSI
> > > domain.
> > > 
> > > This works because the PCI/MSI[X] hardware is standardized and uniform, but
> > > it violates the basic design principle of hierarchical interrupt domains:
> > > Each hardware block involved in the interrupt delivery chain should have a
> > > separate interrupt domain.
> > > 
> > > For PCI/MSI[X], the interrupt controller is per PCI device and not a global
> > > made-up entity.
> > > 
> > > Unsurprisingly, the shortcut turned out to have downsides as it does not
> > > allow dynamic allocation of interrupt vectors after initialization and it
> > > prevents supporting IMS on PCI. For further details, see:
> > > 
> > > https://lore.kernel.org/lkml/20221111120501.026511281@linutronix.de/
> > > 
> > > The solution is implementing per device MSI domains, this means the
> > > entities which provide global PCI/MSI domain so far have to implement MSI
> > > parent domain functionality instead.
> > > 
> > > This series converts the PCI controller drivers to implement MSI parent
> > > domain.
> > > 
> > >  drivers/pci/Kconfig                           |   1 +
> > >  drivers/pci/controller/Kconfig                |  11 +
> > >  drivers/pci/controller/dwc/Kconfig            |   1 +
> > >  .../pci/controller/dwc/pcie-designware-host.c |  68 ++----
> > >  drivers/pci/controller/dwc/pcie-designware.h  |   1 -
> > >  drivers/pci/controller/mobiveil/Kconfig       |   1 +
> > >  .../controller/mobiveil/pcie-mobiveil-host.c  |  42 ++--
> > >  .../pci/controller/mobiveil/pcie-mobiveil.h   |   1 -
> > >  drivers/pci/controller/pci-aardvark.c         |  59 ++---
> > >  drivers/pci/controller/pci-hyperv.c           |  98 ++++++--
> > >  drivers/pci/controller/pcie-altera-msi.c      |  44 ++--
> > >  drivers/pci/controller/pcie-brcmstb.c         |  44 ++--
> > >  drivers/pci/controller/pcie-iproc-msi.c       |  45 ++--
> > >  drivers/pci/controller/pcie-mediatek-gen3.c   |  67 ++---
> > >  drivers/pci/controller/pcie-mediatek.c        |  46 ++--
> > >  drivers/pci/controller/pcie-rcar-host.c       |  69 ++----
> > >  drivers/pci/controller/pcie-xilinx-dma-pl.c   |  48 ++--
> > >  drivers/pci/controller/pcie-xilinx-nwl.c      |  45 ++--
> > >  drivers/pci/controller/pcie-xilinx.c          |  55 +++--
> > >  drivers/pci/controller/plda/Kconfig           |   1 +
> > >  drivers/pci/controller/plda/pcie-plda-host.c  |  44 ++--
> > >  drivers/pci/controller/plda/pcie-plda.h       |   1 -
> > >  drivers/pci/controller/vmd.c                  | 229 +++++++++---------
> > >  23 files changed, 504 insertions(+), 517 deletions(-)
> > 
> > Looks good to me, thanks!  I think Mani will probably pick this up.
> > 
> > I might have included the specific "legacy MSI domain" thing you're
> > replacing.  It looks like you're replacing pci_msi_create_irq_domain()
> > with msi_create_parent_irq_domain()?
> 
> Yes, pci_msi_create_irq_domain() is legacy. We will delete it once
> everything is converted.
> 

I'll amend the commit message to include pci_msi_create_irq_domain().

> > Minor merge conflict in pcie-mediatek-gen3.c with dcbea1c7e94e ("PCI:
> > mediatek-gen3: Use dev_fwnode() for irq_domain_create_linear()").  No
> > problem, we can easily fix that up.
> 
> Thanks!
> 
> > The "++i" in vmd.c stuck out to me since "i++" is so much more common.
> 
> I always do "++i", maybe I'm the weird one..
> 

Just for the sake of uniformity, I'll do 's/++i/i++' while applying.

And based on the discussion on patch 14/16, I'll drop it to be applied through
netdev and apply the rest of the series through PCI tree.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

