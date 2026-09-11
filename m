Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7888C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxDlG7OFZAVcBRct3lRSkcssDxyZrbXQta+zy2Y/nbw=; b=KtYuteRCSzbX+iVDGoad6BY5Jj
	T8QyiBMPqUKOa4uqURdPcdcTb3k2X66GBeuUZeAqqOOfDvNC2fcg096WK7EM69yx7vOKAC00coL7R
	Adywc9us8lFY5U+CT7QrN0Xlkx3XBOdMq41886hnh5WR7MwL0BFM426aglWpGcgFGkkW1DFAOIZuX
	ZYW8o6YHeuYAJLRiShwliEJozkcGlRv5CDb0OVI7BtJEYv2HXllQiKCn1bOKrLl+5CFNQHchMVpt0
	oDDqPPYwqYCjJVWsnQbkgdpgyX9HuxAzwLZkLAL/+77Gd76JpguQBQGv1B1SYv8/JIAScH/Z7PLp/
	1DI+pqsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Xl-0000000H8pI-1D6S;
	Fri, 11 Sep 2026 15:52:01 +0000
Received: from mail-northeuropeazon11012013.outbound.protection.outlook.com ([52.101.66.13] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Xh-0000000H8jp-0T0U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:51:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqAjiBtqy28nd7HbOiAlf1CAkHemtU02Lu101S5xFa+qZwCIIBpNahP3yoqPGvf5nYXIZQi65nQeDMACRfVhRa4TfY90yPfUpp9oqi3F7AWlGcufuFJJloDGdomzIY+aEuxOMI4Iswr6EpcEyVd+ploUu095d2YPGuaAE5+tWCgSRRMscV36LprDkyQ1p6etVfqwBKSDMCndxjF/bbPTHgFeArT8ZHVOUxHUJl1Mwlo7ewvYzTCNdr0LmXparrMabhXVcUKJErmY2095nLaVJx5CceDoOG2xPT7BvR1E76Z9+TcUGf8SsbWX11GaM25HLQIbi0+vlMK51gL8hMbnGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxDlG7OFZAVcBRct3lRSkcssDxyZrbXQta+zy2Y/nbw=;
 b=G/UDNDs17plV/lXiIaSj4tLPFPqct4aKtkqpHoWiuqKCDxzHByHVYNiwYdLquwI3IMbwM0ttexOtU6p4RxFbOmTZvx5SZxTRX21LJ9goduWLlC7VtjuKMWEg6u4RhwC96AC79fiPedz4iOZjEv90BTV6cMrCs+D2fwcd5OyD8VgrM1wS05qvzstSndFzVjwiFyOv1ZZ0iPlNvdMhIb5yP2dITU0yffeYYlJok6rke61pQsQDroegXlEQj7hM2iLYlJYy+qvgSaLB+G3y7blzDjOBA9x5FTBemZR0z7Hovn68/QqrczRYKFIhA/sQ0drFQ+r78bTXkG2TEWwI4wPdtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxDlG7OFZAVcBRct3lRSkcssDxyZrbXQta+zy2Y/nbw=;
 b=OLRCHCcBe9AIMRUN8vl2iZ0ASCv8p17JKgPKn7rpOc3wDqyPVTmPkcUOOZRl00Alf0CPMnPIANZ/aW1PCXiGcbKW0+Xg48Ya4zviyxkfwiJoSSLoWJZaZ4hvimPDfvbbEAhxChaHNENJeUi4QXYqYL3xwQi/8ZvHoMe7mL/McwoOGlbYGJatmxZlL/4E8bfGiGnFKL8B0rZ6tVOnWbEDI/2CWChjCvAzLSwKioMocSFmeqdpbOW6soY5Wajjwgb1sUYc3umYLaE/dOyj3GC96nCQIrTV2ucS/4s+CDnGTkpQ0H9ND+6jwQsXuszZ5R78i79GFjW3Ut2JIXb+a9gXrQ==
Received: from VI6PEPF00000210.AUTP296.PROD.OUTLOOK.COM (2603:10a6:808:1::8d0)
 by DU0PR10MB5828.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 15:51:49 +0000
Received: from MI3PEPF00008484.eurprd02.prod.outlook.com (2603:10a6:298:1::6b)
 by VI6PEPF00000210.outlook.office365.com (2603:10a6:808:1::8d0) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.406.9 via Frontend Transport; Fri, 11 Sep 2026 15:51:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008484.mail.protection.outlook.com (10.167.240.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 15:51:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 17:57:49 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 17:51:46 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 11 Sep 2026 17:51:28 +0200
Subject: [PATCH 6/8] arm64: dts: st: add ADC nodes on stm32mp231
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260911-adc-stm32mp25-v1-v1-6-cef26eecdef2@foss.st.com>
References: <20260911-adc-stm32mp25-v1-v1-0-cef26eecdef2@foss.st.com>
In-Reply-To: <20260911-adc-stm32mp25-v1-v1-0-cef26eecdef2@foss.st.com>
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
	<cheick.traore@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.48.86.251]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008484:EE_|DU0PR10MB5828:EE_
X-MS-Office365-Filtering-Correlation-Id: 6812e4be-52c7-45c5-6ff0-08df101c96ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|7416014|376014|6133799003|10067099003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 33D4Fo6tJ3eY/3I9/VLTSw5aCINwfyBfAXKhh8kSPtZvVKVf61A20ZqPtlbu7Gja+vWBrk5b59oPB8mIfjcH4fYaLCQh070XfPLy+UD8fDhNVBIG+AZZIoy6rk5xia4G2gQay3RvkxgcstZUzIlF6wjnwYf/cs6J1wAa0vNtX9G1gIz5AdwetzPemPpHeMJ6wzchH8+0xk1010BPEmPpFN2nsqlCavVj3z9iJiV0ONe6Rrms0mLJBtQzZ8J+o4D3nLw95XgPzSSFP4Zgv1YtycnrARum2x5NqixBYGxTDn9KaXB/b6bt12tfVRRNajcTctQnCnJy1Gs+M3OdsjSnTxgZnSXqG/gd8ZiAk4rkzQv8F0rex3vkk+kmECF1FwwI1cm/hAFmGZZ//w51I6GLpCSohEM4DyqJAMgnNNpMuX76FH/N123/njmBD0/tc0ex5lsH2nXEX7b3s9QsNMK+JVeJLtMyWXM5+5mnPDl+O4WyzaEg7JJaE0+CM7hP1oGHiwFFOcajxZA6K4kl7WnxtzgMrATmoRQ8dozeuxRU7zJXR4Vl4Y+zbN+v7fpEdP7LoJcQgvxF4icM+WjrqxSc+wpzNq0MFyBW4rVfqdv/EQqpe7TPo47DRcbaIRnygxsLrWiZvywvB/cGRHnUiBOPrE31EpdQd48Pdf8hSDMtrSZ4DqiOfdXa4LaPdPSfdpG7kWocrwD003NW5PL1uVrRxw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(7416014)(376014)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: I1fKcX0esgdoFk3hrzUxO7+fOfglMS2YOF7tZHtcO4cTzwATWV0bBMlrHnPoadRF3glfnUMFnCM2NWhIznvSH9vyNbFbP+vhzO6eYu9zARBq4IXaxfSdeeioypoOHwN1WtV7izRKfBsckmNmFXUphZxtMUs7f8Pr90LogXOPbts5i85ac1W8TZDtBN3kAhp6POr49QKuJH/k7/uUGaONZvDWJcHMuqD+cHbrd04OkQtLWQwuWsNB0WZ4MyXNEC0H3YvtI+iUTt0rudrZ61tDbRoUc9KXvUg7J5t8dRDX41itTdG6OlWY++WFAEpEQuy8FywH9dPYH2KNs3wO2Ixr5LPklvRwUtx2kfax71leHnf55CNrAmPlCibiwZwfITPZe3O8OQkV+gmJ4k9N9zu8BqlEkRXqC5jWy4CAiJAGRqdPDZzajcJIuqhgQ7gd4WdP
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:51:48.7640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6812e4be-52c7-45c5-6ff0-08df101c96ff
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008484.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5828
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_085157_184785_065E49E8 
X-CRM114-Status: UNSURE (   9.20  )
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

From: Cheick Traore <cheick.traore@foss.st.com>

Add analog-to-digital converter support on STM32MP23 SoC. It has 3 ADCs,
split into two blocks:
- ADC12 (ADC1 & ADC2) are tightly coupled.
- ADC3 is managed independently.
Define internal voltage channels in the SOC dtsi file, exception made of
vbat/4 channel (to avoid undesired load on it, in case no conversion is
needed on this channel). Choice is let to board implementation (via DT)
to define it.

Signed-off-by: Cheick Traore <cheick.traore@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 113 +++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 959500140d98..3aa1efdf9402 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -646,6 +646,119 @@ uart7: serial@40370000 {
 				status = "disabled";
 			};
 
+			adc_12: adc@404e0000 {
+				compatible = "st,stm32mp23-adc-core", "st,stm32-adc-core";
+				reg = <0x404e0000 0x400>;
+				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_ADC12>;
+				clock-names = "adc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 58>;
+				status = "disabled";
+
+				adc1: adc@0 {
+					compatible = "st,stm32mp23-adc", "st,stm32-adc";
+					reg = <0x0>;
+					interrupt-parent = <&adc_12>;
+					interrupts = <0>;
+					dmas = <&hpdma 81 0x20 0x12>;
+					dma-names = "rx";
+					#io-channel-cells = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					nvmem-cells = <&vrefint>;
+					nvmem-cell-names = "vrefint";
+					st,adc-trigger-sel = <0>;
+					status = "disabled";
+					channel@14 {
+						reg = <14>;
+						label = "vrefint";
+					};
+				};
+
+				adc2: adc@100 {
+					compatible = "st,stm32mp23-adc", "st,stm32-adc";
+					reg = <0x100>;
+					interrupt-parent = <&adc_12>;
+					interrupts = <1>;
+					dmas = <&hpdma 82 0x20 0x12>;
+					dma-names = "rx";
+					#io-channel-cells = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					nvmem-cells = <&vrefint>;
+					nvmem-cell-names = "vrefint";
+					st,adc-trigger-sel = <0>;
+					status = "disabled";
+					channel@14 {
+						reg = <14>;
+						label = "vrefint";
+					};
+					channel@15 {
+						reg = <15>;
+						label = "vddcore";
+					};
+					channel@17 {
+						reg = <17>;
+						label = "vddcpu";
+					};
+					channel@18 {
+						reg = <18>;
+						label = "vddgpu";
+					};
+				};
+			};
+
+			adc_3: adc@404f0000 {
+				compatible = "st,stm32mp23-adc-core", "st,stm32-adc-core";
+				reg = <0x404f0000 0x400>;
+				interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_ADC3>;
+				clock-names = "adc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 59>;
+				status = "disabled";
+
+				adc3: adc@0 {
+					compatible = "st,stm32mp23-adc", "st,stm32-adc";
+					reg = <0x0>;
+					interrupt-parent = <&adc_3>;
+					interrupts = <0>;
+					dmas = <&hpdma 83 0x20 0x12>;
+					dma-names = "rx";
+					#io-channel-cells = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					nvmem-cells = <&vrefint>;
+					nvmem-cell-names = "vrefint";
+					st,adc-trigger-sel = <1>;
+					status = "disabled";
+					channel@14 {
+						reg = <14>;
+						label = "vrefint";
+					};
+					channel@15 {
+						reg = <15>;
+						label = "vddcore";
+					};
+					channel@17 {
+						reg = <17>;
+						label = "vddcpu";
+					};
+					channel@18 {
+						reg = <18>;
+						label = "vddgpu";
+					};
+				};
+			};
+
 			rng: rng@42020000 {
 				compatible = "st,stm32mp25-rng";
 				reg = <0x42020000 0x400>;

-- 
2.43.0


