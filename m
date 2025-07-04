Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FF4C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 04:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bECOS5NYSuwI1Z2rPJn8KCgSIK08uaS2HV9/TPfF7qU=; b=WXq+7zINSciz9FFsup1VueOhTf
	WCvVqqQ9MKTsIih3SSUWViXzzEA3lKDGZnes/fK3RxMfqBKWu5M+Qg+NrAB+kJUVXqVfT8tRemFY4
	22WLWd7Rnuqe1Z/A4Uba7hFGKTMP3cR9diWMMZKBazGNrCgOBMeE+2P2Jq+Pj02wQZGKIciq+sNVt
	MLAybWwAIQ5e3tjyuNleIJOjdwcUHG0c8sxyCF/Z2uV0JQxmRlYD9ne0JJACXdNYpw3TZl2FYJZN8
	PoYIL+OGBGCE9SKcswI2Hzl/9tIAnjV4jC0tG6wv7v3Axg+D7aKaUwAdeHcwgKBCaSeO8aqf7HRRE
	EUEU37Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXYQY-0000000DGvL-2KUm;
	Fri, 04 Jul 2025 04:53:34 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXYLJ-0000000DGXz-2PlZ;
	Fri, 04 Jul 2025 04:48:11 +0000
Date: Fri, 4 Jul 2025 06:48:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751604488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bECOS5NYSuwI1Z2rPJn8KCgSIK08uaS2HV9/TPfF7qU=;
	b=H7TOs+Ges3ST3JaaZizNd5ma6LU2f7OHMOzRFZkRcC/EoJtnkp0/6c4g/TtJqqbKbJ/4KS
	QjVWOYJVlHQMm/eovn6G3n+y4dZ4vBwvZl2vuY3wAsGy2paB0Fjb1/29yEgsmrRG5cfIEG
	P+gMIFhZpLtX5JgrJZMEF4e5SjTnpjZtd7N+O47OyaRvwyaHxXwDA30rjX0ICURXquy+BE
	RDDcVO+gbUstA6UmN+VtxMcsnFGYDX0v/OKHEwpi/JF0/R3WnO/fH3wAsqS50sCwiIIguR
	KgKJjcZ+mF3nJBkc2ARbAUq9BLcoQuEqh9/6a2oGNdBS0DpteqfKIVSM0tGXZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751604488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bECOS5NYSuwI1Z2rPJn8KCgSIK08uaS2HV9/TPfF7qU=;
	b=erhRV6HukjrjeIx13k7VZwaaZcw+1YyWnPDZ+meuz0LMU8UgdnBEBWg1ifGsa4ZseUMMfD
	tnsVa8uPhZ61rqDQ==
From: Nam Cao <namcao@linutronix.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
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
Message-ID: <20250704044806.7wtcOlGB@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
 <20250703172801.GA1934994@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703172801.GA1934994@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_214809_768125_68B65F94 
X-CRM114-Status: GOOD (  22.18  )
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

On Thu, Jul 03, 2025 at 12:28:01PM -0500, Bjorn Helgaas wrote:
> On Thu, Jun 26, 2025 at 04:47:50PM +0200, Nam Cao wrote:
> > The initial implementation of PCI/MSI interrupt domains in the hierarchical
> > interrupt domain model used a shortcut by providing a global PCI/MSI
> > domain.
> > 
> > This works because the PCI/MSI[X] hardware is standardized and uniform, but
> > it violates the basic design principle of hierarchical interrupt domains:
> > Each hardware block involved in the interrupt delivery chain should have a
> > separate interrupt domain.
> > 
> > For PCI/MSI[X], the interrupt controller is per PCI device and not a global
> > made-up entity.
> > 
> > Unsurprisingly, the shortcut turned out to have downsides as it does not
> > allow dynamic allocation of interrupt vectors after initialization and it
> > prevents supporting IMS on PCI. For further details, see:
> > 
> > https://lore.kernel.org/lkml/20221111120501.026511281@linutronix.de/
> > 
> > The solution is implementing per device MSI domains, this means the
> > entities which provide global PCI/MSI domain so far have to implement MSI
> > parent domain functionality instead.
> > 
> > This series converts the PCI controller drivers to implement MSI parent
> > domain.
> > 
> >  drivers/pci/Kconfig                           |   1 +
> >  drivers/pci/controller/Kconfig                |  11 +
> >  drivers/pci/controller/dwc/Kconfig            |   1 +
> >  .../pci/controller/dwc/pcie-designware-host.c |  68 ++----
> >  drivers/pci/controller/dwc/pcie-designware.h  |   1 -
> >  drivers/pci/controller/mobiveil/Kconfig       |   1 +
> >  .../controller/mobiveil/pcie-mobiveil-host.c  |  42 ++--
> >  .../pci/controller/mobiveil/pcie-mobiveil.h   |   1 -
> >  drivers/pci/controller/pci-aardvark.c         |  59 ++---
> >  drivers/pci/controller/pci-hyperv.c           |  98 ++++++--
> >  drivers/pci/controller/pcie-altera-msi.c      |  44 ++--
> >  drivers/pci/controller/pcie-brcmstb.c         |  44 ++--
> >  drivers/pci/controller/pcie-iproc-msi.c       |  45 ++--
> >  drivers/pci/controller/pcie-mediatek-gen3.c   |  67 ++---
> >  drivers/pci/controller/pcie-mediatek.c        |  46 ++--
> >  drivers/pci/controller/pcie-rcar-host.c       |  69 ++----
> >  drivers/pci/controller/pcie-xilinx-dma-pl.c   |  48 ++--
> >  drivers/pci/controller/pcie-xilinx-nwl.c      |  45 ++--
> >  drivers/pci/controller/pcie-xilinx.c          |  55 +++--
> >  drivers/pci/controller/plda/Kconfig           |   1 +
> >  drivers/pci/controller/plda/pcie-plda-host.c  |  44 ++--
> >  drivers/pci/controller/plda/pcie-plda.h       |   1 -
> >  drivers/pci/controller/vmd.c                  | 229 +++++++++---------
> >  23 files changed, 504 insertions(+), 517 deletions(-)
> 
> Looks good to me, thanks!  I think Mani will probably pick this up.
> 
> I might have included the specific "legacy MSI domain" thing you're
> replacing.  It looks like you're replacing pci_msi_create_irq_domain()
> with msi_create_parent_irq_domain()?

Yes, pci_msi_create_irq_domain() is legacy. We will delete it once
everything is converted.

> Minor merge conflict in pcie-mediatek-gen3.c with dcbea1c7e94e ("PCI:
> mediatek-gen3: Use dev_fwnode() for irq_domain_create_linear()").  No
> problem, we can easily fix that up.

Thanks!

> The "++i" in vmd.c stuck out to me since "i++" is so much more common.

I always do "++i", maybe I'm the weird one..

Best regards,
Nam

