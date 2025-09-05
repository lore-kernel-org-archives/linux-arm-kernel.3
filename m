Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25026CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhHz+TFr6n8MBsawIb4Oc3dwbFBJk4FHeDQHAJj5oGk=; b=G3Jc18bGuvtwqk2W9poG8u77Ru
	nxG6wxU8IMRmXEQJCSKpi5d1iKYPuEBvAXZ9yPD2yK1M/CLhUhGwmwqRFcNum7/n4nrgePoxS46LI
	YKc/LpvUw6HzhLuePgToHeJJr2xOOqFwlEzOQL9+QOPVc+/+NzIE58FGhZlSMOPn42ts00Uw751KY
	aRxTwA4y0J0T7wcaihMHtnK83gpRiAdzMBM9TPBqDKvM+2gBHUanLpIv8qPw/HV18C7uq+ZD7ULir
	Fv9YrUOmJqZruME54R8tvbzopMdztUG66KyBkKqO1EpA+ux12EmnJXSZcbiCElBqHbMYHeAf2zgFq
	3DfXADZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaQl-00000003Xgt-3swp;
	Fri, 05 Sep 2025 17:40:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWY1-0000000200W-0VDm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 13:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 54A1244D03
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 13:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23083C19425
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 13:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757079131;
	bh=8jAcdpkwkSpwOdJxvwA2Vj7xEHXguZJ+MKwk0qNCAa4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YDLPRfxE+TA2Q55nxy+S45umyans+pDRvwbObVt0bW3hJ3GKjbxPrVlX07NomP+MM
	 gilJHDzfgmGFOcAFu0+loSilTzpkeDO9g9x8k2BAevsNOqWlkswrDpHfRJW58By2gZ
	 h5T2iOat+XnnhSD9UwBeQ3xYHCYi7jaP+GtkcpXBdqab/ccFdCeVstKHtgcieR/3QH
	 +KRTayLgDC1M/LhwjwPtXIccD6HoAsAvaea3u1dA7qTzCEzjxT3V+HO3EHQdCVNDFU
	 /St9BM0FbaHx4JdEUTHAM1R9DDj8M5cKZD+5HIpQks7AUiitM6xvVlMUYXsHzcS8lI
	 bWTNhY8srV4ig==
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-74526ca79beso1847719a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 06:32:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUaEnNXme4D0RH3RET3Qxynbl90WIYYLVQRCQ4RiVi7B6IkiE26KP6orhH4WNA2M+hSb6S5KjdFJ2M9JSKyFtF7@lists.infradead.org
X-Gm-Message-State: AOJu0YwBe21jW0KBx8uZtNPQ4iuZahzAooUAD3m/nb5GDqQD14yd5bE/
	sqGLwZjzeEObjHyUP66RUgNvPZlSsFmq2V1PFVVnb+JRDwy26h6Gw3So0qOtSOJn/XAV0igvnCW
	uc9V+lipoRKq3oRQCDGRSSNUW3/BMC6E=
X-Google-Smtp-Source: AGHT+IFnE56n2ZWY3m6GFquWJS3R+4zyRWG4mn/x7Tvk/fQPvR7/F7IjMN/5eFQpLDwVxaDdPh5JX7KANJsrFqH4mJc=
X-Received: by 2002:a05:6830:378e:b0:741:a5f0:bc82 with SMTP id
 46e09a7af769-74569e53d0dmr13231613a34.17.1757079130135; Fri, 05 Sep 2025
 06:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn> <20250905132413.1376220-4-zhangzihuan@kylinos.cn>
In-Reply-To: <20250905132413.1376220-4-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 5 Sep 2025 15:31:58 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jdJZ2upvE4KzDnc59KpMX+oqYbq=ZW=SXfwvjBctMj3Q@mail.gmail.com>
X-Gm-Features: Ac12FXwR6ToJkYo5xTTss3xr-Ox8ITso59X_uvklZva98cFgnVHnG6meS0I7mt8
Message-ID: <CAJZ5v0jdJZ2upvE4KzDnc59KpMX+oqYbq=ZW=SXfwvjBctMj3Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] cpufreq: intel_pstate: Use scope-based cleanup helper
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
X-CRM114-CacheID: sfid-20250905_063213_197174_05426C5B 
X-CRM114-Status: GOOD (  23.11  )
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
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

No, sorry.  I've already said that this isn't going to work:

https://lore.kernel.org/linux-pm/CAJZ5v0gN1T5woSF0tO=3DTbAh+2-sWzxFjWyDbB7w=
G2TFCOU01iQ@mail.gmail.com/

so why are you resending it?

And making changes to it in the process without saying what they are?

Please stop adding confusion.

> ---
>  drivers/cpufreq/intel_pstate.c | 59 +++++++++++++++++++---------------
>  1 file changed, 33 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstat=
e.c
> index f366d35c5840..0b54e08f9447 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -1502,9 +1502,8 @@ static void __intel_pstate_update_max_freq(struct c=
pufreq_policy *policy,
>
>  static bool intel_pstate_update_max_freq(struct cpudata *cpudata)
>  {
> -       struct cpufreq_policy *policy __free(put_cpufreq_policy);
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpudata->cpu);
>
> -       policy =3D cpufreq_cpu_get(cpudata->cpu);
>         if (!policy)
>                 return false;
>
> @@ -1695,41 +1694,49 @@ static ssize_t store_no_turbo(struct kobject *a, =
struct kobj_attribute *b,
>         return count;
>  }
>
> -static void update_qos_request(enum freq_qos_req_type type)
> +static bool intel_pstate_cpufreq_update_limits(int cpu, enum freq_qos_re=
q_type type)
>  {
>         struct freq_qos_request *req;
> -       struct cpufreq_policy *policy;
> -       int i;
> +       unsigned int freq, perf_pct;
> +       struct cpudata *data =3D all_cpu_data[cpu];
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpu);
>
> -       for_each_possible_cpu(i) {
> -               struct cpudata *cpu =3D all_cpu_data[i];
> -               unsigned int freq, perf_pct;
> +       if (!policy)
> +               return false;
>
> -               policy =3D cpufreq_cpu_get(i);
> -               if (!policy)
> -                       continue;
> +       req =3D policy->driver_data;
>
> -               req =3D policy->driver_data;
> -               cpufreq_cpu_put(policy);
> +       if (!req)
> +               return false;
>
> -               if (!req)
> -                       continue;
> +       if (hwp_active)
> +               intel_pstate_get_hwp_cap(data);
>
> -               if (hwp_active)
> -                       intel_pstate_get_hwp_cap(cpu);
> +       if (type =3D=3D FREQ_QOS_MIN) {
> +               perf_pct =3D global.min_perf_pct;
> +       } else {
> +               req++;
> +               perf_pct =3D global.max_perf_pct;
> +       }
>
> -               if (type =3D=3D FREQ_QOS_MIN) {
> -                       perf_pct =3D global.min_perf_pct;
> -               } else {
> -                       req++;
> -                       perf_pct =3D global.max_perf_pct;
> -               }
> +       freq =3D DIV_ROUND_UP(data->pstate.turbo_freq * perf_pct, 100);
>
> -               freq =3D DIV_ROUND_UP(cpu->pstate.turbo_freq * perf_pct, =
100);
> +       if (freq_qos_update_request(req, freq) < 0)
> +               pr_warn("Failed to update freq constraint: CPU%d\n", cpu)=
;
>
> -               if (freq_qos_update_request(req, freq) < 0)
> -                       pr_warn("Failed to update freq constraint: CPU%d\=
n", i);
> +       return true;
> +}
> +
> +
> +static void update_qos_request(enum freq_qos_req_type type)
> +{
> +       int i;
> +
> +       for_each_possible_cpu(i) {
> +               if (!intel_pstate_cpufreq_update_limits(i, type))
> +                       continue;
>         }
> +
>  }
>
>  static ssize_t store_max_perf_pct(struct kobject *a, struct kobj_attribu=
te *b,
> --
> 2.25.1
>
>

