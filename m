Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560F6C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 17:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sE2nwe2DjINW/dM2gZS6aKt8qAr3QCojkbk7uIqO54s=; b=5EYyBCRCDDrRKh46zGhKlyFMQH
	NquR5WvbxfDa3V1tlCXMh2xLVGBLUWCPGz1CWnIt+ybjd8edpcuPomkimKps2OlNOiXLIX97xErC7
	lR+qYyNFvLvtdNYgci2gGlxGPTCjU4zrWQGfW3Uj0EQbi1b0AI77EyRf04zBixHEih5UBPlkHYEwy
	4eGPU2iJWY1Tf6nbrlnvZHU1pIYxYxkefjdgvAqVzm5NRCgOMqC7HQ1ecDIEb9Z1c9WDpBt6lXb1X
	anOxZhdPfdKFzvZ4V5am+P6G0FCC/Nkjzu7KRgbMXxcd0vB+gl8aT4tXZttBRA9SF+sk+YIABNCej
	rqbowttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9SK-00000001iYz-3xUF;
	Mon, 03 Mar 2025 17:19:52 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9Qk-00000001iHm-25qA;
	Mon, 03 Mar 2025 17:18:15 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e50de0b5easo3293890a12.3;
        Mon, 03 Mar 2025 09:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741022292; x=1741627092; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sE2nwe2DjINW/dM2gZS6aKt8qAr3QCojkbk7uIqO54s=;
        b=g3oki97Sc2Qiod2RyBLXzm3F2WSnA3sD/4tu40A34zC7osN1VSKXYh/t1kOXcw/BA5
         yYzxqWoWXBmfyoqOJM4GP7jD9s/PIovpxFKvvHaWyNCoY2i8b06pxehgO2i6MhHg5PKF
         Tql3rlnOZ2SA2t7UJKc0y1l1Tz6EUVW+k6XgCvj0M4XZLp1WiYChzhR+LefuzGhWSI/0
         OYSh0DE3irme5S1txlHEyQJa+BdjSMucPDcce8hD59ZWcN2saPSEhIpVdBiziCy+P3F/
         EHZljN/DebH1XaHAaGYXvnpAAch46/P1euujSDANexffe0zGG9+zr4kTAXwcwthHSz/F
         3Ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741022292; x=1741627092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sE2nwe2DjINW/dM2gZS6aKt8qAr3QCojkbk7uIqO54s=;
        b=nHRQahQRCxCirXyqN35Vl/WQXYAS5cxembwxNp+aBcZqMWJcwfSff0ta2x188iin5i
         qaLS1jN7Ty8O2DNY+VNKGENymQxaero24eJo425l6s22blqrm7C8ndRbgMIwOzIgZ8hr
         kqcANpCjNq7ydMtwh5vWvBETLF7UphWbTLjqg1XXMRF6/fhmzc5Vl/v9VJcvZejNZQKM
         0Eb97/1rf/nakq53417Abai/reLx2wOGDW+rJfJYvpSO2s1mJgJwGitAnRQ+KLlgWMUP
         rRbMGmAm9xwn5I2VYE4lHlozteHDH6/j9eCuT1VWazNGii/Ye6WQzENpYb75+jSNpuBP
         NrKg==
X-Forwarded-Encrypted: i=1; AJvYcCVElQU/o8WsGtvLCRiKym54U9nbD3hk5GjrFbZr/q4jg5q+l9gAbkvGk5qa3cy4GsJAvv2pE9mjSz5Q@lists.infradead.org, AJvYcCWbdnpxesjq+8LC7MpY1qvu2d/lrs1ZokgBVuapM+IWin1S1UzqqXw5eVNrEGA/o7ujUyWPLMTx6VuoDs8ixE4v@lists.infradead.org
X-Gm-Message-State: AOJu0YxMOPQRr97KG7IZ5OGuoNWfJyd/UXYfGMI3ainev/AH75dye/Kh
	if4KHG63IyIB6nXwbTDjntqC6RARdQCJFfgJP4BtPKL5pYClXCuf
X-Gm-Gg: ASbGncuymtd1QWRV/bSrzVLKLTgi94ocmVohZ1xlTJocmTqNILga5quHXR8Cqyq7oGv
	G6kugh2dMcrM+gwssKHNli9rIhjowg5ovDQX6NkbBg0oAJ0pAs6PqjHVuVTQy+kHNOean1BBpN7
	Oko/BRwEahPEVkE1G+pRj3nbmCVn8zgUZDbrx6BcJU+5Kw1ffHdTJnNGpF7Fc4YDz03BjRZnL+1
	Zaf8CAsqNdhndAJQjsUKumkjydJzF7k34mBtpSkFYpiZbZEFQSaCuCdZkFoIeUU3B4CA3VmP189
	PfGHXShVfeBfb3OU584dFUHGwqeTwIuVKswr993G+XhgRVsNpbtYjCiS/YQNIqVMUY1/OEoCkCq
	NuHmnJpveMV9gtBkX12wuok4=
X-Google-Smtp-Source: AGHT+IHI1CoDf0zET93TFTFwi+XLCs8pimREfQejaLODOte+CXbwQ8+LefkOYFI2CcaZ0a8rBCUzIw==
X-Received: by 2002:a05:6402:2748:b0:5e5:71e:8c63 with SMTP id 4fb4d7f45d1cf-5e5071e8edemr14033147a12.15.1741022291813;
        Mon, 03 Mar 2025 09:18:11 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a55besm7022334a12.72.2025.03.03.09.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 09:18:11 -0800 (PST)
Message-ID: <9fb63a04-5b3d-40cc-b96f-eb4f297f307e@gmail.com>
Date: Mon, 3 Mar 2025 19:18:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: phy: add
 samsung,exynos2200-usbcon-phy schema file
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-4-ivo.ivanov.ivanov1@gmail.com>
 <20250224-curly-cyber-spaniel-efdc39@krzk-bin>
 <a4f63721-d094-4eda-b68a-6ef62ff54680@gmail.com>
 <c8184542-5dab-4403-bee4-867810397ae4@kernel.org>
 <4502b578-96e6-49e0-8f3b-54f6e5640c55@gmail.com>
 <354d6100-311f-44d7-b8a5-1fd671b651e3@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <354d6100-311f-44d7-b8a5-1fd671b651e3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_091814_537482_A517FBD6 
X-CRM114-Status: GOOD (  32.65  )
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

On 3/3/25 09:24, Krzysztof Kozlowski wrote:
> On 02/03/2025 10:16, Ivaylo Ivanov wrote:
>> On 2/25/25 10:11, Krzysztof Kozlowski wrote:
>>> On 24/02/2025 11:48, Ivaylo Ivanov wrote:
>>>> On 2/24/25 10:56, Krzysztof Kozlowski wrote:
>>>>> On Sun, Feb 23, 2025 at 02:22:22PM +0200, Ivaylo Ivanov wrote:
>>>>>> The Exynos2200 SoC has a USB controller PHY, which acts as an
>>>>>> intermediary between a USB controller (typically DWC3) and other PHYs
>>>>>> (UTMI, PIPE3). Add a dt-binding schema for it.
>>>>>>
>>>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>>>> ---
>>>>>>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++++++
>>>>>>  1 file changed, 76 insertions(+)
>>>>>>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>> You have undocumented dependencies which prevent merging this file.
>>>>> First, dependencies have to be clearly expressed.
>>>> They are, in the cover letter.
>>> Where? I read it twice. Dependencies is the most important thing and
>>> should scream at beginning of the cover letter, so if you bury them
>>> somewhere deep it also would not matter - just like they were missing.
>>>
>>>>> Second, you should
>>>>> rather decouple the code from header dependencies, otherwise this cannot
>>>>> be merged for current release (just use clocks with long names, without IDs).
>>>> Sure
>>>>>> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000..7d879ec8b
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>> @@ -0,0 +1,76 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Exynos2200 USB controller PHY
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>>>> +
>>>>>> +description:
>>>>>> +  Exynos2200 USB controller PHY is an intermediary between a USB controller
>>>>>> +  (typically DWC3) and other PHYs (UTMI, PIPE3).
>>>>> Isn't this the same as usbdrd phy? see: samsung,usb3-drd-phy.yaml
>>>> It's not (I think). There's a few reasons I've decided to make this separate
>>>> from the usb3-drd-phy bindings and exynos5-usbdrd driver:
>>>>
>>>> 1. This PHY does not provide UTMI and PIPE3 on its own. There's no tuning
>>> USBDRD phy does not provide UTMI and PIPE on its own either if you look
>>> at diagram - they call it phy controller.
>> Ughm. What? So in most exynos cases, there's a combination of multiple phys?
>
>>>> for them, and all that is needed from it is to disable HWACG, assert/
>>>> deassert reset and force bvalid/vbusvalid. After that SNPS eUSB2
>>>> initialization can be done and USB2 works. If the USBCON phy is not set
>>>> up before the eUSB2 one, the device hangs, so there is definitely a
>>>> dependancy between them. For PIPE3 we'd need to control the pipe3
>>>> attaching/deattaching and then initialize the synopsys USBDP combophy.
>>> Does it mean there is no USB DRD phy controller as before?
>>>
>>> Anyway the problem is you have DWC3 -> PHY -> PHY. Looks one phy too many.
>> So...
>>
>> DWC3 -> USBDRD (USBCON) -> PHYs?
> No, drop last phy. You just wrote the same as me - two phys, because
> usbdrd is the phy. In all existing designs there is no such controllable
> object from the point of view of operating system.

What? Per my understanding, the phy property should refer to whatever is
is connected to dwc3 UTMI. In this case it's the so-called USBDRD phy (called
usbcon in downstream). Considering that the eUSB2 IP definitely also has UTMI
that has to be connected to something, doesn't that mean we have clearly
separated hardware blocks? Now, I guess one could argue that this USBCON
hardware block could be classified as a syscon. But I don't see the problem
with the current binding description, nor the modelling, as it represents
how the hardware is (unless I've gotten it completely wrong).

Best regards,
Ivaylo

>
>> ...with usbdrd controller connecting and controlling the USB2 and USB3
>> phys, as well as dual role mode?
> Yes.
>
>> Well, where is the DRD part in the exynos5
>> driver?
> DRD? I believe it is part of DWC3, the same as in every other standard
> implementation of Synopsys DWC3.
>
>> I guess it does perfectly fit the job of a usbdrd controller then (if it
>> even deals with DRD). But then again,  this brings up two questions:
>> 1. Should this driver even be named exynos2200-usbcon and not, for
>> example, exynos2200-usbdrd?
> Are you sure we talk about the same thing? USBDRD is IP block in the
> Exynos and a device driver. Call your device as appropriate it is -
> based on datasheet or downstream sources.
>
>> 2. Are the exynos5-usbdrd phys really only USBDRD, or do they implement
>> USB speed functionality? What is the UTMI/PIPE3 setup for then?
> Dunno, I don't get what you mean by "exynos5-usbdrd phys really only
> USBDRD". USBDRD is just the name of the device.
>
> Best regards,
> Krzysztof


