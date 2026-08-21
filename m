Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8CAC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RWcDdkNBu6aL19Rf6Bam6cHci+5r68YmL6/KrCap4A=; b=T/XCmduvjqJnSzVyIYMP86lFCZ
	+yxn/s/zzyU5KtSieguafDWIEFRIwa5bn4SXjvle6m04U6E/bNdSwAa4ggqLdyTMrOrzmx4L5EPYl
	OY/eFf7i+uqCwMKEcIt85/brzh+sDnZtJtuiM4J/ZcDAC5mC3CiyCzEmvXqxz8XpeImu31hWPtO3P
	GBN93nI/aC7jwRXEpraK/M0vNkR3H25s9Tf1jVeC2+F/7EA5xKbGCy71Q6/0HDm7kf/hss9KC9t0t
	SQ9l+XfvOcLpMn2HO43JxW+/05Q0GdPQLlkT3FM42GRDxoz/8yy6hHUAZXykDQzyLNF8WxR/FAN/X
	VYGdzktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxS2z-0000000DoJL-2f5z;
	Fri, 21 Aug 2026 16:24:49 +0000
Received: from mail-norwayeastazon11013060.outbound.protection.outlook.com ([40.107.159.60] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxS1r-0000000Dnc1-2Dk8;
	Fri, 21 Aug 2026 16:23:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zcf1YP3Nl/JpkaXa9s/lXG1/RDCmI9MwwpFF6vaYb2ZE2iTxbatqz6rImdE8wmI0q/JbQBFtzexVmDTsD9tFhLAm/VsJrCpc4RyImg8qZp2xWSqZDvtppQbRJ5RkISgTRjvdfV/zimmLzwlIyWVX0utVWJeg0DORhy9st9U7K7SlfzhbzCCkkZvML2KR0pWOrrVc5cKggq9N40ncy8jjhYuOB++4vo8JuZG3rEVjjLtinQThjHvJzNq1t8euKtnU8S0rVMLC5Mra6AE3QuKE/CiN7LAHaFktJfoS86g1iBP929p9a1WV2xfxspqjSI8Jueah1H3sz/5WEdfds7NJMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RWcDdkNBu6aL19Rf6Bam6cHci+5r68YmL6/KrCap4A=;
 b=XUFSSfuUNNL/ra0xTXj51pobARYh34AwbT9/rsHeXdur8LfGvhvB5ed9CAIJLwyIpE9ODgMkS/c8HzVfEQykuwzWxUFulcefJolgaAJ5D5yp1jfn2HehuDqNRM9lifOruix7hiSjI10OLLGt2NNLSsmPz3mOLBlYs8+KTGuLATF+sBrRyjeQSZHwrA+duzm5RQaJxIc4DvPsevuRImUXKDBMYfq+7U0w/O1OKlcgH0RJZpxOGjV5cFS2MnWp+MJrXXUv+DE4M+zXFwrVWZAvOkeMFdW7GsUgZC4jlXChLv0/dz4e0D4Hob+ltGgTkh2IZ1GYZviFaq0lNzqLQPfiKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RWcDdkNBu6aL19Rf6Bam6cHci+5r68YmL6/KrCap4A=;
 b=eyKIifRm1EYC1UlQFgFytU6GfH+XeexRrH7OR8HRfndBhpkqfFzLmQVtwI1v22i/QAOZUY+WiljtrrXEBGHDkCKpXmN/SNT/tRTClofOuuynGXxcRXU2uMCNNz1N3lQgDiacCGhbmfYah5jPldceV8RlVPrP5YY3SPASDsex01gbD7iuqkVzqoePk9FnIhdQ3yY++6OBapIuX9vKBhHdMarTYLSJwJSxjZFJ7DFei3rBWDk4igbc+Qn5x7qs7fFQc9geY1Y5N6kqSUpb6hafxMi95IKfLCWCuDRTi9sd73zhpVRKhBQ5gX3XCEZhY4KsYAPcaDy0w491leyOlvddtw==
Received: from AS4P250CA0007.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::11)
 by VI0PR10MB8668.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:232::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 16:23:32 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:5df:cafe::31) by AS4P250CA0007.outlook.office365.com
 (2603:10a6:20b:5df::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 16:23:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:29:07 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:31 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 18:23:20 +0200
Subject: [PATCH 09/16] arm64: dts: st: add i2c1 pinctrl entries for
 stm32mp25
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-9-c5e27cbc0795@foss.st.com>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Srinivas
 Kandagatla" <srini@kernel.org>, Marek Vasut <marex@nabladev.com>, Vinod Koul
	<vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev
	<pankaj.dev@st.com>, Marek Vasut <marex@nabladev.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.48.86.251]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000190:EE_|VI0PR10MB8668:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa92479-6165-40df-c0a4-08deffa08ad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|7416014|11063799006|56012099006|10067099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: tmwzAYaCeTxp9g3ath4jyYrkh4IYDPdur5wtI12Cno9OpjZYXyeDJgWiLecOc++W2tA1fPdqlDCNdKoIpJ5pzlsEBrR5QMBLAB09esgtLIBPYJ22rtrFVTkBWbOMPfnDTCyO4z12XnaqeqXVIR/RGEeR+HZuPgx6dyscF8oegDHj7ABcH/LyhyCJagBqQDMGGcE4l0FobaFDIGDMXvyIlWVwsOR2ejlf/hS8wetNI4MGg73bR0iLuNB834wrivHVHeCQWFgCkqXWIzgMbzGt/byt+V8aCZ6iGeYYLOgfVZ6+7GbqDSkxqM4WoIEIEfn4aJebU5X0P9nHnOZ78MRFrlQZqcVIs2on8Y1LTlRRPc+uezWuAaPL3NWIMQsPbHnI73SQWo+V3QSKlT76wQAZQB9JxLZqsWhZzA/oypJSlBr3XNajl79A97xysFLAm+LXrj5Pa5TCBR0mps/sW6wyP1bcGzD+iaPQB9GxsevJvSFDWASwGGe0Hu3L05P5YhBw8pqz7s415L8T5DEG09wlO0oTUi4yipL3If7U14lRbHyI7OomNfmwdG3MydhBGdkdqkG/fpCGXQKcNqSE72dbn6dsoQ6YEd55JoTMpc3GfeEPh7tCzOEOGYtK0NXDRPnRPO8nRKWn983HHGXeQQI8GwTQW2aP24GEwe3BZ1iBX1tdRV1cPhCAws7Y68cJL2g9Z5Qcc2U2/je0R74qvkLhWloX5rASpnMOfd4YRqE4DwoyRf/TbbAJLUGRl/g1wbJg
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(7416014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WjA7qiuRAh+n1cz3RM6CooyYl4aeSt5TXn8awctxNzDXzvK3QNlvCI9+sGmF9Wacv8EN92CueMQrdADFVAe1t1Uw1L3lQM4yWcl0CnQPhZXtA1a2Vk6rxJkW/OK5XGALJmUsqWnM1fYf4zw9CTpUWhUIQ6SWUMsa4NwJLV4Df39UcF+bLdKjYPQOWZemnTUjJZ4k5tEsaMTMr05xfWaxXjNKM2zZxhOn6hfe2S7hQfOKJY4Xx6D8egIx87NHE1NwDzFZgyHgvgBZP6JSgvuX3rs0PLSR9+MFUSXt1u4O6VhVfQjODFr8V5gEKD2oZ+3ZkRCL+8KGhOzKl1mtlRN9hMUWVuPinY9q3OYT5XlNOVQoluGfqtbGUTrOefXDQ1f6xWOifT4IXyBODpa30ow9rN8NiriB4iLlbUzPCv8uZFNor+cmqX5SkIefIYr5xyE9
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:32.1016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa92479-6165-40df-c0a4-08deffa08ad3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8668
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_092339_590945_2D3E2F88 
X-CRM114-Status: UNSURE (   9.13  )
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

From: Christian Bruel <christian.bruel@foss.st.com>

Add pinctrl entries related to TCPP03 I2C in stm32mp25-pinctrl.dtsi

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 456ece7f8ebc..f97ce299d6aa 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -203,6 +203,25 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c1_pins_a: i2c1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, AF9)>, /* I2C1_SCL */
+				 <STM32_PINMUX('I', 1, AF9)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	i2c1_sleep_pins_a: i2c1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('I', 1, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c2_pins_a: i2c2-0 {
 		pins {

-- 
2.43.0


