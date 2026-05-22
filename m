Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31277CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 08:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A019YsqYIRBvLB6qKLUsTl7stM2MuaSCluooZp3kh/s=; b=aJnxRr3VTxK6hctgpzWBslgKOH
	SD/qz6UubIgLsHQN1q2W2U8WY26TydY87YnJnHjiXoTKXhT7FgyDEgML5sFNpwAJV+lSKZ3ahmWe1
	msaFBKAbbPRNzxLMU3Ik2Lv1clRupwZ4dJvHYkYi1H0U31HTH17kknbdeXk/Up3nqx5ECUW4hNMkq
	JbdPfgUi6ha1Bbnt/zvo1JuivuBlCiFPMGsSZMBwpE6tmhwnfE8VqttsqkcMdZQ4hvqnqBvJQ5xfk
	k1Puz3kbuYB/BZOtxhUwraYyGsqbwiIdzLu+0HaoWA0CbXl6F31adhnxEiShyu1M/QqGvAUx/LQhB
	+DbPMnnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQL1X-0000000AAbG-34gU;
	Fri, 22 May 2026 08:14:27 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQL1V-0000000AAaX-39no;
	Fri, 22 May 2026 08:14:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLTFsE2F9KKke29z6wD2x9yFzXANeTgqtpx4cg8tqDdifnpqe+pLriq+XEoczJLZwbFBLHdmEOUtLkhyVcv+hgoEVGHC0jgP4s8Bbvpc1PBhUKvvUjP4Icv/LWYunuTveCH19rPnqOMRbbqwczlNFKDarFXfjUp+NjX1YLN6mXvAH1EE6Az9/C5ndr4sjqKoVWxeS1qgZtVmc7MCEuvjSDURd+JFYi4b1w88hX0lDvYRHof41olulBmaM2gKSMPZWjGuxQlUGxIOcIdxYRtPiH+0Mf4YTYci7T0PEcqVc37MwO5GCxhG149phJEtIdeLk38/lI/kcMgRNi72LcIVYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A019YsqYIRBvLB6qKLUsTl7stM2MuaSCluooZp3kh/s=;
 b=h4uWEqTj3HC9zP5iLfM+7yAmNeXIAZAEWSpps+yIzseOsPj2sb8KhjGAn9Wc8gve6HfrQiX0pGhs6/2MkQnozl/6Llt4qB13J2wfdbImxH/MMUNIPzvb/EDbVXq357ME2Z8UDI9uLqaa316VUoCcHCOJtHAmthU+r4mq7xZV8OCdAS10C21UWQJaWgLyQ+HBkET4lMf7k4Z+6gpWGDFaOjVMyBPM/W5gTnXg37vsGCv7out8LS4p17xptYWXSP9XpZ2FrXz1nuORnPn9g/XX1YNh2DOMLy2OaUX3csHGRCqSQuHdg7paT1trlV2EFeh7+8WQ2Oy2SEPlLFNS5nu1+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A019YsqYIRBvLB6qKLUsTl7stM2MuaSCluooZp3kh/s=;
 b=nTRzlMRylMUo+sCtdrHwVJZvFzuzfC8ZF0r+53ZA4HoAb5Ra1p7sSGv3pwkiL4THIIEeAGESgqMYmR7EjCPbplBgInvrjs7MQKkDCVvzEs12RTArO3kDbA0oL5LeGnJSX2GC5aPE2Fq8XhwgF9/TznDzemDzLCshTBLbo0cKhIQvqddAtttM9iBFnN/lgi7h8CcxbXVpHGaw5SjMJKKyoH+V8CSgQMcwyBEPw9bHZ3BdW3l36NyOYFecCKJ/07F2NzZw02MQvXQfifn1n5BF6FChaMmFFMqtvJi2kZmasmG74/ixP0OTKxNwsWAx1VT7e6u4ms0CCA9XgJK6L1P/DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEZPR03MB7540.apcprd03.prod.outlook.com (2603:1096:101:12b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 22 May
 2026 08:14:04 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0071.005; Fri, 22 May 2026
 08:14:04 +0000
Message-ID: <9c161508-5ba1-4988-b046-aa9ab668a080@amlogic.com>
Date: Fri, 22 May 2026 16:14:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] dt-bindings: clock: Add Amlogic A9 AO clock
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-4-41cb4071b7c9@amlogic.com>
 <20260515-resourceful-diligent-hound-b666e5@quoll>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260515-resourceful-diligent-hound-b666e5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0164.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::8) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEZPR03MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e76b5f-09c8-49cb-45a7-08deb7da1667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|11063799006|22082099003|56012099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: XTjcWCSLVoNOgVHcxDhueSaPIRr+XyzIs7q9Rlw6MM2+H3q2LzbMWhqtmsSCQoUI3qnCJXZjbcVZLPHBhkAtYCfjOkmHc4zT1MTDBtut6pEHLd36Otv1VuF0seZp4bG0AzWZrI65tz+uQiGYuXx1xhSnCdYpWMoPtzETKnqDmilQEDlp/EFERM42oj03GmwqzBByTM6Y01qoWGbeHs2U86285ovpQ7fqCIL5a8uI0eL1/q1+AVgL4V/YjumxZH2wMtZBVSr3P1jx2W4aL+3RWIDJHt6G9ULzKisiyMT9dwlWCyyd/40cnNMHRG3JYjIR5Q9Ccq+34OmPCh3QrU5GXBTPUyZqG35L6CdQVFYjsJ2SLabCttDtreh6x1xBnFsUWi+C5f4iBLuBH1WRbnQjciNgtfi0AAyhcyCLb67lw51Ppy4fF53h7hnc7MT8RVOgLPrZspEvFJR7BLkl2Zgq7LEk1ZJNQHYQ9uyzxu6+/AhzXyhIVsYyCGIi/puHxvq/teCxXQQUu8EjlubzM9toYkbZWmz/QyCn7fMoZUDETIZlgs9S9kjRiXEKFxf7cC9tk8GvWY8GrFexx3MdTsAmPEGrlUJXOo8ycq6jp7B7dIXOd4ePfAOc49JHaaEffdySAtfy7z13csm75GFA1nkofoCUsouTewXmeuO6LBqS2ww2Q4aMUZzzkozEqMx23Ps9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(11063799006)(22082099003)(56012099003)(18002099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmRaV0hRZVBRQnBXblM5bEF4OWh0QUZSS1FBZU9kcCtYbnZCY0h3bU1jcjFT?=
 =?utf-8?B?L3FqVWlWeEw0Uk5RbkdlakE2aXZCeFdUek56M1dWYzE1eXFJWmtmZCs5ZkMr?=
 =?utf-8?B?NmhydDZLMU5ta0hVWGRiL0RHL3FpQmV1bmc5Zi9qalhkL0hjMjRHd2lCeExw?=
 =?utf-8?B?bzVBaXJDRUJtNGtxYzFLUElqeFdEdlJvelRCdWRPdUJOZk5VSi83eURITEdw?=
 =?utf-8?B?NkxIcDVkaE5pT2l4U2NQTXVLV2FSa2h5WlFXeDFmUkFPNzFWYmhkQjZUSE5J?=
 =?utf-8?B?aVlrY0NEdHZSZnhDN1hjS2gzWnJ4QVJGWCthUXEyUTltY0w3ZC9sS3RSTSs5?=
 =?utf-8?B?QVJ0WjBGbkhWV0RTbnhiUzBmT1hocjhyVUdzdTV5UEkxc2VYVll2Ykh2SzIy?=
 =?utf-8?B?U0k0d29Zb1dZMGZpK094b2VoZkFoL2xLb0I0QzVxZDhDWitEQ3BlK3VqdDJ0?=
 =?utf-8?B?Tmo5WnlOS091SVBhOEJuZm45M0tGcDJsWGFqL3VOU2JleUEvWWlpeTJZajhY?=
 =?utf-8?B?S3ppamRtbGE4bGN2RGd4ZldiMGVrMzJHVHMvVzJ1L3R0aE9CeFZJaHVUT1Jv?=
 =?utf-8?B?aXBES0dBTzdYV1NaQ200TjhtZ20xNXBRN0Nidm5KWUFmb3FBYk53OC9QNFV6?=
 =?utf-8?B?clh0a056UFlhMCtQQ0w0OEs2NnVYZ1MxS0dzdDN3RmJmeE8xWElzVnNkck5Q?=
 =?utf-8?B?aEVrbzFXeDFXTVZiSExhRzBUYUwrcjZhTmxwS3l3R3hKcnJKb0RlZ0oxMTY2?=
 =?utf-8?B?T1ZwWUxuWHQwVkVRZ2dTY2xHdlh1UnpETWpCS2ZIS05GNGp0Q2c3Wm8ycURW?=
 =?utf-8?B?R0Y4SUVHOTc1bWZEbXU5SVFDYXU4dCtmeXVBOTBBNXA5V1JJdS9yVi90d29n?=
 =?utf-8?B?Uyt5bW9RM3VhR1IyV3Y2d1RNUmJDNUFKRUhXUlp2R2granBtTmJSRk1VRUJJ?=
 =?utf-8?B?eklXS3hXdkhEYW81YVlSV0J2eUljRTNuTk1xVmxTZ2lTZVBJdXp4cm5oTkpx?=
 =?utf-8?B?bHhadWpyZEpjTlZocngvYlJBL0tFTDFKSHVpV3JVT2R6UkwvK2FFTjBkdS9i?=
 =?utf-8?B?OEYxK1ZHdHZRbElMeGZzR0JGWW9UUjFsMENPYnBTa24yb3FndU1OTGNRNVlM?=
 =?utf-8?B?RDZ1dDV0R0I4RnVRS1U5V1AxQnZPSytrTUUrbzRhaXlJWFVyajhSQ2VxM2VR?=
 =?utf-8?B?eEpya2MwbEZnVTRnMXM0VUs3UHdsLzVIK1JNTkRGT2VmMmJ1ZlhDQi9Oek1J?=
 =?utf-8?B?UjlBd0VvUlQzbXE0ZHBuVm9tbkRLVkV6Q3U2YjgxSzlrbnZBKzFGbTVlbEYx?=
 =?utf-8?B?bEY2dzJiL2dLeHBHUlFjWWF1K0tTRDVGanBnTGlPT0RnTlFiOWtHeGRET3Bp?=
 =?utf-8?B?a1hPamNKMXBDcldKREQ1T0NkUk91dW55VVNNYlJjKzJBWWVlRUdMcW0rN3BX?=
 =?utf-8?B?cFRnRmJ2OXhxUGdRMmhCU0lCQnAwR0E1VEJmTVZ0N1JnV2VRNGNQU3JrMTR2?=
 =?utf-8?B?anJ0VkV4QnRkVUVzWVd1cGdpNlVjdm1KMkpVdE5OYzFMdjF2bjFINFFFbWNv?=
 =?utf-8?B?NXRxcm5QajhhajFVNXpURXBwS3JwT1I4YnFyMDRyR1lNaWJxcmtVUVBZY2py?=
 =?utf-8?B?RUZOMnl1Nm1UK2RQVjZzMnQ4bUdYZm9OMzFsdWs2czh3WTErOHJwVHpYMk9D?=
 =?utf-8?B?RUFsMUYyNXBOVHIrWDFJVjRtaFVXQ2NSaTY2SmJjSjVIUEs0Vk8yNGtSZ1hh?=
 =?utf-8?B?d3FBR3J2N2FuUWM3djIrVFhYaXJQMUp6N2FJaDJIL0M2WHNKSkc5eDhiMWlm?=
 =?utf-8?B?RmJpeE0vWjJkL2dpekNUbmNrTzNtNmtPMkgxekwrcXpiZUU1eWJ2bzBrQ2wx?=
 =?utf-8?B?UnoyVWpubm9lTWRUQmtEV3BTdlEzZ3hCcTU0M1kvbFordktGSzM2Y3Y1REl3?=
 =?utf-8?B?Q040RWNGNldIa3d6VytVenMyWDRIOVVENWkzOHh1MkhBaDF0aW81V1dWL0Vo?=
 =?utf-8?B?SXRGSHdTM2R4UzlKWWhpTVpMZzZaWm1tU3diZjRJd2loejRCRzN0RWlnRXlU?=
 =?utf-8?B?MlRQZG5DT01hbDlibERrdkx0VTRkUGJJMG93ZndGS3NHaXROeW5BQ2t0TGVD?=
 =?utf-8?B?ZW05emZQOCtLb0kxQmpJWmpRcFNDeU1OV0krQzNiMjVNRjlnZU9VRVFsTnVE?=
 =?utf-8?B?KzI1QjJmbGs4UXRqbTJ1VGVSWTlSd3Y0SS9DYitJMmpmRklHMEtydHo2TEps?=
 =?utf-8?B?V3Y4ZUtOcko4akVMNXRjVFJmWEYwQWlDV0tBa1RuY2JGeVVWWkVISkZlbFQ0?=
 =?utf-8?B?d0VXdTRRZEkxalNzK1RQbFFucTdMVXRZWXp5b3dCR1EvS1gvRmoxQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e76b5f-09c8-49cb-45a7-08deb7da1667
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 08:14:04.1078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTqxxkP17r9ePpotBAo681R7wQ2vpce1zk2SwuoYgifDvECmFxDupjybzir5Ra6XR0cnAn1cXHHwXfrHY+jlJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7540
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_011425_799691_47D086B8 
X-CRM114-Status: UNSURE (   9.92  )
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

On 5/15/2026 4:10 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On Mon, May 11, 2026 at 08:47:26PM +0800, Jian Hu wrote:
>> Add the Always-On clock controller dt-bindings for the Amlogic A9
>> SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   .../bindings/clock/amlogic,a9-aoclkc.yaml          | 76 ++++++++++++++++++++++
>>   include/dt-bindings/clock/amlogic,a9-aoclkc.h      | 76 ++++++++++++++++++++++
>>   2 files changed, 152 insertions(+)
> All comments apply.
>
> Best regards,
> Krzysztof
>

Ok, I will rename aobus to soc.


Best regards,

Jian


