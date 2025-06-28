Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B446AC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 17:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wv90lVXE01aZG1IQChh3QUB3BEu6U6RJRBVMs8TgMQc=; b=J6btlB4ZGGO7VCvV4ZvkgUDask
	h3L/2uSrIRtXf/39EsVm+OWnNQhSzPeHkyZLrjfLs2hFuMp/d97VxcH/O0TGl1nYmx9DiA6ZxZpR5
	nXpyfblIzIKUi32qPACfkJioJkFzFc2tpIqdvqqdazVwDMzgGePwuvxadVowXFehTJ2RMwylXILvc
	bYlSAf8N9sMOAroXhD9MRUhLMtVNKvILi041DKBTL8ku7O+dybHaqAmB6woaVHcsDPwh5kgbns50Z
	DJeAg9LHlAW7iV7uHXT2LNKY8jxtbevuar94QbU0mHajnFVTFMs13ft6XkRb+livMEntVnhcJ1hHi
	/gx5GU5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZQA-0000000H8Ag-3b0z;
	Sat, 28 Jun 2025 17:32:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZNl-0000000H7Tc-0CUa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 17:30:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C85161458;
	Sat, 28 Jun 2025 17:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD10C4CEEF;
	Sat, 28 Jun 2025 17:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751131827;
	bh=7Tfu+k4kIYM3+mGdV3aDYku43jcInJ/3Gr78P/OtksU=;
	h=From:To:Cc:Subject:Date:From;
	b=GQVeRKAngXUahmHWE9Xnnvma9G05vv5+5TTjXXAHH62wBldayNswjO3l7MxkXUzqD
	 5rMkcnV2sPgyDNHZmRBGeSkZMDRT4smYyqAwzM4Sz1JtldMQCqF1jhi+QZcAPvzDF4
	 dAV19Cr9LUj1Rs3iOrP6GFf4X5hUes3jggleQ4H26iFMNMIRxsnqsx1ql+zBHrW+Q+
	 ynTlqQG0SN1NK1u9tfSGJv2GrI0kILeSAkiS3NGB0sjTfB8+H4eAqrugKRZitmTjTT
	 kyKonglJ0n0Mvk7Nf8H9lqHdSdwAFr3pJXOhRTOX7khAGJVLQqHOXRKiPmqpqJYu7+
	 MN9dW0YwLC7iw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uVZNh-00AqZC-En;
	Sat, 28 Jun 2025 18:30:25 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 00/12] PCI: xgene: Fix and simplify the MSI driver
Date: Sat, 28 Jun 2025 18:29:53 +0100
Message-Id: <20250628173005.445013-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, toan@os.amperecomputing.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Having recently dipped into the xgene-msi driver to bring it to use
the MSI-parent concept, I have realised that some of it was slightly
sub-par (read: downright broken).

The driver is playing horrible tricks behind the core code, missing
proper affinity management, is terribly over-designed for no good
reason, and despite what MAINTAINERS says, completely unmaintained.

This series is an attempt to fix most of the issues, and effectively
results more or less in a full rewrite of the driver, removing a lot
of cruft and fixing the interactions with the PCI host driver in the
process (there really isn't any reason to rely on initcall ordering
anymore).

I've stopped short of repainting the MAINTAINERS file, but given how
reactive Toan Le has been, maybe that's on the cards. Patches on top
of -rc3, tested on a Mustang board.

Marc Zyngier (12):
  genirq: Teach handle_simple_irq() to resend an in-progress interrupt
  PCI: xgene: Defer probing if the MSI widget driver hasn't probed yet
  PCI: xgene: Drop useless conditional compilation
  PCI: xgene: Drop XGENE_PCIE_IP_VER_UNKN
  PCI: xgene-msi: Make per-CPU interrupt setup robust
  PCI: xgene-msi: Drop superfluous fields from xgene_msi structure
  PCI: xgene-msi: Use device-managed memory allocations
  PCI: xgene-msi: Get rid of intermediate tracking structure
  PCI: xgene-msi: Sanitise MSI allocation and affinity setting
  PCI: xgene-msi: Resend an MSI racing with itself on a different CPU
  PCI: xgene-msi: Probe as a standard platform driver
  PCI: xgene-msi: Restructure handler setup/teardown

 drivers/pci/controller/pci-xgene-msi.c | 418 +++++++++----------------
 drivers/pci/controller/pci-xgene.c     |  33 +-
 kernel/irq/chip.c                      |   8 +-
 3 files changed, 176 insertions(+), 283 deletions(-)

-- 
2.39.2


