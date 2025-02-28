Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFF7C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcOciFev494FQi+ie3YAuQXZTVFD/MHMZEBQgtl8Sq4=; b=yoYq+W6ucpG1jx35xxdDVhv30C
	4RYipcuLd2TONsiiwdrvPnib2FoyKoOrppzjef4sLa4JO/+nVqTfkvjF1BKqFz0k2ZED4Hk5tOrTg
	4M30/yq9WjBpouOPhaNdb6hFXQq0N3h3ol0g6znFB91WNswSB1I9PdxxO4xd7C/2ib97zts3izOM1
	1GLVGvuYwwiSr2uHDFG9nVe5XgAi+KQ4YtNYado5Xud0JunDMujJk2084YQq/sJOANNQbHpo68kVE
	JFt03Z/bKAYHQCXxgF1WF5sIexCMjYN6mRCngs2xw67dvvjHNAVYtYaB0H/5sXjj7mz6n2/eUQqI5
	YTDJQCGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5Sx-0000000CFGD-2WAA;
	Fri, 28 Feb 2025 18:52:07 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5Dp-0000000CBCd-2X5U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 18:36:31 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-abb892fe379so333226566b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 10:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740767788; x=1741372588; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bcOciFev494FQi+ie3YAuQXZTVFD/MHMZEBQgtl8Sq4=;
        b=lyoPJ6nP9H6IrYJ7zlFLl6orFwggiigC7Sv2snEWyg4dERfNy5mcLKTitkTViS/XX7
         rUHkGgdMlaAc3hdLDZeLkAk7IcHw5gmQziykz/Lp0kqI/Bx8UShtoed066O5AE7cjU5O
         n5txvgSWt/Qs7Bgfr0MLsjUdkb0j5D09HIoruR+0tCWZ/zAKvEFiF850GleSfG88AXMZ
         RUJAIfK/MjWl1rHl0ebHpU6YzZ+HdI2tiKyg2+qYlduOebUfboYxjYAUqMNnvmslUftT
         EfaJpzrBVo3jn4Aihpb/JswdNFjKNedt9O0HoMLHu6u0DG+wyKj6HUUyjh9yqUO4/3Eq
         A8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740767788; x=1741372588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcOciFev494FQi+ie3YAuQXZTVFD/MHMZEBQgtl8Sq4=;
        b=qRThlbDfg0aeB9XLGKuWRSTfoVHzXSkQrTg7dqbGxWxsZe/ae2MKC1aaaMFLTDv/8K
         E8G9URDNcO0LKkGOiYzwDygyG7SPmIXy9eGdrllnvcr4ithwL8s0wEWbffCQiwVa87Rk
         9Xku15APGO4LA6KT0rzctRtiToHELQHwSqT6/4jLJw56UJjuKjur/SIsYl7iBpNPcZGY
         kayGPmlFp8yWLh5vDfQAd9kWY6dhOjAf/gQJYzgXeK/gbzwKy2sV2YjfC9wSxgIKAtki
         8eVUqYVCcUlyGni/jiK6HJLkn6wegP8jbanlF1vI/CsbSC6sxS2Z9nz+RMpvjN4e73Ts
         Zyuw==
X-Forwarded-Encrypted: i=1; AJvYcCVNR4QvqDQ/ZP0nbN2sXJ+Cvf91scJt7roXup/bRElhENWox7KL1PAKn+4EUCXZMXkmioOAYQg+ktQnLxr82Pai@lists.infradead.org
X-Gm-Message-State: AOJu0YxJNVpxbKF1PVnykU8YbtR7zbfmEyq4AsypG2zh1u/hTsSKY9zk
	ESDNtKvgZHj/gNBXpiBd6i4dYkYy3R+14VWHQ74xzdxvNYNEYoKvBE+1qMLSz0DCRvORmduDU53
	UStOvRxLLiLxZy53TC/2IGvde1cI=
X-Gm-Gg: ASbGnctHOLgGwlJI690hzna9BvYymSQQDo8/koPqNgTXlrtWA1ZTNgcrFmz74XdCBh9
	G2v8yyWpzfaFNSOeF3rfB9lvLbNx0Rsf8eKEF2S/9aAr+Yi2O++XfWK3ecfgd5CY33mOgKVxCtX
	Poqep9b1s=
X-Google-Smtp-Source: AGHT+IFE3G2KjHi8I1VMEUvtVVJytNjP0/8SzMhjPmWtNq41A0r54s3RwgOnWAEJT6u1F3AfT20PzYxSV85X9vtUhfM=
X-Received: by 2002:a05:6402:51c6:b0:5dc:5ada:e0c7 with SMTP id
 4fb4d7f45d1cf-5e4d6b4c2edmr8497667a12.26.1740767787540; Fri, 28 Feb 2025
 10:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20250216195850.5352-1-linux.amoon@gmail.com> <20250216195850.5352-5-linux.amoon@gmail.com>
 <f44efd1a-1f6e-456d-9395-de2a55ef2279@arm.com>
In-Reply-To: <f44efd1a-1f6e-456d-9395-de2a55ef2279@arm.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 1 Mar 2025 00:06:10 +0530
X-Gm-Features: AQ5f1JrCuLXPNSAWoUTKE1NaVm2ihsuQ5JSDdwiiFIEGBSN_Yr_bdvM8NVPBMWc
Message-ID: <CANAwSgTpV_kGFEU-ND0N+OEtT6+j4ceq37xAoLyC7iHPWAuLjg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drivers/thermal/exymos: Use guard notation when
 acquiring mutex
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, Zhang Rui <rui.zhang@intel.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_103629_642184_D0C5438D 
X-CRM114-Status: GOOD (  24.43  )
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

Hi Lukasz,

On Fri, 28 Feb 2025 at 22:58, Lukasz Luba <lukasz.luba@arm.com> wrote:
>
>
>
> On 2/16/25 19:58, Anand Moon wrote:
> > Using guard notation makes the code more compact and error handling
> > more robust by ensuring that mutexes are released in all code paths
> > when control leaves critical section.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v3: new patch
> > ---
> >   drivers/thermal/samsung/exynos_tmu.c | 21 +++++++--------------
> >   1 file changed, 7 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> > index fe090c1a93ab..a34ba3858d64 100644
> > --- a/drivers/thermal/samsung/exynos_tmu.c
> > +++ b/drivers/thermal/samsung/exynos_tmu.c
> > @@ -256,7 +256,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
> >       unsigned int status;
> >       int ret = 0;
> >
> > -     mutex_lock(&data->lock);
> > +     guard(mutex)(&data->lock);
> >       clk_enable(data->clk);
> >       clk_enable(data->clk_sec);
> >
> > @@ -270,7 +270,6 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
> >
> >       clk_disable(data->clk_sec);
> >       clk_disable(data->clk);
> > -     mutex_unlock(&data->lock);
> >
> >       return ret;
> >   }
> > @@ -292,13 +291,12 @@ static int exynos_thermal_zone_configure(struct platform_device *pdev)
> >               return ret;
> >       }
> >
> > -     mutex_lock(&data->lock);
> > +     guard(mutex)(&data->lock);
> >       clk_enable(data->clk);
> >
> >       data->tmu_set_crit_temp(data, temp / MCELSIUS);
> >
> >       clk_disable(data->clk);
> > -     mutex_unlock(&data->lock);
> >
> >       return 0;
> >   }
> > @@ -325,12 +323,11 @@ static void exynos_tmu_control(struct platform_device *pdev, bool on)
> >   {
> >       struct exynos_tmu_data *data = platform_get_drvdata(pdev);
> >
> > -     mutex_lock(&data->lock);
> > +     guard(mutex)(&data->lock);
> >       clk_enable(data->clk);
> >       data->tmu_control(pdev, on);
> >       data->enabled = on;
> >       clk_disable(data->clk);
> > -     mutex_unlock(&data->lock);
> >   }
> >
> >   static void exynos_tmu_update_bit(struct exynos_tmu_data *data, int reg_off,
> > @@ -645,7 +642,7 @@ static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
> >                */
> >               return -EAGAIN;
> >
> > -     mutex_lock(&data->lock);
> > +     guard(mutex)(&data->lock);
> >       clk_enable(data->clk);
> >
> >       value = data->tmu_read(data);
> > @@ -655,7 +652,6 @@ static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
> >               *temp = code_to_temp(data, value) * MCELSIUS;
> >
> >       clk_disable(data->clk);
> > -     mutex_unlock(&data->lock);
> >
> >       return ret;
> >   }
> > @@ -720,11 +716,10 @@ static int exynos_tmu_set_emulation(struct thermal_zone_device *tz, int temp)
> >       if (temp && temp < MCELSIUS)
> >               goto out;
> >
> > -     mutex_lock(&data->lock);
> > +     guard(mutex)(&data->lock);
> >       clk_enable(data->clk);
> >       data->tmu_set_emulation(data, temp);
> >       clk_disable(data->clk);
> > -     mutex_unlock(&data->lock);
> >       return 0;
> >   out:
> >       return ret;
> > @@ -760,14 +755,13 @@ static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
> >
> >       thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
> >
> > -     mutex_lock(&data->lock);
> > +     guard(mutex)(&data->lock);
> >       clk_enable(data->clk);
> >
> >       /* TODO: take action based on particular interrupt */
> >       data->tmu_clear_irqs(data);
> >
> >       clk_disable(data->clk);
> > -     mutex_unlock(&data->lock);
> >
> >       return IRQ_HANDLED;
> >   }
> > @@ -987,7 +981,7 @@ static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
> >   {
> >       struct exynos_tmu_data *data = thermal_zone_device_priv(tz);
> >
> > -     mutex_lock(&data->lock);
> > +     guard(mutex)(&data->lock);
> >       clk_enable(data->clk);
> >
> >       if (low > INT_MIN)
> > @@ -1000,7 +994,6 @@ static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
> >               data->tmu_disable_high(data);
> >
> >       clk_disable(data->clk);
> > -     mutex_unlock(&data->lock);
> >
> >       return 0;
> >   }

Thanks for your review comments.
>
> IMO you should be able to even use something like we have
> core framework:
>
> guard(thermal_zone)(tz);
>
> Your mutex name is simply 'lock' in the struct exynos_tmu_data
> so you should be able to leverage this by:
>
> guard(exynos_tmu_data)(data);
>
> Please try that.

Ok, I will check this

Thanks
-Anand

