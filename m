Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F8BCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 21:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkXCtZkNS4sQ1PyXjfM/RdJFG7EoG62SuYsDVUj0IR4=; b=p+WYggSTYxF2x1dI+215pVpY79
	HSAMvuUwY//GDmBuZH4qWi6RIJJ1p1GV/o4zHWMBPTBSKkkVUL47qT7+OylgD4mJIVlO3enw4QzaO
	fj127dQFjcOLNwd0aQk7x+M6oU7CJh0kNuQ7iBn5sOApTFhl5NStvxuB89J1yIBywNvPerbLc0Pwh
	2Tvn4639MA2ujkXY82JE1qoVt8zja091+6Gsq851DFHCUJZs4JYALXun7/2yPUSWPrcUvgwD2FrSr
	ermoFrQ3S3l1Kr4S3pEaq+ye9khWyOwSS7uQhvrRxC6nrrIASex5hODVkmvzjpMtNIpYQ9OxnLtz+
	l+/Sq5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur1cu-0000000DDUf-03Rz;
	Tue, 26 Aug 2025 21:54:48 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur1Vj-0000000DCtH-1hpe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 21:47:24 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4b109914034so80474561cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 14:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756244842; x=1756849642; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XkXCtZkNS4sQ1PyXjfM/RdJFG7EoG62SuYsDVUj0IR4=;
        b=IyKaVdI5zWI0sVA6jhPz62xZ/1ER5MJTGBCLy2M9lNhl3Biuez4cThS/k9m2/6nhZ9
         w7StR7WrSVyK5pgktwvEyDx35EN3+Ak1PgeRVLH7k5apxhurZOYo7Zxs2tDi3U+5WGGh
         GRrdkbCeluy48A5GpFGGLFiDe3Hl4FwvpMBaFfpi1z2+zRvO1/cNB3ZxAHej3Q6Dn+CJ
         tlRYCQiH2UjHezrY2tS6i+EjzaoI/RBOmBLE8vSVHITQQX5SXYYwKavEfOuB3a6eCMCA
         Q9w7BFGjVmHxpvPbrYn/ZvNIWhX1upVepCIkhf6Mmt/V75oVi7aws4Pd3tQGZfI5kauJ
         p3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756244842; x=1756849642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkXCtZkNS4sQ1PyXjfM/RdJFG7EoG62SuYsDVUj0IR4=;
        b=DcxJ4jrLGtig3utMuJsE0Nq/IiigOjkJBhadbwGWtjsbu4ERAJcLB2yqSd3hWXbxXP
         IWfBN4HECWcKH2hGiCL81QpJ0nRkTaeQBLc56Dej9foLOyJ23MeCCppJx6Y5jMGqtlGN
         CvgxzqPxTsRewUlRSy8/zOOEyF10hMGZ2GM4k9je0mBn6IqXk69YvvyJYHl7AVGtxlKS
         WbC5IG8irB3DRv4O8tCQ3yRbqUYw5QsM9lZqJPeXCGmApQ2C3RhUIruPxVcvtwwtsaH3
         SOZs+S49Gh6CJHBgHPbotIOmTVqCHiReviKruuhDUNFI+rC6vyq4umNpyh+0SktlAirG
         /4/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXW0cF5umitAsQnc7PKJA0fIfPgKUL0XF8cIVSt7kDbRJHgTNIbqq2rb+K7OeJjEWvbxGHc1EQOZ6T734XI3Pcz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Hd+8NqElIihp0OIita/X5cbXelNoYQUUYUYxlIG1A8/6+Wx9
	2MaDjSDvB/Nr0Df4KsLAOmQH9w2NmB8NUn81o1DbdHrwl9Hp+x2Jdamo
X-Gm-Gg: ASbGnctv2gzYlBFOYZYOPT7Nr8X+XFHzJ7PvCYsjlQmeMEw7E+ehLL8XBHf/l7MRe1B
	9ZydUm4Pp1pnH8N9F/+N8iTEBaDsVnBn7uXixJSAHVWv8ZCngbtx0j6dsiDWq/ix4eI0rRL+i83
	sKy5dLNLMeYTsQNfg9Mk8wiP14oj3zJ0W2Ncay1U7w1xef18EoK5DPKI9Efe+y3n1afvnXa2b1P
	BZEuB4bUsIbuRZGQjsYXkwgrVx7DB1Kvf8WoWh3oyH+OHMlgMuLZRiowtu4FNpvV74aj4AfFk+O
	gAYTVqw9qpGR4tOIvemvzkI+V354LOtpJlEjyrCGMqXWQua8O5+4wguxryX84EQiS51Y0XjfOrt
	9R7U7dmYrovPvnpVdAvh3otSsv/LzjtffxLlPON7+cba390pp
X-Google-Smtp-Source: AGHT+IH/4BueP1i9uTaGBcioRqKWdWlLPnxhgjhYg/TT045qxzwvPNCGSAOghSI6A+lqXYcoj0Z8VQ==
X-Received: by 2002:ac8:5f4d:0:b0:4b1:dd3:e397 with SMTP id d75a77b69052e-4b2aab56bacmr177029521cf.62.1756244841768;
        Tue, 26 Aug 2025 14:47:21 -0700 (PDT)
Received: from [10.69.40.168] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8de5d37sm77448621cf.34.2025.08.26.14.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 14:47:21 -0700 (PDT)
Message-ID: <e9aa8a07-4ed7-4a7f-a69a-ce496ede48cc@gmail.com>
Date: Tue, 26 Aug 2025 14:47:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] gpio: brcmstb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>,
 Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>,
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux@ew.tq-group.com
References: <20250820154037.22228-1-jszhang@kernel.org>
 <20250820154037.22228-3-jszhang@kernel.org>
Content-Language: en-US
From: Doug Berger <opendmb@gmail.com>
In-Reply-To: <20250820154037.22228-3-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_144723_453634_B9A69F3D 
X-CRM114-Status: GOOD (  23.35  )
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

On 8/20/2025 8:40 AM, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   drivers/gpio/gpio-brcmstb.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index e29a9589b3cc..0ca3e0d8aa46 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -534,7 +534,6 @@ static void brcmstb_gpio_shutdown(struct platform_device *pdev)
>   	brcmstb_gpio_quiesce(&pdev->dev, false);
>   }
>   
> -#ifdef CONFIG_PM_SLEEP
>   static void brcmstb_gpio_bank_restore(struct brcmstb_gpio_priv *priv,
>   				      struct brcmstb_gpio_bank *bank)
>   {
> @@ -573,14 +572,9 @@ static int brcmstb_gpio_resume(struct device *dev)
>   	return 0;
>   }
>   
> -#else
> -#define brcmstb_gpio_suspend	NULL
> -#define brcmstb_gpio_resume	NULL
> -#endif /* CONFIG_PM_SLEEP */
> -
>   static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
> -	.suspend_noirq	= brcmstb_gpio_suspend,
> -	.resume_noirq = brcmstb_gpio_resume,
> +	.suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend),
> +	.resume_noirq = pm_sleep_ptr(brcmstb_gpio_resume),
>   };
>   
>   static int brcmstb_gpio_probe(struct platform_device *pdev)
> @@ -747,7 +741,7 @@ static struct platform_driver brcmstb_gpio_driver = {
>   	.driver = {
>   		.name = "brcmstb-gpio",
>   		.of_match_table = brcmstb_gpio_of_match,
> -		.pm = &brcmstb_gpio_pm_ops,
> +		.pm = pm_sleep_ptr(&brcmstb_gpio_pm_ops),
>   	},
>   	.probe = brcmstb_gpio_probe,
>   	.remove = brcmstb_gpio_remove,

Acked-by: Doug Berger <opendmb@gmail.com>

