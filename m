Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B72CE77187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 18:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RX3Us/R+Ba73C0CkzYR3VNICfGaHFr1lgKKzTrGydJU=; b=ULN9e98oLq/VVoVAw3p7PKro26
	BLLla0lMI6LkIZtj++NSEuVPgEigCsaNg+TBE9VHNYVqbOiOebKzzc0xmRk20AgVXFfslJQ48a99B
	M/KHYDD2t+qsi+7fdq9+26tYXmkxeFmm9fLb8XquzjoVJZo7qnfZC57cquXB1ylTj06MCg/PbuzoZ
	I9CqbRUSd/m+a9gW1FmTDOO9pSAgIRVl9RUkIabqJokkHNOKspEBXEsiR9DOB5fA82YcZu9JAhy2n
	nERcl9ACxevqCvPjubMCBEg6AtHkrUl0jOAhD2uCxDfleh9i69GJvjWiwX/FKX38zrwoGFmT+qvVA
	8W3MxywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbzU-0000000ESsU-00iA;
	Tue, 17 Dec 2024 18:08:16 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbae-0000000EO0g-40X2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 17:42:38 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9e44654ae3so861572966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 09:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734457355; x=1735062155; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RX3Us/R+Ba73C0CkzYR3VNICfGaHFr1lgKKzTrGydJU=;
        b=Qm4etkqOxdt+txm3ZcIdgoSTYbW04r6k350VKzRGgNE8AyuvB9frd6KTW7gMaAT1Yc
         MlEOaV4/040lsmyc7/ed5gKhNx3prioL/6A3YIZ5ns5CyAY7dGZkDjzYFRAC2j6vAFk5
         Wb4rnT7Go8MGiNFu/G1TEH1naStTdqwGQ5ZIY2REqttGJccit3IZ0aMh1Jb+2YEnSrjs
         UMHlGGzUGbyGHLelA7neKqn6AZFKQHCSUOFmA+PV3FBmZB/tu+IZJE3GwC4ylu1ZvMrf
         Sgw75YiyvZ2iHm5JLrbc0iOuaAyIP/UCYBHdpLAiDyUblFt7fmktM1wZCFtRlHxZ7TG4
         tDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734457355; x=1735062155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RX3Us/R+Ba73C0CkzYR3VNICfGaHFr1lgKKzTrGydJU=;
        b=Nwfa8Hp03xWT41+v3ygUBGRM2fubtm2S1lMGsZ6KBBQ2mibrZVc1fIdjw+QCXnR4yK
         0Dsto9Mj+HmiHW2SNMegsePGrsP24i23tThfBv+ME10tedRN53iWoPA2UNAbYCnVnc99
         qwLamEagNEljUh8T7f3MgiLSZ+3A6Gd4MxHtJeLwJyH/Apl5SiDeNrEINnQ/hloeK+wZ
         vtk0omzqIim4TiexMFaHLTCQyplE4W/6bsIfr9XcPQQzQTOUMyirG0xXFEw8IkL0Rm72
         n4t8+sI+0+YIQC7FrxeK5519qH97NZp5fJC+1jTC4Yx92CUsj8jBOoMsfaF79ssw16Qi
         WPLw==
X-Forwarded-Encrypted: i=1; AJvYcCWoUKdYszczl38ust4o4gJfg/1yKUCcmLGL1Da7jVOi77gGAMTJ7o9wFUJUB/G1gr/S1DL6tPPr0+ucOV3do2bi@lists.infradead.org
X-Gm-Message-State: AOJu0YzaWDBERRBtb32ODpuPL5M8rC7QISBggpBLA7dWmtfeTDIFO/5f
	tkZ4ngMwD4DDAD7fANkw1/WYm0RyBU9czo/1UmsSV3kg1/k+PyvK
X-Gm-Gg: ASbGncvu0D/mp0wP3Os+IuEb1FqqGaYHUidr54adIsNWRPzZ/eRGaM1YNqxPRCEFXVw
	S9cczOlEb9whf5wwT1p9ACBhzeTpQdKpbSLaIgsgCs9p0AOsZRe4L2lqcOPxqcLqdlNSmrqWIvn
	nF3K8sllRn/vfcD4LrdWtriQnQuAfYX2e1NVJAFzOkI9IoGsNp3aAD7G9Y3pBf90rwq+DcY0qbP
	PokSvfFI13yqiByQsd3hk/x0mTE+hT5xY3YX0v58+wdD3rSMKxIqYeIU/+yxa8p/N8l
X-Google-Smtp-Source: AGHT+IFjIUHzuO2MBnqXBKlI2P4aoVJoD6xBmuIZQ/ueNl9n5qqJbUqwItJ883MoEIIeh9jzL5p2ug==
X-Received: by 2002:a17:906:4fc7:b0:aab:c78c:a7ed with SMTP id a640c23a62f3a-aabf1cf01e1mr22140966b.49.1734457355131;
        Tue, 17 Dec 2024 09:42:35 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96005f73sm467420566b.4.2024.12.17.09.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 09:42:34 -0800 (PST)
Message-ID: <685eb8ab-2767-43da-80d0-ec77ff779d86@gmail.com>
Date: Tue, 17 Dec 2024 19:42:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: exynos5: Add
 samsung,exynos8895-hsi2c compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
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
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <56c5788a-2d49-4abb-af4b-65a11bdc4094@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_094236_997491_8583DA67 
X-CRM114-Status: GOOD (  17.05  )
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

Hi Krzysztof,

On 12/17/24 11:43 AM, Krzysztof Kozlowski wrote:
> On 17/12/2024 10:31, Ivaylo Ivanov wrote:
>> On 12/17/24 11:26, Krzysztof Kozlowski wrote:
>>> On 17/12/2024 10:08, Ivaylo Ivanov wrote:
>>>>>>>>         - items:
>>>>>>>>             - enum:
>>>>>>>> @@ -94,9 +95,28 @@ allOf:
>>>>>>>>           - clock-names
>>>>>>>>   
>>>>>>>>       else:
>>>>>>>> -      properties:
>>>>>>>> -        clocks:
>>>>>>>> -          maxItems: 1
>>>>>>>> +      if:
>>>>>>>> +        properties:
>>>>>>>> +          compatible:
>>>>>>>> +            contains:
>>>>>>>> +              enum:
>>>>>>>> +                - samsung,exynos8895-hsi2c
>>>>>>>> +
>>>>>>>> +      then:
>>>>>>>> +        properties:
>>>>>>>> +          clocks:
>>>>>>> Missing minItems
>>>>>>>
>>>>>>>> +            maxItems: 2
>>>>>>>> +
>>>>>>>> +          clock-names:
>>>>>>> Ditto
>>>>>>>
>>>>>>>> +            maxItems: 2
>>>>>>>> +
>>>>>>>> +        required:
>>>>>>>> +          - clock-names
>>>>>>> I don't understand why do you need second, same branch in if, basically
>>>>>> Because, as I stated in the commit message, we have HSI2C controllers
>>>>>> both implemented in USIv1 blocks and outside. These that are a part of
>>>>> On Exynos8895? Where? With the same compatible?
>>>> hsi2c_0 which has a clock from BUSC and hsi2c_1 to hsi2c_4 which use clocks
>>>> from PERIC1 (CLK_GOUT_PERIC1_HSI2C_CAM{0,1,2,3}_IPCLK). Why would
>>>> they need a different compatible though? It's functionally the same i2c design
>>>> as the one implemented in USIv1 blocks.
>>> If one block is part of USI and other not, they might not be the same
>>> I2C blocks, even if interface is similar. If they were the same or even
>>> functionally the same, they would have the same clock inputs. However
>> I see, so in such case I should make samsung,exynos8895-hsi2c-nonusi or
>> something like that?
>>
>>> user manual also suggests that there is only one clock, not two (for
>>> both cases), so they could be functionally equivalent but then number of
>>> clocks looks incorrect.
>> That'd be weird. Both according to downstream and upstream clk driver,
>> for the USI-implemented i2cs we have a pclk and an sclk_usi.
> Something is not precise here, as usually with Samsung clock topology.
>
> First, the non-USI instances have the IPCLK as well, e.g. things like
> PERIC1_UID_HSI2C_CAM1_IPCLKPORT_iPCLK
>
> USI have BLK_PERIC0_UID_USI03_IPCLKPORT_i_SCLK_USI, but that's USI
> clock, not HSI2C in USI. Datasheet mentions this is UART and SPI special
> clock, but not I2C. The PCLK is used for HSI2C iPCLK.

In USI, USI PCLK is used for the internal AMBA APB bus clock and the 
IPCLK signal is used for the peripheral controller blocks (i2c/spi/uart).

So perhaps we have it described incorrectly, and the hsi2c controllers 
(at least on E8895) should take only one clock input (IPCLK), and USI 
block should take the PCLK input.


>
>
> Best regards,
> Krzysztof
>

- Markuss


