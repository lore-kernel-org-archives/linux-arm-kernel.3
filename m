Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118E6D21680
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 21:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEywpXmQqNwB/TS6CB+654YlLSBuSDJ8XZY6ihxAXlI=; b=Lu6nahJiYIpoD52FdcwF2gYopy
	BRWz3m6Genx5gIKcgCEpY289/9s1lkxFBp/L3SJJRQUTd8S+qjK6VNvG4IYk/sZCEXKA0j6+y6Lm7
	J3dwK31qWqKtEFqDkdA9OMuUWjZ6RFqzyQdN5+mJcfwu9opEmso4/4UO+jQTHC2qsFZKTvEtq00je
	RXMkv2I1keLCgoy9NTRyrCRhIYYjSAo5BDdZP9qiORVqb4HwVXboicX5ocU28+Cinphp/RC3Agqpl
	qUogAoJl2VhVm2c+V6Mmtfx1OXwh25h72yGFskD59UkOzi/CAYUlu2+h2o4gwQ+Upytz1BNE3fJ9h
	awKFr+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGXG-00000008eWh-3X5t;
	Thu, 04 Dec 2025 21:06:46 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGXD-00000008eWC-1Ew4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 21:06:44 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so1627068b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 13:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764882402; x=1765487202; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cEywpXmQqNwB/TS6CB+654YlLSBuSDJ8XZY6ihxAXlI=;
        b=eseeSzxD7HLURqBoeCmQytrCefEBK7pytE/7uPMwwtIBVSMv3RjYMANdNQErxEMS8E
         fNbUF7VP/jlfH18ea1dShWSmrU1Bh9GTnyFI2knkYo7Kf/pKDxMVLy76jdk1IDgJS2Bb
         63SLaMf2oTAqpyl1trqGJpdmD6yjr5R5mlUQNmorVtKtG7JAtcOw6g+pU2KMEXr8Sys1
         tZqy9v72fjzkVBKEIPSg/W3bXx5Tqaj7hNXIptzdaE+RgTXKdy971q5YDCH1L0ZlnOHv
         XbdmuczBDdPJuJUSq1OL/tVjDAYlchG/1xw+d0XoYBxr8bAqyR31dfCi5QPcZsP/CmoN
         CGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764882402; x=1765487202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEywpXmQqNwB/TS6CB+654YlLSBuSDJ8XZY6ihxAXlI=;
        b=FVHOiyZL2Faya4EAgJr/HFZTrhEdXgi7BlDjAOY6PNfZjlIGXmEpBoOEZWixLrHdcu
         Z1pErj/Ycvmnz86ygtf4A73zUrm7AjmZ93Rz2C65VgCZwgxQA2bmQvz4dWKvnFY9cCIi
         Eziqld9Wm+Dy/Zx9G8KoT0Du8DQpSV5dw+yJ4cKF4q3ri0aM/3JbhzEA4NfxoY/kQrQG
         06pwBfDcLCovhVE2Sv2cSM9U7Dz0FWtyXhl8cfu8KlqYHAuWj5JMvy3KPVw9owXUtp8s
         YDy8T33ILc5jUICmWGAnpoVXaKhE5AE0RtFRUmvc+i3Ydzvc6Kzdr1bvCfdqAWchTw/a
         51Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXaClhlThX8rwpGp9DJVnZtvTBd5iHIz1QUKaN1MESCuHWI6qG2cHu1DJbA6WSaklKoBDNICW9wlUDNiTWENpF8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8uk/K4CxFvMaGN7tPe7+6HE0fyj4xZC2cJH0vuztsFkFNvk91
	gVfov/hY6sb67GtX0Xg7v2GFp+iqoIMu+bGMWp6vaMBJjyB2FfwicK2V2BvbQaThHA==
X-Gm-Gg: ASbGncusRCOFfW41WMbSChuVd2BwMtGxTmu7yoVdcDN2xv/ZL8huFk8V2gpgLtF/Hw0
	b6gUIcodb/vmCnP9iF1/uruBKGVIroG0CjX+nSaX73gtwQyayrZtEf1GSB+RWb5E24TkBs2VN9E
	BuOumQTgnejza0CTvo/vtzaoVGp+yo8BUVVRn4HCrmpEHGeu86SSrfGn4vXBZSZ9fO/MvcCGGnl
	AWLrhs0FslRzjHmfqUbSvA/5yBUpAazEQKCzcdXPH+KaC5kotpRuMjdF+qglljyfUVKKe9WIhVQ
	lk65j/V5/rZukHzU9nH/PQ4UesvzHLtehCK/wsv9VCKnb0aLplVYa00YrZb5sYWMJ0Xudnln5G/
	+L6GGbGk7K9LjDpbSfPN19BRDcGOOhbJPc+2Lbd9KosOFgmOiTk17BCQOEqegjtMWR91pXFskyt
	u2Cqy28p6jt4DOxcJVzbbRac0FljPPy8fX0qk/h3Hx3yrEbc859fo7ebXYgPaPEm1E9MPxE9zaT
	hq2lazdV73yJQ==
X-Google-Smtp-Source: AGHT+IHnjdg9J5Dv3DjKTAgPlUY1x6NH1Rmw5oo9i+e3bENd1vNzyqMp5aLbF57/RFRsp96OPvtSGQ==
X-Received: by 2002:a05:6a20:12ca:b0:347:9ae1:cffb with SMTP id adf61e73a8af0-363f5db7158mr9697293637.24.1764882401346;
        Thu, 04 Dec 2025 13:06:41 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:d11d:bcc2:2743:bf88? ([2a00:79e0:2e7c:8:d11d:bcc2:2743:bf88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf817c3e6c3sm1857768a12.17.2025.12.04.13.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 13:06:40 -0800 (PST)
Message-ID: <19e501f4-da1b-4a91-8681-da78922bc302@google.com>
Date: Thu, 4 Dec 2025 13:06:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: power: supply: Add Maxim MAX77759
 charger
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-1-6b2e4b8f7f54@google.com>
 <d4455f4b-2a0f-4bc0-b897-14f2e27af3ea@kernel.org>
 <c9b059f8-9219-4219-95c8-23a3733fea58@google.com>
 <20251125-amorphous-bobcat-of-whirlwind-afdab1@kuoka>
 <7ad91325-e881-461d-b39e-6ff15d98b3c5@google.com>
 <076777c3-b238-4d1d-a11b-602027348ee4@kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <076777c3-b238-4d1d-a11b-602027348ee4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_130643_347986_BEE20BA5 
X-CRM114-Status: GOOD (  26.66  )
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


On 12/2/25 5:00 AM, Krzysztof Kozlowski wrote:
> On 26/11/2025 00:48, Amit Sunil Dhamne wrote:
>> On 11/25/25 1:56 AM, Krzysztof Kozlowski wrote:
>>> On Sun, Nov 23, 2025 at 06:34:05PM -0800, Amit Sunil Dhamne wrote:
>>>> Hi Krzysztof,
>>>>
>>>> On 11/23/25 1:28 AM, Krzysztof Kozlowski wrote:
>>>>> On 23/11/2025 09:35, Amit Sunil Dhamne via B4 Relay wrote:
>>>>>> From: Amit Sunil Dhamne <amitsd@google.com>
>>>>>>
>>>>>> Add bindings for Maxim max77759 charger device.
>>>>>>
>>>>>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>>>>>> ---
>>>>>>    .../power/supply/maxim,max77759-charger.yaml       | 36 ++++++++++++++++++++++
>>>>>>    1 file changed, 36 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..71f866419774
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
>>>>>> @@ -0,0 +1,36 @@
>>>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/power/supply/maxim,max77759-charger.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Maxim Integrated MAX77759 Battery charger
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Amit Sunil Dhamne <amitsd@google.com>
>>>>>> +
>>>>>> +description: |
>>>>>> +  This module is part of the MAX77759 PMIC. For additional information, see
>>>>>> +  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
>>>>>> +
>>>>>> +  The Maxim MAX77759 is a dual input switch mode battery charger for portable
>>>>>> +  applications. It supports wired and wireless charging and can operate in buck
>>>>>> +  and boost mode.
>>>>>> +
>>>>>> +allOf:
>>>>>> +  - $ref: power-supply.yaml#
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: maxim,max77759-charger
>>>>>> +
>>>>> This should be just folded into parent node, no need for separate
>>>>> charger device or is just incomplete.
>>>> Thanks for the review! You are right, the binding is incomplete. This
>>>> charger block actually listens on its own I2C address, distinct from the
>>>> main PMIC.
>>>>
>>>> I will update v2 to include the reg property. I will also add the
>>> AFAIK, the main (parent) device schema does not reference children via
>>> any sort of addressing, so reg here would not be suitable.
>> I agree that currently nvmem and gpio devices (which are children of
>> PMIC device) are not referenced using any address. But I was guessing
>> that's because they share the i2c client id with the PMIC and sharing
>> its address space (implied).
>>
>> The charger device while being part of the MAX77759 PMIC package has
>> it's own i2c client id and address space that's why I proposed "reg".
>> The underlying assumption I made was separate client id implies that a
>> "reg" property required. But maybe that's incorrect.
>>
>> I can understand the argument against having a "reg" property. As the
>> i2c client id will remain same for a max77759 charger device (as it's a
>> chip property and not a board property) it will always remain a
>> constant. I will drop the "reg" proposal.
>>
>>
>>>> standard properties `constant-charge-current-max-microamp` and
>>>> `constant-charge-voltage-max-microvolt` to configure the hardware
>>>> limits, as this charger device does not manage the battery profile
>>>> directly (that is handled by a separate fuel gauge).
>>> Well, still, what's the benefit for the bindings to have it as a
>>> separate child? Kind of depends on your example, which is quite small -
>>> one regulator and supply. Grow the example with battery and other
>>> independent resources (if they are) to justify it. Or show arguments why
>>> this is re-usable.
>> The primary reasons for keeping the charger as a distinct child node are
>> to model the hardware topology for the power supply subsystem and to
> You do not need children for that at all.

Actually what you said makes sense. I will fold the charger's schema 
into mfd/maxim,max77759's schema.


Thanks,

Amit

>> house the OTG regulator provided by the charger block.
>> The charger needs to be referenced by the Fuel Gauge (which handles the
>> battery profile) via power-supplies. Additionally, the charger block
>> provides a regulator for USB OTG VBUS, which is cleaner to represent as
>> a child node of the charger rather than mixing it into the top-level
>> PMIC node.
> Sorry but argument that you need a child device to be able to construct
> a phandle is just wrong. You can create phandles on every other way as well.
>
>
> Best regards,
> Krzysztof

