Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4230D0D16C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 19:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QqZL3oUpHcdBvI4ZTdse92cHVkW+oj84c+RVYbNOFs=; b=NjajPKa/egbx+ehqnE34FTKPQC
	RXKXER9Mdsj1qqihiiDKlNCXhhyKZMS7+aUfbaUDXwPcQlUfbHI5BrVk9t9SQP5I0NEMKEJHJZAHR
	9/bx4Ri0mWgWYPSsWmjN2EccoZDR8LBEBjP3VyLX8VsfL5btAfWJZ/SpSwWh5oASYw7zyIk35I3We
	/u2bBS0ra2bYP4mzGWDpRpQY5dTpuIIe1XR+VtzVniQHoKre+ZRPjLB/kENZhykY+Dpie7qXdBJkZ
	gT1aByUg1Tnq8vfj3eWkRmWx/UbhBt9OPJ6A+0FQpS1m0FUJe/h1hU7IJNZ/5rM6C/I0gODKUcI3H
	hJUJ+eHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZeX-0000000FZqm-1AFb;
	Wed, 07 Jan 2026 19:57:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZeV-0000000FZqE-03ID
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 19:57:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B93B343474
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Jan 2026 19:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94194C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Jan 2026 19:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767815823;
	bh=+VBjyrmdJBHXv8hFipAjm6s+ntR7S0VRhaAQ6AcLC0g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o/6eo/5zs0RzXoNw5Ej9A45/1N5wStTrAkCwQJWGqcoSZmcUnd0Z+L8dzDyqux/GG
	 ger8d/1SVEIuBfiPbwUxUkYxfVj0akHUvCUlocVWEA8dJaJC5vdVoWraq4QHCwzVZi
	 c6OnRnVP8IR4n3fzJ8l/g30EYVO2t76gGhU9k8apkzF3INh5cvFLIt4EPOYZYEygP6
	 c1Hw+qRhRR6Ojb0vcyb12O2+HtxkUvGGQAKCcLcYSYMG88umzmcSGlWd+3DLCdiYp6
	 qebF5+mJkvX8Xyu98keGoBpNtnJgsfXLvLQGeJaYIMd+0ehCz09TPbUe7YoOkSWy2l
	 hWDVOXgWQQT1g==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-3eae4e590a4so1254010fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 11:57:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXsFBoN9hZan1pY+YAMBSzf4wMsOZr+LyElKSS+RAiIk4iFTrKbPHdgEcoH+F89OFDtdjSjpTNEEyhZnxAwezXw@lists.infradead.org
X-Gm-Message-State: AOJu0YyOYhhXMcVCxc987hbrY1LLtDfIdi725muhccdv9TCr1D+2JAED
	8uGniZZz5/R3AyOOND+9JHOF/tl50cPNULI/OEYEERSKaKaEp+sn10teqotWp9xmUKRJ2khWZcK
	VUVEFMZZBSjKe3tgrO1sZOWK5nBcTwbs=
X-Google-Smtp-Source: AGHT+IGD121X1TOzfCHSPDnImhpxYxlydTwNjoEEqXnErTuAQNSSQWGE9TltWwcuH40GRao6lXf2ebmHYSFBy+rTjm0=
X-Received: by 2002:a4a:da4c:0:b0:65b:387a:835f with SMTP id
 006d021491bc7-65f54ef230dmr1210110eaf.31.1767815822629; Wed, 07 Jan 2026
 11:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20251223072119.3372582-1-zhanjie9@hisilicon.com> <20251223072119.3372582-2-zhanjie9@hisilicon.com>
In-Reply-To: <20251223072119.3372582-2-zhanjie9@hisilicon.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 7 Jan 2026 20:56:50 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0h_1nM3S93prH60VPkicQSdH_gzh7VkXHNCzfLq-aLP-Q@mail.gmail.com>
X-Gm-Features: AQt7F2qmAPuD1J1j6UNwANWUUqw4-V9DUtSrJcD5sPI_qu_DLnXIVN8OvdSsCC8
Message-ID: <CAJZ5v0h_1nM3S93prH60VPkicQSdH_gzh7VkXHNCzfLq-aLP-Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] ACPI: CPPC: Factor out and export per-cpu cppc_perf_ctrs_in_pcc_cpu()
To: Jie Zhan <zhanjie9@hisilicon.com>
Cc: viresh.kumar@linaro.org, rafael@kernel.org, ionela.voinescu@arm.com, 
	beata.michalska@arm.com, pierre.gondois@arm.com, zhenglifeng1@huawei.com, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, 
	jonathan.cameron@huawei.com, prime.zeng@hisilicon.com, yubowen8@huawei.com, 
	lihuisong@huawei.com, zhangpengjie2@huawei.com, wangzhi12@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_115707_089512_0E26DFCE 
X-CRM114-Status: GOOD (  21.17  )
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

On Tue, Dec 23, 2025 at 8:23=E2=80=AFAM Jie Zhan <zhanjie9@hisilicon.com> w=
rote:
>
> Factor out cppc_perf_ctrs_in_pcc_cpu() for checking whether per-cpu CPC
> regs are defined in PCC channels, and export it out for further use.
>
> Reviewed-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> Reviewed-by: Pierre Gondois <pierre.gondois@arm.com>
> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

and I'd prefer Viresh to take care of this along with the other two
patches in the series.

> ---
>  drivers/acpi/cppc_acpi.c | 48 ++++++++++++++++++++++------------------
>  include/acpi/cppc_acpi.h |  5 +++++
>  2 files changed, 32 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
> index e66e20d1f31b..22d7fd669a6c 100644
> --- a/drivers/acpi/cppc_acpi.c
> +++ b/drivers/acpi/cppc_acpi.c
> @@ -1423,6 +1423,32 @@ int cppc_get_perf_caps(int cpunum, struct cppc_per=
f_caps *perf_caps)
>  }
>  EXPORT_SYMBOL_GPL(cppc_get_perf_caps);
>
> +/**
> + * cppc_perf_ctrs_in_pcc_cpu - Check if any perf counters of a CPU are i=
n PCC.
> + * @cpu: CPU on which to check perf counters.
> + *
> + * Return: true if any of the counters are in PCC regions, false otherwi=
se
> + */
> +bool cppc_perf_ctrs_in_pcc_cpu(unsigned int cpu)
> +{
> +       struct cpc_desc *cpc_desc =3D per_cpu(cpc_desc_ptr, cpu);
> +       struct cpc_register_resource *ref_perf_reg;
> +
> +       /*
> +        * If reference perf register is not supported then we should use=
 the
> +        * nominal perf value
> +        */
> +       ref_perf_reg =3D &cpc_desc->cpc_regs[REFERENCE_PERF];
> +       if (!CPC_SUPPORTED(ref_perf_reg))
> +               ref_perf_reg =3D &cpc_desc->cpc_regs[NOMINAL_PERF];
> +
> +       return CPC_IN_PCC(&cpc_desc->cpc_regs[DELIVERED_CTR]) ||
> +               CPC_IN_PCC(&cpc_desc->cpc_regs[REFERENCE_CTR]) ||
> +               CPC_IN_PCC(&cpc_desc->cpc_regs[CTR_WRAP_TIME]) ||
> +               CPC_IN_PCC(ref_perf_reg);
> +}
> +EXPORT_SYMBOL_GPL(cppc_perf_ctrs_in_pcc_cpu);
> +
>  /**
>   * cppc_perf_ctrs_in_pcc - Check if any perf counters are in a PCC regio=
n.
>   *
> @@ -1437,27 +1463,7 @@ bool cppc_perf_ctrs_in_pcc(void)
>         int cpu;
>
>         for_each_online_cpu(cpu) {
> -               struct cpc_register_resource *ref_perf_reg;
> -               struct cpc_desc *cpc_desc;
> -
> -               cpc_desc =3D per_cpu(cpc_desc_ptr, cpu);
> -
> -               if (CPC_IN_PCC(&cpc_desc->cpc_regs[DELIVERED_CTR]) ||
> -                   CPC_IN_PCC(&cpc_desc->cpc_regs[REFERENCE_CTR]) ||
> -                   CPC_IN_PCC(&cpc_desc->cpc_regs[CTR_WRAP_TIME]))
> -                       return true;
> -
> -
> -               ref_perf_reg =3D &cpc_desc->cpc_regs[REFERENCE_PERF];
> -
> -               /*
> -                * If reference perf register is not supported then we sh=
ould
> -                * use the nominal perf value
> -                */
> -               if (!CPC_SUPPORTED(ref_perf_reg))
> -                       ref_perf_reg =3D &cpc_desc->cpc_regs[NOMINAL_PERF=
];
> -
> -               if (CPC_IN_PCC(ref_perf_reg))
> +               if (cppc_perf_ctrs_in_pcc_cpu(cpu))
>                         return true;
>         }
>
> diff --git a/include/acpi/cppc_acpi.h b/include/acpi/cppc_acpi.h
> index 13fa81504844..4bcdcaf8bf2c 100644
> --- a/include/acpi/cppc_acpi.h
> +++ b/include/acpi/cppc_acpi.h
> @@ -154,6 +154,7 @@ extern int cppc_get_perf_ctrs(int cpu, struct cppc_pe=
rf_fb_ctrs *perf_fb_ctrs);
>  extern int cppc_set_perf(int cpu, struct cppc_perf_ctrls *perf_ctrls);
>  extern int cppc_set_enable(int cpu, bool enable);
>  extern int cppc_get_perf_caps(int cpu, struct cppc_perf_caps *caps);
> +extern bool cppc_perf_ctrs_in_pcc_cpu(unsigned int cpu);
>  extern bool cppc_perf_ctrs_in_pcc(void);
>  extern unsigned int cppc_perf_to_khz(struct cppc_perf_caps *caps, unsign=
ed int perf);
>  extern unsigned int cppc_khz_to_perf(struct cppc_perf_caps *caps, unsign=
ed int freq);
> @@ -204,6 +205,10 @@ static inline int cppc_get_perf_caps(int cpu, struct=
 cppc_perf_caps *caps)
>  {
>         return -EOPNOTSUPP;
>  }
> +static inline bool cppc_perf_ctrs_in_pcc_cpu(unsigned int cpu)
> +{
> +       return false;
> +}
>  static inline bool cppc_perf_ctrs_in_pcc(void)
>  {
>         return false;
> --
> 2.33.0
>

