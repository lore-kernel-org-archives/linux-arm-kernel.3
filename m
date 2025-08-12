Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485E5C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMY/csa2U5fal/bu+jvHfhppLjeOUw06LSvQ98vCN+Y=; b=u1yzIyiOIIMdmBu1ojIbz3efke
	mIZsgwhNRYvlopxai/Jl3zp4C4vnAnsYkSw8tsRvh/tolLaSf2LnpmHDsMxWSG7ykGXboa/7PgiRn
	ex6LRXrTSEr3Yi2AgNs6xERLKJedC0s+ij0H+pdpCXbIQgnW5tI2ORQvBdh1nhx2BzkoZsrbNONli
	BBBkaaoZj16Sbv45hQmyMXtPMh5pi7VrQLHNLWqiCZKs0WaYkMEDW9SVsw6TyzdWdTTzn0NXcHtN+
	qjau+Tt3aI4B+S29aXEvJiA7ZSvO5o7MKUfQiPuU6QPlgZCPtUEwE27f9k7nAZZygLgmT7gcvHU7K
	LkPCL5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ult5o-0000000Be2f-0JmQ;
	Tue, 12 Aug 2025 17:47:24 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulprM-0000000B2Km-3LCH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 14:20:17 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55ba26abd62so6152535e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 07:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755008415; x=1755613215; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zMY/csa2U5fal/bu+jvHfhppLjeOUw06LSvQ98vCN+Y=;
        b=WGN8xDh2xnhZRU9sPTXOx1agaj6XlwokSDgLLUJGOfhaiZblyI8FVPtFpJeE0unGft
         1i2p6ZXqfUBkAPj1bXAPiWmxkPCjPXQobw4EzzsWN5tZtskYAz3HbTavwPxF5glGbM+c
         0GVQ8I8oZUkc5CAcM0srUnSRdmu9yvam5M1Y2avlnzU40YgvRb/0Jyl/i5hC5HE4vRFw
         GWRnE1LicvEeb3hhxPg+ReaBTwRpT3T6m2OhO9v2OO2TQxPl4Wy4YdqTbeB0RnDHKTua
         35q2k5d/wBex/eYx48sH/i4tl/3cYKGQUMCbCGWLS+wkFFog/dh7p8RnkPx9ma25sb9x
         6hyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755008415; x=1755613215;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zMY/csa2U5fal/bu+jvHfhppLjeOUw06LSvQ98vCN+Y=;
        b=LhREe/r9IEjEyYlzCfVo8nHGDAORSn4Iq+xFUu1hRiINzDa/gkVXzmO/V/FhcntFAz
         bBRa0XvUKudfNu8LYYmOsLQwTCEmfQorU7gBDmZ2f4jca5PVtKQ+LjL7TimuYY98kiWJ
         VgvTBDTsYVlXOCSctJxTaI9wvfFyPigQRN8F4kjNmiqwfCyb4nC84Wji5LI/a+/sBjp2
         RRC21VcTIcho2BRRPMDdy/5piEiIwGQLoaHrf8xGnMLS0EZMtnT9rzWSt8P798fnb6SU
         TwVzL49ZtGCq7Nwbmn74mRqmmFtVgDVrgiOhQRJKfQTbLsrhU3/YLeSqv525XnnG7Er6
         mKFw==
X-Forwarded-Encrypted: i=1; AJvYcCX5Kk5Q2yzS6IpKpzUv/r8CC8sjmZRBTRQuxNAkoVMuqSh4zMnlKif+GElNv/QbWtNSyXCnd9gw+nI/X+eYjZE6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5nEXIZm39UKMeFMHDkWStse7VmOjSSraVhQn8J0cwpujzDO1h
	cKZQdoId6NPO9mknqXTZTFvI/yJ9IbQcz/DvLv9hPUAFOxkmzypQJGvP0s/6Y+rT2IBf8hRCq04
	UupjkEtupzWJHspcjmjj7ZgDp+uoldWFiI8m4UlqmaA==
X-Gm-Gg: ASbGncv9Onb8GX8n7LR23tXbE4EpPqibT/9Ii+XlNavQHxEYFtADdc7IMIu8t5h32HE
	H77CPv7AmxTHv/bes+Sjz2j19VwAmkjmv1QnbaZn926TxkYWLGzH47Y1ODe4CZbH3dKI2c20KJA
	4QCT3kev4RFOn2dzziycQuTn1RAy2FQGE8zE24g7cCw6J8OK0f9Ic99vO1vEhzi5GZuEMRcWPvs
	6HuvU5T5DivVRxZg76cRPIUCqXsF/KeKEJg
X-Google-Smtp-Source: AGHT+IHuu5wvW4QtT3XRKQhSqRyAl4ltkuZNueZbz0L47TOdCOtZKGDL/QaBXRZMyQYhkVVn0ozd5KBBIXmm6CR5nec=
X-Received: by 2002:a05:6512:1193:b0:55b:84b9:9a32 with SMTP id
 2adb3069b0e04-55cd7602a4dmr1190170e87.30.1755008414804; Tue, 12 Aug 2025
 07:20:14 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Aug 2025 10:20:14 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Aug 2025 10:20:14 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <f4d04d0c9d72d089af7490c6ce91bb4c455fbffd.1754996033.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
References: <cover.1754996033.git.christophe.leroy@csgroup.eu> <f4d04d0c9d72d089af7490c6ce91bb4c455fbffd.1754996033.git.christophe.leroy@csgroup.eu>
Date: Tue, 12 Aug 2025 10:20:14 -0400
X-Gm-Features: Ac12FXxJwAJyIiJkerY_ZMj0NVdYlnI0XD6BtSNaGx0TIql8RITghXtjTU4PQzQ
Message-ID: <CAMRc=MfkaY5AgYrOE7eVSMbkPjWj6+5XLSrFoaSDjzUWX4Dn0Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] soc: fsl: qe: Change GPIO driver to a proper platform driver
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_072016_836757_03EB1F77 
X-CRM114-Status: GOOD (  26.00  )
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

On Tue, 12 Aug 2025 13:02:52 +0200, Christophe Leroy
<christophe.leroy@csgroup.eu> said:
> In order to be able to add interrupts to the GPIOs, first change the
> QE GPIO driver to the proper platform driver in order to allow
> initialisation to be done in the right order, otherwise the GPIOs
> get added before the interrupts are registered.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/soc/fsl/qe/gpio.c | 88 +++++++++++++++++++++++----------------
>  1 file changed, 53 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
> index 8df1e8fa86a5f..b502377193192 100644
> --- a/drivers/soc/fsl/qe/gpio.c
> +++ b/drivers/soc/fsl/qe/gpio.c
> @@ -19,6 +19,7 @@
>  #include <linux/slab.h>
>  #include <linux/export.h>
>  #include <linux/property.h>
> +#include <linux/platform_device.h>
>
>  #include <soc/fsl/qe/qe.h>
>
> @@ -295,45 +296,62 @@ void qe_pin_set_gpio(struct qe_pin *qe_pin)
>  }
>  EXPORT_SYMBOL(qe_pin_set_gpio);
>
> -static int __init qe_add_gpiochips(void)
> +static int qe_gpio_probe(struct platform_device *ofdev)
>  {
> -	struct device_node *np;
> -
> -	for_each_compatible_node(np, NULL, "fsl,mpc8323-qe-pario-bank") {
> -		int ret;
> -		struct qe_gpio_chip *qe_gc;
> -		struct of_mm_gpio_chip *mm_gc;
> -		struct gpio_chip *gc;
> -
> -		qe_gc = kzalloc(sizeof(*qe_gc), GFP_KERNEL);
> -		if (!qe_gc) {
> -			ret = -ENOMEM;
> -			goto err;
> -		}
> +	struct device *dev = &ofdev->dev;
> +	struct device_node *np = dev->of_node;
> +	int ret;
> +	struct qe_gpio_chip *qe_gc;
> +	struct of_mm_gpio_chip *mm_gc;
> +	struct gpio_chip *gc;
> +
> +	qe_gc = kzalloc(sizeof(*qe_gc), GFP_KERNEL);
> +	if (!qe_gc) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
>
> -		spin_lock_init(&qe_gc->lock);
> +	spin_lock_init(&qe_gc->lock);
>
> -		mm_gc = &qe_gc->mm_gc;
> -		gc = &mm_gc->gc;
> +	mm_gc = &qe_gc->mm_gc;
> +	gc = &mm_gc->gc;
>
> -		mm_gc->save_regs = qe_gpio_save_regs;
> -		gc->ngpio = QE_PIO_PINS;
> -		gc->direction_input = qe_gpio_dir_in;
> -		gc->direction_output = qe_gpio_dir_out;
> -		gc->get = qe_gpio_get;
> -		gc->set = qe_gpio_set;
> -		gc->set_multiple = qe_gpio_set_multiple;
> +	mm_gc->save_regs = qe_gpio_save_regs;
> +	gc->ngpio = QE_PIO_PINS;
> +	gc->direction_input = qe_gpio_dir_in;
> +	gc->direction_output = qe_gpio_dir_out;
> +	gc->get = qe_gpio_get;
> +	gc->set = qe_gpio_set;
> +	gc->set_multiple = qe_gpio_set_multiple;
>
> -		ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
> -		if (ret)
> -			goto err;
> -		continue;
> +	ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);

Actually scratch my R-b, on second glance - this should now be
replaced with devm_gpiochip_add_data(). I don't see anything that
would be in the way now that it's an actuall platform device.

Bartosz

> +	if (!ret)
> +		return 0;
>  err:
> -		pr_err("%pOF: registration failed with status %d\n",
> -		       np, ret);
> -		kfree(qe_gc);
> -		/* try others anyway */
> -	}
> -	return 0;
> +	dev_err(dev, "registration failed with status %d\n", ret);
> +	kfree(qe_gc);
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id qe_gpio_match[] = {
> +	{
> +		.compatible = "fsl,mpc8323-qe-pario-bank",
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, qe_gpio_match);
> +
> +static struct platform_driver qe_gpio_driver = {
> +	.probe		= qe_gpio_probe,
> +	.driver		= {
> +		.name	= "qe-gpio",
> +		.of_match_table	= qe_gpio_match,
> +	},
> +};
> +
> +static int __init qe_gpio_init(void)
> +{
> +	return platform_driver_register(&qe_gpio_driver);
>  }
> -arch_initcall(qe_add_gpiochips);
> +arch_initcall(qe_gpio_init);
> --
> 2.49.0
>
>

