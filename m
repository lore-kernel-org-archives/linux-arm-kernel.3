Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BC5C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 16:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Subject:Date:Cc:To:From:References:In-Reply-To:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4eNw8uPgSc67jugJfjVKYX77Un15l7wH+f3uXq7L+o=; b=LJdasqIEXL9zHvPNlFsEE8kVge
	T1p9MF4gaSo5mQ1LWFhZRVEDz8Fgm5GE0Zhe2ohqd6A3AIqdDKLSKAXOIO0aCN0kJuGLmR0XqXR80
	+UFCkdXhER6pEyplKA1qj9Mzk4OT44n6zN0s6C4AJ86xhQU1dePKyCNGiYHJapTfACBbRxfzMRkDY
	VwTDPKzsT/piVDESvmdcdbomRBl5tbSzPXndLlEjSeeCMBghgb9YWCg3ZCk4sCUbN3sPA/68KLxJx
	/9smsNOFHOERbVHlOluiby+WP2i5WshDBDcIlzslvLcdbrUlpaeBAzOWPNuBOXCdkBWurof4Nx1Gx
	QN/SD45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1Qg-00000001LE4-305K;
	Sun, 26 Jul 2026 16:10:18 +0000
Received: from mail-westus3azolkn190100002.outbound.protection.outlook.com ([2a01:111:f403:d116::2] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1QW-00000001L8p-1y3H
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 16:10:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emEZ5gYS+aIHzBavJJ41GUgyyiI/ctb+ekPAppbIz5lUD7G5B84OQj4qKY61wSQHvQfSrvZhLK0RABw+GtipT18qT/Re7HyINd4Wtsj6EiROkk7lYadqqNaevs64BYJ6Fy4QkhHi4ZxwoK9qegoAgLMthDrhUKRsjwM4WZH3XQGPI7yCWmjyZ4x72EM8zkTWKm9C1coTlmYvpu/Dga5gUvD/XKrt2d1tXcEROcPSCJ+zur3dSq2bcqdOJWUzRh7A8pJ4PXezJPWbw7vlHwcTnonaaZd6LpMv4z29xQDY9LEBn9yS7qxVno6/k3t0JU9lj+usB/K98u6duO1ItJbFkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4eNw8uPgSc67jugJfjVKYX77Un15l7wH+f3uXq7L+o=;
 b=ZJb1rPTdhY4eC0+EoMFX6lGZotyntGtFl6A7X87yjA3UkSg+Y2FK23mYBfThv1PuUnsT21ijtayBCsyGOTQMamkHxrUfnfFre9hSpVy1Wi1aOigRSXCdKDw8Yr50PoQ2izqbf50yKPaJjzg8tRBVc4Ps5O9j68KvG4BES/B8NNZ0rwQNb2U3MUDvvtmdwcfq57CijMd/IxGCq3JYHStAAF+hS23U5iXF25oormnDNA7xTxLoEE/ZuSPpmdHQTecu6gai1upHt4iwZh82TZu/LhHOJC+P8Fw21CC9rknuFEfjsmjp/OUboa15eMZMGz9y3EAX9f8IRYBtM/qBgkmphA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4eNw8uPgSc67jugJfjVKYX77Un15l7wH+f3uXq7L+o=;
 b=c/Dq3kvnRrKOk3LifM7CWTJ1EGSr15ZG3XIFkCb+pdg6JcjxZKOrg5fmJ/D+6W3h1eiZLBnTPjEkjfhQkGAbqeF5eOAcU8DYf1omfXAkbKw68t9KhEdQm9A3c71k0GrmPV7kIIMjqYBeM8GW1VzNM3cI2FLXtnDwpm3u/giXF7vWyQ53oVrRYtcMMHPIoMIjkfvhO1N71il8V2XhZciG1uWAVcpL/Y9MycOYiKUHmoewYLgc6EJFYUNNnLREs/kkFQd8cQ9qRqf8LYUMOte8Glb8eUeOzhX0Bma/vVOPE15iVtCAiq9il9N+mWrQ0WuArebP8bQklH7KR4+BU+hScg==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by SN7PR19MB4765.namprd19.prod.outlook.com (2603:10b6:806:100::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sun, 26 Jul
 2026 16:09:52 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:09:52 +0000
Message-ID: <MN0PR19MB609139CC747F89EB89FFBB00ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <cover.1785080950.git.liucj1228@outlook.com>
References: <cover.1785080950.git.liucj1228@outlook.com>
From: Liu Changjie <liucj1228@outlook.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 23 Jul 2026 23:49:34 +0800
Subject: [PATCH 8/9] ARM: dts: stm32: add Ruiside ART-Pi2 board
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0008.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::9)
 To MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <cda5c9be51dadefd8081e073238cb88d9b5769f0.1785080950.git.liucj1228@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|SN7PR19MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: 1069cbb2-360a-4f74-04dd-08deeb305379
X-Microsoft-Antispam: BCL:0;ARA:14566002|16051099003|51005399006|24021099003|15080799012|23021999003|5072599009|25010399006|41001999006|37011999003|19110799012|8060799015|3412199025|440099028|26104999009|40105399003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qu7zB/5e5GKLhHOs543I+wJqApjTS1dUcckpU0jT22fAGIwCmErCDbDulC2V?=
 =?us-ascii?Q?mpvvjo/lR5GVYoMLHoaGtn5ROTFJ7m3lGWWou8NIwLhpL473aNK+vnEnkUJ7?=
 =?us-ascii?Q?GTmMgtBLocqNW/tcVF5LsVfuj3bCf6FMSLkBS+k2hTPfU2vbBz2GHsCjfjkw?=
 =?us-ascii?Q?UK4HGC76d6WI2AcZAgmSVmf0f4JU6VUHOftMwhZ8/McGLaIzniId9/GYLylL?=
 =?us-ascii?Q?CcobGlzPQ1ZizD64ihCVlBVR0LvtNqHZmGiuxCYloK+lgLfcMnm0tPqNC7uw?=
 =?us-ascii?Q?tUcc4+RExK96GBTDyR2wjQ2Ur4nNELHxzjDzfCb2TgZs9oldXBPsSuESz0vb?=
 =?us-ascii?Q?y2Qnbk9O6gX9ST3QBc3uhaJ07hMmOu8uie+3gHjA7TUeETqEvepZABFBCbuE?=
 =?us-ascii?Q?IMSSEbUWSC/QoaesuLWcyj/ck18kbqFhliuKnO60KQfP6MuELK+GmpO9uvOe?=
 =?us-ascii?Q?E4AAE0aFMoboDnyl42walw6fHb5YaCgydlgUYXJc4S8VaWuT1pVYHBsj+a+z?=
 =?us-ascii?Q?JWEG+XGlROYJu1bG6lIe4JFVpRj8By25+88gEEYMqSzKDdPf5txmjyFLscPn?=
 =?us-ascii?Q?7mbDeIDs61Gk1rMSy1M9t4GEZlpH2ic3bWcgpv5n2eJ0aJeYwxjav+4SgQob?=
 =?us-ascii?Q?jvpADEgnjVL3nd/zyrzevTG9vk8nT7qVfYcy4OkQauO5ceMgl6BeXIM7R9I0?=
 =?us-ascii?Q?OEqRfjrPcvhRR0+jkWKG1ldixijnwEOP4XTfp61yUKyr6haXTiR/d2BrnS2w?=
 =?us-ascii?Q?uaBK3Omf9XK+0exVzyGblTIzWOtaIOszxhizufoBhTXudL8+dPvCZpvaPz7m?=
 =?us-ascii?Q?tzn/Do+AUevrHAyVQNE8TN9uWGTm8C4XSrPxFzmhPqjDQl4KwuDwIQUGzU9Y?=
 =?us-ascii?Q?Sg1yWYCynKUVQXUqv3vNrMmUOG1Bjntmbd6oc8TryekNGr+u17w1CDcRDzEF?=
 =?us-ascii?Q?q/WekBsRPXcz6FmBulnHxfKkQvtfDU9Z0OtPHKzXKByzoCFIGHy2J4cZVwPn?=
 =?us-ascii?Q?WivuQ3l0vXU8ZvEnTcHlu/MfWw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RT6F/clwLMjHpxyXEVmWA6cvvhxXT253bgYPwaeHQfnNVyH9eAhNCEMnJdNw?=
 =?us-ascii?Q?AbbzHXeTmOfDop6dgTVL1sTDqXA09wpuguUXwesSMrKMNMIYKY7tV+1V7RUj?=
 =?us-ascii?Q?sLT0Mwa1QWIELLefdjQitk/lkLqATqItmlwMEuZ1mVMT4jJ0aqPTmtaot0JP?=
 =?us-ascii?Q?Gsqc5Jo2lG6zDZteHOO+jSgs2bun5AKJgPijY8PDDl4ZyUfjgyyEYrv/+l9Y?=
 =?us-ascii?Q?NBOF4EeHe8sQdu767AY5seGX1DdaXoG4on276D45O+8AVdlkYV/BmQRw7Hsp?=
 =?us-ascii?Q?geUNA+KS1q5aBYrwMYRQHjPTLJaqujHzMmDgAJMiHwoSyGVQ4T6sxyz6PvHi?=
 =?us-ascii?Q?UnEFgq3FEj3fUVxklawNuC8nYFQm/LXdkF0iXHVpJS3rWfhO2Mtv7yRzjHrO?=
 =?us-ascii?Q?SehsXmKgtnGYr5X522RO1FWcAbbYjiA/ciR8JGsKO+iIWOcMsbirfvPmCn4F?=
 =?us-ascii?Q?qowTtYYCMSn3n7Ke0PQbAeDdeNO3dxjGI4H4EJz8zAt2M0ZICkPjsuuQ0omb?=
 =?us-ascii?Q?Gg+nbL+xDSCYSNn26WRzdvHDq5gnhzE1DVoZaulvWShKV8l4bqGlvGLtLaaK?=
 =?us-ascii?Q?+aEF6YFc67Fnv/FQmV1Y6ehKuUHwenMsC+CK8lgyC4JsRRnn0sMmXkp24Oeg?=
 =?us-ascii?Q?1ZoiAJKD2EWE9JLt+F2VM1b2HrrRNIRPM4qeTQdSjkHLt9kNhn4umtR7/rFo?=
 =?us-ascii?Q?OEnFkOxtG/pVifnTxDE3PU6nzMbFAQlnEYt2aLkBhziq9JR5m8VKdR2qeZrR?=
 =?us-ascii?Q?RyuKHhJLqZIyAMEs3LKmOS2qidr/eh/LfJwXddAMVolGbkPIp06nF+4Bn9Z8?=
 =?us-ascii?Q?r3neuy/wb/hjJDodoZYFnaWjEWu8pWISePi9NR/2rqbLh7dxtdPvmJ1HZgqc?=
 =?us-ascii?Q?FOAWNY55sFu9DTyiUyNcKbxzF4put6MmwABMP9kB41F4RWEh+DjCOs2WXWvV?=
 =?us-ascii?Q?1zYhJHpQVM/R+5XTiavxmCi9pV8/5+LEalvezbn1BWal8pH15lTn+pXN7+B1?=
 =?us-ascii?Q?kqxTBI7CobmJC/aKjEEehXMP1CgNS1TroBE4a4dcXywayiK3UYh6TFdHFvLA?=
 =?us-ascii?Q?FJyXRoZDQOCpaT7Ck2l8bMJuoSsHiKPMZPsnxXhVZU6500MUAf308oyys4Gb?=
 =?us-ascii?Q?cjwhULNfUxQfrku+miT4/F83r7SaQ1ubEgMBVdsBvuTgDfD4UTy8P5JLffuN?=
 =?us-ascii?Q?2u6yIJdEPOzGREfZcgJVosgsxdo55Nc1nsvVb1ZjygH2cx1eJNnT+iVMTplM?=
 =?us-ascii?Q?fbINAnaLizQaeXb3lq4SO/Ve8kqwMAM+mYimf8sRXnGmjmkzh7TphNeJPQdo?=
 =?us-ascii?Q?dzvK06bk6WXIfyQj6V6AX8InVIVv+h5SDvnjy6VAijx7HTIN5LOdjgtawMZe?=
 =?us-ascii?Q?i8MO86mC3HqqDHdSIPeov6vH1K/+sA783r/8ErpZWKv2f/2mUg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1069cbb2-360a-4f74-04dd-08deeb305379
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:09:52.7045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB4765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_091008_518075_229F51A2 
X-CRM114-Status: GOOD (  14.31  )
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


