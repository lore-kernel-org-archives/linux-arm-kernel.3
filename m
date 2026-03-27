Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7AE10A3D9E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 02:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IdX3KIpIgGxFNlPOTo9tZAmlmtEEVZ4173AlD7CC5g8=; b=MTV5MEtog6QFiY7kQGldxnBefu
	P3a4ViYKygX7A6lxQibN3pRr/auTHwQ/zzyUcmoFF93y8yJ0jXsMlV363pSTjZUB0GHtskrQe4f9V
	ZdggyPg+zoByXTTiAFW/eSnNkRdubnN8nlRcjL1MchSM8a/zXcPLbNml76aaZ7VzpISF8aaxY7SZs
	pDyi5fC+pZ9KiLrkXIk2WcLuA9ITUQZ0o0BnrwMzEmyEqYayKfdyNxwN8Q7oNJC1t46QHfjF6yVoQ
	We9fzzyCQqmHnAJHUW5P6ZnqdSH95olIVZ7quFniBwJbf4xiiXTZCiCeUbcA5ttmaLJuqM8AzZTKY
	HF6jrwCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5x7o-00000006Z4n-27eq;
	Fri, 27 Mar 2026 02:40:40 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5x7l-00000006Z4D-1CSv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 02:40:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOgKgUq5qdX5hbphpw8cHa408PVxKO77GYqNCy/G+UpsjdNwlwxoHJQXX6rA+8Tjh7LocxcS5XCBT1syowipI1iHG03RaG5Uu+fyhmgpm7q/zPXWAf+DDHMCTarDTSt4yVZG8Xs/YV3eveG9CTSd28O3Xyk/nN5s+mtMSCk1Pasf8q17qA6Nv9FGAit7Rz+6YkOnYfnKv5tBWM91x/NjI0QWUNp5zKJrag0ekyKwbWlM3sctqUCaSv1Aub39ebNIWh+zX9BSXffi7wlUCbWUZLfsW1FVOs3VRPoU/on13nwlX49xgUo2rkGIMYzIINB6QKlnZ1tr46sSQlpZaodmjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdX3KIpIgGxFNlPOTo9tZAmlmtEEVZ4173AlD7CC5g8=;
 b=tttNAs6u7wKEoQ8U0ILqpdeu+0xNSWGdYZd6P/r+djT6rt5VoXHNFF4hcWCZSzGWPqNRvxLkMiBap40vTZ3l1apW5K3stlljhsGaocYJgKYqEDBkLGWVOj2/GRgN/s3/k+fsOxLstwamT5CCoxLwYuOxsJFtLMC6Jz/R9UYdT6m2NYyJgM+bYC27euRUtlAJBn9WKK0zZLPNZUpEkJTJzLyep7qCoIWv94qNpNHOdSJ9o39o3a02/x0dQn4wMOgoClOKle9+8MlOcGIO7j8yFDx+vWzJw0/OI0i6v5rlxf30qb+wokOT4aLKg9X93Oxqv6/uHWSXYVH18woKZmia9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdX3KIpIgGxFNlPOTo9tZAmlmtEEVZ4173AlD7CC5g8=;
 b=w01BnZloExGdzzEL47sOs6iBieApSeWWUa711wn5glgqiIuwcqrStZNGreMZbpNOadzc45i++1kRcHFAsjOIIPSTkaiCsJMbsDGnpw+2i9tzU43UWjufIGz2UXixT+kBia/7EACwnnCY44QUhnVYUyo1PpAyzwnqIzTBfuxY8UjiiBH+Y3blXbZ9BeEq12k0Ocb+pjUZCsGl2+YC3z4+rAJZLKF4yeACEycTU61TgpAK1AHUE+TT7J3kMtu+UMxZSqbbzNVoCCp2mM+ZTwD65iz6CE3R7DxmqSaaplP/3dtZxtcB0v92gi5+tQXZY2DuqGL8dxb/IeFalQQoYyLZsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB11084.eurprd04.prod.outlook.com (2603:10a6:102:492::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 02:40:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Fri, 27 Mar 2026
 02:40:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/3] Add i.MX94 remoteproc support and reset vector
 handling improvements
Date: Fri, 27 Mar 2026 10:42:01 +0800
Message-Id: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHnuxWkC/1XMQQrCMBCF4auUWRuZJCbarryHdFHj1M6iSUgkV
 Ervbiy4EGbzD7xvhUyJKUPXrJCocObga6hDA24a/JMEP2qDQmVRSyl4XtqTFimm4IRCg4R4t2Y
 8Q53ERCMvO3fra0+cXyG9d73I7/cHqX+oSIFCk7WmraeGy9Uv8ejCDP22bR+nfvmlpgAAAA==
X-Change-ID: 20260311-imx943-rproc-2050e00b65f7
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0190.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB11084:EE_
X-MS-Office365-Filtering-Correlation-Id: f55e3fb5-03de-4df6-e8e6-08de8baa28a1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|19092799006|366016|921020|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8B/wMH1YVLgb3nzGTIA5GpOU2X2vcK8aPaE17J6fXzbqMOm9j/jNlAg9R5JT2YL7W5EwTrZINSG2bidPIrTmDWxs+oqeeTBSPvL6FKIpOdwBsVjEshi0bRrMMO0FGMFepuLKf5B5WAoEbO3KyD+ynGqiuBjkL2QZB5n/pb12i7qr2NdIB7zEpfvLkuHa3HPMKanCZ0/ZgdNNZm98/k7MMoRELvypjJmRKroq6AveObaD0+7RTNnjRliA6QiziMfhKBz7qwANbafu6m0MyWKpywxmQyEGkomEy7uGyW+xNkqdTkxjl4/W2BfGWCF2NqGsMmrnlLBSultOdbs2vJ/7ICd+4/tWQoTLJ6DodLidYhPFTJUimZ7bTIO4RAl9PdsoGKchNAEMmmxAYP6zVuj80zT5T0cZ3qC8whKa/y/7TuB7rcVEomRqmZA2RAbltRVKjm4EiVB1GZVzFrSjf5r2+vvzno4PDmsIskFf9zqqdVh+DRjnAJ2HHMj+1xKuHPnpvGivohWkc4c+f5suA0+AZRm6V4WueQGim/DXTNSCNiyqjHut64pKzbgllOF0SWQeJlbfjMKvnyebcI5ZcL8MAR9+dJcRusfPuc6bu2gI6ieUg9LYh6cyXSlFz80x5rMVJ5vtwVx0EiUNejbvHU4szwqkvGKmpL1+ZJ72Dbag0UyWi9tOqheLgFg2AkqlWJTQnL1UFUZenL/9jCevMl2d3YWzc/Yv+6IP8t4uXzcjk5EvVlQWomoZ5jNd4kozGJg6BQoND9tat6sVhrh5bXyCuXCfodf/1lalfMPTYzXByvOAHQRAAVXvjCBRtpK52Lq+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(19092799006)(366016)(921020)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak4zcnNKYUdicDNKN01HWmIxcDkzejdjQWZTZTR5ZDdob0VTc2llektnMXUr?=
 =?utf-8?B?R2toMkljUTJtYk9aRUxIUGt4ajl2aVpqWGRZZzJSSWRUUVBsS0N5WktJRkdi?=
 =?utf-8?B?WTNxbEJONzRHcm1DWGFEZGN5MUdIRHgrd3MrQm51cWwzVjl5aFkrbHJFdGx5?=
 =?utf-8?B?QW5FOTBCZnYzUVdJaUFDQ3ozVlBjU3dOVVdxeENxazlGL3JWdGR0WDhDS21i?=
 =?utf-8?B?NlE4NDN0cy9vRGdKd3Y3Y0hraWVDYmhNVk9od29YVnRRK3BZTjYxT0YzUHh1?=
 =?utf-8?B?Zkk4Zkt5S3FCYVpjdGc2eGRYb2s4bjhQbmtaUUZOUU13TnFId2Z4TlRKcStY?=
 =?utf-8?B?MnR1ZHl1bVNVV2ZVUmNDaVlESFhvV1h1MjB2REh5aWdHbUJGdzNNSU1YK09n?=
 =?utf-8?B?RkJaS2w3eEVmTS9lQnVja0w4WVFQN2lOWW8vNkJnT3NCRi8vRmo2bEVHK0Zl?=
 =?utf-8?B?UFp6b1ZHRnR4bEE3d0VUZUFaZTk1WTVHbHNqNk9VNkZKdUFVUlYzdXNsY3Rl?=
 =?utf-8?B?RGw1aWI4cEE0a25OT2d4dE5ra2ZSNExCUDRSUldsNHJpTExUdU5PTWxkdXpF?=
 =?utf-8?B?UmFia1RoeW5ZNWFNMnBYL0c5aGt4UVBnTFR4REFKejJjYzMxeC9naXhFNVR0?=
 =?utf-8?B?eFJjSmd1MGR0RXBHelV0dnB2Z01TSUt2RXMrUzJuTGYyckNFaHoxeWlEQS91?=
 =?utf-8?B?VmlaZWJoTEVSbGY3UzV5NTRqUDJYeW9LdmxFVHNBV1hiWUdXTTVScFF5V294?=
 =?utf-8?B?V0xVRi9rYyt3NHBTTHJFRU80cHQ2TDJYekFKMlNRMkdsQzlNQVFxaktKT0to?=
 =?utf-8?B?QlZJV3gxZHVhKzkxTjc1cThUSXRoRXdtWlR6Qi9Sck9sU3BEcjlabmYxSXFx?=
 =?utf-8?B?L3pCVk95MWJCckR2OVF0V3JwUHVOWVkveUd6aVliZC9OeU9DWHdLK2RrN2My?=
 =?utf-8?B?czlpNU1kZnYweVJhQXQwZTNaUTVScU5LeW83eGVtc0dBSDBaYUlwUlZYYTdH?=
 =?utf-8?B?Nk0zUndZMHh2VWxzcHh2dktzS1lNcmUya1lYd245UEJRNm83aHlpSzB1UXls?=
 =?utf-8?B?T0tOMUxnWUVGcW5nUUlvMWxVNlhMV1prVXY5eWJKTis5eFpkdkkvRHM4akx0?=
 =?utf-8?B?a21INUsxZ1E4NnpWYW1GMUFsNWRWbFRGMldDR25rNW1SWUFJR2I5ZHR4OHlj?=
 =?utf-8?B?SExDbWRFbktEZUlrVy82Y3Zob0xDTVloOUFkY2dVMDFVVnBQM1E1R29aUW1w?=
 =?utf-8?B?bGVNQTd6K0xPZ0d4MWZXYkp2ZDA1OWVSWUJHYmM0M0h2VUhGQm5ZNEwxeU1u?=
 =?utf-8?B?RThmRDZIRVZDMVpBdHBlSVpKTHBsMzV3VjdvVndTb2NvTERpbHkwSmNjc2o2?=
 =?utf-8?B?ZmpmSkU2TFZVUGNwTWpYa1htZ2VsaUxzQS9EQm9vWVZ1enkyaWRTenJTVURJ?=
 =?utf-8?B?NVM0c1ZOdXFlRXRQdDZXdGxRWEllVFkxWFpTRC9hdit3RVV5TzJQK0YrKysz?=
 =?utf-8?B?U05GV0dXK21KdE9wSVFWYXVIYzE5SkIvQkh2NlZiSWgyQ0lwQ1RFdzZpckpX?=
 =?utf-8?B?YnhsbEM5dDJoaGVSandteFBEWUJzajJ2TmRwWFNXR1F1b1o3bFpyK2JrZG5P?=
 =?utf-8?B?OUNZcXJtLzRwblZadG9TdXdIVkZtdWNEYjA0ZlVEaERZQzBGNzUvcDk5YzZQ?=
 =?utf-8?B?SkhiSTRrVng5bFRadW45dlZoRzhyK2ljbHlFSmgxZDJWbTVrcWRoUEpXNk9M?=
 =?utf-8?B?VHZjL0paWWYyTGZLb2ErdENFV0JhemR4aS8wSGx3SWExSlk3U3lUUjJ5eEZL?=
 =?utf-8?B?b1hPZlFrQ3A1SEJ3MFFqRGRzMDBMSmhsSDdiVG1DN1dKc0NGOVhKalRKZjhN?=
 =?utf-8?B?TEJnZkZEb05RZ25iZ3U3TVhLYW52NC9PQzEzZE1WUWJKQmVZeXR4Mk9zWWVY?=
 =?utf-8?B?VjB5UzBMaWVjZzVHazVxeWtrajVrd0lwQjhEV21YaXJ6T2wzT2JTZFhoQkxt?=
 =?utf-8?B?U2p5QjRYTEFsVUd6cDE2aU1GN2Z4TmRnc0l6aHUwRFNIajR5OWgvVkVBZmJ5?=
 =?utf-8?B?MnM2SEltcWdFUWZkR0pHbXFWVEVKVWE1WXB3bTJVZ3pEb1kwbUpObmozNlFE?=
 =?utf-8?B?KzN4WUVZT1lQc2xxTkloNVdmZThhL0NMMUdaK2xlTUxDQjNCSmpsV2NOOG95?=
 =?utf-8?B?cmp5b2ZGNmc0MzBhOGhFV2dGcDZaYVY0NUM1d2xaeWRjdklWcjdYWlJySjNt?=
 =?utf-8?B?dGNJZy9kZ0NrOStEOUdtb3JwU0NzUGhXd2lUbXN0RUpreGUxeTlGOE1wK2ps?=
 =?utf-8?B?Y1kwMHpTRHlLcXM5MDJsSHNuTUtqRXZtTkZQMWJUOGNFcU5rTEtvUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f55e3fb5-03de-4df6-e8e6-08de8baa28a1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 02:40:08.4356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GiWULPiJts/S/8t5ZlaC5khT6gFJvuBLjZ4mBhCM3A4tPV2PwOhIumeBzrobxw95ccqovtlYo3fORhgBnw6wFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_194037_418041_1AC85955 
X-CRM114-Status: GOOD (  11.33  )
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

This series adds remoteproc support for the i.MX94 family, including the
CM70, CM71, and CM33S cores, and derive the hardware reset vector for
Cortex‑M processors whose ELF entry point does not directly correspond to
the actual reset address.

Background:
Cortex‑M processors fetch their initial SP and PC from a fixed reset vector
table. While ELF images embed the entry point (e_entry), this value is
not always aligned to the hardware reset address. On platforms such as
i.MX94 CM33S, masking is required to compute the correct reset vector
address before programming the SoC reset registers.

Similarly, on i.MX95, the existing implementation always programs a reset
vector of 0x0, which only works when executing entirely from TCM. When
firmware is loaded into DDR, the driver must pass the correct reset vector
to the SM CPU/LMM interfaces.

Summary of patches:
[1]dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
Adds a new DT property allowing SoCs to specify a mask for deriving the
hardware reset vector from the ELF entry point.

[2]remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM reset vector
Ensures the correct reset vector is passed to SM APIs by introducing a
driver‑level helper (imx_rproc_get_boot_addr()) that applies the
reset‑vector mask.

[3]remoteproc: imx_rproc: Add support for i.MX94 remoteproc
Adds address translation tables and configuration data for CM70, CM71,
and CM33S, enabling full remoteproc operation on i.MX94.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Drop fsl,reset-vector-mask by using fixed value in driver for per device
- Add R-b for i.MX94 dt-binding
- Update commit log to include dev addr and sys addr
- Link to v1: https://lore.kernel.org/r/20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com

---
Peng Fan (3):
      dt-bindings: remoteproc: imx-rproc: Support i.MX94
      remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM reset vector
      remoteproc: imx_rproc: Add support for i.MX94

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |  3 +
 drivers/remoteproc/imx_rproc.c                     | 88 +++++++++++++++++++++-
 drivers/remoteproc/imx_rproc.h                     |  2 +
 3 files changed, 90 insertions(+), 3 deletions(-)
---
base-commit: a2f31c83962f7f298b2975ab004810f3ac4875dc
change-id: 20260311-imx943-rproc-2050e00b65f7

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


