Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00082C87FCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 09:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44ssHbdRXCrYyyAtxyTkKDOjXtvAc5bmAzGl6tF02xI=; b=48ZzxjZ7f8OJFSqBQeZiCg46W8
	PGtmdD/05R6fimfNUqeojD5CMbN9AXyQUMl6XwvQzfHiWPFN3atAp8wJzJPT+4XeTnMYjoufQQQVB
	yOTweGrjwo3MGbn8ByjhBQR270AaJ6hk+YYh48llqhxdR17vO33FOmBkqh2wsqWnEvDbFXzfAPtpK
	RVK4oARz6H4ZdwLSOlOVnvBP7oBcBTeMdU+HWBUw6kTEei02KQ7Atcrb5TfU5Dgw052aupBGdKCNS
	9oYK/QIxUZOvs6SvUg62A8/eTNfY/hyoj45zW2InNfA2uS6PX6AHdBAMF87u6Ip5W9mQeiJ/fnjlD
	Oos6W8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufExL-00000009TaY-2ncg;
	Fri, 25 Jul 2025 09:43:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufEuq-00000009TIs-3wxf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 09:40:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-451d3f72391so19338035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 02:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753436435; x=1754041235; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44ssHbdRXCrYyyAtxyTkKDOjXtvAc5bmAzGl6tF02xI=;
        b=KYv9qHB87sWEIzKhQ59CF89G6OnOCuGAK5hWh0HQf6Y6MYhmg7TKw+OdJcb7/PvGVL
         tgxsOxrXlg2gpjyGLq0KsGavToTeKRSwr3mz7YQkpxHo5mDkIDNcVckS0zJkcIxwWgeG
         effhX0XkKshXazz2kuGV7/sNZy5LZdq+mwxyFKjnoKVSwIP6dYz6Iv8nwhyhs76j2wrq
         p6bUkjQ1mD+9Q6ihVNEyzM+avu1B6GFu5XN5bSx2CHJnAx7uwqMaMapkc7+NXD5GBQtk
         zS6phw+eBInQh8i9quEFH602M5mpx7ga/bGeZvazpqYBVx3o1Y16dn1beBF4fpmAjkXw
         qyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753436435; x=1754041235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44ssHbdRXCrYyyAtxyTkKDOjXtvAc5bmAzGl6tF02xI=;
        b=TG2aWqEeXAz5T7LLdBQiea8ZNgyBDMt9lq1o1L0dycriIGVqqMEbmqK/QEs/0KO/ZI
         X6UwD8Xnv6n8LbwomdlCMHY6CYCnSpKPS5HZjpqGw49Bvnkh/d/aKNv4q/3jGnJHoFgj
         wFVa3AjqLUnK+/kvbbcyarz+cVs8YMBfXIUmoKcfZ58asFb0/2+ol0YfNRomrpATXzip
         VeRbJXxVxmNa44ED8IAEAp9XkgxtoCzdGtNPuNDslip3QW4jT+RHF8KcemtF1t4fUJLX
         rTklLSessgo4D0OH1hOsvM4pDuYSfBt876W5lnHhxbl6hqKJ+v/EQSQlyU6TbYrdxfa3
         bp6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMqrxcxyEMb1rX6wpOdA3OhQcq2GnjpftNcO9CqCayTG8cYRxqdZegsadnvy0+hzZayEuCX/OB8VW2YvMDnh4E@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6SEpj6ERmsoBnYIuleUmE/NnmwbSU2l6N+qvLX4a8ggSsbzjt
	/yZh9BOum2cvWMekfn6tQY9BUewvuMqpqISQ4PAS8aXAvb29gufpl6W6024jK/sYTRQ=
X-Gm-Gg: ASbGncspzSGzf6tZTYFbOhQO+VGXB7+0T4ggUS/iVskKGkvZv3PoebzRyZSrPh7WSep
	0H9MRhqC2FTOVsDAaVHEALxN/JNoPnOCvVJtCsYYOCW9UQLzlyl9zGXiTGyGCeSEzUBU6+Kjq3P
	jW+M7k8ZqfRAIA8fQ0yiXXEfQqWz/f1HFVeNnJJD/xEs36XR5YSyFlbR3MvgVv6F5olM1OVIsIB
	HlUoMjMjDquWbM10w2fKkh243k68HxJ0r/XxbNuxDOV1lIK8tGGO5wdk+jhcpCHEzjpcZ3OOv+A
	lXQVa4R6MyRH6VtEbIOxirmaBco0KhwC5wnFhsZ05zeZiVgWWNqNfLSavCEMtrlpF+Js3gdZ2iU
	wVOz5v34lk/plkqRVCyZbJM5o2LAxP/ZL6JPkV1Mo8GjStUXbczMFOtMDCZlUlOb6cG9ksiXS
X-Google-Smtp-Source: AGHT+IGOE4MKcXHWjyTgJ7GhAdYKgzZsFBV6lx5kihfphiDuGxCqQM/cXPB8xKXyeFvG0Uyggh7qPg==
X-Received: by 2002:a05:600c:628f:b0:455:f59e:fd9b with SMTP id 5b1f17b1804b1-45876549a91mr10063115e9.24.1753436435188;
        Fri, 25 Jul 2025 02:40:35 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b76fc604bcsm4595223f8f.17.2025.07.25.02.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:40:34 -0700 (PDT)
Message-ID: <9bf2899f-8981-4b66-8cf0-b7dd0d617747@linaro.org>
Date: Fri, 25 Jul 2025 11:40:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] clocksource/drivers/exynos_mct: Add module support
To: Will McVicker <willmcvicker@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, John Stultz <jstultz@google.com>,
 Youngmin Nam <youngmin.nam@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250620181719.1399856-1-willmcvicker@google.com>
 <20250620181719.1399856-6-willmcvicker@google.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250620181719.1399856-6-willmcvicker@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_024036_985632_68D9F825 
X-CRM114-Status: GOOD (  13.46  )
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


Hi Will,


On 20/06/2025 20:17, Will McVicker wrote:

[ ... ]

> -TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
> -TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);

Was these changes tested on the ARM32 Exynos platforms ? Especially did 
you check if there is no boot time regression ?

> +static int exynos4_mct_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int (*mct_init)(struct device_node *np);
> +
> +	mct_init = of_device_get_match_data(dev);
> +	if (!mct_init)
> +		return -EINVAL;
> +
> +	return mct_init(dev->of_node);
> +}
> +
> +static const struct of_device_id exynos4_mct_match_table[] = {
> +	{ .compatible = "samsung,exynos4210-mct", .data = &mct_init_spi, },
> +	{ .compatible = "samsung,exynos4412-mct", .data = &mct_init_ppi, },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
> +
> +static struct platform_driver exynos4_mct_driver = {
> +	.probe		= exynos4_mct_probe,
> +	.driver		= {
> +		.name	= "exynos-mct",
> +		.of_match_table = exynos4_mct_match_table,
> +	},
> +};
> +module_platform_driver(exynos4_mct_driver);
> +
> +MODULE_DESCRIPTION("Exynos Multi Core Timer Driver");
> +MODULE_LICENSE("GPL");


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

