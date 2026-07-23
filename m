Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AF7C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 10:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Message-ID:Cc:To:Subject:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4eNw8uPgSc67jugJfjVKYX77Un15l7wH+f3uXq7L+o=; b=nka+J2Zp990mGDkt2uMl1YOfjA
	nNSoJ/TQB5BWJVsaIOdMcTgd/U27nya+CjQHC+YvHaNPa/SCXI3qjrWIKwa/qjjuRv7u//I0E0LaS
	QaoPWHpb6ipYL2pk/0NMCvEZQ3XJg27zpXaFTlGx/6eorwJaf2TurE2kvYVibCYSOMxiZjCIRJfZm
	rzCR51a4ost7hKiLLGVfVCn7dRcbpctfbhizHaIoGE30fwCKSM/TL23wk0LB1qEAO0RKfvmOJAtBG
	VUqgTjcdlERXxZxeH8TafLA6Q6tb44QAtkkQNBsjNNmAMSFkz9VakTxOdddQgWA/eMQuazNSJQH3W
	6v3xzQQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0U4-0000000ABoq-3e4V;
	Sun, 09 Aug 2026 10:10:24 +0000
Received: from mail-eastus2azolkn19011039.outbound.protection.outlook.com ([52.103.12.39] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0U2-0000000ABmj-1Jr5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 10:10:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eg26obJLYTkO2JRZv3Wri4oi5rDMo5V7WtJ2PUTKjLcrF8qHfRyyHh4d0aXdLpztaw1Hfyem648q3f+y/WIb90pGLNxuOQ6563h/HUzaDBaSy79J4JL2qqaGvwc6/P55BigVpZbLFpaAWor28pItqFnofFgSIA4uxOLme59OD9540nhwlMYfmxTp8VaBLxWm0F+vKIdnDrnqjiCj9dvBR3RzfPR1rba7mTv6lHfkDNr6gs99TELRhGkblLlDQAZnl2q/CivDt3kkroiph3jRRjiizS8buLc/DrJv7D1IojAI5gRY0waf4prGrbcVfdGuWDe2/cP1tn1mrOInMtPx1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4eNw8uPgSc67jugJfjVKYX77Un15l7wH+f3uXq7L+o=;
 b=lmWsXAWLm+But70bHWwQVYp0CWeseqR261u55tA5ZOu7NMcvoPBrA8JW21/K4cfBNwNkSG8wyPTv2T4GcX57q8iNfQUx9ZJstrNZvE8PH5ukvFDCBZFNB7utsAiwmCKHgV5Es/lWtXQhk6a4MY2uVfi57JRm3/JOz7tg4gehKJ8IBuK6HCGvYKhWieALRSEzLHHB+AbKBmlzNQReWDeefB3cgsBt4cZZQ/LbJ6UW00LwicQ1GXakwijtxh38FzNqC8nexYjR4hNvM9cScF14WaVUVrsGg6AQ1prFhbbFlZm6TiqANVL0ATlUyedmcLuQDKC7GXuKR7M3pp/9md2+LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4eNw8uPgSc67jugJfjVKYX77Un15l7wH+f3uXq7L+o=;
 b=jMzrFBAuoohIByoPwRCY7Y8EKTsdJ1fUNy2/Qn36jTymGYKQY0K6Pts/RFUIBlG8iXLcw2m3GGJJZ84j/l8i7uIS/Z1U2p8/iKkKZXnikWZ8bkHol0AVSQZMjxtBf1TvPv+kNXVQUD9JapZYWZAkY95BQLzcevAjd1BZR/hk9QYNJPALXyVFQguNWRDF8Ni+wk2Rd/mEYl1cqtvJ4iYDErQZdJ/KYVuhWLpeEResKFWjV107Vu45PjOnbIKcRlIlCluRv6ooUtbVDkWmDIBUlc1xvao3vXDF64lFY5OStY/S+A5M96NC/I4HEjfaVLsPwgaH954BwKIVtRf2dy9GCw==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by CY8PR19MB7667.namprd19.prod.outlook.com (2603:10b6:930:77::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 10:10:20 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 10:10:20 +0000
From: Liu Changjie <liucj1228@outlook.com>
Date: Thu, 23 Jul 2026 23:49:34 +0800
Subject: [PATCH v2 8/9] ARM: dts: stm32: add Ruiside ART-Pi2 board
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Message-ID: <PH7PR19MB6088189B91180CD218008160ACDF2@PH7PR19MB6088.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0007.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::12) To PH7PR19MB6088.namprd19.prod.outlook.com
 (2603:10b6:510:1df::20)
X-Microsoft-Original-Message-ID: <178627024483.53236.6803183953987341366@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|CY8PR19MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a79af3-23e6-4cf6-3d43-08def5fe699e
X-Microsoft-Antispam: BCL:0;ARA:14566002|25010399006|5072599009|15080799012|23021999003|16051099003|8060799015|19110799012|24021099003|41001999006|51005399006|440099028|3412199025|26104999009|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?maIKPXynd+4eEoLTwP2teyk/ajAnEmY0TymCITOTjRkyuTe28gnye6MN8vBD?=
 =?us-ascii?Q?e+fF3nj+Kpjj1Pkk/gtj5VuNvgRLXfrpZJSPmS1FAC45Q6VgnxDCZc52+8tc?=
 =?us-ascii?Q?cFViarscSwf2+282OpTm0V7FAGHehm8pBqMrHceFVEghrYq06znK9hAJd6Ge?=
 =?us-ascii?Q?EHZPxYTZl9yyVl0sOqoeJhef1pFwQGRdYIMe/EIL+H3c3n/aND1QCV1q5FdQ?=
 =?us-ascii?Q?l4KAXS1/vv4a3I6cy84AGVO8syoohxncbmce/sP9TsPfq06lNsn3Epkve0bd?=
 =?us-ascii?Q?eTVbYY6sKqbfDb6KLNCxjnIC1nA2raUG/CST4h++zn6mmjm63FI9SBfUgrT2?=
 =?us-ascii?Q?AEhxzwDxbNmw9SNTXFeXt8pHUNufbEnavztWEEZCCGkEnW+2sYkGEEskTigP?=
 =?us-ascii?Q?kqr8wG4xcKwJ6lcYWILF5Do2p+nxMeXZfBQCgLN88fjbnkANWwHXUfl7PN06?=
 =?us-ascii?Q?/bD5uafkCspnI22Xarsa7i+48CeL0HO4gxdtk3T/9ORmmEINglF2M+T0NS2V?=
 =?us-ascii?Q?Gln/bTgBTW8pD6no9NSH4R4bJ5IOplgB7bfOoDans8aq076qoDoXZTzqCYpW?=
 =?us-ascii?Q?/daBlWlp8aBid+kj/4m6/efKYSPB2bEGCejmpSe3NXqn87VyjXMQh823ttDc?=
 =?us-ascii?Q?tzQfOc82eqojvGyuWK/QYvS3Cn7jk0HytdYUYxs481CNMySBY+I/Kiz+yNYk?=
 =?us-ascii?Q?3ozRaEp/ISj40xRFNed0Bn0xLs9Z18L748A5QPV83b7X7vpOWojgaKSl79iH?=
 =?us-ascii?Q?h3/ET6tXCHTT4miUYlHzBQKgQleyYl/QEYd43LcFLCA0MTaIpm9nbP7N2ZGl?=
 =?us-ascii?Q?PT3eyzwZv6TmVt8qtKchj4sqszZ34Sk4Ob+wTfAruMYx+zaXjnifdyA/HNl9?=
 =?us-ascii?Q?rswCPKJxXgejF8ES3GqhtJbpWSsI2iwUKglpZoqoPZiXM11OXfAUP4XJPAxk?=
 =?us-ascii?Q?Pu8Z3PAHBqF+x+m9DXTHAjMV32fGWgRkJQZWhRlRHsiUvGlx74bTwLd1iNY4?=
 =?us-ascii?Q?OvyU?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZgDQAbz8Cx0lEPhzTQpUIQ14EMRrVXCqgPQG8TVdoXnI1fnDuCWFFiZbCfM7?=
 =?us-ascii?Q?Ij1+5NIQqLa7reO43cwUGULFqGt+lVHhuqDA17Y4hBqw0xMKm28NUOm8ZX3A?=
 =?us-ascii?Q?9oaoo6rCspfaoTf5i395YLHYOk3lcNgGs9d5IrMJo5E4KWK7LCPJUIE47JBa?=
 =?us-ascii?Q?l5Qx+AR1Js3sBDAqPGt2UjiSEzCdu/nofYeqjBINRDuZbOvuFSLXdnook4r4?=
 =?us-ascii?Q?injAvY8kWW/YhC6dcqiWMfwtveoC4yi/8ZCjGxSoz2r4jrzfDnJiAMe713fC?=
 =?us-ascii?Q?d/fe594SHhMn6Ri4TYAtFvL/rfqegTGoo7RBiwN/nYPj/+/dw469DHZrC+Is?=
 =?us-ascii?Q?4pO+LMdRL75ldurWB9lbG5EUjpc4d30BhtsVa2VKF4CpP7BA82BuW0guFgnP?=
 =?us-ascii?Q?mahw5KvY4VEOSZE6bXcAMtWA8pj2lfzBF4VKJTgebH8SKzneJLY8oIviD/nU?=
 =?us-ascii?Q?iuUwClmo7bpmQmVk5djcsDGFzUeXJiW4sVH3nEbo9EkYHWTEAIjK7cwTs4IR?=
 =?us-ascii?Q?qxe7BqjEkoRBVTUAZrazsDjdq67QyWqKO6U5L2ZQZoSD9NckoN7lqmRIOoKr?=
 =?us-ascii?Q?7PgabVEYcgA2Tm2FQ6ChrbBECs6g7+Cujdrp6w4iZGpn4aUxMUoIIXex43Ti?=
 =?us-ascii?Q?xxlHFl+FDrI1K6XPPhZAEf3Xzcj8FwbhsDAT01VsCSMvWSUxaIek0f2D8KjV?=
 =?us-ascii?Q?La+n4UkULoW8jznszTfn8K/qyvywifZDqgZjDY0Xvxc7XD6l6+aqhQCaS8kd?=
 =?us-ascii?Q?J+WwaahaaimJN6eLIcIym5S6EHBslM/dwACVjHueO+P4Ijuop54X/Bfxufbv?=
 =?us-ascii?Q?yuHxEgewvgb+Ils6kUMetBGB7DA1AC/tpv1fzCno4pmYpn+THV9CKiDnK0cM?=
 =?us-ascii?Q?StdnZct1h91+bdNMbHXZ/htU3ODLlCcg3EpYX4ZixlU1tT+HN0CDjPWUUgSC?=
 =?us-ascii?Q?XxphSMAcv8b0/M3vcwTdyEBTsDAhEnimVCpNfVQJZwvMhRmzoKu9gusQ1bU1?=
 =?us-ascii?Q?yDE6txIwnpDXxXdc7OUfTRrGe1W9vO8GcMIdF4K0sidrUkyE1RQjt0KrCPnV?=
 =?us-ascii?Q?HS3GVSFoN6veDngbXkd6fO+ZjeoH2TnrEYjPjDrvKNQLLmbSVzAHv4DQ7SIx?=
 =?us-ascii?Q?h0NrNfNvNVUJOiUH9I6/A2wq+9ycR4fR8gq4P5k6QG0IZHSc1OkaTTQs1o1U?=
 =?us-ascii?Q?JtWU9IgAMebSS6+Hlpu2vrts7WR8aWyA2gj54AUFbZ1ihAclXoBibAhvYOYP?=
 =?us-ascii?Q?I8EZb+E9M8QhSjG4y2i7tz4ySHWYdpJj/yFYBpiRyeRMRIxa/OmWez64T2nG?=
 =?us-ascii?Q?ilLGT2xBgw5wBEQN8gp7B2im5k8FVzXh7lqEFLEbfgwakWZnIkR/7X4WpOWW?=
 =?us-ascii?Q?FzgOaVlObDC8jedZmRqRiuLtnSsfvpR9W4tX6VHnHK79QkTaGg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a79af3-23e6-4cf6-3d43-08def5fe699e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR19MB6088.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 10:10:20.0096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_031022_384294_C167ACBB 
X-CRM114-Status: GOOD (  14.71  )
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


