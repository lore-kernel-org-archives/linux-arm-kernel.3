Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13082E91268
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 06:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3h6HJz8NNrYlReHNuQDohxNkBviqiY9Qh90W6eUVqks=; b=1GpvPL0PZFpDi4
	EoS5bgLnGf5vkQrwED2pBBlzk1rZumDlRLk2kaWqlG2/OqbbyutUtXKnwIIraR1uZkzG22gQGiHHX
	E+lSUdbx5A1yYZyQppntw39svGm+svEtilrcatb1cQaJfPqwFEtnBSkyzITX6KvGyiUYD9uR759QA
	XsKgg2P5/djfYHreUHl2GuHx6stUHCLr320+TEemMII9fvQ3QOLxIE7PXQFfgEXlhgtRppZQpVSjf
	V0D3H9617Yoy+IH3qRmOI/qqm5DmGlC399R+BlS1cgu8mvLrnJB0AwZ4E1gjLa4rLOLnZ/5rEwpyy
	PBxk0pRanNZ0rLvy9ukw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnsWm-00000009UBN-1G6s;
	Thu, 05 Feb 2026 06:07:44 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnsWi-00000009U9q-2nW4;
	Thu, 05 Feb 2026 06:07:42 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 5 Feb
 2026 14:07:29 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 5 Feb 2026 14:07:29 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH 0/4] Add AST2700 INTC0/INTC1 support
Date: Thu, 5 Feb 2026 14:07:18 +0800
Message-ID: <20260205-irqchip-v1-0-b0310e06c087@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJYzhGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNT3cyiwuSMzAJd89TE1DRjM3OTlFRLJaDqgqLUtMwKsEnRsbW1APC
 PjmBZAAAA
X-Change-ID: 20260205-irqchip-7eaef3674de9
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770271649; l=3818;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=rDmI36wMlYPSwIc+H4llkof4eAuk8Sz030JtmtRFVJ4=;
 b=tMe7+qBoJqIpvk9QS5BEc1NujHzW57rW7AGNx4xk2x2iJRWTRjJwo/SzX3gvIayPcEgNNMcxW
 qlTUc2ct44eDAVTIOuK9PgPK5B6PQBOAp/sChagEtI/drVbY+ZeOq9l
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_220740_735894_2715B0AB 
X-CRM114-Status: GOOD (  13.57  )
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

This series replaces the existing AST2700 interrupt controller binding
and driver. The original implementation was focused on a narrow,
PSP-centric view and could not fully describe the complexity of the
AST2700 interrupt fabric:

* It was focused primarily on the perspective of the Primary Service
  Processor (PSP).
* It could not handle interrupt route configuration.
* It could not handle interrupt register protection.

By contrast, the new bindings and drivers describe the interrupt
controllers at the block-function level and provide a unified binding
design that can be used from the perspective of any of the four
integrated processors (the Primary, Secondary and Tertiary Service
Processors, and the Boot MCU):

* Can handle interrupt register protection.
* Can handle interrupt route configuration.
* Has a unified binding design that applies to the system perspective
  of any integrated processors ({P,S,T}SP, BootMCU).
* Provides enough information for any of the {P,S,T}SP or BootMCU to
  route interrupts intended for any of the other processors' interrupt
  controllers.

There are no known upstream users of the existing binding. This series
removes it along with the associated driver after introducing the new
binding and driver at the start of this series.

The AST2700 interrupt architecture is built around two controller
designs. INTC0 routes interrupt outputs to upstream interrupt
controllers (e.g. the ARM GIC used by the PSP, as well as interrupt
controllers associated with other cores such as the SSP and TSP).
INTC1 is a banked secondary controller whose interrupt outputs feed
into INTC0 via INTM lines. Connections between the two interrupt
controllers are described in the devicetree using the
aspeed,interrupt-ranges property.

The INTC0 driver creates a hierarchical irqdomain under the selected
upstream interrupt controller. The INTC1 driver implements the INTM-fed
banked controller and exposes a linear interrupt namespace to its
parent.

The design intent of the binding is that, by default, the interrupt for
a given peripheral is routed to the processor consuming that
peripheral. To support this, the devicetree provided to the operating
environment for each processor should set its own processor-local
interrupt controller (e.g. the GIC for the Cortex-A35 PSP) as the
interrupt-parent of INTC0.

Information derived from interrupt-parent at each interrupt controller
is incorporated into the route resolution algorithm implemented in the
INTC0 driver.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Ryan Chen (4):
      dt-bindings: interrupt-controller: aspeed: Add ASPEED AST2700 INTC0/INTC1
      irqchip/ast2700-intcx: Add AST2700 INTC0/INTC1 support
      irqchip/aspeed: Remove legacy AST2700 interrupt controller driver
      dt-bindings: interrupt-controller: aspeed: Remove legacy AST2700 interrupt binding

 .../interrupt-controller/aspeed,ast2700-intc.yaml  |  90 ---
 .../aspeed,ast2700-interrupt.yaml                  | 207 ++++++
 drivers/irqchip/Kconfig                            |  11 +
 drivers/irqchip/Makefile                           |   2 +-
 drivers/irqchip/irq-aspeed-intc.c                  | 139 ----
 drivers/irqchip/irq-ast2700-intc0-test.c           | 474 +++++++++++++
 drivers/irqchip/irq-ast2700-intc0.c                | 770 +++++++++++++++++++++
 drivers/irqchip/irq-ast2700-intc1.c                | 345 +++++++++
 drivers/irqchip/irq-ast2700.c                      | 105 +++
 drivers/irqchip/irq-ast2700.h                      |  37 +
 10 files changed, 1950 insertions(+), 230 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260205-irqchip-7eaef3674de9

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>


