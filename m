Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B8ACF64B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 04:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZRuKKPQrvyoqJHMmbDvPgvhUsyjIY7/ZU0Kx97WZss=; b=KEcso5qD06P/cpX5zTnzRxzLer
	KpeQ658Pp8fPqvFVFnQI3kNxGY0oGVw2BZYdtO4CmrV8/fthqgkkQUVd5UBm9Zc3deoJ3ilu7QoaH
	DwHkVEbLO7M2QY7R2hVr37b/ZD0WxR9l8Nk1ekff00U+LcrGFCq/bihCBRLb8JxtGxaaaoEPdvAsH
	7UEnkvtG+DWydgWsGCrLo1e6o3WeM/faiGoez5DNgIx8yCCMnB7MzPkMtfyesBrbPmCk1mrY07Tc8
	XCWxSLv/Ppi86OVY1ofzKe/rkCnFzVWz+FGjzpBHyJF8EnBdxKPaPJ9MmOSrY4njVP51ojYe5gBb1
	kfRFaA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLwHJ-000000068UT-47iJ;
	Thu, 20 Nov 2025 04:28:17 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLwHF-000000068Ri-1ekx;
	Thu, 20 Nov 2025 04:28:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNMiuI8f/yMChJhHe97WXgwNbj0v29Vuopl1NMOvgHQOaKed5nr4jwitXgTjfbrEeNjv4JtZ/MWjFdHHwyWuXM/h1FMROF+3jpERoSG28lKh3TyQHAXbk/ciVkZFMvKMz9f1xDk+fyYSuulQc4SVm0L70Pg+g4aVNOHzRJA27TA/h6kW7o7kakX7KVNGq+SgwgCk5zLfOoJQbpGziLtLhbV1zXOal/aYTngO3yxODvPDcHw4i/1OxQxLz7NMtEJxb0lFHB+w5O8EW9ErdFs/WeryJa25GfGSsmBtag9nxKmFf4BGRxW0ciUSRT7R54oPGPvmiottNwnXVcgVPUfcrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZRuKKPQrvyoqJHMmbDvPgvhUsyjIY7/ZU0Kx97WZss=;
 b=vbj+yGyGL6u+i+Vf3IfBiR7u1CdoJZnMdQ877c0L321wtGLrPhJd1nj7QPhDliwbdQNzCtxlPhrODPUREMcZD64qmsCpTAi7MmiwPOZwq78qW2zWykV5prfTe7p7LRGj+iVfCYaAUSAQeLPFOvncVgBarDvyIu8qg9HU7avWRSKluzQ0p8e8tzhGTA+wiIybmX+CWEA2xoOKrsP4eyeVysxs1ktPGmnLkUlYdQB7Np22MHNlBQQDKeA9oYwbIUeKTx2bbLJGcnaoXx2h7qMMmEoiP99mHWmJ+5DXlgdzsbY1p7v1TiwPF3OzVNLFO7h3AWYSgFmXfrG2PgGAIb/MGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZRuKKPQrvyoqJHMmbDvPgvhUsyjIY7/ZU0Kx97WZss=;
 b=2p2A7K8WZS7a4PxYNGZAoqzmx23VuOXxdALWvujpg4/SvDXkAs1yMX8uZDhx+tHATVubahr7KcUbqvbOFdn58rddp9WABoWuQVa08nQqk1ZvWqSKc0EjYDqw/Sg8SRBSE1qagMcrsSdofT9/dxcv51jQ9M8CdX/eJ9enPkZC7nFvaH4BhG6N7c7RpNdWsxSJE7SVzm95O9CwFrsS0DJ0GjEtvoHQlzfe7wmZT/TCqRX3flsrL8x4MmA9lj9oCNyc0WyWYlcCylanfK2H/unY8mcuTdP1cYbAS5SfOXYVXFoPnvVzmeSU7AbD5r3p2thUDrlGJrf42A0bUU1JJgDsow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PAXPR08MB6541.eurprd08.prod.outlook.com (2603:10a6:102:15a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 04:28:03 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 04:28:03 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v3 1/3] spi: airoha-snfi: en7523: workaround flash damaging if UART_TXD was short to GND
Date: Thu, 20 Nov 2025 07:27:51 +0300
Message-ID: <20251120042753.640492-2-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120042753.640492-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251120042753.640492-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0041.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::25) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PAXPR08MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ffcd66-f025-4f3e-f826-08de27ed31c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pbJ5b+j/5aNp1XaqxEp9VkeIGZ2swCnAbh1zNaSjo8kdo69sdNZ2+QoyBN98?=
 =?us-ascii?Q?PhJo+Rg44+HQAVsQMk8+D+4G+QVX4u45iFP2sDR2qW0d3fIWyjEoyDYD7y7S?=
 =?us-ascii?Q?gEp7fVsdl8/bTswEC4TguCpzuNOJnL/5c7badBE0lHxWEMhe5duka4Pp7ViD?=
 =?us-ascii?Q?FScckLtHyAHn4CqKU3qiwcjDByYjPSb3YFehwS34ByWNqxfOX/FQsbVMLCe8?=
 =?us-ascii?Q?n2CDs1VpHOpijYwo6LZjOx89AyHBOGN4HG6O7aNgNveVogcdZVU0bRSsSHNQ?=
 =?us-ascii?Q?36Ow547v745MtjEIByvT3N/kGToswQYEMWYEDrTwiOWqDRT0lN95yORAMfo6?=
 =?us-ascii?Q?Yr1WqhSz5+zqETPxsaOBv148L2AoetcSk8UVfTkQfy4vxaINfv9jvGvUdhxu?=
 =?us-ascii?Q?VnkYnXtIlPjq+gJ47M0+gIw7btrINmz5K/CelTNlgsOBasr2zD2V08wrjQ6j?=
 =?us-ascii?Q?tia8ReaAwfc1v5pCQp0ABPxuf98nZQ4wMY7bQJPJ3m49SiNiusa4mSODaImE?=
 =?us-ascii?Q?WV14biW5HCOFYZrvg3Y3ct2yoEav3rsy0d+CqaU55+OcmGxF/BRqmMxCGF8S?=
 =?us-ascii?Q?DAoxNcTTZ338o9jQvq90/Hs5qzTFXF8q6wSZCq+74S4jZDrsBX8QbZpQdSg5?=
 =?us-ascii?Q?Q0ure89FrU0V74Sz8/jsdl9AIP53l/0ssv/JSBxF4gOrPx/Uwq3bP4GwSgqP?=
 =?us-ascii?Q?QjK6Qeeqvudg470eTI6FL3UWBGT88YB2h55g5ViUYeBoep/HH5XU8BhGX5Q2?=
 =?us-ascii?Q?B9Z25AGXcTiP+iVlnrHGXv2Ca56PTwrg53wZMKlhs2hjNBuSvaH0bti55ftY?=
 =?us-ascii?Q?kcipdskRi5wsiJ1TZ7PF050P5Hx0+7plMGZW9IWguNG6zQtJ7uG9e6kQN/9h?=
 =?us-ascii?Q?C8ExBqjhV7/xI5NZKrBnZvAUoiV0FBuhcVD3h3znQJZLCPGMapnMZhxwONQ/?=
 =?us-ascii?Q?nwVBXzGqpYgNydL5s7S3e5S8U2Jslrylrv5DhIW2S1mU2JgpWkobbKa+rkHB?=
 =?us-ascii?Q?UQshBhyM0poX4K64YQqs377C3b8mbS14y0n/ZqyWMstl1c1XD6EW/3jCD+ln?=
 =?us-ascii?Q?k3vnnpjGPv4ZBqAUBIDaH0ou+fR2Syv6qSgF2wl1NyoN2e5OFiRrt8TsqEy+?=
 =?us-ascii?Q?OnDt5GndQgqS9UNKTmPkGAOval+E8JAhJ3Lk+BDSCX4tG10sC0Jdg88nKqVz?=
 =?us-ascii?Q?A3f3bLkIrEhTS3m6dss1qPkxDDj6+52TJB+E63Quk7R9axkILn3Sd6pkZzxM?=
 =?us-ascii?Q?ydJFQkrwJWDHD6rBPDRXxFaz8zISE2ClljzvzwaqRTmYyBQ3xTgauPHNkkYY?=
 =?us-ascii?Q?nBTu+8NofSVLofSyEMS3QtDVHKevs6TpWhfMMr+Lv5o9luM/CkBrYmUAF8n8?=
 =?us-ascii?Q?7VMq/OJh55BmP7sdYZC/asbEo4x8pgOEf8uHQvGl/yU+FzX/907oXEeFYTBC?=
 =?us-ascii?Q?YH2OtK/CzotUHMjFjxlMbLANwV8sV5y5QJu/3cCiCOwPZKhZIzECE3jcYDoa?=
 =?us-ascii?Q?u5jqfEZ9Nr5v4Pj+MrqfhcVuYuwjL/lN4VPgjEl04bSfr9FO4+Vv8Z3vSw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Puv2YlTm2hAiQrUvOZ4nboywjyhMwGpFy2VuqYyB+5aC7on+leblxQNmeSA4?=
 =?us-ascii?Q?cCwxcZIdG+lWM9LpKqzAv6L43QC6yxyzErVcx6k+ObpX9uAw52N6saqOT/AD?=
 =?us-ascii?Q?b56dVKnuazezETq8iqfijLrHmC7guPY7JOYTFGPhn6OiAFv7Dow2PcCsoEZa?=
 =?us-ascii?Q?3dOWUZ35AF+gk4Tr8lN3pNdSh3J6QFzUSATFLjWu6diJHH1crIT571wGav4R?=
 =?us-ascii?Q?88P44ICIqHSLhSwp4KaavsRO4THBuphFSeODkLzbIQXH+46Xkw9awB8Z4Rr6?=
 =?us-ascii?Q?PKt+WrkONCyUgGPgp2r6MnccjgocL+ZIjSqeObdiSVeoAC+E7SysN7uVQ3vJ?=
 =?us-ascii?Q?sHmw5dpNClcXcnCMMM/sii5dDFq0+aCj9YHcyy+dRSQzSkYsK8EPSKkIMzWi?=
 =?us-ascii?Q?zpWC21vSY7u+CjVDpzm6+Zqm/frg+xFZQTxjSTMG2qBChI4WUzZiTxzcsg0G?=
 =?us-ascii?Q?YvTHzycgnRV6Gux+dEYf4wu1AQ1a9j25fWu2dOhcN181LC3X/HjTguStxprc?=
 =?us-ascii?Q?qKh9mGsOYw3RkUtR1oogIi8p6x2azzWh//VCVi4r04ikX364fsLLlne7kuof?=
 =?us-ascii?Q?PCNG3h/HHL+Ja3LNMswBuTr82CfFSj9n7wxNyEAS4tyebFbP0lW9/h5R72VX?=
 =?us-ascii?Q?7oetu1ex2loLjRyVFxJSOpq9kyB444XH933FNKD+Bcqq9VRPwjaD2oL0Vwdl?=
 =?us-ascii?Q?O8j3rZv/AY6bTX6T2ctQDg4hYQhm+wKKHdDGPcjPUETuI4HhC+Q8mjUlqgwK?=
 =?us-ascii?Q?lcDUTFdFuD/Y0ZCpxHIhI5n27BN32QiZs9TFggdKyUnuM5Knj5PATqFO1Px7?=
 =?us-ascii?Q?SSF4ja/lVasPczVzaUTrgVk84zjn0LWoQvsjCabNUtYeqGF9FTfZRt76F6of?=
 =?us-ascii?Q?nfhkug4+5vQnJNKUBVqEAvow9wRRwf8mlbviniL6vApKl4iok/mvs6ppErsY?=
 =?us-ascii?Q?9gQNaLEmoxHHU3TP7BR68jcbvlm/0l80fmUfh1aG0FNaPd7RaBb3C9V63q6C?=
 =?us-ascii?Q?ObJag9gwMjpzwGG/FOZ/qJBtFClzcqEv+EGyKMqF0xbBF6mu8lb5GJmpNPDB?=
 =?us-ascii?Q?UcgBYC2eQhn/CijAQZtjvTM4dX4US8CeeQhiOofhoUnTiIqywwHGGcdmsVpd?=
 =?us-ascii?Q?98uM3FAufQqT++MASoYqvJhHhFM7pAqUCUAvhBkV8aI5rnC1WS92ahADglV2?=
 =?us-ascii?Q?8Rzh8Iwam5HzfklkriZBOJkZsnb2u42ME4wfFbtiQTvp7G8MsbsD4nFqZLs3?=
 =?us-ascii?Q?WHc1GsJBWcUARt2FDs1TtZ9oWqYbCNa9FScAj+518wWmllmzmoOR3ZDYPvE5?=
 =?us-ascii?Q?ZSz72g5E8R8GJ4/CeQR45TmS74rmmzuYXYz7l1n7lkxSyV5+F0h6uaa0P7HF?=
 =?us-ascii?Q?v8JqvwlhZEXhCXJDzregXDmQ4viSsdYPkeADSNVcbgT1uQSVxPQl4IVNupNK?=
 =?us-ascii?Q?oOYAhB9pqsbOSfiROQE+ryJLCbI/+HWUr5Dtpi//84OJHP8yhGCNe9FYqttj?=
 =?us-ascii?Q?uoC1T7FEPvoV00vdAeWuzE70DEApmiNzzq6D32VH2OVAOuuIDTMZxpmw0Y8A?=
 =?us-ascii?Q?tzIv4EnlGTbdvrT7x+H5MljeQEefe0IyipFawLdubnQy50ZcM7HTQAOHdlDG?=
 =?us-ascii?Q?+XEcaiRWQ4j/LZexWUY5blI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ffcd66-f025-4f3e-f826-08de27ed31c4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 04:28:03.0377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOeztUCfJzkSDC0CI/D+niF/PWezpg5fXCP3ZcwqZmP+EW9SDkCQtjGOX5A5js5STikSG1ixzyN4HFMQGKoOu12GSXIuw+FOezepR6Vb/pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6541
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_202813_436130_2EFA32A4 
X-CRM114-Status: GOOD (  16.50  )
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

We found that some serial console may pull TX line to GROUND during board
boot time. Airoha uses TX line as one of it's BOOT pins. This will lead
to booting in RESERVED boot mode.

It was found that some flashes operates incorrectly in RESERVED mode.
Micron and Skyhigh flashes are definitely affected by the issue,
Winbond flashes are NOT affected.

Details:
--------
DMA reading of odd pages on affected flashes operates incorrectly. Page
reading offset (start of the page) on hardware level is replaced by 0x10.
Thus results in incorrect data reading. Usage of UBI make things even
worse. Any attempt to access UBI leads to ubi damaging. As result OS loading
becomes impossible.

Non-DMA reading is OK.

This patch detects booting in reserved mode, turn off DMA and print big
fat warning.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 8408aee9c06e..a2f2ae7c60d2 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -1013,6 +1013,11 @@ static const struct spi_controller_mem_ops airoha_snand_mem_ops = {
 	.dirmap_write = airoha_snand_dirmap_write,
 };
 
+static const struct spi_controller_mem_ops airoha_snand_nodma_mem_ops = {
+	.supports_op = airoha_snand_supports_op,
+	.exec_op = airoha_snand_exec_op,
+};
+
 static int airoha_snand_setup(struct spi_device *spi)
 {
 	struct airoha_snand_ctrl *as_ctrl;
@@ -1057,7 +1062,9 @@ static int airoha_snand_probe(struct platform_device *pdev)
 	struct airoha_snand_ctrl *as_ctrl;
 	struct device *dev = &pdev->dev;
 	struct spi_controller *ctrl;
+	bool dma_enable = true;
 	void __iomem *base;
+	u32 sfc_strap;
 	int err;
 
 	ctrl = devm_spi_alloc_host(dev, sizeof(*as_ctrl));
@@ -1092,12 +1099,31 @@ static int airoha_snand_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(as_ctrl->spi_clk),
 				     "unable to get spi clk\n");
 
-	err = dma_set_mask(as_ctrl->dev, DMA_BIT_MASK(32));
-	if (err)
-		return err;
+	if (device_is_compatible(dev, "airoha,en7523-snand")) {
+		err = regmap_read(as_ctrl->regmap_ctrl,
+				  REG_SPI_CTRL_SFC_STRAP, &sfc_strap);
+		if (err)
+			return err;
+
+		if (!(sfc_strap & 0x04)) {
+			dma_enable = false;
+			dev_warn(dev, "Detected booting in RESERVED mode (UART_TXD was short to GND).\n");
+			dev_warn(dev, "This mode is known for incorrect DMA reading of some flashes.\n");
+			dev_warn(dev, "Usage of DMA for flash operations will be disabled to prevent data\n");
+			dev_warn(dev, "damage. Unplug your serial console and power cycle the board\n");
+			dev_warn(dev, "to boot with full performance.\n");
+		}
+	}
+
+	if (dma_enable) {
+		err = dma_set_mask(as_ctrl->dev, DMA_BIT_MASK(32));
+		if (err)
+			return err;
+	}
 
 	ctrl->num_chipselect = 2;
-	ctrl->mem_ops = &airoha_snand_mem_ops;
+	ctrl->mem_ops = dma_enable ? &airoha_snand_mem_ops
+				   : &airoha_snand_nodma_mem_ops;
 	ctrl->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctrl->mode_bits = SPI_RX_DUAL;
 	ctrl->setup = airoha_snand_setup;
-- 
2.51.0


