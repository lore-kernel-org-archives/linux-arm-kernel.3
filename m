Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5816C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 13:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y5arV8lX7IBukuH7OkTz0byecvokYysW8uQMKecd47Y=; b=P7lZXhba/ZiKoevS//hL4Q4ZYd
	w3/AAk9ymYwdm7bkX7oiTFiwRB3oxReypJFOpYKRBCglCIqNjQD6FFjXkYjIRnnd8asW8nc8V9YFa
	gfIKciU19zH3Im9hc+reLKGfWN/S7b2TGjzqCJ7qgWy321PJUkjQCuEvx6CCcugxZCH3Z97iZEy9/
	j/7YGXj8hdnQXbJVaeMHQ1cHszcCwPpZhUFqqLsv2pjw7oW6e+to8DHxlqAUlQCYCR9i6UVianf+y
	ft7Y0+sPFhzpbSo12DTNcBL4gsDf7OHBCe/eWmFLF+vH3cQrro9a83RwZkpMj3/teRcPF4aoMp73W
	r4f40IYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOia-0000000AGbw-29oI;
	Thu, 17 Jul 2025 13:32:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNdv-0000000A6Yh-3PP1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 12:23:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 051BB601F7;
	Thu, 17 Jul 2025 12:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3341C4CEE3;
	Thu, 17 Jul 2025 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752754998;
	bh=M53rRLCNKkngAVcTP3yYjTLxPORb3dP838zH8c0EAeo=;
	h=From:To:Cc:Subject:Date:From;
	b=KIvQ2uOKfGL0kJgBh6WZe8351GfcqhX+SDK0dvb5rejhE1JIRzdyY5E5Eay5nEDpk
	 CMz/b0BBTYI69yYDIisErqoi5pxj+SNE/oop0dmaw4WPhN2DqIExZl53iPs0t0m4zR
	 hCtuT7MnE5ql5Qe7ajFPG0M9d/OZvW1Pkm6S/o8YqhMYKfymjdzd9SBgtIXCCSkzrT
	 4gdtKdhPycjFBYtefrbcN1qgUrwKa78vw3Cme0CSfzQNO+y6ccAcP571k9DCg3RS/Y
	 iBsWkA2NLV3qtxyvRVXf7c7aGU/0lwBKSOi5/GXa6PLLg1OInhNi+Ta3xDUhp7+Jal
	 a/9l4sTg3Dyxw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ucNdr-00Gbkc-CY;
	Thu, 17 Jul 2025 13:23:15 +0100
From: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Breno Leitao <leitao@debian.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [GIT PULL] irqchip: Add GICv5 support
Date: Thu, 17 Jul 2025 13:23:06 +0100
Message-Id: <20250717122306.4043011-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: tglx@linutronix.de, leitao@debian.org, catalin.marinas@arm.com, conor+dt@kernel.org, Jonathan.Cameron@huawei.com, krzk+dt@kernel.org, lpieralisi@kernel.org, mark.rutland@arm.com, robh@kernel.org, sascha.bischoff@arm.com, timothy.hayes@arm.com, will@kernel.org, oliver.upton@linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
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

Thomas,

After some time simmering in -next without much catching fire (only a
single regression has been reported, which was promptly fixed), here's
the pull request for the GICv5 core infrastructure.

There are still a couple of patches on the list (mostly addressing
error paths, and actively being reviewed), but I don't see anything
that would warrant holding this any longer, and these fixes can be
added down the line. If anything, this work has allowed us to
pipe-clean a number of issues in the tree.

Please note that the kvmarm tree also carries this branch, as this is
a dependency for enabling GICv3 compatibility for guests on a GICv5
host.

Please pull,

	M.

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git tags/irqchip-gic-v5-host

for you to fetch changes up to 65a5520a27570787b17e6f0b093829fc7e0514e2:

  arm64: smp: Fix pNMI setup after GICv5 rework (2025-07-15 18:11:12 +0100)

----------------------------------------------------------------
GICv5 initial host support

Add host kernel support for the new arm64 GICv5 architecture, which is
quite a departure from the previous ones.

Include support for the full gamut of the architecture (interrupt
routing and delivery to CPUs, wired interrupts, MSIs, and interrupt
translation).

----------------------------------------------------------------
Lorenzo Pieralisi (30):
      dt-bindings: interrupt-controller: Add Arm GICv5
      arm64/sysreg: Add GCIE field to ID_AA64PFR2_EL1
      arm64/sysreg: Add ICC_PPI_PRIORITY<n>_EL1
      arm64/sysreg: Add ICC_ICSR_EL1
      arm64/sysreg: Add ICC_PPI_HMR<n>_EL1
      arm64/sysreg: Add ICC_PPI_ENABLER<n>_EL1
      arm64/sysreg: Add ICC_PPI_{C/S}ACTIVER<n>_EL1
      arm64/sysreg: Add ICC_PPI_{C/S}PENDR<n>_EL1
      arm64/sysreg: Add ICC_CR0_EL1
      arm64/sysreg: Add ICC_PCR_EL1
      arm64/sysreg: Add ICC_IDR0_EL1
      arm64/sysreg: Add ICH_HFGRTR_EL2
      arm64/sysreg: Add ICH_HFGWTR_EL2
      arm64/sysreg: Add ICH_HFGITR_EL2
      arm64: Disable GICv5 read/write/instruction traps
      arm64: cpucaps: Rename GICv3 CPU interface capability
      arm64: cpucaps: Add GICv5 CPU interface (GCIE) capability
      arm64: Add support for GICv5 GSB barriers
      irqchip/gic-v5: Add GICv5 PPI support
      irqchip/gic-v5: Add GICv5 IRS/SPI support
      irqchip/gic-v5: Add GICv5 LPI/IPI support
      irqchip/gic-v5: Enable GICv5 SMP booting
      of/irq: Add of_msi_xlate() helper function
      PCI/MSI: Add pci_msi_map_rid_ctlr_node() helper function
      irqchip/gic-v3: Rename GICv3 ITS MSI parent
      irqchip/msi-lib: Add IRQ_DOMAIN_FLAG_FWNODE_PARENT handling
      irqchip/gic-v5: Add GICv5 ITS support
      irqchip/gic-v5: Add GICv5 IWB support
      docs: arm64: gic-v5: Document booting requirements for GICv5
      arm64: Kconfig: Enable GICv5

Marc Zyngier (2):
      arm64: smp: Support non-SGIs for IPIs
      arm64: smp: Fix pNMI setup after GICv5 rework

 Documentation/arch/arm64/booting.rst               |   41 +
 .../interrupt-controller/arm,gic-v5-iwb.yaml       |   78 ++
 .../bindings/interrupt-controller/arm,gic-v5.yaml  |  267 +++++
 MAINTAINERS                                        |   10 +
 arch/arm64/Kconfig                                 |    1 +
 arch/arm64/include/asm/barrier.h                   |    3 +
 arch/arm64/include/asm/el2_setup.h                 |   45 +
 arch/arm64/include/asm/smp.h                       |   24 +-
 arch/arm64/include/asm/sysreg.h                    |   71 +-
 arch/arm64/kernel/cpufeature.c                     |   17 +-
 arch/arm64/kernel/smp.c                            |  142 ++-
 arch/arm64/tools/cpucaps                           |    3 +-
 arch/arm64/tools/sysreg                            |  495 +++++++-
 drivers/irqchip/Kconfig                            |   12 +
 drivers/irqchip/Makefile                           |    5 +-
 drivers/irqchip/irq-gic-common.h                   |    2 -
 ...3-its-msi-parent.c => irq-gic-its-msi-parent.c} |  168 ++-
 drivers/irqchip/irq-gic-its-msi-parent.h           |   12 +
 drivers/irqchip/irq-gic-v3-its.c                   |    1 +
 drivers/irqchip/irq-gic-v5-irs.c                   |  822 +++++++++++++
 drivers/irqchip/irq-gic-v5-its.c                   | 1228 ++++++++++++++++++++
 drivers/irqchip/irq-gic-v5-iwb.c                   |  284 +++++
 drivers/irqchip/irq-gic-v5.c                       | 1087 +++++++++++++++++
 drivers/irqchip/irq-gic.c                          |    2 +-
 drivers/irqchip/irq-msi-lib.c                      |    5 +-
 drivers/of/irq.c                                   |   22 +-
 drivers/pci/msi/irqdomain.c                        |   20 +
 include/asm-generic/msi.h                          |    1 +
 include/linux/irqchip/arm-gic-v5.h                 |  394 +++++++
 include/linux/irqdomain.h                          |    3 +
 include/linux/msi.h                                |    1 +
 include/linux/of_irq.h                             |    5 +
 32 files changed, 5199 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
 rename drivers/irqchip/{irq-gic-v3-its-msi-parent.c => irq-gic-its-msi-parent.c} (59%)
 create mode 100644 drivers/irqchip/irq-gic-its-msi-parent.h
 create mode 100644 drivers/irqchip/irq-gic-v5-irs.c
 create mode 100644 drivers/irqchip/irq-gic-v5-its.c
 create mode 100644 drivers/irqchip/irq-gic-v5-iwb.c
 create mode 100644 drivers/irqchip/irq-gic-v5.c
 create mode 100644 include/linux/irqchip/arm-gic-v5.h

