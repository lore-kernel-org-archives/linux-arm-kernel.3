Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80FEC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 17:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5DAo35WTOun/7XMEPNo0eyLfq4tAc1rTiII5jVh38Hw=; b=VFJdIISet/t5fpLnmcfYtX4wwi
	MmugQ7eQMsIQLSxMi1xdIjGApBwQ1aCTR0QzhcPY6yv1Mfn+WlNaQqGIuxpFtEdEx8qMjaQ+5oqpN
	Al5JoYuTx8aCLvwq1ykNVLP8k9J3TLyMtSXocn/WyWT85HiAxLIvsBrNG6VRYw741vLdUhpijztHG
	O92yJQFPUFoML795uULXhDnJb5RBUhjtLduw5jMVZlLVNNUT3AQV3nbwEs3piSb1YAnQjq64FGBfR
	4unTzBZyOo57cfJPepOjHDIlL+uipMsCqzNR1a7hDNKf/rY2vt07W9A/MhPkXg714rEjiFbfQGVoW
	sDCSxPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtcN-0000000D7e5-2ztL;
	Tue, 13 May 2025 17:40:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtQd-0000000D5cA-1Lg0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:28:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 56E60A4032E;
	Tue, 13 May 2025 17:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CF0C4CEE4;
	Tue, 13 May 2025 17:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747157310;
	bh=hzuO87JdBmymswNxonEC6nbrBc0MKykTjXnKUUy51wU=;
	h=From:To:Cc:Subject:Date:From;
	b=CxmIkhrrzIanydOQkOVr339gNDRjirbo0ae6JNHeShS3ieQNlEiqBfbr+dCu3tdGb
	 35Y5GX9j0yq1T1OUblyUVXZ1X7EOeUGMnpnZ4nEGZ5yp255OqRDivX32045jI/pV8p
	 ub/0fqDM1MWYYSF7+PfzuPGqxhXlNWkCm3a3XAxzJzlYEUfH9aFnXtWakaVg6r+K5O
	 d3llmzL43BJsPNNvujxMlVHXwLK/HvlLGUMCMmbR2beSb7VtkhJ7Z6ELSzAZxyp3pS
	 pBVNxUDZNfTRdSxm3LGg7k904c1w2FeuPpcjEGsxDWxiaJx6ulSEX7P5Oz1QRv7X+c
	 wdo6CbXjDQxOw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEtQZ-00EbRz-Qu;
	Tue, 13 May 2025 18:28:27 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Toan Le <toan@os.amperecomputing.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 0/9] irqchip: MSI parent cleanup and PCI host driver conversion
Date: Tue, 13 May 2025 18:28:10 +0100
Message-Id: <20250513172819.2216709-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, tglx@linutronix.de, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com, toan@os.amperecomputing.com, alyssa@rosenzweig.io, thierry.reding@gmail.com, jonathanh@nvidia.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_102831_492943_DA4E00AB 
X-CRM114-Status: GOOD (  17.22  )
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

This is v2 of a series I posted[1] a few months back before running
out of time, energy, and interest. I have now reduced it to the stuff
I actually care about, and got rid of all things non-arm64.

I've become annoyed by the couple of machines I have around that
haven't been converted to the per-device MSI infrastructure.  At the
same time, I've also moaned at the amount of boilerplate code required
to make use of this infrastructure.

This series therefore does a number of things:

- make irq-msi-lib.h globally available, so that PCI (and other
  subsystems) may make use of it

- add a new helper (msi_create_parent_irq_domain()) that encapsulates
  most of the magic required to create an MSI-parent domain

- convert the arm64 I have access to (and *only* that)

- convert the Apple, XGene and Tegra MSI drivers to the MSI-parent
  infrastructure, which is why I came here the first place.

* From v1 [1]:

  - use irq_domain_info as an the holder of most information required
    to instantiate the domain. I decided against using a specific
    structure, because they would mostly have the same fields.

  - added a patch to convert the Tegra driver, which required dealing
    with the MSI_FLAG_NO_AFFINITY flag

  - got rid of x86 and riscv patches (life is too short).

[1] https://lore.kernel.org/all/20241204124549.607054-1-maz@kernel.org

Marc Zyngier (9):
  irqchip: Make irq-msi-lib.h globally available
  genirq/msi: Add helper for creating MSI-parent irq domains
  irqchip/gic: Convert to msi_create_parent_irq_domain() helper
  irqchip/mvebu: Convert to msi_create_parent_irq_domain() helper
  irqchip: Drop MSI_CHIP_FLAG_SET_ACK from unsuspecting MSI drivers
  irqchip/msi-lib: Honour the MSI_FLAG_NO_AFFINITY flag
  PCI: apple: Convert to MSI parent infrastructure
  PCI: xgene: Convert to MSI parent infrastructure
  PCI: tegra: Convert to MSI parent infrastructure

 drivers/irqchip/irq-bcm2712-mip.c             |  2 +-
 drivers/irqchip/irq-gic-v2m.c                 | 16 ++---
 drivers/irqchip/irq-gic-v3-its-msi-parent.c   |  4 +-
 drivers/irqchip/irq-gic-v3-its.c              | 21 +++----
 drivers/irqchip/irq-gic-v3-mbi.c              | 15 ++---
 drivers/irqchip/irq-imx-mu-msi.c              |  2 +-
 drivers/irqchip/irq-loongarch-avec.c          |  2 +-
 drivers/irqchip/irq-loongson-pch-msi.c        |  2 +-
 drivers/irqchip/irq-msi-lib.c                 |  9 ++-
 drivers/irqchip/irq-mvebu-gicp.c              | 18 +++---
 drivers/irqchip/irq-mvebu-icu.c               |  2 +-
 drivers/irqchip/irq-mvebu-odmi.c              | 18 +++---
 drivers/irqchip/irq-mvebu-sei.c               | 18 +++---
 drivers/irqchip/irq-riscv-imsic-platform.c    |  2 +-
 drivers/irqchip/irq-sg2042-msi.c              |  2 +-
 drivers/pci/controller/Kconfig                |  3 +
 drivers/pci/controller/pci-tegra.c            | 60 ++++++------------
 drivers/pci/controller/pci-xgene-msi.c        | 46 +++++---------
 drivers/pci/controller/pcie-apple.c           | 62 +++++++------------
 .../linux}/irqchip/irq-msi-lib.h              |  6 +-
 include/linux/msi.h                           |  4 ++
 kernel/irq/msi.c                              | 26 ++++++++
 22 files changed, 160 insertions(+), 180 deletions(-)
 rename {drivers => include/linux}/irqchip/irq-msi-lib.h (84%)

-- 
2.39.2


