Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710ECCD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 21:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f3YHDrvyhT+4ZD652URJg1mRit6FIvzwjiCCxDeYibo=; b=aPyA/gAT+KyMFlLdKRbIJaANq3
	4K27GEzxGUfhdczcB/+qCPeLGlJk+NDUmZBQro3jDyDY03OqQuOq6EO1h7JWb1EMCLX7k4JLmGnrE
	h8G6uVg7RbEt7AztihWfWtEKNcrtApz/vo+xxeeEdVrgGbbxUGCdsFz69b2nONYDIo0T94waP5j9t
	ZZnTFOpUBXRmpGf9TeLLez16Z5DJ0gcRE41h5pexjKdtD7i7v5uDQorBHFGFgibOsOGJHTld+am80
	fAVlP5koBnzv37aHwOn1Na7ngj8KO5OKiU5fyJQCXcYdM1X/ydUPB5YOHYjAfSdUTnwGvMGOdB3kM
	oXA16QXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXoW-0000000ElZ0-2woN;
	Mon, 11 May 2026 21:05:20 +0000
Received: from mail-westeuropeazon11013021.outbound.protection.outlook.com ([52.101.72.21] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXoU-0000000ElYG-1NDh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 21:05:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPJo7xG8jjNw4yszc55B6COSDQenpWtx8LNOdqNJvjFgnncup0vtrPHkP1Auc/u4P8BfpvjhRVhJz3kv8q54uK/069ZRlfWQhHafJ8J/SbJWqlTRqVhQYXPt4qDa4JqFmJ0Zt6pl+OIT0sI+ZZ6r7dFr9T3XR7FS2/iIxe6ULctxpFPGkOaRD8AkEgENVvfjuV0iR8DWlaiT9Rx7o5ZuixIOzN9zOLpVkGNIjkVRHTeXyPE6WiVF7SvxDZj5MNAHiwKCNMlltEvidSE98uBjzpVpxlt7usr37apES9nzqMV9EsE28kYjeMuEHBx6GpfHK6BWvINHLnHTC6R5adqyOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3YHDrvyhT+4ZD652URJg1mRit6FIvzwjiCCxDeYibo=;
 b=MZR2/5trgNpWpFStRHHY2j85Y3ZT7PSuPdoVzgsWZ1W5R0gji7JzZxnK1TgNfG8f5kalBNQoazhLP/OxaORDlR6Vlw980zn6BCDfl4zsvRuCBx/vz4m7HMPQAjMXI9xoI6guGlp176KO9okbrdYgQ8MB++INzG2Es5uA8xpiIisdmIDwMDOHwn2l1sAMH5PjkPnri+Y8YKBVi/pDp1KLMeAaHKuALJ9NC+CJIOQO1KO2CmF8gIAWV0Qt4HPeTZ6FEKYSkZ80V79sMxfH7ehMKIhEWhGBqzeN3bK3e8SuwIuAoe9SG4hJPVh8Xo2NiKgnWtLC0PqWrW8HopPZ+63Csw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3YHDrvyhT+4ZD652URJg1mRit6FIvzwjiCCxDeYibo=;
 b=H2QhLqkUidqfra2aupvIChmRljQWPYO8HShSlI77sZzLY3hPvNXeRmyggftEJQDu2fuAW7BOJC9zKUwWsz0J8/QT+DFVn2k0kNs0n2J+LN13RySs1zCQu73AUMK9x+/AfPR6/vQEAbduXHGJyQyuRqLIVY5DB4o9KIQachqyXjOR/D43THLOGjGvMxGjoBzJVnyl9jQGcse4StBFglUscYfkjeMJ8MMo/FB3MXrtWIpIQ1NpwgirLcnrIXwwZqD2iX95oBQohIVH3m+cf0edoh99RqT+xtTM5j8BjK6eBztr9n1nBAFy7vg29GObm+wPO5/ajfZUN4THMJivPZ+L7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9155.eurprd04.prod.outlook.com (2603:10a6:102:22e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 21:05:13 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 21:05:12 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/4] ARM: dts: DTB_CHECK warning cleanup
Date: Mon, 11 May 2026 17:04:55 -0400
Message-Id: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHdEAmoC/x3MUQoCIRAA0KvIfCeoZbJdJRbRdrKB1sRZakG8+
 0qf7+c1YKyEDDfRoOKXmD55QJ8EPF4hJ5S0DINR5qqs1jJeJK27sX7Z2DOt5Y3+F2qmnCSaKbq
 gnItnDWMoFZ+0//f73PsBZjhcEW0AAAA=
X-Change-ID: 20260511-b4-imx25_dts_simple_warning-e29b7a077b31
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778533510; l=902;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=T0MBQyp7oBmFjXq1IzizLH9Rx43rK/MiNBbpMs9prIk=;
 b=xp7VElt+X/SGFW1qYN+FhwtbcetUhAqMTJAM6OHTRpSUk+Zfk5Thwf5nJPBKFgsxNaoE1P+Z8
 mUZO9wFQBMjC3EbQENUcxcQP8UNqngL6oHRTkrbWy2iNjAv6yxVwTnB
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 246b5c6d-70b0-4c38-63c7-08deafa0fe24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|376014|7416014|1800799024|56012099003|18002099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info: zpJf78Yzn+Gm92cOYMBZPrBD5+VfDvyHbK8ovuCzIJn/PzjKwMaYkbUYu/mBJVYtLZh5+uc1lw3npE+HQVqH/jWt4+4cowmywX3IWHXQo9qgvkSpfr23S/0EAxhXBqZVCw8zm+9DhPMKqvVCdDcU1i4nHc3oTZF4f4RvcgzpzyFcU2LqrK9FB88W01gxtJ7kOdtLI7CinWQ5G3o5fAB42cquTYiGFLWYVj8tLGrN1vXK8bPzT2BQu6ciVJ8Zpt5/YqUSn+CjaMGBxqm8GjCBStUQ16gEFmigIPEB+h2oPrFU/vJrNdR7VFzRjzw2qOAbiCD19iHgZcDBSfmGIpIf40xKaqwN1zgsAmG5nKQ63N0kVj22afODvehPc14F5w20+HIw2D2EJ4kL8D07PnbW3H+21ITfrGDRMkbhbNTYM+odmuRH3mQfBhyzoCNBSdIdz4jSPNsUYe89t3exxbwtuB8ARZHwpcreq6mvZh21APNusjY+EGusnBpM1yut65kZKd5J2JeW0qTw20OrzazENiNYa/9K8DQi3Q95oVDCm6hLew0kRu+7qPJoXkcZMxE0DOKCAXRTMMJr/bUTxVgED1HAEHykyw026kNxkrDrNWmv9GH5AIRZuK+xb5MqbUPsKhQYA8HEXEEq98uSPpdKUbCOVSzOIHEwp3FrQmm1nDXhK/lifUuroK65c1BVYaI0lXpSzOA6pIDf21Fvom2/4ZmhlH4PDStQFbUe+laYBW8261O0wCFD64En0fCO66LO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(7416014)(1800799024)(56012099003)(18002099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1VKU1V5SkRQOEhYV3BVV29zT3JkbEY1OVUvUVQrYW9LUk11TjlUVXhjMEUz?=
 =?utf-8?B?VHZEN0xOdEpHNkFHWk9SRERQeEFXR3ZjT1Q3RVVJSjRqTkRNMERvR2dJMzE0?=
 =?utf-8?B?SFZaYjBZanhEcnl2cmJoc2IwOUNYcEQxQzdQc0ZwSkppZjdBNE4zaytwZ2JW?=
 =?utf-8?B?VUpqMkR2eDYrcVk1UnZidk5VVmlwd25aV2UvNzQzQjMva0NFUUNiMngySTBm?=
 =?utf-8?B?K2FPTXVqeWdiSkpnS254aTBNdmdDMzBTZjZMQzY3cytWaE1oMDdJeDA3STFL?=
 =?utf-8?B?TFI1Y2hldXpVM1FDU3NNa2VYOHpKV3djOVJrVWdxRitneGF5UmNBa08rdTNl?=
 =?utf-8?B?d3lYV0h1aFJsbWt3M0xHNkUzL05LMS9zeEd5ckhkZXhMMHBKS2hoR2N3Vkxr?=
 =?utf-8?B?bUp2RWR1REtpbGVxV0ZqV0xzeGNycmhTNUd5aUVQTTYzeWdLT1ZkYUZBNXVW?=
 =?utf-8?B?YUdRbnR2ZnBaalJEaHA4Q01TaTFkMnEyOUt5dzBnT0lPUkhBdzlLN3Z1MGZj?=
 =?utf-8?B?T21uZ3EyeVllR0JMMi9aTU40dHhXdWVxczFiYUtxbEVUQytoUThkSCtaN2tN?=
 =?utf-8?B?L2NDbEhVbytuUVhWK2xkcFg3RG8yWGhlSmN4clFPNU1yZ3BhS1l3M0RhejRQ?=
 =?utf-8?B?VGVJNzl2VzlPbW9kN1B5SGlDdmJWRjV5aVAreGZycXNyTDVYUjVIZnNhbThN?=
 =?utf-8?B?cDBwRFNMSHpFVjlVaGFkdldmd29mU2ZUNFlCSzZ6aFZ1RTB3S3NxSmRHaFFn?=
 =?utf-8?B?S3RSd2ZydGtPWmNIN0tLTzdvN0EraTNHMW5qbVlFRFR0OGhYQTF0NVlTTlJo?=
 =?utf-8?B?VVJKUjlsS3VpVGlveDBBSlhIK1V5enlGUmR5QnZBL0NHOXVhdGxyd0wrZXR5?=
 =?utf-8?B?KzJQTkg1YkVNV3lsUWs3eWlUM3g2NGZNSkRPQXpReDhVZG9URmJSYnIzL0ph?=
 =?utf-8?B?dEZ1eE8vS05uUU84bGg2cE5WbDNwN2ZMMTIzSFlOSHRNZks2dFo4TDlURjYy?=
 =?utf-8?B?NDAwUENyby9PSTNLZlE4Ym05alRqcVRRN01FTU56SGNvZTF3V1FTK0YvMnlu?=
 =?utf-8?B?N20yN2Ywc0oyWG1adUl6aXJQTUJZMUpxQTRBZDZGZjl3bVFrVmpubk9FUkJE?=
 =?utf-8?B?eWdBWStkRmxGc1pzbzMxeDlrQ2JmOUNTOUxtQ0FVSXdaZmIvK1hKZERLbHNo?=
 =?utf-8?B?bk9JYWdSalNlOXNpdzBvNGhoajBjUGlZclVEZWZDMkxmbHpxVlQwMXlURTdj?=
 =?utf-8?B?UzN5a09CQjZTcXN4b0MzNEFrMlJTL1BpSDBpQ084KzNLTDdMbUh4QkFURnl6?=
 =?utf-8?B?RTdoTTVwSHA0T2VRaVIxWUpSZlRDdkFocFp2VlBmakFCREo0TEVnSXEwNXhm?=
 =?utf-8?B?REdoSDVwZEoxMlNqbUQwZXQwN2RoVVVBVDR3OFgwZVc1dXgwa1psTGVwUlFC?=
 =?utf-8?B?N1JHeU51Y1N3YjJCRHBPV2IrRExON0tkSUtMemNzVlJyQkJMdGRFMEV0dzUr?=
 =?utf-8?B?RWQrbkszK2xYcWdxRjR6U1dEUjFZdUFENGZvU3dUS2VaTGltSFM5QVo0MjJM?=
 =?utf-8?B?SkxJVUVCY2R6SWZtb1N6eEh3bjJHSUgxQldpMjNSMHI2MjZmcW90TTFiMU1Y?=
 =?utf-8?B?bWx5VzBzSElycU42elljaENoSXk2TExxNTVqM3pwS0oyblkzQXF3L0dIUTZx?=
 =?utf-8?B?b2xYSmYrVzBEdlFVUkhMVmZ0bG16MEFWYzgwU08wN21YVW1wSFMraGJxbGly?=
 =?utf-8?B?WkgwY2RPZVhKOENud2E2SDIwQ2ZkbGFuQjhEamZpZXE0SS9hYUQzUERpQ2ts?=
 =?utf-8?B?cWhXdVVMS3hBVWZhb3dienRSNkJJUDB4Ni9YamV4ZjljUjNDcDhsWGVCUHp6?=
 =?utf-8?B?eGdBNHEyVFliTCtXUlQ1OHAzbm40aGkxTkZvV0d2d2RsWU1ua0E5dHZhcktV?=
 =?utf-8?B?SjcxbkVrYXB6UDBiamNsRVZQcUhIWU5mRjZnMVFnRGlWTU4vbzh3MDhWT3ps?=
 =?utf-8?B?eWVjNkwvYmNJVFZRM2ZVQzhYQmV6ME01aVBPMlFyc1lDV2Q4aU1YaTFLT3dW?=
 =?utf-8?B?SVFYOHo1am54bGxyK3NHNzNtNXQybDFPamhGWlI2RDRWVXBHWC9xQThsSXVO?=
 =?utf-8?B?eFhmalNCQlo1eERKRndqM3dFMGdScVFzV0p3RVFGMG50WlptUXRCNmtXZDVU?=
 =?utf-8?B?ZTBkUlAxT1ppai9oTlR6NUdkWkRIcGQzZEdFR01pU1M3OUlCeG5TSU1MZXA2?=
 =?utf-8?B?SzUyWm0wZmt5ZlhOMlhGemJBejVyNVdCa3NPak1FSEVPZElJOVNBWUtLK3pp?=
 =?utf-8?Q?ir32pJzPl38YUvLRiZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 246b5c6d-70b0-4c38-63c7-08deafa0fe24
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 21:05:12.8904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0JKgxht0stDQg2f2qMUY0viTwc8Nbq3pVHYUSQnEKMdL0NkIlD7LGsIoxNLuCth1NBKOHaujbbiiXOKjh4Pdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_140518_375381_C9DCE35D 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (4):
      ARM: dts: imx6qdl-sabrelite: add mdio phy address 0
      ARM: dts: imx: add ti,deskew = <0> for ti,tfp410
      ARM: dts: imx53-qsb: add dvdd and avdd supply for panel sii,43wvf1g
      ARM: dts: imx53-ppd: add '#phy-cells' for usb-nop-xceiv

 arch/arm/boot/dts/nxp/imx/imx51-babbage.dts      |  1 +
 arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts       |  1 +
 arch/arm/boot/dts/nxp/imx/imx53-ppd.dts          |  2 ++
 arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi  | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi |  3 ++-
 6 files changed, 17 insertions(+), 1 deletion(-)
---
base-commit: 6920bef1402681e36b9c09e9aff8a860b0b54ccd
change-id: 20260511-b4-imx25_dts_simple_warning-e29b7a077b31

Best regards,
--
Frank Li <Frank.Li@nxp.com>


