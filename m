Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AA9C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 10:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Message-ID:Cc:To:Subject:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIuHLfdKjaU+/Rxh1XpOfQt6nkrGF0wZ9RSUm7KHroE=; b=ikZv27Qrnf4vx34G09z9QA+P8n
	esJFwEhsOo/ErL7zaARymAZyCSOyaVzQ4KO5AM0MzjAF4sKG9kmUIYeiMu0kXKp52Z865eXPVeVY6
	xyO3FnTZ+vgcFnvQIeJvTNw8VxyHh4Gr9ECOikpM905/82rxwVkY/RtqPQusAa+UG+fvtsEs0DLas
	48up7ZRqUrBpbiHjsQLAG+uBm2+q8jijqm9JD6vDEfutakoB9fjgi0VCPn8xDipoqSB9pSmL8OL5i
	hFl63CbbfE5NZ5nPy5qdfYCBSSfq36zkhLPR8Z9/4uz7BhDqZCugeGCw286iWBn+CWWfISIAAQpSt
	rhCpATQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0Tz-0000000ABl2-2S2H;
	Sun, 09 Aug 2026 10:10:19 +0000
Received: from mail-centralusazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d107::] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0Tu-0000000ABhO-3LYA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 10:10:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrYG9ItpbvQg5JdQ6bSAgGAQKrOrF2Qvdntvx2L8xEcsX5snOgVWnq169y+YsrJM5ub2YyZB0tOXOxaOlV5BzDQ7Gr2isLx3XVFH2jlgRgx05Y4vjQkF4uTRtrx7KgGIzaVe8zfpwiFX9YI/s7OvMGl2/5nMnqxfSOEi+7eAWytOntBrw7ggMFfr0bzvdTUbQzUY0zCQNzlZwiQeo/yu3BV0+srObXZd4m9MSGq/esCEycuMaHuCyqS3tWgkWv6ASFzrMSeNwiP9Cga9XBk2qWZ4tJ/2GLW57EN+tSBToWuAF10tAhXfbb/gaQWSv2R5Qz2+ic7lA53ikJuc+lBIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIuHLfdKjaU+/Rxh1XpOfQt6nkrGF0wZ9RSUm7KHroE=;
 b=IpF5oiQXtvC2Idwb5vIZGtBStwKYyVqaa59MH456WOmqWuSNLkdk9HZ7ryICD21tkmWmS3O2t0ORPkKqf+wQEmQ5oRLcwv/ZhsFNgD9EbBmeCtBBu9T8oYeepCX3B6wh3z6+lFpkRJ91h7ayyg5fjI9cX/QGkj/ih+4ehAXLDCZUd3PEgGEdN+79Bv2p9Zm4SZvKJwPAc7Fen34wgz5sp37kxZmqTOat474dC8RSos/2zRhOc9bRCIE03n2YUGik0bf5Azi4JAmD+0esUN8Ub7LtABKce39TT3uDjT++Vrhnnm88Pd+FvcotwKl7uX8swE46I5CAJM1UbsbaJQlIKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIuHLfdKjaU+/Rxh1XpOfQt6nkrGF0wZ9RSUm7KHroE=;
 b=UOF3XVQT9sgCBM0Z3FgCkHI+V7KGECHfBrG/u8qOl90spqg72FPDxTFtYAWmnA8KQlOEF5ZHiu4t/L6xWGxAeYZuIRcV8JyUKipXSYa4fzTuonMliLiLTggxpkel+NdI/KqFfNlLqL5l8nLzuHuHpOXakQIGrSw4gLu0J7oNaroTmP8hO75C5bdFfAR89p9m8dYAf8I7cIX/Q4m2/H8DoBgRIcBW0C+gp4JUrE70/mRDSaiOpSmUmztZ6GBDl+H2otP5a87e92w+hNxQ0B9794ec5Yx3hIhIXa25LBGrGjteqDG+nR48Xr/IbSMMS6a8De7jRj9eZVR7O90Li4XMxg==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by CY8PR19MB7667.namprd19.prod.outlook.com (2603:10b6:930:77::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 10:10:10 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 10:10:10 +0000
From: Liu Changjie <liucj1228@outlook.com>
Date: Thu, 23 Jul 2026 23:49:25 +0800
Subject: [PATCH v2 7/9] ARM: dts: stm32: add STM32H7R7 SoC
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <MN0PR19MB609186554E95708F63CBB16DACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0054.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::6)
 To MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <178627023611.53236.17002928193028496550@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|CY8PR19MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: c9890220-a983-4f2e-79df-08def5fe64fb
X-Microsoft-Antispam: BCL:0;ARA:14566002|25010399006|5072599009|15080799012|37011999003|23021999003|12121999013|16051099003|8060799015|19110799012|24021099003|41001999006|51005399006|440099028|3412199025|26104999009|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/vR1w3g3U0O/k5JAD1OW1aElNbRL8WXB5qkoO04iMzM5cJXzUbTeclFJv5/N?=
 =?us-ascii?Q?bFav3bp99FW3EN9bO4mCzO+GxkRYaoUbiMoe/isaUTiIxuYF/EcaTflyGTi8?=
 =?us-ascii?Q?Mmi+sg1dGl6fL/vdsxfgqSi0Sp0CK+usoQu7S2Lsh+5fW8fW73r0N7e4Btjg?=
 =?us-ascii?Q?DqLRiNY63TnHJ5euGAlWKRie6eWj+eseUZsPOAjfeXaZ5KDnEgpfd0jH/CTm?=
 =?us-ascii?Q?aopONQ3R7ln7fXpzRhO0htFZwBYlIiID244tCi+gnOnhyDZD1vzahmlXUkwX?=
 =?us-ascii?Q?LXfhl7lnMqztzeYtpR5ikFGUK3uTa7MeaY5Rmv+AT//wgQzOuss+C0tdBQay?=
 =?us-ascii?Q?9LiIXIaphCpZhbVfixv5DP4lY1bKPidfVrQlY5vP+d7FjoG2MYOTJtDFCi0s?=
 =?us-ascii?Q?7mOzmS0O3oA4w4jeB2eDgSEYXzre4TIubp7IN6q3e9Pmaw9KSAk5jgKhvckh?=
 =?us-ascii?Q?lPNerQ2UZjo3jR+LGIEls6wWQ/kVuUPqgTuwc0K7KFhbDIfd4U9cfTAWuto6?=
 =?us-ascii?Q?+n4vbdXH0WyarMcY9FLoNqheNKO4XK93yRSDoD9aVvOk7aYJ8JQYAR4DhYVr?=
 =?us-ascii?Q?TK8DTijw7VuBUS4aF+PAkyIVNPA2QW7azF0sgTukV8zqirZBxFeDwQQBU0ST?=
 =?us-ascii?Q?nLTDxymT7XPp2yUTlmyjV+q6y2h7tVzZONzQIywk8thUQLMqrtcRX37fRLjd?=
 =?us-ascii?Q?jeLBZI3bbYQmHCOwByvyRTbHfiKhzNyiX52woj5ewfU/03BAZjnVZtivMvrP?=
 =?us-ascii?Q?NQSmUvXce/qZJYCbowGhVVYvbtmgaaU7v/gkh8Ha8+BgWrHOmKyCiOnGe9k1?=
 =?us-ascii?Q?hm+7WKf/mC9WUClPiHS7OEm2Q5zr/xgKqTpOb1474JGMkQWUfZiBlakKMgsw?=
 =?us-ascii?Q?7AynuxkKj5Y8KwG0QiSWQlfiAbOWPwLThyrH7plNhZSnFPBxg4BtS9m3DcQM?=
 =?us-ascii?Q?YvV2e1UszqlhLJOGKWpKHpfcvt1pYUEdsLF4rw5rY7s80zgNTeWRTwxXMcyC?=
 =?us-ascii?Q?Db8Ock+AyMU1m3Qam6injJeuf+KlZWJhAP1EOc8MnaTqKjZXIqjX0Jt/w1IL?=
 =?us-ascii?Q?b1sSX11J?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AxxemiI8g7o2PsHDFNHWaOBI3AoMBWt/+Cui+la9bKjryJO2EQUKpPK5+KnK?=
 =?us-ascii?Q?HaFYkn3uEgKx8ejyDD0AfLFzvVV0g2yIKQ0NkzMcniCkC9vHz7s1dpriGtj8?=
 =?us-ascii?Q?r/BTUYWanRsw1Yqxd7S5F/CAzEHGksbmd1k2xiVZc+nLqOj7ZgQ1tCTGTfVF?=
 =?us-ascii?Q?L2rCaAp4VHfTm3vesYqldmxBMz0+7N3HmKSwcATHnNw/E2eIqRXSpopiNu0s?=
 =?us-ascii?Q?jxFe0/zIYxEi65f/abkod/9Aoim86SV90yYJYCxzuKE+lt/p92OQC6zTMdAu?=
 =?us-ascii?Q?bQIig4hgEeTbK6VhpOqfVHtFpzjPgm8EkTJp28TD/LHnfNtjhie/G5jLgoCS?=
 =?us-ascii?Q?YS1naTuJ46sXIrzTuRLL6UShqglY1kcxvv1kO9fPNqNdvtW28VisUAWoqUfh?=
 =?us-ascii?Q?IUd54ERGTU2EOLuCfZZyvvysAu7vXPvA6mETAwqk7ZR0mAeOURJha8vctxA2?=
 =?us-ascii?Q?4XH7vt0W7R5ayjMKgD7tSjeP/l2SvhYf264WvAkB3AKsoGddp7jg5/6S+L5x?=
 =?us-ascii?Q?hMLHtoo+QWOvFzMyy35FiSubCdWebxcI2oU7zrfLAB7WDINH8Ihatvluni4N?=
 =?us-ascii?Q?BEU2ebGYVTfOrrRRz6bnl0XrZ/xadcjfrC8/joNkj0Uvf9UrzfYWFQHahu6p?=
 =?us-ascii?Q?VSoT0cf2wOwoaWLO9Zzo6+VxgmjIZQuU/jQ7U9mu2/Hk8NtMe+E6ZBIVvKT9?=
 =?us-ascii?Q?ZMfgSko20d3eiLW3XP2uStjDt6f7P8H8TpOuZNZxebMmpiUA7/CiruVTMHRb?=
 =?us-ascii?Q?mPoCvMPiZaTQm51zrgf68n6MQLERn0a/fXdb5uOhOx9i1Ouyf8fct29bsz/T?=
 =?us-ascii?Q?eEtavhFivghxPZwd1Lz7AXIkD3muDKeQ2+CrV3xaNm84KcJZFdlYOnH70+aA?=
 =?us-ascii?Q?gCSKqlzJL80gghj7nRT9cLYUz4Kh9RyXNd12tkQWOeIkai3U70RkMdoqxMOz?=
 =?us-ascii?Q?TPENgTOytoZaOs0z1oJF1zlvJjTS8KcQ9DakSRyQXcu5nIASP+wt4FKglEzU?=
 =?us-ascii?Q?wKefKE7dsFHnrT9VT6OqSngjO5dEATCWPmYM2ZRO8IZnlfay9zRG3WFZN78z?=
 =?us-ascii?Q?bfA3Cn6pgZrlKPhHlBWujVE5Jc8VpHawbGdJfHbp/GKGRvc6eSEgsxRgp39e?=
 =?us-ascii?Q?qGTu09TsnL4l73vAoKcxsMKKeM869t5cZmZz7azPmlDI+yVDZgimYKfcMjva?=
 =?us-ascii?Q?fkbbhHgTVqGLeDndoIf4+d6BgLScKCxvOX3d7pgVYpR5TOnJszl85S2IHZEv?=
 =?us-ascii?Q?dT78/zFQY4euFjwh7epHs+7S/ofx6GD7yw+vskkh54amwtTw9SbSMsadQnjS?=
 =?us-ascii?Q?vQEYwQD4fwOdq6gkuKxWjOkll3JDukIsTqpJ2z84cKFLUuciF0VhR8NBC2oG?=
 =?us-ascii?Q?kKh13INrw7OKqKrBhASW5hiiCLTUEr9RT4rPHPzrRuJI+GV2QA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9890220-a983-4f2e-79df-08def5fe64fb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 10:10:09.9670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_031014_921970_C5640A6B 
X-CRM114-Status: GOOD (  13.30  )
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
Changes in v2:
- Clock TIM5 from a DT fixed-clock instead of the RCC provider, since the
  timer is initialized via TIMER_OF_DECLARE() before the RCC platform driver;
  the rate is guaranteed by the first-stage firmware.
- Use a single "st,stm32h7rs-rcc" compatible for the RCC node.
- Switch the GPIO bank unit-addresses to the pinctrl "ranges" offsets
  (gpio@0, gpio@400 ... gpio@3c00) to fix the dtc unit-address/reg
  warnings reported by the kernel test robot.

 arch/arm/boot/dts/st/stm32h7r7.dtsi | 261 ++++++++++++++++++++++++++++
 1 file changed, 261 insertions(+)
 create mode 100644 arch/arm/boot/dts/st/stm32h7r7.dtsi

diff --git a/arch/arm/boot/dts/st/stm32h7r7.dtsi b/arch/arm/boot/dts/st/stm32h7r7.dtsi
new file mode 100644
index 000000000..4e29dc2dd
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32h7r7.dtsi
@@ -0,0 +1,261 @@
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
+
+		clk_tim5: clock-tim5 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <250000000>;
+		};
+	};
+
+	soc {
+		timer5: timer@40000c00 {
+			compatible = "st,stm32-timer";
+			reg = <0x40000c00 0x400>;
+			interrupts = <54>;
+			clocks = <&clk_tim5>;
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
+			gpioa: gpio@0 {
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
+			gpiob: gpio@400 {
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
+			gpioc: gpio@800 {
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
+			gpiod: gpio@c00 {
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
+			gpioe: gpio@1000 {
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
+			gpiof: gpio@1400 {
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
+			gpiog: gpio@1800 {
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
+			gpioh: gpio@1c00 {
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
+			gpiom: gpio@3000 {
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
+			gpion: gpio@3400 {
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
+			gpioo: gpio@3800 {
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
+			gpiop: gpio@3c00 {
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
+			compatible = "st,stm32h7rs-rcc";
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


