Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5DFD743FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 01:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcMRqlbCfDiojXUFV5zhu21WNiCGL5ZhoJbd9wpOjhg=; b=PxH5XTU07GhyEN5QjRyTt50RiP
	nMWch36L7tfGo/53grRIR2php0MCqOLkQ7u8l0QXCgurVhgQkXRb6ULF/UsQvS7tlYU9T9hN0nJTr
	4J1CcsVXNhOKmt2TuH/yJgMsJBwzpOVCd1J0CCmmkaXbamQ+MgSu3n5jMQdEnSjWbZQhdrsj+UrQ0
	0ILu8HgPIZxhufgKGwQZ4H8jHWmBuTMRdByM94ozK0ERRP+Sp589Cp38awysfSn9Mzt3VLO2KTS6C
	ZXjqdip++vBlEG09UQdgFUHLRRD0cS0afTX4cv6NfupopAt+7C+jT6GptMjeH7emL6QYYYgNISYtu
	3O9dIaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDwSN-0000000GZEQ-1UXl;
	Thu, 21 Nov 2024 01:58:07 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDwRR-0000000GZ9R-2SnT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 01:57:10 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7f45ab88e7fso345917a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 17:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732154228; x=1732759028; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wcMRqlbCfDiojXUFV5zhu21WNiCGL5ZhoJbd9wpOjhg=;
        b=exa1dqPoUZdJQYd7ZFaFFyjO/vVmZ6zeE/ssFPvab80BxGuC6xjvjfATeGYCEMW+pO
         egn7tR1f3V4A1vHKFofWLu7C/HEz5cZ2u6uOLpUnCVJE0zvT/igu8/VqBhqpjqONcd+j
         8Y4Wda86RyZynxU3k/ggy0Ismttdz2euuorRXiiVUqyMl4z9s0asGgJls/E+jpKx+fS6
         Gb9O3c580taHfJkAK+QKvtRLz7T62rwPFuUaR0S4t6v2EqIKI9nqLW3Nphem/PZ6AHQx
         D1rwZLqBvwsS9z64oKi7X1DV8ijYdwvQ4e43v4GJ5jKUe+yd/X1b4I+gTCTAxm9Eq3IT
         BEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732154228; x=1732759028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcMRqlbCfDiojXUFV5zhu21WNiCGL5ZhoJbd9wpOjhg=;
        b=CwHlbHADT2c4ozWbbypSiKm+rjDuUXAFGNsA6K/rW2jn7lPwPcadE/5AusFVGU2aeT
         a6bVGakSiYM3HSJEnIQ2WawQD9opV+wPiBEXGNM64pqnAH9TU60ZCNcLe+oihaArRHY2
         s1wLrphCAoc48iSDY805FkURemN296vkx1oyb4pxT4CKeIPFiiGSxsGWnTKkrO0sDXn1
         IpohJe8iRzhnOaOKcgpU1Q4mvqcmh9c/FkSU/5CgkhC9jxZHiyaGqYcCbsgNkSwZJG33
         ovi/m80a+oOxinL6TJ677CRdlO7M1/4d/xZuXw9BxOFcpkwiar6RAEbmtshgKbkV0c0A
         1+vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoX6+GibFMYfqAKzbXW6MGc8g2QTVs4yI9XbcEkhQX/EqnsxP9k2r4kXD2q6L/L2ms+GNmvJetOtJFZnZreK2j@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy6wSZXc0An/ho86XM4+9BgAnE5s3Wain5U8hVo97QClJXeR82
	u6cS7iEv7Lsv0V5hGbtovNVbW9raMOU3KD7BA4L07BCmOc+IMhnx
X-Gm-Gg: ASbGnculxNrbY9geYl+oNS7IiMkT+A9Z8Py0gNgwn2ITs8taDweS+txclslAMa/urGa
	5Eb0ExXxxsq7SwjRn0uICKbecdpDz8rDZpDePAlAUSytEYBjFAjilTIaT0fh25PVYBe5KRQm0lF
	pRqpZNoU+ez7z6hYQ7xJxDcqpyzU6dX32eEibQeskA0zN86bpr43jYOZmmloqmqLVS+EYkgZiDU
	n9CddSS6IKKYIawr52qP2aQCXHHSvQmFbX85T6t4hTIRS0voZ+Fo/KBWtSBvWMHvvLchfQYmjq/
	K+eAgVDrwM3w3ivd+WhBj0Gl
X-Google-Smtp-Source: AGHT+IEJEsDXjRS5g4p+QXVubUytuWQWU5/p8J2OOZ9LwfrfnVYt4ixAPBZRGWFc5DJvm4/UMRk9zQ==
X-Received: by 2002:a05:6a20:9149:b0:1d9:2b51:3ccd with SMTP id adf61e73a8af0-1ddae1fa776mr7800150637.7.1732154228019;
        Wed, 20 Nov 2024 17:57:08 -0800 (PST)
Received: from [172.19.1.43] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724befac308sm2427036b3a.145.2024.11.20.17.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 17:57:07 -0800 (PST)
Message-ID: <179b30f0-8fda-47d1-8461-a4919a53e744@gmail.com>
Date: Thu, 21 Nov 2024 09:57:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sudeep.holla@arm.com, arnd@arndb.de, peng.fan@nxp.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, dmitry.torokhov@gmail.com
References: <20241119025954.4161-1-mjchen0829@gmail.com>
 <20241119025954.4161-2-mjchen0829@gmail.com>
 <ql6m6qrdokwfu4iizn6wmvovawuc7kgg6jfzxebkmac5muz66e@myrjvq5jm7gg>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <ql6m6qrdokwfu4iizn6wmvovawuc7kgg6jfzxebkmac5muz66e@myrjvq5jm7gg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_175709_647164_661229E1 
X-CRM114-Status: GOOD (  17.53  )
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



On 2024/11/20 下午 04:41, Krzysztof Kozlowski wrote:
> On Tue, Nov 19, 2024 at 02:59:53AM +0000, Ming-Jen Chen wrote:
>> Add YAML bindings for MA35D1 SoC keypad.
>>
>> Signed-off-by: Ming-Jen Chen <mjchen0829@gmail.com>
>> ---
>>   .../bindings/input/nuvoton,ma35d1-keypad.yaml | 69 +++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>> new file mode 100644
>> index 000000000000..9ccd81a2574d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> 
> Filename matching compatible. You got this comment already.
> 
> 
>> @@ -0,0 +1,69 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 Keypad
>> +
>> +maintainers:
>> +  - Ming-jen Chen <mjchen0829@gmail.com>
>> +
>> +allOf:
>> +  - $ref: /schemas/input/matrix-keymap.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-kpi
>> +
>> +  debounce-delay-ms:
>> +    description: Debounce delay time in milliseconds.
>> +    maxItems: 1
>> +
>> +  scan-interval-ms:
>> +    description: Scan interval time in milliseconds.
>> +    maxItems: 1
>> +
>> +  reg:
>> +    maxItems: 1
> 
> Keep the same order of properties as in required: block.

I will ensure that the properties block and the required block have the 
same order.

> 
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - linux,keymap
>> +  - keypad,num-rows
>> +  - keypad,num-columns
>> +  - debounce-delay-ms
>> +  - scan-interval-ms
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/input/input.h>
>> +    keypad@404A0000 {
> 
> Lowercase hex

I will fix it in the next revision

> 
>> +      compatible = "nuvoton,ma35d1-kpi";
>> +      reg = <0x404A0000 0x10000>;
> 
> Lowercase hex

I will fix it in the next revision

Best regards,
Mingjen-Jen Chen

> 
> Best regards,
> Krzysztof
> 


