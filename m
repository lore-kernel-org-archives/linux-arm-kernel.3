Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62FBCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 12:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUEMWCyjNLMY3SgVq129UUhKf5B+UoA3qi5w2xxKRwo=; b=WxsKLTKJNzBZaPSZxsC/MsrjOR
	U4JC0cZUd2KCrArRsJhxzGl7IhFzh23kB2E3YMWpfWbtXaTD6/JF+Akd0x1FNTiMRVHNAiWDWEg15
	dFCWRTWQqwgg9Mz730QRHb3qObUOwjRjhcrYE4ZXxWqlwvI4HtmZAmAF0J4WeSrkcUwqRTRXd9C6j
	+ruaPaRtLD+6iG9zXQgjcJvkQvlqXE79wbcQ1/IFUmLrt4Q1cT/P671uzQtw/OyHHm86k2i1VDfQb
	bjQbyH9vK6hgWAz9DiRva+0rqxtNIkdj+K43wlMfi5sZo0dd33rT4pE8oHLrsix1GWw0vbODtxJBI
	iHr4WeoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmXO-00000006NVf-2ywT;
	Wed, 03 Sep 2025 12:24:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlL3-00000006BGf-3vit
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 11:07:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A99E744BEF
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 11:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C6CC19423
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756897661;
	bh=I5jJC5YsqDheZourzIns4HynVHdhk9fmj1JJIPP/qj8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fqEv+pAyAzyDrwpa5ycGv/vldrUVHpTuiDwGvEU2O6hGAiipiQXkldusw4kvuf6Ta
	 cyV691K7HV2CSSp8RoFgEXQf84IwuC16kmYKwmqprM4hACuabw/Z49bNoigh1mbEVi
	 lfVSk0I2yERql792+nQOshGycv64BeF9PB3eQ5nWjt+fGlrVe/cR9xNBoxCPamJrks
	 yVsq4p2oAGuZ5xkOC8mK0WErUxsBMrB2HOYx2elO7r0rSGI9RKr76w6rqsVHTkCBqv
	 Yq7iI8uXw1FkSRxTENbSKEf2moleyaF/1d2WgigF4GfkMeRbER5SxoiWsyCxL1V2R/
	 ofS+YYpOUUEJQ==
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7459de59821so150471a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 04:07:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0CXShhf6/pEcEiAxEG5OSaKSzIHm5xvLSgQ4c0CGSAk9YqxCk6BPeBF92UrPpcBm8bz2gjnhsazOhe/E6V/Ok@lists.infradead.org
X-Gm-Message-State: AOJu0YwOc+9psdYIMj/jycVGyc/r/BRYx19W1++kEP9+02T5bynengEx
	j6ZdYNFhm1gjA7LPqU2XVfYDAObAMbmfHwHQE/RQBVGj8OFkDPY4nLlcbXiyLNjy14lO7GuKC+F
	4CJFPeK52qm0u4C3cFWU1WcGqPl+53Lg=
X-Google-Smtp-Source: AGHT+IFm2i7E3heNFR05VvLVwsYMlRgIplk+0JGJpDoA3hxcK7mnkmts5Dorpw2CJryu3vWJY1lQqzZJZSMnb+GSebY=
X-Received: by 2002:a05:6830:2642:b0:745:508c:455c with SMTP id
 46e09a7af769-74569dc34b9mr7242918a34.8.1756897660735; Wed, 03 Sep 2025
 04:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250901085748.36795-1-zhangzihuan@kylinos.cn> <20250901085748.36795-3-zhangzihuan@kylinos.cn>
In-Reply-To: <20250901085748.36795-3-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 3 Sep 2025 13:07:27 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jxHQ3fBk_fSwg7QYsePvUyh=FDteyO+8F8oGfUwX2E9A@mail.gmail.com>
X-Gm-Features: Ac12FXxXhqpwDXjodHxvBBGUiHE126LWfl3UmWuK-7WK82DNR_r2zpKQkeauJig
Message-ID: <CAJZ5v0jxHQ3fBk_fSwg7QYsePvUyh=FDteyO+8F8oGfUwX2E9A@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] ACPI: processor: thermal: Use scope-based
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
X-CRM114-CacheID: sfid-20250903_040742_019401_E4747C78 
X-CRM114-Status: GOOD (  23.79  )
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
>  drivers/acpi/processor_thermal.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_th=
ermal.c
> index 1219adb11ab9..3c8b57df9619 100644
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
> @@ -95,7 +90,6 @@ static int cpufreq_get_cur_state(unsigned int cpu)
>
>  static int cpufreq_set_cur_state(unsigned int cpu, int state)
>  {
> -       struct cpufreq_policy *policy;
>         struct acpi_processor *pr;
>         unsigned long max_freq;
>         int i, ret;
> @@ -111,6 +105,9 @@ static int cpufreq_set_cur_state(unsigned int cpu, in=
t state)
>          * frequency.
>          */
>         for_each_online_cpu(i) {

I would still prefer the code below to be moved to a separate function
that would be called in each step of the for_each_online_cpu() loop.

> +               struct cpufreq_policy *policy __free(put_cpufreq_policy) =
=3D
> +                       cpufreq_cpu_get(i);
> +
>                 if (topology_physical_package_id(i) !=3D
>                     topology_physical_package_id(cpu))
>                         continue;
> @@ -120,15 +117,12 @@ static int cpufreq_set_cur_state(unsigned int cpu, =
int state)
>                 if (unlikely(!freq_qos_request_active(&pr->thermal_req)))
>                         continue;
>
> -               policy =3D cpufreq_cpu_get(i);
>                 if (!policy)
>                         return -EINVAL;
>
>                 max_freq =3D (policy->cpuinfo.max_freq *
>                             (100 - reduction_step(i) * cpufreq_thermal_re=
duction_pctg)) / 100;
>
> -               cpufreq_cpu_put(policy);
> -
>                 ret =3D freq_qos_update_request(&pr->thermal_req, max_fre=
q);
>                 if (ret < 0) {
>                         pr_warn("Failed to update thermal freq constraint=
: CPU%d (%d)\n",
> --
> 2.25.1
>
>

