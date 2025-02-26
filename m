Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59EDC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZb1xMqSNQN2PP8hwkcWMj27cX0fMVgLYG7qNf4LP2k=; b=sJBqJC91/HAYI6Y/qist9vnwdC
	q5fvysEvb6JgwljsY++I+XvhF/v77s0/0Wm9nuVmxHQrgNfORXOf83BCH/48w98ug+o3y34r5iLsw
	SMk5UaTWr2CwZLfCV7uo3Np5bPq0Hz6gSLQPWy0Ny2ehClB+KqkiMV9sZ9Pg65vanDaMIe6mj+W8X
	/5iWofBT95keWfEX3nuq/xDv915ySEaYaqYQdY45R4tvqpXFAmrRPuEbUj4+cdi2TQtlcL+WPHSsA
	T+lfag74JA7Tzk215cys/k1ZqL/gcKRdm6tdWZxRQK0bi9Twokd5rUjDqPUi64xtfWAWQnVKzqGt/
	uJXxD7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKwc-00000004eoi-31e7;
	Wed, 26 Feb 2025 17:11:38 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKju-00000004c4r-0ina
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:58:31 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QFX00h022198;
	Wed, 26 Feb 2025 17:58:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	IZb1xMqSNQN2PP8hwkcWMj27cX0fMVgLYG7qNf4LP2k=; b=5ieszlWO2WceWL1Z
	kY3yIkTr3K8hw6CaL11JmkPDIpVrhkPUTKcIPekxJ4OCKEgiYXenDfTxzL1wlkri
	sCdIxRI7jXt2k9zlqSwUWry3id0Q1Oj08yRg/yMQlATGxsiVs8Jt8I00xjQMuTkJ
	oN+xyKiaIKf+IkgKNyEPBJkqvRysw9ADuzpeivaRJC40Cy3r7eprTXaUKc7Zw4Dp
	z1ziDbdYuMW+MnvMQcocohzAQvUJHXP8Cjyt4bsaKWswEhyUC8J6PoybXAPb1CGc
	e+WuNlw2jEJ/DGH7ceAC8SZSuakxLuvl3dXD5qk7auZDszK+5dr5p/Ck1a9jP94K
	Eld91g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psrdy1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 17:58:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 87D8540063;
	Wed, 26 Feb 2025 17:57:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79595484FF1;
	Wed, 26 Feb 2025 16:30:20 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 16:30:19 +0100
Message-ID: <8cdc7e52-f9e2-4fc9-be68-0dd72a25ee1b@foss.st.com>
Date: Wed, 26 Feb 2025 16:30:19 +0100
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
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <55beb3e7-65ac-4145-adae-fb064378c78d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_085830_513020_87CD663D 
X-CRM114-Status: GOOD (  17.50  )
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



On 2/26/25 16:08, Krzysztof Kozlowski wrote:
> On 26/02/2025 10:33, Alexandre TORGUE wrote:
>>>>>> +		hdp: pinctrl@44090000 {
>>>>>> +			compatible = "st,stm32mp-hdp";
>>>>>
>>>>> So here again - you have stm32mp251 SoC, but use entirely different
>>>>> compatible.
>>>>
>>>> Ok so I will use "st,stm32mp15-hdp"
>>>
>>>
>>> This means this is stm32mp15 SoC. I do not see such SoC on list of your
>>> SoCs in bindings. What's more, there are no bindings for other SoC
>>> components for stm32mp15!
>>
>> Yes stm32mp15 is not a "real SoC". I agree that at the beginning of the
>> STM32 story we didn't have a clear rule/view to correctly naming our
>> compatible. We tried to improve the situation to avoid compatible like
>> "st,stm32", "st,stm32mp" or "st,stm32mp1". So we introduced
>> "st,stm32mp13", "st,stm32mp15" or "st,stm32mp25" for new drivers. So yes
>> it represents a SoC family and not a real SoC. We haven't had much
>> negative feedback it.
>>
>> But, if it's not clean to do it in this way, lets define SoC compatible
>> for any new driver.
> 
> Compatibles are for hardware.
> 
>> For the HDP case it is: "st,stm32mp157" and used for STM32MP13,
>> STM32MP15 end STM32MP25 SoC families (if driver is the same for all
>> those SoCs).
> 
> No, it's three compatibles, because you have three SoCs. BTW, writing
> bindings (and online resources and previous reviews and my talks) are
> saying that, so we do not ask for anything new here, anything different.
> At least not new when looking at last 5 years, because 10 years ago many
> rules were relaxed...

So adding 3 times the same IP in 3 different SoCs implies to have 3 
different compatibles. So each time we use this same IP in a new SoC, we 
have to add a new compatible. My (wrong) understanding was: as we have 
the same IP (same hardware) in each SoC we have the same compatible (and 
IP integration differences (clocks, interrupts) are handled by DT 
properties.

> 
> 
> Best regards,
> Krzysztof

