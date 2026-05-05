Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8701BFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 08:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k85kzb0FDDWLNe07V6yKT7WWElj0IoNE6Y8Ci4oSg0U=; b=5FINHpYqO0INQR
	8ePKId8yCbz5N0yWwPSXMCRPE7cDUa36LKBzb4Igmdtnivc3O8pU+lL25pHmAxMd52FCh6/gdSQnL
	SjM2WTUkReA3uzZc3BmW/t4TpkaQsIL4I7EYbhHZIg5y5roCtAr8CwNGkdDIEVf0wELT0n1V6sDra
	PAcJsG9KePcPWwl/JOhRim0r97l9fhhHYuHiDQy6+kWCLQwO1sv+964NpLJHnaAw15CPgsH0hqN3r
	EvuCZQX1LCks82jPzgo4ELoE7q5Cmp5csGnDC5tQgShNFY1gBQCNHEgfKm5paLBQcX0LVfnVWQzkz
	SchMuQBtOTwRcQ/rQUjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBS9-0000000FZFy-3iWT;
	Tue, 05 May 2026 08:48:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBS8-0000000FZFX-0az3;
	Tue, 05 May 2026 08:48:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9055443B0;
	Tue,  5 May 2026 08:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17AB8C2BCB4;
	Tue,  5 May 2026 08:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777970906;
	bh=8QSEESLQsGZMBc0pdl5VKAnCT/dlSZ7hXQFpHTyq4Jo=;
	h=From:Subject:Date:To:Cc:From;
	b=grrS1HoQJqeMSjxUHuwf1IJls1BF2ihZyJMJJhJ1EjGjI+c9Tt2JL96/I55pHrwX3
	 VPSEqFz10xuZaitHRBYMivIziRm4oFIhEc2CudZmX3agONs5WBFs6a5Xm99/BlglVg
	 OhCIBKUihAceIYCbnfTwXxJM03riMn/JT5S5ZbcKvPWXGq9200XU/fn1Dlc5gzbOBH
	 3JyKrB7p5T6Wom8zir/4d++RFAQ9I4MAFnWmStUvk3xxaFZaxHcgGY36Z0Pe4UJm1v
	 i2GLp8fi6qfF9Ka79O2pFYi567HUX+RwJitgJwE1DyFXot9IgN0qiZioUBgchtsZSo
	 NyW8g9vF1209g==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH 0/2] irqchip: Arm GICv5 IWB ACPI IRQ probe deferral
Date: Tue, 05 May 2026 10:48:02 +0200
Message-Id: <20260505-gic-v5-acpi-iwb-probe-deferral-v1-0-b37b85998362@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMKu+WkC/yXNTQ6CMBBA4auQWTsJNEV+rmJctNMBxxhopookh
 LtTZflt3tsgsQon6IsNlBdJMk8Z1aUAerhpZJSQDaY019KaBkchXGp0FAXl6zHq7BkDD6zqXki
 BWtv5yrW1hRyJyoOs/8Htfjp9/JPp/avCvh84F3PIggAAAA==
X-Change-ID: 20260427-gic-v5-acpi-iwb-probe-deferral-cdc849b1a854
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_014828_244688_4CEF6FE4 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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
Lorenzo Pieralisi (2):
      drivers/acpi: Move RISC-V interrupt controllers autodep to ACPI IRQ code
      irqchip/gic-v5: Add IWB to ACPI probe dependency control

 arch/riscv/include/asm/acpi.h       |   1 +
 drivers/acpi/arm64/iort.c           |  22 ++++-
 drivers/acpi/irq.c                  | 172 +++++++++++++++++++++++++++++++++++-
 drivers/acpi/riscv/irq.c            | 141 +----------------------------
 drivers/acpi/scan.c                 |   1 +
 drivers/irqchip/irq-gic-v3.c        |   2 +-
 drivers/irqchip/irq-gic-v5-iwb.c    |   5 ++
 drivers/irqchip/irq-gic-v5.c        |  13 ++-
 drivers/irqchip/irq-gic.c           |   2 +-
 drivers/irqchip/irq-loongarch-cpu.c |   2 +-
 drivers/irqchip/irq-riscv-intc.c    |   3 +-
 include/linux/acpi.h                |   5 +-
 include/linux/acpi_iort.h           |   3 +-
 13 files changed, 218 insertions(+), 154 deletions(-)
---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260427-gic-v5-acpi-iwb-probe-deferral-cdc849b1a854

Best regards,
--  
Lorenzo Pieralisi <lpieralisi@kernel.org>


