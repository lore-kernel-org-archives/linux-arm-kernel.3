Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB74C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 11:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MR6V4/Niwov3dT1lKEaWV6Yp8Zy1voFzaQ1D9zoTY3k=; b=uVF5iUe6Ahwrkaf7rzkeoPLPp1
	ZbdntNJF9Sku0/oEOxMJkjrNfBORdw2KCBv3sJ+ONuYaSjPK3bK+LST4rE2Axu75qLb0Br55bZgJ3
	bGGoruKa5XhJelv81vqYtYpYr5JU722Z8ZLwOjZ1Y+Vqc/EzQ8IVVqAojod5MzDmZ7Hel5p3sZHir
	wadCxuMdqWhzNl8Jvk2IZCC6tL4K6K8U4a1KiqS8VE4+O9it+5rMxEndwcqfo6vf9g75uzuSxSxpB
	QTbCZ168FgyjMycOTc4avOLY84WUPCHxYqpwBz2ZPaUunVjpBMAxEVX10uaundz0gxwcdU4HS+hEF
	UqmMLvfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8TJ-00000002MWf-08v1;
	Mon, 17 Mar 2025 11:17:29 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8N6-00000002LOu-23iR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 11:11:09 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso3908039f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 04:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742209863; x=1742814663; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MR6V4/Niwov3dT1lKEaWV6Yp8Zy1voFzaQ1D9zoTY3k=;
        b=GnTm0RXGdpztTrBb4kqVT8vmbKCEmaYgmmaiVguLo85ZuwyLrf8uYVHjyxF5lSw0T2
         fexrOEDWHkkTiB8B2mZg94o4kJ1AcHt63vSQi9zAJyHIRzJvcsVv/+Y+yh7WK6GSWLPO
         BABgMMzt71xqYdSmDk6u2tkKVNHt+jMZvZ6tLUBFYYjy6b13XO8qQnYrkkBEhxaH6RyV
         B8Z+r6ejcmsW9f/QajwYHh8V7yN3ER6tro3Q26+2xr1lq+KhkfjpGbqmi9whF5wS2THw
         g4z+42CjSB8CU946lIxYVhahWqcdXAIOgGbIPhVRsSxuAYHOzIYiRtr/gdUug0zZK++z
         bF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742209863; x=1742814663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MR6V4/Niwov3dT1lKEaWV6Yp8Zy1voFzaQ1D9zoTY3k=;
        b=fBbC6UXBWCLKCBkfUwwKELd1aq2uXkGaw3xCrHoBwUl+dE5IyaN23C/ZACgmGJL3QP
         Gj51dILcZTNharxMYDBBZgTxVnk+2v2SUuwzgvE8pbQ5p83yNOn3mdT9f7UaNtJ7z65F
         rmuzEOR6vC2I7dEGn/44cRmxSq/+dmfiTWeLZWs0t7fFlohYXixJbF/D8JQwDYGy1L18
         LKHQfIhhx6YggpV+u4eI5TZcMjqRnpCUCYvU6u79BMn0l+m/Pa5w0QBr29VNTUdaGse6
         9kQnr+SDE4k5uvH3td68Aa0ET+FeVpsT22dxOQ0CpzRHbhjkm+eRDZyJ2B3d7vYZ1mz6
         51NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCUjFOiWULEJiHXm6WZSZHY/z71Qnv4U7xhzLq7cgHr2WL4qe7dtT0OyZkgBHoROQZNak9V30elRq2dXAMqd8x@lists.infradead.org
X-Gm-Message-State: AOJu0YwcMhIl2/8PLcNsr5YCUayLxf5IyCsgPFx1FIb6K4nAK59enxdy
	tbJZNBdCjohHTjpwXVcQsXV5RgkcTclC0+Jqac4lAIEtdSjuZBmH2r4KP2aQclw=
X-Gm-Gg: ASbGncsKhBTjBrWKFW8MfxXZ8wsfBYw92NYW+/Za8qO4x0zxC1bFThtySO8poBpNdkI
	i8QvLVGgrQ54TyGQLezpU1eJ2SKMzUmjiF4epuh89yywzl4k57ykzTqNfBYf0QUCnN5DFAif/GL
	UNTJWh4A6lrMJC2RiRuTM8cMDw7qXgbp+XVLMIcNGirJmgSrqhQ0/nFx+7KlJaxChDObcqT7nd+
	2Z/IHTnPRv6X57vCLUu4Yj0X9rYs3UbhbTM2WofZ2222B+N4428V+4fo4WY4A3h1Rv8MQCCEPtL
	NP3D2v0fhAxXXhOv8+EM8XN/6M6j5E0G/2JDkSfqFE4SyJZb9YCTPjIcJb+/j4vnKz1PBAeGg9W
	eoxO5C40KAL5ig3qCUag=
X-Google-Smtp-Source: AGHT+IE476SO8H91edeKXZBTAyLprfXCwLhm85dorgsKMjTo5H3Yf/EGW9XVvxTRoJ7VcbN4UEacig==
X-Received: by 2002:a05:6000:1ace:b0:391:41c9:7a87 with SMTP id ffacd0b85a97d-3971fdc6db1mr13823999f8f.51.1742209862843;
        Mon, 17 Mar 2025 04:11:02 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:900a:ff00:eb98:2c37:6a77:39? ([2a02:2f04:900a:ff00:eb98:2c37:6a77:39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318af0sm14702121f8f.73.2025.03.17.04.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 04:11:02 -0700 (PDT)
Message-ID: <75f49e65-5a8a-4a52-bed9-31be4a76d536@linaro.org>
Date: Mon, 17 Mar 2025 11:11:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] firmware: exynos-acpm: convert to dev_err_probe() in
 client API
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
 <20250314-acpm-fixes-v1-3-ab03ca8e723f@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250314-acpm-fixes-v1-3-ab03ca8e723f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_041104_560327_D3E85F43 
X-CRM114-Status: GOOD (  16.12  )
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



On 3/14/25 4:40 PM, André Draszik wrote:
> dev_err_probe() exists to simplify code and unify error messages by
> using its message template.
> 
> Convert the remaining dev_err() in acpm_get_by_phandle() to
> dev_err_probe().
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/firmware/samsung/exynos-acpm.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 48f1e3cacaa709ae703115169df138b659ddae44..03f907a95c6acd66d89cd8af2f52e7c6dadf492a 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -701,12 +701,14 @@ static const struct acpm_handle *acpm_get_by_phandle(struct device *dev,
>  
>  	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
>  	if (!link) {
> -		dev_err(&pdev->dev,
> -			"Failed to create device link to consumer %s.\n",
> -			dev_name(dev));
> +		int ret = -EINVAL;
> +
> +		dev_err_probe(&pdev->dev, ret,
> +			      "Failed to create device link to consumer %s.\n",
> +			      dev_name(dev));
>  		platform_device_put(pdev);
>  		module_put(pdev->dev.driver->owner);
> -		return ERR_PTR(-EINVAL);
> +		return ERR_PTR(ret);
>  	}
>  
>  	return &acpm->handle;
> 

The clients are indeed expected to call this method in their probe
method. Shall we make such assumption? I'm in the middle here, but I
don't mind if this gets queued:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

