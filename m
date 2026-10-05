Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9B6CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 03:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUwgITrS/KUPi15l4I3iar5grcNqp8PamuCjtCJWXOI=; b=ioc9RQWSU6NordOSxPAiFnpid4
	YtmK+ECxCHccp3j2yB7Tflq4IycQxY6dtj6lrFUrDOlbZRKYOqB8lSA2CWTEdxHz0A55j5fGD79Ol
	iH9ZB2wPwN8OmUXYknuhMlmn67FPqf5No05mahJ31iVK0UBd2nc3WB1SrbBRSoQnOWCS5Z8VX/V2e
	blKfjbmy/jAisW7MaBriYHfJHVPwu6LgTKrg95W8WSvlNjZXcJQ23YHVXKsLl+Wni/gUTkEfi8Wvz
	YMF46ZRP6rD6UfUQ46DiiPO86JYMCr9GGmCTWzNZNkKy8pK/u/TV2Yq+OZKyjDp1/IdpRBOBAUohW
	DrHRu16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDZ3j-0000000Fc9C-1JFa;
	Mon, 05 Oct 2026 03:08:11 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDZ3g-0000000Fc8r-2EJg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 03:08:10 +0000
Received: by mail-pz2-x0f.google.com with SMTP id 41be03b00d2f7-cc4c3304833so309842a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 20:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791169687; x=1791774487; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iUwgITrS/KUPi15l4I3iar5grcNqp8PamuCjtCJWXOI=;
        b=ikxO8qatK6Qc1MFODWW9HcDLIRn9ORtGn1QJ5KpkAv2kaUBZlmhEy9zHRJfhv4BOqG
         9uM3z6qhrOEx9fPZ89YKl404/WmeGOR+imX7V2QkYYvoLAUi9mjL9W4SIQe6OzJXaAdE
         i3z+Lgi2Ql/VoPK5sD8JLlsaUCaqUlFU/mki2/ThLbL91nrXasdrSG2wGmkHmRFsjH3R
         7HyUK/iJhiyDGZUM1rSchryGooIWRSSHtZ6nOunoxiV5Z1i/qNoBp2YEMSKaQ/U+ZLZp
         lnEd9D4Uqtv6HityRZrqDhfBltf2A92prkIYqkqWn0jG7JsHAOyKoklpZCHBvaKb7VBd
         YX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791169687; x=1791774487;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iUwgITrS/KUPi15l4I3iar5grcNqp8PamuCjtCJWXOI=;
        b=Oby2LmyTuOcyMGkxwFlVopGwB31Z+vrbdcXW7nJG2kvaV6Brzt8ZXxnC48aOy8rVVv
         gjJ4fYLH2L81xus8vz80Hl2Y2DxOsk5TBvej/fDWhPw2w49BsZM1YO7+mcKBjsy3d1j4
         NODITkMg73tfTToyMBEiPY9nhlGlB8dEu0a6m1H3lDPvv4OjmBMwv573gmp9AO0fAUuD
         loAoLxnX3SJiTdWztggN7Q8lmYVdEcXew3MIFILvPL1ywTeVh11oNzqgRVud4/7wuQTQ
         N9yL82ZQ4fQie+IYY68yqVQYlj/Zlskjoog5aMHjsA2VKVhiVOomoPwJdZHx/wtTRBIO
         vu4A==
X-Forwarded-Encrypted: i=1; AKwUvBy3hb9pNHRg9SFMSvqo5ZofTvCgZUolRQwr4O4T7kzAaB6kYiYkNzTSDaZ6jh7D0wnRWHR1Wrz8sxbjNzKpMYAo@lists.infradead.org
X-Gm-Message-State: AFq9FYK/BPFKb9iq05btTRpBHgsy+cqQmlVxuOuSNVWLbkoaUUe8AcI3
	Pc+QWBHucgq7nXdrN23BDAYvlUu9uu2oNOQlFtXfqsCsEWassYK4xGZH
X-Gm-Gg: AYBFou3L4ggfDTFVvPRePvcFT6/neasnNMj7UdqPSxyx4Rzkuuth7OihdQcXwE/4owU
	H6jRAqXs9nkbA0SRSOi7vjcRllPN5kW3hBDff5Ov1EwXVUWu5Yva00LQQrEgIWF0I8j/03CQMML
	yZNR1t2H6f6lsImb1tf96hUNDnGB/YbN/Mu30VIn5iQvoxc39r/2p4DaetaoB74q4XcQ6b0OTSE
	EI8OoyvTK/4DNO3s/mbAefNxgWUk0IY/2RiZ82Yn3la3wl8dohD7jKYzX6ImjwHvL0+X8NRz3dk
	UYAhjxvqGXLT1/oana6EBL0v+PxK8tBMyhI4lUxK4uxrepDJBBHBGKyJDYF8eebdUgm7nhqmNWi
	aux1ZHfP7S/rwznEwXP0uvp3LX3XtpU1/U100Ew4YZ32PK2GnbppcE8kGKqudlS0BogBRKd5zBm
	HIgo48CHRNc+6z/Z8VJkGae43ZwhCmMNdf7iJCRGwJPb2BhLBy7VK6HbN1++lAnKv46OJe69qeS
	r7cwUlWisYjdZj6KbpGruDtCYJAh0elBuMCpbLZ2y1o6LDi3Q==
X-Received: by 2002:a17:90b:4ac1:b0:3a0:ddd6:896c with SMTP id 98e67ed59e1d1-3a6ce6af244mr7716297a91.17.1791169686748;
        Sun, 04 Oct 2026 20:08:06 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e497230sm8991834a91.11.2026.10.04.20.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 20:08:05 -0700 (PDT)
Message-ID: <9706e01c-9c90-4dbc-a694-7f88bf7ee38c@gmail.com>
Date: Mon, 5 Oct 2026 11:08:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] spi: dt-bindings: nuvoton,ma35d1-qspi: Add MA35D1
 SPI controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20261001131818.110028-1-cwweng.linux@gmail.com>
 <20261001131818.110028-2-cwweng.linux@gmail.com>
 <20261003-innocent-placid-markhor-e7c6ec@quoll>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20261003-innocent-placid-markhor-e7c6ec@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_200808_610176_0088BD6B 
X-CRM114-Status: GOOD (  22.89  )
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



Krzysztof Kozlowski 於 2026/10/3 下午 10:25 寫道:
> On Thu, Oct 01, 2026 at 09:18:16PM +0800, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Extend the existing MA35D1 QSPI binding to also describe the MA35D1 SPI
>> controller.
>>
>> The SPI and QSPI controllers are separate hardware IPs. QSPI additionally
>> supports dual, quad and DTR transfers and a target-mode timeout function,
>> but these differences do not require additional controller-specific
>> Devicetree properties.
>>
>> Both controllers expose the same Devicetree-visible resources and provide
>> up to two native chip-select signals. GPIO chip selects are supported
>> through the generic SPI controller binding. Since the MA35D1 QSPI driver
>> now supports GPIO chip selects, also remove the existing restriction
>> on cs-gpios for the QSPI compatible.
> 
> This has to be a separate commit.
> 
>>
>> Add the nuvoton,ma35d1-spi compatible and update the binding description
>> and examples to cover both controllers.
>>
>> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
>> ---
>>   .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 41 +++++++++++++++++--
>>   1 file changed, 37 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> index 40965ec5163b..72f2e1e1219a 100644
>> --- a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> @@ -4,7 +4,17 @@
>>   $id: http://devicetree.org/schemas/spi/nuvoton,ma35d1-qspi.yaml#
>>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>>   
>> -title: Nuvoton MA35D1 Quad SPI Controller
>> +title: Nuvoton MA35D1 SPI and Quad SPI Controllers
>> +
>> +description: |
>> +  The Nuvoton MA35D1 SoC contains separate SPI and QSPI controller IPs.
>> +  Both controllers expose the same Devicetree-visible resources and provide
>> +  two native chip-select signals. GPIO chip selects are supported through the
>> +  generic SPI controller binding.
>> +
>> +  The QSPI controller additionally supports dual, quad and DTR transfers and
>> +  a target-mode timeout function. These capability differences do not require
>> +  additional controller properties.
>>   
>>   maintainers:
>>     - Chi-Wen Weng <cwweng@nuvoton.com>
>> @@ -14,7 +24,9 @@ allOf:
>>   
>>   properties:
>>     compatible:
>> -    const: nuvoton,ma35d1-qspi
>> +    enum:
>> +      - nuvoton,ma35d1-spi
>> +      - nuvoton,ma35d1-qspi
>>   
>>     reg:
>>       maxItems: 1
>> @@ -33,8 +45,6 @@ properties:
>>       maximum: 2
>>       default: 2
>>   
>> -  cs-gpios: false
>> -
>>   required:
>>     - compatible
>>     - reg
>> @@ -59,7 +69,30 @@ examples:
>>               interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
>>               clocks = <&clk QSPI0_GATE>;
>>               resets = <&sys MA35D1_RESET_QSPI0>;
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +        };
>> +    };
>> +
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +
> 
> No need for a new example, for exactly the same node. Difference in
> value of a property does not justify it.
> 
> Best regards,
> Krzysztof


Hi Krzysztof,

Thanks for the review.

I will address both comments in v3.

For the binding changes, I will split the current patch into two 
separate commits:

1. Extend the existing MA35D1 QSPI binding to also describe the MA35D1
    SPI controller.

    This patch will only update the title, description and compatible
    list to cover both the SPI and QSPI controllers.

    The existing `cs-gpios: false` restriction will remain in this
    commit.

2. Add a separate binding patch to allow GPIO chip selects.

    This patch will remove the existing `cs-gpios: false` restriction so
    that the generic SPI controller binding can provide GPIO chip-select
    support.

I will also drop the additional SPI example. Since the SPI and QSPI
controllers use the same node structure and only differ in property
values, the existing example is sufficient.

So the v3 series is planned as:

   1. spi: dt-bindings: nuvoton,ma35d1-qspi: Add MA35D1 SPI controller
   2. spi: dt-bindings: nuvoton,ma35d1-qspi: Allow GPIO chip selects
   3. spi: ma35d1: Add Nuvoton MA35D1 SPI controller support
   4. spi: ma35d1-qspi: Add GPIO chip select support

Thanks,
Chi-Wen


