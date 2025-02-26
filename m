Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CFDC1B087
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 20:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40P6YA6Gfjsk6WHscxOoeamuC5y6WvMtWXK5t1BqI08=; b=WE/YWWV9oYdimT16d/ASW4KbqX
	63XVGHVQFQEvORb+cLjl9S4G5liKM1WXApSc4fFCnS4cKIa9z+qRj54BmEeaxPPRF+PSCoqEIwmXM
	DNGe7S98cx/s0oEbw8OoXim451z2SVc1TIKoXyFDPRGVCz4NVCo410dj0h8+iqtcArNM9tAMAFa8v
	t1cZC3MlN3gZFkkrO6hWbGBrsIlo9heTSKvEi/7recIP0HAh+HL/+ojTxT25S1Uc+XRg2LxqNnMSU
	+SQ0IFRgteqUfB0Fb/z9rmxl/IRDcyaymqzBum+r/4Xt319E4D8ThmlFNkItLJISC2T+tFTLkjqxJ
	C7kgtvSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnO19-00000005LBx-2dsq;
	Wed, 26 Feb 2025 20:28:31 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNxm-00000005KOm-1uDa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 20:25:04 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QG3IeZ028965;
	Wed, 26 Feb 2025 21:23:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	40P6YA6Gfjsk6WHscxOoeamuC5y6WvMtWXK5t1BqI08=; b=zK2QGdzDvDEwtaNd
	jhHpzdye3apCHNzgIoAFSUSptp4j/yLQaM0OmteUdHVLpIkXDoooJnQazJeT1qhT
	YoSZoPIlUViwT3l+Tzlwir+k9zv9A6nz/rImAL6WVi/mRqka4lbJ6pjtxitMg+b/
	Cayt3540zUhomSar9Gvctmb03ILdrkBYvuI3C/XkfHb14LcxgVgvFlfBxBVle2mW
	nbbHqkKcyQ8MZpn4Wy+wF3/e/hccjcfYPAXvw5kicp5UHzkhHlvLcL6Sxdy+TutG
	oidbpuKMGawsOi32QXmrZafcxpI6kRq9xfq2vVEbC6a3kpWIGZqWcfZGobGp/CW9
	IDD4rg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451pt3phb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 21:23:45 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 06B0C40069;
	Wed, 26 Feb 2025 21:22:35 +0100 (CET)
Received: by euls16034.sgp.st.com (STMicroelectronics, from userid 89)
	id 6DCAC4D33B6; Wed, 26 Feb 2025 19:17:26 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B053443D2B;
	Wed, 26 Feb 2025 19:17:26 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 19:17:26 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 19:17:25 +0100
Message-ID: <4010c7b7-f285-40e6-a032-055c4252ecb7@foss.st.com>
Date: Wed, 26 Feb 2025 19:17:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: mfd: stm32-lptimer: add support for
 stm32mp25
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <wbg@kernel.org>, <jic23@kernel.org>, <daniel.lezcano@linaro.org>,
        <tglx@linutronix.de>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
 <20250224180150.3689638-2-fabrice.gasnier@foss.st.com>
 <20250225-outgoing-scorpion-of-music-be0bea@krzk-bin>
 <acabacb8-8ea1-4b16-a562-8ffba64fdd36@foss.st.com>
 <8b42f0ad-2993-43b8-9055-6d74dc3bafbe@kernel.org>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <8b42f0ad-2993-43b8-9055-6d74dc3bafbe@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_06,2025-02-26_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_122503_035018_5D54B328 
X-CRM114-Status: GOOD (  15.39  )
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

On 2/26/25 08:51, Krzysztof Kozlowski wrote:
> On 25/02/2025 15:57, Fabrice Gasnier wrote:
>> On 2/25/25 13:02, Krzysztof Kozlowski wrote:
>>> On Mon, Feb 24, 2025 at 07:01:43PM +0100, Fabrice Gasnier wrote:
>>>>    pwm:
>>>>      type: object
>>>>      additionalProperties: false
>>>>  
>>>>      properties:
>>>>        compatible:
>>>> -        const: st,stm32-pwm-lp
>>>> +        enum:
>>>> +          - st,stm32-pwm-lp
>>>> +          - st,stm32mp25-pwm-lp
>>>>  
>>>>        "#pwm-cells":
>>>>          const: 3
>>>> @@ -69,7 +76,9 @@ properties:
>>>>  
>>>>      properties:
>>>>        compatible:
>>>> -        const: st,stm32-lptimer-counter
>>>> +        enum:
>>>> +          - st,stm32-lptimer-counter
>>>> +          - st,stm32mp25-lptimer-counter
>>>
>>> Driver changes suggest many of these are compatible. Why isn't this expressed?
>>
>> Hi Krzysztof,
>>
>> The Low Power Timer (LPTIM) hardware isn't fully backward compatible.
>>
>> At driver level, as indicated in the cover-letter, same feature list as
>> on STM32MP1x is supported currently. This is probably what makes it look
>> like it's compatible, but it's not fully compatible.
> 
> I don't understand. Same feature list is supported means fully
> compatible, but you say not fully compatible. You are aware that
> compatible means not the same?
> 
>>
>> The hardware controller is a bit different. Some registers/bits has been
>> revisited among other things. This is the purpose for these new compatibles.
> 
> We do not discuss new compatibles. We discuss lack of compatibility. If
> registers/bits are changed, how existing driver can work with same ID table?

Hi Krzysztof,

To summarize on dt-bindings side, here is my view, following your
comments on per driver basis of the compatible usage.

Let's keep these new compatibles:
- "st,stm32mp25-lptimer-trigger"
- "st,stm32mp25-lptimer-counter"

Both reflect not only LPTimer hardware update, but also specific
interconnect to other hardware blocks throughout all the STM32MP25 SoC.

Other compatible strings may be dropped. Reading the
revision/identification register of the LPTimer should be enough for
compatibility in the related drivers.

I'll update this in next revision of the series.

Thanks for reviewing,
Best Regards,
Fabrice

> 
> 
> 
> Best regards,
> Krzysztof

