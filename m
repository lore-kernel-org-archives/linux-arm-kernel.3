Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE8FC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Subject:Date:Cc:To:From:References:In-Reply-To:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQjSPnzfIWrOwL0jPhkeM1kgPtoDazwwAAJDaT5efhU=; b=sGcHKIhwUe7sBjChM0paLPeJIO
	l91YX6/Tq3hPxqbJiYhQIT8/uNdXRzVs9Irc4yywwrRN2nJa4U6koEmmvkhMr1H6O1t0fNwzdPoAI
	5JyjRfsv7sgNZD/rilhzKpX8GQA6MOl9rXoz2F2QSCr2qAxkMquHgs2KBulAT1B32UxZRuraJrF/1
	6XlJx4ha71+glkssj9M6MSVTfyBT7BC/iTyvI2Bpl58d/nZE7lurW/Kl8R3IZXUlrq4bBUlQvF6K9
	Wu6qCo7RtJ68efy/jBDwhtOw3TGxbXyRcjuoRwuISQbWycIZ8ZkjfPbzDO4Q8N7VC5qje/cgrBKI2
	BumbU6CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1UF-00000001M6j-2txy;
	Sun, 26 Jul 2026 16:13:59 +0000
Received: from mail-eastus2azolkn190110000.outbound.protection.outlook.com ([2a01:111:f403:d101::] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1UD-00000001M2T-0QuH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 16:13:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=il0Azr6YzRyant6qlPaVLki3X8A6G209HrfBc4PXG9q9z5Vvrz7XfRm1wJArEDkyF0lG3XtxkP1ZhifmMKMGzk5e+OnH0aFB14J7vx+RhGUi8Jfz6TTIvbXyVFCZ8tyzqtd37zjwlUPGdZsgJ7URSJWc92y7KWSNX3kJxwh4lbayJq3FMoG+Vd/g40K0glEY53YvkM47N009nLMnMz0wMlKBXG/0si7drpQsAXoj71ddpaSCil6Z5ke5QUUOus5G3PtIGlei5jvpQzKyzROoMZVwlgEt4B7iIQqsE1kET/CO9ARziyfEG6BQrnEHqZn1n2QFQDr5A4zOegqbWrKVFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQjSPnzfIWrOwL0jPhkeM1kgPtoDazwwAAJDaT5efhU=;
 b=Pon3RK5JnVINLweS7NSvV8sLM+aZ1dIZANC5VpLogY5As7tuSQs+ldFqHOpSss6PTZwMNjvhQ6PnaUPMPjH2B0oRvHxSCIClwhoNL/RgUhMMfWTHXOU/jBuA10RDr+5VDjjwGaq7Qk4qmcrFhbqx52Sx3xlsQd3znhaDcloDq7ouCLQAlYBCQUcox7eQMCVSBkM1nEkE50kpWtHPssXl8DUa3+N2habhnsfmvGuMzSmdn8SIhsGalgH7fhSsnM8q6kpXkSGzx6TC06r+Q1MdKjP6/yL2Ur/t/X2hUp68lqrIZKCZsX6TXw+ucWnuejV616QQ6kp9riX5lJ+O6FfxHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQjSPnzfIWrOwL0jPhkeM1kgPtoDazwwAAJDaT5efhU=;
 b=FrsPaomWY7zUCa64rYGbMmdPL8yaYevodEEoqFPnwKqxJWvWFMolDjppGIE8fuMDuNv99B20Y+23B4UB9zlh0SEBVeWAxlhHs8Nljyn4jZ0li+dTsVrE9R/C0QeracZoqhJZFm+9f20Gq0iXoF9gZKQNjd4rsOZD/PYMkSdmudm+gTpyVH1E1BgWwqvQQlnPWP0ceUpLrd22Yja+zrSY86pjiGG3+hfXbMa3++V1g2l+vvwus/Jk+MujyXw/HrHLAGTkjbfrZkNNTtlMraX4hFrekJJ7QGpf+Yfx5b16BYsO/+wCJDCiCNHLeZ+6p0ZTdELzaP56lqkYcEGax3MBiA==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by PH7PR19MB6807.namprd19.prod.outlook.com (2603:10b6:510:1b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sun, 26 Jul
 2026 16:13:54 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:13:54 +0000
Message-ID: <MN0PR19MB609186548542EFB23E4C2CD7ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
From: Liu Changjie <liucj1228@outlook.com>
To: Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 23 Jul 2026 23:49:19 +0800
Subject: [PATCH RESEND 6/9] ARM: stm32: add STM32H7R7 platform support
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::11) To MN0PR19MB6091.namprd19.prod.outlook.com
 (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <178508245757.28466.507148269367095293.artpi2-resend-6@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|PH7PR19MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: ae627028-8cb8-4da2-f10d-08deeb30e366
X-Microsoft-Antispam: BCL:0;ARA:14566002|2604032031799003|704163111799003|41001999006|8060799015|19110799012|37011999003|23021999003|15080799012|51005399006|24021099003|16051099003|25010399006|5072599009|40105399003|440099028|3412199025|26104999009;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AjVH0iaM6PIQK+4ML/pWKm2tVdgLqNRYQRiYxCh3uE4EG/FIt45f39P0MTiK?=
 =?us-ascii?Q?4SNpp5uzp5gD0Jxx6Vc43iWdq9QCqvVEPiMgJNYAgVF96ywY36L0FEI3jk15?=
 =?us-ascii?Q?fe20FLztKvO+O6ejz28P3GpnXEcT4HMp4w0+CrqbwR0qqIG30bIULaFewWyg?=
 =?us-ascii?Q?2SqNDsmAND3reu2HuebcGjQTh3gweJUHP8rT29EYJ2bKND8k91jKsfqfluDW?=
 =?us-ascii?Q?QLlCqHwFQZFyewYURYieNy628GjtQOlH8BX5NWQH5rQ2aTDVgqDxqECem7BG?=
 =?us-ascii?Q?MWX/nrK5W7kalU+TWGr7xylrp90oE5AZqA2c3WtebaduHnCM23H4mcvVUPHD?=
 =?us-ascii?Q?vBczqZOGzsluNrC+6QWxonyrQCpr4FECBtbAIxXGz7U0R9EM1sAV9Jqp4sjW?=
 =?us-ascii?Q?dGCI2ef9csjFMeau/bYAuNZiwsQxrevaDVpLYrDCwoiqlFAXVA+2FYmhioZi?=
 =?us-ascii?Q?R6pvunFJPuAKdaQKwbuISaewGcUK076RA0Dqy90QLNEuGQpIdabWTJIb+VCg?=
 =?us-ascii?Q?iHoQ5nakVPd2Urx1slqFj8KqcqeEQSq+qJzto71oH3tI1LJfgM8wVKVsg/x2?=
 =?us-ascii?Q?z5pcRV5jGcUOzPEVBtZ5p4kwYTdDJp+M1365iQw2EaTlnSOUMJVDEXXnLw6p?=
 =?us-ascii?Q?wfew19AB5f9rCbOrvYAfNTFCPL6LlfMPyiUSM8beVNCq4qUcJT8CwvvwWIpC?=
 =?us-ascii?Q?8RSfmA06S4AlfmUFyZCfTQuxHm8Xhlq2ogHNTeeb3UEu9OByE1amlKBdWV30?=
 =?us-ascii?Q?JFd+pg84zwI9JNbbYhK4j7upWZOZatrd/2CiV1Rl5KaOutN/Nv0IAlZY//Wg?=
 =?us-ascii?Q?81q7Ew5GTTIPAJlH7qll2ypNAx7/cTav/Xs6P0PMe6/LxWMti0glUGciQqwW?=
 =?us-ascii?Q?5XSqwaK+oPOyBk9687TwtpscX21X5AixrRsodTZ0R8W3oDSYMt4TKmxYtLzs?=
 =?us-ascii?Q?++bUZRbn9N2p/FXbQSJC3+s+ZDuTXZ2Lj3ZrVGVgMiah6YYRbxwGIURjdKNL?=
 =?us-ascii?Q?ThSfatqtQmx6OxGNPcT5Gglsx79s/DbmfgfG+9btgR26ogON6tW0JMDW2Ap9?=
 =?us-ascii?Q?Jqgtx/djsBH3MBZA9lBxTqxtS+ZLiWkDZYpH7kgTKuAS6jXyM2Jd66nw8o9b?=
 =?us-ascii?Q?7JE2o+29jql/?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DHzc5fNQauMwl0u7g1laNi/qaNQ0g4fnszqSGFzd91FbvZzroH7M7hYHTFvv?=
 =?us-ascii?Q?km6yFqpOIFa4MB5U2pKj65FnXJ34bscS84uRps5aIY5EV9ejNjUuPjLHlz6b?=
 =?us-ascii?Q?TTYaraIoburx+51RpBChhaiSj7NcXGVrVgnOR4d3xzRCi/p5vEBW8MFf0LMq?=
 =?us-ascii?Q?z4XBTGrZ65vwB8WXTx+Z/zqsHjsn/j/NlTQuFEpXezKbw6mJVFKfIZq7Qo12?=
 =?us-ascii?Q?qOqoGNUBYJliDPgfbP/xn05j266mUEe4Vyf2mrwTDO2tfFPC0A3hOxSkT2GU?=
 =?us-ascii?Q?7OFDLm6YO6cI7HNQEx1ZtJI+0y5PpQlU42ceV2x8KhEKMV7zlv1fm/2UG1LE?=
 =?us-ascii?Q?37xiZqkXx7b9k8IFZNZFpIuAnar+/jRI9bzbN5HD++PItpCMaOhg+qVVNXdY?=
 =?us-ascii?Q?ZvlpZehZZxKogf79MURMEzv7Lvu8OetcxCGWI2uW9BEClujikgMOy3VQUwE3?=
 =?us-ascii?Q?hBhxB46a7MJBRVEyATaJgClX/PV8tsvGYB8y6l/nQ5bKhSg0c6xaoWWcvsYu?=
 =?us-ascii?Q?To5zNnTAB1R2IirYbyCIRk2lK0vsuiQ4n7ItqNyozM+lBS3R2xOGZ/YyxSp7?=
 =?us-ascii?Q?vGiDtU7x96IsHP+OIU8ebxz4UaBqaIRYFlqABTsJbYiyvkD0/Z1HIwWEdMP6?=
 =?us-ascii?Q?x8HBYtbuXGKqKM1VKxmkYjCnyEEwpQuvkRs+hViOnz/GLIBmjFGAqMsoOdDM?=
 =?us-ascii?Q?V7YLyrzP5fvCoYIjb22z6Ca8vrmsUaInxQXsko1qcpLI+IQO5IP3D7lc5nwU?=
 =?us-ascii?Q?emd567o24ony68b+ARRNpKSlpU/W3RPmk+CL4sB4yiCH48QvrJsum3IzmpsL?=
 =?us-ascii?Q?Dm4mzjCxq/dibb2licpDEsFmX8XtSNWqb4LoPTpCW/vjkKFTA5v5QVpn290c?=
 =?us-ascii?Q?USN6Gl+cQ52pmJNgqX3TG/IGx/7A5cP87GPMYLh9l7PQdNLBl/91RFUGBDQX?=
 =?us-ascii?Q?kdhgMZ8OZFULUHMxb9iGspOn4wpG3RePFs56rx6QvmD6ls9sBcczATzRT4Tc?=
 =?us-ascii?Q?U0Qf8p/T8fOqyRsAgO4nkT5JHWYIC6WT7gxgZocCsERs1bXHbuc9Y6hxb3hK?=
 =?us-ascii?Q?7oSztBqpqZiVjBqfaqtPKtmv5/4IBF/77MdNaaQhBPFeIFUP3v5SE7fYNhyM?=
 =?us-ascii?Q?/YR71Jr7IrSP8n1LYbAL8/YS9/x0jmfEFY9NrM42carEv9toYjgbm1ktMNDj?=
 =?us-ascii?Q?d/nfhINOYzZXH3gYzarmsjdAzi1tUpLD+EgeC6wk4io0d/U6J0aID+HwsJrX?=
 =?us-ascii?Q?yHp5JERbGkEEf0/FdfNUVATxbxRLyzYjVCTPDy4O6hTPPYqiUsdLlhmIWdGi?=
 =?us-ascii?Q?eirsvn7t+KLNSYqBL8hGpWpZkc9wW0gNjfHKgocv+ES7ZHL+6eYQ9mf9Hkgg?=
 =?us-ascii?Q?ve2k1vCk0PXOkQLUUokUebJNg7WhBWrDAGkBJ1Z6BwAL8fPG/Q=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae627028-8cb8-4da2-f10d-08deeb30e366
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:13:54.1416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6807
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_091357_142335_F1B69C45 
X-CRM114-Status: GOOD (  11.54  )
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


