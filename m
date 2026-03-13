Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC060106FD87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 06:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5B5bkjfvouv3vKy7xOZhVi00OXVaTar+WdRxVUnQ5gA=; b=0xAPv8bfBaVd33GNk9858nP7zX
	0OGjkPl05KU4q1wvuScC/T5UrU50f/MN94YO+4oppvC2ho/ewNQnWkq/DVzLgtoZLMOcW9hI2gyXC
	oUA/sqngsWwotqyHInij/sDKaP1dDSvW77xUw9NcGn5337fFbHAEZk0CDLRdnD0JWpo9XzKl8sVhu
	kvGdd0aNKaHWkg4CrCozMYAL0vy10T9SDxeaHZOH/ZlhAauw5cmacgw0O7VZ9CA7t9YshmknAyfwa
	SLVag4auiyzAgXD852oE/GsOUKqZ0zlbJDIuHsMiM7bCcNWQJlLXbz+MjBtZiAHBmbAHM4loMkFQs
	GW0w2KAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0w3r-0000000Grzf-1Un1;
	Fri, 13 Mar 2026 06:31:51 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0w3o-0000000Grya-0Nrq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 06:31:49 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c739e680bebso879348a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 23:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773383506; x=1773988306; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5B5bkjfvouv3vKy7xOZhVi00OXVaTar+WdRxVUnQ5gA=;
        b=bem7oE/gC+g4h9i097GOYUXgfmjk3dlrQNdTGYJkTGAVM/YpcjSo4UuNkJOTcnuqQh
         yeEcVWm6aPbpTy7iHu7bws/Xcl/hUcF3ma9IlnMbENhXwBTnQ5suPBEST7KbXssw+f/m
         wIQDglelIqtwNkoULXep4bGjWTDdQUjxqy6pk77I5uTiy2+8uDAeM2UybROIwWUsGBIQ
         VbJKCH+a0S05ykfXHTLoM1CQIIHYkSPnKIUS9BfDvanD1QHK3hmQjxxLo2U1I7198q9/
         r7b7sxK3oF4ZOFIxjup2lS//UQP8waHslRFdL4wyzDxYS0NHlDIUc2yA2US41TekyS89
         4KxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773383506; x=1773988306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5B5bkjfvouv3vKy7xOZhVi00OXVaTar+WdRxVUnQ5gA=;
        b=nStrSUrL/xfOwZwxeGI2OftUDAe7EMK7OLfkujLVo1Xwc2h4xY2DmzN+uGkOMbwYYX
         erWFFAC95/VZkOxpI5TkpB8/ghAfDDmxJ2oKcDk1XxoPTXc0KqsARQhKjHG5m7jYi1YX
         EJzoo+1iHQiKWMtPQxRQrwZJamTiorErHJayR2ggmBfRGP++VtbKiWIZzJDzjJBVqNOl
         ki2NDEql0F+f0RT96UL+Kvf0uIFqcp9JLNgRIoec+EdU6ncu+SR1LqweNrF/5afaqzdr
         VPdlmIx+jcCDQb7DjW23KEEP40sOIunMOKdqyellGePtJ8zFxPzYO8DH24rXi01fXz1v
         zNSA==
X-Forwarded-Encrypted: i=1; AJvYcCXwUAHqEZmky81ZYs8H8CyKt+m5N3KZUMi9/j2Rnt7J4yv73BUrotTkESsV1NH8mKBPq8KDHG1L0mKHzk6T5A7E@lists.infradead.org
X-Gm-Message-State: AOJu0Yyprik13nanm/zzEE4N3a4CuianTayRgcWufkZLnDCbNLCLqLlg
	DlC8qvbPKODKilGtRM7Yp9uGpHWIcTArrje7v5oYZNp8R0W5GQZDGpMk
X-Gm-Gg: ATEYQzylW125QGx6MaUWhqyRIgVLBhtilXhCtmU9KvkB99vQ4sJNtPdeHfJfjbppdF7
	zpCjFpQg0mG6tPelQBpnm0bh8mBqwQ/hMKdgF8kmkSdh2/U4RyR+73EuNkJ+yG8hjR8lwWhaSh8
	yN9MCjXuVV2EKXhKE+ytBUFsL2CtplHzFEuXZLt+at6kMA1mImI+ifD/8FDMTnhFFU+AfYNMtDz
	rftZ4ik/SiMNu8DTsQt0uLaPvx4CBLuNkkOqmBcMdpIlIIvltcbxL4cMOpios0wwc6sO+fMW5ym
	RpkbYNNTJPCz0kTize5QiyzrYA0mm08hBICCuLYmHrWCWEIFB+nBF/A/NFllBvNxo9M9QGj2ZNz
	+wEn3fcGrr8nHMPQRmV1gJPfr6OodsCvshjmIzBli0rJHqpCf0A5Cep9dsTpjnbj0cROSYREAkj
	c+WL95+QC0ziEXzVpL393YSAT8m+T6B6VEgFmWIaMzcOJi
X-Received: by 2002:a17:903:186:b0:2ae:47b0:dc80 with SMTP id d9443c01a7336-2aeba48f0eamr57727825ad.11.1773383506399;
        Thu, 12 Mar 2026 23:31:46 -0700 (PDT)
Received: from [192.168.1.5] ([27.7.215.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8453cdsm10353455ad.84.2026.03.12.23.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 23:31:45 -0700 (PDT)
Message-ID: <2178f79e-65da-4e97-aeaf-21da0af95dca@gmail.com>
Date: Fri, 13 Mar 2026 12:01:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: usb: generic-ohci: add AT91RM9200
 OHCI binding support
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
 <20260307-atmel-usb-v3-2-3dc48fe772be@gmail.com>
 <20260308-camouflaged-sage-warthog-fdbb7d@quoll>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260308-camouflaged-sage-warthog-fdbb7d@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_233148_143662_E3EA99C2 
X-CRM114-Status: GOOD (  23.08  )
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



On 08-03-2026 14:53, Krzysztof Kozlowski wrote:
> On Sat, Mar 07, 2026 at 09:16:19AM +0000, Charan Pedumuru wrote:
>> Add binding support for the Atmel AT91RM9200 OHCI USB host controller
>> to the generic OHCI schema.
>>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>> ---
>>  .../devicetree/bindings/usb/generic-ohci.yaml      | 33 ++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> index 961cbf85eeb5..a8a94b9c1fee 100644
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
> 
> gpio is deprecated. All bindings use gpios. Also, pins do not use vendor
> prefixes.

It was already defined in the existing device tree and the same was defined in the text binding, I will remove these particular bindings from text file for each patch.

> 
> 
>> +    description: GPIO used to control or sense the USB VBUS power.
>> +    minItems: 1
>> +    maxItems: 3
> 
> Why is this flexible? There is only one VBUS, no? Which pin is it
> exactly on this device?

VBUS has 3 pins and will write the exact pin in the description.

> 
>> +
>> +  atmel,oc-gpio:
>> +    description: GPIO used to signal USB overcurrent condition.
>> +    minItems: 1
>> +    maxItems: 3
> 
> Same question here - how is the pin called in the schematics?

Okay.

> 
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -144,6 +155,28 @@ required:
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
> There is already if:then:else covering clocks, so this makes multiple
> clauses being applied to same device. That's not really readable.
> Unfortunately that's a bit of a mess from existing binding. This can be
> solved by moving this to separate schema, especially that you want to
> add some specific properties to this device.
> 
>> +
>> +    else:
>> +      properties:
>> +        atmel,vbus-gpio: false
>> +        atmel,oc-gpio: false
>> +
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


