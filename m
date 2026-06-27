Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219A6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 20:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zw1XUzdKzMRddxWO66mJGTZ0Kc7t/mjGgrDQTnuQhzo=; b=3+xDKQ6FkEHyHQM0hfEao73S0n
	VQ12ZibatAw3MIbUMCcVpy8gb/Tm9QxgjqR9042BUJ/IUkUI9kUSLuPWZiRd58nqWyVucAoLGo++G
	1WYGFohYEOuCdwo5DZfJW5CNznDtaMjrq5S1o1nCfSymcVk7uckdcBbd5hZOkztZnuIfGvZn/KdQX
	ISVKGrGl+3oPnENEv8KZzUKLgZwFA7Rbj8jcbEOiRs/Pu9Nt0yZPLTfJHJY2V0Cg51dXSxiLPUsaA
	r6HKQF/GeQqTgtowXAhzxttoN0m/iviC7u7pEt8pimcRsoAyo0n7djJEXo7qSIhXqfjrhaioh11vz
	9YGqxAlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdZHa-0000000CkO9-2tWS;
	Sat, 27 Jun 2026 20:05:42 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdZHW-0000000CkNe-0vF0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 20:05:40 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7e9c7e8eb21so202653a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 13:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782590736; x=1783195536; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zw1XUzdKzMRddxWO66mJGTZ0Kc7t/mjGgrDQTnuQhzo=;
        b=FDHRqyfN1HInLE2/ymJ51Lgz/9ShCphytwGMEUa5KDupOYY9i4zTGjuneuYrg3dOs9
         CMeTWy0ofVQ4N7Kbs/jsDSHEDzW9tsYfPDqHldlvPWgOWdTBVS8KWpPT/1Vns6V7Mq/l
         GYiORqS7RSHAQzAzzFZXXRXpr0t/rGOEA42VSXoiOCCDDhMmstobtWvlw96ERK7cIRWA
         Wz4yfA8Hw+HR6TckzSxngJRHlp4v83voZes9WxTnErPM6cjUUq2scREp/tFsP0TvD92t
         YZsQMAZhr43IsjJtqd8YaXZpKAM8mfX58zYlh/f5QWPQiXBSEKKGI6vTyRxZ5Ni1DjKS
         +d+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782590736; x=1783195536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zw1XUzdKzMRddxWO66mJGTZ0Kc7t/mjGgrDQTnuQhzo=;
        b=kcT68dp6gXvGtb8XId197XaS8cRmCskE3DhxbfjpBAL6UD6PBNsYSUiJ4vnTj/bTSO
         fxhrZRE60Rd+OTmE6HuQtdmOepmz7pjzkA+wnaFQgWFoYkqZaW/o9YMgO21l3In+nf2r
         wyr21J+5ZIBMrN9Evia1vxJ/7C9UBcbYZs15m9V1F8GE3DLOY+a54SqLY6bwxh8IMNdb
         E0FK7VXGkiuy1jw7NejspDH6fWuftT/HlKF/aaIdReK/8RyCNG2yjS+M948UkFVIa7x0
         51e01GF7kparMXXdKCx7NzI2qRpzV7dVgrtMRi6cjXNtT/N1Elv2cBRW6xTVPJ1Qq/Hn
         Be5g==
X-Forwarded-Encrypted: i=1; AFNElJ81A2md37Rvkg+Becz24e8449JanyfBSBS6n0KtOjTp098380ryW/AE+oR1vkkQ9m0wL7ltwjUo9sYoLx139NO/@lists.infradead.org
X-Gm-Message-State: AOJu0Yws6ArPIHmX1l5jfKcrukZmf4CqgbT4LO2K2S5MnaLLZfQN6rAN
	5XS52YKtP+7zoGlSjNLTzKKoSK2N/EEy023UOwsKU6OQmJjPtSFkOmzbBssIYua7WYA=
X-Gm-Gg: AfdE7ckj53kdpu29QcILaw1IMprDeYRuKrlNH55K9EXozXToP6a5bcbDfSQuWdTrDG2
	fAdwZhavBIujtrZlqLmIcYjzzbNWidjfugAI+GfSYHJBtvQB0+VGdM6hQH9Fr1Qs33pDgKZRuxZ
	7zmYGGta//UwRuvm6Myylh60MINqd0Gg2DuTktFHB4Nglrwwmmg43I+jfa8NOpS7oWJGNZOMtM/
	n+pO/bazUViq9U+y/7TkAIKz6F6y6ycjS+6B5bIWM7+iKHkjP+1vUnkZOFevcJI2/NGWoldYko9
	clzqB96J/IV1MkwLMtd2F8VB3rv2Na4lNzkonVw8hBnrV+Rp6bFxZOIqddLHTghClBIAbDdW633
	AuGrtwErpNG5my7ocn3iF57eP3aO0ipkPBx/H4a5cZiXsOz73losL1moTL0dr7CPCrlNHa6xfdy
	PqQnJo+p4VX1EhqBm2DOHdgy3W1UBz8wDRovk9fz5rYhDgMZoYWWdI3VFB2hT/D8I=
X-Received: by 2002:a05:6830:a0ca:10b0:7e9:b34c:ce3d with SMTP id 46e09a7af769-7e9b34cd128mr2742074a34.18.1782590736281;
        Sat, 27 Jun 2026 13:05:36 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:f242:ecd6:f61e:d764? ([2600:8803:e7e4:500:f242:ecd6:f61e:d764])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa57a229sm4889712a34.4.2026.06.27.13.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 13:05:35 -0700 (PDT)
Message-ID: <40485b4e-6585-42a1-9b84-3019328574c5@baylibre.com>
Date: Sat, 27 Jun 2026 15:05:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: Chi-Wen Weng <cwweng.linux@gmail.com>, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260625110638.38438-1-cwweng.linux@gmail.com>
 <20260625110638.38438-2-cwweng.linux@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260625110638.38438-2-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_130538_278805_4AB6E0DB 
X-CRM114-Status: GOOD (  19.39  )
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

On 6/25/26 6:06 AM, Chi-Wen Weng wrote:
> From: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> Add devicetree binding for the Enhanced ADC controller found on
> Nuvoton MA35D1 SoCs.
> 
> The controller has one register region, one interrupt and one functional
> clock. ADC inputs are described using standard channel child nodes,
> including optional differential channel pairs.
> 
> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
> ---
>  .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> new file mode 100644
> index 000000000000..ae7ad0f7689a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Enhanced Analog to Digital Converter
> +
> +maintainers:
> +  - Chi-Wen Weng <cwweng@nuvoton.com>
> +
> +description: |
> +  The Nuvoton MA35D1 Enhanced Analog to Digital Converter (EADC) is a
> +  12-bit ADC controller integrated in the MA35D1 SoC. Each enabled ADC
> +  input is described by a child channel node.
> +
> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-eadc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

Datasheet says there are 4 interrupts.

> +
> +  clocks:
> +    maxItems: 1

Should there be an optional vref-supply for the V_REF pin?

Should there be a dmas property? Datasheet says it supports
PDMA transfer.

> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  '^channel@[0-8]$':
> +    type: object
> +    $ref: adc.yaml
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 8

I assume 8 is for the internal batter voltage channel? Often, we don't
include fixed internal channels like this in the devicetree since they
are always the same and don't depend on external wiring.

> +
> +      diff-channels:
> +        minItems: 2
> +        maxItems: 2

adc.yaml already specifies minItems and maxItems, so we don't need to repeat it.

> +        items:
> +          minimum: 0
> +          maximum: 8

This (and reg) are uint32, so don't really need minimum: 0.

Also, I assume that 8 is for the internal battery voltage channel, which
wouldn't make sense as part of a differential input.

> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        adc@40430000 {
> +            compatible = "nuvoton,ma35d1-eadc";
> +            reg = <0x0 0x40430000 0x0 0x10000>;
> +            interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&clk EADC_GATE>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            channel@0 {
> +                reg = <0>;
> +            };
> +
> +            channel@1 {
> +                reg = <1>;
> +            };
> +
> +            channel@2 {
> +                reg = <2>;
> +                diff-channels = <2 3>;
> +            };
> +        };
> +    };
> +...


