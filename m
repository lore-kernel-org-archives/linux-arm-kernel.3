Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF28FCB602
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIuoqWZv8tHnvu9QNytBoqL4NkVScPssH158PsBBt80=; b=pYcCtXx7OkCluzcADuTwXIhn64
	UsUBzrSt0PlCnY8uhuRxt5IJLCGr1DI/sKTnoMA9ziJnigxQ3xzd3+xrW+mIi5iX1sP+GyPs6pTz/
	ESq23HqYKZf8GoHeDXvrSfBad2TC44yZf0AkZ8ARuvAvc9AKW3aVK15448gNlpT+G3dbEGd1/0z/8
	W/I9OFZLd/SLQ51620A8d5QrzXzBglZr0KxgqGpEyfhkP2r1HJc2iMGPOeBa0RxfbR66vooWkB2HD
	1LtKMChyhZvLSkn4w4AUyHpSfqlG3dESx5ej78ajeKdmsxq88fKDaBnza9Hh4mUz6LgtXkK9nTsV+
	Hq2lStug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytrf-00000005Jit-12ox;
	Sat, 07 Mar 2026 15:46:51 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytrb-00000005JiK-32he
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 15:46:50 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-359a5d8b3f8so2620921a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 07:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898407; x=1773503207; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uIuoqWZv8tHnvu9QNytBoqL4NkVScPssH158PsBBt80=;
        b=avkNFKhf/qAiZW26OnDI7SYvh4LIjRL2UdJr2/1WBZJoOIX+Z3KDE+dHvxWoJzwyky
         W0zAG6jAX0Dm7LFugddpZQWivRgjatN6JN+jsgGvHWKn9SsdncA+9qXrY6iMrTawU7/c
         y3I7Hx8tMsLbvm/bNmPCHgWJ379ZIviPBNJwAzPMFXw3H2AQSCPe5JXilhdj6D88sglB
         Eih+cmK9ZmICMdQG9YYKr3YSJhKOpwCFRZcFOdfjrh+xozT1zNhgLc8hUh5EWkS14zlN
         NFYIXr/R5c7Nap5RYS4Kt4u0uy0PAM2/9VsVGOHHx0HnKuQHjvu2oDu0ZwYBbzubsXWh
         Lbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898407; x=1773503207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIuoqWZv8tHnvu9QNytBoqL4NkVScPssH158PsBBt80=;
        b=E3m4g/daPaREvCPXxREIijuCHThFGp2gFDPyT4ENVkq1z9wxTGjq02kDEzqjsJl15t
         XsPk/v4lgDplcLfGt7VQhx2KPX9qZ8AqRZEmdwaenyJYzk9jAL0q1o2cSaVuPec3i+fF
         0uAvssq7NTeXerApOV/pm3BHKa3Un+PIbonRcUiydZFiug59SpQ89iuh94t5jAELKbuT
         +33gTfKIVojesgzmaYPqWK1XcXqAaMlQENbfw+mYW85wbDdggXENM0Q/dUIuGONvBuxv
         LUXpng13kxldFJEfrRcpebKlSMteYNbLvgutAqyeE1M1jWK1DD0Z4p6AukuZt8mDGdb6
         FfvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXDs5B+5QP8WT7xTySiEdwEJvWn9YhLqAvmvqdex5LGu5THY0N9Lf3/4SZVhQbi769IC4N+oWLP4ts5LezKIIV@lists.infradead.org
X-Gm-Message-State: AOJu0YxNvnHIjTGzDRUFtHcdsK3E5gBp+3++87NzxsfYXECpNPPIuAzt
	bW/1J5fJuBn/pxa67ECh25lw6KOVc3+UMSyI4WvzMUKJls9ymSr1bAto
X-Gm-Gg: ATEYQzzxElD73H9mplKUpq1Wzmo0HJ8E1LGzEh47ktYzt3lRPM4TNAc7vVXiNeZBt74
	JvzqncQSbC3MKZdxiZ7qkl+TEJ5A7sMDEXLzg1sj/w6CS2msgXxeofIpiVJgJIoqwUyG0r2hlH7
	bqjRmVoiAIpCwgB5AXjDQq2CRPOwwdnjek+0wb7ztQM4bOSFFZ2p/JeeESZBNFvu779IBX1S7T1
	5Xdh4EQTh0Rz2IfqgtpzzyWFgwLL9pZb2pIVKa05Xwy6CFN1lPWeRb4vsqeB8I1G0RtTMNFyE6r
	JDiWMU5Jk3dBbNbQbqct1yUdCsGRQXA5THuY/N8WcdMpTzmr2T/8JzoFz1eiSPkLwwBbB939tmS
	ggA2wvrIrsbc/UprVN0D/oGq/1ueZ/jS7yNOeZOPikOzz+CuxkScYwrWSdYZu66EKB41KTmcYvV
	eKiOgQd7/Tt86c6eoUMgREcEusD5marcXFjhqKrD2M5dej18WFSbBtMytmmx6huV4q7KY1tmagp
	YXFga0+0KU=
X-Received: by 2002:a17:90b:5410:b0:352:ba0f:fb28 with SMTP id 98e67ed59e1d1-359be23398cmr5286986a91.1.1772898406660;
        Sat, 07 Mar 2026 07:46:46 -0800 (PST)
Received: from ?IPV6:2409:40f2:2133:57ee:dd51:fda6:69f8:15b9? ([2409:40f2:2133:57ee:dd51:fda6:69f8:15b9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bcb2abecsm1943723a91.9.2026.03.07.07.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 07:46:46 -0800 (PST)
Message-ID: <2185210c-d407-4019-a364-9e72df93029a@gmail.com>
Date: Sat, 7 Mar 2026 21:16:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: arm: microchip,sam9x60-pit64b :
 convert to DT schema
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260227-arm-microchip-v4-0-7e2ae1c5b5d6@gmail.com>
 <20260227-arm-microchip-v4-3-7e2ae1c5b5d6@gmail.com>
 <aacb74f1-5d4a-4ed1-92fe-0c5536691274@tuxon.dev>
Content-Language: en-US
From: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <aacb74f1-5d4a-4ed1-92fe-0c5536691274@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_074648_759298_E6FCBC0A 
X-CRM114-Status: GOOD (  15.51  )
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


On 07-03-2026 20:01, Claudiu Beznea wrote:
>
>
> On 2/27/26 17:14, Akhila YS wrote:
>> Convert Atmel Periodic interval timer of 64bit (PIT64b) binding to YAML
>> format.
>> Changes during conversion:
>> - Add missing compatible "microchip,sama7g5-pit64b" along with a
>> fallback
>> compatible "microchip,sam9x60-pit64b".
>>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
>> ---
>>   .../devicetree/bindings/arm/atmel-sysregs.txt      |  8 ---
>>   .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 68
>> ++++++++++++++++++++++
>>   2 files changed, 68 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
>> b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
>> index 70059f66f2b4..d0561f7f465c 100644
>> --- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
>> +++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
>> @@ -1,13 +1,5 @@
>>   Atmel system registers
>>   -PIT64B Timer required properties:
>> -- compatible: Should be "microchip,sam9x60-pit64b" or
>> -            "microchip,sam9x7-pit64b", "microchip,sam9x60-pit64b"
>> -            "microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b"
>> -- reg: Should contain registers location and length
>> -- interrupts: Should contain interrupt for PIT64B timer
>> -- clocks: Should contain the available clock sources for PIT64B timer.
>> -
>>   System Timer (ST) required properties:
>>   - compatible: Should be "atmel,at91rm9200-st", "syscon", "simple-mfd"
>>   - reg: Should contain registers location and length
>> diff --git
>> a/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml
>> b/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml
>> new file mode 100644
>> index 000000000000..f00ac7e858d9
>> --- /dev/null
>> +++
>> b/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/microchip,sam9x60-pit64b.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Microchip PIT64B 64-bit Periodic Interval Timer
>> +
>> +maintainers:
>> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
>> +  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> +
>> +description:
>> +  The Microchip PIT64B is a 64-bit periodic interval timer used in
>> +  several modern Microchip ARM SoCs including SAM9X60, SAM9X7 and
>> +  SAMA7D65 families. It provides extended timing range, flexible
>> +  clock selection and supports both periodic and one-shot interrupt
>> +  generation modes.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: microchip,sam9x60-pit64b
>> +      - items:
>> +          - enum:
>> +              - microchip,sama7d65-pit64b
>> +              - microchip,sama7g5-pit64b
>> +              - microchip,sam9x7-pit64b
>
> Same here, I'll adjust this list to be alphanumerically sorted, thus,
> microchip,sam9x7-pit64b first. Other than that: 


Thank you claudiu.

>
> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>
-- 
Best Regards,
Akhila.


