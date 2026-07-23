Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DEAC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 16:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Subject:Date:Cc:To:From:References:In-Reply-To:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTsZb1GzyBP0jCz1dGeupkgqOl3OqzM7naobyzqXX6k=; b=pIeQ5wWx9EXS0Vyb85F6Xqi8R0
	uVbZnOixSoE+nw9X+P6QeRCOJk/Xzyw/IJKVNWzqCI14RKgV8fGWS+XkPSySirgnhxv83JgpumE9v
	ZjNKLdWzNZv8yrwr0EDg2YpV1Fwh7BkrEIPfxyJoEmlPObJ2QDv09ZkV185O4LYl9sDPZpQELPTTx
	fJNG1qqUw37RmRZEkIxrxzzl0ofk5+avh9Cs4kSMsdAz5tduHt+J8Ro0C0vMWSQTyUCV5WAggB/d4
	w2k+nDTEVvh2NwZWQGT+6o1XEyzkWvJFLM5Zohi96AjzuMQjFgNhK5NDisrRB3BL/TJGZboDVna2p
	hnx09nOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1UW-00000001MHm-3vhW;
	Sun, 26 Jul 2026 16:14:16 +0000
Received: from mail-eastus2azolkn19010019.outbound.protection.outlook.com ([52.103.12.19] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1UI-00000001M8c-3PRk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 16:14:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPmAuvrC3cw4qghWhqJxljKqIw85ndG73IGlaavY48Ir8mhgvMApsJXpJyraslZdI+EWm+SYVvN6vx+UhfymNKi0TTqUAGNUIYF9bRgCOVRiU1cltkMntZPbTEckp3lwm527ibsO1iafDf2GQHc6nGP8/0ODGIZBOJY6RMZq9HZQpkSTF7mxoC2B/jOwNZA5Xy8lyvaIxROXUEaVW5nDjnXcnCC91hnZfxQtAZMhH+aNOjJoi97of/FTNziNRhxvQoGte83wtnlvpM4ZZucoT9TgiCTFDcoz4kbfe7S4HNhOUnkJ/4zhVewQdiBwu7j2Uu3dQVYxngn2uT+waBUAZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTsZb1GzyBP0jCz1dGeupkgqOl3OqzM7naobyzqXX6k=;
 b=WLcakNmxIq/7GPQ3NQ1PbbQAV2Nv5XwKdLt3sQVaxXoFF1hMaI8jB/Tf1vVpqnOvKhTE8rwnCyhyow9IEumkPkXIDsUblzDMhZWMucdTkqwFBLUV9iZ0HSsZSDNXUfPjJxnmJn5j/73cH5ov02uOV1Zwz3mxvkalfdxo0UZhwTQe9nM763c7yI/CF8iVnleWbQkhyQvt9elwuVBwXD/zc3WusidNWH5+0pXsxVwlG7RZULyNgniiBFlscY/9dPLWYHcAq/g5jq+XwkX9I3zus6+pvNVpCo95YIfHZbOOIhwvG+dj1zq67/F/AloUXnA+ZmSOeDUwtmcuI0ekGQ5uaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTsZb1GzyBP0jCz1dGeupkgqOl3OqzM7naobyzqXX6k=;
 b=bb/rbeZdQYmTQF+d5t27Z9fhtbo5N6AdDheaKbo1kOpqTgPoFZHWYnhByeQNH2RLclQ4Re68ZKJNlyoYaPuiWlybk2L5FGuQbYrjiJy8QPvqTxOerEzQdDEhRIJZCt8Y7TqvNt++KTxTahcA/rRlR/UicHbq6nslFgLT39aEApgSV0d5p9dssiJHU+sjiCXapOq0jGQMoNrgPjNu0uox5x7+kPxKi3HjbebmDo9kzc0ne1dCz701aO8/q3RVCDaSGlPxhLQi7ZB+AfEd+QmnRR3ej5DG5d1EEFLGO0DNSTBX0K9CJjrdaSzlK3+5fOO/FOxOMDshGeiLWJEEzJkk5g==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by PH7PR19MB6807.namprd19.prod.outlook.com (2603:10b6:510:1b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sun, 26 Jul
 2026 16:13:58 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:13:58 +0000
Message-ID: <MN0PR19MB609159EC2888184313D616F8ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
From: Liu Changjie <liucj1228@outlook.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 23 Jul 2026 23:49:25 +0800
Subject: [PATCH RESEND 7/9] ARM: dts: stm32: add STM32H7R7 SoC
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::11) To MN0PR19MB6091.namprd19.prod.outlook.com
 (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <178508246053.28466.1934049929587720720.artpi2-resend-7@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|PH7PR19MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: dd25582a-df74-4e0b-cea3-08deeb30e5b3
X-Microsoft-Antispam: BCL:0;ARA:14566002|2604032031799003|704163111799003|41001999006|8060799015|19110799012|37011999003|12121999013|23021999003|15080799012|51005399006|24021099003|16051099003|25010399006|5072599009|40105399003|440099028|3412199025|26104999009;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nEn+Xli0oZED0shnMLwEBTDxZoXeh5kgFGtv0EHtvUVXuYd6HZJU2XLtzBd+?=
 =?us-ascii?Q?86EkLTbCGfzOoNWdBx6iZY5wa35MjbZvXntbwuaXq34Z+V1Acu5nSDaqfkD/?=
 =?us-ascii?Q?1b/xJoWJxc5CiVwUwVXFqmlYG4bNDOTYk4OWibpUw9zlmMDBFsqIZQoaiEeb?=
 =?us-ascii?Q?/r55O/yJTKVo/bliiuAGKA/tY0BoMp0W3q4mXbet4JCF0hFxKXkwwW/MSy8x?=
 =?us-ascii?Q?AJE7TmwcjLO7w+88KkT9SUT0PIpVcfyMS8jlE2x2fTmEiBfzzkol6945VK05?=
 =?us-ascii?Q?euvHXgJu4Iyk8G+2f9/SbD7Tw+Hc+XTnK3r6ZexyZpxy9pBXLIpXdOL1WOOi?=
 =?us-ascii?Q?Cq9au1GfVVLw03W70gLCLdb63Tda+taLtkuMWGFWgSU4tFn6M7ba72wT8nwX?=
 =?us-ascii?Q?bm8/bKWzVCOCxPahEKvMGBItYtKdqQ2aeQ9aF85a196cUBfSCZ/AMRAcG/8c?=
 =?us-ascii?Q?mVlV1r4hwsMmHi0XYfZHSgXDbvUdEGPjKOXM6cxIB8Odj6RA4LWT97yA5WHS?=
 =?us-ascii?Q?XusI2vj2qn3yvkj9m43+EqoDKWt3Pcs/X3QY185uKDgMxBjK6wVKy+EW18Uq?=
 =?us-ascii?Q?mbN4hpfZNQXSIIa/AL5KdblYkUCNNmCneOkUl6U/do8dpxyIt0m7zBrcA9v9?=
 =?us-ascii?Q?ZqkC6/ypRgZ8JF7gBqOTBsHEDQVH1BJ+1e1ozwUBf/tmicGLJWtojb9YoPhk?=
 =?us-ascii?Q?ad/NIvniBWvQ4G4Z4IG7uTz0Dpk19DHDOY2yR0zUWzRMuQwifGnPWpjIGQvU?=
 =?us-ascii?Q?V2nrS4VAYDuVGUmyVoXjoG4mSSkgarcMd4OtMTSkI51+hxSH9FeU5kIX5ROh?=
 =?us-ascii?Q?3lr+Ra8ylP70MjD1AkqkQH6gHnx3ufb2GdTpd4XvEvY90pz1s1o0zMxT/ebv?=
 =?us-ascii?Q?YgOG5LvtjwyxdgL4gyOP1HIZoH+hGhQXL+ZfqWLvOh7pdAtXOiYE8uCIH3q1?=
 =?us-ascii?Q?7uv+z8BK0Zo+6Mgw81JSWISaliDCtrYON4kT1Hgn9vNEmrgXymmOaRaWOqdK?=
 =?us-ascii?Q?GmuBT9jZQ8jRXPZbDmXdU9ejC3PnQ92WCpNBSNgoFck8N2vA0mHkSUV0fn4f?=
 =?us-ascii?Q?0CVxACelSr/s885tad5qppFBg5QGfXabq0eeaCKGVga8OPCxUW8hcjAX+JYR?=
 =?us-ascii?Q?a5F++iaBLSuca8CrWKSOGdMhEsVe6VjQ4w=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WkbblHCJ0mRDjWhTsxLTgnhddT1qz4uEiQ9c6ogqvV6hTELYEufs5H9utiqu?=
 =?us-ascii?Q?Pg8ox3wquFmLQNtuv+ohdq6c53bme2aV/Enqll4Li9BrZm51x0kJvgWN7QJR?=
 =?us-ascii?Q?yUno34AOmr5c8T/CEPcDw8SqCyH1tbrcWMfCDHjBb8YpjAh8+VfrvD8n8ccv?=
 =?us-ascii?Q?VQq7Y0LxqQVpJmxgTfbLqa0Nkip/JECxtN2wmpNYg1B6zhUuzufdPyPLzLDx?=
 =?us-ascii?Q?VbWT9Lqkd9z24lE7AlgmN0iVMEu5+emHTscAsA3+C3+GZ2oXa4Q0J0WfAyTv?=
 =?us-ascii?Q?sKntKI64v2/NfaJVYHJ3KopxNakCRpW+PxZlyyyw5qTddLqdh3AvpCY+Im9n?=
 =?us-ascii?Q?BVWJj6cR4g74v+MTr6+kvR8wE5ocVEi4p5JKLCyezvKXmBOBvL190KVLKiWA?=
 =?us-ascii?Q?GBiYH3Tn4zsORQlrkEteo0pZXaep81cJWd4gNqsdPd7KrxyLVuJOYUlIScMh?=
 =?us-ascii?Q?dTe++Tt2apqJomhUc2DtZf2WeLE2ZU5Gqxs5HQtOKE6uySPcBdxu5u/zudOU?=
 =?us-ascii?Q?5JyIoW9IXx6Ttd3zyXT+noixunvwS2AThqnCjtCZdSDE1ylkbJxtWqNgQ7P8?=
 =?us-ascii?Q?PjMpMhg5LAXPC8imBmWXn+E448qyf51334YR49RuUavUyypoXPCu4eu4P4HG?=
 =?us-ascii?Q?wIFKs5lhxP1O2ysne6g0mL/qm36vqXkI5aJj5VRwR5VvSsQEIB4uFWU/l45g?=
 =?us-ascii?Q?/RpuvjUDYLJEcSXQZG06qPgptsHkyiq0lqleMLVfjfMJw7OINw6NQ5vq6ttW?=
 =?us-ascii?Q?ZWcOuD0bCKFEXLKuOi928Iqaw8geHO3xsxW9rfJTWTnLSSDyVnPM+NB4R73n?=
 =?us-ascii?Q?/X1pWDcmwzl/anQtJyYsNJ7WVrJzDGBKZsKhYWMv7pWegWTsvKCzY7txdiiZ?=
 =?us-ascii?Q?/ZXN5P+0sk3vK0hfXe+efjqfMZSaXI1wryhhDGFTMQR5LNCKLQR6cQodm6yR?=
 =?us-ascii?Q?LgGg10bV3NQ8EblJOAh07GgTQxhLcnYqgLM9N5Lj/+18zg2VIoCFtrisfRjS?=
 =?us-ascii?Q?MIUBE60Rj6712IkNQjVE6SMidhvA3dDEkENfPKXyppkeHeEzEoByLl/nAYjC?=
 =?us-ascii?Q?w4+SdHIGnuJLQctydSQlnYkftSmM1pcpVY5BlJ1VA6zyFP3IuD9er+WDtUeD?=
 =?us-ascii?Q?GBlhlDCTcMLE6qEk+Vv28XUpXXKGjSnyd8qcqfmdj80RdJARZfAIOFJ08Ou+?=
 =?us-ascii?Q?GIAyK08UTGuu/nzGV2FOtz8bBjFu3TM60HpgEWOY9W59wgD7NjRuJWflM2s7?=
 =?us-ascii?Q?3a687nOCAH8QHywRPi2fByDNM/iFvh3bIJA8faaFm8qjjRfF4Ryp5DvKhHnW?=
 =?us-ascii?Q?0fIZGIe6Zd304VOi+bGsPJKZl9mNr1iHNq2CDwh/6qY9lOg7xdYCKj1bbBNy?=
 =?us-ascii?Q?M2WHfo8O4BUAoZmJVjWaC7v2PxRZEXI3+OajeyUlO+yMerjmBw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd25582a-df74-4e0b-cea3-08deeb30e5b3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:13:58.0278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6807
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_091402_935748_26E2FAB2 
X-CRM114-Status: GOOD (  10.48  )
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

Describe the Cortex-M7 CPU, clocks, TIM5 clockevent, UART4, SDMMC1,
EXTI, system configuration controller and GPIO banks available on
STM32H7R7 devices. Expose the RCC reset controller for peripheral
consumers.

Signed-off-by: Liu Changjie <liucj1228@outlook.com>
---
 arch/arm/boot/dts/st/stm32h7r7.dtsi | 255 ++++++++++++++++++++++++++++
 1 file changed, 255 insertions(+)
 create mode 100644 arch/arm/boot/dts/st/stm32h7r7.dtsi

diff --git a/arch/arm/boot/dts/st/stm32h7r7.dtsi b/arch/arm/boot/dts/st/stm32h7r7.dtsi
new file mode 100644
index 000000000..ad25dddbe
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32h7r7.dtsi
@@ -0,0 +1,255 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+#include "../armv7-m.dtsi"
+#include <dt-bindings/clock/stm32h7rs-clks.h>
+#include <dt-bindings/mfd/stm32h7rs-rcc.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-m7";
+			device_type = "cpu";
+			reg = <0>;
+			clocks = <&rcc STM32H7RS_SYS_CK>;
+		};
+	};
+
+	clocks {
+		clk_hse: clock-hse {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+		};
+
+		clk_lse: clock-lse {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
+	};
+
+	soc {
+		timer5: timer@40000c00 {
+			compatible = "st,stm32-timer";
+			reg = <0x40000c00 0x400>;
+			interrupts = <54>;
+			clocks = <&rcc STM32H7RS_TIM5_CK>;
+		};
+
+		uart4: serial@40004c00 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40004c00 0x400>;
+			interrupts = <85>;
+			clocks = <&rcc STM32H7RS_UART4_CK>;
+			status = "disabled";
+		};
+
+		sdmmc1: mmc@52007000 {
+			compatible = "st,stm32-sdmmc2", "arm,pl18x",
+				     "arm,primecell";
+			arm,primecell-periphid = <0x00253180>;
+			reg = <0x52007000 0x1000>;
+			interrupts = <108>;
+			clocks = <&rcc STM32H7RS_SDMMC1_CK>;
+			clock-names = "apb_pclk";
+			resets = <&rcc STM32H7RS_AHB5_RESET(SDMMC1)>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			max-frequency = <120000000>;
+			status = "disabled";
+		};
+
+		exti: interrupt-controller@58000000 {
+			compatible = "st,stm32h7-exti";
+			reg = <0x58000000 0x400>;
+			interrupts = <16>, <17>, <18>, <19>,
+				     <20>, <21>, <22>, <23>,
+				     <24>, <25>, <26>, <27>,
+				     <28>, <29>, <30>, <31>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		syscfg: syscon@58000400 {
+			compatible = "st,stm32-syscfg", "syscon";
+			reg = <0x58000400 0x400>;
+		};
+
+		pinctrl: pinctrl@58020000 {
+			compatible = "st,stm32h7rs-pinctrl";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x58020000 0x4000>;
+			interrupt-parent = <&exti>;
+			st,syscfg = <&syscfg 0x130>;
+
+			gpioa: gpio@58020000 {
+				reg = <0x0 0x400>;
+				clocks = <&rcc STM32H7RS_GPIOA_CK>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 0 16>;
+				st,bank-name = "GPIOA";
+			};
+
+			gpiob: gpio@58020400 {
+				reg = <0x400 0x400>;
+				clocks = <&rcc STM32H7RS_GPIOB_CK>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 16 16>;
+				st,bank-name = "GPIOB";
+			};
+
+			gpioc: gpio@58020800 {
+				reg = <0x800 0x400>;
+				clocks = <&rcc STM32H7RS_GPIOC_CK>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 32 16>;
+				st,bank-name = "GPIOC";
+			};
+
+			gpiod: gpio@58020c00 {
+				reg = <0xc00 0x400>;
+				clocks = <&rcc STM32H7RS_GPIOD_CK>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 48 16>;
+				st,bank-name = "GPIOD";
+			};
+
+			gpioe: gpio@58021000 {
+				reg = <0x1000 0x400>;
+				clocks = <&rcc STM32H7RS_GPIOE_CK>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 64 16>;
+				st,bank-name = "GPIOE";
+			};
+
+			gpiof: gpio@58021400 {
+				reg = <0x1400 0x400>;
+				clocks = <&rcc STM32H7RS_GPIOF_CK>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 80 16>;
+				st,bank-name = "GPIOF";
+			};
+
+			gpiog: gpio@58021800 {
+				reg = <0x1800 0x400>;
+				clocks = <&rcc STM32H7RS_GPIOG_CK>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 96 16>;
+				st,bank-name = "GPIOG";
+			};
+
+			gpioh: gpio@58021c00 {
+				reg = <0x1c00 0x400>;
+				clocks = <&rcc STM32H7RS_GPIOH_CK>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 112 16>;
+				st,bank-name = "GPIOH";
+			};
+
+			gpiom: gpio@58023000 {
+				reg = <0x3000 0x400>;
+				clocks = <&rcc STM32H7RS_GPIOM_CK>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 192 16>;
+				st,bank-name = "GPIOM";
+			};
+
+			gpion: gpio@58023400 {
+				reg = <0x3400 0x400>;
+				clocks = <&rcc STM32H7RS_GPION_CK>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 208 16>;
+				st,bank-name = "GPION";
+			};
+
+			gpioo: gpio@58023800 {
+				reg = <0x3800 0x400>;
+				clocks = <&rcc STM32H7RS_GPIOO_CK>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 224 16>;
+				st,bank-name = "GPIOO";
+			};
+
+			gpiop: gpio@58023c00 {
+				reg = <0x3c00 0x400>;
+				clocks = <&rcc STM32H7RS_GPIOP_CK>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				ngpios = <16>;
+				gpio-ranges = <&pinctrl 0 240 16>;
+				st,bank-name = "GPIOP";
+			};
+		};
+
+		rcc: reset-clock-controller@58024400 {
+			compatible = "st,stm32h7rs-rcc", "st,stm32-rcc";
+			reg = <0x58024400 0x400>;
+			clocks = <&clk_hse>, <&clk_lse>;
+			clock-names = "hse", "lse";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+	};
+};
+
+&nvic {
+	arm,num-irq-priority-bits = <4>;
+};
+
+&systick {
+	clock-frequency = <250000000>;
+	status = "okay";
+};
-- 
2.55.0


