Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941B9C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vdh1K9iQ87c6paARyNmLvG+s0MpVfGWxuBQK9qRXNR4=; b=FDeEBhNOjMui9wQbVd1/Amax4N
	Otm6W8h0ECf5O5ZiBxg+/clrwvCnpl+bARFQtBiE+SvwCAK8Eh4FgPPetUJNpFZH8a5eqGbY+OdWM
	f+TfMjv84MEj8QyoAk6bpqT17FdsRWDtoCsCSWaA/f5pI2SwYksoyIxPq3WNNb7Cm05toRZ7IR+ku
	O/VOYoepLHt9rljkKJbWmVI1G3qDSJAdt03wt1HZHlkjvc6Dm0QUEndr8SOLIXBnBSid3CDIA7Qpn
	mZC7kuzpTVMXKYd5thttZaiIOfGQVlC+qCcYgE6G+I4PY4EUy5U14IpBdRkV2WZOtkteVKHUoo+Ub
	Su2TPHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P5g-00000008mCn-3boX;
	Wed, 23 Sep 2026 15:41:01 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P4V-00000008lQR-2Myh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:39:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2/WvVj19nJ0RvgF8BgHAm//zv12NUilbbsz0N+j3pVQPtB0udF+1Rocbi5cBq52D0DJiqppXuYCv2MqBGMS7yyAyssW+f5e0cg1p8R3wERwbWSvJjQoVuKnG+00uVZiK/wYstKUyPYh+b97RLPSxSTfDLBwS+9XOvpzLT5WlullPYTRdbWXlitfewOJk3BzUQfGjs7Mn4DT8M1XqpVgQpOQ7o1+fT9zsXjm5fYh9I74tt4zzcyDgEFKLnThtx784Gl1yjFZg62t+c7bk4QcbRgWewzk5eYFeaaXhY/VX+ZLxy1GnMtPry8S6su8Pq3C6FO6Kckvp23OhNw4izEwrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vdh1K9iQ87c6paARyNmLvG+s0MpVfGWxuBQK9qRXNR4=;
 b=rIw9Ii1aNLuqQNATFpADhTABle2k5J9HX3lnPjdg4fwUnsIUE4VUMLT32MVOvMfwAqpwNhZD3YfPERN0SHYGxl84lrMwKR1gqB5XH6FGmDE2/BdpIBI+IfhfDfw1dHznTwvm4gufYjsy5rBLzfKdIreyNhUzd1kthfLcGKzEV8sy72jGLFSeYcDvn53lnrtxeOqqJ+OkOp6+aBIOh4R8DIulpI6LYjJWu8DiiwPabBp7bZqjo0EJ/UxVoJzBPAXy3C0aVLnpkTZcLEN3UIESkblX/kNK4IRn+UHGnazpttlql3VgWlZ7hQy9qEO5WW9a/XVaFeqcqWtovaXBE8Nt7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vdh1K9iQ87c6paARyNmLvG+s0MpVfGWxuBQK9qRXNR4=;
 b=m7tX8DgYG7IbfGUmY+xx5Fj4GVgVTMhpoGafgjpqFefDSOQvdxQaTY6nJm+YBoa/0cR9moZWhPs4lShydXaWqm6QZYBRlXj8HSrSCNEBHUGaaTmMF8HdLQFbRywi0c9CU+rVlI4F1XKXj9ehmEljI2i37IDvMpIxhOuDj8/rZb7ljMD4iHYgJLnMqpfwotWMDBjJTVVTOMEpgKMtm99PLEr480ybXPNjD6/piETKKJvgE4ETgY06Jgon9d0yhDI7v5eFRY1umbuv0SadP7G51ZAlEZ85b5/XpandZWZCpc3Bbo7QG25J8d1F8S6mQIZwKi29sYTT9Uj3fP/LAwHNOw==
Received: from WA2PEPF000008AD.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d8::647)
 by DU4PR10MB9589.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:628::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 15:39:38 +0000
Received: from WA1PEPF000099D3.eurprd04.prod.outlook.com (2603:10a6:1d8::16b)
 by WA2PEPF000008AD.outlook.office365.com (2603:10a6:1d8::647) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12
 via Frontend Transport; Wed, 23 Sep 2026 15:39:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF000099D3.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 15:39:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 23 Sep
 2026 17:45:27 +0200
Received: from localhost (10.252.7.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 23 Sep
 2026 17:39:36 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 23 Sep 2026 17:39:16 +0200
Subject: [PATCH v2 13/14] arm64: dts: st: add ADC nodes on stm32mp251
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260923-adc-stm32mp25-v1-v2-13-46bc019537c6@foss.st.com>
References: <20260923-adc-stm32mp25-v1-v2-0-46bc019537c6@foss.st.com>
In-Reply-To: <20260923-adc-stm32mp25-v1-v2-0-46bc019537c6@foss.st.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.252.7.7]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099D3:EE_|DU4PR10MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 099cde1b-1988-41d2-2616-08df1988e054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|82310400026|36860700016|376014|1800799024|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: dH+h+/p7XG5USWiMLt2ODsMVcH99br+9+AT7aRrZ+eagRUqYzV5jNXo67FnAfGdkbzXZaAOe3dd0pp5zHojwJvbirvyPgwUwNMc+jCGq9sDm6zuT0NbBiFqrlZx1mpDpsD8aEVcd3+KU05KmcjYgYVdBzvnGeyMdV8rhkqLbA0WeSlX+02UCLHllcjxFLaFk/yQuBPUEUJHk5/o/8+UzEMVfFVt86ESpSIeoYNkhCkcrGG6vj8Zc9c8ThefXGCB+ev1fdR52OyZiWkB/47IUv2YPrW6cwmBYDsilU54HBnVf5FYk4dT2ywgGCUmPyoRvEWK7wgb7+sVU+7LaGFrr7h0TaIj4iLTXRUdUGWLhsXt93qrav8YYyD3yWRFGfDYKGrsYyrJkvukNc6y7dEYEERml87CLlFfoPbMdgjjw/dRGSLV+eyG9/zmHVvQR2sZZyjPHQFX0xm46/COpl3IWC8TRfMgOztVfqoU0/9xaEjMgzuIawBe8U9SvmlBFlqjPySdyYGmBnOQg933h0QRaANmpzncvGLYpVKCdAxVQq43Jcyc/ybR63Vd6DVQkC3WA7S/ZxgLDNzn7plyEiC8ecsNuv3stHiiRGTIrtSiL9Eu5YePGNs0iAlgEJb+XlOzMAI/dHFDqsXkojZg16i50useeQrmfA4ekqX6mY8Ip3xVxv3C7Ykywm90ClGkoFRU4kQBnM7DFJpNV7hc1DtBbew==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(82310400026)(36860700016)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: c4uSYqjtuUnymb6YIpD26GJ46qXUzSIAF0FzRHobS9r1xvUsAsrrc9r6cwwOIF56U15ro1hgDNWSQEoTkcIn9HWS8G/tQesv/vUgHITo1qWyd6CVLZdJhDVmgQynhts3hYj+XQu4VA9ZJGfrs70CtPbd5IVhq0qL7kCvpC7YpENATW4sib9Lzc0echENQBiMSRPN9w/rqG8KNCzpt/DMLemDd6rW1LgItIHRqQzNE1scGOdCtR1UhBS0n4Q8j4qjKZSY3YqdQzCyT/mnXsFoE7R+Ilmk8HHcvkFLHRjEZw9Z0Bqth7wE+CVrCBltniMD9B636eVAI6JJYo1iZNjjws7XSwF2gTE/fuyXRfftTSQYnK1vFtykrWL39GjuOQlEhxu4wXP4seTi5FswLRrBJep0HU17eMT1+Ele8U1LfwHIvwr/3VS9tvxgScRryxhU
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:39:37.8634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 099cde1b-1988-41d2-2616-08df1988e054
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF000099D3.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9589
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_083947_637776_BFEFDF52 
X-CRM114-Status: GOOD (  10.05  )
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

Add analog-to-digital converter support on STM32MP25 SoC. It has 3 ADCs,
split into two blocks:
- ADC1 and ADC2 are tightly coupled.
- ADC3 is managed independently.
Define internal voltage channels in the SOC dtsi file, exception made of
vbat/4 channel (to avoid undesired load on it, in case no conversion is
needed on this channel). Choice is let to board implementation (via DT)
to define it.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2:
- Adopt dedicated compatible for each child ADC, drop "st,adc-trigger-sel"
- Drop fallback generic match (serve no purpose)
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 112 +++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 82a8a6f1f881..5834755194a1 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1450,6 +1450,118 @@ uart8: serial@40380000 {
 				status = "disabled";
 			};
 
+			adc_12: adc@404e0000 {
+				compatible = "st,stm32mp25-adc-core";
+				reg = <0x404e0000 0x400>;
+				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_ADC12>;
+				clock-names = "adc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&CLUSTER_PD>;
+				access-controllers = <&rifsc 58>;
+				status = "disabled";
+
+				adc1: adc@0 {
+					compatible = "st,stm32mp25-adc1";
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
+					status = "disabled";
+					channel@14 {
+						reg = <14>;
+						label = "vrefint";
+					};
+				};
+
+				adc2: adc@100 {
+					compatible = "st,stm32mp25-adc2";
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
+				compatible = "st,stm32mp25-adc-core";
+				reg = <0x404f0000 0x400>;
+				interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_ADC3>;
+				clock-names = "adc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&rifsc 59>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				adc3: adc@0 {
+					compatible = "st,stm32mp25-adc3";
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


