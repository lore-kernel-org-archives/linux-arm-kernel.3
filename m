Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C47D4A5F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 02:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q9AOzF2eotwZDBK8StpdkPFWxhtfoMznNPy43aPpEqQ=; b=mjCO4MgCEYlW0G
	IrtDnyN+i0PnDLHNXWeLDa+qDdLgOzuLzppqtb0iu2XMrzhhYLV0iAm7Yr465jXhgvOE4x/a6MIs8
	WOk4HnC0K3qpUgaOv8hoqilnqY8F9Y/ZxMuO6J9jqg6qvR/R0VLDlD/oyRCiVUf4PTp/kLKRZZxNC
	gyv7uMV8+w+f1USMJRKq0PnOYLpKl5R9w1x96fU8rj3WX4+2z8BXyQDt9GU73jb7wOovjsEqSicvw
	8KNoIRrZJVJ4mq5A0Om2eI1+i7GkF01GAgI4S1iNa3MPp353dBE1lLknc/gr70PokDFgI/fJLgMOE
	twt6RPmI5oDeKqMAgRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZxy-0000000DUik-45z9;
	Fri, 16 Jan 2026 02:53:38 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZxv-0000000DUhk-3vtS;
	Fri, 16 Jan 2026 02:53:37 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 16 Jan
 2026 10:53:26 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 16 Jan 2026 10:53:25 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH v2 0/3] Add AST2700 USB3.2 PHY driver
Date: Fri, 16 Jan 2026 10:53:23 +0800
Message-ID: <20260116-upstream_usb3phy-v2-0-0b0c9f3eb6f4@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACOoaWkC/2WNwQ6CMBAFf4Xs2Zq2ChVO/ochBuhie4A2XWgkp
 P9uJfHkcSZ583YgDBYJmmKHgNGSdXMGeSpgMN38QmZ1ZpBcVlwIyVZPS8Bueq7UX7zZmBKiGm9
 6RKVqyDMfcLTvI/loMxtLiwvb8RDF1/5i1/9YFIwziWVd1rxHqdW9I4+oFxzMeXATtCmlD4Yzd
 Ea1AAAA
X-Change-ID: 20260112-upstream_usb3phy-7116f8dfe779
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768532005; l=1184;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=skzeJJpNld7RftFrKl/uW1Nm9mq66q5prekuES1h6y0=;
 b=ZzNEGJC7S2ExCx1ucmhgJ/IaHbV9SFe7rxJCCD51oPhRXQLVkf+lUDG03WfXhwcplV/XRpzF6
 Y9nEy1qscYmAZjW4izS0qaAz9Dum99NrQm3UmW7MONiJiVKZKmpS40O
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_185336_005462_667B6504 
X-CRM114-Status: UNSURE (   5.27  )
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
Changes in v2:
- aspeed,ast2700-usb3-phy.yaml
 - Drop clocks, resets descripton.
- Kconfig
 - add COMPILE_TEST, remove default n
- Link to v1: https://lore.kernel.org/r/20260114-upstream_usb3phy-v1-0-2e59590be2d7@aspeedtech.com

---
Ryan Chen (3):
      dt-bindings: phy: aspeed: Document AST2700 USB3.0 PHY
      phy: add AST2700 usb3.2 phy driver
      MAINTAINERS: Add ASPEED USB3 PHY driver

 .../bindings/phy/aspeed,ast2700-usb3-phy.yaml      |  48 +++++
 MAINTAINERS                                        |   8 +
 drivers/phy/aspeed/Kconfig                         |  12 ++
 drivers/phy/aspeed/Makefile                        |   2 +
 drivers/phy/aspeed/phy-aspeed-usb3.c               | 236 +++++++++++++++++++++
 5 files changed, 306 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260112-upstream_usb3phy-7116f8dfe779

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>


