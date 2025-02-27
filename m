Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05F2C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 13:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VtVpJbGl3ABqgeyotfSFZTXggVBvrafMpv9raSwNMI=; b=PnR0O7v3lR1uKAbGXbhBVOC7X5
	gZ4obD/5LV7MC3dp4sWoV8qPbEexoE/DKGKXnCFxTdbtToL1zSNQV7fttIj0eAEZOhNsar/m7tL5A
	DR8Nqe+TLu6OSPDEaD6JZfUbKWfv4ESKTfviXlPCK+B7BO2nVa8JA3r6vE3uMjMQnVpP0yWO+fbau
	zeP2MHDTAcWesRUVDd7ICr5D8RR4LAzAZpBvDkHmIzrPiNChB3vyOY+zD5ERZpBquHZsx6QBAo24/
	lqyIqd3aA9dE8dCIseD0+s8hIeBr7thD2u7+xgRTtNzf4K1NxFrFgTWrs8Vk/ZGhs3nLtVMUJUZ1B
	8MBy2+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndY5-00000007SKp-2ZgL;
	Thu, 27 Feb 2025 13:03:33 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncqj-00000007KqV-2vBE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:18:47 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R9RU3K012382;
	Thu, 27 Feb 2025 13:18:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	5VtVpJbGl3ABqgeyotfSFZTXggVBvrafMpv9raSwNMI=; b=nJwZcULPguYTFbLK
	s00zfJzJvVpHQh6/3RohsrUhqhjn5Uu6s/W72KrdQhfvtEj9v+b+VBIjBKouXUJc
	cTA0ai1DvN6SC2Qa3r7gMUqs2gSODT9cie56XWXiyf9MYzV1yuPJgY7Gtu0dmXvh
	Z/3KS9y5wUYK6E415GV7CkqaP48Iv9fyC018NbQ/6iRK99WgnP/BKdDKh66+hW5Y
	LZqNKHjDzI9l8hcBnnQ8qB8f1u8X80M9IY0sAcmgA2fNjLo9VizKFhsty8DZWyti
	Hny0mmZFyCUzaLhMZyZdzQn3vcIdkOp13Whwhn8ebzvG13LCYBjw22njwSWnOnHs
	NRhWRw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psvah7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 13:18:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 45CEC40045;
	Thu, 27 Feb 2025 13:17:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 73A2540E4F0;
	Thu, 27 Feb 2025 13:16:43 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 13:16:42 +0100
Message-ID: <df74157e-d141-4045-a244-3168c58c0ff4@foss.st.com>
Date: Thu, 27 Feb 2025 13:16:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp25
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Clement LE GOFFIC
	<clement.legoffic@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-7-9d049c65330a@foss.st.com>
 <418a80a9-8c08-4dd1-bf49-1bd7378321aa@kernel.org>
 <b257aa79-6ca9-4f57-988a-ec00225992ab@foss.st.com>
 <b57e3c9e-244e-435b-8a7b-cf90f3a973b3@kernel.org>
 <988667a4-4bc0-4594-8dfd-a7b652b149b2@foss.st.com>
 <55beb3e7-65ac-4145-adae-fb064378c78d@kernel.org>
 <8cdc7e52-f9e2-4fc9-be68-0dd72a25ee1b@foss.st.com>
 <48cc626a-d632-444f-8563-07a9ea0ecc71@kernel.org>
 <17450f7d-d398-4a75-8b53-6c9c396661ab@kernel.org>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <17450f7d-d398-4a75-8b53-6c9c396661ab@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_05,2025-02-27_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_041846_230840_420CDEB9 
X-CRM114-Status: GOOD (  22.44  )
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



On 2/26/25 22:31, Krzysztof Kozlowski wrote:
> On 26/02/2025 22:26, Krzysztof Kozlowski wrote:
>> On 26/02/2025 16:30, Alexandre TORGUE wrote:
>>>
>>>
>>> On 2/26/25 16:08, Krzysztof Kozlowski wrote:
>>>> On 26/02/2025 10:33, Alexandre TORGUE wrote:
>>>>>>>>> +		hdp: pinctrl@44090000 {
>>>>>>>>> +			compatible = "st,stm32mp-hdp";
>>>>>>>>
>>>>>>>> So here again - you have stm32mp251 SoC, but use entirely different
>>>>>>>> compatible.
>>>>>>>
>>>>>>> Ok so I will use "st,stm32mp15-hdp"
>>>>>>
>>>>>>
>>>>>> This means this is stm32mp15 SoC. I do not see such SoC on list of your
>>>>>> SoCs in bindings. What's more, there are no bindings for other SoC
>>>>>> components for stm32mp15!
>>>>>
>>>>> Yes stm32mp15 is not a "real SoC". I agree that at the beginning of the
>>>>> STM32 story we didn't have a clear rule/view to correctly naming our
>>>>> compatible. We tried to improve the situation to avoid compatible like
>>>>> "st,stm32", "st,stm32mp" or "st,stm32mp1". So we introduced
>>>>> "st,stm32mp13", "st,stm32mp15" or "st,stm32mp25" for new drivers. So yes
>>>>> it represents a SoC family and not a real SoC. We haven't had much
>>>>> negative feedback it.
>>>>>
>>>>> But, if it's not clean to do it in this way, lets define SoC compatible
>>>>> for any new driver.
>>>>
>>>> Compatibles are for hardware.
>>>>
>>>>> For the HDP case it is: "st,stm32mp157" and used for STM32MP13,
>>>>> STM32MP15 end STM32MP25 SoC families (if driver is the same for all
>>>>> those SoCs).
>>>>
>>>> No, it's three compatibles, because you have three SoCs. BTW, writing
>>>> bindings (and online resources and previous reviews and my talks) are
>>>> saying that, so we do not ask for anything new here, anything different.
>>>> At least not new when looking at last 5 years, because 10 years ago many
>>>> rules were relaxed...
>>>
>>> So adding 3 times the same IP in 3 different SoCs implies to have 3
>>
>> Yes. Always, as requested by writing bindings.
>>
>>> different compatibles. So each time we use this same IP in a new SoC, we
>>> have to add a new compatible. My (wrong) understanding was: as we have
>>
>> Yes, as requested by writing bindings and followed up by all recent
>> platforms having decent/active upstream support. See qcom, nxp, renesas
>> for example.
>>
>>> the same IP (same hardware) in each SoC we have the same compatible (and
>>
>> You do not have same hardware. You have same IP, or almost same because
>> they are almost never same, implemented in different hardware.
>>
>>> IP integration differences (clocks, interrupts) are handled by DT
>>> properties.
>>
>> Which binding doc/guide suggested such way? Countless reviews from DT
>> maintainers were saying opposite.
> I was not precise: IP integration differences are of course handles as
> DT properties, but I wanted to say that it does not solve the problem
> that IP integration means you might have differences in this device and
> you should have different quirks.

Yes I agree. We'll take care of it for future development. Maybe, It 
would be nice to apply this rule in our current drivers/DT already 
upstream ?

> 
> And the example in this patchset: entirely different pin functions is a
> proof. This device behaves/operates/integrates differently, thus
> different compatible.

Yes, discussing with Clement, it is clear that we need 3 different 
compatibles.

> Best regards,
> Krzysztof

