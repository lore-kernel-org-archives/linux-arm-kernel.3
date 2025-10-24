Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C358ECCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 09:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DuzCz38hh1POUuywz+NctHzY1r7zMiY2Y0MwOQHcUfE=; b=N4CBlOMyTR4BUrgHyMz7gO3zWA
	clbTWafCcS+GjbwUSPZ0Js4cpssk9WzvmZt5SBHc7E2ibzubRbK3h5kQk/ImMFgIFqmgRjjmtEQd+
	8ryrzxqGm4fqocn1Zmaj+Ri3Pl7oFSHfPj0OijCr9QKo1aPwBi0JWlCGmpKkgF66qkF0SrMqDSiRR
	FZUUwaPftgwel+Huh51yN27wrU9TIlG3RcdDvRYHnYMK20p00NlbdVxolaUdIIeVYd9RaH+iKd4qQ
	bk3uO3cKKX3Pwu7SfobWkKimlPFlNexAxQ+MNZ+deuqj3bOAi/aHylUNwxCQBI9QSqYA65IoRHgF9
	2d1hmMGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCENj-00000008uiC-0wG3;
	Fri, 24 Oct 2025 09:46:47 +0000
Received: from mail-northeuropeazon11010068.outbound.protection.outlook.com ([52.101.84.68] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCENh-00000008ugb-0kRC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 09:46:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaMlK1/lCoZhkYrkHplrRD2EA2EqgVcSH241SmrDc6MYLXXAdaBYgNuHYZif1gPjiBlB543Sgd3Hs6wijHqfEmvCr5xmPPTCoyqUTt/mwJfhodsWggbcJabVrobKYi0SoOAM8YddwiQ0tOlpE7AnzugAiuI7jmAcspShdqeTWk5/K/tmxWCCCQJszTfdnlgP6MeDD6zstBBUW5/sdfmgcOVSNuL49jJlz3x6SEXaneCtfrIDAaKmBQG2CLFiOa04Gu7SRhzH5/lSvdZ7lmdvRFGnn0pAMYhDXkoemQYU2JlkyE1X0plrNMz2tJ6CDGOOvgdIXFXF/Rcu7ZU+fmxqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuzCz38hh1POUuywz+NctHzY1r7zMiY2Y0MwOQHcUfE=;
 b=PHj26T6payyUB+NFLyO9APJWRyk/8fi8K84JdQi2arWRs8GSWcIJRYfjkwJfcVc/YHEjZtJ4MPwN1LR/q8x5QGkiapVkepUI0FOxk0q7mXSWW+N8ZjGYR1zOd54v3xaVYVb3mQMBQtz8II0z+Ct69m+Rlql0IJdV8Nf2z0EzG53xiUBY4qIkO4STyXvvk6v8gPAwQ1rhEjLOZIkXZGD4Q1zeRTGYGB6MbtwTk9Y8zyL0tWQIJOAuTvW96A48RHm0J8WmMto57mrdzst9TV9xiOKaAQ/tIKwnpSQYC7XS4IpSYj+DtH2nniHEY05w2G5+a8H8uUhgNdIpXum3KIvUag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuzCz38hh1POUuywz+NctHzY1r7zMiY2Y0MwOQHcUfE=;
 b=h0uSiWMaFsy/UtbwEwdIcfj4K2cqb+rdPyc4dc4ze4DV6TqKf4uz6NH8wIPKlPmghcr8xTB4SKpovG8his+/zufp0TGpWxBLj9ch/AKWCI43WiHCqakWFRG8lZwMv8SYSqXG+HL9p+LB3Q89IHbrCq29n1iHxeNmHtYaIY26nzajyOXY3B356BLJsVRyDmcY/KEb3GYxEw2RXJNqQ8lfZF/h+jxEj+GGvati6KVXsaTBpVrNSQOcVf0FqKZHrIYvrEm8CIsaZ6uyGXMqTFjotXmI6c6D3AKmlw78uF6VlFcdj1IH+IluxAkfkz8xIl2nyyPPuUx3pUPen5VWPZjhEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22)
 by DU4PR04MB11361.eurprd04.prod.outlook.com (2603:10a6:10:5cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 09:46:39 +0000
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488]) by PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 09:46:38 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH 0/3] media: nxp: imx8-isi: Add ISI support for i.MX95
Date: Fri, 24 Oct 2025 17:46:51 +0800
Message-Id: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAtL+2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0NTXaCK+MzcCktTXcNUY0Mz47SUVEszIyWg+oKi1LTMCrBZ0bG1tQD
 KZ6qtWwAAAA==
X-Change-ID: 20250915-isi_imx95-1e3163fde962
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761299238; l=1018;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=OgNHrqX60ArzySYsdOcSFy4WPyCAPdiIQxrSVWRKtLo=;
 b=dmgkFfCEmV07Hufsl3UcGeF4WvFaWzVaQIwOk//xI5K8XaUNZF47xc9XtyJJgJ2c+m5Rzl2e7
 aU1lgtrdGXwDQuhwxXLPOVQit4T5adJmmbDvmQd+RqjwH7ZcXpTHwhU
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To PAXPR04MB9089.eurprd04.prod.outlook.com
 (2603:10a6:102:225::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9089:EE_|DU4PR04MB11361:EE_
X-MS-Office365-Filtering-Correlation-Id: 2471206f-f859-4edd-6854-08de12e23a72
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|366016|376014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2NSa0M4VE9leDNUcjNVa2hFRmQwYmpqVWpBTnA1STFjQ041OWo2SEpXUGtR?=
 =?utf-8?B?dTJ3NDZ6Z3dHcVlMNHB5LzgxemUxTjdNbGwwZi91WVJkaE9oSVZwSFU2MmV0?=
 =?utf-8?B?UktyWGM3eExyZ1hzVmNNa2NhcWJLcENXcGt0Z3ppNlg5MHFvbWYrc2R4WG5o?=
 =?utf-8?B?VXZON0Z0OFZ3UWpJWk95c2hPcW01Z2hiSkpHN2IwYWNrdHA3ZXpsVWFMaUJm?=
 =?utf-8?B?dzU3RTUxL3NGZ0hpSjNHNEQ1OERoRFRyTTJDc2RRZnFFV09uaGNtTFN2ODZK?=
 =?utf-8?B?SVBBR3o4eU5UbVM0OFByOHBJZjVRdUdxeDJGbkFxSlg3UFBWcGlNOE9ESUpo?=
 =?utf-8?B?REVtTkpheTZZckxSNUpIbTY3dHpNUnFibHpUSTNocitXcml0SjJZSk9JSlZw?=
 =?utf-8?B?NEh3VVJ3N1FrUUNVL2w1MFVRdW9tMUxEWWhzU3Y2d2ZhTzhWRnF2ME0xMlFn?=
 =?utf-8?B?WHdINFdHSmx4NTVsdnFrTURYWDZBeUFvbHZ0YU4ySzY2YUlQWG5sOUpzVTFQ?=
 =?utf-8?B?eWZ5cjJ0VDF2d0pLTThMVHZVa25wMnIvY0xuMnV1bkZGNyttL3djOXloMEpC?=
 =?utf-8?B?bzZSaXZRSzhyZ3FHamdGRlc5QWo2dWxQL2NMcnVUTlo2dG9BcWx5UGlaUEx5?=
 =?utf-8?B?TkR6aWRHYksrd0RKenByNTNrUlZWK1AvNDRScXBiZlVSb3dJdkY5V2sxNk5l?=
 =?utf-8?B?SGE1a2dJdnNIcmNWRHBBS2taWWxtVnBrYWR1U0Uvcjh4Q3V0TUw0Zjc1Yys1?=
 =?utf-8?B?UDNFaFRRMFZYbmV0dW9LbUpCT2N0elZ4anhucmRiQStPcnBHUHZLc1BZYWZa?=
 =?utf-8?B?SmoxdmY4SGdpUGNMSVpNaXhYNk00ZDdCcDZwWnhHRXVKSThFc0haTHZmWGpa?=
 =?utf-8?B?dHU1bnpycjVqY3RNMXFveU9kZ2tWVEhjVTB6clJnK25pVWpINnJwOEgzaGxx?=
 =?utf-8?B?enVjcExPSlNXT1dPUndqMEhpUWd0bmRNaXgzdDBab2lGKzhCS0k1UlFiSDNm?=
 =?utf-8?B?ekd2RzUvdVJxSjNnQU9kTzlkeHQrVWVobTZtQ2NGdlA0MmhVbjBXUWxhcDZU?=
 =?utf-8?B?ODFtMDVSbnFqWmdab01hNVRvR3UwYjU5c0UyNjNIR25CRCtlZTA3YWRXYWwy?=
 =?utf-8?B?MXFrN3dqM3BRYkhLdmhjWlFXZG8zeGtHbXZLSUdNZ1NRZVdVMUhzYUloSVRW?=
 =?utf-8?B?cVQrMTRLb1RUSXp3dmJ1UlY3R1pXY3U5akNOZDFFYWM4OFZBQnIzOXgyVnRv?=
 =?utf-8?B?RFBnc0FMZVJzb3l1Wk92c0NCbXAzYW9nODNNUFkrUVpWTlNROGgvaUdXeGI1?=
 =?utf-8?B?M25MeFRublJoemJVNm1XbExqWmdYZVZxR1RhTENkOW5UbnBCSHA5d0JLRWRq?=
 =?utf-8?B?bDdYRlhXcHk5blQzSENVd1JmMkR2cENUMmM2b2xZWE1mNkppQ1ZSamdIVG10?=
 =?utf-8?B?UlhGVysvK200WVY3RDZEVWl1bXlPcWtMaTh1cHU4VXpwT0hRWVNNK1NqLzlP?=
 =?utf-8?B?R3huaGpkakNVZHp6KzBrTXluRUVzWXhGZFpkK2Z4VzkrTlhsVTk5Ui92NFpF?=
 =?utf-8?B?b3RadzZQQzlFMFFCR3JLNkFvRUxMcTFyRTdFT0FXWEtIcG9SQlN3N09oUGRU?=
 =?utf-8?B?QWJCbGI4QXhTamdqN0EzZGs3dGFJOUJ0SlVGeTR3T25Vbk8waWN6RitMRnpT?=
 =?utf-8?B?OU00bmxtbDFkYlZyWlR6cFhReFZITG9Oci9nVkdmQVFyMGY0LzlaMUlSVThW?=
 =?utf-8?B?dnpNNGx5dGdYdmwwZ0VFWXI2UnB1R2Nja1VUZmxLT0JQRVozYUI5M2htN251?=
 =?utf-8?B?aWtZK0ZnZGpzU0Y5OUVkclB6TjVxUkU0UzNYT2tGMGh1OW50dVFYRGZhVVMx?=
 =?utf-8?B?bXVTWmFqQ2VGdkV5S3hJRXdIT0prdE5ZU2JScnZYbGVkcXAzSU1JWXhzRnEz?=
 =?utf-8?B?T1R5NjBoMEVPZHBXRXZrR01CbU1OVGpaZnRDS1duaTBpZzJRRlBXejFoUGVC?=
 =?utf-8?B?OEJUb1Vpa3NXbW9PZytOcVNQT0xaV1h2SFRZNHBCQU9IbHlZdVROT3BtRUJ6?=
 =?utf-8?B?Qzhxb3pWVHdDWWJGc0xxWkozMW1qOEo1ZHhtUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9089.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(366016)(376014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TC9YRTUwQnNkSlNyUjFsQllOUGc4aUlUQUkzVkxXWUszSXB5QmFmenZVY0d3?=
 =?utf-8?B?MnJxS2N6R2RrdDhBNm1pUUNyNVoxN2ZnM1BBeU8zMm9nNVYzVStpaTI2QTgx?=
 =?utf-8?B?ZGNaT1JqVmVvWjY4eEdsT09YQUxIM0UrWXJxWHgvRnA0eHhrNUdWbHhUWVNT?=
 =?utf-8?B?ZTdscWdpMGNnMVZrSjRZaHdSS3o4OWs2cG5OeWIrOGo1eXhBOE53c042VzV3?=
 =?utf-8?B?NGZxN1gwcjc1NEI4MmcyTEZ6MGI1dTBJZGxLcGg0bWs0OUVIWERKRkdTUFNY?=
 =?utf-8?B?dDZmUDhPQUdFZUxVMUtCMzNyL0pORm5MYWxrcjZiVWVMdXQyL0hvNjF1U0Nk?=
 =?utf-8?B?Y3F3SWFEamRsZjFnRDNEYnZFQUVYdk8zUllWN0lySVRRRDl5czdYR2tjYnlK?=
 =?utf-8?B?K1pQalNGMEpiVEFTSjRoRmFZdkgxc2pQNHhNb053RkJJTmErdUxFbHpiU1pj?=
 =?utf-8?B?eXIrVXlpbDRTZ2g1L1NzOEFEVHdWeXhnbGdnWmkzNHd6VzVNdFpHVFRWY0xL?=
 =?utf-8?B?bEw0QVFjWHZzaHJIMisraFA2L2FnSFVkczBsSzlxODJjbnkwczc2QjQvQ3Aw?=
 =?utf-8?B?ZnFJYlVjUThMcWpBMnE0QzluRjNrQ2FIcU9PUGRzZ0twN0c1Z1FpYUEwTU1a?=
 =?utf-8?B?cmhOOGpzVkVKejF6V01KZXpSTUlHY05iaXN1a25wc1V2N0ZrTUhSdlRIa3Rl?=
 =?utf-8?B?bU1kUkE5V20wSkt5Q1pxY3BScy9zUEVYVGo0TzNWeXdqYUppUjdRU29CWENB?=
 =?utf-8?B?NThEYksrVGdZdEVRQmFaaTFweklpVVNCbmVBWUdWdEYySFJrL0s0OHJIRFpo?=
 =?utf-8?B?QjFKQlRtRWdhaFkxYStkVnd4N1N0eFU3cUFha3ZxNmhFMEFqUUZnUkdvV2lV?=
 =?utf-8?B?dTBKMmxZVyt3UnhNUHA0ZjRFMEhDNkRpOXFwRDJSczRnVGh4d3NUeHJsbUdM?=
 =?utf-8?B?VHhnTmRadkplWDl1WXcvWnI4SW5uYU83dWw2KytWaGdGUnJHSFJVQ1h1NjZj?=
 =?utf-8?B?cVJOckN5UlBUNWwyWkZ5QTN2WTZDTjU4WHdON0pyUk11WnVIMTdGbGtycjI4?=
 =?utf-8?B?eFZrckZQYlFHWGdPbWpkVENBOFRKZ1BURnVhdXFDbFZ1aE1YY0xxT2JtZjcy?=
 =?utf-8?B?TVRaQUI5dklvUkZtenBXYzFmaS94OU1VQXBoYWtGNUFlcXBGR1JaMFZFQnRy?=
 =?utf-8?B?eFowSElmM0lHakh1TDBNb1dxZk1zTjRTbDJ4WnNlcXczWU5sZTEraktIa05y?=
 =?utf-8?B?UFJIN0lKR0JGNVFNN2M4aDU5K2lYNElMZUNsM3FiR0RnUzFJeE1ybkhNUTVq?=
 =?utf-8?B?OUo5c1NVUjI2MDRja0hwdmVEOHl6VGMrRnZFK2s1SFcya0NuQTRyTXI2WGph?=
 =?utf-8?B?cUtoL0M0M3g3d2dBMUp3amVRKy9ndnE5VEdiZ1JGNmFCanczem42RXFkL1Ja?=
 =?utf-8?B?bTFwb0tTcXNPVkdPRlRIQXlURFVFbWp5VGxuSTNEY3ZYRzNNTWxMRGRWOXI5?=
 =?utf-8?B?UzRWSUc0UThkbzVmcERnMzhjS054dUpwVXlHQ1NzZmxRcDQzaUsrTy9Lekx3?=
 =?utf-8?B?RmNaQy81c0dpb3l4azBqQ3h3ZnkveFkzL1U2R1B0WUxUN0ppT0syUUszc2NS?=
 =?utf-8?B?WVIzNTlvZTFPM2EwM1NSTGJacHd4MldaYzRLWFRZUms1cllXZlRHOUN4azE0?=
 =?utf-8?B?SGZmaXJJN0ZWTHo4MG1xRld6V0ZLdG9vQlZTZ2ZVWkJmMitVckVTSzFrTHp0?=
 =?utf-8?B?WkdiQTlMYnNsbTFnSUNibDEwTzcyNlA5Vk04dVNRTW04eWFyL2U1TnpRT3cw?=
 =?utf-8?B?N1dybmF1bHJnbWJsdGFGUnJDdEJkYVpWaHMrWWx5KzBtMk54bHFsdHQ3eHpX?=
 =?utf-8?B?b0V2YURLTGFxbXlIMXdodFRSNnpadVMvbEsxRzdOSTltTnpqWU9GaVlMRXEx?=
 =?utf-8?B?MkltZ014K0t1THh3UXBESGFVQXIyNDAvaXpWdml4em8xM0diSUM2em5RTDd4?=
 =?utf-8?B?YlZsYTFlOVNSQ0Jubkp1KzFBSm5VUENlK2U2TDN5MTZnaWpSb09VVU41WWdF?=
 =?utf-8?B?dlhuZGZwdHFjS09UeGhCS2I4U1MwUi9Qc2lISFUvU1dXbU5SQUdySUVDMVo4?=
 =?utf-8?Q?n6EH6ljLojWoLknb3YIrKEtXE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2471206f-f859-4edd-6854-08de12e23a72
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 09:46:38.8002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbKYuQ2L8/6iNVbnJ7ObgUeD8YDfJS6TmfdPOHaPHBZlsxg+7fVoprQ8lxqOr09mjePUINXBO7fQqK/CvhFbSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11361
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_024645_227497_2D6D9001 
X-CRM114-Status: UNSURE (   8.53  )
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

The series add ISI support for i.MX95.

The ISI in i.MX95 supports eight channels and interface up to 4 pixel
link sources to obtain the image data for processing in its pipelines.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Guoniu Zhou (3):
      media: dt-bindings: nxp,imx8-isi: Add i.MX95 ISI compatible string
      media: nxp: imx8-isi: Keep the default value for BLANK_PXL field
      media: nxp: imx8-isi: Add ISI support for i.MX95

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 26 ++++++++++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 13 +++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  2 +
 .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  | 44 ++++++++++++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  6 +--
 5 files changed, 86 insertions(+), 5 deletions(-)
---
base-commit: 1fdb55ed40fa5ebe6934bd6b93036c714ebb5ef8
change-id: 20250915-isi_imx95-1e3163fde962

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


