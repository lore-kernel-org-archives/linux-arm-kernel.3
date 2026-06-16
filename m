Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74187CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 03:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nJ5OEFZy7nj2uyFJmqnDumGMHfGkIB4K5n7IIqro29M=; b=hhnvEVB6eG4GuK
	4QPuPD/C8hl5INLEsyEFsOA4ICX7DBiZ5REzaMvvG92jMt4Ak+rpx33BqjrNrOCPATh4bwN7ec6QX
	u9FmSUzQuEERUTvnQPIMyzugoDBBwDkJD1T2YMTY6jt8q4O2RIVBL7DrBDSeycpNk8v4lHMf1iQP1
	rlKJG51/RrWTTeriU0ftg6D1lgFBTHX8IEE3QFI17yYVRAyM+t1A/tFayb1s9jL8yPgbRT77JKb6T
	fsU9YNPWMdyTcAVy6zmjNBaqUepfE9OCAg+wOG9Gua8Z94rdnBH2+3ePHs0N5QGPirgUx3MLOPIpp
	6JyuVE6Yx6yvCi+n4evg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZKVF-0000000F9Dd-30Kj;
	Tue, 16 Jun 2026 03:30:17 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZKVB-0000000F9CX-49zZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 03:30:15 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 16 Jun
 2026 11:30:02 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 16 Jun 2026 11:30:02 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH 0/2] pinctrl: aspeed: Make AST2700 SoC1 JTAG master TRST
 optional
Date: Tue, 16 Jun 2026 11:30:00 +0800
Message-ID: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADnDMGoC/x2MQQqAIBAAvyJ7bsE1UOgr0SG2rRbCRCOC8O9Jx
 xmYeaFIVikwmBey3Fr0jA2oM8D7HDdBXRqDs85bTw6TRr7ygas+SEwSuA/OE0MrUpam/9s41fo
 Bl38dYV0AAAA=
X-Change-ID: 20260612-pinctrl-fix-1c1e7c37261c
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij
	<linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>
CC: <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Billy Tsai" <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781580601; l=1278;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=clIW3mqQh+QXIWxnyxrFoyC5AKtAFPYDP4kc7EQtnBk=;
 b=IE+rJ0KmC/MBgTobjoqpYiPsgcvPlPwuwhMeeVU4dF0pNKrT6GZt9EOwOIxSurQTiqnGq0nO1
 qCKtBnQTG5XCTz+5Y8OLyAPwhetW1bytcJRT4PmhZdI54cI6St0qwPJ
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_203014_065089_65AEE751 
X-CRM114-Status: UNSURE (   9.50  )
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

The JTAGM1 pin group of the AST2700 SoC1 includes ball D12, which
carries the TRST signal. TRST is an optional signal for a JTAG master:
designs that do not wire it may need the D12 ball for other functions,
but with TRST embedded in the group they cannot use the JTAG master at
all.

Split D12 into a new JTAGM1TRST group under the existing JTAGM1
function, so TRST is only muxed when a board explicitly requests it.
Patch 1 adds the new group to the device tree binding and patch 2
splits the group in the driver.

Note that this changes the meaning of the existing JTAGM1 group: boards
that do use TRST now need to select both the JTAGM1 and JTAGM1TRST
groups.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Billy Tsai (2):
      dt-bindings: pinctrl: aspeed,ast2700-soc1: Add JTAGM1TRST group
      pinctrl: aspeed: Split TRST out of the AST2700 SoC1 JTAGM1 group

 .../devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml    | 1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c                     | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)
---
base-commit: 761af93c9f1a100b8d9f71aa744b8f9abbbbbfb2
change-id: 20260612-pinctrl-fix-1c1e7c37261c

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


