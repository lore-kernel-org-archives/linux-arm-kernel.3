Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802D7C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 16:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Subject:Date:Cc:To:From:References:In-Reply-To:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7S+H74U0eS6zx/1Z72Tg938Bc7cdIEP7qMgcb689OcE=; b=SPW5BpsH2C0ORFzy2sNGJg58hj
	BQOluYXUZc4qdb+hd/nRNuH0xk+pZ/ZcmE+0ppuJhu48TlIPna2wY/JyyuGXEOUWd0GwyaxBSR/SY
	5Aksb1nmiQhUjwoXmZ9+S7ZQdJFdU326bm/wZchkVdGmWtsukBcrk3C2pjLiY/YoOaXOmrhLVXWjj
	cG88bR3H4ht2Phbf4rLlKw8MAvVruJAf4dRfMNo/OJqr9UuRv2iLtYnEid2NTLtGEEQD7CUzbccmS
	GnBxCqepuOWcQW/vicpUJjbrJYEQDEI97JFLgb9DG/zHfiRZIIBUUF02seZxhlWbFrx1qavANPRgJ
	xmGXqIpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1Qg-00000001LEE-3Twt;
	Sun, 26 Jul 2026 16:10:18 +0000
Received: from mail-westus3azolkn190100002.outbound.protection.outlook.com ([2a01:111:f403:d116::2] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1QX-00000001L8p-353V
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 16:10:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMbwaaQSeq8vWXuz+X6DqGGmY9FQ5AjyK/VIQqHaIps6HYYJhaC3IN0pv+SncOQUNxbzPpHDmdymcnJv+zE4GlHvrakLDL11cxXSAqCBcz55773Ed+vWOsMqbCBDBAiGBKgaDJWKEcUDpPpHxj/+AiDbqFqQ0HS1CxrGHKv9RvrQIUuLAMG4/BOaacb9Pa8/EBQq9YQm1qCNMw/iCJJTwJN7oeK6hIklcRN+vQG5eS61y4Nx7PbdZoaKMN+ejIy/K3Y83cy7V9sOO8GW5uxooxREK3kmeljJ8PReYUCV67/FHMnOXBjuwM6Ct5tkFU7OWhPhCsyN9FyS6vy7zhllEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7S+H74U0eS6zx/1Z72Tg938Bc7cdIEP7qMgcb689OcE=;
 b=ryBdp9STiBKHdCvVYWK9T3CHde0CWRJQIcc3RBofX+zXGaNgChzTpRWeutJ+X0AVnmFsoAnc9HUo+yuvPvnV3Lalr+GbSqBMRFDj5aD0LWgPNDYHgRTrl2V/S+0v+hXTsxb9CmfOXKvTcU4rWQ02e7olmuUTjvC3+liMYJBXmfK8gXtcQPC6G4g3v0zw8W3vQ3UdHLNq2ShkLMaBup8YaEJuZZP5g635EtNLBB2/FySys08/gqbubDR7OC50ZjAZKuSyRqB+Rz1rQHy+plY2fV7nzXqZWK61JGitkNfdu+Qt6EmCQM2pg+cjwNwvQPw8ldHBltAo2748wmgcKXO6Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7S+H74U0eS6zx/1Z72Tg938Bc7cdIEP7qMgcb689OcE=;
 b=JPqxeV1ooySb44FAIUc+EBcoJiKUUmLvypB+WdXmQ0phC1WjwvR8CrWE5Bkse1u70xhhozBkGnGtyessynqTaEOPkqXIsrVcZiWpjK+t2A0tQibU3IPARmqPfzahHHNENESGD2xrJg91bKr+UMehnuAl3tpu/vByCDHG67L5D/3zszq/dPOfcTOE78afj/PRJ7iNpHLJiw24+lRMvzLsaBGUlfTEnAD7K6+7q9MgICOx+ztcMv2dytMtrEBYVdv7mJ2UDFOBj6HL9tp8E9YsyjGuGPRbzvUHYYy/b00+paZrexvj41LznDv8yOjyyrxlMCTr84FI+Wu0Yj9MUj7fyg==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by SN7PR19MB4765.namprd19.prod.outlook.com (2603:10b6:806:100::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sun, 26 Jul
 2026 16:09:56 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:09:56 +0000
Message-ID: <MN0PR19MB60911DF8D98BD23AB0B8DC2DACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <cover.1785080950.git.liucj1228@outlook.com>
References: <cover.1785080950.git.liucj1228@outlook.com>
From: Liu Changjie <liucj1228@outlook.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 23 Jul 2026 23:49:41 +0800
Subject: [PATCH 9/9] ARM: stm32: document STM32H7R7 support
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0008.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::9)
 To MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <8d4da4470ca02a9c5447c16c1a7e86b96c2aa49d.1785080950.git.liucj1228@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|SN7PR19MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c0dd40-3891-40b1-1cb5-08deeb3055ab
X-Microsoft-Antispam: BCL:0;ARA:14566002|16051099003|51005399006|24021099003|15080799012|23021999003|2604032031799003|704163111799003|5072599009|25010399006|37011999003|19110799012|8060799015|3412199025|440099028|26104999009|40105399003|10035399007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rDsE0MfMnTpmSBJx/36baJZuvoe5zbvo423t9gunWa8UVsH++CICyG0/PdC4?=
 =?us-ascii?Q?OThoR0yC3cQ0ItuMVWikjjucP18KD1ykBCu0yqsY/ds5BpwYDglvJerXs6kQ?=
 =?us-ascii?Q?gvrxe5myU7hrVE9oVsepZ3IvB10UhmbFG7lF7NiYChVdlTIHpU/DilYLJTwV?=
 =?us-ascii?Q?UGyH6Er1I+uENV8dQB6lnsawi3gih0/45jALKtMRxXQpe0jE1jWhUNQQyrjL?=
 =?us-ascii?Q?HZSCJ9hw8gRLDWyixJyl57GygAgiHKHA4qv8R/NUQgnPD1JeM0QynGihCCUT?=
 =?us-ascii?Q?NHukWA25Jk9qem9dZCUsQldbQ66sJQfPu04XDzUi4ijSw0BR+Sp1uFZiqiYC?=
 =?us-ascii?Q?P9bHBZ9HCjt9pgn4yQA1w3HUzRPE+ENpqRWaKZ+qDDaeqEmeZ8jp6fCw33yI?=
 =?us-ascii?Q?WF5qcrjoQEqEcHC7bvBqsS6CJkT71yqF6JwH8nMzT5GoT9/G2/xMBXSFpdnr?=
 =?us-ascii?Q?HsJBQHPwV7UT62FLEpZCESYkB42NSo0Zb+q0rsXUSh0bS+zXIShG03MUnkAg?=
 =?us-ascii?Q?HEdXa1GB/lx43+n2kKe+rkutMasnI88xNqpc5nw2zU5KEfewNzzoC3qle9K7?=
 =?us-ascii?Q?Cv1VD/tN67qrP2noat8HcS3gHwf/quZh/lFugEAFr1G/L1Ae67ZK4bn2CF5s?=
 =?us-ascii?Q?N2jh+Ih+9vN8iPJYRCIRozmsUrJABK4jM13MoBEaKGIXcIdfIMt2ynRp76Mz?=
 =?us-ascii?Q?z3HgxsJQtmwU11vqn9Ww7DcujY1yjJGoLad3L4sL2Zh6OyLh55ZpCDVyrY4E?=
 =?us-ascii?Q?EcDCk1VPOIC+G8mmfgOjqK/eDCoaXgxVqBBTuOHRqZyWM37TPCcGZ4NBRzsd?=
 =?us-ascii?Q?U/fvdvhtDlLtQ5o72CX2IvCvofveVkc3syKMhvDND555jXXwOELVo598lfdG?=
 =?us-ascii?Q?KifShpQXwgVTVCUSRvBDFb+Uo0KgyIXegfqy5ePe2EVeti3gcE7qSma1ep32?=
 =?us-ascii?Q?SIPpWx1mEyudlYjmQMShXEO/U5lyv4f4e9ItM1xpVOGnvfQ84eeLfH09V9Cn?=
 =?us-ascii?Q?uBUaQ/+oWD7ME5XfEo4a4eS16Zh9ZGjJTZLofapaj2AfGdcABaXE3RJK8EB/?=
 =?us-ascii?Q?5GC8GARlRqSFCneFUXakPTnJIb2+0YKGVPz7N+FQgd7b2y8xjqodYCRaaUyL?=
 =?us-ascii?Q?O4zda0Ib3yhZ?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DZsdqhAFC1YBbzZ1yT2tYzF0XniYpmtGuwY2v2iLJykN0Hh+XhWXkXKmH1h8?=
 =?us-ascii?Q?bRkgZXj3+WvIEBYHSUXvYM51NLCRdeOnyvInV4h01gjdOSFxAPMdEAz0mbZ/?=
 =?us-ascii?Q?QbZx6vsM2vWbWT+stlSXyIkUwCmXKmVLlf1b9hWZ8n8/TPomg92UIQp9/aKU?=
 =?us-ascii?Q?WAQ/PHyjVlNlevtAfBp37c+IbpHx2L4xHWOYt8keJKm9+MbnY5VGvOHHiYe+?=
 =?us-ascii?Q?TFQ3z3C/6YieFve2bRXfNSRdx2h5slIRwo8MnFL0p9FbnB99+PQP2cI2X59i?=
 =?us-ascii?Q?K8GRsGViEbZCcbJDT4GTxV25ZS8BMLzhTLfPO2APl7fq/tLexXryVAX6dXey?=
 =?us-ascii?Q?RFGxoBXjQ1RCEh7IDGUM8FwyVL13JIMJd23+JowzQkopVOm4cwEjwHlsRUJ8?=
 =?us-ascii?Q?kt8kL4nugwVgNCcW71VB2DRlXUWqU2isIFNy+KgIh+xUDst90RXDysLAabDU?=
 =?us-ascii?Q?QVcMnBvtbC27rMCgMoCM0PoRxR8mc/FT1/mshgIZuZUva0nvGVhqut02MC0n?=
 =?us-ascii?Q?yUnsn1ZHWhqKOgOkHebfunDY5LOg/hfu11AtY5c9bqhpBPfsi9uBawhmfEL6?=
 =?us-ascii?Q?YmIwf1dg3kvvF1APA/jQrL6GhMECLy1T8b6G80M/4N32NFMJpnz+RbsReN+B?=
 =?us-ascii?Q?gxZZXxDC1RSsMdmVSiQsSh7IX+wpc8WP2nUXMnJ9Hke4NGnwPoEOuHJtjeUS?=
 =?us-ascii?Q?MlYqMD30AbzuuRsoLYp2BjBJ502s0tlk2h+Bnez9OvAWaVdHV0iIbYBC/b79?=
 =?us-ascii?Q?/sDkAotKAF8JJwB/07Os3+YVQc17FFGmF7uyTh/ZKiUNp8jCeh1fqaywC+/Z?=
 =?us-ascii?Q?/HRS9vvrktDAifV1INVLI7u3h6Ar4GKNzpBFT+hGitz+vUsSTEgJelg82KvD?=
 =?us-ascii?Q?oQav5jjJE9w6GQiJVlHx+MQB2PlfR3rBhJVgIgaWw8lEuHuR/GDKGk5Xw7qe?=
 =?us-ascii?Q?+Lv/wl1YWRVrxiVGcsEsu3AtgxiF40HSeKNkMO5Ns6SYQV37AmKysSrTsL7l?=
 =?us-ascii?Q?fMEAjx6cKPBP7PYF7rDsgYGPgg0lSgFMY5XBWh8ndY2vDqpQcrxIdSUtYo5j?=
 =?us-ascii?Q?0BzoxZ739tTJuWuLnVd45V9f3CvsChn9DO3qpPpemQTy/bGmxxJ4ogK2OS+V?=
 =?us-ascii?Q?Lasj13AR/jvJ4HaRJy/ZVNR5h1OUa6sNaQ4Z0z9rtktoeFG62k2jeG/rNTHd?=
 =?us-ascii?Q?0w9UP6caib1Ckp59WzRf+crmEI+0rehTtFJp4e3OzpjkqpeN0MOOZ9pMWAhr?=
 =?us-ascii?Q?rDyphAxBW7DRuvBMN15/eqQ4dkn2EYvHY0YwhPRoJ7adj+bu1Fxwv4Xzh5s6?=
 =?us-ascii?Q?0IbfeKx/XYg2dt5KzDonVE6rm5Ot5a7TG0YCWKL9Zor8IBCcw9cfU3Bu1C/6?=
 =?us-ascii?Q?vRVkuMfU0wrhK3WkHv519gyQwQrXH4sME8JF2jGhUSjH/HXoUg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c0dd40-3891-40b1-1cb5-08deeb3055ab
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:09:56.4308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB4765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_091009_799640_B78F7A17 
X-CRM114-Status: GOOD (  11.65  )
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


