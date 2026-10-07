Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20577CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 15:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FFRE4twxY69cKirttLqUybzKDsZbz7GlZeciPd18UE=; b=THjkC/Jvmf1EHobSRcTrovUMWB
	N3J7KqRT5sKZDG1ACSSqTnj4Izsf5+/0VV0Eockh3HmDwvN5GYiqVekYJMm2jc7NI07A0cQ1zAtaX
	HGTzxXOqwUnZxxs8Ag0BR8hEiiWBuOW63pD1MrulWnhZLHcDPtajUGJH+9dU/WLoyRnxAj9LeYQDu
	sbzNDO5Jpe0DRFeTHWHdnAEUyFvKP2KQL4HfF0DhN7p4+gFN5/d7r3NwQIhAfwkAqWnhLiTohyxun
	OzTwqziuqQ7AE/ZlGJ4VXGbWwLlt+JYWnFGaEBgtzrw/G4AKdpoGY1Dk1/X7R9TfTKHftUDJFdhTX
	HedjVlrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETMz-00000002gvU-1Tc7;
	Wed, 07 Oct 2026 15:15:49 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETMu-00000002gtl-3vNr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 15:15:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8G7cxNJtIv1ZgQTp0T6C5rBv3bV+XbdP4Af7BO7Fqa9ZBbOywXauMPU3s+u5lbVfLE/ORWpxq0pQbm5btICn5qaW8HPI9JEgLzBSkRIHUqGt73ZICaDf7Y4t3g8Vj1953NdTq97IGnDKxShGNxWESdRewxXApdjTkpFJrUM2uzJGGJ0os8wxv2aQzTQcbX6PsMKqEUIAbRC3YZmkNS7vii6P8yQmvCF0EHypi4wncuot56aQxvVa7J3AfLCWnd8XuDcuQ5hKGaSlxlznFkFLNl9gr0IDlW/K8AfIiprR/JE7ak67PYlnZ3NDba2pC2OL6bA2b6PIDQdr/UKlRLeKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FFRE4twxY69cKirttLqUybzKDsZbz7GlZeciPd18UE=;
 b=HToM/MUXR9c2//cQ6EwuMQGi+stvX/Os324N/OeOlK+ok5BubWoV8DH20vqvBpeNLsdl6JpzNvCTSeNd0nkdXIXn7VD2OFBazXdmHXT9AGgBPEj8ig1CtEFu4GKbZAjygxGweIJ2Redg0jyzD947obmfDeRQNNe3l6sUa/3sexf0rlms1kencPnTwrA11sdkyd5R9yVlPNPPs2HbeAqC/tZbinTTzZn/UP2cw0L2Q43KqJhIq0PvweYq3Y3aBPZ2UyzUODVlxgMduFY3yy2QHJ0ysTDN7blC1LdxLNjuHtPEDcbRkx2miEWy9mNHGoiGd5DIBRXBC0Q2UBf4Sy1AaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FFRE4twxY69cKirttLqUybzKDsZbz7GlZeciPd18UE=;
 b=nqGLb9sL/xAFmc0N2OnZ6XfPVH0nqtTE8VqV3W+JF5hRnrKSF4MiNmJ2mDML3vcUEJuQ36sfZEHEqDfjvkH5Zz8LJpEiR6Z8WsLw4T1yKhKbli3eQa0fYFQJyQv8qNSBncf0h1wn7+Py286H54gjJabAIljFVgsToTsZPqWxc30VY0cTRCjMgsZ0VJ8cYHNvv6rvAE1LPj9ulgY+jfgwSmNsYyvSXCzAyV8mfJLXVEX/gzd4Xck9AhcOjUvgdznt+hGYJyCgiOL8lNzhXSOemqAp5uONWnL0N7ZoXI8NUg+ekvcalZRv3Hd6/KXj8sbmW4sKTtxuKp3Tzy4fGjLIcg==
Received: from PR3P193CA0023.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::28)
 by GV1PR10MB6100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:9b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 15:15:36 +0000
Received: from MI3PEPF0000848D.eurprd03.prod.outlook.com
 (2603:10a6:102:50:cafe::af) by PR3P193CA0023.outlook.office365.com
 (2603:10a6:102:50::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 15:15:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000848D.mail.protection.outlook.com (10.167.240.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 7 Oct 2026 15:15:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 7 Oct
 2026 17:21:00 +0200
Received: from localhost (10.252.9.73) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 7 Oct
 2026 17:14:06 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>, Amelie Delaunay
	<amelie.delaunay@foss.st.com>
Subject: [PATCH 1/3] ARM: dts: stm32: enable iwdg1 on STM32MP15 ST boards
Date: Wed, 7 Oct 2026 17:13:56 +0200
Message-ID: <20261007151358.1166329-2-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007151358.1166329-1-antonio.borneo@foss.st.com>
References: <20261007151358.1166329-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.9.73]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848D:EE_|GV1PR10MB6100:EE_
X-MS-Office365-Filtering-Correlation-Id: d9aaaca6-b341-4253-4581-08df2485d683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: I3JttI6rXXpalCZItRt2G5Gmhc/owaKmPlyO+PmETV9NuffoudSImOONx/n7zG7hShOlFIKbg2/flKni/RLb3FlCzCo+OSDLkv6fbpTK11YOrfHFlChdesGtjYmy4eU6oa7lRSHhLcfeHKQxmEsxzwPqRjO5oMGifwxi5mFGrAPmFX8SOtB+d6BmRFg70SurzB8771CSUfcNFCdJ/gav4jfDscxE4JQNsj16hRvY2Cag8XIIkslHUJzA0pcfXLVx95jJLdbPqyF/q0BUpT6+pgECAOK7Opk+G9pzrDda0WLiVyigKSIjoiOfaMQzRZQPmIcKiDXPqLKNzNaPwYIFr0mhcWjs40gDVU2Zn36foLba1SOXlOsKh2SeOeQwsGleQFJvc3IthU4ffTrOf4FJ991j4dXF3VBTJvrnjhYguL2n+tLdDWu80xXXD0v+iJoRCcyyshX9LxfDoNSR2KwdeX6+1EvYVvxv+SgWFUZ7CrmgM3rtgEeIqU0kFYz/5lm6I+oPIIGSiFQzoicaG0/jdQYQujvqhtKbSMcpJ0nt1QJEs0Z++6bvESipqNH2ef+mrPjc3sHSiUfdM+uqDQdLM92Z7QEFjaV3Qkit/eZgi7WVFBsfw+/elbWczj2cPv77PRO65Ec4pn/awR4bHrlCz5hnZ0v+geRvFtQekhFjCOneYSlacAhmha4F3UGTJrt7sLAL7HTK04TxuGiRNryOrg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FmvwnuvYaGgyQ6Pgiecw+rL15xm3rTaOAynjwBuCH26LEIN22zIAOpBAlNGNM8oJQ37sp3gLDOH4EylAwHAHt44dtDMYJKU4YoDlecG3PUHVtBg/RsdZyJlDSXlGwh6BrIcFoow3ZQzY+H2Akma43suUgKHb5wCWKQsmqLZbhpcw/daYOdvaWjxvCjskI2j7/dIuVv1yf7P2P/kESw0NlypZhcYyoO5ZwmBjmxXDS5TT4xb74tM7gmrrU+AT+vYr+EdLMJZsKobBwkwAvA2ECmlWQn6GQfxFJx0GFHL0IOklEvVkUWLmvccqjGx1w6jEcYvJlXjpJeQVswU1TbngqchaWKVrciRh4/q6HcMqxeQha69A5kXcsOdCkkMO1y7NSs+o4ylbICICRarLyTD7IqtT1Cw5rVIeQ+9gHZ7ggoD7zgArRS2orb8E5l9cmj01
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 15:15:35.7258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9aaaca6-b341-4253-4581-08df2485d683
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000848D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_081545_233744_0B6D75F8 
X-CRM114-Status: GOOD (  11.95  )
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

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

On ST STM32MP15 boards where IWDG1 is exposed as a non-secure watchdog,
Linux must register and periodically ping it once started by the
boot chain. Add the missing IWDG1 DT node to the STM32MP151 SoC device
tree and enable it on ST non-SCMI boards that use the non-secure
watchdog configuration.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi  | 4 ++++
 arch/arm/boot/dts/st/stm32mp151.dtsi      | 9 +++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts  | 5 +++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 5 +++++
 4 files changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
index 98552fe45d4e0..cc9521b105262 100644
--- a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
@@ -64,6 +64,10 @@ scmi_usb33: regulator@2 {
 	};
 };
 
+&iwdg1 {
+	status = "disabled";
+};
+
 &reg11 {
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index e7fec8b49ae16..25f111c8aa7a4 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -570,6 +570,15 @@ usbphyc_port1: usb-phy@1 {
 			};
 		};
 
+		iwdg1: watchdog@5c003000 {
+			compatible = "st,stm32mp1-iwdg";
+			reg = <0x5c003000 0x400>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc IWDG1>, <&rcc CK_LSI>;
+			clock-names = "pclk", "lsi";
+			status = "disabled";
+		};
+
 		rtc: rtc@5c004000 {
 			compatible = "st,stm32mp1-rtc";
 			reg = <0x5c004000 0x400>;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index 49dd555cc228c..dfe726b481629 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -331,6 +331,11 @@ &ipcc {
 	status = "okay";
 };
 
+&iwdg1 {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
 &iwdg2 {
 	timeout-sec = <32>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 1a07ae09afb2a..e8e75e59f4c98 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -511,6 +511,11 @@ &ipcc {
 	status = "okay";
 };
 
+&iwdg1 {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
 &iwdg2 {
 	timeout-sec = <32>;
 	status = "okay";
-- 
2.34.1


