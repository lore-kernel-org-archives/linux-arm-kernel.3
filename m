Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51A9C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 10:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v+hKijmwE7TTIhAJfKIO0tn1pTv3NVc3PrH6mF8+ovw=; b=qN5QP9evpDQTjAXRYIzG1XZq2d
	v7Z8K87p0xExEJNoIr0bJ5z/nvfP903DI0EaU8KgKX5gq6ZScN+ThstZF2tSDaKm7iMYQ6xv7lvQX
	RMN3YXbGZWqgIFAsreHcucH2WZ7booaqVtJL80cIM+OfLtwOWjcBrfdU2KpFWBrgFSZ0LKDvSF1TO
	jfumeJ+WzM1dziBUUNGAnlazCt8pySAptCtzI+beobpSyYFS4P5JPeTfS/Dn0f+E/Vs9Wcg4wnQEg
	0REP6Fk5cRVwyJO+QI9il0N6pV85ENx5JYSEDgi49cc4wRv09/sY0EEsHo1wcT0m3bjOkJED4N9rE
	rNl4rBQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1Xt-00000005Rln-3P6z;
	Tue, 25 Mar 2025 10:30:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1UR-00000005QmY-1hR6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 10:26:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 602894368C;
	Tue, 25 Mar 2025 10:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8030CC4CEE4;
	Tue, 25 Mar 2025 10:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742898394;
	bh=6gx8a7ztb8u3B/u8fPofO/Tuvql7eBwSe4k9mBhaLjc=;
	h=From:To:Cc:Subject:Date:From;
	b=rr0YtK1PQzC4NSDXu0DSxFUvhd4oVsWJv62czkyG0iVVQ8VuGA5YnDFCqLi1twziZ
	 tPfNakYxPcjcAv2pzkmvMKPJ3+uKM0rs6mUcTdjghbkIV5PvB+jZqh3dqt4R8U86D1
	 lgnBd6zTLTnEjkj8Z3MXUI8Q1+lchlFLUaCzyhI1DZX25DGP7MBxEvChQPvaJXTrro
	 +hfoE95+lbABCqwmPeY5GCylveZ1xfjSNhSvBbbkCnvRQ/HewS5e+079aANhN7Rc+Z
	 2URIbNlp7x0rqzE4TIronOOBp9oB/osdXg08TPDB8BxZ4mxuS5/R/nLC+4N6vSZk5c
	 8+IBZkrVVwpuw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tx1UO-00GsRS-28;
	Tue, 25 Mar 2025 10:26:32 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v2 00/13] PCI: apple: Add support for t6020
Date: Tue, 25 Mar 2025 10:25:57 +0000
Message-Id: <20250325102610.2073863-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_032635_488442_C0788961 
X-CRM114-Status: GOOD (  15.01  )
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

As Alyssa didn't have the bandwidth to deal with this series, I have
taken it over. All bugs are therefore mine.

The initial series [1] stated:

"This series adds T6020 support to the Apple PCIe controller. Mostly
 Apple shuffled registers around (presumably to accommodate the larger
 configurations on those machines). So there's a bit of churn here but
 not too much in the way of functional changes."

The biggest change is affecting the ECAM layer, allowing an ECAM
driver to provide its own probe function instead of relying on the
.init() callback to do the work. The ECAM layer can therefore be used
as a library instead of a convoluted driver.

The rest is a mix of bug fixes, cleanups, and required abstraction.

This has been tested on T6020 (M2-Pro mini) and T8102 (M1 mini).

* From v1[1]:

  - Described the PHY registers in the DT binding

  - Extracted a ecam bridge creation helper from the host-common layer

  - Moved probing into its own function instead of pci_host_common_probe()
    
  - Moved host-specific data to the of_device_id[] table

  - Added dynamic allocation of the RID/SID bitmap

  - Fixed latent bug in RC-generated interrupts

  - Renamed reg_info to hw_info

  - Dropped useless max_msimap

  - Dropped code being moved around without justification

  - Re-split some of the patches to follow a more logical progression

  - General cleanup to fit my own taste

[1] https://lore.kernel.org/r/20250211-pcie-t6-v1-0-b60e6d2501bb@rosenzweig.io

Alyssa Rosenzweig (1):
  dt-bindings: pci: apple,pcie: Add t6020 compatible string

Hector Martin (6):
  PCI: apple: Fix missing OF node reference in apple_pcie_setup_port
  PCI: apple: Move port PHY registers to their own reg items
  PCI: apple: Drop poll for CORE_RC_PHYIF_STAT_REFCLK
  PCI: apple: Use gpiod_set_value_cansleep in probe flow
  PCI: apple: Abstract register offsets via a SoC-specific structure
  PCI: apple: Add T602x PCIe support

Janne Grunau (1):
  PCI: apple: Set only available ports up

Marc Zyngier (5):
  PCI: host-generic: Extract an ecam bridge creation helper from
    pci_host_common_probe()
  PCI: ecam: Allow cfg->priv to be pre-populated from the root port
    device
  PCI: apple: Move over to standalone probing
  PCI: apple: Dynamically allocate RID-to_SID bitmap
  PCI: apple: Move away from INTMSK{SET,CLR} for INTx and private
    interrupts

 .../devicetree/bindings/pci/apple,pcie.yaml   |  11 +-
 drivers/pci/controller/pci-host-common.c      |  24 +-
 drivers/pci/controller/pcie-apple.c           | 241 +++++++++++++-----
 drivers/pci/ecam.c                            |   2 +
 include/linux/pci-ecam.h                      |   2 +
 5 files changed, 204 insertions(+), 76 deletions(-)

-- 
2.39.2


