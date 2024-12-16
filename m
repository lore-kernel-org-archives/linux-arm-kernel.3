Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEDCE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 21:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6g8Hes4zmmKkaO7fy47WaMEtflUT5zhFAF/15yb5xHw=; b=3QUfWSCQFSxE81gTjMxtFcyTk2
	eU2Zx/GryCEO//ZuZm44B5zZFMjQaB1eNc8PaVhnKNjqW616ONjAvZyTvglElYpxYTheteabnvtVx
	2MQYU2AbXGJoF8uDY9niPqATsfUV5gQCTdiTghLbnmPnI3dqOkH+U9kF/PYxl++buUR+k7ty2tHCN
	Cj3kKJbmcCx7QQH856domqryYKPzmotGaHXaMlahEvlXmH/JIVl2uUfK0QojywzEAT7uqD0hmNFFJ
	6R7BLIYw5PKsPis84xCNmSJ6Wdd4PFWIRfTITBdM8BVkisyy6gZj8yUaG9tbdsRjca1/nY91n+ybc
	e4O4IqBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNICg-0000000BM6I-0FAM;
	Mon, 16 Dec 2024 21:00:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNIBa-0000000BLre-2XIs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 20:59:27 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso31532355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 12:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734382765; x=1734987565; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6g8Hes4zmmKkaO7fy47WaMEtflUT5zhFAF/15yb5xHw=;
        b=gW6Y1Wp5uabge1xZcQTEFxRgzpSzcEBzoyzKhEXTV5f20AYjXEIP8xFSrKEDyn5ekh
         CPZOFzdJyOyv/wqAamiDLHIl0XCEApCMo8+HNy7qoD8UXz3IbJ7k48Q/5HbzkPygypJV
         6oCIY5xGa0nKD3cBf8LzXnvu7yDVKQ6Bb7oscqDYttIkRDxrM/pC84BAHN07VKr6SyWX
         tipw0x3SDO70ajc6/5LstrkicOKXm7hsd1KDfrnfX45nfyTOw5kw7DiDTbkkk7gEsivq
         WqI9+WHB61oyf1gTPBf1pAjC+pQrrC6Rbs2AgjiFerj7IRPNsnrCUhOu13woNiSe3Oj8
         HRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734382765; x=1734987565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6g8Hes4zmmKkaO7fy47WaMEtflUT5zhFAF/15yb5xHw=;
        b=TR6cj06MI78dxGCFxj6KuDfGKbxAOxRPgkJLsjNLg/3Mz8eiJ9l4/sje03Z4926Nfy
         s8Ub5FLVCoLfB6LJMstxdbGXe4ofcgZDe+l7F0YzIZZGDJzbYxZ+WiwlsMN2qteM8oZj
         DBBCUF2C7Bjbs4nJIVRcoNcTnBWW4f/t3REUwoCPDyRg6NtMLFlRXYrLWD2VCH1RaFNC
         XVpGURJoPv6TSfhCkMOGwSyPTgP2a7QGa0z6DscUziiQzzHeLs8hPcHLTIRJBXNmVi2/
         9q2SJdq6bbS3NiCjmQ1CasLkHIOqQrBQS0CRlWStEchIu03zKqyI7v2QqKXJ+eenxKsf
         G5xA==
X-Forwarded-Encrypted: i=1; AJvYcCV0Mh1ZPmawlMsaUiMKkJo0VP8hr8XLRAwAOFXzVMF0wGnSQhsu7Gdqb0G8jKwtnccNvQVeQwU68kAn7rKVVi2V@lists.infradead.org
X-Gm-Message-State: AOJu0YxlV+6e+xBZA0ltfdrDJ3ZoNMSAoVGyNgaP/361Bs+mL9ruFps6
	k8SxPzRQV45BclOqsfzxGPYu6aVaDFQhu1NHOZFaY9zW6Mic5Vdk
X-Gm-Gg: ASbGncsfXP17NnQ46hms4fVc57nOvFwcbb+ILYeXGy8hefoNrL/14cZanzNnjrPXXiR
	uAP2nlzsDncJbuOJvGmeHVuJyoT1+Tv5dWMi2tgAAkRjf7y2JqU7zo7w5gxVsprtmZY4DPHdfZA
	C4oxMXs9OPW5fNXyV7RaBuqNLG8xlEArd//LrKNKC+KRyTVdE9CaAVgzHWt4QnoUWxN1fFq3fOx
	pP3qEjRlUYlRJJfzuM13TuhsAZs6LgUcCHCg5Cy0CtlTuA3zjbdRGuqRrw8RBaNFQQpBwTGBgnV
	lJhV8Fdg+7XbWI5dgMalBY90cpzr58hgjvQ=
X-Google-Smtp-Source: AGHT+IE/0Wkla3cwdqnUeqQ2X/Luzdc4zJBTGrYgLR8XdM5elRTWNQcVFl4OcK4YhrAEI1OsqZGtlg==
X-Received: by 2002:a05:6000:708:b0:386:3327:bf85 with SMTP id ffacd0b85a97d-3889ad337b0mr11100443f8f.53.1734382764411;
        Mon, 16 Dec 2024 12:59:24 -0800 (PST)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80470afsm9286956f8f.75.2024.12.16.12.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 12:59:24 -0800 (PST)
Message-ID: <007559c5-f566-4625-99b7-e761a916fba3@gmail.com>
Date: Mon, 16 Dec 2024 22:59:22 +0200
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
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <0ebc12ed-fe91-4c8a-a626-b735b0eeecf1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_125926_655854_21EBA4CE 
X-CRM114-Status: GOOD (  14.89  )
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

On 12/16/24 10:44, Krzysztof Kozlowski wrote:
> On 14/12/2024 23:04, Ivaylo Ivanov wrote:
>> Add samsung,exynos8895-hsi2c dedicated compatible for representing
>> I2C of Exynos8895 SoC. Since there are I2C buses that aren't implemented
>> as a part of USIv1 blocks, they only require a single clock.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  .../devicetree/bindings/i2c/i2c-exynos5.yaml  | 26 ++++++++++++++++---
>>  1 file changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
>> index cc8bba553..b029be88e 100644
>> --- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
>> @@ -25,6 +25,7 @@ properties:
>>            - samsung,exynos5250-hsi2c    # Exynos5250 and Exynos5420
>>            - samsung,exynos5260-hsi2c    # Exynos5260
>>            - samsung,exynos7-hsi2c       # Exynos7
>> +          - samsung,exynos8895-hsi2c
>>            - samsung,exynosautov9-hsi2c
>>        - items:
>>            - enum:
>> @@ -94,9 +95,28 @@ allOf:
>>          - clock-names
>>  
>>      else:
>> -      properties:
>> -        clocks:
>> -          maxItems: 1
>> +      if:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              enum:
>> +                - samsung,exynos8895-hsi2c
>> +
>> +      then:
>> +        properties:
>> +          clocks:
> Missing minItems
>
>> +            maxItems: 2
>> +
>> +          clock-names:
> Ditto
>
>> +            maxItems: 2
>> +
>> +        required:
>> +          - clock-names
> I don't understand why do you need second, same branch in if, basically

Because, as I stated in the commit message, we have HSI2C controllers
both implemented in USIv1 blocks and outside. These that are a part of
USIv1 need 2 clocks, and those that aren't have only one. So it's not
a duplicate for the previous - autov9 sets a minitems of 2 and the
others have a maxitems of 1.

Best regards,
Ivo

> duplicating previous. But regardless of that, no nesting of ifs. Define
> clocks for all variants explicitly.
>
> Best regards,
> Krzysztof


