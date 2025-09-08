Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA07CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 01:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a9z27UVsU1jEb4XL5ZPmznsWnoATR9aoTY0tW7aWwAE=; b=rJEymCyUyduAC7
	dHfbva8DPza4UkHAxbxWNDkB0LkyBRyuU8ck+VZDyaYU3m1HC4lR1f8DpEB3b97Et+WK6NC46pNhc
	VAfXcTGj0W8xEOYRaqaUih/fFst6Da0k1f4PGJIa4fSsa4FG8eaBYdAwgyXpW2g63u8L7QlLOch8H
	4wPwHJo6Ra/+TYCvI/4StDATVbX/EavfVzGYqM1J0dRPg5RjQNedXLTICX9yvFEvwv2cajkLIVNn7
	0RK7aQGeGIVM6jeGlSRYjRfuVwncMtwcrG456w/ECAXtALqsqPKWikoSIzby0NkIHgaTKZ9TE6YXV
	h8TJ8HA1VZG8YSHWqb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvQZH-0000000DkN7-41qC;
	Mon, 08 Sep 2025 01:21:15 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvQWS-0000000DjcM-2rSn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 01:18:22 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 8 Sep
 2025 09:18:12 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 8 Sep 2025 09:18:12 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Eddie James <eajames@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Lee Jones <lee@kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 0/4] irqchip: Add support for Aspeed AST2700 SCU interrupt controller
Date: Mon, 8 Sep 2025 09:18:08 +0800
Message-ID: <20250908011812.1033858-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_181820_723413_E3EEA199 
X-CRM114-Status: GOOD (  11.45  )
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

This series adds support for the SCU (System Control Unit) interrupt
controllers on the Aspeed AST2700 SoC.

AST2700 follows the same multi-instance SCU interrupt controller design
as AST2600, with four independent interrupt domains (scu-ic0 to 3).
However, unlike previous SoCs that use a single register for both enable
and status bits, AST2700 splits them into separate IER (Interrupt Enable)
and ISR (Interrupt Status) registers.

To support this, the driver is refactored to use a variant-based init
structure, selected by compatible string. Register access is also
converted from regmap to MMIO (via `of_iomap()`), and a per-variant
IRQ handler is used depending on register layout.

v4:
- irq-aspeed-scu-ic.c
 - fixed missing inital mask = scu_ic->irq_enable << ASPEED_SCU_IC_STATUS_SHIFT;

v3:
- irq-aspeed-scu-ic.c
 - update for bracket-rules.
 - update TAB not spaces to align.
 - remove stray TAB.
 - update end up aligned.
 - add missing _ier, _isr in SCU_VARIANT.
 - add two different mask/unmask/ functions for split and combined.

v2:
- Refactor SCU IC driver to support variant-based initialization
- Add AST2700 compatible strings to YAML and header files
- Extend DT bindings in mfd and irqchip for AST2700
- Add IRQ handler logic for separate IER/ISR layout

Ryan Chen (4):
  irqchip/aspeed-scu-ic: Refactor driver to support variant-based
    initialization
  dt-bindings: mfd: aspeed: Add AST2700 SCU compatibles
  dt-bindings: interrupt-controller: aspeed: Add AST2700 SCU IC
    compatibles
  irqchip/aspeed-scu-ic: Add support AST2700 SCU interrupt controllers

 .../aspeed,ast2500-scu-ic.yaml                |   6 +-
 .../bindings/mfd/aspeed,ast2x00-scu.yaml      |   4 +
 drivers/irqchip/irq-aspeed-scu-ic.c           | 243 +++++++++++-------
 .../interrupt-controller/aspeed-scu-ic.h      |  14 +
 4 files changed, 174 insertions(+), 93 deletions(-)

-- 
2.34.1


