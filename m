Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A191C982CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 07:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aq5ndAZVV5OD5CSKn5bl/7qvsgbydxqH5ZLzZa1Ydw4=; b=HY0ZY9YkLL46lHIFMzACUBIh8X
	36r30jCZDNaEEe1cw+CzwbTFjlz30p9TnOZ+aX7m5JUXfs232wTN/gGt6VfU6Fz9OtukDhmR4sR4p
	sip4laC9URIlmJL/tw+EFYAh933hzOiCW98M43zlM8T6vcvTmiXwDnh6Yc1KIziGCuxVrbx6y4pgh
	L4SH0xZUAVbslbklu/pY2Btqc+LzySADAVj4Gv0wxs15jZTUHtTXCCUtdYK/M20QSf77OzX3wtgvs
	cMAATCxo07L7mSo8ovAvGFn4cdJszgxKF1pvB2tPLjDWvdnXKAi4KvjmqMmW0igLwq6Jk9zFtC+3Q
	XreBF0oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76Wj-0000000AlXX-01Vo;
	Thu, 17 Sep 2026 07:27:25 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76Wf-0000000AlXA-1Pf4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 07:27:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JY+wpLM9HGQJC0L+mPoMF5HD8Wlo4oV67K/EapUL95WBMwMhTyiAF0LFwML6z9fuSFnAJwhANRjCcE7oKRHD8T9sWQuN1mUcA3DoNUeHKa3ngMQYcFWf5Q0QHkzXWTCFBqN14QVjdtmFI9V8AGgJUeVQBEF1Ny4NsZV6NuY+6QmznP1ml6JwqZPq5oc4wK0JXVFynya1QR9tLGJ3AMJ7LvGfAfOCUW1C4frTIcLIPpjoPEsC783azWDpjtOjeLdMdlhuZ+VddOKWVp06f7zuBJov9Pmah/s84dczNrGcvz1opaTYfnKPoWEmfeZMkV8+9ibW7C3ajh2Gw4eocgORgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aq5ndAZVV5OD5CSKn5bl/7qvsgbydxqH5ZLzZa1Ydw4=;
 b=ZwBH69LbFxPeRXAWEqLWxE/DNHbgN/qyUBzPwnBD7MBcCcOfqUlabX0qRIXyMWHzqSVELyVgLutiY8jCsg0zN0YNCVVzOzUx34AzPjHRBVZy9Ocdr7y/QbNlNFh9gCfuyEJcTRRycxD1e3P4DowE+vJk5Ho4GJ3LBNCC9AWJsvsW4UEBA8xTAEVSQMdKyAN/YMTM8tX+rEDzwK10Y/iwpL0ysJVv2lYHjEJWaR5bXDYzDkrcw0CDmgWL2eN0n7RmObA5azkdxcEL0eUUVTJHkkymJ19xBZRvrw0ptwJ5e+DPbI8P2ZuYlIAyDBIVHJoLN7oiJBhAdkKmruNQl0dClQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aq5ndAZVV5OD5CSKn5bl/7qvsgbydxqH5ZLzZa1Ydw4=;
 b=P6y8yO2uflLtDGoDy9GeAQuPsZpCP00QsRk5qEANO/UEgtBA8XVb6+QtW608a1Pb96t/X2nie5SuKq9jzXfwiS1GeKSCt+kRnXWyStozHq57Gqc+zRcUmFeUrJTRIOyvuPmq2glXAs6gUiIs2bsjPnD3MZ+ljDoGU+uCgDPZ4qug0AnjOZOMJTbMvSFC6eFJNxWlcgXWBXLN0D8WPFXhq8WV6S4K1PLjjBRM+szZNYDwhWDFASvEa2HxCp/C0a/S/9wQVJC7Mvcyk/0Nz3pyPBkOQWmP3Rst6uQ0aNRasf3upHhiyXD/99X1eVOzDBTiMtV4amXS/CmbbdV88WDWiA==
Received: from AS9PR05CA0047.eurprd05.prod.outlook.com (2603:10a6:20b:489::26)
 by PAXPR10MB5760.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:24a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Thu, 17 Sep
 2026 07:27:13 +0000
Received: from AM2PEPF00070CF6.eurprd02.prod.outlook.com
 (2603:10a6:20b:489:cafe::ac) by AS9PR05CA0047.outlook.office365.com
 (2603:10a6:20b:489::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 07:27:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF00070CF6.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 07:27:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 17 Sep
 2026 09:32:44 +0200
Received: from [10.48.86.251] (10.48.86.251) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 17 Sep
 2026 09:27:11 +0200
Message-ID: <f1f9db42-f022-45da-a6fa-132d54d07716@foss.st.com>
Date: Thu, 17 Sep 2026 09:27:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: iio: adc: stm32-adc: add support for
 stm32mp23 and stm32mp25
To: Jonathan Cameron <jic23@kernel.org>
CC: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
	<nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Marek Vasut <marex@nabladev.com>,
	<linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Cheick Traore <cheick.traore-ext@st.com>, Olivier Moysan
	<olivier.moysan@foss.st.com>
References: <20260911-adc-stm32mp25-v1-v1-0-cef26eecdef2@foss.st.com>
 <20260911-adc-stm32mp25-v1-v1-1-cef26eecdef2@foss.st.com>
 <20260913040801.30e07d4c@jic23-hlaptop>
 <6e28ede2-686c-4972-8a15-348ae090cec8@foss.st.com>
 <20260917035338.2ef5ded6@jic23-hlaptop>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20260917035338.2ef5ded6@jic23-hlaptop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.251]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF6:EE_|PAXPR10MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: b056a8ca-1986-4110-96b8-08df148d17c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|7416014|10067099003|4143699003|3023799007|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: sS3qTyfoj/7hN8VML5yR4X8v8a/SGNl8dPkW6FKheOL6S/JBkZqdEhoNcWzqstKH5QTQr0dUNL734+aMibD4sHJuB240LKasCBf8ps6gNkElx5jnzscB82Zs3PXeS5si9863nFZCc555XEMwcRWitbzHj3uohDK+6QPVh9xykoWLrkoQ6L2bf9s2WU7k6o35RSeqMIqmXUrqntb6LL4/f2X75acoh6Eb5j/9jHmb9OX5rjDDAdAUE0++oXMTmDEWHnWPGMwkjO0LGOqO/iifCvTOa1UVmO3SmFcaohh8NXmbkC37sWKdkue/Plv3HI2Ws9PZ53GP6DKW8kglT5LKiWCzAYEWPxX6b5wggFpWB3Q1iSadbrKy9Bj/Vhc2uZ4d4dMjyIzWPFXxtDCjqZe25JV2ovxDvYv2VFLhWOfHgGEB+LRJ6pHbJoMaGcRLxXSYSvqJ2U8VF5hS7Sq45uzcRVTL/OjXzYIqEy2MRqaZZ7LLpJPcvs1XPlczGZ3B4YPfTQdXzDoflaLBLvzPTcdVDZUFUJrN4W5SDyLoXMpWOFB4rLBHz+Eqn2clZwUMGpvwI8xNky0uOjXAxtabZm4ent3gs8Y9ZqCoHNs2+EzrV1SOPDsdVXj7I1oxP4xE+HyoEsTmV/Diu+1iJuUcYiAg0xFGq+tIAkJqFSp0imC/m28o5kEBdIbunQD6nSkj2cE+SyROoa64Q6QKKazZijJ77Q==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(7416014)(10067099003)(4143699003)(3023799007)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sU95tbbcIyZ3vPMaiaXW5DF2NkEQWAnoLkFR/LmTivL+IF1Of1TlkyLjlQF4l7itXqWB2xR4N05SutjCHuaB0dBU3ml/Uy/wCC1cXExKDtCl/EyR9ZsCymetrxvYbAHYzIc+x+PmJIu71s+Dg+Y/Fp0j7DPv08A6JyBmvli1LuxILbi0V4NlnQJThG/VXrOvNXlos78YFg3tHgUG5o29ecM4PS7MWrctc2cH0rr4M9FawsjMdrDVkIJDcoyHsNEPWAV83Z9N4B8CfwUXJx0OH1Br+ZxEda7icSSodeTT6lulKJth9iTBs+Qyzitzu4qfOUcge4UAhw0a7Rc6BTfSWX73zzcwarLszBoMcNjcFkHfKgcQHYxfa41WqIxaS590gfRKpLd6oWXx42mHyZ4AWGuBr+08ezuQHcFyrgeWPPmEoS4X39wgr//1E04dP+5Y
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 07:27:13.0982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b056a8ca-1986-4110-96b8-08df148d17c8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF00070CF6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_002721_617792_66A47B4E 
X-CRM114-Status: GOOD (  21.66  )
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

On 9/17/26 04:53, Jonathan Cameron wrote:
> On Tue, 15 Sep 2026 09:49:01 +0200
> Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:
> 
>> On 9/13/26 05:08, Jonathan Cameron wrote:
>>> On Fri, 11 Sep 2026 17:51:23 +0200
>>> Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:
>>>   
>>>> Add stm32mp23 and stm32mp25 compatibles. Three ADCs can be found on
>>>> these SoCs, split into two blocks:
>>>> - ADC12 are tightly coupled (common registers).
>>>> - ADC3 is managed independently.
>>>> Each ADC is a 12-bits successive approximation analog-to-digital converter,
>>>> with up to 20 multiplexed channels that can be configured as single ended
>>>> or differential.
>>>>
>>>> New property "st,adc-trigger-sel " allow to make the difference between
>>>> the ADCs and to apply the correct trigger configuration.
>>>>
>>>> STM32 ADC may be in a power domain: allow a single 'power-domains'.
>>>>
>>>> Restrict the last channel (19), as it is wired directly to ADC Vref+.
>>>> It's meaningless to have direct measurement. Internal Vref with
>>>> calibration data from bsec (nvmem) must be used instead e.g. vrefint.
>>>> Restrict deprecated properties (st,adc-channels, st,adc-diff-channels,
>>>> st,min-sample-time-nsecs).
>>>>
>>>> Co-developed-by: Cheick Traore <cheick.traore-ext@st.com>
>>>> Signed-off-by: Cheick Traore <cheick.traore-ext@st.com>
>>>> Co-developed-by: Olivier Moysan <olivier.moysan@foss.st.com>
>>>> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
>>>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>  
>>>
>>> Hi Fabrice, all,
>>>   
>>>> ---
>>>>  .../devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 106 ++++++++++++++++++---
>>>>  1 file changed, 94 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
>>>> index c4c4575d3fa9..0e0ceaa3d8d6 100644
>>>> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
>>>> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
>>>> @@ -23,11 +23,18 @@ maintainers:
>>>>  
>>>>  properties:
>>>>    compatible:
>>>> -    enum:
>>>> -      - st,stm32f4-adc-core
>>>> -      - st,stm32h7-adc-core
>>>> -      - st,stm32mp1-adc-core
>>>> -      - st,stm32mp13-adc-core
>>>> +    oneOf:
>>>> +      - items:
>>>> +          - enum:
>>>> +              - st,stm32f4-adc-core
>>>> +              - st,stm32h7-adc-core
>>>> +              - st,stm32mp1-adc-core
>>>> +              - st,stm32mp13-adc-core
>>>> +      - items:
>>>> +          - enum:
>>>> +              - st,stm32mp23-adc-core
>>>> +              - st,stm32mp25-adc-core
>>>> +          - const: st,stm32-adc-core  
>>>
>>> What is this?  Given these all vary in features
>>> why would we fallback to a generic match for
>>> these new compatibles?  
>>
>> Hi Jonathan, all
>>
>> Ack, I'll drop it in v2,
>>
>>>
>>>
>>>   
>>>>  additionalProperties: false
>>>>  
>>>>  required:
>>>> @@ -239,11 +276,18 @@ patternProperties:
>>>>  
>>>>      properties:
>>>>        compatible:
>>>> -        enum:
>>>> -          - st,stm32f4-adc
>>>> -          - st,stm32h7-adc
>>>> -          - st,stm32mp1-adc
>>>> -          - st,stm32mp13-adc
>>>> +        oneOf:
>>>> +          - items:
>>>> +              - enum:
>>>> +                  - st,stm32f4-adc
>>>> +                  - st,stm32h7-adc
>>>> +                  - st,stm32mp1-adc
>>>> +                  - st,stm32mp13-adc
>>>> +          - items:
>>>> +              - enum:
>>>> +                  - st,stm32mp23-adc
>>>> +                  - st,stm32mp25-adc
>>>> +              - const: st,stm32-adc  
>>>
>>> Similar to above, what is this?  
>>
>> same,
>>
>>>
>>>   
>>>> @@ -344,6 +388,12 @@ patternProperties:
>>>>          items:
>>>>            - const: vrefint
>>>>  
>>>> +      st,adc-trigger-sel:
>>>> +        description: Selects the HW trigger configuration available on this ADC
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>> +        enum: [0, 1]  
>>>
>>> Magic value that is meaningless to see in a dts.  If they
>>> are effectively not compatible, give them different compatibles and
>>> drop this property.  I'm unconvinced this property is more
>>> useful than that given just how opaque the description is.  
>>
>> That's exactly what I was wondering about. As you suggest, I can remove
>> this property, and introduce dedicated compatibles in V2, to clearly
>> identify the differences.
>>
>> Need to distinguish:
>> - ADC12 are tightly coupled (common registers).
>> - ADC3 is managed independently.
>> Triggers are different between them. The purpose of st,adc-trigger-sel
>> was to identify that.
>>
>> Also MP23 and MP25 are also different (trigger list). Combining this
>> would lead to introduce four compatibles, I'm thinking of:
>> - st,stm32mp23-adc12
>> - st,stm32mp23-adc3
>> - st,stm32mp25-adc12
>> - st,stm32mp25-adc3
>>
> Naming wise, I wonder if it looks too much like adc twelve?
> Not sure how to avoid that cleanly as adc1-2 seems odd too.

Hi Jonathan,

Indeed, so could introduce one compatible per Soc/ADC ?

+          - st,stm32mp23-adc1
+          - st,stm32mp23-adc2
+          - st,stm32mp23-adc3
+          - st,stm32mp25-adc1
+          - st,stm32mp25-adc2
+          - st,stm32mp25-adc3

There are some other differences between adc1 and adc2, e.g. in the
reference manual:
- ADC1 is connected to 18 external channels + 2 internal channels
- ADC2 is connected to 14 external channels + 6 internal channels
- ADC3 is connected to 14 external channels + 6 internal channels

This is resolved currently by channels child nodes with labels for
internal channels. So maybe better to name all of them (future proof) ?

Please advise,
Best Regards,
Fabrice

> 
>> I plan to update it in v2.
>>
>> Thanks,
>> Fabrice
>>
>>>
>>>
>>>   
>>
> 


