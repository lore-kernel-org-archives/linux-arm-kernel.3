Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB16F5141C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cgV9qMZHmCHPf1rJ34D5D5Psowee5RtLjaaKl77igI=; b=xywFCnO7wLOGIkRG82ursu1dgg
	PHdsCD79LZHORomcQynMKtWsSCCRDw0HjLkc8ebKIgGOUM4wtsNWpFP3FPjtoV+RTkdsPdb4Nw/1Y
	j+azIGMDE5o9F0wje/WK8HU5U89KbmTsUon7wfD7s/krLOcJuRP3mGADZZMk9a08T81j0mxGKCZ5B
	8oIrEPcZ/76RNAwJkmrMl0WwNbLrl962KUQ1IRGrXaLlQyBujy6guOfAQRm3zRQXo4LDwPuLne9yW
	tA3U5P/gzYKZWYN6ojbShjHLxQF830QUNDaELswr9/pAZfG0s1EdZ6CRkIaRVApZBr5neGzCY7er5
	VibrGs4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytqS-00000005Jd4-3iVb;
	Sat, 07 Mar 2026 15:45:36 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytqP-00000005Jcj-0Dd0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 15:45:34 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so2152943b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 07:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898332; x=1773503132; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5cgV9qMZHmCHPf1rJ34D5D5Psowee5RtLjaaKl77igI=;
        b=eO77+KeJOWncK7e1Ulc2K7TMJ5kmj/3U01jU8eoLY1hNA0dkWRcVxojiKWrVEZsnIM
         NEp0tyfmeriPU9KruS/D8HqmNhRqd5L4bdI62Pk2s8xBlAabWUYs6Hy3I/RUxhbWcCZz
         x4hJMwfDlq9m/fk16c9XFoFXhD1A+fzkpSsNissG134BUiBi1sq2tgtvTc5YMX22x4gw
         SvK0gp/cdHcYFZW7XYcu71/oZLabR067SZ7qOS09TPvKnx+hZ9iMrlJPxf+vlcV2N5uO
         7RRKouzt2j4myRLF+V1Xp5exQRHNUgj1althip22RqmWQoprox9zhpzk9fXMzy7nfMZK
         I/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898332; x=1773503132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cgV9qMZHmCHPf1rJ34D5D5Psowee5RtLjaaKl77igI=;
        b=PDoF7BFucDQABzU4yTgJRWskucWUUjeolRnIlF4Gwb6eLr6BmBA6uZlwnbMhn7F937
         FgDiRdBM88ldBngiF+DDuIwBjHM1cxVVn6R13/f9/apT6MwjLgvhNx/4SxZeBdixTFqj
         4Ul0SuSOo4h8u4zuhBoXY5cLXP1wHaxRb3WmTZEhFUfrUXI6IOBE9HwShCl1ZeEwW1xK
         uDXEZBF2i2eXpp0+lYxfKjqN/R5b3uXEt6xsnq2koVhtMMF2TOOkHSpTWVdE2yWutAZC
         jR7naTwfsBZwXTdmxNNA++vJ+JLKE54FrMboJB16Q5GoVVNL9puudIagIemtUIIjnpBn
         hUwA==
X-Forwarded-Encrypted: i=1; AJvYcCXP1DvhCPAQWGvOBkIOukIivEgiz25hKs0UgXKC2ehou9myBPzpwZrOg4CjdQIvNWFCiqeSxGq6czYQt6APUMmR@lists.infradead.org
X-Gm-Message-State: AOJu0YzEz/xQofsKWouSkXC7/+vo7l8JOdkMUgdTMVhB13v4tfHn2vbw
	yAp5J/q7XkxKlR2+rUCLZJuEp98oldqzThgB8BdSnf/aIRn11emVqZth
X-Gm-Gg: ATEYQzwW9Ijo4EPvS2Bj/BfjwY7D6GhlASOCdmr7aXAoDuR3QbD/yqEo+phSB8zDPcx
	lIwWWn29765PBjFRGn9HjhfuxzwsWq2N4TFVTmybBd3bVLPdAKHqm83tQHpkHgMY7xizIMj8Mjy
	xr/gKJh4hsQEYV5i5erDLoNegGvKUTATIBKAiuC5s8VdJEpCSqIfkxvwkCoV+QmBxHI/0IJUv/K
	sNaJ1Gbxk9GE9UuYwn6v4bjEqjdTRtSoyBDnrG/l2T83ig0j+KxGIwh2aFgVYyZJJjKlJjUBNY3
	qJwaICCQefw3f7mV87Sq7iQXbsgy0bYfFlCNlop7Jvn5ycnYjdtKwnOeCRB2U3vQ7vIgejGuF2O
	FrqyWuWt8H+TgrY1Pr4ycixZF9Sozvw524gEV12+9jCEIxY499KHGnCLe09VMV6TbV2WoQnL/Vb
	QcHJuT6SmOuPSpiq4HIwxGfgkpmrpJzczOy8RSoMyUIMhheKY7KpcnNPzME7xW4bS8IJIBSlsz+
	Tu9kpp0O2U=
X-Received: by 2002:a05:6a00:22ca:b0:823:ad3:4ff4 with SMTP id d2e1a72fcca58-829a2f69064mr5307178b3a.37.1772898331534;
        Sat, 07 Mar 2026 07:45:31 -0800 (PST)
Received: from ?IPV6:2409:40f2:2133:57ee:dd51:fda6:69f8:15b9? ([2409:40f2:2133:57ee:dd51:fda6:69f8:15b9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48de551sm5013106b3a.57.2026.03.07.07.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 07:45:31 -0800 (PST)
Message-ID: <6649828e-0d84-43b9-b2a7-eb6843d6be03@gmail.com>
Date: Sat, 7 Mar 2026 21:15:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: microchip,sama7g5-chipid :
 convert to DT schema
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260227-arm-microchip-v4-0-7e2ae1c5b5d6@gmail.com>
 <20260227-arm-microchip-v4-1-7e2ae1c5b5d6@gmail.com>
 <5a983df1-fe80-49ab-a37a-58b6c4989548@tuxon.dev>
Content-Language: en-US
From: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <5a983df1-fe80-49ab-a37a-58b6c4989548@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_074533_096846_81611E00 
X-CRM114-Status: GOOD (  18.01  )
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


On 07-03-2026 20:00, Claudiu Beznea wrote:
> Hi, Akhila,
>
> On 2/27/26 17:14, Akhila YS wrote:
>> Convert Atmel system registers binding to YAML format.
>>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
>> ---
>>   .../devicetree/bindings/arm/atmel-sysregs.txt      |  5 ---
>>   .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41
>> ++++++++++++++++++++++
>>   2 files changed, 41 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
>> b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
>> index 5ce54f9befe6..4ee18112586d 100644
>> --- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
>> +++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
>> @@ -1,10 +1,5 @@
>>   Atmel system registers
>>   -Chipid required properties:
>> -- compatible: Should be "atmel,sama5d2-chipid" or
>> "microchip,sama7g5-chipid"
>> -            "microchip,sama7d65-chipid"
>> -- reg : Should contain registers location and length
>> -
>>   PIT Timer required properties:
>>   - compatible: Should be "atmel,at91sam9260-pit"
>>   - reg: Should contain registers location and length
>> diff --git
>> a/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml
>> b/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml
>> new file mode 100644
>> index 000000000000..4fdb068be929
>> --- /dev/null
>> +++
>> b/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/microchip,sama7g5-chipid.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Atmel/Microchip RAMC SDRAM/DDR Controller
>> +
>> +maintainers:
>> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
>> +  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> +
>> +description:
>> +  This binding describes the Atmel/Microchip Chip ID register block
>> used
>> +  for SoC identification and revision information. It requires
>> compatible
>> +  strings matching specific SoC families and a reg property defining
>> the
>> +  register address and size.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - atmel,sama5d2-chipid
>> +      - microchip,sama7g5-chipid
>> +      - microchip,sama7d65-chipid
>
> I'll keep this alphanumerically sorted, thus
> "microchip,sama7d64-chipid" in the middle. I'll adjust it while
> applying. Other than that: 
>


Thank you claudiu.


> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev> 
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    chipid@fc069000 {
>> +        compatible = "atmel,sama5d2-chipid";
>> +        reg = <0xfc069000 0x8>;
>> +    };
>> +...
>>
>
-- 
Best Regards,
Akhila.


