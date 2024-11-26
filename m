Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B70D3B986
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 11:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djrGuHapDutmSbl58wFbdb42EEtUqcT7hNCVorDj4vs=; b=M1gEgkhL/nfavbH6vTuxq5bljW
	tH6Crb9/q/dfAYrNShTRtwHMGCiiFktDPWKtQWlTQpm/bDWh17VZYovyMhdOnCYzGv+/NObV+Al2A
	mXskbC1i/taqQmpHbw7x7qAz315QaLNnwbve/pPL5ccireafdU5zBIfbVuRL13UEeJvEjxqDgEbQg
	YCt2tSFUjiqGRwpTPRAzC8nuI8Kz57Ror75kxCgbYp95e7KiQ7PfX4VOl7ZWVcS/0iTcWOt6SUpAW
	H55gyAxDVs0JM8EP60NwlmXEV2wSw9pkMeHnoRmv9m5F+qSZX4SMKXbtfzHstpbq5PU1X9+DnuMGL
	r/rKdDVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFu67-0000000ASv7-0jsc;
	Tue, 26 Nov 2024 11:51:15 +0000
Received: from mail-db5eur02on20607.outbound.protection.outlook.com ([2a01:111:f403:2608::607] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFu3M-0000000ASGH-1tMN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 11:48:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhHr2cYKnDhDGtlS+5Hhp+NNgmyZdkNtICBG6Uz0KSawrbIKBljdgkNcoIKIRIUE6SnJ6w9ec9Dd97Ls6Z2XEBWuTnXEmVhp16WEYhYVi+1Rto7u3eqz7w47fuNB72ll/gmfXfrna6QgL/UIFwjW9bRikbz18tPGYwKmRm9e2sJzBYYDjYkx70JIazgQppxU2VCTnuXha9VzAm4yaZR0dhKdTsU7N+Zl+HHYjgk7G2Ws9dNvs15aoVaz9xdJL/weILdQBTChR20sboeVDwgffxxJe/plu/TY1fN9Y33t/OMhIVLMBn5x9x/KQNViuGmIBhYWx5ucSPvQvvT24XvAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djrGuHapDutmSbl58wFbdb42EEtUqcT7hNCVorDj4vs=;
 b=t8AynW3eUCi4pRoRns1T5PVn8OycAVibB/BfbTIxoBZCnDQomVOdbj67wq9mZ9EWvw5EEts5aI/CcHEmbsBfD0AeCznE2y2gyh2UjHpk9im0fy0tTSkJRhd1TVfQgzm6kaTzhvLgEY6YDi0CRmroafHWeL3DtZaGMyKBEtXvoNbEmvExEMc/kMBSbn5QwABkPMs8Sqn0ovJ5joEQeWnXmMQQcePTbvJiKsclpQouZQPBUcetpM5SxchR4NUQ/9cgvdEPwdITKgoWvo5RhbGaXqLrftg/ms94lJ6uvaL8EknBZnLeOVHaKsXIPNwFdVVW7TslcFtUq2LqUjY5qwi9sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djrGuHapDutmSbl58wFbdb42EEtUqcT7hNCVorDj4vs=;
 b=mPCk6E89hQ9VLbzKhEM0Q2spoQHsbAqr4GxO40sbv3r9ArsFu+BdsodP3+eeuifvvzVkVoHG1H4hfNH1EqzxjwE7A+9sHe1xPydAjDqaMO1lVpU1lMByaYhuBBSHJ1zakBMuH0wTfAIa2n854LRrRpS9OXN6txjVj9YAOVZgmapbaSSV9iGXG9hodB+wtpEoXutO3JKgpSN9E4qmDH84AkF1EqZ/49ndo2rKAOrnHPUzdIlEnewbSYG5EiphPOa2z2aOYQG8PgUPh9lqujI+OLn0yWr0Zf9D1scn3vhEq2GvKysh8nsXTd7zST3Cku8Ov6NJUPj0XBDd+lo2xeUVNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PA1PR04MB10294.eurprd04.prod.outlook.com (2603:10a6:102:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 11:48:20 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 11:48:20 +0000
Message-ID: <d962ad9b-1d15-48af-9cdc-94ab7f80ba61@oss.nxp.com>
Date: Tue, 26 Nov 2024 13:48:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-esdhc-imx: enable 'SDHCI_QUIRK_NO_LED' quirk
 for S32G
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, NXP S32 Linux <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>
References: <20241126114414.419469-1-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20241126114414.419469-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::12) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PA1PR04MB10294:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b2469bc-968c-4504-acc1-08dd0e10397a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUtTekRzWkYxdkpyYW9jYVFFdWpBL3VSWTh2NUk0QUtqWFhyZmI5SnV0R2JL?=
 =?utf-8?B?dTVLUnQwaXlkTm5WUXVCT0MyWkpGcTRvaExtT000R2dFRjJWdThTV3pCS1pH?=
 =?utf-8?B?Y2ZnTFVRRlBzcmNyQi9UN0lmTEVKWkpvaUVZanoxbmhxdnROeEVNa0IzcVlv?=
 =?utf-8?B?ajFZMmN5RlNhdE8wbEVhRkNoay8xdTZ0UGNFb2E3Q1NrczhFTG5jdEZFOUdU?=
 =?utf-8?B?WG02bTJwOG9WQ1NiK3hpVGNKaFIvTVl6bGY1TlR0YXZ2NTRoOTRNVU5tV0NQ?=
 =?utf-8?B?UW9yZ0RudkEvL0YyNDVSa2YraXBIYitoYmhib2Vhci93YnZ6RFVzaktnMXgz?=
 =?utf-8?B?REhWUjRKSXJOK29iVitwYlZ6Q1dLZGR6ZWZJZ2lwM09YZzRPMHNHcTVrMkl1?=
 =?utf-8?B?aThscitZMTUxbW5jM3lxUkNkOGhUbzZJV0dPTyt0aldqeG1LYVpzdDBEQVpF?=
 =?utf-8?B?Uyt3cHRLNzZsblpuQmNpa2Z6c01waVpBcHYxVGZpM2h2NmZpeW8vTk50K3dh?=
 =?utf-8?B?cVJ2NzBTZU9qcHZpaHFwUWRYUTRqUGlvUDd1UEQ2WUFLUm1UdkRVVlZyblNx?=
 =?utf-8?B?YTg1ZHBNUEFyMjkzb1VWOWNBYTh4WlpKa2xYWk9BcWJvNlRKMTRCMlNkMzlE?=
 =?utf-8?B?UUdFbnVhblNqcTE4d3dqK1lIbDgzTmxXSjJpV3dpU25UWkR5cWFRY1NrUGR6?=
 =?utf-8?B?UnJzaEJQRXBaaWcyaTFhWDNYa1dJWUEwOU5tZjVjeW9teFl0Vi9KQitrN2Nt?=
 =?utf-8?B?c1ZJdUk2TnFjZXUyT0p5aXhnQTNMRHBFWk1jdkVTZ2Y2SHpSM005WlhDOWYv?=
 =?utf-8?B?WVU5Tjk1KytaUVdzWW5UVitiWVVTWDMxaW5ERkt1ZDN4WWFGTVp5SExpTFhv?=
 =?utf-8?B?TE56YVA5R0FMY1hrWjNZVXNqdTdUMlVia1FrTkdSbTJqTFVUVmtWcDdBVW1J?=
 =?utf-8?B?S3FQTjJMbTdmVThPbTJMUENtS0QwbG5aVHlDeUVvTWRDODNnS2hXNC9ZUEJN?=
 =?utf-8?B?UmsxdUQrNVBwZURLVDZFKzN3dzFuaHBPV3JpMmRwVDA5bWdsdDFhMFVRbDY1?=
 =?utf-8?B?eWtyWmVsYTVoa21MUVVaN0Y3UUo5K2xwdGY3T3NHSm5uZ3F0Q0JYZ2VXVk9F?=
 =?utf-8?B?UW9rZXY0ZlZSWHBGNDZyajJIRms2K0k2TWZwS2hWTWJFb2pBSFpzUkdpU1VU?=
 =?utf-8?B?UkhZdVNqT0NKQkN2ZTZFU0dsZ0RsZDNYRkdSY3l0RGVQelF6SHFxUWZiek9W?=
 =?utf-8?B?TWFTTU9XdGhLL0ZiSHB5dzZ6dXVZdlYxdWhTeDQrZitHN3Q2K2dZREZLOEFU?=
 =?utf-8?B?K1JEbTRzL2pDV2VldDY1anJrMCtSSUl2dFpKYWNabjBQc243YTc5cFNndjQy?=
 =?utf-8?B?NmtvM2V2T3graElGWmxKTUVXSGt1QXl4N3U2bjVBS0k2eHFHNURtR2hPZlBE?=
 =?utf-8?B?SU0vVU93bll1WEdHcmlXS0k1M2RJMCtLYUdTamYvbGJEQ0hNNlhUQ3Fid0R1?=
 =?utf-8?B?NzZyVFh1VmxVMTNBVkhsd2twTkFVVTBsNi9CN3k4SytLbFJaWnJvcVR4WjB5?=
 =?utf-8?B?N2p3dXNML3JoNHRvUzM0M2V0dFY1cFl0V2lQNlZ0WDR2d29pczY2NlRiWUlV?=
 =?utf-8?B?VHl3alRrZFhNTFJtR1MwOVFoK1lGVitKQUhVTkRha05aeTFObzViQkhpbGlL?=
 =?utf-8?B?U1BWeTVqdFhyNjh0azhYVTFRaTJKM3lUbUxGTkp1ZjNRVmpTY05abjRBcVBX?=
 =?utf-8?B?RWtmTVFwV2dRbG1jQlhIdS9KUkFUWFpyREtDOHg0UU05dTJJa09nd1BEUUtC?=
 =?utf-8?B?YSs0WVEwcTZPbmRmTGhOQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zmt2R2RudmJOSXd3ZndvTWVYb2dxMzBUUW8xRzlPZ002SzU1S0RZd2xKZ3Qx?=
 =?utf-8?B?cjNXNWtsVDduZG5sNmllcnp0VytCdWphWHZuaURqUEZKSXdsaTlod3doSC8z?=
 =?utf-8?B?YkZKMlBBb05UVVV5UzVLUXBQYkd0ck1qWm9xalk4VDFRaEhNanhhUkdrSEVW?=
 =?utf-8?B?eldFd1VVTFBsQmJUWFJYSThUamNtWVlXazBKbGF5NlhMN2lpak1WRnhManRF?=
 =?utf-8?B?WkU1RXVuYkNmbHlKR042cmJpTXJZT0dQb2lLcEtGcy9CT2xTZDVjUGF6bEVt?=
 =?utf-8?B?b2N5RTA2MEI1NllYYzVGTWRPN3lJb3RmRVVRQnJRVnBMaUJqYTJhamkzMzh1?=
 =?utf-8?B?UGhHc0JlWjQ5Tjl6V29YRlFUektXSndaUURCUDlCalVSUFRDeXE5MFNzYUEr?=
 =?utf-8?B?a3k4b1pjZ2RTRnpRMlczZjdabVkybjBXRUwzSTJLdCtHd2RueWpEeU1FMWV6?=
 =?utf-8?B?Zk52SE10K0h2SnVWbnVHWlo2TGx2djZseThScTlFUmtWYmhVMWlrRkltRjVq?=
 =?utf-8?B?QjlicWc4dmpqZjhyR2R5QlVQL3VxUk9hUEh6WHVpblZCTHR6TEJONTBVYzR1?=
 =?utf-8?B?aWhMcUdkUFVzcEM4MGVIRk5rK3pnV0JTdUJQaTRDd3RsZE5LUHMxRWcyS3ZX?=
 =?utf-8?B?aDJNQ0ZqRXM2am9Vd01LYUNSZVFzUm9WbUlVQkFzdVJtZm5HOU1pT3lHRUt5?=
 =?utf-8?B?S2hQa2ZPV0dwbjhOYkFQVnlabTVJZHBPS1Rybms2M2NxU0JmVEwxWisyeHZv?=
 =?utf-8?B?YlZkYStLNHIyZlMveGc1MytTOStNcFFlUmVXeG0xWTJUbFA4TjJzN2VQWkM4?=
 =?utf-8?B?dkxRUW1KQU56VGE1TE9pVkJxTmhpZHoyakprUzBrMENpUEhPNHZUK09NRkQw?=
 =?utf-8?B?YUdjUGx2dTZva1FPeE0xTTg2WEptdnNFRDYzWExuWWtKSXkrQ1BaMTk3U3pM?=
 =?utf-8?B?aGlFNWM3VzhkMUR4TDJ6eFN6My9QUEVUbUlBQk9FZUJQNDF4UWozQUxXclJI?=
 =?utf-8?B?ZWNUZWVpOVRueW1HQi9rRi84cmtQTnRTOTJHZWxPM05yWERQaUJOUEVkdEVs?=
 =?utf-8?B?aElxZXlIQWw1eWYzQzd1TW5iNTZlMFlDcUtLVDBDdmttMjBCTjdwYUNNVkxI?=
 =?utf-8?B?QkUvVHZ3endRR0FSVlFCSlRoUzZ5LzA2UzlkR2dNVFdoS1UwOStRay9PRFNq?=
 =?utf-8?B?N2wyZ2E2ejJ5bFJEdnI3SjFUS05FMjhIbjk2TC8rZVM0cnZuMWZWQ25ncERj?=
 =?utf-8?B?SWhJc1pXaFFBT2ZaU0lnWkVSVFNobzRiNDh5dld3b1ozNVRoK05VeGdZbDVY?=
 =?utf-8?B?TTVJZ0tpRVlBQmNTaWhRenlKQW1PbkJuZ2ZqbUdrRkRWdzY5akFLMk8xMDdE?=
 =?utf-8?B?WTVpeFA4OEJ2ZEh6TmhQTTJ3dG56QnY4d25OUHl1cGVVUmlKaVlLSENIUEZ0?=
 =?utf-8?B?Y1BiaThtNEJxWmJCSXF1V3Rqa29zR3B2dDUrSUlGVncwbWpwc3I1RSs0a0RW?=
 =?utf-8?B?dkxDSGVkVzAwQXB0RmExclY1TzMzaUNOOFJ3YXYvTEYwZ0tnN25OZXFYQ1lD?=
 =?utf-8?B?UjFQdEp1QnRSK0hJNW1kdjVQZXVEU1pyTUJyUUpUbGk2MDY2MW1EMHg2dUIz?=
 =?utf-8?B?RXpXZEU1MVRLWXJIcEp2a1lLcFFwdGdQY283TytLSzFadmErMi9HZk03UDJt?=
 =?utf-8?B?ZitnRmFvTDZrTjh4RVhzbUZtZXZ5SEV0dnN2VytUb0I1Sldoc3JuYjZHaGVy?=
 =?utf-8?B?UGxxNjI3R0N0MThRaGdORytUcUYvLzRlTkovMFhtQkZxS2g2cnE1K3Uyditi?=
 =?utf-8?B?d1gvMCtvMUgrQmJqWStEcTNQK0gzODEwTFQxck5TaVNOVnFDOVBLR2NRemNM?=
 =?utf-8?B?aHlXNGZ6Yk96QVB3TFF3UVB6SDhFamhRRm50eDYyS25KNFp5YUdobUNJOUJF?=
 =?utf-8?B?NmRDcnRhek9YQzU0ZkJuWnFuWG56ZlZ4L2dpa1lwWnE3V2ZJREE5aXNhMTM4?=
 =?utf-8?B?MVpRQTNmRTB3c1BKb1lTeGxQN2Jyekg5M0JLd0NGTy8yNXZuRkZVK0xnMWZI?=
 =?utf-8?B?RVNTcllta0hnQ091WDA5YjM3ZUE4Q2RobFVlQk93a0NrT1p2Y1lhaGRRS012?=
 =?utf-8?B?eVVOYlBJeFZOTnhsZnUyaFNBclVpMGxIelZBcTZKOXRjKzVUYWtRMWh1ZUwv?=
 =?utf-8?Q?Fykqgq4ISVmswkaewxYfIvM=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2469bc-968c-4504-acc1-08dd0e10397a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:48:20.4837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7i56dy/Vvq/YvlseQ6yEy2f+ZJk3OC4WP77BfXXQwEKdG4xR9DLf5SQaEZ+f6iWqGp09V51vplJyjiq/STw8eWeM1EwyCt1Hh2wIj564Apg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10294
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_034824_503463_5C973025 
X-CRM114-Status: GOOD (  14.04  )
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

On 11/26/2024 1:44 PM, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Enable 'SDHCI_QUIRK_NO_LED' quirk for S32G2/S32G3 SoCs.
> S32G SDHCI controller does not have a LED signal line.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>   drivers/mmc/host/sdhci-esdhc-imx.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index d55d045ef236..e23177ea9d91 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -304,6 +304,7 @@ static struct esdhc_soc_data usdhc_s32g2_data = {
>   			| ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
>   			| ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
>   			| ESDHC_FLAG_SKIP_ERR004536 | ESDHC_FLAG_SKIP_CD_WAKE,
> +	.quirks = SDHCI_QUIRK_NO_LED,
>   };
>   
>   static struct esdhc_soc_data usdhc_imx7ulp_data = {

Hello,

Please disregard this patchset, as it was incorrectly composed and sent.
I will resend with correct structure.

Regards,
Ciprian Costea

