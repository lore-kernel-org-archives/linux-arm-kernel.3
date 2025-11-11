Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC832CD1297
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mA4OYGuehEdlKuRHHZkCIxOoAid/iNBTle5X4sDzSO8=; b=E+y9VonLLdKa3TAMOY60lEG0Hv
	qaE9/p+mIOR68b0MNyO75h+a9DPaQmxzjP26ydYv4xjt7S3bZig7wdxPz35DXf+03xPYJHHR0UG6K
	WXB3VkUPQnePYz69Sfhl3vEIz744iEU/HXzJwCcy5cVUaJcfrA/rkqlf1DZFAmvNDHJjEqkubnJr/
	6TGjahXMCfPDE7ezQ7Rd8zGk7Ok+gQcRZycofJV9kPJsIsAFJhmh2JjKAyz9WxbWZzyFYjaYLNrUL
	Z+yelhs+9RYGlBSU8YkgwB/n7lNHw9WbO8ZvUwhHZFJDX50DZF5KpBAdL+QF5MemEgdQLDNt+nws9
	0cYyjh8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIldL-00000006x3U-1khJ;
	Tue, 11 Nov 2025 10:29:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIldI-00000006x34-1Dnw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:29:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so19092815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 02:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762856990; x=1763461790; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mA4OYGuehEdlKuRHHZkCIxOoAid/iNBTle5X4sDzSO8=;
        b=L3V5Gymd3eP/OFHMz94+fjcLdDOnstK+GByjvC6Cbj9A5ws5QLr6U34YmLS97cBgTW
         MNySDVvdW7GE2UQ6stOBlxnUjoTGbQkNzT9/zXCmSWRlFQKlH1aIdyJsa6Oub0CgFhYh
         /LULaUSTmf3V2DnYg3JBLPhgXOR00uGjZNXxGKgCAOdMON7eoAA6gH7KGqcSszrTQqNY
         EtSkRHkl1J7UiVTP6dY8qARSKk9el+g7MdqaUVLqi8t5JFvWbt4gietkBCJoRnLmHHfS
         SFwffYKHQjEUTLLg4h/E6sDB0Du5uSLe65yaVaZhajSgNj/LJMv5GYyE0IKTnut9FzGx
         TBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856990; x=1763461790;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mA4OYGuehEdlKuRHHZkCIxOoAid/iNBTle5X4sDzSO8=;
        b=jwZB35JRQQOkcPOhfT6hSxZSTGa4DG1Cfw6z+2SxZLbv5hlNbQ6SWKw6HfOsVMF/M7
         Dyrffp+kffxnmq7zHe0W/C7+edMMuqHb/8fs4eXEHRo+T166iJDtq8D6SB+A+mOCu9ol
         5p6P+8AMCVP+h9C3Ev7CuZODiVzJD7yoJs5kISVDW3Asid1EpaylIzp1Var3uxFt8TmK
         5rZ28JXmJydAD4IL6Xq1u7AByXwFsT8lf2gtS+TP8ZZ6wz1R9DuFnSdhv/p94CYxmfoq
         S+64MZFzc9PluWk9UBXYO6CAcI3K5ifbxrDGLWStcxtDBhLSyQkTQLKSU56hYCvQui/8
         DdAA==
X-Forwarded-Encrypted: i=1; AJvYcCXnJOVXZxflIscMRX7zo2U1YO624U5HjVlDOSWNti6fiFtEGnPgmSb8JBvssG51r39YiyQEU1cOTRqMHE1Um6S/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9ZRKHBsFgnrO9pO7+90x2TvjRpODQFkunGLi7k0EKK2U2tX/m
	c0CAi8Ecz7MAQnW7c9VLJGPLGUyH2o0mcpcG9Cyt1WVlEjIgqwFfdfLv/PAMbLXdCaU=
X-Gm-Gg: ASbGncsMZ56nwvcJMZ8s9YeBsK9wALU4I4K0M5DeJMaif7hi6wRoZ4jsSHrE4GuK7LR
	ozlBUSzUXwTxaboaL8yihbrUUibs6pQxO4YueI7VkCBi38XAKnq80CkzYUuXaMV3NDGwFrhRJZi
	oFHtRCf0QPgfqCcUIFc4lK6hAwbpPhK5YbMeyC276S2+O6jeZGUCORBn4Y3cCSYEIHaEEC/7cve
	jgIZ5JhL6Z2rrBh3sDWC1LIRgtvzApfGs9bITQfXz+YgVi6A7Dp8sfhfGwSl4cItLzJmuFhMn2m
	gOIlL6CiVpJcHToa9lXTfW/HLExPjYCDcJA0A5NeO12gclgv0OcGPCHOqlsc3TTMQ7/PdtfIQhv
	OkH3aeuPt16FZ/gQWdG9bHkT3htDNGDY0baldZAPbW0iH1g0BCnqvQRHixmnDEtS7liuSx/vZAN
	DkUZVlUkWiWX0L9Ix2+GYfmUNKvS0=
X-Google-Smtp-Source: AGHT+IEvLEjIZw4+8whQM79OrY00R9vJVyO1rxoxD4fhQm/KifAlq8r0yaMnGCz1oNKbvCj2h/xcDg==
X-Received: by 2002:a05:600c:c4a3:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-47773290e9dmr106627935e9.29.1762856990270;
        Tue, 11 Nov 2025 02:29:50 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac675caecsm27313955f8f.30.2025.11.11.02.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 02:29:49 -0800 (PST)
Message-ID: <5eaaf3cf-a271-467f-b015-9cb9b49590f0@linaro.org>
Date: Tue, 11 Nov 2025 12:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] clk: samsung: add Exynos ACPM clock driver
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org>
 <92f1c027-bacc-4537-a158-2e0890e2e8ee@kernel.org>
 <17695fcf-f33c-4246-8d5c-b2120e9e03b1@linaro.org>
 <176282517011.11952.1566372681481575091@lazor>
 <c5db97fa-8789-447f-909a-edbdb55383f8@linaro.org>
Content-Language: en-US
In-Reply-To: <c5db97fa-8789-447f-909a-edbdb55383f8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_022952_394344_1C3C791E 
X-CRM114-Status: GOOD (  18.62  )
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



On 11/11/25 8:24 AM, Tudor Ambarus wrote:
> 
> 
> On 11/11/25 3:39 AM, Stephen Boyd wrote:
> 
> Hi, Stephen!
> 
>> Quoting Tudor Ambarus (2025-10-20 00:45:58)
>>>
>>>
>>> On 10/20/25 7:54 AM, Krzysztof Kozlowski wrote:
>>>>> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
>>>>> index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8ff95e029c52436e5c7f 100644
>>>>> --- a/drivers/clk/samsung/Kconfig
>>>>> +++ b/drivers/clk/samsung/Kconfig
>>>>> @@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
>>>>>        status of the certains clocks from SoC, but it could also be tied to
>>>>>        other devices as an input clock.
>>>>>  
>>>>> +config EXYNOS_ACPM_CLK
>>>>> +    tristate "Clock driver controlled via ACPM interface"
>>>>> +    depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
>>>>
>>>> I merged the patches but I don't get why we are not enabling it by
>>>> default, just like every other clock driver. What is so special here?
>>>
>>> Thanks! Are you referring to the depends on line? I needed it otherwise
>>> on randconfigs where COMPILE_TEST=y and EXYNOS_ACPM_PROTOCOL=n I get:
>>>
>>> ERROR: modpost: "devm_acpm_get_by_node" [drivers/clk/samsung/clk-acpm.ko] undefined!
>>>
>>
>> I don't understand that part. The depends on statement "COMPILE_TEST &&
>> !EXYNOS_ACPM_PROTOCOL" is equivalent to COMPILE_TEST=y and
>> EXYNOS_ACPM_PROTOCOL=n, so are you trying to avoid
>> EXYNOS_ACPM_PROTOCOL=y when COMPILE_TEST=y?
> 
> My previous comment was misleading.
> The depends on line allows CONFIG_EXYNOS_ACPM_CLK to be selected in two
> main scenarios:
> 1/ if EXYNOS_ACPM_PROTOCOL is enabled the clock driver that uses it can
>    be enabled (the normal case).
> 2/ COMPILE_TEST is enabled AND EXYNOS_ACPM_PROTOCOL is NOT enabled. This
>    is the special scenario for build testing. I want to build test the
>    clock driver even if EXYNOS_ACPM_PROTOCOL is NOT enabled. For that I
>    also needed the following patch:
> 
> https://lore.kernel.org/linux-samsung-soc/20251021-fix-acpm-clk-build-test-v1-1-236a3d6db7f5@linaro.org/
> 

What I described in 2/ EXYNOS_ACPM_PROTOCOL [=n] && EXYNOS_ACPM_CLK [=y] 
can be achieved with a more relaxed:
depends on EXYNOS_ACPM_PROTOCOL || COMPILE_TEST
because of the stub (dummy method) that I referenced in the link above.

It's really what Krzysztof explained in his reply, I wanted to avoid
the link failure for COMPILE_TEST [=y] when
EXYNOS_ACPM_PROTOCOL [=m] && EXYNOS_ACPM_CLK [=y].

We have the following possibilities with:
depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
1/ CONMPILE_TEST=n
EXYNOS_ACPM_PROTOCOL=n EXYNOS_ACPM_CLK=n
EXYNOS_ACPM_PROTOCOL=m EXYNOS_ACPM_CLK=n,m
EXYNOS_ACPM_PROTOCOL=y EXYNOS_ACPM_CLK=n,m,y

2/COMPILE_TEST=y
EXYNOS_ACPM_PROTOCOL=n EXYNOS_ACPM_CLK=n,m,y
EXYNOS_ACPM_PROTOCOL=m EXYNOS_ACPM_CLK=n,m
EXYNOS_ACPM_PROTOCOL=y EXYNOS_ACPM_CLK=n,m,y

We have the following possibilities with:
depends on EXYNOS_ACPM_PROTOCOL || COMPILE_TEST
1/ CONMPILE_TEST=n
EXYNOS_ACPM_PROTOCOL=n EXYNOS_ACPM_CLK=n
EXYNOS_ACPM_PROTOCOL=m EXYNOS_ACPM_CLK=n,m
EXYNOS_ACPM_PROTOCOL=y EXYNOS_ACPM_CLK=n,m,y

2/COMPILE_TEST=y
EXYNOS_ACPM_PROTOCOL=n EXYNOS_ACPM_CLK=n,m,y
EXYNOS_ACPM_PROTOCOL=m EXYNOS_ACPM_CLK=n,m,y <- link failure when y
EXYNOS_ACPM_PROTOCOL=y EXYNOS_ACPM_CLK=n,m,y

Thanks,
ta

