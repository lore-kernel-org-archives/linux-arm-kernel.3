Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC17C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUJhQaYNJ+KP9IjzaIHtUMcbg4p7nFeoB9PoVn3AGzE=; b=zmBi0fWCIc3hIkWrTTbxgA6f0s
	mbQ6a50p1wuvdvWiftFIUgjxGb/t/p8fA7YXkJS7v6D3lBxEcpYfMX9b9Ato2WsxL2LvpEG1CPd31
	nP38OVcWb7eWchH3owp8CWkc6RiWm36rC7Re+aQ3E8WaAE4XqeR6tGLJqIY6OKLO2E4GcyMH58yok
	6WrzuwcZ3HTKuQfidBQBWmMX/9Y5sgIH1aVjsuahbK8JGoNsBSbKw2tmG4769S3g2318tB+Ywu89c
	jPs/onyVRoR67HfL7qrUtX1FslkzaSF0uWhj184OzWatuMiDBtwibKLWVGWztlrsz3yVZauuS9wPp
	J62lNYxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOJL-00000003nvN-39SI;
	Tue, 04 Mar 2025 09:11:35 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOHP-00000003nWY-3O6J;
	Tue, 04 Mar 2025 09:09:37 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-abf5f4e82caso475370166b.1;
        Tue, 04 Mar 2025 01:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741079374; x=1741684174; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tUJhQaYNJ+KP9IjzaIHtUMcbg4p7nFeoB9PoVn3AGzE=;
        b=PHGsvk+FqIT+eoqWxZQ9Of4e1jcKrnr/Zqd8jixdb/nJiWsySsfOUz/GmiBIzfPBrs
         rUR/+1r1MQWwhkiS+lLbMiTostvdJSmK9wtIXcHTCSf5Ox0Mywu5Cuizv61BKp3onXMK
         CBGfZZUVw9jaoZ2pvm7XaCwASsqW4HhBUWPBXFeLxvXqnen+GFx0IADtd4QxqYE+sMzm
         g3o5+cXZ0ZvNT0xTC8vKabiyPFETV4AKugtnC/ULA2hwqwCSQ+GbCmrj+dWgtT/b7vnd
         PiFEpvYZIKJjxs2LbidrVajbyWYGaxrNSxzZ2LHKJptVP/1tm+ipRzuioOM0txtWshvh
         5J8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741079374; x=1741684174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUJhQaYNJ+KP9IjzaIHtUMcbg4p7nFeoB9PoVn3AGzE=;
        b=sLKJy4GE2hZNuZohcWU6tbPA2ZWpZe0D1VtYcmdpCHYCEMZalDy2alPuFTHcBKpJBV
         Kj7TCMPuYlrg7CwMQfXvY/E6c6L08+8AUeOQ46YMVJCI1vawSqLwBEEe+3p3ocCwurs2
         oO8jHHqZlOt1gE4c4fVjMD96eYe2by3B287R0nqimXV1ydEb+b5QOqkf4aK8I3evNZYe
         60QtKtifW6sEtJ9cK9CfJQZVLXyMQgoMMZ+yeU0SWvD5MjGs3IYQbXX6D3rNgiWvu8rv
         +0IlLF9rhUOO/g9bK56wfg3t0btRcD11PkiK5oYBYGXWx0g8izWkfFHUBtpaQ2i6LYPd
         KtcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5DtYsm9HIh58cIdlBGCV7vicC6PsYsWKxEMS4LrxK1y4RWdCkLy/1ebfyUTQGWPMcp2xpSCQi8Bkr3y9vT6FV@lists.infradead.org, AJvYcCX9lgIMrGGbkovaSPvbv++oWw4uR2RSkT2EJ4MW3J3bS9cWOPlJ7i+DMHFflC6RtAe/fusVSsp0Syn0@lists.infradead.org
X-Gm-Message-State: AOJu0YzsXXihlSQmAosAqY7Nnpsuc7+0ONZKaQbt6b58YO6qvH1QI9Dz
	TQ4MP5tw25hUPw5WrSf7wum8blEGyTUG//QtAzpgtCRykvKnnc3S
X-Gm-Gg: ASbGncvcM0RiJQC3Vuiqyt0kyigaUR2NhGrLkoN0Jz4ec3/yd7LzzMoSYdH9vPue6i5
	HYpfEi+EfBs6geBpUkxtXGCwBlFbAqgw87CO8L8onn3dXwGV2higSmmKB4iC8c/6Ncuya4oIuv5
	YfblnE7jEEQE0A2QUectIYMkEnLugKqGP66F6nmSH/XVLiIbCS89HhquiiZh50KojZZCghqIJYe
	/llnkvWk7XPiP3bv7d2dYQrClTFUOnxQGentchRMQhmQwl94cZAn4gumyshFv6llhhiUJwwQSaK
	0H6q5Tq+FHocCN6a5Yi5oyJAOnZd8XwgaRSp3ZcHPkO0Pk0pQqkbiR7Tzs0=
X-Google-Smtp-Source: AGHT+IH6P2PZuxm+2sKzdyVK3yViDvKypolcGeIQSD9E5vIhDHGm27LOpDLzkoiZ0cOSnYMoTvPPYw==
X-Received: by 2002:a17:907:9812:b0:ac1:f162:fb0d with SMTP id a640c23a62f3a-ac1f1631229mr242134566b.37.1741079373793;
        Tue, 04 Mar 2025 01:09:33 -0800 (PST)
Received: from [192.168.43.21] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf75481eb4sm343379066b.83.2025.03.04.01.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 01:09:33 -0800 (PST)
Message-ID: <21460de5-76a0-4576-a7e6-f4873e40de48@gmail.com>
Date: Tue, 4 Mar 2025 11:09:31 +0200
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
 <9fb63a04-5b3d-40cc-b96f-eb4f297f307e@gmail.com>
 <027decb4-3fa9-40a5-9cf4-65f9a69b4566@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <027decb4-3fa9-40a5-9cf4-65f9a69b4566@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_010935_851432_35528D33 
X-CRM114-Status: GOOD (  34.23  )
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

On 3/4/25 09:21, Krzysztof Kozlowski wrote:
> On 03/03/2025 18:18, Ivaylo Ivanov wrote:
>> On 3/3/25 09:24, Krzysztof Kozlowski wrote:
>>> On 02/03/2025 10:16, Ivaylo Ivanov wrote:
>>>> On 2/25/25 10:11, Krzysztof Kozlowski wrote:
>>>>> On 24/02/2025 11:48, Ivaylo Ivanov wrote:
>>>>>> On 2/24/25 10:56, Krzysztof Kozlowski wrote:
>>>>>>> On Sun, Feb 23, 2025 at 02:22:22PM +0200, Ivaylo Ivanov wrote:
>>>>>>>> The Exynos2200 SoC has a USB controller PHY, which acts as an
>>>>>>>> intermediary between a USB controller (typically DWC3) and other PHYs
>>>>>>>> (UTMI, PIPE3). Add a dt-binding schema for it.
>>>>>>>>
>>>>>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>>>>>> ---
>>>>>>>>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++++++
>>>>>>>>  1 file changed, 76 insertions(+)
>>>>>>>>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>>> You have undocumented dependencies which prevent merging this file.
>>>>>>> First, dependencies have to be clearly expressed.
>>>>>> They are, in the cover letter.
>>>>> Where? I read it twice. Dependencies is the most important thing and
>>>>> should scream at beginning of the cover letter, so if you bury them
>>>>> somewhere deep it also would not matter - just like they were missing.
>>>>>
>>>>>>> Second, you should
>>>>>>> rather decouple the code from header dependencies, otherwise this cannot
>>>>>>> be merged for current release (just use clocks with long names, without IDs).
>>>>>> Sure
>>>>>>>> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000..7d879ec8b
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>>>> @@ -0,0 +1,76 @@
>>>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>>>> +%YAML 1.2
>>>>>>>> +---
>>>>>>>> +$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>>> +
>>>>>>>> +title: Exynos2200 USB controller PHY
>>>>>>>> +
>>>>>>>> +maintainers:
>>>>>>>> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>>>>>> +
>>>>>>>> +description:
>>>>>>>> +  Exynos2200 USB controller PHY is an intermediary between a USB controller
>>>>>>>> +  (typically DWC3) and other PHYs (UTMI, PIPE3).
>>>>>>> Isn't this the same as usbdrd phy? see: samsung,usb3-drd-phy.yaml
>>>>>> It's not (I think). There's a few reasons I've decided to make this separate
>>>>>> from the usb3-drd-phy bindings and exynos5-usbdrd driver:
>>>>>>
>>>>>> 1. This PHY does not provide UTMI and PIPE3 on its own. There's no tuning
>>>>> USBDRD phy does not provide UTMI and PIPE on its own either if you look
>>>>> at diagram - they call it phy controller.
>>>> Ughm. What? So in most exynos cases, there's a combination of multiple phys?
>>>>>> for them, and all that is needed from it is to disable HWACG, assert/
>>>>>> deassert reset and force bvalid/vbusvalid. After that SNPS eUSB2
>>>>>> initialization can be done and USB2 works. If the USBCON phy is not set
>>>>>> up before the eUSB2 one, the device hangs, so there is definitely a
>>>>>> dependancy between them. For PIPE3 we'd need to control the pipe3
>>>>>> attaching/deattaching and then initialize the synopsys USBDP combophy.
>>>>> Does it mean there is no USB DRD phy controller as before?
>>>>>
>>>>> Anyway the problem is you have DWC3 -> PHY -> PHY. Looks one phy too many.
>>>> So...
>>>>
>>>> DWC3 -> USBDRD (USBCON) -> PHYs?
>>> No, drop last phy. You just wrote the same as me - two phys, because
>>> usbdrd is the phy. In all existing designs there is no such controllable
>>> object from the point of view of operating system.
>> What? Per my understanding, the phy property should refer to whatever is
>> is connected to dwc3 UTMI. In this case it's the so-called USBDRD phy (called
>> usbcon in downstream). Considering that the eUSB2 IP definitely also has UTMI
>> that has to be connected to something, doesn't that mean we have clearly
> The entire point is that eUSB2 is connected to DWC3, no? That's exactly
> how it is done for example on Qualcomm SoC. Otherwise you claim that
> DWC3 controls one phy, which controls another phy which controls UTMI...

But where does the USBCON fit? Is it just a side controller? Why's it needed
in the first place? This is what I don't understand.

>
>> separated hardware blocks? Now, I guess one could argue that this USBCON
>> hardware block could be classified as a syscon. But I don't see the problem
>> with the current binding description, nor the modelling, as it represents
>> how the hardware is (unless I've gotten it completely wrong).
> It is the first time you use argument that it represents how the
> hardware is and this is what we actually disagree. It is not like that.
> You do not have chain of phys. Just look at any USB 3.0 DRD DWC diagram
> from any Samsung SoC: where would you squeeze these two phys in relation
> to what is called there "USB 3.0 PHY" which would be the third phy (!!!).

Yeah, my point was that it was different from any previous design. Now,
I don't know if it's actually theoretically possible to design it like so. It's
hard to just guess how the hardware is designed without having access
to die shots, documentations or even just schematics.

Let's make it clear now, the changes your request are to document USBCON
in the existing exynos binding, as well as to correct all explanations of how
this block functions, right?

Best regards,
Ivaylo

>
> Best regards,
> Krzysztof


