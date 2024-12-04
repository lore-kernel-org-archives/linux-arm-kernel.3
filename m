Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622DEE77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 12:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p/NI8xv4o2PmOT2egqu8E2JFZUJ2qGO/Hs/aA41EO3k=; b=14TO19Gi/9qR6THHhmjyBrOFiw
	+TN+ZMH0mbivuV7yKL6CQgfP2Q1pl+wfT50ahX/kILQddvunSVDCa+d9Aa6yCXYf45XzEzHxQtnuH
	DBD0RD7VjFGHNk5yDZsM597fTMTU6ZHWATt1bD0O3q/hFCqmsPuJtemwhgraQFADdS4Zkfqbq/+Pg
	9hxYHZxhFJvnlTV+XLr9xx7yWHk6wFt0T1W7usHZMvXr1D7+qCuXZFoWdjjUYW5x7PQzKEwqR+/1r
	rUVtCWA8tXnDAoyYqJNmm/cIh60Z+lphLlJbenK7V6Z+cV/2pDUNwOtZZroIqexCvsKEXODiwaCB6
	qNQkwVXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoxK-0000000Cat4-3ujn;
	Wed, 04 Dec 2024 12:58:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIolc-0000000CYQq-1LT4;
	Wed, 04 Dec 2024 12:46:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C6FED5C6DD1;
	Wed,  4 Dec 2024 12:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2D0C4CED1;
	Wed,  4 Dec 2024 12:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733316366;
	bh=xt/nQ0fMl4BE9wyAZGDEWgJqfiwSZTSn1H5GdAPYx5w=;
	h=From:To:Cc:Subject:Date:From;
	b=Ac7bzQ0NlfNVQ9RPakQNy4Wq+/fKpSKjYRjEilF3HUi2uXKu0zTgYXJ2v7q2XTY9j
	 uhFfVogeCJ9xAeYqDqI3gNew/5iD8vqEXIqgshwajskT9F/b2wFYbdvwp0GZQYHBxZ
	 VVmSgZOdzMsChnYnwG8yoNmN1yPvGMYyQ71yQNDleKGrbRT+s7pPakya+Yi7BX5I41
	 u4jNxdxjbby+svDoJHna48Mjq7WAPTq8UpS7tj9lNtD4El+5DUILI1cYiK3vrMiw68
	 7CI5Bma1/sB4Epsd20169yWiO7gGzoKSIcJLu5n0oKSDkUyKX+gGhvPZ/YjvjIj1gT
	 iMrXZFMz+bluQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIolX-000RHy-Mj;
	Wed, 04 Dec 2024 12:46:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Toan Le <toan@os.amperecomputing.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH 00/11] irqchip: MSI parent cleanup and PCI host driver conversion
Date: Wed,  4 Dec 2024 12:45:38 +0000
Message-Id: <20241204124549.607054-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org, joro@8bytes.org, suravee.suthikulpanit@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com, tglx@linutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name, jiaxun.yang@flygoat.com, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com, toan@os.amperecomputing.com, alyssa@rosenzweig.io
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_044608_443603_F6630B0E 
X-CRM114-Status: GOOD (  14.93  )
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

I've become annoyed by the couple of machines I have around that
haven't been converted to the per-device MSI infrastructure.  At the
same time, I've also moaned at the amount of boilerplate code required
to make use of this infrastructure.

This series therefore does a number of things:

- make irq-msi-lib.h globally available, so that PCI (and other
  subsystems) may make use of it

- add a new helper (msi_create_parent_irq_domain()) that encapsulates
  most of the magic required to create an MSI-parent domain

- convert all the existing users *except* arch/x86/kernel/apic/msi.c,
  which is far too esoteric for me to touch it

- convert the Apple and XGene MSI drivers to the MSI-parent
  infrastructure, which is why I came here the first place.

I've only tested the arm64 stuff I have access to (or care about), and
I would appreciate the respective maintainers/users of the other
drivers to give it a go, or at least a cursory look.

Patches on top of 6.13-rc1.

Marc Zyngier (11):
  irqchip: Make irq-msi-lib.h globally available
  genirq/msi: Add helper for creating MSI-parent irq domains
  irqchip/gic: Convert to msi_create_parent_irq_domain() helper
  irqchip/mvebu: Convert to msi_create_parent_irq_domain() helper
  irqchip/riscv-imsic: Convert to msi_create_parent_irq_domain() helper
  irqchip/imx-mu-msi: Convert to msi_create_parent_irq_domain() helper
  irqchip/loongson-pch-msi: Convert to msi_create_parent_irq_domain()
    helper
  iommu/amd: Convert to msi_create_parent_irq_domain() helper
  iommu/intel: Convert to msi_create_parent_irq_domain() helper
  PCI: apple: Convert to MSI parent infrastructure
  PCI: xgene: Convert to MSI parent infrastructure

 drivers/iommu/amd/iommu.c                     | 12 ++--
 drivers/iommu/intel/irq_remapping.c           | 16 ++----
 drivers/irqchip/irq-gic-v2m.c                 | 11 ++--
 drivers/irqchip/irq-gic-v3-its-msi-parent.c   |  2 +-
 drivers/irqchip/irq-gic-v3-its.c              | 16 ++----
 drivers/irqchip/irq-gic-v3-mbi.c              | 11 ++--
 drivers/irqchip/irq-imx-mu-msi.c              | 10 ++--
 drivers/irqchip/irq-loongarch-avec.c          |  2 +-
 drivers/irqchip/irq-loongson-pch-msi.c        | 15 ++---
 drivers/irqchip/irq-msi-lib.c                 |  2 +-
 drivers/irqchip/irq-mvebu-gicp.c              | 14 ++---
 drivers/irqchip/irq-mvebu-icu.c               |  2 +-
 drivers/irqchip/irq-mvebu-odmi.c              | 15 ++---
 drivers/irqchip/irq-mvebu-sei.c               | 16 ++----
 drivers/irqchip/irq-riscv-imsic-platform.c    | 11 ++--
 drivers/pci/controller/Kconfig                |  2 +
 drivers/pci/controller/pci-xgene-msi.c        | 44 +++++---------
 drivers/pci/controller/pcie-apple.c           | 57 ++++++-------------
 .../linux}/irqchip/irq-msi-lib.h              |  6 +-
 include/linux/msi.h                           |  7 +++
 kernel/irq/msi.c                              | 40 +++++++++++++
 21 files changed, 146 insertions(+), 165 deletions(-)
 rename {drivers => include/linux}/irqchip/irq-msi-lib.h (84%)

-- 
2.39.2


