Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E93D68BF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 10:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XO/xBHWXNu+pO8IRH4tOF+OFGVa33n5TcJDWAQE6NVQ=; b=HHfKaVdL1MaLmr
	YTN9AQKUvJcbEFr6/01RGvJ652gUP6WT3jkJu5Q53X7k1dyC+OyN8ceANwEuT0RWYQ0AuQOd7L+AF
	4wr4kngW2KrHlG0npnEq3nW3YV4nIckk9sCmmXp1TVVqZWRXnTx8lgkWwDcYDYACvSj7uIxDO6iKm
	+1mWitsQCuFmyC5m5ee7AiGummkj4nAnmtGdZ8RsBJY2kgtO8VltYfN/ZqSIXKiV3Dxru72zx1nIf
	a+LxSKPleqje62mnQ7ro9VZFIAcDoi+Qb7bmUqx2jx9cRdg+IrwFWzS5WwNOuY9+dIRO2ZTGu8n4n
	s27l9iIU3VGyX+CvAtWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWB2K-00000008Cmx-3M8W;
	Thu, 18 Dec 2025 10:15:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWB2H-00000008Cmc-30iC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 10:15:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 836A740B4B;
	Thu, 18 Dec 2025 10:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99C0C4CEFB;
	Thu, 18 Dec 2025 10:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766052904;
	bh=bUrOudaBNEyNMrDDCs/9pJg9ZvlHYmUGDr+eXIjrMyo=;
	h=From:Subject:Date:To:Cc:From;
	b=Rg678wxJlwP2XtXO1kbmDVfmPFRvx3qUSeWXchI0F55x5wmP53dUVUIXohf5Zbu+n
	 ZfIsju8wp3+Y4bDyqpgBhNRR0H8cIkzilNOtzeh9QI4DMxbEFMCeZDHDAp5wyYjl+n
	 xNrZp+D0ETul3gohzeUtwdl+celqsdWG7rEEBX8Ak4+rlZdcCLLeBK6+eV5mQWV0oE
	 A1F+SaXu5/TZhB9hSM+K0GOhqkK6BsEKaajGX4B9jqGPx6ZwoBKKo1Vp+cwSObHrby
	 1aHe8SRtbr7EAFu8WLs/oHY8uCBUKdAzqD9nbVB/0J9A8fXZD29doqSZb+l0G9ADeu
	 7w8nMhIlAva+w==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v2 0/7] irqchip/gic-v5: Code first ACPI boot support
Date: Thu, 18 Dec 2025 11:14:26 +0100
Message-Id: <20251218-gicv5-host-acpi-v2-0-eec76cd1d40b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAALUQ2kC/2WNQQrCMBBFr1Jm7UgSSa2ueg/pIibTZlCSkpSgl
 N7dWHDl8j3476+QKTFluDYrJCqcOYYK6tCA9SZMhOwqgxJKS6EUTmyLRh/zgsbOjE5fXGulOzl
 xhrqaE4382ou3obLnvMT03g+K/Npfq/trFYkChTRdq0a6a2v6B6VAz2NMEwzbtn0AzUKfja8AA
 AA=
X-Change-ID: 20251022-gicv5-host-acpi-d59d6c1d3d07
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Marc Zyngier <maz@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Jose Marinho <jose.marinho@arm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_021505_815238_E27BB92F 
X-CRM114-Status: GOOD (  22.15  )
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

The ACPI and ACPI IORT specifications were updated to support bindings
required to describe GICv5 based systems.

The ACPI specification GICv5 bindings ECR [1] were approved and the
required changes merged in the ACPICA upstream repository[5].

The Arm IORT specification [2] has been updated to include GICv5 IWB
specific bindings in revision E.g.

Implement kernel code that - based on the aforementioned bindings - adds
support for GICv5 ACPI probing.

ACPICA changes supporting the bindings are posted with the series; they
were cherry-picked from the upcoming ACPICA Linuxised release patches
and they should _not_ be merged in any upstream branch because the
full set of Linuxised ACPICA changes will be subsequently posted in
order to be merged, I added the two ACPICA patches to make the series
self-contained.

The ACPI bindings were prototyped in edk2 - code available in these
branches [3][4].

===========================
Kernel implementation notes
===========================

IRS and ITS probing is triggered using the standard irqchip ACPI probing
mechanism - there is no significant difference compared to previous GIC
versions other.

The only difference that is worth noting is that GICv3/4 systems include a
single MADT component describing the interrupt controller (ie GIC distributor)
whereas GICv5 systems include one or more IRSes. The probing code is
implemented so that an MADT IRS detection triggers probing for all IRSes
in one go.

The IWB driver probes like any other ACPI device. IORT code is updated so
that a deviceID for the IWB can be detected.

The only major change compared to GICv3/4 systems is the GSI namespace that
is split between PPI/SPI IRQs and IWB backed IRQs.

The main GSI handle - to map an IRQ - has to detect whether to look-up
using the top level GSI domain or an IWB domain in that the two IRQ
namespaces are decoupled.

IORT code implements the logic to retrieve an IWB domain by looking up its
IWB frame id, as described in [1].

Most important implementation detail worth noting is that - at this stage -
ACPI code is not capable of handling devices probe order IRQ dependency on
the interrupt controller driver their IRQ is routed to.

This is not an issue on GICv3/4 systems in that the full GIC hierarchy
probes earlier than any other device, so by the time IRQs mappings have to
be carried out (ie acpi_register_gsi()) the GIC drivers have already
probed.

On GICv5 systems, the IWB is modelled as a device and its device driver
probes at device_initcall time. That's when the IWB IRQ domain is actually
registered - which poses problems for devices whose IRQs are IWB routed and
require to resolve the IRQ mapping before the IWB driver has a chance to
probe.

Work on resolving devices<->IWB probe order dependency has started in
parallel with this series and will be posted shortly.

For PPI/SPI/LPI backed IRQs the probe dependency is not a problem because
in GICv5 systems the IRSes and ITSes probe early so their IRQ domain are
set in place before devices require IRQ mappings.

ACPICA patches are a Linuxised version of ACPICA GICv5 upstream changes
[5] and should not be considered for merging because they would conflict
with the full ACPICA release changes patchset that will be posted later
in this dev cycle (owing to patch dependencies in the ACPICA commit
history) they are there so that the patch series is self-contained.

[1] https://github.com/tianocore/edk2/issues/11148
[2] https://developer.arm.com/documentation/den0049/eg
[3] https://github.com/LeviYeoReum/edk2/tree/levi/gicv5_patch
[4] https://github.com/LeviYeoReum/edk2-platforms/tree/levi/gicv5_patch
[5] https://github.com/acpica/acpica/commits/master/

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
Changes in v2:
- Cherry-picked ACPICA upstream changes
- Minor editorial changes
- Removed the "not for merging" tag because now ACPI specs are approved
- Rebased against v6.19-rc1
- Link to v1: https://lore.kernel.org/r/20251028-gicv5-host-acpi-v1-0-01a862feb5ca@kernel.org

---
Jose Marinho (2):
      ACPICA: Add GICv5 MADT structures
      ACPICA: Add Arm IORT IWB node definitions

Lorenzo Pieralisi (5):
      irqdomain: Add parent field to struct irqchip_fwid
      PCI/MSI: Make the pci_msi_map_rid_ctlr_node() interface firmware agnostic
      irqchip/gic-v5: Add ACPI IRS probing
      irqchip/gic-v5: Add ACPI ITS probing
      irqchip/gic-v5: Add ACPI IWB probing

 drivers/acpi/arm64/iort.c                | 190 +++++++++++++++++++-----
 drivers/acpi/bus.c                       |   3 +
 drivers/irqchip/irq-gic-its-msi-parent.c |  43 +++---
 drivers/irqchip/irq-gic-v5-irs.c         | 246 ++++++++++++++++++++++++-------
 drivers/irqchip/irq-gic-v5-its.c         | 132 ++++++++++++++++-
 drivers/irqchip/irq-gic-v5-iwb.c         |  42 ++++--
 drivers/irqchip/irq-gic-v5.c             | 138 ++++++++++++++---
 drivers/pci/msi/irqdomain.c              |  24 ++-
 include/acpi/actbl2.h                    |  56 ++++++-
 include/linux/acpi.h                     |   1 +
 include/linux/acpi_iort.h                |  11 +-
 include/linux/irqchip/arm-gic-v5.h       |   8 +
 include/linux/irqdomain.h                |  30 +++-
 include/linux/msi.h                      |   3 +-
 kernel/irq/irqdomain.c                   |  14 +-
 15 files changed, 784 insertions(+), 157 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251022-gicv5-host-acpi-d59d6c1d3d07

Best regards,
-- 
Lorenzo Pieralisi <lpieralisi@kernel.org>


