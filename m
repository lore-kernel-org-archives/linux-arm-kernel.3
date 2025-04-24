Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A341C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 12:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KnFCnqPxN17gsGGlXFCjBhx6osZmNlemAAxjj8n8c60=; b=HgBYWpjv2N2l3A
	+q+eeGWtt2a1HUNfBDocXwt57lwOyiI3Wc8+n7TD/2yky6cQVQll1t1geRVtbULN0nn/xs3IQPrIn
	ess2PQvU6wsq3DqpGyCrfqipULAePqQ5UXkYT8ZR+erPWUagdbsKUbpkJ/QMu4uFAwPKahKxtdQxV
	51dCmQTECgSqDnj7lwNsDiqLzs3lOYklG60D113AWEg4irC+lXErnNss1lnKFcabyDv35oI/SHTk/
	VpdQrpkBu0mT4lGyziuaKmdDuhT1xjgQpXGEip1XYqdBfiI9Rk35xMFbiUuFF7V6SDbR0MsQQ2x9q
	FrRoA30afCEup0hpn4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vTz-0000000DzxH-0GqQ;
	Thu, 24 Apr 2025 12:15:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tm4-0000000DfWi-3GW9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 158AB43812;
	Thu, 24 Apr 2025 10:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDC8C4CEE4;
	Thu, 24 Apr 2025 10:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490343;
	bh=UwZN9vFIXuaCFnOnc0JW9XEymTalTODJy+XEW2zbroI=;
	h=From:Subject:Date:To:Cc:From;
	b=oRHjEqXrxsXnC3jrASy8/Rb266KDlxPjhvTk74aLvVNpspSJlANIqEjde+th+ZZfW
	 R2CmRzl2DI5oCdikOoL3H0iQqBHjF+dt6w8hwNvTsnrvE7r5zyV9N4vBsHMDTvcrcw
	 E3cABLNJ0NEO1zvt8dGsyzJv1gCg5kiGZe9ofI3aieWz2CHR94A78XfdJiRMOkDYwg
	 owMF6viN+g2PvQXAvkAhmwKe0kSec3+F9owVY6D7Kp421ylYoJxdXoZc1I6pA1Drwq
	 Hv9+DTMmBVMzq5yqTgfiDuwhi0Bv2pX1YPPeah7hB1DlTO1u6giNlN3LTq/jQqQn3C
	 obAFDcMCbFDsw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v2 00/22] Arm GICv5: Host driver implementation
Date: Thu, 24 Apr 2025 12:25:11 +0200
Message-Id: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIcRCmgC/23MQQ7CIBCF4as0sxYDCBVdeQ/TRS1DmWiggYZoG
 u4udu3yf8n7NsiYCDNcuw0SFsoUQwt56GDyY5iRkW0NkkvNFTdspqlo5mNe2Vld3En0o0OjoB2
 WhI7eO3YfWnvKa0yf3S7it/5limCcCSd7+1C9dsbenpgCvo4xzTDUWr8KsH2tpQAAAA==
X-Change-ID: 20250408-gicv5-host-749f316afe84
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_032544_874311_E757540D 
X-CRM114-Status: GOOD (  34.99  )
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

The GICv5 host kernel driver is split into units corresponding
to GICv5 components.

The GICv5 architecture defines the following interrupt types:

- PPI (PE-Private Peripheral Interrupt)
- SPI (Shared Peripheral Interrupt)
- LPI (Logical Peripheral Interrupt)

This series adds sysreg entries required to automatically generate
GICv5 registers handling code, one patch per-register.

The GICv5 driver is split into patches matching *logical* entities,
that make the respective drivers functional.

Logical entities:

- PPI, IRS/SPI, LPI/IPI
- ITS
- IWB

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

The IWB driver is not implemented using the wired-to-MSI interface
(i.e. with bus_token == DOMAIN_BUS_WIRED_TO_MSI mechanism), for two
specific reasons:

- An IWB is tightly coupled with a GICv5 ITS and its eventIDs
  are fixed and cannot be allocated by the GICv5 ITS as it does
  for other devices. An IWB is plugged directly into the ITS
  driver for this specific reason.
- The DOMAIN_BUS_WIRED_TO_MSI interface requires the IWBs to be
  platform devices - fiddling with platform device creation and
  DT nodes is doable but a bit hacky.

Having said that, an alternative IWB driver with DOMAIN_BUS_WIRED_TO_MSI
bus token was implemented and can be shared for subsequent patchsets
versions depending on feedback, ref: 2.5 GICv5 IWB section below.

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

The IWB is a wire to message translator; its driver implements the
IRQ domain needed to carry out this translation and passes the
interrupt to its parent ITS domain.

An IWB is connected to an ITS and it has its own deviceID for all
interrupt wires that it manages; the IWB input wire number is
exposed to the ITS as an eventID. This eventID is not programmable
and therefore requires special handling in the ITS driver.

The current driver is tied to the ITS code and basically creates
a wired domain that allocates eventIDs into the ITS driver directly.
The ITS device allocation for the IWB is implemented directly in
the IWB driver at probe time (after all the IWB is a wired interrupt
controller with fixed events). An IWB IRQ domain is assigned to
the IWB wired IRQs, with the corresponding ITS domain as its
parent. Upon IRQ allocation (triggered by firmware parsing
the devices IRQ entries) the domain hierarchy maps the requested IWB
wire to an ITS {device/event}ID fixed pair.

An alternative IWB driver, based on the DOMAIN_BUS_WIRED_TO_MSI bus
token, was already developed and tested but the authors preferred
to post the current version to get feedback on it even though it
makes the IWB driver tied to the ITS driver requiring boilerplate
code that is not really needed (e.g. platform device deviceID parsing).

In particular, the fixed eventID nature of the IWB requires ITS
{device/event}ID allocation code to be IWB aware. To make this
work for the DOMAIN_BUS_WIRED_TO_MSI bus token approach,
the IWB should be made to work as a platform device and
most importantly, ITS code should add special handling for the
IWB (probably using an OF compatible string match or a new MSI
alloc flag). In a way, that's what the current IWB driver does.
Feedback is welcome on the matter.

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
Lorenzo Pieralisi (21):
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
      irqchip/gic-v5: Add GICv5 CPU interface/IRS support
      irqchip/gic-v5: Add GICv5 ITS support
      irqchip/gic-v5: Add GICv5 IWB support
      arm64: Kconfig: Enable GICv5

Marc Zyngier (1):
      arm64: smp: Support non-SGIs for IPIs

 .../interrupt-controller/arm,gic-v5-iwb.yaml       |   76 ++
 .../bindings/interrupt-controller/arm,gic-v5.yaml  |  196 +++
 MAINTAINERS                                        |   10 +
 arch/arm64/Kconfig                                 |    1 +
 arch/arm64/include/asm/arch_gicv5.h                |   91 ++
 arch/arm64/include/asm/el2_setup.h                 |   45 +
 arch/arm64/include/asm/smp.h                       |   24 +-
 arch/arm64/kernel/cpufeature.c                     |   17 +-
 arch/arm64/kernel/smp.c                            |  156 ++-
 arch/arm64/tools/cpucaps                           |    3 +-
 arch/arm64/tools/sysreg                            |  495 +++++++-
 drivers/irqchip/Kconfig                            |   16 +
 drivers/irqchip/Makefile                           |    5 +-
 drivers/irqchip/irq-gic-common.h                   |    2 -
 ...3-its-msi-parent.c => irq-gic-its-msi-parent.c} |    3 +-
 drivers/irqchip/irq-gic-its-msi-parent.h           |   13 +
 drivers/irqchip/irq-gic-v3-its.c                   |    3 +-
 drivers/irqchip/irq-gic-v5-irs.c                   |  851 +++++++++++++
 drivers/irqchip/irq-gic-v5-its.c                   | 1325 ++++++++++++++++++++
 drivers/irqchip/irq-gic-v5-iwb.c                   |  356 ++++++
 drivers/irqchip/irq-gic-v5.c                       | 1062 ++++++++++++++++
 drivers/irqchip/irq-gic-v5.h                       |  388 ++++++
 drivers/irqchip/irq-gic.c                          |    2 +-
 23 files changed, 5074 insertions(+), 66 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250408-gicv5-host-749f316afe84

Best regards,
-- 
Lorenzo Pieralisi <lpieralisi@kernel.org>


