Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DF9F3ED79
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 11:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuZ9akBJJiiR4ZCh9/MqoKk9hEqWGojtzjXzQspQEFs=; b=BuBwATC59QKEyqR4qDcgatMAZ1
	/x8z4BWZJJEVvBxXO2/WFcrmZ4Zdfwf4YRFMJa2X68j5Jpmk1iI30ip1Gl3WtaQeayiQIxA3Tb1hf
	uZ0jDS68l83oFYckFp5ejIzyhXtjx/zUc8bcJdPUKON5LDRdeVNXPrXRZc4IG3Px1gjfKmda5bUqx
	7kQKKXT0yhStQQ/E7BIq47cv2ryiO8viVlJBiGkEd8M3iYCKG8TGDNvS5HqYI+puagdD0LvkHXXfr
	5TPrD0l0ai0qsXw/zb7CEV5HSO15htOAzCid1QbH3hfY0NIStWPHSFvp68u3GaPvVlmhftW+Nryjb
	ar2Z2nwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFXt-0000000FZs7-3vWC;
	Mon, 13 Apr 2026 11:33:37 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFXq-0000000FZra-1y90;
	Mon, 13 Apr 2026 11:33:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vof3FW/lZ0NXt+4Kfcuz28w5Jqzi9RxLFVlz+/e6u7O8t8iOJbRgPPTQhF4DxGHh4iLh8b/1LeR0/P5HuRnPMPV26apaUIKluMjx3t0nenBT4wLFehBJsLdzVsQ4/rXQ5USlN6Vrh6zp7699wFHbiMnjAz3G6BlaZn7qUwU1pSGsk/yhaTWte5j50qQ1JO7P+PFyvp25HV8XkT2IfTh6a68GC9rzdxOiQbbZDSKJaMwhBLv4OizdJoZj6guzcgmgzb2hZ8B/DaLy1cl61x/UgKKdKFknqDrB2FYBSyaCq5JwAkfWmK8iHhOiro0YCkdxm8KtXJhoL1fOEUa29go2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuZ9akBJJiiR4ZCh9/MqoKk9hEqWGojtzjXzQspQEFs=;
 b=mfx2+KBV7QwbT+kZoR3H+N1NpXca69cOiNXda/hBvon4aYr7/e58xmpsEh1e4/4pPoxXLrusOd5xNGKOfPWX3wjDrelXJSb5MpXvtMb5VzCvsViS4Um/PRS17M+L10NhcJ3stCzlrd0tesEUCSWzNxosvf/QIScUQlAumaiIlc0oj8LlwHzAw7wYDSR9jcDw9TCtyYxXvHWJM/exgGWzHVBu49N8x0OOQdt+njth/vfxI3VPwkg3hV5gHOzLgLEaOJVdtERgA+ou9oEM0rbWbRn+2204ylzFp192GcEZHVDzMNq0cN/ghi+mv+XaS9StbhJQA93NLR/h7CnTga6SMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuZ9akBJJiiR4ZCh9/MqoKk9hEqWGojtzjXzQspQEFs=;
 b=btUF23o55iCnu48P0r4mXsSTsqCClO6W6jKkxFuYlUxXZ76XiFAJR55Nbr2xlBqUwNub0dPuDDV6uCc+R5DNX83rOTkbSfYoO0vp8YtoLyDQ6OSiSde3lWczkKdCcbJ/AHrPDLxvGyu3BJQziEhjQ+lXj0kSA23a66qcrz9RlpZ2jRPfllOVdrBe2U0O6WGzwnO5dT/nONUx/W6HzK6RcBBBTASSpm4l/u7E0pQj1+mmpirWzHNdzFsKs3Y8VgywiEUO1pQHSRu5jkcbyF8xpkhUmxPzM2MK747dPmeXoOeKi+W68tUiBjFuCXO+jOHjS2NpGDpXhqWFJ13M8Ad2dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEZPR03MB7402.apcprd03.prod.outlook.com (2603:1096:101:12e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 11:33:19 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 11:33:18 +0000
Message-ID: <93dde817-df7c-4492-9a7d-e286762a7c9f@amlogic.com>
Date: Mon, 13 Apr 2026 19:33:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: amlogic: clk-measure: Add A1 and T7 support
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20260410100329.3167482-1-jian.hu@amlogic.com>
 <20260410100329.3167482-3-jian.hu@amlogic.com>
 <9a4f69e7-838a-4992-af1d-46324e14eb48@kernel.org>
 <274d2abd-05b9-4dbd-b962-ff70044b8d07@amlogic.com>
 <b0d81181-d4a4-4c03-8c26-c7f6e8cde70f@kernel.org>
 <3a08bb84-b313-4b3b-bb61-1b686226e902@linaro.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <3a08bb84-b313-4b3b-bb61-1b686226e902@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0080.apcprd02.prod.outlook.com
 (2603:1096:4:90::20) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEZPR03MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: f6875641-fd96-4b75-ba0c-08de995075c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: JejGoYyAP1Og8Gu7ETO12rQOD4iCajtqEP0retBbK1MHzvVuUA+klaa2n/m4u1DLf//16Ya96+K2OyIaD9pFjQSRlyAbwd7lq5JEMcu/pNmmmb+sB/NAiJFoL6y3qPel6ywh6EYY+lx3wBxJMbRPbZVC5O7+uQfFgLk603tNu8XVbqYdeloOPQQy8jTGSU60W0Y9bZZ/9gW1CvQHKwcCQm/F4rWUo2c4+Rf8bgnrWDEjQqkNbbM1kSp36DAzUQ23YIT7nQQhYpGHVfjP81+9LsU8HAEAuWPGn/u4lMmOIk7/xG7i18AcvL/DUjOGLpsJwdeBTCI8shOUKnHl+8NGH5T3ZAIMOCvE7pdofGYSRroRtadooFxpShJ4BVMMBcvE0Nc4o/1UKeI616LcZO2db4O5E+3kvVEr220gWfIkWX8deBLY/qvVzkm1Y1BCURg+2iiYfjqZX7T29Cq80aRy1kc386gwYlC43eplDePwkGQycSOfYW1Qm9RB3tBz3TMN5UwedAngmcMkm5wK3AMhHBDSEF1XkYq+lRMUiX8exx5xxmpj+W9No7njZJg9hl4c4wk8smfVGjOhBPr/Up2zNHma0Mlb15+OFQQ300Ua+r6zKvQBcVcEHNZmRnVaXx0t0yj+5IKFA0J2XrFTdgWdukpKofohgOtk7I3duF1HxwmqwTwIhZwMqLUrZsgoDgqk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGdFREttc3VmZkRZbGtIejc0elRydHVMY2Vla2V0R3RmWm5DWVBtK1NWNUl2?=
 =?utf-8?B?QlhlKzc4SnRSZW9BVndlaUpCaTZCUjFCNndDMm9IODhGZHpVTVpuaE9ZZjJs?=
 =?utf-8?B?QmlqblppTVVKaU9lRUZyWU1XRGZacUVQUTNsa09lbkkzZEZDQmcxSjBnWENx?=
 =?utf-8?B?RlVsWk9IbGRzcmZPaWlSbXdHQXc1M0NERTdaOGowaTgrOEJkZ3BmYXRrdjlY?=
 =?utf-8?B?SlJXcmhNWWcrNFQyU0EydzNVZEU1YzlwblVpekNPbVFXUEVCYzJ2eUtBM3R2?=
 =?utf-8?B?MDEvMnUwWE1BTmJ5UjFsbVlsM2RTdUFFU2tCdU1jUUY5NSs2RmhCeXpEQzN6?=
 =?utf-8?B?NUV2OEc2OEZKbEx1b1R0cE1lK3lNcW1CNjF6T0dRcWxuK0FZRlFTK2lVSERO?=
 =?utf-8?B?dVN1V2hQeG5qV3p6WklKalVtNGNnYmpRZ1NPSWtmQjFYZGhhc09oR2RhOWdj?=
 =?utf-8?B?b3dVQk9wNUhFRFA1MDlvRnE3YmZJWFdCQW1rZlpkcVR1dTN3SmlCSEhzb0ZU?=
 =?utf-8?B?OTZmZkMrMktGNE1LNlVVTVNPOU5pUXV2SFA4Nld5VFlCOWhzc25aK01ORDF6?=
 =?utf-8?B?bGJnTTN6QVdXakp2elR1MVVOTTQ4UXBCNHR1WlpEdzNQL1JoOFRBUE5seGh6?=
 =?utf-8?B?N3pweEYvMTZ2Zmh0RjJ4N3FEaGlKMEw5Y0xxejUxOC85TXMxVCs3ZHJvOVND?=
 =?utf-8?B?MElBM0pHYVZpdkwreSt1TmRPNTdXL3FxV3lidjBXMlR3REJIR2p5U2JsM1Z2?=
 =?utf-8?B?UitlRE9YVkc1bHJVNGdpZjhUMU9nV3A4RTJST0dSaEMxSzBPb3l6eGFITXJ0?=
 =?utf-8?B?QkZiQ0I5bGtzaElqb1JOYVZxSGl1OWc0ekFGV29GRXBUN2dBeFNHTWxNa2Nj?=
 =?utf-8?B?MytWSHlDRXdiNldRUXdNMkdBaE9FZDhsRTNpdlh2dXpmOUpia1ZKNDB3VmZP?=
 =?utf-8?B?THgxeG80QVRxVzhWVVkvNlhkZ0xXZDRSQ2lmUVVUVjV2a3lneEFlSzVmMGlE?=
 =?utf-8?B?ekJLOWlYZ0cxWHYvQ1FURE5FbnN2SExaaW5pVkNnTHRjT1BEVkFrQkJIeG03?=
 =?utf-8?B?SEZXRUFNb05GeGlPTGVXWEQ5QXhFSzZZYTkramlVdHZBMWVhc25kNDdBWEVV?=
 =?utf-8?B?N0xPOHZEdWNxU2pjbDlETWMwaFNBOFVKMTVyT0s4T3phaHd6cHppYnFCZEU1?=
 =?utf-8?B?U3owa0F4NWNFQmhiNUJqdmY4UTVqZ0k2MGFQZVVTN1IrQkNBanZUUnc5Yk1G?=
 =?utf-8?B?MDVSY1ZreTFQNlZpaFBaM0FYSE5haWRFNEN6NjhJOG12SVd5UjNZR21Uazly?=
 =?utf-8?B?UkQ2WWtNYXpncldjaWNVeFoxTUoyMzZmWHdqelpJeTBJbTg4bUxJYi9BaUZh?=
 =?utf-8?B?RFVTdk1uWEJPbEtibXpxYWlLelhvOHN2MVBBWllUaHd5MEEvY2c3UEdBcWlt?=
 =?utf-8?B?ODlLSklyKzgrVUZabGJ1M3NCbVk1Uml0dFhEVVFULzBmOWpkZzQ1cWNWOE5U?=
 =?utf-8?B?aDVLb0NxRE5HZC9Lc1hVZ1BieDRqbmREV3RNUWovNUVjK0FvSDFOSVVuL2p6?=
 =?utf-8?B?dk9WajIvM1NqZlZlRjQzN3RYanMrSTJ5V2U4K21VV1JIU0JBVTd5b1JrM0tF?=
 =?utf-8?B?V1E0U0FLMU12VG5SYUdJZ1RzQ3pmZ29ZbTZZbVBveS9kdG84L09yTEJYNkh0?=
 =?utf-8?B?ei80TVcwMTFpSGh6cEZ4UWtVTlVYakhteis2b2dwc005YzZzQjVUandyZkhB?=
 =?utf-8?B?RGtmZWRIZWZ1R1FwTXRUMjVpZVByRjI2ekh0L1o3ZTUrbUFscGFjVHljdXRk?=
 =?utf-8?B?aU5meDZzSG44QlhZZEZOK203S3YvZ1pyRlRNRDJlUVlJbWc0MWJ1ZFhJZjQ3?=
 =?utf-8?B?bTJnclB4bGlybldzVElyUkRZM1NPd3Bid3VCSnRCbUlSTFF4MERFeXVtUURp?=
 =?utf-8?B?alFQdWJjRkpjL1VSUFM1RzNZcDJVK09XK1lqbHM0Ti8xVjlZdGtVQy80ckNq?=
 =?utf-8?B?ZW5xa0YyQkZlMGI4azA2Y3RBWEo4UCs3VHh4YVYzRSs4TTFhRzlxK254bFlw?=
 =?utf-8?B?VE1GRHQ4UHBlRlRGbFhJay9jcW5rV2ozeGVmd3FyL1p4QTZUa2M3OFdNeGtz?=
 =?utf-8?B?RnJScSthZGR3QThaWStYQWZpZzBZV1FINThPWTdqOXFNbnNEMHlmZzhTMm5y?=
 =?utf-8?B?WnNXOVhnTk0yV0xXbUsveTZRc0ZHN2hsem1pQnJDcDhzRy9iM3VFcy9DTHox?=
 =?utf-8?B?NGFGa0Q2alJpcmxhMHlUSDhySXNVZnp1Q0ZNNmwzRzllM0NtakdQZ1hIYitk?=
 =?utf-8?B?OG1oUktEOU0vMVZyT2tpR1dOSVNaQ0kzNEp1ZVVYSDJFTlBHL2orUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6875641-fd96-4b75-ba0c-08de995075c6
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 11:33:18.6826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJT11gRv6rEFtk6bn7vxcHfZTF9lzu7Cq+RodOyixCqaiH9bYdXJ4nYePPtAroHMbs7EUkXWc4zF8tBh4Z9YlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_043334_524308_48011088 
X-CRM114-Status: GOOD (  15.42  )
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


On 4/13/2026 5:24 PM, Neil Armstrong wrote:
> [ EXTERNAL EMAIL ]
>
> On 4/13/26 11:10, Krzysztof Kozlowski wrote:
>> On 13/04/2026 10:21, Jian Hu wrote:
>>>
>>> On 4/12/2026 5:55 PM, Krzysztof Kozlowski wrote:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> On 10/04/2026 12:03, Jian Hu wrote:
>>>>> Add support for the A1 and T7 SoC family in amlogic clk measure.
>>>>>
>>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>>> ---
>>>>>    drivers/soc/amlogic/meson-clk-measure.c | 272 
>>>>> ++++++++++++++++++++++++
>>>>>    1 file changed, 272 insertions(+)
>>>>>
>>>>> diff --git a/drivers/soc/amlogic/meson-clk-measure.c 
>>>>> b/drivers/soc/amlogic/meson-clk-measure.c
>>>>> index d862e30a244e..083524671b76 100644
>>>>> --- a/drivers/soc/amlogic/meson-clk-measure.c
>>>>> +++ b/drivers/soc/amlogic/meson-clk-measure.c
>>>>> @@ -787,6 +787,258 @@ static const struct meson_msr_id 
>>>>> clk_msr_s4[] = {
>>>>>
>>>>>    };
>>>>>
>>>>> +static struct meson_msr_id clk_msr_a1[] = {
>>>> And existing code uses what sort of array? Seems you send us 
>>>> obsolete or
>>>> downstream code.
>>>
>>>
>>> Thanks for your review.
>>>
>>>
>>> I have checked the previous Amlogic SoC's commits. Such as Amlogic AXG,
>>> G12A, C3, S4.
>>>
>>> The clk_msr_xx entry is added after last SoC's array, sorted by
>>> submissin date rather than alphabetical order.
>>>
>>> So I place A1 and T7 after S4 accordingly.
>>>
>>>
>>> The A1 clock controller driver was already supported in
>>> https://lore.kernel.org/all/20230523135351.19133-7-ddrokosov@sberdevices.ru/ 
>>>
>>>
>>> It is also present in the mainline kernel:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/meson/Kconfig#n113 
>>>
>>>
>>>
>>> This clock measure IP is used to measure the internal clock paths
>>> frequencies,  and A1 clock controller driver was supported.
>>>
>>> Since the corresponding clock measure driver does not support A1 
>>> yet, So
>>> add A1 clk msr here.
>>
>> No, what qualifiers or keywords are used for existing arrays? IOW,
>> please investigate and understand why you are doing this very different
>> than existing code. Maybe because you sent us downstream, so you
>> replicated all other downstream issues.
>
> I see, the existing uses "static const struct".
>
> Jian, could to switch to that please ?
>
> Neil
>
>>
>> Best regards,
>> Krzysztof


Hi, Krysztof & neil


Got it. Thank you pointing out the missing "const".  I mistakenly 
thought it was an alphabetical order issue.

I will fix it in the next verion.


Best regards,

Jian


