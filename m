Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6B9CA1011
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 17:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCs8oZd35s7uPxgnx8pel5X2wUmSB89ledJAdHk0UJc=; b=Kj5HFkSIHFPgbl+fGk8tVxBtec
	0OMWX0S8Ewdpz8mh18oS/tgGhr240Mgj0ezE2kd07o25tgsu1vwLVf30MA3eFlSCV0veEo951wegx
	TOVmbb4aZp8IO0CFAPC/7a+B2Bt4y+Ic0dfTdrbBR5XXCREdr5hjRRAsM5EktNR1vc1XOVMxFQuZ6
	NFpiV8ihHBpioU11TZxzG1axRf0j5ea2dDsGEv6QmiGqrnv+4DTOiPtbYu4+i+XybclwB3ppWtUMI
	vqCzNwnyje/QjLUlfaRo2appYdU+J8R8InTnIC+2nNpYwhAnM/r6bwiwLQT8KRcTLmA0c38Iupd21
	/gSO1i2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utr5I-00000007A5N-3CGf;
	Wed, 03 Sep 2025 17:15:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnSh-00000006a0q-3pUl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:23:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 503B744C44
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 13:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240BCC4AF0D
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 13:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756905823;
	bh=MNOCIHc890ZPbX81TBDONhDZg01sJ8IBrTS7pqPoFeY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FPpEcytq9aWkc1yFeTV1Dy+aeuNeBTemmC5rC27NFDjKUzH1CdxdIHWINCnqSpQyg
	 6MPLBsnw4Z3tl5OS0ltj5etYNac8uIjuz057aJvwNe7lsvbnOqQCUi7M0eY+x7Vomw
	 frmLXLUfAZ6jPOjoGriyx9qMonLn3SEcX8AaAM5ZthdTfJD2zjQ2JB4v7ZtP1YTj0j
	 fCyX+AMirTsv/3c/wKdQzNdS98pJ6I4a+2bvdurMP4V39HcMssOqRBF0XMA94wFTpD
	 KowDCNR2fY9SpRavGHLrK4UyT5J/cdzwLBNrLagEGm3KeNl0fk8EyVO2a1R5JfvG/D
	 2ScWj8Uimqryg==
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-74381e207a0so4667531a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 06:23:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsM296/KHQI8D3sbS1B+NNWi4xQzIaYHTIi+Gc7KFF9QHc0diA9gaiKqBNSi9qpdAX7Om6zpG+EB4FhX2NFsU1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2f7wcLKMCzyFGUTA74sxrKL3LNkcnifLmZGMYGDmZY7xqX3/1
	3bqbprnkCGbJLxURtF2XwshnQ1qhrYzAwXycT7+t0D3xqntjLrZ3AmtS9DdLnLe8k6aSh1vs4Ef
	QSXApYPlUxVu13rYHxxDoNY0Ibfrj2+Q=
X-Google-Smtp-Source: AGHT+IF/Rvddiz3lwXC8DDW9/+npOMEcse4CHEj2QqCzERRaclrypAQPOhyZw11rYQSZDwxHFmim9Y4Gnx4KJlOQneM=
X-Received: by 2002:a05:6830:411c:b0:73b:2617:87f1 with SMTP id
 46e09a7af769-74569edcb41mr7583799a34.28.1756905822245; Wed, 03 Sep 2025
 06:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn> <20250903131733.57637-3-zhangzihuan@kylinos.cn>
In-Reply-To: <20250903131733.57637-3-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 3 Sep 2025 15:23:31 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j5O4Q72P-OLiR4RK4g8E5joi_gu_O4HZymh9hJvy551g@mail.gmail.com>
X-Gm-Features: Ac12FXyUy2bB6YBuDXd6gAvqnfWCJZTJ2jsW3Zhm6c3o2d27uMS2JyeGNtCLZcI
Message-ID: <CAJZ5v0j5O4Q72P-OLiR4RK4g8E5joi_gu_O4HZymh9hJvy551g@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] ACPI: processor: thermal: Use scope-based
 cleanup helper
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
X-CRM114-CacheID: sfid-20250903_062343_991867_6BB3F1D4 
X-CRM114-Status: GOOD (  24.00  )
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

On Wed, Sep 3, 2025 at 3:18=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.cn=
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
>  drivers/acpi/processor_thermal.c | 37 ++++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_th=
ermal.c
> index 1219adb11ab9..5043f17d27b7 100644
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
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpu);
>
>         if (!acpi_processor_cpufreq_init)
>                 return 0;
>
> -       policy =3D cpufreq_cpu_get(cpu);
> -       if (policy) {
> -               cpufreq_cpu_put(policy);
> -               return 1;
> -       }
> -       return 0;
> +       return !!policy;
>  }
>
>  static int cpufreq_get_max_state(unsigned int cpu)
> @@ -93,9 +88,23 @@ static int cpufreq_get_cur_state(unsigned int cpu)
>         return reduction_step(cpu);
>  }
>
> +static long long cpufreq_get_max_freq(unsigned int cpu)
> +{
> +       long long max_freq;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
> +               cpufreq_cpu_get(cpu);
> +
> +       if (!policy)
> +               return -EINVAL;
> +
> +       max_freq =3D (policy->cpuinfo.max_freq *
> +               (100 - reduction_step(cpu) * cpufreq_thermal_reduction_pc=
tg)) / 100;
> +
> +       return max_freq;
> +}
> +
>  static int cpufreq_set_cur_state(unsigned int cpu, int state)
>  {
> -       struct cpufreq_policy *policy;
>         struct acpi_processor *pr;
>         unsigned long max_freq;
>         int i, ret;
> @@ -120,14 +129,10 @@ static int cpufreq_set_cur_state(unsigned int cpu, =
int state)
>                 if (unlikely(!freq_qos_request_active(&pr->thermal_req)))
>                         continue;
>
> -               policy =3D cpufreq_cpu_get(i);
> -               if (!policy)
> -                       return -EINVAL;
> -
> -               max_freq =3D (policy->cpuinfo.max_freq *
> -                           (100 - reduction_step(i) * cpufreq_thermal_re=
duction_pctg)) / 100;
> +               max_freq =3D cpufreq_get_max_freq(cpu);
>
> -               cpufreq_cpu_put(policy);
> +               if (max_freq =3D=3D -EINVAL)
> +                       return -EINVAL;

Please also move the code below to the new function so it does not
need to return a value.

>
>                 ret =3D freq_qos_update_request(&pr->thermal_req, max_fre=
q);
>                 if (ret < 0) {
> --

