Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707C1C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 20:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtxIl2/0kH6G7uGWJZ1otltXuP0muJe5B2+xaMM9Q4o=; b=K3Flwu1E034e8u7iDSX4rMJ7OS
	ztw78JjysLzOuz+Xwuo0UdGPtLGpkNOiXsvfofNknl/zqduPW+6VQObsriEcduJnaTLX78IgNet54
	0ytU97woLnl02+dqJdAe7IZ7wwqnjYTXdfCqnxXRbOadh9bo+TGa+p2S2Uh2Ft0XHOzwwvbOkXoqN
	Lq3s6ygEoJhDBG4DjA24yFo13/M62XAKclWrGE8F0nK+9howrsdvvm0FUYvqSCKFUhTXmnF1pwPQ1
	7LjH0KhomVplGIuIDe6zzKHo/RH5U3FrHfKZC5lvM996i4KqMdDT6YO2IIrTJez+Q2fDtFJOzvrh7
	/nGnLZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOWU-0000000DJ51-09Bw;
	Tue, 06 May 2025 20:04:14 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKcW-0000000CZ2z-3s4F;
	Tue, 06 May 2025 15:54:14 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-708b3cc144cso55326577b3.2;
        Tue, 06 May 2025 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746546852; x=1747151652; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtxIl2/0kH6G7uGWJZ1otltXuP0muJe5B2+xaMM9Q4o=;
        b=Rs03PlnpYPknUx6SCEH5EmhMrlzSYUjDXF4XErhKr9kgBnwmJd4O/3AHIzeeENtw1C
         8+RrJ81eaE7yu/q0fxP6hwGr4bLp28LzN0kqjD51xQBvZ5yuJWxwnnza5RgBevQvBcUU
         6DS+NXcQC50uOGR1sYXBPXh8uyRwie08DvFmXG67ZLvrkt9IcEZawwXMRc5BkpFA5RBD
         Aljj2Dc7sJcckx3cjCsHGNr/laWKs/iircMP2uYEYpsR7w8UCuQpA0GK3vuQTSFB8tQj
         Oe0KZ8AIVqwa2zOW91fSJC8eDkDwIJfxEbd39OwXxRibLM5btK1/Cyy/Nmdgq3x87gUX
         i2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546852; x=1747151652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtxIl2/0kH6G7uGWJZ1otltXuP0muJe5B2+xaMM9Q4o=;
        b=awetR45AfUmTc54v5RYovhuO5i+Z5yjFbgLx5KlB5JuPVBwPzwRFybWBpOwbFzEy30
         P0NIg+7kkB79yM33JmWwy6v2f1NOGc1Rjil6l8IwWfTHw3d6CPEKyAhCwJhsORPJqWB2
         Ov/m9dX8HxIyss2A8SF+FGKGSkbD5qET1gvCSKz0mS1fgvcrJgkOTY9FnatrjFHgCY9W
         3IJfxTYgokUFCuwLV/fIvbSQNyFNnQrG/YfNDoexDu5xxf1dMkhs1AuY9A4oz/SsSl4s
         99ABZ5Y9pOf+peV604P37C4+LnqMKWx3savNXQ5vFrB79Y/fgSCgg7t5bLhi/V8CqUon
         IppA==
X-Forwarded-Encrypted: i=1; AJvYcCXJzv0xaTBZQy+SnMOCRBm9ELnSTHQ0gxgi8Kr0clIgaEBsX4TCkbi3U+FXxGa2W6+rNkbcFG49n/6GVjNFhojF@lists.infradead.org, AJvYcCXpgaOHdJmT0KRvxhhKpE18lyGyd+e43FTGWdZb+8Joahg5n7xpYceeRfcPblTFLmtW8Y4OUxNPOZ7lucpJCJw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzU68N1C2eb3gGTnAZU1nmAeR5NAYpf9onRL4pcovg8aDgLWw5y
	4FtF1vLXo3zgSxmQX5FLEoMvSfOdFkj+5y4xOuB3WSAkWGmLw77L
X-Gm-Gg: ASbGnctonfbWAos3VdT0Z8b5Q1OiZLjAasXOErZ6V2s7F+HJYE71cjcEO88kEdRpZkp
	Ie1aZ5CkeXiTbXSYB2+P1CqFVGB+74Oh54511g3XbB4gi+qFwWlV9Tes/8DEdLZSUPZGBq/YxS8
	ou9zUhVz5VMqm5QyWLZztIS26NHVGuvF2X34Guq4WOgCOrUbTdUZT2/lCKOnuooQ4jJOCjsu9B+
	BjLaDyxmEHctIJaraYsgp+GYD2y88X9jDNXjsm9mjILvSVDmh0tH63vDGpKf8uoWhGmRcYaYN9Z
	OC4jXMHd/XTpWoRYKy+s4MeS5Su/NZ+BlITQ+Q==
X-Google-Smtp-Source: AGHT+IFI+tUNkJxIuyYAc8bmcRWbskziPQs/XLMKjqhiI4ibMmeWezadISFleGs+KBk3gs5XHIjS9Q==
X-Received: by 2002:a05:690c:7084:b0:706:cc34:daaf with SMTP id 00721157ae682-708eaefed5fmr175458157b3.20.1746546851752;
        Tue, 06 May 2025 08:54:11 -0700 (PDT)
Received: from [100.96.0.9] ([104.28.237.13])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7091bf0b878sm4038627b3.12.2025.05.06.08.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 08:54:11 -0700 (PDT)
Message-ID: <c8114ff8-f207-4ea8-aaf1-298dcea9f030@gmail.com>
Date: Tue, 6 May 2025 11:54:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add Luckfox Omni3576
 and Core3576 bindings
To: Conor Dooley <conor@kernel.org>
Cc: heiko@sntech.de, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org, krzysztof.kozlowski@linaro.org, conor+dt@kernel.org,
 jonas@kwiboo.se, frattaroli.nicolas@gmail.com, andrew@lunn.ch
References: <20250506114115.613616-1-inindev@gmail.com>
 <20250506114115.613616-3-inindev@gmail.com>
 <20250506-almighty-uncork-f7a0bc42d763@spud>
Content-Language: en-US
From: John Clark <inindev@gmail.com>
In-Reply-To: <20250506-almighty-uncork-f7a0bc42d763@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_085412_973972_55BFDC94 
X-CRM114-Status: GOOD (  15.49  )
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

On 5/6/25 11:44 AM, Conor Dooley wrote:
> On Tue, May 06, 2025 at 07:41:14AM -0400, John Clark wrote:
>> Add device tree binding for the Luckfox Omni3576 Carrier Board with
>> Core3576 Module, based on the Rockchip RK3576 SoC.
>>
>> Signed-off-by: John Clark <inindev@gmail.com>
>> ---
>>   Documentation/devicetree/bindings/arm/rockchip.yaml | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
>> index 455fbb290b77..826dede32145 100644
>> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
>> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
>> @@ -715,6 +715,16 @@ properties:
>>             - const: lckfb,tspi-rk3566
>>             - const: rockchip,rk3566
>>   
>> +      - description: Luckfox Core3576 Module
>> +        items:
>> +          - const: luckfox,core3576
>> +          - const: rockchip,rk3576
>> +
>> +      - description: Luckfox Omni3576 Carrier Board
>> +        items:
>> +          - const: luckfox,omni3576
>> +          - const: rockchip,rk3576
> 
> Not sure this is correct, does the module not have to be attached to
> this particular carrier to be used?

The compute module and the carrier board together like the E25. 
Presumably the compute module would be used in other applications
but the carrier board is not useful without it.

Is the E25 done correctly here?  I can copy this format:

model = "Radxa E25 Carrier Board";
compatible = "radxa,e25", "radxa,cm3i", "rockchip,rk3568";
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts?h=v6.15-rc5

compatible = "radxa,cm3i", "rockchip,rk3568";
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi?h=v6.15-rc5

- description: Radxa Compute Module 3 (CM3)
items:
   - enum:
       - radxa,cm3-io
   - const: radxa,cm3
   - const: rockchip,rk3566

- description: Radxa CM3 Industrial
items:
   - enum:
       - radxa,e25
   - const: radxa,cm3i
   - const: rockchip,rk3568
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/arm/rockchip.yaml?h=v6.15-rc5

> 
>> +
>>         - description: Lunzn FastRhino R66S / R68S
>>           items:
>>             - enum:
>> -- 
>> 2.39.5
>>

