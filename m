Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C82C19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 20:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GOBEorWmIgUcdOOD80gRp7n39T+YL9MZl8LKJghq44=; b=w1fQrChYRAZo7T9TTdOBLmM1PC
	L+2lFploK5h0UXIhv6zP9XimuWRpnFON/Euv4sDhJU4d0y57QniRpQlpBE8nGsFlbmNWJNfdpRGO+
	ZoAKkvXMrijSFk2azG8eURyWQhPSfUsjfMaagd0E9nuvyXYH4tUDdD+3uRUNwRfblqEuxDunUAK5t
	jTZnI4kLdE0qNepxuI0lysReWH7u1lFwDim0ykAGL+c35S9w9DVljsvL6QLN2oN5FMt2LxYaRTIXq
	8AxBLj14AkhatB1IE2HgYKAlCq29DM19evt4WWVWdBa1v4YmxrGMe75ZPttxIX2U7BLBD41dKcwZZ
	qZL8fvRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnOKp-00000005Nw8-3P6R;
	Wed, 26 Feb 2025 20:48:51 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnOH0-00000005NUZ-0bSb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 20:44:55 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QJoKW6012382;
	Wed, 26 Feb 2025 21:44:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	2GOBEorWmIgUcdOOD80gRp7n39T+YL9MZl8LKJghq44=; b=HvzUZHc+jDn1+88j
	dTdruYUDZMwl95iRYAKyZNOEDVvPQ9LNZ2fIQBN3OpBJGp4aOLb6OEpH1iUwwl0m
	dwY+bHpFNtFE6KfXsUJGydmJZ/Kjk3hpXfFQiNS4VSthFtAshWJDsLW+nJm7jksf
	pCDe/Mf1YR9jmnxJLJF/ZRttsHDzBlbmaD2ceN2ejEJUv2dVDkiwQtjy+22RMcMM
	64hn0eTZVTcG85hu87F44bXN/N1Xxe9s20pGB8Z6JKlJe+O1JpwJp5Ya6yVV0/L1
	MIYQfow3CtLSgRelnJTyL3dq+XS9QTMSX3h3h8aRJPo8o96aooGAi4TrkOP/YjTB
	rWOaTQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psv6usm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 21:44:46 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 14F404007D;
	Wed, 26 Feb 2025 21:43:33 +0100 (CET)
Received: by euls16034.sgp.st.com (STMicroelectronics, from userid 89)
	id 6DE2F4EFC7A; Wed, 26 Feb 2025 19:16:19 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF75A4F3E66;
	Wed, 26 Feb 2025 19:16:19 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 19:16:19 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 19:16:18 +0100
Message-ID: <4876e1a4-93b7-4bd8-be03-4a2895567f2b@foss.st.com>
Date: Wed, 26 Feb 2025 19:16:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] counter: stm32-lptimer-cnt: add support for stm32mp25
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
 <20250224180150.3689638-7-fabrice.gasnier@foss.st.com>
 <20250225-pelican-of-pleasurable-might-e9a7e8@krzk-bin>
 <4ffc3fe3-78ab-43b2-b0d5-8f9cb545f9c5@foss.st.com>
 <b9b3844e-bdd5-4f50-aa10-8bf97751c566@kernel.org>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <b9b3844e-bdd5-4f50-aa10-8bf97751c566@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_06,2025-02-26_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_124454_495338_F3AD1281 
X-CRM114-Status: GOOD (  21.65  )
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

On 2/26/25 08:49, Krzysztof Kozlowski wrote:
> On 25/02/2025 15:58, Fabrice Gasnier wrote:
>> On 2/25/25 13:02, Krzysztof Kozlowski wrote:
>>> On Mon, Feb 24, 2025 at 07:01:48PM +0100, Fabrice Gasnier wrote:
>>>> Add support for STM32MP25 SoC. Use newly introduced compatible to handle
>>>> this new HW variant, even if no major change is expected on the counter
>>>> driver.
>>>>
>>>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>>>> ---
>>>>  drivers/counter/stm32-lptimer-cnt.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
>>>> index b249c8647639..a5dce017c37b 100644
>>>> --- a/drivers/counter/stm32-lptimer-cnt.c
>>>> +++ b/drivers/counter/stm32-lptimer-cnt.c
>>>> @@ -508,6 +508,7 @@ static SIMPLE_DEV_PM_OPS(stm32_lptim_cnt_pm_ops, stm32_lptim_cnt_suspend,
>>>>  
>>>>  static const struct of_device_id stm32_lptim_cnt_of_match[] = {
>>>>  	{ .compatible = "st,stm32-lptimer-counter", },
>>>> +	{ .compatible = "st,stm32mp25-lptimer-counter", },
>>>
>>> So fully compatible? Why this change then?
>>
>> Hi Krzysztof,
>>
>> I should have mentioned it in the commit message:
>>
>> Currently, same feature list as on STM32MP1x is supported.
>> New capture input stage is now available in the hardware. It's not added
>> yet to the driver.
> 
> Which is the exact meaning of compatible. Express it properly in
> bindings and driver.

Could you please just clarify here, do you suggest to better explain it
in the commit message, both in bindings and driver ?
Or do you mean something else ?

There's one more thing here, I haven't mentioned earlier, which is
specific to the STM32MP25 SoC family (not only to the LPTimer revision).

The LPTimer has interconnect signals throughout all the SoC. It's listed
in the "Peripheral interconnects" section of the Reference Manual (RM0457).
Here, simply reading the LPTimer revision/identification register
wouldn't be enough, as it specific to the SoC. Upcoming STM32MP21 SoC
family will have a different list of inputs/outpus internally in the SoC
(but same controller revision).

So here I intend to keep the specific compatible
"st,stm32mp25-lptimer-counter", to be used even if not yet implemented
by the driver.

I'll try to explain it better in next revision.

Thanks for reviewing,
Best Regards,
Fabrice

> 
>>
>> The Low Power Timer (LPTIM) hardware isn't fully backward compatible,
> 
> How so? How can it work then with above ID table?
> 
> 
> Best regards,
> Krzysztof

