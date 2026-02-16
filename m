Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEE6E83824
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 19:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLqQYyxjfs7GSkxNzVvjeesGmwtsDi5YgIlmLXo+T3I=; b=HCQK7BslKmdvtz8yrkKzGEmw83
	yxC4Xj8CITbCsazysVRJXLN40HcwqvUMeasE8gBr0dYT9lldKB5B3t7wBuyOx/KdoxaoRuIWAPrw5
	uGqdhzncdiBfm0RVVMkdS8S4oF4e1kiLrbYlTXNURvMyRbUDUQYqIn9WatxCTjBJU7W+6sEgrgw9k
	B4df2CauIpV1Pmk6SwTmdAQ8z62C5u4/7NNJVzSqfWk1vZXYFDKMjhfr9Hi3xYPb3z3W7m35INuCn
	5XLd1p+mXrutA1TBXpHHSzv9iWhA8GE/UKSGO11h8E7Zi5GePOF7lJ7arYuoldaT31oOS2Dcp2iG+
	LKHi1Dsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs47r-00000007Byz-3yOz;
	Mon, 16 Feb 2026 19:19:19 +0000
Received: from mail-swedencentralazon11013004.outbound.protection.outlook.com ([52.101.83.4] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs47o-00000007Bn0-0TVv;
	Mon, 16 Feb 2026 19:19:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=og5Zwrk89lc3FLor43INnd/oErE+Y7xWBWAKBr70FgeBRdFyKnhqg5/tmdoPivwrbwcqd92MjlMi1DnSYLkSkb9c9RJG0BW4Pjpss91UX8IQr4zxak6BwToStMmh+gdKIByFsqDnsVef6LpgjYSzhHFwAzRHn0MLryRKgeJub9DMJAT4kElzZpCnhTBnQ0vpNXNF+RaiOP9yHCoj7FVoorlHfqgobq1lLthAuYXMigwDBmCLqHEXXmCJ/O5wbuP02/YXBXZCVUXgoqnClHETOI+elnXaLMv64rB+tb1yuNPZC34TutirluMDVetVq9sRsv/qd9OSFVrs0+Qo6oCQAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLqQYyxjfs7GSkxNzVvjeesGmwtsDi5YgIlmLXo+T3I=;
 b=pWt+K8n2pG+JelYsNeB+ddGUmIYKRnLITdMb2lmGU/HemYDZC6AE6IP9YpApKOUdwBnsztI6Or7ikPmUY83GkQFp95pOESeKLx7bC0EVTrUEx7SzzFdUkkbukdkSk69zrfrBP1c9F7GDgBEhWmleo2AvcpdO5UPp1lyR8G+wEQU7vx01V35o0ldJaOHa5zJ1eMu/GFFwmcq99FbNUb3LEBCcyr0Y67kHBdwguliKCnI2nQls0AIQqxJPdPvZvaxZcZRASRyUWfzvpzRxUfoRxq1exi0AnilLiguBw/Tzi+oorf22+a7/a5m53g91dHa9PF+dGLMtomrNZb2nQnI9Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLqQYyxjfs7GSkxNzVvjeesGmwtsDi5YgIlmLXo+T3I=;
 b=JnXsbkE7XcKytv+te6pv/bsQ1SmAn17BMKdWalN8hNHQFeceSwQJSicq0EqVJf83Jy++zijJXcsUHyVzIB8H4L/m1V3ea/7WFQuNnPu1SmBT3ThXZ5GhM2bhj4YHX8FWKmNWhQFijSsuzhbbo62DvVlXdxFR0XiUq8gh97CCmuezb0suqkI93wN4p7Dm9b4cDUlZPmNSrrIwe6hTgpPHWmEzxBgG4sUeUWHAnSJdlLPnEQGBHF3c3NzMp3GZv3u8cfMQc7Fna10GDQKVbaYbfVKBUv49a9pQUb30c//u/qW6ruZtBPoWK0S/TquOgGRMXnd65m/p2cGbhVqxiu4kIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7599.eurprd04.prod.outlook.com (2603:10a6:102:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 19:19:09 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 19:19:09 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 16 Feb 2026 14:18:43 -0500
Subject: [PATCH v3 5/6] media: dt-bindings: add NXP i.MX93 compatible
 string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-imx93-dw-csi2-v3-5-aabafee10923@nxp.com>
References: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
In-Reply-To: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771269529; l=2649;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=nz6PgT2/WB/nQj+S3EJGo+/N5sevH57Nzc98WcGHhHk=;
 b=9aDZHvxlNe2blq2HX7/JQXc80uVzUT6RRaqZvZ4JBJLKuWzP4Qhn7I6Hwftv6nuYSJFigjBi0
 5jBp1Cjezm4CXpKBMyTDKVVGjWsWGd/G0fTZoglOdXDTzldLxFB0SyD
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: b76dfade-a1f2-4bfc-a840-08de6d9042b3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWh5RVdseVhsQkNCMzgrQWZxOHpZdVRVZUpJU3lIZlZkdTBpNU9WaGtBNkp6?=
 =?utf-8?B?Qk5pTjVGR09VdlI5SjBYblNydVhac0p0Wjl4SytESkJVNjhiMEZIaFFGajJW?=
 =?utf-8?B?NUxiNlJISnQxMDRRTHZFOEh1V1lXVW5COHkvVlFkSi9JR0EySXhTU0lydTM3?=
 =?utf-8?B?ZTNqU2tpeU4rTFFnQW1SaFg1azdlUDhCb1JjeUhLeHI1MWdJL2xjSGxtcWE2?=
 =?utf-8?B?REtWc3dDVGFsZ3IzUHFHNUZlOWFLVzNKS1dGWlVVS3M2b2M0VFVVRzlsR3VH?=
 =?utf-8?B?ZmxpdHRGdHF6Z1R5L0FFR3A0K0NoUTdSbElFcGpFWmZvY3NpSUJHa292eFFX?=
 =?utf-8?B?UHh6dlk1VnFGSWtTdCtneWZ1N1JtOU9HNnlRMjFTd25LVk52Q3Jzd2tudGR0?=
 =?utf-8?B?Y1ZKb1JDRFJCVVd5RFNYSUxBQXhnK1Z0T3ZBTnpoOGd1Nlh5YTRnbm96TTRs?=
 =?utf-8?B?MVYwcGZySXNkeGw0eHE1K2thRHJKYWhxdlBJK1AyczhpTUl4eStuRVBhaWR3?=
 =?utf-8?B?bnRsamhIaGRuck1NditwVzVLdndKOWNLbW5ZRG9taVFnZi9ZL0pKQ3ZDK1Rw?=
 =?utf-8?B?K2c2aFptaDdWMHNZN25MSDlEK2lQeWJjS2JiOGo1VHRDWHNQdEtLNWZRaEt1?=
 =?utf-8?B?WnRUQTI0QVdYRy8xRHlWV041TjcwRnJza081WlVpZStyQzA1aTdwNVc0S0ZR?=
 =?utf-8?B?SFp3OUVOZDdRV1FIVXJQUGJzZWtoY25JWm1KVlN0ZVBUdU5WWkI1Q3pQUEhQ?=
 =?utf-8?B?MFhXK2JHMXQrQ2NlVWYyTEMwRUJyUE1LMFk0WWttSjdDTzVEU2xTQjU3MVdY?=
 =?utf-8?B?d203T1lyTTJzU0NUK2FTTlo2NExVVW51YVU1MU5EcXFBTWtQMjFjOHVJekww?=
 =?utf-8?B?WWoyd1EzeTFaUDZoang0UkpydWJYN3c4VEwxdWRhN3hJbnZYdE03ZlVTdG93?=
 =?utf-8?B?N1lieXRzMmtkOWtKWkZaVG83TjlpalJCREpDSERmbHJUWlp6WXBwOTBLaURE?=
 =?utf-8?B?amM2R3ZjZ0JycHNISnBYdmhLbXRUQkJvaWgvcVlMUDEwM1lxVVZiZmlTTWll?=
 =?utf-8?B?S1BjK20wRUJNNzZ5OXdISWMzT2RzcDRDRm1ER1dJSFkxbzl1d0hBS1RpaklF?=
 =?utf-8?B?NHZ2Umw5YVNNUzd5ZjVBbnA0ejZVUDFac2ZBTzJzRU15RFpXRjlQU0lraU5u?=
 =?utf-8?B?R3dLUG1KUWxGTU1BZ25rTkhqWnMwVXQ0SmFMdGxGU09IVE80RmU0eFdTSE9h?=
 =?utf-8?B?WlprZ01rQmJFK2YyUlpMeXZ2YnhiNlRmeWtGVnljNmZDYXJPaGhqQXhtYmNR?=
 =?utf-8?B?SHRJelRIMldoSE92ekI1bExFcE13eWZ4VmJibGcvQXp0cjM1endlU3piZU9n?=
 =?utf-8?B?dnY0YVVoUlBCODRseVoxSGc2cDBhWGxISE5iY3JtVGFtMks1MUVQNTY5bUk1?=
 =?utf-8?B?NEYwMG1JVDFVL05Ed2xlL1ZLdWVieHRzVm9Sc3BPaWdEQmhpcHMrU09TODRN?=
 =?utf-8?B?dDBsZGpQRHJOZXc1Y2xTcDFGbnk4d0dwVGkyNkFlV3JRSk1wR2txUlFwNzlZ?=
 =?utf-8?B?RVpTQnd4UEpUMitjaXhBeGR4WTYyY1NtaStOKzJHWnZ0dzk0MjdOQ0tOcmhW?=
 =?utf-8?B?eUVjdXByRVN4SjlQcWRyQTZrZG5Kc0hqanM0NDlhelNobVVWa0RzbHVkMkh6?=
 =?utf-8?B?K09sMnBxdlhTUW1MeVQrODZJVDhweDBoSjd3Kzl5UUZrbUwzT2R4dks5blVq?=
 =?utf-8?B?SHlJVGEzTFRldEtsUk1DK05zQVpZbXdSQkhtcU12eDYyTW0rb0pacHR5K1JT?=
 =?utf-8?B?VkYxWU8xUGtjNEZnbnEvUHQ5TTdsMFBpZFhXR0dsakhpQ3h2NWFKVlJtdmhk?=
 =?utf-8?B?d3llUXJLcXl3MVNQQ3NWQitkdzZ6T0p0SlJva1VmQ25EQk1HelpKNDRRa3Zk?=
 =?utf-8?B?Qk9NVHdaZjF4bys1YUgxZlVEcGJDSXNNZGhuSXNhZnFpYU1FSm5uUHpCWG9h?=
 =?utf-8?B?bHV4TTBrTzArTW1NL05uVTcrN2FhZVp2WVBOUGZzRFY2VVRYMkJ1eE9RaThD?=
 =?utf-8?B?dDhxMVhWSTJTczNMYXRacDdhUkNPbDZzb3RoN09CdytkM0F5dkE1UFI3R1NN?=
 =?utf-8?B?M2p6ZExvbVY1QXQ3YWJZd3Y0Ynd5NXBxQmVENExSbzAyUUJyaVE5TWtSRjZN?=
 =?utf-8?Q?GfAnQOcauk2K/gLCcpQqXDc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1NnTVdPaVFlSWs1ZmhQRkNLamVuM0JyeENMQlorQTVzRzZnQ3RMaDNHelUv?=
 =?utf-8?B?R1hJbk0vZUtwUW0wNG1CaUdyQXZKd3JzVnRreHJUWW9VRm4yMlpRMXcwK1oz?=
 =?utf-8?B?U293a0tXMVFDNGcwZ3BMODlTZWR2VVFvcGllVHNRZTVpYTdjYk9kVzhNN2x1?=
 =?utf-8?B?YWhZekxtZGNaNFZPRFVkb0FFT1dSdnZVUHkwN011bGRMbVdVdjZRVG1Tdk15?=
 =?utf-8?B?UnVoSk5wUm1LaG9SMVJlRHdOYzlmSTBZdVM2UEdMOTlWY2dWZ1RQaThhNjlM?=
 =?utf-8?B?cFQvcEEzY1ZPN3NGQmFUWHdxeFZCdGdsdm9ubldxekJxekJ3SWlhU0N6cFVp?=
 =?utf-8?B?SmV5L3FMRnN5U2k5NnhTMFdxSk9TTTZVQ21EOStrNDF5UUM4bE9kdC9EMWtO?=
 =?utf-8?B?bG9MYlAzK01ZVDZlbFQvK2d0Q1hOemNIaU85MnIvYTZ3bHFGT3lIY1gyeGhF?=
 =?utf-8?B?YnV1T1F2U3VUUXEvMWl3di9QTHk3Q0kwanh1T1BwZ1FLK3Q0dnVaVXlBRjkv?=
 =?utf-8?B?ejVjdFFJNmZ4V09ZZEp2Z2UvZGVGVWRCRENmU2Z6U0pnN0V0NlNQa3ZxS29C?=
 =?utf-8?B?WXkwMWFDbFZDZDlYc3NScXlKTVF0WG9vRXBzZWJ2cCtLTGJRVmQzYkxLV3Bp?=
 =?utf-8?B?RUs5bjUyTmhucEJGQ0Y4NFM4THBMejRXTXl6Z0hpQ2U5NUMwaXZSdE80RldU?=
 =?utf-8?B?cGpaSTZNMTAvT3BrSWt5d0hLRTBIL2cyalZHc3hxU0NvRWdRY2dqbEdaUWN5?=
 =?utf-8?B?NUpBalNIazRKOFp4SUtnOG1ReGl4MkVDSklIbVpmM0FSa1I3dHBudEIyWmIy?=
 =?utf-8?B?QXRKYlUrT1VxQXlCVXU3OENiYnJPYldxSUQzc25GN1d4K045LzQ5TUEvVExq?=
 =?utf-8?B?N29UeFFUMEpLcThIVThRU1dXakRTdk85Q3ZiSXE0SGhkZnp5dFdZYkRFNE5v?=
 =?utf-8?B?TTYycWsyWXRkZWs2YVFRUFUxMVZuRUZ5MXY5eTdmZjlPYzFwa0tRTVQ1WWxP?=
 =?utf-8?B?bFp5T0xOc05LQVo0b2R3dEhkbk1mbmZrRjYzWDQ5dWpPRENtdU9uMXllL3VC?=
 =?utf-8?B?UVl4a28zMisxVGViVk1VMHZnZUJuNWU1WlJEcGVEamZuNkYyaUZzVDRWNS8r?=
 =?utf-8?B?eVoxaWpQclBrbHlSRFUzY093UHg4UVFLNWJyaTJQQVpZbW9xT0cwZ3IxNTlS?=
 =?utf-8?B?NlJ1OWRTNmdUb1lBeHVFcElBb0VVRkRyU2x5ckZLcDI2WW01aEVyT2dXQmxw?=
 =?utf-8?B?QTFUM1E4empnelZxM0pJVHFlYlhRV3l5UmFQUEpQZHdsc2FKOFZRNW9WZXNo?=
 =?utf-8?B?ZXdsZ2xCaEgyaDVpWlpRNnpuQ3BnYXd1VzltbTBHWFp3YTNrT09nL28rK2FZ?=
 =?utf-8?B?TjdwNTArM0ZrMzFqVmdHWXhtbUo2cGtOaDJTcWJ4bW1ScHgvQ1RXNEI1aTNI?=
 =?utf-8?B?RVNOb2FReHBaNjIzbVF5UjBPa1dKODQwbGpQUEJWYUZnTEtNQ1hMUTVkMU1a?=
 =?utf-8?B?OVUxWkV6c1hTcHAxZ3k1czFtbkFRV1FteFZJVGJrNXhSN0YvMzlkWDVFRG1q?=
 =?utf-8?B?VTFLUVM1Q0RDeTRsNU5RTEJ4Y0srZWhaNnZFcUdYWW0vZEtnK1VaenRUVVlG?=
 =?utf-8?B?dUVoTFUvc3kweERmR0NWTVNQTFlqMGpSdDVYaCt4UnBxUDI4cnVLcTRaR1RJ?=
 =?utf-8?B?WGtBT2pJbTFzQ2kzV3MwbkNpQi9sNEFnemdLTnR4MW8rTTBwdVdaYVhjV0R6?=
 =?utf-8?B?VFM4a0JITXR5ME0rZ3VWbEdwNWJ6RjVKSDJxYUFmcUhIWjdKRXlkQ2RGVjQ1?=
 =?utf-8?B?ZEthMVpMYThKQlNneW8xSnVZN3RFcHgyNi9FbkkwVXJ1U3FsbXoyalJhTGR0?=
 =?utf-8?B?bUVJSk04MmNXTE0wZmZRYmsxcWlVMDdwLzd2THlPUzVQZlRYWlQxUUdJTlFm?=
 =?utf-8?B?RU0vaHYrNVJ4UWc4KzUrMkh1aGpFMDRXQ2V4RjdTWW1oYWhycG9wOFZ0bm1u?=
 =?utf-8?B?SnpxRUpEaWhlN2VxbUVBU240RVptNmlYYXRJcTQzWUVZaDdqaFJGcWQ1RERV?=
 =?utf-8?B?WHpQVmpuQk1EdGcranc3d0VTTDg5TlhvcUV3S2lua2hlQkFTYmpUczVFOUd1?=
 =?utf-8?B?Q0J3amxLZ1B3bk1EZ0ZQbTk5UDJ0c2Z2UDRTTERuaEZzQW5LM0k5c1JSbUk5?=
 =?utf-8?B?c21PWEJJRGlYNUJVVWlSWFJha2dQN1FwZDRqT3MwTThqbllhTnJlc3lMdDR3?=
 =?utf-8?B?Rm52V3NZMEZIRzczY3BEL2lEMFppbmhpNENMK3o5V3dXQTk2elZTS1VuM3hp?=
 =?utf-8?Q?WkWUSvP2QEYqF2NzMB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b76dfade-a1f2-4bfc-a840-08de6d9042b3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 19:19:09.6522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqYkJQ06kMQj8vyb7QFwlfvuGhUW/wltTLeJ2RWaJUw7K9Za1VD/Qmhlc3bPiOjiUb3wundQtfjU0yP+PluPXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7599
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_111916_212674_82F9BCB4 
X-CRM114-Status: GOOD (  11.10  )
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

The i.MX93 uses the DW CSI-2 RX controller, which is similar to the
Rockchip RK3568 implementation.

The i.MX93 variant provides one IRQ, two clocks, and no resets. Add the
"fsl,imx93-mipi-csi2" compatible string and keep the same constraints for
RK3568.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- use RK3568
- add Acked-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 47 +++++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 2c2bd87582eb8bfdd13720edd62a5f00dda958ba..4ac4a3b6f406408b9524c795e6cdeb117d3353da 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -17,6 +17,7 @@ description:
 properties:
   compatible:
     enum:
+      - fsl,imx93-mipi-csi2
       - rockchip,rk3568-mipi-csi2
 
   reg:
@@ -26,14 +27,23 @@ properties:
     items:
       - description: Interrupt that signals changes in CSI2HOST_ERR1.
       - description: Interrupt that signals changes in CSI2HOST_ERR2.
+    minItems: 1
 
   interrupt-names:
     items:
       - const: err1
       - const: err2
+    minItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: per
+      - const: pixel
+    minItems: 1
 
   phys:
     maxItems: 1
@@ -88,10 +98,43 @@ required:
   - phys
   - ports
   - power-domains
-  - resets
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-mipi-csi2
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+        interrupt-names:
+          minItems: 2
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+      required:
+        - resets
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx93-mipi-csi2
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+        interrupt-names: false
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 examples:
   - |
     #include <dt-bindings/clock/rk3568-cru.h>

-- 
2.43.0


