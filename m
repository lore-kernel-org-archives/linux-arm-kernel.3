Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3BBCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8UY0GsDtWxBlCgpSJ71JSf0RrFCT0ClodR5/8pOMiA=; b=3CyGQMeLSVHPp4XCpjnBJLc4cQ
	HBLkffI8mWz3IJG4c7XSuTM7Jh1ZYVwQSc1hRNlz/T7kHhNqlAkV+qVlvpUP+ITRPUaQjjJx6QaoJ
	wmJfHAWlz9rfogqjGmslbVlHlHyZADr3/H9udCgar5v7G4hDZkZ9n20M+3NJeLqmS41RSN4pPIzWK
	T7+ONMaJk3nB84lK2BTP7dsum5CeAV4qFqlBtoJAVooIQmAFgW07vwQQ8+zJPDnUq20NpWrLYenYl
	res/OikuvYntTMitYrRiT3zyHp1hApZxdlVvoCuFQGgrmpFMlJZHDRTS2WgibjBLbVHMECcviUhgO
	SbLEXt/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3HS-0000000B2ZL-0pm7;
	Fri, 26 Jun 2026 09:55:26 +0000
Received: from mail-japanwestazon11022122.outbound.protection.outlook.com ([40.107.75.122] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3HO-0000000B2Yv-3AjB;
	Fri, 26 Jun 2026 09:55:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1cxJjW0xEIqwW6vw5r40Mq9tqnq4O8rV+a29PPG3dWK6206LiGPu5oHfBmxZ1kriB1M9qcTSgcu7xtPSGRefwMTnq6zQOYu6vcAefBxsrUP6lRGJ5Ou4f5wGfYAluirIeVbJ1JWLJiwnjygPbOOm9qJER2hTv+z8mabpw/DlZIAU5ODiGLnUbZlrL4rFekiMFYVTdIJGIj28acfSX1kFqi8tUstx1cMtQw/+TcmypQCyM9IflNUn0vLZ0hIDgmS1urHuciw0gKyd7/1XEb+kfqVohTjbam33ymBfk09hv+p5P/dWf7PBgMh0/ajDNo/G0Vj5JD30uqqfqyJu4hbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8UY0GsDtWxBlCgpSJ71JSf0RrFCT0ClodR5/8pOMiA=;
 b=Q63mQ5JnknRg/Z9LfC8PChRu1JEaZcC3Be2lySjV8qNCn/49L1TYFBzXGMHHGwDpne751l9AEF6r3xaC+V3cdH8tL0vmfA8G9rjYTEsezyMjWjiBRJRz8ijjqASp10XmweYk0CkTJKLXRPKRhh3ZOPIZiZBFmZirFKw9IvgJA50PMhHsoB1xsWj93DxCzOsTlC4/Lr5Zo7tdAtXaizykUtotm+kzoOKFQnWGE9b9DqpbCH64se/U2n7idh0BKfgxAFvBIDrPrUrcM8BDBS+I5uKoMni5HWtFiDxgyWQVNShhUom9C5A9reEUx+81nEQ/OoLqCTFBgMNa4fEOyKgX5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8UY0GsDtWxBlCgpSJ71JSf0RrFCT0ClodR5/8pOMiA=;
 b=aE+CgJp7ajCgnPGme3FA6K133TMq1+ATFLpJqt6HF9G07FiEdurMb//0CFlM3iUwMBA3Yz5L4LHo8dhSF1HCNaIIhPY98Tzi5BMdg5m6PHqeeDXIw0ORVR9ZVcoNJzn6YmReRX9rM9IazVsguFklgvQDsYTElJqfIVX438oOUUirJPOXBCrgMS1yiR4jPPo3LGY76bAN4kag+t58c0b9j4hOjkwCS+7Y//HXYWA4PBjZi+BDstfjGW5hmHzrwkEKRcsoj/VejVdnfgzpTqSwgAzhiCJhQQXWTejNlYldCNLyzMiy1AkrreDs+JFWKHH3A3CWfT68OQBJhEFJYBMQbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by OSNPR03MB9540.apcprd03.prod.outlook.com (2603:1096:604:45b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.6; Fri, 26 Jun
 2026 09:54:59 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0181.005; Fri, 26 Jun 2026
 09:54:59 +0000
Message-ID: <89450adb-f8d4-40dd-b895-72a53662b298@amlogic.com>
Date: Fri, 26 Jun 2026 17:54:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] soc: amlogic: clk-measure: add A1 and T7 support
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0116.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::10) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|OSNPR03MB9540:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d8e6129-8bcb-4092-bdac-08ded368fbbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ddg5Fims6lM3bbZGipuNCuIHXmobiiJRZNhxCZvLDtOfEOecmuz0meGNkKqzITrJC0JYD5t3jQyr+t/JnfjU1xIHnsxQe0n3THiC7t3pJA64klo5J6e9ygDRAY+NpaWmn4PGZiwapP/gQAxSlRSrURfnXr6i67S6ryA6859G0rgyq5XjsXCaG0/p/C16O1TL95ppd1gah/ujj90dVsJFUWpoy0dBw0txmUzJ4vwHRITLjHQPASI7nSnLwlJgpyVnfTBSTmAmEb8xd6+2fMZuEKt2aaR9uM+uoxNuS+b0340esN/J8QHNUIQC1Wxa8mczbuzV34y65DjwuFbuFlWnHnPJb0sm1/PRLHND+kmt4MO+fQzuspy3k3+hosCnBlLnGYaluPgzYUSH/NvxyG1do3Z/JZAU70/wReN04wVGtzEsjshwfukgcY2ozVWP8d5Y1+RuWFhxUnU4akNE/C17bV8flHIQoUyo6ZCCn+YJlWys0Lx+POydvoO4l3boaHdsdah3s8jWxdo5rrlsi8cjORyEjCukSWLDLkMW5sYbZn2wGAv1pf55SYf75WJ64P0xxiqHDn1jDZ77eJBExUUJ5ERxoefPxLK00D2iE55AcGe36yhMHcDSKtVkZLlWvJ3PFFO66pBeJIyPouxh85/wLsE1f0vXX9kv7vMNK71PLKc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWVnZDVPY3lra1FhYUxteHVwZndoZVBLUjdVNFFObWVTenJYWTV0RjFHTVNW?=
 =?utf-8?B?Z0E0NGVxa3Rvc1BlUHQ1NzFGUGRBNXFtSEVlVVdGTHhiZ3d5Nis1azlzT3dI?=
 =?utf-8?B?RURrOUN1U0pNRW0vL01EZEdwdW53dnFUVmNSUXgvbE8wN3RFWWtSRFF4RHZZ?=
 =?utf-8?B?emdyZ3E3VW5XaTI3dStMZGhFYVEyRVBUa0l1a0FXZi9GOVpaRUd4ODBjaVhK?=
 =?utf-8?B?bkdieFdvVTQreWJ0TG5SamcxOHYzTUw5aFgyU0xwaHdxTlZTMFl0WEZoYmpr?=
 =?utf-8?B?NXhTRWRyTVRWY3lpa0JnY3hKcW1xbFRUcWYvWkorU1p1SmVuQ2FHNXpxUTlS?=
 =?utf-8?B?STRCWTZqeVFXU2llQkRKRkN0SWFOdmd3SVhuZnVDOGpRMWRJaXIrR0QrSUpu?=
 =?utf-8?B?UTVCZkxSTmh3c1I4MUhkbzdvRXRKOFdrcDBLWDhKSkFwb1JEUThEcGlBQk9i?=
 =?utf-8?B?YzNTUnlDR1c3V0QxaUM5cXVFWXVqRDdCc0JFb2pXb2tVenZXZWV4NXJUdC9L?=
 =?utf-8?B?aW94V2VBWGk1S1FlRGpWeTgrb3pMQUY0emg1RzgwZmd4ZzhjbDlIYXJJK1hp?=
 =?utf-8?B?NDAzZnJJUmswRE4xd2phQ2RvQU45RTNTMnJSWXNNMndGeHdyV0dFN1NtZE5U?=
 =?utf-8?B?ZDV3ekp0MklwZmxSNzRiTFhnaUovc2xNK1NiN21XczM4RjZIbFNDQzYydEI0?=
 =?utf-8?B?c3UvbnhYY2Q3V0xIUit5ZElsNElZOEFJUWVFMDE5ZnBQdEJsMEFMMVJRanl2?=
 =?utf-8?B?RlVna0ozOS96dGdTQmk3WUg5cHBhVjVNQVlKUm16M0Rkd3JsQ3VCM0dQKzVr?=
 =?utf-8?B?b0pNN0h3UUpqc0J2RU40MGdNZTNzaGh5THJZdFVRTUc4THZDSjBnOCs5aFph?=
 =?utf-8?B?SisxWUdyem9IaUtlc1EwNGk2YkxrK0dJbi9VVkdxclZZL3BEaVdwUGhNTVNG?=
 =?utf-8?B?cU9XaFo0K2owS1dDTmptUnRCV3RsalAvZ1hDL25adWNUODh5Z055dkZkandr?=
 =?utf-8?B?N1orQktoREt3Um1OTGZNT3B4elJCSDMrZy9BS1lVMlgyUTYvUE1IcDJHeXA1?=
 =?utf-8?B?OUtiOG5peUgzUEJSRmxrRSsxWURxSnkyTWNoNjViSnFwMmloZTMxeXRyYk5P?=
 =?utf-8?B?aWxKQVkrYnczT2crNnhCRkhUcGY0U0JQb00wSzBlT0NROHBacjYyNGE5ZkFu?=
 =?utf-8?B?NkNaYnAweDMxSTlKdmFmS3NFOXJhZW5WN1lxaHh1b3lyTHZPOEFhNXlKeWNY?=
 =?utf-8?B?MzRDZ29HY2VRTm03K3JhMmNuZ1J0cXMzY1pSbHdicjkvQXgvRVpDOGFGWFFy?=
 =?utf-8?B?bGFLMUswN1FsNU93YzZ2ZDA0NEdjKzBEK0VJZ1FGVjF6a2ppV3FQRWVDWjUv?=
 =?utf-8?B?Y3RYKzRGczFmMVhIa1JEQVUxNlhjdEhUR2Evc25Db1MzNDZabk10bFNicldO?=
 =?utf-8?B?cG1TampJR0d0NnpDaTVKUzZ3bStzSWRhcncwL3BvVTE1RGUyNFpKKytxYVpa?=
 =?utf-8?B?aS9tMEJMQ2ZlendDVVVGWjQyblV1VXRZRjlyd0xYcDE0R2RzallLNEVuV3RG?=
 =?utf-8?B?YnhoekxDRmFpc3hsNlphNy8xOStGeUo5SUZaT3FDekptZ1hMKzg4RnJiVkp4?=
 =?utf-8?B?OWpJbUZ6SzhXMVBaVzNTMURDeXNsa0pOTHVCVU80U2tBdWlVWTBGNXhoTkEz?=
 =?utf-8?B?eU5jamFXSnFiTlNSK3dPbUJBZUVPdTdsQnQyN2grTGFQbnUwWjh1eDVqSkIr?=
 =?utf-8?B?YUpDbkc2dHYwS2JjRm42VDhXNFZTbFZScXN1aEdXOWxCdm1WbGh6aTZxcFpB?=
 =?utf-8?B?ekZTdE16d2tTMVFYcGJXN3pZL2hDY3I1T25SSGRzK1NyeDVBQU5oajJMOUpa?=
 =?utf-8?B?U01hTkZ3N1AycTFSNUtrb0ZXSitvT3I3UEREOXBMY1J4UDBvUGVxYytkNnBP?=
 =?utf-8?B?dHp2dCt4UXh5YVRaaXd0cUZXM0JraHVkaVFoOVBuRk1YeDZqQ1lUMXBUVVc3?=
 =?utf-8?B?SEIydUxjaElkYUxPMHNyOWVrZnFxNFpUdm5veXovQ1JDTi9FVGtaQ2l6bzVL?=
 =?utf-8?B?Qk1NYy9pbmZUbnZXVTZiUmpjeHJVSW5vOUdDWXpXYU54bXZCK28vTVhEYUxU?=
 =?utf-8?B?Z3dGWEhvSWkrYW5iazY1UXg0S004NVVOY3JKbHF1TE5nNElSNW9QZHlMU1ZY?=
 =?utf-8?B?YVlNMnpzWTl2RVlrVEh4VmNXWVUzQ3dvR1NMbVZhWGZqSTVkRHRES1VkaVNG?=
 =?utf-8?B?QU80dTgwVFpGaVFWUUdMQ2hqeE1nd1ZIaENHcHpWeXR4Lzk0ZkdXY09YV2ZU?=
 =?utf-8?B?TW5Va2p0ZUxtQ1BKcUk0YlZLSEpCeTNRbFUrVGNBai9ZWHRaSTZOdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8e6129-8bcb-4092-bdac-08ded368fbbc
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 09:54:59.0858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pxo8NfqsmSuODogAppNU/dHeLJXKfLUcQekpndWIComy7ZbkRClWan0+v+x25X/d/4ypXDIGMu6kowwLvD+NWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR03MB9540
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_025522_807251_158D3B3C 
X-CRM114-Status: GOOD (  13.24  )
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

Hi Neil,


On 4/21/2026 4:17 PM, Jian Hu via B4 Relay wrote:
> [ EXTERNAL EMAIL ]
>
> This series adds Amlogic clock measurement support for A1 and T7 SoCs,
> including binding updates, driver additions, and device tree enablement.


Gentle ping. The patches have received review, could you please take
another look when you have time?

>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
> Changes in v3:
> - Place the clock-measure node after pwm_ao_gh node for t7.
> - Link to v2: https://lore.kernel.org/r/20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com
>
> Changes in v2:
> - Add const for a1 and t7 clock measure table.
> - Use b4 to send this series.
> - Link to v1: https://lore.kernel.org/all/20260410100329.3167482-1-jian.hu@amlogic.com
>
> ---
> Jian Hu (4):
>        dt-bindings: soc: amlogic: clk-measure: Add A1 and T7 compatible
>        soc: amlogic: clk-measure: Add A1 and T7 support
>        arm64: dts: meson: a1: Add clk measure support
>        arm64: dts: amlogic: t7: Add clk measure support
>
>   .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |   2 +
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   5 +
>   drivers/soc/amlogic/meson-clk-measure.c            | 272 +++++++++++++++++++++
>   4 files changed, 284 insertions(+)
> ---
> base-commit: 401e5c73eedde8225e87bd11c794b8409248ff41
> change-id: 20260415-clkmsr_a1_t7-9820984d0af1
>
> Best regards,
> --
> Jian Hu <jian.hu@amlogic.com>
>
>

