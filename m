Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078ADC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 10:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ms1fXKBupaGUiTVwfpWkhQXNp7DZ3MoY67STQUr4Cz0=; b=m6AuI8oCLtPYDeTAE93zluHaqV
	i4sF/8fYNH9voYYSQ1nb4yKt1dgnuQ12jJqCCqPONh6D9oWcc3ZQVKJXdh8hgeAYD6dRM7PVSgllK
	YSE5h2xFWN+igm0oFtqJ+PyZlpNeydV3KOeXMXGs8X61mKYBN/riTvvU6rGgaPk3KXvEsryU+pwIq
	ZFuoURdmgMN5Oo7wTIpb8tcdtg1B77U8SMGQ0C09hD2Ad3dd8vuV8zgYMZiaycI/nIXvBf3oUBzvT
	x3L8abw11NEhp9CgWBub1N7p6L00KEVlgMUsiDhnW0/k2wIHcQQHgfkllxYQQ3WlrMeSbjJ61fpw9
	Dp569qxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQLQ-000000095kK-1dXL;
	Mon, 12 May 2025 10:25:12 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPlJ-00000008zMJ-30mW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 09:47:55 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C89UDZ025832;
	Mon, 12 May 2025 11:47:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Ms1fXKBupaGUiTVwfpWkhQXNp7DZ3MoY67STQUr4Cz0=; b=Ch9GgUxcId6fh8Xc
	XJy6kWTfTo6e0vHXJT3NUg9ODni8+jIS/QH2/6yWN1W6Qz2TtyZoc9cbKlsH5smy
	60vb5l9FLxVIubuvqaQTSitfCj0DuLrd4iP6XLxERxahAudIurp6crhLigYk+wIB
	nJcv3O8PpXRFJXN32k7CFD3ydXKc9HA9U2mNb5sUg91aFNzga+aJJ/GBRr8i1wu6
	82tte6GhGgbrmcUytT1rLg9rSJIBxQXrRYdzoSf/41wN4tMVD0dw4WlBM5xU75Cp
	lmZPjqm+dWSvSe6DofUy0xWDq/FGsGS+Epx2zeBOaTroAEir/DhBBafe/c9pJeKc
	9u0lXQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46hv7kphdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:47:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B8A5740081;
	Mon, 12 May 2025 11:46:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92923ABE2DA;
	Mon, 12 May 2025 11:45:18 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 11:45:17 +0200
Message-ID: <66fb604a-ce90-41c4-9ce9-26fa1d81e0d2@foss.st.com>
Date: Mon, 12 May 2025 11:45:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] ARM: dts: stm32: add initial support for
 stm32mp157-ultra-fly-sbc board
To: Goran Radenovic <goran.radni@gmail.com>, Andrew Lunn <andrew@lunn.ch>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?=
	<boerge.struempfel@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250505115827.29593-1-goran.radni@gmail.com>
 <20250505115827.29593-5-goran.radni@gmail.com>
 <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
 <63665c17-da37-4b5b-9c2d-28d5a669680f@gmail.com>
 <3a7ef1bd-2c0e-4637-b0b6-2c0b73388618@lunn.ch>
 <35c08d79-1473-4c1e-b605-627c4ff00a92@gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <35c08d79-1473-4c1e-b605-627c4ff00a92@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_03,2025-05-09_01,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_024754_588000_1533A238 
X-CRM114-Status: GOOD (  15.53  )
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

Hi Goran

On 5/8/25 15:10, Goran Radenovic wrote:
> Hi Andrew,
> 
> thank You once again for helpful hint.
> 
> Andrew Lunn wrote:
>>>>> +    phy-handle = <&phy1>;
>>>>> +
>>>>> +    mdio {
>>>>> +        #address-cells = <1>;
>>>>> +        #size-cells = <0>;
>>>>> +        compatible = "snps,dwmac-mdio";
>>>>> +        phy1: ethernet-phy@1 {
>>>>> +            reg = <1>;
>>>>> +            interrupt-parent = <&gpiod>;
>>>>> +            interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
>>>> PHY interrupts are 99% time level, not edge.
>>> That is correct, but I am facing strange behavior, when I set
>>> IRQ_TYPE_LEVEL_LOW.
>>> My board stops booting at:
>>>
>>> [    2.343233] Waiting for root device /dev/mmcblk0p4...
>>> [   12.638818] platform 5a006000.usbphyc: deferred probe pending
>>> [   12.643192] platform 49000000.usb-otg: deferred probe pending
>>> [   12.649029] platform 48003000.adc: deferred probe pending
>>> [   12.654277] platform 5800d000.usb: deferred probe pending
>>> [   12.659744] platform 5800c000.usb: deferred probe pending
>>> [   12.665089] amba 58005000.mmc: deferred probe pending
>>> [   12.670239] amba 58007000.mmc: deferred probe pending
>>> [   12.675185] platform 50025000.vrefbuf: deferred probe pending
>>>
>>> I must investigate this. If You have any idea, You are welcome to 
>>> share it.
>> Could be an interrupt storm. The interrupt is not getting cleared
>> because of something missing in the PHY driver, so it just fires again
>> and again.
> 
> After a brief investigation, I tend to agree with your assessment that 
> the issue lies in the driver—likely the stmmac driver — which is outside 
> the scope of my changes.

No, the mdio node is driven by stmmac driver. The issue was maybe more 
linked between pinctrl driver / exti driver where the level trigger is 
probably not well managed (gpio is level but exti driver manage edge 
interrupt). When saw those defering probes, EXTI drivers and pinctrl 
drivers were well probed ?

> 
> Therefore, I would suggest keeping IRQ_TYPE_EDGE_FALLING for now, or 
> alternatively not using a hardware IRQ at all and falling back to 
> polling, as done in stm32mp15xx-dkx.dtsi.
> 
> Best regards,
> Goran

