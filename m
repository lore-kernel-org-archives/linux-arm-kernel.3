Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC381090238
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PamUifGDxzKgYduTgi5+Bz1Hbj65Bi8zeh///fvaP8k=; b=KK8mRhw6qKlAIbdLR9b5A26BHC
	biual775JS1YPqd77JDEMV3CIjMqwVNbzTWvE1rtuPOmeP12o3LoPPcLP2AKVeR+nkoRqvzdPKLAm
	6vn+p7QPkqd2pYmm3ZSF5eu1oAQ699eSbhJCRK/gxQudcpo2M+MOcffy0UmNWs2Jdo/nx8UWDr+2t
	voAyBUkBTyA5tiIigdzk86VgUwPcAWpPWQyu/2PTo1Nsc6uZR+diBAaqnw/G9Ou1Vk/XFFb+g6LCb
	AxmqBVEVdESka1tlvlInLjyqgpaS16VPxByUjyVBM6koaiNjDK+5McH5Yux9a0RaecTYHtMk/FYWW
	98aEJHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Epp-0000000AqkE-1n5n;
	Thu, 19 Mar 2026 14:58:53 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Epl-0000000AqjY-3OF9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 14:58:51 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-4670bcc40d7so286056b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 07:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773932329; x=1774537129; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PamUifGDxzKgYduTgi5+Bz1Hbj65Bi8zeh///fvaP8k=;
        b=f7IKrKIo6WN2P3KMQt2VfJIV2msjqt11Anu838Diqu6zFHhxgJYxaww1e4V+cwW5sl
         DguVs1fBoIXkmmSajY4Dt8ktrEHx44Dj2OuWUzNMeIK6iANUrYrQ9igja1Ambr1jwQbx
         jU1A7TaHxLLOId8dvhOJg3yzyhNGLCJEOQWzGBQXA0iXgfBJihFZYbEvUAZCUkTw012a
         5f+ReHeBXkRR/sjtvBswmVJIlyBlmkVeAzsAwivZQ1iBWj4AJ35Mzk2f3S99QqaaQorK
         dDaDwS7bQdIn56Eog0XL0iMu7nfGOU2RDHfsueXMLL0X/KMWgsZcYjBNhf2IwBnwwbFb
         0r2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773932329; x=1774537129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PamUifGDxzKgYduTgi5+Bz1Hbj65Bi8zeh///fvaP8k=;
        b=TvZRVftrZ08bfhy27DWnVuOZC7FBV59Ez7RbE9us/Q3CbopnvKATnMy0fu18zjUq2G
         9l7Z+iP9qSI876fscMHLJMkXmmYezCcBNoYNd4diwLqQ3IOQ3QLYA3fIzm5WbyLKJOqK
         vacBT5jOe/1Y0ZDGiKcz5YStIsEP1tMFogkkBFuouR9HgaLffOFmqBOk9x0q+lExENOC
         V+QGz0DVrxI+dYVz4mWDZQifUUluj3orQMraAyfwZKqfQpGFQ0OiW4c/6gib5lt+VDVk
         dm1VPHrumzUbrLQ5OziX3w7VznbrTwFSQ206DXc0+FWReIoRzlBeqBEtIlbWZemTFh2S
         n0Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVaw2mrwb4B0Lsn0MAtlVA1lD0I1XiNnM3uUo2/upI6tBCk3LZGXDpMsck86RSDhrkIUHwHdmv4QsLtcrzbv75i@lists.infradead.org
X-Gm-Message-State: AOJu0YxkJXQWQSkOH264R6BKqSZeGN1DTfkRJint4gYinwfNWk2yDb2O
	MD98jqpDZKvTYddrhyeppsqHI78Jvwt8TbHNzrjUbBpRVpR4nZs2g/opnZCYKYO5KxA=
X-Gm-Gg: ATEYQzzv6Ej6kXYCoKyemPk4FyTGAEg9oPuiNVtbp09CpGlYQy5hDwRg4ujjCz+Yl38
	/cJuf3s1/k6mQlLegV/FHQGO6sxFUyH8rg7GQHWWjjZj3wPoyjiFRk1rySl4+Zq6BkOD0R34Ftz
	YFYWxUWHB3Yxb92+A3sIPgAWQ9Ft8gw2XHEXmxtT4jttcr0W9I7dXndf0zV5UoeWhy61By5drI6
	5GhMrqk13aK++yHvS1rNzrVHSr7NrOruCA6SYqTyMeZvAOlRrbmokrZvOSjYntSQ0yXYxMhLkim
	swazc/KUc0yp1WOkOxfV/ri7MS6jeQNakufafNmLOjGdaq1oww5dbLOvORkAj3BdO84kvP/gUvH
	NGfJ7V6qPT0h+HkxJ8PbHXIT05RUceHh9nFHg2edeqtgljLIpIqNI6/gB1hrWNydQ5H+5GNNsaD
	qZHN2qnb70po9rns64CkuGrC+1NHH3VET/IxG0fph9/jVxiatd4GfVj2RCxOUiCo+OFekNpFDkN
	QFB7HjMliZm
X-Received: by 2002:a05:6808:1451:b0:467:1cf5:7684 with SMTP id 5614622812f47-467ba15eaddmr4227888b6e.6.1773932328449;
        Thu, 19 Mar 2026 07:58:48 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:244c:fc8c:8216:1344? ([2600:8803:e7e4:500:244c:fc8c:8216:1344])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41bd22dee78sm6087744fac.0.2026.03.19.07.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:58:47 -0700 (PDT)
Message-ID: <f1706ec0-3995-4fdf-a9fb-8e1e688438a7@baylibre.com>
Date: Thu, 19 Mar 2026 09:58:46 -0500
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
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <e4c9729f-1785-4d10-a337-37b0d26fe30b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_075849_859349_6706FE68 
X-CRM114-Status: GOOD (  23.85  )
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

On 3/19/26 9:49 AM, Sai Krishna Potthuri wrote:
> Hi David Lechner,
> 
> On 3/19/2026 7:53 PM, David Lechner wrote:
>> On 3/19/26 8:52 AM, Sai Krishna Potthuri wrote:
>>> Hi Krzysztof,
>>>
>>> On 2/21/2026 4:08 PM, Krzysztof Kozlowski wrote:
>>>> On Fri, Feb 20, 2026 at 11:09:41AM +0530, Sai Krishna Potthuri wrote:
>>>>> Convert the xilinx-xadc.txt Devicetree binding to a YAML schema format
>>>>> and remove the old text binding.
>>>>>
>>>>> +
>>>>> +  xlnx,channels:
>>>>> +    $ref: '#/$defs/channels'
>>>>> +
>>>>> +allOf:
>>>>
>>>> Missing ref since you use unevaluatedProperties...
>>>>
>>>>> +  - if:
>>>>> +      required:
>>>>> +        - xlnx,external-mux
>>>>> +      properties:
>>>>> +        xlnx,external-mux:
>>>>> +          enum:
>>>>> +            - single
>>>>> +            - dual
>>>>> +    then:
>>>>> +      required:
>>>>> +        - xlnx,external-mux-channel
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +
>>>>> +unevaluatedProperties: false
>>>>
>>>> or you meant additionalProperties?
>>>>
>>>>> +
>>>>> +$defs:
>>>>
>>>> Why this is a def, not used directly? I see only one usage of this def.
>>>
>>> I am getting the below error if i define the patternProperties directly.
>>> Seems like complex vendor peroperties should be referenced via $ref.
>>> Please suggest if there is any better way to deal this.
>>
>> It is hard to say without seeing the new version of what you wrote.
> 
> In v1 series, i created $def and referenced this in xlnx,channels to avoid the error that i mentioned.

Is the code below the code that causes the error?

> 
> v1 code:
>   xlnx,channels:
>     $ref: '#/$defs/channels'
> 
>   $defs:
>   channels:

Is this indent bug just from copying to email or does it exist in
the source that is causing the error?

>     type: object
>     description: List of external channels that are connected to the ADC
>     properties:
>       '#address-cells':
>         const: 1
>       '#size-cells':
>         const: 0
> 
>     patternProperties:
>       "^channel@([0-9]|1[0-6])$":
>         type: object
>         properties:
>           reg:
>             minimum: 0
>             maximum: 16
>             description: |
>               Pair of pins the channel is connected to:
>                 0: VP/VN
>                 1-16: VAUXP[0-15]/VAUXN[0-15]
>               Note each channel number should only be used at most once.
> 
>           xlnx,bipolar:
>             type: boolean
>             description: If set, the channel is used in bipolar mode
> 
>         required:
>           - reg
> 
>         unevaluatedProperties: false
> 
>     required:
>       - '#address-cells'
>       - '#size-cells'
> 
>     unevaluatedProperties: false
> 
> 
> Regards
> Sai krishna
> 
> 
>>
>>
>>
>>>
>>> linux-xlnx/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.yaml: properties:xlnx,channels:type: 'boolean' was expected
>>>      hint: A vendor boolean property can use "type: boolean"
>>>      from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
>>>    LINT    ../Documentation/devicetree/bindings
>>>    DTEX    Documentation/devicetree/bindings/iio/adc/xilinx-xadc.example.dts
>>>    DTC [C] Documentation/devicetree/bindings/iio/adc/xilinx-xadc.example.dtb
>>>
>>>
>>> Regards
>>> Sai Krishna
>>>
>>>>
>>>>> +  channels:
>>>>> +    type: object
>>>>> +    description: List of external channels that are connected to the ADC
>>>>> +    properties:
>>>>> +      '#address-cells':
>>>>> +        const: 1
>>>>> +      '#size-cells':
>>>>> +        const: 0
>>>>> +
>>>>> +    patternProperties:
>>>>> +      "^channel@([0-9]|1[0-6])$":
>>>>> +        type: object
>>>>> +        properties:
>>>>> +          reg:
>>>>> +            minimum: 0
>>>>> +            maximum: 16
>>>>> +            description: |
>>>>> +              Pair of pins the channel is connected to:
>>>>> +                0: VP/VN
>>>>> +                1-16: VAUXP[0-15]/VAUXN[0-15]
>>>>> +              Note each channel number should only be used at most once.
>>>>> +
>>>>> +          xlnx,bipolar:
>>>>> +            type: boolean
>>>>> +            description: If set, the channel is used in bipolar mode
>>>>> +
>>>>> +        required:
>>>>> +          - reg
>>>>> +
>>>>> +        unevaluatedProperties: false
>>>>
> 


