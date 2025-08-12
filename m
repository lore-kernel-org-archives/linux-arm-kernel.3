Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22096C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pIv9AKRbkc8MISxXeVoPZny7F4ALH4S067Y82mAaRs=; b=zdjb83/hjt/28EC8mamzJlb96n
	+O19jbvxRE4xKynRCkrdCxY3tkyUTI9u8jU5Z+RsBfjfpDuuUuA/OxIW6XRFpqMXGodepiQQAA4fI
	6COWpM4lobl+aYKjG5YS+vlNsqAoiP2rcVcDvFBnATqy2j7JFu+YuEu3FVspEFolZZZ+62vAVwzBz
	3xpZ30NCa884aA2O0ctE1TUaSKAsMBtCeFGUqbBz+bS0sCeTWARhqhiMZka++5qaptFoo9LLEXTXK
	vafxC3Ij3piEGyCPJOmU1xWd/uaW4GvNH+0iPJ28rhfjCObEg8WLJteOgDVdYLT3stb4LBbosQf1H
	dY++57og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ult8J-0000000BeDd-44xX;
	Tue, 12 Aug 2025 17:49:59 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulpsN-0000000B2Z2-1oVt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 14:21:20 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55cbf3ce8c1so3321814e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 07:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755008477; x=1755613277; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1pIv9AKRbkc8MISxXeVoPZny7F4ALH4S067Y82mAaRs=;
        b=p/vDW7WwSBTwCI70xIo9b8DvFn9aATNNyCQJeFfyNm/1XUrJqR+uQWEqbIXnyz8GCI
         fGU9tHSj/Q2DdltlVC5bfMbY8s3fPNehPdedoV7JAjm3FzmNfLa1tMW7lplyXwF6120U
         N6F19oA+9+ZuWrGESzl7mn+a381+G+t8XGOKTNrc3H0SJT/Do+5TQuBm1exttrbae+c5
         iRabOoCpzd4LVoOwGAnYpjufeyrHjmwi8ECFA1fjjKuYeR97L6+GOKodM5JpT6gMDnPc
         LJIdIl0kTK6qaTLhWd2aVXJb3pVQGc/jIrjAKIQJPj/PIVnjNPaAt6vaIZmlnS6jt9E4
         Cl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755008477; x=1755613277;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1pIv9AKRbkc8MISxXeVoPZny7F4ALH4S067Y82mAaRs=;
        b=mtacRczwpjkeM3CX44jH5rXl6vlw3qvtCo4xYd/KR+t6lt3FziTzD+9AeF+yKgXpoP
         OXyrGnjjlpyZhJMptVSZumqCQpOl/rMV8By39VtHdJGqNGYs+0/R8hf/lgW3yDU48BhY
         8oAJk3GOHXQhNpvuOff//78kEtNDLaRGdJP3n/mXnmMiQHX0RbO5q/UOIIDaFN9vVXC/
         Za4uuxOP66BYPRkG/D/YvgD2iTzR6A1eq/OYluJpHcLMENOtL3U84iLJSHcUR2E8chMH
         93XIgFgUfDDwjE72yT5EZ7J8uKL82Q8vE+esYn/sDB8xb6llKAD5hgG3vioTeM83W4A4
         Qeow==
X-Forwarded-Encrypted: i=1; AJvYcCWqtsIPN2PssFh0IeHeqMyhMaCTfZzPuE6LHUxN8AfOORE7tb4XRKzwN0n9igpZ9/qHjUhpbuXdnuswp7/T3/xb@lists.infradead.org
X-Gm-Message-State: AOJu0YyeiCWc9VE17Cdcs7XRb2YzCWLsdjJ2/Gk0Il5u7pxWHx9CPujY
	CzMio7bTgE4j6Bv0N3rCgoR14UchgmyZpLa6qejQ5SliW8Pto9/Oi/DIXx5ubazUKDYBONQq6wJ
	3Pq59Dd0gHUkszr6/4V6MCw6r5yQHFTTCdiQiG4Zypg==
X-Gm-Gg: ASbGncs6XtrT9/5f5Ih0kjbWNtL9Uqni/1GsLHr4MgBaLeOFnDzSt/hK2DPYD6SwF4c
	mqCcl9USkBKH1Or7F3pZ7LYMCkzMNGDFySQ2HobIYElcB6gxuGNrrtMRucF8zwefMHovlS7z1mu
	KudQwEPDnemoMJPB7lsTThG3Ql6/FmbkUbVDzZWOk0y7O5uylheI/vf2be825nvHq0RUQ/p6Pn4
	S+Nsg9anJOyG5PcXjFH7VwFTdbxLd6vUd/09PHHj/7tmUM=
X-Google-Smtp-Source: AGHT+IFpF97gii6lher4rE+Sc7yp8gRIDiPYexKTadETndnmLkjhegMyhbbEFCVjEnmVLwNTmnfVhhtavmnpc1sTYHY=
X-Received: by 2002:a05:6512:15a7:b0:55c:bfe7:f056 with SMTP id
 2adb3069b0e04-55cd759716emr1203480e87.18.1755008477463; Tue, 12 Aug 2025
 07:21:17 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Aug 2025 10:21:16 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Aug 2025 10:21:16 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <22b3847fd0011024c10aff48f1e5223894ce718a.1754996033.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
References: <cover.1754996033.git.christophe.leroy@csgroup.eu> <22b3847fd0011024c10aff48f1e5223894ce718a.1754996033.git.christophe.leroy@csgroup.eu>
Date: Tue, 12 Aug 2025 10:21:16 -0400
X-Gm-Features: Ac12FXwYayzSV7JbaH60c8JY_pypspfPypyhh9tZpmA_WhfNTdKcELAccenZyWo
Message-ID: <CAMRc=Mce3LHtCUd-oO3uZjVAS-fywn86Zn+qmehZPJTKLzk6Sg@mail.gmail.com>
Subject: Re: [PATCH 3/4] soc: fsl: qe: Add support of IRQ in QE GPIO
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_072119_471015_36DE71FE 
X-CRM114-Status: GOOD (  24.41  )
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

On Tue, 12 Aug 2025 13:02:53 +0200, Christophe Leroy
<christophe.leroy@csgroup.eu> said:
> In the QE, a few GPIOs are IRQ capable. Similarly to
> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
> GPIO"), add IRQ support to QE GPIO.
>
> Add property 'fsl,qe-gpio-irq-mask' similar to
> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>
> Here is an exemple for port B of mpc8323 which has IRQs for
> GPIOs PB7, PB9, PB25 and PB27.
>
> 	qe_pio_b: gpio-controller@1418 {
> 		#gpio-cells = <2>;
> 		compatible = "fsl,mpc8323-qe-pario-bank";
> 		reg = <0x1418 0x18>;
> 		interrupts = <4 5 6 7>;
> 		fsl,qe-gpio-irq-mask = <0x01400050>;
> 		interrupt-parent = <&qepic>;
> 		gpio-controller;
> 	};
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/soc/fsl/qe/gpio.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
> index b502377193192..59145652ad850 100644
> --- a/drivers/soc/fsl/qe/gpio.c
> +++ b/drivers/soc/fsl/qe/gpio.c
> @@ -13,6 +13,7 @@
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> +#include <linux/of_irq.h>
>  #include <linux/gpio/legacy-of-mm-gpiochip.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/driver.h>
> @@ -32,6 +33,8 @@ struct qe_gpio_chip {
>
>  	/* saved_regs used to restore dedicated functions */
>  	struct qe_pio_regs saved_regs;
> +
> +	int irq[32];
>  };
>
>  static void qe_gpio_save_regs(struct of_mm_gpio_chip *mm_gc)
> @@ -141,6 +144,13 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>  	return 0;
>  }
>
> +static int qe_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
> +
> +	return qe_gc->irq[gpio] ? : -ENXIO;
> +}
> +
>  struct qe_pin {
>  	/*
>  	 * The qe_gpio_chip name is unfortunate, we should change that to
> @@ -304,6 +314,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
>  	struct qe_gpio_chip *qe_gc;
>  	struct of_mm_gpio_chip *mm_gc;
>  	struct gpio_chip *gc;
> +	u32 mask;
>
>  	qe_gc = kzalloc(sizeof(*qe_gc), GFP_KERNEL);
>  	if (!qe_gc) {
> @@ -313,6 +324,14 @@ static int qe_gpio_probe(struct platform_device *ofdev)
>
>  	spin_lock_init(&qe_gc->lock);
>
> +	if (!of_property_read_u32(np, "fsl,qe-gpio-irq-mask", &mask)) {

AFAICT: you can drop the of.h include and just use
device_property_present() here.

> +		int i, j;
> +
> +		for (i = 0, j = 0; i < 32; i++)
> +			if (mask & (1 << (31 - i)))
> +				qe_gc->irq[i] = irq_of_parse_and_map(np, j++);
> +	}
> +
>  	mm_gc = &qe_gc->mm_gc;
>  	gc = &mm_gc->gc;
>
> @@ -323,6 +342,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
>  	gc->get = qe_gpio_get;
>  	gc->set = qe_gpio_set;
>  	gc->set_multiple = qe_gpio_set_multiple;
> +	gc->to_irq = qe_gpio_to_irq;
>
>  	ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
>  	if (!ret)
> --
> 2.49.0
>
>

Bart

