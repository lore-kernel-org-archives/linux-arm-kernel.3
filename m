Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF109C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 01:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3AxC7gchtFJwmTqUc6Eo/wyWrQDc1+3uptrgZICrdw=; b=bbCIWBU1Gk8pyePFpa2JmFRIWE
	K9MetH79Cc9NCMnE8NG7Pc6uv+FkED7t2Efzy7JVmn/zEvCgouNpePJCx+os4UzSFSXOERja0efuq
	UqVj6KmhX4Rlix2/uzKZcmtzJTGCkLJXQ+ciVhcsG7Qs3SiwRj4YxnHXjp4/WTyTxfHLWg87YUDUC
	3x+MFqATSKkBTh4cSPa2i2m+t94Q3OC3QAZs63TZiaNGitkwKmpBJvb6MtZcsBBwdAcJ0B/7G00s+
	omKasBcdkJ3owAvOS1nGMQRCCO5OrXfOB6/6s8wkKR1RbvK5hh0NNXSzdemik19mMZ/OTq48V2v5u
	Pp8UqvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4TyO-0000000DDVV-3CGg;
	Thu, 10 Sep 2026 01:53:08 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4TyM-0000000DDUZ-0UcP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 01:53:07 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ed9866so8829005ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 18:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789005184; x=1789609984; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3AxC7gchtFJwmTqUc6Eo/wyWrQDc1+3uptrgZICrdw=;
        b=e4CGwpbxT2nfSqx7aNeNHepbVoo5AGhpRdJmDKbTfOyI4oI/LE7UVKLELieA8sSD3/
         LJ0g4zkKA2/MeDuPVUaQLvL8uv2smVFGslNqanCR0q02BwyBIemjiYELzKSCFOQqTN8N
         r5jyYwTWiyOmzLzvgEK/FX9GEMXaPkb7XuFUKOQuvTNbx6BJikV2DwuuZxB0Eq60CXKW
         T4LDBPT+tQqzq/pCj0RmguK0XJtrlZXqlgaoJisQ6yVLOTqyjE/RWCZuKsdVasLTgKeI
         UH63v70III8tg8dWa2qsYqNtEKh+uFNVtYkoxZiCzH1X/y3ZuEEeQAPV1RXmRKtxCED2
         Mmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789005184; x=1789609984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3AxC7gchtFJwmTqUc6Eo/wyWrQDc1+3uptrgZICrdw=;
        b=b7ZdwcOWBhmZR2eekuHYsnxjyAJo4BXqNKmYilbETfZuumvK9z9raa2uDZLcbe/bky
         pttiFrX3XimfvhgMC6RGHpmQi2vyevu8BRUlp77sliKGX/coQh41iHpUB/FzpumNm4Sh
         zEaIhj4ir/ilRALeO8W440mmKC4MPrYRDUd6cQ48qlsmYrL0DkPqfLfecBLIbrDjH5/b
         68gLNDO66CDcNbiX1XahVfOw2sBL6iRLTYR56FN87867CdtZcN/UjZfRGDqvfRGjfNOS
         MOSXXtdpdevOGuv3JIHU7B9n6DXIaSrR2UtZ0tus5akt1Yf1qbDE8jxyXOyHwxRBfk3w
         1H/g==
X-Forwarded-Encrypted: i=1; AKwUvBxbNw8LaBJUrqAavxKLkhgAiGPfu0f5YgWYMXTU69dIPzIuJ40dTHOQRxMLXuwYWvtIR+PH1WR9AIEYGhQ1NmPY@lists.infradead.org
X-Gm-Message-State: AFuF++lAW6EzCZU+skpfMXGqi9+RgIvYLaqFDZiZpqOTb0+QsdFD3w7A
	vQsKHczFRvhwIHxgPDfJCDXi73w+OGjwmFw2pl7UUI7lufLnd2aayJ7Y
X-Gm-Gg: AYBFou1mUkQXyoeRq1sRxvp3Wh6dqeG4tTDaTAso3bocuoBd6paoS1zW5jYUtPw6c7s
	n1MGdy8fp223LxAtjs6/B6ovx2OYKV/kUclgvJYuspXdH1+cEhUt5a2yVAeaEsgK0WBdfsGoh5v
	UgpZDJpZQixdiOSLiOoYSbP/MIih5UkT5vsZb7ilfG6cjZPYfXiVPmbXNzBufdF67LfV+Lo6MDs
	vpqKCtaNU52O5xUtfFPT5aVyaCvKvGd/nus0M9NoBFPWtHVftAxevClMPEI6V1IWGLUv7l9hp49
	57G+u8wTPHT1M+TYsejPR+LN4MLEbuM0AYuGgcaCib4/6AaTeYcVnjM/FxTmaEaXUKuXIl1Aogg
	b+CzgPvb6CwbJsi9XCFaBsco1oqPvwTmLhpaM3ceiCBdnBObOpfpI71VDLqboWQrqXQMeSlJbM1
	ui9CcxQ6Y4oi8Gba/N1P0bz+nm4xaHXlZt+pWz+UUVZgjoaXFJ69VNA5uPqWNKix3LZhur3NkIK
	QJF03BsUON498CX2QRD2nKQobWNEumg8ftrwHrjJn97O3Z1csWv6T0=
X-Received: by 2002:a17:902:d58a:b0:2d9:4358:73ab with SMTP id d9443c01a7336-2dd07b9c78cmr64548885ad.19.1789005184028;
        Wed, 09 Sep 2026 18:53:04 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1499d92dsm79698945ad.52.2026.09.09.18.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 18:53:03 -0700 (PDT)
Message-ID: <9d697240-3632-401f-aeba-c1fa5c2a29d4@gmail.com>
Date: Thu, 10 Sep 2026 09:52:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] dt-bindings: display: verisilicon,dc: add support
 for nuvoton,ma35d1-dcu
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260908092840.225220-1-a0987203069@gmail.com>
 <20260908092840.225220-2-a0987203069@gmail.com>
 <f74168b54fe8f070b7cfe79dc2fc83a63c2e8842.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <f74168b54fe8f070b7cfe79dc2fc83a63c2e8842.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_185306_165900_ADC1069F 
X-CRM114-Status: GOOD (  20.58  )
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


Icenowy Zheng 於 2026/9/9 下午 01:44 寫道:
> 在 2026-09-08二的 17:28 +0800，Joey Lu写道：
>> Add the Nuvoton MA35D1 DCUltraLite (nuvoton,ma35d1-dcu) to the
>> binding.
>> The DCUltraLite uses only four clocks (core, axi, ahb, pix0) and one
>> reset (core), with a single output port.
>>
>> The MA35D1 clock controller gates the core, AXI and AHB clocks with a
>> single bit, but each remains a distinct clock line feeding the IP
>> with
>> its own rate constraints, so all four must still be listed
>> individually
>> in the devicetree; core, axi and ahb happen to share the same clock
>> phandle.
> This is weird, but I must admit that we're limited by the Common Clock
> Framework here, so I cannot give a better solution either.
>
> Anyway let's settle with the current result.
>
>> Move the clocks/clock-names minItems to 4 and resets/reset-names
>> minItems to 1 at the top level, since that is the lowest count any
>> supported variant needs.  Add an allOf/if block that tightens the
>> constraint back up to the fixed 5-clock/3-reset topology required by
>> the existing thead,th1520-dc8200 compatible, and another one that
>> caps
>> the new nuvoton,ma35d1-dcu compatible at the 4-clock/1-reset count it
>> actually wires up.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/display/verisilicon,dc.yaml      | 44
>> +++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> index 919a900122012..773966677d0f4 100644
>> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> @@ -17,6 +17,7 @@ properties:
>>       items:
>>         - enum:
>>             - thead,th1520-dc8200
>> +          - nuvoton,ma35d1-dcu
>>         - const: verisilicon,dc # DC IPs have discoverable ID/revision
>> registers
>>   
>>     reg:
>> @@ -26,6 +27,7 @@ properties:
>>       maxItems: 1
>>   
>>     clocks:
>> +    minItems: 4
>>       items:
>>         - description: DC Core clock
>>         - description: DMA AXI bus clock
>> @@ -34,6 +36,7 @@ properties:
>>         - description: Pixel clock of output 1
>>   
>>     clock-names:
>> +    minItems: 4
>>       items:
>>         - const: core
>>         - const: axi
>> @@ -42,12 +45,14 @@ properties:
>>         - const: pix1
>>   
>>     resets:
>> +    minItems: 1
>>       items:
>>         - description: DC Core reset
>>         - description: DMA AXI bus reset
>>         - description: Configuration AHB bus reset
>>   
>>     reset-names:
>> +    minItems: 1
>>       items:
>>         - const: core
>>         - const: axi
>> @@ -79,6 +84,45 @@ required:
>>     - reset-names
>>     - ports
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: thead,th1520-dc8200
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 5
>> +
>> +        clock-names:
>> +          minItems: 5
>> +
>> +        resets:
>> +          minItems: 3
>> +
>> +        reset-names:
>> +          minItems: 3
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: nuvoton,ma35d1-dcu
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 4
>> +
>> +        clock-names:
>> +          maxItems: 4
>> +
>> +        resets:
>> +          maxItems: 1
>> +
>> +        reset-names:
>> +          maxItems: 1
> Maybe it's reasonable to restrict max port count to 1 for MA35D1?
> Although I am not sure about how to do this...
>
> Thanks,
> Icenowy
  I found the same kind of per-compatible port restriction already used 
upstream in renesas,du.yaml, e.g.:

         ports:
           properties:
             port@2: false
             port@3: false
           required:
             - port@0
             - port@1

Applied to our binding, that would look like:

         ports:
           properties:
             port@1: false
           required:
             - port@0

in the existing nuvoton,ma35d1-dcu allOf/if/then block, so schema checks 
would reject a port@1 node on this compatible instead of silently 
accepting it.

Happy to add it if you'd like the schema to enforce this, but wanted to 
check whether you consider it worth the extra lines given it doesn't 
reflect an actual bug in any DT today. Let me know which way you'd 
prefer and I'll fold it into the next version.

Thanks.
>> +
>>   additionalProperties: false
>>   
>>   examples:

