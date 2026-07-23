Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E4AC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 16:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Subject:Date:Cc:To:From:References:In-Reply-To:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQjSPnzfIWrOwL0jPhkeM1kgPtoDazwwAAJDaT5efhU=; b=sMHozxVM8LNKk+fMB+xAxdbxho
	YZVVubUlRNiLTmjKNmxZoRyjrmMVuaA0dVgipsSB6iRnBwiEnOTMr8fRNRiCQTleSyf02Eu3rqvgK
	cUFKac7eVPMia1krfqhAw0J2P5JM6SoKgdobPNEnLtEexZJ7wqvYWGWdH3wdMelQuAWkXVJtPeEAw
	f3XmQaqQWoP/Sak0/U2v3N6t5wC04Ch+zhaXxXiCJW6ArXzNwFUKcXbSXVVRYwuHbR4WlWXPeqO9A
	eZFEdfZFqNBIpbRwmUrZT9TdNcVmloQLBvBg/z4U19jwu11r8Y1LU2zSCPMiufw4o/nziLF2xdP7t
	O4EhVVWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1QD-00000001KvY-2zTU;
	Sun, 26 Jul 2026 16:09:49 +0000
Received: from mail-eastus2azolkn19010016.outbound.protection.outlook.com ([52.103.12.16] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1QA-00000001Kqo-3tZL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 16:09:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHtU3OQNF+mOrr9fZsFUdWYBGci9oUrPfrFTnDmWDWZtZuOwfyP5C83uNkSQwCc664uGNDRT5sON8EKpX8Qs9EPLfx9aDsqJUNnl38y3h+sW6jSV/YtclTTHZkzBlfbk8Mg+0GiW+oWoJwcVLAButbb1Vb2Dq3fcfoCM3NwRRLTpaIkkKdSveCJo0YoVNz8SRgcVVNpLFhvQCSwM47SCjSuOLGbBo/UOhlf3KSMce6Z7gxt77m88DXXTtbF4PPPJ02ix5hQoQwGjOynQhAqciC2dSy/I/uLUdS5viNlFPzsgD4e1G2GK2U/LY3XD8blXFcEyVf4RVs+XgYFs1KaBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQjSPnzfIWrOwL0jPhkeM1kgPtoDazwwAAJDaT5efhU=;
 b=ef8ELm8vaTEWlY7O8jH+2Y4T/TKMSPPEmmME8m8S7Zk6yoO+LuepDuHwL+JJjy1xAay3xU6f9/7xN9n5mJ/V3AGC9y6POMSTc1C7dswjaTEcMeAJSHqe3eQ/xAyRNyKDp2Q1IIrm+qk/OYkBaRVsqeGpUTSwnooNnqZkSbfTScsRouUOrAi4kI1b49UItGWWZgzTHnEDT3Ngpi0ZYfxO6TMDYXtqOIUOoFkfsezNIisC7yJRiArZID5SFfL8Tvffvn6/Z/19YVAYpa5+X4pr+1RceDFlkheft61Q7K9uW7lkv51hhjNXtSu2yrCM17qVNYPBI6PtfeHa+I1CMhlbSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQjSPnzfIWrOwL0jPhkeM1kgPtoDazwwAAJDaT5efhU=;
 b=h1fWwvitqshPYL97cACr4AQBHzZliXf80sHXCpxyJ4h5iYNuJtzoQyFJd32c89jR4lWOGDS9p60GjXCvXYKuiVlnY1ZFnCqFsyslkGtfZ3YAotxUBoPAXie3InkIzcZKJLjNAWmBt1sgso4lH/3NIdaEh59kPjd43JYQHber0UhOrVQoZQJe4S54bb2GQlxRArHTpdpFzH+RrCzVxxM9Y0CRy70P7xiqaF5wp9H0eRJaiZ2B42fqyEAeTq4lWmc7BuM1QUz1zdncOIZXszNixBN+cuJw+zAGf4JheHvlOazq3JfT9glVJHlcrjo4U9Gjve3CE0FiyTjHNFFKo8qUvg==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by SN7PR19MB4765.namprd19.prod.outlook.com (2603:10b6:806:100::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sun, 26 Jul
 2026 16:09:44 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:09:44 +0000
Message-ID: <MN0PR19MB6091A0C198F893B465E57E34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <cover.1785080950.git.liucj1228@outlook.com>
References: <cover.1785080950.git.liucj1228@outlook.com>
From: Liu Changjie <liucj1228@outlook.com>
To: Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 23 Jul 2026 23:49:19 +0800
Subject: [PATCH 6/9] ARM: stm32: add STM32H7R7 platform support
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0008.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::9)
 To MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <922e9de1a9459cc41471e543a7e9857175dc5c47.1785080950.git.liucj1228@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|SN7PR19MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: 539b7362-07a5-4f84-8211-08deeb304eb4
X-Microsoft-Antispam: BCL:0;ARA:14566002|16051099003|51005399006|24021099003|15080799012|23021999003|5072599009|25010399006|41001999006|37011999003|19110799012|8060799015|3412199025|440099028|26104999009|40105399003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sMh96j24iClfWNjqkCO4A+iXnA57QOHmKWK5SHwY1LaFgGgnDnU6WK+vUwtD?=
 =?us-ascii?Q?Z2NonPHsr6HbCDeIDFq5XWcrI7YeNLNyo6KGTePX2JcUbmqpx4Jnbi7M0kDg?=
 =?us-ascii?Q?FdOehmeteY+ppduHlLCwL64ECm9xowLHPQ2IysXmVHxXFdYfTXFeeZxcDnWu?=
 =?us-ascii?Q?dgzIw0zxX9JqqmT7OoJg9bjei9MQx4dXAfTI6bvb3ow3yEAcL8sydNh/i5w6?=
 =?us-ascii?Q?32pwncYKLQvLYnBzYsjdoGuWLm0fmu/EGSHbXI3NTIHaJ33lAVuEs3xAs8Nd?=
 =?us-ascii?Q?GRAxjQpORlbq+jOKpos5WD4HC1RPU7VKyBzwtlWaRDUF8d86XZQSts8SD92b?=
 =?us-ascii?Q?1SvEWaijXczyB+85OEXDpIKQpe/HFgzEmp4ri556JYnTFP4uq4FGR3UZNWH6?=
 =?us-ascii?Q?FpdLOpW7DHqmHjJea8DNhqQ64mdQlEGc9zF+RWfd+m5uGF/ltPujlcqq8yw0?=
 =?us-ascii?Q?fo7PpDmAaMKP964Mtd0uWk1Qw4vmBhQHbrpRSuSIcT8Kj/iHEK8i29hkZfRS?=
 =?us-ascii?Q?ibV8b/r6hz8Tomm6a0GAnX8QuLUZgTWX7lsiV+3dX9yPd17wY09yEtdXec5Q?=
 =?us-ascii?Q?KX0VtpH/x3vwOnps12pBpPiOULuvDt7A88HaUy8hyG/yD4shX1yRynJ5jZHO?=
 =?us-ascii?Q?dXzRACzzudknrfuopibWoPLoRATN17PnZGKoBMYHJXovQ6mOE1XeK+i3/SQG?=
 =?us-ascii?Q?IlxcsVSwz9vc2WUZKygp50USfDU395Mtaj94OKRAz+G82pIhwI+bY+BnDzbL?=
 =?us-ascii?Q?fZF3Jntk8LhLxDa3BvyiFBssXzom5SmAtQe2kc69iP7jkh+l/nWXfJD8MJQb?=
 =?us-ascii?Q?pd7OgPd7YnSjS0CuwhVfGNubXjBe69KnGvEVF92X59mUSmELzo1+PIUW38gc?=
 =?us-ascii?Q?bhpEmymej86jtl1fcoAE3MKvWfcmxwFzwDf3D2ZqMerl1h5pYCBoFwuaoD3D?=
 =?us-ascii?Q?CyYxCg3BKfLlvR7A6su0hP/jeKs8NTGLk9ZFQTWddHM6ok59EkpOv4CWrlwc?=
 =?us-ascii?Q?QY4r/UWG7aqByf/5N5kc0d1Hkw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bnuxvtj9GKRXskEyZP5JO5JhdVgkkL+KInEPFO8e0r2yd7lP5uYoUWmOts7a?=
 =?us-ascii?Q?4dE9rYB9oOKN5zbOV43OPlfFbuGNATn4OS7wThlYNaZlHnmEAl2yzO8tYHur?=
 =?us-ascii?Q?CKAmIlRd1ofL/ueIXpow6o/zKhaNgCWjn3YmtQcdMPK4PuWbvjuPuVd4f4k9?=
 =?us-ascii?Q?irWyfJoJsCmNhkHTJRWKZAKtMP0y2aW/oMxFIV1xhlrYNXepTpnkXh/dzBu0?=
 =?us-ascii?Q?Cm7Qj5l1n73fS2CDrBxONp8aCDcbX6KQzfWpLiZBeOki6MtNJ4sXPry4UCZN?=
 =?us-ascii?Q?gk21nDummcSpupxH3VkPiPKlcQoWl53KUfiY3yHI/kXBX9xg84cZSJhVmVJZ?=
 =?us-ascii?Q?7dLIRpu0OGcyJmFQJPyJ32smhF04kO5OnbVIvoU4gJIca7VUt6ItdeMZhDe7?=
 =?us-ascii?Q?d9rpt01dZVoSGDolkaTEodDYUg5SmaCuPzqpVUn55JHedUKouAtwd9JkEYl/?=
 =?us-ascii?Q?cqKIQX5MzNUFr5XFRd97HDZc9E4ev3AIm+U/f1V+Jt3BWbYxB6jvgqnrhPYp?=
 =?us-ascii?Q?bg/oLlazwLn36PkOVI1g5UZRQhOxQxuh37s1PCHYhjuIvRS63Po0CLq3Lbst?=
 =?us-ascii?Q?0YZsaIN38LhSxKAWgy2hczECPP74yrxwvXuy1dBP6WUTTeZAqTobY+F6+gjn?=
 =?us-ascii?Q?DM9uUnnjSDQ6YR/Muitp2CvSFGIchvTrg8zOdgRZTPhw4wWHPzv5jZlvadum?=
 =?us-ascii?Q?Zp8l3qOqvzBo0DurpEAZxLk29udBhw5S3aiY8p5UdUdXCWgmhi2b7RwtBvgr?=
 =?us-ascii?Q?F1f5/aClWKy3t7fvEOSUQyDfyS1b6+R0JCPmYPkIdglT9XmBVx97pkYaS5q6?=
 =?us-ascii?Q?WNDV6UQWa3Y8xuZVyB/sr5mfZ2YCpn/vITJUvSpWRvQeSHf7v2xk2n5NJwIn?=
 =?us-ascii?Q?opx41AX5Mlh5imwlP1lzoiar8cqombH8d9c6zOOn98obJ+rwC7Ks3Ppds03B?=
 =?us-ascii?Q?PCQboW3JotHuwY+pcXtyVBd9uU1YQiH2o6oYQt9MWHNngN7YGcOxIYohBGgk?=
 =?us-ascii?Q?dmkPXNwaRlf63hxKmIlxVOLTCl9MiV2+NaGc8JAdHL5PA6Ffq4HzJPr9Z7Nu?=
 =?us-ascii?Q?UCC3u+XfEeuc1u3kojIoLIma/6qAbFL6RS9KEhuXRUaMBuZwEF5x6DkpCW73?=
 =?us-ascii?Q?LcO610e6FqeqZAkcrgoykZ/5jhCN5NJjyK8PIl1PLQN80d3srHYj1MnDg1Kt?=
 =?us-ascii?Q?YZFYmjoGaQMXZVxbOEs0F92njLtomMuuzg7s9eRjt6Hq7y9osoFUmd1UZUGy?=
 =?us-ascii?Q?z30LVmHCsnE78xeXoUI5UYgH00rCYR1elGo8NGI2lYikjGxU1Eql7H1DUZXG?=
 =?us-ascii?Q?6d6bGeL8swLYVYmYCaG1wA9iNB3B5DIP7AQZc4dmp+GJ5hBEbsxr3y2jrziz?=
 =?us-ascii?Q?3gwcCcmW8KTXaLJhSTrItrf1NyV9wzLIM9yEcpF8k428t3K+Ig=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 539b7362-07a5-4f84-8211-08deeb304eb4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:09:44.7704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB4765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_090946_969053_AB602E66 
X-CRM114-Status: GOOD (  11.56  )
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
 arch/arm/Kconfig.debug         | 12 ++++++++++++
 arch/arm/include/debug/stm32.S |  2 +-
 arch/arm/mach-stm32/Kconfig    |  8 ++++++++
 arch/arm/mach-stm32/board-dt.c |  1 +
 4 files changed, 22 insertions(+), 1 deletion(-)

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
index 630b992f3..ebf9fb637 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -40,6 +40,14 @@ config MACH_STM32H743
 	bool "STMicroelectronics STM32H743"
 	default y
 
+config MACH_STM32H7R7
+	bool "STMicroelectronics STM32H7R7"
+	default y
+	help
+	  Support for STMicroelectronics STM32H7R7 Cortex-M7
+	  microcontrollers. This enables support for boards based on the
+	  STM32H7R7 SoC, such as the RT-Thread ART-Pi2.
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


