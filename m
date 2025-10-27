Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1AACCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 14:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bIMvual/DCfbHFKLhMc6KNvRa8c9RJirQTWe6ek/vw=; b=e8UyPyP2KMk154OrFoXvnFv+DJ
	EDCr0rCrz0GJyoB4iNp294nMr6QAKXSSnoM41gdRKuZvPm46w0R41bPcAmink/LgPer3p1cELs5qK
	ONN+bbf9+x6wnh7Crb7SN9K5+J+Q5uD/GTEaoV3Qlqj/XZowZJ6+e6CLfbw4DhggoJT75aGcgWquB
	xYG00ytLRUpv954D3fTrNShFdWKlGB9rkzXJJiAC8VmSrHGbRWl4h1f+SJaFt5i8t43BpWq6ZdhIG
	KQGs7XKzyOEQ26avW39eBSF6ObNZCw6UVttMvmPVUJ0kKU/7v2RkuezPyr4nmx8zeAEUn8PMo1U7c
	ahB5ykZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNxB-0000000E7IV-2pCM;
	Mon, 27 Oct 2025 14:12:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNxA-0000000E7ID-12Mf
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 14:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/bIMvual/DCfbHFKLhMc6KNvRa8c9RJirQTWe6ek/vw=; b=MK5NV/9tR5btxwEEPdF1JgX45x
	5RuBCz/w6MAGgIitkUsAzD/3x6tQaEOdJ84fC9z7rCzcySf/PgBofy6kEKbJriOG6nIrw6/nnEZ+L
	6zouQoPac/aM2v/d1bgCCDsaRyTiSCUameVI+NnMtCysPle88AGZPe+Rmm1keZUPT1SOtdKiemmkh
	8a179wHrC9t86OqE2dSHkZzlJWMifQm3QLLb4nkLpUgTNkqNDsP3eqFcbLFEgMV5x02ddqg5cNS9L
	/oNcs7eErDhyyTCNBHGwAGsRJZKMKQtwptdqPQtd3I9tnSmYe2iqA2ztaaAnwoCkg3i22H29tCpMv
	oBxMQb/g==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDN5N-00000002GjR-0hSY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 13:16:35 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-33e0008d3b3so4763851a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 07:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761574323; x=1762179123; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/bIMvual/DCfbHFKLhMc6KNvRa8c9RJirQTWe6ek/vw=;
        b=NSGraqR+sFl56ScqXZ7T3nd7LnKLIwBDomHufJ3RplTFIFS5W76EeOIrp6Gwus+wx5
         3d/mrctA66wqdiuy9F6E5KA3LWr21E9vMWy5i8UnJpGmu6nS5qWvoIj7h/JjXTgPI0vF
         Q2Qbtfz7+/XOB0TzWkSZdmzk0lc6k2aUchse5JUpo/aJ2K/J66QBcJatT1GOgI/mHKLX
         W7Adz9dbutU2bVmylU7ElCnXTfX/oCaE1Qwr0iCw4yBPcMIjd+NtDVLvmeqZmh2Lgup0
         Mq5cKmP9dhkWs1cXwdUOSuAnFc1l43YqROCBiXup1gfQHq3KmwbOrRiswQx+gM4X0n7n
         d4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761574323; x=1762179123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/bIMvual/DCfbHFKLhMc6KNvRa8c9RJirQTWe6ek/vw=;
        b=iSai2c2F7GFAkK4lBk+Vq8GIOBU0R0C+cp0jyXbHZsEhBuJJYe/PK+PBkzrD0eXfoV
         LUfNt1I6G62a8LRZDg/Jsv1FDg0NHDp6SMjQx+cK9EvK26gC/HQsXXhLkjJCtkU4dS0y
         yGH43wJtyBWj5OV5kLKhQDGpBl4Y9KipqPDtTIck7EcT307+Js423krn9t/e4P7zFyzr
         BJtzh4bdVS211OzBZvvpxcRRNNpbDBbdKT3HP33dhRGbfJqJ/iFyATuvlt2NtF7yqTkK
         /wzhGXkoeTp/tEtED4AySlxqFyFc2nL6jEAb4k9K7DsGHabvYMge3ISNz9Fot9fqqhGD
         pQLw==
X-Forwarded-Encrypted: i=1; AJvYcCWfbCWW4gfEW5P9BBqHNyqRIhVCNHmNpZwXJqblbQfeDjTz+jG+dd+Z6qZcOauA8rGDufLxQlmFwwTxMzjPf95C@lists.infradead.org
X-Gm-Message-State: AOJu0YzhB/B6uutP4uvuNsOJu2klnj6iJ8jZ0lqtUghYBPtl+2ew2ovV
	oBeYLF0lnYPNfaYYwIZpL6fcWgLJENevpR14DASgssV7Go8cHPF0sADB
X-Gm-Gg: ASbGncvEoKlTuyXnRjl+AmrWypHyZetrknPOfXEsdLHmTpPf0bxV6v1gwYHpttPMYhb
	s+NLlSJpauuwtn2w0daN+9gAT9o2xUCmiiElBkhzd+0XvA52W+9WMLCWa2yxqiTlxTUmaiv5NWT
	C0EmeKu0QX1PNkh3vwhL4CSJQkLsKfWw0gF4N4ElVt+JG5cheD2vOc6Nmz1RvbHyZ5OB1c8VPse
	+PMhLINtPPgjQQCip4o+6XDrMtjpOJjGbD0BhTE+4lL2lw5HNxhAm5YH3C4eF9bbuMqwCtDfNLn
	0ardYgatlFkFbZOwtTwdHzzfrsAUmgE8Fz84YkowidVv5O4uguuIFZpwOIifuHYbwRcwptUxaql
	MvbmAb8exIcKYP6bNNe8T70hOl0I+duzl+dIRrwXUOSWujYUI/2Kcf+WIK8qoAEdEN/mvm3Pn9B
	nzPty0i6JddsDxDvEoppbh5axYBBf1lk+r
X-Google-Smtp-Source: AGHT+IH5yXGx+LupzIOPczjiiLlR5YgFAp1+QvWwv8ZLoofxPfnSc2zQ+LY35y3vpNkMMUH1Hauifg==
X-Received: by 2002:a17:90b:1dc3:b0:338:2c90:1540 with SMTP id 98e67ed59e1d1-33fd66b4230mr14770603a91.20.1761574321988;
        Mon, 27 Oct 2025 07:12:01 -0700 (PDT)
Received: from [192.168.1.5] ([27.7.191.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f604dsm8788404a91.15.2025.10.27.07.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 07:12:01 -0700 (PDT)
Message-ID: <b6486799-9e46-4b6b-bf95-001e11e958e4@gmail.com>
Date: Mon, 27 Oct 2025 19:41:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mmc: socionext,milbeaut-m10v-sdhci-3.0:
 convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023-milbeaut-v1-1-3e4ff67110ad@gmail.com>
 <20251027135752.GA316916-robh@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20251027135752.GA316916-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_131633_261699_F823BA27 
X-CRM114-Status: GOOD (  20.90  )
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



On 27-10-2025 19:27, Rob Herring wrote:
> On Thu, Oct 23, 2025 at 05:37:36PM +0000, Charan Pedumuru wrote:
>> Convert SOCIONEXT Milbeaut SDHCI controller binding to YAML format.
>> Add a new property "voltage-ranges" to resolve dt_check errors.
>>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>> ---
>>  .../devicetree/bindings/mmc/sdhci-milbeaut.txt     | 30 ---------
>>  .../mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml     | 78 ++++++++++++++++++++++
>>  2 files changed, 78 insertions(+), 30 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-milbeaut.txt b/Documentation/devicetree/bindings/mmc/sdhci-milbeaut.txt
>> deleted file mode 100644
>> index 627ee89c125b..000000000000
>> --- a/Documentation/devicetree/bindings/mmc/sdhci-milbeaut.txt
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -* SOCIONEXT Milbeaut SDHCI controller
>> -
>> -This file documents differences between the core properties in mmc.txt
>> -and the properties used by the sdhci_milbeaut driver.
>> -
>> -Required properties:
>> -- compatible: "socionext,milbeaut-m10v-sdhci-3.0"
>> -- clocks: Must contain an entry for each entry in clock-names. It is a
>> -  list of phandles and clock-specifier pairs.
>> -  See ../clocks/clock-bindings.txt for details.
>> -- clock-names: Should contain the following two entries:
>> -	"iface" - clock used for sdhci interface
>> -	"core"  - core clock for sdhci controller
>> -
>> -Optional properties:
>> -- fujitsu,cmd-dat-delay-select: boolean property indicating that this host
>> -  requires the CMD_DAT_DELAY control to be enabled.
>> -
>> -Example:
>> -	sdhci3: mmc@1b010000 {
>> -		compatible = "socionext,milbeaut-m10v-sdhci-3.0";
>> -		reg = <0x1b010000 0x10000>;
>> -		interrupts = <0 265 0x4>;
>> -		voltage-ranges = <3300 3300>;
>> -		bus-width = <4>;
>> -		clocks = <&clk 7>, <&ahb_clk>;
>> -		clock-names = "core", "iface";
>> -		cap-sdio-irq;
>> -		fujitsu,cmd-dat-delay-select;
>> -	};
>> diff --git a/Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml b/Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml
>> new file mode 100644
>> index 000000000000..6b67bef30347
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml
>> @@ -0,0 +1,78 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SOCIONEXT Milbeaut SDHCI controller
>> +
>> +maintainers:
>> +  - Taichi Sugaya <sugaya.taichi@socionext.com>
>> +  - Takao Orito <orito.takao@socionext.com>
>> +
>> +description:
>> +  The SOCIONEXT Milbeaut SDHCI controller is a specialized SD Host
>> +  Controller found in some of Socionext's Milbeaut image processing SoCs.
>> +  It features a dedicated "bridge controller." This bridge controller
>> +  implements special functions like reset control, clock management for
>> +  various SDR modes (SDR12, SDR25, SDR50) and physical pin property settings.
>> +
>> +allOf:
>> +  - $ref: sdhci-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: socionext,milbeaut-m10v-sdhci-3.0
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: iface
>> +
>> +  fujitsu,cmd-dat-delay-select:
>> +    description:
>> +      Its presence indicates that the controller requires a specific command
>> +      and data line delay selection mechanism for proper operation, particularly
>> +      when dealing with high-speed SD/eMMC modes.
>> +    type: boolean
>> +
>> +  voltage-ranges:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> 
> Sounds more like a uint32-array.

Okay, I will change that.

> 
>> +    description:
>> +      Two cells are required, first cell specifies minimum slot voltage (mV),
>> +      second cell specifies maximum slot voltage (mV).
>> +    maxItems: 1
> 
> You can better describe it like this:
> 
> items:
>   - description: minimum slot voltage (mV)
>   - description: maximum slot voltage (mV)

Sure.

-- 
Best Regards,
Charan.


