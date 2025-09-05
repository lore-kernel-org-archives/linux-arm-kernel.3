Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED46FCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUof8FNJjqawWl7XUHn/l0WxTZAh0HwBiWCgXUvtCww=; b=2W3Q1F+ZQL3kBQRrmKiIEl8I28
	22JuQNi4MohIXnenaWSuce8c2O9wpHEHhDXcP4N5XVOxVPFV+eMw31gyYYtXvd/vSlS1SpzEqhD+T
	/UDFCkiMdKnQsFro09GLzf6UKHdrDQbHatq8WdVEPDj18qYGWWxuYdATTKCwXJvBs1O3v5vTChSlX
	f+p1DBM7BLrMpHV8OFcnJbC8va4hTRC0psUogpEuZ7V+zcZZzagDR2JtsklugLDZ+aqaXX6e9lHjK
	Giv6auzx6poBNs75LP9tPz1rgT0f8pdmhZ1bX/TqEOMWEonqiFvloW0WTyGSV7X48ojhL5B8rHfvH
	5lTdPing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugYH-00000005WlP-3vY6;
	Sat, 06 Sep 2025 00:13:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uucsN-00000004PB4-3HC1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 20:17:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB58A602A6
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 20:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9512DC4CEF9
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 20:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757103458;
	bh=VCWnUGzPf6mLuDmms/YZCG2llaFLvKJwA1gnXCCbRdk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uIKc5zt24/XZwP7JYEqTfBfFRmX6Wk9YHD8HxEi0IvUGCXmYhq0zMpSm8supQ0Fb5
	 iJGS/xoCTwpWx6B21zvCyX58JiG6wKZeHnfKV9PrzdFD8g77UCWMhwV/+VxR8kAvlQ
	 yPVyT4akXZx6QFmh+sC2ZrMWYx9v4XhPjX4ZqEzVtRypqr58ssUWkgaJb/JjbHDIS4
	 Q06psN5PW+ZumYVyodesqKh7Uj5j1bR2yhf3Z/vTbdtMhbmMxPQZsd1C7tcDa8a8kX
	 RxRMOqOPKJoPYzcqOhn1uU/Cd9d8rzzAEwXshP6QHtlDLuGvIqnZfJzgThdRl7C/Wq
	 nxK2iLAKYjwYQ==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-61bd4ad64c7so801132eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 13:17:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWj9zpYhNcMzaZbaN28A5Km2HS6HtJPChcro83wjMslfIcJQYIJtfcUyjUWltvsCVWo0OgVN1RWJV8rvtQ+bKeU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4JBgdBEC4ImRRcPXu1B/c1cAeY7UEemRRcZi4EVrOlI9aAb5C
	QGrBr874VOrnSEbei55nRsns1lyqhLidsRPyZhoAVzECIor1wz1bUg8bYIxUOJRrcHjxokhC8RH
	zr01gipD157NPWdUqrPMhlUcA6nSijZc=
X-Google-Smtp-Source: AGHT+IEfq1HNckIyyDDXquy0XLtyGZg1XWmotG9HdXFUDIR4D+v0h/9IrUo3g6diO4+f6WOXTRuaooZELa2e+VnSV5o=
X-Received: by 2002:a05:6820:809:b0:61f:f932:8d64 with SMTP id
 006d021491bc7-61ff9329264mr2455383eaf.1.1757103457768; Fri, 05 Sep 2025
 13:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn> <20250905132413.1376220-3-zhangzihuan@kylinos.cn>
In-Reply-To: <20250905132413.1376220-3-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 5 Sep 2025 22:17:26 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iTdgM5BBi2ysiJxfA2c=MQ0fjLsEvVct9stxomvEe=4Q@mail.gmail.com>
X-Gm-Features: Ac12FXw3PBjsIjj4AtBsEfmKTR7PfZEmevzc6Jwe0zbtA2TuWwqukJr66Nf1sL8
Message-ID: <CAJZ5v0iTdgM5BBi2ysiJxfA2c=MQ0fjLsEvVct9stxomvEe=4Q@mail.gmail.com>
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

The changes above are fine and can be sent as a separate patch.

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

But this silently fixes a bug in the original code which needs to be
documented with a Fixes: tag (and it would be better to fix the bug
separately before the using the __free()-based cleanup TBH) and
introduces some whitespace breakage.

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

