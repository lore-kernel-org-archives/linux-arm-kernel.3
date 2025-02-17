Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53813C021A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPeqxV3v8H4g+Vxay8XkZcl1XNuYQ+5vEQ3ndyeG8ww=; b=eDw/5T97+7L4tQm4XLKkWl303z
	Yaf3TMW0lpZ3g3AVVv8ZyyO9nHGwRroC0vHZy5XU3gxcrkRpO2AEg9XWyMp1DU0e4opSHHltO/6Pk
	Ewpt+SJWC9XHeXkRehLJXyVZiE79H+LKiPV+17W+pOGupXAERJtDi+OjXBhJLwX9zYKjsqPU9Qjyq
	H1moBN531P68Am15oIQCXGKEpKAykV0YI2WuqyYq48/gRGMAWmxqw/OcGrKDhvRQ5ACvMVwK6ig/4
	n7kQDnofFw3KU9tNjZ6MalW7POs4fKBhzL/SG6rQncO/bghh3JQGyp+TR6bzGTsgceOs6DguET+4T
	Xb1eDhOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjylV-00000004CGn-0HRS;
	Mon, 17 Feb 2025 10:54:17 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyUQ-000000048Mm-1Cd0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:36:39 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5deb1266031so7332790a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 02:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739788596; x=1740393396; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TPeqxV3v8H4g+Vxay8XkZcl1XNuYQ+5vEQ3ndyeG8ww=;
        b=lXwSqhuP65RlzvjshC2IZ9RTH6zy/yrnRAOTiHZoemmAQ2enUd23NbfUW9LEpmBSPi
         Dbxj912sVbiKObY6pBpO9/tnjbaX4JDZTn5kqZesKCzMLFoGbK43Dtx0kab65L6HPvIc
         Rw7MA6vCGgGLAC3isKXB/X7nBVek1dKfm/AkVHQYcVqnr04SUUJvR/coNyzbEE16g3Ji
         2H9ZENTPhnPAQrY2Zyzohanea0GDwndnHbI0Nzfagy6ju0M2F02L2QCrtmOvgxScPlMX
         3XgM/ViGeL4swaWLRPxZv+awiWono+E0aok5caGJqhXyfh3j8UgY/aPB2uGj72sVEwWJ
         //lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788596; x=1740393396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPeqxV3v8H4g+Vxay8XkZcl1XNuYQ+5vEQ3ndyeG8ww=;
        b=p+jKPNWIN8rSaLr6B8IHVgd7wjysEraSICELqEVZwmU0LwzmVWbQtPTnfNjbrfPKp0
         tPkdg8cy7KYfQYSwLr9feSK4fnEsrmp/xgscUw6pXajPZ7lk9DaSWQTVbzBfYXiBYYfd
         tj1LIalUWrQCPbtYxhHdZWXY7Dd0bXdsuGonR3WbrL9bG4K4GqLpHxXv8gIs3e25i2C4
         lKq3r9PXb/IBoiIjb5oI85er1CN2AJB3SB1ogH8SSqt0OVsb66mF2fKqUAoPJJLJe/Bz
         mAMaPieR4yWHRzU2gm36yXX5+93hgL4dJaFp6wiKiCsqGCP0D3onxXsiJTNd9XaEx0bW
         rXZg==
X-Forwarded-Encrypted: i=1; AJvYcCWMC+6zPBmFrluBz06qbC82jusqDxwtITBwSI5hZAYkckGEY6gtwM5VggSVhtzpMRANI99BGSjojWlpoFc4nN5Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk1UAE91OiYjNqDmwZzYJOKPr9BvZIYIigKf0qL+t5XCADaf+o
	Rt8xnwhDa3moYLyTpWOFi1y05Uw7k9W2379wW2ai9t2JjaO7+i/Mj8cpLKN5UUU=
X-Gm-Gg: ASbGnctm7G5ZxJI54wQ3v25dVG61v09SY64tzwbVU+xbS4Lsmx1CUPzt4A2+4GNcHHY
	4ogLd1EN3f0V/OJQhlRLRUx1eemN+EiNwlbGHBIr4mcbjtrZ7rv1+Ak8vpg6GchrUy4lkPYcByk
	TUIHZQf/Z+RZVhcAvqJgOzDvWSA9CGLzn8/3pgqkzcAAPBkHvVxq+s2ojMmmPmR6kg5DbuI7Ygt
	j6dLJGYRzpZNe4xR6oEf2w0p656ubRLi7yf6yClke/vx3R8mh0IQZ6Cnan6YqQ4W7IMtNxCJ7y1
	dvg/8lwQqNBQfuQSeQE+eUre
X-Google-Smtp-Source: AGHT+IHZ274Des1ePN4oUbKhdVm0Vo5N1Xho1JI8Us9w6PhLudWtJ/YtQif5hVEJjAu8oDNIqvcsnQ==
X-Received: by 2002:a17:907:784b:b0:ab7:c6a2:7a43 with SMTP id a640c23a62f3a-abb70b7c310mr839740066b.31.1739788596142;
        Mon, 17 Feb 2025 02:36:36 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8190d15esm388729366b.16.2025.02.17.02.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 02:36:35 -0800 (PST)
Message-ID: <2d3b8404-81cd-44fd-905d-2e6e0b0ceab1@linaro.org>
Date: Mon, 17 Feb 2025 10:36:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] firmware: Exynos ACPM: Fix spelling mistake "Faile"
 -> "Failed"
To: Colin Ian King <colin.i.king@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250217091341.297401-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250217091341.297401-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_023638_341603_0FA9E3BC 
X-CRM114-Status: GOOD (  14.78  )
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



On 2/17/25 9:13 AM, Colin Ian King wrote:
> There is a spelling mistake in a dev_err_probe message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thanks!
> ---
>  drivers/firmware/samsung/exynos-acpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 1201380227e0..a85b2dbdd9f0 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -620,7 +620,7 @@ static int acpm_probe(struct platform_device *pdev)
>  	match_data = of_device_get_match_data(dev);
>  	if (!match_data)
>  		return dev_err_probe(dev, -EINVAL,
> -				     "Faile to get match data.\n");
> +				     "Failed to get match data.\n");
>  
>  	acpm->shmem = acpm->sram_base + match_data->initdata_base;
>  	acpm->dev = dev;


