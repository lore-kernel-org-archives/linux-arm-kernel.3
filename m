Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16970C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hK9epRclkcnf5GjF1ejd4wXsrP+ZXC59mWB8ZM9xvLs=; b=jmehgP82DJ9arx
	Tt/ggVg3tV5cwuZza1bHawUj0OYAMT/v4e/VN4alq0xIAyvOhe6iOyQAAVlbEC4V06gET1DnvkCK+
	jD901R1mHNI/UyCH3FzVxx1QAOjBrFhHY82iGUZxr9ReEq24uOW3UgXnLgleWlxGIL5H5geP2C9EQ
	IWUxecwcf4QdNNmkmXFhXPD42xYtqNB6bcp6K99sEEFsvRgQ5xNAPGrGL3W6QNmnyRwh5PoQK1q5W
	8CLnWOWNSQTpULOsXRtxE6I34Ak6YaA8N3QE2fQwVwK8zQKoq/Fvp8hAr/Azn34VQIeyErhNyr4Ke
	VJn6hEODn6Unsu7fFlOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqUp-00000009rYt-3LsB;
	Wed, 18 Jun 2025 10:58:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRprY-00000009kAD-0iEU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:17:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AAA4A5C65F0;
	Wed, 18 Jun 2025 10:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118E8C4CEE7;
	Wed, 18 Jun 2025 10:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750241866;
	bh=zT9SpmduhwiyK9QObrQFnfi43N9EkK4mgKooF8Jb7ek=;
	h=From:Subject:Date:To:Cc:From;
	b=ZqVT9MlMofzs33sHc2Y4PyHiiNA658HSE8xEo9aRSCUcTQ8ZuRj+BAN/auBcyciZ8
	 ggKP9Lufl6knPIlY80ixJjRr37mnCXAmhqNlXb7vT+FZHdyJdQfe1tizV251rfNdyk
	 T/CGiZn2YbYV987qsVunSgyxgGE2mr0y/MA0KYQ8tXPuZ2XRU2TWW8vKJdeF0x8ALb
	 +asc7WlaUWOgnmuP/RtvK897kNhkdoVRWk89AAmjcdiwhoDkG0z7tD+1baLRbZDjxv
	 nHGuVGEvT+3HNkz2unqXSEq0NrfZYNWpQJcpoQzjT9Eat3M3l8atYFeCmcpbZ+3E7O
	 gG6Wkh5iTTJdQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v5 00/27] Arm GICv5: Host driver implementation
Date: Wed, 18 Jun 2025 12:17:15 +0200
Message-Id: <20250618-gicv5-host-v5-0-d9e622ac5539@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACuSUmgC/23QywrCMBQE0F+RrI3kdWPryv8QF2lz0wal1aQGp
 fTfjQ/QossZOLOYkUQMHiPZLEYSMPno+y4HWC5I3ZquQeptzkQwAUyxgja+TkDbPg50rUonuTY
 OC0UyOAV0/voc2+1zbn0c+nB7bif+aP/OJE4Z5U5oWykNrrDbA4YOj6s+NOSxk8SXFWpmRbagA
 G1tHOOi+rHyY4HpmZXZarQWTCmcZeWPVV+Wy5lV2VZSY1lxMLqWMzu9zgh4vuRDh/cj03QHeSJ
 xrG4BAAA=
X-Change-ID: 20250408-gicv5-host-749f316afe84
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15-dev-6f78e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_031748_306546_E5D0CF96 
X-CRM114-Status: GOOD (  32.91  )
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

Trusted-Firmware (TF-A) was used for device tree bindings and component
initializations.

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

The IWB driver has been reworked to match an MBIgen like interface.

Power management and Kexec are not yet supported at this stage.

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

The ITS driver partially reuses the existing GICv3/v4 MSI-parent
infrastructure and on top builds an IRQ domain needed to enable message
based IRQs.

ITS tables - DT (device table) and ITT (Interrupt Translation Table) are
allocated according to the number of required deviceIDs and eventIDs on
a per device basis. The ITS driver relies on the kmalloc() interface
because memory pages must be physically contiguous within a table level
and can be < or > than PAGE_SIZE.

=============
2.5 GICv5 IWB
=============

The IWB driver has been reworked to match an MBIgen like interface.

A new MSI flag (MSI_ALLOC_FLAGS_FIXED_MSG_DATA) had to be added for MSI
allocation in that the IWB has a fixed eventID per-wire and the ITS driver
code is not allowed to allocate eventIDs dynamically for events backing IWB
wires.

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
Changes in v5:
- Added support for ITS multiple translate frame registers
- Added DT/PCI support function to retrieve msi controller from
  msi-parent and msi-map properties
- Updated DT bindings to add interrupt-domains
- Fixed request_irq() IPI parameter sparse error
- Forced __always_inline to fix gcc build error on patch 20
- Fixed trivial sysreg typo
- Applied review tags
- Added arm64 gic-v5 booting requirements patch
- Rebased on v6.16-rc2
- Link to v4: https://lore.kernel.org/r/20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org

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
Lorenzo Pieralisi (26):
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
      docs: arm64: gic-v5: Document booting requirements for GICv5
      arm64: Kconfig: Enable GICv5

Marc Zyngier (1):
      arm64: smp: Support non-SGIs for IPIs

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
 arch/arm64/kernel/smp.c                            |  159 ++-
 arch/arm64/tools/cpucaps                           |    3 +-
 arch/arm64/tools/sysreg                            |  495 +++++++-
 drivers/irqchip/Kconfig                            |   12 +
 drivers/irqchip/Makefile                           |    5 +-
 drivers/irqchip/irq-gic-common.h                   |    2 -
 ...3-its-msi-parent.c => irq-gic-its-msi-parent.c} |  187 ++-
 drivers/irqchip/irq-gic-its-msi-parent.h           |   14 +
 drivers/irqchip/irq-gic-v3-its.c                   |    3 +-
 drivers/irqchip/irq-gic-v5-irs.c                   |  825 +++++++++++++
 drivers/irqchip/irq-gic-v5-its.c                   | 1255 ++++++++++++++++++++
 drivers/irqchip/irq-gic-v5-iwb.c                   |  284 +++++
 drivers/irqchip/irq-gic-v5.c                       | 1077 +++++++++++++++++
 drivers/irqchip/irq-gic.c                          |    2 +-
 drivers/of/irq.c                                   |   21 +
 drivers/pci/msi/irqdomain.c                        |   19 +
 include/asm-generic/msi.h                          |    1 +
 include/linux/irqchip/arm-gic-v5.h                 |  394 ++++++
 include/linux/msi.h                                |    5 +
 include/linux/of_irq.h                             |    7 +
 30 files changed, 5258 insertions(+), 69 deletions(-)
---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250408-gicv5-host-749f316afe84

Best regards,
-- 
Lorenzo Pieralisi <lpieralisi@kernel.org>


