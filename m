Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6A8CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WFkx4U9cuFXk03WjKVwN46GWivXczH1K5V0/kz3Ucco=; b=dZ0lLEKgcXPLs6
	bJqAT7I8VJC4kOZGMdu6qB1sOvunIQlC6b2gx9JUghZXu9lStAvSNEAY1LLP4t8El9UcVOimKLs30
	W+IOgK9thdJt+LyzbSIAF96bcf+Di3K6AzXrhEhcBMUsAaG7ymMZau9kQCTago6gSYz05Ms+eSnVu
	CpVXeS5ffR3lYHZ23nwTYkUhxx24Tstg9UzHpMNUZWY6JhaUwFE5oRN6AJ7wxNQEMRSjWNH64XBUo
	y8JfEk+XDQpUQp8guVoSGrP/Dl/rDbGJI8sZ9wd4sM90zd1i02C10f6T+AG2qBm4H9kyzivrMnXCp
	BlM2eMVl06KxaQo1Q8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrhw-0000000BHWO-3OvA;
	Tue, 12 Aug 2025 16:18:40 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullvp-0000000ATGU-3rOC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 10:08:39 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 12 Aug
 2025 18:08:30 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 12 Aug 2025 18:08:30 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Thomas Gleixner
	<tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Kevin Chen
	<kevin_chen@aspeedtech.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v4 0/2] irqchip/ast2700-intc: Add AST2700 INTC debugfs support and yaml update
Date: Tue, 12 Aug 2025 18:08:28 +0800
Message-ID: <20250812100830.145578-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_030837_957925_E31E5C7E 
X-CRM114-Status: GOOD (  11.85  )
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

This patch series adds device tree bindings and driver support for the
AST2700 SoC!|s two interrupt controllers (INTC0 and INTC1), along with
debugfs entries for runtime inspection of routing and register protection
status, and bindings example refine.

v4:
- aspeed,ast2700-intc.yaml
 - Clarify the relationship between INTC0/INTC1 parent nodes, the
   aspeed,ast2700-intc-ic child nodes, and the GIC.
 - Add a block diagram and DT examples showing the cascaded wiring
   (GIC <- INTC0 <- INTC1 children).
 - Mirrors the datasheet-described topology and register map, including
   the separation of INTC0/INTC1 regions.
 - Lets DT unambiguously express first-level (GIC parent) and cascaded
   second-level (INTC0 parent) interrupt controllers via examples that
   use `interrupts` for INTC0 children and `interrupts-extended` for
   INTC1 children routed into INTC0.

- irq-ast2700-intc.c
 - Drop all string decoding and human readable tables.
   Debugfs now dumps raw routing/protection registers only.
 - Split into a separate source file and made it modular
 - If the compatible not match ast2700-intc0/1, bail out return -ENODEV.

v3:
- aspeed,ast2700-intc.yaml
  - Clarify the relationship between INTC0/INTC1 parent nodes, the
    aspeed,ast2700-intc-ic child nodes, and the GIC.
  - Add a block diagram and DT examples showing the cascaded wiring
    (GIC <- INTC0 <- INTC1 children).
  - Mirrors the datasheet-described topology and register map, including
    the separation of INTC0/INTC1 regions and their routing/protection
    registers.
  - Lets DT unambiguously express first-level (GIC parent) and cascaded
    second-level (INTC0 parent) interrupt controllers via examples that
    use `interrupts` for INTC0 children and `interrupts-extended` for
    INTC1 children routed into INTC0.
  
- irq-aspeed-intc.c
  - separate c file from irq-aspeed-intc.c
  - make m

v2:
- fix dt bindingcheck

Ryan Chen (2):
  dt-bindings: interrupt-controller: aspeed: Add parent compatibles and
    refine documentation
  Irqchip/ast2700-intc: add debugfs support and AST2700 INTC0/INTC1
    routing/protection display

 .../aspeed,ast2700-intc.yaml                  | 158 +++++++++++-----
 drivers/irqchip/Kconfig                       |   6 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-ast2700-intc.c            | 174 ++++++++++++++++++
 4 files changed, 296 insertions(+), 43 deletions(-)
 create mode 100644 drivers/irqchip/irq-ast2700-intc.c

-- 
2.34.1


