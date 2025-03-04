Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36193C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2b/5ukyRNqmFbWc8ToNTxaJWZ+JvSrLpsvdrXtS7LA=; b=j1hN2OwJEgrGLJ2t1XMwxYde9t
	XsMTRy1B9hQkQf14eC+Mu79gydz2SgEuYvQM9yjSNh55IkS2DZxxBA4L9wuCawRSShpYrbuPoHn/g
	1gWXkSwfUGNvlSAbS2MCFfEf5X5fPrBJMplCjnOiQSgTyEk5NnoVyab7MsmUfQjeOHrBg1ojzy5dj
	MhrJzWh9Y/IOb+Qvxp1+QJdKHMdy+ZbCwlrUKaNpwahu667U0kxG2+fNnZrRaZ2ojauMITahRrQIN
	PxX/tUFMprqim3SyjjuuhA4qHYSXzfrPBNX/gfKyLKubKf52JH6XNaYfiHO71ynGlB73NsIVkBHJ7
	HLhqS8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRHg-00000004cMf-3JzG;
	Tue, 04 Mar 2025 12:22:04 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRG1-00000004c51-1nnC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 12:20:22 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-abec8b750ebso971455366b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 04:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741090819; x=1741695619; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T2b/5ukyRNqmFbWc8ToNTxaJWZ+JvSrLpsvdrXtS7LA=;
        b=AoR+AYui9zv0OydLo9oGZFkh8OZ8YLff0+RjpmYfxGRDPAcazt/gp805DwJgqFyP20
         qWalQIWriektZQIXJwzBAk8b2G6id2C6mCOy5bqQCas/cZW0opCoHUjVw4BRgrfpvoWK
         fJuBh+bfTyySpB289LRHN9s5QcPZXuD0D6QyC6xqEu+mEDLbcWRxOf63qINEXYH8O9bI
         vHW/SxdJ6ZBhiNudrNBxnfeJI2Vt84UQd9fMNztjh7rNi55EBs0KO3j4aV0vHH8QzDxY
         mpnjL/dJPmAZpjObsjk+PPEyX8UcR4hr2Xs33uCyCOcDoIvK9JFhtXuay9fpJuMTmHxl
         HyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090819; x=1741695619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2b/5ukyRNqmFbWc8ToNTxaJWZ+JvSrLpsvdrXtS7LA=;
        b=MnG+OgOSiSPw4d8t6dW75hBW4b9A676jb9HPpSDbnfzYY6qKjxxAExqYhzXA6KovdG
         Q1io4KgrvAd2lyDFdhDVcL2ZekA+HP3nN68/iQcBORk1xRKKcPFbMyS/z4VxYmjwekTf
         sykitHLCXzbk7QSDOFWZzSSVy7JXsA0+XlN6DJY6OSrxrJ33LYToaSbxYKR8HEZiZ0gr
         gaPVx+mplY6nbX9hp8OrEwNdAmR90+kyFm/KCVL43tNp1vVtkY5PWMcZSgDzTv7OVRj2
         idc+XB8/0+deJybnnN+d2hFSLOTcZ/lDYV29HNF8b3OH41fhBUcLVCDZkDoHziABD/Az
         lTXg==
X-Forwarded-Encrypted: i=1; AJvYcCVt0FeMZ6X8EYJJHtSgvIEu+w1fJHqjmMb7r1NjFVq5sjNyl2H0EmAOSE8nV/6vsB+uvBJ5WlU31P+UnTJasMD2@lists.infradead.org
X-Gm-Message-State: AOJu0YwNVK6xJvFTdk+Z7K8Ld1nlYVXqfjVoQBeNzi+lnnzI3Fhg2+uQ
	g0GbL5vcWuhlyWhorpgLMIJcJy2Mf802g0Y1toeozmRMMMtpeE+QQhlmj2VhqLWBcuYT2dOKDC1
	rQqxkAH536Yqe++W9q97xlKEC/oCs3A==
X-Gm-Gg: ASbGncswIhTxfL/W9X4abD1E6X605PHMkFn2TiudwKTYCttrcVEQykvPID1+EGfNRqn
	4LIczqqZgc40lqs2qmHDOGOSvcj1s0H6nhNbycyQEnkwVl8SWu1tk07RmCKpB11xYhPAqoNotu9
	aPNMX2tvPytfE6c496eWysHbYc2w==
X-Google-Smtp-Source: AGHT+IHkYWadWW7TaJ6Pjpkx8CZPlIqxBSv7u3JGLhQgehyVgUtS6n03IifPBFz9R3q6GPUl2gY1BtIeWq8xfJUg8Uk=
X-Received: by 2002:a17:907:6d02:b0:abf:7a80:1a7e with SMTP id
 a640c23a62f3a-abf7a8020bbmr787792166b.9.1741090818886; Tue, 04 Mar 2025
 04:20:18 -0800 (PST)
MIME-Version: 1.0
References: <20250216195850.5352-1-linux.amoon@gmail.com> <20250216195850.5352-5-linux.amoon@gmail.com>
 <f44efd1a-1f6e-456d-9395-de2a55ef2279@arm.com> <CANAwSgTpV_kGFEU-ND0N+OEtT6+j4ceq37xAoLyC7iHPWAuLjg@mail.gmail.com>
In-Reply-To: <CANAwSgTpV_kGFEU-ND0N+OEtT6+j4ceq37xAoLyC7iHPWAuLjg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 4 Mar 2025 17:50:01 +0530
X-Gm-Features: AQ5f1JpX0iWefCe0V27iOMVW62tgPomNaHMGwjJbtqtjqB7h6WVwx5RmH8xbgrw
Message-ID: <CANAwSgSWf_YxSi-pzWPaRoiJx7RLrWUz+HTWx5hf+E2x1ZGmoQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250304_042021_480522_A5A7A9F1 
X-CRM114-Status: GOOD (  28.63  )
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

On Sat, 1 Mar 2025 at 00:06, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Lukasz,
>
> On Fri, 28 Feb 2025 at 22:58, Lukasz Luba <lukasz.luba@arm.com> wrote:
> >
> >
> >
> > On 2/16/25 19:58, Anand Moon wrote:
> > > Using guard notation makes the code more compact and error handling
> > > more robust by ensuring that mutexes are released in all code paths
> > > when control leaves critical section.
> > >
> > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > ---
> > > v3: new patch
> > > ---
> > >   drivers/thermal/samsung/exynos_tmu.c | 21 +++++++--------------
> > >   1 file changed, 7 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> > > index fe090c1a93ab..a34ba3858d64 100644
> > > --- a/drivers/thermal/samsung/exynos_tmu.c
> > > +++ b/drivers/thermal/samsung/exynos_tmu.c
> > > @@ -256,7 +256,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
> > >       unsigned int status;
> > >       int ret = 0;
> > >
> > > -     mutex_lock(&data->lock);
> > > +     guard(mutex)(&data->lock);
> > >       clk_enable(data->clk);
> > >       clk_enable(data->clk_sec);
> > >
> > > @@ -270,7 +270,6 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
> > >
> > >       clk_disable(data->clk_sec);
> > >       clk_disable(data->clk);
> > > -     mutex_unlock(&data->lock);
> > >
> > >       return ret;
> > >   }
> > > @@ -292,13 +291,12 @@ static int exynos_thermal_zone_configure(struct platform_device *pdev)
> > >               return ret;
> > >       }
> > >
> > > -     mutex_lock(&data->lock);
> > > +     guard(mutex)(&data->lock);
> > >       clk_enable(data->clk);
> > >
> > >       data->tmu_set_crit_temp(data, temp / MCELSIUS);
> > >
> > >       clk_disable(data->clk);
> > > -     mutex_unlock(&data->lock);
> > >
> > >       return 0;
> > >   }
> > > @@ -325,12 +323,11 @@ static void exynos_tmu_control(struct platform_device *pdev, bool on)
> > >   {
> > >       struct exynos_tmu_data *data = platform_get_drvdata(pdev);
> > >
> > > -     mutex_lock(&data->lock);
> > > +     guard(mutex)(&data->lock);
> > >       clk_enable(data->clk);
> > >       data->tmu_control(pdev, on);
> > >       data->enabled = on;
> > >       clk_disable(data->clk);
> > > -     mutex_unlock(&data->lock);
> > >   }
> > >
> > >   static void exynos_tmu_update_bit(struct exynos_tmu_data *data, int reg_off,
> > > @@ -645,7 +642,7 @@ static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
> > >                */
> > >               return -EAGAIN;
> > >
> > > -     mutex_lock(&data->lock);
> > > +     guard(mutex)(&data->lock);
> > >       clk_enable(data->clk);
> > >
> > >       value = data->tmu_read(data);
> > > @@ -655,7 +652,6 @@ static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
> > >               *temp = code_to_temp(data, value) * MCELSIUS;
> > >
> > >       clk_disable(data->clk);
> > > -     mutex_unlock(&data->lock);
> > >
> > >       return ret;
> > >   }
> > > @@ -720,11 +716,10 @@ static int exynos_tmu_set_emulation(struct thermal_zone_device *tz, int temp)
> > >       if (temp && temp < MCELSIUS)
> > >               goto out;
> > >
> > > -     mutex_lock(&data->lock);
> > > +     guard(mutex)(&data->lock);
> > >       clk_enable(data->clk);
> > >       data->tmu_set_emulation(data, temp);
> > >       clk_disable(data->clk);
> > > -     mutex_unlock(&data->lock);
> > >       return 0;
> > >   out:
> > >       return ret;
> > > @@ -760,14 +755,13 @@ static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
> > >
> > >       thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
> > >
> > > -     mutex_lock(&data->lock);
> > > +     guard(mutex)(&data->lock);
> > >       clk_enable(data->clk);
> > >
> > >       /* TODO: take action based on particular interrupt */
> > >       data->tmu_clear_irqs(data);
> > >
> > >       clk_disable(data->clk);
> > > -     mutex_unlock(&data->lock);
> > >
> > >       return IRQ_HANDLED;
> > >   }
> > > @@ -987,7 +981,7 @@ static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
> > >   {
> > >       struct exynos_tmu_data *data = thermal_zone_device_priv(tz);
> > >
> > > -     mutex_lock(&data->lock);
> > > +     guard(mutex)(&data->lock);
> > >       clk_enable(data->clk);
> > >
> > >       if (low > INT_MIN)
> > > @@ -1000,7 +994,6 @@ static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
> > >               data->tmu_disable_high(data);
> > >
> > >       clk_disable(data->clk);
> > > -     mutex_unlock(&data->lock);
> > >
> > >       return 0;
> > >   }
>
> Thanks for your review comments.
> >
> > IMO you should be able to even use something like we have
> > core framework:
> >
> > guard(thermal_zone)(tz);
> >
> > Your mutex name is simply 'lock' in the struct exynos_tmu_data
> > so you should be able to leverage this by:
> >
> > guard(exynos_tmu_data)(data);
> >

If I introduce the guard it creates a compilation error

amoon@anand-m920q:~/mainline/linux-exynos-6.y-devel$ vi
drivers/thermal/samsung/exynos_tmu.c +306
amoon@anand-m920q:~/mainline/linux-exynos-6.y-devel$ make -j$(nproc)
ARCH=arm CROSS_COMPILE=arm-none-eabi- LOCALVERSION=-u3ml dtbs zImage
modules
  CALL    scripts/checksyscalls.sh
  CHK     kernel/kheaders_data.tar.xz
  CC      drivers/thermal/samsung/exynos_tmu.o
  CC [M]  drivers/md/raid10.o
In file included from ./include/linux/irqflags.h:17,
                 from ./arch/arm/include/asm/bitops.h:28,
                 from ./include/linux/bitops.h:68,
                 from ./include/linux/kernel.h:23,
                 from ./include/linux/clk.h:13,
                 from drivers/thermal/samsung/exynos_tmu.c:14:
drivers/thermal/samsung/exynos_tmu.c: In function 'exynos_tmu_update_bit':
./include/linux/cleanup.h:258:9: error: unknown type name
'class_exynos_tmu_data_t'
  258 |         class_##_name##_t var
__cleanup(class_##_name##_destructor) =   \
      |         ^~~~~~
./include/linux/cleanup.h:309:9: note: in expansion of macro 'CLASS'
  309 |         CLASS(_name, __UNIQUE_ID(guard))
      |         ^~~~~
drivers/thermal/samsung/exynos_tmu.c:338:9: note: in expansion of macro 'guard'
  338 |         guard(exynos_tmu_data)(data);
      |         ^~~~~
drivers/thermal/samsung/exynos_tmu.c:338:9: error: cleanup argument
not a function
  CC [M]  drivers/md/raid5.o
./include/linux/cleanup.h:259:17: error: implicit declaration of
function 'class_exynos_tmu_data_constructor'
[-Wimplicit-function-declaration]
  259 |                 class_##_name##_constructor
      |                 ^~~~~~
./include/linux/cleanup.h:309:9: note: in expansion of macro 'CLASS'
  309 |         CLASS(_name, __UNIQUE_ID(guard))
      |         ^~~~~
drivers/thermal/samsung/exynos_tmu.c:338:9: note: in expansion of macro 'guard'
  338 |         guard(exynos_tmu_data)(data);
      |         ^~~~~
./include/linux/compiler.h:166:45: warning: unused variable
'__UNIQUE_ID_guard572' [-Wunused-variable]
  166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_,
prefix), __COUNTER__)
      |                                             ^~~~~~~~~~~~
./include/linux/cleanup.h:258:27: note: in definition of macro 'CLASS'
  258 |         class_##_name##_t var
__cleanup(class_##_name##_destructor) =   \
      |                           ^~~
././include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
   84 | #define __PASTE(a,b) ___PASTE(a,b)
      |                      ^~~~~~~~
./include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
  166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_,
prefix), __COUNTER__)
      |                             ^~~~~~~
././include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
   84 | #define __PASTE(a,b) ___PASTE(a,b)
      |                      ^~~~~~~~
./include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
  166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_,
prefix), __COUNTER__)
      |                                     ^~~~~~~
./include/linux/cleanup.h:309:22: note: in expansion of macro '__UNIQUE_ID'
  309 |         CLASS(_name, __UNIQUE_ID(guard))
      |                      ^~~~~~~~~~~
drivers/thermal/samsung/exynos_tmu.c:338:9: note: in expansion of macro 'guard'
  338 |         guard(exynos_tmu_data)(data);

Thanks
-Anand

