Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1503E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5weIQENd/TWSQgQ6aqWujhlJ38EIL0ozLxoFHUkrYE=; b=2iXcU+4MsQueMBR/OJsH+j2ND1
	OiMacKub9z8M0WPmjG7z+J1OsOA0avhl1+gSfzBGDLbmx0PxzX6JFu8qEjhR6A5t2XY7fxAIBPkKz
	m5PcWD+ATJNdgMpGqwT7aQAjqBa9t3wsw4uhgmgeIfwhtRk1f3SEEWSg6ZmwIzXqfLi2yKrdic+n0
	+0SWUVSTzlvQD0doskeMD2WD+R4R3VP4nVla4rq6GX09Orvpg/Fv+tv/os0fOaqC0Tk1JnxvPvgt8
	SpBjtcydEsWgJ66DxQ2NslTBEPPSs53IgVvLptLeLCw2DLypGmPI9nIOZ3bglbqaIoEd997KFbDbk
	EDtISxPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTlO-0000000CtFS-2xcO;
	Tue, 17 Dec 2024 09:21:10 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTZ8-0000000CqGV-46e1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 09:08:32 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-385e3621518so2535646f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 01:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734426509; x=1735031309; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q5weIQENd/TWSQgQ6aqWujhlJ38EIL0ozLxoFHUkrYE=;
        b=EF0sdldHfB/dFruV0x/3EVDtddqZEWIDIRxAtMVRlxjiXJBihDKd3cHuMgiKqkwJxn
         RgGcmorYw68CDhYUGN+x7iqqDihzyygAtbgyDakSjeOG9McmKXXRyZoR8g/L2C2EUqeX
         0ssye3ivxl8OWFgSYxNUJVTb6V9h/lbAL+tY4Nm7PTt2gyFCo8lZx30C6m05xWZ9QaZ2
         rEwf843Zf+Za92Bi5pGoopwOiYmVJyeK26WogoFk0uvB0tfopdiNf+LOtL5p6DMobf0L
         cDY4a23fbTjphAAvxoTFR1MeOgNw0Fr0h0uQeo+ad1nZ9xGtUTjPb5kRvuVm7edJVyir
         m3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734426509; x=1735031309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5weIQENd/TWSQgQ6aqWujhlJ38EIL0ozLxoFHUkrYE=;
        b=LtB1uJb9A7fRSvzg2eiSIy7o2AD2g6f8D3eKXd6Lu6YqPpFqKvuRNo+Fg8UTIhR9ju
         2A5Um20I3RbAj9Fj0xbb/IkHCSsrm/OJnIP5HXwCG4+zOgxX0jkbqdzqWqLcTl/kfTRY
         DJ69TUgj7cuAStKsiUD6+aK5QGe0zFvtylW3ux6YwwsOMr30PQW0tRvs8aVEYKPfxLXY
         nPDh3u12oORVF+h6rXkdOFlZudg2jmLPoc+MXizLem58j0o3C/CRIz7kOmJcbBup0PTX
         rDE5rQ0dHTbAbAU43i/Z17qBANQWmN7GwGb8SgU1z46Zj+RuNyvvCaGFiFV4HDQVMHRj
         iOKA==
X-Forwarded-Encrypted: i=1; AJvYcCWAcI6sPNZzFEqdcDM9AatgqVTix83fa+CkON78QDs5fTe7gVRmRRwXEzrvsNUlzu9mzPE0Wmt0ZWOTf4IMU2YZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwBQvquurh1DazFy9YYjVHXQ8hqSDPq1zB3iHpBYZ+ibgbon/YD
	y6pPnqLhm0Gzy29IgQ1V237RicLB9Ze2bW+sKoS1oRckj1I1HrDWssLU+Q==
X-Gm-Gg: ASbGnct25hi744Bv7iofy/csd7v7wke8DW5GawXB4eUOUPbd15txv2UMLJweXvqeWzJ
	cdr08sI4imW5WWtMSkJqvPJgiqYQAsWudsQ2fGI4pOEtmo/3FLQy6F9JlOUF3M6wyL24KKG+yUh
	6WMCdeE7MzkB39UBtTZJbqis+IjFmxacmBHusi1yXEv+GX8HXPaVyIYDqdZ3uwCFJCbXYjJrOdB
	E36Vfdzlfkw2BYvuWu/iFbJR/dFenvG58yCo/pQg7aCA47Zz4e2sXvXRPwHM0hDx3cuJrai8crF
	1uBszsjIZyPEYVwXYScXXQ==
X-Google-Smtp-Source: AGHT+IFKUA5hQNQSywoZDLpGUcdLM6zt8M6vh5FswSnswuK4fj51IzxHglfrE9X7z3ZJ7TaFHj1FhQ==
X-Received: by 2002:a05:6000:156f:b0:385:e328:890a with SMTP id ffacd0b85a97d-3888e0c0520mr13813018f8f.49.1734426509180;
        Tue, 17 Dec 2024 01:08:29 -0800 (PST)
Received: from [172.16.20.173] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80165c5sm10519556f8f.25.2024.12.17.01.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 01:08:28 -0800 (PST)
Message-ID: <6e93d59d-71e5-4c09-862f-55b5504121aa@gmail.com>
Date: Tue, 17 Dec 2024 11:08:26 +0200
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
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <cccca881-dd59-43c0-9072-dcd91d01671d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_010831_024947_F4C19F1E 
X-CRM114-Status: GOOD (  14.81  )
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

On 12/17/24 07:24, Krzysztof Kozlowski wrote:
> On 16/12/2024 21:59, Ivaylo Ivanov wrote:
>> On 12/16/24 10:44, Krzysztof Kozlowski wrote:
>>> On 14/12/2024 23:04, Ivaylo Ivanov wrote:
>>>> Add samsung,exynos8895-hsi2c dedicated compatible for representing
>>>> I2C of Exynos8895 SoC. Since there are I2C buses that aren't implemented
>>>> as a part of USIv1 blocks, they only require a single clock.
>>>>
>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>> ---
>>>>  .../devicetree/bindings/i2c/i2c-exynos5.yaml  | 26 ++++++++++++++++---
>>>>  1 file changed, 23 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
>>>> index cc8bba553..b029be88e 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
>>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
>>>> @@ -25,6 +25,7 @@ properties:
>>>>            - samsung,exynos5250-hsi2c    # Exynos5250 and Exynos5420
>>>>            - samsung,exynos5260-hsi2c    # Exynos5260
>>>>            - samsung,exynos7-hsi2c       # Exynos7
>>>> +          - samsung,exynos8895-hsi2c
>>>>            - samsung,exynosautov9-hsi2c
>>>>        - items:
>>>>            - enum:
>>>> @@ -94,9 +95,28 @@ allOf:
>>>>          - clock-names
>>>>  
>>>>      else:
>>>> -      properties:
>>>> -        clocks:
>>>> -          maxItems: 1
>>>> +      if:
>>>> +        properties:
>>>> +          compatible:
>>>> +            contains:
>>>> +              enum:
>>>> +                - samsung,exynos8895-hsi2c
>>>> +
>>>> +      then:
>>>> +        properties:
>>>> +          clocks:
>>> Missing minItems
>>>
>>>> +            maxItems: 2
>>>> +
>>>> +          clock-names:
>>> Ditto
>>>
>>>> +            maxItems: 2
>>>> +
>>>> +        required:
>>>> +          - clock-names
>>> I don't understand why do you need second, same branch in if, basically
>> Because, as I stated in the commit message, we have HSI2C controllers
>> both implemented in USIv1 blocks and outside. These that are a part of
> On Exynos8895? Where? With the same compatible?

hsi2c_0 which has a clock from BUSC and hsi2c_1 to hsi2c_4 which use clocks
from PERIC1 (CLK_GOUT_PERIC1_HSI2C_CAM{0,1,2,3}_IPCLK). Why would
they need a different compatible though? It's functionally the same i2c design
as the one implemented in USIv1 blocks.

>
>> USIv1 need 2 clocks, and those that aren't have only one. So it's not
>> a duplicate for the previous - autov9 sets a minitems of 2 and the
>> others have a maxitems of 1.
> We talk here about branch that says 2 items. You duplicate that one.

I see. I can just define the clocks for all at this point.

Best regards,
Ivo.

>
> Best regards,
> Krzysztof


