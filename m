Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7002DD0BB5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 06:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eg0Qoo+9T4bkNwhbFJqsnN7oQTW8RaVNg80QPE49Fyo=; b=BUfi1j2mbUa/yjGRnqDqm0wcle
	+0y31JAJl23yh1odHYqT225H9+nUXhqExmLg9HFClryJIGJdayV5cNMacyNvaEYM4cP9yRk4Jwe/c
	8l+tZpaFKCCAkrEFYXpS1bK4Rf1nzhtsJEBhnkCAPUitNGKWOsHmtGytTOVOS57zHyUEAF9R7VFG9
	+hbaO1YDFBzHJexM0Nl8pC9gSYtHXT22P8DiiGAh8pnPvSercATlif1+laxejh+nPK9UbLioU0Wqz
	iViYwKtSqoG5VreLhSz9yDzO/U4TbhqvR9RSXfIm/g7xB5Z2tEj+wIrJvxQPozFWDtVYCF34BcGl1
	HZ9GIgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rP0-0000000GvpI-2LXo;
	Thu, 24 Oct 2024 06:32:58 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rNT-0000000GvhN-0Y6v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:31:24 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so835174e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 23:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729751481; x=1730356281; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eg0Qoo+9T4bkNwhbFJqsnN7oQTW8RaVNg80QPE49Fyo=;
        b=IHgrpmt3gwYGPLiLVOa7YyyZ2mBqJW5oid8bT4ojwd6k0od0bCLMLqdvyMYtOwIJRv
         Udx2VC8kn1aakjM1FGZ0l0aH0J5Fc2znF0dKVzvU95S7gHNSfIXwDiWoH0syW+G7nT/W
         CSOhiqAFG+r5fRr1bhuQoKEIAru6HcF8zRH6L+HPMvaEIhsTmLthkv5ut3gSpYNqcE5S
         nLqquJXrz+2OTOm0UO2g5uqig0dg66NFRZ2X3/08FM7ICIt7mKj449J1kTeJHGsRwNLL
         Hs9Eb2PxZ+zixYUnDfISKvctps58puw5OehxTJam2IGKRaJxdgnw4Pjwvyocm3FBQP8q
         8qdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729751481; x=1730356281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eg0Qoo+9T4bkNwhbFJqsnN7oQTW8RaVNg80QPE49Fyo=;
        b=asaFOq0hVfXjj6Le4GIYGlsE2Muh0ezr+gRTjChRDOAOpqyhy/389taDWFqwpUjQLu
         pfIjQHvb1bOcl78UjJQ1pPqLGp4NewAkKVOh88n7YW9WrAjJd0adlyl/vdC4+3G6cOjz
         hKAPnitOEc/hoN0QfWCDX3AYdyQ/729kOEmMAEmKWG7ovu58iKhXlTh0ZVKuTqdAAgw1
         G1HTl1w0DPaSVIy/t9QZegc9Cw2HQlppHe0n1Agktt9rw4uKXzkkrzPUlur/VyU88p/C
         8w1Yi8xLRUH+OAXGIvNH8d91ipMvLVJU3sgpbcX9Jl3HSpiU1WZZZnwMg0/ULEYtXym+
         j6Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWVpdD7yzZZb9Is3jCuXPD9FPsfSzFJ/AwR7BZcuigGGFyClvX8uvW2o5prndNk8TODlVZwIhQYsYf7/vGlUA/K@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlom/flGZRxlYn6za9XE7OVLhEjt9KD8MemLL6IU0XA3nuq+No
	gKxRrQnN/j2pYUj/WBmS1nRIeIsT4AMoo2+Q2xgUumpRGf5Skhci
X-Google-Smtp-Source: AGHT+IGTgCMu/aYTxbn5o/iwDHWcRkcznRmu5yktlW+DSiLgJIFiLKd8i11LIYEetT8aCjJiqsVtGg==
X-Received: by 2002:a05:6512:3b90:b0:539:8a50:6ee8 with SMTP id 2adb3069b0e04-53b1a3b014fmr4477340e87.57.1729751480750;
        Wed, 23 Oct 2024 23:31:20 -0700 (PDT)
Received: from [192.168.35.18] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912f62cbsm568507166b.76.2024.10.23.23.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 23:31:19 -0700 (PDT)
Message-ID: <beeb2475-dc82-485d-a984-5d6554a4c379@gmail.com>
Date: Thu, 24 Oct 2024 09:31:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] arm64: dts: exynos: Add Exynos9810 SoC support
To: Markuss Broks <markuss.broks@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa
 <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maksym Holovach <nergzd@nergzd723.xyz>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
 <20241024-exynos9810-v1-11-ed14d0d60d08@gmail.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-11-ed14d0d60d08@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_233123_210854_897ED537 
X-CRM114-Status: GOOD (  19.33  )
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


On 10/24/24 01:36, Markuss Broks wrote:
> Exynos 9810 is an ARMv8 mobile SoC found in various Samsung devices,
> such as Samsung Galaxy S9 (starlte), S9 Plus (star2lte),
> Note 9 (crownlte) and perhaps others.
>
> Add minimal support for this SoC, including basic stuff like:
> - PSCI for bringing up secondary cores
> - ARMv8 generic timer
> - GPIO and pinctrl.
>
> The firmware coming with the devices based on this SoC is buggy
> and doesn't configure CNTFRQ_EL0, as required by spec, so it's
> needed to hardcode the frequency in the timer node.
>
> Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi | 525 +++++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos9810.dtsi         | 256 ++++++++++
>  2 files changed, 781 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..4b2ee59dc7241b0ec31c99fd909d1c5e25aa77e0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi
> @@ -0,0 +1,525 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Samsung's Exynos 9810 SoC pin-mux and pin-config device tree source
> + *
> + * Copyright (c) 2024 Markuss Broks <markuss.broks@gmail.com>
> + * Copyright (c) 2024 Maksym Holovach <nergzd@nergzd723.xyz>
> + */
> +
> +#include "exynos-pinctrl.h"
> +
> +&pinctrl_alive {
> +	wakeup-interrupt-controller {
> +		compatible = "samsung,exynos9810-wakeup-eint",
> +			     "samsung,exynos850-wakeup-eint",
> +			     "samsung,exynos7-wakeup-eint";
> +	};
> +
> +	etc1: etc1-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};

[snip]

> +
> +	gpp3: gpp3-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg0: gpg0-gpio-bank {

gpgX comes before gppX, sort all the nodes :D

> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +

[snip]

> +	};
> +};
> +
> +#include "exynos9810-pinctrl.dtsi"
> +#include "arm/samsung/exynos-syscon-restart.dtsi"
>

