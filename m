Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9D5E8306B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3G3QMxMLiNlfHaCCBpSl45eyft2uK+ZPXZfWJ0ruAQQ=; b=XQW/swxRQC7/S4j/VIwmf2GM9B
	a60GMy9r0Oe1E3pFr8XB9u8vFnW9si4s6Lu8ptrH3tvrOoG0pI3vTylvQmrPWd2sHXq2aU2ACxKPk
	3aclDPj//yfTAB661dEBQdkLIJndviGkEwKBcK7eNKjgwDqNeHTvEcLPrW3czv17AByW/qlu4hhZc
	hYe8pu79UphcJNWnJnod32xE5NQe2Z9FUhSzlsOYBzhm/Eg1LiG3xoRgdk7gNsTW+DK2w3Th/v3Zx
	0iis0YpFXBufeAuQUKU1oqaanM1xeFucdcXmsxEKChBnt6DnKtO307c3Py3fZzOmkM2qFvIPb/5Ek
	uyST3mmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD6H-00000006Q5U-08vp;
	Tue, 03 Feb 2026 09:53:37 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD6E-00000006Q58-0duO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:53:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifk+LsPmKQDvsA0l7UGLlBUDA00BIJlFYqGE9yeQFgGhCG+ZFcJmKjIUACAojjw1Nnu5YbLjyEkomV6R3ZoM1aE3LZXxYB4/LzUpI6KNf0rrjydh1v/ss/9ktMOuiw31GKsc7jU378+c4vVln+RTZtid2jxXwbaqbb3CE6BhRWy8IizKzBhQx/iPnuF5q4lAH1DS0QpaOej4vPGe4DnhL6K5O232h+xabDbOvf2Q23AJoBVXafZuewStBT8QPrr8Oa87FF/v4SE8cv5rjfYpT5cRthmGqjXBX57lgvDYVtW9HUM0DXm+IKLMyRkSA2WuoHiLZaS0Uk9FdiayGYJJTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3G3QMxMLiNlfHaCCBpSl45eyft2uK+ZPXZfWJ0ruAQQ=;
 b=e87GKl35n/jheduQssBX1HF40X8UiCQedJrDDHyd99ve52m91D5CfdqQbVDtmfRullew+wpZCbtf++3Fi/KQzDjMqGkV2BlICcPTg6tQfRZITIb/HshqqijL3rwPOX8Ct4TFy6Ws7qya9wiZAEdUXl1bJT9fgdYHHXNhXVMoaTioNChvbRWj/BsZcTnlR9ZZCD8U55UPK3KLfIXhIa4a0KShpNGPPZ7bd2QsjinBgTUJmHQiDsIG/kqAgpyJmwQbpKIa5KwVumx0YXN0Z86V9JoWqpjzYV3rEfKzaiR+IPatJM28OpHzQNTOPz/cncBmSXKOXZWVFZXLKYKUye/7Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3G3QMxMLiNlfHaCCBpSl45eyft2uK+ZPXZfWJ0ruAQQ=;
 b=aqz6qBEOETV/hrzq10jOLPP9Vex3QSJxGyA8mQ2mCtK74xD2AD7Acm5FpN2dlwSLVSVGb1XSSmvHwbg8RpOFSB8ofc/mEZJAAA88Q26YJf+gLuZ5AB0Eczcyxh+UV6ycoanGoE4kszCjvDYXBxj1W1ND7NdKP77DW3n76I+bnOO5+xRsPyoga73yBAo0uWAZVv/5XrkMXAyq1XXJkXoxZDeIwfe+iqG/N5I4YwX2spuKoLOIa8a3CEwiVvqWsV59bgtyyhcUgp1u5cQxayz1zG9yb4ha1axIVvfXlOZbZ6X5kjhH9WnrobbemZiwqMP9bvHLVhjjJ+Kktr5raauaBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB10002.eurprd04.prod.outlook.com (2603:10a6:800:1d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 09:53:26 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9564.014; Tue, 3 Feb 2026
 09:53:25 +0000
Message-ID: <6f112e86-9a16-4a36-912a-d295abc4647b@nxp.com>
Date: Tue, 3 Feb 2026 17:54:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] drm/imx: dc: Add DPR channel support
To: Marek Vasut <marek.vasut@mailbox.org>, Liu Ying <victor.liu@oss.nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
 <20251016-imx8-dc-prefetch-v4-7-dfda347cb3c5@nxp.com>
 <174bdb5a-b5a8-4856-a0ac-8caaaefde136@mailbox.org>
 <24f99c46-ca5d-43cc-a2eb-a6e5029e9f86@nxp.com>
 <500852c9-2cd5-4897-a139-4e93988f5469@mailbox.org>
 <df8751ba-7215-4635-98b0-ca659ec786cd@nxp.com>
 <de695268-1241-4658-871c-30dbf068ad92@mailbox.org>
 <3d622f3c-ddd4-4feb-bc88-a1eea7dd936d@oss.nxp.com>
 <9912e2dc-50cc-464d-8372-b3b79334ac67@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <9912e2dc-50cc-464d-8372-b3b79334ac67@mailbox.org>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB10002:EE_
X-MS-Office365-Filtering-Correlation-Id: 07a49a6a-df43-4c49-43aa-08de630a1324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ym9NdjhjOGd3aWd4ajN0NlRWdXdkUlNGMDRRbTZxcTlOK2VJczQxcFVWZVNQ?=
 =?utf-8?B?dU0reVpwUFpvaW9yVERZaS9zeThyRVlnSm1YOUpaL1oxakVDRWJpN1FJU2hE?=
 =?utf-8?B?ZTVxTWY1VlIxRGtMVlpGbk04OW8wbTdqVUhhak9aZk01MktPM0I3WHV4cit2?=
 =?utf-8?B?SERGRUc4c3dPdkdIT2tkSXorOFdvL2E2Tk5MS1lTbGNwZW5qYXpRaDBEU3VX?=
 =?utf-8?B?a2MxYnc3cWJlOVRlUGdUeWdoNzBMTDRaNnpjZmZYTERSUmNJbnd1ck1EbWxP?=
 =?utf-8?B?WUxzazhtZ0NNUzRpc1F6TjlScTJxRnlUWEtUMW5aRFh0blhCVlZ6STlrM0hY?=
 =?utf-8?B?djQ1aVZZSS83RkRFQ0RHWFZwS3lTWXJab2JydXNhZmpiaVY1VkNjNGR6QSsx?=
 =?utf-8?B?S2FIZms2SHFOTm9XVjlGY3M1eDVqVG43dndCMWdDTnBlL25KZ2JZaUpHbXEx?=
 =?utf-8?B?YXBpN0tuRDA2K1JCbUNNOG13ZlJtT2p3Uk1vQnhuQlFldVA4Q2JKR2hYYWEy?=
 =?utf-8?B?OHNYaWpvb2RQdWh4d3MzSTdFU0JqckRkRWF5bjE0dVpXeGlPeEJFU2VYWk11?=
 =?utf-8?B?SC9saTV5cG5VOHRWbUpnOW9ReTdUdXNPY3VZZ1JCbmRXeGJISE10NGVFMzhn?=
 =?utf-8?B?bzFrM1I3L2ZTWVpPK2VxbmtsOTVaSDFzTjdvbGVHOURxUzVjM0luRERydEEy?=
 =?utf-8?B?R0FLVmFOdG5ldmx1Nk1obHZid3V0cWVsdkZRMUp5RmtDZTJsMk02eCtZQmxV?=
 =?utf-8?B?NHZ6U1E2eUpDV2RERktLY0FIeGkwUzIvZmc2TXRDS1NOaXVsRXZhVXRDSTdn?=
 =?utf-8?B?TUQ1cHRFMlBtSmNTY01DMnE0UENHRHMxdi8xcFZCYmVwN1NrKzdlU1IrQitv?=
 =?utf-8?B?bmFQZHhMeFY1UkFSSEI1ek9CVHV2Z3p0UGtXT3drUHdQTDBZM0I1OWM2bE14?=
 =?utf-8?B?aE9DWmI4Y0dUT2oyQksxeG0wSmROc1hnOUFXNkhiTTRlUURjY3Fmek45SXFy?=
 =?utf-8?B?bkZLejlUWjRCdTlkbWNJNGVVQXVhMTZMTHhMQS9QTFJvOWdOV0dWVWZ0SDFL?=
 =?utf-8?B?N05YL1hzTnNVMFN1cmhBMHFJc08yemUzajIrU1puUEgyN1N1dCtmbms4Q1pW?=
 =?utf-8?B?TU9LOFdRZHRHMmxPMmtUWWU2emJZaUp3d1pEU2lmQWZPOFYxRUo5by9PY1RX?=
 =?utf-8?B?S2xUdmpuMUJOZlJyU1FXUjd1aGpGZ1hDSlU5THZZK0dxblcyVzBHWDQ3TXl1?=
 =?utf-8?B?NlhsbklEWW1jNmhZcU5ESlJ2MFVFaE05RzZ3TzhNb2JaampBUmRSRUtEVWxE?=
 =?utf-8?B?NzFwMkMwR3o4Sk84Ymh4dEhqVmhiaHJ4TWE5ZkRpaEZyRTFqblV1WmUwdzlT?=
 =?utf-8?B?L05XMFQ1RGIzelpQcVo2cCtscWxHaVF3MStOYy9pVWdudkhNUitYZ01tNXJp?=
 =?utf-8?B?V1BSSFNMODdyVHBGREN5WDMrOStEVzZsWEJLMmRtTEtTNXVxRFlHcGdnQ0pS?=
 =?utf-8?B?WWRncmlFenY5OEFDaUlwakRQcmFPT0ZWVXkxaU5qY2x1VEVMOElURE9vKzY4?=
 =?utf-8?B?VWthZGFhSDBwc0lhcU1WOVhSbXF3bUZtUWpQOGJIaTYzeENGZlJ4WmtqSFpr?=
 =?utf-8?B?MVA2QmFVV3NmcHBUNHlyMUhUVlpaRThxbTV4QTJQbC9veHYxdTNVOGpSd0ZL?=
 =?utf-8?B?UDZHaHhVWlYzTllNZlFFdjg2eWxlMEp3QkRqRGtUamFHbEJpMzhZSVJMUHJ4?=
 =?utf-8?B?a0Fnb0JmUkc5NE00amtHU2dNdVJiMXJhUHY5QTlKc2NXQnlJdzZjd1g1RVdv?=
 =?utf-8?B?N2dVanBpVWpnQ25LYXd6K1pKUU9Bc1NPbnhyeVBLeG0ydEVoUGZSM1lGY3lX?=
 =?utf-8?B?dUwyajhjbE03OVVHMHk3czlIM3VGakMzN1pHNnRDSVlHVXhDbktseGQxcWFu?=
 =?utf-8?B?Mms0OHcrWUdUSUJZUXQ4b0pZTHFCVzlYNEgrK3lRNGROOEdUTVB2eUNtdHJm?=
 =?utf-8?B?Ry9qK1gvdnlJOEhWaUhEVmFtY09xSW93bUI0b2VuWE5XNU5qbnNZa04vZzVQ?=
 =?utf-8?B?Z2R0UHVkelh5eFFRZS80cXNYM3daV2ppMkJwbVh3NzVOSzRoR3RRZmhkVjFp?=
 =?utf-8?Q?zBBs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU5CNkhXR2oyWEZwTTVMS3FHazBSdDVMTGdpQnpSaVlPdmVoa25HT0RHL0Ez?=
 =?utf-8?B?MjZzdXl2a25SMWRtRnI2aDdSTEd1N2NZeUpxSzRTZElqODBBS0NmL3UrWU1p?=
 =?utf-8?B?NzZ2V2w3cmlleFFmSktnNUN6Wk15cGRjcmc3c21acnpkMzlRdzZaUU9HV3hr?=
 =?utf-8?B?SkU0aStsbGtocWFScXJVR2tSM0R1N1lKSHFvRFBTbW1kNkV3NDZJRDlZN1Y1?=
 =?utf-8?B?bVcyY3RXMTM3UWp0N1d4M0NsZitpUGwvNDZoOTBCLzZoZUZpQVgrbGFMWmc0?=
 =?utf-8?B?OUpSZ0M2UU9tMzB0eEN2RkVsZlhWanhPTzRxanR0QnR2RGxMSVJBV2J3MTc4?=
 =?utf-8?B?cmVkeS9jNHROZDF3ZElDMXJCcS9aR1YyTkhLNEdKekRkU0tXSHBkcElOT2hn?=
 =?utf-8?B?emdjcWxsOHIyZWJVZXU3ZGgzSjNLb0MzdXp3bStBeHpPL21jbHJHSjkwWW83?=
 =?utf-8?B?MmlaNFdoRmR6MEkxYjV0TWYvR3JLK095L0pjTGtGelVkb2xGYUppdEtWTExu?=
 =?utf-8?B?T1RjQXZuQmh5QXFEeEx0ckJrcTNPZHlSdU1WZkcwaHgwdXFJYXdzQS9NTE5F?=
 =?utf-8?B?Mjg1dzZjbkdUeGRiaTZYd0pMS2pjRHpCd1JSZ3hGV0xhQ1p5OVdaT3Jsalpy?=
 =?utf-8?B?SVltUWVlaGg1b051dHN5ZklMMEp0UVFlZlhNSzZJR1BKYjZqQlpWWGVBRWRO?=
 =?utf-8?B?V1lkQU82Qk1nNEpmS0ZGTWRtc1FEUFFKQ3pRQWZYT0FvT0EwQ3plTm5jci9W?=
 =?utf-8?B?QXdwYk9vYVN5b05PamY5TkRaSjRwbDBpVGF5QlZKUGRUdXVYVkVWRDgxd3NI?=
 =?utf-8?B?Mnlqd2lTSjd2dlNiWWdCK1loMmFEZXJ4L1VzdUh5bDlpc2grK0s4ek1ndmEr?=
 =?utf-8?B?OVdkK1RjZ0M3OU5vUSt3cm1uSURuS1lMRnoxbVBmYkMxTUVsaDN0elVYdzdG?=
 =?utf-8?B?by9yTTFDeWJ5TVVmY04vZ0lIWVo0YW9idTFnYjJUNDRWZW1qNDlISHBoc0ZR?=
 =?utf-8?B?bk9DMnJxTjkzZ0tvYUdvTHpOcFJURzBZMkQ5dVZnZmFPU0ZzbmRHOTYySmxo?=
 =?utf-8?B?VUZTQ2dBd3RqblJ5djBkc2kwL0k4Z28ybllWRXROclByV0FzazZnTHlSZ2Vj?=
 =?utf-8?B?elBwUTFhY2JRM3FqVTdPcGlQbm1QVHNpQ1NGeCtxMzN6cVAxM1hpRWcyYkE1?=
 =?utf-8?B?OEl5S3BSdVNESUhQaGpvNzVrakxacTVlNGl3RkltaHQwYVNLUm4wNFFjZElw?=
 =?utf-8?B?aTJ4RjdOTldiUUwzdTZ5WWJTWjJvM2dJbERxakppL0dhYzZENC8ydkdmNHBl?=
 =?utf-8?B?dm9nTUlaQ0JKR3NHa1ZWZUdpVEF6cnMzODJLa0JERU9McisvRmtQS1dRS3pT?=
 =?utf-8?B?c0xSd1lGcUNxd202cW9kQlk4N0prS0pYYU9qblZkWXhYdjBEcU5PVHk5UTBq?=
 =?utf-8?B?OW1nLzY1dHd4TmNtaGtQeVRDN1Jyajd5SE5WTXFpaWN5OFFud29QcnpndC9r?=
 =?utf-8?B?c3gzOXZzQmxERGc3QkRsN2VWVmNYM054aUIrSE5aWERkTjRBaXJSU3VIRldM?=
 =?utf-8?B?QVZkSGFYamJydkFnN2NITk1iNy9sL3lpYjFGRU1ySEJ6ay8ySWwwTFZ2Rkht?=
 =?utf-8?B?aGtHZ0dHcE1VQ0lUSWdFSzJZWHhCMDNzVk1lSmZNNFNLYmV1Y1B4Yld5SXV2?=
 =?utf-8?B?T0tkcTZqNEZ5ejlBOWM0NDJMTExaOU4reUtvU1hneGhLWDcvQ1lyZFAwRUtv?=
 =?utf-8?B?dTA5YWZFTEVRRjJRTnVMczNiWjB6NWtGQU9NSjJTRDQyVjBNd29ra2k2d3Fs?=
 =?utf-8?B?MkpSaDh5TDhkWWVtRXFacGdHZTdvQ0lJSWtEMSt0dGZBb2JJVWVka1prY0do?=
 =?utf-8?B?RFdwczlDVDJpVTFEQnUyNlFHQWVXSGNMRzlqUDhva1M3VVNSTUZSUlhOYzBz?=
 =?utf-8?B?WXRma1VjN3FudzAvVnlmMlhPOGlKcWpnQjFwQTMzRWtzUUF6YmVXYTVZTkdS?=
 =?utf-8?B?SkM0WndBbUlTTEhnSGxGNzNQQm5nclA1UGZIT2UwMlV2Q2VBaGJoYjJDMFlO?=
 =?utf-8?B?eUxEaDgyZzBNajJqNWo0QjV5QllRWDJEUlRjYWloRTlNNGxXNGhrTi9IbVpF?=
 =?utf-8?B?RnE1UEVaaDhmVENQVkZBa2JaSGQ2OFRJU3FFVGc2ZU13K3d4QXpSOWJESDJB?=
 =?utf-8?B?K2x3c215LzNKZitGaGhYNkIxV00vbHo5bHdBeWhLbmpvY2xiUk9wMml3cVJE?=
 =?utf-8?B?OC9OSkxzb1ZKY0EyM01TbDBVNTRRMTBRZWFLUEUybjB5b2lzQ3pPeDRiV1U4?=
 =?utf-8?B?SFdETTJBOTZ1MUM4N3gwMXdyK1hmSk0xangvOUU5bzZvSXN3UzlUUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a49a6a-df43-4c49-43aa-08de630a1324
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 09:53:25.6799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEmjbu4/RLK6Zi3n5a2bTBI278CAMovuAq5+eGv0/rXt6FE0+5KPHiGZQKuJKZeA/OIFmDg0yaE+JTeQc7UlUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_015334_334155_AE0D8C47 
X-CRM114-Status: GOOD (  30.59  )
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

On Tue, Jan 06, 2026 at 02:36:18AM +0100, Marek Vasut wrote:
> On 11/14/25 11:03 AM, Liu Ying wrote:
> 
> Hello Liu,

Hello Marek,

> 
> sorry for my late reply.
> 
>>>>>>>> +++ b/drivers/gpu/drm/imx/dc/Kconfig
>>>>>>>> @@ -1,6 +1,7 @@
>>>>>>>>      config DRM_IMX8_DC
>>>>>>>>          tristate "Freescale i.MX8 Display Controller Graphics"
>>>>>>>>          depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
>>>>>>>> +    depends on IMX_SCU
>>>>>>> Can the SCU dependency be made optional,
>>>>>>
>>>>>> I don't think this can be done.  If you grep 'depends on IMX_SCU' in
>>>>>> kernel, you may find a handful of existing dependancies.
>>>>>
>>>>> Sure, I do not dispute this part.
>>>>>
>>>>> But the SCU dependency can be contained in a component of this driver,
>>>>> which is not used by MX95, and used only by MX8Q . Then there will be
>>>>> no problem.
>>>>
>>>> Which component?  You mean PRG and DPRC?
>>>>
>>>> If we add something like CONFIG_DRM_IMX8_DC_PRG and make CONFIG_DRM_IMX8_DC_PRG
>>>> depend on SCU, then should we make CONFIG_DRM_IMX8_DC depend on
>>>> CONFIG_DRM_IMX8_DC_PRG?  That's yet another dependency.
>>>
>>> I would say, if possible, put the SCU-dependent parts behind
>>> CONFIG_DRM_IMX8_DC_PRG symbol, and make that symbol configurable via
>>> Kconfig . Users of iMX95-only can turn it off, generic kernel config
>>> should keep it on.
>>
>> Both i.MX8 and i.MX95 would use arm64 defconfig.  Most distros if not all
>> would use that to generate a single kernel image + modules for i.MX8 and
>> i.MX95.  We can't presume that __most__ users would change the configs
>> for i.MX95.
> 
> That wasn't my point. My point was, make it possible to compile the PRG
> parts out if they aren't needed (and with them, SCU support). If I build
> the kernel for iMX95, I don't need iMX8Q support in, so I can turn MX8Q
> support off alongside the SCU parts. The clean way to do that is to keep
> the SCU-dependent parts in dedicated file(s), which may or may not be
> compiled in. For generic kernel builds, they should be compiled in and
> decide at runtime, whether or not they should be used of course.

A concern is that this allows users to disable PRG and DPRC for i.MX8QXP
by configuring something like CONFIG_DRM_IMX8_DC_PREFETCH=n, which means
the driver needs to support 2 cases where either the prefetch engines are
used or bypassed.  I wouldn't say it's not doable, but it makes the driver
a lot more complicated due to different control flows w/wo the prefetch
engine.  Perhaps, one day we'll support the bypass case when we have to,
like, add multiple fractional layers support or warping support.  But,
for now, I think it makes sense to start small and treat the prefetch
engines as always being present/available.

Also, when the bypass case comes to i.MX8QXP blit engine, we need to
somehow tell userspace about the prefetch engines' presence/availability
by UAPI design which supposes to be as simple as possible, not the other
way around...

I'd suggest to add the bypass case support over time in the future if needed:
1) As of now, always use prefetch engines.
2) If needed, let the driver decide to bypass the always presenting prefetch
   engines if it has to.
3) Add config like CONFIG_DRM_IMX8_DC_PREFETCH to allow user to disable
   prefetch engines, which sounds like a bit over-engineering to me though.

> 
> [...]
> 
>>>>>> Like I replied to your i.MX95 DC patch series's cover letter, SCU accesses
>>>>>> registers via Cortex-M core instead of Cortex-A core IIUC.  I really don't
>>>>>> know how to abstract IMX_SCU out, especially via regmap.
>>>>>
>>>>> The simplest way would be to use regmap_config .reg_read and .reg_write ,
>>>>> if there is no better way.
>>>>
>>>> Can you shed more light on this?  Any examples?
>>>
>>> I'll just reply to this part, because that is probably the most relevant
>>> to this whole conversation.
>>>
>>> git grep '\.reg_write' drivers -> drivers/hwmon/aspeed-pwm-tacho.c as a
>>> simple example.
>>>
>>> Then such a reg_write implementation can do:
>>>
>>> if (SCU)
>>>    use SCU accessor
>>> else
>>>    use writel() or so
>>
>> Thanks for the example, it makes regmap idea a bit more clear.  But, how
>> would you pass the SCU flag to .reg_write?  I hope i.MX95 code path won't
>> see any information about SCU.
> 
> You could have one regmap for MX8Q and one regmap for MX95. For the register
> IO in the driver which uses regmap, either regmap is still only a generic
> regmap, no matter what the hardware accessor in that regmap are. Therefore
> most of the code can be generic (use generic regmap) and only the probe code
> decides which regmap (MX8Q SCU regmap or MX95 regmap) is going to be used by
> the driver.

I'm a bit confused.

Considering below 3 points, how would you design regmap(s)?
1) i.MX95 display controller only has MMIO registers.
2) i.MX8QXP display controller only has MMIO registers.
3) i.MX8QXP prefetch engine(DPRC + PRG) has MMIO registers and needs SCU
   accessor(Cortex-M core) to control registers in SCU.

> 
>> Also, IMO, wrapping SCU with regmap is abusing the regmap API.
>> How would you pass the resource, ctrl and val parameters to .reg_write?
>>
>> int imx_sc_misc_set_control(struct imx_sc_ipc *ipc, u32 resource,
>>                              u8 ctrl, u32 val)
>>
>> Regarding the 'else' clause, I don't think we can use writel(), because
>> SCU accesses registers via Cortex-M core, not Cortex-A core(I mentioned
>> this before).  I don't see anything we can put under the 'else' clause.
> 
> You could have one regmap definition for MX8Q/SCU and one for MX95, and
> at probe time, select which of those is going to be used. That could work
> I think ?

Sorry, I don't understand the idea of "one regmap definition for MX8Q/SCU
and one for MX95".

Also, if the idea is ok, care to anwer my previous question about "How would
you pass the resource, ctrl and val parameters to .reg_write"?

int imx_sc_misc_set_control(struct imx_sc_ipc *ipc, u32 resource,
			    u8 ctrl, u32 val)

> 
>>>>>>> so iMX95 support can be added into the driver easily too ?
>>>>>>
>>>>>> Like I replied to your i.MX95 DC patch series, I think i.MX95 DC support
>>>>>> can be in drivers/gpu/drm/imx/dc, but it should be in a separate module
>>>>>> (something like imx95_dc_drm) plus an additional common module(like
>>>>>> imx_dc_drm_common).
>>>>> This design part is something I do not fully understand. Sure, it can be
>>>>> two modules, but in the end, the result would have to be capable of being
>>>>> compiled into single kernel binary if both modules would be =y in Kconfig
>>>>> anyway.
>>>>
>>>> This is something like imx8qm_ldb, imx8qxp_ldb and imx_ldb_helper modules -
>>>> DRM_IMX8QM_LDB and DRM_IMX8QXP_LDB select DRM_IMX_LDB_HELPER.
>>>>
>>>> Note you may make CONFIG_DRM_IMX8QM_LDB=y and CONFIG_DRM_IMX8QXP_LDB=m with
>>>> CONFIG_DRM_IMX_LDB_HELPER=y.
>>> Do we have to make it this complicated right from the start ?
>>
>> I don't think imx_dc_drm_common would make it complicated, but instead it
>> makes drivers simple and easy to maintain.
>>
>>> Maybe we can start simple, with one module, and then split it up if it turns
>>> out to be unsuitable ?
>>
>> Hmm, maybe it's time to split it up now, because:
>> 1) Your below patch has already been adding DB to CRTC function.
>>     See dc_db_shdtokgen() in dc_crtc_atomic_enable(), which certainly breaks
>>     i.MX8 DC.  To avoid that, you'll add branches to the atomic enable
>>     callback, which is something I don't want.
> 
> Can we have separate atomic_enable() callback for MX8Q and MX95 for example ?

Technically, yes.  But it doesn't worth complicating the single imx8-dc
driver, considering that the callcack can be in a separate driver and the
code for supporting separate DRM drivers is fairly limited.

> 
>> https://patchwork.freedesktop.org/patch/680085/?series=155784&rev=1
>>
>> 2) This patch series is trying to add i.MX8 DC prefetch engine support.
>>     i.MX95 really doesn't embed the prefetch engine.  And I hope i.MX95 code
>>     path doesn't need to know the prefetch engine/SCU existence or non-existence.
> I think the prefetch code can be contained in a single file and called only
> if the SoC is MX8Q, that shouldn't be difficult to do ?

Considering the prefetch engine bypass case for i.MX8QXP and keeping the
single imx8-dc driver as simple as possilbe, I'd say I'm not a fan of that.

-- 
Regards,
Liu Ying

