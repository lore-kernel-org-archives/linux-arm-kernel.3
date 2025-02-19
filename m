Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AC4C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 05:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRcsV6GoFajL/k7gPCeavo6eC1d5s36mJUqIVFTMKHA=; b=E5b2+l10aDzQxdcQClwYhA4rUl
	jCmhGeXfO+TzHRSWz+o/VPUnwrrheRpGrsnrXzCU2KZMj/Z0c3OSANk7LsApMywO/iHesdMpx8mq+
	vQPJ4Lf/JsnAAmhu5/YBzVP6PyZRGIMkXcxJJ2vFN5N0cX6jRMHows3VlcavF/yffK684p0rWGvzq
	PkqDd6IcST7cAaj2fA0ZibDJobMXBRL+5GUvVtXCjYFlX0Eir1MQEjRHEVNGFEhI9tshEYCEql+83
	yCriD44gK8dwVBKuf3qPf6k6WTxjw+t47fdMQ7uKp179CsCF9Y5LWGu6ZGinIY/I9D9Fi0qRr/gGp
	yjL2yJcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkcrY-0000000AwSI-22gL;
	Wed, 19 Feb 2025 05:43:12 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkcq4-0000000AwGD-0Jn8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 05:41:41 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso950667466b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 21:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739943698; x=1740548498; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LRcsV6GoFajL/k7gPCeavo6eC1d5s36mJUqIVFTMKHA=;
        b=Mr3fuB17GxOP2oxaBy5M9D0Sb2AX+cW57Ky2C+FGPZ0gNqUaYlQk1DBwd/Fac3udo4
         OK1t5s/f/ngkPdI4eYTVFv0/H9++5sXSxWyLJxn4248P+zgMktQYLHZ/1Y3pzDWBiPKE
         LLtrS7LmTxHToHTvMR0ft7pm2FT/kpdenvQIB0H/wg0eV21YFTty/5IcwAUm2WwEj6KU
         3RcxoSgFcwBhyUQbbNyezvJX/1aK84QUx1mxN0l/G2STGCm1y2kAoajR6goPm+YfD/j6
         F+EqFAudGzDWWBc79EU19mWsKtQqdJsbLQ7WF6TDpXf9iWyUKErRZKFWh51eYd0wawDn
         wpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739943698; x=1740548498;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRcsV6GoFajL/k7gPCeavo6eC1d5s36mJUqIVFTMKHA=;
        b=QXc4cng82kvxYtiFMPNr0sbMRiXHaMNEECnWp+CJRIEkIwfBKIBc8w31OKySVPlSoG
         W8VVJHHLVTRGMslfTnTcah/7ia8IHU6DQ2KmzXtSe8JTUyXrgQNasSCwyKdt8CSb3CnQ
         +qV/mKxOe4Grp5Seb0LaUoFMI1xRnnWCKaVRrXy/OYJ3OpYxegb703VSJt2MEY0TZGLU
         aGhKbRz/erjyD24Doin1XaUaadM5k8OdvND0euTkrld5Bf6mMTnXYvMh5zixjoYabAZL
         bLqWJi457LCBBJacqPQF9HKqvB5xU7DxQRamdp7pjrKdeBLX+7V9HIOA6ptgeOtn4OqU
         LHkg==
X-Forwarded-Encrypted: i=1; AJvYcCUwkqDISiiuK75rlXzgm+oSN/Pa5K6IAQbIYdXcVQwKV1nyH68s2V4lzs89TQWsm8RtSWHv/djdAk6cy9x6iZbg@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo/JzYKZw6ZHCZ3eDaSd28vak9M65X2/aB9OLD9ZAWsIGqfGJM
	RpjUsHqp/+aXk4RWnD2Dm0D2AjVhW04MMuKZDsTCZQoy8Wx5mIaa
X-Gm-Gg: ASbGncs7Hx7pFEQyj1TQVK0x7RGrsNdb8XuMIdoQSSKxF05mz/v/LHr6eKNoleIA0ZS
	anoJmLAieT+XuL8HDDeZE19q+BNsvq/zowy4sOGygpOojo4/V7rpbr0yZbEU3EgN+FeEyPOSiCS
	+AWswt62oHafSFTh3qjo82I9NVy6e/ibJCgwPQUpUFnYnJHZn82fHf1jKrhsFW2IkzapY8bXxxk
	3n1j62d6QfeW/FF7jr94xELcfSja+Ar+TjXFkk3uUb+EZy5uiqImMdVim4l3XgOi4g/4iicj/XP
	+QFKr5cgGfCC8gpBgxj1yF5Vm/TAGGIqZqut5+LdUBDV6F1o7fILKmTG35CJ0TGDDg==
X-Google-Smtp-Source: AGHT+IE6McCybXsclJruyebbY+EIZW3bx08t3CeM0dcMArcOBNQnZGaXHD1Epi61kkrMMUgHgWugUw==
X-Received: by 2002:a17:907:7b83:b0:ab7:eda3:3612 with SMTP id a640c23a62f3a-abb70de2909mr1830140366b.50.1739943697665;
        Tue, 18 Feb 2025 21:41:37 -0800 (PST)
Received: from [192.168.50.244] (83.8.115.239.ipv4.supernova.orange.pl. [83.8.115.239])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba9cf8a262sm904238066b.22.2025.02.18.21.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 21:41:37 -0800 (PST)
Message-ID: <d6f8713d-fd7d-4de5-af71-cbb1fbe0f771@gmail.com>
Date: Wed, 19 Feb 2025 06:41:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] mfd: bcm590xx: Add support for BCM59054
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Ray Jui <rjui@broadcom.com>,
 linux-kernel@vger.kernel.org, Stanislav Jakubek <stano.jakubek@gmail.com>,
 Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com>
 <173992516047.2065189.12949590674422169603.robh@kernel.org>
From: Artur Weber <aweber.kernel@gmail.com>
Content-Language: en-US
In-Reply-To: <173992516047.2065189.12949590674422169603.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_214140_126320_AE20AA83 
X-CRM114-Status: GOOD (  29.61  )
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

On 19.02.2025 01:42, Rob Herring (Arm) wrote:
> 
> On Sat, 15 Feb 2025 10:39:35 +0100, Artur Weber wrote:
>> Add support for the BCM59054 MFD to the bcm590xx driver and fix a
>> couple of small bugs in it that also affected the already supported
>> BCM59056.
>>
>> While we're at it - convert the devicetree bindings to YAML format
>> and drop the bcm59056 DTS in favor of describing the PMU in users'
>> DTS files, as is done for most other MFDs.
>>
>> The BCM59054 is fairly similar to the BCM59056, with the primary
>> difference being the different number and layout of regulators.
>> It is primarily used in devices using the BCM21664 and BCM23550
>> chipsets.
>>
>> This patchset has been tested on a Samsung Galaxy Grand Neo
>> (baffinlite rev02; DTS not in mainline yet) with a BCM59054 PMIC.
>> Testing on a BCM59056 would be appreciated.
>>
>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>> ---
>> Changes in v4:
>> - Fix yamllint warnings in DT bindings
>> - Address miscelaneous review comments related to DT bindings
>>    - Note that I did not end up moving the regulator refs from
>>      allOf compatible matches; I explained my reasoning in [1].
>>      [1] https://lore.kernel.org/lkml/ab853605-859d-44c6-8cbd-44391cd677e6@gmail.com/
>> - Add PMU ID/revision parsing to MFD driver
>> - Fix instances of regulator data not matching vendor kernel for
>>    BCM59054
>> - Use different voltage table for BCM59054 VSR reg based on PMU
>>    revision
>> - Link to v3: https://lore.kernel.org/r/20250131-bcm59054-v3-0-bbac52a84787@gmail.com
>>
>> Changes in v3:
>> - Split out regulator DT bindings into separate YAML
>> - Use tables of regulator info instead of get_XXX_register, reg_is_XXX
>>    functions
>> - Drop "regulator: bcm590xx: Add proper handling for PMMODE registers";
>>    it adds unnecessary noise to the series and will be submitted separately
>> - Link to v2: https://lore.kernel.org/r/20231030-bcm59054-v2-0-5fa4011aa5ba@gmail.com
>>
>> Changes in v2:
>> - Fixed BCM59054 ID being passed to BCM59056 function in the
>>    regulator driver
>> - Dropped linux-rpi-kernel from the CC list
>> - Link to v1: https://lore.kernel.org/r/20231030-bcm59054-v1-0-3517f980c1e3@gmail.com
>>
>> ---
>> Artur Weber (9):
>>        dt-bindings: mfd: brcm,bcm59056: Convert to YAML
>>        dt-bindings: mfd: brcm,bcm59056: Add compatible for BCM59054
>>        ARM: dts: Drop DTS for BCM59056 PMU
>>        mfd: bcm590xx: Add support for multiple device types + BCM59054 compatible
>>        mfd: bcm590xx: Add PMU ID/revision parsing function
>>        regulator: bcm590xx: Use dev_err_probe for regulator register error
>>        regulator: bcm590xx: Store regulator descriptions in table
>>        regulator: bcm590xx: Rename BCM59056-specific data as such
>>        regulator: bcm590xx: Add support for BCM59054 regulators
>>
>>   .../devicetree/bindings/mfd/brcm,bcm59056.txt      |   39 -
>>   .../devicetree/bindings/mfd/brcm,bcm590xx.yaml     |   76 ++
>>   .../bindings/regulator/brcm,bcm59054.yaml          |   56 +
>>   .../bindings/regulator/brcm,bcm59056.yaml          |   51 +
>>   arch/arm/boot/dts/broadcom/bcm28155-ap.dts         |   68 +-
>>   arch/arm/boot/dts/broadcom/bcm59056.dtsi           |   91 --
>>   drivers/mfd/bcm590xx.c                             |   86 +-
>>   drivers/regulator/bcm590xx-regulator.c             | 1294 ++++++++++++++++----
>>   include/linux/mfd/bcm590xx.h                       |   22 +
>>   9 files changed, 1377 insertions(+), 406 deletions(-)
>> ---
>> base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
>> change-id: 20240816-bcm59054-a880695e41e8
>>
>> Best regards,
>> --
>> Artur Weber <aweber.kernel@gmail.com>
>>
>>
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/broadcom/' for 20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com:
> 
> arch/arm/boot/dts/broadcom/bcm53340-ubnt-unifi-switch8.dtb: mpcore@19000000: $nodename:0: 'mpcore@19000000' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
> 	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> 

Looks like a false-positive; this patchset does not modify this DTS at
all.

Best regards
Artur

