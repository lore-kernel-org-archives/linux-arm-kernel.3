Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE4FCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4d4ELijWFysTvUoj4E+6DA+dwY8T61+/8XaBDrbjhpY=; b=Zw5FwIgk6Tq+MRW5ZSozSsAFE+
	he3UaFf2xjn7Ag9dPQ/SzuxEDJEuACYub5zSZisogJRhMah+H6FqDytlFkIeqMaq9LA9/Wq+PZiUi
	lcuAcG0GMcNpt+9RUC3x5mLp0EiHbDJorlRMck7bWskGsN33bH14AR558fvQeZV023RP48Fe4ZvG1
	SqTDeg1FA1xIWSX0NbK2rJvmSPP4m7OB5ghRl2bXy9LRGB3Y/QJoRgMhM0XTttB+K5ejQvtIYcDZI
	jwZ6tVLt1Zo2ik4hoDdhtg85E7aRa0dqreNNUSp3JC6zUMmSRckGftfvBDMp1JBHE7WnwxFVKNaah
	ed4gQ6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvleo-000000033JP-0PCL;
	Mon, 08 Sep 2025 23:52:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvg5q-00000001M1G-2pm6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 17:55:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D6806022B
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Sep 2025 17:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88306C19424
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Sep 2025 17:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757354153;
	bh=z211wSU9k+wQQZV8T70JLX0guTp2A3fKrmuOqpzLycw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dLkL6IyGSzVs97Dn2zc5CR0vuYMwwXdjTpXsdcSc7FK6RgMbAehryO6P2g4tfH2wN
	 xVBncyAAs5yAarohKHABq0i5Gv00ASROSKqjSXO2bVQIWMZS9y0Z6t8i2QjWyeaXHY
	 06vK7d/zNLUQBtGYZnKUW9wqcNaLQdz5WQ1ZdOvVxNGq2KhsDve7cqUBFLg4XWlAfS
	 1647C2TbbdfyBkW/71duf/CJg8w2awwvmiYvSPPP5P/UaZlhFVCmHjvHYRgw8KF36f
	 SMqJDZsbwXeNxg83fl2u3O848CM+s/zcBNmqLkBc6+GxW6RUrToKpOd2AZIpqy6uFk
	 f4ItmibaFkVhQ==
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-435d3a45a3fso2632052b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 10:55:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDQs5fzRl+8Wj0KvsmdgQZmzmr+zydklGejxgqDMWKF9o2udHIYNmfdc2azoaWqW7jiZNnEs4+X7yH0k3L2xWZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwQSm3WN3R5F4UfEZH7nTwPwytPOHZMItuZ9ZTGCAeb2rCIjbIU
	Mw5bsd97PzRPR/mnO4L/0PEJebdYuKs9fq6KLbeCq58irLIAvlQhCA4A9OgU8+EUneSaH9EicJ1
	ETg0AM61b38xcGhWKgq22rP3+V0AgdZg=
X-Google-Smtp-Source: AGHT+IFczhoCSnnG5YLUZfh7wkMCNzRn78TlsoAFyrDZq9bCKjUOefg3nxoG74Oz37mTKBW6389SIILJkVhhZvHpYYM=
X-Received: by 2002:a05:6808:68d3:10b0:43b:503e:6ecb with SMTP id
 5614622812f47-43b503ec4f4mr623073b6e.13.1757354152690; Mon, 08 Sep 2025
 10:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn> <20250905132413.1376220-3-zhangzihuan@kylinos.cn>
In-Reply-To: <20250905132413.1376220-3-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Sep 2025 19:55:41 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gsH1PoGNUpxNE7oEBxJ3dBHBLrkeRE0h-DsF25NFKqQA@mail.gmail.com>
X-Gm-Features: Ac12FXxYXLTfmPsZZpVrMXtRDtGdwPa34ts6sBOi7tLf54i6Za0SxLIO-pbCGrE
Message-ID: <CAJZ5v0gsH1PoGNUpxNE7oEBxJ3dBHBLrkeRE0h-DsF25NFKqQA@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] ACPI: processor: thermal: Use scope-based cleanup helper
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

On Fri, Sep 5, 2025 at 3:24=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.cn=
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
>  drivers/acpi/processor_thermal.c | 52 +++++++++++++++++---------------
>  1 file changed, 27 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_th=
ermal.c
> index 1219adb11ab9..460713d1414a 100644
> --- a/drivers/acpi/processor_thermal.c
> +++ b/drivers/acpi/processor_thermal.c
> @@ -62,19 +62,14 @@ static int phys_package_first_cpu(int cpu)
>         return 0;
>  }
>
> -static int cpu_has_cpufreq(unsigned int cpu)
> +static bool cpu_has_cpufreq(unsigned int cpu)
>  {
> -       struct cpufreq_policy *policy;
> -
>         if (!acpi_processor_cpufreq_init)
>                 return 0;
>
> -       policy =3D cpufreq_cpu_get(cpu);
> -       if (policy) {
> -               cpufreq_cpu_put(policy);
> -               return 1;
> -       }
> -       return 0;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpu);
> +
> +       return policy !=3D NULL;
>  }
>
>  static int cpufreq_get_max_state(unsigned int cpu)
> @@ -93,12 +88,31 @@ static int cpufreq_get_cur_state(unsigned int cpu)
>         return reduction_step(cpu);
>  }
>
> +static bool cpufreq_update_thermal_limit(unsigned int cpu, struct acpi_p=
rocessor *pr)
> +{
> +       unsigned long max_freq;
> +       int ret;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpu);
> +
> +       if (!policy)
> +               return false;
> +
> +       max_freq =3D (policy->cpuinfo.max_freq *
> +               (100 - reduction_step(cpu) * cpufreq_thermal_reduction_pc=
tg)) / 100;
> +
> +       ret =3D freq_qos_update_request(&pr->thermal_req, max_freq);
> +       if (ret < 0) {
> +               pr_warn("Failed to update thermal freq constraint: CPU%d =
(%d)\n",
> +         pr->id, ret);
> +       }
> +
> +       return true;
> +}
> +
>  static int cpufreq_set_cur_state(unsigned int cpu, int state)
>  {
> -       struct cpufreq_policy *policy;
>         struct acpi_processor *pr;
> -       unsigned long max_freq;
> -       int i, ret;
> +       int i;
>
>         if (!cpu_has_cpufreq(cpu))
>                 return 0;
> @@ -120,20 +134,8 @@ static int cpufreq_set_cur_state(unsigned int cpu, i=
nt state)
>                 if (unlikely(!freq_qos_request_active(&pr->thermal_req)))
>                         continue;
>
> -               policy =3D cpufreq_cpu_get(i);
> -               if (!policy)
> +               if (!cpufreq_update_thermal_limit(i, pr))
>                         return -EINVAL;
> -
> -               max_freq =3D (policy->cpuinfo.max_freq *
> -                           (100 - reduction_step(i) * cpufreq_thermal_re=
duction_pctg)) / 100;
> -
> -               cpufreq_cpu_put(policy);
> -
> -               ret =3D freq_qos_update_request(&pr->thermal_req, max_fre=
q);
> -               if (ret < 0) {
> -                       pr_warn("Failed to update thermal freq constraint=
: CPU%d (%d)\n",
> -                               pr->id, ret);
> -               }
>         }
>         return 0;
>  }
> --

Applied as 6.18 material under a new subject, with some minor edits in
the changelog, and with some minor whitespace breakage fixed.

Thanks!

