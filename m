Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C99BE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpephPbr8Jh4XgfdsqtKilUmRrp2rdQXAGdN0OMY/vk=; b=2Bb9eIrtBOfjKkD871lVTYu+Rp
	kBCciu+B9D5HpgPITxjCN/SjCI92f1PqtPIVq8XMoeg+C6TDPNQj6mi2ljVLDV5RDtIPM23OYspgL
	5pQChABcMPXO7ufnMZNwX/TVevfhQWefduTLf4rU0n7CZ7wiGOVe3PFFJ1fY2eNF0IEySr/5AlElX
	yGGUc3xyoHGFs8ZJlWRvnlt1XMbO3YQZRgITzX7JOMLkk7B3swcW4iqRUFcoa51rWq4dlRPRjcDrj
	vvsztj0heC/jb9l8blssSanMqB05JbkXQn+oQJNHomZGLr8hRZz++GjsEZpOKhE/TiZLetG/YgTNU
	H8+vywiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2Hv-00000003Jec-0ii5;
	Fri, 13 Dec 2024 09:48:47 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2Gp-00000003JSx-1kBU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 09:47:40 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so2139009a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 01:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734083258; x=1734688058; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kpephPbr8Jh4XgfdsqtKilUmRrp2rdQXAGdN0OMY/vk=;
        b=ME1ZNZ9MzdYHd1BxQeAA6V3xNSilZb4aFZRrzyFvo0FH3/8px2/GNWpWaickSya4dY
         leafNaNIXR/A6hZgzputSgy8X5vs/bHzKd+F7aJnytQL5Rl1mnUFJGZIFveR5XEqqXui
         Qv15TmaKP2ZsrZweKrfKCEHEemudzeFGdNbWMc2xQvQQFirPbuhrfLEtI9V4b2M2c6Ck
         stiu1a0rOSrzGp9hMrRASxU5Ykn7EpA5T0xEKtiinIdO+ejalaoWKj7h8mEqw1iP1C4t
         z8Kl/VBpd2rMq1QmD+YY7U55qtgefhukExPTE0KnKVM3tTIBfqKys1UyFTREaatCKHaj
         Me+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734083258; x=1734688058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kpephPbr8Jh4XgfdsqtKilUmRrp2rdQXAGdN0OMY/vk=;
        b=uZk6nJB/dFDoQU2ZOLfqZWHQH57K/snAL1mZjBQqhS0uvzxti9j1BOprexX6bMT3Zz
         1uT7lDgJW1qMroIkNg71Gd3HhufpBhT/pQyNiYCL76C7+zPk1IVXxn3DrahGNtS+Spcy
         o35x0kVqPiiCZ0cCHKlvHm5Hf96qjBtAggfi9Y6yOxfhkykM9SFjJSkf1xBbUEvURhZG
         8DaFBZn80NUkT1SXx5g05ncoMh5A/Dg4p7faD3VDrls6HxHkrFxR+7hrsWd36+jntDI2
         o8x/jVBLgz6BKcd/du+EivJPMkq0bYwYktF37RmT1gIG2ADpzLeOimyCAz6x6T76Nd9T
         xxbA==
X-Forwarded-Encrypted: i=1; AJvYcCUtXRBQqOgZCo4u4N40zqkuur2JB7K9dubLs3IvHfeVTPIKxBToCygxUpi8OUpzDxqwenhDvJ30lbqKZ391AMDE@lists.infradead.org
X-Gm-Message-State: AOJu0YwzWtkQAIrhIEBpCNuAyDETd7JCpVpTdEA1IBWSqu1Abb33Ejpa
	8rWWrY+zwoPrCuTknNRApr0ECPeRR9FqBrq+BkegFBin5TZEMP6z7jEO+VrO
X-Gm-Gg: ASbGnctXxqajjLOHSgCg4O0uRzSqnyV3Dx8SuJvjwLTDZ5S5BitBxy7iJcCIDyuOjJx
	BUFrbFMdyMQUtwAM4qZU01kAk3MctJZIGKK01AXrN5FeN+x51MxzEL02GJfUHI9LInFdLjoAadv
	4lRtlcU0GzlD54h0GQ1xkeddhOR0EifxN2HgD5FdRZgEL0whPmf+tVVfZjc+oNZtuchSjnu2+DJ
	KZVCj14iqTrppswJf4E9vG3F03kdoDU6nA8B+NIsltjcKcdxrkHioiRWhycdm1byj5V
X-Google-Smtp-Source: AGHT+IFbJyb8LbVaxZmbBTC8001dyPPQdOCNGCC+QQjAz4MNlXdB1nD7gssl9owCB/VTMauuYyt5IA==
X-Received: by 2002:a17:906:3112:b0:aa6:82ea:69d6 with SMTP id a640c23a62f3a-aab77907a5fmr190336166b.18.1734083257326;
        Fri, 13 Dec 2024 01:47:37 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3bc829433sm10177180a12.38.2024.12.13.01.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 01:47:36 -0800 (PST)
Message-ID: <7753293a-0ab1-48b1-abcd-a9cd544cc356@gmail.com>
Date: Fri, 13 Dec 2024 11:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: soc: samsung: exynos-speedy: Document
 SPEEDY host controller bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Maksym Holovach <nergzd@nergzd723.xyz>
References: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
 <20241212-speedy-v1-1-544ad7bcfb6a@gmail.com>
 <207354ad-e363-4156-ba6b-86dbaa13ab95@kernel.org>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <207354ad-e363-4156-ba6b-86dbaa13ab95@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_014739_466174_F606E660 
X-CRM114-Status: GOOD (  24.03  )
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

On 12/13/24 9:40 AM, Krzysztof Kozlowski wrote:
> On 12/12/2024 22:09, Markuss Broks wrote:
>> Add the schema for the Samsung SPEEDY serial bus host controller.
>> The bus has 4 bit wide addresses for addressing devices
>> and 8 bit wide register addressing. Each register is also 8
>> bit long, so the address can be 0-f (hexadecimal), node name
>> for child device follows the format: node_name@[0-f].
>
> This wasn't tested so limited review.
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>
>> Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
>> Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
>> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
>> ---
>>   .../bindings/soc/samsung/exynos-speedy.yaml        | 78 ++++++++++++++++++++++
> Filename must match compatible.
>
>>   1 file changed, 78 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..304b322a74ea70f23d8c072b44b6ca86b7cc807f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml
>> @@ -0,0 +1,78 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/samsung/exynos-speedy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Samsung Exynos SPEEDY serial bus host controller
> Speedy or SPEEDY?
Technically it's an acronym (Serial Protocol in an EffEctive Digital 
waY), but we could agree on if we use the capitalized or uncapitalised 
version and use it consistently throughout.
>
>> +
>> +maintainers:
>> +  - Markuss Broks <markuss.broks@gmail.com>
>> +
>> +description:
>> +  Samsung SPEEDY is a proprietary Samsung serial 1-wire bus.
> 1-wire? But not compatible with w1 (onwire)?
Nope, I suppose this requires more clarification, as explained in the 
previous letter, there are several differences between the protocols, 
looking at the Samsung patent. [1]
>
>> +  It is used on various Samsung Exynos chips. The bus can
>> +  address at most 4 bit (16) devices. The devices on the bus
>> +  have 8 bit long register line, and the registers are also
>> +  8 bit long each. It is typically used for communicating with
>> +  Samsung PMICs (s2mps17, s2mps18, ...) and other Samsung chips,
>> +  such as RF parts.
>> +
>> +properties:
>> +  compatible:
>> +    - items:
>> +        - enum:
>> +            - samsung,exynos9810-speedy
>> +        - const: samsung,exynos-speedy
> Drop last compatible and use only SoC specific.
Makes sense, for some reason I didn't realise it doesn't make much sense.
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    - const: pclk
> Drop clock-names, not needed for one entry.
>
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#address-cells"
>> +  - "#size-cells"
> You do not have them in the properties, anyway required goes before
> additionalProperties
>
>> +
>> +patternProperties:
>> +  "^[a-z][a-z0-9]*@[0-9a-f]$":
> That's odd regex. Look at other bus bindings.
Okay, I'll look into it.
>
>> +    type: object
>> +    additionalProperties: true
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 1
> maximum: 15
>
>> +
>> +    required:
>> +      - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    speedy0: speedy@141c0000 {
> Drop unused label.
>
>> +      compatible = "samsung,exynos9810-speedy",
>> +                   "samsung-exynos-speedy";
>> +      reg = <0x141c0000 0x2000>;
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
> No resources? No clocks? No interrupts?
Will extend the example.
>
>
>
> Best regards,
> Krzysztof

- Markuss


[1] https://patents.google.com/patent/US9882711B1/en


