Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A0DD690E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 07:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kqh1KNqKnunsDJjpBDg96FW+lRvbuxgoy5i/G9dtrM=; b=tDa5W31fbayjHnqRi5jWH0RJ35
	MrjMIiEqiuQlA0Th06eXCuYusMyQbPgELsqZYfa72iCwuSg350ESGcSE9LSqFwvCBDk+SmqoVbXIv
	xpNquh1m6Esx3imuK/trGEjWWEh4lLtbgMaDq8ZAaM3ffnyZuWDmhNk+jLLt7dNzJFagSirlhQlhk
	WZzoVJEPlDvG0+aAoBlTxuH05LMZJsroA8WlRXT/V6NtLipS1BeqSsmkFWGfl05cFmVdgSc16QX8U
	45NPx0P9rnFKrSydDAeG4AfzC1t+4cKgG3DJY9TDwLhsKO5WX1QjGw71Fy1fVQltOAnlNOK2gg4wx
	zfjuhEOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGYwN-0000000Esb6-05Xl;
	Thu, 28 Nov 2024 07:27:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGYvO-0000000EsUU-2qKB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 07:26:55 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-434a2033562so4247445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 23:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732778812; x=1733383612; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8kqh1KNqKnunsDJjpBDg96FW+lRvbuxgoy5i/G9dtrM=;
        b=ZEWigTpqXJ7cQd7wnxWua0hj6ZLZl1wM4r93bmNZcPpTwqwGzE3mBFt2N4UD5ld+lI
         +6m0IYDZ8mTu2mibix8xMjOu0Q7eLTl4QtUc5yzlYKPil759Ci+wnZMQOXFyJkXB1bRt
         +hbYAoi0FcWZ4X1M0g7BJ2Vwjjw0ZnCxB/+zOo31rr1OI/Ck1jK3FqrKGpBiWGkKBJuu
         MnYzBcKUGt8Sln1KtsKa55txwQpj/fg4vKoPqxj/4gkG8zNnboTYONRq3aVj8FAnK6hO
         pF5JouoBXQflXNTpnw88uOUU9a9ak8pSZBiCQw23xckO2KuxjvStjc1xAIeUJxs6J58/
         Lp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732778812; x=1733383612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kqh1KNqKnunsDJjpBDg96FW+lRvbuxgoy5i/G9dtrM=;
        b=Qiyr+cjPdGWVZ3MD7VBXfyYC6wKgq4sDy9Ygo7sWvCgpyy9n3RQQ+qli3WQscdvALW
         xllppZJgWb/yuahmj5qB6QTSa5Z7Hi/zCztxB5eR/miipOVU3V0VEwA/+/bL0gtpPGC4
         N35aM8sTrq7KffdsQV03wOKTUWWrqQ9jNR7Sy7kS4K5+CwWPhxph42oXyGLQxCO5dt0j
         mSnV054nd4DRbq/M3fOk/WFVi1GvCoru6iimqyzjtaVkjhgDEbtP4K7puGHgcFcPE4jC
         57Is++VxawASOISPum4ZfhyzoJ0a0ObKWK0PLdeSOpaHvU6uENo/UDy6glp7VsJBtBGC
         wpTw==
X-Forwarded-Encrypted: i=1; AJvYcCXK+LXHCPVhTSs4Z1nJwqbnr+hYTT4YVU/dMY2kXpJmpeNqFpZykaBu3WcYhKtHgF4Z9rd/aTrKb2Gq1ZwgQ1v6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg2wDrgUczL5ZI+h6dNX1FtsyEgmOa+a+Y9RVND0m339oTLaBa
	A5TV23jt8QlVnAQOxSMMR24LONnbFJ1UCL7k/lK+mG5IrjNUFso703V/6O3QS24=
X-Gm-Gg: ASbGncvEOYYOfwbJF+V3WmUFcwOFZh9y4sDSqgnFMIwzZW5MJ6geV7OA/Rq+AUWGShR
	EFHJLH1J8dXpVN0Y/VaXq1yoVMZSYrgnDrCsVNy4Qbrm6FtY5t/NQJQJL4u6Bz8CluvFDEmT3S2
	litAHl5JeQxpSuG7NYjBWS9Jt/gwK8JxpgF+Up6FmNw4iZAH7N9vrhtCxXl3BpBudz/kNCBMENJ
	bIbdwRGjzLDOXmXddNVdfk8c+7sFZfS4CmEMHnb8lMI+NgaoGrSwxK5nZw=
X-Google-Smtp-Source: AGHT+IFLv++oJgv9Qwh3wkymj9ZOpRIqdb0ylXRtmM787YQXfSehzvlY/3Z1EYVe5oEXo8L0YnB7qg==
X-Received: by 2002:a05:600c:458b:b0:434:a924:44e9 with SMTP id 5b1f17b1804b1-434a9dcfedfmr57606425e9.15.1732778812529;
        Wed, 27 Nov 2024 23:26:52 -0800 (PST)
Received: from [192.168.0.190] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7d26b5sm43808615e9.35.2024.11.27.23.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 23:26:52 -0800 (PST)
Message-ID: <e9d6831a-d0ef-440c-b235-fec18048deed@linaro.org>
Date: Thu, 28 Nov 2024 09:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: at91-sama5d2_adc: Fix use-after-free in
 sama5d2_adc driver
To: Pei Xiao <xiaopei01@kylinos.cn>, jic23@kernel.org, lars@metafoo.de,
 nicolas.ferre@microchip.com, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alexandre.belloni@bootlin.com
References: <1c67249dbc78678c451a155c04ef908627da6d1a.1732776187.git.xiaopei01@kylinos.cn>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <1c67249dbc78678c451a155c04ef908627da6d1a.1732776187.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_232654_731684_70F9B877 
X-CRM114-Status: GOOD (  17.58  )
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

Hello,

On 11/28/24 08:45, Pei Xiao wrote:
> at91_adc_interrupt can call at91_adc_touch_data_handler function
> to start the work by schedule_work(&st->touch_st.workq).
> 
> If we remove the module which will call at91_adc_remove to
> make cleanup, it will free indio_dev through iio_device_unregister
> while the work mentioned above will be used. The sequence of operations
> that may lead to a UAF bug is as follows:
> 
> CPU0                                      CPU1
> 
>                                      | at91_adc_workq_handler
> at91_adc_remove                      |
> iio_device_unregister(indio_dev)     |
> device_release                       |
> //free indio_dev                     |
>                                      | iio_push_to_buffers(indio_dev)
>                                      | //use indio_dev
> 
> Fix it by ensuring that the work is canceled before proceeding with
> the cleanup in at91_adc_remove.
> 
> Fixes: 27e177190891 ("iio:adc:at91_adc8xx: introduce new atmel adc driver")

I believe that the commit that introduced the workqueue is different
than the one you tagged here.

With that changed,

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>

> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/iio/adc/at91-sama5d2_adc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
> index 8e5aaf15a921..4ba52b500054 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -2491,6 +2491,7 @@ static void at91_adc_remove(struct platform_device *pdev)
>  	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
>  	struct at91_adc_state *st = iio_priv(indio_dev);
>  
> +	cancel_work_sync(&st->touch_st.workq);
>  	iio_device_unregister(indio_dev);
>  
>  	at91_adc_dma_disable(st);


