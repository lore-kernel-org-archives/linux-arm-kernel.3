Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11725CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 06:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HX5LjJrt33C/D0Ly5cmrRNsaiFn37WGMaBfVEduzpQg=; b=n38xtdqRlkKzZOJvz3h0Y3TAx1
	wSs4l/nWMT3CUDEs3H7KmX1gzL+wX4qw4nMQ69mYKmsOycdtAPX0oY+EZDF23igX6jJ2/yX/cy+Sx
	s5cnxEc5iN/1Ac/igv4SedHZLbvcPHAeDaVMj2uuAk5lWCF9Et/S6b59wNkV8pVU4NsTx3XIWD49g
	RVEE54kDYrW5TsIUZq5mFaJcJMEc5HOQeMi9lvCXf/X1tewzXqKONNpcH0aVu3cEuDlVJ7TVXFdcq
	a77SCoo4z/uxVPP3MYnD+p6PIjL0KfPUck35pYKQOWGF3ilW1JLMhU2l2qZvbDNvhnr3iQBnLzZlY
	SHjmsJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIhns-00000006bVh-1S38;
	Tue, 11 Nov 2025 06:24:32 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIhnp-00000006bVM-1xwG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 06:24:30 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42b387483bbso1512207f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 22:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762842267; x=1763447067; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HX5LjJrt33C/D0Ly5cmrRNsaiFn37WGMaBfVEduzpQg=;
        b=CICWqs3S0WxnNiwORkgybHng+3axD97sI2kdsRMvuNyk52uSPyTThBIHqVob8+0/KC
         Q1cxA/zrSTfY/8bDr2iKJlbLV5Gmt/LmBPWcdRLlA3nV2BxO94Ha9vT6sOKmJA3c/cir
         vbgbi5tPiTyrMDIIUGWU40vrzyR0GqoKDsWoI8Xs+X7BU9sR6wCboxpURsS0zPr/3ck6
         ojEZ/vOdfmXIVLs8G+nhz1W/aK5LfQSCNrBIwrSNmLiATEwR00wBaV73BM9vabpZXfk6
         1LbQxxVA6/pMaAN5ZJHaED8RHfr5mEacsxbQN38uoL5UncN3C+9FsMu8wCxeUo0zh9+N
         FBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762842267; x=1763447067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HX5LjJrt33C/D0Ly5cmrRNsaiFn37WGMaBfVEduzpQg=;
        b=V0g7cp0o/b7PW0F1CsufwVhYTT3LDAlm6EUY9ykAQ3iOl+pkN8xNjp8wqsskU1+oxW
         klfK2yTCP2RRBpwL6QRCth5SmYU0fKDSqSdvL+wD+O1RUYVTNcYLvsXhH14zN+JXkegV
         vl/uHEUHMw7Ird6ZqRe1hjVLidVpmQDlaUhIzO2rR+HLpeMVvDy0uUnaPdmvcwi7ObmS
         Z51AISeBGhRXP6dA/CY5G2x1RYrjSiltN6HegLYrnhTr4KqJ+tV34ssf7RPhOUoUi0zG
         3QXr2PZP4VMnnbn/6FYGEYWanVWE7dt0C1gP1nX1HdR6MUQY02psx/058dsjXTZQUKiJ
         Af8g==
X-Forwarded-Encrypted: i=1; AJvYcCUCg3AtkTEvCvRsTi10QaS/Us7aDQA0RuS88BMMJaajgVzyEDWhYt7dg3tauJPz1tr0J19Njv8W+b1enmnVdC6f@lists.infradead.org
X-Gm-Message-State: AOJu0Yw34LJpbJ/vitNTXiXTKFRW+GEc6AzvqoAUTTEcLi4jbGu2ErxM
	2YuV8kTVZWnBofqCIoQ97LAtIJuWvNRWIlZQ9SgIowo2XGLb0jPBwGgW6TEs/zAcHJE=
X-Gm-Gg: ASbGncsZ5ihbhdh/3+qUV4S8EvwdQr7UUiKS1KCQJSxPNBcESjz83g05OmhtPoTNQNa
	fc3704pwSVC9CtOtx0rSvkEAQLLJhkbTEjGs8oVh2w+XYFji/c0l9aHeEXnGOwJmi66ol7z0pCh
	EMeHS06IKWUU8CdKgjC1x/NmTMHcAR5+bmH78cx53JIOWSTQJiSeqHXpEcj5hukX8OOo12PGcL8
	u7bcYnjVgyFzgLswp0ZvlBNz65G3WN/cG3h9cQh/mBCNHbtXqwwItIhOa0lWUVcDqd66DQBh8vj
	YCpaY1h2K2Nxs0J1uOPXYaDtH0rOxL0tdJO7fhS0FOMBq8TrhQebBJthPbNwxtwvwh3mRWyCG1l
	kXmPn5FAutcolQlPaJh83cfMGTPu2l5+VsHIe2KX7u54TBMIluf109YK07u9ZFfLt7IqcGBaClK
	rwgqxM2qbrZr9puxGl
X-Google-Smtp-Source: AGHT+IFBYADieesRozqati0Og3HqjFZ4qF4AW4MAaR2o7qWHxdawiisFSvlI4HQoLhvY8O0xdado+g==
X-Received: by 2002:a5d:5d88:0:b0:429:c8e4:b691 with SMTP id ffacd0b85a97d-42b2dcb7b45mr8038733f8f.55.1762842266938;
        Mon, 10 Nov 2025 22:24:26 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b3123036bsm17839426f8f.28.2025.11.10.22.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 22:24:26 -0800 (PST)
Message-ID: <c5db97fa-8789-447f-909a-edbdb55383f8@linaro.org>
Date: Tue, 11 Nov 2025 08:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] clk: samsung: add Exynos ACPM clock driver
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <176282517011.11952.1566372681481575091@lazor>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_222429_538127_E8DBA49A 
X-CRM114-Status: GOOD (  14.87  )
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



On 11/11/25 3:39 AM, Stephen Boyd wrote:

Hi, Stephen!

> Quoting Tudor Ambarus (2025-10-20 00:45:58)
>>
>>
>> On 10/20/25 7:54 AM, Krzysztof Kozlowski wrote:
>>>> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
>>>> index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8ff95e029c52436e5c7f 100644
>>>> --- a/drivers/clk/samsung/Kconfig
>>>> +++ b/drivers/clk/samsung/Kconfig
>>>> @@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
>>>>        status of the certains clocks from SoC, but it could also be tied to
>>>>        other devices as an input clock.
>>>>  
>>>> +config EXYNOS_ACPM_CLK
>>>> +    tristate "Clock driver controlled via ACPM interface"
>>>> +    depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
>>>
>>> I merged the patches but I don't get why we are not enabling it by
>>> default, just like every other clock driver. What is so special here?
>>
>> Thanks! Are you referring to the depends on line? I needed it otherwise
>> on randconfigs where COMPILE_TEST=y and EXYNOS_ACPM_PROTOCOL=n I get:
>>
>> ERROR: modpost: "devm_acpm_get_by_node" [drivers/clk/samsung/clk-acpm.ko] undefined!
>>
> 
> I don't understand that part. The depends on statement "COMPILE_TEST &&
> !EXYNOS_ACPM_PROTOCOL" is equivalent to COMPILE_TEST=y and
> EXYNOS_ACPM_PROTOCOL=n, so are you trying to avoid
> EXYNOS_ACPM_PROTOCOL=y when COMPILE_TEST=y?

My previous comment was misleading.
The depends on line allows CONFIG_EXYNOS_ACPM_CLK to be selected in two
main scenarios:
1/ if EXYNOS_ACPM_PROTOCOL is enabled the clock driver that uses it can
   be enabled (the normal case).
2/ COMPILE_TEST is enabled AND EXYNOS_ACPM_PROTOCOL is NOT enabled. This
   is the special scenario for build testing. I want to build test the
   clock driver even if EXYNOS_ACPM_PROTOCOL is NOT enabled. For that I
   also needed the following patch:

https://lore.kernel.org/linux-samsung-soc/20251021-fix-acpm-clk-build-test-v1-1-236a3d6db7f5@linaro.org/

Cheers,
ta

