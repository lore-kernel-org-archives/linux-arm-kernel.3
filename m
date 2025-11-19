Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDE9CF256C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 04:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eaJ+k/bAIClz7A3WiwX6LJBZCtuZ9IDwbtZNSR+mmgM=; b=TLGysywWhmC3wP+g0zeH6Na+oO
	ezilCwhyzOvBd6gAmr0otRegEAsOyDYG3efQvwwYtDcSazUwPz2GMZ4uWmZrsK6tlc6kutRVdQUSz
	Cx2+rH1gWdTOkXCxOuZ9kcobnFqBjf7lJFvs2cq7jT3W0iBPMif1gMcQCUJPF0HHNncJAIy3opDEP
	IWWQxE465ZSzcjk6r0sRvc1VC8f93w7mBlDzRmeOcVpg8yChlIh7tBOXpTjBXmAAVx9musCHXzOx/
	uq4VQNeerK7jPlNi7kOvIA95l+hYtvSLN+ue5uz/iqDyF7DsSYss/Sx6VecYrtIH5NEpgTDjUM6NP
	QmpvHefA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZi1-00000001gXZ-05sl;
	Wed, 19 Nov 2025 04:22:21 +0000
Received: from mail-northeuropeazon11011048.outbound.protection.outlook.com ([52.101.65.48] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZhw-00000001gTg-30Pz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 04:22:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XL/uEwLw8yB7RFVh5rHU7C2q0VQWhzNGbVHwutQ52asnVK+1CyBdMN7B4+h0EYZtFoBzyHamNnhWLikqtsKQmc0AWDpNwfxFNtYmllKbXCwd6PjnS4dfRpB3NSeFW2uor2VZVRGYhl1DUd6dT22FacYOpcE/0oN/pCe/kfI9HKfhXHUH6tqLLBAscnEbqfQJ42LW5GT4DBP3Z9Ke3pPV2YcWxW0ibWEyoYFeF++uEVbhg7hkXa+gQau+fXFCJ8J8Otlvt8RAyK/10uPaEaK0AqvYrmmJeWAZ6HhlBl9yucTdgD8NftWX+WtsBAEq968350fzJsqnyHwr/8Pvr5njHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eaJ+k/bAIClz7A3WiwX6LJBZCtuZ9IDwbtZNSR+mmgM=;
 b=oxLg6iYeEHxFJy4Ve90K7I7wBB9yUZTbLWK/uEE3ffPyowX6R91/G0d9NYpQA+ALDPKOw7zDW/qQe2sL+aRBXluYSClFWP0TF8AHdctzkXwY9Cr1FRKpin6895HyanmFIpfJh6N4zLAHXCsXn/xS5rjsHUKOz+lKwiqQp9Ox6Bsxdv8vNMI5vw7yGiATAUFHUUCZU7bsukN0TuAtWYOtwQ7RcuNkZ2/yAmR3i74/yZDTWpepSV3aAp4VL0KT6LmTtsBjdaY7NoPJACt4ciJUac1rn0UXH0wkZx9RVFv2JQt2uAZtI17pGSJxMhk0r5bPCoJ1w6VWgyD+3aPY7DvgGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eaJ+k/bAIClz7A3WiwX6LJBZCtuZ9IDwbtZNSR+mmgM=;
 b=b3euZhiIraacIXtc6uwECsOujolQOzPvCyLctB+H+hhCm1sBNE9lbjtU4JDCZjF/xspTVv5enWZ2N8ss/fs8NIvs5TMnRgqw27WcbJ7ToAInPL1P2Fk+OTC5jvA3Rpgnbpdvlmj3gIqxsBW356Hoo5taGjvivgReLN5dIjgRFLYb2ypvXdkVhXdQN+ic24WJqQRL7sd+5fKeq0kVnSZABqajqRgYIGPPYxiK7MtV1yzyg3EhDb8JLvB/8HIxVPZ68U23aCTVe1sZnvLOTxokO0Mt50w4a0SADVDVIn5G0csDga9wT+58wyvkPJmucEHsbo+yisSv93FlP1zqcqlwgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9319.eurprd04.prod.outlook.com (2603:10a6:102:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 04:22:12 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9320.013; Wed, 19 Nov 2025
 04:22:12 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 19 Nov 2025 12:21:47 +0800
Subject: [PATCH v4 02/12] remoteproc: imx_dsp_rproc: Use devm_rproc_add()
 helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-imx-dsp-2025-11-19-v4-2-adafd342d07b@nxp.com>
References: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
In-Reply-To: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d20f972-9258-440e-fe42-08de27233611
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGFaVE9zWmEyaHp6dmdkSjhUbVZLWktmcGJDWUN0UC9zTm9rZ0UxYXF6ZEQ3?=
 =?utf-8?B?Z2RGekNFcW15S3V1NFNKKzlib0VCTVV2YWhUUWFRKzREVGhBV3lBbk96a0ht?=
 =?utf-8?B?VjcxTXpHQ1pwTUhCQzZPMzZGNXJQb2xWNkxKWGZBajIrYWZYVTNaOTV2OHpo?=
 =?utf-8?B?ZGdVVDlGaC9JdEdhdjBTY3ZmTTBQUlVMSzBvOW5pRzNzTWptTi9JY29MQzFm?=
 =?utf-8?B?Q3BzZndDemZUem9BY2R5YzhjVFAxSWdNQzJTbFNlWU5Tb0FKbFdSRkJGMDYr?=
 =?utf-8?B?dkQ0cHh1b3JLN1RCTzV2UkZvYVhFWmVaUFNNZWZpUU5ERHFqclU3Q1RocTQw?=
 =?utf-8?B?M3ZKS3h1bUZJR3FxK3Q5aStLeXRXOFAyKzg2UTNwaWh2TWRwVm54b2swNkps?=
 =?utf-8?B?QkFselhib1lHODY5UTdseU50Y0tKbUlQaWU0QjFIblRJeVNuNElYOWwweG9l?=
 =?utf-8?B?WmlNZ2RYMll4T2gvNlBCTHZEdzdRYmp2NFI0M1lTcGJKYURXQXpWNHoxQWxa?=
 =?utf-8?B?eXo4SGo0clJRQ3YrK1RLTkhsUUFIR24wSm5zcTdvVkJhS1hLZ3pqdnJFZklP?=
 =?utf-8?B?UlZEc1dNU3k2N2NoaGFmMzA5U0RVRDlWaXFpWkpQWDlMellNT0h3cXk1eWU0?=
 =?utf-8?B?SFpKRFM3OTUweUJlcm9zQUZSS2wramVYakNIMzlFVXEweE4wNGNiN3hqL2lX?=
 =?utf-8?B?cWhMcVloTGhPei9XYnRYbUJHQnp1OENKNmFsOTRrMU9ITWEwZ0pEazVnd0Jk?=
 =?utf-8?B?R1ZCSTdvVnBYWVJQZGdaYWhnMCs0b3ZPUWY0RVdNRlNFbCtaNHJQUGt5a2lz?=
 =?utf-8?B?TEdzOElCN3Y1YTFYcGNpTGZ1M2p5VnFabXdjOVU0N2pNYnNla3orNFVYRzlJ?=
 =?utf-8?B?aUM2WEM5WUtrVVRIYk1TczRJVFpjYVFMNzFYbml2ZGxZcEFYR3NKRy9oaHd2?=
 =?utf-8?B?Q0tyRFdQZm90eDlxMzNGTm83TkFGNTR3NWFlQlRVRFZwd2pKaXFud2xORzZa?=
 =?utf-8?B?Q2M0aDdOUERXTFNPZmN6bG9YckNGMGRtSDRGQThtTkJsaU5UTUprWWVoNml1?=
 =?utf-8?B?enFrSzEyMmkzeG9vSG56MHNPNERwZHl5akVnUlNwWHl5RUFOREZOY3gxWUpu?=
 =?utf-8?B?YjUrSlYwb3c2Wm9ISWFMa21uT0xQVTd6TFh5NVl4WkNuckFpNGVqa3JQRnhl?=
 =?utf-8?B?V3Q2U1h0RTl4dHlnZ0dPTUNUMWREbnVKMU5sbjRXOWpCeWdCUU85R016TmdE?=
 =?utf-8?B?Y05OTStDTkZCN3JoOENkTmpZK1lOODJlNEhYWVJSYklpZ3RMWFJ4L2x3K2Zy?=
 =?utf-8?B?TmxzdnlYR0xNOURYNFJ6b2Rob3MrSDNkREFqR1R6L3JaSkV1RXdOZUNJTmR6?=
 =?utf-8?B?V2cvR1dzNWROcjRsTlB2OHdqdHBZamlnSjRqWFJENUp3NGRRMThwS2Yrc2t4?=
 =?utf-8?B?UGFSeGtURlZ0c2plNVJiUlhkZ09iU0htdC9NSFpwMzRxdkdGa1ZtY3JMV2JC?=
 =?utf-8?B?NnM3OVhsYU9KaElvVUFEM0hDekNYQ0R2Qm9neC9UNnhiQWdqbWZnbEFFbmRD?=
 =?utf-8?B?Y0tDa1VXVjJDTVc0czZRaFQ1ejlKUkVBYTluK2Rub1NLNFlaZXdpM3ZFUGtZ?=
 =?utf-8?B?VGluWUMyT1JLMS9XYkJjYnRhUk1jOG9lNW9nVVBDNUNqVzc5QUhIOGlnY3pP?=
 =?utf-8?B?N1cxVTJwdjVMTVJKRk5UM0tHTEh5TlQ0Si9YWjVLTVZtcUordHU4Y09VLzNz?=
 =?utf-8?B?L1pnUU84THhJWlhON2IrU3FneWxUb1Bzeko2S0Y2Ukw1dUNxanY1clcvR0Ji?=
 =?utf-8?B?TW5HdXh5d0ZFMUZDVlVnQ2toUWdESE9kNEJXTWRXVWlzbTFScHdNblVsVnJ0?=
 =?utf-8?B?ZjVvb01qOTlSeExQN2xkb0hnOFJQV3FobnpsaVo2SzNxTTJqR0NIZUswSkgv?=
 =?utf-8?B?ZUlENlIvK25UajlhdzZoNzFIemF3QVJLTitNYUdpTmdPWGRZWXZ1Z2xYN1Bs?=
 =?utf-8?B?cHp3K0pmNkxEVzZINVpwUVhvYSs1VFFFb2dSUlZGSmRJZDU5TmN3NTNTOFFy?=
 =?utf-8?B?dm05WFJubmlKeHF6ZDhXem5saGpyNTkzSEhiZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTFNOFhOWXozZEx3VXRjOXdBSXVjeHZ1OUFmZWlMeFVMdkYvN2VPQXI1bWhD?=
 =?utf-8?B?LzBYd3AzUFgrZnE3YTMvMElzbmIzNG1xU2kxdjBJeWJUYlNhcGdndzhuYUp2?=
 =?utf-8?B?SkQrcElOQjZidjIrMTExZDhlSUpobWpHUHF0TEdwTi9xcTBoRldnSkVUS3cx?=
 =?utf-8?B?ZVVpOVVPVU5mckNEV2FSRkRBY1FVc2pUUmVvWmRkOW5vWUNybjdMclR1Ym9F?=
 =?utf-8?B?NGtnQ1VoR0swOUNBbGtHeXUvd09FVGZXOUYrdTB3WTRKbkhyR1VMdmxWVGVW?=
 =?utf-8?B?UTJiRkUrY0l1dTBGUEVPcll0S2dFQytVSnNXYm1aK01MSnVkSS9XTzF2c1lp?=
 =?utf-8?B?bysrY1lHTUdkNzVuK1NUK2gvd09xQzJlTzNmbndpQmJvODRIVDJkcWpMeklB?=
 =?utf-8?B?bTVOR2xYeTUvajRIL3FuVC9VZjhpT2w2SGRLQnBkSlZBZDFTZExpcVJTUGxV?=
 =?utf-8?B?YlFmSWpuYlMrM0xVa1dWVUkwOC9lR3dTdEp1ekdsRzBnSW02MHcvYWpyVzd1?=
 =?utf-8?B?WGd0K1ZqQXhVUUxmV2dXazFhakZhR051Q0JQZUErbXhXYWlxM2RJY0d6b1pm?=
 =?utf-8?B?SWxqSHpCdi9EbVVFYUNDTjlXZ21LbSt0NkdtT0FBRjJyeDJiN2ZYZmk1Ni9P?=
 =?utf-8?B?SC9Wa2xTd3dPTitRU29BMXlsZFdnUG9UbWd5SGtpUS9RaUJVeHVrcnoxMS9v?=
 =?utf-8?B?bHJxWXZkL01Lekh3dEJIaUtMMm1DVmEzd2t5aW5UV3VBTVMxeHJRaVJCZEF4?=
 =?utf-8?B?Q094TlNXdlRPRnNpY29WNEdjNHd5ckZGd1BjQ2VSb1A4dmg0Ynk0aXdwcHF1?=
 =?utf-8?B?OEN2OGJ3NDRDVXhLbUpxZ00zWjhZYTVYdys5RnpXd3hHMFVtdHRUTDhxR2NJ?=
 =?utf-8?B?V2dQSFFJKzg3L0ZBRmkvME02dFVPVEJYWjRyYTJhWldjaVpoQ085eG5IWDRp?=
 =?utf-8?B?ei80a0x2dHVRTTFaMnBoRFFNVi9lQkdkV1BVdTg5M2hwM2tIdkJ5YUxrMXV5?=
 =?utf-8?B?RnJLWURVd2NGUE54bm5yUTR2OTZ4VFdvWk96Sy9ySG9lSDQ1SXRjVUk3UFRj?=
 =?utf-8?B?NzJqanhDbkJQZGExbSt3dUVCQ0kxTHVJOHBFK2xNckNheFdhb1ZkV2ZIWGl3?=
 =?utf-8?B?S3Y3bm9RQ1R4RTlsWGZaajNsSzAwUHVOVHhOMzVJR01OYUE5ZU84cHBZa1dQ?=
 =?utf-8?B?Rk5hU0dOczd0R3dYcDhkOS9NZFFBcUpxS0JHSnpzQ1V0MHorOWl4S1ByTnZN?=
 =?utf-8?B?WWw4V3hwdWVWZEVsQ1g1QndzeFdmU1BpN2JWdi83RGNEaHp2QlROaktGNzIw?=
 =?utf-8?B?Vjk3WktOZ1N4ckduZS9IUEtiaXpTdTJTNEVwTlRqZmtKK0d1a3BYTWRGUWRE?=
 =?utf-8?B?Z1Rmdm1UOHhrYU14K0xtV0swRWJMWW5xaklOdG1ocGk1UWE0MHppakV0b1NQ?=
 =?utf-8?B?S1RXQlBoU3hVSFZ6dWxIRm80UUVuTzVyWDFPZ01WZU9kM2E0OUtJVmhob2pp?=
 =?utf-8?B?T3VMSVo4RXhpQXQxd1NXUUlzSUtSYTROdlZmeXlncVZyRHRONXdabmxONDlR?=
 =?utf-8?B?WDZ3QUo2cDNhTXgwZFBVR2taWnFic1ZGR1V5dnYrT2d4TXBFSzl3bFBiK1k0?=
 =?utf-8?B?ekFsWmdzandpVkV6OFVFbllnNEN0YzhqaEg5NHVpR0c5Y3oyTUFJMEh2Wnp2?=
 =?utf-8?B?T0NlSXoxbjZQSTl4WHNYU1JZQzhoeEljNHB6Q3FsOUxTNHpUc0xraW14ODM2?=
 =?utf-8?B?b21nekFWUzc5YVRGaDZRVXNRR2cvT01nV3NybDZJcWJ6ZUJqaW5tcFpSdEpT?=
 =?utf-8?B?MUV1TFluK2EzWEh4ZWt1Mk4wOElVWjZtSzZSM1hxYkxEdUtMTmpjUTdvbllI?=
 =?utf-8?B?Tkk4SHNodEVFK0dscm5RMmROYkdBTjRoYUkwYUQ5eEFKQ05IN2diWS9IQjli?=
 =?utf-8?B?bFVJZWVRU3IyV3d2Z21HMWprcFowYnpQaEpvZG1FUHlZMzJNeVBITWxHaDdH?=
 =?utf-8?B?YmdOZ1R5b1RUajFYYlpDaU14M1VwY0RmTkI2amZic2dleVlISE9xa05sc1V5?=
 =?utf-8?B?MWhhdFgrQTA1eE9SaTN5Q3RCOWpGNEhVOTB4SXhUcEF2aWZ4TTM3R3RWeHpu?=
 =?utf-8?Q?XwN1kUweLODS2+aAhjXog1pMF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d20f972-9258-440e-fe42-08de27233611
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 04:22:11.9027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9LxfSZdSLqspaEwxhmD2NQorGYgt3k3XG5cB9B0lbWIBHmAtG58TVmzKcW6iCR7fhJ0XlbKMbY2VEUsCQuonw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9319
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_202216_803946_FDB1F813 
X-CRM114-Status: GOOD (  10.50  )
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

From: Peng Fan <peng.fan@nxp.com>

Replace manual rproc_add() and cleanup logic with devm_rproc_add(), which
ties the remoteproc lifecycle to the device's lifecycle. This simplifies
error handling and ensures proper cleanup.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Tested-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 1f7d15227ce4fad46ab4c6d71774cf0560b9529e..418bd3ac70a4aa294b89c5d646a89e4da5ad2c35 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1194,7 +1194,7 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 
 	init_completion(&priv->pm_comp);
 	rproc->auto_boot = false;
-	ret = rproc_add(rproc);
+	ret = devm_rproc_add(dev, rproc);
 	if (ret)
 		return dev_err_probe(dev, ret, "rproc_add failed\n");
 
@@ -1207,10 +1207,7 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 
 static void imx_dsp_rproc_remove(struct platform_device *pdev)
 {
-	struct rproc *rproc = platform_get_drvdata(pdev);
-
 	pm_runtime_disable(&pdev->dev);
-	rproc_del(rproc);
 }
 
 /* pm runtime functions */

-- 
2.37.1


