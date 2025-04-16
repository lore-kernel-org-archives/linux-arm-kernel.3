Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5CEC369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 05:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSK/mul7K81VZyWxDXbRLiNfHBnI2TvagRlvuYgM3bw=; b=i3tc7nxdYDPVV3nj5JOeaWsO+H
	QDF+3+qfEhGQAe7rWIoCV7BM5SUricP+rUm+FOXlgiyqMlJ7+JCil31+C39mpG0/2G4MtSGY6F6eC
	qEKxvxqg4w2lsckekOp88lGRUMbP78FH2ja9pIK8RXen/Ankj4YCZPmLyWUgDD65xbiU7tKtNbe3l
	xPQuNsdxipTpb6kkgUZvHKq1va/UMmct6Hi/qtPhds3N4Eg6ZfsRsSGkiJhNrhq4Ac+0P7wUtcSTi
	xJxlKm/MH/zfrW1wraSj2TeKHh9DesgHoQwh6K9SPvn0fRIuFqGIupvz13g/qL1z9+5K1e9q6UuQr
	hQNrj6+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4vAA-00000008F92-28jY;
	Wed, 16 Apr 2025 05:18:18 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4v8J-00000008EjP-0XYY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 05:16:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5Ox3i251IOgTda8m4JJpPBIWeP+TkiHs66RdMuKsY5wHzDIb9N5hiHg1ssRMLfwb0spn0itGXk0xPVN2CmDOf3Had9spRsHmVmzEfD0ghNh5SkZH3coauw6IZpSYZ1F5z6mn29kS2sye6RnqBhifdn0QCwXN0lw8xK0/SlKiEi3fjGxCz97HJPISM7lZJiCbciCZvSHuNu2YKhT6IHsw+KcfQjI6lO21RstmSwCLeltfFgWGTueqA/6Y3J0s0k/hLWU6IZ3XhIMDuW1z6U5TALY0ZivQwuDHreOjwHhYivYaSKgLREytWvut6e8K7HPU47n+9ttqCqOaCDb5Je3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSK/mul7K81VZyWxDXbRLiNfHBnI2TvagRlvuYgM3bw=;
 b=QXWKBLs5CqpgJVNBeNCNq2XTHE8jqLHH/bdCF61ooKyOAdkRRXwap2JLSI+chHfvK334RTEB11FvasjX7q7mNcpVpRcm8bqntEcVH527t8oC1W4+3ouFQGFo+P7+2I+v3kArU4Il5bGplBdm5SaCGxsHFFCwIq7dqUdDxCHfNDqWR6iZEiB7ECvM+GsydNyuY5w/82xDYcxar1x/jsPK2B1oRAm/+/bXodIQkYgi+9Cath6sGcz1c8AbU5emlsADqfIm6X059UVod7XrGNa2QPdAyEfnK1h0iWBVAADQwXC+2KgYy6Mq5wjqm4Yu/cI0kStJR42eXGnFMi0PFA5PoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSK/mul7K81VZyWxDXbRLiNfHBnI2TvagRlvuYgM3bw=;
 b=RlMTnpAuvmYHyFr+Pri81Hrs0pFRYFTtaY1Pea/OP6/1SZ8sKf/On5vu6dWG85eZjzz07cIfzOltZGl9gjv6q+tBzjNqvsftyrUN9Nh9TH4zW62AJdO/0JivhyuVP7xyFqJjB3CcVlDBZZ1M1T2jvt/sWnj3i3oxUqkKIbFhqwKCQCA82bo6hEPLQ8WX1cpuqJb+qSA6waGUBQoZUE4FwFBFqMKY4d2E7h41hVPDG2Wj/CGFBeIggOY7/V9Zllka9guEsOYdhC0nviuM5wsjmg7PPikURNBsJ+vXH8TEqgXji9RsPkTLyrtTiuVpeA117DuDPF02nUIPhN5rImoFLA==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DU2PR04MB9116.eurprd04.prod.outlook.com (2603:10a6:10:2f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 05:16:15 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 05:16:15 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v5 net-next 04/14] net: enetc: add MAC filtering for
 i.MX95 ENETC PF
Thread-Topic: [PATCH v5 net-next 04/14] net: enetc: add MAC filtering for
 i.MX95 ENETC PF
Thread-Index: AQHbqsrnhddQYwLh8EmRihJXUf5Sm7OlrZwAgAAZnDA=
Date: Wed, 16 Apr 2025 05:16:15 +0000
Message-ID: <PAXPR04MB85100BB81C6B25BFC69B32B588BD2@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
	<20250411095752.3072696-5-wei.fang@nxp.com>
 <20250415204238.4e0634f8@kernel.org>
In-Reply-To: <20250415204238.4e0634f8@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|DU2PR04MB9116:EE_
x-ms-office365-filtering-correlation-id: e79cdbb0-7df9-489d-a8bc-08dd7ca5cfc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?gb2312?B?TXQ1VGRsOGplbDRabXdpamRrSVB3THR5blVub2FQZnFnTlkwdWpFczJ4dzRR?=
 =?gb2312?B?K3U4TE55cEpCUDR1T1AyZWRnN1Y0c0VzNEdVbDRMQzI2UzVLbytUaGdZVWlO?=
 =?gb2312?B?N1U5dDRucmRDYjM1SUZQQTFmRndhQS8zKzhaa3pNaTlQS1BRNXBaY29ncmlZ?=
 =?gb2312?B?aW1HNFkvQktYSENJQVF2a25QS0o1S002YmJiQ2dsd2QwV1FEbjgrM0tTaDVS?=
 =?gb2312?B?K0hlTDU0RjFGV0JQTU1RZC9mbW5PS0Y2OW9FK2EvaGdxZVAzbnFMN2J3M2lC?=
 =?gb2312?B?Y1NSSmRtcGNlaWNTZVNtamRqeFJFa0tsLzVzNXBWZ0I0ck9wTFppR3luaFJa?=
 =?gb2312?B?dGR6R3NlVGpGUU54V0JxekRxM3pBeE1aZXRtME93RmNxTmVjeVZHQTJ5TDZ4?=
 =?gb2312?B?eUgvQTBDQ0lkTTJBM3R2Snc1VEpnTkN4WTZubU81SFRsbXZ1WFA0WWI3eEhw?=
 =?gb2312?B?T3RxMFpGUGNOQU11b3VpZklpazJkQVVmM2o0UGh4WDArbzdYc3FzcTF4bWxm?=
 =?gb2312?B?SVN1S2tuekkyVDB3bjBISFUxREovc2JOSVh0Tk9YUjVBZTRWd1IxNTVqUFN4?=
 =?gb2312?B?K1NGdUdHdC9JVkc1VE9rZS9hSFBRaDA1NHlaZWdpdDlCK1phQ2piRU1YYmx6?=
 =?gb2312?B?YmVtRkJsVlFMNVhyaThEczZKUnp4NDhFb1JYSzlMT1AveXlGZCtjU25wN0hP?=
 =?gb2312?B?TjJMTTRRamVjQTZOMFpEaE5CNFpLdHJTZXdaUG5qODYwUmJxM3g0SFdLM1hZ?=
 =?gb2312?B?MitVMWFEZk1TRkJTZXpKZGRXeVNLVlREY2dqNERIRk04WDN0YmFrZXdTbTVi?=
 =?gb2312?B?VTYyQldkVDlWSVA0WlJNWVlCcHdNdXVpaHVVUkJGaDJkNmRiYlR2ZTNEQzVD?=
 =?gb2312?B?SXBjSTZPYng1Z2tId3ZCcWpqYmo3YXVjekI5K2JIeTdlaDF3MXB5clAycllG?=
 =?gb2312?B?WjYwZFRUVG1jUDVHRUpFb2VtQkJRTE1rcXZia25Cak53VFdZaGkyUGhhZGpH?=
 =?gb2312?B?SlliZ0wrcmk4RkFNanhxZmQ1dVMydE9TamJRZlQvQXhZeW44anpGazI0ems4?=
 =?gb2312?B?TmhMOWFIUkJFSWkzSkhqQWJLbWVyQ3lKbml5anFlOXUvcG1BZXFrczBvSGsy?=
 =?gb2312?B?b092cEpzc2hJZ21JcVBQbUxuVDlwSE5HejhPMmp0QVl4aERGZWdnQzhveFlG?=
 =?gb2312?B?QS9IRU4zSDEvMS9hd21rbWlTVy9pR3JTY2d2TDRjZFZGRXJTNkhYUm5xUyt3?=
 =?gb2312?B?d3l2ZmdHSllrM0RCUE9LV0ZyQmFZQ0ZLTUU1RHVGWk9YRVJhQXdHU0t5TlZT?=
 =?gb2312?B?S3huSlBNeklscVE1dXJrVHJUZGFOajMrU2FiT2d1Tnhib2NBMVZnbjFDT1F6?=
 =?gb2312?B?T0lXanFhQWk3cUJrc0xRV25mTFUxUk1xcU9VakpRam11UEhiaWFnOXFNK3RH?=
 =?gb2312?B?amxDYVBKM1IrMkc5bWZnb3JSMTd4QW43UFVKZHVuTkVobDAxWkhUeDFRSGg5?=
 =?gb2312?B?eVIzbkdOR21YM2RXN1NZTittYmVYbUZpVGNrYUVFTzZ0T04wVkViS3FRbmFZ?=
 =?gb2312?B?Sm5kRVVKdjZyTmRwWlo2WHVCTlBBQTA1Qkl1QU1UcTZTSEIxdHpwenFKOFRC?=
 =?gb2312?B?bm83MHVMU2dUa2EwYUI2ZWw3RENSdEhtb0VzM3d3ZnJ4b2graVdGSzUvWXJY?=
 =?gb2312?B?a3RmcTFLUVBDY1A0aHg2TFhwcU8wZDZHeG1GNnlZV0FhU2JpZndwb3ZwVjBw?=
 =?gb2312?B?ZjhxenR6TGNrTi90bmZobEp5T1p4c3hIOGJzMGZMZThZZEYxRFNSc3gyZ3NV?=
 =?gb2312?B?K2tTem1JbzAvNTJHdG8wZk9DVXhCejFScFpmL2IzWkh6eGJrZElGeXZ4YVVw?=
 =?gb2312?B?S0ZXVFd4NDRpdnA1ZFZETnF4VHoxaVZJK0VRNUtZNklYdEVaQ2ViblptN3NE?=
 =?gb2312?B?cVgyZVJhUUJNNEx0RkRWdDF4UTF2TnBhVm0vei9EUnU5NUZmNGNuaEw4aHB3?=
 =?gb2312?B?QnE1OGJYMU13PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?ZnJ4czVJYzR3QWNyWThaVFVIY0V2aG00NHF4NFUxZllobGdleE9TK1VTYjBJ?=
 =?gb2312?B?cngzeFJ5TGRqR1BObi9NWUdmNlhkVUwzWHY5YnRXMXZocVhkR09ialFZdVJy?=
 =?gb2312?B?ZU5BY0pPc3oyRElpcXFtN2NHMmhVMmZnTTl2Y0NJUk43aC82MGo1b0JmcGdZ?=
 =?gb2312?B?MU51cG1hUDVZZ0dGem5vVmdXZy9iL2hlbWNFT3RjR3l5NjdnOVpOZm5NY1Nm?=
 =?gb2312?B?UjljaDZDNGtSRXlsS1h4Z0IwTjNVRkNUdkxIazlUZzMrYTBqOGdpSC95UDJ1?=
 =?gb2312?B?Vmc0dWt3S3pLMnBoL2dTbnZZcjJCN1Q4MnZLTm9DcVNlNThNSHpIWXVkVkVr?=
 =?gb2312?B?MDJGalc0Sjd1NmhkTGNabjVvRmF1Z2pCcGFBamNEUmZlZGhmK3Eva3E1YW15?=
 =?gb2312?B?UDVDZ0NRUThjZVR0Y3dkZ2ZrMGNqaCtkUXNvckVmVXlOUktSVmt1OGV2aGUr?=
 =?gb2312?B?RFF6OCtsU1J0Y00vOEt2L3lDR0ZCUG1TUUt2WVNLTzIxdGRFMFh1Rmc2SFhZ?=
 =?gb2312?B?Qm4vSUNnRjhKeS9OdC9iSm5QN1gyelQ1NWliMmZwSERNS1dBWG84VGlDeTN5?=
 =?gb2312?B?U0x5VXhtV0E4ekZISk1qR2dvVHpJK1dWdXV5bVpMZ01pSHpnS2hlL0NWOGxz?=
 =?gb2312?B?ejFQalQ3eGFlalUrM2x6S0QrNjdQU3dpU1ZWSS9JeTByc2x5UUs4REJqYi9R?=
 =?gb2312?B?WEcxOER5N09rR09wbDZYMmJOQUQxOGUzL0ZYUFBoV1dpYjl5NTV4b0xwLytL?=
 =?gb2312?B?SjlyckRiUzZmNkZSUjZhWk53S0JTSnhGcjZ6dzhoeXVHMlFQYjIvWUdzK2la?=
 =?gb2312?B?V0M3R1BZV2pqZFVtTEUvVGlraUFXbXE2MlAydmZjckloTnlIMkk5S0Y5ZkpC?=
 =?gb2312?B?OXNVNi8yVXlLVWp4OCtwZC8rMnJiTTVVRk1icGo2SHY5M085S2tzRVBjMGQw?=
 =?gb2312?B?cU85ZUs2ZUZyM1NuU2FaZnl6N3lEL1prSGYwZmZydDJPVzBHek0yTUJxbXJq?=
 =?gb2312?B?K3lmY0ViUDFCRVBkQk9sYnpaczJSejA5eTczc1hLdUtHWlM0T2xMYytXRnJi?=
 =?gb2312?B?MnBSNkNDSXJ4VmFUL1R4b1pnUU85NURKdlc4cDVGMVIxbWdoRzE3ZCs2cWE1?=
 =?gb2312?B?SjBnelZQcjZ0VWNhM2lnbThLZTFFTDJFTTNnZmZTNVBQNmVyTERBRUNYU3Jz?=
 =?gb2312?B?M2RtNm1SQnJuUk9XK2pjTzkwUE5PTXdzMlNhZFpIZG1wV0dDTTZjZTlRVXF3?=
 =?gb2312?B?aXRCamRrdWphMytZZ215Q2l6N3JZRnhPRGNxL1FZUjROS3dxVnlwRGtZcGpa?=
 =?gb2312?B?clhLaWkzZ0FwSkkwSGY2am85MEZYU3d0a3YwOXpIQW9ubUVhLzd5STk3TFFR?=
 =?gb2312?B?SjlZbHBVdk01UUNHMnZKRUw1RDgyRGRsd1BkR1BCQzVGeXBzd21GQVFUME9W?=
 =?gb2312?B?eFlFY3l6cGJob0Z6aWlPTW5BZU1aU3ZrYWdrNnl5bzJ0dEU4d2lENWJEei9w?=
 =?gb2312?B?UVlOUmRBMk5jeC9mRVg5ZW5hUG9acEhicG1nTWlkNU84cndGZmdzWnZvUFFx?=
 =?gb2312?B?ZnZiR1o4Q1lhVHVqaWViaFQ3Wk1ib3E0WndtUWcrWDJiQ3lYbVgvbTM0R2R5?=
 =?gb2312?B?dXJxbWRMTnFnVFNFRi92cFlnM29yWFpFT3JVSG0zZjFqUU96eG9jRys1T0VG?=
 =?gb2312?B?Vk96dkM4bVJRSkxtK1ZVY29Jd2RUc1cvSUJwQ25nSnJxWW5HdUxrMkRHNFBK?=
 =?gb2312?B?TjZ6cTU0cXkwUE5BaWR5VGFUK2FPZ2c3WDRrVmN1c0tVd2lsenRlQU5WQWNo?=
 =?gb2312?B?bk05bURDdnJ6TUdvR09pQnRIdjBqdEtyZUNldjVyQ1A4WVBqRmJrb2lwMWg1?=
 =?gb2312?B?YTVqRHBhVXFKdkJiMkV1d3pud2dBeUVVeUhpNmh5aDJBQjBzOWczVE1EcExP?=
 =?gb2312?B?ekNIL1g4U3FMd29KY3dKM2Nrdm9EN0lPWlhUdVM2NUxPR29lMjRFYkxtRmRq?=
 =?gb2312?B?NGdXRWpwVXB3TGFHeVZMaElpK3pMamcxeUZzaDhjUngva1hPeEYxbmRhUFV3?=
 =?gb2312?B?SDlTeGlTYS96UUpTTXBUZWN5Q1JRRlBKd0xJZ3JwZzRHSnZVQUpGYmptSW4v?=
 =?gb2312?Q?OVR8=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e79cdbb0-7df9-489d-a8bc-08dd7ca5cfc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 05:16:15.3173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5+28x+E8nSpYtambauNXrJBpJtQYo0VDFqkQSAoNRpiGr9f1QkFiUnXtGMcVObN6dR31jmOX7BodO3BvmWo/Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_221623_191676_6FC89A30 
X-CRM114-Status: GOOD (  11.05  )
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYWt1YiBLaWNpbnNraSA8a3Vi
YUBrZXJuZWwub3JnPg0KPiBTZW50OiAyMDI1xOo01MIxNsjVIDExOjQzDQo+IFRvOiBXZWkgRmFu
ZyA8d2VpLmZhbmdAbnhwLmNvbT4NCj4gQ2M6IENsYXVkaXUgTWFub2lsIDxjbGF1ZGl1Lm1hbm9p
bEBueHAuY29tPjsgVmxhZGltaXIgT2x0ZWFuDQo+IDx2bGFkaW1pci5vbHRlYW5AbnhwLmNvbT47
IENsYXJrIFdhbmcgPHhpYW9uaW5nLndhbmdAbnhwLmNvbT47DQo+IGFuZHJldytuZXRkZXZAbHVu
bi5jaDsgZGF2ZW1AZGF2ZW1sb2Z0Lm5ldDsgZWR1bWF6ZXRAZ29vZ2xlLmNvbTsNCj4gcGFiZW5p
QHJlZGhhdC5jb207IGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldTsgbmV0ZGV2QHZnZXIua2Vy
bmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4
LmRldjsgbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IG5ldC1uZXh0IDA0
LzE0XSBuZXQ6IGVuZXRjOiBhZGQgTUFDIGZpbHRlcmluZyBmb3IgaS5NWDk1DQo+IEVORVRDIFBG
DQo+IA0KPiBPbiBGcmksIDExIEFwciAyMDI1IDE3OjU3OjQyICswODAwIFdlaSBGYW5nIHdyb3Rl
Og0KPiA+ICAJZW5ldGM0X3BmX25ldGRldl9kZXN0cm95KHNpKTsNCj4gPiAgCWVuZXRjNF9wZl9m
cmVlKHBmKTsNCj4gPiArCWRlc3Ryb3lfd29ya3F1ZXVlKHNpLT53b3JrcXVldWUpOw0KPiANCj4g
SSB0aGluayB0aGF0IHlvdSBuZWVkIHRvIGZsdXNoIG9yIGNhbmNlbCB0aGUgd29yayBhZnRlciB1
bnJlZ2lzdGVyaW5nDQo+IHRoZSBuZXRkZXYgYnV0IGJlZm9yZSBmcmVlaW5nIGl0PyBUaGUgd29y
ayBtYXkgYWNjZXNzIG5ldGRldiBhZnRlciBpdHMNCj4gZnJlZWQuDQoNClllcywgeW91IGFyZSBy
aWdodCwgSSB3aWxsIGltcHJvdmUgaXQuIHRoYW5rcy4NCg==

