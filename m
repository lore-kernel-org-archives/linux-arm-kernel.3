Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE28CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 23:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UlUYAHBOiVV+s0XOTl0AkNJyqRmaYZqCAqMdNDH6/L4=; b=tiqCzyg9JPwQ1Kx60b/nviq68p
	YNgr93FC5WKlnlBT7yarsXFja6x3+fNbs5AYqKphy88n8rcHqWPcsoR8GBosUgk6DswZOgy6mqyTs
	2pHd3H/I0RtBXJdObb/qsd6fi5N/+03ZiAF6xAVX8lKb7mw+1NxkaoQ2sKD/H+luPPg6yAQdoQicJ
	k4HUFBe+sZxicKjOC32EixtneNm3XBxwcP1iCyOPKtdiEoQVgymL5J9CK46XNrLc3KF8p5M2O5e7n
	f5QLxty/jRFAHB4RGo57p6cQlpcc4U1bGmAaLeiGxcAfxU41ujILYeEWiLegF5bL00WNhS/HJdDMK
	W9anGACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK38G-0000000Eesv-3MJW;
	Mon, 04 May 2026 23:55:24 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK38D-0000000EekI-0NX8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 23:55:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPZugW8z106lnkXacjCVgXCJV8sC+3SQEf1nbbu6mJcJwIVxOJcIFa+Ani4yNUruWLeBt9aVsYaJKvhpu208zh6ZUX1I9Vlzx2AlkVG/82+kQRw13hPUqA7ob6w+sfUwLQu8c+8jhaTR823L6UcwfyGNWJ111sPQFw0JunaANqZMInqhVnSqPq3892+AQ65oIEFJvqUdATY4c4RmLIU1KtOzLTEXkcvvRuuoxVlW6dnNT1wR8wbDqkzcl97ejJoPI182/eIX2eqEBfCDKmY8KG3QS1yBsCWqJsBQDYq7DtpjC7NNFpuLYSRfihAs/Wapkj20zkCZN1NCi2adUdeK4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlUYAHBOiVV+s0XOTl0AkNJyqRmaYZqCAqMdNDH6/L4=;
 b=MnuxGyLQsIKgey57hJ61sJwDKDpXIIQZYtOTDtLutzlvefMSWS+OJ7P89DwRrAGaDB2TZdLN6plcMgG5mdG6zgckpXejITGN18018wkUUs8Hto+MDaT/ZItZy2bZvKW3Q+1NKoIN0YRZxVzh0EgAyO1W/ioFSbxvay8rEQdZERrTmYJP2Pn8aRgQKLMpPVzEpv4fKOWtuOPGtL5i1kJEBdU1+gb2q8IYa34id7DJmgcs7TV9SP1MENzVYM8wFzZcAxqO/R3wuEpqmLmoZbp1GIh5kDZjfAy7hMoGkXNm0HCEvHR8TdGjVvwVx2oMmhK8gXX6SLxEFb8MzqnMiWloOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlUYAHBOiVV+s0XOTl0AkNJyqRmaYZqCAqMdNDH6/L4=;
 b=PS1Vl8RSha4mYXt40r8O0LnIj7BVenjx3+55R9ccafnVEVwNKKR1f7quiwclQ1pu4anEnvrshbid7l4Aq1hZUnQ8E7dYOJASycJV6QgFbkHBL1WDSnBq4wNI4r5iw1ZnKqIjjjHZl5Gnq9wJW8/Scv/QDHOTzj3tRozVIkEhrjaTHyoD/4UQsbg91jHqj3jBYzkq9oef15ygViplyw6RSPaQ1mYG3GAJyFoo2u6Mas6cprvU5rtDgh0WkWUaNjEMDAPGbgTclPK71aVAJGcYI7Bb006OjGZUp9WZpVxt7cPNJ7eLMjE52kkCImh8iIjOJ8ynaKJJaYwNQRxgHdAZOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10511.eurprd04.prod.outlook.com (2603:10a6:800:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 23:55:19 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 23:55:19 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 04 May 2026 19:54:40 -0400
Subject: [PATCH v6 6/7] arm64: dts: imx8mp-evk: add board-level mux for
 CAN2 and MICFIL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-pinctrl-mux-v6-6-8ea858ba3a5b@nxp.com>
References: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
In-Reply-To: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777938890; l=2170;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=EPeLxotNzw2voFnaeTwUiSekZ7FvB/hteiW/+B4SVJA=;
 b=l1AESn0tgAWwK7fK/bNsYR7dYCqvgeyhKVK3H/wjzyjK0mynggR+Gh19asXvjccupSSFogpvx
 t5OP68Un7jGAGZv3R7ILCE/MAmEuCpB4ZFiUwCLmr6basvRC+Q+zS/W
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10511:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a5a10a-4382-4164-d246-08deaa3898c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: wZ7X3C32+YwBThuzHXuI/bWiphQgDfs6LBpUJQ8Mdyr4Q8m+RjJ28EvsBmQl7vPDJUU4CF2Rwh0BIEqGgENrlv9jugZmyRKvqp3cZ1FGCEtDfvAfcI/YvEuHQftvnKXg1o7WPhHcDAgrXOPN21INIBSNkybLozeSNnJy9iR1z49v88/C46eROgq3G5JvtD8bmAzKb5AR8tEmKoF4T8OCiZwy1C6EnIFARbyfNmGwP9gmCPoYqTRsaNheb6eeVeOuA+Pi2cr9Hsz0NdQEFjrWG2qwk/oseRaw5ilUuFqpc0e8r0GdOJzmBP39L4mZDzJ4GgG1C7x03vIhS52+LrTsvmOttxZ5IVRfmPbg9eI1s7j3j8qSOAbueyNxuldG3HJSK0EntdIqiZ208JCwV/MhBDvrIKyobs9jmkB/o9G9zJrJEHAeV243J+N4z8LXfH2mvirGRqXUYd99S6ZuDDrwU/UjXW4LejID4JCVT8xLyZxp4TgkIxQqZEWiGQAj+X2uyHncEs4E8YM7z0pGTmfDWU+0KPB2dlK0LO0LOhh4a5MIVlu3aCA0I2VUNq2sYGDNc1IuFj0Z6k9a3k7+wxjmIlS3RoKwjKW7BJQHCpaY5xxtyvFp6JKiv23L5bGPMKpFYlmjccBFwNyTXrVw46MXBFMc0DMygLVU84aZXVhifmTs65lii+PiYSi3225AQcJAc9gW0koPybzAQGde2HfZ7I81EZqtmJuAa0aJ+/p+usPf/mZqU1SaHcBzwmRWtUgA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWpzZjdqNHFuNlFQNUtYeWR4SWpvUWd4WEdPZTFvQ2VwUkRZMHVhWGdDamFu?=
 =?utf-8?B?SklaT0RYUGJQamVKbHFsdGFock1TN3JSckFucUJmbGdMWUw4SXFGVG44aWJx?=
 =?utf-8?B?ZnRydkcrd3JnaThwcm1SL0ZhTEN3OE1LbzFLeUp1OW1UanVjNERUR2JvVkpB?=
 =?utf-8?B?OFNvOXFxbXNKYk9QcTMxV1dYbm5mT3lsdm8rL3hIL2xsQVl0N0dzckxCMUFG?=
 =?utf-8?B?S0habzY1cU9HcDhzbkpGdDh4K3FySHg0TkFZVktUWW5ZMitlK0k0cG1lWStG?=
 =?utf-8?B?NFdCaFo2dVBPd2Nid280VHNCRzFsZW9UczY3MkFxcHd3YUNRMUYzUXpjQmx0?=
 =?utf-8?B?VmhsN1ZDSk5IUWxLLzlGbXhtdVF5eG5BYnY0Q3RBdEtoaWZnUmpuaVNiN2J2?=
 =?utf-8?B?ZmVCWVR5ZWI3ZFZjWVUwQlNoR05LUnc3c3NNQnN4Q2hUTmx1Zk5wamEvT1dC?=
 =?utf-8?B?ZFFDaHo5SVRCa3dhYVJhZzByVG1SU0txSzk4aVU1eE1lM2FvVzVmeUNaMVE2?=
 =?utf-8?B?K1JKaE15aW5HR0pMdUxlZEsrTFhyZ2Q3ZHd4cVYwN0hIa0p0QXFyL25heGU1?=
 =?utf-8?B?Z3JQYWdhbm1ZaHFNODNsajFCVGVzNUM3bEcrOWtpTTk0ZmhybElOYmRJS2dw?=
 =?utf-8?B?dEp3UmpnYTFUNnlaN1A3QTM4NWYyZUFWSnlFTXdCamFNRlhMbkFyRGFlQUY1?=
 =?utf-8?B?T1BhUkUvU3FBYkZwSm55ZFVsd1o2YXlkNDhJaU9KOUowcmFJNXd2TWsrdU9w?=
 =?utf-8?B?QmcrNFdGbHpueTVEd2MwOGVhUWVmbnBCMkNxclltRkdKODBRblZLekNGNVNG?=
 =?utf-8?B?bVF6MGRLeTYzQ21WZi9MMGkvZ3R2RTRyd1B2NmdhZEtDZC9Qc3NBS1VJOGNZ?=
 =?utf-8?B?S082M3lMS2NLeFEwSjJrNFgzaTRKZ0FoWjJLQjYxYWhDVUc1akRUV2JDYlRY?=
 =?utf-8?B?ektESU43SzNyU1MxeldKQ0xNa3BSZGxjaS9JUGtsNlpEbVUvTHNwTHlCSXFx?=
 =?utf-8?B?TG83bjZTenYvS3dlWDd3Mm1MVWJ2OC9zMThrVGFiVTNYQzFLUzRFWFJ2QVUy?=
 =?utf-8?B?Zk1UZExadm9LQVNEUVVGYjZOQ2p4UHdnM21URWhEcHRtYllVRXJGTWZFNXgv?=
 =?utf-8?B?QmRHbFJsWE1HdlZaUkZIdjlhbzJlazM2RnBjUWMrWVhsRlNOb1F0RzVXNzVO?=
 =?utf-8?B?dHJENW9paHlnZXVXWXlMSnFQUWNScEREMzh4dHVnZ3ZDcnhmaGZhZUh2anRJ?=
 =?utf-8?B?cU5ZZXVUUmsrSXNFZDVrc1MxR1VSenlLY1NEbGFMdGFVeWVTeldVNWNWZnFi?=
 =?utf-8?B?cEQwUFJXVXk2TFlOb21zVDhVSVFiYk9qWE1WWGJrVlRydWVZUlBsZXZGTUQz?=
 =?utf-8?B?V0ZFWm0rcjRrcTJPMDljU0ErK3d4MmQ1ZUhpOCs4VmlkUEJnQnllYi9Yc01X?=
 =?utf-8?B?NFBSQi9KZ253dk5IdjNDem50cU1QQXpKZGlVUGc5TGtUS0VrN0xXZFRobDRm?=
 =?utf-8?B?SjlQMW93bkt0OWZiQ3hvNG5hRVkvK01SWHRmcVBGMHVWaDIwUDFSMVlDZWJo?=
 =?utf-8?B?SFB3RW1YNW1XM2hzUU1MZFgybEczWGxOem56aXRPVTkxdnJTR0VFUmt1MENS?=
 =?utf-8?B?emdCaXhWKzh2TEtOcjV0TFJuQkNvanhuVDNyYWI4aHkxUG4xbmNtM214ZXV2?=
 =?utf-8?B?dnZ1bk1UbHBzS24xTjI5Zk1WSTM5YWJ0bXdJMXNaemZDb1JwTVJLRWNJbTVI?=
 =?utf-8?B?cmYxb2FPdkh2RDFOcWpoVWh6QW5lUWhaenkwaDFVRnNLai8rTmFwMzRwOUdW?=
 =?utf-8?B?SkZEZGJ6cEd3OFZHeG5KMHRhUldtTFphQ2JIeGIvMnk2RFBoNnJ1RGI2QW5O?=
 =?utf-8?B?c2E5cU5SMmRiWFNHUExuSm5hOWpWTENmNUZWNVA2dkFDbk9uTWFlUjJRMmVw?=
 =?utf-8?B?NGxZVEtQSmREeUhIMTVXZE4zU04zTTI3MC93WVd6aU5CWi9BSVRzSWU3OFBY?=
 =?utf-8?B?QmNXaEJuOVNKanc2U0tmOFhONW96dDdpNmtwalNDSmFHUW91SU41bDN6emor?=
 =?utf-8?B?MzJCTE5iZE1EWjVPblFlRFVMMGNRQ2dMZEl4YUQ4OTJ4UTcyWm5uTFptQWZo?=
 =?utf-8?B?WWNmU3ZCNzlMVGx4RmtxNkNNaUxqU0hKSTZvZG1FOGFTbjRDcjBXYTZLcGxz?=
 =?utf-8?B?U3ZUdWdFeEJteDUxS2NGd1krU1dZRlVtZkNXZXJ4WFJCQXJpcDdtcG4vb2ox?=
 =?utf-8?B?T2tpdTRxdlRZbEJqQlFMaThRWjVHMXBUQW1DRE92a2d2VmgyOUFSSllienB3?=
 =?utf-8?Q?L0H2tsFHO8pBT4d1TX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a5a10a-4382-4164-d246-08deaa3898c0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 23:55:19.2084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eC3jMn1N4xoc9LwQiRQ91m2CJXUjACqab5hset2vB9IMnLxg64yRj0K16CGs01xy27Yt6bR/voxBEt1zn99lIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10511
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_165521_145452_5D5B361E 
X-CRM114-Status: GOOD (  12.32  )
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

The board integrates an on-board mux to route shared signals to either
CAN2 or PDM (MICFIL). The mux is controlled by a GPIO.

Add a pinctrl-based multiplexer node to describe this routing and ensure
proper probe ordering of the dependent devices.

Previously, MICFIL operation implicitly depended on the default level of
PCA6416 GPIO3. After adding the pinctrl-multiplexer, make the dependency
explicit.

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3 - v4
- none
change in v2
- update commit message to show why need update PDM MICIFL.
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index d0a2bd975a18138f6fc31199d2d5f0dc8149946d..f9d248121537eee64ee0042fd86f1c929ea36c83 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -50,6 +50,25 @@ status {
 		};
 	};
 
+	can_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pca6416 3 GPIO_ACTIVE_HIGH>;
+	};
+
+	can_mux_pinctrl: pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can_fun: can-grp {
+			mux-states = <&can_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&can_mux 0>;
+		};
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0xc0000000>,
@@ -453,7 +472,7 @@ &flexcan1 {
 
 &flexcan2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan2>;
+	pinctrl-0 = <&pinctrl_flexcan2>, <&can_fun>;
 	phys = <&flexcan_phy 1>;
 	status = "disabled";/* can2 pin conflict with pdm */
 };
@@ -720,7 +739,7 @@ &lcdif3 {
 &micfil {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	assigned-clocks = <&clk IMX8MP_CLK_PDM>;
 	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <196608000>;

-- 
2.43.0


