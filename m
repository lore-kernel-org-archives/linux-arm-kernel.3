Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923A9D2AB1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 10:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjBBOufzswfPzjN88tjgJvguTz0vPy0qYODLjS59384=; b=x/e2IecLz7UI0TwDC8Z6WzziLn
	6aRnxc8uAsHg75nODCSUYichevPCG6lgo4LC241VbGoScU8CF8R0/33hVzhQls1HlVUW7SQeHY4bv
	6dW8I/uLejUraEaWdDFR/UYflxV5k3RjZK/b9Uws1hk5qidSvwV+b8krHuVvcrXoTuCjOFV0w7bY8
	3TkCJKOvL2ifuWuz6FYc+omuJXRJOejOLjGtszyQzHdGbkZOyt2+9SqbgZWgY5RcOGWkIvngnbbay
	Sb1ntVYbgh30mqgGZzIUpZr0PYadCIjfQN/qwYhSC55NXyh2A8WAjjDj439D8GCH0czbPpGGDW8D3
	98Nb6sEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jh2-0000000E50u-3mt1;
	Tue, 29 Oct 2024 10:43:21 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jQX-0000000E1uF-1SVS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:26:18 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-539e3f35268so6219358e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730197575; x=1730802375; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UjBBOufzswfPzjN88tjgJvguTz0vPy0qYODLjS59384=;
        b=jeSFnZCLBQnfmeRY1I0n9UiqpSBd7RUsAYUDkl0q4oYeBdgIUawxXB0PvLgjoI9Ue9
         4KEoCDqiFAGRhg3s0Vu0qvY80M59+PwTLZ4c7Nu8hYqs1KEKD+8S3aqUCL7AtGJQhFXH
         9/cAaio/rT+O36eKcq+4IYdBGg/P0P8kdGLM+rnEMOOS3DyPiA2HQvTb8dmgXn6PG4Yi
         9mdYDKeLLX0gVhOhRXn+Mhs932YXTuvI3Cg/aEkNI+EYPEVQ3xF7oYXsXH8CiMYpIAZE
         sQitjXqbPWRBpuLVLaKq6QRI4CJITgg0fboTX2hSj3aiPHKCrebr0U1BJhUFzFPmwUOy
         PSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730197575; x=1730802375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UjBBOufzswfPzjN88tjgJvguTz0vPy0qYODLjS59384=;
        b=khrTTfzBZ07eHgvUBoH8lgyQTXZg/Cu53bhplazFHePZD5WkZ8X5oF3lf/FjHAeqbp
         CKqn2gTusCgB8aZLyNvmB9vJDmVI/TAEPkx5sHv1s0szCpIeaKzb+QZZl0ehYJ0FzMff
         +Ph5UETA0PPeDWZ1LZLMHCK6GpTxTcSJUi7zDAW6bw/yllgGwuLnx+ygRQ3GVKMaDkH8
         vVTm8/0i9BtK4dqOeR7sKuLmOFzBnTjrXn6Cv2/ifxz6imrpI6uomouQXOtOm5KavgAY
         CO/BdqnG46s0azsgw7abDuZJz1prz/rfTkgxDxBVKwxxvg6WXIKHjs756dNAFoYb+tJ8
         HSsg==
X-Forwarded-Encrypted: i=1; AJvYcCU8uRHS/pzd/VB9X5/XTXHx92OVWaZ3w8ASrFfjqhizbS2XRtPM8iEKgyuzIWuvd6okyH0ixQSEsd/ZD/e2vDz6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4F0t1QeLNU3CZaD6JSKoC2a6FkCHb+NekyMPP0hQYgX2GxNmf
	RUcz8/MUE7FAU+TDJFDOpY+NUiLDrNLNQffPgI79r1TIzanO8WLL
X-Google-Smtp-Source: AGHT+IFSaVE8Bb2ztypg1vV5TPaMkpmoxaGxHP7ZN6Sh+HLWct1YR8ykARX3BL3Ag/JAqyp24gXrDw==
X-Received: by 2002:ac2:4bc5:0:b0:539:8bde:eb90 with SMTP id 2adb3069b0e04-53b348deb87mr5516093e87.32.1730197575158;
        Tue, 29 Oct 2024 03:26:15 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a670sm1323272e87.20.2024.10.29.03.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 03:26:13 -0700 (PDT)
Message-ID: <6dcd724a-a55c-4cba-a45b-21e76b1973b0@gmail.com>
Date: Tue, 29 Oct 2024 12:26:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: dts: imx: Add devicetree for Kobo Clara 2E
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, imx@lists.linux.dev,
 sre@kernel.org
References: <20241024142206.411336-1-andreas@kemnade.info>
 <20241024142206.411336-3-andreas@kemnade.info>
 <f2bb661d-8ef5-43d4-aece-c7fec01ff9fe@gmail.com>
 <20241029094402.382594c5@akair>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20241029094402.382594c5@akair>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_032617_427328_8D4191E9 
X-CRM114-Status: GOOD (  35.98  )
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

On 29/10/2024 10:44, Andreas Kemnade wrote:
> Am Tue, 29 Oct 2024 09:53:33 +0200
> schrieb Matti Vaittinen <mazziesaccount@gmail.com>:
> 
>> On 24/10/2024 17:22, Andreas Kemnade wrote:
>>> Adds a devicetree for the Kobo Clara 2E Ebook reader. It is based
>>> on boards marked with "37NB-E60K2M+4A2" or "37NB-E60K2M+4B0". It is
>>> equipped with an i.MX6SLL SoC.
>>>
>>> Expected to work:
>>>     - Buttons
>>>     - Wifi
>>>     - Bluetooth
>>>       (if Wifi is initialized first, driver does not handle
>>> regulators yet)
>>>     - LED
>>>     - uSD
>>>     - USB
>>>     - RTC
>>>     - Touchscreen
>>>
>>> Add human-readable comments for devices without mainlined driver and
>>> binding. Such comments can e.g. be help to find testers if someone
>>> starts to work on the missing drivers.
>>>
>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>
>> ...
>>
>>> +
>>> +	pmic@4b {
>>> +		compatible = "rohm,bd71879", "rohm,bd71828";
>>> +		reg = <0x4b>;
>>> +		pinctrl-names = "default";
>>> +		pinctrl-0 = <&pinctrl_bd71828>;
>>> +
>>> +		interrupt-parent = <&gpio4>;
>>> +		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
>>> +		system-power-controller;
>>> +
>>> +		clocks = <&clks 0>;
>>> +		#clock-cells = <0>;
>>> +		clock-output-names = "bd71828-32k-out";
>>> +
>>> +		gpio-controller;
>>> +		#gpio-cells = <2>;
>>> +		gpio-reserved-ranges = <0 1>, <2 1>;
>>> +
>>> +		rohm,charger-sense-resistor-ohms = <30000000>;
>>
>> Well, now that I got this out - I suppose this could be
>> rohm,charger-sense-resistor-milli-ohms = <30>;
>> or
>> rohm,charger-sense-resistor-micro-ohms = <30000>;
>>
>> I further guess there is no upstreamn binding doc for this property.
> 
> The binding doc is upstream. So an impressive amount of maintainers
> had a look at it...

Oh. So I have upstreamed it at some point... I suppose there is no users 
though.

> Well, everyone seem to entrust Rohm Semiconductors to do magic...
> wonderful reputation.

:)

> So how to proceed? As this property is not required, I can simply
> remove it and add a comment.

I would like to suggest adding:
rohm,charger-sense-resistor-milli-ohms = <30>;

and a binding with minimum 1 and maximum 50. Those should be sane enough 
limits. At the same time the 'rohm,charger-sense-resistor-ohms' could 
probably be deprecated.

This, however, is an extra mile for you. So, if you don't feel like 
doing it, then dropping the entry is Ok as well.

> 
>> I think there is also no upstream charger driver for the
>> BD71828/BD71879 - only an early RFC and some downstream mess - but
>> stil it'd be nice to have the property in place as the size of the
>> sense resistor is needed when converting coulomb counter register
>> values to current.
>>
> What are you upstreaming plans here? For all:
> I rebased the charger stuff to v6.11 on
> https://github.com/akemnade/linux branch kobo/power-6.11

Excellent question.

The reason why this driver is not upstream is that (as far as I know) 
the PMIC variants supported by the driver have always been tailored for 
a specific customer's needs. I don't think these PMICs have been sold 
for anyone else besides the specific customers. Hence, there has been 
little benefit for creating an upstream driver.

For the charger there has been additional complexity because the 
bd71827-charger driver implements also an in-kernel battery fuel gauge 
which computes the SOC values and sends them to the user-space. Like you 
know, this is very battery specific and requires correct battery 
parameters to be given.

I think your work changes things a bit. Seems we will be having an 
upstream board (kobo) using the PMIC drivers - and it might also use 
some information from the charger block. I know you also implemented 
some control logic to get the charging working with limited power-supplies.

(I think the BD71815 is also used in some projects which wanted to have 
upstream drivers - but I haven't seen upstream dts using it).

Furthermore, we still seem to be having new variants - I am right now 
writing drivers for another customer specific PMIC using somewhat 
similar charging logic. Having upstream driver would help in work like 
that. (By the way, I took your rebased kobo patches and continued my 
work on top of those - so thanks for the rebasing!)

So - in my opinion, upstreaming would be beneficial and I will push for 
this direction - but it will be slow process.

Also, I think that maybe the downstream driver shouldn't be upstreamed 
as such. I am not 100% convinced the SOC should be computed in-kernel. 
It'd might be easier to implement the SOC computation in a user-space 
library which just gets the details from the kernel. On the other hand, 
I think the driver should support a few currently unsupported features 
like setting the currents for different charge phases based on 
device-tree properties.

Giving I am the only guy at ROHM working on these Linux drivers (and not 
only these drivers), and knowing I don't have a system which is equipped 
with a real battery - I wouldn't hold my breath waiting :(

Yours,
	-- Matti

> Regards,
> Andreas


