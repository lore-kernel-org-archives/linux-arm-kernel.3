Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E36C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 07:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMBt4XLIVHCGRvAOTGrpHUoaveQTgCIsp64Up1TXss0=; b=4UFmohbc4kq8OyNC29eUy5mu1u
	L9MA4mTeOTGbLV5gkHCf+D5AVewevi8XPNMInom4ZRull5vAjgHBIQKgIUuKn+qrpxOCb01HAR0BF
	E9xLpbJJJuyNsshkSHYNnIvEjACUa1g29eMqvAY6I2Hya21OePA7AapPcFtMKEJhcQaz2UoZxSGzu
	qIzdk5bhc0VoIb0nPoznNjGsaCCawjKmUOsYsCNkAHDkx798AulrMueRclzZzBCPEzMyP8OioWa26
	azWlsiCz6MdlVGiNaIWuklV6nSKKHdQ9ZoB3sb1+KUbBByLnokOgVB1dBqZst+zWJjITuisuMSidq
	T5jk4YXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lz7-00000003pt9-28dz;
	Mon, 21 Apr 2025 07:54:33 +0000
Received: from mail-vi1eur05on20608.outbound.protection.outlook.com ([2a01:111:f403:2613::608] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lxG-00000003plT-0AI9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 07:52:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ps74kksvYaP4qStTW4QI/3CLaDE5qZs9/QJKI8170ll0ZhsGr/m/IdayGZPmzrOPyX05hMtmUoCy6wQuYBxGfp8h/oOnyhD62WqHOVlh8P3rFCJmDKgVHlQczbhTYDiQsv6Kjxf+kLkP7zqKvO7NzkRu3y5hTmMgZn87J6dKypXxJBA6qJbegakxl4Rcn3nMEgzzJtp5cGItAY25SKHJjYPcDNlzN/Z7wilA4Tmanfi2xmH6ySVKfPSEk7rtF7l9Z+J3Mx/0ElnXYWwP4ubE95WvQ3Au36LomSwqeVmSO19Ps/kDl12QsLccDtOYVK5Ij5rGq9sWoUAjt+BjRXwsvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMBt4XLIVHCGRvAOTGrpHUoaveQTgCIsp64Up1TXss0=;
 b=rOJOHOO1jUdOseBjO8O+jx6Jk3OOq4z5cmMEXzwHR+ecWnYHeW1kCGU5PE6pCsHbNWPdYPr6jHgs60e8HWOnLcCPhRXbz0Deew/M0wCPygPifUdET5Oi1lM7bPJ5M7rwAKJbR3AiJb0l5JiPkWP9vS4GgWWPNHK+xwPNVFOOzAEnGTGi/tKV5jEj++cmgbg0XrlaCYSAKpUVpy4D2FbSsDLo7v6aOwQnSu9HvTJeMLoQJ+cL4guqA0w0dJUeW7rE2JoL1ogGGOGZwv6lTBFGnPTbLudvYVvdc9PGzEDIuz5nW/DMH0uS5Htu/44UtBYUC0UUSbLiu7RGtwASqbfkzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMBt4XLIVHCGRvAOTGrpHUoaveQTgCIsp64Up1TXss0=;
 b=roIeDMM7gwNn1SKyoEkDXMk0LZobzytic6dFZZOvGeRjhpziCPtuXPEX42yiyT34cAv8jJiG6L3kIR804HsfVhqjTgO/SMutzqjK7UebckxAEi8PiAtAcYy/2x/0Fb072+6c7NMSicES20SnMK41US+6egOZtY3IqVdwTQbTvX5r0oJw98XYLVFt2wArAXxnHp/H0Rj5N7gjq5Xn/L+7oha1RmTNw79+TPOOc52rfPj6TBom6jioZzzeZCjNGac00ArlebogNC967WBF5XtaBPEhM3297Sc54HYTcwdGKQrI4+hRxhsPvQOEF6lo/LoFdNbJ3MpVdtxRrMybptetcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA4PR04MB7758.eurprd04.prod.outlook.com (2603:10a6:102:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Mon, 21 Apr
 2025 07:38:02 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 07:38:01 +0000
Message-ID: <db9c8bed-2e14-4abc-b3c1-0bf9a4a68930@oss.nxp.com>
Date: Mon, 21 Apr 2025 15:37:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] media: imx-jpeg: Fix some motion-jpeg decoding
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
 <e47bcf7715dc31144b5cb6d81957ab067fdccaa8.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <e47bcf7715dc31144b5cb6d81957ab067fdccaa8.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA4PR04MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 32cc8ed9-307c-44de-fb0a-08dd80a7717a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUQwWWZHOFhYeE00cW5NeW5HUm5mRG1VT3M2Z2U0K3BXMjRSbXByaEpCdG81?=
 =?utf-8?B?UU1PUW9WS1pTY2V0YWRqVFd4bGl1eHkvd2lJSnBrQnkvcHd3UGRuQjNYQjhO?=
 =?utf-8?B?UlZMTnFjaWpNbEF0ZGM0QW1iY3BURmllMjFndG1ScFNSR3FVTUd0S202MDlj?=
 =?utf-8?B?dVVZMWtoamNqMDhMeW0ybnVjVFpZS1hieWtmSFRwNWIrWVJkVWtxVlhweFI1?=
 =?utf-8?B?N1pNdnRDeW1XWG12bGFYU0FwYk9MV2kvVGZFMy9MRy9PWXlUd1Z3bUxzWktG?=
 =?utf-8?B?U0J4RldCVzIzTm9aaGFtUkZFRDRkOW9ZZG41L21uclJKOStzdDJRd21UY09F?=
 =?utf-8?B?ZWdwaVVzbXMyeXZ3Mi9yOVhEZ1FuQ0p0RmMxRC9qZFR2T2o3MG52WmE2cmpo?=
 =?utf-8?B?THhiVGkyWGpVejhKN0RuY2pqOW1VZERPaVdpMFc5M1pvTVl3MFRoNXlXT05h?=
 =?utf-8?B?VUxra0hCRGhjS3dCSDdHREdhb2d1SklZMGNsTTI1OUVSZ3pGNlZ5cWJBUEJR?=
 =?utf-8?B?clZqbnZNdzFueklnNlRSNEVjWU9ueUx2MExFdW5pTy9DRGozRWczL1RjOHlh?=
 =?utf-8?B?dklRNzh3VTVPR0pTbjVoSU5TZ1E1WGNLTFZqZmw0a1p3SnRBMGFYQ3BhdlZs?=
 =?utf-8?B?TmdOeUF2ZGcydWk2VjQzNHJ6bW5vTWJoYThxWFNPQlB3RWxvS3NyRkpYZGNS?=
 =?utf-8?B?QnpaMS9jS0tsellJY09yM0NvdXVXdTZvdGdnbDg4YlJjVUlYb0ZHaXVtYkpT?=
 =?utf-8?B?clBQbnZvaGlHRERuUURxMXA0Nk90WVdlajRuMjNaRkNObTNxelpZSGtOQ1Uz?=
 =?utf-8?B?bHcvUEpDa0drbWp3QWpsYUFhbld4dWQ3Z0FYeVVHSXg4c1Z6alorQk5kb1p0?=
 =?utf-8?B?OWdrNnNpM0NjeUE1bVNWN3QvcVdjNHJzTmRVT1VqdEg3eTBSdml3Z3A4NVNS?=
 =?utf-8?B?TWNMQllZVlBnN0ZSZVpDT1FGdUd4Mmw0M1pnNDJIWVIrWldoNG15a2hmbDFY?=
 =?utf-8?B?dHVENW5xNUlwb0NJNm5CaERwSmJXdzVoNGZPZTJlY1VHQTB5dWYvbk83M05J?=
 =?utf-8?B?L2VaOFc5MjQrZVpDZ2ZsckNiVmNFSUZqa0dua0NCWDI4SStUalpVRVV0SFRw?=
 =?utf-8?B?L05aeXZCNjFkWW5oWjBidFY3c2x1ZnNDdUM3Z1JiMm1IZDNQdEtrK08wMEt4?=
 =?utf-8?B?QWNpVTFoMHBSQ1g3M2dINXo1TXVuOGxPZTljdTNYTkJrMk12VmJHU2V3M3k4?=
 =?utf-8?B?MHR3bnFhdnNqMFRObWNHcExDWTRDODZpdDhlclZBeXhtNityVUxNWjRVdm5U?=
 =?utf-8?B?K1k4dFM5M0FDbi9ydnFWWGswaDNCNGdjOE5IbHd0a2Q4VWc4aXBXSGg0K3R3?=
 =?utf-8?B?UkZTY2ZDQXpFT0cwdzUrR25tc3g4cWhML3BiN2trSHdaUFY1NVgwaThmek1y?=
 =?utf-8?B?NVZaMm9oK2JMMmN2RGxPQkxQYU9GeUhSelRWeXN5dlJGTW5aTDQyZjQ1RFBz?=
 =?utf-8?B?VkdoVzZCWHlOUHpYOUQ0Z21mcWZhcG9Bb2JJaTEzK0o4L3cvSUNhMW9wanlv?=
 =?utf-8?B?a3dVMDA2U2E0am5qbGF5THpRTlBpY1R5ak9sSWpucE5NZW5GWWNuK2JqRkhN?=
 =?utf-8?B?UTY4WUR4UXRwZ1JmTGpKYy9INVhGTy85dDRYMG5STjJpaVBmUVVpRUs5TVRy?=
 =?utf-8?B?VWFHUVhoS1gzbnBycHVrTzNjelpwVGRUUm9TZnptQXkreDNtenFPK2lBYmtO?=
 =?utf-8?B?N01tbm9BSWN6eXNqcU14K3NiYVZpYWZvNEp5aGVYZ0tkZlJ2a0hJMUlBNDZi?=
 =?utf-8?B?aDB0RzdOUXBCOHc4REl0OTB1bkxTRGJzWmFzY00vdUFjdHhWS0xnRHJzMC81?=
 =?utf-8?Q?lAbG+WLy/8MTU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWlwWW4wSW5OYnJYUXNKSkZBSEZkS0kwcURRN3NGRXJBNC9aZVVlSlRmQW8y?=
 =?utf-8?B?a2U3U3hrZ3VBTjB3NzFCalBEcFdjaHNVWjZBY0JMOFlVRCtCWHJLT04wOHRu?=
 =?utf-8?B?YldHcEdBRDlVUGdOWURvenEvaFV4cm1reU9HVW96OEZtVTFwZkdxV0tNZDJz?=
 =?utf-8?B?RDgzbzRERW0zWU4rTnU3b1pZdDJCRC8xRTJidjdTMGVKYXhDcEJ4aGNhZVZy?=
 =?utf-8?B?U0lMRXNTdUV5QkZZZ3MyektteUsrdmlBZUlmWWc1c1M4ZXZ1ZUgrdVg4MmRy?=
 =?utf-8?B?OUtLRTZQd3VZRVVDREtIdXl3UXBCeEsyV0FTZjhwVXB5aDgva0VnRFAvMnUv?=
 =?utf-8?B?cCtlUEkwZjdhcE5FUlZNMlRkRGZSUkNwM1J0aTE3SHFqL2x6SVd0S3RKOERm?=
 =?utf-8?B?OVZMQjB2dGlQeGp3c2pwcUNhaXNacVllNHluR1NOWHk5RFlUK1Y3bkYwZ2Q5?=
 =?utf-8?B?MVpDdjhPQ3l1VDczVVpscXFpZDQ2bkJ6S2QwTThrQlpINEdYczQzSGVhRjRK?=
 =?utf-8?B?Wmp4QXVkbEo3bTJVNjVvemNVSk95d0ZFZnJmeFZ5WFJ4ektkbTF4NnFsdXMy?=
 =?utf-8?B?b3AzNFc4ZnJ1STZQbExlU3hsNlFGby9HUndGdXdPNEliVDdDOE1GRzI4SVg3?=
 =?utf-8?B?MlNnMi85UVJpQllQTVI0WWZ1bTJDOTc1L1d3TVI5bTlFUXI3K0RWL2ErQlBC?=
 =?utf-8?B?TzB3TXFqYXRkWlJUQ0pvQktyNXZzQ01sY242amt5dmx2R1JiQnV6c1ljSUhK?=
 =?utf-8?B?UkJPeEtSekZSSGJFblc2UEUxZGk1ZVkyUktRVjl1UjAzNi9oV25PRlZ0SUJ2?=
 =?utf-8?B?ZE9oUmdJeUNLRWhzTXRjOXJyUStFYW5pamdiNGlRME5mbHlPamFuOWVaMUdO?=
 =?utf-8?B?d2d5aGtqallEcm9NRVUwalNyOHZGaVg5dHNWZGp4clN1U1BrVWFXdlA1N1pR?=
 =?utf-8?B?aHNxaFZIR0wwbnhjaStSMmErdk56TkhGaDk1UjRmNG14Q2ZVcEEzbUdyQUFy?=
 =?utf-8?B?S0Vhc1Ivc25OSDRBc2tlcU84a0ZTeUs2MUFCQlBMbFFFb3I4aFlsbXBoa09C?=
 =?utf-8?B?alY0RjNyenNvY2V3dlJMTjlEeERENlN4dTdER2xFUjQ5RVJFLzZzWUJDTld4?=
 =?utf-8?B?R2ZCZ0t0RWNUcEpZT3BIc3ZGVFRxQngxRStXUFNWbXZxUmE1aUNFV0xYWGdz?=
 =?utf-8?B?KzdiQ2FETWVhdmREYjYyZFNlaHorcC9UYnl5dmVUb0E0c08zMy9UUE9qY2px?=
 =?utf-8?B?QjloSWFFK0ZyTSt0aDBDWHpRWHI0aURYdDhDOHRVMDU4Qk1WWm92VjlPbXVw?=
 =?utf-8?B?NlBzMTVjQmtGU1pqb2xZY01kb0pHU202MzFqaGVzWnh1bDdlWXNnRmt6N2Nn?=
 =?utf-8?B?djhEWkx4M3RPTWlKVnhTMUszM2YrL0cvcWhxd0xROE5xTXlXU3ZtdVlzYTQr?=
 =?utf-8?B?SmtrdmdmVjF5eDZkWi91NXdDd1B1dEd5T3NYRkEvRzNVOFd6dVhVb3JDY2hC?=
 =?utf-8?B?V1NJVHFqOUliWW1LbXFCUU9CQk1IL0tzOVpuVTB3MzdjQXlaZ1h2V2RnWDZK?=
 =?utf-8?B?WlJLNmJPNHBiUjFVaGxzQlNWYk9LaDg3UVlzdEFFMVNsbHRQZlZjK3k1UmNs?=
 =?utf-8?B?Vk9rdjBpZnRKUk9DQWFlTjNIY1FnblVWeDNzMFFOTmsrVThSM1lmZ3BFT1FL?=
 =?utf-8?B?WE9tTnoycTJmVSs1RTcycmNoZnFtTkxsdUFwZFJYMVRnemRYMlp5SlllSGhi?=
 =?utf-8?B?Wi94R0tmNk9nOGRTNHRsenlUNUE3VTNKNVp2MjhYMFQ3Ny9zMXFPaWhpRHFj?=
 =?utf-8?B?ZFg3bUJXNVBVRU9RcUxDcmNyRFJuUVc2Qll1WEltWFpmSm9NNE1JVzF5V1By?=
 =?utf-8?B?SnFnamV2MkFycm5lYjZSbXVuaE1sTnk3WVgzZGpOMWozZHNCNnNWcjNlQm9w?=
 =?utf-8?B?a1ZmOEwremVpV3BMVDBpMHJKdDJaSzRXbDNBajhkSHdUVHpFLzJQSlhDejVa?=
 =?utf-8?B?dTZnMWh1aUh2TFdYTWh0dmJrdkQ5U2xhNHVZOWxOVG9wZUorNzVuWkpBWUhL?=
 =?utf-8?B?NXdwdERsWWFBSXNQVW1hRnVROTZHUFFCcVUzS3ZxK3pPaUMyeHd4YnV2MDlX?=
 =?utf-8?Q?3GIIrZHrnd54uIVGv0T7IQmUW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32cc8ed9-307c-44de-fb0a-08dd80a7717a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:38:01.1423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rslh5HYeOIx88KisWWzF0T/FXxEOX44yE07upYCIceN4dhcADXFYpM/IuRPiac9KmYIeSBUIlpgRpQZIvzmL3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7758
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_005238_073262_508A0FCF 
X-CRM114-Status: GOOD (  17.22  )
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

Hi Nicolas,

On 2025/4/18 20:01, Nicolas Dufresne wrote:
> Hi Ming,
> 
> Le vendredi 18 avril 2025 à 15:08 +0800, ming.qian@oss.nxp.com a écrit :
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> To support decoding motion-jpeg without DHT, driver will try to decode a
>> pattern jpeg before actual jpeg frame by use of linked descriptors
>> (This is called "repeat mode"), then the DHT in the pattern jpeg can be
>> used for decoding the motion-jpeg.
>>
>> But there is some hardware limitation in the repeat mode, that may cause
>> corruption or decoding timeout.
>>
>> Try to make workaround for these limitation in this patchset.
> 
> You should maintain a changelog in your cover letter, this way we know
> what has been fixed. You may be interested with "b4" tool, with "b4
> prep" and "b4 send" the tool will assist you in doing the right thing.
> 
> More details on what is missing:
> 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#respond-to-review-comments
> 
> Meanwhile, just reply to this message with the missing information.
> 
> regards,
> Nicolas

Thanks for the reminder, I'll try b4.
And the missed change log is as below:
v5
- Split the reset pointers when freed to a separate patch

v4:
- Improve commit message

v3:
- Read the slot_status register twice
- Improve commit message
- Split the moving of code into a separate patch

v2:
- Add the Fixes tag

Regards,
Ming
> 
>>
>> Ming Qian (5):
>>    media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
>>    media: imx-jpeg: Reset slot data pointers when free data
>>    media: imx-jpeg: Cleanup after an allocation error
>>    media: imx-jpeg: Change the pattern size to 128x64
>>    media: imx-jpeg: Check decoding is ongoing for motion-jpeg
>>
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |   1 +
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 120 +++++++++++++-----
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |   5 +
>>   3 files changed, 97 insertions(+), 29 deletions(-)

