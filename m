Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D20FC5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 10:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Message-ID:Cc:To:Subject:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dn1DrDlY8sN+bG0x1khtNK2GqqQbooiHUQ4pQxljNns=; b=Z/0b0QoAkje4Hz/0kH/eAkbZ6V
	2sSsDWgv9kN6IuGjIQ8m4kIXkkrXQc6hsuBY6YbW299khHumbJ1zgxhQWnazvSLXlCqzVdldTjK1+
	MEvN253Uv8F86MJzLDew+Y5majlWoygcSOpIETR5qTt1aXBZUCeQ1Y892ubd2HcIHm/PXjSsvwTCr
	IM9/shLNz7BeyND0QAb112fvP8h/HqUwPNhhIByfaQ9YoPWhWkTYoU7F0UF063hmcuL1N4/7cd9Mb
	Q2Po07cdfco8j5MW5BzsHkPYBQR/AYkgfDnkxaPegOIGlLr+bBIyf7fV/rPBBcXW73+RsiOlZP31i
	v3nlje4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0Tn-0000000ABbB-112U;
	Sun, 09 Aug 2026 10:10:07 +0000
Received: from mail-eastus2azolkn19011033.outbound.protection.outlook.com ([52.103.12.33] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0Tk-0000000ABXM-07y8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 10:10:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxpyi4Qe8GUnV6c7cvQXttr2SwfnQTD9B9+zbzDVgFWtT6LcwAiC6a5pKu0meS1LKknYaq0Ayuxk5v2Dvs7eTKyPw7LOrC60Dp2Ld8Q3W+OByTYIXZ/fnHlASKXLUDpha3A9RtjLpR6WUHO5Pkca/ADX1WmvXwhv+a+QwJ700EWlnMtGqasV12k7XwbaiGUG/nMzrROdp+Vs14W3lv2WUbP7pdmh9h8k/3MQX1siNZ9o/HZ98KuLGTqfPYIxPhLrIURBy/VH07Xsj6QOB4dcrN3TsFsEtU5dvXSlLZ40/xXRnLz+ml1kZHxgSaxLvE/LZhJteWncktmZUHSaXl0Opg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dn1DrDlY8sN+bG0x1khtNK2GqqQbooiHUQ4pQxljNns=;
 b=u3cPK8xzThZ7WTGUd9Qdz5MXOJ35qJt1fxDpzUGilX6zNfX8PdatbFS3JS0+eAOoRqEiN82cfHqq8RW3PvYiCRYhxbp+1Ye8v3/JgazOW+lSQaayYOyArtaWK3fiVuENrdxK8Sn3u5y5zvY9LTQjk4xLTBSwIvDfu/uL6qN7g3vrFdVlQsnnXYhuYgk5QBwZmOJOcqv2lShgCxWgiMzlM1nh+zTmm2emh2hn6TFGT4np3Lwu4+5NI7RL6cwzGbrSBFZlTfv/ntIlDxBp2P7xNoAgh9bBew729iHlWPOokpLqAOY3gw6mGmH4+sIdizBvtZ20vzRaK37ACGleQKET+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dn1DrDlY8sN+bG0x1khtNK2GqqQbooiHUQ4pQxljNns=;
 b=hm5KcIESe89LdlsvrN6S6XZaSAVDq5eCYOAPVm4TvKI159HO5yzZghdCWyZdRB1p+BbqIpwIWnQtzQTycNLh+wklfi1B4AaCQjaKPzxoyjXS3BafvXFiE02ZKu5hcucRq8AGar4CoRJzf3HvY5h07h7Gj6wi9XSQdMJrG8p8yNheEoL1Ts/otKe1WXlHS/yc3ZQ0+jWR4ohgZA+s47QvrCc61eIyGjcReB27vDI4yfkpeYg6LyNQEyZ1urIcxmtVz+jxdjD9xKosqL9nWXzFuAdBBv9oWQ1klCoxRiktBFDZsWgtf6lEuFvGV/cQA2NsvXUbJr6r0aa1HvaTbIG5Eg==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by CY8PR19MB7667.namprd19.prod.outlook.com (2603:10b6:930:77::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 10:10:00 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 10:10:00 +0000
From: Liu Changjie <liucj1228@outlook.com>
Date: Thu, 23 Jul 2026 23:49:19 +0800
Subject: [PATCH v2 6/9] ARM: stm32: add STM32H7R7 platform support
To: Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Message-ID: <PH7PR19MB608840B7B6EDA17F053C5060ACDF2@PH7PR19MB6088.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0040.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::12) To PH7PR19MB6088.namprd19.prod.outlook.com
 (2603:10b6:510:1df::20)
X-Microsoft-Original-Message-ID: <178627022624.53236.4033333872861405138@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|CY8PR19MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: b50d4575-4c69-4a9e-b706-08def5fe5e2b
X-Microsoft-Antispam: BCL:0;ARA:14566002|25010399006|5072599009|15080799012|23021999003|16051099003|8060799015|19110799012|24021099003|41001999006|51005399006|440099028|3412199025|26104999009|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6uIIhMFzbOmwYAilmCjm7jdoY7PyU2c2uOEhCjD2PtN0gG21t/E9weNvhHfy?=
 =?us-ascii?Q?ZB52oiwW2r7GvLwCh+0KE0XYqCD3793X8Q1MRdY9hCPPkKUuf/PjBvTihInn?=
 =?us-ascii?Q?ad+j60n0YWD47e5o7GYhbJRc1eDW5vROaCedP7k1LfUE4OTXg8gbJ7Y9YJCW?=
 =?us-ascii?Q?y/k2RNB0CCUMqSfwnVn2zPB/9/a5vDoiex+nbLwx6YWltXNHmAYjcpu/DHR+?=
 =?us-ascii?Q?ADniNM0FSSP3X80SGBzhH4WGVYYi6EK5hnBS0tkdM9rrG6bBDgiEOkYs4W0w?=
 =?us-ascii?Q?EQ4l5Hk57gpZrAEpascNfoWB+WLQHIjVb8LfZjvaxVs8KGaCyYkDHhtf7zYN?=
 =?us-ascii?Q?sVxpobkFCs9Y4zSYWJ//AjBahkk7KjPxqGsPFDxuTgQm7FqdWSQXvlAkxj2q?=
 =?us-ascii?Q?Ttvb3YhxuxLiDsBZLPiZCNWd00oW27/g64Hoatvgh2fZEQli2Dy48AwoKXKZ?=
 =?us-ascii?Q?6og5ji74k3PDhXBhYX1sM+Nxo8OtwX4EktcTeKp8/Lz3gctCZiyJOfKLKsKA?=
 =?us-ascii?Q?s3F3y6BqE+cF3BNqrErsv7orrv3RDM4eJnNxoTqbIaoPkF69AXoAsdTi7Itf?=
 =?us-ascii?Q?WeApihP/1ZP7txghRYRELP90cf1PClcmtnNddqcSJ6L74yjhrpHAP6dtJt7O?=
 =?us-ascii?Q?SMEe27BAfswA9geJIgY06YVV/9hukNkqMPXUyHTuELEANKnnmkONY7QyWe8Y?=
 =?us-ascii?Q?VrbwaRiNXIwiPITfi0ygWcRoWB/n8RiZT8acdxUgnfthx0W1iGHxdeHs8Hrw?=
 =?us-ascii?Q?BCkbUIJ5tiMDsTH7P8M3xh3/J+VjZ7+L5IwoMQ5Dsa7IpD0uNT3cVI/PvoTB?=
 =?us-ascii?Q?bKa7X5tAeRtu92Hw4TO0x2ezSG01Mj/peGna8bpe6vvvDri9hlQ0SW3i/bSz?=
 =?us-ascii?Q?73BVCfWcx6TuL8RpFggLFVRRR0sx5ydeyV7UxSEK8HmnfB1/8iYneGgLfc/N?=
 =?us-ascii?Q?iNC1uTn9pGQr0e0QIOCAEsF7XahKaQu+0WcFSEPVR+9KEyFewYqAWExWAqlO?=
 =?us-ascii?Q?4+Mz?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n2XPzR1y0T4Av/lwus90DA/Xgf1ZfU6ax01U3QJja/ohiwJsoZPzB1KwzqOX?=
 =?us-ascii?Q?UtAeDZMs7Od8xd8jZDZ7GbGMWrphPH8p6hYtNiaRVY2iadeO3r0RRUsHNLTg?=
 =?us-ascii?Q?IQxhhTIFTrGGf7PHFMdxbqv3b8NW9vCEmYJaH0JwgsDFFgk8mWf3uwUUYnS7?=
 =?us-ascii?Q?nX7qnbdJN2C6Cxdg0zcyVP7oyQcyavEUX2uDuAi+5WuW7gDYlhMZSVDJC6VA?=
 =?us-ascii?Q?rujgNasUqNSWiU+3Dr9uEIv5nZNFZ+bvwTDNV4iEWRDgjVDSGBbu+dXGjB2N?=
 =?us-ascii?Q?Z932eVBJH06VZcNsFoEE4W4dEvr8Is1ic7lru4LeqchabBdqVRR1wFJ8Q8I/?=
 =?us-ascii?Q?S3oqJVspiz1F0RRqsYGl3Cg28UiGrDvTwOvOFZ2aVZNGZEesr0I3KGxzxVCk?=
 =?us-ascii?Q?fnm1sXzbF8wmJB1BgDofgyC4YIwsBXw7MygnkwpEwweama57Q4JsX0jYRhEK?=
 =?us-ascii?Q?ITXtiF/esl5q8TkKGggMemH68xLESJG2rCI1lh7IbuYt0jFMn2UrlHkTscid?=
 =?us-ascii?Q?4GhVzuweX7nXl4DIE8vVwdZk3dsr41hKsICYTMzOmfCwmXeAR5b9JIcQVLzL?=
 =?us-ascii?Q?OyIF1rgptlb1WrJD6LftdBuyExKdWQ5LoVXfkkvXxu8hjye24oHxWD1z5d3q?=
 =?us-ascii?Q?URd3nZ2za+C3H+nIqg3lTBKsrab7w5mEd711AoSSgXhh6eZFjOEGtHUK04X1?=
 =?us-ascii?Q?u4KpeeffCshGcznw9tezhNkKAshIgaZRlqwezbjKH5ZpLs6IxKQOkA6xD8tR?=
 =?us-ascii?Q?Py1WW+u2FIV6kZVxjhAj6FW0daIidj4aPGFvNvcOvZCQZjeZaHJ68PpIQqcq?=
 =?us-ascii?Q?WmdsyTyJPlpvdKWpwP1LiIiAXx6AyVYNkFMhl4WwNRKEazJZ2oOdSEHiw4cC?=
 =?us-ascii?Q?vRH/46tvvuDXkNMDhJx9MDvhHRMCIdI36jObeCGmZABqhWMaaR/1svq5bgbO?=
 =?us-ascii?Q?mEABrZWfx71ARhhnOP7WVZSLK/ZGZX+K8CYuNWiu2ZyR2baB6C8aQ7t8cZdS?=
 =?us-ascii?Q?EK6F7sTXMB1CxSxVnHSyJH/sPkm2nLORtX74gxrEt1Nir2BrtvgrJEWGrQcs?=
 =?us-ascii?Q?TatqqHZIKxqABD16cDfOl4+lvri4k1qPcqEZ4V/MajL0InbzQ+m73s3pcmTw?=
 =?us-ascii?Q?aYJUZLlMGJxHvQyiahJQ4GTeLYCp81EFte8A4CaGS80RJhgIr3cb5Fv0QbtH?=
 =?us-ascii?Q?x4NawZgZpcpKOURTdpVd/AIznaaKfWSveU4vrZnhogxPMqR5EM3A3pzgP6wO?=
 =?us-ascii?Q?CNdzzndtqCTpmVBAzO7S308c9+/tDtMucVSQ0sw5CLOAqNiq2eyK+WI1dbOk?=
 =?us-ascii?Q?cbaifn3Hzxz5Csl5VlTvArIccC0V2fm+YvxU/lVUw9conwnxD3U58iBNpZNX?=
 =?us-ascii?Q?Sx5E1hYdVfO2YcZtHojRgRcc53eVGn+BlcpkcSNbxKbYUq8iKA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b50d4575-4c69-4a9e-b706-08def5fe5e2b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR19MB6088.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 10:10:00.7157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_031004_096452_F8A25672 
X-CRM114-Status: GOOD (  12.07  )
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

Enable STM32H7R7 in the STM32 machine selection and compatible table.
Add low-level UART4 debug output using the register layout shared by
the STM32F7 and STM32H7 USART block.

Signed-off-by: Liu Changjie <liucj1228@outlook.com>
---
Changes in v2:
- Expand the MACH_STM32H7R7 help text to mention noMMU operation and
  execution from external memory.

 arch/arm/Kconfig.debug         | 12 ++++++++++++
 arch/arm/include/debug/stm32.S |  2 +-
 arch/arm/mach-stm32/Kconfig    |  9 +++++++++
 arch/arm/mach-stm32/board-dt.c |  1 +
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 366f162e1..e76750d9e 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1202,6 +1202,17 @@ choice
 
 		  If unsure, say N.
 
+	config STM32H7RS_DEBUG_UART
+		bool "Use STM32H7RS UART for low-level debug"
+		depends on MACH_STM32H7R7
+		select DEBUG_STM32_UART
+		help
+		  Say Y here if you want kernel low-level debugging support on
+		  STM32H7RS platforms. The ART-Pi2 debug console is UART4 at
+		  physical address 0x40004c00.
+
+		  If unsure, say N.
+
 	config STM32MP1_DEBUG_UART
 		bool "Use STM32MP1 UART for low-level debug"
 		depends on MACH_STM32MP157
@@ -1582,6 +1593,7 @@ config DEBUG_UART_PHYS
 	default 0x20201000 if DEBUG_BCM2835
 	default 0x3e000000 if DEBUG_BCM_KONA_UART
 	default 0x3f201000 if DEBUG_BCM2836
+	default 0x40004c00 if STM32H7RS_DEBUG_UART
 	default 0x40010000 if STM32MP1_DEBUG_UART
 	default 0x40011000 if STM32F4_DEBUG_UART || STM32F7_DEBUG_UART || \
 				STM32H7_DEBUG_UART
diff --git a/arch/arm/include/debug/stm32.S b/arch/arm/include/debug/stm32.S
index b6d9df30e..2a8c25ede 100644
--- a/arch/arm/include/debug/stm32.S
+++ b/arch/arm/include/debug/stm32.S
@@ -10,7 +10,7 @@
 #endif
 
 #if defined(CONFIG_STM32F7_DEBUG_UART) || defined(CONFIG_STM32H7_DEBUG_UART) || \
-	defined(CONFIG_STM32MP1_DEBUG_UART)
+	defined(CONFIG_STM32H7RS_DEBUG_UART) || defined(CONFIG_STM32MP1_DEBUG_UART)
 #define STM32_USART_SR_OFF		0x1C
 #define STM32_USART_TDR_OFF		0x28
 #endif
diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 630b992f3..7bc52fe5a 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -40,6 +40,15 @@ config MACH_STM32H743
 	bool "STMicroelectronics STM32H743"
 	default y
 
+config MACH_STM32H7R7
+	bool "STMicroelectronics STM32H7R7"
+	default y
+	help
+	  Support for STMicroelectronics STM32H7R7 Cortex-M7
+	  microcontrollers. This enables support for boards based on the
+	  STM32H7R7 SoC, such as the RT-Thread ART-Pi2. These devices run
+	  Linux without an MMU and may execute from external memory.
+
 endif # ARMv7-M
 
 if ARCH_MULTI_V7
diff --git a/arch/arm/mach-stm32/board-dt.c b/arch/arm/mach-stm32/board-dt.c
index e6233c872..d1207b84a 100644
--- a/arch/arm/mach-stm32/board-dt.c
+++ b/arch/arm/mach-stm32/board-dt.c
@@ -19,6 +19,7 @@ static const char *const stm32_compat[] __initconst = {
 	"st,stm32h743",
 	"st,stm32h747",
 	"st,stm32h750",
+	"st,stm32h7r7",
 	"st,stm32mp131",
 	"st,stm32mp133",
 	"st,stm32mp135",
-- 
2.55.0


