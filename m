Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87603C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/LQCbvOoVAWp9Q0pfWjKn07UIzYqfWb2erj+/83zyg=; b=LY0UWJ/glAddhg3GZAgxJFZ/4Q
	4zBFWQOnDjb6XzaAeR4qk7jR+MyRlEVpti10Yzz9LzF6BQgJHBovI+LG27mgQJqfjDn4hvPMPKkzW
	wa57t6IIqH0XTpj1GRA93ebUDtUwUtp/XZfzLPwNLGM8DVdUV2BRFhJWG+KcHIgtyI294vMbFqCLw
	svI9Nfc1wBhqXZm1a/1TV0pfWMj7lm34f06+fcrmduQbE2j8k9fQ+Oqr1GzFUCK7xM+5DI6IesiBE
	P/lwHMq7h/6FYTJFkBKEo9wgATGO/yXSeefGaakkRpJVwxK8CD115/8GvY/HvmByh//Q4vtM4ca2o
	OG1UKbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRuh-00000000LCp-3Akc;
	Thu, 13 Aug 2026 09:39:51 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRue-00000000LB7-414v;
	Thu, 13 Aug 2026 09:39:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fc2rCbIjvu1RBTlAUPcNsO/z8BMuxGt55h7QwUxkfqQv7PdArkdY7IZZpf7c66UyLnkpcs7gZsBiPaDm9edB/hq0V9L+UKxotjo4gv7Hzcn8NLNr0A/VKYsiqxaRJyIzPyAyCX2B8iQe3utTmkZLirj0gwpkIVhwk5JJWblAMDzrl7s9X2S5TKJMqpj7oVOVFeMR3nBQtn7pw0Cnzz+E0LJSchWDc1eWLfO4G4UsebhtMnbOyTzDF7KpWlCBLmR99ZyvHetDsftOQAT6XHeBmKQ5xZtOnIDIa29Lg1hvYN3VUxloU1lSyj+JfyV8CMsro7EMLtRHkdoNIT9qQjeetQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/LQCbvOoVAWp9Q0pfWjKn07UIzYqfWb2erj+/83zyg=;
 b=xIPHmtthXFTAHv8wR39qPuok1guGUpN7CbPv3eNzEEO+Ly3UqcwyZk31ZorBpTIotD7aSqbg72W15B7y9Usl4OH6/NndTOVpXkqTR/AO8NH2PNhsPRXPUSF9KL5O17yQwGdHaYRmqzcbfGwrMbETLGitT+xHQH0JwTb2LYKBH6mTShgiye27FNPwL7gT6RJe2Dd3PJk4ofo+pMW/rnMHGVLm0GFi+LOMAEq19Zl4xOPdOEqOsR5jHkf6NkxZfMWjr4PlekhOuA86rTdyAFAI5Gwa77lKvDDansYT+xonmjlFmKeV7yjk9gMMTjbFvD5aAjug+I0ai030uh++Wc01cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/LQCbvOoVAWp9Q0pfWjKn07UIzYqfWb2erj+/83zyg=;
 b=s9zimO/VNPIzm67dRlSmHVeI/aILexxyK0bOHedGLKixOVDW8ZF0m+PpvrTOXMRfVYfRhChV3ksq590mGw9AwBuN0n8hyVN90VLzui7OkkTe0J7S0YWHuTJl2+I5S2Gqpl1S3KskJhMHnS8lwKCWKtcVpTu+38ARsTjsfymNaUCjqHbjq5FfkhTXLC24w14J0Tk79AEssgz3G5KueKOezGx2HfX1uUeYb2YNGq+NAS2/Dvj11nALUDL43x+Usa8yTy7RDaxU/dnzaPsBfeWms6OQt1L5ZIj76Oe7ITexzLvU+N4oQcB2IGSzO+kArAey9YcQibUBtNS3PGJJ5bJVdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SEZPR03MB7702.apcprd03.prod.outlook.com (2603:1096:101:10d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 09:39:28 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 09:39:28 +0000
Message-ID: <3e00b38c-70d2-452d-a71f-7e82d85fb610@amlogic.com>
Date: Thu, 13 Aug 2026 17:39:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
 <20260812-b4-s4-vdec-upstream-v7-3-3fae085861bd@amlogic.com>
 <20260813-rustling-sassy-terrier-11b99d@quoll>
 <80e58bd7-7eb7-4d05-b309-115643767a43@amlogic.com>
 <cb21a4d5-9a8e-4530-90bf-d48e13f79b4b@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <cb21a4d5-9a8e-4530-90bf-d48e13f79b4b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0084.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::8) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SEZPR03MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: bd930ed1-a58a-4379-65f3-08def91ec4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|22082099003|18002099003|56012099006|3023799007|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 8MxGJo8rKeYJDXxLLm6KywEpE0pPoDsIT8D435M4tmPiV3OoP9bouRIL/54/qEdjqD249SKyr3g1D/IbPVS+Y5pNHKPP3GO+gZ9qhhxk4d9/ePEAGJIGf9ooF/mna/Kh710eqZbOn6LY4cdCh+DsoHKrud+7lYnhQbcyOPdsWExt2kqEwBsaIduwicQzjoGLIrFXXYlvUkQaHZ1njxdQ70mfPYpKPLjtIu47xI7sgw+Q6sCNPfTVfIFvsPveEQVh5fD5eHV2K5hZGWO0vIih9961HhUlhlpNB7wBo1hZ6OzNzqTNWmPQ0H4k2N+HH5OpDZabWAlmiv1DNb4pL8fxzXYUSmA+cGMFXKV3ATgOj5J03ZIX+bPS2QY0L5WkRK7n2sBW2+itXbWxx8wkFxXVkoiitBdkxVa1m/qD+lkaVWvKYcxJPReNr0n8RFqgCVPcAW+VthsB8hCFl/alVPceyZ/DrTHtS75KLq94ELY24UcCc15v2/5SV2g6XldIsYQyuHD2xSU0TNZ2msQswY0m2zHYm8T34Q+8+Bz3Bn+DMZA+LkZzDZjK/xp8xoP+Vll56N17BFYlBUs/uXQuYeuntFj6PmEit6+60lqFnnYN+J8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(56012099006)(3023799007)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnpydHZ4NzdyUmcycVJ0Z0piYVY5eDJRbkZadFdDZXBKQWpqVWFwZlc1MzRr?=
 =?utf-8?B?aUlNU0dUM2YwU0NLSmNNMlNSMWVvNmR4enhWaEYrLytDWjhjYStMeEo2aFZG?=
 =?utf-8?B?MzYvdENXeTZ6UmRzcEtGSGhhWnJVQWFjblE3Q1RHbi9NYk9OSFk0N0FISGFu?=
 =?utf-8?B?RzJOYkVadkZHTFI3MGNsaStkL0tNNERBVTdic0crbVF6ZzU1TkhvUERoNlk2?=
 =?utf-8?B?bmo2VHNFYlVucXVHdDJtQmJiT0Q5V2FXSnlHZnZ2aCtqc3RSMXlCSXlLbTRu?=
 =?utf-8?B?Mk45MTJXUWRSUks4MHJhdFZqcGdvTUdNUHA0bHFwUUNlZkZGK1VQaFZrNWNl?=
 =?utf-8?B?ci9nMXdtems3VnRoRUpzQnpjL0J4STF4Z0N4UHJuQWdvRzhjQlV3WSt2WUJC?=
 =?utf-8?B?SmlKQU5GcjdvdmNmbnVsTU1vOWFXeDZDYWtOYVVTRlhKTENpSVhLSFR2YTBv?=
 =?utf-8?B?Ry90VFkwMzRGakN6bkZtT1FPTElySERVaU5YUDIvczMraE51YW4zTWVPajhR?=
 =?utf-8?B?YU5aWjhjM3J2bFlaMmRIVEZkRitaMlg3M0E3NG1icjg5MDVzM3FyakZxUGx5?=
 =?utf-8?B?RlRQZVVSYWNlNTVIQ3ZFb1ZQWjhDYTB6U0JZV3JJK01XR0lGVndxNng2M1JF?=
 =?utf-8?B?cElXTWR2N0xtM1BwSGdRanZLaVRLUHlXb1JHdlhZWVk5Vy9lWTV0MjhNcmNu?=
 =?utf-8?B?VjFyWjVVYTg0NUtHNjFYd0dyZ2J2NmFqL3RJZ21yUjlmOER4N2J3NEttalc0?=
 =?utf-8?B?Q2dDc0pxa0l0M01NUVVEaVFnak0yakxhSytDajNsYXh6QVJPYkFEeTVaTllC?=
 =?utf-8?B?TDY4VVdZZUhoWU9oNnFreC9VQVk5eER5MjJCQ25DcVUwZEVyWGhWKytldXJz?=
 =?utf-8?B?MWJaMnVTd0IzRTA4NEI2bURRVThsWmdhUFVhMmJBR05TYzgyU2lDS2F6RjVH?=
 =?utf-8?B?VjQ3WG5rWlBRdG80L3dYblozeEd4OWR3MDZiRjIremNvdXR1eEExaTFzZ3pH?=
 =?utf-8?B?bnh2THo1NTFRRW1pNWZTdS9ONnFWN3BLam5NOUNucHRHVHFweDMxb25sYkZV?=
 =?utf-8?B?ektzZ3I4RmxLYnR1Vyt4OHIyVkk4N1cyYjBUNFJoMU9TRlRjNGJZM3FjaXlF?=
 =?utf-8?B?bElUejZxZWdES2VZLyt0Lys4K0dFVXZrNE1pK0RtWHNmdjFCSnJ4MHFSTTZO?=
 =?utf-8?B?OWNvNUwxNVNBWVc3N094OW0ydnlkaEk0cXFzbUpSUFhPM2ljMThaamtSdFk4?=
 =?utf-8?B?enhzemdTM2cxeUl6RXRYcU9wbVd4R2FWN3NHdFJ5MG5KOUFpQzd4UkpjQkdZ?=
 =?utf-8?B?YjlEdWV5Q0lDNmhlMHR0VTBxSEp1Z3lQRlljNUkra1o5K0FmK2p2RHlKVE9X?=
 =?utf-8?B?MXR2a1VnRkR3NW5tNVBZWHFSNEJLNlBSMzZERkhDM0Vjby9URGRJRjhzY2Vy?=
 =?utf-8?B?aHl4Y3FpdER6MGhGNUM4S3cwSWRlMkgzMWdvRjM3Tk9mY0UwNFA1MUZYU1lH?=
 =?utf-8?B?SW1LVG4zbjNVK3REOXlUSzBDVERIeGpleHkrVEI2QmFEYThuTWI4N2R1bXVh?=
 =?utf-8?B?UzRlQkxqek45bU9nbmJibDR4WTIxSlZsam1HK0xxOEhva05lcTF1bUR4NUpQ?=
 =?utf-8?B?Mkh2dzZJMmptMFNEU3Q5WGdPeW1odlBnZTlDSlBHTnlzcGdkWGFQVVJSeFRY?=
 =?utf-8?B?NWdBSDBwaU5jdUlQNkN1emUyVzUzcHNPU2NoTUhQY1dvbWlJa0xWRjhVSGtH?=
 =?utf-8?B?WGQzQWdNb1BEazNpb09nUW1nREU0VHo3Z3EvTkRjS1VsdFNVRndQalJBOFRJ?=
 =?utf-8?B?SjNGV2cvdWhSYjNmVUNETnNzN3dWdGQ0YzI4bDRvdlYxK0F6ZitUQ0NuQTZm?=
 =?utf-8?B?QzR3V0hkdFFFNFJab2x1V0pZdTRqL0lqK0luSlR5V2FXNncwelI3SWVsT0tK?=
 =?utf-8?B?SnRtbi9KcC9jNkt5Y3JaeE9RL2dxZWp3MHYvVVdWMXVKMmErbnUyZGRKL3NG?=
 =?utf-8?B?aVgwSHY0QnNSYnkwNFEwaVdJZDBaWjNyYnZ1OGt0dmh2UDVpbDBWa0JWOHcr?=
 =?utf-8?B?bXFGMThyUkt4UXBhNlI3ajhHdnE5S0hoVlhHdGtCK09LMWwxaURrbXd4eHJX?=
 =?utf-8?B?MzVGYU80WHcvblRhS3d2ZFh2TE1vR3ZPdDZ4ZmZScnN4NisvVU5acHBEWHlE?=
 =?utf-8?B?M0pQajVaQ2h0N25mbmhFUkJWS0RWTFNqaDd4alBldTNKcHFCSVQ5OFZLQXpE?=
 =?utf-8?B?dFI1ZmxBUE14ZEJ3UTN3U1A0TXoxNm55QmIxMWQ1aGs2UnBMTHA5ckVqWkJI?=
 =?utf-8?B?dTBUYk5yY3dKM20xYURGd1NBaE1zZmhhYllEVzcyNi83U0VaQ3JTZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd930ed1-a58a-4379-65f3-08def91ec4d5
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 09:39:28.1934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10QPQXtx25XSdnOdYYUodYFLS/bcPdoEvSy33HTEOT+iL2BI5mimVhF4Gh5GkICInBMDLBQS0XGPNXJMjEZ7GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7702
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_023948_999895_F26B1A6C 
X-CRM114-Status: GOOD (  16.89  )
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


在 2026/8/13 17:22, Krzysztof Kozlowski 写道:
> [ EXTERNAL EMAIL ]
>
> On 13/08/2026 10:39, Zhentao Guo wrote:
>> Hi Krzysztof
>>
>>> On Wed, Aug 12, 2026 at 10:41:25AM +0800, Zhentao Guo wrote:
>>>> Describe the initial support for the V4L2 stateless video decoder
>>>> driver used with the Amlogic S4 (S805X2) platform.
>>>>
>>>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>>>> ---
>>>>    .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 111 +++++++++++++++++++++
>>>>    1 file changed, 111 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>>>> new file mode 100644
>>>> index 000000000000..b5af3f931b26
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>>>> @@ -0,0 +1,111 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Amlogic Video Decode Accelerator
>>>> +
>>>> +maintainers:
>>>> +  - Zhentao Guo <zhentao.guo@amlogic.com>
>>>> +
>>>> +description:
>>>> +  The Video Decoder Accelerator present on Amlogic SOCs.
>>>> +  It supports stateless h264 decoding.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: amlogic,s4-vdec
>>>> +
>>>> +  reg:
>>>> +    maxItems: 2
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: dos
>>>> +      - const: dmc
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 2
>>>> +
>>>> +  interrupt-names:
>>>> +    items:
>>>> +      - const: hvdec
>>>> +      - const: vdec
>>> vdec is the name of the module, so not really useful name.
>> Ok, I'll come up with a new name and change it in the next revision.
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 3
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: dos
>>>> +      - const: vdec
>>> Same here
>> OK, but there would be a nit. In file
>> drivers/soc/amlogic/meson-clk-measure.c, This clock source is also named
>> *"vdec"*in|drivers/soc/amlogic/meson-clk-measure.c|, where a
> Source does not matter. You do not describe here the source, but this
> device. How is the input called in this device, not in the source?
Yes, I get what you mean.
>> *"vdec"*clock node is created in debugfs for checking its status. Using
>> a different name in the driver (including DT and binding) would make it
>> inconsistent with the debugfs node naming.
> What inconsistency? How would provider name matter?
This isn't actually a provider name either, it merely defines a debug 
node and names it "vdec". I dose not matter, I'll rename the clock in 
the device.
>
> Best regards,
> Krzysztof

BRs

Zhentao


