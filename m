Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B248AC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oc49DJIwJicv0xAMtGUpshz9Iya5BjyoHaAoKmn9GSM=; b=I3sSZg3ZrJ4ZKJnFBlGaRmF40B
	hEFUfJw4iCdb9ZKuBf6OHn/+imzKGMJOGe3g610RfIPeQHS2LX5ndgymL4vB7UrULiD2Mr5NWMv8h
	eI5cothxfAa1+tSD30c2vtLhnYqxB/RWlR/UV/nI0aCx+/Hfs+9iDtqU/JJiQ+PxafLF0XwGwHzWe
	2gfeiJ5l1r2rNX1tt/CA2W7KTx26tssd17VgYClqxRL4XJIoVPXHEXYJDQzwLwqtVk45zkCTwirR1
	5YpUvfINdY/QUuygX5k+aZLfPWmDh2nmRORIEzeUj3s9jXd0f/WwvqdD7/hJEP/roABR/yttN5wCq
	UzEv8FHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8li-0000000DJ9r-2DkK;
	Fri, 28 Mar 2025 12:25:02 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8is-0000000DItb-0EKH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 12:22:07 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ac298c8fa50so347584866b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 05:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743164524; x=1743769324; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oc49DJIwJicv0xAMtGUpshz9Iya5BjyoHaAoKmn9GSM=;
        b=Fnjs/wPEMJNWH+carFhaOvb74FA1r90iReMi0DJj2UR98tf/FsXIxtG3nhCdpiL5Vo
         1IltyMjAfG5WMGfXdLTAYTqcVDt0hNDHgUB0mSXuLo+7p8kFSVMb+gUwB4AhAJ1LIoUk
         f4ai2QNRWryMvPnBZ4Ml9IK85VgKGS75SqSgkXPMS7dAhBCWGZfS39d7/9237u0L8N2h
         Wc5bUiIqbMuUbWBD0JAOqHWRAJfLNKmMRQLzEkT4eyRcnOsUBeCWA3pR78g2awdjX04L
         lMD5goN0jAnzQuLGLnAoo795XuKfEQOvUyCINosSVjdp+e9IFErS90EJU/TLqdJk+XFg
         F7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743164524; x=1743769324;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oc49DJIwJicv0xAMtGUpshz9Iya5BjyoHaAoKmn9GSM=;
        b=EJ9YI52RjKRLfFgYoVeCv1t32rMoWDaDH9X0vVKnCejN9+oZkB8M7OF+Ftfcuj0k/9
         pRdtIK/eeawy1Ckb3AMVYKNQhQRkYARpSUqr4Nvu7VqtnOEL5sdZcQGZfxxZQMnLxGyx
         iuifZKqG2sm8YKrOqpdk9Mzbsku7iilcouZyVV5szxWumA6zCDnFqUi5SoPW1nsJbZ/2
         NCRZz+03hUyDeuriaE9Btya+yPISDIhe7Ik7pWTsIJ+41XJl0HU4VdtCsolMPL4ea2iZ
         KdwTJaQwg76fb7Kn/b4uUZP/xgcvscWNfJ8O5+xnaYBr8A5Qr4aMUJ2Kvlykq/zyz1/0
         mOHg==
X-Forwarded-Encrypted: i=1; AJvYcCWoqLkHT6XKneyLnAhhUjCCX+TWQ1zNRizVhiPubq5KWWgoLiIx0uIb+loPSx1Hl/Rc5UEE1xxHSrGE+dO5qyn2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0C8k9AIK/MbYRLvn2Wg+CC//BCoMC1Ev6EnUUvjxyGzJCqX04
	7/aSZExuDYHwQ7KXhviRwd6IMupef57K/oBJ8VWnaCmbJ5wPp4Kx
X-Gm-Gg: ASbGncufs/02eIfIyuUy5deHKiMXAIQ19LUUw/T8gw0A2U1jnZ3xkyh2c0Kyf1cmY+/
	KUrIH8LSrQseuhw/B1M2d1yYq+jhYHXn9dXCIVHjAV7VoAJto62kkAc5Dw6czXnCYZtTjDBptRZ
	ee8YB80/lA2iQVvySGCOdBWusbRU+PqfIdbd1samHT+fYFNR4iZ7ChOdU68pt/TLqUwEAjd4TRW
	Fm4xZszA9Agk46sM8666ackYhyt2OEGKdZu39SWQXRyw6jR2QBYnYnT6vSesnYFMqelCOwD1Slx
	URs1WuA7ohpU4gD4qNR8QUHIjfoNy54sW7U6GTqcxEz0hBPjQxbIo6fOOHCSSKqgiznD
X-Google-Smtp-Source: AGHT+IGJV2RjrsEGH4G9E7FfOU9np25O3dZ+J8l0SIo7Gdk10tVsJ6ybpUSbflQFjN7lriWVMh6dCQ==
X-Received: by 2002:a17:907:7ea4:b0:ac3:2368:9a12 with SMTP id a640c23a62f3a-ac6faf024a2mr719727266b.27.1743164523493;
        Fri, 28 Mar 2025 05:22:03 -0700 (PDT)
Received: from [192.168.7.2] ([92.120.5.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b184sm159831966b.51.2025.03.28.05.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 05:22:03 -0700 (PDT)
Message-ID: <2301b0f7-1a76-4823-8d3f-d346f8f8e865@gmail.com>
Date: Fri, 28 Mar 2025 14:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: bus: add documentation for the IMX
 AIPSTZ bridge
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
 <20250324162556.30972-2-laurentiumihalcea111@gmail.com>
 <20250325032303.GA1624882-robh@kernel.org>
From: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250325032303.GA1624882-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_052206_095423_F5BC88E7 
X-CRM114-Status: GOOD (  25.78  )
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


On 25.03.2025 05:23, Rob Herring wrote:
> On Mon, Mar 24, 2025 at 12:25:52PM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add documentation for IMX AIPSTZ bridge.
>>
>> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 107 ++++++++++++++++++
>>  1 file changed, 107 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>> new file mode 100644
>> index 000000000000..c0427dfcdaca
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>> @@ -0,0 +1,107 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Secure AHB to IP Slave bus (AIPSTZ) bridge
>> +
>> +description:
>> +  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters
>> +  issuing transactions to IP Slave peripherals. Additionally, this module
>> +  offers access control configurations meant to restrict which peripherals
>> +  a master can access.
> Wrap at 80 chars.


fix in v4, thx


>
>> +
>> +maintainers:
>> +  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,imx8mp-aipstz
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: bus
>> +      - const: ac
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +  "#access-controller-cells":
>> +    const: 0
> With 0 cells, how do you identify which device it is?


we don't atm. We're relying on the default configuration.


we don't have any APIs for AC configuration so I left the

cell number to 0 thinking that the cell number might depend

on the API.


if need be, I can set it to the value I was initially thinking of in v4.


>
>> +
>> +  ranges: true
>> +
>> +# borrowed from simple-bus.yaml, no additional requirements for children
>> +patternProperties:
>> +  "@(0|[1-9a-f][0-9a-f]*)$":
>> +    type: object
>> +    additionalProperties: true
>> +    properties:
>> +      reg:
>> +        items:
>> +          minItems: 2
>> +          maxItems: 4
>> +        minItems: 1
>> +        maxItems: 1024
>> +      ranges:
>> +        oneOf:
>> +          - items:
>> +              minItems: 3
>> +              maxItems: 7
>> +            minItems: 1
>> +            maxItems: 1024
>> +          - $ref: /schemas/types.yaml#/definitions/flag
>> +    anyOf:
>> +      - required:
>> +          - reg
>> +      - required:
>> +          - ranges
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - power-domains
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - "#access-controller-cells"
>> +  - ranges
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/imx8mp-clock.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    bus@30c00000 {
>> +        compatible = "fsl,imx8mp-aipstz";
>> +        reg = <0x30c00000 0x400000>, <0x30df0000 0x10000>;
> It doesn't look like you have any registers in the 1st entry, but they 
> are child devices? Then you should use ranges and drop it here:
>
> ranges = <0x0 0x30c00000 0x400000>;


I guess this would mean switching from global addresses (current way) to

bus-relative addresses for the child devices. This wasn't my intent.


I wonder if we could just switch to V2 in which we just use the bridge's AC

configuration space and an empty 'ranges':


aips5: bus@30df0000 {

    compatible = "fsl,imx8mp-aipstz";

    reg = <0x30df0000 0x10000>;

    /* some more properties here */

    ranges;

};


or as Marco just suggested use


ranges = <0x30c00000 0x30c00000 0x400000>;


instead of an empty 'ranges' to restrict the bus size.


Personally, I'm fine with both approaches but what's your opinion on this?


>
>
>> +        reg-names = "bus", "ac";
>> +        power-domains = <&pgc_audio>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        #access-controller-cells = <0>;
>> +        ranges;
>> +
>> +        dma-controller@30e00000 {
>> +            compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
>> +            reg = <0x30e00000 0x10000>;
>> +            #dma-cells = <3>;
>> +            clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
>> +                     <&clk IMX8MP_CLK_AUDIO_ROOT>;
>> +            clock-names = "ipg", "ahb";
>> +            interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
>> +            fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
> No 'access-controllers' here?


no need for that unless the child wants to request a specific AC

configuration for itself.


>
>> +        };
>> +    };
>> -- 
>> 2.34.1
>>

