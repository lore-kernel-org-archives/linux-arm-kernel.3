Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3788C02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFKbgHc4ZKww6L/QeoCSs0/aF+bGwme6OsoQAK98FK8=; b=pjbm8Qf34WopWjRWYej90pmgnV
	uKKOGbJzxi4XtVwMKyz4S0/GlP5XPpwkKRunBj5HnOsmqJOH1qYQLthfp/ts8BPHdY7EARbkEyV2G
	3XCIvEKmK93aeQXWn3lZhP8uJimtmfAaYP3nFgaLggHZwstNyFwQI3AXZ0xZe6Y2wxQ2wAngkpwnS
	qieKbg41PO7E08h8lGDzEAKCpLdA9bjnrBlvPcvplLrO9Y9g4qzQovaZc+QkIRZN8qEa1+Z28GKHO
	LyGe0HMQf7ZUQvSQIW2qaKPcc+nAuA7oPfr+5YC99kXXYyTEOvMjU2N106SFSeqZzRh9rKi2H0pBn
	QGo5BAig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo7K-00000005Bzy-46wT;
	Mon, 20 Jan 2025 09:30:46 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnxv-000000058z9-3S1y;
	Mon, 20 Jan 2025 09:21:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYaqA6S2hZhvhIoOf0O63LfFJMDLDjhEK8iZInFTm3i+qR0aBHprkXfQf+6tLvtU3aq0aKdSL55tNKJxydaSdNoRZhfRmCX94H3vk5k+JO2POU00hzg1m4mC2R9dTVD5RHF2f8JbHiuLhOy4t+R+X0GHb05IoMmlf61ERXghT4LIrs2/c1muJkRvs8k5sBxxxNmisQ+lfmEnOQkfDCWtXt/ztY/EDy/bogvlmY7kanaiu5ADQOYQO0QeykFCbcd+lLRLnvdOfmgxjncRwbCzWbnClD+GG0CLK4RTK+ok67rUb773p3OZf80SlKe3zPj2Q4PU6XT+d/0F+zHvNVma3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFKbgHc4ZKww6L/QeoCSs0/aF+bGwme6OsoQAK98FK8=;
 b=BzcY4O6mC4bsPHSxtEZQKCQ4Elk3O2q82knYKWRXULhxTQIaMJFDCbZHZvrVTui9b35cSZ+uNaNvN2R0SAnRRTQr5dn1fXaA/pHt2SIjYnnfam+EXdvzmHrFtItWM81cHc0OZjHzmGsddSBXco/OdncRC5VzLnUC22SYmxYs/drlAtBNk5hFedmGU150/gD5a7xdWhPrIWad+x98ChBxPnzMAnNHgkdnq4yr4DWXrYRlfrw7Y75OigqPBNh6Yz+zghr7VJVTf7tif+YoY8aLuy+ZLagQMP6a5ZXU96oJGMU5ZbAZD32NvRp8BMHFIgSfNnCu8fNae8JCUozvx9pwHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFKbgHc4ZKww6L/QeoCSs0/aF+bGwme6OsoQAK98FK8=;
 b=S+MZzFAEYH1N6OyrmWjLdKFZHC4bU3LCJz8eZPsF6bc2JWtmcqwtzCBfhtNsvd98qCcEixYPYyHaeXF7XYMxKLWbYZrcl7EmFin8MEFFv3BBD3O9S3764ZVS3il05cptH3eo9ryJxD2w8+7wNcQoqLWaA7WFVCfFZRZ3f0KEkIo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM0PR04MB7011.eurprd04.prod.outlook.com (2603:10a6:208:193::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 09:20:57 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:20:56 +0000
Message-ID: <82e64b27-d254-4fff-aa25-5b848f147ca2@cherry.de>
Date: Mon, 20 Jan 2025 10:20:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: dts: rockchip: minimal support for Pre-ICT
 tester adapter for RK3588 Jaguar + add overlay tests
To: Michael Riesch <michael.riesch@wolfvision.net>,
 Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
 <49bfb4c5-12b5-447b-b08a-af0bb9fc304b@wolfvision.net>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <49bfb4c5-12b5-447b-b08a-af0bb9fc304b@wolfvision.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0301.eurprd07.prod.outlook.com
 (2603:10a6:800:130::29) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM0PR04MB7011:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a27b51-6e6a-48bd-7f85-08dd3933beee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1c4aHZjRWZhc01uMmVabVFkb1A0V1NXbVA0YXNDN2hnbVdsU2U1aTBCNSt1?=
 =?utf-8?B?eFZBQ2N1YTlabDQ1NmZGdjRPblVrZHZJL3QvOE44T3RrL0xVTzhhTHRpL3cv?=
 =?utf-8?B?STk0VWhjeTRSdVNMdThYSTRJUkg5SDJNSFpMNThELzRjbUhpbnNMNmcvV3RQ?=
 =?utf-8?B?MDlZWlh3VElMVDhOblBlcmJ3cmtOYi9NcWdCOVdmbzNDdEtkeTREMDArd0U1?=
 =?utf-8?B?QUNFQWxRZU9QaXZVZUVWMG80di9mQzNZazIySHFmMmFjb29oR2ZFdHpwS1NT?=
 =?utf-8?B?blRaQmRUNkd6UElyRTdSR2FSWGJIVzR5QS93WnptRVhvY3JQWFo1cDZnc21p?=
 =?utf-8?B?cnRqL0h0b1R5NHAzb3VQMEZPbWZWVGJvVnBUTWJWNXJvV1ZuVVBxWFBIMTV6?=
 =?utf-8?B?SUlkdFZNdllsVERURGQxSjhrNTlrVG8waWpJck9lRzk5b2ZRdThxcndKTFdF?=
 =?utf-8?B?NytJaXgvNkdSOU9mcENZaVlTYkZXK2s3ZEgrZFUyMXFVU2t1YkE0b2pPNFIr?=
 =?utf-8?B?dkxEYTh2NzltTENEbnUwWE1oY1pENkU2UHZtNFNhQldnTy9uVDNTb2c4Q0hB?=
 =?utf-8?B?bjZyUDhyR1p4N2JnV1FZVkUvOXlQd3liRWcrUlozWWp3cGJmcDkwUGk2MkV2?=
 =?utf-8?B?blhLOTNxRmI1dGpwZlFBM0FjNENyOEY2N1N2WGVPS1JGa2FlaVErS2ZRQWIz?=
 =?utf-8?B?WXYrUlBQQmZYVGVESDlOOVA0Z1ZQNWNNYXFmZnNWeXcrSzRHL1ZRMHJnTjEr?=
 =?utf-8?B?SzRUYm8vZDhTamxLeGJZbVFHay9CbEREQi9seEs2NDBRa2E3K0tUZ0NmZ2pC?=
 =?utf-8?B?YnNaMzByUzl1R0pHVXQwV2ZTcXZDYkRXd3lUbXNYWnNQbjBZMVlDdFQ3YUZu?=
 =?utf-8?B?N1JMWml4UzBLNU5GdnJHYXFXUWl2dUZ5RDB4RVI3NjhiakxVaytMNklYWDQ2?=
 =?utf-8?B?Ymx4Sk55eDZtOHNPS2hJenNYSTkwT2s3Qy9laE41dkNMTGpNbGhhTmowR2ZB?=
 =?utf-8?B?UlZIZVV5T21XbkNtQzlXSEplbnRXeGlZak4wV1l1RVZrMi9WNE5pMkNHVFh1?=
 =?utf-8?B?dFlwdFkzeStNdHoyeXlTWVA5cjE2NjBkaXEra2xDYlpuc2dlRlFnaUdPM0dT?=
 =?utf-8?B?ZllseUYxSkY1SkRuNEdrYnlta2I5SXl3THlSbzVxbzZmbHhTTDdwYUdta2dF?=
 =?utf-8?B?QmJUbUd3aXJIb2I3dWlRdEh1K2dWWW1FRkw0dVdvV3o3V2c4MWh6U3M3NU1G?=
 =?utf-8?B?V3FoK0s0cytGMlNQRk13dkR4eVBpdzlCVTYwMkVQTXBuUENhQVFvRGFxRXN4?=
 =?utf-8?B?Z09GSDVtOUVUOUIrcTE5VWhqK1JMQmpUZ05VM2dSajJ5NHN5eG9HQkpuQzdR?=
 =?utf-8?B?UzhVWGVvR2tQL3VlbURkckZNTDNqQmxESG9pZXRXdzQ3NXBVc1VQclhSOG13?=
 =?utf-8?B?Y2cwSjdKbHRhMXMzaUMwSlhLZy9FZUxxbm9SQkNhL0xJSE9BZlYyQWxiUllu?=
 =?utf-8?B?MVIyZWpDa3pGRElOZXNPNXhBSEgvWmhqNElCNDVNM1ZIcFNWTzJlWmVvSlAy?=
 =?utf-8?B?SGp0RU5kWUJFbHYvK3I3bEM1d0dNRkVVN1BoSkk2VGpUQXY1TkVsa1R3OWRE?=
 =?utf-8?B?YTJ1Nis3T0pZYTNLVHJRMGc5OE9oZG1QM2cyVlpOWHRRN2NqYkJpcUx4N1Qr?=
 =?utf-8?B?KytjdGYzVVR0Z1V4elFMMUVqNnRuSTg3ejZLYmxEQ3lRalJDMWhRMFlnMFow?=
 =?utf-8?B?OVE3Zi85ekpxb3hWdGkwdHdmNmVKVWNBUmhiRjRWNTJUajRoaTJPS2tGWFZW?=
 =?utf-8?B?d0kyUVhuUERlSkRQQ0p3QytmZXk4L1lpL1A3Q3dTYzhRTFY5MGFlRkd1S3BP?=
 =?utf-8?Q?ODaXI/eM9mBv4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUcxMFdhSEtkSEhMUUJCZSt2OEJGU3pQNC9GSXpxbzY3a0MyNlorR3FPdkR1?=
 =?utf-8?B?cjcyS1RHN1RmV0VPZzNaM2hJbmNEV3k0djFCa3NJTFo5OWZBOGNxSVFiWHhT?=
 =?utf-8?B?L0k4U28rM3UySHJDNDEwckZYY0g2M3ZXQ3IzNmgzM2EybXlFSjBPSFB2Rmdu?=
 =?utf-8?B?cWp1QndZcUkwZGt0V2VCVThuSlY5Nnh0enYwU3hMa0piaGYxZWN0dno3cmVn?=
 =?utf-8?B?UG5wSWphOXQzU2IrZG9YSXAxTFZLcXZlM0NnVkttWGZqOEZPU0R3aVI0RkhQ?=
 =?utf-8?B?U21zcHFrdUd4b3lqbDhjWnhsTlN2YnVmMFR0eXhpKzN3SEZrYkNTUkRuZ2Ja?=
 =?utf-8?B?b2NxR0NvYWMvdlFZNmFZSEJwK2lyQU9IbEs0dUZ0cHNUMEFETURLN0x2WW82?=
 =?utf-8?B?UFkxR3Zxa2E5NlpsUnFZSFlnTVA4dGprR3V5NjQ1V2Y0c3hPV3RsTjZVeEht?=
 =?utf-8?B?ZlJQNWM4SWtDeHE3T0oyeE1Yby9WMDBOUFdJbGpQWkhTUHVHVjU1ZFRYcFMw?=
 =?utf-8?B?RkZCUEVCY3IxK3ZaTVl3d2crT2hCNC9RSGw0OHlRYzJOUGErMlpBTUNhN1N3?=
 =?utf-8?B?RDdZYnY2K2cwUytxckFHblZUenJKSnM1bm92cWpzb1d2R1BuK3VZK3k3Q1c4?=
 =?utf-8?B?amFEOXpiZFYxZ0cvYUF5MWd2VDN4WmhySlVZSHcyN1JMeXZPUEpqdXlrUjJl?=
 =?utf-8?B?NTdmUEpueHJ1ZmNkNFBsaERJaTJJVWMvTkcxVjhZcndDUmRJK0RHOEU1dU01?=
 =?utf-8?B?T2xkK0NKbVhqY1ZOOE9VaTV1SUxPaDNVQVRwVEs0bXAwTGpaVTVmSURITGs0?=
 =?utf-8?B?ZGFoc1l2NHMxTWIyNmZGa3ltNkdFR3IzSUhHZE5mMURTdHlyQ2QrZUtyVWI3?=
 =?utf-8?B?YVdBS0YyMEU0ZUpuUTNSdFJtQVRHeStOMnpHN3ZDUEtZbGlGUkZHejJtYklp?=
 =?utf-8?B?YkhiSUdjSU5aekIwSUFja0VhTFRpcmNKbDB1VGNQN2JpbEozbzlMNUdZc29Z?=
 =?utf-8?B?dksvU1VXcE54a0c1a0JaUGNkeHRkQ3VGeVdHeitTd040bnRPbVFsWHZJVE50?=
 =?utf-8?B?aGhKa1NnSUlhSWlwVHFaNGg0OFJIcER0ZmhuTzJmNUtUYTdpaUFRV25meUkx?=
 =?utf-8?B?OTVEcExod3NDMFFWQzB1UTdPdjF5ZGkrZzhsTzFSQ21TeFBtMy9VbXJSakJD?=
 =?utf-8?B?bVNvNUlxV0U2aEZGeEp6Y3NFa3ZadUZHTzRKVVQ4bnBPbGsrRWZEWEcxOEJp?=
 =?utf-8?B?NWRpa2EvRHpXVDMwM2cvM2hLblVkcWUrMGp2ZWRBSHBGMGx1blFTWFNHQkZ3?=
 =?utf-8?B?NHRLWWU1L0ZkVjFNNGhIaHRnRGRLRmFXempGUjdraXU4MldYK2poRVQ2S2xM?=
 =?utf-8?B?UTB5MUc2eEk1dWRNcTZuUnR2enljekZQekRyMzlYZmZjZlJPa1lZVHo2NFFK?=
 =?utf-8?B?a0JVR0NKSnNjZ0dyS2xVQ2hkWXhSNFJJUHh0L1JKZVIxYW9lRGtnZ0VTcWhW?=
 =?utf-8?B?UkxKLzFrSDR3Q1JRRmpvMUFPMFE2cmxDTXFaSmcycWhtVXQwZElNMDlheHc2?=
 =?utf-8?B?ZDhqcHJDeU5wRDI5NGxjQjFRblBRakRoZGRIWTMzL2dWNmljZTJwcWJHQlJh?=
 =?utf-8?B?d1VsT3RyczVWVmxSUXdQS21YQkRnMlIzQUxkdTJiL2JueHMwazJwc3N1aFFq?=
 =?utf-8?B?eHIzVldZMzMzVEU2emhsU2gyTll5SnBDU09PZDRDdThwcGpya3VKelRDcllP?=
 =?utf-8?B?ZUJtTVc5bHJFUEsxOWJIWERJa2hZY0lDRHZnaTFpbkxkcURlSHdMbmgzVGlJ?=
 =?utf-8?B?Qm1yeVd3WWtMdVRUYjl0WGlVQVVCSXY4ZU9RQloxb2RneDV0eHJ0bi85ZCtU?=
 =?utf-8?B?c2lyd1JkbDBNZHBFTlppR2V1RW9uclc4TWc4MHpMMGdaUWh0eGVRTmVLRWpY?=
 =?utf-8?B?S1hFTjJndFI2bkJDZEhwbGNaWVphajhmaTRpTkxOZmhUN0hYT1p6OGQvT0FU?=
 =?utf-8?B?SjRaMVZubktsMGxZV05uMmJXSHY4TThNMFZsZS9TV0hzUkhzTlhrRDNHZnF0?=
 =?utf-8?B?Z1lLSG1qV2JzS1ZnWWdLWnlBSHYvTHc0U2hXeGFMeGFRM050S1RERjhYTnVX?=
 =?utf-8?B?UDErU1MxMExVdEIrcHRCRnB6UEZQcG9abVB5T2tFRzBOVUdCbDYxTEFHSG9u?=
 =?utf-8?Q?wue/N8sDjjyMh/NbUxlMKAQ=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a27b51-6e6a-48bd-7f85-08dd3933beee
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 09:20:56.8101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbE82UZosQbrlLsIWd8iARnrUI+WJtkYSNPnRiuqSM7xd8DzKRj0vOWHeKCueZGVuMQKZGzCRFWiDdy2dXh0Tjsx+2lwtHDtXCNw7lTXopI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_012104_171233_B3DD329B 
X-CRM114-Status: GOOD (  36.72  )
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

Hi Michael,

On 1/20/25 10:06 AM, Michael Riesch wrote:
> Hi Quentin,
> 
> On 1/16/25 15:47, Quentin Schulz wrote:
>> This adds minimal support for the Pre-ICT tester adapter for RK3588
>> Jaguar.
>> GPIO3A3, GPIO3A4, GPIO3B2 and GPIO3D2 to GPIO3D5 are all routed to power
>> rails and can only be used as input and their bias are important to be
>> able to properly detect soldering issues.
>>
>> Additionally, this adds build-time overlay application tests for (some)
>> Rockchip overlays to try to avoid future regressions.
>>
>> Notably, the Device Trees from Wolfvision PF5 aren't migrated (but
>> should) as I do not own the device and couldn't figure out from the
>> introducing commit logs what the possible valid combinations are.
>> +Cc Michael Riesch for awareness
> 
> Thanks for the heads up!
> 
> Just to make sure I understood correctly: By migrated you mean that the
> overlay entries are moved to a separate section in the Makefile and
> there are explicit combinations of base DTS and overlays for
> compile-time testing purposes? If so, I don't consider the PF5 migration
> as *that* urgent. I don't think you can break anything on our side. Or
> am I missing something?
> 

I think it makes sense to backport the patches in this series (except 
the one adding support for the Pre-ICT tester adapter on RK3588 Jaguar). 
Because we cannot backport the patch for Pre-ICT tester adapter (it's an 
addition, not a bug fix), any patch that is applied after that one will 
result in a git conflict when backporting to stable releases.

I believe it makes sense to backport build time overlay application tests.

The git conflict will likely be no big deal but if we can avoid it, 
better avoid it :)

> Maybe you can move the lines
> 
>    dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
>    dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
> 
> to the overlay section as well? This should not cause any functional
> changes.
> 

The overlay section would only support the syntax which allows build 
time testing. I would like to avoid confusion around what to do when 
adding a new overlay. Specifically note the missing o in the extension 
with the build time tests.

>> I'm wondering if we shouldn't backport patches 1 and 2 to stable? In
>> which case, it would make sense to try to have the Wolfvision PF5
>> overlay tests merged before the addition of the Pre-ICT tester adapter
>> support for RK3588 Jaguar as that one won't be backported to stable and
>> backporting the Wolfvision overlay test would incur an unnecessary
>> (though not difficult) git conflict to resolve.
>>
>> I also do not know what kind of tests we should have when overlay
>> combinations are possible (let's say there are A, B and C overlays that
>> can all be applied, should we have base + A, base + B, base + C,
>> base + A + B, base + A + C, base + B + C and base + A + B + C tests?
>> maybe even base + B + A, base + C + B, base A + C + B, base + B + A + C,
>> base + B + C + A, base + C + B + A and base + C + A + B tests?).
> 
> I have never been good at combinatorics, but I feel this has the
> potential to explode :-) My two cents: The overlays *should* be
> orthogonal to each other, i.e., no dependencies between them in the
> sense that overlay A creates a node that is used by overlay B and that
> sort of thing. Then

I disagree. I can already tell you the following usecase:

our Pre-ICT tester adapter for RK3588 Jaguar has two proprietary camera 
connectors. We already have two camera modules working with it, so the 
following would make sense:

pre-ict-tester.dtbo
pre-ict-tester-con1-camX.dtbo
pre-ict-tester-con1-camY.dtbo
pre-ict-tester-con2-camX.dtbo
pre-ict-tester-con2-camY.dtbo

You would then apply pre-ict-tester.dtbo followed by one or two cam 
dtbos. The pre-ict-tester can be used without the camera modules (c.f. 
this patch :) ).

>   - Permutation can be ignored. (base + A + C = base + C + A)

I think that's fair. It would anyway be an issue with dtso which are 
using /delete-node/ or /delete-property/.

>   - Composition (base + A + B + C) may be ignored in favor of individual
>     tests.

Not sure this is ideal either.

Our RK3588 Jaguar main PCBA also has two proprietary camera connectors. 
It would make sense to test that applying a dtso for main PCBA is not 
messing with applying a dtso for the camera module on the adapter.

This is a bit theoretical at the moment though since there's no camera 
stack available for RK3588.

>   - Individual tests may be ignored in favor of (a) composition(s) that
>     cover(s) all individual tests.
> 
> But of course this is likely to vary from case to case. In our case, in
> the composition
> 
>    rk3568-wolfvision-pf5-vz-2-uhd := rk3568-wolfvision-pf5.dtb \
>      rk3568-wolfvision-pf5-io-expander.dtbo \
>      rk3568-wolfvision-pf5-display-vz.dtbo
> 
> would do the trick.
> 

Thanks, will send a patch for that in v3.

Cheers,
Quentin

