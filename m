Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16AAE8304C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 03:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y4s+INty3nLSWeCUHgwjXD0p8aoK4dYIUQrkUXCb3Rc=; b=tI6r4dzx9t+hjC
	G6Wth1hHmhu3s0w6NPi8H22ZGNlsUhsPf7jeMajSBkhXUBfwpKqtvRl9n7WFoNTUVkKZexhD1uRda
	fA/Nrh4n4cyFvx5rmawXhWnt8XW67OESf7tTVCu4rRy6CfuHZczF95hATzaDo0wvMnuR+CwCVPriy
	7e/+qcuikW7mHJVDKP2AHNa7THR0woeo/VbKq8SP3eVgfXLh4EfM++CC3SwjAtklu4174XTcCZbYc
	0kD0DIcLPCcb95TSt5chermTApmb3Qm0uvHzUQWrx4Cn2GBnB1+yr88YIrBBRBEPQd96a8gVwza1J
	my1paBYVIw0AGs1pcq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn7VZ-0000000628F-02cg;
	Tue, 03 Feb 2026 03:55:21 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn7VX-0000000627o-19XY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 03:55:20 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 3 Feb
 2026 11:55:11 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 3 Feb 2026 11:55:11 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: [PATCH 0/2] Add Aspeed G7 uart routing support
Date: Tue, 3 Feb 2026 11:55:07 +0800
Message-ID: <20260203-upstream_uart_routing-v1-0-6bd5dd75ee3b@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJtxgWkC/x3MQQqAIBBA0avErBMcg4iuEhFaU80ii1EjkO6et
 HyL/zMEEqYAfZVB6ObApy/AuoJ5t34jxUsxGG1ajY1W6QpRyB5TshInOVNkvylsOuPQELrVQWk
 voZWf/zuM7/sBs5ewumcAAAA=
X-Change-ID: 20260130-upstream_uart_routing-1382b12e1bfb
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Oskar
 Senft" <osk@google.com>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Jammy Huang
	<jammy_huang@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770090911; l=749;
 i=jammy_huang@aspeedtech.com; s=20251124; h=from:subject:message-id;
 bh=Yzxwwk1xNKZ8HQZTWD2jwu0MOFqIwNni2cmuV4TlO4E=;
 b=K4n9YOmkhu1fc21VIW0clRnhxsgFIt8wkaEXaoEFJCI1wcsRpPKCCrKPGFeenj1u4YQlTicXc
 E0/YRaMtDptBHLz6qMbzKsaVwZeXOhLmiXAj5vy1rmF3hVCs1TnLnYt
X-Developer-Key: i=jammy_huang@aspeedtech.com; a=ed25519;
 pk=E5YwijeJZZcuDR6srvwNlXrNHvLxwipUg3Mb/xxUF9o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_195519_319251_27007EBF 
X-CRM114-Status: UNSURE (   4.91  )
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

The Aspeed 7th generation SoC supports dual node. Which means there are
2 group of uart routing.
 * 0: uart0/1/2/3/9
 * 1: uart5/6/7/8/10

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
Chia-Wei Wang (1):
      soc: aspeed: uart-routing: Add AST27xx dual node support

Jammy Huang (1):
      dt-bindings: soc: aspeed: add aspeed,ast2700nx-uart-routing compatible

 .../bindings/soc/aspeed/uart-routing.yaml          |   2 +
 drivers/soc/aspeed/aspeed-uart-routing.c           | 424 +++++++++++++++++++++
 2 files changed, 426 insertions(+)
---
base-commit: 4d310797262f0ddf129e76c2aad2b950adaf1fda
change-id: 20260130-upstream_uart_routing-1382b12e1bfb

Best regards,
-- 
Jammy Huang <jammy_huang@aspeedtech.com>


