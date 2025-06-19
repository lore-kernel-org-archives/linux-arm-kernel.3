Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F904C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 01:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHKGW4H7LN/JdA90Hf//Jy9UM44rzmLKYv/T1BIQf3A=; b=3d00mAIUq6L7GhmHruVGHWFJHX
	yJ1x7FbPIZg0nnEEDCz0/6bUfZbzQofAO3J9f6oJ2L9Y6GM2HID6gKn7opDLwnlwOLpGTztJgznh/
	1CoEuCE+uPHzPKvMVGaqakFKfFquTzr6ueQPwobWcQvHyVUgGtgecrH5blnxRRHAjEhAvhZkCOkkf
	xacWW0Vtnj8ytVZyyD2dj/DRdxBpCJMii2DuwjkDhoMcwU80TvJa6fFiyMjLJ25MMvP0AH4omwm7f
	d60hVhU230gRIqJ1yJd8bVkMXKkGZBOqUHbSm8xa0Q6z/0HnsujvOYpkXOVylSlikfY4JJVt99txZ
	kPZ7c7Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS3mo-0000000Bhg3-2a4Q;
	Thu, 19 Jun 2025 01:09:50 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS3kZ-0000000BhMN-2vN1;
	Thu, 19 Jun 2025 01:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750295245; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=AHKGW4H7LN/JdA90Hf//Jy9UM44rzmLKYv/T1BIQf3A=;
	b=iyFWQYdf42eDcQSAGmoiJ6NjUW0lY7j0oJoRjhaMvTe5GvCf9A8F8xiirmpI9+3vWBWjU8E0LUe0EPw6mE7zxb18tqKBMoPnA71FHEBaOt/QdnvZhmvYdFp0vAYys7nrdZ6RG+10zeM2yb3hDIsZqxzHasQWjI0MI/wvik+sXX0=
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WeFD6QU_1750295241 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 19 Jun 2025 09:07:21 +0800
Message-ID: <fd838615-d550-4e3a-9b4c-616a977fa410@linux.alibaba.com>
Date: Thu, 19 Jun 2025 09:07:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] gpio: pmic-eic-sprd: drop unneeded .set() callback
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
 <20250617-gpiochip-set-rv-gpio-v1-5-903703881fa2@linaro.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-5-903703881fa2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_180732_364131_50846FB5 
X-CRM114-Status: GOOD (  13.52  )
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



On 2025/6/17 20:24, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The lines on this chip are input-only. GPIO core can handle the missing
> .set() callback so there's no need to implement a dummy here. Drop it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   drivers/gpio/gpio-pmic-eic-sprd.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-eic-sprd.c
> index d9b228bea42eec53ba9d0d0945125f530a22946c..cb015fb5c9467484022723910354219e2c98d3c7 100644
> --- a/drivers/gpio/gpio-pmic-eic-sprd.c
> +++ b/drivers/gpio/gpio-pmic-eic-sprd.c
> @@ -109,12 +109,6 @@ static int sprd_pmic_eic_direction_input(struct gpio_chip *chip,
>   	return 0;
>   }
>   
> -static void sprd_pmic_eic_set(struct gpio_chip *chip, unsigned int offset,
> -			      int value)
> -{
> -	/* EICs are always input, nothing need to do here. */
> -}
> -
>   static int sprd_pmic_eic_set_debounce(struct gpio_chip *chip,
>   				      unsigned int offset,
>   				      unsigned int debounce)
> @@ -351,7 +345,6 @@ static int sprd_pmic_eic_probe(struct platform_device *pdev)
>   	pmic_eic->chip.request = sprd_pmic_eic_request;
>   	pmic_eic->chip.free = sprd_pmic_eic_free;
>   	pmic_eic->chip.set_config = sprd_pmic_eic_set_config;
> -	pmic_eic->chip.set = sprd_pmic_eic_set;
>   	pmic_eic->chip.get = sprd_pmic_eic_get;
>   	pmic_eic->chip.can_sleep = true;
>   
> 

