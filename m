Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E31CA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDPHoST4ODszdAmErT9aYCiK47UDqtogxsmJikIRfks=; b=a75uKv44mARa9BZeKwVTNFWjpE
	dw3xDC2Pg20jxWj8mtJZck/fGLcS3NOcSbnZSsk2x9liPs8ACQvdlvab+JLMCYkkZamMXiBI5g8SV
	yEJbImWo11AZfZgDPU4WoCFe6uo2f5EGxFbOWIQq05v+UdcgROSKEbA745MrB1pKjHA0F9RucGsrr
	mwpYasiz6VqXInMDb76krzJHukCXd9pV3SsQGM6ff6b6q4RGRNfEOnBA6CMa8rk3NQiFHkPr1YTgB
	TKpIr4pOg800qNJz4B81OjG0QhW5ni/ryoVfZX5xVWsGTNhKwZDZJIRX7XQ1nIBUndZe0VBwSpR6g
	wax1d7gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv9k-00000006HcC-3K7i;
	Wed, 30 Sep 2026 14:19:42 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv9Z-00000006HT6-1swB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 14:19:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrKFepdHV9E7Gjdg1rZMXdK/OIk46fGVjnEuo/tabJmsWSirZLG7nTivm4sHaKiruX+GhebPA7y6fdUxMaRku4A29jdUNS5yDJncxyifFyray+2LtiUL99vOVqOWbjiPF2vBKLqsg+nVGKzxlXG8nyC631bV7NOLUvmrH77E3DItAGKS2mBTjRTeEcuoVOBjoV7o/DZ0irAIwytRoBZKeZU4FEot1s1HrmAw/71PS8YS4NMPNp0hKMMGV4SQ5ipROrMaXWDjbtlf9GuQLe1OWBhuarlEHBXAxR+DfVwQhiRenE0YOsxBhyNT7yiMBDRqgrya6bI6Hp7V5vDnc2Z87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDPHoST4ODszdAmErT9aYCiK47UDqtogxsmJikIRfks=;
 b=eCzrPRPS8YjVXYLMCc0rA+hI0SnCERBqZ9lmzH6MuvrqQn+KsPbquccWL0cfND+iNPNOij4vD89Nc1LGqNgoExbFbjQlCjVBD6RV0sNORwVOL1yRCw7iYuJ4ES+LpSIOJJkgubqM/i2kg2BnBiQclS8FI0Fa/2m3RdHvpRDJDZx1lvEhY20pgzOrWf3S68m0e9RKacX8z5eORPRoIYz5QE6sqvfd8PJ5yflpTfQJMdIo3IrbBPWuIkzo6CJz/I2Ef6bmzSpnTRFs5h8/2DdwcFyDfBvRc3xe21c3iINnqGzfqwOZLgEevvCY4TOWCf/xh13G2tg3Fg/bmeJjdFoJZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=baylibre.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDPHoST4ODszdAmErT9aYCiK47UDqtogxsmJikIRfks=;
 b=BfOmB0tQFKV85BXS5pJkUsz7liSjJuYf5koJ8mNn/0g+vAvz090SLyE6e1uDSkVlzdIfIYgN30YEFYu2m/ZvSYj77Rx3JhcY+m88zcM2k4ehjEFdtVxFq4j9JS6G0r6pXqFqeS72/4PM9f+nydkbkxEUHFl6uPsX17RwHWnPowm3Xr8yOER11ubEzjocM5Nt3yS8PQQyJ7DiDz1m9ihj/z4V5dd9+ixR0xT8lcBtAGvK7gboyywZZ0OWvOxZjzI8K/G9IEVxxh6P0BpXk9pYg84vraU7leL29kihazyg+t8X8SJuAP2ejcxxqtLHpTx1LQbjNSWJOyVugpUuQ0RjLQ==
Received: from AS4P195CA0033.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::20)
 by VE1PR10MB3887.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:161::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 14:19:13 +0000
Received: from AMS1EPF00000093.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::77) by AS4P195CA0033.outlook.office365.com
 (2603:10a6:20b:65a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 14:19:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000093.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 14:19:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 16:25:06 +0200
Received: from localhost (10.252.17.140) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 16:19:12 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 30 Sep 2026 16:18:24 +0200
Subject: [PATCH v3 03/15] iio: adc: stm32-adc: core: configurable number of
 interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-adc-stm32mp25-v1-v3-3-406834430d72@foss.st.com>
References: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
In-Reply-To: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Cheick Traore
	<cheick.traore-ext@st.com>, Olivier Moysan <olivier.moysan@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.252.17.140]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000093:EE_|VE1PR10MB3887:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ceaff0b-53d4-49c7-9726-08df1efdcd7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|7416014|82310400026|36860700016|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: PUKd3/xSyIHtv12zFFCVc6RU5WHBx8E/zYmuYktsBEF7oLs447yv2Ga2TYkhrNcoiG995Dz9k4sP9dIR3j3rI3C3Ww64uJSs/kcg55N8yuyKZAZrEScoJN4lTh5xyABSx01ur2QmR9p5Ydw95L3sxZNgs3nipwcFF9Kgu9r2XdEVLyjZg92HZnG1RRFxItlQIi6n/v+9/b5y4yh6uBGt6teAz7sLCoSd0KGyz9GmIwd89HYZHHsjWzfm87F2HN4BLirRvXbuU04xvZwjDc7cut1pmdQokiwdYO3BYiX/0O9Iy7m6kAIhKyVWo/NRlVy4jpMAv2Fy8yL+QaeuVl1lLSvhHm0NryT9rGX99X+gwuMQjVDnwzARlJZem5WVzK8RTvzVsv1jQvtQNw2h91CfXZOLQcJfD+XW1VFuLCSFrtTgJ2ML7lYzpBUIdAIFlfBoQxss1GarAVTe4k8EQ4NLPoCgupowojJuQgaRGCBF+4s0h+HL8uv82BdhE2o6Mqq0GgcHPnzknsPAff16tqnmnfWx+0Q1lJJdFM9jyo2Mi4+02XLmJVLZDkh+9FSCRO2zkP9HynTadXerBzOWW+bOFi6czof+tfQk1OJ66LyxwgHqlMScDf8ZTAui9RkCZZdFbsivy11EVcGi4xoDC5zRyaBsW/mQhDglTwNfPiSmWj7oCzDr2IKm0osDcaf54QoNH2HumcxYWKXL/1PMEntKKg==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(7416014)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: X5bycjXhaojYRYyj+/x6XP1BYDAu0JoJpMqfCsQSY1n8zEX6giwHVev7536up5O2xt+B1WA/lQNZkotgUaiTEZt956y77RIxaQUGiXzcRNYvz8FhvevxlQQ1K1lqLlswEIzg+3Qzb2s1xhMd2nwjKl6YgGa2dKIxJTNqwcc3c6mxoZfId7mWZ5bOroJ29yAzG6hIv9/Ork/vGx6un8xco3hYUwjL3OFulm3pj0RRhUNWR6BtCPKSzSumrDWFhCapNEjrxg0aZdjUbtuuCkvFddnLnx83PBWpBiN0zD2XtRQenEO/mDIu2JNjqdZ2Sr7fJpXFztbnBKmnwxAsEKSS+WCjUX8WGJMs1zLwqa2dlMxEJgAnykJXWromG6dwqu6Osx5J+6PBmXrwe6Gk/trAsHEQ0aGdT0MM+nIE+DUC+iCh2qKuagmer2j4PI/eW7mh
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:19:13.2212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ceaff0b-53d4-49c7-9726-08df1efdcd7d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000093.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3887
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_071925_496315_3E85E75C 
X-CRM114-Status: GOOD (  14.78  )
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

Make the number of interrupts configurable to prepare stm32mp2
support. Read from the SoC compatible data, and add it to
private data struct.
No functional change intended.

Co-developed-by: Cheick Traore <cheick.traore-ext@st.com>
Signed-off-by: Cheick Traore <cheick.traore-ext@st.com>
Co-developed-by: Olivier Moysan <olivier.moysan@foss.st.com>
Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2:
- new precursor patch as advised by Andy and Jonathan to render
  num_irqs configurable
---
 drivers/iio/adc/stm32-adc-core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 1e235f1cbc9d..9c99c5044c47 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -92,6 +92,7 @@ struct stm32_adc_priv_cfg {
  * struct stm32_adc_priv - stm32 ADC core private data
  * @irq:		irq(s) for ADC block
  * @nb_adc_max:		actual maximum number of instance per ADC block
+ * @nb_irqs:		number of IRQs in the ADC block
  * @domain:		irq domain reference
  * @aclk:		clock reference for the analog circuitry
  * @bclk:		bus clock common for all ADCs, depends on part used
@@ -110,6 +111,7 @@ struct stm32_adc_priv_cfg {
 struct stm32_adc_priv {
 	int				irq[STM32_ADC_MAX_ADCS];
 	unsigned int			nb_adc_max;
+	unsigned int			nb_irqs;
 	struct irq_domain		*domain;
 	struct clk			*aclk;
 	struct clk			*bclk;
@@ -421,7 +423,7 @@ static int stm32_adc_irq_probe(struct platform_device *pdev,
 	 * - stm32f4/h7 shares a common interrupt line.
 	 * - stm32mp1, has one line per ADC
 	 */
-	for (i = 0; i < priv->cfg->num_irqs; i++) {
+	for (i = 0; i < priv->nb_irqs; i++) {
 		priv->irq[i] = platform_get_irq(pdev, i);
 		if (priv->irq[i] < 0)
 			return priv->irq[i];
@@ -436,7 +438,7 @@ static int stm32_adc_irq_probe(struct platform_device *pdev,
 		return -ENOMEM;
 	}
 
-	for (i = 0; i < priv->cfg->num_irqs; i++)
+	for (i = 0; i < priv->nb_irqs; i++)
 		irq_set_chained_handler_and_data(priv->irq[i],
 						 stm32_adc_irq_handler, priv);
 
@@ -453,7 +455,7 @@ static void stm32_adc_irq_remove(struct platform_device *pdev,
 		irq_dispose_mapping(irq_find_mapping(priv->domain, hwirq));
 	irq_domain_remove(priv->domain);
 
-	for (i = 0; i < priv->cfg->num_irqs; i++)
+	for (i = 0; i < priv->nb_irqs; i++)
 		irq_set_chained_handler(priv->irq[i], NULL);
 }
 
@@ -727,6 +729,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
 
 	priv->cfg = device_get_match_data(dev);
 	priv->nb_adc_max = priv->cfg->num_adcs;
+	priv->nb_irqs = priv->cfg->num_irqs;
 	spin_lock_init(&priv->common.lock);
 
 	priv->common.base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);

-- 
2.43.0


