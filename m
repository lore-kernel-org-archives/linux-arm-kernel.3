Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0010C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 16:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Subject:Date:Cc:To:From:References:In-Reply-To:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4eNw8uPgSc67jugJfjVKYX77Un15l7wH+f3uXq7L+o=; b=zzaX5zF449IoyeOeWjOjRcFpGi
	N9F8FhsF60p1Otw41njNwV6VLlwIdBeKpt7XXktc4I73X2w8xOrj83hrcBw3YmMJ0GYuUYU7n0Y6T
	t7ewLxtkQm5HMO5U/GIbtJm0XYm7kSiOAmScEf84nDFmI6qgCiwY6yTDtrUhRYEzeioeJrkF0ITgm
	O/zjyShiy57rDzULUu0e4HymvuLDGVusBR5D78Rm7QRiSbWVOgYtVTaLMO2JUFM6oz25WIzqZAfNW
	vlVW/6kLU1NXY6ane33pT1wLaZ2TUXEvS9XDv5RiXzlB/nGF7guvyqXfhQ0OjLGS+X3yHhjTgJVjx
	/PgTR44g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1UX-00000001MI9-0OTX;
	Sun, 26 Jul 2026 16:14:17 +0000
Received: from mail-westus3azolkn190120000.outbound.protection.outlook.com ([2a01:111:f403:d116::] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1UM-00000001MC0-2Xto
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 16:14:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErcqyayNnKCNWyzpj4nhWC9WIQf/kAztYALYBIwSLCHvBpZZs3J6RE/vKh31a/KWHCipXh9FTzZOHsOmVZBxAWpiHIBkNOvS/WaOYKLHhifo/bVmA/O5Ei8ukKETCLhyUh9CystfdWrj5NanZdQ4YC0m7gPLherfqZYyJWJI04/WAu5nogiAStrG5ld9t+i+Wd9yK4zxpGcM7KZjoh98C8f4rS8qGM24cW7nQuuSjdchSBk1Q2Tu757qqhWrlm0RCg1yDb5SRBSYRVYji67XbUw2krCRljvlyxUE6MA9bXt/Jb8kaSbY0IHS+knyAswVN/ct1M6SE939gGt8Vv74cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4eNw8uPgSc67jugJfjVKYX77Un15l7wH+f3uXq7L+o=;
 b=sq4ISF7/okw3yyKPRHmKyMw/yVuLECAaaui/W2ufWvk3r2LqT2psduDbKUHfe3HVEvWbVoZ13dQLOqEFralnsluksBp4SukYB8XmplBPRRUvW2nAc6q4Hx4yV4DpbB0ZJzvZxWMzvOsaJOQtxgRGHgNnM0RWZCTQEx76bcVZ2keI4w0GhcSNVmzEdNEh8KBM2OAWRx1WltRe8YqCmG7hP2SYEeKiK+6Z0Xfd0NO1o8kbwWBlMgdScgTvn1KL+VXr4KHYKmgbGODKxLrhE1C4Yg+TG11zgh1SymoO1NMPRpwMDUWiEbBrO0Vq2zS8xvG3apV1sghmI07iNGeOGg1Mpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4eNw8uPgSc67jugJfjVKYX77Un15l7wH+f3uXq7L+o=;
 b=Kuo1p0MRzWNwJjp+t5RXqgyCIaYglg2X1q0hzJzkVRFd0IPci0kq9p5qJresD6KHUgtUnB8VrifH6KagEDBvLgBsmHFzJgNF5b5g8hOVaAt09vd6ZRAo2eWc6RTpzYw+VjvQPUrzTJCCygixAQ9Fci7ssbD4LhY9046yP8GfRRO4DS3XFJ8gnTf23RGXKLizaduKcN1M5DDCk933i83IahN8hhamUCJU3HZdcKZtopWe5eNGO7x6Vgge4gw2isrmo21xveOl82dAMwvZSqPAqBtUI2rUIIfuEQbIA6OyCSampTMKVKxWZ7V+Pz/9EJlDRFQMuvukslf7bVgldFbRSA==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by DS4PPFA96D1C9B4.namprd19.prod.outlook.com (2603:10b6:f:fc00::a44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Sun, 26 Jul
 2026 16:14:02 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:14:02 +0000
Message-ID: <MN0PR19MB6091638CCA098D96A2C553BEACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
From: Liu Changjie <liucj1228@outlook.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 23 Jul 2026 23:49:34 +0800
Subject: [PATCH RESEND 8/9] ARM: dts: stm32: add Ruiside ART-Pi2 board
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::11) To MN0PR19MB6091.namprd19.prod.outlook.com
 (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <178508246441.28466.6784587989256932239.artpi2-resend-8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|DS4PPFA96D1C9B4:EE_
X-MS-Office365-Filtering-Correlation-Id: 9408b085-7db6-4b6d-aefe-08deeb30e801
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|2604032031799003|704163111799003|51005399006|24021099003|41001999006|15080799012|16051099003|8060799015|19110799012|37011999003|25010399006|5072599009|40105399003|440099028|3412199025|26104999009;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dwhcaziV+ZvuxGSn0KEAvrxRzVdEZ1kjxw9SGokfd38B8ulL/a3KZuSBJmcX?=
 =?us-ascii?Q?dvPR3Fz6/eCojiMmhTCSSkk3XCqTdz3FpyiiyS9bEhB/mIeDwlj2NfwZTOOu?=
 =?us-ascii?Q?vwJb/SJaQ1kQ18zXOz6vA6XmG6Qy/xOrSPKSplqE38u92x4Nqx7FDXovLx9b?=
 =?us-ascii?Q?OYgkTbFc2/wS3kdGOLdZ6k0oExGWZK69rEKaR9fal407NCs5c9KMs1F38ocE?=
 =?us-ascii?Q?Dy+Xuff6JwUy9zSpQAoTDlw4mn+3TT4MYMswaeT5s05Mtf/h0yHZXRIo87uV?=
 =?us-ascii?Q?nF8XQ23JVGFjGBg+aieaZtrayD4lOjqxmF8TdgdaLGkLxhTH/6o9RXJ4IGQe?=
 =?us-ascii?Q?OwS4szaxkwkV3uI6luyYnhtOEHcBTkJ80ViXDPw3cchodKI4iBkKx7uxARni?=
 =?us-ascii?Q?WzCfAmqD87Y0Ut6V/Yl+u3R9E+CWQSWFIhhMi69CFg3DsGXTKn9yYj8j+sJ9?=
 =?us-ascii?Q?yEdrAcQ6R7LGSHtFtsxD7rHPPmNKpAs0GkFYTOwRywIjIC7Pd50Y0tyqOVKD?=
 =?us-ascii?Q?md8JanpmL/n5elxczuVNpwuDbuJBStWjb4KzLUKTiszvsr9mAMtiucK9vNvD?=
 =?us-ascii?Q?2YXUIF7d8PKVExOy9D2LnU70kHQXqrX9C7oBtUk9FDBdXncv+ALpEFls+hjI?=
 =?us-ascii?Q?tLltO5wzBP1rQA/j5Hi1zXUKV7Hjy9yrPOyBWD666ltodRK3yikS2hDmsW1E?=
 =?us-ascii?Q?U5/qqRZ/qrFw4Ff55JtSdfPXEyyAcSebBm/j9aCYZALZWgM6IUz9EXp922GZ?=
 =?us-ascii?Q?JoI2oq+B16kfO1IW0kzxPC6daSHej0VhWZvhp4iYVIU9p25HNGdXl2T/3YA3?=
 =?us-ascii?Q?Ahwy7aWzxSTH+UvIep3O1t3gcCLt3iojvTQaUy9Yb/gdce1Po/ElVbK0E5Da?=
 =?us-ascii?Q?gX4qOLHZeYNwCLzQGWCjgmNt3FkCe0tvr/KGgJ7z1sbrl6iowM+ydGvPie0D?=
 =?us-ascii?Q?Jgc3cicO3DyoFn6/rMA6driHnQ7VpE/5Sq6/Qor5TueISYOmaUD7YF1IGtH9?=
 =?us-ascii?Q?DjxUv0P/di+XAeRzUCjHyLqQzLH/KdLpc78V0yDjl8+SzxmUN8TP+MrbkTIl?=
 =?us-ascii?Q?LYW8ZF/N0k6FqwyYB39OzDXlhtzcC2kPqiNM0elZ7WEcn31yaM7+zjT+eNLd?=
 =?us-ascii?Q?0G6qHPWd0gdi?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NiyhgCAFOdT2bixkWJkZXIIK/Bv8urCadwAgoyVERwLqGL5ybLsEei17Rxsb?=
 =?us-ascii?Q?neTDpfiUO3j+XWpV+808ExyclfM6MVKvoFA6HH9NOlFOU+O8pC2dmza1PVNd?=
 =?us-ascii?Q?+3hqZdYbcVhxj6qKJR9fibgaQG6yAuNluwYQi5fd3ynVhhvb9C0/jZLqFrY/?=
 =?us-ascii?Q?rFBYs4jEdlIMvWO1z7M+l9nBehJtJgpu7aecDKd8Zkis6o67da5K7Fw+O5WT?=
 =?us-ascii?Q?EO/tX2VF/ctlryvX4qUAgWRkYi2h8TbMxMc5FI0K69iy6fdr7nb8zsOY7eXO?=
 =?us-ascii?Q?Ad7kYs7WuQbFdrWbC5EXWfpX4WLdCsKSrMjKgc4Ug1RPV4zqupDNsRZr2JGg?=
 =?us-ascii?Q?/D6LIElUiwesT4g+MM3I3RPL4j5JHFG7ekPVqZES4JI51b98OnbpBpW/xX8c?=
 =?us-ascii?Q?472ew3iYrMfE8xEZfnpdRIjnMYNQUpdJTX1DFov+0Stfuk/V32riaC60hQrc?=
 =?us-ascii?Q?uFjllHVO1m6tIv3VFWp1c5qEUGU1pUXk7jhk7pEqp8xQJtht6I2m5KTH6wny?=
 =?us-ascii?Q?WeAaaceEMIZUSkg76CiTI0j+hBzPUnZu1nLMTGDk6PB8/jHFgpGscYs/pCVB?=
 =?us-ascii?Q?riUwjh8eQoAnMl1bRYZ/6m0R6AZgivYm1nW4S18ellCbS8nLaluU1N3ikxzZ?=
 =?us-ascii?Q?uaCTBaoAHA7uN0FV02oHOVDzHJyoQj+xP3MDENrffu1JzLIwBlU3OK7agQEv?=
 =?us-ascii?Q?zDNI7JnE7faT2VOhnq1oNboCE574wBXBBvlyTpPLj1+na232g3eUMLGjnBIC?=
 =?us-ascii?Q?uiQjUePJW8xCxmGAgAxdMgtyZogfZ6JOUeDHNo/AWbzJ0tLNe84y2sM+97yt?=
 =?us-ascii?Q?iCAsUKL61T5o4LRTffl4o5EXUV062Jcpgf868cNs11W+UhantTfbtgQqxZGa?=
 =?us-ascii?Q?inOWLb7X7h1KbZtEZMIVA1kBBrcWAWskpnR9f4dbsXNr27qvcJBezrXm8W7Y?=
 =?us-ascii?Q?0Rtim6hSTeyndbScRHIPyQ3msKBERigacMhmxmuCKLA7LX0alsISRTqQTH5U?=
 =?us-ascii?Q?xODMxm8OTuaCJ4GbyNKWEMw/4kFL6XWxEu1gHXPPM3JfN0iwvESrgaj2Ootg?=
 =?us-ascii?Q?4NLWZJBHanhjRUqKHguBHws87uFLNsWHo3JlmWX+x3zaqGBQ8cG1fJOya0/Z?=
 =?us-ascii?Q?OJ4rT6hIAQwAOd6GJM7tpP2v9pyqmg60E+Sr3BfSREp7BdDiXwyhAoIXm5Cw?=
 =?us-ascii?Q?R2UhF3vU83c+phiHQrLuaYbMjaK7VTb/H3uWOK3oQPkE2HW1jpiURHnMHhs/?=
 =?us-ascii?Q?4Vo4WP2/nL+orkIre5NUfymWKtWOnBYZdNPo1R4Bx5kU0j/e9KsKA35YL8nJ?=
 =?us-ascii?Q?3by8xx9uxXuPMv/SaLHcQQL62k7QHZkq12URI5tbLZovBa8m4C+ivAH8FWdQ?=
 =?us-ascii?Q?W9GR6JUZ7MGv8RIVcYMo6lEZ+Ufz/IKaHZ+E4bWE3oOQqNHoXw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9408b085-7db6-4b6d-aefe-08deeb30e801
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:14:01.8987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA96D1C9B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_091406_654638_A983B280 
X-CRM114-Status: GOOD (  14.02  )
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

Add the STM32H7R7-based ART-Pi2 with 32 MiB of external HyperRAM,
UART4 console pin configuration, user LEDs on PO1 and PO5, and the
user button on PC13. Enable the four-bit microSD slot and reserve a
coherent DMA pool for noMMU DMA allocations.

Signed-off-by: Liu Changjie <liucj1228@outlook.com>
---
 arch/arm/boot/dts/st/Makefile                |   1 +
 arch/arm/boot/dts/st/stm32h7r7l8-art-pi2.dts | 100 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32h7rs-pinctrl.dtsi  |  63 ++++++++++++
 3 files changed, 164 insertions(+)
 create mode 100644 arch/arm/boot/dts/st/stm32h7r7l8-art-pi2.dts
 create mode 100644 arch/arm/boot/dts/st/stm32h7rs-pinctrl.dtsi

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index 10c5d75f6..ae27a4ef9 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -113,6 +113,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32h743i-disco.dtb \
 	stm32h747i-disco.dtb \
 	stm32h750i-art-pi.dtb \
+	stm32h7r7l8-art-pi2.dtb \
 	stm32mp133c-prihmb.dtb \
 	stm32mp135f-dhcor-dhsbc.dtb \
 	stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb \
diff --git a/arch/arm/boot/dts/st/stm32h7r7l8-art-pi2.dts b/arch/arm/boot/dts/st/stm32h7r7l8-art-pi2.dts
new file mode 100644
index 000000000..ead141817
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32h7r7l8-art-pi2.dts
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+/dts-v1/;
+
+#include "stm32h7r7.dtsi"
+#include "stm32h7rs-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "RT-Thread ART-Pi2 STM32H7R7 board";
+	compatible = "ruiside,art-pi2", "st,stm32h7r7";
+
+	chosen {
+		bootargs = "earlycon console=ttySTM0,115200";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@90000000 {
+		device_type = "memory";
+		reg = <0x90000000 0x02000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		dma_pool: dma-pool {
+			compatible = "shared-dma-pool";
+			no-map;
+			size = <0x00200000>;
+			linux,dma-default;
+		};
+	};
+
+	aliases {
+		mmc0 = &sdmmc1;
+		serial0 = &uart4;
+	};
+
+	v3v3: regulator-v3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "v3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led_red: led-red {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_INDICATOR;
+			gpios = <&gpioo 1 GPIO_ACTIVE_HIGH>;
+		};
+
+		led_blue: led-blue {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpioo 5 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-user {
+			label = "User";
+			linux,code = <KEY_WAKEUP>;
+			gpios = <&gpioc 13 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&uart4 {
+	pinctrl-0 = <&uart4_pins_a>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	broken-cd;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	max-frequency = <50000000>;
+	status = "okay";
+};
+
+&clk_hse {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm/boot/dts/st/stm32h7rs-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32h7rs-pinctrl.dtsi
new file mode 100644
index 000000000..08f09f562
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32h7rs-pinctrl.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Liu Changjie <liucj1228@outlook.com>
+ */
+
+#include <dt-bindings/pinctrl/stm32-pinfunc.h>
+
+&pinctrl {
+	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('C', 8, AF11)>, /* SDMMC1_D0 */
+				 <STM32_PINMUX('C', 9, AF11)>, /* SDMMC1_D1 */
+				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
+				 <STM32_PINMUX('C', 11, AF11)>, /* SDMMC1_D3 */
+				 <STM32_PINMUX('C', 12, AF11)>, /* SDMMC1_CK */
+				 <STM32_PINMUX('D', 2, AF11)>; /* SDMMC1_CMD */
+			slew-rate = <3>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('C', 8, AF11)>, /* SDMMC1_D0 */
+				 <STM32_PINMUX('C', 9, AF11)>, /* SDMMC1_D1 */
+				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
+				 <STM32_PINMUX('C', 11, AF11)>, /* SDMMC1_D3 */
+				 <STM32_PINMUX('C', 12, AF11)>; /* SDMMC1_CK */
+			slew-rate = <3>;
+			drive-push-pull;
+			bias-disable;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 2, AF11)>; /* SDMMC1_CMD */
+			slew-rate = <3>;
+			drive-open-drain;
+			bias-disable;
+		};
+	};
+
+	sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
+				 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
+				 <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
+				 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
+				 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
+				 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
+		};
+	};
+
+	uart4_pins_a: uart4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 0, AF8)>, /* UART4_RX */
+				 <STM32_PINMUX('D', 1, AF8)>; /* UART4_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+};
-- 
2.55.0


