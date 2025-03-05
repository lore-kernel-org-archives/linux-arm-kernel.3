Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0F6C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMAJWiMuRcuVhpch+2OnnhMpVy7qID/b1S408w6N2LU=; b=0qK900kYWckwroFJ2rZ20nzjaD
	Ni7O0eoH1Md3O5XO68a/+LG5YMHI6XPkjHmnZkbPy7nIHW/z0goeOItv7G9LRGBrCO+OU5YV0C22S
	scya7jVgr6jTwxGqHZPoUge2zlB0/J/4fX7PPjA+OeV0qo7hKMZ14CpBwBp1ICc2It3uOiGYyHx2k
	5zQLMsiggiIQLwdQcTJA8SyYQKQcpCVtSHMudNp5V37vIBqblzP2Oc9HGqTKoeHAw+UQalYU6sjKQ
	lPYtmDzj3oXmqrPrYQoJ76S9tBcc/7trCfwp2ZfyF1Iv2lIjyB4Vq3/SHnlbB0yS1pGW0CH2WFOMn
	aWKUKmuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvSR-00000009En0-3LRs;
	Wed, 05 Mar 2025 20:35:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuq0-000000098XS-1VAF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 19:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UMAJWiMuRcuVhpch+2OnnhMpVy7qID/b1S408w6N2LU=; b=T6LTa7rWz7VSMU3AGhEuq1b4Mo
	4cFOABKor+Atl1yaDCFMrojPrLyVRBmiQYYhNex/M3pLGnGnI/xh2qrUFbnIrJYMkYhaHUZBfm8so
	RsB1NfYr6fnp5mMpsAc3m2Y4lKgmuT1YmD76aSmeX+na0xDCgzwPiapqXh3w0AqC4Cfcfu9eEJK0k
	13MGGods0Qk8TGrzV1XUPrmnGPwYXPT6hJWuPTs6fhoYK2JO6zXcC+pEI4RTgHEAqbd/YumfBhO8x
	2MpcYUwptNnC2IYBGQsh9Ewi8av7hk89EM9mnWLNTiyfcuW37vy0mp6OCaZfLRqpDKulUmUfUjx0i
	Xa4U5XZA==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpupt-00000000jHl-3nbU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:55:25 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43bca8cabc8so3396115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 11:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741204515; x=1741809315; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UMAJWiMuRcuVhpch+2OnnhMpVy7qID/b1S408w6N2LU=;
        b=BacyQs2BRBPgdHDE3sOTOGPVpFetkaZlgesDwDM5FYQse23eFieSMLrAtNBpKbMX7d
         aDVQhyy+OsDX/fAqrbQwX4efxePEDAvngH0B9/vLEJpeH91CJ5wWBDNXlAelNPFSHUfA
         iGxuiVAXTjAIn3qrnUc901GUrVIGwHFq/zQfw4cSieTU3JhxYY6GYKZGl6fChdUx12J8
         /c+q5bhICF2SrQ8NhjVF5wXVK5NUx4uLOyUUpmyV68WH0KyAZHNKBv8dt5o//O4FlvCG
         sNqOYS6rgInHdRuNjUXZUdLMkwVCW7P5bU9En5Dn52PkDIIhHb33cHXWd16WGXLL6hI2
         T82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741204515; x=1741809315;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMAJWiMuRcuVhpch+2OnnhMpVy7qID/b1S408w6N2LU=;
        b=Xy/xL9Euv9sRSPHdoswwmLlctwlmAp3R4JDtd6KF9MIFwWDmzCRq3lg50yKy2IhvmB
         CAd0pG9+b6Kmgm1JREU4f5bcsU+nMCwxSl8zUP9kmWS1k24QwSbLCnQbRUIIAZyvXOKk
         sLQGwmk0vUxdJvbf0wZ0u5AyxSf8UPOsC9jtDknCn1sfDD+FHs6PQdZyvdtdkEmHnXM5
         ybqeMJNwcygfHcGpd64D5MpHsfRPJy+tZq4RThCa12VUZyzqgKI57Q/uIrevl6tCW3KA
         /2SqjjUf23hhKHiRrqMoKNXm62RW/4Ezrfr/b4kNd2mFlIu9N4HMt7qt0LR+iSfSiZjs
         nWxg==
X-Forwarded-Encrypted: i=1; AJvYcCVTolS/XsxHKqFMM9YoKyfCVVUBzqDHQdr8KUgCiNv0mxgMZGzcvBUJHkwNOob+pRwbFpdvU3cMWP8mVSNqANxR@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcc3OGsJb3Vivck9bZdCmieyGQED4MrVkrcRcPakDMeyxeNTIF
	67Oi/cQyZ764YIuaiyis3qmsQUjoM3+Ahu9iO+iW6Ahz8mPeMxgd5XHt+dW3+RA=
X-Gm-Gg: ASbGnct+WJT32BAyT6GmQhjCmltW5vLvbMftYytq4FMj030Qm5qG0KxsAuHxCU0Phzi
	4iXGQpW8XdjlC3qfWzxDeg2fwAyyLots0/gIeFeAisefYbhelYDmOFzIR+1jErFoQMrFhl+sK/h
	6RlVVEL/9jUDnvx4HsggT37BMAzhWV5fsA4729dNc15ZCSbHHFxeotdrI5WR91XJUEThg+AM/uM
	93g5fsoFG6ZkByJyFn2OlPslh2GG3FVUJUYqAquO1VoD+SkfxfE8DJ7Zg/7s8B0bgYfE72jMVV+
	N2HlLrmH1NuSZ2e1UqUCyuZNoukF4SGCJN7xoEzY+WfBKnZiyoo0iriF85QULV7x
X-Google-Smtp-Source: AGHT+IE0NblaMrSIYQ6RV1u6tLH1ebczgqKb1OnbHqFj2fqxAWv9+kcdqezhM25t+RydtJS3TOc8lw==
X-Received: by 2002:a05:600c:3b9e:b0:439:9595:c8f4 with SMTP id 5b1f17b1804b1-43bd2893cc5mr14788055e9.0.1741204515115;
        Wed, 05 Mar 2025 11:55:15 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd435c6f4sm26418675e9.34.2025.03.05.11.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 11:55:14 -0800 (PST)
Message-ID: <56487b08-d4ae-4eb0-88bc-9c65ae866508@linaro.org>
Date: Wed, 5 Mar 2025 20:55:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: samsung: Add missing mod_devicetable.h header
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250304-clk-samsung-headers-cleanup-v1-0-81718e38246e@linaro.org>
 <20250304-clk-samsung-headers-cleanup-v1-1-81718e38246e@linaro.org>
 <9063abd1-b417-4623-b44d-fcb18f3c71b7@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <9063abd1-b417-4623-b44d-fcb18f3c71b7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_195522_033057_606DC1E6 
X-CRM114-Status: GOOD (  11.12  )
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

On 05/03/2025 15:23, Tudor Ambarus wrote:
> 
> 
> On 3/4/25 6:45 PM, Krzysztof Kozlowski wrote:
>>  drivers/clk/samsung/clk-exynos-audss.c   | 1 +
>>  drivers/clk/samsung/clk-exynos-clkout.c  | 1 +
> 
> drivers/clk/samsung/clk-exynos2200.c can benefit of the inclusion too.

Yes, this was reported by Stephen and I was waiting for reply from the
author.

> 
>>  drivers/clk/samsung/clk-exynos3250.c     | 2 +-
> 
> drivers/clk/samsung/clk-exynos4.c too

I missed it, weird. Thanks.

> 
>>  drivers/clk/samsung/clk-exynos4412-isp.c | 1 +
> 
> drivers/clk/samsung/clk-exynos5-subcmu.c too

How did I search for of_device_id...

> 
>>  drivers/clk/samsung/clk-exynos5250.c     | 1 +
>>  drivers/clk/samsung/clk-exynos5420.c     | 1 +
>>  drivers/clk/samsung/clk-exynos5433.c     | 1 +
> 
> drivers/clk/samsung/clk-exynos7870.c too

Same as Exynos2200. I guess I will fix it, instead of authors.

> 
>>  drivers/clk/samsung/clk-exynos7885.c     | 1 +
>>  drivers/clk/samsung/clk-exynos850.c      | 1 +
>>  drivers/clk/samsung/clk-exynos8895.c     | 1 +
>>  drivers/clk/samsung/clk-exynos990.c      | 1 +
>>  drivers/clk/samsung/clk-exynosautov9.c   | 1 +
>>  drivers/clk/samsung/clk-exynosautov920.c | 1 +
>>  drivers/clk/samsung/clk-fsd.c            | 1 +
>>  drivers/clk/samsung/clk-gs101.c          | 1 +
>>  drivers/clk/samsung/clk-s5pv210-audss.c  | 1 +
> 
> drivers/clk/samsung/clk.c and drivers/clk/samsung/clk.h too.

Indeed.

> 
> With that:
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thanks

Best regards,
Krzysztof

