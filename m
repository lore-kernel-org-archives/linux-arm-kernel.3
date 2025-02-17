Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C066C021AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 12:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zr2pUxlJBm2TOCCs09jq0wzdOR2n6KgUEqs9NG+fgE8=; b=mZS5bxLBmxQgAJoWo1DooIHuwz
	gDbweGSzQJTnuXzqdIIwcOWP1VOd7nP27uvhigFgzq+mo0g7aGqQqSEiPY0/xH6DMeeIRmL4xVlgz
	xc2Co7VG6etsF9pHKsOQ/6bB29BKivjsmJNN5kklfMT3eDC2yuxDVR7B2HQSrBi/kYJAWwveGyBWA
	FNcWA1F4Mmke0IYgV1aVz9GqnIrPn1yeUeKdGyeqgYvWjNa9T2Ddq23bJ/v0pCUbCtXDCN+nGA2t8
	PSQg0uAkZZobDf/XoqnseRGRt4iR7EVzRd30qI88NpKjlHANfwLIMt/xZQ5W5QgACw2gJ7RnmItBU
	tb8QWUjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0GG-00000004SlH-1vbQ;
	Mon, 17 Feb 2025 12:30:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzgL-00000004Nb8-0PI8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:53:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B4805C5518
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 11:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49998C4CEF2
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 11:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739793179;
	bh=fALyPesKDexFLqrL682vo6Gg3diI4uJ8t5o+EuWB7lg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ga3BjvGmBpNta6i7xzE9CH2etGrzAJ0PbyRInlzWCm+mzOjBoi1eAPelwFhzDdD6v
	 EIRz1Bs+AM6q+ofQubnxQn7CZZaH4Ad1ld8U/zyoG+pZGi1HZqnseKugrDVqTmNh5T
	 DlySaHrNWqvJ1WmgsRFLpU4Qyov4ubv8MtGtvOu4dbp8DuLvHzBnuiAPIU475WW2SS
	 ih06UxrcB9CaCfbyIngebdDu/jcvqVd95ffetDzlewTdK1zilbdISHyDECB7K/8vLo
	 OsGTMs67/QHl5NKF+WR6STOkiwPqkIhyxtsW4zmYvi2hF5qMO5YFAjrleuKXIJg2F9
	 GJSUL5KcogFsQ==
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-726fec215d7so2693534a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 03:52:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWROuu6FCst4IHBvdKe5U3l5wyOueeb6fMrSBaAvlFmizd0EjchYJESaoqSQKGqG8lHnLqeHzViw4GZnZV++Kcb@lists.infradead.org
X-Gm-Message-State: AOJu0YwKWvc357nijYF2J9PdiVsoa9s0DAjEkWdlCMZ/2QWQRCPWyKGB
	58PoY6rPse+Nl0LKQUQV9kciKo7VOhhQ7uyIXfn9DnPSHGvXRx1PPGZVQP28+lV60W7EADBS1oh
	/KW3b59QqPobUTyEBM1ycx/X3RZE=
X-Google-Smtp-Source: AGHT+IFVVYYbfWFp50Vgm/8/jOG1dKsdvDum4jRfwfMYeu7eMmrCifCE4J9b/zE1tfHWUNE1oMSm7u8tEJSuPg+CO3k=
X-Received: by 2002:a05:6808:2e99:b0:3f3:c301:c9e3 with SMTP id
 5614622812f47-3f3eb0dfdcfmr5815289b6e.12.1739793178328; Mon, 17 Feb 2025
 03:52:58 -0800 (PST)
MIME-Version: 1.0
References: <20250131162439.3843071-1-beata.michalska@arm.com> <20250131162439.3843071-3-beata.michalska@arm.com>
In-Reply-To: <20250131162439.3843071-3-beata.michalska@arm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 17 Feb 2025 12:52:44 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g+yax=pT4m_2MTd9kUwbk5VBp2wkctTYJpFRU3myEjPQ@mail.gmail.com>
X-Gm-Features: AWEUYZnn9bgmOxkTXEcn87pSetveYQRe_SyW5ltWCODIphxbCVMgI8FLshf-Yx0
Message-ID: <CAJZ5v0g+yax=pT4m_2MTd9kUwbk5VBp2wkctTYJpFRU3myEjPQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com, sudeep.holla@arm.com, 
	will@kernel.org, catalin.marinas@arm.com, rafael@kernel.org, 
	viresh.kumar@linaro.org, sumitg@nvidia.com, yang@os.amperecomputing.com, 
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com, 
	zhanjie9@hisilicon.com, ptsm@linux.microsoft.com, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>, x86@kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_035301_223056_4AAB7294 
X-CRM114-Status: GOOD (  42.41  )
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

On Fri, Jan 31, 2025 at 5:25=E2=80=AFPM Beata Michalska <beata.michalska@ar=
m.com> wrote:
>
> Currently the CPUFreq core exposes two sysfs attributes that can be used
> to query current frequency of a given CPU(s): namely cpuinfo_cur_freq
> and scaling_cur_freq. Both provide slightly different view on the
> subject and they do come with their own drawbacks.
>
> cpuinfo_cur_freq provides higher precision though at a cost of being
> rather expensive. Moreover, the information retrieved via this attribute
> is somewhat short lived as frequency can change at any point of time
> making it difficult to reason from.
>
> scaling_cur_freq, on the other hand, tends to be less accurate but then
> the actual level of precision (and source of information) varies between
> architectures making it a bit ambiguous.
>
> The new attribute, cpuinfo_avg_freq, is intended to provide more stable,
> distinct interface, exposing an average frequency of a given CPU(s), as
> reported by the hardware, over a time frame spanning no more than a few
> milliseconds. As it requires appropriate hardware support, this
> interface is optional.
>
> Note that under the hood, the new attribute relies on the information
> provided by arch_freq_get_on_cpu, which, up to this point, has been
> feeding data for scaling_cur_freq attribute, being the source of
> ambiguity when it comes to interpretation. This has been amended by
> restoring the intended behavior for scaling_cur_freq, with a new
> dedicated config option to maintain status quo for those, who may need
> it.

In case anyone is waiting for my input here

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

for this and the previous patch and please feel free to route them
both through ARM64.

Thanks!

> CC: Jonathan Corbet <corbet@lwn.net>
> CC: Thomas Gleixner <tglx@linutronix.de>
> CC: Ingo Molnar <mingo@redhat.com>
> CC: Borislav Petkov <bp@alien8.de>
> CC: Dave Hansen <dave.hansen@linux.intel.com>
> CC: H. Peter Anvin <hpa@zytor.com>
> CC: Phil Auld <pauld@redhat.com>
> CC: x86@kernel.org
> CC: linux-doc@vger.kernel.org
>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> Reviewed-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>  Documentation/admin-guide/pm/cpufreq.rst | 17 +++++++++++++-
>  drivers/cpufreq/Kconfig.x86              | 12 ++++++++++
>  drivers/cpufreq/cpufreq.c                | 30 +++++++++++++++++++++++-
>  3 files changed, 57 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/adm=
in-guide/pm/cpufreq.rst
> index a21369eba034..3950583f2b15 100644
> --- a/Documentation/admin-guide/pm/cpufreq.rst
> +++ b/Documentation/admin-guide/pm/cpufreq.rst
> @@ -248,6 +248,20 @@ are the following:
>         If that frequency cannot be determined, this attribute should not
>         be present.
>
> +``cpuinfo_avg_freq``
> +        An average frequency (in KHz) of all CPUs belonging to a given p=
olicy,
> +        derived from a hardware provided feedback and reported on a time=
 frame
> +        spanning at most few milliseconds.
> +
> +        This is expected to be based on the frequency the hardware actua=
lly runs
> +        at and, as such, might require specialised hardware support (suc=
h as AMU
> +        extension on ARM). If one cannot be determined, this attribute s=
hould
> +        not be present.
> +
> +        Note, that failed attempt to retrieve current frequency for a gi=
ven
> +        CPU(s) will result in an appropriate error, i.e: EAGAIN for CPU =
that
> +        remains idle (raised on ARM).
> +
>  ``cpuinfo_max_freq``
>         Maximum possible operating frequency the CPUs belonging to this p=
olicy
>         can run at (in kHz).
> @@ -293,7 +307,8 @@ are the following:
>         Some architectures (e.g. ``x86``) may attempt to provide informat=
ion
>         more precisely reflecting the current CPU frequency through this
>         attribute, but that still may not be the exact current CPU freque=
ncy as
> -       seen by the hardware at the moment.
> +       seen by the hardware at the moment. This behavior though, is only
> +       available via c:macro:``CPUFREQ_ARCH_CUR_FREQ`` option.
>
>  ``scaling_driver``
>         The scaling driver currently in use.
> diff --git a/drivers/cpufreq/Kconfig.x86 b/drivers/cpufreq/Kconfig.x86
> index 97c2d4f15d76..2c5c228408bf 100644
> --- a/drivers/cpufreq/Kconfig.x86
> +++ b/drivers/cpufreq/Kconfig.x86
> @@ -340,3 +340,15 @@ config X86_SPEEDSTEP_RELAXED_CAP_CHECK
>           option lets the probing code bypass some of those checks if the
>           parameter "relaxed_check=3D1" is passed to the module.
>
> +config CPUFREQ_ARCH_CUR_FREQ
> +       default y
> +       bool "Current frequency derived from HW provided feedback"
> +       help
> +         This determines whether the scaling_cur_freq sysfs attribute re=
turns
> +         the last requested frequency or a more precise value based on h=
ardware
> +         provided feedback (as architected counters).
> +         Given that a more precise frequency can now be provided via the
> +         cpuinfo_avg_freq attribute, by enabling this option,
> +         scaling_cur_freq maintains the provision of a counter based fre=
quency,
> +         for compatibility reasons.
> +
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 96b013ea177c..a2f31fbb1774 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -734,12 +734,20 @@ __weak int arch_freq_get_on_cpu(int cpu)
>         return -EOPNOTSUPP;
>  }
>
> +static inline bool cpufreq_avg_freq_supported(struct cpufreq_policy *pol=
icy)
> +{
> +       return arch_freq_get_on_cpu(policy->cpu) !=3D -EOPNOTSUPP;
> +}
> +
>  static ssize_t show_scaling_cur_freq(struct cpufreq_policy *policy, char=
 *buf)
>  {
>         ssize_t ret;
>         int freq;
>
> -       freq =3D arch_freq_get_on_cpu(policy->cpu);
> +       freq =3D IS_ENABLED(CONFIG_CPUFREQ_ARCH_CUR_FREQ)
> +               ? arch_freq_get_on_cpu(policy->cpu)
> +               : 0;
> +
>         if (freq > 0)
>                 ret =3D sysfs_emit(buf, "%u\n", freq);
>         else if (cpufreq_driver->setpolicy && cpufreq_driver->get)
> @@ -784,6 +792,19 @@ static ssize_t show_cpuinfo_cur_freq(struct cpufreq_=
policy *policy,
>         return sysfs_emit(buf, "<unknown>\n");
>  }
>
> +/*
> + * show_cpuinfo_avg_freq - average CPU frequency as detected by hardware
> + */
> +static ssize_t show_cpuinfo_avg_freq(struct cpufreq_policy *policy,
> +                                    char *buf)
> +{
> +       int avg_freq =3D arch_freq_get_on_cpu(policy->cpu);
> +
> +       if (avg_freq > 0)
> +               return sysfs_emit(buf, "%u\n", avg_freq);
> +       return avg_freq !=3D 0 ? avg_freq : -EINVAL;
> +}
> +
>  /*
>   * show_scaling_governor - show the current policy for the specified CPU
>   */
> @@ -946,6 +967,7 @@ static ssize_t show_bios_limit(struct cpufreq_policy =
*policy, char *buf)
>  }
>
>  cpufreq_freq_attr_ro_perm(cpuinfo_cur_freq, 0400);
> +cpufreq_freq_attr_ro(cpuinfo_avg_freq);
>  cpufreq_freq_attr_ro(cpuinfo_min_freq);
>  cpufreq_freq_attr_ro(cpuinfo_max_freq);
>  cpufreq_freq_attr_ro(cpuinfo_transition_latency);
> @@ -1073,6 +1095,12 @@ static int cpufreq_add_dev_interface(struct cpufre=
q_policy *policy)
>                         return ret;
>         }
>
> +       if (cpufreq_avg_freq_supported(policy)) {
> +               ret =3D sysfs_create_file(&policy->kobj, &cpuinfo_avg_fre=
q.attr);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         ret =3D sysfs_create_file(&policy->kobj, &scaling_cur_freq.attr);
>         if (ret)
>                 return ret;
> --
> 2.25.1
>
>

