Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFE9D47CD0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 11:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPvr4EScowsQmnJ9F4XIdMB/KSzLBPyp4C2t6IR/I9s=; b=BBwZFJ694acZheNSlUdUTNMjZl
	XPeuh0NkocNCUCRCfV3jLmn1Vhr/LGwvc9TMhG+/32YEsSlfZ8M4L3IVNzI7ltuIqc29zlXSKPaFy
	nLTDp8OlbWknIHT1wvQlpcmbJI4HznHjKIPIQ0DoA+zxguV319wMPrYz/h6v7x03i5TwinUMOf0dR
	QjL0MJ3o9ZkNgZ9Hg+uOnycVCVjMWnsS/UKkMi0ioFnYm46JK6wDQG3ciAaZFP8q6A3+iLeH+yFUC
	ZSz0ntt+oVdoS3P+un6caTIMw7/to44n/0zv38SISK3k9Td/XXTFVIJIWoqSJNnjh192GaVfAIRn2
	uReOmAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghwA-0000000E2pJ-43gx;
	Fri, 16 Jan 2026 11:24:19 +0000
Received: from mail-westeuropeazon11011039.outbound.protection.outlook.com ([52.101.70.39] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghw7-0000000E2ou-12ij;
	Fri, 16 Jan 2026 11:24:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWSyfkYlINTXVWvyuffqbPlGrzAWNmrMobkpe4GDfsyltU01BwvQDLih09zLKj4lM5inA91RjpiaYDvNw6CYP6nNpVC5ylDYUj/40Op6rJ7/h6kWCO0BgIFTJgYaw6HWEpLNnugmw7GyEqNCBnJezbHmY+HhMtYkhiSfZAEm1a6XpXDugl8zZ1cW1ba9mdATEowwtl3mHBtPlqHAZXUnA7ud6pzg3yaJkrAfQQZRH9u2/SL7AXC3J/PxBF/5G+QJ7c6e2hm36Pr3tnpYw/yp1LRzFAxZjnqMeG5fWW0BxvajgYU0LZt0nreUOO5/xWWGTrIdLL0MCHW1TqeYzNEC3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPvr4EScowsQmnJ9F4XIdMB/KSzLBPyp4C2t6IR/I9s=;
 b=kLAW96hbTk0lfoOfIrZXyuI6hl3Blvaoc4/219CGt1dS2kv6R6ldRA4BwL23WIP7asWG+Zw4S1IN3bCstw+93/NRxUbzS0kHvgIC5qCL0VdCghFFS/w9p2Jszcijg4Q4ZysBLNzr7uTpYwyoAY4F/pA4oqs5HHkFMvqdX9v2WfMnKxSuO8VtBGS6oAKen8Zz1Pwn0GgD2MbFGiph2aKXzM+vERTSRzA1Qo7DezVNx8J+g4G25KwluLGEW7agjga1xsO8SFY/ZmCyjTj5H+xDmsGQQMPcHtEk3dtBc8TsyYiSEA3dJqabDUZ+8MDglEI8yI6J3fn/Ho44a4PDBEk18w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPvr4EScowsQmnJ9F4XIdMB/KSzLBPyp4C2t6IR/I9s=;
 b=EQhyuwBl1Jl6Roxm8x/dO6VJJb57kQghyEHA1V5cHvUzOni+6JDWW82poWJqkp3o+mMIH5hIgmrq9WlNHVVM7KLIr5leekgcyPndbLV1P9McwXFkD+tbyuXAkn9Sfe613IE6nARbiRkeYz/SL2l1twmKjJosx//nrJyWp+SrRkU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB11541.eurprd04.prod.outlook.com (2603:10a6:150:2c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 11:24:06 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 11:24:06 +0000
Message-ID: <458b2789-dfea-47b9-8146-377fcc70cb74@cherry.de>
Date: Fri, 16 Jan 2026 12:24:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: rockchip: Enable HDMI output on
 RK3368-Lion-Haikou
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260114230707.4175162-1-heiko@sntech.de>
 <20260114230707.4175162-4-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260114230707.4175162-4-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0255.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB11541:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ed4ffc-1e93-40bd-77b6-08de54f1c292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzQ2U09mL0xaWXdhcnNzY3dwazV3bWRseUYveStGK3FnTVFDQUkvMkdQaXdo?=
 =?utf-8?B?aHVZVkNRWFdkZ1dCMlBua1Nrd0JhSWp4MHl5L3J6cys5TEpnbHdXLy84clJT?=
 =?utf-8?B?Vnk3U1BNN2JhbnNYUTVyTGNpWjVaZ3k4Q3VsMkdCRFU0bWZYODZZUTc4TThW?=
 =?utf-8?B?NnBzWTIxd2JpWWdGSWtmWVhnLytLYTN2a3ZQWms1bXh3N3MvUWxJUHdraS9s?=
 =?utf-8?B?ZWd0VE8yYThRVWpjcmkvZkU2a08wZFlSUmNNeko1czJIQXVwWEpBWlA4d3Q3?=
 =?utf-8?B?YXlSdXpNckdqcXFMZnNSZTZzdEhId2ZPZWdlYktYNGdhbDFGTG5xaitDMmIr?=
 =?utf-8?B?TWRXT3VsQmdpWWhaQ014RGdmTmNoa2NUOVFOT3pLaExzSWZ6WlVZMXEzYkhF?=
 =?utf-8?B?MUYxR3NWZ2pJWGZ4dWpIWnRQaHlrWHUxSTBBdjgrNG5Ta1BvRlZTbzhXeXdy?=
 =?utf-8?B?WUFMbEdTdEJKYXpJMXc3L0N2dHo4YzZlbVJEQmZPODdXWGlQeWdSYlZIWVg3?=
 =?utf-8?B?TFBNcDdwVGJJQWkvVy91MzVjYXVhbUI5dEcvdWtwRXZDallIenN3eEpLZ3U5?=
 =?utf-8?B?MCtPTUtuZjd4K2VBN2tkUFRMbXR5NE9PMzNqV3dicElxT0Y4MmxoKzFQWnA5?=
 =?utf-8?B?dW84TUljbmpHQXo0aUEwcWx3VkwyVWlRZ05OYU5vTkNRWC81NUs1K0ZTZ01P?=
 =?utf-8?B?bWs0NDNNNEdKZzA2RzVMRGpDdDBSZ0FrZ0Y0a1IwcTc1RTJUNVZOMjdQRkRH?=
 =?utf-8?B?T2grNkNWb3pWTkhmaGpMWnN3Tm5JL0svZjFBUXpLK0FDRVJaUWNtYjcvSXNu?=
 =?utf-8?B?RUZ0TU16YklwdjZjZGxzTk90UkoxVXpYbHpQT2xxVWhwRnBrY2E2cXd2bUFm?=
 =?utf-8?B?ZVpPRCtZTVpzNVlsN0VIOXl6cTF5N1lVV0RLM21xcHlUdUpSL1FhVzZia3M1?=
 =?utf-8?B?b0grbzRzR01VczZtdTZvcG9TaUR1MXNIRDdCVlUrMklhK1ZGVE1rOGZmeDVG?=
 =?utf-8?B?Uk5jTnIwTDhTWG1BNEt6NXpsUWsyY2lUZzRCcmh1Y2xwbmdGYjRkb1BTeWxx?=
 =?utf-8?B?RE8xdUQ0d0dYbEVpUnRudUMvUVRiWlFpd3VrWCs3SkdHVElwdllnV1VJNDVT?=
 =?utf-8?B?UlZ1ZUZLWmJ5aG8rRmk2QVYrM2RYU3lYbFp1RFVsZ0kvVy9mNkEvZHA5M1dj?=
 =?utf-8?B?M0hlTis2YjJsWGFsci9YUnM4aStVNjZ0SFdleTZINXZuTjR0UzZMQ1Z3dTFs?=
 =?utf-8?B?U2dHMTFhQ0kxMGhzZXR1YmljSWZ0SGQ0aUVzZUJYNGY0UFVJTmNXSUNxelFz?=
 =?utf-8?B?bzZtTFFIeXRpSDdKMnBueEVDOWUvcHBWSTMxYjJEMmg2eFVNRTM5R1VUWmNX?=
 =?utf-8?B?bnlCYkpFUVR6MTV0K2RZQnBkaHdFTkhPRXFCc1ZWNmoxTmVuS2dIRTU5UnNs?=
 =?utf-8?B?L1Fjd0hCdWlDTEYydUV1a3NUa0dCaU0welNhcFlldkp0WTE0L2ZDdDVrQWx1?=
 =?utf-8?B?ckxKdzFyMUpEa0VYZTQzSURVWk5WekFHTGgzdDhycXhhSHhuQlZUMGxxc24v?=
 =?utf-8?B?eFk1WmFscEx4UVFiZER3RlBzdkNwSkMzRXE1cEZRT2pJYlJDak5tQTVRa3Q3?=
 =?utf-8?B?NmwyS0NENFNBNitGMDRLZk1zd1RkUWFwcVQ0ckhtV0U0dkVJYUlieGZIaW0z?=
 =?utf-8?B?UFJYK25ocEFVS0xjVytKaHA3Tkp0NDFCRUNDMXpsU2JtUW1BTzZJRUdLNktj?=
 =?utf-8?B?NWEyc0JZd0lqSnNWejJZSDJqSndvRFdvVStYMmc4eUZFdCtPVjVsaUNUZVpr?=
 =?utf-8?B?WXZoZHdLcXY5bEF3R0EvT2NHNDN2OTZBbHZMenpEelhlWGNBREg4VkFIWnQr?=
 =?utf-8?B?SnlORXF5WUNBSnJVdnNmaFNJS0R0ZzA1dlZVcXlVL0daSU8yMnBiMlRNK3hs?=
 =?utf-8?B?b1lrNWk3b0dHaXlyaVBZTWlzR2xmV1ltYWs0ZkwrcHVMcE9EZk9yckp4b2Rm?=
 =?utf-8?B?Y2VWQ0NEck12cjU2OWNFOGo1ZzhQU1R1WmxoM2NRRlI4SnBWbTNrY1pHL2pk?=
 =?utf-8?B?WXowRGhGbUUweVZHUUlDU3JnWk5MalZ6ZlgvdHNiWkZGVkpRUE4yQ0ZrdWdM?=
 =?utf-8?Q?MjTI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWpDdEdwcDJnYmRXcWtOUUN2akc0QTV0ODJta1hJL0hhTDNIRUs5ZGFSWTMr?=
 =?utf-8?B?OGZrVHVYbDB3ZDA4ZE5qUzhlNFp5MEgvMW43b04wa01aeEU1U01ibTNrczdU?=
 =?utf-8?B?RHZLcmNuWlRFNmI3Lzd0NW96K3pFbkVCUVduZ2R4TUVmdzB1cUtPUWY5cGQy?=
 =?utf-8?B?RUZ3c3RBQU05L3YvUUJTVStrbWJncmdGejhWMnUxQ1JkSlc0bmFmV3k4WnlV?=
 =?utf-8?B?amFnYytXR0tNeUE3eG1DbTlzZFNybHZRL3RnZ1F4a0djYnhXRW1Bemh6WEsr?=
 =?utf-8?B?V0UwcDhXRUtKQlIyVXI4Ylg5VG0wTW5TYjhXQUhwK1loQTl1ZkFvd3RqNVE3?=
 =?utf-8?B?MUVSUGZMaTk3aGZrZ0J5STlVK2hyYktSL0gwWnlxMkdxY1ZBZjJaaGFrMGRE?=
 =?utf-8?B?ZG8rUlhFTUZxc1ZLZFA5RkVUZk5qOGV4K1ZET1VWOXRTdDJ0QkJlQXpaalVv?=
 =?utf-8?B?aHlZOHVIVzBBellyY0JsRG9ISDhjaUJGSzhKQ2RoOUhvM3RWVFkzZ0lUVktm?=
 =?utf-8?B?Yi80UElwV2NBWCtxZFZydWRDaHplWTIyR1FaL1lZRG5SOUFWVU42dFhqY3V0?=
 =?utf-8?B?MllrUWpjN09KUDVPc3VyN21IT3ByRzFoTnVsWlZvZTVYMXB3UVhabEtJd0Yr?=
 =?utf-8?B?b3JvVFFRbVJXc0V6S1VGQndReEtEb1J5M2l3Nml6MWFMSThYRFJNQm9sdHJk?=
 =?utf-8?B?SEYzaTkrc0ZPNDI3VGloL2l6ZjlJU2FSSklpZTBNRHdIUlI3ckVzRnh5eDJt?=
 =?utf-8?B?L1YzQzRFUWdOU0Q4ZjZydHZNMjFWZWlLRnRUZXladjl3eTIxQXkxdWp1cXFB?=
 =?utf-8?B?ZThmZHdtNDhEL0JmNkxTR1JxWnhmN1d1NjYyUnJFOWZ0RFlsWEJsd25zb1Bu?=
 =?utf-8?B?RllsdTdUVno1TTVpMWVpNjZNaFFzNnRueHZobTdmaitNaUhPRnQzSlBvOGxU?=
 =?utf-8?B?U3NoWGFSci9SaUdsQ0tpM05TTm1mRG84TzR2QXRLa1RqMU1haDdIenpjUkk0?=
 =?utf-8?B?Rncrb001Y2hnMVJwYzdZcXIwNmtvdXZDMjZ4dHU5SHJvb1lHTk45WWpYem0w?=
 =?utf-8?B?SFliYWJPYlIySDFKL0dub0ZVZGpRdEhBcDVmMm10aDlXNlQ0S2V3SVhPUkF1?=
 =?utf-8?B?MzJuMzR6OU92Z1Y0cGpHalVhUHI4RUl0ZXFkeHdCazZXaTVuNVlxZ002ZlRI?=
 =?utf-8?B?YU54MWtPRDdhWVdQeG15SW5rWUsxS3FlbWloSnovbko4cU9hMkpqa3RhMzMy?=
 =?utf-8?B?cHZnV3BXWVdpTnF0TW8xZ2pWVXBiMUE3QjNqOVQ5MjF1eFlnN2d0b2FzSjZ2?=
 =?utf-8?B?TUZUSUplV0N2dXpzTW9sRDhmNnYzVGRsWVJpdzFSbnNwRkNXTTZVa3FiOUNV?=
 =?utf-8?B?ZFpWaCtIR1lZdnVKUGcrdWhZOTlGUDE3ZW5jZCsyQkNsM1JHNVVuTWx5Q1ht?=
 =?utf-8?B?RmFEWTFqUzFIZzRTNEJRTWg2bGgvejI0M2ZveDFRSTd6bVJjNzNVOE5LZE5x?=
 =?utf-8?B?dVNFTWVTa2RsRTBBd0xoLyt0ejdwNDB1TW5scHE5QWsvTW0rdTlWeENnNXpT?=
 =?utf-8?B?RTlmTklaZnFHeitUMGRkdVk4L3REb1pERHZ5V2JsRTBCQnJySUZ3UGJobURi?=
 =?utf-8?B?ckVVNnBFeERaMU1teHNNQWc0a2xkTDd5NnRwWjR1dWdYMVJBZElqYVE3dGU4?=
 =?utf-8?B?SXB1czBZMEhTaXlJWlBPRVJwem9PUW9SbElaMkF6RGVCNlRkemZLNlplOHZO?=
 =?utf-8?B?QjJiU1Z5STdCMEFsZkdPSnJwZHUwMlhES2U1bHhjWlFpVHJVbGRRTVMyMlB5?=
 =?utf-8?B?akJpR09oUFNiQThscWhkaGZnS3JFaUY1aHp4bVlvWjlaSzJGMGJ5V2dqZjla?=
 =?utf-8?B?N2wyaHFMalpSc3ZIQzNvZTduV3Q1TW1DV0QvMTFEYW9VYXlONlNxd0lDVWFP?=
 =?utf-8?B?R0lMS0ZYdFFQc2xKZUkyaVlMMDdicGdkdTBpTDFYYVZiQ01MZmxIQitnbWRO?=
 =?utf-8?B?MXdzRDZEY04wM0kzcjdHR1A2VXcra0lLR2dBQ0p3ZFkyMGM1bnQxSmFXUDhk?=
 =?utf-8?B?VzVLVTFadVNpd3FCL2R4WFpyY3YrajU0NXhZZGxpUTdGMytlSms3cGZzdjNh?=
 =?utf-8?B?VlZUMDM4MFJDSGtjZVo0UGNuRmxseDdHZTBGTTlKOTVsMjlHUGhOSzhkeTVW?=
 =?utf-8?B?OXdaRGVnUXd0UmZZNlpHdnVMUmkxN2JLQmVEV043TlM2UXhmWFdoajlqZ0pV?=
 =?utf-8?B?R0pINWNHZjZncVJib0VNUGZJQW5zNXlqOWxOMEErYmJKSWJJelJYU09hbVlz?=
 =?utf-8?B?TFVVUXg3aDBWR0VaWnc1ZjJsVEw4TVB4d09qdDdGd3piSmZLMzJvZVRWQzRs?=
 =?utf-8?Q?s2PsxmPeSBE6OauypPJfxAPA2jgBCJz/zrEoZ?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ed4ffc-1e93-40bd-77b6-08de54f1c292
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:24:06.2828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJMSKVv6O13DN5f71s/8tIZlUaoaCrAyCPi8NRlTXHDKlsLLKj2z9sk2ORjFn8rOu1Gh5MgN/MiIvjl4Ox2EnkTTwF85G1bmyfkkYA4lnEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11541
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_032415_337419_B7262746 
X-CRM114-Status: UNSURE (   7.31  )
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

Hi Heiko,

On 1/15/26 12:07 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Enable the VOP and HDMI controller on the Lion-Haikou board.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

