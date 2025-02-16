Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71A8C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 18:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6THbQSx/8fAHe9PzsDdfiskI2J1Cdkq06AblUO8EgA=; b=a19q+2tDHUo95wZ9BHDRMhpLCK
	0opbNKvugJQPVarrl51Of5o/Y9qxFeKu4By4AUpoI7yyZCjGz5dVcsGVtYl8VRmHVCaQEZzsanuk/
	4NW1AmglA6tx0iMqi2fTJ0EG2VbfnUkvcOa9dxaSxNiNqVridi8kddoPGZEwQSxcAxd9KQ8xZ9lQm
	Zk7+iYYQ2y0x0jt3/nQJWyY1rBHHqlQAUvGRFqACfzpkBId51UUR6XPOMlxyMqxfsQ43GgQor5+q6
	1kyBkWxZs7ISssNAx6sXtGENQ25YLIBmpjmpKYNq6wnBMHfAo34kgjbHTjKgXRa+u5Cz2h4li+wZX
	UtznuBaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjMf-00000002KjB-2i18;
	Sun, 16 Feb 2025 18:27:37 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjL9-00000002KT1-3Ilw;
	Sun, 16 Feb 2025 18:26:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4396a24118dso21271455e9.0;
        Sun, 16 Feb 2025 10:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739730362; x=1740335162; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G6THbQSx/8fAHe9PzsDdfiskI2J1Cdkq06AblUO8EgA=;
        b=cr86Pb8mgS+HphLaS6dKTIMebOy2sgLWsw+g7YyiUNm+Tg6725w+zCixHzfL1WV9np
         fM+OK1V8OAoqvoHovV92pw3BZmrdxSmEyTusFnFW9WpsHXFz41TbHacgRxSCxLOmXH7C
         ch/elxas4Hzg7FmPAi6Be5qBDrZQGj/rMDYbNwywQQAHBqI0RGLX1BtlVOJy1BC8jXOD
         a1Cb4uMNDdO8JKjqv181/HyZ0snt3tFRgdIzntZxYyE2j3KzAWZov8hNKK+qcT9Yggw4
         AB5xpcE8PrYMZHLn14+wqjSlLlfbyerGo3RM/bGx+c2I8g0v4nX3Y7IZDAmEXI6s0ps0
         S+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739730362; x=1740335162;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6THbQSx/8fAHe9PzsDdfiskI2J1Cdkq06AblUO8EgA=;
        b=aVkCcbAZVe7EMA3YJSePw0etWG5arnbUs4XpBhw2q0xWXKYUn600UMEtuGF+OztUdE
         Vr/QCyud8KuAz3DDpVFFBPzWcN/oLZe4s0+KKNwQRi96TqX72o2HstxYgVWRHRTUQPVw
         hYL3WWwV9rGbK7vzgpWIz0OCktIc155sUMoCLkYUDONcz1GfXA2NhANbZJ6wsqRu7qyj
         5cccRJiDjzp/GR5dSYs80UjvF7XLZWA2o2vdsZSuT+KeXlU5oCjzWhoKTlFW9AxIioZP
         WjjKg9UfKIh/wBmg1H9ELV8JlvnPwQPdctnLGF2rPJEv+XpX0Uu8Ks7jEmHfpaouUUhu
         eO3A==
X-Forwarded-Encrypted: i=1; AJvYcCVAqg2feUx3hY/NDPJFaEIJZwCGajHwa4rPOYuNM5W3WjfE+Zw6nQ0xlcvr08i6wFQFvpj4iJqikFA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhHeUAPhFSEkBYQUx4bz/+nxWmJ8qYf1i6gpOu39vhQTb7+IJ3
	W+VeyVOcLNmC9bGK9MUNg7tTm1XS1gTTs5fmkU5J4y8/dY2xMT2q
X-Gm-Gg: ASbGncuxMa7AOFwbOnbtuJL5JnKO1kmyRe+dzLro4uru9nRsyBKlupEPsg+rnFZyVIr
	WjzSKMK1EsKEqn+lVIRqUvWpvmmdn7tzjmUGtoaLFYZzS1lhcUCHp3rjK478ChsJiY93rvv6RJm
	UzdkEDLPIuuIu+Jp/ApTFlsut92yRUnn5QwufYQtgD1msdvEePuJ6TZM4qYbaFWjTXpgmKy8kfB
	0iabTHsVO8r56jhV0zm+dnJJdIW0J8zFWaOSyBw3dMD/dP077n6byV1v0+F4XFgJ1UXbWL29FzF
	8ifCF600DrgUKv4nnxhWAg/nteL7Pae+VBNK/CIwrzSmYAmXWCwBCE2/KTmL0DDJaw1WFw==
X-Google-Smtp-Source: AGHT+IGr42oNfHQVVm7EhzTuFuuHWgflwzxpqf7PlmDhyAn8X5YOs8yIU+uV1nWQeu6T0SPpjYT2CA==
X-Received: by 2002:adf:f9cc:0:b0:38f:231a:635e with SMTP id ffacd0b85a97d-38f33f2c2cbmr6494370f8f.25.1739730361813;
        Sun, 16 Feb 2025 10:26:01 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7df2sm10192625f8f.84.2025.02.16.10.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 10:26:01 -0800 (PST)
Message-ID: <aede22df-8930-4854-8269-6cb12b8fb2b8@gmail.com>
Date: Sun, 16 Feb 2025 20:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215122409.162810-4-ivo.ivanov.ivanov1@gmail.com>
 <a10f8a77-9440-477d-b6f6-9d651e3ab49a@kernel.org>
 <537698af-841f-48e7-bd7c-4077d0a240a1@gmail.com>
 <9b58a985-3d63-42bb-9a76-e5b04a4b6012@kernel.org>
 <f3d38b63-dc97-482e-aeac-b59e65f91424@gmail.com>
 <065ea296-480c-4ac4-bb4a-0fc2915b59f1@kernel.org>
 <cc6fc19e-cdcb-42bb-ba68-555cb8a9cbf5@gmail.com>
In-Reply-To: <cc6fc19e-cdcb-42bb-ba68-555cb8a9cbf5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_102603_831676_2009F25E 
X-CRM114-Status: GOOD (  27.49  )
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

On 2/16/25 15:57, Ivaylo Ivanov wrote:
> On 2/16/25 15:19, Krzysztof Kozlowski wrote:
>> On 16/02/2025 10:51, Ivaylo Ivanov wrote:
>>>>>>  You need to
>>>>>> integrate the changes, not create duplicated driver.
>>>>> I can do that, but it would be come a bit cluttered, won't it? Depends on
>>>>> if we want to follow the current oem-provided initialization sequence, or
>>>>> try and fully reuse what we have in there.
>>>> I think it duplicates a lot, so it won't be clutter. We have many
>>>> drivers having common code and per-variant ops.
>>> So the approach to take here is to make a common driver?
>> For example: one common module and two modules per each soc, because I
>> assume some per-soc stuff might be needed. But maybe even these two
>> modules are not necessary and everything could be in one driver.
...
>
> So, Exynos2200 has a much simpler eusb initialization sequence than what
> is present in mainline for QCOMs. I still don't really think the drivers
> should be merged, as we aren't really duplicating code per-say.
>
> I've already started working on merging them, and my current idea is to
> not redefine the registers once again for 2200, but rather make an enum
> that defines if the SoC is a QCOM or EXYNOS, and select the register
> offsets dynamically

Never mind. That's a bad idea - after more digging way too much bits differ
not just the register layout. I'll implement the init/exit sequence in the
qcom driver separately. Sadly I can't reuse much code.

Best regards,
Ivaylo

>  - similarly as how I did with USIv1. If a register
> offset is not present, it'd just not do the write. My guess is that this
> will make it work with the qualcomm init sequence as well, so it'd result
> in even less redundant code (apart from the eUSB tuning, which can be
> omitted for now).
>
>>> What about the current modelling scheme, as-in taking the phandle to
>>> the usbcon phy and handling it?
>> What about it? 
> As I said in the commit description, I'm passing the USBCON phy as a
> phandle to the eusb2 node and enabling/disabling it when needed. I'm
> not 100% sure it would be adequate to include that in a common snps EUSB
> driver, as it seems to more of a quirk with the exynoses. But then how
> can I model it so that it's correctly described according to how the
> hardware works (as-in usbcon "muxing" between child phys, in this case
> eUSB and snps USBDP combophy)
>
> Regarding repeaters, I still don't have the TI repeater implemented.
>
> Best regards,
> Ivaylo
>
>> Did you look at the bindings of qcom snps eusb2? Are you
>> saying you do not have here repeater? If so, then this phy phandle might
>> not be correct.
>>
>>
>>
>> Best regards,
>> Krzysztof


