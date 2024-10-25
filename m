Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFF7D116F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 05:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvCggmtLdEUI172Y83XNX/Onv4GEKVaPGfEZwS/XjT8=; b=Z2eZ1x6XnVp/No9kiwzez+7h3h
	I7WKdzvKmoqywnkaP/OBvhhjt8/wO1+z1bA69+KL9TLlvnH+ckZ7v9yT72G3vZlGL2Nsymuxr+dmz
	kE4LD0UHhmKvBwtcJMpRK4i7W+vcQerIM++hjYnvTcO6k8MgkmxfS3735k/xKGxawPIAvzRoDCvI5
	dAlvSqkyJMHMGotroh+BwfdO1fxfNkGBi10AiwYy+3xjOuxuh/cHmDvNsFcJ+tzWIWxeUb2QZhyTS
	7bfQqpvhC65m27W1QlGso+ET4oo378FSbO/R8zNZ4NofqSWKIaDkKFrtKKXMl9X0BJeLYxIUSCRBG
	+H/m1crg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4D1r-00000002aFZ-3bnC;
	Fri, 25 Oct 2024 05:38:31 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4D0J-00000002a8p-0AWh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 05:36:57 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7203c431f93so1292648b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 22:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729834613; x=1730439413; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HvCggmtLdEUI172Y83XNX/Onv4GEKVaPGfEZwS/XjT8=;
        b=eO3YWnXYsh8w2L3sr3QVLdfKqGXnvi2GI9AqOQ44uhnzWn2Xtzp+BDfhX9yqIGO0m8
         +W4UI58jS+FzCPFTRoiNRt6pPr/lxEd+zaZBXnD30CHAGzCv3x0Z1dI3bCnBi+A6imb8
         CSdp+GWEUs/lUhD444a88F2SQ3dZuLBfyU8jIml9yGsbN+cYlpEFJNo/f/LTO9aajp/7
         FHDiSGcRAliiO+eVrrINIelRcZRg+vyyk241J6pRQ20c/5LzB8fTy3UjyYDXYyb/aaQO
         iSHoUJavrLZhebO6tYhPl28v3465DekyVs/erP8kwTeP1o5iWXgBM7T2bTN7+1HUtMGS
         SwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729834613; x=1730439413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HvCggmtLdEUI172Y83XNX/Onv4GEKVaPGfEZwS/XjT8=;
        b=WPIuSbWULs09Ies5Ymicr/7Zk6OLRMC9H4BOFrvwqNEXGCPOBoRXK37C5wJZnm9lnB
         x/e3BVD12juhhE/R92he4x/djdhg2dsnG40f7+vSDrzpvf6ieJDsHGf/KM0dvsB7dUoJ
         emo+MVbctugsp59/swHm26WZRjlFvE54gWtzhHwkWnWrULtTArbGlqEEnKuJgv5xYrIC
         n5MIUxCfk5/IWKv8WJER19sgKkzbhcUL/2akkk5UtJkp7NSwNlt6g42t9t9gcWo+ZH+I
         3bhZvffXmMw3puNBzf18tnbKjHO6q5gGaDZtTkbRIsxKXCCN4hbIR3p0DKqj9VHmiUJ9
         8Reg==
X-Forwarded-Encrypted: i=1; AJvYcCVNAKyYHtxcM7jazziZfHACekOj4sPlrrnMiMk6pL/qBMpv0RZnddIj9b1agXhQmqYBjW19I4YTU+6qbz8RlmIw@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi6auOHaSht8xkZEBmEEOet+vNQiRzboVZNoOtrEFRNxpdepUN
	hLxX43nRo2N2HazQ3Bzap+7BAq2d6FBwY1ZV6ndLPmEAD3YHN8Xr
X-Google-Smtp-Source: AGHT+IGzbzwpbOrc+GHYvSHu/3iAhi85esxI7itU+Q8udNFbHIvIFqzfKJoIJUw9BF55+RUzypHRzw==
X-Received: by 2002:a05:6a00:3c94:b0:71e:7a56:3eaf with SMTP id d2e1a72fcca58-72030bba11fmr11795617b3a.24.1729834613433;
        Thu, 24 Oct 2024 22:36:53 -0700 (PDT)
Received: from [172.19.1.43] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8660dd1sm333486a12.14.2024.10.24.22.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 22:36:53 -0700 (PDT)
Message-ID: <871e9a4c-7a3c-4a24-8829-a079983033da@gmail.com>
Date: Fri, 25 Oct 2024 13:36:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mjchen@nuvoton.com, peng.fan@nxp.com, sudeep.holla@arm.com, arnd@arndb.de,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 dmitry.torokhov@gmail.com
References: <20241022063158.5910-1-mjchen0829@gmail.com>
 <20241022063158.5910-2-mjchen0829@gmail.com>
 <csbechg6iarxx52z2gqidszhvgjdvaraoumpfcsozelhuuhmtb@ec7es3txuzxc>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <csbechg6iarxx52z2gqidszhvgjdvaraoumpfcsozelhuuhmtb@ec7es3txuzxc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_223655_108955_E77B22C7 
X-CRM114-Status: GOOD (  24.68  )
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


On 2024/10/23 下午 04:40, Krzysztof Kozlowski wrote:
> On Tue, Oct 22, 2024 at 06:31:57AM +0000, mjchen wrote:
>> From: mjchen <mjchen@nuvoton.com>
>>
>> Add YAML bindings for MA35D1 SoC keypad.
>>
>> Signed-off-by: mjchen <mjchen@nuvoton.com>
>> ---
>>   .../bindings/input/nvt,ma35d1-keypad.yaml     | 88 +++++++++++++++++++
>>   1 file changed, 88 insertions(+)
>>   create mode 100755 Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml
>>
> Please run scripts/checkpatch.pl and fix reported warnings. Then please
> run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
> Some warnings can be ignored, especially from --strict run, but the code
> here looks like it needs a fix. Feel free to get in touch if the warning
> is not clear.
Sorry, I will remember to run checkpatch.pl before uploading the
subsequent patches and fix all errors and warnings
>> diff --git a/Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml
>> new file mode 100755
>> index 000000000000..3d9fc26cc132
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml
> Filename based on compatible. There is no nvt prefix. Entire filename is
> somehowdifferent than compatible.
I will modify it to: nuvoton,ma35d1-keypad.yaml
>> @@ -0,0 +1,88 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/nvt,ma35d1-keypad.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NVT MA35D1 Keypad
> NVT? Nuvoton?
I will change NVT to Nuvoton
>
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
> Missing vendor prefix... or why are you not using existing properties?
>
>> +    description: |
>> +      key debounce period select
> select? or clock cycles? I don't understand this. Say something useful
> here.
>
>
>> +      0  = 0 clock
>> +      1  = 0 clock
>> +      2  = 0 clock
> Heh? So this is just 0
>
>> +      3  = 8 clocks
> This is 8
>
>> +      4  = 16 clocks
> 16, not 4
>
>> +      5  = 32 clocks
>> +      6  = 64 clocks
>> +      7  = 128 clocks
>> +      8  = 256 clocks
>> +      9  = 512 clocks
>> +      10 = 1024 clocks
>> +      11 = 2048 clocks
>> +      12 = 4096 clocks
>> +      13 = 8192 clocks
> Use proper enum
I will update the definition to specify the debounce period in terms of 
keypad IP clock cycles, as follow:

nuvoton,debounce-period:
     type: integer
     enum: [0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
     description: |
         Key debounce period select, specified in terms of keypad IP 
clock cycles.
         This value corresponds to the register setting for the keypad 
interface.
         The following values indicate the debounce time:
         - 0 = 0 clock cycles (no debounce)
         - 3 = 8 clock cycles
         - 4 = 16 clock cycles
         - 5 = 32 clock cycles
         - 6 = 64 clock cycles
         - 7 = 128 clock cycles
         - 8 = 256 clock cycles
         - 9 = 512 clock cycles
         - 10 = 1024 clock cycles
         - 11 = 2048 clock cycles
         - 12 = 4096 clock cycles
         - 13 = 8192 clock cycles
>
>
>> +
>> +  per-scale:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Row Scan Cycle Pre-scale Value (1 to 256).
> Missing constraints
>
>> +
>> +  per-scalediv:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Per-scale divider (1 to 256).
> Missing constraints
>
> Both properties are unexpected... aren't you duplicating existing
> properties?
pre-scale:
This value configures the IC register for the row scan cycle 
pre-scaling, with valid values ranging from 1 to 256
per-scalediv:(I will change pre-scalediv to pre-scale-div)
This will describe its role in setting the divisor for the row scan 
cycle pre-scaling, allowing for finer control over the keypad scanning 
frequency

I will change it to the following content:
nuvoton,pre-scale:
     type: uint32
     description: |
         Row Scan Cycle Pre-scale Value, used to pre-scale the row scan 
cycle. The valid range is from 1 to 256.
     minimum: 1
     maximum: 256

nuvoton,pre-scale-div:
     type: uint32
     description: |
         Divider for the pre-scale value, further adjusting the scan 
frequency for the keypad.
     minimum: 1
     maximum: 256
>
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
>> +  - per-scale
>> +  - per-scalediv
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/input/input.h>
>> +    keypad: keypad@404A0000 {
> Lowercase hex and drop the unused label
I will modify it to: keypad@404a0000 {
>
>> +      compatible = "nuvoton,ma35d1-kpi";
>> +      reg = <0x404A0000 0x10000>;
> Lowercase hex
I will modify it to: reg = <0x404a0000 0x10000>
>
> Best regards,
> Krzysztof
Thank you for your guidance!
I look forward to your further comments.

Best regards,

Ming-Jen Chen



