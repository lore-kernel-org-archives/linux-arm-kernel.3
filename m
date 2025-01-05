Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6193E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 09:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqHrB3RWMU7bV3iPucH88p5mwqp5ashiPx6Mz9MBKQI=; b=Vl6owAV4XvbnIH8Jgli7yiMdnX
	TfBn30JpUQ7WmJ3p+1H9X69wgo2lLgkjbDkPhERqaqACHR2gjMLSK9tBLv9jqI5yb++sL6Mo6lNwk
	+rtzmnx5ssth1YMQu41sEWYs70lg3f0XkKiyBD46liVIF+v2uMko/Ft4/b5iapMSVnMHIvFpNR3UX
	y7kUpbhw8r595OIp9Mww6/26SKT1Ua1gjWfvmUTjIPPbJ59vQ0oCYlJHpGOejUc/z6lGvOniF4hmg
	WO0RwYz6O0Fla2G1OAs8TioVI63fUr5l+OztdsQk7UKVv7f8tuUHInqxFZhmK0TBg6WUgPAsvvEyX
	r3oL/tnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNJ3-0000000GdRW-2tSU;
	Sun, 05 Jan 2025 09:52:25 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNHr-0000000GdJC-3Rij
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 09:51:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso89071875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 01:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736070670; x=1736675470; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yqHrB3RWMU7bV3iPucH88p5mwqp5ashiPx6Mz9MBKQI=;
        b=HsQx4YSrz3djtGscmsEoPRYDRYpjbuv8+sthfoOxY4n8S5EbQGeBZRTiWTWuj0coWn
         f47a5jasy9N3Pgr0pOb6o19E6qOSIjhYZsbFWBfjlCQLi9JmOZ6HpTCVyLPBzS0XbO3c
         sIPycFY3zp4C6bbbbZetWEUkKRVAca4GyrdOUVobaxjTzLq3aPPQe6mnIbY7rQB/HB42
         DXujG4omfAG1wKUgiD26CCZPuM/vpZkrAAZK4t9Gcy/0rkO8trPzxjj+S3maBtXWb311
         WwHjKpGPhmmH82Y8wGDMCU26CAgDRyme546oUQtIYlI1IhnCPq73pp0YAqsZ/JWAMirW
         +ioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736070670; x=1736675470;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqHrB3RWMU7bV3iPucH88p5mwqp5ashiPx6Mz9MBKQI=;
        b=i93gHHFAU179D2bF4FlRFb5HXl3K7g2rkQJxCQOE7yYMyXzDaFL54+1ie0lTrnsUQT
         zSyiMKZmQ7YZkSSqlO48dXiInvhMTm7Qqq+OloAzOAK8ZvNTa3r7VJVepal8nKwaOiHH
         zN/lUI9Vgc8oEaVZDCetVHVY0hWTt6iauLuuaTH8f1qGoiqC0WS6Vsa2HcvaSB8S2rkt
         m5FZt0+5FuydECffTMr5Ze13hWuxl5cy5KX/+5/NWBPPMctWYx/mtTrS3mq8gLcaeMwB
         ogAsEYTM/pxRPzzVUC164kfLD6urHf6CxzffWpM4uXfGzk7NoQ1qegue49ofYtIwhiMm
         jemQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoq+C20gFQyLbtwZfwEkeal6LRodY1hMwsDzHg1c6eb4tPjpc5lemcmzDWTKU9tD3G4l9e+CgV47slBGZtvQr4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8ByYnv0oihX00vjMWTnIx4/h1w7UJ6pafBu+62nue7GONoWM4
	dk96/jDXx1yq4Zljotc9JNmuiREkgQBD/wyUSR2hNcBOOIKqdbfA
X-Gm-Gg: ASbGncsxyTIv3jK2s8WsFgGZ42MkDK8ly71e5kvejlbcaTe1Zo7AfixeAnU3UuCQ2Mp
	MiJ0L2tR98hjqa9NeV1Yy4srAu4Lf2uL4juiF1yh9t7/zxfdomuC2Pl9xLBi+neGzvV+WeIPQwv
	RlAXMiwbwxGWNBiS0E6G7siIsBfS9Pgn6luIR92ciNxy3tkucmd4cweNxdj86anbvT3uolR+CmI
	gR3JW+Bm4B7DLHjChV7d06Gs3+HX+cLwZ1rrj0OaFeP7MxFq3zQuEECotIywqSN/fHnjeXgng==
X-Google-Smtp-Source: AGHT+IEEOPTfa4PfwVJhOwl8VnrMncxkZRkoL6bxSd5lLCXDE55/NQGvIzZQ0Xj/lbGgqwlw0qxl5w==
X-Received: by 2002:a05:600c:470a:b0:434:e9ee:c1e with SMTP id 5b1f17b1804b1-43668b7a33dmr503151075e9.31.1736070669467;
        Sun, 05 Jan 2025 01:51:09 -0800 (PST)
Received: from [192.168.1.104] ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c42sm568801905e9.9.2025.01.05.01.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 01:51:08 -0800 (PST)
Message-ID: <e7444f6c-f280-404a-8172-ae4869e3d492@gmail.com>
Date: Sun, 5 Jan 2025 11:51:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: soc: samsung: usi: add USIv1 and
 samsung,exynos8895-usi
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
 <20250104162915.332005-3-ivo.ivanov.ivanov1@gmail.com>
 <nk7rifc5mcsdlmgpncrpoumerajrpdekxpvqwwe2hz4b63rgci@flowtxwchm7y>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <nk7rifc5mcsdlmgpncrpoumerajrpdekxpvqwwe2hz4b63rgci@flowtxwchm7y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_015111_860841_BB92F48F 
X-CRM114-Status: GOOD (  19.98  )
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

On 1/5/25 11:18, Krzysztof Kozlowski wrote:
> On Sat, Jan 04, 2025 at 06:29:14PM +0200, Ivaylo Ivanov wrote:
>>  
>>    reg:
>>      maxItems: 1
>> @@ -64,7 +75,6 @@ properties:
>>  
>>    samsung,mode:
>>      $ref: /schemas/types.yaml#/definitions/uint32
>> -    enum: [0, 1, 2, 3]
> Widest constraints stay here, so minimum/maximum.

Why? If we are going to add new enum values specific for each USI version,
isn't it better to selectively constrain them in the binding?

>
>>      description:
>>        Selects USI function (which serial protocol to use). Refer to
>>        <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
>> @@ -101,18 +111,42 @@ required:
>>    - samsung,sysreg
>>    - samsung,mode
>>  
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - samsung,exynos850-usi
>> +    then:
>> +      properties:
>> +        reg:
>> +          maxItems: 1
>> +
>> +        samsung,mode:
>> +          enum: [0, 1, 2, 3]
>> +
>> +      required:
>> +        - reg
>> +
>> +    else:
>> +      properties:
>> +        reg: false
>> +        samsung,clkreq-on: false
>> +
>> +        samsung,mode:
>> +          enum: [4, 5, 6, 7, 8, 9, 10]
> Is it really true? Previously for example GS101 had values 0-3, now you
> claim has values 4-10, so an ABI change without explanation.

How is it unexplained? Citing the commit message:
"Add constants for choosing USIv1 configuration mode in device tree.
Those are further used in the USI driver to figure out which value to
write into SW_CONF register."

USIv1 and v2 write different values to the SW_CONF register. For example:

#define USI_V1_SW_CONF_UART        0x8
#define USI_V2_SW_CONF_UART    BIT(0)

..
 [USI_V2_UART] =    { .name = "uart", .val = USI_V2_SW_CONF_UART },
 [USI_V1_UART] =    { .name = "uart", .val = USI_V1_SW_CONF_UART },
..

Hence the decision to have separate constants for different USI versions,
which in my opinion is cleaner than meshing the enums together and
choosing what to use with IFs in the driver code.

>
>> +
>>  if:
> Missing allOf:
>
>>    properties:
>>      compatible:
>>        contains:
>>          enum:
>>            - samsung,exynos850-usi
>> +          - samsung,exynos8895-usi
> Effect is not readable and not correct. You have two if:then:else.
> Usually it is easier to just have separate if: for each group of
> variants and define/constrain complete for such group within its if:.
>
>>  
>>  then:
>>    properties:
>> -    reg:
>> -      maxItems: 1
>> -
>>      clocks:
>>        items:
>>          - description: Bus (APB) clock
>> @@ -122,16 +156,13 @@ then:
>>        maxItems: 2
>>  
>>    required:
>> -    - reg
>>      - clocks
>>      - clock-names
>>  
>>  else:
>>    properties:
>> -    reg: false
>>      clocks: false
>>      clock-names: false
>> -    samsung,clkreq-on: false
>>  
>>  additionalProperties: false
>>  
>> diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
>> index a01af169d..4c077c9a8 100644
>> --- a/include/dt-bindings/soc/samsung,exynos-usi.h
>> +++ b/include/dt-bindings/soc/samsung,exynos-usi.h
>> @@ -13,5 +13,12 @@
>>  #define USI_V2_UART		1
>>  #define USI_V2_SPI		2
>>  #define USI_V2_I2C		3
>> +#define USI_V1_NONE		4
> Drop, it is already there.
>
>> +#define USI_V1_I2C0		5
>> +#define USI_V1_I2C1		6
>> +#define USI_V1_I2C0_1		7
>> +#define USI_V1_SPI		8
> Drop
>
>> +#define USI_V1_UART		9
> Drop

How so? These bring different configuration values. Could you specify how
exactly you want me to implement these in the driver?

Thanks for the feedback!

Best regards,
Ivaylo

>
>> +#define USI_V1_UART_I2C1	10
>
> Best regards,
> Krzysztof
>


