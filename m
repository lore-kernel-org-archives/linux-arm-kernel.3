Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4E5CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 07:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeCLb7DuMaDPrPdy8QMk7HQ5zSUfNkiDFhEooBB+e/A=; b=0nL67VrX3FgYzyq0VY2xqprY9Q
	VVhn9Z2KAtor0pIobRQMB2f9TqWSyMrNb9DdzcL7pq92y4Trmkhqtela/wv1kZQwxy4n7lGz9XOez
	nbdaDJ1AS3RbY+aU9ZsMDqePidyKtH93MXgMvUeUBfqXeK7SvE9v9XwEnD+OelQlXrxbo1w2LzOTF
	3XJQq1x3f0jig2PD9jF0WDv0GGonIccrEFP6xGEnLq/+aCclCvxTZMzePgSeGBDuloVUtle2xjWO0
	+7Jql56KZmqIQ7ImG3ly/3rICDfH4D+cIC6cgumv+w7DJ/o583eNbFV5zMMEOc9epAHyabJxiqRRD
	yxfvJImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2B0-0000000GHXG-3SDq;
	Thu, 04 Jun 2026 07:07:38 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2Ax-0000000GHWl-2y9b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 07:07:37 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2c0c3546924so2376835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 00:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780556854; x=1781161654; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KeCLb7DuMaDPrPdy8QMk7HQ5zSUfNkiDFhEooBB+e/A=;
        b=e8dbClD7UN6zrtcTZEpCGVfZJ3HoBMZ6DWp2noqLG/O83ibIEQSI2ReFZFHkETXdC1
         +I6aa70VaFPQsE2iVEPFEiHoNLP8oFnAu2KGKxMm/GirHjGmOT1nWe7UKgBu5bmDeOBb
         xpshZuIrIZk3A4f8eeCzM4BAiQSTQQYvNDLiMrhyye0v1e2CNxQh1V5FltzKUMZPYE9C
         AkLoT7t7nhW+tJH3abJsKKnel0dnzxN7rB8FcvQSPc2eqA1MWJefUFWn1rw7Dn+Gnr9w
         dvs07iqY5RnggpKujt9beFVpk8+M/7ghK4MEWw6U4DJmfV05RS/wnhaP696a7FmdCz0G
         fjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780556854; x=1781161654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KeCLb7DuMaDPrPdy8QMk7HQ5zSUfNkiDFhEooBB+e/A=;
        b=nyegRvL9UpNqazS7tgZ9LdnyixvzOKqzmuMuKNhHuRuJtKhhHvMCapkT/ohY34sDTl
         GhhTGK1Y2NZtzGkPoX72+QLMO2pBaRKVwJhbkl7ibtMoK53xRDlAlwFAQzP/bMwo6mi8
         FxQWguO8UvRq0MAWGAINyiwiuG3gzW3QzCJOGMiHyBffHDv0jDIm6q+GVHXz4NUkIn5m
         4EdVYFCsGHvIdYC9dg2Mnq05NXoRwp+IVopPh1Tjho7Ryq8k1aOrEk+RlqMaTbgR0Gq3
         rDGjaDmfb0n1+/hVX+bSq/kc0wQZKcoHqE5bMLDckgw9dOdL0cXpKyBI9t3Y2ywiONbt
         Ptxg==
X-Forwarded-Encrypted: i=1; AFNElJ+xg/fNgEZWnNlA6TdVViHBj+OhCUTtBcwLdHrI0hLo45Jropzx3lh7WKO1aGdCzmfUsKoPkmDhXb+otQohiDCe@lists.infradead.org
X-Gm-Message-State: AOJu0YwfgigAWyonGcUavscmcJTuAdPHYpuyHiL1v/tayF9PLNNGGWxU
	YMC177k+yTv1ACxuTndFq9HpBRxfMJvwwrJr+d7p1edq2TeQaB1B1AUB
X-Gm-Gg: Acq92OGozyXeeOlvTbP+EmLmQi6b+NOB6QC3Ar3Dda/KHbXqKUpGexapj76zbXNU1HA
	SNtr3xqHKdX6ZpblUevB5mmaBwVtElcGyr31mCaLDcDxjqqF2aioi14D/SySUomQ5ZUN2kbjv71
	48kZolokeoVa4nLAZ2NKn7SQrtm+9wFD8xtPC2k89AZOZcd/VnrdnZtO3dswuijQwgR5Z8wje+R
	9Sf+P/DVM4JpZudAdY6zM8DaR/qgwj5UEQQXHir360OGMLeAZaWsyCzCeKws7OcCD4x9gXkeqjC
	48mpGfM+Xnzdm7twobl+DKfyL+ogBHvTFSfrypaQ1PbMj3P3GAt4bDOVi27sxdiwOj1Qt+E+DWp
	Tty5Gw33r0F6wEabcxjlHebYW0fMGAQewyEF4MZJe5G9E0fnkQyHINoUDGr0Z+/k8pojMjYFMc0
	L48HgdiYzJmTxAv2RG5UDSJ1b5wKWIwTY+yuuDBx0Ey7KXsnvMkIMs+9OSAB+AvhLN6BwEHqscx
	Q0rXYpWw7UJaA==
X-Received: by 2002:a17:903:2410:b0:2c1:737:bed9 with SMTP id d9443c01a7336-2c1644a83b5mr69929655ad.30.1780556854379;
        Thu, 04 Jun 2026 00:07:34 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649ca4dsm46159235ad.76.2026.06.04.00.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 00:07:33 -0700 (PDT)
Message-ID: <41914879-5fd0-41dd-b097-2be80096e464@gmail.com>
Date: Thu, 4 Jun 2026 15:07:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spi: Add for Nuvoton MA35D1 SoC QSPI
 Controller
To: Conor Dooley <conor@kernel.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260603043551.1062112-1-cwweng.linux@gmail.com>
 <20260603043551.1062112-2-cwweng.linux@gmail.com>
 <20260603-daybed-absentee-1b64f5caabe0@spud>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260603-daybed-absentee-1b64f5caabe0@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_000735_767610_FC559DDD 
X-CRM114-Status: GOOD (  17.20  )
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

Hi Conor,

Thanks for the review.

 > Missing commit message for one, but why can't your Nuvoton mail be used
 > here?

I apologize for the missing commit message; I will add a proper 
description in v2.

Regarding the email address, my Nuvoton mail adds a corporate 
confidentiality disclaimer to outgoing
external mail, so I use my personal address for sending kernel patches.

 > Sashiko had two comments about resets and num-cs that looked valid.

Noted. I will add the `num-cs` and `resets` properties in v2.

 > Drop this flash node, it serves no purpose here.

Understood, I will remove the flash child node from the example in v2.

Thanks,
Chi-Wen Weng

Conor Dooley 於 2026/6/3 下午 11:24 寫道:
> On Wed, Jun 03, 2026 at 12:35:50PM +0800, Chi-Wen Weng wrote:
>> Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
> Missing commit message for one, but why can't your Nuvoton mail be used
> here?
>
> Sashiko had two comments about resets and num-cs that looked valid.
>
>> ---
>>   .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 61 +++++++++++++++++++
>>   1 file changed, 61 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> new file mode 100644
>> index 000000000000..f7b9cb52d8e5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> @@ -0,0 +1,61 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/spi/nuvoton,ma35d1-qspi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 Quad SPI Controller
>> +
>> +maintainers:
>> +  - Chi-Wen Weng <cwweng@nuvoton.com>
>> +
>> +allOf:
>> +  - $ref: spi-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-qspi
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
>> +  - clocks
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        spi@40680000 {
>> +            compatible = "nuvoton,ma35d1-qspi";
>> +            reg = <0x0 0x40680000 0x0 0x100>;
>> +            interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clk QSPI0_GATE>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            flash@0 {
> Drop this flash node, it serves no purpose here.
>
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
>> +                compatible = "jedec,spi-nor";
>> +                spi-max-frequency = <30000000>;
>> +                reg = <0>;
>> +                spi-rx-bus-width = <4>;
>> +                spi-tx-bus-width = <1>;
>> +            };
>> +        };
>> +    };
>> +
>> -- 
>> 2.25.1
>>

