Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424FCC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cevL/+9LupPnvd4Ub2fYO4b+8k5nrz+MqxehWljwZAw=; b=HHNE0h2IUTKh0enr1H/zPfgp0d
	O6VJkdITnm/U2K24xWdmXi39hMj6BKZdWZiWA9F6W7KzViHT45+SLQCg7sbX3E+U/UQQonkx4KPrr
	ZkJOUv5gJPoWTMx1CoWnnr9kJn8dYokIyEzxZ2bUiBa6QYVFumHEbsWKTbejZ7eTYzE8QuVY1Ljm8
	uW5v0j0fOKzboqiSnFzFcZw5v79chv1ytbIdB9ngN5+ewtn7d4vAFQEtJHFsBim4pcEvUmj2zYO2+
	fkC2+DC8+S39TuOYhwHKR/wn1+T0/908n4kaiWzuOGE/2mHaHDI5gjsH+/UfQpDwEOE0XBCdH99Cn
	1GT9TIzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhCf-00000001qwb-31ka;
	Mon, 07 Jul 2025 08:27:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgWM-00000001jNM-0ysk;
	Mon, 07 Jul 2025 07:44:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B02835C59A6;
	Mon,  7 Jul 2025 07:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05302C4CEE3;
	Mon,  7 Jul 2025 07:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751874253;
	bh=/jD354R592s4zJMZWD0+ePhWTUfRC108q7YO8NMu23U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQwE1vX/yXNQiTs0tbmqSybnQiotd/y2C054/icFvOPoTd/5CYEyCj/rNejwoLLg8
	 Wo7F3vCp2rjnfLbqI5rlb2kmjuOp1AZK+41hek1e/EokISgDLMYScJ1e8dY8dL6SF6
	 qHa42qLz8g1OahyZjW91CYPx2KTc83LjTClaojuVRIaaDOMCGD5w3FcNc+YZyenALM
	 XLO1gBN6b5LU/hLRqWOb/iyqOnOOhTDijfAuZbR8lQLgaFUZy3ZxUfN6klJ29K1XUe
	 B/Z7yJ1NABIxdnpYMxJ/0g05uE0aPdkmfB9rx71B6nuIS7Z2S0XZ0taQ+pTLBiwTD2
	 Em3J3a8sKeZ9w==
Date: Mon, 7 Jul 2025 13:13:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
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
Message-ID: <zkjevl46rosm276lirw5vzdhogeug4cpjnvhcgkcwzxm4s4rfj@gcxaexfotlsr>
References: <cover.1750858083.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1750858083.git.namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_004414_351472_F01DA01F 
X-CRM114-Status: GOOD (  16.30  )
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

On Thu, Jun 26, 2025 at 04:47:50PM GMT, Nam Cao wrote:
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

Applied the series except patch 14/16 to pci/controller/msi-parent, thanks!

- Mani

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
> 
> -- 
> 2.39.5
> 

-- 
மணிவண்ணன் சதாசிவம்

