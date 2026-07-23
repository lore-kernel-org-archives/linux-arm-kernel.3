Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40163C5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 10:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Message-ID:Cc:To:Subject:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lya98KnhTYJZLX8cK8hn3h/5hoYcwtlh9k/PAnWhMGg=; b=BLkubpRd8Josw7luWDTN2t9jth
	rLc7ypP2I0KWuuh9fP3S7nowBfFYeQETFih8Mud9MvGj8VS4cLizbEh+ZS22D6fIh+K+1VSpWxgw1
	CITKUagMN8erGglwiOtoDGiajR9zuEJ8Ns4fLruf0c6vgKXZk+ibZd+71oDpSCNszrA7t5P2GIlDm
	eSuPFviBCU1OPwd9KSxs1ihDgiDB8YsCrFVXL87T2bU6nyT2PLHW+0yRA7ovIyr+kSo7hxylJDujW
	kExmbuAS+Fe6q/dU5TdZQ+UV7e9YmBAWPC22pp2qs/BZ8F5c0LuOU0JWgpQlZaqT67p28w1maZT8N
	WzNww1tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0UL-0000000AByZ-077p;
	Sun, 09 Aug 2026 10:10:41 +0000
Received: from mail-westusazolkn190120001.outbound.protection.outlook.com ([2a01:111:f403:d001::1] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0UF-0000000ABvK-1K46
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 10:10:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8zxZCWKj02rtSuGH/QUmvDBKIxtaFT6mhCyxA1VA/tc39ffgAT0IfeWqj0MIYPfrDnrRhEvT4MniJXIkH0LOu5EnHKe/OltEtz964BCq6UDAY5vxdhaqA5TW18lYEu0o0cb82bNbAbcZ0S/CJVtm12ybjLE68OjaKYXREU2tYRVhNPX3Dn8cazmxnnhUK6dC8PjbOBwVgG0xHE3rlw3f/qBwjdwFh5PaADFCbjaHlfLbr9XZB6IKPo4bzlYtm8zQFzxnHScHabBSNUsnRLlHk8k/2+ooVzvAcmBc25/6xm08oyDeyS4wLn+PVravB8NNvxk2Lojvh3G1pFlNkSFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lya98KnhTYJZLX8cK8hn3h/5hoYcwtlh9k/PAnWhMGg=;
 b=TeSo1NZyKgf3D5FmZuHc4GNNZHk5L54FWIHU/kL5eP+x8nUyuwuzH3SKiRmDrjm7WcV0bnOQSgoN0e6As7El/nRUa6+C6+UuavYv2fK+3FTdo1P7YfRm2GOSw+hzyRynP8CGA/JJKlRT72WfxALDrqq2abwNFw4NkpcZC2zQQQMtXEUQbkJLjVgXFQ1hh8ThpWyYHncaBz0PDXSQnnG92JklFFpGNkjGZkd4+/PA6chZjyF3EB2cbaVATntugFX3UmnekA42+h0BLEpR0/NIYpgMhBEQhibUjSXcT54tPi2biMhHP8dEaDLy03Xk9IBjNbpjZ8MbJo9ybJi6FZnIuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lya98KnhTYJZLX8cK8hn3h/5hoYcwtlh9k/PAnWhMGg=;
 b=cO5x+MEi57SdDirz0fhSgLm/crHOVwElSEgGK6V+a+6DdnD0N27AabcAeA4DuZRvat/L2HvSkXuAUUh/QUAsCtWFUcvqjad82PB1+zLcei7osZkEvUU4vafPDzfnrYNMCD6FKWwGcuXulXKgFHEroMb6tb03r9//taZfnKJQrttULdhbHZpQo7QNrQrNpfvs7yUgydG44cBuYFRmGKbkZh2gzzWWD6HdvZ+neJsWhxmLU5cD/6/DzMyTLKN640xzMRRNJpagc8KAX6Qr3q3FjXILXcYR3MLA0yw23+NHn/45jSo78qz8m6Q0MFvDGerFe6GpkGhd6rPcK5d5IF4U/w==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by CY8PR19MB7667.namprd19.prod.outlook.com (2603:10b6:930:77::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 10:10:30 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 10:10:30 +0000
From: Liu Changjie <liucj1228@outlook.com>
Date: Thu, 23 Jul 2026 23:49:41 +0800
Subject: [PATCH v2 9/9] ARM: stm32: document STM32H7R7 support
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Message-ID: <PH7PR19MB608875DBBBF9B73D5F4520FAACDF2@PH7PR19MB6088.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0001.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::18) To PH7PR19MB6088.namprd19.prod.outlook.com
 (2603:10b6:510:1df::20)
X-Microsoft-Original-Message-ID: <178627025545.53236.6333830713158780927@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|CY8PR19MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 21496760-4d4f-43ac-84ed-08def5fe6fd6
X-Microsoft-Antispam: BCL:0;ARA:14566002|25010399006|704163111799003|5072599009|2604032031799003|15080799012|23021999003|16051099003|8060799015|19110799012|24021099003|51005399006|440099028|3412199025|26104999009|10035399007|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SFnINznVI8UipYSs5rLqvmZMkzEEB6uFyPsFh/k9GbwfRyoS9guWXJK3ZzqC?=
 =?us-ascii?Q?doqMsWlFZ1EjRGtI0XRZw1wRqfAf8AiN39/pV0Yu+mw1ciio/5ZTQdeMy+Yl?=
 =?us-ascii?Q?OpYcGLJaOy9GKUmxoR7EzZdKUzlIP+HEE6+dYaAKm0rS5sf0rHjCwUM1B1Zx?=
 =?us-ascii?Q?w/UJZAhVz9iyLuT18JjWbkMuJOc5qL7BtlG3nCF/xtxAdzKqNzA4f8iI4UYp?=
 =?us-ascii?Q?7JOQFOrLFQA5bSM7Zq7X+vLJXPKoMVGnRziS4BAM0K1gOG3eqnr+dHdRitN2?=
 =?us-ascii?Q?oE4kRZhk8Cm7rs0mWufiYPmrkJzRSylqFQuzLa7E3L8O6PVBfEduueaN1XRj?=
 =?us-ascii?Q?LCKRnWyRCAPW4Up313zIr/AtV+f6r8jlCVmFBEdMbGehLa33BO7ASpnnnnrG?=
 =?us-ascii?Q?Cl5L/pyMdyfGcQNKL4tIAKZez/MKMiYWtimxpvecysS0oLhIjhCLVUJgTiyp?=
 =?us-ascii?Q?BF5zoOBaWdFE2qw3IhleTHIEuRLEKUwYfu0nKu1Qt6nk/KgxxRr/PX/uwsXI?=
 =?us-ascii?Q?8lMpPxSkIkL/Eiuf8u8PABxuuXW9OY+9vMOees8pdXfMje7/kbNqY5FkC8e4?=
 =?us-ascii?Q?5UeuV5MlVLJQLY3XwaHv3UdaJSL7VbdbXhcLm7r7T3C7OzZFgL61tpE7Fmkj?=
 =?us-ascii?Q?+/qBvdJTO/FusmFGUD2ZWKyIpnHymOuCcbRlV0nX8xnjdD+4epRRAc9G+7iG?=
 =?us-ascii?Q?eHJnL3DEobPvpBZjRM6d0IURCTRs7hwbs6+Uz8xJ6YWhT7T+VKSE9rMD5NxC?=
 =?us-ascii?Q?Ys4hsMw8qFN5dmpoMul3nr8CfBeXFYMJz7iKxAmoajhAEDurV36wPZumz54P?=
 =?us-ascii?Q?xguH/+wsl/3ONgzMwtHe+aCQe7fiiiDsDkIl1u//f00kT60yMMmC/4V1oskM?=
 =?us-ascii?Q?iVy7SiwQ4eo0i3v+4tBYTgu8gqcuypnxnjX76qsrileNj+cmkujQVWLFFT8B?=
 =?us-ascii?Q?aQEaz4V9apaYqI1kwDJ6sAKGP6/CjR6AMljpjuUJ1Ib9z5s21FirqiZrfbox?=
 =?us-ascii?Q?ADzujImqY3MDT0DUmPpEUnIe9YACWK2nxj9MKQlPuVevofyDV2W3m6vE36Pr?=
 =?us-ascii?Q?ML55wXsoetYEQiYKYZEhaJ57SYh6rQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xj3kAZswTHAZleiMEoZib+Z3U0HSQkLrLjgoZ1ItCzfjJlTwTDOWpt1ho/YD?=
 =?us-ascii?Q?zXC4Fvza7kjDsRf+HCKcvbKpykEIArFHUi48hMdIeAt3G4uvOvkMcYa9TDNh?=
 =?us-ascii?Q?uEgOp8qi9ynzdQ0G4XRzwnVnRq2HOkgXDlwNVEMKcne02I68uQA0rf7QwWcN?=
 =?us-ascii?Q?fU6Uqc31WmelNJDQbrsjSVjCFSeIay7PZYTihFjJg4U7hBEBYjv1nYZh9pEy?=
 =?us-ascii?Q?wmQlKOm5ZSJjcixew7oQs7KZpmmZTn+k292JOrPKC+5XkHnoJIjdRXpO+xlt?=
 =?us-ascii?Q?g0rkgWbbgm2xzsFS7qX9DQxW78UmtRisotCorogLDTuwPmONijnSHsUIiqfd?=
 =?us-ascii?Q?ifvMiZhAE6SG8MhWdKauUY86RMGjuwEFks5scBKMv2DElwza1dMGZ7GHJyLa?=
 =?us-ascii?Q?5w9XDV7sbEc+EDXUez8AwyqLf7J6vRVKtDGDFJBdx0Ww+KjL9n+mTMAB8Rqo?=
 =?us-ascii?Q?WvW9Yvy2OrKr1o3Gu5QNOUpb13rEQWgb2yCgXKnTmoCgBA5NA4UfyoEPX5oo?=
 =?us-ascii?Q?BoSSqvAPWynL9KO6ycyMOCydUf6vHuLpLcBHsYyZHXMVOGW173vcU/o7GIBR?=
 =?us-ascii?Q?K8xJPrV/nKSzNMuYqpWv2ero2l4oa9umJdyHvl5DHjmRWwndXxM+24Zz1Nwp?=
 =?us-ascii?Q?p+VzDc1GjMTycwhZEymxKdPHNnFpO8jnM8YKDp9oKqqWLeAJ2fbiKhKHRiI4?=
 =?us-ascii?Q?jTlP7+/Ow3+clOoUww0/OMDZoPchiq2HqNSQ+2H5Ff50ZqNckH76aAx76qLf?=
 =?us-ascii?Q?JVVbk70jP9soEi/CflFGk8qq+IwurNuNpP/DzV5s6molBw3/tmAGQVyrFRqs?=
 =?us-ascii?Q?tp6QZVAzU63PN/kf97yqRtiZdSa1vjf/c3YxFGU0KD9iSZ8Gj12gEXTK7rqS?=
 =?us-ascii?Q?Jw46o7swZ8YrrVwrhvXoGA/cDyIsDM1yqoFB9FxApQgLtVTuKNLaDqG1L2JK?=
 =?us-ascii?Q?8IeF8s25nXZF4NvMzg0vsSRVHW6PmfxGF8OJfL9b07PngOqzDMCd5GBvwgI2?=
 =?us-ascii?Q?K9K9RU4J35qlHpqyQ1k+UADGsCxgi3cux3oroTZXL8smXsKnKJTn9mpA71re?=
 =?us-ascii?Q?rHHt7ljSrvFznLpztVjgsNRLMbM0PSS0OJ4SlAwTj51i5PInAjTOLkkq2t9n?=
 =?us-ascii?Q?+fvRxwVfqY8CNH+OAmGUaxRLdPASX2Qs5mh+hjrylc+j69UbXD4YtkOZ2jKV?=
 =?us-ascii?Q?oVt8ERo5JteDU7J15rSTURuWYec+pJcLUGV+HTUI+CR9Q4AocBC4B6q+0BUE?=
 =?us-ascii?Q?79UeqaPTg/KyvaNkLD7hMoyBi2Cj7z80e84JVM7F9fA5YTiFTqOMI+PmleuV?=
 =?us-ascii?Q?4bcrF4v2lzmMCkxBQ2QJs2G/uYXPm0aYvUZmEpyjOXD64tfWDAlUlfkLjx53?=
 =?us-ascii?Q?Dekl2C9TKeUhGoxrXsJ/P5ha+S538d19QlOvW90QhOl8irwyzg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21496760-4d4f-43ac-84ed-08def5fe6fd6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR19MB6088.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 10:10:30.3548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_031035_357579_1598CA4F 
X-CRM114-Status: GOOD (  14.75  )
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

Describe the STM32H7R7 features and note the ART-Pi2 as the currently
supported development board.

Signed-off-by: Liu Changjie <liucj1228@outlook.com>
---
Changes in v2:
- Add F: entries for the new clk driver, bindings, dt-bindings headers
  and documentation to the STM32 section of MAINTAINERS.

 Documentation/arch/arm/index.rst              |  1 +
 .../arch/arm/stm32/stm32h7r7-overview.rst     | 28 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++++
 3 files changed, 35 insertions(+)
 create mode 100644 Documentation/arch/arm/stm32/stm32h7r7-overview.rst

diff --git a/Documentation/arch/arm/index.rst b/Documentation/arch/arm/index.rst
index b15621093..1e33535e5 100644
--- a/Documentation/arch/arm/index.rst
+++ b/Documentation/arch/arm/index.rst
@@ -55,6 +55,7 @@ SoC-specific documents
    stm32/overview
    stm32/stm32h743-overview
    stm32/stm32h750-overview
+   stm32/stm32h7r7-overview
    stm32/stm32f769-overview
    stm32/stm32f429-overview
    stm32/stm32mp13-overview
diff --git a/Documentation/arch/arm/stm32/stm32h7r7-overview.rst b/Documentation/arch/arm/stm32/stm32h7r7-overview.rst
new file mode 100644
index 000000000..7856b4319
--- /dev/null
+++ b/Documentation/arch/arm/stm32/stm32h7r7-overview.rst
@@ -0,0 +1,28 @@
+==================
+STM32H7R7 Overview
+==================
+
+Introduction
+------------
+
+The STM32H7R7 is a Cortex-M7 microcontroller running at up to 600 MHz. It
+features:
+
+- 64 Kbytes of user boot flash and 620 Kbytes of internal SRAM
+- 32 Kbytes of instruction cache and 32 Kbytes of data cache
+- Two serial xSPI interfaces and an FMC parallel memory interface
+- SD/MMC, Ethernet, USB and FD-CAN controllers
+- I2C, SPI, I3C and serial interfaces
+- NeoChrom graphics accelerator, JPEG codec and LCD-TFT controller
+
+The RT-Thread ART-Pi2 development board is supported.
+
+Resources
+---------
+
+Datasheet and reference manual are publicly available on the STMicroelectronics
+website (STM32H7R7_).
+
+.. _STM32H7R7: https://www.st.com/en/microcontrollers-microprocessors/stm32h7r7-7s7.html
+
+:Authors: Liu Changjie <liucj1228@outlook.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 1ab873685..bd86eab10 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3667,10 +3667,16 @@ L:	linux-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
+F:	Documentation/arch/arm/stm32/stm32h7r7-overview.rst
+F:	Documentation/devicetree/bindings/arm/stm32/
+F:	Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
 F:	arch/arm/boot/dts/st/stm32*
 F:	arch/arm/mach-stm32/
 F:	arch/arm64/boot/dts/st/
+F:	drivers/clk/clk-stm32h7rs.c
 F:	drivers/clocksource/armv7m_systick.c
+F:	include/dt-bindings/clock/stm32h7rs-clks.h
+F:	include/dt-bindings/mfd/stm32h7rs-rcc.h
 N:	stm32
 N:	stm
 
-- 
2.55.0


