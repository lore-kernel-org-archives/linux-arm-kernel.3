Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D356CCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bvlp9QpXI8QOMlTWbQnnIVGa+KEAXDjT4IoqDRRRoZM=; b=L49u/ibRCTmfM56dYiGpb3zTHd
	ug6mrP38bIpQYfuLouChKde1K8NYs8cdkRC3zVAhfz00hWHiTtIZXRJ+3lD6L/Kwc/Evxm3KAXWvT
	rmwmjtr0v8h7nIM5OGLS/UyOvK0ZO7hcKZEuB1GHvd5Ydw6he7MTzJ9e8TrujmAlabA0Q5K30Rmhe
	+tUjAe4EGII+NC0sRZVmJTYNOqD8OpLXFDrtp2fKhXHqLS7yNw/lbTdN3mqfSMI4MfIuzfTHQuM9R
	Hgzvo7QwimTXYutcU4u1WymM/nltHjt6bxQoIXb/whxFRVc/tJ0KFzgOSmnoUO1+v+PCxGssN9o/D
	+NLp/Thw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXWS-00000002M6a-1TUa;
	Fri, 05 Sep 2025 14:34:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuT3d-00000000qUw-0fX5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 09:48:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D74CC44D45
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 09:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA59BC4CEFE
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757065716;
	bh=60j1mYXfx8imU4XQiFjnOOvCwt0U79tykqDPzODIpZo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=maFSgfUyMQwnqV1XKC3DkrSxo3c4Gr1bocEJUa0cLC/fCnWL7VKM4c2Bo9v1SmE4u
	 yVQjdnUaUzl/q7oOdXDTBWOziVgkW3OUauQ8yDbUzkhD+Ea/pnt8pUGe+qn8Hxy6DP
	 errowBQd2WgD8DTePq4VnEhBOJnbeJmsXbrCagkdiWyhFzq39BzhmUenO0511YEV7n
	 jg+iBtIvamrBFBb9f8DY9bEXpN3pl+sA7SKU5wB9iLK+S2xWlmrKw+vsNDCdZOVn3Y
	 RFDI8L2baCVkbbjmpaN5vYKIn9ynTjCxTDJPLLx6OTo4NvTKH9jSoNhMTydU60UEnS
	 1fR3EU3FDmD7Q==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-61ff9c5a0c6so364532eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 02:48:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWievO8MmfHDlMddCSW6KPhCDrxTr0DfBLP1NMJ4CTGXsF16vcCh9TELrI7qybsMW14pD3yEWTYy3M2cugeIvzR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq/WMYJPq/TI5cIPEDc/VS88shZ/Pr0+G3cFHXNUbmrvo/7dYf
	8dSpFkQ5VnqPLEHSh7kcQUgYYg08LbdqzobRMiHXcboJILi7wcyvfUw2uaoS6HVjBmVUhl7TLCI
	qJFV0SYLRmaDwgqQ53jyk6MhkintL6k4=
X-Google-Smtp-Source: AGHT+IHkVwjUQLo7sTj2SxSH10cahTF1EYNw9jM6xcyVmF8yMApnd+1WPw0MFaTQWrdPzjCgm5hFMvaNgP7dcxRbczQ=
X-Received: by 2002:a05:6820:1b96:b0:61e:154c:5b01 with SMTP id
 006d021491bc7-61e3374776emr14360839eaf.6.1757065715741; Fri, 05 Sep 2025
 02:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn> <20250903131733.57637-4-zhangzihuan@kylinos.cn>
In-Reply-To: <20250903131733.57637-4-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 5 Sep 2025 11:48:22 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gN1T5woSF0tO=TbAh+2-sWzxFjWyDbB7wG2TFCOU01iQ@mail.gmail.com>
X-Gm-Features: Ac12FXwjp9ef-jXM-6Nr2o91cs1h2j3e0FpihiJghXWzXAbogv1aACVXGXzJKyM
Message-ID: <CAJZ5v0gN1T5woSF0tO=TbAh+2-sWzxFjWyDbB7wG2TFCOU01iQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] cpufreq: intel_pstate: Use scope-based cleanup helper
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
X-CRM114-CacheID: sfid-20250905_024837_239928_55EFE91B 
X-CRM114-Status: GOOD (  26.08  )
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
>  drivers/cpufreq/intel_pstate.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstat=
e.c
> index f366d35c5840..925efb1e65be 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -1209,6 +1209,17 @@ static bool hybrid_clear_max_perf_cpu(void)
>         return ret;
>  }
>
> +static struct freq_qos_request *intel_pstate_cpufreq_get_req(int cpu)
> +{
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
> +               cpufreq_cpu_get(cpu);
> +
> +       if (!policy)
> +               return NULL;
> +
> +       return policy->driver_data;
> +}
> +
>  static void __intel_pstate_get_hwp_cap(struct cpudata *cpu)
>  {
>         u64 cap;
> @@ -1698,19 +1709,13 @@ static ssize_t store_no_turbo(struct kobject *a, =
struct kobj_attribute *b,
>  static void update_qos_request(enum freq_qos_req_type type)
>  {
>         struct freq_qos_request *req;
> -       struct cpufreq_policy *policy;
>         int i;
>
>         for_each_possible_cpu(i) {
>                 struct cpudata *cpu =3D all_cpu_data[i];
>                 unsigned int freq, perf_pct;
>
> -               policy =3D cpufreq_cpu_get(i);
> -               if (!policy)
> -                       continue;
> -
> -               req =3D policy->driver_data;
> -               cpufreq_cpu_put(policy);
> +               req =3D intel_pstate_cpufreq_get_req(i);
>
>                 if (!req)
>                         continue;
> --

This change would have been fine if the modified code had been
correct.  Unfortunately, this is not the case because below req is
passed to freq_qos_update_request() which accesses the policy object
indirectly through it, so the policy object should be
reference-counted until freq_qos_update_request() completes.

I will send a fix for this shortly (it is better to fix it before
rearranging the code to allow the fix to be backported more easily)
along with my version of the change in question.

Thanks!

