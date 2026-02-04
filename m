Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DF4E9539B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 13:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ftubfnbHJMifavaHfusKulTde0Z2b2i2QG/AKOLuw4=; b=oi30MfFyl5W2wDtTefaM/21WFv
	EQ9oAW5A9mlnW08jG5H5qlZjPrCna4Vuvb95N3FWrpE+VpCqw7M/oVrS4FvAktztGcbmGtDzqrTg7
	eciuRfIZvfulbseuVKawCVxhzFSE5CZDax5pDeOOiVeY6BBdVATBfexSX3B/1GRgm+wLXS+hB/Jn3
	4C4SP4/XZE5JjpTdSJ+ho8U2yifEVpQ5s0QaAmu0SG5RxhZXYh8NE2u3mSXhPqWs31/W8qDxBCDR0
	DrZUplEW3lEILlDjYPseqEJ/fdBSWPoSxKeqyvth+K4AVElvwV6FVz3bv38eEU904sLqKXJKxuDAN
	QoctiFUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnciu-00000008UCU-3msN;
	Wed, 04 Feb 2026 13:15:12 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnciq-00000008UAj-0kel
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 13:15:09 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c54f700b5b1so4376511a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 05:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770210907; x=1770815707; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ftubfnbHJMifavaHfusKulTde0Z2b2i2QG/AKOLuw4=;
        b=Lo3hE+pa1e1HiyeYO0zlnZ2T/6d32ZA8LK8jKyCZAWRW558eIoLpQMmtKSXXTOw1/Y
         uWxRQC8YmsKDKglu8GN7PDngVXzis+bMD/MTGBc4fShQMFNeVSVf3wJbA3h+yhnKCC5Q
         hAFEq9iMsszFUtE8JsI8NDCCc28m3QEQohlyLN2XapR8Xu2WaXJCLgesSgbHBtFDPoh2
         fzJEM82fOyRthy2FoJxCQH3E2Y5CvrSzitibjPNM8rc4HF1yIdACXRI943jMxs3DnbNb
         +aTF0fWOqqSpOL7VpjKB5oRDqUJig2MMhcK55ndD2e83x5nQ6jr1IrdB4WIMVvyDs7DR
         131Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770210907; x=1770815707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ftubfnbHJMifavaHfusKulTde0Z2b2i2QG/AKOLuw4=;
        b=FsGyw0EtpaZZaUGiFvpOsjVVwuQhnBhboTP/ZuPWqersNkuKf86/wGqhbGSOaDkFCF
         SKWoiAFRNswoto9g6NLkhRNaTAQLM1irDjRPqMoyG5eHfOlpmWHPun6f3nfGbnUi/txy
         YEOjTvgu/71px2UAYLvMY2KnbnDrWHNwfaaU0MemWZ4opMRS3W9KpGXg3LODm1JG6IBc
         Vo3vclGrtYUAQddOYf7v/MGumHSTB20vj+Re/a2Ax+rf0ZRe4qZyoV+RpkboR+LKZTZI
         AZsooh6XGOr3dI5zGrHkHeBhq1by5d5QNw/wm/1C5eRRsTVpn+IU68o/ByWjRLjXtYFS
         rpEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU51o2fNx5kE1axGwxEPl+1boVym6fwMUygC8JtsWJTLc2k1aHTL4x4oji50DjkwUMt5qIgKPdQQQLv7ERxH/3B@lists.infradead.org
X-Gm-Message-State: AOJu0YwzN9n0Ap4ADtOaGed6Bw5ptDOba/6QnWUSv3cPF8RoVRVO2ESd
	yNmPBD5xveZxyrsIu/JhVYiMOSC4DzcGOHZVnaWXk0WvTCKt1gK/08txLHlxtg==
X-Gm-Gg: AZuq6aL7XbshwUAp1BWUUjB1346GlnDJjtYmGF53rUzvVzT8KNXUtKqoFyiXgGsGMjV
	sRokNijnTeAmoxLOJ3TCajF4eI5P47naSrBzrurLGVHyU19CLeAW72Zt3VGmcpoUC7Tq+MFqfJz
	TGfi54MZolao8GIciR8aeX2/X26dJ2gPFln8c22znKhfaEwlYaxZPSmOfPxPTPkTNtnR0kyACjN
	PYSH68aZ/TbTXr9J9wx3ButZLzhC/MbcomTJxecd8LsjrknK0j7UfyGyO66rtTLsr9hsCcopYKA
	XUrQHkZuQ6OGer7ZoOOB6c0VCnfVVxmBc3MxkxSn2VCLcY0zw06WrAqJNGBKa28DO0xnyYOfE3Q
	jBdTJ1sA3HtmAp3TFWZrIzDN3IS3CJ5ulpAAWxOShA0t0xqVynlF9wc9UphjX7LdItwm3vAoJ0U
	KCvvaSBRIcVzSqybusQMyzfSlUCS9QaS0TWCI=
X-Received: by 2002:a05:6a20:9396:b0:38b:dec8:9d9a with SMTP id adf61e73a8af0-393724c1cc1mr2968310637.55.1770210906967;
        Wed, 04 Feb 2026 05:15:06 -0800 (PST)
Received: from [192.168.1.7] ([115.99.252.105])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c8553e888sm2101202a12.31.2026.02.04.05.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 05:15:06 -0800 (PST)
Message-ID: <7bb66a07-51c5-4e9a-b484-e96a8f12c783@gmail.com>
Date: Wed, 4 Feb 2026 18:45:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: usb: atmel,at91rm9200-ohci: convert to
 DT schema
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Herve Codina <herve.codina@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com>
 <20260201-atmel-usb-v1-1-d1a3e93003f1@gmail.com>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260201-atmel-usb-v1-1-d1a3e93003f1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_051508_225290_07F49606 
X-CRM114-Status: GOOD (  22.25  )
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



On 01-02-2026 17:04, Charan Pedumuru wrote:
> Convert Atmel AT91RM9200 / AT91SAM9 style OHCI USB Host
> Controller binding to DT schema.
> Changes during conversion:
> - Include "usb-ohci" as a fallback compatible to allow at91 OHCI
>   driver matching.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../bindings/usb/atmel,at91rm9200-ohci.yaml        | 85 ++++++++++++++++++++++
>  1 file changed, 85 insertions(+)

Hi Rob,

For this patch, can I modify the existing generic-ohci.yaml file to include the compatible "atmel,at91rm9200-ohci" to it and define missing properties, as the fall back compatible "usb-ohci" is already defined for other vendors there, can I drop this patch and make changes for generic-ohci.yaml file and include it in the patch series for the next revision?

> 
> diff --git a/Documentation/devicetree/bindings/usb/atmel,at91rm9200-ohci.yaml b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-ohci.yaml
> new file mode 100644
> index 000000000000..f04de6d553d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-ohci.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/atmel,at91rm9200-ohci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel AT91RM9200 / AT91SAM9 style OHCI USB Host Controller
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +
> +description:
> +  The Atmel AT91RM9200 / AT91SAM9 OHCI USB Host Controller implements a
> +  USB 1.1 Open Host Controller Interface (OHCI) compliant host interface.
> +  It provides low-speed and full-speed USB host functionality and is
> +  integrated into Atmel AT91RM9200 and AT91SAM9 family SoCs.
> +
> +allOf:
> +  - $ref: /schemas/usb/usb.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: atmel,at91rm9200-ohci
> +          - const: usb-ohci
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: ohci_clk
> +      - const: hclk
> +      - const: uhpck
> +
> +  num-ports:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Number of downstream ports supported by this OHCI controller
> +    minimum: 1
> +    maximum: 15
> +
> +  atmel,vbus-gpio:
> +    description: GPIO used to control or sense the USB VBUS power.
> +    minItems: 1
> +    maxItems: 3
> +
> +  atmel,oc-gpio:
> +    description: GPIO used to signal USB overcurrent condition.
> +    minItems: 1
> +    maxItems: 3
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    usb@500000 {
> +        compatible = "atmel,at91rm9200-ohci", "usb-ohci";
> +        reg = <0x500000 0x100000>;
> +        interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&uhphs_clk>, <&uhphs_clk>, <&uhpck>;
> +        clock-names = "ohci_clk", "hclk", "uhpck";
> +        atmel,vbus-gpio = <&pioA 18 GPIO_ACTIVE_HIGH>;
> +        atmel,oc-gpio   = <&pioB 10 GPIO_ACTIVE_LOW>;
> +        num-ports = <2>;
> +    };
> +...
> 

-- 
Best Regards,
Charan.


