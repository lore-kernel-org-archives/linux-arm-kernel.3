Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B07C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 19:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9u+8+2YVJl3Ilsnd+YtnFL8ROVrfZqBCKNtYohuY0U=; b=X5TdfBnLFhGj5gAW/iJjF0aiVG
	kJZLFfAWT1WFcB15pu0Ww2b3O667gHpkRDw3uquajI53a44Ts/vTdQNOxWkFY3W1b3zgPJ5PxMzOK
	egStnV6/zhSh2YxNbbxQrbSKu60XjnqZbACFICTsVlBTMGr7q6usHhf5VDZmoyyEJLM55P9liNW3P
	SgGdNdCJaK3JO8UOrLD9QH3Gm3FKEcVvk5TshqmCxANs4yTrtN27SU7G60KDYGtC/lLGuv2pSr2XI
	xr8HNidwVLBX2YahbMQintp8R8xHiPu4AgyMaNk6i4BLhK5LugB9TBsxg/gdkJdVJXXSiUV8ON9qT
	PbT7YOdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIXY-00000008f9x-0JC9;
	Wed, 12 Feb 2025 19:36:56 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIVv-00000008ejG-01UQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 19:35:16 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38f245ac38dso8114f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 11:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739388913; x=1739993713; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V9u+8+2YVJl3Ilsnd+YtnFL8ROVrfZqBCKNtYohuY0U=;
        b=hp6PgGgcVAYBOdrD9x5idcW2QKm7PqVT9vHHcJfjzZArd+AkfB35tBBdSEvKllCmT1
         PmgCikCRYG0b+dsyv62JmQNT/VI5sFfuU3Bk4pFVSFjlo5olj4V7y2vhq+xSCKviRMHG
         ONt2O+rQAL5KD6tujUQU2ImaFkVdLL7pbnEKWPzA/uJ3XuIsmq6YO/MQ2RUfSNvVQ1uR
         4oPes6KfcE+UlrCW9CnjCtvkHbQ/M8yu96r9DreRvGPOtkoAdqQwPET2lQSFjAgF2gHu
         SjzqXgte2HdUIOiBSsA0JCM/y1qVIPKdwFm/2y3MB+2/AJTc0h0bYg01bOgdDRggQJxm
         Jwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739388913; x=1739993713;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9u+8+2YVJl3Ilsnd+YtnFL8ROVrfZqBCKNtYohuY0U=;
        b=rZWEauc/eGPoQd2Fvoos46CdidlaaAhFW7edAU1jmRHNsUM8krRAvTIdyU6VNd13D3
         yKyWQSvNAt/LsmjRLyCGrjEx1i9LPw36hL1ECGUl8iaxeRElKO1aM6EJnAyiX+gu71iq
         ry6cX3PTP2U2nKVJ+QXatY2+RXo0Jap3mIBdLTkmmDSKYZQyJ9uF7QKN+915vx3YUzCI
         F8NYurtP2wd+bUYF+9GEroDYZQfnir5Hhiz1BuKeLbQjreSFXl9CzJuipP3c6oCG/6jl
         cCwmiUDIW1bAYZaWoLfVT5DXKnJkibOG7D4e3neFkgPfbJLmpqNZQKr+eg3yudwoeXIV
         I5PQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7eGYRyD3Rh5+/U31XebK3nEdNmnb6mTwiSJIsaoQcQfsm2SmTOx1M2Qq95DSbB6moY+ksWU6CMQnhfvk3KlQ4@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc43bXBR7zZvYgfiDIEtILLJykmrkNTMU49JlHs3BN14pYJu8t
	T8dyiPyeP+pExi3LNXh+LhcDr7KkIxU4VJoNG6LyQaIqYuWptomGBzVWHokKZrA=
X-Gm-Gg: ASbGnctHhWB6uUcYIcthQ+rIPnq6s4mY25MayH7RPqw1loLs1XJlhcdE32DvmIB/9KH
	GD4mizrBuf4vXh+6zqio0ImqASorRE2GC4gBoqBa06r/yoxRaqr2rWVej9JL9yzg5oR7LHeIlP7
	ABEL+TKwhPjpYRx2Tywq3EvCj11x1WsRCSbu803ZzUTFIM0ItlzsZ1l6m63Wg1gHDSUfSHBgz52
	ao11tJFoWSjWuUp1Ukiw8VXXWPf8Ow/gkWzQxK7+PaGnCde+p6jFo2RIz7mJg2tUfe2Iv11fPcp
	kHg3aVggYdd1vz97NL5AZF3DVxEuoSWovQs=
X-Google-Smtp-Source: AGHT+IHvmYsYCrXlOlRsvMDTmnRYjNfAiYpIthWGpn7AVvavUGS2FbBreXOiT0xJ3ga8piST3SgrmA==
X-Received: by 2002:a05:6000:2a6:b0:38c:5cad:1003 with SMTP id ffacd0b85a97d-38dea263aa5mr1662647f8f.5.1739388912925;
        Wed, 12 Feb 2025 11:35:12 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa7c7sm29080875e9.27.2025.02.12.11.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 11:35:11 -0800 (PST)
Message-ID: <2130b439-74d0-475d-8429-1a1b4d9738aa@linaro.org>
Date: Wed, 12 Feb 2025 20:35:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Andrew Davis <afd@ti.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
 <20250124-heavy-jaybird-of-vitality-4cbe24@krzk-bin>
 <20250124-able-beagle-of-prowess-f5eb7a@krzk-bin>
 <mocfnpebc67xegcis6tx3ekhsjcsqnvhwtipufycrtq2be4nbh@pmxhir5gmkos>
 <639b4e3a-3f68-4fba-aa33-c46dcb6fc88f@linaro.org>
 <d6252b73-0bcc-4724-8144-d6a98c8980f8@ti.com>
 <74ee6d9b-fd78-4d8a-a94f-b2c4dc794b60@linaro.org>
 <ebsbaaxyatrcikoem75t2blkhhceuidq3wnj3r2hbezfcmtc3u@ptffexrigbff>
 <f9a2247e-e0eb-4e22-8626-80e87afa9386@linaro.org>
 <qjwlppsq4eorzepvjsgjjyyaddouo5w2rjguu5c2mqesd6luwp@f426xeghy2ht>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <qjwlppsq4eorzepvjsgjjyyaddouo5w2rjguu5c2mqesd6luwp@f426xeghy2ht>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_113515_059513_0A7AB9C9 
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

On 10/02/2025 11:35, Markus Schneider-Pargmann wrote:
> On Sun, Feb 09, 2025 at 01:21:27PM +0100, Krzysztof Kozlowski wrote:
>> On 07/02/2025 15:40, Markus Schneider-Pargmann wrote:
>>> Hi Krzysztof,
>>>
>>> On Mon, Jan 27, 2025 at 01:09:49PM +0100, Krzysztof Kozlowski wrote:
>>>> On 24/01/2025 23:35, Andrew Davis wrote:
>>>>> On 1/24/25 10:48 AM, Krzysztof Kozlowski wrote:
>>>>>> On 24/01/2025 17:05, Markus Schneider-Pargmann wrote:
>>>>>>> Hi Krzysztof,
>>>>>>>
>>>>>>> On Fri, Jan 24, 2025 at 09:22:54AM +0100, Krzysztof Kozlowski wrote:
>>>>>>>> On Fri, Jan 24, 2025 at 09:19:49AM +0100, Krzysztof Kozlowski wrote:
>>>>>>>>> On Wed, Jan 22, 2025 at 11:24:33AM +0100, Markus Schneider-Pargmann wrote:
>>>>>>>>>> Add compatible for ti,am62-ddr-pmctrl to the list. There is a DDR pmctrl
>>>>>>>>>> register in the wkup-conf register space of am62a and am62p. This
>>>>>>>>>> register controls DDR power management.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>>>>>>>>>> ---
>>>>>>>>>>   Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>>>>>>>>>>   1 file changed, 2 insertions(+)
>>>>>>>>>
>>>>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>>>
>>>>>>>> Un-acked, I missed the point that you really speak in commit msg about
>>>>>>>> register and you really treat one register is a device. I assumed you
>>>>>>>> only need that register from this device, but no. That obviously is not
>>>>>>>> what this device is. Device is not a single register among 10000 others.
>>>>>>>> IOW, You do not have 10000 devices there.
>>>>>>>
>>>>>>> Do I understand you correctly that the whole register range of the
>>>>>>> wkup_conf node as seen in arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
>>>>>>> should be considered a single syscon device?
>>>>>>
>>>>>> I don't have the datasheets (and not my task to actually check this),
>>>>>> but you should probably follow datasheet. I assume it describes what is
>>>>>> the device, more or less.
>>>>>>
>>>>>> I assume entire wkup_conf is considered a device.
>>>>>>
>>>>>>>
>>>>>>> Unfortunately wkup_conf is modeled as a simple-bus with currently 5
>>>>>>> subnodes defined of which 4 of them consist of a single register. Most
>>>>>>> of them are syscon as well. So I think I can't change the simple-bus
>>>>>>> back to syscon.
>>>>>>
>>>>>> Huh... Maybe TI folks will help us understand why such design was chosen.
>>>>>>
>>>>>
>>>>> Many of the devices inside the wkup_conf are already modeled as such.
>>>>> Clocks and muxes for instance already have drivers and bindings, this
>>>>> is nothing new to TI.
>>>>>
>>>>> If we just use a blank "syscon" over the entire region we would end up
>>>>> with drivers that use phandles to the top level wkup_conf node and
>>>>> poke directly the registers they need from that space.
>>>>>
>>>>> Would you rather have
>>>>>
>>>>> some-device {
>>>>> 	ti,epwm_tbclk = <&wkup_conf>;
>>>>> }
>>>>>
>>>>> or
>>>>>
>>>>> some-device {
>>>>> 	clocks = <&epwm_tbclk 0>;
>>>>> }
>>>>
>>>> How is this comparable? These are clocks. You would have clocks property
>>>> in both cases.
>>>>
>>>>
>>>>>
>>>>> with that epwm_tbclk being a proper clock node inside wkup_conf?
>>>>> I would much prefer the second, even though the clock node
>>>>> only uses a single register. And in the first case, we would need
>>>>> to have the offset into the wkup_conf space hard-coded in the
>>>>> driver for each new SoC. Eventually all that data would need to be
>>>>> put in tables and we end up back to machine board files..
>>>>>
>>>>> I'm not saying every magic number in all drivers should
>>>>> be offloaded into DT, but there is a line somewhere between
>>>>> that and having the DT simply contain the SoC's name compatible
>>>>
>>>> That's not the question here.
>>>>
>>>>> and all other data going into the kernel. That line might be a
>>>>> personal preference, so my question back is: what is wrong
>>>>> if we do want "1000 new syscons per each register" for our
>>>>> SoCs DT?
>>>>
>>>> Because it is false representation of hardware. You do not have 1000
>>>> devices. You have only one device.
>>>>
>>>>
>>>>>
>>>>> (and the number is not 1000, scanning the kernel I can see
>>>>> the largest wkup_conf region node we have today has a grand
>>>>> total number sub-nodes of 6)
>>>>
>>>> But what is being added here is device per each register, not per feature.
>>>
>>> The register layout is like this:
>>
>> The register layout of what? How is the device called? Is datasheet
>> available anywhere?
> 
> Yes, it is available here: https://www.ti.com/de/lit/pdf/spruj16
> 
> 14 Registers
> 14.2 Device Configuration Registers
> 14.2.1 CTRL_MMR Registers
> 14.2.1.1 General Purpose Control Registers
> 14.2.1.1.3 WKUP_CTRL_MMR0 Registers
> 
> Each domain has their own set of general purpose control registers,
> CTRL_MMR for the main domain, MCU_CTRL_MMR0 for the MCU domain,
> WKUP_CTRL_MMR0 for the wakeup domain.


So according to the doc you have only one device - CTRL_MMR. All other
splits are superficial.

> 
> So I understand this to just be a collection of general purpose control
> registers. If you go by feature, then many of the registers can be
> grouped into units with a specific purpose or controlling a specific
> device which are also grouped by the offsets they represent. I assume

It could work if you have distinctive groups, but here:
1. You do not have this grouped, you just judge by yourself "oh, that's
group A, that's B".
2. Group per one register is not that.

For me this is one big block and even CLKSEL is spread all over so
cannot be really made distinctive.

> this is why the other nodes in this wkup_conf node were created. Also in

The other nodes represent some sort of fake or totally arbitrary
grouping. That's abuse of the syscon.

> my opinion this makes the relation between the original device and this
> general purpose control registers better understandable.
> 
> For this patch the ddr-pmctrl regsiter is just a single register, but it
> has the purpose of controlling the DDR device power management.

Sure, but that is NOT syscon. One register of entire block is not system
controller. The entire block is system controller.



Best regards,
Krzysztof

