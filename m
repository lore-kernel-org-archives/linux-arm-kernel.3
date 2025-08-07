Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6483CC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 11:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvMfOW0K5+CfylFuc8dQRU5yL7iRaqNXhwYAoS6QuGs=; b=f5R2t0xlyeCPIUZoBQhtTQPq5d
	NWxY96YvjG+npdwPAlOFmtl4wJKJd4FBHIHDkjeyrZiJkkUys2juar0ALT0wrZ0rdaM+INQfTp50D
	CEvfZ+Xuklsd7/mzglL3j1RRAL9YSScP9sVJ57/DS3WXLXK6GnDQSF90TrRU2qepsmWQtJzOtIkRN
	Bh74KNySkkO6BECghsEd8pnQTJN7QgmxeW3fTn6Y+hKXMTex1rPzEsFFGDJ2O7HvW7Oordtzd4oOW
	rnk0g/mCRdgSOjlQWYuVXonggSjT0kMMKQ7c7RAJCTCnc7qszcTH1jFZRtlDlzOQmpG5e3H218AMt
	DeTWhm9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyj5-00000000Mar-0n3c;
	Thu, 07 Aug 2025 11:24:03 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyLR-00000000JMN-3i1x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 10:59:39 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6155527ab87so104646a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 03:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754564376; x=1755169176; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IvMfOW0K5+CfylFuc8dQRU5yL7iRaqNXhwYAoS6QuGs=;
        b=Zf3ItoCdVdE5GRJxdQaSKn8onun9F+RcW+SHht56aK9Y0S+62a8IYYEbI9W1hNSMvp
         FwvzG8ie0NLg023rOfloaR+2HtSLFO2kPSvHYmiT+J7Ny7b3mEGabGBbHlVkbjxkw1nL
         FuIXGP7zHEePPD6hIgAPZu9ZLl7zEygmcmC9h+K3F/12x7Mel40II5Yoa8ExeR3F9uxV
         HwZ+hpwu8aVV4rI6SUI/MHKX5XMz7SmR7ErWwyX5Qodjd8g2YWuKqW29uOVq8/tU22S0
         +xH9OgXM1plw2knxN0kQEUUxl2MrpUhggucg/Tu1wpkym9LRFxrT2SRoBC+GAxdAgS3E
         reQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754564376; x=1755169176;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvMfOW0K5+CfylFuc8dQRU5yL7iRaqNXhwYAoS6QuGs=;
        b=jGKZG/aJ3IhM5P79PtMSILQXccOrqBTre2swLf2mfJc+qJMfsdQ03pGYla0vgxRvXm
         47BtgXxR4qHR/PZ/Q7gTr69uc8nf0pBZZJNm+4hBDgAEaYfyVdiSBEjKcNfRLha8wht3
         XIeaqp2xAbSO69kgBEFrHZSeNzj7dSatUZnL0j1ZrmqiJQfNmULbvMGklWHbMLOWmPZ4
         aPxDJnTN9T2c9sPnu42OiMRF1/tQf5L+Hdv6UOHWjLXWxeZpWtJXiRWq5eDB9OaEVQBs
         0tCAVzLFXTy7CZ90StWUe5gsmLJnatnHNILwN8U/VJXxckjoj7idvQTasvhk3XnSU57+
         6c9w==
X-Forwarded-Encrypted: i=1; AJvYcCXY8F7zT7FpP0TBJzVJbQsSbEWs56Kwdj80OJSbKhBUfGwwVUzKgp0xBV6Qho0EryDhQd7o98he644Qa/gWu64V@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcm2ejXn3kOBjL5UTAfhWCPIPFvOTEulZ+UpBCxtgqJ0oMob4Q
	89A10zsNZkqeXPRDv3FOFDSLaR0jqh7enKEf8+BPkvEnu4FW7rRqFOQHfU9pr2LH6ts=
X-Gm-Gg: ASbGncvlGr1G3SZ6dXjxpB5AnmIWTfsYEHFTE3tJni25LmXH7pjkneqWG2eOYKMRAmI
	YiBCJ/LFYdn30dU3TIPDwxE5I6EmiomfJiM5/fsb/jv/9N8UfSxDRq37VWOt6okhIrqi4QjHItp
	Hnb9dw9Nt+xB5OxI0UV8Qhtl2rbQHCgYIy/4VNYjaUmWLCjSW/ik3Zqz9hA01PtPHvjczKPl77o
	FLm2LOzSr2NEnVWmp+/9lPiPbq9SkzWHwUG02/qeKHUBFHL6CX1xDgqBuTQSXPG/w9HBAf96Qil
	0xHG0aW60qp4tNmc+tPFCthUpN5JcxCJ6pxPLetSIBEZnQYIpB2fqXnxkc6t8zlN1TZ5pTlQfJm
	mbzDe04mIX2GqsPjVaMW0S/9Rv3e5pkCypEi5HpcEJes=
X-Google-Smtp-Source: AGHT+IEvJ6td6iNd7e94Kkjtwe3tYixKx3u6KXJTp/O1bo37Zy/totEk9IAx2HyLhWP8NfTXAJGFxA==
X-Received: by 2002:a05:6402:40cf:b0:612:b3fd:4b35 with SMTP id 4fb4d7f45d1cf-6179619204amr2008731a12.6.1754564375986;
        Thu, 07 Aug 2025 03:59:35 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe79a0sm11627165a12.39.2025.08.07.03.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 03:59:34 -0700 (PDT)
Message-ID: <419c8b19-da07-4972-892c-9f8a55a546c5@linaro.org>
Date: Thu, 7 Aug 2025 12:59:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] ARM: dts: samsung: exynos4: Use SoC-specific
 compatible string for MFC
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
 andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
 anindya.sg@samsung.com
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
 <CGME20250807032508epcas5p416a3af567faba6a4fe3d6f6af5c0dd80@epcas5p4.samsung.com>
 <20250807032449.92770-3-aakarsh.jain@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250807032449.92770-3-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_035937_938348_8B5E223C 
X-CRM114-Status: GOOD (  15.30  )
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

On 07/08/2025 05:24, Aakarsh Jain wrote:
> Modify the MFC device tree node to use a SoC-specific
> compatible string instead of a generic one.

Why?

> 
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> ---
>  arch/arm/boot/dts/samsung/exynos4.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/samsung/exynos4.dtsi b/arch/arm/boot/dts/samsung/exynos4.dtsi
> index ed47d0ce04e1..a2f15fbe98cb 100644
> --- a/arch/arm/boot/dts/samsung/exynos4.dtsi
> +++ b/arch/arm/boot/dts/samsung/exynos4.dtsi
> @@ -435,7 +435,7 @@ i2s2: i2s@13970000 {
>  		};
>  
>  		mfc: codec@13400000 {
> -			compatible = "samsung,mfc-v5";
> +			compatible = "samsung,exynos4-mfc";

There are so many things wrong here...

1. This breaks all users
2. Not a correct compatible - there is no exynos4 (see writing bindings)
3. Commit msg does not explain why breaking users is reasonable


Best regards,
Krzysztof

