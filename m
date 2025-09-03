Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56540CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 12:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFA746l+FQKeF8fniwaJ6EqIocMxPsuQyDMVkrVoQx4=; b=Pm3qYSeGlnOxBKxfZJ0jrVmmrR
	ZYpJFwFOd0YkiL0d985jzbDWrxEKqzawOQ/vqZIO1s+/rqpS7y2TcKP+kyyoFd6kW2FVcz/N2aVL5
	83zejg9z0eXyu1oNz5TlNCPkTc58flTpNECy1KTWBczQ9BpJ3mL032CiGczjp93nv124qM/fnmnRv
	Vemjxh0t1fU4vpLciVPItmukt2DPY20G3dQ0xRHQ12BTLuZ79otSh4NpD9cG49vHdjA/cXeuF2zyb
	JnddI596W3fVaHAbNMyGu7fIq0GZTzbRl8cQGQDMY/oqQnCi9FayvDnUHVvxqmsyKfPKrnvQk3Oc4
	tpB2lTMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmt7-00000006ReW-2Q2E;
	Wed, 03 Sep 2025 12:46:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utltk-00000006G1s-0DSG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 11:43:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61D0C44C18
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 11:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4287DC116C6
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 11:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756899811;
	bh=vKQkkEhiJ1pWIqj+5+l0nwZXdLd03e23W2MiNNRAENI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZpjrJSUQT1mjo/GMosxVE9BlKGzz1qGPGvR96j4+cgvYWF0u5LAVlwLWXP3ABf9xh
	 emKGoXYpzikhccqTWnXBUrcQPaehl9+DjtD8mRrCZAUG0qMfiELP4YWuYF1/F3FhRs
	 aW14nUDCO+/AYANfE36disnrS+dbIk61uVm2aK4DwbZr4D6ZklHcUzH8AB5VT4ETkI
	 oemvw0KIyTt5h9EWGtcRYHX1XymPMBJ5M8rR/7taIhWazv9RCHjo2E6MQK1ZSFsIft
	 KMXYcw8DilfLBcBV9GtUI2eD4qkQH6J3a3mK4SaX7Nes6EUJ273H+CqQgGGZuh4kFd
	 y6ffvET3JkSjQ==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-61e48b28bebso1207382eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 04:43:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWz2E2W4dZTMaRA0o8GbfQIeQuPWX560pTdfwvU0FLY7azVS35X2gSB+BlZ91ymFEkSRYxGvoDHo5Cr0Aot82o6@lists.infradead.org
X-Gm-Message-State: AOJu0YwdzLBVGRbetcCbxWGfOef55mxUzPAVKnDGNbbSfAEZv1ZthGEW
	t3Kh0vj/T9W2+j1NiQMkIuYOGsRXzluZs9VKCEFzbGju/5Vjt6/Doj868lUV8I7P8Tgjp3TuPzz
	P2723WDAwRkiuyjK4JWW60+3zpU6J3Iw=
X-Google-Smtp-Source: AGHT+IFudXZ/fyz4UQ3WH+8GjEXukDIGbLh/LZigzEMBTf0gXA3YZsKNByr0Anw/wDvM05EPCnSrOq7ywW0PFfzffo4=
X-Received: by 2002:a05:6820:1694:b0:619:7d9b:3f0b with SMTP id
 006d021491bc7-61e33740f82mr7219508eaf.5.1756899810069; Wed, 03 Sep 2025
 04:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250901085748.36795-1-zhangzihuan@kylinos.cn> <20250901085748.36795-10-zhangzihuan@kylinos.cn>
In-Reply-To: <20250901085748.36795-10-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 3 Sep 2025 13:43:17 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gwpefQt8VJ3XUyFy7u7rFhvPT=sXqG-1gHobw=1NgJpw@mail.gmail.com>
X-Gm-Features: Ac12FXwdhTUIKZ7oynz9F8Wzgqo7R3jPRBfEv1CLslQcvLPWz0YXuuodu9R2gpg
Message-ID: <CAJZ5v0gwpefQt8VJ3XUyFy7u7rFhvPT=sXqG-1gHobw=1NgJpw@mail.gmail.com>
Subject: Re: [PATCH v3 09/12] powercap: dtpm_cpu: Use scope-based cleanup helper
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
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
X-CRM114-CacheID: sfid-20250903_044332_135070_C303A975 
X-CRM114-Status: GOOD (  22.19  )
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

On Mon, Sep 1, 2025 at 10:58=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylinos.c=
n> wrote:
>
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
>
> No functional change intended.
>
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/powercap/dtpm_cpu.c | 26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
> index 99390ec1481f..5e18438782f8 100644
> --- a/drivers/powercap/dtpm_cpu.c
> +++ b/drivers/powercap/dtpm_cpu.c
> @@ -144,19 +144,15 @@ static int update_pd_power_uw(struct dtpm *dtpm)
>  static void pd_release(struct dtpm *dtpm)
>  {
>         struct dtpm_cpu *dtpm_cpu =3D to_dtpm_cpu(dtpm);
> -       struct cpufreq_policy *policy;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(dtpm_cpu->cpu);
>
>         if (freq_qos_request_active(&dtpm_cpu->qos_req))
>                 freq_qos_remove_request(&dtpm_cpu->qos_req);
>
> -       policy =3D cpufreq_cpu_get(dtpm_cpu->cpu);

Since policy is not needed earlier, you may as well declare it here.

> -       if (policy) {
> +       if (policy)
>                 for_each_cpu(dtpm_cpu->cpu, policy->related_cpus)
>                         per_cpu(dtpm_per_cpu, dtpm_cpu->cpu) =3D NULL;
>
> -               cpufreq_cpu_put(policy);
> -       }
> -
>         kfree(dtpm_cpu);
>  }
>
> @@ -192,7 +188,7 @@ static int cpuhp_dtpm_cpu_online(unsigned int cpu)
>  static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
>  {
>         struct dtpm_cpu *dtpm_cpu;
> -       struct cpufreq_policy *policy;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpu);
>         struct em_perf_state *table;
>         struct em_perf_domain *pd;
>         char name[CPUFREQ_NAME_LEN];
> @@ -202,21 +198,16 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *p=
arent)
>         if (dtpm_cpu)
>                 return 0;
>
> -       policy =3D cpufreq_cpu_get(cpu);

Ditto.

>         if (!policy)
>                 return 0;
>
>         pd =3D em_cpu_get(cpu);
> -       if (!pd || em_is_artificial(pd)) {
> -               ret =3D -EINVAL;
> -               goto release_policy;
> -       }
> +       if (!pd || em_is_artificial(pd))
> +               return -EINVAL;
>
>         dtpm_cpu =3D kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);
> -       if (!dtpm_cpu) {
> -               ret =3D -ENOMEM;
> -               goto release_policy;
> -       }
> +       if (!dtpm_cpu)
> +               return -ENOMEM;
>
>         dtpm_init(&dtpm_cpu->dtpm, &dtpm_ops);
>         dtpm_cpu->cpu =3D cpu;
> @@ -239,7 +230,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *par=
ent)
>         if (ret < 0)
>                 goto out_dtpm_unregister;
>
> -       cpufreq_cpu_put(policy);
>         return 0;
>
>  out_dtpm_unregister:
> @@ -251,8 +241,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *par=
ent)
>                 per_cpu(dtpm_per_cpu, cpu) =3D NULL;
>         kfree(dtpm_cpu);
>
> -release_policy:
> -       cpufreq_cpu_put(policy);
>         return ret;
>  }
>
> --

