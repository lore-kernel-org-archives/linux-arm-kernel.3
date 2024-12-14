Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A902CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 17:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mv0bHKD8tx/knjsXKIIRgI9/G/KQE3L8kp8HO/illC0=; b=Fo9FDELjx0IAPjDjeA99RIxFDJ
	KipPAie0nsCe/Pwje005r67j+1Z916gEEtL67rTVhDio4TrdHzyQwZlfKlRaqhUjP+bqg8CDs6Ojj
	ZCUGlrJMC0xfYiVLVKA6o6TWhZwkM8K1AUSik+Nl2ugZcj4xnin+cNcrxt+hEr+MA7615XJYSivK5
	Lvccx1V653H3dxCX7EBHAJIyZ0RGI1k60XUoxP48lpYBE8XYOWVNBI+4lqI4G58zaGKVJSEZkIax3
	Rdt3Zedd2It3bcKwqJGAGkDGQKYkSY4i9SmRQkNfe9rce3pNdHvfASgwXK+DGQFoLAqbDXd52kN3v
	CTlSNjIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVvC-00000006gb9-0Oa5;
	Sat, 14 Dec 2024 17:27:18 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVu3-00000006gJr-2JUw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 17:26:11 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2efa856e4a4so1965615a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 09:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197166; x=1734801966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mv0bHKD8tx/knjsXKIIRgI9/G/KQE3L8kp8HO/illC0=;
        b=bM4ioEBn8qnCb904DX7O1KMKVgHX6KAyrYVtaxqrERXqCsha8eHnWncyPZ7gG3k3op
         2xuIlLmwaTMe6NjLwVNGOvYZ+IxJMdM4xUig+WggoPjxE09eyQE2ItrDv6UkSoAuXSPa
         /tSMSLji34hVrVNpAE1AjzCwVfi7J/kL+Zyy6c51pUIkQLB9w5apwpSV6r4usktl6OBO
         cAgs4rqoqOZuUEn1M77Q67odBByd0COaEv84xOZ19+vpCwUO6dIjEDyeoLL5jdmwKPBE
         8Iduvd2sG5R86ieYNnRYs4pJFGhhucSVzcVW6SQAlQO9XJQfbwkpA/iopjfpUd2/muVv
         gRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197166; x=1734801966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mv0bHKD8tx/knjsXKIIRgI9/G/KQE3L8kp8HO/illC0=;
        b=eE9McOyQEQrTsipgYiC3AaeDPVrqptJNyB0JWABSwaFkatQz5x525HBJZfEPLtDMUh
         PXFp6sOB3IvBICTVjm5m/E+QiMkuii1s8KrmAw/InU2i6iQjyD/zvEZ2Sbl59Dra3TUZ
         t77MeFacQsXaB/J23efivwtye7C63fXdBsjTA3GrA2LRFe4DaU2pVvo4/nwwKF+mbHUl
         Tw0Ooyb3Z+yA8c2ueTUtYYGPrJ8v4by1npS4XK23eNbKQTcc4UcVbzCDu4E+Zd4E81NW
         DkveR9ExRtTXYtCThdlxpVrX1KciYIExI7nJepdM5pWKggDkf7u97vxA0GJDHByMarqu
         9/yA==
X-Forwarded-Encrypted: i=1; AJvYcCUQd8v/Mh/MloDPvw9p4wVj/BApNuijtUBxEbi0gKXbk/ls1nd4aWsiK22cw6I5iqFhYSDbDGGbSfuLiHLA5r+r@lists.infradead.org
X-Gm-Message-State: AOJu0YxY0NDRrhu6xp1+4/v4Y2yP9pXyV/tR+Ts/gBXt18raXSGLJgUC
	wqPzZnvYrtEHLBdgEZH/uTNDWhx89M7CZrkYsAMUAYe3g7kP3q3trWjDd9lwOG8=
X-Gm-Gg: ASbGnctC4jZuXdkoMUmg/O19+aZoW08Y8Ppn0hPQ0Kf4RPFAdWHnmjVIUuVewtKuk5t
	S8fDuUPKAVXHUrxi69Jp7a76tLdRBbx15y5EzLnL+YXZFMyLyYG7i4wuIuTmLm7mjwhvCyCYDRQ
	Lu41A/cwDslgXo5WBte69nUJ5IvNkF9litOCzTFxTVXUA+Y3owOE86wMn57teuVjWMr9SSHdAHV
	L08Npus5Fv8aH6hxdD+bQPiXr5MdslilyEtTWBTx6Uhqqbs3W02/3GzBB9vpKfUjJCsBbCHMMZ+
	maLK24FDlR++7QM=
X-Google-Smtp-Source: AGHT+IHyKbANKEj4g4KxocXm4yHOhpiEBiGMph5JPaoKcbo6rZ1/8zvn09yNoAs/k0KDXpN10M7D5g==
X-Received: by 2002:a17:90b:4c43:b0:2ea:5dea:eb0a with SMTP id 98e67ed59e1d1-2f28fa5beacmr9746521a91.4.1734197165633;
        Sat, 14 Dec 2024 09:26:05 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:05 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH v2 00/11] RISC-V IMSIC driver improvements
Date: Sat, 14 Dec 2024 22:55:38 +0530
Message-ID: <20241214172549.8842-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092607_777371_4C34ADC4 
X-CRM114-Status: GOOD (  11.12  )
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

PATCH1: Fix for handling non-atomic MSI updates
PATCH2 & PATCH3: Preparatory patches
PATCH4: Main patch which updates IMSIC driver to use MSI lib
PATCH5 & PATCH6: Preparatory patches for moving to GENERIC_PENDING_IRQ
PATCH7 to PATCH11: Patches use GENERIC_PENDING_IRQ in IMSIC driver

These patches can also be found in the riscv_imsic_imp_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Changed series subject
 - Expand this series to use GENERIC_PENDING_IRQ in IMSIC driver

Andrew Jones (1):
  irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base

Anup Patel (7):
  irqchip/riscv-imsic: Handle non-atomic MSI updates for device
  genirq: Introduce common irq_force_complete_move() implementation
  RISC-V: Enable GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS
  irqchip/riscv-imsic: Separate next and previous pointers in IMSIC
    vector
  irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
  irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
  irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED flag for PCI devices

Thomas Gleixner (3):
  irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
  irqchip/riscv-imsic: Move to common MSI lib
  genirq: Introduce kconfig option GENERIC_PENDING_IRQ_CHIPFLAGS

 arch/riscv/Kconfig                         |   2 +
 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-gic-v2m.c              |   1 +
 drivers/irqchip/irq-imx-mu-msi.c           |   1 +
 drivers/irqchip/irq-msi-lib.c              |  11 +-
 drivers/irqchip/irq-mvebu-gicp.c           |   1 +
 drivers/irqchip/irq-mvebu-odmi.c           |   1 +
 drivers/irqchip/irq-mvebu-sei.c            |   1 +
 drivers/irqchip/irq-riscv-imsic-early.c    |  14 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 177 +++++++++------------
 drivers/irqchip/irq-riscv-imsic-state.c    | 110 +++++++++----
 drivers/irqchip/irq-riscv-imsic-state.h    |  12 +-
 include/linux/irq.h                        |  15 ++
 include/linux/msi.h                        |  11 ++
 kernel/irq/Kconfig                         |   4 +
 kernel/irq/chip.c                          |  39 ++++-
 kernel/irq/irqdomain.c                     |   1 +
 kernel/irq/migration.c                     |   9 ++
 18 files changed, 262 insertions(+), 156 deletions(-)

-- 
2.43.0


