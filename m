Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19D1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y5GPSe78Q5PjJXi20U4VevdrhXl/hoPlY9EOq/pY7EM=; b=YCYRaRJWb/Y8RX
	khK2iRByuZ/143pNFLtL6IpXtyUxS27tnSd/xDMXc03Q5nn/xSvFThhT2nRbf2tyPK8o8tbV1hYRA
	wLlzFO5XKW9oKUXnMlIjp5zQ7Rw3AtaYo/V0kr3AtvXHcRCJnkUR4EmTU9WDa1mQSsJMgyCxat1Su
	NVgrpm3QJaM+mihdIBBBNIst3J4Fo0dkGJ3acH/+geSQgjKweB3JioEITSMDqBARdy0mshIj7rSG1
	LS3RDU75vazjB7KTX5kPeZc8HcVHQ5nG4u1V80txy4VBUPyQkRDCTc/PdFWCQTQgBbCkiRhxPyxvh
	nP0ONiH72CZAr9BjuUxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew5i-00000002JOv-17pD;
	Wed, 01 Jul 2026 14:39:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew5g-00000002JO9-2z09;
	Wed, 01 Jul 2026 14:39:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 160C260138;
	Wed,  1 Jul 2026 14:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8C21F000E9;
	Wed,  1 Jul 2026 14:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782916743;
	bh=Y5GPSe78Q5PjJXi20U4VevdrhXl/hoPlY9EOq/pY7EM=;
	h=From:Subject:Date:To:Cc;
	b=MoK3yVLq+W15I4AOMyVYLmpF3ez/cN2lMqWlA3YC9V1xpyXintrTQ4nZzRkhLrmK5
	 /V2BK8e7lPybPgHgjEaf46MYajsbqKQ5Ld8A1hEyPuxFXosjznffJIij8Bpi8dSBYd
	 iOmjOLUAad+5MkdhxSwA9TID/bI+9trjJmUg691hggyijAeRG14JhCiOr7HXPMNDcB
	 5m4qSqP4dg1O8zd2IPObW8yETeTzNy235L877ikXVf3rMGMd9lFXDzuOtX8GaLpR/D
	 bsoNIarfZoS0tLhNbeYAu462hl3i+P1qqsfd/lMiHLTlHsUOVuFRHCW3qSLKrD2yYU
	 rZuQjZ6qigeUA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v3 0/7] irqchip/ACPI: Arm GICv5 IWB ACPI IRQ probe deferral
Date: Wed, 01 Jul 2026 16:38:48 +0200
Message-Id: <20260701-gic-v5-acpi-iwb-probe-deferral-v3-0-c5562cf0fe29@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHgmRWoC/4WOy27CMBBFfwV5zVSOHZuEVf+jYuFxJmEKSqIxG
 CqUf28ei6orlke6Oue+VCJhSuq4eymhzImHfga736l4Dn1HwM3MymjjdWkO0HGE7CDEkYEfCKM
 MSNBQSyLhCrGJVVljESpXqlkyCrX8XANfp43THb8p3hbrsjhzug3ysz7IxbLbYk67d7FcgAa0B
 6xcXVfWm88LSU/Xj0E6tdSy+fN5bd/6zOwztm1D4dET4j/fNE2/o0MnEy8BAAA=
X-Change-ID: 20260427-gic-v5-acpi-iwb-probe-deferral-cdc849b1a854
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Sunil V L <sunilvl@oss.qualcomm.com>
X-Mailer: b4 0.15.2
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

On Arm GICv5 systems, the IWB (Interrupt Wire Bridge) handles wired interrupts
and it is in charge of translating interrupt wires to GICv5 ITS messages.

In ACPI systems, an IWB is backed by a platform device. Device drivers for
devices whose IRQs are routed to an IWB might probe earlier than the IWB device
driver, which can result in failures in that until the IWB driver is probed and
its IRQ domain is duly registered, IRQs routed to it cannot be resolved.

Some interrupt controllers for the RISC-V architecture suffer from the same
issue; RISC-V, in its ACPI IRQ layer solved the problem by automatically
creating device dependencies that result in the interrupt controllers drivers
being probed before any device driver whose devices IRQs are routed to them is
probed.

Instead of reinventing the wheel, this series move the aforementioned RISC-V
code to generic ACPI IRQ handling code (while fixing some bits and pieces) and
implement GICv5 IWB ACPI probe deferral on top of it.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
Changes in v3:
- Added stub to clear ACPI device dependencies
- Added review tags
- Rebased against v7.2-rc1
- Link to v2: https://patch.msgid.link/20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org

Changes in v2:
- Split the patchset in several logic units according to review
- Link to v1: https://patch.msgid.link/20260505-gic-v5-acpi-iwb-probe-deferral-v1-0-b37b85998362@kernel.org

To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Len Brown <lenb@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
To: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
To: Anup Patel <anup@brainfault.org>
To: Hanjun Guo <guohanjun@huawei.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-acpi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-riscv@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: loongarch@lists.linux.dev

---
Lorenzo Pieralisi (7):
      ACPI: Add acpi_device_clear_dep() helper function
      ACPI: RISC-V: Fix riscv_acpi_irq_get_dep() loop termination
      ACPI: RISC-V: Check acpi_get_handle() status in riscv_acpi_add_prt_dep()
      ACPI: RISC-V: Fix riscv_acpi_add_prt_dep() loop handling
      ACPI: irq: Move RISC-V interrupt controllers autodep to ACPI IRQ code
      ACPI/IORT: Implement ACPI infrastructure to enable GICv5 IWB probe deferral
      irqchip/gic-v5: Enable GICv5 IWB ACPI probe ordering detection

 arch/riscv/include/asm/acpi.h       |   1 +
 drivers/acpi/arm64/iort.c           |  22 ++++-
 drivers/acpi/irq.c                  | 172 +++++++++++++++++++++++++++++++++++-
 drivers/acpi/riscv/irq.c            | 141 +----------------------------
 drivers/acpi/scan.c                 |   1 +
 drivers/irqchip/irq-gic-v3.c        |   2 +-
 drivers/irqchip/irq-gic-v5-iwb.c    |   2 +
 drivers/irqchip/irq-gic-v5.c        |  13 ++-
 drivers/irqchip/irq-gic.c           |   2 +-
 drivers/irqchip/irq-loongarch-cpu.c |   2 +-
 drivers/irqchip/irq-riscv-intc.c    |   3 +-
 include/linux/acpi.h                |  13 ++-
 include/linux/acpi_iort.h           |   3 +-
 13 files changed, 223 insertions(+), 154 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260427-gic-v5-acpi-iwb-probe-deferral-cdc849b1a854

Best regards,
--  
Lorenzo Pieralisi <lpieralisi@kernel.org>


