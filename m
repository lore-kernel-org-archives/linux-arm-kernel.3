Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB36C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=; b=zxtfKewJosdoMrCfPsQ/HtvtRD
	dGbOj3gi8Mhr8xUqRzTGN6NUtHZ7MzmCRLE77TsZt6lIiBkVlM8D497uLXNLZyTKZBN1752JR0C7z
	Br3sslMGiiUXCeiHCcBIZLE/LPsxfAISj8AtGbtosMVbmuo5NY1qnTaviYAy6DdQD9YFtRXXZxoBG
	a4qtQmzyxTQu8ivzYv6qEuCQmNR2PVNyxFLUuowyh9/oREvqw2KQq7YvarvW6JqZlxwpBdngwcfBT
	VcSmhtq9UXl16PDrTKbf0CfDdng+G1x+5IeyKCcKE0VtdV9qP1AeMpdqKMIuQzkmtK3v/DA7N6IjF
	rcbzowMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uKU-00000008w4a-3tPM;
	Tue, 08 Sep 2026 11:49:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uKT-00000008w3e-1oC7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 11:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=; b=qTVBiWwvtoVzaxYbd4Sqv/U+je
	f6LUTIhVp9sUyzfDqMM+2JElKwCr0h/+EXLdsqocDmMkg+K2BIuMCffvUGk03tMJnkACG7+hzhhoT
	4QGt4tnMyI1u8LJ3Cn1B/CPWGJ5SUbZVy1TNu7w71Te6nOD2zzeJ3LlocJ+9U0mq2AM38sy+nspgf
	fhidaQrdNvzuhRNnTiDqJI92/ECh5ShhGm9MLE4Qhb/g5HMW/5KY6x0qC2+iXJ5akvVJVJMZ6sdHs
	44chRq6xhB9tTiHSHhruvsRyTucThWPb55QJXIJDRe4rHiF8S/9EjSRZxxZKMKpXcBFVf/p+WDkXq
	nVJ4VS5A==;
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3uKQ-0000000HMOL-1DzQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 11:49:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/jkBzA9mCYivXD5f0KsXTFyIn+kr/SjMY3DphEym1JNzA9IWsblFDRUbgoFcqXfPPVTdKE4OoeSXvUXMKY7iKV6exUl9Pt9FfcwJqguhnJ6vX4a+bLQuPmEetFEmyWosQci25DlH82PE5nfNXVRISIeGqrJhVL6pyses30qlnyrsL4lr8WyvNc8Zuc2VSFMBeO3EEyCRz7BgiOvFsSZ8VpVlbPcfvf1+/i4xtY43GpjJKmKGEKcvsscqQo/NqUpZKGCzB5QmoczL9MkAeU2Hq2bdX2XDPgeYrbL1wPIKdD03Axmb9Zvq1tV1mnpkIFFPvQ5/18t/jkde7NT+yZbGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=bcJ/YsG8OS8PcAUiOCFs3vKN3cY+mv6gYNIGg23L/GGrdcLKglZKU6k6hTFjiG4M4gEcBZYULCw8hoYtQt8iF+ZMgQNlPqKjXerzneUUOI4c1ceQVhATgnfAgIf16T8tqSQysFrxg4MjZ9oO5FFVK/m/DQRjJl6ZCyTuL0GNvn9ylRAYoneB0Gu23m8E2HUzwgYuF2/sErM5hynZFIwxE/EkW/wD4Q77Kl9BagGVzycqaLUsHYwYkOHwTVM9wvLaLCjx/36tyqqKDY1IAuvpNpNyWgd2IjWDLqCZoMMgApuAU8jMerGcn+8ZEVAZaIQ2ujBeQWiXAiiV757GkM4Aqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=fOYP9ggdX0hRnqxdvipB8uCv66BD2KpzeqqaeyF+x0vLS+C7MInzvPeqX0ftrYs/Z2IR0gb6Ie5lexf5ojU1MlRCDaQd6Nunc/aPYoFcwqERFsCJqJJxDSOMfeLqHGxwqD1m13E2BiHdPmCrieDFQO/nzhvHcPG9jvi5qzeUEblieZZ6X+5RRkfr/gfxKa/ArnsEMP64U0GbfHL9eDEFBMpIQ5vflRw1gziNgI56UlE39j/o7ODJWpvf5m+6sLqhN2rnw7P9YDlyKa0wLbKTPmJ5whTrNINFeZa1DgJj7x16HJS0TVdViTUz9ztWtbtZpNc3DVXFliM8uNg6G/PlXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GVXPR04MB9780.eurprd04.prod.outlook.com (2603:10a6:150:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 11:49:23 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 11:49:23 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 08 Sep 2026 22:48:16 +0530
Subject: [PATCH v49 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-imx-se-if-v49-6-a59529118839@nxp.com>
References: <20260908-imx-se-if-v49-0-a59529118839@nxp.com>
In-Reply-To: <20260908-imx-se-if-v49-0-a59529118839@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788887921; l=1533;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=QsUadQeiO4ZJutxpy979OhbHSldPNXSAnx420m3jX1Q=;
 b=6MSvP0upYqGcGCRz0N0yA3BYhF1Yz1KcUvxNh0KVuH8qXcbJibS4OYKQ/fBFKX4tlxOI7WumA
 MEQnem6jefhBkwR/p8xdbunOAkrIgkGHPinjuFEtAWTfb7v7TmwCYP1
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI1PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::6) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GVXPR04MB9780:EE_
X-MS-Office365-Filtering-Correlation-Id: eb1feccd-c0e2-4444-5cbf-08df0d9f39bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|7416014|366016|1800799024|376014|10067099003|3023799007|18002099003|22082099003|56012099006|11063799006|921020;
X-Microsoft-Antispam-Message-Info: 9M4Iyr1QZqlh4g1EWnNzUVJcI2nO0RwxMMP3iHPvGfIIVzMgs+B1z3x9aD9Sm1+GYMefbAZxwhqTQOJS30IbPXjioa0kb8yGcw5o1RJhn43parXsYkp4ey36iscQM+o67RMQ431fJFRsvvEGJbV+wGiSNGuXLNr+8ZSHkn2QavcNB5XmvT+19SmU0io5iwikM+nxoT1TayTsmFuRdeXwg+1sLOSH6uOw+X9O3/4ZVgcCFVm9X7F/6v3UYUYLbx6y3KITncfVJc7JdDBSmevtX07sbX8mWhSl4Xk+GliFXXduPj7ZKMpgPDJX6uSOJ4dYzcrt/5obsSenXcTJkQ7AfUZlvrxITON/7DPn91Z3OiOO/h4UTvI2W6bL1JyeDqlfUSE3JIJiP8mERWThBpAA8x197obzg+6DR22muaPbAh5QBVofhS5W0VolFyy33xHc3cuokhIx6Kbdz5dhzWRkzXhQEE5O/0kbbmNo16llwHvThqnbh1VfQ3uhHU6FYMBu0V25DZactEVFiaGaUL/RZHm142Mng5bkvMLFucZjyq8i4rdsYpAL3v54C3Xw3GyrNyCMY3inOGO3OfIciSmOKKOXdUbKQ9uPxBxuLzkbIusndojQ5pgE6hfgJQ6iYZ4r+/3NquFUk8hWrCUr+QblRf7GXJGRFz/Z1w7CBV0b6/VOgKHM/xdyq8ne450B4DRtA+ZeATD6J3RQnhQG4UcjdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(366016)(1800799024)(376014)(10067099003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckVRQlA4VnF2aVdiK2Q3RU9USXdJdklBWi8rQ1lzV05BeUt2YnNpTEh4TGxr?=
 =?utf-8?B?eUNtY3ArQWxzQzMxZlFkNU54NnpCcnNCRk80VER3Wm1GM0JwVzNxQUdaUkY0?=
 =?utf-8?B?NkVqK05XRzY0Rkl0R28zeG9LT2VsbVI3OFgzZjFXWnlUUjFpU1IwdmdZWGhv?=
 =?utf-8?B?N0pGdkEzZVJnL3duOXJFZkxsbnd4MFl5bUJvRnNha0VUMjRmK1dBcUo2Vysv?=
 =?utf-8?B?L3VWV1JvT2V0aExCMVBFUWY5bVF5ZjNXVXRuUTcrWm0vTXNGdGhMZFc1dGNZ?=
 =?utf-8?B?VFJQS21obU9mRUV3dXZYeFhIZ3NsM2cxRHllYitvNGM4UlpQVGpQVHJPak1z?=
 =?utf-8?B?REl0MFl0ZkJGeXYzRUxSRXVnVzBpVnQ4MEh6THhIUTZOZmJHaFR3QmJTVVRi?=
 =?utf-8?B?ZG5kMXJmVVo1OWJTdVE5cVFkbnBVV1hWdzZETWRuUTN3OTJPL0tuazlkUWRu?=
 =?utf-8?B?cWh6eUdzNWFhV2lnL2MxemM5MVdaVGFHMjl1dU1NWXpqNEdSRFFKeE5XZHlL?=
 =?utf-8?B?M0R1WWYydGF4ZWVSbGNlNjJxWDE2cXNZcVpsZWUyZG43T3FGVTBVMlBzQ0F1?=
 =?utf-8?B?ajZuMCtaZUdhNWJPM2kyUmk2NTVNdUxpYWM1VGtVNTRKUndadllPSmg1Nm9u?=
 =?utf-8?B?N0gxbXNXYzFXOC9aS2w5QkhuYW83WjNleDV3Yk5TMmVac25DMjhMSWNQUVFB?=
 =?utf-8?B?ZW9IclkrWk1BUEFOMGZ6WHVTVnJkTW93enEraDNxdEZtK0NlZmpieHdGWlM0?=
 =?utf-8?B?enBLYXFISzhjQVVyaDd5L1QzbC9FN2J2aTZqbFFXQTR6OUhnc3BvWkNJM3FE?=
 =?utf-8?B?dHR1dFpXSWJwYWJiL0phYzh2VGNlRjNkbnVUcnI2OHhibTZEbDdCY05waWpp?=
 =?utf-8?B?ZzdHbkpkdXZLcVNsSzB4bUhPb091a1l2eDRnaDlidStURnFCbkt2ZjBBOVY2?=
 =?utf-8?B?QTNaNWxFaVU0bXArVHd6Y3ZMYXhoZENiZ0hhQ3BYbXQvRktFN0lFNHNobm5h?=
 =?utf-8?B?UllsbVVOcmVhNW1PZWpPMGhpamRWNVUwZWxtT1lkc2s5c1RocjF0UTU4alU3?=
 =?utf-8?B?VjRzbllVeDNIUHZvZ09pMkhwcGVBcnN2bmlJbnhNSzdPTFZ4blNpc1pXVTFz?=
 =?utf-8?B?SkM3dUdXNlFET2ppZkU2QmJCQURCUnNUTnozZkVSZnRTRDlpNTZMMDB0V1dG?=
 =?utf-8?B?N29ZZGNUSTZRVVJQZXJ1RGJkNFdkcEh0ckwzTzdsWkdOVmpad1pEaHhFUEFv?=
 =?utf-8?B?eGY4RUV4QXpKSk9XZDZOT1RCZHd2VmlmN2JET3Z0QWIraS93UG15WWJIald6?=
 =?utf-8?B?Z0VhUmhnNGQzNTNuRnc0cDFKZjlwVStrV3pSQkVuU0FNWjlQZFRvTy9HTTJ1?=
 =?utf-8?B?cnV5TU9vWmdEeldFcDE2SlBJQi90VGRBTy8vMXFuY0MzcUd1TEh6cEFWdnNa?=
 =?utf-8?B?UzdBYU5weTdUdXZzTHZUcmJRdEFITXV4Z05MZnRKYlBscFRGenRUdmNJTDBL?=
 =?utf-8?B?NlcrcXRHa3IrVWwrK2ZXSERTMWE0cUp3SVR5dmR0ZEhrMWdUZ3dxSUZuUjY5?=
 =?utf-8?B?Ymt0OGVkVGtGamRlZEM3Yy81RDlOdWVyMUM2Y3hXTHdwck1XSnczbnhGNjBK?=
 =?utf-8?B?UHVwbHFpZ01mYldacDJSQ1k2MGdHbXorYjdkRWN1c0V0ZFNJY1hqSm9sRGV1?=
 =?utf-8?B?cCtDTktJQ25uazY0ZUF4ZVg0TjRDem84RmFNOTdxenhxVTNIcittTWNsOFJC?=
 =?utf-8?B?OFcvYnFLdWNmY0o1QmIxM2EzbjVzSEJiazBaczZ1OE9XUWQrNmRQS2huaUdV?=
 =?utf-8?B?VUNITmpoMzkyQVJpeUpqSlVkY1hza1NKSlpBdW1XTEZHb042Zkt6cG5Hczdp?=
 =?utf-8?B?T1lnbkZiMlRIN2I1OEI2bWdZTWtwT1MwZkt3WG9LdmovdHpBL1BaOGhxdjRk?=
 =?utf-8?B?TXJZSWVrbEVERFJyRWpyRjFQa0RTeUpyOGJ4dURjN3RDMUZGdk1PeE15eVpr?=
 =?utf-8?B?OWxHcEJNWWRaM25tUDMzY1FUQWZqWmhoU00rS0ZRa3RLZExLYjFHeWpzTzk4?=
 =?utf-8?B?bm12elNEWlZmdVllYnJwUWZZYk56cGIxVmoyN1JpRU5KeVdMSFBqb3YycmRs?=
 =?utf-8?B?TWtpbTVvU3M1SWNudWh0c3NlTGp4RkJWVHVCakZZVEVRQVpKSjZyZnl3aURG?=
 =?utf-8?B?aUJSeHRZTk11SC8xREdNUlU1VE1tL292MDR2blFQZnN1MXlvT0hNcDAyUDVL?=
 =?utf-8?B?ZXREbjRLWEZHOTBZMjU2dnNpZGpuVmlLbTh5MFpldmFma1JyZkVTYWtvUWZx?=
 =?utf-8?B?KzYzaVlFMHZ0Q1dYMEk5WlNYN2xzNWd0alVVYkJBUG1EdFVGYWJzLzZoSzBx?=
 =?utf-8?Q?AcrqyHS5MbdXnsKwxrDzWdibFZ82ky3jjd7KE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1feccd-c0e2-4444-5cbf-08df0d9f39bd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 11:49:23.2162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/FVFkScy8umyWLEvMa7kUc64b9Pq5QrBnsIudiLxf/i0nafOPmu0rSrbUg8YgdvWqtM7ckoOvYj33riGAilMQBDQBdYGTk+JNfsvJ3PrENu/Ztd7h8VXHSNsTmz5qMj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9780
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_124930_503118_5EE7F224 
X-CRM114-Status: GOOD (  10.51  )
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

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi, together with a label for sram@2201f000 that the node references.

Keep the node disabled in the SoC dtsi so it does not impose a
reserved-memory requirement on every board. Boards enable the enclave and
provide its memory-region by including imx8ulp-firmware.dtsi.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 777b89ed6849..ac8293f81c6b 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -154,7 +154,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@22010000 {
+	sram0: sram@22010000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x22010000 0x0 0x10000>;
 
@@ -186,6 +186,14 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+			status = "disabled";
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0


