Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99D7105F7AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajhis7YBLb7dOjMFcfePYTC4MgS14P3pGiFFUMVogos=; b=Cp9DLXeW0h+yIWUKj/hCQVs9oV
	sIMPjSLgfd5KZp+HOmKrtjZLUXA3HLDRYn0buEavw1W3oFdTytd4cjCjlFPPKnMyoYmds5qCmrMRa
	/FryCsC4LkEGENHcfoxg0qZg7apBl+O8IyhplGvmGeT1IVbqCLGtMDafv2GXYIXGklmIPMEve5tZr
	qym5YQj9gyx4jFOl+13r1Umf+kmFSab/rVFH6KaeZqczP3+NYFWO/veisUdnNNKkP4sCNR8vHmsCB
	xbeJanUiPi/HWE9slaofeQurEkcuP04Y6fAVcrTLA3N2n+mpVao8rmhl0ZdR3sETntXUka1Q20/ce
	a3U6W3JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Zm-00000000FAu-11sT;
	Fri, 13 Mar 2026 13:29:14 +0000
Received: from mail-pf1-f169.google.com ([209.85.210.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Zj-00000000FAQ-3Azp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 13:29:12 +0000
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-829865a8471so2064324b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 06:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773408551; x=1774013351; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ajhis7YBLb7dOjMFcfePYTC4MgS14P3pGiFFUMVogos=;
        b=nnNs1v1GqgeYTVVjYapQYRGytHSYBJGlq4n63zn/vysFViZGlZTLYHg1dkAeOE3BWI
         NDZ2KVTE3XT1lPtgPHM4JKsAHBHhMYGij4Ht5CBYQZlEzK+ofwqzorBNCewS4I7yLt7L
         4qb/hBD5SAtZS/SKaASXLiA9EIytlK36am23NOHKaQ+1+vrMZTP8XK+MsjQfuL1Tn0Ch
         NKTj9naiolixjqMi2uzfERNd5wq/ojhy7Ry2nent78IZkfq18X5VkgJCPpSmoUiLTgsG
         s2i8SWrHSdZTVwAnk2eBrDnEbuR/L8VuQtjzfMpPpF2LVZ/0RBJozZbxBCUakdWHa7eW
         HzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408551; x=1774013351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajhis7YBLb7dOjMFcfePYTC4MgS14P3pGiFFUMVogos=;
        b=fjxs0Ym8bJJylyuspvqast6YAGCVeSx8KzeqMMYGbteB92AnjS7KXb+qq/R4MtvB4K
         gUy3JTl9t7UMfwAkgku2sIChsxKfxkMmHDbNhfzWEDF3RpeebvY9WYuG+zLJYP9+Mdvh
         nzmOdryIgaKZXmXFwn/dwmRCjj9SHAxbBR/Uqk2hyV79Dy0PI0yzcbLH9emVNZ5iXd3L
         b/OUzFathZxE18Q43WwZQN5yw73zFFWVIEnYxQfj2EQUEP2XTA+Lu9lGNbv0NhDgdvqy
         p/USSwjeEyR+VdGQmqVX3kNE91YlhCBahFMSW6jm3HYVhz2R4W4j4a3eKo230x308rJT
         nmJw==
X-Forwarded-Encrypted: i=1; AJvYcCUvq08VGGXJX0l10UPzaaxjzwqavXxg/+ku+T6IUkWqeTa6sQaAEZw268eh0JcnazbDI0LV6N8LYPUl0J3uyt8t@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6IYNGJQG6yAa5V7WhLOU50fZt+YCdTtYD6zKoG0PeYX4ny1lT
	y0qhD4q56OylvxvbvuxId5GsnX7XKz+pPDGGItFxezGVx6JU82PYSwOK
X-Gm-Gg: ATEYQzxE4ILS6wA4H86/zftJh2hH3IT73bZcj8Or2cLgg/aeuOfNvyiEdeQM5Z3xLvD
	kfJWtgmoqyqlmuuLx9mDJV0gKA5hcVb16uV1+NQqG3mNi445TbGObR0LXLwL2MI9X2qwtTwT2n5
	c3zQL7vyK1YfIhlx9mBHApbsd8FROP4AvacQNnZRFVI8ZeEg3vkfAEFbaVbIMwlwjnKnz1TcpdK
	XZ6wMf/S0nEg2MtbAMaO3XY+a6Tiy1ahvtF03TET0FPGZ6NkXlKMLZnjP2R3hb3xknuVRUnZJWS
	IeZ6VEIp/1yVYW8tScojQtG60GAACyuKsg9euGWyQ7NmVOF47WlA8k5r7I32MgaCaFiDc68Z8eh
	AdDcFeO9fqi7+pmaDR2M2XNGHUvtxlgDMy8aQgRw9RDYEevIH9SUZuWklYSvmXCrOJoWIgPb3pl
	Jp24TqXiSJYKZD2ZnfU4+PGhGO4iyooC8u4/1WG8K8pMFMfb9nKYKCs6E=
X-Received: by 2002:a05:6a00:94e3:b0:81f:9b09:ad02 with SMTP id d2e1a72fcca58-82a196f589emr3056858b3a.1.1773408550556;
        Fri, 13 Mar 2026 06:29:10 -0700 (PDT)
Received: from [192.168.1.5] ([27.7.215.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0738bca8sm5870880b3a.60.2026.03.13.06.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 06:29:10 -0700 (PDT)
Message-ID: <db8639c3-c7b1-446f-b178-d1e47fae776d@gmail.com>
Date: Fri, 13 Mar 2026 18:59:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] dt-bindings: usb: atmel,at91sam9rl-udc: convert to
 DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Herve Codina <herve.codina@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
 <20260307-atmel-usb-v3-5-3dc48fe772be@gmail.com>
 <20260308-cherubic-misty-cricket-80fad0@quoll>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260308-cherubic-misty-cricket-80fad0@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_062911_802678_6A08CCBC 
X-CRM114-Status: GOOD (  16.46  )
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



On 08-03-2026 14:59, Krzysztof Kozlowski wrote:
> On Sat, Mar 07, 2026 at 09:16:22AM +0000, Charan Pedumuru wrote:
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 2
> 
> Drop

Sure.

> 
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    minItems: 2
>> +    maxItems: 2
>> +    items:
>> +      enum: [pclk, hclk]
> 
> No, list the items instead. Why is this flexible? Nothing in commit msg
> explains that.

Some of the DTS files use those clock-names in different order, I will write this in the commit message.

> 
>> +
>> +  atmel,vbus-gpio:
>> +    description: GPIO used to detect the presence of VBUS, indicating that
>> +      the USB cable is connected.
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/clock/at91.h>
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    gadget@fff78000 {
>> +        compatible = "atmel,at91sam9g45-udc";
>> +        reg = <0x00600000 0x80000
>> +               0xfff78000 0x400>;
>> +        interrupts = <27 IRQ_TYPE_LEVEL_HIGH 0>;
>> +        clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
>> +        clock-names = "pclk", "hclk";
>> +        atmel,vbus-gpio = <&pioC 15 GPIO_ACTIVE_HIGH>;
>> +    };
>> +...
>> diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
>> deleted file mode 100644
>> index 12183ef47ee4..000000000000
>> --- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
>> +++ /dev/null
>> @@ -1,125 +0,0 @@
>> -Atmel SOC USB controllers
>> -
>> -OHCI
>> -
>> -Required properties:
>> - - compatible: Should be "atmel,at91rm9200-ohci" for USB controllers
> 
> Why do you remove OHCI here? There is no conversion of this compatible.
> Don't combine multiple different changes in one commit.

I will remove each binding from the text file for each patch while converting them.

> 
> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Charan.


