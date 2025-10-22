Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F70CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 11:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NE6ALi4oCIm+yd7a3yOvtFqmufCiCdrMy/7EGT/KVX4=; b=xMXWs9ZMlEG2lNSaMvHeU0COZf
	gVhHHI8DicS71RpdqcXMO3no7YJ/+vtIRHQZ4/71geea8YMdtMiMfPZM8HTAdZIV49MfSqOOalf4M
	FPVKXeL/G4Gj7n+wxBFrNBkTYNZTngBQchh5ivUY+7PzbsrNdskKchaa+QLm9Oq8UQ6sZm+nvcqVr
	RDQj5CAoCZ66z/vOO3XKhQ5nRPCGfaF3LbJwt5p9Y3xkbduSzu2njvx0+cfjSFOyHlxZsTkS9pK4o
	gejqFLU1wvxZUmt7TedXT/dZfbu7E/RpSPDw8xLgla1cZA/x+Y+G/JA8n3NH81/YDtj9TiRPmfkqr
	s4GTWi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWxM-00000002e8h-2a4w;
	Wed, 22 Oct 2025 11:24:40 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWxH-00000002e73-3jxs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 11:24:37 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so63696465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 04:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761132274; x=1761737074; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NE6ALi4oCIm+yd7a3yOvtFqmufCiCdrMy/7EGT/KVX4=;
        b=VLU6tjwKiAlyo8b3VRWfdbLowdX4dp1QpkNHvQwASyxb/Iukv5eVCOoFaGQvCKiSq+
         GssttSfQz8hN9IcN8hFf5HK6Mfd9ihmUwBXb1hhamv/9SGgWbtLSGOA6TZR3eMCqjmzN
         /HJpZ1cz4qyItfBIrT3ulxLfbV3YhYFe9u5Dt3++i7WrRYg1cBSz9fPQ7L0/jL4cog3E
         xhW9fdNcERvTp1xK1CwHSy9NrAsWw1mgxCVs/0Kwxdd39fCraAjaGEGkX9KyKJlNH8JL
         lE51nRZtQgF3KfRDlmAHa89q0MIPj0W/IuzpPXNVGvYYvlQw1CkW8EaYC2ZXnjKx/Y1y
         gD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761132274; x=1761737074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NE6ALi4oCIm+yd7a3yOvtFqmufCiCdrMy/7EGT/KVX4=;
        b=ui/nxzl656pjGsCCnHkvHBWVP1o5EIjCRRfWuz7YJVby5k8o+b++jXX/KrE2mDt0I9
         Obruc8WkGObB97kLzhbZSjK7ZxdvDYW8qwZvDV89ou25QOWF4HLVszI+CqXSf+zh7PSV
         b3t9YUhzTFa2NdA2lmZVDjm2dsL7VIa92llqFQMO+qG2DGicUbqnpQ8edi7o8BcTNcgG
         /wK6o3g1LYmso+rhguQzVU0vMPS9gk1G8x6x+7VeRf9bx6CjLfanIK9hmxP1wHhqt37x
         I4YF2RjZHAwqNoMcutBcFw/hjzD9tutQRWHG8Euj59RoLNL2DKpaMhcm/4zG2WPWUFb9
         cjAg==
X-Forwarded-Encrypted: i=1; AJvYcCXdKyu01fWViuMpzZ8+8xX6AV+ombba4pBy6o57JoLCL8Axal/9jyX+cBtgQsyhtLd2UJ6NePhVx5YGWA0s0Ji3@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvv54nMMYIi6sjY/pF3xntVnyjLgGHHgLx2oQemV4YQfoT+T5l
	kJSynWEDjJthfwiDzMKulWsoeYefn4gES67Znd92P96emE1J9fkOLDst00itcw7P+05O87cLyON
	vhZnmOq0=
X-Gm-Gg: ASbGncuF/hcbAS9XOo9CeS3t97i0/BxC+JZw3wVIU1E65EBupjLQCqWxyjbJO62wwEF
	UZwFkRuyEESUAZmIf8yn7AJm4jiPWJc5i5O5D5njKRRdO8QDzg2D1pBVhY9OEJQR0YDt6xsOmFL
	ppKzKlwwEnA15OT3fknKr3nDlmvhxWUTG+0iJ4ycgMbr1FZXute80q2PTmG3CfwFdIQbp7VEdLg
	3zEwTbo9fZSL4o6PHzxd2LqMpztJrUf7KnKoexZRruuJOvZ0njWukFUsVQjZDYYrS+/ra0SJDy6
	fi2+pVXK4mZjycyHS7Gh6Xl9qSd7ahsEfCbfwBXhNfUXI+iJzG/6FLAnkwOL40sC4Cy4JPx0F/M
	c4ioqIUUjhhs/uQHv02kmyui1qClyEaL0b/F9vQIAeJQbYM0sEAYCva0O+NXfeKM4c1RmKo/ZKh
	oc0kJQe/J2sLWBy62rDvo=
X-Google-Smtp-Source: AGHT+IFHudZFCqpsdF3BziLjxKHgkZc7fTsjSbocAq1uyR2DAIJq/pryZEZ8IbOeeE5y3RSm6MSLNg==
X-Received: by 2002:a05:600c:3e12:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-471178a74demr147513535e9.12.1761132274047;
        Wed, 22 Oct 2025 04:24:34 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428a534sm45864405e9.6.2025.10.22.04.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 04:24:33 -0700 (PDT)
Message-ID: <61813f89-3015-4fdb-a182-5c4159f7bb1e@linaro.org>
Date: Wed, 22 Oct 2025 12:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] hwrng: exynos: enable GS101 TRNG support
To: =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org,
 willmcvicker@google.com, kernel-team@android.com,
 linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251022-gs101-trng-v1-0-8817e2d7a6fc@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251022-gs101-trng-v1-0-8817e2d7a6fc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_042436_044753_E92FBF8D 
X-CRM114-Status: GOOD (  17.07  )
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



On 10/22/25 12:19 PM, Tudor Ambarus wrote:
> Hi,
> 
> I propose the bindings to go through the Samsung tree as well so that we
> can match the compatible with the schema when pulling the DT patch.
> 
> Thanks!
> ta
> 
> ---
> Enable GS101 TRNG support. It works well with the current Exynos850 TRNG
> support. Tested on pixel 6 like this:
> 

the commands started with # and were removed from the cover letter.
I fill them in to avoid a resubmit:

# cat /sys/devices/virtual/misc/hw_random/rng_current> 10141400.rng
> 

dd if=/dev/hwrng bs=100000 count=1 > /dev/null> 1+0 records in
> 1+0 records out
> 100000 bytes (100 kB, 98 KiB) copied, 2.03619 s, 49.1 kB/s
> 

# rngtest -c 1000 < /dev/hwrng> rngtest 6.17
> ...
> rngtest: starting FIPS tests...
> rngtest: bits received from input: 20000032
> rngtest: FIPS 140-2 successes: 1000
> rngtest: FIPS 140-2 failures: 0
> rngtest: FIPS 140-2(2001-10-10) Monobit: 0
> rngtest: FIPS 140-2(2001-10-10) Poker: 0
> rngtest: FIPS 140-2(2001-10-10) Runs: 0
> rngtest: FIPS 140-2(2001-10-10) Long run: 0
> rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
> rngtest: input channel speed: (min=380.570; avg=385.422; max=386.964)Kibits/s
> rngtest: FIPS tests speed: (min=75.092; avg=81.784; max=84.771)Mibits/s
> rngtest: Program run time: 50908949 microseconds
> 
> To: Łukasz Stelmach <l.stelmach@samsung.com>
> To: Olivia Mackall <olivia@selenic.com>
> To: Herbert Xu <herbert@gondor.apana.org.au>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Alim Akhtar <alim.akhtar@samsung.com>
> To: Peter Griffin <peter.griffin@linaro.org>
> To: André Draszik <andre.draszik@linaro.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: semen.protsenko@linaro.org
> Cc: willmcvicker@google.com
> Cc: kernel-team@android.com
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> ---
> Tudor Ambarus (2):
>       dt-bindings: rng: add google,gs101-trng compatible
>       arm64: dts: exynos: gs101: add TRNG node
> 
>  .../devicetree/bindings/rng/samsung,exynos5250-trng.yaml       | 10 +++++++---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi                   |  9 +++++++++
>  2 files changed, 16 insertions(+), 3 deletions(-)
> ---
> base-commit: 8ebc2add3e2d076adc5cc3e8c9bef268f7f1cb31
> change-id: 20251022-gs101-trng-54b710218424
> 
> Best regards,


