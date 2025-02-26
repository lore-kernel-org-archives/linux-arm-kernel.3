Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086D3C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 18:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rG1C6cXlzhh7ZHVodv74JTH3XP7VRDVgNV9VI18sWQA=; b=B959ApAY6c7Q9Ko9iN1VqxT3us
	rOgYMvYLopYHVRFx+9n2GajclJiYdjkAijeNVpGbo376EX/MljruK3+fWVrQbI4QmvR3y4f3mHeeF
	JYS4eXYGXqRf3iSU55+xRXLL/Ia1b2U0p78G/dgOz3L4nLh0miIdRVcRCxEeiFYYoYVXQwjTYjooj
	W4C529juwGCp+2N9xuW63rP0ANzSgewnVM58SFJ+3xWOMxX/0CtHmSRnTmMQSVSiZXYjXCL0xCn5q
	359AtTpZ4NSbJPWZbQ97mFc3pOKpsZe+riMzbxiONqb/WSJB5fn1z5m+fwRvqMxW3hTqy4b5tgm2V
	H3x+MVUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLtC-00000004s84-1nsF;
	Wed, 26 Feb 2025 18:12:10 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLrV-00000004qpm-3E6P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 18:10:27 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QFHewT022188;
	Wed, 26 Feb 2025 19:10:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	rG1C6cXlzhh7ZHVodv74JTH3XP7VRDVgNV9VI18sWQA=; b=3yKEGCAk+JFFurwh
	A/VoQvxQfCKgGyaGnzIscwH3s+avLqtQF9jyGAM7Q8HJo1+YCqdsXZAMdn8BP6u/
	CeXYiF+QLc6DLfZWZr0z2+xXkt5/4va74qko67jNOQgFE6cDu8BFXGe+0EmG7kSY
	cTEDQGf4LYCbfka9Mb/BNB7kEMSiZon8GDaI0vs3xl8EZtCv4EiqcP1gjNirbfk2
	qWlBZj0kXIRiWf8ZTnl0oKuRrc/VFvJ4rDL7FbLciaLu+5Xcv16F26YZY2+P5bAe
	6zbx1fpBdjFOxQQruEsjc5SyOeM+AMyApBDu9C1ch9uB4RUvlydBagM5dlqsKkat
	06y4xA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psrea92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 19:10:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 86625400C8;
	Wed, 26 Feb 2025 19:09:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10BB54FF132;
	Wed, 26 Feb 2025 17:54:13 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 17:54:12 +0100
Message-ID: <248f63ff-b6ec-4f58-8a96-7aee2fcd6038@foss.st.com>
Date: Wed, 26 Feb 2025 17:54:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp25
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
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
Content-Language: en-US
In-Reply-To: <8cdc7e52-f9e2-4fc9-be68-0dd72a25ee1b@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_101026_400462_23DD774F 
X-CRM114-Status: GOOD (  17.48  )
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



On 2/26/25 16:30, Alexandre TORGUE wrote:
> 
> 
> On 2/26/25 16:08, Krzysztof Kozlowski wrote:
>> On 26/02/2025 10:33, Alexandre TORGUE wrote:
>>>>>>> +        hdp: pinctrl@44090000 {
>>>>>>> +            compatible = "st,stm32mp-hdp";
>>>>>>
>>>>>> So here again - you have stm32mp251 SoC, but use entirely different
>>>>>> compatible.
>>>>>
>>>>> Ok so I will use "st,stm32mp15-hdp"
>>>>
>>>>
>>>> This means this is stm32mp15 SoC. I do not see such SoC on list of your
>>>> SoCs in bindings. What's more, there are no bindings for other SoC
>>>> components for stm32mp15!
>>>
>>> Yes stm32mp15 is not a "real SoC". I agree that at the beginning of the
>>> STM32 story we didn't have a clear rule/view to correctly naming our
>>> compatible. We tried to improve the situation to avoid compatible like
>>> "st,stm32", "st,stm32mp" or "st,stm32mp1". So we introduced
>>> "st,stm32mp13", "st,stm32mp15" or "st,stm32mp25" for new drivers. So yes
>>> it represents a SoC family and not a real SoC. We haven't had much
>>> negative feedback it.
>>>
>>> But, if it's not clean to do it in this way, lets define SoC compatible
>>> for any new driver.
>>
>> Compatibles are for hardware.
>>
>>> For the HDP case it is: "st,stm32mp157" and used for STM32MP13,
>>> STM32MP15 end STM32MP25 SoC families (if driver is the same for all
>>> those SoCs).
>>
>> No, it's three compatibles, because you have three SoCs. BTW, writing
>> bindings (and online resources and previous reviews and my talks) are
>> saying that, so we do not ask for anything new here, anything different.
>> At least not new when looking at last 5 years, because 10 years ago many
>> rules were relaxed...
> 
> So adding 3 times the same IP in 3 different SoCs implies to have 3 
> different compatibles. So each time we use this same IP in a new SoC, we 
> have to add a new compatible. My (wrong) understanding was: as we have 
> the same IP (same hardware) in each SoC we have the same compatible (and 
> IP integration differences (clocks, interrupts) are handled by DT 
> properties.

Just to complete, reading the Linux kernel doc, as device are same we 
will use fallbacks like this:

MP15: compatible = "st,stm32mp151-hdp";
MP13: compatible = "st,stm32mp131-hdp", "st,stm32mp151-hdp";
MP25: compatible = "st,stm32mp251-hdp", "st,stm32mp151-hdp";

> 
>>
>>
>> Best regards,
>> Krzysztof

