Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F899C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 15:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3SyTg0NCa9lvne6z+mxZp19Z0gaaai+gw+VCvsnLk4=; b=bhTtSPqQBHOCSCES5rd/lZ65fX
	O0r7YLD7K8JhNuTie6fDUoEeL03F3SX/KH2cct4uEwwEuUf3zgXpRtuQFfQrVbZLtkYbZM6bUPHpB
	SpbBKvNy1D+F8Xk3QbWvfGbnWkYqYQq+CZYPcbw2GQW5xiAf92ng/7HQqaUTGybvS2grAVYtkA4Qw
	ALaeQdhmf+2gx2+KSYqK3qnRyLFP+ae6+2+kgUB4kY+2j4HYXRS88q6KPWOKP6oUO+0hNwfOHkBFu
	WOKcxr4fJpVJRYwFBt3wKfpg1m0o/BIThb6dwy3qGowt3ZeS6ZiSqAXDO9Wcax/CQW6ci1kF/7jsk
	RnhfmNyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNcv-00000008mU5-0Tan;
	Wed, 12 Mar 2025 15:04:09 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNYa-00000008m08-2NJj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 14:59:41 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-abbb12bea54so1241319366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 07:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741791579; x=1742396379; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a3SyTg0NCa9lvne6z+mxZp19Z0gaaai+gw+VCvsnLk4=;
        b=TwztG2pmpnNJHYxxE/QYISIL84QNzXZGGB/05AKm8W4Q5lLniwhItU0e8Sy0zcI0rG
         RK/7NCPFrEMO7qZM2VI8qgSgl1sZrgiyy55vpJA/I7OHpXLMd/3mPmUMc6TgHk+hhw4X
         5i0ENB4wU2+xtLJtJOFU5IcOLsiGhSDO5+VZn0wIHr3VGt29aDlHrpx0lgi0dnzQ3bDh
         Oua0q60J+JLOj9luZXSWNItOu0xb6AJ4psFTUtsG8seoa5swEFYLAa0YPQPYrtQiFtIr
         9D3eOGyuAM6uXk4MmXztTG5jvB/fmVVgkv4cHPF/UxWbod0zvHRHV3Iq74S1VtPfgt8H
         oHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741791579; x=1742396379;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3SyTg0NCa9lvne6z+mxZp19Z0gaaai+gw+VCvsnLk4=;
        b=xRkU23VCwh/+cpzknHfGr1trxCdXtPdP0g/3OxxziLYhMlUnyxHjLQwsS6A/WJA7VB
         bQFnxRHZnMbPKQ04N1jqP/EV5Tnd814lroD62soNb6fhwk5ZblquIYuujV25+DOmtOKW
         DjCDzDafenKE/g/1Xpo7fVVQ04ccxbD4Y4d2jyw7drtNP85spaRW7IdfsI+BuiIe/tkb
         metRC0sO+kfnBy1vpvmzhP/F7V70UgluHzfBdzbe+kmOFoYF2GgFWfkgsuV/AMrZiudG
         J22L8WZNCbQT/dWDK4Xv4MnembHg8PpzqSKQ2SWhzP4/ElPJdqbTZevetVEGGHMgssqi
         Pduw==
X-Forwarded-Encrypted: i=1; AJvYcCVfnQVZy1Vu/Me/+xVYNjCY2YadU4GEZJYe7s2X8DA21ybE7/Bgi7wI7T9AqufnZM7hKZZr/QxR/lGoqMXs50aE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz92EO/oKwdScrvK1vsvcdwdGo6xC85AgVfNiL4yMvKkAJ221I9
	t0v3/eqqOblJdci6ABIrUXbIURCvtB0ocSqvbtcLYJYKKFCiYxDnGJS4xuu+l47LIrRwfdGYxy9
	FSpy36q5Js3m/vYbnFbb4hfw0xeY=
X-Gm-Gg: ASbGncuSSqGskPuWsEZZjXHua14ctlns2rklGR7cYYO7uAa8Rm046Feke/S7l6O2CB+
	qTVvt+Zzks1ZW1ZOxxc8lSsHDdRSb2TnGsvGW2VN7BjYvyb5oz8sg4sVrL+3SZEbLdskXug54a9
	B1H3zfHDOX3k16tHCfHPXvSG9Hrg==
X-Google-Smtp-Source: AGHT+IFTAmDUJKde03belOS5TpsnGBNkDmHNjKJjx3vvZcaqf4MLygWUc5G7PDzAqFfXGdcNUzcQs/ObOp1WKsP+o/k=
X-Received: by 2002:a17:907:a0c8:b0:abf:497d:a23d with SMTP id
 a640c23a62f3a-ac252ed8d17mr2752406566b.53.1741791578586; Wed, 12 Mar 2025
 07:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250310143450.8276-1-linux.amoon@gmail.com> <20250310143450.8276-5-linux.amoon@gmail.com>
 <25fa661b-98e4-468b-bb4d-4a2c95f32b71@kernel.org>
In-Reply-To: <25fa661b-98e4-468b-bb4d-4a2c95f32b71@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 12 Mar 2025 20:29:19 +0530
X-Gm-Features: AQ5f1JpuXbrfqSfBZqHZuJa8hQ7PpVO1Aj4Wg9PCbJZj7yO22_n9i_FjkfaFgs4
Message-ID: <CANAwSgTeZ83oqatrsWQxT+4RYwEtEqma=R4XX_iGrP2N=phz9Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] drivers/thermal/exymos: Use guard notation when
 acquiring mutex
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_075940_604436_2477E182 
X-CRM114-Status: GOOD (  30.27  )
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

Hi Krzysztof,

Thanks for your review comments.

On Tue, 11 Mar 2025 at 23:00, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 10/03/2025 15:34, Anand Moon wrote:
> > Using guard notation makes the code more compact and error handling
> > more robust by ensuring that mutexes are released in all code paths
> > when control leaves critical section.
> >
>
> Subject: typo, exynos
Ok.
>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v4: used DEFINE_GUARD macro to guard exynos_tmu_data structure.
> >     However, incorporating guard(exynos_tmu_data)(data); results
> >     in a recursive deadlock with the mutex during initialization, as this
> >     data structure is common to all the code configurations of Exynos TMU
> > v3: New patch
>
> If you ever use cleanup or guards, you must build your code with recent
> clang and W=1. Failure to do so means you ask reviewers manually to spot
> issues not visible in the context, instead of using tools. It's a NAK
> for me.
 Ok, I will check this next time before submitting the changes.
>
> > ---
> >  drivers/thermal/samsung/exynos_tmu.c | 25 +++++++++++--------------
> >  1 file changed, 11 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> > index a71cde0a4b17e..85f88c5e0f11c 100644
> > --- a/drivers/thermal/samsung/exynos_tmu.c
> > +++ b/drivers/thermal/samsung/exynos_tmu.c
> > @@ -12,6 +12,7 @@
> >   */
> >
> >  #include <linux/clk.h>
> > +#include <linux/cleanup.h>
> >  #include <linux/io.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/module.h>
> > @@ -199,6 +200,9 @@ struct exynos_tmu_data {
> >       void (*tmu_clear_irqs)(struct exynos_tmu_data *data);
> >  };
> >
> > +DEFINE_GUARD(exynos_tmu_data, struct exynos_tmu_data *,
>
> I do not understand why do you need custom guard.

I thought this should add a global guard to exynos_tmu_data using
mutex_lock and mutex_unlock.
I'll drop this if it turns out to be unnecessary.
>
> > +          mutex_lock(&_T->lock), mutex_unlock(&_T->lock))
> > +
> >  /*
> >   * TMU treats temperature as a mapped temperature code.
> >   * The temperature is converted differently depending on the calibration type.
> > @@ -256,7 +260,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
> >       unsigned int status;
> >       int ret = 0;
> >
> > -     mutex_lock(&data->lock);
> > +     guard(mutex)(&data->lock);
>
> Which you do not use... Please don't use cleanup.h if you do not know
> it. It leads to bugs.
>
Ok, I will drop this include of cleanup.h.
>
> Best regards,
> Krzysztof

Thanks
-Anand

