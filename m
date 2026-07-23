Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFF1C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 16:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Subject:Date:Cc:To:From:References:In-Reply-To:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7S+H74U0eS6zx/1Z72Tg938Bc7cdIEP7qMgcb689OcE=; b=2XRFdonG5RBEIK9ZhnnPM9p909
	jNxD20Hn85RM8gqi2eZ1PaJJ5ei24gL597fafEcrmDonh4HWFEhrxs85+LE1yHXbc/I3lH8Z1ZWBn
	fmSmOlUm+qIO2Wjn7o1/1ihT/ghalAwmaXXfW2xvRpTIU0d9qEtFay5O1yPh5ZsbpWSk4AYH/JmoT
	W2dgMPh3sMXeGbLyZSN8k66y94EEtAG4wvX8y1nMmp+GU1ECr12I1JwU8ohYE6QvMp2NMuf3DrGjT
	jG8K0csM8d6L+1z18SOYWrR0hV8JfF8YOgsVPRE/+SB3FVdpIx1VFxCDYiknWULINTCdKrykPvFd/
	vzLvmaJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1UX-00000001MIV-0v5s;
	Sun, 26 Jul 2026 16:14:17 +0000
Received: from mail-westus3azolkn190120000.outbound.protection.outlook.com ([2a01:111:f403:d116::] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1UN-00000001MC0-3dOn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 16:14:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkcB0pRYP/mu1JbsqYywITw/ZvUBzf/n3dkgtl4rIWIkcOcUMhJs3Om9q2kxzkQFTtkwd0wpfoTRO4leOigXandSQ6KaBA0mC7nLCA/jQ7Cws2Px58JB17hMqlYIwdX+gxns9+9cd9x1elUCEAHUNFAkLwuSBOlUhuRfjOBrCF43T1Q5hTboWV+g00y7csMbzOK/HucNALQ+uIzpKruYc8CRDpR7jTLKuab/cutB/CZDXAAYx8POlAeZ+rcXCNtpAC4GHqGAZ920HnglU6EnDgdNab59MQ92RxfN4Wcm6SopF6XMlqWRbm0o/xvhVal8OPhtc0i4TP2I1JfResI+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7S+H74U0eS6zx/1Z72Tg938Bc7cdIEP7qMgcb689OcE=;
 b=fWdEAya9XO2Zy7K+2145r4ZkrEloVkYnw93OjvvrffmwkaQztfs5gTpYyUTdDaZFaD8M0exr9Nxm0i6G3X/QDOFSY+ZX2E+WPMFpFx4j690Snobi87wuurxORqBLJYyev58IGkLP7BBCj6MuDzHuHZL0PmgHEFPXGNvTburLzIqbz7GRjjzpUaFp7laOSLznY1JUvQm1iNg6yFdaAXidaIzy8+vwExkHMPKLDLTG81+LtaCP+CEGwNmh5KTBH1fLAiyC2VunVJFsRhNfcfiw4lib40dqWdrc1dSJxWOnK4uIHyElSGmOCVC8HeeAvHCTxEOr11G8z47isn+mOylfDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7S+H74U0eS6zx/1Z72Tg938Bc7cdIEP7qMgcb689OcE=;
 b=O74NebOa2RKqKvzaIfg8d7U16o6rLTskfq+3GJ/e3ItdkXOakFTEvqOYwDBqndBYZ5A1IV6q2fUhalO4cmJs4pmsPDMJLPc6u/J7XrtzIKFL282zgGk7L0ZGbO3ansfhKxEkoRRCTw38Wm++uabIzjI0zlhiUxSJ/7YfmrwKP6muQBf4FGMiRvKggYFQyzsQj9Qn0/8UOFd43gEQyPYbctlypsvLakbPm2OpRMZO/IkUnaHAfTMKAIMAKfOdoCp3wpmB98uqdl6WSpXSiiGW2kNGcgOmaIZb1Ex7Lh/wFWrBpzAluWHV4bf2Fs0Xttl/bKCzY6lqV3hInkUrAle/CQ==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by DS4PPFA96D1C9B4.namprd19.prod.outlook.com (2603:10b6:f:fc00::a44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Sun, 26 Jul
 2026 16:14:05 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:14:05 +0000
Message-ID: <MN0PR19MB60919897386866E4905BB54AACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
From: Liu Changjie <liucj1228@outlook.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 23 Jul 2026 23:49:41 +0800
Subject: [PATCH RESEND 9/9] ARM: stm32: document STM32H7R7 support
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::11) To MN0PR19MB6091.namprd19.prod.outlook.com
 (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <178508246829.28466.1107059064707652581.artpi2-resend-9@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|DS4PPFA96D1C9B4:EE_
X-MS-Office365-Filtering-Correlation-Id: c20e2d04-d21f-4e38-2f66-08deeb30ea28
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|2604032031799003|704163111799003|51005399006|24021099003|15080799012|16051099003|8060799015|19110799012|37011999003|25010399006|5072599009|10035399007|40105399003|440099028|3412199025|26104999009;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OF9vsELznbXRT1talszFTIljIYu+jeIJInXslb0wDTozqR+Nka22QSKnPppF?=
 =?us-ascii?Q?PBLWKKAj2Jlkuxuyr1wgeStRx0yDxxss9G+ADUff3AKvD+pnj6pScsqj0m+D?=
 =?us-ascii?Q?IQOaFW+MYXRRqJJFnf0nwuGxZ9qwUrtb4a5wXjpnpJkV4T8k1qZvvDPYbxbr?=
 =?us-ascii?Q?RwphZST/kAU5mo0M/uPHQfLgKHRnpXXgzREdAJzT7P1tCb2gM9zE9vQJk8EX?=
 =?us-ascii?Q?8pKtSeLo781CmjNay1Hg1Je2nI34KBRgTXEmHTYCXLTUVgXzefX8aYMoa/xx?=
 =?us-ascii?Q?7VEodjCiq72tUcfaEx0EUedtBsb5Z9Sqk3FwM/dmpzcwmUppgXBbj1ir97Gr?=
 =?us-ascii?Q?lXrLcqcr0YUi6LsMiZWL7edhFAPUGVEN7ElL72Rqh5dbkGtJmNQe7mI1+f4q?=
 =?us-ascii?Q?ITl8MOMeYqN7AcwQoECm3wmSXP8vwKPz4/NSbMs517kSBFiWbtOtHLMxKOhf?=
 =?us-ascii?Q?h949NjP3IuTKepILR8R8mzN4s1lSBjJVhX5LTugeT0wqmHz4PLRfvTdmU9+8?=
 =?us-ascii?Q?FsMZQBNxlcJab7MnKxFLVLY715wCg+MvSR8ONFhSZyiWbtj54p7N913tUGR9?=
 =?us-ascii?Q?ZWBTVMp8GrgQBPLZgMSLk/sDmfxjXrui7wuJSr7NrrcRDPZaViiy+sxw5Zas?=
 =?us-ascii?Q?1YPjVkhP908xuHM5rA1rCQ0ulOQE3QT740NzJuJCJSEm9fqNZHFZZyGA2roo?=
 =?us-ascii?Q?6iCvPifgS39c2xuGum2cC232ZsEovZkqt8Okkn2nhRttmTQDp9qXujvpagWU?=
 =?us-ascii?Q?GvI9sXO0waGZ3eg8R7RPyxK4UU/241fF4bN+iRT8nfaNNCiDq2lrCM//1j2a?=
 =?us-ascii?Q?99zYdfr4zCz/2x04erx0+CE9cRZRu6AcSCHSzQNBEhe/uGoETDKwz4dIyzKd?=
 =?us-ascii?Q?NnKYpIadTsHyMGWxVbUda35Z4vu+/i78lITZLQj/lCfdgf68xMpwj7fPmjjL?=
 =?us-ascii?Q?hWJ7215mbhZl7iGFhISpB1Cj7NCVRUYyJYQcXt2Qy6097VK+9WvUG9N3jcq2?=
 =?us-ascii?Q?HnObbRR1qDNJv3SoXz8oNTiBjCtTPT3vS5J/XLkDXDC01oJrKBnZNHj8PIgC?=
 =?us-ascii?Q?YL+XlQ6f0MhoDyy4Y926CSDutLdtVIJ3T/RfdmVCTSD1HIQ22QKlfmFCn2Xz?=
 =?us-ascii?Q?cL1fj46Ow6Fa?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KMNttk5MEhP8Q10KqrmgeNm+/k/09xERCZVl4YRX/SWslbV2y6c2LWFkdkMm?=
 =?us-ascii?Q?gUbH6bSZC+0oEP8MfSy7AAtqH+zk3M2D1usGtJVdWWjTgLTiOa6Z8yfeemgW?=
 =?us-ascii?Q?19ulZtD4+kYdLqb272pKTuf3Xpw7l2sZTRqf5QY1tRFed8No4aDL/gFuESkk?=
 =?us-ascii?Q?wuvDA/wbePnL1B/LIBPa4oJfNCeoAl7JBqHcoagUpG50keZaLc2/bINh6/5G?=
 =?us-ascii?Q?6a3EfuVs+JRMQbSiViMKl1XU48+51b03m0YKYxN3UJzIB8IvUwFPpoxCGV28?=
 =?us-ascii?Q?QrXrH3ZyMutRa5KuvtN10HypCXrcATsFMUwyewxXly9SGNLgH3UEk6JeQaWR?=
 =?us-ascii?Q?1CysK50+rHZM5Bm9JPEUHOrIJQU0OoeFG2Xkm/NDbQYhwd/A3rP530Fj5bFG?=
 =?us-ascii?Q?gl6QlqGZ68oJ0n5qXxTv1u09o5N668yiGQuar1dOeko5McjNfarGuZne/rj7?=
 =?us-ascii?Q?NN3GniqybU/E/osCVnJK7QKqMlcM8pURPC+JXSXFTW/lxAjUrBkDP9q/Pamn?=
 =?us-ascii?Q?0bSXwl41SAZnCPJJQBj99p6DxbZYySQ2yJV6PD/0Rzg3AH0g9Onat2yBx/lF?=
 =?us-ascii?Q?70S9efzdB+gKTkbZgxhFMJbhl0GijHfyT6ZKEvFQyLvGToN/pSb2PoJ3q/Zf?=
 =?us-ascii?Q?xEcQi81mGDX4rm/KZp0ePcUkUKs7O61yAgH2gt3drKlOVNhD9LvZqlDxnhy/?=
 =?us-ascii?Q?BTfJHw5SiwNgUdwj6BkupmsvI5lNPQeqehek45nxmtwLHwcg+UY/r25urOnZ?=
 =?us-ascii?Q?bHZp+ZUTKF95jk1+QtgB/h3XsMW5IafLxnCOd1++Qaagb1tUxVdeDXfa+GUb?=
 =?us-ascii?Q?DjuOLaBQtiRsHI7PxFCX0Uik0KCDcziiPEjDBks2DwM5DNYB8H+nyTij+0gN?=
 =?us-ascii?Q?I+mmP9Uyqjw4MWqKzMdcJGVTcmCqwx0IhaRTnwniFmfMGbyMm1wPiOGgfzhG?=
 =?us-ascii?Q?rUbuJAI8Tut6PyX6nt1DiXNy3JNtt8SO1CgSn7f5r6PU8MMbbtDTl6iHg65b?=
 =?us-ascii?Q?lC57zf6/ADLTKpTP4EaIAccq5JR/fijW4zv7Ju+8D1bFAZNU15+pcFLc1mQo?=
 =?us-ascii?Q?8G4plwNscERk3Jsfwk6/vDgWuX1wvimfPuo93kguHECx2bviiIxIaduwDFfg?=
 =?us-ascii?Q?Aisp6ihyFAnDqCIHT9tPrKSu57eHvpD6afepHn7BJLa8mho3xdsYYl8WIyrk?=
 =?us-ascii?Q?sbq6mRrCpmne/Dzpy+BDvPZtguyjLecSubAhp/MRgIJUgE8az69l1FBJWx7B?=
 =?us-ascii?Q?zweB/l26AeoQ5nnI7H1/VPQ5NktV7J9Tkl64YBP4VG7vEuCTDv7193raOcFb?=
 =?us-ascii?Q?btQcsx3TEJJfGvVMV1lx/kDLxH+lx+6iDNpHO0Dl11rignBEmbc8NYSzCwlo?=
 =?us-ascii?Q?iL14ZnZxXSB8o3OMZf8OLsBoQvJSgCYlKcHJoZeJttpc3hP2bQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c20e2d04-d21f-4e38-2f66-08deeb30ea28
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:14:05.5545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA96D1C9B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_091407_900675_F88B8EB9 
X-CRM114-Status: GOOD (  11.53  )
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
 Documentation/arch/arm/index.rst              |  1 +
 .../arch/arm/stm32/stm32h7r7-overview.rst     | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
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
-- 
2.55.0


