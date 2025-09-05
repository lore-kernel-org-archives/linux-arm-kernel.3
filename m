Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAEFCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtPxATsEFobK/hegi1Hzd9WvYZN2goxvoyMyFG5Binw=; b=LAnPu4Hbr6oMJLna+zu5OroyA5
	6qY/JQZYmSB4ZUmMMhm76dNwLobLmcP0JovQZCzPaclu1DKTZ/AAankl6BN0JVxWp0uH702vHtAch
	rL8BmaENensIXIpGpEioWejWzCIs32LYMau8SltCXnlLWWK8IzOGTXjMrNsTzxwGGDU7ehKgwVdht
	ESCoyrBVAheqZWC0bNh1jsj/wDGRBMTaQMp7xF9QGb1k//LkAJhmuGdaxStHBUryVTlpvKxmEg8IP
	7ZlXsODBDTjAGlvv7ukGkz7NcX3k7BmhFYiHfi3yDy9dretYo4xihqOHW+IvJ8g8hI9OLkNpmG/RP
	VoZRUAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugY6-00000005WTM-2a1H;
	Sat, 06 Sep 2025 00:12:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uucOe-00000004Fkb-42zJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 19:46:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F6FD44C96
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 19:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9BDC113D0
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 19:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757101616;
	bh=H8MVjkz4o17difHvr2cD8D+8FZU1fUcKjhpmn4rwijw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G9qmJFw1HIMkEhpfwD6F7o3JbvpRO1V95WZ/oUz3+r2CZmbDws6CbBgur6Wekx+qi
	 ldlGPU37Uj/fIsJfq8C0T5mwgtAEI7Vqo36+np24YoWw6Q+UqAD0c8vsYKdD1WmilJ
	 I5H7EyGxJaGj6hrAng2kuUlTjEtq88UjwDYdjemQkTgF2roSvOtH1g1Vers9Vmn/8H
	 hFTpK0+yBM6BJf93iSTpneRiwZTgqB03L5VCqcDIKq1c7x0wnA4m2OtzWFieeGFXd2
	 UYnynJnuCo/OhHIYLgJZetquSD940EGwlIBAqodji7zBapVVl2I0pI39J7QYdGVk0c
	 YFNdRZkp+5nBw==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-61e4c824615so1088339eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 12:46:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXySBgzbfIYY3fjLYerDXn7mSJcqT+lSPC5FmrGVs0dI1rfIqFM1KtoWdxVltChzQGvlbVVE3klJWVKNhmi2Bjv@lists.infradead.org
X-Gm-Message-State: AOJu0YyOeDSG1X0YDtIOq97rbv5G82xk9wVB7a11eKIWS8GrW60n6Byh
	+cXx0HJ0prhUK+61pd8kLgX8WPPtoVaR3/TIM0tOPpw7GkOd+NW2Wjk0cnhABYd3pra0uF6fmVl
	IZLp0e+lAWHCw1ttlBcLyGaW8lm+F1Sk=
X-Google-Smtp-Source: AGHT+IEKuvslbgpS+jFT9kCZO9ZHrI6mBjYptsMiCaePE1pyVsHfodMLw3nmAqVy7Bw/fuUlRNZZYUO91WEjIayPMsY=
X-Received: by 2002:a05:6820:548:b0:621:71c3:eab8 with SMTP id
 006d021491bc7-62171c3ecffmr1197889eaf.3.1757101615563; Fri, 05 Sep 2025
 12:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn> <20250905132413.1376220-7-zhangzihuan@kylinos.cn>
In-Reply-To: <20250905132413.1376220-7-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 5 Sep 2025 21:46:43 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0izu1_xVe_pGeJiXZqEXLxg_o30NkEjMiwzDgeU4mOGmA@mail.gmail.com>
X-Gm-Features: Ac12FXylOWQRbtZy4tXGis9fcvrx9xAWhEYFwKXiKvA-TbpGOjwSaXBXEfvwt6M
Message-ID: <CAJZ5v0izu1_xVe_pGeJiXZqEXLxg_o30NkEjMiwzDgeU4mOGmA@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] PM: EM: Use scope-based cleanup helper
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
X-CRM114-CacheID: sfid-20250905_124657_048163_4B6A10AB 
X-CRM114-Status: GOOD (  22.80  )
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
>  kernel/power/energy_model.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
> index ea7995a25780..5ec63b3e7d85 100644
> --- a/kernel/power/energy_model.c
> +++ b/kernel/power/energy_model.c
> @@ -451,7 +451,6 @@ static void
>  em_cpufreq_update_efficiencies(struct device *dev, struct em_perf_state =
*table)
>  {
>         struct em_perf_domain *pd =3D dev->em_pd;
> -       struct cpufreq_policy *policy;
>         int found =3D 0;
>         int i, cpu;
>
> @@ -465,7 +464,7 @@ em_cpufreq_update_efficiencies(struct device *dev, st=
ruct em_perf_state *table)
>                 return;
>         }
>
> -       policy =3D cpufreq_cpu_get(cpu);
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpu);
>         if (!policy) {
>                 dev_warn(dev, "EM: Access to CPUFreq policy failed\n");
>                 return;
> @@ -479,8 +478,6 @@ em_cpufreq_update_efficiencies(struct device *dev, st=
ruct em_perf_state *table)
>                         found++;
>         }
>
> -       cpufreq_cpu_put(policy);
> -
>         if (!found)
>                 return;
>

The above changes are fine now and can be a separate patch.

> @@ -787,21 +784,19 @@ static void em_check_capacity_update(void)
>
>         /* Check if CPUs capacity has changed than update EM */
>         for_each_possible_cpu(cpu) {

But I'd prefer the code in this loop to be moved into a separate
function, in a separate patch, before the __free()-based
simplification of it.

> -               struct cpufreq_policy *policy;
>                 struct em_perf_domain *pd;
>                 struct device *dev;
>
>                 if (cpumask_test_cpu(cpu, cpu_done_mask))
>                         continue;
>
> -               policy =3D cpufreq_cpu_get(cpu);
> +               struct cpufreq_policy *policy __free(put_cpufreq_policy) =
=3D cpufreq_cpu_get(cpu);
>                 if (!policy) {
>                         pr_debug("Accessing cpu%d policy failed\n", cpu);
>                         schedule_delayed_work(&em_update_work,
>                                               msecs_to_jiffies(1000));
>                         break;
>                 }
> -               cpufreq_cpu_put(policy);
>
>                 dev =3D get_cpu_device(cpu);
>                 pd =3D em_pd_get(dev);
> --

