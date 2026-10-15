Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A64CCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVD6DVgrrmWtPCKZuLRYBe58wCwR82Aw5cFa3tQXsTU=; b=xpZ+WULgLckqLDSbK8rE7xUO9M
	Pmf+sSu1vK/k7roG9i3ujkq+9YWsgi+qdlE+EYkVGaW0F12Yv7XwWXWAomQkeW4t3+MJ1BNaW0bKM
	Y6Ouu/hKLMSsvDeWmJv2yzUHRqkINbnihzNbbOJw1NmrXk/nrWuAfQmz01y0pBOdLu6HhVcNmZ/2d
	ABE5heHsvXeJtagRPoinTB/EMshfx3ccDLBWHDsRllG8KMGSFVi+/sUKANABMgHgO9FGKJEyxzUJ/
	AKRiV1jhuBlYwAS9OsGYx/V8e9NpH3p7CQE7m1mydYtQpibppUFQM96kidEyDtQR1VYSuYpIcbvWr
	OXE+YMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIPp-0000000HP8K-1Y7K;
	Thu, 15 Oct 2026 10:10:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIPo-0000000HP7k-0kpI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:10:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 72EEA6022B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 10:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1271F000CB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 10:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792059023;
	bh=iVD6DVgrrmWtPCKZuLRYBe58wCwR82Aw5cFa3tQXsTU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=STR8H/kfDMSr+DWDoq48sXSduiYpF29cDZUyK7Fdcw20EHdZ/VWLhPjfrERXtda0k
	 PXafGPzINOa8Y9a3SPaTqAQWZjdj/31fGC8BnkqNY8TW5IF+P9Wk8dvXTHeedTbeO8
	 yi5/06I9GkPZ5BjXXSOuLBA0DHupRYFnp2OSgc9Gubb7Vc/yzoNmN0esApKdN1oOFN
	 qNp/XG0tWLx2SidhXAU/bdihsyyYtM5v+m4cO6i4TmYMF5qQ6gn6meXwLlmZQeIlLL
	 6QSLQ9iCMlf1isA7F9rVgEurWYpX1rc4MNYPwcasw1Z62JIE8VwDxb7Jj+YRelA+S3
	 c1Mdl2MNORU8g==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso4209699e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 03:10:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxoAz3CB6VdMdbeUS7IsOYj9TGBRiHz//82xEiVDjVdR6vao+OPWMfM/sEC9rEH2tAuJSmHlSIsc1LaN/VgYs28@lists.infradead.org
X-Gm-Message-State: AFq9FYKTpQ6L/JdPapuKkqzJilQZ127QN1gSVY9OzdxiYZBAaTBXi2mW
	JEcaQ0+ogCJmiLLl1iBWdJB1jJi87cHwFPag/D4HwieXMHPvD8MyanqeyIj4GrWjLjc+SBmyrBS
	UtdHUEVRdkdfbA9c0AIVmNJ8b9QGi9jRvn4yt1r94Hw==
X-Received: by 2002:a05:6512:3e24:b0:5bc:b091:ea4f with SMTP id
 2adb3069b0e04-5bcde8c154cmr6665182e87.38.1792059021797; Thu, 15 Oct 2026
 03:10:21 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 06:10:20 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 06:10:20 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261014204331.15383-1-jayarajdmit@gmail.com>
MIME-Version: 1.0
References: <20261014204331.15383-1-jayarajdmit@gmail.com>
Date: Thu, 15 Oct 2026 06:10:20 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mfir4zVZENbq8zJuvo8Acq3ZxUTy5E74ZzqHYVmPH8fog@mail.gmail.com>
X-Gm-Features: AclHuK-iPK_M1R-OIfN-ytjpEWR5PdRs3K3ZQbAWqipplmC2--vh1bUa1mLFQ3o
Message-ID: <CAMRc=Mfir4zVZENbq8zJuvo8Acq3ZxUTy5E74ZzqHYVmPH8fog@mail.gmail.com>
Subject: Re: [PATCH] gpio: lpc32xx: check devm_gpiochip_add_data() return value
To: Jayaraj Devaraj <jayarajdmit@gmail.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 14 Oct 2026 22:43:31 +0200, Jayaraj Devaraj
<jayarajdmit@gmail.com> said:
> lpc32xx_gpio_probe() registers each gpio chip with
> devm_gpiochip_add_data() but ignores the return value. If registering
> a chip fails, probe still returns 0, so the driver binds with a chip
> missing and no error is reported.
>
> Check the return value, print an error naming the failing chip and
> return the error code. Chips registered earlier in the loop are devm
> managed and are removed automatically on failure.
>
> Signed-off-by: Jayaraj Devaraj <jayarajdmit@gmail.com>
> ---
>  drivers/gpio/gpio-lpc32xx.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
> index 37fc54fc7385..014eb8bc70da 100644
> --- a/drivers/gpio/gpio-lpc32xx.c
> +++ b/drivers/gpio/gpio-lpc32xx.c
> @@ -510,7 +510,7 @@ static int lpc32xx_of_xlate(struct gpio_chip *gc,
>
>  static int lpc32xx_gpio_probe(struct platform_device *pdev)
>  {
> -	int i;
> +	int i, ret;
>  	void __iomem *reg_base;
>
>  	reg_base = devm_platform_ioremap_resource(pdev, 0);
> @@ -524,8 +524,12 @@ static int lpc32xx_gpio_probe(struct platform_device *pdev)
>  			lpc32xx_gpiochip[i].chip.of_gpio_n_cells = 3;
>  			lpc32xx_gpiochip[i].reg_base = reg_base;
>  		}
> -		devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
> -				  &lpc32xx_gpiochip[i]);
> +		ret = devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
> +					     &lpc32xx_gpiochip[i]);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to register gpio chip %d: %d\n", i, ret);
> +			return ret;

Please use return dev_err_probe().

Bart

> +		}
>  	}
>
>  	return 0;
> --
> 2.34.1
>
>

