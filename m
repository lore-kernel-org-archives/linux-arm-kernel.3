Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5EEC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 04:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ffChoDiFR+PyqcOvwXXG+VNE/Bmtc2ogucfc93fQxUk=; b=NaP2ObPZZ8LobW3UYLR1RbseFI
	PX0CwfujkE8B1flXSKndAS0y8rvD0pdJkfNHG2U2IJDOBEZi5rlUGKWA3A+i4L7/xlpQn6thPCGKT
	yCk6S47I65zXz82Q5P191l8Hfc93ohEGLDj/eqewNK/tuSawtheM3+qJVkrrBI0WQq75FnCyOGK1Z
	6Q9m97PWzeIB3QLir0gYeKAtbBbSLv7wEpZ1PnZ7pzun6PTfCeuL+ct7ndIYbYTDFvX7Igk6JcMCX
	yNILdNGYUSJblV8B6EJ5Voa8A68vSEBhLufrlXHSJ5/XtLWoZiZIzgSojQfr63s+axi2IlThLcWb+
	xgXq2JXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgymI-0000000E2hx-2AL0;
	Sun, 09 Feb 2025 04:18:42 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyks-0000000E2FQ-3Yrp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 04:17:17 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2fa286ea7e8so2780106a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 20:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074634; x=1739679434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffChoDiFR+PyqcOvwXXG+VNE/Bmtc2ogucfc93fQxUk=;
        b=MptYRKoGCGiSZaVfXo0GoXnF/eIvfh79K3SNTryflBL4yg0c6hA6ruN0VBIwfkPsGD
         LSrigDR2AYXOnIf97bR0TyNs4cCh1ysbrdGnYxKoKgXBLkQRedHRF+biVnz3RfXHVRSV
         vWfVvcuWLwspwdJ6ptPUceYLScNAX5tSwuRCDyBDVWTUsOG1rCIKH0LymqbNU80tKjAq
         p4SvcI7DztAwE17s6+Xq4DcvZI5Gp//+Y523F5Oql+oErk0F+iUUEu3wZw+GEeCilhiP
         WYjG0hR+OEJdqVLm0sIkzNgaVPImngbD6j2vQVyI0i0pErXxEWgK0lcABOlG8S84XiIP
         f6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074634; x=1739679434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffChoDiFR+PyqcOvwXXG+VNE/Bmtc2ogucfc93fQxUk=;
        b=nQjv3krj83jvDpBH6i7JyL5Gpo6yb+760tg6GPelpq6g0UbtHAfAAG1q1DXK2k+OIl
         HAg9C70ZcNylXl9fBheag4EMaO7+yKg1GaiNsPciouhXt+DNu073iLIVRdkmh/hvTUFW
         NHYzwe1eF6x71QPQJDyYYugMYUfqe7p5vKunTr9IfG+mrt0A4hZwGrQD/1mwgX/fLBul
         CoAjBgFYCcMJcVJz0Qr6ZFuH2oAgs2lHa1QOhwfTwvuNBwaNQwNUfX7BQqpJWdYK+8q2
         aXXGk1KCkspgpvpJcnAs6/wZ/1WRPvF1xDXwiSfbgC5T3QZ2czKgnRz/YrDmOhtbrVrd
         CUxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnDKflj0h/VnsRfyjCzLna8DcwVhc1KIEypzjO0uhH6qraHt+OyJ8vjNRjNeOwDNHJgOkbekZdQakPeDENjCYS@lists.infradead.org
X-Gm-Message-State: AOJu0YxjHfjzSA9MtlUezhY1FkqnFVduzeJS6AlOiZsk6hgeI271Mrdt
	VV/cD4pv5Og91lw4DKHb3Q8oomkx6d8OOjt+fazZOdVcOnq8j0l7F8p4KFSFAsU=
X-Gm-Gg: ASbGncvS3ImXvQeXBLVZVsTuvUL9Nomt+65y2psRUe5dyy/2uvMdxd41H5JbLcNqlph
	hDLTvC9Iec925r+fMn7zRBcTfDoREOAj+gM6rkaymQJTkPe2PASusV8CNnp7fJAbjK99k+bl2Ku
	3vHWHaB81yqOhDM5mD3fWTAgu6yOBnEw+YOWMsHMJMHMZiP0TsiCbs7lGuIIgiVAhkT2oRy+3KD
	lae4Aucny5xJYUU2zDK6nS+8Vix2ephH8jrtsFJu+xuFusBuPO+kp7z8Y7sqo6QhTMhidP0chQ4
	4lAw/7t9FnlonFFUn9eTAKiYw6VBxg/qiat/MdXJlM0eW2wsDpdfxQA=
X-Google-Smtp-Source: AGHT+IHWyivxqea4vrX5Vzo7+S2VcgVE1uEfRrP93aVaeTeSGQZ/oELVi9DGSUIrYGP8OYhXJU+GpQ==
X-Received: by 2002:a05:6a00:2289:b0:725:460e:6bc0 with SMTP id d2e1a72fcca58-7305d2ac0admr15893367b3a.0.1739074633666;
        Sat, 08 Feb 2025 20:17:13 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:17:13 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: hpa@zytor.com,
	Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v5 00/11] RISC-V IMSIC driver improvements
Date: Sun,  9 Feb 2025 09:46:44 +0530
Message-ID: <20250209041655.331470-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_201715_571635_99E921EE 
X-CRM114-Status: GOOD (  12.81  )
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

This series is based on recent discussion on LKML:
https://lore.kernel.org/lkml/20241114161845.502027-18-ajones@ventanamicro.com/

It primarily focuses on moving to RISC-V IMSIC driver use common MSI
lib and GENERIC_PENDING_IRQ.

PATCH1 & PATCH2: Preparatory patches
PATCH3: Main patch which updates IMSIC driver to use MSI lib
PATCH4 to PATCH6: Preparatory patch for moving to GENERIC_PENDING_IRQ
PATCH7 to PATCH11: Patches use GENERIC_PENDING_IRQ in IMSIC driver

These patches can also be found in the riscv_imsic_imp_v5 branch at:
https://github.com/avpatel/linux.git

Changes since v4:
 - Updated PATCH4 with better irq_force_complete_move() implementation
   provided by Thomas.

Changes since v3:
 - Dropped PATCH1 of v3 series and updated last patch of this series
   to handle the intermediate state for non-atomic MSI update.
 - Added new PATCH6 in this series to remove stale kconfig option
   GENERIC_PENDING_IRQ_CHIPFLAGS.

Changes since v2:
 - Rebased upon Linux-6.14-rc1
 - Dropped PATCH5 of v2 series since that patch is already merged

Changes since v1:
 - Changed series subject
 - Expand this series to use GENERIC_PENDING_IRQ in IMSIC driver

Andrew Jones (1):
  irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base

Anup Patel (7):
  genirq: Introduce irq_can_move_in_process_context()
  genirq: Remove unused GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option
  RISC-V: Select GENERIC_PENDING_IRQ
  irqchip/riscv-imsic: Separate next and previous pointers in IMSIC
    vector
  irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
  irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
  irqchip/riscv-imsic: Special handling for non-atomic device MSI update

Thomas Gleixner (3):
  irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
  irqchip/riscv-imsic: Move to common MSI lib
  genirq: Introduce common irq_force_complete_move() implementation

 arch/riscv/Kconfig                         |   1 +
 arch/x86/kernel/apic/vector.c              | 231 ++++++++++-----------
 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-gic-v2m.c              |   1 +
 drivers/irqchip/irq-imx-mu-msi.c           |   1 +
 drivers/irqchip/irq-msi-lib.c              |  11 +-
 drivers/irqchip/irq-mvebu-gicp.c           |   1 +
 drivers/irqchip/irq-mvebu-odmi.c           |   1 +
 drivers/irqchip/irq-mvebu-sei.c            |   1 +
 drivers/irqchip/irq-riscv-imsic-early.c    |  14 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 197 +++++++++---------
 drivers/irqchip/irq-riscv-imsic-state.c    | 152 ++++++++++----
 drivers/irqchip/irq-riscv-imsic-state.h    |  12 +-
 include/linux/irq.h                        |   7 +-
 include/linux/msi.h                        |  11 +
 kernel/irq/Kconfig                         |   4 -
 kernel/irq/internals.h                     |   2 +
 kernel/irq/migration.c                     |  21 ++
 18 files changed, 389 insertions(+), 287 deletions(-)

-- 
2.43.0


