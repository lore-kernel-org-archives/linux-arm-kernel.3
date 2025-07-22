Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF948C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 09:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sm1KGX98kxBfN6necJmLRumQ56/uPS0vRTAlrvMNNnU=; b=vV29a4RgFCqVUVFTl+sONcNhwX
	a1WFp2oPkRhxnuZ6EzWBAqAKJAH3BJ6Nr8UqCbwrv2EiVCmmVSBO5L3zmOdkGKFYYuc1rZfOxKjnv
	Vt1xKXnw4nJVdH3O8mVOYS54ZX6zEjQukNeyFZw4+ELBqLiHpSCBUDR3vXtODtXd0zJMMkO0DiJZE
	xGJ+G01WdgwgGko2QdVCjovo0dWc5PqrZIwLT8O0udNl7VPRIQCWml3nc5Yd42YsrWYWyclxPyzKq
	Y4y+TyYiJlImC1RRYoJxDtruw5cseJlrFVTmD+1lXbhAXpOLegOP5PyMH5vWxAaX8FrUKu5qGrbB9
	ghydRVjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9mI-000000024pq-2LtY;
	Tue, 22 Jul 2025 09:59:18 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9fI-000000023wH-3DSg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 09:52:08 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 22 Jul
 2025 17:51:56 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 22 Jul 2025 17:51:56 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Thomas Gleixner
	<tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Kevin Chen
	<kevin_chen@aspeedtech.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v3 0/2] irqchip: aspeed: Add AST2700 INTC debugfs support and yaml update
Date: Tue, 22 Jul 2025 17:51:54 +0800
Message-ID: <20250722095156.1672873-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_025204_806557_AF7760F3 
X-CRM114-Status: UNSURE (   7.94  )
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

This patch series adds device tree bindings and driver support for the
AST2700 SoC¡¦s two interrupt controllers (INTC0 and INTC1), along with
debugfs entries for runtime inspection of routing and register protection
status, and bindings example refine.

v3:
- aspeed,ast2700-intc.yaml
  - improve commit message description.
- irq-aspeed-intc.c
  - add platform driver for "aspeed,ast2700-intc0/1" compatible nodes.

v2:
- fix dt bindingcheck

Ryan Chen (2):
  dt-bindings: interrupt-controller: aspeed: Add parent node compatibles
    and refine documentation
  irqchip: aspeed: add debugfs support and AST2700 INTC0/INTC1
    routing/protection display

 .../aspeed,ast2700-intc.yaml                  | 158 ++++++++----
 drivers/irqchip/irq-aspeed-intc.c             | 238 ++++++++++++++++++
 2 files changed, 353 insertions(+), 43 deletions(-)

-- 
2.34.1


