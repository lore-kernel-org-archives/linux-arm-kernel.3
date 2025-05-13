Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084A4C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 17:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H35r/a/MLKOIN4SaNQFhhNoPi/VRIQdTt0sVVBLG2TE=; b=yQGBb6i0Ja54Pz
	43BY9QwcVV35PUzkhNAQsJSKdsvzsMjwY4oMeUH4WXwxeO9g5rJJcgtEf+wibCpcaLrObqaHTFB53
	cjINYXNeLhmeNW7hUupesYx4v+dUGTWNNEz1g2cLiuHk1cf30rO7oMO1qYWKs55wIg25vA2z8Wcpt
	7lyg6vj8+AvrY9FnM9gqsbqKIFQ3Wq/VQpsyaWiMMeNex95Gg5x+eG7BLxomBnP2LbjHbZYxFVW+e
	oezikvxto7O5OjH4LVwN0DImRvWvEdbuBeoiCmi4z6zWY6qGC9zYGe23qHGhjjN6Yb/DSZSeflXk/
	suUC923X/MF52nduztPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtqv-0000000DAum-43QD;
	Tue, 13 May 2025 17:55:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtjw-0000000D8zD-08Mt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:48:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E17D61156;
	Tue, 13 May 2025 17:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3298EC4CEE4;
	Tue, 13 May 2025 17:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158506;
	bh=KCfVrXdf4OfEkcBnxFVlnMqXF4j1TxdUVc3t+4kDFkY=;
	h=From:Subject:Date:To:Cc:From;
	b=F3ndhZtlJ1YJCLKsx1Ie35HzbawaXUdz6KOGDBokKRCZ7NFzw/HVP0OrWBSa7DlWR
	 yAx3b57960bevAV8BXTfGE6xEB5zjSruCx2ay1HI8GM/ssRy6RG1OTMGThTMivCdX2
	 TMUoqosyl3RNonxGig/R3ZMVdXmidA/YGTWjwv7evuXQzohIHEbp+gsJ9YNZaFdvQ2
	 /Z0jaHsEp4GiNNC9hiKtGHeYZpxEYGYX9oSf4zCCMFHpzUBOHLCZYrkrKbMQUAeauo
	 55nVuULfokGhzybP3Ba/YZdef4SjQIVePTtWs/wgtcSgXsfdt3Nxl6obv7jFeuCYeh
	 /0Pdn4t4c8I3Q==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v4 00/26] Arm GICv5: Host driver implementation
Date: Tue, 13 May 2025 19:47:53 +0200
Message-Id: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMqFI2gC/23QQQ6CMBAF0KuYrq1ph7aCK+9hXACdQqOh2mKjI
 dzdgiZKdPkneT/5M5CA3mIgu9VAPEYbrOtSEOsVqduya5BanTIBBpIJltPG1lHS1oWebkVhMq5
 Kg7kgCVw8Gnufyw7HlFsbeucfc3fk0/VvTeSUUW5A6UooaXK9P6Hv8LxxviFTT4QvC2JhIVkpJ
 Oq6NIxD9WOzj5VMLWyWrEKtZVmA0axY2PE1yOP1lp7Sv1eN4xPZz6CJMgEAAA==
X-Change-ID: 20250408-gicv5-host-749f316afe84
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
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

Implement the irqchip kernel driver for the Arm GICv5 architecture,
as described in the GICv5 beta0 specification, available at:

https://developer.arm.com/documentation/aes0070

The GICv5 architecture is composed of multiple components:

- one or more IRS (Interrupt Routing Service)
- zero or more ITS (Interrupt Translation Service)
- zero or more IWB (Interrupt Wire Bridge)

The GICv5 host kernel driver is organized into units corresponding
to GICv5 components.

The GICv5 architecture defines the following interrupt types:

- PPI (PE-Private Peripheral Interrupt)
- SPI (Shared Peripheral Interrupt)
- LPI (Logical Peripheral Interrupt)

This series adds sysreg entries required to automatically generate
GICv5 registers handling code, one patch per-register.

This patch series is split into patches matching *logical* entities,
to make the review easier.

Logical entities:

- PPI
- IRS/SPI
- LPI/IPI
- SMP enablement
- ITS

The salient points of the driver are summarized below.

=============
1. Testing
=============

Patchset tested with an architecturally compliant FVP model with
the following setup:

- 1 IRS
- 1 and 2 ITSes
- 1 and 2 IWBs

configured with different parameters that vary the IRS(IST) and
ITS(DT/ITT) table levels and INTID/DEVICEID/EVENTID bits.

A Trusted-Firmware (TF-A) prototype was used for device tree
bindings and component initializations.

================
2. Driver design
================

=====================
2.1 GICv5 DT bindings
=====================

The DT bindings attempt to map directly to the GICv5 component
hierarchy, with a top level node corresponding to the GICv5 "system",
having IRS child nodes, that have in turn ITS child nodes.

The IWB is defined in a separate schema; its relationship with the ITS
is explicit through the msi-parent property required to define the IWB
deviceID.

===================
2.2 GICv5 top level
===================

The top-level GICv5 irqchip driver implements separate IRQ
domains - one for each interrupt type, PPI (PE-Private Peripheral
Interrupt), SPI (Shared Peripheral Interrupt) and LPI (Logical
Peripheral Interrupt).

The top-level exception handler routes the IRQ to the relevant IRQ
domain for handling according to the interrupt type detected when the
IRQ is acknowledged.

All IRQs are set to the same priority value.

The driver assumes that the GICv5 components implement enough
physical address bits to address the full system RAM, as required
by the architecture; it does not check whether the physical address
ranges of memory allocated for IRS/ITS tables are within the GICv5
physical address range.

Components are probed by relying on the early DT irqchip probing
scheme. The probing is carried out hierarchically, starting from
the top level.

The IWB driver has been reworked to match an MBIgen like interface,
that is now being fixed, code fixing it was taken from this branch,
driver was rebased on top of it:

git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/msi-prepare-teardown

=============
2.3 GICv5 IRS
=============

The GICv5 IRS driver probes and manages SPI interrupts by detecting their
presence and by providing the top-level driver the information required
to set up the SPI interrupt domain.

The GICv5 IRS driver also parses from firmware Interrupt AFFinity ID
(IAFFID) IDs identifying cores and sets up IRS IRQ routing.

The GICv5 IRS driver allocates memory to handle the IRS tables.

The IRS LPI interrupts state is kept in an Interrupt State Table (IST)
and it is managed through CPU instructions.

The IRS driver allocates the IST table that, depending on available HW
features can be either 1- or 2-level.

If the IST is 2-level, memory for the level-2 table entries
is allocated on demand (ie when LPIs are requested), using an IRS
mechanism to make level-1 entry valid on demand after the IST
has already been enabled.

Chunks of memory allocated for IST entries can be smaller or larger than
PAGE_SIZE and are required to be physically contiguous within an IST level
(i.e. a linear IST is a single memory block, a 2-level IST is made up of a
block of memory for the L1 table, whose entries point at different L2 tables
that are in turn allocated as memory chunks).

LPI INTIDs are allocated in software using an IDA. IDA does not support
allocating ranges, which is a bit cumbersome because this forces us
to allocate IDs one by one where the LPIs could actually be allocated
in chunks.

An IDA was chosen because basically it is a dynamic bitmap, which
carries out memory allocation automatically.

Other drivers/subsystems made different choices to allocate ranges,
an IDA was chosen since it is part of the core kernel and an IDA
range API is in the making.

IPIs are implemented using LPIs and a hierarchical domain is created
specifically for IPIs using the LPI domain as a parent.

arm64 IPI management core code is augmented with a new API to handle
IPIs that are not per-cpu interrupts and force the affinity of the LPI
backing an IPI to a specific and immutable value.

=============
2.4 GICv5 ITS
=============

The ITS driver reuses the existing GICv3/v4 MSI-parent infrastructure
and on top builds an IRQ domain needed to enable message based IRQs.

ITS tables - DT (device table) and ITT (Interrupt Translation Table) are
allocated according to the number of required deviceIDs and eventIDs on
a per device basis. The ITS driver relies on the kmalloc() interface
because memory pages must be physically contiguous within a table level
and can be < or > than PAGE_SIZE.

=============
2.5 GICv5 IWB
=============

The IWB driver has been reworked to match an MBIgen like interface,
that is now being fixed, code fixing it was taken from this branch,
driver was rebased on top of it:

git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/msi-prepare-teardown

===================
3. Acknowledgements
===================

The patchset was co-developed with T.Hayes and S.Bischoff from
Arm - thank you so much for your help.

A big thank you to M.Zyngier for his fundamental help/advice.

If you have some time to help us review this series and get it into
shape, thank you very much.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
Changes in v4:
- Added IWB new driver version based on MBIgen interface
- Added MSI alloc flag
- Rebased against git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/msi-prepare-teardown
- Made more coding style updates to comply with tip-maintainer
  guidelines
- Updated PPI type handling
- Updated devicetree bindings
- Fixed includecheck warning
- Link to v3: https://lore.kernel.org/r/20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org

Changes in v3:
- Reintroduced v1 patch split to simplify review
- Reworked IRS/ITS iopoll loop, split in atomic/non-atomic
- Cleaned-up IRS/ITS code with macros addressing review comments
- Dropped IWB driver waiting for IRQ core code to be fixed for DOMAIN_BUS_WIRED_TO_MSI
  https://lore.kernel.org/lkml/87tt6310hu.wl-maz@kernel.org/
- Moved headers to arch/arm64 and include/linux/irqchip
- Reworked GSB barriers definition
- Added extensive GSB/ISB barriers comments
- Limited error checking on IRS/ITS code - introduced couple of fatal
  BUG_ON checks
- Link to v2: https://lore.kernel.org/r/20250424-gicv5-host-v2-0-545edcaf012b@kernel.org

Changes in v2:
- Squashed patches [18-21] into a single logical entity
- Replaced maple tree with IDA for LPI IDs allocation
- Changed coding style to tip-maintainer guidelines
- Tried to consolidate poll wait mechanism into fewer functions
- Added comments related to _relaxed accessors, barriers and kmalloc
  limitations
- Removed IPI affinity check hotplug callback
- Applied DT schema changes requested, moved IWB into a separate schema
- Fixed DT examples
- Fixed guard() usage
- Link to v1: https://lore.kernel.org/r/20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org

---
Lorenzo Pieralisi (25):
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
      irqchip/gic-v5: Add GICv5 ITS support
      irqchip/gic-v5: Add GICv5 IWB support
      arm64: Kconfig: Enable GICv5

Marc Zyngier (1):
      arm64: smp: Support non-SGIs for IPIs

 .../interrupt-controller/arm,gic-v5-iwb.yaml       |   78 ++
 .../bindings/interrupt-controller/arm,gic-v5.yaml  |  202 ++++
 MAINTAINERS                                        |   10 +
 arch/arm64/Kconfig                                 |    1 +
 arch/arm64/include/asm/barrier.h                   |    3 +
 arch/arm64/include/asm/el2_setup.h                 |   45 +
 arch/arm64/include/asm/smp.h                       |   24 +-
 arch/arm64/include/asm/sysreg.h                    |   71 +-
 arch/arm64/kernel/cpufeature.c                     |   17 +-
 arch/arm64/kernel/smp.c                            |  156 ++-
 arch/arm64/tools/cpucaps                           |    3 +-
 arch/arm64/tools/sysreg                            |  495 +++++++-
 drivers/irqchip/Kconfig                            |   12 +
 drivers/irqchip/Makefile                           |    5 +-
 drivers/irqchip/irq-gic-common.h                   |    2 -
 ...3-its-msi-parent.c => irq-gic-its-msi-parent.c} |    3 +-
 drivers/irqchip/irq-gic-its-msi-parent.h           |   13 +
 drivers/irqchip/irq-gic-v3-its.c                   |    3 +-
 drivers/irqchip/irq-gic-v5-irs.c                   |  818 +++++++++++++
 drivers/irqchip/irq-gic-v5-its.c                   | 1205 ++++++++++++++++++++
 drivers/irqchip/irq-gic-v5-iwb.c                   |  285 +++++
 drivers/irqchip/irq-gic-v5.c                       | 1076 +++++++++++++++++
 drivers/irqchip/irq-gic.c                          |    2 +-
 include/asm-generic/msi.h                          |    1 +
 include/linux/irqchip/arm-gic-v5.h                 |  396 +++++++
 25 files changed, 4857 insertions(+), 69 deletions(-)
---
base-commit: 7c651847bdce43bd9fdfc4311ccbe271c06968ed
change-id: 20250408-gicv5-host-749f316afe84

Best regards,
-- 
Lorenzo Pieralisi <lpieralisi@kernel.org>


