Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6E2C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 14:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rjC7u1O4n6Y4m8ek4mHKb90DC8/HUd+eWzj/alvKcAs=; b=grP2IGTEWb5EdToIvmhVU1JN8f
	LYExPcJ074BUL8iNmS2ayfwDjJ+KYwUguX8p1mgmZ3zPwqjNqcV0/iML+ji/nkuqDzPROFFlWd1Ms
	37FbCUVlGSR/TeP6+QQGG00PPBX6BCGB/uk+Ej9IWM4BS49auzC+CN2z1vBqFZvOkDORjv1zaFs/D
	nS/MA6nZ0HnaWNurni1u92WuWWFbDKVR3tBdVAurKb0xme+nChqj4hu4mOgHsjYi28eQrgb8EK0Uu
	vJFiLLKVdwxIyU+qjhvpb6DXlJ6whYIBf/yL9OoN5gBr/d2vhBQ9FCOEUzUuEWNHtPMcYsVWzZm6l
	1Hamq2jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnwX-0000000C0HA-1GcT;
	Thu, 26 Jun 2025 14:51:13 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnu0-0000000BzTU-2tML;
	Thu, 26 Jun 2025 14:48:38 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rjC7u1O4n6Y4m8ek4mHKb90DC8/HUd+eWzj/alvKcAs=;
	b=gaz8seoxSEVBxG9MHSd/AdwK73Yt7mu+jsV0LollTAaxssib7A4849xAQcipwOrC0G9Uo6
	tfcpM3NA0RSjqxu0umLrggdwkuZprE9ZwTlt2NmwRBzYiIZCm08nVH+UnkZ0EnbA6P62GY
	EMXRpjYh17PCc/lq+dgoXu5/F1jNr1dlYdgHPUeTsmGcnf9w4zD+DE7HpX4cEjGptshy/p
	w4PI4JWiylFe9B7TBc5EvKJT8Mtcd9gghG+JfYB2lLP/7I3Z8AFNN3FHXBd1vOClFpd9Jf
	R/pJjIJu3RZtZRM+rgdUOc/gAlcAwUivOqN82fssj7UtXrwKa2IhcAQj3EH/0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rjC7u1O4n6Y4m8ek4mHKb90DC8/HUd+eWzj/alvKcAs=;
	b=2Fd2QlwCInXViIVIZOCcuzIq4mcR7BYBUaVg4a+xf1NiSgmL30ly5tfX4sxMHPRjXMMy7w
	sdMGjflSZJvHVtAQ==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Joyce Ooi <joyce.ooi@intel.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
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
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 00/16] PCI: MSI parent domain conversion
Date: Thu, 26 Jun 2025 16:47:50 +0200
Message-Id: <cover.1750858083.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074836_867868_C80E4DBB 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
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

The initial implementation of PCI/MSI interrupt domains in the hierarchical
interrupt domain model used a shortcut by providing a global PCI/MSI
domain.

This works because the PCI/MSI[X] hardware is standardized and uniform, but
it violates the basic design principle of hierarchical interrupt domains:
Each hardware block involved in the interrupt delivery chain should have a
separate interrupt domain.

For PCI/MSI[X], the interrupt controller is per PCI device and not a global
made-up entity.

Unsurprisingly, the shortcut turned out to have downsides as it does not
allow dynamic allocation of interrupt vectors after initialization and it
prevents supporting IMS on PCI. For further details, see:

https://lore.kernel.org/lkml/20221111120501.026511281@linutronix.de/

The solution is implementing per device MSI domains, this means the
entities which provide global PCI/MSI domain so far have to implement MSI
parent domain functionality instead.

This series converts the PCI controller drivers to implement MSI parent
domain.

 drivers/pci/Kconfig                           |   1 +
 drivers/pci/controller/Kconfig                |  11 +
 drivers/pci/controller/dwc/Kconfig            |   1 +
 .../pci/controller/dwc/pcie-designware-host.c |  68 ++----
 drivers/pci/controller/dwc/pcie-designware.h  |   1 -
 drivers/pci/controller/mobiveil/Kconfig       |   1 +
 .../controller/mobiveil/pcie-mobiveil-host.c  |  42 ++--
 .../pci/controller/mobiveil/pcie-mobiveil.h   |   1 -
 drivers/pci/controller/pci-aardvark.c         |  59 ++---
 drivers/pci/controller/pci-hyperv.c           |  98 ++++++--
 drivers/pci/controller/pcie-altera-msi.c      |  44 ++--
 drivers/pci/controller/pcie-brcmstb.c         |  44 ++--
 drivers/pci/controller/pcie-iproc-msi.c       |  45 ++--
 drivers/pci/controller/pcie-mediatek-gen3.c   |  67 ++---
 drivers/pci/controller/pcie-mediatek.c        |  46 ++--
 drivers/pci/controller/pcie-rcar-host.c       |  69 ++----
 drivers/pci/controller/pcie-xilinx-dma-pl.c   |  48 ++--
 drivers/pci/controller/pcie-xilinx-nwl.c      |  45 ++--
 drivers/pci/controller/pcie-xilinx.c          |  55 +++--
 drivers/pci/controller/plda/Kconfig           |   1 +
 drivers/pci/controller/plda/pcie-plda-host.c  |  44 ++--
 drivers/pci/controller/plda/pcie-plda.h       |   1 -
 drivers/pci/controller/vmd.c                  | 229 +++++++++---------
 23 files changed, 504 insertions(+), 517 deletions(-)

--=20
2.39.5


