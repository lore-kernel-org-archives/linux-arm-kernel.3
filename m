Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCCAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tewPeVsAxKBBt/hHzLYO7y76PO1MYevgazh3aupzok=; b=fhlQ7k6/x2aj+Rjqk6o4MFMgRf
	UaKYpSOduXRDFvv99Ilz6mi124/qHzO5dgI4WJDEi9MSDWk66Jx7q+yyr8WD78EHFfdQEEBd7iY6o
	CUsly0JjPDKs1TUB61ZAYEhoD6Ydc02SExtpwkqGjS7K6dZD46DJQGd8AFcP5sEo1k38ldzUdkk7T
	4sT22ZM+IUtqLaNbGY7YRC8w04QozfsZzF8x8cEZuLX7zUQv4EWL3mcuQw3wk8TOZpHkYnpzo+4P9
	mERfXTAbIgSJ7mDWZob/t6jIWIxkiLfc/gXcPXyVw8oSVI7tE7V5zDEKYdNC6nmqsNmJ7e3nBePgW
	4/NFkusw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whorZ-00000002ZF7-3dT8;
	Thu, 09 Jul 2026 13:32:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whorY-00000002ZES-3BHx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:32:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EE0C40C3F
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jul 2026 13:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF371F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jul 2026 13:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783603944;
	bh=2tewPeVsAxKBBt/hHzLYO7y76PO1MYevgazh3aupzok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iVOSba0zKtGQZJDwP6Ch8En1yzWDPJ7FpupRO9mNJugTmRp4X9Hzn8Yx3Ant60nxh
	 L5SMnh010N74dTKHcIbaemwoiXvYn9EZlCUpGml9M+QVmcmqAM6bWe7eA3/8xdEVbz
	 lfF+LXeTKC6s8Nej9STb1lHQSGMqPDIiaV/SFtp3/KVUkgl4GMysE5oM1TFaw7YJp0
	 wZwzy9Avc+Spwityl5htaw+oROAMDMd4/1Ye/fXlvq4TzwRozafubrsGjQumOnzsEg
	 eVv3ahzvNgN5wTs+JOc4gS2d1GGyJr52jGcTlKBg4OQGkC2FylDN8XCS43AewDMz8U
	 pdrxTfHraYYmQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so2090172e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 06:32:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpkZpvj74Jy8Zh37f4zRSi5MnC3UsWnLU/ayBqwigYsL/+zsI/Ae4lBeIG7dlzAXlYSOYXMIdOiD1UAGyCs0O9D@lists.infradead.org
X-Gm-Message-State: AOJu0Yw639Kdn/gx/SqnmElG7enC9ju4msbaQ6rX4JBYoccjBFUJubDM
	AwrYs9r+CoTw+BcyGaqiHjEn008QUTKu9HgPpjlRynKf9wza5J9ddGJ39ATiP/BTQM4YtoQvkWM
	GWnQRy0bOfkwAZM+3s1meYV8ltlbYUsc=
X-Received: by 2002:a05:6512:64a8:b0:5b0:12cf:ae3f with SMTP id
 2adb3069b0e04-5b012cfb1e8mr1407950e87.31.1783603942165; Thu, 09 Jul 2026
 06:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260709-gic-v5-acpi-iwb-probe-deferral-v4-0-48dae790f871@kernel.org>
In-Reply-To: <20260709-gic-v5-acpi-iwb-probe-deferral-v4-0-48dae790f871@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 9 Jul 2026 15:32:10 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hDK+C+ZJ4YKd0xbyHW+vEot9z-YrivWSrg1ag7Ebx4cA@mail.gmail.com>
X-Gm-Features: AUfX_my3RabqhVkiaUs2JZU-hHXS-RHiCuP5fgE1pk66iBa2OI-yzz3XlXSUIdk
Message-ID: <CAJZ5v0hDK+C+ZJ4YKd0xbyHW+vEot9z-YrivWSrg1ag7Ebx4cA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] irqchip/ACPI: Arm GICv5 IWB ACPI IRQ probe deferral
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Sunil V L <sunilvl@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 9, 2026 at 10:41=E2=80=AFAM Lorenzo Pieralisi <lpieralisi@kerne=
l.org> wrote:
>
> On Arm GICv5 systems, the IWB (Interrupt Wire Bridge) handles wired inter=
rupts
> and it is in charge of translating interrupt wires to GICv5 ITS messages.
>
> In ACPI systems, an IWB is backed by a platform device. Device drivers fo=
r
> devices whose IRQs are routed to an IWB might probe earlier than the IWB =
device
> driver, which can result in failures in that until the IWB driver is prob=
ed and
> its IRQ domain is duly registered, IRQs routed to it cannot be resolved.
>
> Some interrupt controllers for the RISC-V architecture suffer from the sa=
me
> issue; RISC-V, in its ACPI IRQ layer solved the problem by automatically
> creating device dependencies that result in the interrupt controllers dri=
vers
> being probed before any device driver whose devices IRQs are routed to th=
em is
> probed.
>
> Instead of reinventing the wheel, this series move the aforementioned RIS=
C-V
> code to generic ACPI IRQ handling code (while fixing some bits and pieces=
) and
> implement GICv5 IWB ACPI probe deferral on top of it.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> ---
> Changes in v4:
> - Applied v3 review comments and tags
> - Link to v3: https://patch.msgid.link/20260701-gic-v5-acpi-iwb-probe-def=
erral-v3-0-c5562cf0fe29@kernel.org
>
> Changes in v3:
> - Added stub to clear ACPI device dependencies
> - Added review tags
> - Rebased against v7.2-rc1
> - Link to v2: https://patch.msgid.link/20260603-gic-v5-acpi-iwb-probe-def=
erral-v2-0-23ffa16b6ebb@kernel.org
>
> Changes in v2:
> - Split the patchset in several logic units according to review
> - Link to v1: https://patch.msgid.link/20260505-gic-v5-acpi-iwb-probe-def=
erral-v1-0-b37b85998362@kernel.org
>
> To: "Rafael J. Wysocki" <rafael@kernel.org>
> To: Len Brown <lenb@kernel.org>
> To: Sunil V L <sunilvl@ventanamicro.com>
> To: Marc Zyngier <maz@kernel.org>
> To: Thomas Gleixner <tglx@kernel.org>
> To: Lorenzo Pieralisi <lpieralisi@kernel.org>
> To: Huacai Chen <chenhuacai@kernel.org>
> To: Anup Patel <anup@brainfault.org>
> To: Hanjun Guo <guohanjun@huawei.com>
> To: Sudeep Holla <sudeep.holla@kernel.org>
> To: Catalin Marinas <catalin.marinas@arm.com>
> To: Will Deacon <will@kernel.org>
> Cc: linux-acpi@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: loongarch@lists.linux.dev
>
> ---
> Lorenzo Pieralisi (7):
>       ACPI: Add acpi_device_clear_deps() helper function
>       ACPI: RISC-V: Fix riscv_acpi_irq_get_dep() loop termination
>       ACPI: RISC-V: Check acpi_get_handle() status in riscv_acpi_add_prt_=
dep()
>       ACPI: RISC-V: Fix riscv_acpi_add_prt_dep() loop handling
>       ACPI: irq: Move RISC-V interrupt controllers autodep to ACPI IRQ co=
de
>       ACPI/IORT: Implement ACPI infrastructure to enable GICv5 IWB probe =
deferral
>       irqchip/gic-v5: Enable GICv5 IWB ACPI probe ordering detection
>
>  arch/riscv/include/asm/acpi.h       |   1 +
>  drivers/acpi/arm64/iort.c           |  22 ++++-
>  drivers/acpi/irq.c                  | 172 ++++++++++++++++++++++++++++++=
+++++-
>  drivers/acpi/riscv/irq.c            | 141 +----------------------------
>  drivers/acpi/scan.c                 |   1 +
>  drivers/irqchip/irq-gic-v3.c        |   2 +-
>  drivers/irqchip/irq-gic-v5-iwb.c    |   2 +
>  drivers/irqchip/irq-gic-v5.c        |  13 ++-
>  drivers/irqchip/irq-gic.c           |   2 +-
>  drivers/irqchip/irq-loongarch-cpu.c |   2 +-
>  drivers/irqchip/irq-riscv-intc.c    |   3 +-
>  include/linux/acpi.h                |  13 ++-
>  include/linux/acpi_iort.h           |   3 +-
>  13 files changed, 223 insertions(+), 154 deletions(-)
> ---

All applied as 7.3 material, thanks!

