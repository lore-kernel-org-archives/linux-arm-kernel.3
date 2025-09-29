Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893BFCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 08:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F73QDQE4VIKEXtAna0FrXLvaJ8W7mhgQX2kw4s/ZbNA=; b=nN25UEOxtiI/tD6uIHaZLtz72v
	ZmSuXqxi3+kI0ehbpXbgr0HsYzPLcXohYzCC6E4/MONM1kYhbkVlvGoliYTvpCyuz4sTi0yAATI7v
	FmfraaxbGuEvU9b7g/R1Tml59cVXcEpIOyGNBs+RwIsrDXpv3ziGU2RRuVc6YUNe9SieIzyDxj2D+
	zzAF7W1/3kpSLcsuPLYglSWfptuDziIATz8nbx5+JnLhhTSI9g6E4v7Q82SurI6gyjT0wfyiy7AS8
	5ZZcdA6jstM0yHUHOgEdfTrSXgTJMSJFu2pzjH/+2Mat6FATHMThWcF0nqRzjNXCmVfCHzOhDp04k
	jz2PQw8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39Qg-00000001oBS-1EzT;
	Mon, 29 Sep 2025 08:40:18 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39Qb-00000001o95-2kER
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 08:40:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRuKoHiSqV9QWP2hKRufB0fd3EvJ35WTvlFNRqiWCdL5U+0Mm4VkyaP9TG12vTb6EJXhKc2GGk+lGlyFi1aFQjb3JVwCymRVIZCvDw0Pb+WCDi/bgz3PoKqzTkPZIcLa+2WH+WtUfLT7qMsW9entqsIoFNYcDpnRm1TxnEBJpATzfsG8tGW/QCL8b3hMs+6QHeN7VRA11LcSiVD66i1klYiB48BQb/msdGjdNHsFIi2wKflLrqTtpdIsotTn1f/tQRMeuqIaTL3aQLtNU8cQJtlE0x96l7azz0C7kPIpD23fV4efVgPtP6QhzfUEzS9wLgEknN05GSzlpovs6oCrcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F73QDQE4VIKEXtAna0FrXLvaJ8W7mhgQX2kw4s/ZbNA=;
 b=uHOO7bKeE2zW2/6rVBEkFPzObSpyXyuvChQCJB/H75FVXFe0UfYknAI5rxqhvwov3ZJJY35TlqLkPJTriuPKEeNwI++jPnE6TBiZ5LZEPobmsAE11E1Iuh/hRthmFYaFn35EOO+ue2al1McVkd5kOl1R5otFEcIZPQMDnjHZ8jVJlcMBXOMobU/tTfh7Il7vyIMdXfZwYnvOUe1m9rS7m+qxh2EGaYFlgEMYQNDW1almif9d2YcDUtWP3Yd3albEisNBKEkEWQPbk0LJD2hKS0A6BJk7F/M+fu9ult819uRm7cg/M8vaGgD6B+fdVv2VXautfqvESjpl9MKOX9YoQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F73QDQE4VIKEXtAna0FrXLvaJ8W7mhgQX2kw4s/ZbNA=;
 b=l2ycTBkHoHc9BxhWswBdbNvPh+Sht4raFjX5iogpejco4Ac5Xyz0PDkHIvYpBJT9lKNueFG+9fb/v+za92fEQTb/Bkeyf1cOV5X9H9g3SeStZnEtStywsistXUBIm63Va+nuzl9e1Uqr8i2N77f5/ywjw/TM+sINfdgYUtMyTy0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB4747.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:254::16)
 by AS8PR10MB7564.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:562::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 08:39:59 +0000
Received: from DB9PR10MB4747.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7956:ad04:35d8:6f0b]) by DB9PR10MB4747.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7956:ad04:35d8:6f0b%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 08:39:59 +0000
Message-ID: <2e644e6c-a57a-47f9-8029-6c1450df256b@prevas.dk>
Date: Mon, 29 Sep 2025 10:39:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: imx6qdl: make VAR-SOM SoM SoC-agnostic
From: Stefan Prisacariu <stefan.prisacariu@prevas.dk>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250925104942.4148376-1-stefan.prisacariu@prevas.dk>
 <aNXAaewv/MpqL78M@lizhi-Precision-Tower-5810>
 <4a97f86d-a466-41bb-860c-ed64715d1bd0@prevas.dk>
Content-Language: en-US
In-Reply-To: <4a97f86d-a466-41bb-860c-ed64715d1bd0@prevas.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MM0P280CA0120.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::34) To DB9PR10MB4747.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:254::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB4747:EE_|AS8PR10MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: b082ce32-cb4d-4df9-55b8-08ddff33c681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUVyTHdjVGJST1RyTmdyclBnMGd2R2VjUDlxQ1VkdnVSY0ttQVVXMUpxY3RO?=
 =?utf-8?B?aVRuZUxEZzhyU3kvV29pNTNRRmpYUTFzWUhrdzRKSlpneTlsYWQ3bEEyVWl3?=
 =?utf-8?B?ZFVWTElxdUw3MmpVbU9UdWoyT21pUm1jUGJIZ3Z2QkFueDI3WnRsd1J2Y1lv?=
 =?utf-8?B?RUVOeGFPVFBCOWt3RlBWb3krNWlFUXNwTXRoaW9DYXBRQklyc0VjMGNLYjhG?=
 =?utf-8?B?WE9mK1hrdmNBMzUrcGFSbUpzMVZnQ29hOUhGSFNtaUl6aVlBZC9keEpvbVUy?=
 =?utf-8?B?UXJKRms3VWR1dzVCUmtTL0k2MUYxckQvb3ljTVNpcTVmeThxNkNScnJhc2d6?=
 =?utf-8?B?ZGdKYjEweGtaUzhmYWx0MGxrb3JJaTNuZkJURUNONzQ4MGlNcGliKzNlWjRN?=
 =?utf-8?B?TVNXUHEwQU1yQjAyb2k1WUJjZHVqNkJOTWVKWkxjTGdjcGgwSjRiaHU0UlN4?=
 =?utf-8?B?VEVIWFd2WmdSemRpSUx5UytYOWVwQ1FVWjh1TDNVaWpOdHhmVENGdVFRbGRM?=
 =?utf-8?B?T0hTcDdTbkVEWWdHVm9sSnU5dDhZdHdrR0x1cFZqUVF5YkpFRDJCWXYzRGtq?=
 =?utf-8?B?L3NuejA5ZXp5YzF4OXNmT1RBQ3ZYdE1pRThCeiswZ0QybjZLQWxET0prd3VW?=
 =?utf-8?B?QTJVNGJHeDZYOERBTmJzeCtwdTV2OTM1OWR1V0RkU3IvMEIzY3UxdWN2Zmk4?=
 =?utf-8?B?UWx6eGpSN0ttU0VPdVVXTG1TNTdRd05FRkNlNmFUUC9xSzg1YzFMYURVdkdn?=
 =?utf-8?B?MVBmVm5hVVQyUGN5eDZLME5PRThQWXlpeVFlVFMyVHhWenpJNWRUQTlBQXlj?=
 =?utf-8?B?L0gxUDhhUzFneHoydDdmc0J4RDNoN2dkT0Z6K0kyN0t4QVVhVkVHRC9mRkZN?=
 =?utf-8?B?b1RJMHhPazh6dno1eDZEMDY3MWw4dVJWVmhnVEtVeWdZUkY1ODc3Tk9aRFNI?=
 =?utf-8?B?N3FCOE1Fd2lOUFhCN1d3YW5CbERzMW9GbThYNTFxcng2U1EwUDJhTWR3S2xU?=
 =?utf-8?B?QTVzeFphb0dhbmJacFk4eFhTUEhuY2JLK3Q4ZGpzUEpSVlpKN2thcU9NR24v?=
 =?utf-8?B?TThxQ1FUNzA1VEs3ZGpJaVBHQWplZm1KNDI5THZSUGZmbHJEUDk1QVhOcG12?=
 =?utf-8?B?c1M2T1UwN0hKKzBuUzRnL2thbkRXRXNTd2FMcEdUelcycjFtQUQ3T0VyeDV3?=
 =?utf-8?B?akp3Znlwck5MNWlIWk1UL0U4QUxBcGRMdmRIWU1aLzlXQnFLVXFqZW5vbTFM?=
 =?utf-8?B?REVodnZuMWE1cmRMSEkxZVFWR1dRbG9RaFhqeVcvblFpSGsxUHZPRjBLQzBF?=
 =?utf-8?B?aHByeDFtb2wvK3NsMGp2bzZtS2ZQS3MxTGtQL05tT2dJT2NCQjlkTDNLR1J1?=
 =?utf-8?B?K0hpU1lCdEdYam5id2NOZnk1Sm5xS0UvYUl5dHhGWm5sYWZ2M3ZhdnpRQXdY?=
 =?utf-8?B?V0N3UmdZQmdpZ29tYzZQalNrV1I1L1RXbTFBQ1QrUGN2WmdUS2VJQlNFS3dh?=
 =?utf-8?B?WHh6YU1tQW4zdkhHQ1BycWdDVlBvZlRnRFRoL2VacnNZQXBUTklSL1g0dC9H?=
 =?utf-8?B?REF1Qk1GQ3duM3BiUTlUZVlUN2FUMkRaQXYyTGVXRUdrd1kxSUdVMXk5WkRy?=
 =?utf-8?B?aUo0cDF1Snpxakdvc1FJcEUzQjFHODdxREpwK2U2T0taUzFHQUtPaUdTc2J6?=
 =?utf-8?B?QVl2c0o0bjU5YWtBbFdEa1dkbFVjSnFxUXZtSGp3Zm4vL3RyZUxUL0o3VDlX?=
 =?utf-8?B?RTdwUVRYTlg0dU93R1BCMmxzK24wbDZ3Z2FQUjZlVVM4MC9MUi96OTJPMkVr?=
 =?utf-8?B?enpzdjJ6WFZnbDNYb2NjY1JvdHRtOHBESHoyZFE0QkNLVXdWYWZhY3NpRkkw?=
 =?utf-8?B?SnlzRUlTOHoyZkppWGtCVzErc0pWQkQ0eDh5YWdhbHlhWFRlL2w2dXdycVpo?=
 =?utf-8?Q?f78H/TDro2o00r9gvKCXjCg5r/IpbXql?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB4747.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHJKM3JPYU1jYk43MEYvZzF4NUJ0TlE1RVlDbTAyUjNGekFhbk9CR1lBaXZS?=
 =?utf-8?B?Yy9MSnBlcTB1YjVKTis5TklkMURHUDYzWGt6dXR3L2VBbzEzdlBoaTl5Y2x4?=
 =?utf-8?B?TndGTkpkTlRPTktOWmN3bm5oMTZsNHkxWmNFWVhzZVBnanUwSnZvc3RUMi9a?=
 =?utf-8?B?NTZ5SkRma3ZOd1BnK2RXdnBETGs3MXFnWEFOQ2dpM3pUTFcxSGU1b2lLdXhJ?=
 =?utf-8?B?VUxJMEE1d0xXT09lUWxJL0Vnd2MzbExucE91MGhCZjQyUHAzaTZQVDhPQU1T?=
 =?utf-8?B?WmZndTdGcnlDc1hyUnc2WU1ISkRad3NSSytqOXN6Mi9mTE1JZGF5RzA0SXZp?=
 =?utf-8?B?VHd2eFpveVJ2Z0dZTGNXTlY4NEtQcjJUVXdaR3JHNnRBMTdhZ0FTSmk4MjdW?=
 =?utf-8?B?S0dkSFhWNGhWZlQ3alozVklmOTYrb1FWSUVUUWM4akNZbUV4YXZJVkdlNjdF?=
 =?utf-8?B?QXlVQjF3VnZKSFBieHZFejQzdThoV1ozcHg3cDZMSElpTjlROGdaQnlUWDdi?=
 =?utf-8?B?WWorS2diTUV5NitBeUlrdDFEalpvcWtpLzY3QmlpT0paL1JOUWFNZC95YWNX?=
 =?utf-8?B?UjZkR1V6Q1ZBeFZxV2xtRTlzZTcrVmlyYWxIMUxZdHdtTHZ5aHhkTmhZSVFS?=
 =?utf-8?B?dlhUaTUrZ2twUjIxK3MrUnBsOERYdk9YY1ljZzZCbVo2VkYwKzkreVVGWVcz?=
 =?utf-8?B?SDAzNnlYTUdRRE50OUIyekhyK3JSb0lXOEJRSzhJMXdzaFlTQi80QVo1WVYr?=
 =?utf-8?B?eE9wdnAxN1Q5bm5PcmxzOXQxQ0JtUEt1QnZzc3ZjY1FXaVRObXlDZFZrWmhw?=
 =?utf-8?B?cVJjUWlyUWFmSHI1STZOWTZ4dkdFa2o1Nm9YQ2Y5UjhwNWlKbkV1UkI0Mzh4?=
 =?utf-8?B?RG5hOGRwQVVNRHVJMjNyMDJnV3Q2OHlTKzRkbzBjeXJrTlJMQ0ZFa3BrT1BU?=
 =?utf-8?B?KzZNOGtVOVhka3FKeUpWOThFSkRqbmd3NkFocWtxZlRQaWZYU2lBb2tTNzQ0?=
 =?utf-8?B?V2F4OFAxSUh5QjBwZzhXTzdpdTRaanNlaWZ0RTNWblZRcTU3SjA4ZFFKQ09U?=
 =?utf-8?B?QzdIcXBLb1E2QjVnNmw4aW8zbXA2M2NMS0ZzaExBd2UrZjFqSVVXRXZnY1lQ?=
 =?utf-8?B?ZjN3ZWZNK0JZb0wxN01UdGI1bUdldEFRaitvSkc3OGdkYnAzS2t2a2ZTOWEr?=
 =?utf-8?B?MXVPT2NFamNHOTVTVGUrN2dmU1RCcjlobmxoQkJhRnc1TFhJSWlRM3pKUzdQ?=
 =?utf-8?B?MThuQ3BsYmtNR0lRUm5rVklaM0J5VHd2Tldrdm1aNDFyem9VZUpQOGEwYUkz?=
 =?utf-8?B?akdjd3hldEdCaXVQSklUS0VmVVRUVDgxWlRHeTgxRkhGMUlTa0d6ZjkvQ01z?=
 =?utf-8?B?bTE2TFR2VFZ5SkxqMFFBTEd1eXcvbDdqVEhxMnhZTGYxWGlLMGdSWEZRMWJR?=
 =?utf-8?B?L01Xayt4Z3ZwZjNNR3N2d2FIejhjS29xRk1rdFV5bGY0VDF3UFc0TFhQK0Nw?=
 =?utf-8?B?SFNOc1A4WjMzM2JrcnE1T01DUnYvK2JaTG05WW94aDNKYWJmQStXYm5sMFV6?=
 =?utf-8?B?MVVWK3YwWU5Tc0NpM3R4VnhJR0c1Yy8yUEpidzIrOWp1bXR6MVNhUzdldHdG?=
 =?utf-8?B?L0x5WG5oRFBhWDFMK09pNXdoTGdrTUFrQ051U0crY2VyNFFPMUJZVkF5ZHZH?=
 =?utf-8?B?NXNlRjBTeGZwUExObk1DOGFwU3dBUGVQTTFoTE9JeDNXdFBxMmFpN0VIQ0t6?=
 =?utf-8?B?SklPcEZsUmlnK2hrK3lpdkkzeHo0VGFSeUN1K0piNDkxeTRvUVUwYVZOd3Mv?=
 =?utf-8?B?NWE2bWloNnhHTWpwZ3dMdzZOQkhwUkVnRzFtUjlOUDBvUWVGYkpmTFVZRU1k?=
 =?utf-8?B?WGNLYmQrNDlTZ1lucDdvOWMvRm1aOEZiMXZZUFh3VjNMckdCYzFicVhrOVFY?=
 =?utf-8?B?ZVk2VVlrVW5lUUZnczl4VzFsdE9ISmNPcURRbFdsb1pkOWxDTXNlS2FIS0po?=
 =?utf-8?B?MUxxVFhoeC9Hd1pXcWpXdXdMd0RlbDQ5MHlIbHUvOFBTQXM2YWwrdmM4Wkcx?=
 =?utf-8?B?d0tLczY5aEdqcVVXSzdGdytqTWlBcXY5UDYyWTBqa0c4c21DdjNWaFVHK0RC?=
 =?utf-8?B?SlB6dmY1YzUyVUs0dG9wc2RKOEIraXY3NnJPcksxWXBtaERhVC9TcFA1Mllh?=
 =?utf-8?B?L0E9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: b082ce32-cb4d-4df9-55b8-08ddff33c681
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4747.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 08:39:59.6710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 291AooOcRYC+Sakk+jWH5gRkGCmnCFf1gmZ1elIx9SI1O5cVbyh8mCwtWMV7Af+ZsgfHzZQG2wJ3YdNGqrE1/buhLDx/M9ezvcLO+kajyxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7564
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_014013_996294_49BF60F1 
X-CRM114-Status: GOOD (  19.68  )
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

Hi Frank,

Please let me know if you want me to sent again this patch:

- with the simpler commit message

- add a cover letter to move the extra information

- keep the /dts-v1/; inside the .dtsi


Thank you,

Stefan


On 26/09/2025 11.31, Stefan Prisacariu wrote:
>
> On 26/09/2025 00.21, Frank Li wrote:
>> On Thu, Sep 25, 2025 at 12:49:40PM +0200, stefan.prisacariu@prevas.dk 
>> wrote:
>>> From: Stefan Prisacariu <stefan.prisacariu@prevas.dk>
>>>
>>> Make SoM .dtsi SoC-agnostic by moving SoC include to board level
>>>
>>> imx6qdl-var-som.dtsi currently includes imx6q.dtsi, which makes this 
>>> SoM
>>> description Quad/Dual specific and prevents reuse from i.MX6DL boards.
>>>
>>> Move the SoC selection to the board level:
>>>   - Drop the imx6q.dtsi include from the SoM .dtsi.
>>>   - Add imx6q.dtsi include to imx6q-var-mx6customboard.dts.
>> move imx6q.dtsi from imx6qdl-var-som.dtsi to 
>> imx6q-var-mx6customboard.dts.
>>
>>> This keeps the SoM .dtsi SoC-agnostic (it already relies on 
>>> imx6qdl.dtsi
>>> for family-common parts) and allows boards using the DualLite or 
>>> Solo to
>>> include imx6dl.dtsi instead.
>>>
>>> Why this is needed:
>>> I need to reuse imx6qdl-var-som.dtsi for a board based on i.MX6DL
>>> (VAR-SOM SoM + custom carrier). Without this change, the SoM .dtsi
>>> forces imx6q.dtsi, which is incorrect for DL and breaks the layering
>>> model used upstream.
>> Can use simple words
>>
>> To reuse imx6qdl-var-som.dtsi on i.MX6DL board.
>>
>>> Verification:
>>> The DTB for imx6q-var-mx6customboard was rebuilt before and after this
>>> change. Both the binary DTB and the decompiled DTS
>>> (via dtc -I dtb -O dts -s) are identical, confirming no functional 
>>> change
>>> for the existing board.
>> Needn't this section (good place for these informaiton is cover letter).
>>
>>> Alignment:
>>> This also aligns the layering with how it is already done for
>>> imx6q-var-dt6customboard.dts, where the SoC include is handled at the
>>> board level.
>> Needn't this section
>>
>>> No functional changes for imx6q-var-mx6customboard are intended.
>> good
>>
>>> Files were introduced in:
>>> commit e5c810848d2a ("ARM: dts: imx6qdl: Add Variscite VAR-SOM-MX6
>>> SoM support")
>>> commit a5b59a3f41bd ("ARM: dts: imx6q: Add Variscite MX6 Custom board
>>> support")
>> Needn't this section.
>>
>>> Signed-off-by: Stefan Prisacariu <stefan.prisacariu@prevas.dk>
>>> ---
>>>   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dts | 1 +
>>>   arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi         | 3 ---
>>>   2 files changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dts 
>>> b/arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dts
>>> index 18a620832a2a..a55644529c67 100644
>>> --- a/arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dts
>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dts
>>> @@ -8,6 +8,7 @@
>>>
>>>   /dts-v1/;
>>>
>>> +#include "imx6q.dtsi"
>>>   #include "imx6qdl-var-som.dtsi"
>>>   #include <dt-bindings/pwm/pwm.h>
>>>
>>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi 
>>> b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi
>>> index 59833e8d11d8..51bcaf04546b 100644
>>> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi
>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi
>>> @@ -9,9 +9,6 @@
>>>    * Copyright 2022 Bootlin
>>>    */
>>>
>>> -/dts-v1/;
>> why drop this line.
>
> As far as I know this line should be present in the dts not dtsi files,
> also this will remove the requirement to have this dtsi file first 
> included in
> the dts files
>
> Stefan
>
>>
>> Frank
>>> -
>>> -#include "imx6q.dtsi"
>>>   #include <dt-bindings/clock/imx6qdl-clock.h>
>>>   #include <dt-bindings/gpio/gpio.h>
>>>   #include <dt-bindings/sound/fsl-imx-audmux.h>
>>>
>>> base-commit: 8f5ff9784f3262e6e85c68d86f8b7931827f2983
>>> -- 
>>> 2.49.1
>>>

