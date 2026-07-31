Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB0DC5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 10:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Cc:To:Subject:Date:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A3huL7AW9a+cXAu1MI2MsmwpfPsRvH4nrJvLZFx8AOE=; b=sd0m3Ld64aHnAx7q676tyiFvhC
	GO1G5XuhyqMZS/B+CLItRxk1fHLefGp9gg9tB7k7JQLMaZW9i/xIHt5DAGuxZZtnIiXsk7+f4nHf0
	U4kg5aO5bRjLYL9nE5mvRsnF7+5APr9J4t/V0DnPOAqAOVd3tii8IaAAqC+MBOqHHy+SSdJEkSDGK
	kiCx/rmtb9/pG6rhd8ZDb08yZjLLNkpOjoNqS0IxqaGhI5g/w4WEj5lr4uM1JCNqcgLK8EW5CJhf+
	gyjVFF6rO7+04blRdwyv6ZgTqgbnTqzaCaHfwZKmA6em/KVAEAAjOKrWMX25HHCxqzfJlko/VENkZ
	l/He7lEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0S1-0000000AAYm-2DCX;
	Sun, 09 Aug 2026 10:08:17 +0000
Received: from mail-westus3azolkn19011074.outbound.protection.outlook.com ([52.103.23.74] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0Ry-0000000AAYO-1etI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 10:08:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgEFJf3afIVqGkgWD/37m3Xlk96fgS23PwvZt8qdU9sTvUWs7PYtWf3Jo9tuGqGfZrjI5H2QD3fM1uXSuEZysZzI5TmRXRxoUlpRnAOD+PVHkaIvBwUCqcV1OdPniGa0TXEtBuIbOxJoyHI611Ic8Gp4beV3/OVrSAp5ul4XuGAXG2pyucQUd7SI7k2MdHKPlZ5KD6RcMGjgPUgYNbpXtsQt0Iwv+nsSoiI0U1lQqyymVFJZNNYEWx+H1ayxYEO8nn8qzyQsv+ruLwqlkGPDsJY+mqrCyfiC/i8Qkjfn9kj7vJ+N1fUSPNmN+s0zpXDJZT7s1zUW2D/3QCYSIc3RgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3huL7AW9a+cXAu1MI2MsmwpfPsRvH4nrJvLZFx8AOE=;
 b=tQT6aZbnifOJjk3IjasWJPUZSeDFtEYTzIxsWm3edS5suGlAnzS1p0hAvH2iG5oqjECGWtkbqDm7gHMn6RvN6d/qBiF24wwUlrOEAggFcQkR0kGZdbI2l6bmVJLPLuyDXUm4mp3W7A/DLTY1xxgy32azMCDCgYaxX25XUPmY3TRCrL5XM08GhnkqIJKU+m+iS1GefWHQTMn6KXdT344rthXNUDPC5+tETK9IezWU53MT8stHNBagNT1YjRtjiM4bu9JDz5JMAWjhOitr1AWDueParHl4SfoXCNGZpXogn9so/lHqzeXH273T23WbBUE6DqzBXy24kBsJNkr3uRi7+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3huL7AW9a+cXAu1MI2MsmwpfPsRvH4nrJvLZFx8AOE=;
 b=LaicLFd/SlyUtJ+xp9QaLeO6VFQFOVvB/Xex2j3ixmvFpga/zK7fhOkuVYsQNUKIcbbvRKCUhc7m9VP4AsFEicJMd3bEc6+6Dbl6ALpgCi9vYwUPStLIWi7URzDrR+cbzXo8vXM2AcILPR4S/8zFAoHUkmzzptbCzzMkTEVftc5Cmu/hMbpKsSsq0/kyI72dnZFNi+nkI4Dr/K8FNL/7gjZIWwtilFDAg05nK9673isgVhajhC5EyNuQ5GzL5/pIdj5nwIILVa5JKW0unPun4MbWLXrBzf7iBIRLDap62dAb/nd5bnwBPfs5Z/HX/nLGKSU58gJ0Oes7QYF/PwEg4A==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by CY8PR19MB7667.namprd19.prod.outlook.com (2603:10b6:930:77::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 10:08:08 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 10:08:07 +0000
From: Liu Changjie <liucj1228@outlook.com>
Date: Fri, 31 Jul 2026 18:44:49 +0800
Subject: [PATCH v2 0/9] ARM: stm32: add STM32H7R7 and ART-Pi2 support
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Lee Jones <lee@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, mfd@lists.linux.dev
Message-ID: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0043.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::18) To MN0PR19MB6091.namprd19.prod.outlook.com
 (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <178627010892.52856.15085663518220997159@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|CY8PR19MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: d995c5d4-7bc7-48c9-cbcb-08def5fe1bf6
X-Microsoft-Antispam: BCL:0;ARA:14566002|4140399003|25010399006|5072599009|15080799012|37011999003|23021999003|12121999013|8060799015|19110799012|24021099003|51005399006|5062599005|440099028|3412199025|4302099013|26104999009|10035399007|40105399003|2607281247196008|1602099012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hrED5UEuzRIJJQxeEcjnuN1dnVvhLbMyM2c4suBeD4pspEyUmNe3ImO2GUS2?=
 =?us-ascii?Q?ITF1ZIyq+LGIvE2QiPwGMf50VHgSgNQbvOAS0raKjNulgC8JHXAgYNWJc8qT?=
 =?us-ascii?Q?5e7p2/E5wJu/zDTwptj5SVhnX7dtcHvm4HENQ0vbvJOOoyDXiXVz8HanHYZ0?=
 =?us-ascii?Q?mXzB5yrFYJRnGZ9MNs6ijL3Y4At/6fO8LsYg+U8eONO1DlqGjlwQvHv0iQAa?=
 =?us-ascii?Q?DSYeyrqqIseALd/ns8PiKkHeBJX4+ow+PPhck/N/syZm7IJ41QCF55hCH04y?=
 =?us-ascii?Q?VxmArs32JcnNLleYOxRGHfl6LYtaQyKNp3JHwJ6UQTDs/3OyTy4GMA711Qmd?=
 =?us-ascii?Q?MD8/ZMaMshFftjjEG7WlzSgZuvCpBnd1cMemSSP7y/q6kPbTFaTaPNDyzfnL?=
 =?us-ascii?Q?86Ag3jqW/WB5MDBfgQC00Rj95frjinAca2MYNBb2E4KRpqx7Sc+ruAIAsleX?=
 =?us-ascii?Q?bEMxqIu+wHmNE/ex4jZPiIfpv5yusXq3y5432nqiuGX02gaUlFFp6BrxC0uM?=
 =?us-ascii?Q?5UsOolsauPAx5Oa1aenh0U4qgB+ckMq1gW3myy89ysTA1wZwPiPiNDLWfy8/?=
 =?us-ascii?Q?WiY2s6QY3nhQQQebaQj5Djo97mh5+I+6sV4XFhjDFefvrN7D/ITYUph9c6/S?=
 =?us-ascii?Q?zxaeomilqZxxn+cNws6sDqMjAm7jvjjC6zAXaiy088vqTWwbhlWFSi6TvKjs?=
 =?us-ascii?Q?zznTOuPucSZ0IY7nALVidOYid7c147VuDqhdvYfMsTr32XUyZPObSbM5Bcq/?=
 =?us-ascii?Q?GX4SU9c2YGmJxiPtJ1A5QlFeSzcZXen83HEb16FzBXye0C3ObdGe2BGumXla?=
 =?us-ascii?Q?VC9eL63IE0kY7odAlC4ycwllReEAPBEfK7n1x9S+2xkv9pq8lSlvJxteJTYa?=
 =?us-ascii?Q?ubEE8bDUzxpBHSlSthaQEWH5TPE6gTC4SJjv4oDxr1jqvVDSBS8f9ZsYBJsK?=
 =?us-ascii?Q?TVWRQjguGfldHPXEtV3EJFIgTxFczIi4cJFtPwKabcANl5nr6sYoYxsr9hCt?=
 =?us-ascii?Q?Tx4pJ+OOppUxAuWLwtZdrtDBolIfd83fzIE6QSTBLQg50xd5jvHkwQ/RzNrx?=
 =?us-ascii?Q?BvW97L+DmqzS+T2JFTdq2pGtP1zxbOVWjiz4TaAMIGksnv7XEQ68H628fw1U?=
 =?us-ascii?Q?hHR8wVpGD4c6?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vU7luos3KL55cjVXTIUBuGqU7sMYIefA5JXOPvyGp3Bo/pX5O75tB4Dl9XqY?=
 =?us-ascii?Q?S61/yHyM2aGA6Ky+C4j21VpuYVV9Yuv8Ly2T3c3JLE9wMFSJevrPMnxlA785?=
 =?us-ascii?Q?dLB17COPAmCbMFGsf9wAT+Mv6949ZWT/sq56hi/T0/+J55cMgNEWJ+83agCL?=
 =?us-ascii?Q?kALc8O+4mZ/RU2QjtgB0SwMZ8IzQp+JcaPAFFVhc62IpzsKBcqP2pgrK0ZK4?=
 =?us-ascii?Q?+2jHcgEqeauqVCMFwCW9gJB57EJzbLDRabYPElhxhYUEcimvxNDRjUXEtIIw?=
 =?us-ascii?Q?+CvwCxdQ8BgQLyviHMSIbrSGVNtnipWvLIqdZK1j5IOQfh3KCwls9w4biBcm?=
 =?us-ascii?Q?yqFCxnoG4F25QaxEIaaQziRAh+iFUZF6Oq2Ut1/hBFw89rTmWaS7VdmW5hqC?=
 =?us-ascii?Q?6cLWEDcK9O0zAk0bcFe0/TeJvGa3EoN8YrDxMc4JH7b4TMHNTw/TKyV4n3as?=
 =?us-ascii?Q?9ahRwH+Jn3B04HYgDbQ8EQf2L6rQGpg87OnRAO15eZCTjrdtCU5Mi5XxkDML?=
 =?us-ascii?Q?2KV7DqkPW7TdPedvwDllZVPDR0Xx8JRyptR0f0TWANyYNykvZ2xA14vJ2vVT?=
 =?us-ascii?Q?wpxqFk1RylNG+or/weeJ4unK3PxWICwD78Hon0q3cRND9WunK+8uk50AnqCs?=
 =?us-ascii?Q?CUGDoqL+Nk3xtXsqsxO12Kr4O/8ertt5ZTJIFZE9Kdjv+4aLlKKDqEiKKMVI?=
 =?us-ascii?Q?UNyPsZAF4NgZLcGeSDOGZevUwfsx+kQmvOeR5WhKUgtf0A9umIwjRqJOmqj4?=
 =?us-ascii?Q?xO5qg1dsdbMS1OfKHO3nQa2MPX6RIBAPRKQ/sWbT8pVFJ8SAQCX3mCw0NNFZ?=
 =?us-ascii?Q?j5ked8mMlntCwHhACwM8ugN4S8am93SJ4p15jxR6hvp9bed0zdyuNUZKNJIQ?=
 =?us-ascii?Q?90O+LwlCZzGVdEhP0WM8cHEbdYXLVXk3klo7pqGsy2J9mrCTiCVhCJ6BrOGe?=
 =?us-ascii?Q?Ym/QJwe5a58wS6W/qBFDhiS8NPDf1MnEfdQ4dCItiZrncq4RUNKIx1Yr84vQ?=
 =?us-ascii?Q?pTYFcxoy/dhQbIBcBjmIjETfLF3r1L4AD/Q0nkLQ9KC7FxElST65O9o/66f3?=
 =?us-ascii?Q?HlF9WnA++9JO5ey3AROQuGzKgRIus/vlLhKe3CG7OyZUECaKkOMHY6NSpieH?=
 =?us-ascii?Q?9HSrEhwGJVChRNKTF15hBMj8QKNqd3FoASKTL6IxWzA4iuQ3yHP3W7DWUw+o?=
 =?us-ascii?Q?f8IxWcO2ZHN/Hmnj4O8ylf4KlkNNL+ctWPtkk/5BuIFNU63p/COZS/Y9OVJE?=
 =?us-ascii?Q?6sUpEygqx1NsWDs+NcgLbNlLIhqtq4OQRdlHdRckedjAMWRXDSBJQIm+QJyL?=
 =?us-ascii?Q?AVjiBw/xpwPh6Fqn8ZrHd1ZaVWO3qcx97w8WSZEDXgE2BS1EJTnp95EshQzx?=
 =?us-ascii?Q?N9dTEhpjaanS65Rga5MOpz94ZPMupxEFxSfSFW+1jjTwicRs5A=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d995c5d4-7bc7-48c9-cbcb-08def5fe1bf6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 10:08:07.4801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_030814_450892_E9F59D14 
X-CRM114-Status: GOOD (  22.32  )
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

Add initial mainline support for the STM32H7R7 and the Ruiside ART-Pi2
development board.

The ART-Pi2 boots through first-stage firmware in the STM32 internal flash.
That firmware configures the PLLs and memory interfaces before Linux
executes in place from external XSPI NOR, with 32 MiB of HyperRAM used as
system RAM.  Reprogramming the PLLs from Linux could therefore stop the
instruction stream.

The RCC driver intentionally reconstructs the active clock rates from the
firmware-programmed RCC registers.  It exposes the resulting SYSCLK, bus,
timer, UART and SDMMC clocks, while Linux owns only the peripheral clock
gates used by the initial device tree.  The same RCC probe registers the
reset lines through reset_simple_ops; the first reset consumer is SDMMC1.

The pinctrl driver covers GPIOA-H and GPIOM-P, including the AF0 trace
functions described by the STM32H7RS pin-control data.  The board device
tree enables UART4, TIM5, twelve GPIO banks, two LEDs, the user button and
the four-bit SDMMC1 interface used by the microSD socket.  The socket has
no card detect signal connected to the MCU, so the board uses broken-cd.
ARM noMMU selects DMA_GLOBAL_POOL, so the board reserves a 2 MiB shared DMA
pool for the SDMMC internal DMA descriptor and bounce buffer.

Changes in v2:
- clk: register as a builtin platform driver with a probe instead of
  CLK_OF_DECLARE_DRIVER; switch to devm_of_iomap()/devm_clk_get()/devm
  clock registration; register gates with clk_parent_data; drop the
  unused slab.h include; reverse-Christmas-tree the pll_rate() locals
  and add the missing blank line (all per Brian Masney's review).
- clk: register the RCC reset controller from probe via reset_simple_ops
  (select RESET_SIMPLE), and give the RCC node a single
  "st,stm32h7rs-rcc" compatible so the generic reset-simple platform
  driver no longer competes for the node.
- dts: clock TIM5 from a DT fixed-clock because it is initialized via
  TIMER_OF_DECLARE() before the RCC platform driver.
- dts: use the pinctrl "ranges" offsets for the GPIO bank unit-addresses
  to fix the kernel test robot dtc warnings.
- Add the STM32H7RS files to MAINTAINERS and expand the Kconfig help.

Link to v1:
https://lore.kernel.org/r/MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com

Tested on an ART-Pi2 with the exact kernel from this series:

- booted an XIP kernel from external NOR to a static-FLAT BusyBox
  userspace;
- detected 32 MiB of HyperRAM;
- used UART4 as early and normal console;
- used TIM5 as clockevent and clocksource;
- RCC bound as a platform driver and registered the reset controller,
  the bus/timer/UART/SDMMC clocks and the peripheral gates;
- registered all twelve GPIO banks, both LEDs and the gpio-key input
  device;
- detected a 59.5 GiB SDXC card through mmci-pl18x, then wrote a 1 MiB
  random file to an ext4 partition, synced, unmounted and remounted it,
  and verified identical SHA-256 hashes before deleting the test file
  and unmounting cleanly;
- built the target DTB with CHECK_DTBS=y and passed dt-doc-validate for
  the changed bindings;
- ran checkpatch on all nine patches with no errors.

The test kernel kept the Cortex-M7 instruction and data caches disabled.
DMA coherency with the data cache enabled remains to be validated
separately.

The only dtbs_check diagnostic is the existing lack of a schema matching
"arm,cortex-m7".

Liu Changjie (9):
  dt-bindings: arm: stm32: add Ruiside ART-Pi2
  dt-bindings: clock: stm32: add STM32H7RS RCC
  clk: stm32: add STM32H7RS RCC driver
  dt-bindings: pinctrl: stm32: add STM32H7RS
  pinctrl: stm32: add STM32H7RS support
  ARM: stm32: add STM32H7R7 platform support
  ARM: dts: stm32: add STM32H7R7 SoC
  ARM: dts: stm32: add Ruiside ART-Pi2 board
  ARM: stm32: document STM32H7R7 support

 Documentation/arch/arm/index.rst              |    1 +
 .../arch/arm/stm32/stm32h7r7-overview.rst     |   28 +
 .../devicetree/bindings/arm/stm32/stm32.yaml  |    3 +
 .../bindings/clock/st,stm32-rcc.yaml          |   73 +-
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    |    7 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    6 +
 arch/arm/Kconfig.debug                        |   12 +
 arch/arm/boot/dts/st/Makefile                 |    1 +
 arch/arm/boot/dts/st/stm32h7r7.dtsi           |  261 +++
 arch/arm/boot/dts/st/stm32h7r7l8-art-pi2.dts  |  100 +
 arch/arm/boot/dts/st/stm32h7rs-pinctrl.dtsi   |   63 +
 arch/arm/include/debug/stm32.S                |    2 +-
 arch/arm/mach-stm32/Kconfig                   |    9 +
 arch/arm/mach-stm32/board-dt.c                |    1 +
 drivers/clk/Kconfig                           |    6 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-stm32h7rs.c                   |  521 +++++
 drivers/pinctrl/stm32/Kconfig                 |   11 +
 drivers/pinctrl/stm32/Makefile                |    1 +
 drivers/pinctrl/stm32/pinctrl-stm32h7rs.c     | 1849 +++++++++++++++++
 include/dt-bindings/clock/stm32h7rs-clks.h    |   32 +
 include/dt-bindings/mfd/stm32h7rs-rcc.h       |   11 +
 23 files changed, 2985 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/arch/arm/stm32/stm32h7r7-overview.rst
 create mode 100644 arch/arm/boot/dts/st/stm32h7r7.dtsi
 create mode 100644 arch/arm/boot/dts/st/stm32h7r7l8-art-pi2.dts
 create mode 100644 arch/arm/boot/dts/st/stm32h7rs-pinctrl.dtsi
 create mode 100644 drivers/clk/clk-stm32h7rs.c
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32h7rs.c
 create mode 100644 include/dt-bindings/clock/stm32h7rs-clks.h
 create mode 100644 include/dt-bindings/mfd/stm32h7rs-rcc.h


base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
-- 
2.55.0

