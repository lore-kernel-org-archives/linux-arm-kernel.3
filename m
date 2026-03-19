Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBCF109023C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eg6/k+hv0RLNPOr6IdZwf3a02afm+3/zRNxt2fKLYZg=; b=u0Bz7LLNY1sP3ciBKoeAf0VvON
	mpNj4Uc4HPHGjvVg5SmeiCEm5IyW67DrmFJMTmwTIk6f2rT6Qs38ltQlPnWcokFRgEu0Dmtrng98W
	nv/IH9M38CxeFYV81bLb/cj73ERCMPhiP0u7xzPIUjqtJWgc/TqcgOIQ3ndAGwKHAQZt+ptb3cYvm
	NJUFJlALDAyfaJo8Q9yt+wE4JYzMao4qjkKxwvtbctxefuv1csw7Q0znVBsqVXO74r5it3A/NeM7d
	960acszC2cqk9dHH1q74AXOQCDxjqturySAH1vMP+rgj2geyUDfsAb5Rzpsr1qj7bIDJyMDTnTpHp
	WBJ6f49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FPX-0000000AvMK-3fRQ;
	Thu, 19 Mar 2026 15:35:47 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FPU-0000000AvLX-2LkE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:35:46 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7d756f2a06dso981667a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 08:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773934543; x=1774539343; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eg6/k+hv0RLNPOr6IdZwf3a02afm+3/zRNxt2fKLYZg=;
        b=3SPA76Hm9Nmgz34FmtWmCuMZx1mqwAhncnAB0hav61q/dnDf1cqFGh7UEf5gieanIZ
         rmPTj7QUhMdyHZ1yrN2aopYYCeYYXSwlTChwQu0M7siIAAopkhBUMg0Js7m17q6f9B/u
         ooF736AAj9Y8bwQzg3KOi1fl7HHOFSH+nq95PsAtvNX+9OAHmYCqXb/zE4ErqztbNuVm
         MafqGdaOV+PtYVoxiCz2iAq8LF+zfYuzwZp3CPMmXdRIA2Gjlr4zVxdE4GCzfwNm5I65
         RCqqkBeD/sJGJfPc6uPbW3u6K5KJ0Il4QxJUOLhflk19vQ5QrRUDQ6PR/XsgNcWIYsQ8
         s9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773934543; x=1774539343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eg6/k+hv0RLNPOr6IdZwf3a02afm+3/zRNxt2fKLYZg=;
        b=HsIvrMji81MPvBryRzzxFKWmo5BX2AodGwd9dZDyHkgnq2cEgYo5n879CCN5exkHzk
         2BW9wUYnwIGJQQwaIiUN5UVZV6rsOb/e07DH8UXwPaNU6AuLmca+YTqAUNJh+EtHb1oq
         x37848fo+OiihfRHix1UvYnIncNOWpZuFWdvnC86wTRmRHdM1D5TEzRa0WSQd/FkRSgu
         /r0frbVqMTi+5hfc5tDIEJ87h9lnF/z/cHoDaZfx8Yd+Gj+L625HIU0XDWQKpWSIyfjc
         cHddHvMqgMZvnKVfhcSYHzV2VW9eIVPWySMyRUMIRZJa7NBpmUHSbA8B2b6i2onUoWL6
         1Mcg==
X-Forwarded-Encrypted: i=1; AJvYcCUSLdMmvTBIg+RUQditg+z+gLrCppAW0MQQavG9CcXdO21iIgnrE/MX73MLO6L+4EfI+Y/eXBuyCWnlY7xmwM+M@lists.infradead.org
X-Gm-Message-State: AOJu0YyD1cZXNwZ3454GIWp5RPIfCCMaDuvP6T/SY9x3IP4qSWBf8mH+
	ghCS2ualRpc6gDgRfSeg1Z7/023IZh2qA6b73t30fE1yFk6ujh07T/91N1+VYhAMzes=
X-Gm-Gg: ATEYQzzxisKwHVyCh4bXc9LISiFfYRocV21SdLFaMh5JjRYU1p0s63o8hMeEyK1SNgM
	MXc4eBsdprFTeI9eacvp1kpVwvt4UhdQPwEACwrxNuzAH8ypF5Os4ASvIGXvI3o5hwlZHJjHWw6
	PGNTygzeHynoorZ9Qc0P8wr5l/luuujGrFQUlgtEXsiqM27msDKBZtMb0TPMbec8QIvSI82mgOs
	v+xoOLrluX2Wveyjr6j1tB0FIyCLLMyPORHGfw3IFNgK5oRCAq6FJxnoF+PsLsvPuyr6bd2YpZ6
	QYSQz0RdJfJ19HExeqiYMlUAF+c1R8sviAIKTcwlUNDJlZCtiliqsA7DLkEqAGEpwGTGkuTtvsu
	YwjBOcDFVBgau/t3lehlq7ihO8VjzKvijI5uGI9nhLChFG68w9/66SnXbU27cxpocnvq/J6CHHk
	hUZH/Y5YPFw7NwOm/h6je+edhPwvoEd4SzZzP1SAs0Fq+8p2mSSPuPpuWhA0zSGVcO8lJ5a++Uc
	A==
X-Received: by 2002:a05:6830:270a:b0:7d7:cc47:9623 with SMTP id 46e09a7af769-7d7da6a6b2cmr2306179a34.10.1773934543473;
        Thu, 19 Mar 2026 08:35:43 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:244c:fc8c:8216:1344? ([2600:8803:e7e4:500:244c:fc8c:8216:1344])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7c9bbf132sm4630615a34.25.2026.03.19.08.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 08:35:42 -0700 (PDT)
Message-ID: <cf749e8c-f141-4367-81ad-827e02273ec5@baylibre.com>
Date: Thu, 19 Mar 2026 10:35:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] dt-bindings: iio: adc: xilinx-xadc: convert to YAML
 format
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, saikrishna12468@gmail.com, git@amd.com
References: <20260220053941.611415-1-sai.krishna.potthuri@amd.com>
 <20260220053941.611415-6-sai.krishna.potthuri@amd.com>
 <20260221-dancing-papaya-wolverine-db8afd@quoll>
 <b89933a3-5f25-466c-a2f5-6e231aa12749@amd.com>
 <21d425bc-9406-401b-9817-7255ba3d31fc@baylibre.com>
 <e4c9729f-1785-4d10-a337-37b0d26fe30b@amd.com>
 <f1706ec0-3995-4fdf-a9fb-8e1e688438a7@baylibre.com>
 <05bcc5b7-b3e8-40fb-be70-413c74afcfb1@amd.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <05bcc5b7-b3e8-40fb-be70-413c74afcfb1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_083544_748545_294154DD 
X-CRM114-Status: GOOD (  24.89  )
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

On 3/19/26 10:10 AM, Sai Krishna Potthuri wrote:
> Hi David Lechner,
> 
> On 3/19/2026 8:28 PM, David Lechner wrote:
>> On 3/19/26 9:49 AM, Sai Krishna Potthuri wrote:
>>> Hi David Lechner,
>>>
>>> On 3/19/2026 7:53 PM, David Lechner wrote:
>>>> On 3/19/26 8:52 AM, Sai Krishna Potthuri wrote:
>>>>> Hi Krzysztof,
>>>>>
>>>>> On 2/21/2026 4:08 PM, Krzysztof Kozlowski wrote:
>>>>>> On Fri, Feb 20, 2026 at 11:09:41AM +0530, Sai Krishna Potthuri wrote:
>>>>>>> Convert the xilinx-xadc.txt Devicetree binding to a YAML schema format
>>>>>>> and remove the old text binding.
>>>>>>>
>>>>>>> +
>>>>>>> +  xlnx,channels:
>>>>>>> +    $ref: '#/$defs/channels'
>>>>>>> +
>>>>>>> +allOf:
>>>>>>
>>>>>> Missing ref since you use unevaluatedProperties...
>>>>>>
>>>>>>> +  - if:
>>>>>>> +      required:
>>>>>>> +        - xlnx,external-mux
>>>>>>> +      properties:
>>>>>>> +        xlnx,external-mux:
>>>>>>> +          enum:
>>>>>>> +            - single
>>>>>>> +            - dual
>>>>>>> +    then:
>>>>>>> +      required:
>>>>>>> +        - xlnx,external-mux-channel
>>>>>>> +
>>>>>>> +required:
>>>>>>> +  - compatible
>>>>>>> +  - reg
>>>>>>> +
>>>>>>> +unevaluatedProperties: false
>>>>>>
>>>>>> or you meant additionalProperties?
>>>>>>
>>>>>>> +
>>>>>>> +$defs:
>>>>>>
>>>>>> Why this is a def, not used directly? I see only one usage of this def.
>>>>>
>>>>> I am getting the below error if i define the patternProperties directly.
>>>>> Seems like complex vendor peroperties should be referenced via $ref.
>>>>> Please suggest if there is any better way to deal this.
>>>>
>>>> It is hard to say without seeing the new version of what you wrote.
>>>
>>> In v1 series, i created $def and referenced this in xlnx,channels to avoid the error that i mentioned.
>>
>> Is the code below the code that causes the error?
> 
> No, the below code is not creating the error but Krzysztof asked the question on this code,
> "Why this is a def, not used directly? I see only one usage of this def."
> 
> I am saying if i don't use the def and use it directly i am seeing the error that i mentioned. So, asking is there any better way to handle this case other than using def.

If you could show us the actual code that is causing the error, then
we could perhaps spot a mistake or suggest an alternative.

> 
> Regards
> Sai Krishna
> 
>>
>>>
>>> v1 code:
>>>    xlnx,channels:
>>>      $ref: '#/$defs/channels'
>>>
>>>    $defs:
>>>    channels:
>>
>> Is this indent bug just from copying to email or does it exist in
>> the source that is causing the error?
>>
>>>      type: object
>>>      description: List of external channels that are connected to the ADC
>>>      properties:
>>>        '#address-cells':
>>>          const: 1
>>>        '#size-cells':
>>>          const: 0
>>>
>>>      patternProperties:
>>>        "^channel@([0-9]|1[0-6])$":
>>>          type: object
>>>          properties:
>>>            reg:
>>>              minimum: 0
>>>              maximum: 16
>>>              description: |
>>>                Pair of pins the channel is connected to:
>>>                  0: VP/VN
>>>                  1-16: VAUXP[0-15]/VAUXN[0-15]
>>>                Note each channel number should only be used at most once.
>>>
>>>            xlnx,bipolar:
>>>              type: boolean
>>>              description: If set, the channel is used in bipolar mode
>>>
>>>          required:
>>>            - reg
>>>
>>>          unevaluatedProperties: false
>>>
>>>      required:
>>>        - '#address-cells'
>>>        - '#size-cells'
>>>
>>>      unevaluatedProperties: false
>>>
>>>
>>> Regards
>>> Sai krishna
>>>
>>>
>>>>
>>>>
>>>>
>>>>>
>>>>> linux-xlnx/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.yaml: properties:xlnx,channels:type: 'boolean' was expected
>>>>>       hint: A vendor boolean property can use "type: boolean"
>>>>>       from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
>>>>>     LINT    ../Documentation/devicetree/bindings
>>>>>     DTEX    Documentation/devicetree/bindings/iio/adc/xilinx-xadc.example.dts
>>>>>     DTC [C] Documentation/devicetree/bindings/iio/adc/xilinx-xadc.example.dtb
>>>>>
>>>>>
>>>>> Regards
>>>>> Sai Krishna
>>>>>
>>>>>>
>>>>>>> +  channels:
>>>>>>> +    type: object
>>>>>>> +    description: List of external channels that are connected to the ADC
>>>>>>> +    properties:
>>>>>>> +      '#address-cells':
>>>>>>> +        const: 1
>>>>>>> +      '#size-cells':
>>>>>>> +        const: 0
>>>>>>> +
>>>>>>> +    patternProperties:
>>>>>>> +      "^channel@([0-9]|1[0-6])$":
>>>>>>> +        type: object
>>>>>>> +        properties:
>>>>>>> +          reg:
>>>>>>> +            minimum: 0
>>>>>>> +            maximum: 16
>>>>>>> +            description: |
>>>>>>> +              Pair of pins the channel is connected to:
>>>>>>> +                0: VP/VN
>>>>>>> +                1-16: VAUXP[0-15]/VAUXN[0-15]
>>>>>>> +              Note each channel number should only be used at most once.
>>>>>>> +
>>>>>>> +          xlnx,bipolar:
>>>>>>> +            type: boolean
>>>>>>> +            description: If set, the channel is used in bipolar mode
>>>>>>> +
>>>>>>> +        required:
>>>>>>> +          - reg
>>>>>>> +
>>>>>>> +        unevaluatedProperties: false
>>>>>>
>>>
>>
> 


