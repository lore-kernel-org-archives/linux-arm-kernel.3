Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513CECA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 05:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVN6vmL2mzYorsNRnKCEmc0gW60w1iaICM1/zHjRYZE=; b=U4J3q68FpX1e6TPIXJGiNcWBgB
	t/pimUBtd+b6DsK8+Vqy4mnsbPWmlyewKlzWfNlsvYQnu1HmHCWxQ1++b0wwJWZz9plvJIjUcyeyV
	mEspGiEW/L6DlpfJilnayhNTQ06rfq2R+uUMPWDVN0eNYZGWBf4j0daHbEn4uLCsEOsnEJNDtgVnt
	boXDN/niP07580VmxUYVceZfZ1Js+ugtRcAUeFJVgg7IYrpEuPssq4clVeJ4zZd7MWCizvlZtZGeg
	xt2OHlOcH9pDYCLj0drg9URkq/WEVq5NwGYfJaOqBBfCO/K+3qT+QYgs2a+HzdO7FcfE2Gh9aox+z
	DqJlc4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urVLR-00000000LOY-10NP;
	Thu, 28 Aug 2025 05:38:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urVIh-00000000KuR-22Xq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 05:35:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45a1b001f55so2109965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 22:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756359354; x=1756964154; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVN6vmL2mzYorsNRnKCEmc0gW60w1iaICM1/zHjRYZE=;
        b=Wgo19uEl180sV/42bLwFvb24uNhu5SKUESHywmNxPnXfrodf5Ga7DwCceS+hjDPEss
         hh+y2zvNcIy6Ypjbc4s7v56V4jsDVANW7r4StnJQWkQJqgObLXTJaXxGSh7vwpkoBFrp
         8YuYuO+/2PmYcdYhyV53txckms03MLgOuhTVATAH7U+nztZlrEDStY8JUnhHtX9lzYpR
         tTqTwCmkRuS90uYCBbWTBsKb0oLD/SQj/CDi7KvR8ODOVBz3WGudCdOMSWvsESmDLAoY
         PKpkFXcCsQP31H+ppUnijVOvZ/hfMBm7ZjhFXQEnRIAU4dSIn55mgLA5wIWklaPM0l+6
         eMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756359354; x=1756964154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVN6vmL2mzYorsNRnKCEmc0gW60w1iaICM1/zHjRYZE=;
        b=qjCBfKQJ+hnH/HbJ5xoR5JReFnL2TaxuLGD34U6NlpRBKJHCjgwmvI5cthciBHO12E
         9KuVhK3cz7v4m+XAmBdyGR4ePXTQ/rzu+A1V2JtdvNUScpTaLIacJjvE32yznhPA6rl+
         trycnxOhXnPiBP0AYUgqBIqNL02ORewndqBPpWH1bvlNiTv4C9Pkyqb8TYkAHx/AOYIP
         QOM9kPwLPjnC0AmU5vCJ0mNN4hZl7k9aUjbzv5UaJIJqF1vEirq6hOdkuFGhD7zn/lVl
         VcTrZhisGEeYIowvBt67YxSKN5Zzldz4M8qYR2gAZ5E6do3UCBXjh7z5rveqDshqmhU1
         Q4aA==
X-Forwarded-Encrypted: i=1; AJvYcCXQIePMYMk7EMYFyH1NyxkCx9bTsFhaejqW2/1tWh4Xxx5ILmFrimCQJSvB69Tp/4sOzD4XOtn8AIAlPPu/PeGK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0PhK2LHfD/MQLcUC/2gKtsp+5B7F/k0UaEhkBJ0NjXVVysyz/
	grJgMOxMchqrw9eP9IQ0Puv+K+juBPACcTQvJzOM5JwrmyA4MqYu42UpAiYoRJYlUds=
X-Gm-Gg: ASbGnctLd5nkn0Nq50jaFrnUAZD19l6pV1c1jy3JOPw55OEC8j5LZO2ro6RnSvU3Ye5
	1C/3p9zoW3YMBCcASbzYWF9sMHKYnFoK+uRuizv85csfTF/oHjCBymSDPutLiAZobxVz+mlCBTO
	Vh0LbO2Vkgs8d22SVGMbPTCq/wpsOi/VzV9CLWpNeONR7CFNXDm7KgWPzD4Wt4W7YV2f+x2VqHy
	R1emmar2Wd8NznsTzqvHAMFIm+rHDAaViiRpfzXqqYMAFXcw6b172j0Uh8w3mzlAczmEpuJDGXf
	WAduHiUKFwZtaLJCzIHWLBTDpjhQjV0SJYv6n7iFglafs0SDPagfivzHndflHxe/0TuFQmlDvSS
	R9RYKnhwW/Dmv3//i4DbcabOPIUgJ2n0qu0ek7Gg=
X-Google-Smtp-Source: AGHT+IHIR++z2ZTED5bprbyTQI3HdqS+SJGiXMbzBh/T/8B21WwlVZNnxeYMt/U1HQ0RYCeCpzMWIA==
X-Received: by 2002:a05:600c:1c98:b0:459:ea5d:418b with SMTP id 5b1f17b1804b1-45b5179f3dcmr185227785e9.9.1756359353745;
        Wed, 27 Aug 2025 22:35:53 -0700 (PDT)
Received: from [192.168.0.251] ([5.12.38.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cd0acafd09sm4483005f8f.31.2025.08.27.22.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 22:35:53 -0700 (PDT)
Message-ID: <407b0663-1f54-4cc4-8012-75d61e94e6d2@linaro.org>
Date: Thu, 28 Aug 2025 06:35:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] clk: samsung: add Exynos ACPM clock driver
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
 <20250827-acpm-clk-v2-3-de5c86b49b64@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250827-acpm-clk-v2-3-de5c86b49b64@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_223555_532549_FB3002D7 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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



On 8/27/25 1:42 PM, Tudor Ambarus wrote:
> +config EXYNOS_ACPM_CLK
> +	tristate "Clock driver controlled via ACPM interface"
> +	depends on EXYNOS_ACPM_PROTOCOL || COMPILE_TEST

I'll need to update the depends on line to:
	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)

otherwise on randconfigs where COMPILE_TEST=y and EXYNOS_ACPM_PROTOCOL=n I get:
ERROR: modpost: "devm_acpm_get_by_node" [drivers/clk/samsung/clk-acpm.ko] undefined!

