Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705CCC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 08:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f84RxVQSOLpB8f+3Kw6/tfkLcBysycUkVkvuR3ETJMc=; b=VtldMm4lDA6YY3LLbK0SZfQep1
	vQxX+a13VA6sdetNibRc3SHAK41mvIHF9sgLdEyEdzYva03A1UnT4BNaDyh+Ls3tNjJr8HfgQwqou
	hnwJcajPC8nt6EmakIRlndt3+X1epbh6ttjDT/hRrrVZZB77DbRAVpix30USnQeyqL3adxUq/hAZG
	a19GAtzc/TdSQBlxpHiMoKhwfCW1hp5U+AtImf2tmMxliTEbcvNN2vXtgwbQP4uyU5iGZGO1q2gpp
	fEq+u7XyQFlS9FfkAbmt/K2tXrnjX9o+QpfVq6EMl3hk92juIZhV9t90cjFA5VEve+BPjzmxVCyVo
	IWuiWJsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwyM-00000003pth-44TE;
	Mon, 17 Feb 2025 08:59:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwwt-00000003pZ1-2lnF
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Feb 2025 08:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=f84RxVQSOLpB8f+3Kw6/tfkLcBysycUkVkvuR3ETJMc=; b=pZ0PfDNQ1QKfrzD7uHUMd1P0xn
	46ykWAwYEtS4HTbzaDI7wav/VmYdxN5Vmk3DPyIpw7R6XEZ40ax2yfIu2jpDeTDn81hLVmDubwrtZ
	onpa/05qEJFYfE0OPSuZ8d8IXUBv5MiHPVqvu/9JBBbBGuA4znffLOfZZX0zv2mKwezBqVbTT7WsR
	hCZGPZaJ+kpgvzQpbfJ0cH+QlOU0FtCfBqeoBj+efG6P8x459zZK8H4Cj+LRK8hgzUvgyok+0gn6F
	bdGasgGEE1GTYe/i+2xPRCgE3awW/uQfTC2G2gy6ua8CZ8T+tj4yCQjL2+XCodfVIJYWRKIeHTM7e
	hN1r0w4Q==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwwq-00000001jlQ-1nbk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 08:57:54 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-220ec47991aso37371135ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 00:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782669; x=1740387469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f84RxVQSOLpB8f+3Kw6/tfkLcBysycUkVkvuR3ETJMc=;
        b=PxVdWxhN18AupSU7KglvMGiguBAgUw+XFj6hBx6fxO95d7wmQ7dpX2L/cDaBPpx/WH
         jRYBXnN/CPFCi4V3YtHlpdCOiiWJzM48OUXPIGkXKzOhHjJksu0P4RKVSQ3Lbl67mKum
         ypWpINxm4qZCdU3dzpMfBuQbQ/NQ6fd5d626JuLiao6o+vul7sxQIoviK7gGUhdV8KE3
         YT0bY1EwVFLcUW+kfPCpLnsfu2XVIfXydTEfR5AfHlT74lV53rZ1ELo7sJM4F0ZNJ4+f
         VIXE/ELaJZIihSu7tDbbLwI/zmNrs/vAla8ZGFaQR+ijAzuP4tJKVHuJMurGPdiSxxHH
         XUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782669; x=1740387469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f84RxVQSOLpB8f+3Kw6/tfkLcBysycUkVkvuR3ETJMc=;
        b=Z2FNc/KAGnyeTrfq5VvD0IuSxsSFvLQRczs9HOjdXHNtXfZAjxrrM8qFykgjOzNHl6
         CZridKVZy3QAm2xDtxUv39UwYrt+yZUuSv8ISk3z/P27R1huovSUSX6HBQVwoRfGEHnK
         IhbKk7nIekSzTXF14jSIuh6VlYYIhbCwn6aX9FUotl1VQsti1u19f7siTqW9Wi/JqtQP
         dwqWmXn++7xMNtj+3NgqiM+qwYr+OEw8ltY9F6tge4Mi8g/RJLYb27O93FrOKZtWS4R7
         clTMg1VAW9ERCDfWJjMiHrflgNUkcI8kBMVlglcksIIMFGWaWahAbt4yEriHcjCfAfke
         jFgg==
X-Forwarded-Encrypted: i=1; AJvYcCUmUACDmMV32kERGYMw07+equ/j/SevcNU6TJUKtZRMutZiI04H0mZxnnskQvLbFxnCVP1E+XMc1C9djxLrimxv@lists.infradead.org
X-Gm-Message-State: AOJu0YwPtrWyVX8LX+YKtcE41XrWivqN9QsyGo4t0c6u4GD9FpTdpXiq
	sevQONItuEMk8eRIzJa3GZYB6oqCZNDHXHtjedHKs6nUhwGyKAVwh4vrRY84aRk=
X-Gm-Gg: ASbGncumJMoLbRcYgHm8FzaZm+O2gQJfxDGLjf2U6MHcqz1GhBcoApkWjlwx3Pf8kCN
	ly2U8RqQDMLSrpsqlYt7cLQ/rRtTC/JhLM3Owwtid0mj19KQFoiEF6x4LK9B+L41fuszaoNHmID
	ZzUNSpGAH4VlfO5dAOfYDiIBOn7FC+HBt2myqMsxE8PpKgkX5s1abv+sNwXDSRVGBXQrQpNyOdb
	8t+jAeDvOMFvwb/kgX0eO3cmASjKztNvMqsKAtcWrrlJa1uzS4rgQNaCVbUb/YFrlsMcYUXMlMZ
	Abc8CP1cmLXtLrFhRietIkm7xMKE/QFJgbV4Cu/nvhH6kVnyPbRBk1A=
X-Google-Smtp-Source: AGHT+IF82L3fcPzRQrN7o7ULHVaO9xfwesocSc13p9Vkcov8kHTq/Q8PStQAxAacABCzFd34cRy1kw==
X-Received: by 2002:a05:6a21:e8d:b0:1ee:7ddf:f40c with SMTP id adf61e73a8af0-1ee8cb499ccmr13555954637.11.1739782669344;
        Mon, 17 Feb 2025 00:57:49 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:57:48 -0800 (PST)
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
Subject: [PATCH v6 00/10] RISC-V IMSIC driver improvements
Date: Mon, 17 Feb 2025 14:26:46 +0530
Message-ID: <20250217085657.789309-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_085752_590943_90364619 
X-CRM114-Status: GOOD (  12.47  )
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
PATCH3: Updates IMSIC driver to use MSI lib
PATCH4 to PATCH5: Preparatory patches for moving to GENERIC_PENDING_IRQ
PATCH6 to PATCH10: Patches to use GENERIC_PENDING_IRQ in IMSIC driver

These patches can also be found in the riscv_imsic_imp_v6 branch at:
https://github.com/avpatel/linux.git

Changes since v5:
 - Rebased upon Linux-6.14-rc1
 - Drop PATCH6 since it is already merged
 - Update commit description of PATCH1

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

Anup Patel (6):
  genirq: Introduce irq_can_move_in_process_context()
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
 kernel/irq/internals.h                     |   2 +
 kernel/irq/migration.c                     |  21 ++
 17 files changed, 389 insertions(+), 283 deletions(-)

-- 
2.43.0


