Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FF1C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42qeGfPPG3Jy7TK8jhUurPhAnYCLeXZebkDWKVesGp8=; b=nJ+aYm7obzH50M21tkaks2ue/e
	mOPEZqaIVOqGSyj2Kfpdo/0uuujIuzc6mETOjJRRqvEelGAH/EA5Ifc/IkoArzuyC/SRcJFNsrHsl
	Hj71SNca0CJGMr12ADO5fPnRbIu4TDnel+KsAHPocjVpUXJXNvbUEinz8K2Hw5n2V9MH2MManT7e+
	aFD2+GZxbPQtLCoSHPFi7O4fVC3TnNmMkcxWLZY9X6ElzJn4uHCve5KR7temyKzs7fBIoUFLQgPWQ
	SxrQ1tsFspBJ4Y34uSC2WxACS6u4MdVKQOO4t3ZL3UCqGVJ+VpzhqipRSxo+LukLFYJ9DjeYKzDAt
	qWj6k+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1gy-00000007Rp2-0n9S;
	Tue, 10 Jun 2025 16:19:16 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOz8z-00000006zgD-3RNz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:36:03 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLF7Y032713;
	Tue, 10 Jun 2025 15:35:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	42qeGfPPG3Jy7TK8jhUurPhAnYCLeXZebkDWKVesGp8=; b=6WUHSa73SzuDwV+S
	TnHceYDj6QtlhgnwIjJFSqEPVZV/NELe5/hM+nEMjhe205l0mg3+ZHgnKeiRPcWb
	Q8GqAQNLUvn2jf5pmrSGbz6K61eM5T2Rn1cyoIo4kuEn8WdsUugpp2W3OcbKmfL1
	XD8zE9KrTm2b1mdoErCSlrhGeNDxNhkcc2NRnlHYW/b3a9cU8BgBRzBjeik9Ta1g
	o5Z/NRI2lP0GZpt0v8t1mUzeehlGQ28N28ZQtUToVPIxdVDc+JfI5FRU813vvj4x
	xxxmbP2+hoMbFzbrUDx61zVjD9VglNArYLkrmHUt8lbnr1o04MbQVJwePkiQUcwU
	4zl3JA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4750cnt341-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 15:35:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5A9E140045;
	Tue, 10 Jun 2025 15:34:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F44EB5F91C;
	Tue, 10 Jun 2025 15:33:54 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 15:33:53 +0200
Message-ID: <a49d0af2-07b7-4f51-941b-fa25b2879720@foss.st.com>
Date: Tue, 10 Jun 2025 15:33:52 +0200
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
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <7000f63e-5e68-465d-9d7f-1a6ca0524222@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_063602_131673_2BF8A1EC 
X-CRM114-Status: GOOD (  14.97  )
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

On 6/10/25 14:38, Krzysztof Kozlowski wrote:
> On 10/06/2025 14:02, Clement LE GOFFIC wrote:
>> On 5/29/25 11:01, Krzysztof Kozlowski wrote:
>>> On 28/05/2025 14:14, Clement LE GOFFIC wrote:
>>>>>
>>>>>> +		};
>>>>>> +
>>>>>> +		hdp: pinctrl@5002a000 {
>>>>>> +			compatible = "st,stm32mp131-hdp";
>>>>>> +			reg = <0x5002a000 0x400>;
>>>>>> +			clocks = <&rcc HDP>;
>>>>>>     			status = "disabled";
>>>>>
>>>>> Why are you disabling it? What is missing?
>>>>
>>>> Nothing is missing just disabled by default.
>>>> The node is then enabled when needed in board's dts file.
>>> Nodes should not be disabled by default if they are complete. That's why
>>> I asked what is missing. Drop.
>>
>> Hi Krzysztof, OK I better understand now.
>> So yes the 'pinctrl-*' properties which are board dependent are lacking.
> 
> These are not properties of this node.

Does this mean I should add 'pinctrl-*' properties in bindings yaml file ?
I don't get it..

>>
>> In the last patch of my serie I add them (only for stm32mp157f-dk2) but
>> keep it disabled because the pin is on an external connector (the
>> Arduino connector of the board).
>> This prevent any issue with a possible connected module.
> 
> Not relevant. Pin control for connector are board specific, but pinctrl
> SoC part is SoC.

I think we don't understand each other here too. I don't understand the 
end of your sentence "pinctrl SoC part is SoC".

Maybe some informations that could help:
The 'pinctrl-*' properties are used in the HDP case to select the 
internal signal to output AND the alternate function on the pin to 
output the HDP function.

> Best regards,
> Krzysztof


