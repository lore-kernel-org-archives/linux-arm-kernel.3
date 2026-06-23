Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E187BCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 01:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ho6mfZDKt5P/lI1DeJovBwIq6peowlJbrBhGda+8Pak=; b=VG0/aAM9XsSRoO4x00W1cpE5v2
	pbiCwtYz7RvMSgckGVPH5tkhfI+Dsw0/mcanHaPdaqRvbBtZ6ECajQ9hRUr2BS3P9JRUYxwml1poo
	tbA1w484zZCR6J1fzDOh4qyu1wVIWIyHB8M3EmqrgLx6BGR6B2tDtpzwZCK05BhHOo3jYVSRl+PV4
	XC/H6p6nS9zq9gVu9FWtXSylLkimfjxU+YFaTQYWRqmUbZIKQQ5uGtpj6IVtsTGTJGgYOWDjkCWXu
	xF4JipX8bvtaUp0v589C1eDh5Qs199WZInRy14bUMLlf1zkM2E468BJtIGAz6eWUdH44sV+NjP+rh
	01gstNcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpkL-00000005X7U-11MA;
	Tue, 23 Jun 2026 01:16:13 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpkH-00000005X5B-3qkK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 01:16:11 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 23 Jun
 2026 09:15:54 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 23 Jun 2026 09:15:54 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Tue, 23 Jun 2026 09:15:51 +0800
Subject: [PATCH v33 2/5] i2c: aspeed: Read clock-frequency via
 i2c_parse_fw_timings()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260623-upstream_i2c-v33-2-6d5338fc56ed@aspeedtech.com>
References: <20260623-upstream_i2c-v33-0-6d5338fc56ed@aspeedtech.com>
In-Reply-To: <20260623-upstream_i2c-v33-0-6d5338fc56ed@aspeedtech.com>
To: <jk@codeconstruct.com.au>, <andriy.shevchenko@linux.intel.com>, Andi Shyti
	<andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, Rayn Chen
	<rayn_chen@aspeedtech.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782177354; l=2076;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=bu5HMc2Z/yj0Ft5OgeLngLhHplEIK0fnHLwW0MpLC2E=;
 b=7Gjcgu/z4EoX5r6IRk4JiFyFKMKRIkQV1XlQedPVLkwOLEl8DnUMD3A24Ik98kXwHzO+sLH/M
 de9T3LkcOsvA5hldIAPqlP+GJ2qw207ipswOWmM3VUyplHErJ25y7kN
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_181610_156615_2575DC9B 
X-CRM114-Status: GOOD (  12.55  )
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

Use i2c_parse_fw_timings() to read the standard "clock-frequency"
property, and fall back to "bus-frequency" only when the standard
property is absent.

This honors device trees written against the updated
aspeed,ast2600-i2c binding without silently falling back to 100 kHz,
while keeping existing in-tree device trees using "bus-frequency"
working.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v31:
- Zero-initialise `struct i2c_timings timings` so the bus-frequency
  fallback runs when clock-frequency is absent (Sashiko AI review).
---
 drivers/i2c/busses/i2c-aspeed.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index a26b74c71206..f00bd779146e 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -1000,6 +1000,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	const struct of_device_id *match;
 	struct aspeed_i2c_bus *bus;
 	struct clk *parent_clk;
+	struct i2c_timings timings = {};
 	int irq, ret;
 
 	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
@@ -1025,12 +1026,18 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	}
 	reset_control_deassert(bus->rst);
 
-	ret = of_property_read_u32(pdev->dev.of_node,
-				   "bus-frequency", &bus->bus_frequency);
-	if (ret < 0) {
-		dev_err(&pdev->dev,
-			"Could not read bus-frequency property\n");
-		bus->bus_frequency = I2C_MAX_STANDARD_MODE_FREQ;
+	i2c_parse_fw_timings(&pdev->dev, &timings, false);
+	if (timings.bus_freq_hz) {
+		bus->bus_frequency = timings.bus_freq_hz;
+	} else {
+		ret = of_property_read_u32(pdev->dev.of_node,
+					   "bus-frequency",
+					   &bus->bus_frequency);
+		if (ret < 0) {
+			dev_err(&pdev->dev,
+				"Could not read clock-frequency or bus-frequency property\n");
+			bus->bus_frequency = I2C_MAX_STANDARD_MODE_FREQ;
+		}
 	}
 
 	match = of_match_node(aspeed_i2c_bus_of_table, pdev->dev.of_node);

-- 
2.34.1


