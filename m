Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86010C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gm5dbDXuakuzBHe9jLOzyLfAQ59ohwd2YhpbFFTnzpA=; b=zytwHy29HDFSuHhvBvCj2PoAeh
	VQBAif9Zy1pEvF0TqAskIjqAj6Ufepr8SQQPHAQHy9oTWyFOrK/cpNy4EnGCK9OfKVaO3yP9yPcz3
	+4m0W/ANr03AtRHAXch++fu20YzNIsjsIAeNJqWfgbaPbSZPc7YaLZpe7Vl3Ib0zt04Y9rsC5Tm03
	R9cuKiPywo0YExwIP2OIetiHLrjbrAXJ5PrgSVyJw2JItFXVXDTHMLJRD46eDANloqq2P66qhItd6
	fpB0+auqJb6A3iMMaBEiPUPUWxsBV2umCq4RSs93QVC+qWIi7FIY08OfgC8Xq31mabsyLL6wvGtOP
	1pNpfb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT4E-0000000BMzZ-3bJR;
	Wed, 22 Jul 2026 09:16:42 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT47-0000000BMvJ-1QI4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:16:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2VNnN1/LH5bISgLPXYApFZDKWd7V+Kp1CLyc439Zezq6icaOu6Zm9vjR5xZoTsSYTyM95bQU0JZJcOxgcvz+xJtx1ejFv9Af9m8iuxNZl6q6oMlgduumBSmqAoTVz9duF30qw5UpS0QlGaS+crNhIynQ7PRDljF2tH7lx47NVpT3smWOf8lXV2qdNBwWxkW1nnnJIcVjSHro+71rd6bl96ijMQhkJ24xV2QPnQdwzEEwaYRJ+ghIFJmQXK6iLlx2BnjcZZluoqTZFCNaapNrZ+07HmUFHPNuN19cd05UXEUfJFr1FjHvBG3TPO6uYSPJhZwQD9blq+DWlxxTnO1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gm5dbDXuakuzBHe9jLOzyLfAQ59ohwd2YhpbFFTnzpA=;
 b=KaCsrq58Q4EOCDYhXzZaKit7EeltETLZqTSJynZQFpX2A6JxYvHLfZK353TM8INBxasZ5dXkjnL60hgpdywiutJwMxHFfbQfOXE7mHDqoN9Yc6M9umBMTfBKOCSAxcTsNTcMv/WMuPFMtJuJBX3vowTZuTkmnjSty2vx3P9PNGI9XJq/sawdYU7a7fzOxbN8cwBmnwbiNTSNU2uy27dU/U51U/+8+D8VoKf+7V7RHvCmAbbbj+El+6RMKIYpBOna+4FKO1w2VSUHG6BT4ekvtiG0EgJ4ZgMfv0Q6hAdwe0aiIl4xjKP3hoS4niYKNxxiMr0eWq7J6IiIZFBwd+FJJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gm5dbDXuakuzBHe9jLOzyLfAQ59ohwd2YhpbFFTnzpA=;
 b=NoAZo0CH6vXPMdge7yY8pOtypzTwRDcI/v/yFSDMjxloEdLV6OYG6E+ZQhbaG8Q0dMAfamcrGmESUojqAVSro6hR9iB1cZ1akZJlekLQRoANTy/SH9uhy1XqtoSnci42MA4d3NMW6oQjdGsT1rQhBPVg8vdeo4ffh52CYX3Gl7oQ1rEBXbLcIhhT3J/ATIHHDFqpEZT4Cs/zTXj9x260KoJqZw8HVYTeg1BB8fHdwJi6DV5mzgmgMU24HAYzpTfv/TTdZGaU5Em66IXnDzsU1KIrXWqlH4pUJ86lOQYGwXS64L7GfWt5BKHkQLmUZ9HWCaIKjfGBfGiTLpoohh5diw==
Received: from DUZPR01CA0267.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::10) by DU0PR10MB5876.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3b8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 09:16:28 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::6d) by DUZPR01CA0267.outlook.office365.com
 (2603:10a6:10:4b9::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 09:16:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 09:16:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 11:21:04 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 11:16:27 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 22 Jul 2026 11:16:12 +0200
Subject: [PATCH 2/6] ARM: dts: stm32: add pins for spi4 and spi5 in
 stm32mp15-pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260722-spi_arm_stm32_dt-v1-2-6ef611523232@foss.st.com>
References: <20260722-spi_arm_stm32_dt-v1-0-6ef611523232@foss.st.com>
In-Reply-To: <20260722-spi_arm_stm32_dt-v1-0-6ef611523232@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<clegoffic@baylibre.com>, Alain Volmat <alain.volmat@foss.st.com>, "Valentin
 Caron" <valentin.caron@foss.st.com>
X-Mailer: b4 0.15.2
X-Originating-IP: [10.130.77.105]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|DU0PR10MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: eada59bc-c581-478b-aaf8-08dee7d1e9a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: hlwsb8EbZs8Cc3nwqMa8k/UDe5DMv40qIbXczj7ygrscyFg76YNRKrOWQTNQ7N33wPSzdxIyzi2JBvPOcpqr2IfVBg8tNyBqum/QvH5K2Z9JoRmxZX6zLd6V8YqvXUlZwO45X304SdrvYPPL4U+2JInver7XEmvxjnhq8QnIO0hgBRhL3snFV25JuHWN2rA/znSFzA0TCSPoFtDUVUiEI5fWcZ64SPnxfR4QUnkjqDhacKPyxBXp8q0nL3uKCSRHTfQWFN9d3/P91U7hrwIxGcPdGSzCC6wJiKSeWuI4XxFxZEbauNi/22RFyrn3PRQsOSEFDeHusLoifvmXvINeKFONS3cwuypVq9B03IWMmtr9TNv0L6vvMff+W7WgyTicH8TQZecy2+LQ5ia1NAIxM5iWZ+A9W7fi8spwJC5f9Bt/FhSOLHXI1k7Ye63ca5MZIrbfLBmfuT3cILAfeeY9UeSQ1ZgnApcs++GYxjw1YHwNo1nTw4o9RF1zWgYqAWNt2RztAiANGnXbUQrjU/hlipPDTYEERd9oVz5d0K02xzA8Sf+jTCciHIS3igGoGIJhdEX6H2TIqEajI/m1BwF/Rzft69+xs+viLsQ2F856W9RcqwWB0BPiYyoUTp0ToA0kxOp73WoEu0t9bKI3ZqDxW4SA3ozcxhwTiJYn6jyTlchxeWYSLMDRovEGkb/HuhFS4EYbhNnwWRQ3cAKsxirj8w==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4OKJp2zLnqsyPzVcBLjjCNhjxL8zNMq25P2OS7IAvhpbyj8ofjCpsnU/P+JyERD/6pEZmjjooxBEtjbuPD6hux4o+nt+2KcnqgEikRD1SHMkXvKw8VEHvVeh3lCVjXgz36a2M1pBldctoFeBnas+4e010yQpG7gF4NCpWoaDhY0J1oOMFROw2SX3eqaHbt533gL/v+VhLxQOGtW1HrVNA/5ltFQj+Vr9+SOkMptSYTAMLyRoiKS/wF64vgiPhYO2vRCfK6dnUPymbl/VdHuWKrwiHtognRTydYHBUJSJqrt1WA9zyMTP2Y/vqbHg5WQGGj/siZ+CvB4M3BrpdV7FWs2AJSAOXmB/T9wJC6cHLagOdyF4JqNBihIc8a0JZcYiYi6gUD4H5lnfed712GHmqMx81IhM7F9vwd5c+EFazRRgLILpAcP9S8KAjc7Z05CO
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 09:16:28.5988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eada59bc-c581-478b-aaf8-08dee7d1e9a2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5876
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_021635_385907_C28766F1 
X-CRM114-Status: UNSURE (   9.49  )
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

From: Valentin Caron <valentin.caron@foss.st.com>

Add pins for spi4 and spi5 in stm32mp15-pinctrl.dtsi

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi | 34 +++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
index aaa91b634c12f..4480bc5292702 100644
--- a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
@@ -2873,6 +2873,31 @@ pins2 {
 		};
 	};
 
+	/omit-if-no-ref/
+	spi4_pins_b: spi4-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
+				 <STM32_PINMUX('E', 14, AF5)>; /* SPI4_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 13, AF5)>; /* SPI4_MISO */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	spi4_sleep_pins_b: spi4-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 12, ANALOG)>, /* SPI4_SCK */
+				 <STM32_PINMUX('E', 13, ANALOG)>, /* SPI4_MISO */
+				 <STM32_PINMUX('E', 14, ANALOG)>; /* SPI4_MOSI */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi5_pins_a: spi5-0 {
 		pins1 {
@@ -2889,6 +2914,15 @@ pins2 {
 		};
 	};
 
+	/omit-if-no-ref/
+	spi5_sleep_pins_a: spi5-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 7, ANALOG)>, /* SPI5_SCK */
+				 <STM32_PINMUX('F', 8, ANALOG)>, /* SPI5_MISO */
+				 <STM32_PINMUX('F', 9, ANALOG)>; /* SPI5_MOSI */
+		};
+	};
+
 	/omit-if-no-ref/
 	stusb1600_pins_a: stusb1600-0 {
 		pins {

-- 
2.34.1


