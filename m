Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2708BCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XCJmz4HW13zmCaIQ84NTp39kjqei0obsLTQVEkJ9Dg=; b=rKoHbD1giR9gLE2bYPd+cK+LeH
	Hq4d9JLO6JrdqYKW7mZchs3Z8y1Opj9M2jiblV0O5UZmNH1TpkQPKgQyj0bHhFig+J3Zl3NEiUuQM
	jakT4dIwTeHIu/y9309pZE+XGWuiq61bp3AfPWgmWmBVNijVsnn3UrR6c6hFVtgC5eBQrwmy5xyhl
	qZSnzG+VV/rDTOM/oDv59inAjbIi6OOnsJD+Ey44DFZGOrklr2F0HnXFYB5YSiQBisrRk9HvrUK8b
	T8mpQu67WI72wsJ3/Jz3fV9aXuOk+CL6sphPaHmdg6AStByZOmwAyp8oq6wQFwpGLBgAFp3tv+rt7
	A0C86jRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAm3i-0000000CYLe-2BGA;
	Mon, 20 Oct 2025 09:20:06 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAm3f-0000000CYLC-3yYD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:20:05 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42421b1514fso2559842f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 02:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760952002; x=1761556802; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0XCJmz4HW13zmCaIQ84NTp39kjqei0obsLTQVEkJ9Dg=;
        b=XzmsjeR/1B+8bgyBoiP7JpzIvTyrLIW/oh3+nKX8ad+RLa457BPjcd4YbPTKC73Wej
         W4aBbzlQ23mWNMh6irf5P4KTOwM5VJMZZAmt8qvkw9n0YSVeHifu823jVuLDlS55FZOC
         vQoub6K5sr2/4NlCIdDCit+vO++s+GLpnY58EPg7bcmT1UPu18GlvVjYza0jkA5me63K
         118ICWGeZQrndzAj+YwTmcjuCw/KPBBg96dJ7ijQLbqyIY6Bix+TWTR6ZcM2IzfGFLbT
         5UP7ozw+Fp6Ax1f4VKnzhDtQSWJvHvIDSPjZNcn+ye7v6A29Y1pMrqacd1c5565OsOxb
         M+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760952002; x=1761556802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0XCJmz4HW13zmCaIQ84NTp39kjqei0obsLTQVEkJ9Dg=;
        b=eOQHf51UwL/pvty3ZW3E46kUjkEVQdH5b/iap8+FcYivFuFczRLUiVwmx/A6BoEzG+
         xjcXCIK1sNTqFJ/FAT1iS11Pt6O8i3GqPj0YOGu/j4ORuC6G8QwSWCHGwy3PLumvDdnB
         FkMae45gHIaGaT5sbuT7jS+fy2GAuZAOqHrp9lfwfBivw1Kk6e6+zPHc6CdCf6MNBLVq
         bMm/VvyQU8Xv7yHyU9ZpDKIMJZ1Aka2A+NTvKv85TNDQgGVyjdw5EHghJ1U+5ILs+KdN
         IgGzpLAeVWqFBhlkON3vj616F8rVOQilPeIgm+HQPn1OL8dNYqWFMZhIIOk3PSOZXLAh
         5mfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU7C7KCYnJVZZIF4GEIjLDIT78AZcsPfr3sEhDXdxUCkQXxeS2wxepXQwSJw86YBS20yCXqfBNhLtrCpdRLec0@lists.infradead.org
X-Gm-Message-State: AOJu0YwGM99NLoUnMM3I3l4+UJPpCqBg06eC1c8QAyyzz8iAYzCUpwxe
	MmqFc+81TEk67EqGVKd8BmfJ41y98rWjsFdTUqDDgWr3pOBTcWukCiLqWWR7KweoHhw=
X-Gm-Gg: ASbGncv/v3lsPu13Yb9taTJ7+wehEoK0vb3dTrx8e14+9bJ5SFvuhjUUOF8jBbYgJbX
	gzK4B6dMvHzsGeBYZqlhtYcysUYr0rGIhN1RvgDrTI/us3UzAXc6hHf9tpy5agSpkAah9du7Zz6
	9hFBQcKWZakuyAhJCxHf4QLoC/UcdfnML7XgI68jp3opAbvjZl50LNZV/0JBy3k19RyEfyUEaGN
	dxr7XBa10oeMzgTvtfnOufJRIi5BwqtO8DzJ/1SlQZr1nws8jKswZgFHFCftSeYP+jeYDHTOf5g
	5ZKPN9cRjpzBe25cNmeZHjuSzCTa/oOwN5uH7c4GHmLFt6jcDVKpZ6UAFWuQR1wSweBTWRq3NNA
	TB7YinbfSBGLL2BE8RbIc/TGkSelyJl/vN5o25HT2WJpgbh69jts8nJiHtDt8Um/0d+kZMn3OGJ
	q85s1dapmzyLS0u/Usd+E=
X-Google-Smtp-Source: AGHT+IHDfUmNi5eqw691/M33t81cdCOV6g/HJdfYKSgYwXlWSNi3vurpVr1BkRRnhjmGHUqYcBuwxw==
X-Received: by 2002:a05:6000:4008:b0:428:3bf5:b3b8 with SMTP id ffacd0b85a97d-4283bf5b655mr5592745f8f.44.1760952002139;
        Mon, 20 Oct 2025 02:20:02 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce3e2sm14354917f8f.47.2025.10.20.02.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 02:20:01 -0700 (PDT)
Message-ID: <a03cd07f-8e9f-4b02-b301-f1bbb69eb7db@linaro.org>
Date: Mon, 20 Oct 2025 10:19:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] clk: samsung: add Exynos ACPM clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org>
 <92f1c027-bacc-4537-a158-2e0890e2e8ee@kernel.org>
 <17695fcf-f33c-4246-8d5c-b2120e9e03b1@linaro.org>
 <2f8da425-63d9-4321-9cd3-976bbd29a52f@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <2f8da425-63d9-4321-9cd3-976bbd29a52f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_022004_009358_9A229A39 
X-CRM114-Status: GOOD (  14.82  )
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



On 10/20/25 9:22 AM, Krzysztof Kozlowski wrote:
> On 20/10/2025 09:45, Tudor Ambarus wrote:
>>
>>
>> On 10/20/25 7:54 AM, Krzysztof Kozlowski wrote:
>>>> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
>>>> index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8ff95e029c52436e5c7f 100644
>>>> --- a/drivers/clk/samsung/Kconfig
>>>> +++ b/drivers/clk/samsung/Kconfig
>>>> @@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
>>>>  	  status of the certains clocks from SoC, but it could also be tied to
>>>>  	  other devices as an input clock.
>>>>  
>>>> +config EXYNOS_ACPM_CLK
>>>> +	tristate "Clock driver controlled via ACPM interface"
>>>> +	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
>>>
>>> I merged the patches but I don't get why we are not enabling it by
>>> default, just like every other clock driver. What is so special here?
>>
>> Thanks! Are you referring to the depends on line? I needed it otherwise
>> on randconfigs where COMPILE_TEST=y and EXYNOS_ACPM_PROTOCOL=n I get:
> 
> 
> No. I am referring to missing default and defconfig patch.
> 

default m or y would force compilation of EXYNOS_ACPM_CLK and
EXYNOS_ACPM_PROTOCOL for all ARCH_EXYNOS, even on Exynos platforms that
don't use ACPM. Since ACPM is not universally required by the Exynos
architecture, I thought to make it opt-in (default n).

Setting it as a module in arm64 defconfig makes it available on
compatible platforms.

Similar clock drivers do the same: CLK_RASPBERRYPI.
COMMON_CLK_SCPI, COMMON_CLK_SCMI - no defaults and set them as builtin
in the arm64 defconfig.

Cheers,
ta

