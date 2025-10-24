Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B37CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 05:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlbgzRvJgE4Sx6EeAuF7s2GqiVQJOvGqllksow3opC4=; b=fsbujJfgzyJpUm/VR3RkdsADzG
	4x7wHcO4RDe+2Qq2rlJ8Szov31B8oXBs440vj6A5LAp0ocfuDn/mSvYH6gzehA3xn38wuYqF7K5Uv
	+MhY2GiMvxYmD6cT6ILPt+D6DMcDms2ZeJQt6Rb/vBbjz6MCaD+R9HON1MxRzVfiX6XWkdBJwRCgk
	jPFDmSJm4JLpaw4p034li6jztxur2y/vFSfSmjHDCmXIBPO1YRvZyRCPRtFhk41D/itJV9Yl6E4lN
	WNVP3u8QdTzFqAcRs2VFgKCfA7xw8W9NELb1kAI5lAD0qFcmQbgNwe+u9ixVWCxVW9xzbxasmQAXg
	w/QjTlyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCAoV-00000008JNS-2Urt;
	Fri, 24 Oct 2025 05:58:11 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCAoR-00000008JN0-2pWM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 05:58:09 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4298b865f84so817517f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 22:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761285484; x=1761890284; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WlbgzRvJgE4Sx6EeAuF7s2GqiVQJOvGqllksow3opC4=;
        b=wS6Ht4UcKEO5FLuXSZLcwIpRQ2iTAwfLW8xq59ooQHGcBctYkPu9590ksQlqqkdDZR
         yUxrwvYjQRr9nFXSfl95yJW5pkF9SToo38x7cdke8dydV3PIGbb90dTo9f11hLKlNbcz
         L/XJhujJBMyZQvgK57rDYJniOPDmANWkLH2hetI6rbYhpqfncFHhohGl2qxToRkpHJ/M
         yiigK+N+prSBDeulAHvuvUXcbacxcqG5Rhh/vKO+hCwS6gl+eoqw6KOei8aeFt5T76Qu
         iv4/KPJWiDAz1nameoUKijCNhq/wP7EcRaSdV0z9VUHF3CybzVfgYoHKQ9uVC8aHewQ6
         R4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761285484; x=1761890284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WlbgzRvJgE4Sx6EeAuF7s2GqiVQJOvGqllksow3opC4=;
        b=R+ku01x6iAYXgppN7p+hsbJU7DEN9mBglN7GCsSXh8FsC3sTioIv/UtAOzLHoySSKF
         PrKQlDpGleT9WYhp7DU+lP59cEmBCCjl1kbfvfOh9sGPKvO0TvWKTph0D4C23pzeri9O
         tH5LyCOE3uCJPxmL4XQqSJ9a+ZcwLMmNpHqV83SBWv7eSdt5rkXIx8OSHLQ+3N2+HozH
         O1gfzyoo8Wd1D1bIWG73JH3Yo2r35v6qmhniar5zl3D4UEC7PEdEpR0NSrRACJ4p8qUW
         bSvUL/uYdCkfORNu01MFhggiDVc6FDVZpT5j+RODb9ExJC3d3AH6k1stKF8TZO5Lg3R6
         ncaw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ70pZjenFLymZl9lgvnvjbWsq9+dmVjV0CRc6pkP3mt2sQokq7Y+bvTX2fIIRMlbATuwTvHCjR50aPHDEFpi/@lists.infradead.org
X-Gm-Message-State: AOJu0YyPNDsBFl5YOLp6PjZx6yF/DPh3hhQOe6p5mgVCGuR9eChsr3YD
	oQNUOuMyH8JKWouI6iI4xAQ4hZjr5InLq7p3woayjTAQSea5qDDKpzlpLJKQq6iMaCY=
X-Gm-Gg: ASbGncuIEPGGv2YtIL2OFYl7m9OVVnaI0+jx6z4Z4nepOZbLBu72ZgmOutC2aD3QW0A
	7Mv078x8eKICXXzSj9L1xNRlsEgqBP9W5KSqqMAwh94o2bbCGz2LVBm11KrThqBVUouLtXlilge
	ADYE1437O7imlaRqUjXrll4hDERZFkSF8b9vXtWWLscOFdIklkz+qENtjt6Fq7tVU4dt7Y6BtUT
	4lZ7H69H9KexlK+pK/YwKOqHEuXnCwaTWeZVwRNgRalOo3wytZ6RFVgQ6WXpbiYlXMUL60q4SB1
	eXypz0/VCKs1ZCZ091JofTFoHw9U8Ms2U0YMYkoasZGCcYN0uy6VBoOUzKflnq++S5N3Rjwi2kx
	74Kc4RcTS85H7DbhQ6tgfmAszEW0i8dFb0DGyAxIjK1P10pY1SlgKp/I6paQPtkjYyY0QY9+B6f
	8Xulc+r4KdjL+Op/BT+O0=
X-Google-Smtp-Source: AGHT+IF4FcOKkucmDNCM2/KKpneCA+i1yPeXTsA/LVynPTPJC5AXKg32KTh4dcKAlcjbp/p6c5h7Xg==
X-Received: by 2002:a05:6000:2387:b0:429:8d0f:e92 with SMTP id ffacd0b85a97d-4298d0f106emr1607568f8f.6.1761285484311;
        Thu, 23 Oct 2025 22:58:04 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496c14a26sm76466825e9.4.2025.10.23.22.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 22:58:03 -0700 (PDT)
Message-ID: <b1b6271a-1f75-4cfb-9af0-4d60b578f2dd@linaro.org>
Date: Fri, 24 Oct 2025 06:57:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: rng: add google,gs101-trng compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com,
 kernel-team@android.com, linux-samsung-soc@vger.kernel.org,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251022-gs101-trng-v1-0-8817e2d7a6fc@linaro.org>
 <20251022-gs101-trng-v1-1-8817e2d7a6fc@linaro.org>
 <113ee339-566a-4cc2-9786-89252ae072e0@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <113ee339-566a-4cc2-9786-89252ae072e0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_225807_912385_189141DF 
X-CRM114-Status: GOOD (  12.38  )
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



On 10/22/25 5:31 PM, Krzysztof Kozlowski wrote:
> On 22/10/2025 13:19, Tudor Ambarus wrote:
>> Add support for the TRNG found on GS101. It works well with the current
>> exynos850 TRNG support.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  .../devicetree/bindings/rng/samsung,exynos5250-trng.yaml       | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> 
> No power domains here? I would prefer to see such additions together
> with the compatible, if that is possible.

It's part of the misc power domain.

I'll add the following in v2 and keep your R-b tag. Thanks!

+  power-domains:
+    maxItems: 1
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof


