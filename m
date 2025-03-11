Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281EEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 14:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hzo6Koa6NINZprXYYSZB+aJdwboisxt85bCqIMCOfvY=; b=fTOkjU6hC0PgJYS77j7ng1KwPq
	ITVjYoyMEX6IeqPN/ues3WkpqBLB1O4n/A2IegbtEe9L37uXQDp4ksgISR8f2+IKwAx79I4yn8Hs7
	vyKnpWEgYnfJqVhfnjNiDiQEXH0J4kP6eXFTQzXz3o8UrAkYpAhZgYLIOtgsxAN0P+bithBo7nEG5
	kiV5bkNvvB/ZC5EzSXeftBNhFWxxnn5v9MHx8PH8vFY4gZHC0WoyVQ0SBrE5iHxe1tQanpw6d9kM5
	n3LKAapGQfN/fcDMPQz0rtd+Zy3exO8mHcaqBi3H3x+okyBeCnX7s7MryBCEQOUhh6io9O1mW57YE
	OteGeyRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts13a-000000063LW-0cSF;
	Tue, 11 Mar 2025 14:58:10 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts11I-0000000636D-3Fn3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 14:55:50 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22548a28d0cso16741825ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 07:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741704948; x=1742309748; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hzo6Koa6NINZprXYYSZB+aJdwboisxt85bCqIMCOfvY=;
        b=cy/8FqTN4XCaJVw1fxI5DCP899MggriDDB0fOgGg1/oM/+xJEaFtE0sEsdkeiv0zvA
         R695AKI2LRp3+7eIUmIa0W7X+uHRIcmoikzT4c13w0b8dJseUXpBKoL/4SkqX196R2gk
         TgFAO8cEdUCXvORUaRtrv3sQrWhbPdlVAK2OKlgm1oMczmULRuXbJT5vOzMbGkE2Hk+S
         73iW2jj5gULsQbzF6A89QbDgaQJO95fZdCAmrTnqg9cctq8aktZjiFgguAIkwFowL2h8
         Wc5rbOhihvaSYWs62pMAFdF36SOPG6xE0GtGwyfD2jS5M5tizJa0wUvRB2ad2bRIiB7p
         U/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741704948; x=1742309748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hzo6Koa6NINZprXYYSZB+aJdwboisxt85bCqIMCOfvY=;
        b=v30NQopa6ml8j6aOtODOMLFMFst5DagfaHnEylt4Rix4Nm/dMUSkB8UQ2Z8dPTcqxn
         4jYyKMMexSn5e4lE9J9OpvS7x+K6O4bRZhthdlSlisiU8aLUf5HDdnu61TMluSzEfWX7
         3CWsD9NqugyRxgzxOVheH/+wtP+TdSkd8xwj8j9b+CI5WUW6XDZT1ZaVVc2kj0tchVKu
         BCK9Ug9ZZWZR84yoMt5ig4rmE/iwSwRqWhvAddqWIOjoxUzo/jKghPw3JaSgJQ/OFaWH
         foFxZnD/8RbgbR9RZHv+9VW5vf3rbcN/2ogZe7R0MiUR7fkIAZ+mSUIGHfsOTejJ8Tzx
         db+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLdrQ63121r+l2d7Xu2W+kWdlAKKcbR4xPnSSUFefK3jywRUAd7B0oKjYC0Yn3KhSs5BDoCHXiqA49WXOqZICo@lists.infradead.org
X-Gm-Message-State: AOJu0YznE9Qw5MB9oJ/+C1ySXpa3mtgCOr3bJF00BRen8iWtH6oJKRDR
	WORX8hqkRmLLfqkpZaL+pVGrZ1Ovv7iMyguReqel9mYIgm2nUOuqYEg3qFd7v0Y=
X-Gm-Gg: ASbGncvAH6faMTWUvU6vQAkPLUE5yU1ra6Nx7IqmsaVM6sRAyEgCMwDEB5pZC/u6r7/
	XcZUh79PghS+3ky1HNRUrDhKhCT510irdXGPtlgDKCREyBEYyFlaXhIrq9QQU49UA7DNydxSKXK
	DdtoJ9XDgtoL8G7tnAhZA+n+wffTREjAL5zWj4wRhpIkK4HRWJfO0gRKYAqj0Rs2Q5YDBj8oIrn
	IEWP+LlN1aSBp1PqklFkDhA4jLr6O29DMFVzC5ZVZ9Q+izE3A6XmaOaQLWj0ZLGjpdHkGP7+WJM
	OUW5p4ktiS34VMBeFMo9Ifupl/knAuIHwRES6Q5DzXCUpeiGtZXt8ZhkgBh6Eyg0Y0YIGta41r3
	CSIhxVRhX/NuoT9qXTJ68hHD5bvVrMI8WVTo=
X-Google-Smtp-Source: AGHT+IG12pcP/IsHswOoDOYsHQYJiPWDj9HXG8bOa2WH0Yl93cwpD4niPBh9L7Y6old776/q/7HTmg==
X-Received: by 2002:a05:6a00:194b:b0:736:5e6f:295b with SMTP id d2e1a72fcca58-736aaa5d6c4mr27328562b3a.12.1741704948033;
        Tue, 11 Mar 2025 07:55:48 -0700 (PDT)
Received: from ?IPV6:2409:4080:1188:3708:6163:78f8:b3ac:ec7c? ([2409:4080:1188:3708:6163:78f8:b3ac:ec7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73698246387sm10404620b3a.72.2025.03.11.07.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 07:55:47 -0700 (PDT)
Message-ID: <47f6713b-b751-4791-9059-a128dd1fc71d@gmail.com>
Date: Tue, 11 Mar 2025 20:25:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pwm: Convert lpc32xx-pwm.txt to YAML schema
To: Krzysztof Kozlowski <krzk@kernel.org>, ukleinek@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, vz@mleia.com,
 piotr.wojtaszczyk@timesys.com
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250311125756.24064-1-purvayeshi550@gmail.com>
 <af6ebce2-7256-48bd-94d4-dc81e2944966@kernel.org>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <af6ebce2-7256-48bd-94d4-dc81e2944966@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_075548_816604_06409913 
X-CRM114-Status: GOOD (  26.99  )
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

On 11/03/25 18:52, Krzysztof Kozlowski wrote:
> On 11/03/2025 13:57, Purva Yeshi wrote:
>> Convert the existing `lpc32xx-pwm.txt` bindings documentation into a
>> YAML schema (`lpc32xx-pwm.yaml`).
>>
>> Changes:
>>
>> Add SPDX license identifier `(GPL-2.0-only OR BSD-2-Clause)`.
> 
> That's not a change in the binding.
> 
>> Define `$id` and `$schema` fields for proper schema validation.
>> Set `title` to describe the LPC32XX PWM controller.
> 
> Neither these.
> 
>> Add maintainers as per `scripts/get_maintainer.pl` output.
> 
> These should not be subsystem maintainers.

I have removed the subsystem maintainers and included only relevant ones:
      Vladimir Zapolskiy <vz@mleia.com>
      Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>

> 
>> Reference `pwm.yaml#` in `allOf` to inherit common PWM properties.
> 
> Not a change to the binding.
> 
>>
>> Define properties:
>> Restrict `compatible` to `"nxp,lpc3220-pwm"` using `const`.
>> Limit `reg` to `maxItems: 1` to ensure a single register range.
>> Set `"#pwm-cells"` to `const: 3` for expected PWM cell properties.
>>
>> Mark `compatible` and `reg` as required properties.
> 
> So it wasn't before? What are you implying here?

The compatible and reg properties were already present in the .txt file, 
but in a different format. I initially kept the commit message for them 
but have now removed it.

> 
>> Set `unevaluatedProperties: false` to enforce strict validation.
>>
>> Validate the YAML schema using dt-validate and yamllint.
> 
> None of above is suitable for commit msg.

I have removed all commit message parts you mentioned.

> 
>>
>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>> ---
>>   .../devicetree/bindings/pwm/lpc32xx-pwm.yaml  | 45 +++++++++++++++++++
>>   1 file changed, 45 insertions(+)
> 
> Where is the conversion?

Apologies for the confusion. I missed removing lpc32xx-pwm.txt. I'll 
delete it in the next version to properly reflect the conversion.

> 
>>   create mode 100644 Documentation/devicetree/bindings/pwm/lpc32xx-pwm.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.yaml b/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.yaml
>> new file mode 100644
>> index 000000000..3e41cd291
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.yaml
>> @@ -0,0 +1,45 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pwm/nxp,lpc32xx-pwm.yaml#
> 
> Filename matching compatible.

In the lpc32xx-pwm.txt file, the compatible property was defined as 
"nxp,lpc3220-pwm", so I have kept it the same. To ensure consistency 
between the filename and compatible, should I rename the file to 
nxp,lpc3220-pwm.yaml?

> 
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: LPC32XX PWM controller
>> +
>> +maintainers:
>> +  - "Uwe Kleine-König <ukleinek@kernel.org>"
>> +  - "Vladimir Zapolskiy <vz@mleia.com>"
>> +  - "Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>"
> 
> Look at other bindings - none of them use quotes.
> 
>> +
>> +allOf:
>> +  - $ref: pwm.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nxp,lpc3220-pwm
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#pwm-cells":
>> +    const: 3
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    pwm@4005c000 {
>> +        compatible = "nxp,lpc3220-pwm";
>> +        reg = <0x4005c000 0x4>;
>> +        #pwm-cells = <3>;
>> +    };
>> +  - |
>> +    pwm@4005c004 {
>> +        compatible = "nxp,lpc3220-pwm";
> 
> One example is enough.

Okay. I'll remove the second example and keep only one in the next version.

> 
> 
> 
> Best regards,
> Krzysztof

Best regards,
Purva Yeshi

