Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D2CCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xq9L0wmF9N9OaI65piMG16LFpkcrNIRs70fAnr5Cj6g=; b=hLRkbjcN3k4QLT
	FlfqnR0APBT5SpuH4TVhQ+srpzWW+050JCxQOewLKYXdbOABejX8ukgO6HwXmRRix9OHEOvtqPxw/
	kTKkW5qWoEg77mzlSx5rl8mwj88uQ/BITd8GUgUNgmRuxjo3Im9Ctw5NMxJ/njubsUeJN/dt0z7pL
	BKL/YjF9QMsWoTTrd5FBGRAySW9KIjZnUnTgoAoFAfkOSnCayvRbRfPnseBy6YyVlv8aHgrKfeQKO
	TAsbrXZCJ9k8ToiB5VfrpNyCo+w5SjGJiBg+YrIungOf5+ClPfWMtglshCH5SQlVItdkQMv+qdmNJ
	t/h2bRS41Xxrag0MmwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgnJ-0000000Fjyc-2XjJ;
	Tue, 28 Oct 2025 10:19:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgnI-0000000FjyV-09iw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:19:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E2B861EF8;
	Tue, 28 Oct 2025 10:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3228C4CEE7;
	Tue, 28 Oct 2025 10:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761646750;
	bh=rTsiu6Lg9PZhrtKUJKqwPQO26S58LDXJ57pUZwdY5ng=;
	h=From:Subject:Date:To:Cc:From;
	b=fpCjauIFUkgpfgT171hCNQY/l4yDNErSco51dU7/5qdghLbuP22zvvc5Tm6IZrCIC
	 5anRaznpikHViYV1KfvO/wgw4T8WXN5odJead3jyN9MDiHyALSAhAoUPGGdM5DQfzv
	 I3pHRxCMUqCN2ZrQh1zMYHV9LIcex/MWeThdRRkIr/wMRjSCkc+30oSKXBUbKq/Q/7
	 Rdjpqhc8E+oYFlw1SN+KmoJhj+VMi2l+daVPvdFJi3uJ2RBf5eZmB03Q2EG3emAzvz
	 2Os6VzM3Ic24NgRJSwhqiNj/igG9k7bsPoPmAJFgA8CR5hMgJDW2EOkeEuVYI/Hvql
	 reD5AiDv50eMw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH not for merging 0/7] irqchip/gic-v5: Code first ACPI boot
 support
Date: Tue, 28 Oct 2025 11:18:58 +0100
Message-Id: <20251028-gicv5-host-acpi-v1-0-01a862feb5ca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJKYAGkC/x3MQQqEMAxA0auUrA20HTqDXkVcSBNrFraSigji3
 S2zfIv/b6iswhUGc4PyKVVKbnCdgbjOOTEKNYO3PjjrPSaJZ8C11APnuAtS6OkbHX3I/qBVu/I
 i1/84Qi6HWYqajTVJTjA9zwvbbNIpcgAAAA==
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

The ACPI and ACPI IORT specifications are being updated to support bindings
required to describe GICv5 based systems.

The ACPI specification GICv5 bindings ECR [1] was published and now it is
going through the approval process to get it ratified.

The Arm IORT specification [2] has been updated to include GICv5 IWB
specific bindings in revision E.g.

Implement kernel code that - based on the aforementioned bindings - adds
support for GICv5 ACPI probing.

ACPICA changes supporting the bindings are posted with the series
to make it self-contained - they should not be considered for merging
(and consequently the kernel code as well is not ready to be upstreamed,
it is posted so that it can be reviewed ahead of spec ratification, we
are not expecting any major spec changes).

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
parallel with this series.

For PPI/SPI/LPI backed IRQs the probe dependency is not a problem because
in GICv5 systems the IRSes and ITSes probe early so their IRQ domain are
set in place before devices require IRQ mappings.

ACPICA patches are a Linuxised version of ACPICA GICv5 pull request [5] and
should not be considered for merging (ACPICA changes won't be finalized
until the ACPI specification is ratified), they are there so that the
kernel can map/parse GICv5 ACPI firmware data structures 

[1] https://github.com/tianocore/edk2/issues/11148
[2] https://developer.arm.com/documentation/den0049/eg
[3] https://github.com/LeviYeoReum/edk2/tree/levi/gicv5_patch
[4] https://github.com/LeviYeoReum/edk2-platforms/tree/levi/gicv5_patch
[5] https://github.com/acpica/acpica/pull/1043

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
Jose Marinho (2):
      ACPICA: Add GICv5 MADT structures
      ACPICA: Add Arm IORT IWB node definitions

Lorenzo Pieralisi (5):
      irqdomain: Add parent field to irqchip_fwid
      PCI/MSI: Make the pci_msi_map_rid_ctlr_node() interface firmware agnostic
      irqchip/gic-v5: Add ACPI IRS probing
      irqchip/gic-v5: Add ACPI ITS probing
      irqchip/gic-v5: Add ACPI IWB probing

 drivers/acpi/arm64/iort.c                | 190 +++++++++++++++++++-----
 drivers/acpi/bus.c                       |   3 +
 drivers/irqchip/irq-gic-its-msi-parent.c |  45 +++---
 drivers/irqchip/irq-gic-v5-irs.c         | 247 ++++++++++++++++++++++++-------
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
 15 files changed, 786 insertions(+), 158 deletions(-)
---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251022-gicv5-host-acpi-d59d6c1d3d07

Best regards,
-- 
Lorenzo Pieralisi <lpieralisi@kernel.org>


