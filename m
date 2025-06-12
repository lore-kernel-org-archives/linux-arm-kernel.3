Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07435C71149
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgUlRHqrOgjoIr0Ken2L714FlmdoDE0xA4Gj6ELLtuY=; b=vpXJV12J87H2+K4N9XY1NYW3+P
	Vch7iyBfJ2YmMqAioiyc1Th1b3/e1GnqsqzTXa1+jv3HGoQfpEru6YQfT/kz6RNg87t225DQtcb9P
	tkRo6xDjjCXsarZS4VJzfctdtoISZWLrp7S6FLd1uFyxUPzG01mk2bqWTMb5x2dQEmNwNHUH+wuLH
	Db5c/euLJVH99UUVMsglEidsbi8l5o+nZ0JQzLv1n0JpWdBbcMZxHaYmTHUy5ruexNKGRiMxpCyUW
	mTZboXy3/kkDmh3P1ZMl3gIj8gMV3zzN1rqG7yDbO9Aw8ftHOsHCX9pTMLKniHyY/iDXxkaPp/ELq
	lwTRCvsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnmt-0000000EDg1-3ocm;
	Thu, 12 Jun 2025 19:40:36 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhbi-0000000DKCI-41ai
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:04:40 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CCNNFN024136;
	Thu, 12 Jun 2025 15:04:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	xgUlRHqrOgjoIr0Ken2L714FlmdoDE0xA4Gj6ELLtuY=; b=dAr2YaZ1sX7fLlr4
	qIJtWMwLwt0MLr5MHKrK4dGxNw2ETtYSi2iYYwSjgJZZoe7pu6Z+FpxLYIBC65q3
	L1k3ToqJl2w+O1gIIrkuVi019NXuGoI9O3N4usFcC5H0VJ04v+YKi0Wt+KSLFvcE
	CfY+NKdw6gDnJBQzWSJbgR/k9OXf8x8yDRURcNI3AjzX+IKF8+ckI186VtX0KcMf
	PvdvxvbE3AMPswfPQnoAkr7+IEo2KufhY2qBSXbAcEloo32YVEjy1rkV91/uTPzZ
	E26qrJcRhDoyF2IyPgTlg1+/WiPEo0e5aGdOhElP4bIZyobA+ELz89Y42Fm/Uumd
	c2a2nA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs30j8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 15:04:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 903E240071;
	Thu, 12 Jun 2025 15:03:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 80866AFB28F;
	Thu, 12 Jun 2025 15:02:16 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 15:02:15 +0200
Message-ID: <782763e2-99d6-4533-b0db-79b618577586@foss.st.com>
Date: Thu, 12 Jun 2025 15:02:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp13
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-5-bd6ca199466a@foss.st.com>
 <5b7a2102-ff68-4aab-a88d-0c4f9195ef95@kernel.org>
 <3c868c4b-8a0e-44b5-9d6e-3a0526d9deeb@foss.st.com>
 <3ba588ed-1614-4877-b6fc-b5aa853b8c2e@kernel.org>
 <714ad17d-53f1-4703-8e13-61c290a8da89@foss.st.com>
 <7000f63e-5e68-465d-9d7f-1a6ca0524222@kernel.org>
 <a49d0af2-07b7-4f51-941b-fa25b2879720@foss.st.com>
 <42a0b7ab-d85d-4d52-a263-4a4648c7ff05@kernel.org>
 <2865ab3a-1c20-4951-8132-4be98d73d70e@foss.st.com>
 <f1a63830-0533-4f1c-9116-32e8c1e61a8b@kernel.org>
 <26a4f12a-2295-402e-8e31-45733aa6582d@foss.st.com>
 <4f31f016-d250-41ea-b613-b074b8ea00d1@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <4f31f016-d250-41ea-b613-b074b8ea00d1@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_08,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_060439_492572_8F90C16C 
X-CRM114-Status: GOOD (  23.29  )
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

On 6/12/25 13:05, Krzysztof Kozlowski wrote:
> On 12/06/2025 11:31, Clement LE GOFFIC wrote:
>> On 6/11/25 17:48, Krzysztof Kozlowski wrote:
>>> On 11/06/2025 16:08, Clement LE GOFFIC wrote:
>>>> On 6/11/25 08:35, Krzysztof Kozlowski wrote:
>>>>> On 10/06/2025 15:33, Clement LE GOFFIC wrote:
>>>>>> On 6/10/25 14:38, Krzysztof Kozlowski wrote:
>>>>>>> On 10/06/2025 14:02, Clement LE GOFFIC wrote:
>>>>>>>> On 5/29/25 11:01, Krzysztof Kozlowski wrote:
>>>>>>>>> On 28/05/2025 14:14, Clement LE GOFFIC wrote:
>>>>>>>>>>>
>>>>>>>>>>>> +		};
>>>>>>>>>>>> +
>>>>>>>>>>>> +		hdp: pinctrl@5002a000 {
>>>>>>>>>>>> +			compatible = "st,stm32mp131-hdp";
>>>>>>>>>>>> +			reg = <0x5002a000 0x400>;
>>>>>>>>>>>> +			clocks = <&rcc HDP>;
>>>>>>>>>>>>        			status = "disabled";
>>>>>>>>>>>
>>>>>>>>>>> Why are you disabling it? What is missing?
>>>>>>>>>>
>>>>>>>>>> Nothing is missing just disabled by default.
>>>>>>>>>> The node is then enabled when needed in board's dts file.
>>>>>>>>> Nodes should not be disabled by default if they are complete. That's why
>>>>>>>>> I asked what is missing. Drop.
>>>>>>>>
>>>>>>>> Hi Krzysztof, OK I better understand now.
>>>>>>>> So yes the 'pinctrl-*' properties which are board dependent are lacking.
>>>>>>>
>>>>>>> These are not properties of this node.
>>>>>>
>>>>>> Does this mean I should add 'pinctrl-*' properties in bindings yaml file ?
>>>>>> I don't get it..
>>>>>
>>>>> These properties have no meaning here, so the hardware description is
>>>>> complete. You claim that you miss them thus device is incomplete is just
>>>>> not correct: these properties do not belong here! They belong to the
>>>>> board but even there they are totally optional. Why would they be a
>>>>> required resource?
>>>>>
>>>>> To remind: we talk here ONLY about required resources.
>>>>
>>>> Yes, 'pinctrl-*' properties belongs to the board and are not required.
>>>> So nothing is missing.
>>>>
>>>> This hdp node in the SoC dtsi file can be enabled by default.
>>>> But the hdp driver will probe and do nothing because without the
>>>> 'pinctrl-*' properties from the board files it would not be able to
>>>> access to any pin.
>>>
>>>
>>> Pinctrl has other features in general, including interfaces to userspace
>>> (as pretty often combined with gpio, although not sure if relevant here).
>>
>> You're right. Also HDP pinctrl has a GPO feature accessible from userspace.
>> But by default the HDP is not connected to any pad; it needs the board
> 
> OK, then that was the answer to my first question - what is missing.
> However aren't these pads connected internally also to other parts of
> the SoC (like in most other vendors)?

No, HDP "output pads" are only connected to SoC pinctrl to route outside 
the internal SoC signals for debug purpose.

>> 'pinctrl-*' properties to configure the SoC pinctrl and expose HDP on
>> the SoC pads.
>>
>> That's why for me the enabling of the driver should be in the board file
>> together with the SoC pinctrl configuration.
> 
> And what are the default pad settings configured by HPD driver in
> bootloader (and by bootloader I mean one of few bootloaders this is
> going to be used on like U-Boot)

The default is to use the GPIO of the SoC pinctrl. The HDP is not routed 
outside.
  >>
>> The userland cannot change the pinctrl alternate function mux, this is
>> statically defined by the devicetree.
> 
> If you expose GPIO then userland needs this regardless of alternate mux.
> IOW, board level could not configure mux because it should be always
> configured to safe GPIO input.

For userland sight view, SoC GPIO are preferred instead of HDP.
HDP is only GPO not GPIO. 'pinctrl-*' properties configure at the same 
time the SoC pinctrl mux to HDP and the HDP pinctrl mux to one of the 
HDP functions (e.g. GPO).

Best regards,
Clément

