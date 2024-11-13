Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00422D637A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 00:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPUlb3VBMTlmosq70yahB7ivXqgjw6fLoL5yh5SfhFE=; b=jDTdED0uxDxoVTFF0F9ZbxD9Nd
	mqRvbJzP5wuqRJlzNw9rnIihX0b6h2qDXzqD20wIUqMCOhN9wIDFcD1G1UOUSO0fofXcFcLPhkan6
	zWOqahvozNShU+xqWisxTk0lzkzsiUHYyuFsLKoi74S8NR71MMEOu1sfPaeF9JrHz1uvIrMTyk2Fg
	ULuYhZaXBnCSFuyvH1yeLoEmvR4cUPte/AE1FDKb4mMqSZ015uY/SfNJWOzY29R+NAVnqHE2C/WkM
	A0gGPLWjQUpDrMRD4EYxzCUwIY9ocpjnoe6bc2eixw3KHbn8UJ8C1FODdD+255+1i1PodAI1gBnKA
	Q9Jq1ooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBNHm-00000008IlQ-3i8I;
	Thu, 14 Nov 2024 00:00:35 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBNFv-00000008IQ6-3Dus
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 23:58:42 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20c8b557f91so79420155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 15:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731542318; x=1732147118; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nPUlb3VBMTlmosq70yahB7ivXqgjw6fLoL5yh5SfhFE=;
        b=hFRctcm0kpOuHAs+5SSlKQLJ6INgNz5tp8BpOoz3rx/Os85FSREpCkKX+YYBY5po8C
         fX84NJ9mT/xjzlTwG0t6ZkPbscGAx6uzidkMxP/w4Iqna3khe/pqU1FGe1j3hykFIAz1
         e3Mwz3dulP5KO4yTlxgkxzH0Ct84XUDlv4JvuJaqH0oW62oWVFAuBH11PRUxIL7gjWF4
         EWnGNmpO8vUmuxKsB43SnyQkayJx6v4R8ShwgWA36caZbD/JC+BRbSsbmX8zuwww6mr2
         +fIYiERvvBg28SmV6VBPVUGvMEAG4g06rJ0bEJTOVcBBp22haCp7BD6HbScI0+ZHao3M
         5pPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731542318; x=1732147118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nPUlb3VBMTlmosq70yahB7ivXqgjw6fLoL5yh5SfhFE=;
        b=LZtdi4oXzGGh6FVF/RCoxWg8CUZukdv1kPAsRadQ+esDjWUytJUKKjjsrvuIAfyQwM
         JbUE5qz/XcaaV9bRKeAQptz/IZ4Maj9uhaqvDdWgTa+/2XSXpuOOWtx7EOxNqI+vC2+W
         DyRLJgabvYDG5Vgn2PmphoiKOb0HeM6iTRZEVltomtTN3yORzmwalM5nDQPh4LVM0bkk
         yrtk6DXTPMvsmW+MYDVGWNUbBwzHqFxH/+v4weqMDZ0mx6AY4oga8Mx4cYRS1krFt2Qo
         l585Bvms5flGp5VNkTxJ0EvZNc4yT3H2LVIgcFNkmmnCem0Z6pE3Cw9iQzS4CcGkk0Sj
         5SGw==
X-Forwarded-Encrypted: i=1; AJvYcCUtr61rK7ADE07QeaWFPEgSmNU8m0GVIKoJzPgYNF3GrEIWf859lLF+I+CAZi6gGS+V/mYTijE2FCnDNNZOMvK9@lists.infradead.org
X-Gm-Message-State: AOJu0YwaWIvKs7nubC7PXaUdTpwUPGliODq2aovvPn01yPoZBNEL9K3m
	ebnPvn1m6PD6wOsLCqNDT+bJ6XZD+DARFQatp0OdFL4r2/5RmDkiSy+aXBpO
X-Google-Smtp-Source: AGHT+IHOyod3VXmk40tVpnrNG9DlVhMryxGrcLmpbXsiCrrp/ME48mm5tCfyOy0LYdi695U39z6Qug==
X-Received: by 2002:a17:902:e84e:b0:20c:7661:dce8 with SMTP id d9443c01a7336-21183d668d4mr312024285ad.36.1731542318242;
        Wed, 13 Nov 2024 15:58:38 -0800 (PST)
Received: from [172.19.1.43] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dde1b8sm115569335ad.60.2024.11.13.15.58.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 15:58:37 -0800 (PST)
Message-ID: <6f20fb7c-ef70-400a-b359-55f101d8821a@gmail.com>
Date: Thu, 14 Nov 2024 07:58:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
To: Rob Herring <robh@kernel.org>
Cc: dmitry.torokhov@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 sudeep.holla@arm.com, peng.fan@nxp.com, arnd@arndb.de,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mjchen@nuvoton.com
References: <20241112053059.3361-1-mjchen0829@gmail.com>
 <20241112053059.3361-2-mjchen0829@gmail.com>
 <20241112182551.GA1394330-robh@kernel.org>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <20241112182551.GA1394330-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_155839_847442_2A54D6F6 
X-CRM114-Status: GOOD (  23.23  )
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


On 2024/11/13 上午 02:25, Rob Herring wrote:
> On Tue, Nov 12, 2024 at 05:30:58AM +0000, mjchen wrote:
>> Add YAML bindings for MA35D1 SoC keypad.
>>
>> Signed-off-by: mjchen <mjchen0829@gmail.com>
>> ---
>>   .../bindings/input/nuvoton,ma35d1-keypad.yaml | 89 +++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>> new file mode 100644
>> index 000000000000..71debafc3890
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>> @@ -0,0 +1,89 @@
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
>> +  debounce-period:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [0, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192]
>> +    description: |
>> +      Key debounce period select, specified in terms of keypad IP clock cycles.
>> +      Valid values include 0 (no debounce) and specific clock cycle values:
>> +      8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, and 8192.
> No need to list the values twice.
>
> We already have a bunch of debounce time properties. Don't add more. If
> you have the clock frequency, then you can use the existing
> "debounce-delay-ms" and convert to register values.
>
>> +
>> +  nuvoton,key-scan-time:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Set the time it takes to scan each key in the keypad, in clock cycles of the IP.
>> +      This parameter controls how frequently the keypad is scanned, adjusting the response time.
>> +      The valid range is from 1 to 256 clock cycles.
>> +    minimum: 1
>> +    maximum: 256
>> +
>> +  nuvoton,key-scan-time-div:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Set a divider that adjusts the scan time for each key.
>> +      This value scales the time it takes to scan each key
>> +      by multiplying the key-scan-time by the specified factor.
>> +      For example, if you set key-scan-time to 64 cycles and configure key-scan-time-div to 2,
>> +      the scan time for each key will be increased to 128 cycles (64 cycles * 2). time.
>> +    minimum: 1
>> +    maximum: 256
> Again, we have existing properties such as scan-interval,
> scan-interval-ms, and scan-delay. How is this different?
>
> With a single property in time units, you can solve for how many clock
> cycles.
>
I will remove the custom properties.

I introduced and replaced them with the existing properties, such as

sacn-interval-ms, and debounce-delay-ms as you suggested.


>> +
>> +  reg:
>> +    maxItems: 1
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
>> +  - debounce-period
>> +  - nuvoton,key-scan-time
>> +  - nuvoton,key-scan-time-div
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/input/input.h>
>> +    keypad@404A0000 {
>> +      compatible = "nuvoton,ma35d1-kpi";
>> +      reg = <0x404A0000 0x10000>;
>> +      interrupts = <79>;
>> +      clocks = <&clk>;
>> +      keypad,num-rows = <2>;
>> +      keypad,num-columns = <2>;
> Surely these should be required?

I will add "keypad,num-rows" and "keypad,num-columes" to the required 
properties in the next verision.


Thank you for the feedback.

As both Conor Dooly and Rob Herring point out, I'll make the changes as 
suggested.

>> +
>> +      linux,keymap = <
>> +         MATRIX_KEY(0, 0, KEY_ENTER)
>> +         MATRIX_KEY(0, 1, KEY_ENTER)
>> +         MATRIX_KEY(1, 0, KEY_SPACE)
>> +         MATRIX_KEY(1, 1, KEY_Z)
>> +      >;
>> +
>> +      debounce-period = <8>;
>> +      nuvoton,key-scan-time = <1>;
>> +      nuvoton,key-scan-time-div = <24>;
>> +    };
>> -- 
>> 2.25.1
>>

