Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE66EC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 11:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRcb27c8tScey9iDEsBA7ABHwMfEvu6ZRBi9F3TXtqk=; b=sfS8GcNmLByhYAhmWSC7tV0/Qo
	6DAcq97gAsk6pEU8wbrFjqnzcwcMZYIcBh5V0tbzQJV8qqcRaX/eReu9qqjzRfpXwFDInoDalTnXS
	V6oHwymPEfYbPVo/35jImfQmxR4RSru5LjsdRQEocDkLjx30RXd9yPHnwcy/kUbQtvmY3HoHhC9xL
	yrGHLBzDrPv/QhxrV5upbbjjbRunKlSTcGwu7zYjdIQ65EnQY4ifvsZWtTuWQaHKpAeV1gjkBfSn0
	qUSqA+G0iYwvUIBOOtiEKfJYGtJlxjMnLsfSCz0dSpy4TlELm4O9zMmGcEnXxU9uuuAAnfU3E0byH
	qBjFwgSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujynz-00000000NNu-3546;
	Thu, 07 Aug 2025 11:29:07 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyMd-00000000Jet-0bzN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 11:00:52 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6fb1ded3afeso1245286d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 04:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754564450; x=1755169250; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bRcb27c8tScey9iDEsBA7ABHwMfEvu6ZRBi9F3TXtqk=;
        b=OiIO1TV5z+Hly5+PaR4wVoWDf7loUTDV9VAeprnQm4M65xZ04S8BC1GOEw0XgAGinl
         abGyEcyrj5UzwX/vb3lDLvJ5DTg4zQbvV9s0WfI48aXjdWFrHZvwkoJ8cKJSLbSfE/B6
         VEbApEgFu40xeSeY9icPpeXtqDy+5WAi++sXIiHZXwhgIbRIolL3RK2diaS3hVEbAUnQ
         jcoSzdXVl4uPd/oUY8HrryzPSZs+gVExzmX6FhE2MUoXkAbl7LK8b4jpcdARQGqZUdgL
         Mfo0gzVaj5aE0fhhjfB/qpxqSNkD2URrusbKCHOnKOJ2PDgb5ckm0+jfYcCav/M5q8+q
         YM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754564450; x=1755169250;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRcb27c8tScey9iDEsBA7ABHwMfEvu6ZRBi9F3TXtqk=;
        b=sgDMrUjxW04dsJvmKQOmEAXY58K/FMgzyP74jEl1QannOPGb31R7NCIX8f5zoaKOA0
         44er8mz/Kp21wjAlUU9BvXHWBaBMzBmZvlvgByYgDwiArJ1rIMEP5s7x2RCX2Osam+KP
         1s36Kvf/JfQuKtlY1Vi+ndU5QfUegqYKsUyJ57CEymnw9/E5K4mEYcTM5zKC92HjKE6g
         brk6UgQAJ/zf/scU8+0AbJ6N0bfjWM91Sx/TWiEYc2CJd1K6a6YA9XNTevpDhVNbMOEd
         LJxfEDzHyVnd1cttJdRvPP8aJAGHNeg69KF+LXU0d2PiMrztweTn+QRUPUTkzIzBPtv0
         ylwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRDZuxq2x0L3MzBNEgvs6eosmHStGinbQJgRAdPtV959Yyw5kSdEpMEtHJNnFA+Y4sP24baWd1EDyrJNIvc49F@lists.infradead.org
X-Gm-Message-State: AOJu0YxbNffdfOD0d0sIvcgAmdGeMQ5B11P7XZXT3EwWR0rYuhcs1FSn
	JOQK5z38Oc+d7Ktg9TzW0rvAAPDlbNvU0XZpAfPBeufk0prJPx3uTqj2SvbnDd1rE54=
X-Gm-Gg: ASbGncsay9K6d3z00XUPhDpt9/q+VPQhNmAnoHdWRxH9EEj1WfVwdww1uKBtRp0M9hW
	4SVsBny9UwQxd6hv3BNadtTI/muaOstwLENlSkAkwn0yO4rijNLc0i/KOoLqqIOGO4gWtYXUCgh
	PdHy558xk7tGdDoIvBFsi7yyCZa9lly5LoYC9KsjLXSsd63DsIEgB8r5I1GtkIa+WAyUZzTfBV9
	6U0B4CL8t7JWAyoF+4RASDaK6v/ZVa+s5EW+pdJtvtAT+XeQseyEY1amkbbaeDrxVSJE+8bT51c
	vVx0EMOVnied+kAThEOW4QduXqU7CHw0KKGB6v/aVqAVIY1sv9eqVX19RxT4SqX1Y/R99CGEFW3
	H7ktqFkokmZRM3JpQIOK+xa/PuvQVOc8Qo3rdU1h3SgMopwl+ejeHfQ==
X-Google-Smtp-Source: AGHT+IFkQZucbySx973IMpGpQf31mwEpaX+tRF7OzK2L3zkcUFpWDVHU3/ckfQB6L7uNIc6/7qPHdA==
X-Received: by 2002:a05:620a:2945:b0:7e8:37f:f364 with SMTP id af79cd13be357-7e814d20c67mr444620685a.7.1754564449587;
        Thu, 07 Aug 2025 04:00:49 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f72a47esm931765485a.61.2025.08.07.04.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:00:48 -0700 (PDT)
Message-ID: <fd2d1aab-a5e0-4822-89f9-eac45edd66c7@linaro.org>
Date: Thu, 7 Aug 2025 13:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] dt-bindings: media: s5p-mfc: Modify compatible
 string check for SoC-specific support
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
 andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
 anindya.sg@samsung.com
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
 <CGME20250807032525epcas5p42f764c0b2af23d0e47e853fc5707cb46@epcas5p4.samsung.com>
 <20250807032449.92770-10-aakarsh.jain@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250807032449.92770-10-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_040051_192458_209FCD10 
X-CRM114-Status: GOOD (  11.56  )
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
> Modify compatible strings in the s5p-mfc binding to reflect
> accurate SoC-specific naming across multiple Samsung platforms.
> 
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> ---
>  .../bindings/media/samsung,s5p-mfc.yaml          | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml b/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
> index b46cc780703c..6a711c8103ac 100644
> --- a/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
> +++ b/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
> @@ -20,15 +20,15 @@ properties:
>        - enum:
>            - samsung,exynos5433-mfc        # Exynos5433
>            - samsung,mfc-v5                # Exynos4
> -          - samsung,mfc-v6                # Exynos5
> -          - samsung,mfc-v7                # Exynos5420
> -          - samsung,mfc-v8                # Exynos5800
> -          - samsung,mfc-v10               # Exynos7880
> +          - samsung,exynos5250-mfc        # Exynos5
> +          - samsung,exynos5420-mfc        # Exynos5420
> +          - samsung,exynos5800-mfc        # Exynos5800
> +          - samsung,exynos7880-mfc        # Exynos7880

NAK, ABI break without any valid reason or explanation why.

Best regards,
Krzysztof

