Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0CFE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 10:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYrLrg3M5tgHoTzQrdp8f9Dfp9oiWl/aUFmJid3JjVg=; b=avqjJnWJSKtl/i1v1UgucoKSMp
	FJoQm2InO19U6sN/uMv0WuQG4+IUdmO0oGUC5HFJmYau8efEj8mF/bRkHWfnONQU+y2z3TpxvwVRR
	zMixJIG8b9N6AfPZeG6QRyUU8aHn6Zv230ebNBN+GKq0YidB94kDHnRIVBysI7JOVsHZuj4ZHl4jY
	9GDZ3Ue7xmwzHvWSQayH8FNvgORgnT63iW977f5jiuA2jlanmNxEv4CVeM9DE88Lz15lMXC2J/Kvy
	bhRJ9aHWS9HmnRIZ90VtMoaMi3j4FTqliXGIEMaVICWRoGWGQJAvpJh9e8lIp9bfn1nb2g0xcGugH
	NcQurm9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUY8-0000000D4jd-25kg;
	Tue, 17 Dec 2024 10:11:32 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNURC-0000000D2h9-2yKi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 10:04:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-434a766b475so53926765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 02:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734429861; x=1735034661; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYrLrg3M5tgHoTzQrdp8f9Dfp9oiWl/aUFmJid3JjVg=;
        b=XXSDga0FfOfXWlb8hzCxQQqvTBS1YBhVfR/gSXQP13CE45roVw2tJTnjKCdYpzKahF
         RwUWj3lt4OpFHbL/EQn/SUZ2lMahlysfdk9y7nh4VoSSCOfIt7AiaA5QOx5KdWODj69/
         EVAye1Q2ciBHeDIb6cTghKT76cHp4Ct0dvB9NJi/HDExyEd9g6jWEURoJUtndNRPLReP
         natYR5nLHdEzGAYRR5WkrksfxZPd0iH0bKz3OSEbYpV7Q8NJoOiArbyjkKXYU/kW0zGO
         eJsZUFGsGhpemRM0mEGCv4lUHy2RMdOt9nvZsvTNF9TCYSlvikELpyR9FEVSUdQlgt2s
         YHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734429861; x=1735034661;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYrLrg3M5tgHoTzQrdp8f9Dfp9oiWl/aUFmJid3JjVg=;
        b=nK6ghKAAkbny+sxMGNKWDMdODeWXLGj2/GdKIdUzBqJVH3OQ8GBMlKMurKD6sqsLIs
         QTiCD6U79afzatx9RKJ/LJ2xBxPxsRUX77S2N24lBkNGjwOB+3ZHzFZXiiVLx5utbKQK
         Pb6J0VTzcViKxGmAP1jNTfIiKvQO0QvWzTjlrwtsxPBy+kF2Skw5osQJqEiv5eCRg6CP
         cA70cHb1adH2I8BObi25+a+kADHA3Yy181t/H40F6Yzs94Y24g/Ipke9UrAGOxyqsFNf
         mzaXSE30j5yboI1LjpXlz2LHQyOc9r2PsIK9OweXQVncPuAGu/9xLh7TKsXxTkypO6dm
         I0Dg==
X-Forwarded-Encrypted: i=1; AJvYcCV7pPgXj3MEn9FP9dqSHA/Ugy25zdGvioM9sVwDRF2TB7SqZWCIpW2rClsKQP+yo1l27EEkdnJPZ+cqiS6v/i5A@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1f97VHmVHh1K/lpRhxMRDB41RteFJxwBNq2DFLTGuSXEzz7bE
	bfyhEX4i4U6P8cuEcF6edrjdJ59ee5MAYDXV1VTfx/EImKbcODXu
X-Gm-Gg: ASbGncufH003e9oZ4257h0vsMKpHjfwCi4HvKcmyzKjSa5RNNmvteSpmBRlH7We3oI6
	6sNru1iz2NFeN3pxY2NZ+PfL6iM6wgqmGK2IF1Yiiv/mY/WJ0w2t0QyZTKDUcu6iratLC+n+630
	tf7oIbj4az7jXkPSyPkyW/mQinDTT0YgkkXxu+v+hjqNDLJIVuL7YrDID7edVmumZVkoEkexgGC
	ObNxhfIsCVXhlSZHrZL0l76f3M4aq4oGkttnS+wE5NV58eZyvsTbZvOT3aWZ8JN5XKhbO4XJtRK
	53wKDoTMnA4NL/Zxv60kXA==
X-Google-Smtp-Source: AGHT+IErqPnymSh1uEMNFLA6EU4DTN3bB21g37HvGXd0a+FwRC+Ivd5Be09XHezjPdYkMyJH1U4RHA==
X-Received: by 2002:a5d:5f88:0:b0:385:e37a:2a58 with SMTP id ffacd0b85a97d-38880ac2841mr14909475f8f.1.1734429860764;
        Tue, 17 Dec 2024 02:04:20 -0800 (PST)
Received: from [172.16.20.173] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8046c71sm10530914f8f.65.2024.12.17.02.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 02:04:20 -0800 (PST)
Message-ID: <d8d0a1c8-f2b4-425a-858b-610ae7291ebc@gmail.com>
Date: Tue, 17 Dec 2024 12:04:08 +0200
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
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <56c5788a-2d49-4abb-af4b-65a11bdc4094@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_020422_763086_3645F616 
X-CRM114-Status: GOOD (  16.15  )
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

On 12/17/24 11:43, Krzysztof Kozlowski wrote:
> On 17/12/2024 10:31, Ivaylo Ivanov wrote:
>> On 12/17/24 11:26, Krzysztof Kozlowski wrote:
>>> On 17/12/2024 10:08, Ivaylo Ivanov wrote:
>>>>>>>>        - items:
>>>>>>>>            - enum:
>>>>>>>> @@ -94,9 +95,28 @@ allOf:
>>>>>>>>          - clock-names
>>>>>>>>  
>>>>>>>>      else:
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
> clock, but not I2C.

That's weird. Don't we need the clock enabled in order for the
USIv1's HSI2C to work?

Best regards,
Ivo

>  The PCLK is used for HSI2C iPCLK.
>
>
> Best regards,
> Krzysztof


