Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1E01090233
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeNjfj/LpvbccEUPQ7WMLYgOxZOBhYnhu+wpfuHYq6E=; b=2vlFqGsNuMIqG1372o5ITC/b0C
	KE7XVDKdW7pDFIDwMqz5rmKHDwGHgj2+08jSuw8iUMnGk2j+0QTZttHgAFoOhAVnFej4jOv5iPKR+
	sVhWpX+410n6kH0N0nAOUPg6XeU0pRhC7/kfR9PVfWGbNQ4t6EdkyIwEiwpkQqnk/aUBXTRijGh6n
	KMkfTidEGj82Nd9xHYG6k/Osr9zyBYTBe+pav5pvDuxGZ91w/mXq8cWJDWi9OU+YtJx2eChMuz0Yk
	FdqzVOFFkvoGykksDHIfcF9xZA1hbj+aenZHXs6mAjPBIISlXZRdSd8+2h7goi3BxYLhY/khOR/pf
	j+bCynvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EI3-0000000Amzz-0Eh6;
	Thu, 19 Mar 2026 14:23:59 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EHz-0000000Amyy-32e2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 14:23:57 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-4648447e29bso420022b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 07:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773930234; x=1774535034; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KeNjfj/LpvbccEUPQ7WMLYgOxZOBhYnhu+wpfuHYq6E=;
        b=fV0kZ/sHl5/t3OCm4iGQFpLXWhvkfegV2nuN936FFMu+KRkd10WB1QrsSwgpH0pAlC
         S4ECmTXwHCB3bJFN3Sk19gsUa3IOJmcRHLVc7u40BDcJGrCw3j6cwsRma4PEOfeoRy1J
         8gB9egIyg2rfn+0bInuHGTpK3rNHhVUK/nkcfrTQVdknhGlmVGJvFuM1fG+fQcfP+zDR
         tXcX1YaZSGpA8x1lbWaXkyRjl7jy1R0M07TpQmT5sBVxtikX4/3xWlgz7yW6xYBN88Kv
         4FhkdH1y/URubmxS86MtiC1GOGxQ83JIyP3iRFnSTYzM2cJLRG83RnV4KWP0ktwVQsma
         fK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930234; x=1774535034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KeNjfj/LpvbccEUPQ7WMLYgOxZOBhYnhu+wpfuHYq6E=;
        b=gUvxXRMcg6i0hXqAcMYeF7q2+la6OoLO7/rIdHXCVpWPQlSyjw21nF4Uo+/Sw3Xv0v
         /+QSHXurF7Z4ud4DSWMh+l0B+YWz1nJx8swhvKidZsHKcn+eEGZcmeYgkOL88pn23ofq
         Psy35mswYLttd97BE414FpTSXo/Enwu7ozR4kLTwlb5pgKAFewrcukdhCkaCAm3T/GKy
         AafKoazjO4Swk7dciXrRK1ahGGnOeC4nYRySOXL55Fv7v0qiybR01bovG4RuOiM37toS
         S6dM/bytyIZDmBL/InZZ6iG7WLRiB3tIgb/Qth5AifAsSu7y4IfdV0lmr7ozGFimbUF+
         jlqg==
X-Forwarded-Encrypted: i=1; AJvYcCWi36CBDgJQ9eIWLaA7bPtpWe0vXlIY5rhglr0Tz9lILftZczYPVP8fNFadpdAkFLcCtPz98M9E3EjzNUYs/aJz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9/yrLBMwG3CUiS4oEn6ruKsKB/KvZFJYGoW66yJn34CgoD0a6
	KPg6JYMmF11Hr8nvED2X3SPVY55/2E8PsJgs7HLwJ3nRuM31XILG9xGguqfAxGxsDDY=
X-Gm-Gg: ATEYQzwTyersG3hW4g7h28BPhDm0XEIx+EjNtvNqLrzkBa3OSS9Cm0U41C9tRZ122Wl
	8B4uENqkz9s5mi87OYQEubZUF5Komp/ubN0QZVMOV8VO/qsb2U7QcbU7W9QFXjWBnGbLI6kATNA
	mCauAtZQz7e+l94ywVUaGyRZXwyz2ul7UixzUGRTkNJl2CvXhY3teswOLN76s99rly7nLcCeBAJ
	5IMNJj6ONc8c0yOYQzFaYb0mgqvz8Kb6C/QgoSg65gJaxrfgcv9GsVh8MDcetUoHClofBop8jrZ
	QLE6aWzqyGLMcZpkz3KYznv/sbF0IQSnztOPmf5dTJ1wLTt8czv/BuCJiyEEChZMwgx8Q24bv+7
	vODt5AkkwtDdAqYvonLMxKmbHhCJKdn4K8yvz+sei9WW2r9WFhvMPuKgYTAACV95DaF9TXzEBkl
	1Fc7CQ5hkXnqbQY3niK8+Iyo+KudpJ3T8ZPosDuF7o3PZkG+ZW2pEv9wQFslBYMrtptX+Lv6fCc
	Q==
X-Received: by 2002:a05:6808:19a8:b0:467:819:dc61 with SMTP id 5614622812f47-467ba28b325mr4636001b6e.23.1773930234228;
        Thu, 19 Mar 2026 07:23:54 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:244c:fc8c:8216:1344? ([2600:8803:e7e4:500:244c:fc8c:8216:1344])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7e878b627sm82482a34.15.2026.03.19.07.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:23:53 -0700 (PDT)
Message-ID: <21d425bc-9406-401b-9817-7255ba3d31fc@baylibre.com>
Date: Thu, 19 Mar 2026 09:23:52 -0500
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
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <b89933a3-5f25-466c-a2f5-6e231aa12749@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_072356_022594_BEA2248A 
X-CRM114-Status: GOOD (  19.77  )
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

On 3/19/26 8:52 AM, Sai Krishna Potthuri wrote:
> Hi Krzysztof,
> 
> On 2/21/2026 4:08 PM, Krzysztof Kozlowski wrote:
>> On Fri, Feb 20, 2026 at 11:09:41AM +0530, Sai Krishna Potthuri wrote:
>>> Convert the xilinx-xadc.txt Devicetree binding to a YAML schema format
>>> and remove the old text binding.
>>>
>>> +
>>> +  xlnx,channels:
>>> +    $ref: '#/$defs/channels'
>>> +
>>> +allOf:
>>
>> Missing ref since you use unevaluatedProperties...
>>
>>> +  - if:
>>> +      required:
>>> +        - xlnx,external-mux
>>> +      properties:
>>> +        xlnx,external-mux:
>>> +          enum:
>>> +            - single
>>> +            - dual
>>> +    then:
>>> +      required:
>>> +        - xlnx,external-mux-channel
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +unevaluatedProperties: false
>>
>> or you meant additionalProperties?
>>
>>> +
>>> +$defs:
>>
>> Why this is a def, not used directly? I see only one usage of this def.
> 
> I am getting the below error if i define the patternProperties directly.
> Seems like complex vendor peroperties should be referenced via $ref.
> Please suggest if there is any better way to deal this.

It is hard to say without seeing the new version of what you wrote.



> 
> linux-xlnx/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.yaml: properties:xlnx,channels:type: 'boolean' was expected
>     hint: A vendor boolean property can use "type: boolean"
>     from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
>   LINT    ../Documentation/devicetree/bindings
>   DTEX    Documentation/devicetree/bindings/iio/adc/xilinx-xadc.example.dts
>   DTC [C] Documentation/devicetree/bindings/iio/adc/xilinx-xadc.example.dtb
> 
> 
> Regards
> Sai Krishna
> 
>>
>>> +  channels:
>>> +    type: object
>>> +    description: List of external channels that are connected to the ADC
>>> +    properties:
>>> +      '#address-cells':
>>> +        const: 1
>>> +      '#size-cells':
>>> +        const: 0
>>> +
>>> +    patternProperties:
>>> +      "^channel@([0-9]|1[0-6])$":
>>> +        type: object
>>> +        properties:
>>> +          reg:
>>> +            minimum: 0
>>> +            maximum: 16
>>> +            description: |
>>> +              Pair of pins the channel is connected to:
>>> +                0: VP/VN
>>> +                1-16: VAUXP[0-15]/VAUXN[0-15]
>>> +              Note each channel number should only be used at most once.
>>> +
>>> +          xlnx,bipolar:
>>> +            type: boolean
>>> +            description: If set, the channel is used in bipolar mode
>>> +
>>> +        required:
>>> +          - reg
>>> +
>>> +        unevaluatedProperties: false
>>

