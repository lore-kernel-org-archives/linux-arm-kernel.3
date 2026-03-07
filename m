Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C46FC9ED3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 07:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kh2DkldBCZcuhkrQEQ5HtmK6HQyMLyLxXOGQNeopz2M=; b=oUaJ1R3bPFxcV4woxxy5MIwoXK
	YfG/I9K0EI42K8JJVKWmySisFr9u20LJVxn506rz2uTZHsecPyD+ZJilQHoZNrdGRW5DmmleYrTJD
	d9AA9hN98yRkRrnv6tixUAikUo+Yfwmn87O8tGLLg5how99GeiwtMbe7G2LzcQojh1xqnbgnFpILQ
	tSktkopY0GXcNFTCb237VADjVBG9Y07PwW0TZVpg7ByqCh0jqBZqt93NjP4IOh4IsOsCRjo5ejzpo
	pirMIR7DF8iGvYUgSghPHOzOQ0xQclvOWjJO96txLnVOQwE4rIizeyJfddEzf6Xk6QEi/Ixxn/Rme
	GWIQiJiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vylfv-00000004xYq-2zvV;
	Sat, 07 Mar 2026 07:02:11 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vylft-00000004xYT-3qsq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 07:02:11 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so4102484a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 23:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772866928; x=1773471728; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kh2DkldBCZcuhkrQEQ5HtmK6HQyMLyLxXOGQNeopz2M=;
        b=MoeyureeriB9UgDiSNB+tu6Xa9uCShZy4Y2zgs8NPynzZ95EJUyyYzko045svSx/xn
         b1yCIFHZKy+EX0TRJxzY/QbrP+qVPa5d+ii8VxLz5MQpWJ3CXIJruMEomzf6AR/2wlhQ
         W7ctDtT9rNLhmA1RKlOCr7cjJ5HnrwMulHTqjihO0trF0gkUDg2+bvQiTMR7luS2kHNZ
         5kRGg22eWsonTqq4z6p31AiOdZ2/ISJyaD0amd4ujRuhUfAnNtJJltcJ2WLzRcrdZC4P
         QvS9ongmvUrltIbcDPGdeU5vpzBtwuyWcqee4JNet44cHvvrYTzdMuG/wRuacs2tvnil
         N43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772866928; x=1773471728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kh2DkldBCZcuhkrQEQ5HtmK6HQyMLyLxXOGQNeopz2M=;
        b=YhUxJ8z0VyMFMNm5n/ih58pYh2uBtqozRxnHO9tYWpKIjeFNP9LRPqa4lyfdAOOOk/
         a/HqzzCPLsSe1/MWOqMWoBgbHp4DRNUCQxLCIFB0VejYRsD2IccVCzvDNyqe0eEC/6nR
         nBfIBHGDSlMXfc/UNqTECt8NVz0h2uQzn0319xSIStob9z1mp6o4O1Wg9/aYwdm8XaTp
         evV3QfHZCRw5TbYIwLI3AGTZIdGaLhBderw5oE95OB5QBA8hzKbPZhqhm2cCxVh2To3c
         Y1Ve6QGxqw7KdaEw4xe6FEep/5oDJou+QRBTUTJy9FHizIgpwOtttRKKKWRv6LKvDXsA
         1ubg==
X-Forwarded-Encrypted: i=1; AJvYcCUxNoDkH/JEzxJZUVmae73pngrk0kzYteWUL8i7j6SE3bpm4uo0ycJmXAeTUGWVnoLqaKm9aeZL22Q8mfVrIGky@lists.infradead.org
X-Gm-Message-State: AOJu0YwhxaGCDM8rWt/+aCJRe2buoB+FCtKopnDOkOjOSt5BX3rKYdHl
	/fKy1ccpsGq1V8R713dctKAaY514n9xhrR3P6mZ7qwE5oLJl9HZMTAXN
X-Gm-Gg: ATEYQzxDKTtT6vKNnh7Ny3yV4ic9NQw1FU+Pf5zhxWB0wiMaH3/i1TVh5IfOFUNGvQ3
	rUjR4HjeZYiXT0NJ24Or+xxa3Pu9M83FHvwdvHv7SR6tvBC4rrt+GrOdFKWEtJs9/t5iH0FuECR
	kPxnhEruCCYQMe8mXC4OjgaLOu1WR8gda8RPHesaDkHOytNytBRCVP/uYdJ17mILp2LM/PkUHPY
	QJW8b+hTd5Lu3DHeFRjmkZnZ+RdLbMVI6MyKNkFuJ3y3rB6el4AsJ0hMHZ2SgoDuVAwnzpRGlc6
	Gj/AepJkRgKs5nQK8xpyiyqAUsehld9zoE8aoHWWROBGrZ1pIPt/4kYzYPjQxCaWXSdN2gSVAd/
	u5iX3WGOKxZrtS2el46UJIAUkVw/D3gdachRhpHmf6r9ZIpAwF8GBuA3u813VQc/pIA0C/Gr1K5
	PO9RxbzSBaEpVY2oV69ePJymVXGTuhSCy5op+dy/t1KR3Z
X-Received: by 2002:a17:902:d2d0:b0:2a9:451d:a69 with SMTP id d9443c01a7336-2ae823677famr45582915ad.10.1772866928475;
        Fri, 06 Mar 2026 23:02:08 -0800 (PST)
Received: from [192.168.1.5] ([27.7.215.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ccb6csm54633905ad.92.2026.03.06.23.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 23:02:07 -0800 (PST)
Message-ID: <2ba9bca7-e71c-4371-89f0-15295781b147@gmail.com>
Date: Sat, 7 Mar 2026 12:32:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: generic-ohci: add AT91RM9200
 OHCI binding support
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Herve Codina <herve.codina@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
 <20260224-atmel-usb-v2-1-6d6a615c9c47@gmail.com>
 <20260306004533.GA870954-robh@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260306004533.GA870954-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_230210_022641_3F9EC8EA 
X-CRM114-Status: GOOD (  14.25  )
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



On 06-03-2026 06:15, Rob Herring wrote:
> On Tue, Feb 24, 2026 at 01:12:58PM +0000, Charan Pedumuru wrote:
>> Add binding support for the Atmel AT91RM9200 OHCI USB host controller
>> to the generic OHCI schema.
>>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>> ---
>>  .../devicetree/bindings/usb/generic-ohci.yaml      | 27 ++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> index 961cbf85eeb5..ab8a49142386 100644
>> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> @@ -55,6 +55,7 @@ properties:
>>            - ti,ohci-omap3
>>        - items:
>>            - enum:
>> +              - atmel,at91rm9200-ohci
>>                - cavium,octeon-6335-ohci
>>                - nintendo,hollywood-usb-ohci
>>                - nxp,ohci-nxp
>> @@ -137,6 +138,16 @@ properties:
>>        The associated ISP1301 device. Necessary for the UDC controller for
>>        connecting to the USB physical layer.
>>  
>> +  atmel,vbus-gpio:
>> +    description: GPIO used to control or sense the USB VBUS power.
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +  atmel,oc-gpio:
>> +    description: GPIO used to signal USB overcurrent condition.
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -144,6 +155,22 @@ required:
>>  
>>  allOf:
>>    - $ref: usb-hcd.yaml
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: atmel,at91rm9200-ohci
>> +    then:
>> +      properties:
>> +        clock-names:
>> +          items:
>> +            - const: ohci_clk
>> +            - const: hclk
>> +            - const: uhpck
>> +
>> +      required:
>> +        - clocks
>> +        - clock-names
> 
>        else:
>          properties:
>            atmel,vbus-gpio: false
>            atmel,oc-gpio: false

Sure, I will add it.

> 
>>    - if:
>>        not:
>>          properties:
>>
>> -- 
>> 2.53.0
>>

-- 
Best Regards,
Charan.


