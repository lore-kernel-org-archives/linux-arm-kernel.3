Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F7AD31A18
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 07:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qHAYOi45ZPVstJeJIyr7EDMfTMCOs4UGm3gFy9d9sKA=; b=Q3HghHB/CIM9Ve
	L89Xt/NJTIAgYrBf9Y+FS0yk2MqBHWe0GTLX5P6Ylhq/O9Ns6RCX+eI3NPGTxQ+tP98RbJfPTZawv
	G2aHvHFQQavZ4K5s+zR+9WcjSktbau1swQMUtaui0+AWXSyPA6Jv7SNugR8icb1CoK6wmZKhCOXF8
	UnHvOP6gIirIip3SK4PcNpKsWRKCMXHkIzba06A+EpGhT352N/V06sSIryyJ4USWBVXCRonkyR4Uj
	qfhfsvoOnnF3/rtuTOeabd/xxNBqfUxfjAfgfE4Jiz+R0QTPkJjq9y5aVXQYiHqcJyNJtuxeJlEm+
	bkeU0uuk/ZZxf3sCumdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfv4H-00000008AYb-0P37;
	Wed, 14 Jan 2026 07:13:25 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfv4C-00000008AXF-3M6d;
	Wed, 14 Jan 2026 07:13:22 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 14 Jan
 2026 15:13:11 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 14 Jan 2026 15:13:11 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH 0/3] Add AST2700 USB3.2 PHY driver
Date: Wed, 14 Jan 2026 15:13:09 +0800
Message-ID: <20260114-upstream_usb3phy-v1-0-2e59590be2d7@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAVCZ2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Mj3dKC4pKi1MTc+NLiJOOCjEpdc0NDszSLlLRUc3NLJaC2gqLUtMw
 KsJHRsbW1AKsxE7ViAAAA
X-Change-ID: 20260112-upstream_usb3phy-7116f8dfe779
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768374791; l=943;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=9UWvYzBx32LAyAt3jySR0UVGJFylhu6VIM7tiOpCLDs=;
 b=eQ2rKFJ1FRU0O3R7mFvEWDDNBL6LnibYzov4c3GiIJLNE7Bc/CJEp4FDuHKPKffv2YzFhoect
 rZ8MuHvEhbvCTCZeNTNkTAzOawW6M2kA51RmNrG4X5VkSXsYt03yD0e
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_231320_843829_962FE938 
X-CRM114-Status: UNSURE (   4.73  )
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

Add AST2700 USB3.2 PHY support.
 - Supports Super Speed Plus Gen2x1 (10 Gbps), Super Speed (5 Gbps),
   High Speed (480 Mbps), Full Speed (12Mbps), and Low Speed (1.5 Mbps).

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Ryan Chen (3):
      dt-bindings: phy: aspeed: Document AST2700 USB3.0 PHY
      phy: add AST2700 usb3.2 phy driver
      MAINTAINERS: Add ASPEED USB3 PHY driver

 .../bindings/phy/aspeed,ast2700-usb3-phy.yaml      |  50 +++++
 MAINTAINERS                                        |   8 +
 drivers/phy/aspeed/Kconfig                         |  13 ++
 drivers/phy/aspeed/Makefile                        |   2 +
 drivers/phy/aspeed/phy-aspeed-usb3.c               | 236 +++++++++++++++++++++
 5 files changed, 309 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260112-upstream_usb3phy-7116f8dfe779

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>


