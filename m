Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2FACA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qkONQe07m6jf0xs37mAe6kNt/ca2rkezm7xcDbaPjs=; b=TRbrz1SB+iLghiaUgpQfn5xvRy
	tOQ/mVbkKD/zADRWlsDXt0UkFIvqNFooT2AwfvtDGr5tsBBgoz6lQsUBZX+ujHpeMKU14I6md5Qfy
	eX5bjQCCYxdCVx+lPaZmItO0gOS5LIki3Qz+92xP0fDZ1DF++rLcJvd0avJMzUAIdE1HdyYl/878/
	emLyn+YfJJTNn/KoUob5TP0yrHqMqCU3mCs+XOQF79iYdBhqL3Xlyq84D/s4To2SnHBQuWVUkJJJw
	2GDFlpGbihAhTNJL1Pxx9xnnAD4yL1D/84Cvc1L/YYpzrvnTIdqsW0ACZc/nGoc1ZV1ifoG8RB5he
	jLfJjohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfqe-0000000GABr-3Plf;
	Mon, 05 Oct 2026 10:23:08 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfqc-0000000GA91-1VUT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 10:23:07 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 5 Oct
 2026 18:22:54 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 5 Oct 2026 18:22:54 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Mon, 5 Oct 2026 18:22:54 +0800
Subject: [PATCH v3 2/3] iio: adc: aspeed: Use syscon phandle for trimming
 data when available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261005-ast27xx-adc-upstream-v3-2-ef25552d3a59@aspeedtech.com>
References: <20261005-ast27xx-adc-upstream-v3-0-ef25552d3a59@aspeedtech.com>
In-Reply-To: <20261005-ast27xx-adc-upstream-v3-0-ef25552d3a59@aspeedtech.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"Ryan Chen" <ryan_chen@aspeedtech.com>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>,
	Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791195774; l=2496;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=YH4Cmu/CfrLuJThDgte/J3hpKgFwZ2I49f2dMQ61fI4=;
 b=FS0L5yTDLB2vZ3FQ7ws2UDJYqFOC+LaJ/sEIbbX6NRuZwwsf5jHVySmf8Mp6I6XDzcnClBGJu
 qkIca1S0By5C7QDScqEw6GBPTQVt2aisWBk1oMiBluk/IJmG2e0QmjD
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_032306_415592_854339D9 
X-CRM114-Status: GOOD (  11.58  )
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

aspeed_adc_set_trim_data() locates the SCU holding the ADC's
reference-voltage trimming data with of_find_node_by_name(NULL,
"syscon"), a global search that matches the first device-tree node
named "syscon" regardless of which SCU instance it actually is.

On AST2700, which splits its SCU into "syscon0" (soc0) and "syscon1"
(soc1), both nodes share the same node name "syscon" and only differ
by label and unit address, so the lookup always resolves to syscon0
even though the ADC's trimming data lives in syscon1.

Use the new "aspeed,trim-syscon" phandle property when present to look
up the correct regmap directly, falling back to the old global by-name
search when the property is absent so existing device trees keep
working.

Fixes: 9d8b88ffb773 ("iio: adc: aspeed: Add AST2700 ADC support")
Assisted-by: LLM
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/iio/adc/aspeed_adc.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 6169ce28261e..a31ba7b0efc1 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -201,18 +201,29 @@ static const struct iio_chan_spec aspeed_adc_iio_bat_channels[] = {
 
 static int aspeed_adc_set_trim_data(struct iio_dev *indio_dev)
 {
-	struct device_node *syscon;
+	struct device_node *np, *syscon;
 	struct regmap *scu;
 	u32 scu_otp, trimming_val;
 	struct aspeed_adc_data *data = iio_priv(indio_dev);
+	const char *propname = "aspeed,trim-syscon";
 
-	syscon = of_find_node_by_name(NULL, "syscon");
-	if (syscon == NULL) {
-		dev_warn(data->dev, "Couldn't find syscon node\n");
-		return -EOPNOTSUPP;
+	np = dev_of_node(data->dev);
+	if (of_property_present(np, propname)) {
+		scu = syscon_regmap_lookup_by_phandle(np, propname);
+	} else {
+		/*
+		 * No "aspeed,trim-syscon" phandle: either a single-SCU SoC,
+		 * or a DTB predating the property. Fall back to the old
+		 * global by-name lookup for backward compatibility.
+		 */
+		syscon = of_find_node_by_name(NULL, "syscon");
+		if (!syscon) {
+			dev_warn(data->dev, "Couldn't find syscon node\n");
+			return -EOPNOTSUPP;
+		}
+		scu = syscon_node_to_regmap(syscon);
+		of_node_put(syscon);
 	}
-	scu = syscon_node_to_regmap(syscon);
-	of_node_put(syscon);
 	if (IS_ERR(scu)) {
 		dev_warn(data->dev, "Failed to get syscon regmap\n");
 		return -EOPNOTSUPP;

-- 
2.34.1


