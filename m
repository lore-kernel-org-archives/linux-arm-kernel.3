Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F4FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 16:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNHkJmXM07+1xGaDRSJ0A5BITf+LecZD5bdaeHjapZk=; b=Yc7xU5CRYczvvi0ZuMkZxMIGxB
	+ZUq7QVYl7s7L7E0R68YNUtfis9nNycuO7MEJKh7T8vi8QG4Uy/fu0gIDSuOGmDSKuKdaym0yzC/u
	pKFSOXcyW7RMAeJ32c/M+j0cQM1D0KOBIfQ8oAEIqyYEvO9u6fnQAZWJsErWSVkUShZxx1vxGwBET
	9Fj5Yp9QW2JKy8U2ucK/Ge2EKcwNfin7LhUUsK3L5ZJ0JOnsrBX2KXJGpcAYjtiZnl3rUkJYRHZ8z
	JuyiO+9WgAXop3CgoGnehF+bIB3NQ0kvMysGWVtjLtvL/ShRV5HqONcl3HkdAC4cL1sYNqHmt9k8L
	0CE4I0/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprCP-00000008bA7-2bhD;
	Wed, 05 Mar 2025 16:02:21 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpr9u-00000008aYo-2WRu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 15:59:47 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-abf64aa2a80so762068366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 07:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741190384; x=1741795184; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tNHkJmXM07+1xGaDRSJ0A5BITf+LecZD5bdaeHjapZk=;
        b=joqkwWKOjslsoxG4AS96sk6Cy567VXAbow6aGyIWnS/QjYvVYJW/0LGE2TH3508L00
         S0myvbUK18o3cvZ7RCH8APAPwJIFL9JKCj7bbmqB3kWBfZZ3zizHOCs/UEjz6+LC24qy
         fJruouakDjZSKXVWN6FLN5S3vB6Tg59rTiRWfrn3z5ZRvEa7t3F8iexfzEr6l2e9rM83
         M/2HZNjViuhQCLgjDwogSz0TicNy56CUYgaBZNSsq8MmNFnkxYPE+1DHuEStbh6kjUb7
         R2DejWiBprAHE8wgL7Q82ArIRjknZ1j7kA7LkK+6UN1UJk3mJilXy2oK2HHt8JY53HlI
         g9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190384; x=1741795184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNHkJmXM07+1xGaDRSJ0A5BITf+LecZD5bdaeHjapZk=;
        b=ZNBlR7b5Zz+fFjiJQaPC5413FROtofRg6p70LbAOnfCimHby7DqyJLmRNGdc58Inwv
         CVp/+TK492CRI1M/ifj4WXneybfcXTf1HMSPRHBBy7Hxq1W4iZYXqgCQxZCcJ+IZNUqm
         Ihcjx9FdU7HiTsS2eC3pmGl7ShU7vqqstRR238pxk2wtf7fQgxD6eKm7gNtP4sfvwM8B
         UNKcRQo5Yy0l8DWIa+G9eGo56Sf18zAsFkZ5NSIkio8W8V9ZQY098jMiR3uShg1nFweg
         6OS8QGPzicc+NvWb3G8C8iF8D/0q/64HCSi3NbdNWJSm1Whyc5h22u7eap42R6EkN7Pu
         ecGg==
X-Forwarded-Encrypted: i=1; AJvYcCV2c/egWmiLUUFvsAfftKrs0DTkJt1iUrtX7r87MZOJ2R66TSs14AXImiG4xuL2CIJ5poffUD2UMi1hYKauOwy5@lists.infradead.org
X-Gm-Message-State: AOJu0YzHNgEjADyBiEf+jBfBVqJBxgsVUpufeOKGFVeq+iD7buE+fIXc
	TzgkkT0GwcfmGr30W91UbIG12RsUxnfVwp0Gn+kneygJse4l7BYjnkQuE2QXKP1mMrc7JmV7h3e
	pqQPKiSwsKtbRgMe6oGo51sn4k/0=
X-Gm-Gg: ASbGncsjWtvct3UuAosrY327juBtvFAA17x7qNpVfdCICFddolSFcPXUErZcagvc7wi
	BzfOXpD7I6v0n/s1LLInBsza2evTbAGBrYRGxuJ1oIBtu8QC6Np+nHcV2IpRMIkZu39Ru4iCv0z
	7zsDvpLqyVkNdNTOHD5Yoj2PKLpA==
X-Google-Smtp-Source: AGHT+IEQsE+pLAIU3v/ec4405Kg+m90JUNpfZqni22hhxiIr9/+iCpzkVrVUlAcAB0YbRMMiuvNnCzik/ivWF3/YwMM=
X-Received: by 2002:a17:907:da6:b0:ac1:fa0d:756 with SMTP id
 a640c23a62f3a-ac20d943124mr375609766b.34.1741190384124; Wed, 05 Mar 2025
 07:59:44 -0800 (PST)
MIME-Version: 1.0
References: <20250216195850.5352-1-linux.amoon@gmail.com> <20250216195850.5352-5-linux.amoon@gmail.com>
 <f44efd1a-1f6e-456d-9395-de2a55ef2279@arm.com> <CANAwSgTpV_kGFEU-ND0N+OEtT6+j4ceq37xAoLyC7iHPWAuLjg@mail.gmail.com>
 <CANAwSgSWf_YxSi-pzWPaRoiJx7RLrWUz+HTWx5hf+E2x1ZGmoQ@mail.gmail.com> <7a1cac10-b065-4b4c-b048-10d6b4132f3d@arm.com>
In-Reply-To: <7a1cac10-b065-4b4c-b048-10d6b4132f3d@arm.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 5 Mar 2025 21:29:27 +0530
X-Gm-Features: AQ5f1JppO4fhzc2dkKI1ZBSO1ZKK5PQ7WMoG06FmWIv-xqH6vpAXgcWpPGM7iIg
Message-ID: <CANAwSgQErDnKfaBOkpEwpJsoyUMhNTC2TJNW-eQYHgHu46poCA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250305_075946_639744_4694D144 
X-CRM114-Status: GOOD (  30.53  )
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

On Wed, 5 Mar 2025 at 14:12, Lukasz Luba <lukasz.luba@arm.com> wrote:
>
>
>
> On 3/4/25 12:20, Anand Moon wrote:
> > Hi Lukasz,
> >
> > On Sat, 1 Mar 2025 at 00:06, Anand Moon <linux.amoon@gmail.com> wrote:
> >>
> >> Hi Lukasz,
> >>
> >> On Fri, 28 Feb 2025 at 22:58, Lukasz Luba <lukasz.luba@arm.com> wrote:
> >>>
> >>>
> >>>
> >>> On 2/16/25 19:58, Anand Moon wrote:
> >>>> Using guard notation makes the code more compact and error handling
> >>>> more robust by ensuring that mutexes are released in all code paths
> >>>> when control leaves critical section.
> >>>>
> >>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>>> ---
> >>>> v3: new patch
> >>>> ---
> >>>>    drivers/thermal/samsung/exynos_tmu.c | 21 +++++++--------------
> >>>>    1 file changed, 7 insertions(+), 14 deletions(-)
> >>>>
> >>>> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> >>>> index fe090c1a93ab..a34ba3858d64 100644
> >>>> --- a/drivers/thermal/samsung/exynos_tmu.c
> >>>> +++ b/drivers/thermal/samsung/exynos_tmu.c
> >>>> @@ -256,7 +256,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
> >>>>        unsigned int status;
> >>>>        int ret = 0;
> >>>>
> >>>> -     mutex_lock(&data->lock);
> >>>> +     guard(mutex)(&data->lock);
> >>>>        clk_enable(data->clk);
> >>>>        clk_enable(data->clk_sec);
> >>>>
> >>>> @@ -270,7 +270,6 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
> >>>>
> >>>>        clk_disable(data->clk_sec);
> >>>>        clk_disable(data->clk);
> >>>> -     mutex_unlock(&data->lock);
> >>>>
> >>>>        return ret;
> >>>>    }
> >>>> @@ -292,13 +291,12 @@ static int exynos_thermal_zone_configure(struct platform_device *pdev)
> >>>>                return ret;
> >>>>        }
> >>>>
> >>>> -     mutex_lock(&data->lock);
> >>>> +     guard(mutex)(&data->lock);
> >>>>        clk_enable(data->clk);
> >>>>
> >>>>        data->tmu_set_crit_temp(data, temp / MCELSIUS);
> >>>>
> >>>>        clk_disable(data->clk);
> >>>> -     mutex_unlock(&data->lock);
> >>>>
> >>>>        return 0;
> >>>>    }
> >>>> @@ -325,12 +323,11 @@ static void exynos_tmu_control(struct platform_device *pdev, bool on)
> >>>>    {
> >>>>        struct exynos_tmu_data *data = platform_get_drvdata(pdev);
> >>>>
> >>>> -     mutex_lock(&data->lock);
> >>>> +     guard(mutex)(&data->lock);
> >>>>        clk_enable(data->clk);
> >>>>        data->tmu_control(pdev, on);
> >>>>        data->enabled = on;
> >>>>        clk_disable(data->clk);
> >>>> -     mutex_unlock(&data->lock);
> >>>>    }
> >>>>
> >>>>    static void exynos_tmu_update_bit(struct exynos_tmu_data *data, int reg_off,
> >>>> @@ -645,7 +642,7 @@ static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
> >>>>                 */
> >>>>                return -EAGAIN;
> >>>>
> >>>> -     mutex_lock(&data->lock);
> >>>> +     guard(mutex)(&data->lock);
> >>>>        clk_enable(data->clk);
> >>>>
> >>>>        value = data->tmu_read(data);
> >>>> @@ -655,7 +652,6 @@ static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
> >>>>                *temp = code_to_temp(data, value) * MCELSIUS;
> >>>>
> >>>>        clk_disable(data->clk);
> >>>> -     mutex_unlock(&data->lock);
> >>>>
> >>>>        return ret;
> >>>>    }
> >>>> @@ -720,11 +716,10 @@ static int exynos_tmu_set_emulation(struct thermal_zone_device *tz, int temp)
> >>>>        if (temp && temp < MCELSIUS)
> >>>>                goto out;
> >>>>
> >>>> -     mutex_lock(&data->lock);
> >>>> +     guard(mutex)(&data->lock);
> >>>>        clk_enable(data->clk);
> >>>>        data->tmu_set_emulation(data, temp);
> >>>>        clk_disable(data->clk);
> >>>> -     mutex_unlock(&data->lock);
> >>>>        return 0;
> >>>>    out:
> >>>>        return ret;
> >>>> @@ -760,14 +755,13 @@ static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
> >>>>
> >>>>        thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
> >>>>
> >>>> -     mutex_lock(&data->lock);
> >>>> +     guard(mutex)(&data->lock);
> >>>>        clk_enable(data->clk);
> >>>>
> >>>>        /* TODO: take action based on particular interrupt */
> >>>>        data->tmu_clear_irqs(data);
> >>>>
> >>>>        clk_disable(data->clk);
> >>>> -     mutex_unlock(&data->lock);
> >>>>
> >>>>        return IRQ_HANDLED;
> >>>>    }
> >>>> @@ -987,7 +981,7 @@ static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
> >>>>    {
> >>>>        struct exynos_tmu_data *data = thermal_zone_device_priv(tz);
> >>>>
> >>>> -     mutex_lock(&data->lock);
> >>>> +     guard(mutex)(&data->lock);
> >>>>        clk_enable(data->clk);
> >>>>
> >>>>        if (low > INT_MIN)
> >>>> @@ -1000,7 +994,6 @@ static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
> >>>>                data->tmu_disable_high(data);
> >>>>
> >>>>        clk_disable(data->clk);
> >>>> -     mutex_unlock(&data->lock);
> >>>>
> >>>>        return 0;
> >>>>    }
> >>
> >> Thanks for your review comments.
> >>>
> >>> IMO you should be able to even use something like we have
> >>> core framework:
> >>>
> >>> guard(thermal_zone)(tz);
> >>>
> >>> Your mutex name is simply 'lock' in the struct exynos_tmu_data
> >>> so you should be able to leverage this by:
> >>>
> >>> guard(exynos_tmu_data)(data);
> >>>
> >
> > If I introduce the guard it creates a compilation error
> >
> > amoon@anand-m920q:~/mainline/linux-exynos-6.y-devel$ vi
> > drivers/thermal/samsung/exynos_tmu.c +306
> > amoon@anand-m920q:~/mainline/linux-exynos-6.y-devel$ make -j$(nproc)
> > ARCH=arm CROSS_COMPILE=arm-none-eabi- LOCALVERSION=-u3ml dtbs zImage
> > modules
> >    CALL    scripts/checksyscalls.sh
> >    CHK     kernel/kheaders_data.tar.xz
> >    CC      drivers/thermal/samsung/exynos_tmu.o
> >    CC [M]  drivers/md/raid10.o
> > In file included from ./include/linux/irqflags.h:17,
> >                   from ./arch/arm/include/asm/bitops.h:28,
> >                   from ./include/linux/bitops.h:68,
> >                   from ./include/linux/kernel.h:23,
> >                   from ./include/linux/clk.h:13,
> >                   from drivers/thermal/samsung/exynos_tmu.c:14:
> > drivers/thermal/samsung/exynos_tmu.c: In function 'exynos_tmu_update_bit':
> > ./include/linux/cleanup.h:258:9: error: unknown type name
> > 'class_exynos_tmu_data_t'
> >    258 |         class_##_name##_t var
> > __cleanup(class_##_name##_destructor) =   \
> >        |         ^~~~~~
> > ./include/linux/cleanup.h:309:9: note: in expansion of macro 'CLASS'
> >    309 |         CLASS(_name, __UNIQUE_ID(guard))
> >        |         ^~~~~
> > drivers/thermal/samsung/exynos_tmu.c:338:9: note: in expansion of macro 'guard'
> >    338 |         guard(exynos_tmu_data)(data);
> >        |         ^~~~~
> > drivers/thermal/samsung/exynos_tmu.c:338:9: error: cleanup argument
> > not a function
>
> [snip]
>
> Right, you're missing the definition at the begging, like:
>
> DEFINE_GUARD(exynos_tmu_data, struct exynos_tmu_data *,
> mutex_lock(&_T->lock),
>               mutex_unlock(&_T->lock))
>
> below the struct exynos_tmu_data definition.
>
> Also, make sure you include the cleanup.h (it might not complain,
> but it would be explicit and more clear)

Thanks for this tip.
However, incorporating guard(exynos_tmu_data)(data); results
in a recursive deadlock with the mutex during initialization, as this
data structure is common to all the code configurations of Exynos TMU

Thanks
-Anand

