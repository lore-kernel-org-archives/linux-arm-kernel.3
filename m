Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1267E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 03:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InGT874kUKhcsccv7ICljIdW+V3gP1KGLAFnR4ziHQA=; b=dt3GLGwHl6PgVchKEndTrLGwga
	cpbhtjr/PJ2d2J/pNcqJN76Ear9py1c8weBY0wKE75x3cSJe3ioqJyVEHkTW3xcX1Kgu5INeqEf3e
	XhRFIglSunsSxu6RpzDGj0IdKTJanbPJgEqbNIcQtFnsJ6uLiuBgcYyFoEMuphwxoY3hNF4zGsLyy
	ik0e2wJ37ZXfGGoE1tjajmkrDDngF2TI4sB+4j9wT/XKkNkpIciY8XdFkYHwOdDDtcohy1OGhDEgw
	TWX5GT9cQG+EtyPXi6yEFBliaRLi6CJFAiroVQ1Pqqlzl8JscvV5A1hEBMxGvvz6PRQHSNd5xewQj
	XAy5xMxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJP66-00000000RYD-1BMA;
	Fri, 06 Dec 2024 03:33:42 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJP55-00000000RSo-0doS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 03:32:40 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso1197942a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 19:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733455957; x=1734060757; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=InGT874kUKhcsccv7ICljIdW+V3gP1KGLAFnR4ziHQA=;
        b=NSVGj0jRr+rN2cbotQkNanlowml+iKBnrCeOdSOgQ6WZqVf4JKeTlO9UramDzLW/RJ
         htLtDUuiw6SWDHBLx97h2QLgma1/B2yDp20qgex3WZaByz04AIefJgSt0XI4CKtEJVrX
         QzLE+ADCNTcMiy9Lgmy0NU6yfS+qguEglee7io7lD498Yft/sc3Nc49r/Zd9rqnp/JjP
         ISePUqjUp4l07TbPukbwco7Q4dx4Fc1u6R6CavqOAsbRv9vsNRjivLY70vI4XAwvWJgG
         wPdr5ZaE0ea+uBFXq+jY1smUDGoUf8ZzrAk1qEs5OMr4OzkiVxktskUtx/aKl7xUF3u5
         VoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733455957; x=1734060757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=InGT874kUKhcsccv7ICljIdW+V3gP1KGLAFnR4ziHQA=;
        b=p8DQzCcANd0kXj2kxQV6YJAgiLSTi8sN/peNuMknTEzwHnIdrrH7e77LBBZIfLWmnW
         1AwkIoeP5H1auKGl9j3tSVOqDSoLC00ygt5pfuSAgXAGiKf9Ck/0AoYvv8f2bqCyYvTB
         4hgSyHuOx+f9LfTcMQFvRo4iJ3SMe8q4n+OzZaYn0Cq1rvTcozFhEoG+9craF8TM7AjE
         rK762H8ZBptVqHwcBpicyS9KyuHSPPraNQw44FKvdXqLiOjz2ChTGVLBjGfUK7UDxlBJ
         mBfqPOvRzgdA3GqlFYqOnIO0LpegLupGy+PGoKqAYvFE2eSUtxJZKlHXglbyKuwVCPrO
         cReg==
X-Forwarded-Encrypted: i=1; AJvYcCUxpi0UrNqeDsDX4QhGd06ttNLsUBYJoU68hSQ4FeZgoL3qI/TN5ybKdrbbDt5c1kMxnHKN56yT2DHl0CWeYaPG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9VWqEzbBrm2OfG746BGj+pLM4VL0IQOb0IG44y2EO6pLEb0R8
	YchWS++jxWDOH/4XwURQNMN0Fiv1fxEsXEv1FHsiRNLWnt79vKkY
X-Gm-Gg: ASbGncuzT8XeMfVV68i3vp0XmcIT08uWOdt20tWKOqO/kaxcfJsoa1zOhN8pyIsycLn
	Br8uAwQp0oMG6NMxUN5ymyz6jJ3xcOyK1xfqnrIaEd0FlMSDD4NLobqQJljEP4hFk2Z7aRYNPVq
	ddmkxskdLMiMA7t/N+vmkdFeed22ddXXNGgKJaaJVHrHCCS3JECtEf9i1j9TTEPtKkPU3B68eZJ
	hTQ44NxzvxrKSYrcWTZMI+4m4Vb7WWO1xOPUIHMG4lKQAYc1QAkNQqVGU0Qlvr3n7TZ+07J3rA6
	fBmkMOfH8lSP1TXFc64NgzFN
X-Google-Smtp-Source: AGHT+IFzqeeiyWkh+7hlsWMiFQHoZNyYQ7mM3MvVKI/Bj7bYHGVlKAvdSQ8+aeb4VO2V4WUi5eqliQ==
X-Received: by 2002:a17:90b:3a50:b0:2ee:9cd2:a589 with SMTP id 98e67ed59e1d1-2ef6a6be86dmr2550021a91.20.1733455957398;
        Thu, 05 Dec 2024 19:32:37 -0800 (PST)
Received: from [172.19.1.43] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2700aa25sm4049963a91.16.2024.12.05.19.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 19:32:36 -0800 (PST)
Message-ID: <1c0f9efb-61a0-42b9-abe5-87cabe2d783e@gmail.com>
Date: Fri, 6 Dec 2024 11:32:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_193239_194601_033D7E8C 
X-CRM114-Status: GOOD (  18.59  )
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


Hi, Krzysztof:

Thank you for your feedback on the v4 submission. I understand that some
of your previous comments were not fully addressed. I want to make sure
I completely understand your feedback and resolve the issues correctly.

Could you kindly let me know if the following approach is acceptable?


On 2024/11/20 下午 04:41, Krzysztof Kozlowski wrote:
> On Tue, Nov 19, 2024 at 02:59:53AM +0000, Ming-Jen Chen wrote:
>> Add YAML bindings for MA35D1 SoC keypad.
>>
>> Signed-off-by: Ming-Jen Chen <mjchen0829@gmail.com>
>> ---
>>  .../bindings/input/nuvoton,ma35d1-keypad.yaml | 69 +++++++++++++++++++
>>  1 file changed, 69 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
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

I will modify to:

properties:
  compatible:
    const: nuvoton,ma35d1-kpi

  reg:
    maxItems: 1

  interrupts:
    maxItems: 1

  clocks:
    maxItems: 1

  linux,keymap:
    description: Keymap for the keypad.

  keypad,num-rows:
    description: Number of rows in the keypad.

  keypad,num-columns:
    description: Number of columns in the keypad.

  debounce-delay-ms:
    description: Debounce delay time in milliseconds.
    maxItems: 1

  scan-interval-ms:
    description: Scan interval time in milliseconds.
    maxItems: 1

required:
  - compatible
  - reg
  - interrupts
  - clocks
  - linux,keymap
  - keypad,num-rows
  - keypad,num-columns
  - debounce-delay-ms
  - scan-interval-ms

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

I will modify to:
keypad@404a0000 {

> 
>> +      compatible = "nuvoton,ma35d1-kpi";
>> +      reg = <0x404A0000 0x10000>;
> 
> Lowercase hex

I will modify to:
reg = <0x404a0000 0x10000>;


Your guidance will be greatly appreciated, and I will incorporate the
necessary changes in the next submission to fully address your concerns.

Thank you for your time and patience.

> 
> Best regards,
> Krzysztof
> 


