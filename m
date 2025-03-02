Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79BFC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 09:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gt4e/Q1bzVAKDz/zUzGYf19qKql6n2SPXCwUMfSa3zM=; b=esK1zq0nbWwqOixC+SKnbJ1oo+
	lQkFnwhK5bQmj4gHb5NGlg4kNpVf4S3CHheTZPBURBC0X/t3wU9aLhEV2anQmrHcnd0dgYEQbFnc0
	+YCh8BL3+y9WtmMQGsa8sXuej7BzIO7oQfTtVxVSZ7u8M4/6T8nvA2NqSUN+R4RQdsgtF/TS1IlqG
	Snf5iXnCGWNjYHQ2QXxdkGgxMctGgCyFLM6XdkWlawSwznFdZhBve9aixkc8QnCA3qyyD7GhUP+Ic
	ApWrIpVNnU6j6ZztlULdiRZ6vg8iQUpAXqRQSXvUlqDpYg6EO6QlswMu6FGWPznEPZV4IPBAcJrs+
	DTKKeITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tofSm-0000000FiNj-1JTE;
	Sun, 02 Mar 2025 09:18:20 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tofRD-0000000FiI6-1m2o;
	Sun, 02 Mar 2025 09:16:44 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-abf628d653eso98701566b.0;
        Sun, 02 Mar 2025 01:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740907001; x=1741511801; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gt4e/Q1bzVAKDz/zUzGYf19qKql6n2SPXCwUMfSa3zM=;
        b=iCVKxwtDgnMy5oAQeJzROHS7Ag5mzXDe62evYrMihIDaRjjhtfvNBPEqz3mHW3wPNE
         GOcUtYtaPSv89/7O2zhBLlBA4ilKV5nIpRwk+ayjuLdvnviGJt/vbZHXE9LM8awPHxjc
         oMVt+cm1WzxYX9F1oU/aueisWdLUR+mEYEuy9FbBjAw73dRbvVD02FbGMtddn4Qnr3sA
         KBpUtHoZopbPtg8pKPcmVj9N6meZSW6wwliK/vhBrZNO2jhXR1joglGdT8bBJJ8WXbO7
         VrpeqL1G1QgrJSwUI8KhluxreZwNjCG2z8Lzhz+2T4HgpFi94KCjxCVkSP5guuRBg08q
         y/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740907001; x=1741511801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gt4e/Q1bzVAKDz/zUzGYf19qKql6n2SPXCwUMfSa3zM=;
        b=E+lcBR4X7jEtugOSBSNu17uCYomDnfLIXb3at6tigRt3bp3oJ/f0W/CHgH7WdkdXLf
         t3m7V7nb12bL4WpCnP+uSLqbhW7i/Pz/E0DHAnJaLYJl7GSa9GWTAMrWV5+DVUM0atYh
         6XVPeepzTEnhHApLlxoSJc6sEVT/R5zMRY1C+giFcwqlFLSfLIHL2+ZnwipKs7gaeZF9
         OvngL34inc6uTa0MC0orIqP61BiY5EXy8+01Qdnergs74U4cTV0LplxsPoHB0KaHY1yI
         neCr4NEcjlurcl+y40Ye70wH1I3wWoQsuWIAmlvk5EH7DIjSmFNrVcnY3glOxpFyrZ5W
         Q+jw==
X-Forwarded-Encrypted: i=1; AJvYcCW7Uq0ehoFiqTE5Aqraj/uwR1UC1N+123VwXpjQJh5Q0A4Ghhhky6Xt4o6IkREkbL3GlqCH8QrNcpjK@lists.infradead.org, AJvYcCWIRHKUk8db0ZdPDBFuAP0ZgvZxSycqKoCGXcHat2YHxFUtgE1hY3x3gVTa1u92T8kgfseLPq3NMM6hN0+B5c13@lists.infradead.org
X-Gm-Message-State: AOJu0YxKlRJTWIlG8DGtevzAhkprxnFi0+GN/gikrB8uDlUP8ZcCrCkz
	naRFfWWXzk1Sqs5CR5mkbV2PJLIigUiFspJaGUpmO4t00AaE7ggr
X-Gm-Gg: ASbGnctn09XAnhk/WnqbYxKeLhS44L0K5rlS+XxbVOjJ5UhoviPeauewMdrDTDWEX2Y
	rSMJlU75nuKp2nPTzHeSh5uIp8MhToNHBhQ+HC7Zv9Wjexca9uCAuSiNzCMDJ/EaJEcF3VcRtha
	tR0krM4YjLFwvBx9zayIJ8DfIOAcSNOnlf9kVweOOTFN81pHgF2Y+YeYHSCZXu1UM8f0byq2siC
	LZcK+VKkwF8cZS3DZPHnSVivFYsDK48IjJI/AZAXaJQ6TGPXLBz5gyFxhnQjiNg21tGSJZv7CTa
	F+ZZSnBvOtG0h/E7kFxMYTzL7ud5gVn/tVeXOUrStt6j/zXKPly4M+p1wxiEM91DE1D62J/mmi7
	lXwjlLknB3hqOZsd5ap+/gH0=
X-Google-Smtp-Source: AGHT+IEYSDw2sP7Dh+Z2pA1UtfA1dKfkOfTidFVCkHLXhYUdHVMwVkHLto91nPU2C2aCCuTbWanVJQ==
X-Received: by 2002:a17:907:3f22:b0:abe:c3a8:7aa2 with SMTP id a640c23a62f3a-abf268228c1mr1096068066b.46.1740907000673;
        Sun, 02 Mar 2025 01:16:40 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c6ee49dsm624648366b.105.2025.03.02.01.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 01:16:39 -0800 (PST)
Message-ID: <4502b578-96e6-49e0-8f3b-54f6e5640c55@gmail.com>
Date: Sun, 2 Mar 2025 11:16:38 +0200
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
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <c8184542-5dab-4403-bee4-867810397ae4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_011643_481134_FD2B0BAC 
X-CRM114-Status: GOOD (  28.40  )
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

On 2/25/25 10:11, Krzysztof Kozlowski wrote:
> On 24/02/2025 11:48, Ivaylo Ivanov wrote:
>> On 2/24/25 10:56, Krzysztof Kozlowski wrote:
>>> On Sun, Feb 23, 2025 at 02:22:22PM +0200, Ivaylo Ivanov wrote:
>>>> The Exynos2200 SoC has a USB controller PHY, which acts as an
>>>> intermediary between a USB controller (typically DWC3) and other PHYs
>>>> (UTMI, PIPE3). Add a dt-binding schema for it.
>>>>
>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>> ---
>>>>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++++++
>>>>  1 file changed, 76 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>> You have undocumented dependencies which prevent merging this file.
>>> First, dependencies have to be clearly expressed.
>> They are, in the cover letter.
> Where? I read it twice. Dependencies is the most important thing and
> should scream at beginning of the cover letter, so if you bury them
> somewhere deep it also would not matter - just like they were missing.
>
>>> Second, you should
>>> rather decouple the code from header dependencies, otherwise this cannot
>>> be merged for current release (just use clocks with long names, without IDs).
>> Sure
>
>>>> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>> new file mode 100644
>>>> index 000000000..7d879ec8b
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>> @@ -0,0 +1,76 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Exynos2200 USB controller PHY
>>>> +
>>>> +maintainers:
>>>> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>> +
>>>> +description:
>>>> +  Exynos2200 USB controller PHY is an intermediary between a USB controller
>>>> +  (typically DWC3) and other PHYs (UTMI, PIPE3).
>>> Isn't this the same as usbdrd phy? see: samsung,usb3-drd-phy.yaml
>> It's not (I think). There's a few reasons I've decided to make this separate
>> from the usb3-drd-phy bindings and exynos5-usbdrd driver:
>>
>> 1. This PHY does not provide UTMI and PIPE3 on its own. There's no tuning
> USBDRD phy does not provide UTMI and PIPE on its own either if you look
> at diagram - they call it phy controller.

Ughm. What? So in most exynos cases, there's a combination of multiple phys?

>
>> for them, and all that is needed from it is to disable HWACG, assert/
>> deassert reset and force bvalid/vbusvalid. After that SNPS eUSB2
>> initialization can be done and USB2 works. If the USBCON phy is not set
>> up before the eUSB2 one, the device hangs, so there is definitely a
>> dependancy between them. For PIPE3 we'd need to control the pipe3
>> attaching/deattaching and then initialize the synopsys USBDP combophy.
> Does it mean there is no USB DRD phy controller as before?
>
> Anyway the problem is you have DWC3 -> PHY -> PHY. Looks one phy too many.

So...

DWC3 -> USBDRD (USBCON) -> PHYs?

...with usbdrd controller connecting and controlling the USB2 and USB3
phys, as well as dual role mode? Well, where is the DRD part in the exynos5
driver?

I guess it does perfectly fit the job of a usbdrd controller then (if it
even deals with DRD). But then again,  this brings up two questions:
1. Should this driver even be named exynos2200-usbcon and not, for
example, exynos2200-usbdrd?
2. Are the exynos5-usbdrd phys really only USBDRD, or do they implement
USB speed functionality? What is the UTMI/PIPE3 setup for then?

ps: dealing with this without any documentations sucks.

Best regards,
Ivaylo

>
>
>> 2. With the way it's modelled, we need to parse phandles from eUSB2 and
>> USBDP to the controller. Adding that to the usbdrd driver would be...
>> weird. It makes more sense to model it as a separate driver, because
>> it functions in a different way.
> Just to be clear: we don't talk about drivers here.
>
>
> Best regards,
> Krzysztof


