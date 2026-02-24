Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0B3F3C985
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuWOfNLccEzaCXC2ud0KMqNaPtExWrx9+o0WPAXD4Fw=; b=MSQxLnqyqujzZIfgcUPGdJl3LS
	/XaS7HuHBw1oxEDgKYtZPJEB4x2h9+MaDcCU6HA2zdc8mi0NulgjphpjJNUPOWuI7/drU+KuMp0X4
	5TPVD39F2zTMYc+65F3eU/dSpijmI1sCxKmQ+uXcdlaORlFrnqMHK5i+1Zl+0e7dDsRHQxMm8qQWg
	3JUO7MhPuYr2NoawrPuNw2AJgm+cD9JDdwMyj+9i2rrL9h5Fl2SuGt91yGk5MhgeKEjBzrP7Qg6xd
	PaWbc9UGqOX/qZIrNRhYO9e3QQZBy7mX87TYPoUp1QVN1J5b8hzIUA71QDfFOFyiR1/fsHMzGbHio
	6Rm7AbDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutei-00000002Fys-2Fmm;
	Tue, 24 Feb 2026 14:44:56 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuteg-00000002FyJ-1gpU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 14:44:55 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2aaf43014d0so38495325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 06:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771944293; x=1772549093; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XuWOfNLccEzaCXC2ud0KMqNaPtExWrx9+o0WPAXD4Fw=;
        b=WnIwLMoUyfwdpsX/iA0qIUOxM2A0Nq5A+hd1ce81SNn/zE5OFl5UJQGT6PNQmHva+e
         XM+GzzJTlnDrfRovAxWM4eoW3hIh1lYsBil5/t3VGeu+PKQorEOTk+Aj/z/33LwJCveH
         t6flhhipgdCqs206ARDWCPr0TxGRMm/SuuS1u/VKvXp5fKXdHKILuS3bDixCdWeTShbL
         vDYd+HUBLXwgbUH9iPVXifjpfo+862WL8VI1uWcBvpXUsVtaZGQxmD/mBEI7g6uIPonm
         mEnZDlCh7gOQwvI8G6vhjOL/Ynew/41arYvEdB+V5TG4jjvSipEwKKClBMPVAGHCgOem
         9u3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944293; x=1772549093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XuWOfNLccEzaCXC2ud0KMqNaPtExWrx9+o0WPAXD4Fw=;
        b=MEWogp6T9IyWOx1FZFAxeLiRK6HilL64kQS3UUoecWimR8AT7ya+iA5+s2kfdJI7Qx
         KZ7Klg3QXI8+ShBY3agUn7vFhcPNreBADVFq0s2P1T+fKMbGfYb/spR+sxVLo56QFsTv
         gW/fwnhdnQpDlI4xLCM2oN6fJI1FS7aTKInSUYR7TFmzaHDyIAZqwqK+MwIeV0aQDe3E
         iDTjnxIl1tNbCw2gMVuwkMIBcbqz4XhH2YAoHfkt7tQ7BG9aqnu7S4xJnCBsPyHitgUP
         Q8h8WfE8xO7ub6j+zQwgTm9YEMIr6JUWYFXPo1T+v1Foaa12WgjQPNtoH3u4c8AOWV59
         +4wg==
X-Forwarded-Encrypted: i=1; AJvYcCVzdIov+K+gXmnGmZj6lCQXrBItkqY5dsior/MPbyJ+TYfwX3Yso4QzcJoZv2iXGZA4MTxzueUz+pKP6PhKO3SL@lists.infradead.org
X-Gm-Message-State: AOJu0YxtO6y7Mgq3APuUKIsrTG0NWC7KOl6e8R0CEToRdUSPvRV6viUm
	O0mOC719HWtYRzNN5CTYQREHTZxh10GiZ1IL9F3res2yWHVxV1P9I9pw
X-Gm-Gg: ATEYQzxI5iRUEC91+/xvbczD0cUASSw/sT9keeX5RDrkqBMtOJ2APOXWiNTT97WL/w6
	Vemx9mYiJbtyBxSDP9iKYaFpAiSlzG3ebrle5v7bnyZ/81IEFF+JcYR6PDvSCPm0U+TEd32w/QH
	pwjqGCMu8WkcxYv13Ja5sgis2yTOlC2Uu+Qp3c19qAZxoTlr23HdWI76oSDWB4mIdLHXiL/lQTg
	LiQ2WQAOTIvdzWvGsp2uI15jPX7FC57LL1azcyVUcaSjh72JtVKg8yeUzs3893MtJl1nzzOSqf9
	aRZbRKqKIqFd1ki515dXpRa9myqMPKg7GiZXB0E29z7XE+SPCJPN1BujNjedh/0cIF7EiSt+YZE
	j2jpVc8dkcsvRQsvUcQ91K9BGpKUesINaz8nLaJoCkG5uCmeqlQ8zro8RTitZ/WHG3enDS979rf
	bO+COfNeVQoi0QV+cA+Wq1UR7TiggPjDGFIKrbaE+qavwERIN8clOLK8rUJr/dSBPGkBUO5iZc+
	WiViiTH
X-Received: by 2002:a17:902:cece:b0:2aa:f0ec:3701 with SMTP id d9443c01a7336-2ad743e22cfmr128236535ad.2.1771944292984;
        Tue, 24 Feb 2026 06:44:52 -0800 (PST)
Received: from ?IPV6:2401:4900:8f4d:6bb:6d92:919c:951b:7d96? ([2401:4900:8f4d:6bb:6d92:919c:951b:7d96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e1d6sm111918585ad.58.2026.02.24.06.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 06:44:52 -0800 (PST)
Message-ID: <4b16c937-6195-4307-88d2-874052203543@gmail.com>
Date: Tue, 24 Feb 2026 20:14:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: arm: microchip,sam9x60-pit64b : convert
 to DT schema
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com>
 <20260217-arm-microchip-v1-3-ae5d907e10e3@gmail.com>
 <20260217-surgical-gently-7f58e6fb5e5e@spud>
Content-Language: en-US
From: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <20260217-surgical-gently-7f58e6fb5e5e@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_064454_452079_235B7164 
X-CRM114-Status: GOOD (  18.69  )
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


On 17-02-2026 23:23, Conor Dooley wrote:
> On Tue, Feb 17, 2026 at 05:24:21PM +0000, Akhila YS wrote:
>> Convert Atmel Periodic interval timer of 64bit (PIT64b) binding to YAML
>> format.
>> Changes during conversion:
>> - Add missing compatible "microchip,sama7g5-pit64b" along with a fallback
>> compatible "microchip,sam9x60-pit64b".
>>
>> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
>> ---
>>  .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 71 ++++++++++++++++++++++
>>  1 file changed, 71 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml b/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml
>> new file mode 100644
>> index 000000000000..6bf8e81d4c72
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml
>> @@ -0,0 +1,71 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/microchip,sam9x60-pit64b.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Microchip PIT64B 64-bit Periodic Interval Timer
>> +
>> +maintainers:
>> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
>> +  - Claudiu Beznea <claudiu.beznea@microchip.com>
>> +
>> +description:
>> +  The Microchip PIT64B is a 64-bit periodic interval timer used in
>> +  several modern Microchip ARM SoCs including SAM9X60, SAM9X7 and
>> +  SAMA7D65 families. It provides extended timing range, flexible
>> +  clock selection and supports both periodic and one-shot interrupt
>> +  generation modes.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: microchip,sam9x60-pit64b
>> +      - items:
>> +          - const: microchip,sama7d65-pit64b
>> +          - const: microchip,sam9x60-pit64b
>> +      - items:
>> +          - const: microchip,sama7g5-pit64b
>> +          - const: microchip,sam9x60-pit64b
>> +      - items:
>> +          - const: microchip,sam9x7-pit64b
>> +          - const: microchip,sam9x60-pit64b
> These three can be merged into one enum + const items list.


Okay.

>
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    oneOf:
>> +      - const: pclk
>> +      - items:
>> +          - const: pclk
>> +          - const: gclk
> This can be an items list with minItems: 1, but there should be some
> conditional logic used to permit gclk only where it is valid. The text
> binding removal is missing so I cannot say exactly what that logic
> should be.


Okay.

>
> pw-bot: changes-requested
>
> Cheers,
> Conor.
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/clock/at91.h>
>> +    timer@f0028000 {
>> +        compatible = "microchip,sama7g5-pit64b", "microchip,sam9x60-pit64b";
>> +        reg = <0xf0028000 0x100>;
>> +        interrupts = <37 IRQ_TYPE_LEVEL_HIGH 7>;
>> +        clocks = <&pmc PMC_TYPE_PERIPHERAL 37>, <&pmc PMC_TYPE_GCK 37>;
>> +        clock-names = "pclk", "gclk";
>> +    };
>> +...
>>
>> -- 
>> 2.43.0
>>
-- 
Best Regards,
Akhila.


