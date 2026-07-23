Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA1BC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 16:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Subject:Date:Cc:To:From:References:In-Reply-To:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTsZb1GzyBP0jCz1dGeupkgqOl3OqzM7naobyzqXX6k=; b=L4mLU19pIHmBLA4tYiitg3lcf/
	AVTqLEIlWm3an5HwiFgUQ03SsyhSvLlzdqD6Y21VC/sEqAvg1gSTZZXmUU5gcTpOskmoqFMmNiPoO
	Zp87EzDE9t4BnaUhlBDdShZEOFBXJSOHEn+5103hPtVdq/Jg/dL5osLo+36YY87+PaZ9eGjP2+2Yb
	M/cZ7jKS4MRLGwlkvb+GkgetWOpwoxn7TSoq3fBXuKLwMuHYmvm8VOsk7hvcwoKSmXOludmTtUKxh
	Es8kGWQUnUbwr6cds66lON1uRexIq2NXHWd09O/8/w9vSVQkpGK1T2B2eeGKCt4N3ue8GKXdETcUh
	4HyojEow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1Qg-00000001LDZ-10Aa;
	Sun, 26 Jul 2026 16:10:18 +0000
Received: from mail-eastus2azolkn19010007.outbound.protection.outlook.com ([52.103.12.7] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1QF-00000001Kwr-3v9X
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 16:09:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKIj61WIiX+6tU44dBjgPRnnA7DxVy1nT+N2Flj++OgPzs2Lnbgkwwmd3at9OCgTzJt8fym79UZb5l/baWwLGZaBUqCN3QGZ3aQnM+ZVBIHzR5Y9fr0gqCEBT0koTtIYFhxlHFoxo0vwPhQUJqvquVOB+cBizR0SDgqppVgFmD93aFXjbQE0kcO66QBwGM/+g1RGgfUBw3DDs1CPAMcB2vqrQst5kaDsCWFzysiuJ/+NhgCAxWTa9OzJnmXpnw/qrZaUlq4bM4OOTfXBjezSa8Le9A/TizjPlWF5uS59pnLleakE5IYGFVM3eb+mTTixbsXSFxFbOBJCEMxI7iGClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTsZb1GzyBP0jCz1dGeupkgqOl3OqzM7naobyzqXX6k=;
 b=FXfLaun/MjvfH1tbQD87H2tWYGGkeWxAkzmaqNOI543drR5fgJaxfQ/VHYWag9p2I742ATMJxRlRJ+XnMAxIboE/UPhGxE/98ikS8ttIDjqD33MO8bGMroIbDvZE5DWjhKj1glaEJAgt3yrfb8u9ZA0ABD1neoxaw/91IWUY7ax4dcamCHzg9t4TR+SjU7OXtszZehAWfwS9WI+9PlIobfbzM9TBkcSDbVf+l3y+cmL7I1bmGNgDLl7/zNVkWkqSrZgV/zRBrqQ2F9+k86y+bC0o+tsl9U7cZHiGZj3t0Xk0fq+/4GgYFY1+r19i44a6AerAlBcX0tz7iV0PKh3pPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTsZb1GzyBP0jCz1dGeupkgqOl3OqzM7naobyzqXX6k=;
 b=Uu2bS/cVu4LEU1f7gJzFxIK9iXuz54BGnmqWorJP1VRLLF9iH6oaF4dQYzE14MmtzUOw3JQxhNB8/opI/Nb8nKtxZhUVxYRkr5PMjSHRfRaOYQwY5mpwA0sKNDCp+Zvp4ZOTHMXhyq1oU/U75O4o1kpRxb3xfFCbrzbNuaEyiIis+hG28UhQX4Rf82i9N+GqMTAolFZaRcY27wcV42S8MJKbQPkt3DaXiRuu88UBb34cxCx/x35d7QZ8FrTGGK7I+38NK7Lkzy49q0aNu0rHGPNdC/LmFNoP0ggulqLlOSH+8KvcwIxo1PmGJydx2hS+WG9/6W8lv+Jj1ppayJ/pTQ==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by SN7PR19MB4765.namprd19.prod.outlook.com (2603:10b6:806:100::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sun, 26 Jul
 2026 16:09:48 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:09:48 +0000
Message-ID: <MN0PR19MB6091A851B810B5876AEB5123ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <cover.1785080950.git.liucj1228@outlook.com>
References: <cover.1785080950.git.liucj1228@outlook.com>
From: Liu Changjie <liucj1228@outlook.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 23 Jul 2026 23:49:25 +0800
Subject: [PATCH 7/9] ARM: dts: stm32: add STM32H7R7 SoC
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0008.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::9)
 To MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <90bcaeab8febbbe784b0deca61d979761a241c6a.1785080950.git.liucj1228@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|SN7PR19MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c890f52-7678-46bf-7fca-08deeb30511f
X-Microsoft-Antispam: BCL:0;ARA:14566002|16051099003|51005399006|24021099003|15080799012|23021999003|5072599009|25010399006|41001999006|37011999003|19110799012|8060799015|12121999013|3412199025|440099028|26104999009|40105399003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kukeSlPDh8leVjbtA7BNAXCYP+9qjFukE6Nalxe/Cq6/wAWY4SDhi9Uxa9BS?=
 =?us-ascii?Q?jXXt/JI6BH8vndEJdNfYkeTYpdvIs08ZFtGMKwenA/TfzaVlgB1+Y0DjxHo+?=
 =?us-ascii?Q?PU4tB0OND8AU2YepvhbD5Ld8YeuxQpTxvvWFJ+6TtZ+t3E8cQYTJqjOL0DUy?=
 =?us-ascii?Q?eHlbwYMiJst4/WfTIJkvNBZMJ8AtJAGccuMDBB80BolU2NfsayB1onYmVIga?=
 =?us-ascii?Q?DCbxG8JhDWVIp1YKyLWQFPZ0yCFlExJLqrXRwxUWuGSRdb+P7fPPMlqCZbkf?=
 =?us-ascii?Q?3KClkltnE3r1VwDni9+bK3X4IR1wPudqiWrOCfeca7lzwdq3SCFq26tFHMYk?=
 =?us-ascii?Q?rOuqY0HjBzQYD2qBgWeJnv8d1Xsj4LT8KeweVyJZs5qr8gHC9axCRwp+hxsd?=
 =?us-ascii?Q?jJDO/Xk4Q1a1f8nORl7LsTTBcc9YUzjF0MFj/HoN2070H5/d2afzyvlO87VA?=
 =?us-ascii?Q?2fxVQYTvrUJpKbmj2p87CdqoxfjAfJvFq+DcCMex2v6PzrZ+clz3q3Zb6jX9?=
 =?us-ascii?Q?BPBEAmeQUPM5vnhqq+2LWJIWGwCT4msH0Atkyu7PVdB4fhTTj1fLf1Nk6wUX?=
 =?us-ascii?Q?v7nEJtzRzvwOXufJNxJLS+FpKxB1IyPanf00AmdAwwBFpgUiDtNQ25YucAqm?=
 =?us-ascii?Q?eXvLZAC2sY4au6KK5qbroYOG1FdCRK62uC87DFJUyDZnuhYjciAs33wRUNL0?=
 =?us-ascii?Q?Y36iJcsC7FPkAKYcUVW5smla/SNhGDgk5RAJycMyPEWZxLA9WS6D7BLM9TkU?=
 =?us-ascii?Q?8kPVN+sk8ncPEDEZPh5WfQPkhXFhAAZZlybpl4sxyTbLlO1vNUN8INSO27qC?=
 =?us-ascii?Q?pkq1Xl0sU/ExssDfVxBnQYszLdVFbfxP3s52IrVkDmQX+VZfxuqF2/gbIOeI?=
 =?us-ascii?Q?d/hYwhhg/fwP4sipPkUJGGIWukvwhBuAzuiV1G6FqC3rEoRX4dT45FCFTi6A?=
 =?us-ascii?Q?V9jL5Lfirh85PbPbjEd5rn5WkALqXJft6GSpLZjSOkIGjIQAjitQNjFJlvJ/?=
 =?us-ascii?Q?lb6KDviGz239gaHVWYmZthPl9wuq5P10JPV79RTcjra+9yHctOoi3wE8FNzF?=
 =?us-ascii?Q?+0BBNsgo?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MzjJGQZoShi7gZDMk7Hv+112fP9a64H7z9z2Um4c5DD5V8eD27+53slEnoNb?=
 =?us-ascii?Q?C4rXzuO9zPPA/IbqIxjFB22uN+u/TeNgMZUz9JSye6f8NZjohMRGxA7SM4XG?=
 =?us-ascii?Q?E/NFpWEdCUFJMW679GTsmUPyk9h99PdT0Ll27sk/sgpkWDN9t1i+/7Eqnmj7?=
 =?us-ascii?Q?+ym29vn9ZsP3xmr1hsQ896MAFd5UaYbc3wqpesJLoOFrv+fWK/oTRdW31nFP?=
 =?us-ascii?Q?E8X7zFR3kouXsMtLbaVhYoAnTff0Q+627zfyTgsLYKjA16XD2HhGSJrqQ0Ca?=
 =?us-ascii?Q?GIMrP4bGwzY43IdOfP/CdswoR2odeRB/aIV0s0l1Hu7tQG3Ni1AR4tdIgyn6?=
 =?us-ascii?Q?HfQ7PlPG1UNfdsqSb5Qp+BKOlaD3jdabNy5idM3618mAhp7aBreEhYTFpKoo?=
 =?us-ascii?Q?DnBPPf3UkomFLWmud4Fr6DFraGRZFln1155XH+V3m/ZAA/DbdVeqYEFr1SFw?=
 =?us-ascii?Q?HQQq0+RAXZeVjp8eCbKhlI0ZXM3wXWuY1XhoqqFeHKgZN5X8iTgFSQh+55hg?=
 =?us-ascii?Q?wQRGBasrlMdxWDMtyUCJcxK5u5BM+J3vI0xQpYUCgJiyHA/RcxiMrmHYXFDV?=
 =?us-ascii?Q?NLxeHcQAQumhgDvGscfi3n7Tz3RBTm7yHWqE5Ly2WQCje86N/++xqKjL1Xm+?=
 =?us-ascii?Q?b9CYuVSBWl3Niu1/W+Vn4MD3eG14VANf5aHS9+3skhKTQJNyUa871arygciK?=
 =?us-ascii?Q?G5RI6DpfjIUqCVl0L4eC9PVoW24/9+CVMj2SZamjxFewnoSOzLTG44QN9zrm?=
 =?us-ascii?Q?Yur+XXKa4szx5SHl3bKd+RP6JkvEQ+pwuwiUSsQnH+8fwrtQeF77hZmBswMz?=
 =?us-ascii?Q?jKkNsQGryfsQQhBqcxFB6kp8Y4nFHIafKi3Q+YHr9RRCZc0X9IiaUGN/v12W?=
 =?us-ascii?Q?9tLMsI42Jx+3Yn33zJtvbsO3NcIsZJFfHl/YBdQ0Es3+WyRefZl3Vkh+ueDs?=
 =?us-ascii?Q?uVfZjwsPVyqGsmMFg8uyZUVlgoJ2+MokWdeNVhDU6bZ9zIOlSdZLMRaeajgz?=
 =?us-ascii?Q?p/ONLSFx0qdu1W+x6VcrPs5cY0oFYKDMdky291QTY3lsMYzmpzXyeEj2Fij+?=
 =?us-ascii?Q?hdJYnNU1BOfRKFZoG3Kab9pEHSIE1HwT3KRIdn1CLQq8arw0E3qYLMw5bZWn?=
 =?us-ascii?Q?2bm2BtctP2bUmTBId/IJ8k9vdhVqHnctW8CgFWPUYnn4bsO0SWvu07yE/Zb5?=
 =?us-ascii?Q?pNVOiobCZp/rLkZFfWCggnMl7nQR3sZn0eIMN9GDpAQtDYff3UP0M2NaOv0P?=
 =?us-ascii?Q?xovVuoIY5b3xh7Fjfr73N2vhZoyMJChVmC3e7xUw2Nw0U0G2znaT+T/x33Bh?=
 =?us-ascii?Q?KW3LStjDbbmO9VH4o7ao8+HoEeoFlceYo1sTAR9/ePyw4ArjbxqD9x0giFQG?=
 =?us-ascii?Q?qijZHG9ahRx6hkbTDBNi630Na1aAkYozNESzg+DP2liKYAUuyQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c890f52-7678-46bf-7fca-08deeb30511f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:09:48.7345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB4765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_090951_986793_1E4435D4 
X-CRM114-Status: GOOD (  10.68  )
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


