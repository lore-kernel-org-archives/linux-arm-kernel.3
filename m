Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6C7C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 18:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/nvmGiG6t9ytyA672y6bjV3f0iGxkpD3Qq0f/9h6o4=; b=gRI6XXDuXwOOqe2mBplHsIDU9G
	LMD70JDAVRvMfeOY5yFCk/SWIMP0lo9UNDB9bJmXCF4Fl76usYea7is5fqHcZ2qjQLW2KZY1JgKLA
	p2KBe9RqLl66bElIuBgmle2nfLVkbaGee2ajLVYhFMwgJksk4tr/pp9IYglwRrnSlEcMW0fc7tCGq
	717poNXlcIf3mwOMru3RVtyGWdJm1+++1ybrkPl+IFOP7VTHGdIflgZz5o6puAdDAFmS92WIv/Kxi
	IOvBKpMC55lYFKOLDaNDzsUeLmoTwWlAjZBNQLE3g913NvnzGMHBnn4bBdBsPahd/TvOTvzEMdsAs
	ReH+e5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNlM-00000001EIY-06qv;
	Tue, 04 Feb 2025 18:35:08 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNk1-00000001E9x-0Vkv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 18:33:46 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5dca451f922so5084457a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 10:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738694023; x=1739298823; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K/nvmGiG6t9ytyA672y6bjV3f0iGxkpD3Qq0f/9h6o4=;
        b=ZcyZ57ed7gc0VP387xLZMidwqbQ46sBXnExCUQCNUfp0uS13/lebmuubokzXAY0QPZ
         Kb82jQ9yisg83nRo5VceQppEdSNKUMP9Bprhv3w/4M9SO+oaekG8xu9qncl62KubfKwf
         Ji4QKcwXJPgQdk5QiC4xwnLAQ3mDqhJ/2tmcZ7/2XwN8mPadid7KXPvWcJ2mOoeP5IA6
         wKsmLlxxWxG8+zcdZK3EtNrYSGzdIdW1sQKDZ10PXh47kv9SJTubuvVtR766V37k6dzc
         7pUlDanxTRcyE6jeaIOGWxZoLpgCEeoSm/FYu9Tgd+kFyeBjdz2C3w/LHhXK4ALQC75F
         HCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738694023; x=1739298823;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/nvmGiG6t9ytyA672y6bjV3f0iGxkpD3Qq0f/9h6o4=;
        b=uBaMhNw7ORhYgHBjd/y0jmWLqyLXIdjhUUn488gzWGxTguGVtfDHM89pssbSxOoge3
         vQwTv0tWyAo4Z+HSb0Xh3Z2425UYnzSX479ja3WZbcvNI5WkWsQxCsRfxbdzM6oH+iKC
         Bzlw7FCOzbylokqa+MkGV9R9rxKDus844UaxL/aTrA4jjelVwtBASsVJdw0XgnqHSiV9
         1GpuDmb6JJ4L5D3pdfgWN+XvUHBRRyjWIcBsGAXmqFFJBb5hSoOxe9Rgc68BVk6vqw7L
         IbGvqDJ3ZX3MiNjlNZEgFj9yOdUXY5jSI/Izw4rkEAemH2GqMvdQbdAReU7B6jFBdMKX
         XgbA==
X-Forwarded-Encrypted: i=1; AJvYcCXQKICxNk+WaMH4u/WvLop5enlr1zmw3+jf+55WHk319rYgHl7wre4dRL7AJy+t0CkSjp2J9CAFdgku4uBUlIbk@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh7AXD9JfM4L5AwnkoHs7uXIYW2FVNJlCGVM8ambpC/w+yQsNp
	UHCZnrCKc0HxItXwStZH3fIujctujv0zu67tvpfVxsfbmh7FUtUi
X-Gm-Gg: ASbGncvmbYHFWICl/Si497svYjfKRpGwyDCjNkRjRbBCZYZarGwPO+M/4cewbajOtsq
	1q3PlKtXBo1DbrJdyD12iGNxLcerDsbrR5Aj/3x7lG658R6vzz1Qm1AW73ZA61eUaRCDuQgGCYC
	kJacq02TgE9Pn/SLEgdHVOFuZcBsj0BMgrwuqeYu+zrLi+chPKuqWNXN0tdBWj+LnU1OZzNpOlU
	balut4/4sHWrj5tYP/CV5m5YZGLIdyeLHf+NhSD5pd43dF5u8LUQXU7OuI6VJ8v/n6ukhbifWjq
	BDLg9LdBh6nTkdHJqLRnGpfrXyGtTxvO5S3pbP/F6jE6pj8kATKNVX9uZoVlIoxspA==
X-Google-Smtp-Source: AGHT+IHRS/PweE+sCHAZYI/yhUAnmQnwu2gyEspPMa8B0HrAlqSGbvy/xe8cpTz4qnewXCnhJmcyYw==
X-Received: by 2002:a05:6402:3899:b0:5d0:e826:f0dc with SMTP id 4fb4d7f45d1cf-5dcdb71b995mr65267a12.12.1738694022505;
        Tue, 04 Feb 2025 10:33:42 -0800 (PST)
Received: from [192.168.50.244] (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724a9c76sm9951957a12.53.2025.02.04.10.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 10:33:42 -0800 (PST)
Message-ID: <d63009eb-654f-440b-8e59-441ed6b9606b@gmail.com>
Date: Tue, 4 Feb 2025 19:33:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-1-bbac52a84787@gmail.com>
 <20250202-mindful-seahorse-of-action-ba6ee7@krzk-bin>
From: Artur Weber <aweber.kernel@gmail.com>
Content-Language: en-US
In-Reply-To: <20250202-mindful-seahorse-of-action-ba6ee7@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_103345_166147_8349768C 
X-CRM114-Status: GOOD (  21.38  )
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

On 2.02.2025 14:27, Krzysztof Kozlowski wrote:
> On Fri, Jan 31, 2025 at 07:13:49PM +0100, Artur Weber wrote:
>> +$id: http://devicetree.org/schemas/mfd/brcm,bcm59056.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Broadcom BCM590xx Power Management IC
>> +
>> +maintainers:
>> +  - Artur Weber <aweber.kernel@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: brcm,bcm59056
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  regulators:
>> +    type: object
>> +    description: Container node for regulators.
>> +    $ref: ../regulator/brcm,bcm59056.yaml
> 
> Does this device have any other function? RTC? Charger? If not, maybe
> just put everything in one binding in regulator dir.
> 

Yes, the BCM590xx PMICs have multiple other functions: power-on key,
RTC, charger/fuel gauge and some USB/audio related controls. I am
planning to extend the driver to support all of these features in the
near future; when the time comes, the DT bindings will have to be
updated as well.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        pmic: bcm59056@8 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 

I will fix this in the next version.

>> +            compatible = "brcm,bcm59056";
>> +            reg = <0x08>;
>> +            interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +            regulators {
>> +                rfldo_reg: rfldo {
>> +                    regulator-min-microvolt = <1200000>;
>> +                    regulator-max-microvolt = <3300000>;
>> +                };
>> +            };
>> +        };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..8939004d5a3f079c05d313bed4a2f07fbc473bac
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/regulator/brcm,bcm59056.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Broadcom BCM59056 Power Management IC regulators
>> +
>> +description: |
>> +  This is a part of device tree bindings for the BCM590XX family of power
>> +  management ICs.
>> +
>> +  See also Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
>> +  additional information and example.
>> +
>> +maintainers:
>> +  - Artur Weber <aweber.kernel@gmail.com>
>> +
>> +# The valid regulator node names for BCM59056 are:
>> +#   rfldo, camldo1, camldo2, simldo1, simldo2, sdldo, sdxldo,
>> +#   mmcldo1, mmcldo2, audldo, micldo, usbldo, vibldo,
>> +#   csr, iosr1, iosr2, msr, sdsr1, sdsr2, vsr,
>> +#   gpldo1, gpldo2, gpldo3, gpldo4, gpldo5, gpldo6,
>> +#   vbus
> 
> patternProperties should define this. No need to repeat schema in
> freeform text.

IMO a full list is a bit easier to read than the regexes (another
suggestion was to move the list to the description [1]), but I don't
mind dropping it. For the most part, it's a carryover from the TXT
binding.

Best regards
Artur

[1] https://lore.kernel.org/lkml/Z59BQB_cBgTDm4ie@standask-GA-A55M-S2HP/

