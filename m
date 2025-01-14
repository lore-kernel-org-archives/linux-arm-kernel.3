Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DADFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 00:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5eTKAbfNWbx/YU36/7otlGNMn3vJ1aSKnUDn2lnA00=; b=bB2jta/eePOjkE4wF+Sn3NjwIW
	n5QtmBXQt1Kg5MOCJPmYSiw/O0BR55fI8S5HNbPEvgbXmqnWKJ+Btcj7LJJAvmokjLHP3dFCtIxtV
	d5fp1/PIac6aPoLgF1BPtgdiLFNgrgWhjnm/2DGGUJDeRmxb6ZNo6PP4S/X2RS4xv274KASDovOQI
	VKZlLPv8X8cuLwUg2qN0gc0+45eFpuVh1aZzcRj+YEKrd5/7gYfGuYp6pzTxqtb5e3dk6K8qBUaUG
	mMibkNVyRGW9l1USP/dLMIVivsH0lNaAqLslx64k2u9iQVp3U92zsicQZGXI5Z8B1lkTZb6gllpEz
	sDAzeFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXrKk-0000000ACyg-0890;
	Wed, 15 Jan 2025 00:32:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqBt-0000000A5Ck-3RnL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 23:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=f5eTKAbfNWbx/YU36/7otlGNMn3vJ1aSKnUDn2lnA00=; b=rHHyW0gNcMfsNRPIWuZNZnMtAB
	Z1kZQlqbQ4TQq8ngy52wfKemxkL4pja4HK/LmPqaW199HG1fWkKRoyfbGiUjlOHiQrxIF5S5Uxkq4
	nVjRFnqwgZgP75GeY18VpMtN7iJFvthEOo0yGcBAEarMd+U5AqEs+X/ZQ4kZjaZ6YMwtla+fyHx4i
	LARPPOHlD/k2XMQoqax5rJMDC0QBfpSDnAtNmxVk4Fb9YbjN1Ru2oGID/cyvUX5FvVIDwI/d64jYm
	j4VZOzmTZLU0jEszIHwMctDW6Nz2ZZ2Glr90N780E8EES7VsIEa8vjgvWvKtpqFo7/mAMmNHsVQGO
	WUG6LRBw==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqBp-0000000AgS1-3lB7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 23:19:20 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21634338cfdso101186035ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 15:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736896755; x=1737501555; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f5eTKAbfNWbx/YU36/7otlGNMn3vJ1aSKnUDn2lnA00=;
        b=Tygk260InKeX+oW889+al6qNJRNZu2N0Rz6xc92LVdIIPnLNccToQHPMY25sPNVWq6
         NsDXX6QIAQrgbfNtqFQlvT+EPJKwMa3cfv/8JiXzvc/5bvWwoZizfQ2E9bqKpr6JAxcz
         iIZYM1v7M4aKljL/T0lesQqIlXfmIC2IDXexkBvU3kdZVa5uCepisGDhQTkVE/wQq7sI
         q1WQxL8jHYeCpQpI5FhkrYW8DGZl7j2HldXtVIDFhzsC9RdOLuVyKZnaxGmXLD8xLxFZ
         z5fzZTuzU5DKuYj84Nq0YhS+floX6ql5iSHp+IP9ZbIf/zIA5PKXM4fSpLiP2jp5wsSq
         zzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736896755; x=1737501555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f5eTKAbfNWbx/YU36/7otlGNMn3vJ1aSKnUDn2lnA00=;
        b=VaZRU1WsPP6mO5Ib+hxBLsDU8ThzyBGceJhYzToIuN6tfkfQqSZqgv23QExeI9dh3C
         Pv+5oOPSXy9X9VLtEgYnPVg4CfFQJgprZSBs00RL5TU1IyWlscq1ihkPPPBGgDfXw65x
         JM842kkK9TFCrT98CujyuQVAAK79vqSGKwCIVZfLzcykqj3dAWAeHDraC2JkaBO1KYr9
         c5nxtgD/EAih161fUrq2m3Syim1cWnmk79EQeOTQJi7Uz4YGRFN0xCalrOcOBYUVV7ko
         lgns2cMS67TB1K2B+vRHvOBtAqNIRg8nkOG1LsLtnU2OHDGboTmMeoBPOG6ISCnUe6Jh
         5BLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcUX5fOdDmIkoowypzFY+HdjseorDrWfy76qok1KNdrC6gvqVIsE2aJ7ESc1PyvGNSigN6RSamtkvyQam19WcQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxH25oduu7vSQwYr9KmuGvPTGbffcs19ePxkvpR/sIuzYUMVLQE
	E6YAvYkSuMKI0DjqzlO1FOn5W+rDFieoKN91eK2/c9WoX7o9o//b
X-Gm-Gg: ASbGnctTsawuPnDXPrYYjr5BH9FF3zSVLYSbG74v1NJgraR9RUEumh+G89lNLbiFSQm
	ATC/nWDFsGNfnCopyF53NOVoy0ypruFmzQAdh9T+J4BLhEDlYghGZU6j7XXyW7CRRxEhIuw7ZU2
	ivDupCaOoui49Xt2qEm7Ce3CqS7XYIKEXustUMJd8Xte2FZ09M/5Zffygp1fb2zjrVjEVewjFeT
	4qJ8cxCA27/n/KgM/sh4tI0OYH1mMuguvU3ryLwGDlHx9wZ+F6RvEnY5/wDDBN8esPA
X-Google-Smtp-Source: AGHT+IHvhFzdOuZJhvs41X/8XrZF9xVo0QVuW5f8A1eRLQV4vZJgXFT2cldJ2dy/GO1Wh/lGLTu/Og==
X-Received: by 2002:a17:902:f68b:b0:216:32c4:f807 with SMTP id d9443c01a7336-21a83fdea82mr421041255ad.45.1736896755413;
        Tue, 14 Jan 2025 15:19:15 -0800 (PST)
Received: from [10.69.47.104] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f256b4csm71720915ad.215.2025.01.14.15.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 15:19:15 -0800 (PST)
Message-ID: <c48d6cda-8508-46f9-92b9-6621b335b565@gmail.com>
Date: Tue, 14 Jan 2025 15:19:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpio: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Nandor Han <nandor.han@ge.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com
References: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Doug Berger <opendmb@gmail.com>
In-Reply-To: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_231918_754866_242562AE 
X-CRM114-Status: GOOD (  15.96  )
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

On 1/14/2025 11:14 AM, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>     operator has three arguments and with wrapping might lead to quite
>     long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>     file.
> 
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v2:
> 1. Many more files changed.
> ---
>   drivers/gpio/gpio-brcmstb.c     | 3 ++-
>   drivers/gpio/gpio-crystalcove.c | 3 ++-
>   drivers/gpio/gpio-grgpio.c      | 3 ++-
>   drivers/gpio/gpio-mvebu.c       | 7 ++++---
>   drivers/gpio/gpio-nomadik.c     | 3 ++-
>   drivers/gpio/gpio-stmpe.c       | 6 +++---
>   drivers/gpio/gpio-wcove.c       | 3 ++-
>   drivers/gpio/gpio-wm831x.c      | 3 ++-
>   drivers/gpio/gpio-xra1403.c     | 3 ++-
>   drivers/gpio/gpiolib.c          | 3 ++-
>   10 files changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index 491b529d25f8..ca3472977431 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -9,6 +9,7 @@
>   #include <linux/irqchip/chained_irq.h>
>   #include <linux/interrupt.h>
>   #include <linux/platform_device.h>
> +#include <linux/string_choices.h>
>   
>   enum gio_reg_index {
>   	GIO_REG_ODEN = 0,
> @@ -224,7 +225,7 @@ static int brcmstb_gpio_priv_set_wake(struct brcmstb_gpio_priv *priv,
>   		ret = disable_irq_wake(priv->parent_wake_irq);
>   	if (ret)
>   		dev_err(&priv->pdev->dev, "failed to %s wake-up interrupt\n",
> -				enable ? "enable" : "disable");
> +			str_enable_disable(enable));
>   	return ret;
>   }
>   
For gpio-brcmstb:
Acked-by: Doug Berger <opendmb@gmail.com>


