Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE75E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KLCC6CLZQeihBKxyImt/0LORJzTXRC0Daw+prTUMzI=; b=gN83ciIfPafEZ1V7VumXXDG4wp
	NXWhVUYKxfdnhJ0ndq4t+MxC5V8YYVjCZp6TlLIPb6Y15t+UaCBj5qhLUu66ZixMn2qBQulOLGCf7
	LafOWz0N2VH7BoOzmuf3lxqsjgZXvsNo6dMZnOgd2VP4df035Sq/wEO151DzC6fe9d0ugOm48S04s
	3wyKPSJ6dzLcCXmFV0aegtp0WjBdrh80FOZDVYcouOhtQhrAXfxGfiIrHiupIxUYnWd6kXpcBz2Tb
	olKqw2Ze8rPWb236ZkQog8Omuz5oBBebXXDHcbBWLsNMxiWSryujvJDem9GY08+dnUrrn6hh6a8Q+
	1SYyL/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdXH-0000000CXTy-3e7Z;
	Fri, 03 Jan 2025 09:00:03 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdKJ-0000000CV07-058u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 08:46:40 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso21108181a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 00:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735893997; x=1736498797; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4KLCC6CLZQeihBKxyImt/0LORJzTXRC0Daw+prTUMzI=;
        b=w+UHQtccRn5de2SIGl+zM59TwgZaDK0NUa/yy5HOCznZAVHFhCjYwlvhbBE/G01dJK
         YzLyzAHp38fMKM49V1C8IFtnfx36EK3p9EJlmyTpudv8s3nF9Ra9L2RKhv7gybo++4YM
         B/8uz7kwTuuElMRz6dYyOjqp5teAUCkTLGHHZeFy8Kn027mmwbw5QpLtxQwMo8B6gUqw
         jPfWMYA+71KAb6LzGfPKQYS4ANKOvNGZTuqq1/EozYXH3j7Op0iZqTcFZUOiQfipaFMQ
         sC0dbWjxzJAjhCwxm2bjon5AET9sG3zzmI5qElFR6vNimEP2ECm0c0+wGeVPv/SZ8paB
         uT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735893997; x=1736498797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4KLCC6CLZQeihBKxyImt/0LORJzTXRC0Daw+prTUMzI=;
        b=CKiQOdEEP8YPT0CTvRyLeoGCxpDFTBHYnlBBXKgw+uHt3vfeF8x1dNseVDtH4lp7fG
         /zfSSd3W5gke96tNx6uZNMXRZ/+wgSmIVyUjut6MJ20AnNpgoq/QSkrX1CT3c5V09ZYa
         xvK+Vn11XX6lgowS8952MSrtpsyQXab2Kzwk9ktlVQrWWZrUt6Hj+z9aMtRSbqgSpLyQ
         Jn8GBPypFU1J3/Mpa4eRQcryZ13mQ/T3I88hTZAf+K8WC+MyUWmK0/kTzF+NRHm7L1HW
         JUCS7cV2vNtr+nzHo34iG5vxznpF7w18ZYcMwzlRgEAdYWZYzJpYhVT3OXcnqVrQjmMU
         QdFw==
X-Forwarded-Encrypted: i=1; AJvYcCXDU+Fp3L5eEG5sjvtyk5Vmsy7YvFMtGOwZsVU/2R5ffEzZJPnaJHmgMpA/m2unL2vqBPVFZ8m8eOLXXB6Ioajh@lists.infradead.org
X-Gm-Message-State: AOJu0YzeTWbeI6dYuNVWaxOnuC0XPRaN7DAdwff8M0N7BSONOtSHoLw7
	W/8jzFDB76kHiHhhHrA+u+EfOTDTBwzx1gBzTOPuK5WfccAWYrYPT6Vl81JMWIc=
X-Gm-Gg: ASbGncvY65JOpIdA118Mbq+u15K78uYWkJSdFEh9vdxKjCkfRHG360+hMe6MtPBfBlb
	/p3aweKiYZ8TLzKsdaBvXPhTu0MQcW/DLcyGD9GXbwBcpos8FAdYpXPRUuodaXFJfGa4Wh6XpZD
	ygXVWhqChrA/vr839UEXiQJlZ28+SvmNmtJb4C9cVfiT8KtJcK7whA8/q55IGIulZ6U04OFXXpj
	oi+VoBNILfi0blzw/IeivLNJONOftN8ArP0N/UUwfvSCsQ8WJwfg+ThauTl/W9s
X-Google-Smtp-Source: AGHT+IEcs3R944zYh9ReswLIXPTV3wRvlLj0KFBEAD5OyqwmCdtx2diikm4O85f1161OsuoDmNRPMw==
X-Received: by 2002:a05:6402:3510:b0:5d0:96a:aa90 with SMTP id 4fb4d7f45d1cf-5d81e8f3832mr38382049a12.17.1735893996986;
        Fri, 03 Jan 2025 00:46:36 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701c8c2sm18984792a12.84.2025.01.03.00.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 00:46:36 -0800 (PST)
Message-ID: <df9c9c22-b3f2-4665-800d-d6d085d580ef@linaro.org>
Date: Fri, 3 Jan 2025 08:46:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: samsung: exynos-usi: Restrict possible
 samsung,mode values
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
References: <20250103082549.19419-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250103082549.19419-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_004639_064566_7176F1F0 
X-CRM114-Status: GOOD (  12.86  )
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



On 1/3/25 8:25 AM, Krzysztof Kozlowski wrote:
> "samsung,mode" property defines the desired mode of the serial engine
> (e.g. I2C or SPI) and only few values are allowed/used by Linux driver.
> 
> Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> index f80fcbc3128b..5b046932fbc3 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> @@ -64,6 +64,7 @@ properties:
>  
>    samsung,mode:
>      $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
>      description:
>        Selects USI function (which serial protocol to use). Refer to
>        <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.

