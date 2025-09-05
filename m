Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AADCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 01:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHVpcKB7Cb/uEraG7GIWsCqlkcZPuKQD5lJglnay43Q=; b=3UUzyvXQao4avbp/uv0veM5Gp4
	DTJkYm3cOJKPTPvtQ2xRKPMy+X6k54gGLWmnY1k2mTPQ2yUMODowEachdDj9Bbw9v90OCMP8iYInv
	keeZOEW36M7QQLs5WuVxwkjHzp5dTQ/ZQCoMfqPe4wjh6MLLiQe9mEU3zvoCYxp+t3uSX0ZLwkkJe
	UriMF/g6gDTnFCuriDHg+iDVUoXtH87Ak3f9l54eIZc4bkwaibktn6nvy0Pk93ID97lTQfQ9Ug/1+
	gHgRkUDhG5MMMOMFZxo1SsXDmYQQCDFowSA4/hWs1Wkxp3nSok7FVbw2ibTqwHa8jxs4J3OE3QKV0
	nm4nKqqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuhh0-00000005s1e-07WP;
	Sat, 06 Sep 2025 01:26:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uucI0-00000004Dk4-2lT0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 19:40:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1814A445B9
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 19:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA0CC4CEFA
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 19:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757101204;
	bh=EW5E1DsoS/eP0Xpaway7kFwsFpD+pL719m9UghXWG4E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZqXRFlbgP5QwPcBxU6eNLL/08iwuclbpMhHj5f112VJ0D0CRs+uAOZZt9/eSU+oYH
	 FOKxLZNfYfeCUuY691CYi9oaDczKB9oJxUx3sRU+YTC0hMmU7aj7i6icx+GswFUP2R
	 IFwTEwP7LFbGxUg/I7SAjo0DENXd43ZHbeobRhQywFakWAs9/enQGWBOfoAuIelFBb
	 wogoGak56kUdv1oV5wP9PLMDQRhAVNRB8Qk4NYGffSXcIWD99Y+pR+l0VNOqodu/Yf
	 429lN+Si30NngrGAeTbmA/uuc+3zujKhmh+809qGxXm2EsqsYlM68fd6X/hgvyGAM6
	 l4P6r3BqgQXRw==
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-74526ca79c2so1127778a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 12:40:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX5ou2AquEDDiHmdAiagxrGcVcQ8NVmd/jB6LvH6a3wU3uPuiI54V6GXEGAhn3vS0TJKdBMoEGrd70w2WbBjh5m@lists.infradead.org
X-Gm-Message-State: AOJu0YyQpGXDuMpCjwUo120mS21Ca3I9zAUAWRocXFMooQewTb79A81t
	LZtA4UNO7wj3oFoYYX6ShkOPGwN2xmi2ltvg1EdDF9Jp3x85in921Kxnworfq7oMLAa+ouy6EVt
	bXB7afhh/RpJge9CSz4zZEleQRocx/As=
X-Google-Smtp-Source: AGHT+IEWhcvcPUmMTXw08ZtZH4mqK1uKC0R7GjcFC8PVlsyyD61c2ek06n5Ch8ecLJvX8w2zR6AjPrAE5CMEF+OJ57Q=
X-Received: by 2002:a05:6830:700a:b0:74b:f9de:34dd with SMTP id
 46e09a7af769-74bf9de3edfmr235939a34.15.1757101203180; Fri, 05 Sep 2025
 12:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn> <20250905132413.1376220-5-zhangzihuan@kylinos.cn>
In-Reply-To: <20250905132413.1376220-5-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 5 Sep 2025 21:39:52 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jvskvxgUhxKJLN89A+s7Mruz1_tewHZfKgC7sUGLi9cw@mail.gmail.com>
X-Gm-Features: Ac12FXws29Av_URAHgjbe1keBVsNp0-87UjpP4EeoBVUVvSgtWfWbkUI32D7vRk
Message-ID: <CAJZ5v0jvskvxgUhxKJLN89A+s7Mruz1_tewHZfKgC7sUGLi9cw@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] PM / devfreq: Use scope-based cleanup helper
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, Ben Horgan <ben.horgan@arm.com>, 
	zhenglifeng <zhenglifeng1@huawei.com>, Zhang Rui <rui.zhang@intel.com>, 
	Len Brown <lenb@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Beata Michalska <beata.michalska@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, Sumit Gupta <sumitg@nvidia.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_124004_747558_68977439 
X-CRM114-Status: GOOD (  26.29  )
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

On Fri, Sep 5, 2025 at 3:25=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.cn=
> wrote:
>
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
>
> No functional change intended.
>
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/devfreq/governor_passive.c | 60 +++++++++++-------------------
>  1 file changed, 22 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governo=
r_passive.c
> index 953cf9a1e9f7..5afaea39377e 100644
> --- a/drivers/devfreq/governor_passive.c
> +++ b/drivers/devfreq/governor_passive.c
> @@ -80,24 +80,23 @@ static int get_target_freq_with_cpufreq(struct devfre=
q *devfreq,
>         struct devfreq_passive_data *p_data =3D
>                                 (struct devfreq_passive_data *)devfreq->d=
ata;
>         struct devfreq_cpu_data *parent_cpu_data;
> -       struct cpufreq_policy *policy;
>         unsigned long cpu, cpu_cur, cpu_min, cpu_max, cpu_percent;
>         unsigned long dev_min, dev_max;
>         unsigned long freq =3D 0;
>         int ret =3D 0;
>
>         for_each_online_cpu(cpu) {

I'd rather move the code in this loop to a separate function in the
first place and then do a __free()-based simplification of it.  I'd
suggest doing each step in a separate patch to avoid mistakes.

> -               policy =3D cpufreq_cpu_get(cpu);
> +               struct cpufreq_policy *policy __free(put_cpufreq_policy) =
=3D
> +                       cpufreq_cpu_get(cpu);
> +
>                 if (!policy) {
>                         ret =3D -EINVAL;
>                         continue;
>                 }
>
>                 parent_cpu_data =3D get_parent_cpu_data(p_data, policy);
> -               if (!parent_cpu_data) {
> -                       cpufreq_cpu_put(policy);
> +               if (!parent_cpu_data)
>                         continue;
> -               }
>
>                 /* Get target freq via required opps */
>                 cpu_cur =3D parent_cpu_data->cur_freq * HZ_PER_KHZ;
> @@ -106,7 +105,6 @@ static int get_target_freq_with_cpufreq(struct devfre=
q *devfreq,
>                                         devfreq->opp_table, &cpu_cur);
>                 if (freq) {
>                         *target_freq =3D max(freq, *target_freq);
> -                       cpufreq_cpu_put(policy);
>                         continue;
>                 }
>
> @@ -121,7 +119,6 @@ static int get_target_freq_with_cpufreq(struct devfre=
q *devfreq,
>                 freq =3D dev_min + mult_frac(dev_max - dev_min, cpu_perce=
nt, 100);
>
>                 *target_freq =3D max(freq, *target_freq);
> -               cpufreq_cpu_put(policy);
>         }
>
>         return ret;
> @@ -255,8 +252,6 @@ static int cpufreq_passive_register_notifier(struct d=
evfreq *devfreq)
>                         =3D (struct devfreq_passive_data *)devfreq->data;
>         struct device *dev =3D devfreq->dev.parent;
>         struct opp_table *opp_table =3D NULL;
> -       struct devfreq_cpu_data *parent_cpu_data;
> -       struct cpufreq_policy *policy;
>         struct device *cpu_dev;
>         unsigned int cpu;
>         int ret;
> @@ -273,37 +268,34 @@ static int cpufreq_passive_register_notifier(struct=
 devfreq *devfreq)
>         }
>
>         for_each_possible_cpu(cpu) {

And analogously here.  I'd use separate two patches for updating this code.

> -               policy =3D cpufreq_cpu_get(cpu);
> -               if (!policy) {
> -                       ret =3D -EPROBE_DEFER;
> -                       goto err;
> -               }
> +               struct cpufreq_policy *policy __free(put_cpufreq_policy) =
=3D
> +                       cpufreq_cpu_get(cpu);
>
> -               parent_cpu_data =3D get_parent_cpu_data(p_data, policy);
> -               if (parent_cpu_data) {
> -                       cpufreq_cpu_put(policy);
> +               if (!policy)
> +                       return -EPROBE_DEFER;
> +
> +               struct devfreq_cpu_data *initial_parent_cpu_data =3D
> +                       get_parent_cpu_data(p_data, policy);
> +
> +               if (initial_parent_cpu_data)
>                         continue;
> -               }
>
> -               parent_cpu_data =3D kzalloc(sizeof(*parent_cpu_data),
> -                                               GFP_KERNEL);
> -               if (!parent_cpu_data) {
> -                       ret =3D -ENOMEM;
> -                       goto err_put_policy;
> -               }
> +               struct devfreq_cpu_data *parent_cpu_data __free(kfree) =
=3D
> +                       kzalloc(sizeof(*parent_cpu_data), GFP_KERNEL);
> +
> +               if (!parent_cpu_data)
> +                       return -ENOMEM;
>
>                 cpu_dev =3D get_cpu_device(cpu);
>                 if (!cpu_dev) {
>                         dev_err(dev, "failed to get cpu device\n");
> -                       ret =3D -ENODEV;
> -                       goto err_free_cpu_data;
> +                       return -ENODEV;
>                 }
>
>                 opp_table =3D dev_pm_opp_get_opp_table(cpu_dev);
>                 if (IS_ERR(opp_table)) {
>                         dev_err(dev, "failed to get opp_table of cpu%d\n"=
, cpu);
> -                       ret =3D PTR_ERR(opp_table);
> -                       goto err_free_cpu_data;
> +                       return PTR_ERR(opp_table);
>                 }
>
>                 parent_cpu_data->dev =3D cpu_dev;
> @@ -313,8 +305,8 @@ static int cpufreq_passive_register_notifier(struct d=
evfreq *devfreq)
>                 parent_cpu_data->min_freq =3D policy->cpuinfo.min_freq;
>                 parent_cpu_data->max_freq =3D policy->cpuinfo.max_freq;
>
> -               list_add_tail(&parent_cpu_data->node, &p_data->cpu_data_l=
ist);
> -               cpufreq_cpu_put(policy);
> +               list_add_tail(&(no_free_ptr(parent_cpu_data)->node,
> +                       &p_data->cpu_data_list);
>         }
>
>         mutex_lock(&devfreq->lock);
> @@ -324,14 +316,6 @@ static int cpufreq_passive_register_notifier(struct =
devfreq *devfreq)
>                 dev_err(dev, "failed to update the frequency\n");
>
>         return ret;
> -
> -err_free_cpu_data:
> -       kfree(parent_cpu_data);
> -err_put_policy:
> -       cpufreq_cpu_put(policy);
> -err:
> -
> -       return ret;
>  }
>
>  static int devfreq_passive_notifier_call(struct notifier_block *nb,
> --

