Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2041CAC58B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxirNakCW5Y4uygUagvcPttDkjZ9p6EjGq3aHiHAB2c=; b=BOJOt9/8BMdWLQftkJMvXr2ful
	gWiJ2JmjOVTpjKJIKyCnF7iwY9x2z739PVjMU22WDUp3QcIVvBE66J5tnzq75Fn7VpBowuv3032z4
	zPw9rUu1fTuWMJGdYSwAguCvTruCUbJNyeHcPpbslLJnkAKEAxbrP/dm2F8kaczB4K9DPdt0YtZKU
	konvLfVDwXYLFBPwwHzmqr9Y4fYsMEHmEYwiwXGbNoObhsrPQIOTxJO87cfwPcGD96Oq12N7NjLTt
	T1q7UjNor+Blk6yyaEsvebab8eV920XDSB9JmBfdXUjb/YRCvTy50mH/h8/r5JIjr+97zfCHVgSAO
	5COoefXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlel-000000033GX-2LJU;
	Mon, 08 Sep 2025 23:52:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfuY-00000001Hut-3aXh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 17:44:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AB126021F
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Sep 2025 17:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B45C113D0
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Sep 2025 17:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757353453;
	bh=pxv4SKGaeo+/iwpYsHET1lGXi6vy1Me0WnNKi9ZjTC0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZwMfmhapoldvlFOiIwZqWN68UI9FDn5DoJ/kGkFvNIKt/vRabP5Mn+uMhSJqLi76b
	 rYpyj5EGPnVZZNGXEOp13TH7G3kyO7lDDYhnq4wTxDMgDRsdjezuEsBzKYGQzvNxgg
	 opfm0sATzEU688RwQzya4Fhzw5jKShM4BbvFXG2bQITTOc3xs5xYH/suVG7xWhj0Ug
	 42WOBJKgOXwZCmmmTCgYmwH+aUqZAex0bSNVhUWalaLAVTnOea4myoJvZzrsJjevNI
	 q9o36ppFB435akVqY7Al0qE22NTiU8EYViUNs4e+GKjbn3umZrdc05g0eaHWkP4GcU
	 mlBgghbxNO8vA==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-621998aecf8so242448eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 10:44:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4Ie9yiC3yIVuHwT7sCsF2g6Wh0+s/1RyT64sSuHE5pkcKzKPeKSbzChkOJaMddna0bN4JJFjfFSIclyoukT+H@lists.infradead.org
X-Gm-Message-State: AOJu0YyURrIrBl+Zfs2D99BT4w0jFKiQJJuHbMVztMk/uuyMIWsu7aOA
	yRZnaJXmaoQoZdcA70lPxPn4Oavr9FhFqlgPCsMALG6OgmlWJpmqWGf8neoJDTmG7PLPTlW+DIC
	c/Oq47vxQUuSr4I7luJEphlSKnoLll28=
X-Google-Smtp-Source: AGHT+IEmLNooDlmw6mUZRYEbyTwg6KsbFI0N3/Ra3KC+hBAS5x57Hk+ruqmJHv0ou2jqI/XILrzNZEQVMGT+C7Z3Oeg=
X-Received: by 2002:a05:6808:198f:b0:439:b82f:ce with SMTP id
 5614622812f47-43b29b4d9d1mr3597972b6e.31.1757353453065; Mon, 08 Sep 2025
 10:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
 <20250905132413.1376220-3-zhangzihuan@kylinos.cn> <CAJZ5v0iTdgM5BBi2ysiJxfA2c=MQ0fjLsEvVct9stxomvEe=4Q@mail.gmail.com>
 <6683fb5a-64f4-433e-a22b-153b01dfa572@kylinos.cn>
In-Reply-To: <6683fb5a-64f4-433e-a22b-153b01dfa572@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Sep 2025 19:44:01 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h9pYXi4Op4zAA+Q7QZz5gkJg+83eKUCqM-YKh76CVLKg@mail.gmail.com>
X-Gm-Features: Ac12FXxUqqlT9sudI62ao99U1pS-dgaUtp-l-yYYj3dQjoUJWeYTt-vc3mF_8T8
Message-ID: <CAJZ5v0h9pYXi4Op4zAA+Q7QZz5gkJg+83eKUCqM-YKh76CVLKg@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] ACPI: processor: thermal: Use scope-based cleanup helper
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
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

On Mon, Sep 8, 2025 at 11:16=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylinos.c=
n> wrote:
>
>
> =E5=9C=A8 2025/9/6 04:17, Rafael J. Wysocki =E5=86=99=E9=81=93:
> > On Fri, Sep 5, 2025 at 3:24=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylino=
s.cn> wrote:
> >> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> >> annotation for policy references. This reduces the risk of reference
> >> counting mistakes and aligns the code with the latest kernel style.
> >>
> >> No functional change intended.
> >>
> >> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> >> ---
> >>   drivers/acpi/processor_thermal.c | 52 +++++++++++++++++-------------=
--
> >>   1 file changed, 27 insertions(+), 25 deletions(-)
> >>
> >> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor=
_thermal.c
> >> index 1219adb11ab9..460713d1414a 100644
> >> --- a/drivers/acpi/processor_thermal.c
> >> +++ b/drivers/acpi/processor_thermal.c
> >> @@ -62,19 +62,14 @@ static int phys_package_first_cpu(int cpu)
> >>          return 0;
> >>   }
> >>
> >> -static int cpu_has_cpufreq(unsigned int cpu)
> >> +static bool cpu_has_cpufreq(unsigned int cpu)
> >>   {
> >> -       struct cpufreq_policy *policy;
> >> -
> >>          if (!acpi_processor_cpufreq_init)
> >>                  return 0;
> >>
> >> -       policy =3D cpufreq_cpu_get(cpu);
> >> -       if (policy) {
> >> -               cpufreq_cpu_put(policy);
> >> -               return 1;
> >> -       }
> >> -       return 0;
> >> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D c=
pufreq_cpu_get(cpu);
> >> +
> >> +       return policy !=3D NULL;
> >>   }
> >>
> >>   static int cpufreq_get_max_state(unsigned int cpu)
> > The changes above are fine and can be sent as a separate patch.
> >
> >> @@ -93,12 +88,31 @@ static int cpufreq_get_cur_state(unsigned int cpu)
> >>          return reduction_step(cpu);
> >>   }
> >>
> >> +static bool cpufreq_update_thermal_limit(unsigned int cpu, struct acp=
i_processor *pr)
> >> +{
> >> +       unsigned long max_freq;
> >> +       int ret;
> >> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D c=
pufreq_cpu_get(cpu);
> >> +
> >> +       if (!policy)
> >> +               return false;
> >> +
> >> +       max_freq =3D (policy->cpuinfo.max_freq *
> >> +               (100 - reduction_step(cpu) * cpufreq_thermal_reduction=
_pctg)) / 100;
> >> +
> >> +       ret =3D freq_qos_update_request(&pr->thermal_req, max_freq);
> >> +       if (ret < 0) {
> >> +               pr_warn("Failed to update thermal freq constraint: CPU=
%d (%d)\n",
> >> +         pr->id, ret);
> >> +       }
> > But this silently fixes a bug in the original code which needs to be
> > documented with a Fixes: tag (and it would be better to fix the bug
> > separately before the using the __free()-based cleanup TBH) and
> > introduces some whitespace breakage.
>
> Thanks!
>
>   I=E2=80=99ll follow your advice and handle the Fixes tag and whitespace=
 issues.

Actually, no need to resend.

The current code is correct as it registers and unregisters the freq
QoS request from cpufreq policy notifiers, so the policy is guaranteed
to be there when cpufreq_set_cur_state() runs.

