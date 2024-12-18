Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483E7E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yIxUyzE0LOIsBKtNq4apc0rEHKbhmq8n178/AyuNO4=; b=hgHKQekfRvhUi8Foip4TTpdl5P
	J8SVO9KaehSOP4/W1u8uqUU2zPN6u6/x3c9vAI++mCBVj/jsaDr3w913dFW8eVyWVnWoHwwiB9id+
	wmlDsAKwWPx1XcPe756Iiazdm5RYNM1u/vE1pQ5QIWglAPfq5vvFWyeCRZQnj8ko/QOUk6Qmewjfd
	oqEyqUZXNY5q0j7kgsv8qU//igM9W4TKI7cLAlrQY4ZTEqNrbpDDXwBrfzoFX9NKwIPANc5Aoraw5
	JuGkp7aLpwyfPVhV7gPW6He4An5Gp2O554DJfvqryHLTpLxvB0clBvUgGHSxHpQVlnR2VdMCkA/vo
	KvVq4fCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqej-0000000GAIv-48Z4;
	Wed, 18 Dec 2024 09:47:49 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqO4-0000000G6l9-0uNr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 09:30:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436281c8a38so41814925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 01:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734514234; x=1735119034; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7yIxUyzE0LOIsBKtNq4apc0rEHKbhmq8n178/AyuNO4=;
        b=mybnK9dzlIeSH4DjuN2Akubk3DJz/WpXrO3hPl4p3QawpzlNqvUTWBKyjA5bunm6s7
         SXajad8rvtX0NYHeby+/3dgvpwwXCjImB9wkEQ3IOZbMYAnzW4axnQmv79UqMrUeCwbV
         Kj7IDyUlBfNt2iYkrJSTJrHdPlTK+uQqVgQsvQ2GrTMmK4VdaE/NEcoLNQDaPpraOAau
         Q9PpCkZY4TvV4Ix+zyr0o5l84w8phd34rAKUvC9+JqCjrudLFuSbyHfRhC+dJQniNvBS
         JHq6Fs57P9Me1GdiNCBslfrEpu2cq5U8er3HnEmtknaIDCAzbYA7XPaugmU6wNdirfy2
         QcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734514234; x=1735119034;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7yIxUyzE0LOIsBKtNq4apc0rEHKbhmq8n178/AyuNO4=;
        b=HKbeo3t4MK2q6I8HwHmhUpSCvlKypWIhqCaQMQQRLGkl4ffaT8XwlfVaoszLCFP31g
         W5d+rtI2aEz05A5CiHLm8DggSf6LtR8VTKHZGTrLOsjeJ+gDq3A3jn0VsqYfvMH6BlV4
         vzdtHHL6cG2EQNi4UraXtw1KJp8xTTd0/zBy4ffhQkNv4aD4LJwS5eFSn8P/Zpo7JdeH
         ufrAcyjXgy6y2xYgnzhn1o///KulLLTAbDMRiI4g9GszyrfUzZVam1xRKw1AU3wqXbZ8
         tmf8u1rJHnsJ2+/QfvKdLRwxnHvDmcnPByBk8FZRQTZuL8H1BUqYP5GmF1oUso+ImTbV
         MtkA==
X-Forwarded-Encrypted: i=1; AJvYcCVhLFdpAltrxsAzzeY4ypgI6Ayz3ZmAekFFo74LSP6Ybfu3wI9WDK4U20n4SnPj7zuOoBqThAIcZNIuqG61t30Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzMPAR5XOa1WkgOBxvwedW1kGTSOPpyT2FAmYyycd2EF3omptA7
	47sYrPtGFleL+MMT9AjYJ0An+voFo55yR0UBCu4sYWrlu4NqqPp6HR/zTAG0
X-Gm-Gg: ASbGncsxJo73+WmQRHhxo75wocjTucwVFlKJoHtbeMUnPvGGVPS0Ra5D0XPkLNMDoj6
	IiQkGhQEKK0GE7cKkVPRVivE1d+bTLx8Ot4N7AY3x6KpQ+yuE4ThOeu8tKbZ5Jb8HktiIVXCTd9
	8XlPQ7VcNlwO4+tjiDYB8ep2+Pj+++m/2onU3mb33VkBTejfjtHyYq932SBiyzIdDgs2FuU1eFu
	aKxPJIS/NK5MS7l8f8OFS2j37XOwb0DAaZCsC+6IHYq1S3HqfwSde3SpHUaWe1A7V46z8tQZcFV
	MUkvy8VXeQS57uKUvnn79g==
X-Google-Smtp-Source: AGHT+IGA5KRMCKQk9h6H7yQfzLwOECAdjUcuI1nRvjroVn8aEWm1sUmZ9/g7y0HJZwmO51Ekl42PZw==
X-Received: by 2002:a05:600c:3551:b0:436:1c0c:bfb6 with SMTP id 5b1f17b1804b1-43655405852mr15127885e9.27.1734514233755;
        Wed, 18 Dec 2024 01:30:33 -0800 (PST)
Received: from [172.16.20.173] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b42757sm14388525e9.39.2024.12.18.01.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 01:30:33 -0800 (PST)
Message-ID: <80d33e99-6a04-4985-b704-42d731313d9f@gmail.com>
Date: Wed, 18 Dec 2024 11:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: exynos5: Add
 samsung,exynos8895-hsi2c compatible
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241214220419.723100-1-ivo.ivanov.ivanov1@gmail.com>
 <20241214220419.723100-2-ivo.ivanov.ivanov1@gmail.com>
 <0ebc12ed-fe91-4c8a-a626-b735b0eeecf1@kernel.org>
 <007559c5-f566-4625-99b7-e761a916fba3@gmail.com>
 <cccca881-dd59-43c0-9072-dcd91d01671d@kernel.org>
 <6e93d59d-71e5-4c09-862f-55b5504121aa@gmail.com>
 <69fd1dbc-a29f-488c-a30f-7e5ea8f01a23@kernel.org>
 <17fbfcdd-8b79-4907-a4c8-798da0ef0526@gmail.com>
 <56c5788a-2d49-4abb-af4b-65a11bdc4094@kernel.org>
 <d8d0a1c8-f2b4-425a-858b-610ae7291ebc@gmail.com>
 <3fb8ba3f-3016-4823-bf48-130f173c8f66@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <3fb8ba3f-3016-4823-bf48-130f173c8f66@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_013036_261184_97704467 
X-CRM114-Status: GOOD (  15.81  )
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

On 12/18/24 11:22, Krzysztof Kozlowski wrote:
> On 17/12/2024 11:04, Ivaylo Ivanov wrote:
>> On 12/17/24 11:43, Krzysztof Kozlowski wrote:
>>> On 17/12/2024 10:31, Ivaylo Ivanov wrote:
>>>> On 12/17/24 11:26, Krzysztof Kozlowski wrote:
>>>>> On 17/12/2024 10:08, Ivaylo Ivanov wrote:
>>>>>>>>>>        - items:
>>>>>>>>>>            - enum:
>>>>>>>>>> @@ -94,9 +95,28 @@ allOf:
>>>>>>>>>>          - clock-names
>>>>>>>>>>  
>>>>>>>>>>      else:
>>>>>>>>>> -      properties:
>>>>>>>>>> -        clocks:
>>>>>>>>>> -          maxItems: 1
>>>>>>>>>> +      if:
>>>>>>>>>> +        properties:
>>>>>>>>>> +          compatible:
>>>>>>>>>> +            contains:
>>>>>>>>>> +              enum:
>>>>>>>>>> +                - samsung,exynos8895-hsi2c
>>>>>>>>>> +
>>>>>>>>>> +      then:
>>>>>>>>>> +        properties:
>>>>>>>>>> +          clocks:
>>>>>>>>> Missing minItems
>>>>>>>>>
>>>>>>>>>> +            maxItems: 2
>>>>>>>>>> +
>>>>>>>>>> +          clock-names:
>>>>>>>>> Ditto
>>>>>>>>>
>>>>>>>>>> +            maxItems: 2
>>>>>>>>>> +
>>>>>>>>>> +        required:
>>>>>>>>>> +          - clock-names
>>>>>>>>> I don't understand why do you need second, same branch in if, basically
>>>>>>>> Because, as I stated in the commit message, we have HSI2C controllers
>>>>>>>> both implemented in USIv1 blocks and outside. These that are a part of
>>>>>>> On Exynos8895? Where? With the same compatible?
>>>>>> hsi2c_0 which has a clock from BUSC and hsi2c_1 to hsi2c_4 which use clocks
>>>>>> from PERIC1 (CLK_GOUT_PERIC1_HSI2C_CAM{0,1,2,3}_IPCLK). Why would
>>>>>> they need a different compatible though? It's functionally the same i2c design
>>>>>> as the one implemented in USIv1 blocks.
>>>>> If one block is part of USI and other not, they might not be the same
>>>>> I2C blocks, even if interface is similar. If they were the same or even
>>>>> functionally the same, they would have the same clock inputs. However
>>>> I see, so in such case I should make samsung,exynos8895-hsi2c-nonusi or
>>>> something like that?
>>>>
>>>>> user manual also suggests that there is only one clock, not two (for
>>>>> both cases), so they could be functionally equivalent but then number of
>>>>> clocks looks incorrect.
>>>> That'd be weird. Both according to downstream and upstream clk driver,
>>>> for the USI-implemented i2cs we have a pclk and an sclk_usi.
>>> Something is not precise here, as usually with Samsung clock topology.
>>>
>>> First, the non-USI instances have the IPCLK as well, e.g. things like
>>> PERIC1_UID_HSI2C_CAM1_IPCLKPORT_iPCLK
>>>
>>> USI have BLK_PERIC0_UID_USI03_IPCLKPORT_i_SCLK_USI, but that's USI
>>> clock, not HSI2C in USI. Datasheet mentions this is UART and SPI special
>>> clock, but not I2C.
>> That's weird. Don't we need the clock enabled in order for the
>> USIv1's HSI2C to work?
> The clock goes to USI, so it is enabled, no?

Yes, and as Markuss said:
"USI PCLK is used for the internal AMBA APB bus clock and the IPCLK
signal is used for the peripheral controller blocks (i2c/spi/uart)."

So perhaps referencing the USI PCLK in the hsi2c driver for USIv2, as
well as USIv1, is a wrong approach and should be dropped/fixed?

Best regards,
Ivo

>
> Best regards,
> Krzysztof


