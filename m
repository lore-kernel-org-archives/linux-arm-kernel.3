Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD06C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rbOUcYQrQRFck19CzFKNta/DwzEnD+NbdO8sB6uKMc=; b=dhdamn8Y3Hm/sPtgNC4FosGZww
	qoheO7AEqbgYWeeYHg8G6/b+GiWPIfHShjW8GqMIaDGW81LHumCO5P0AN5zt1MIFdPEhV69lb7Loh
	PtxL5n9+49z9aVhzbwhb1DNWedyLfMxRCnL5k9G7afqd0LLXHupYXcX3tFXwu7gmI1p4apRWiv0zM
	pFW6EIlbsgHfIMb4W8+fj1lUCob9IHFdmF77GnYvR+CUPjmn5aHqZYhVtOGl7L8jmIH6Ac6Bpw32A
	EAq8cRkrTliqrwh/eFcJXKK2qDXoRllGub9JIOsDLj3AlhfriWtLkGqvuWHqvDbgjDcgKKvbRP/Tw
	NZSjdiag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHH5-0000000Cm5f-38t5;
	Tue, 05 Aug 2025 13:00:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHES-0000000ClpS-3zR0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 12:57:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C32A9A557CA
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 Aug 2025 12:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DFDC4CEFB
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 Aug 2025 12:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754398651;
	bh=/Q154M5fKuJcthmk/dvqUU0hQH0vyCaiY74Qs2fJRZE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fjqhAvNu6oOujJJPY0OdviGQKVb3TNu2d//ilddXsZp4FBOBpAtlYXxGw98C+HxHZ
	 wKhSDzHsXGDcAXRIbL5n6A4fx8LiwVsOKGFY9D4AQvVwvQZZdFyTgZiGXVUIqAs65Y
	 k83ET/LcdINebn86n086KqwVlSvNq3dlZ/XNebjrSJ7NllWqnb8RS4YW/ByjeTCqeW
	 KUaa9pk9HOhCvyqM3T2Iq9qsFWcHzRsRaZpweEx8BhDYpQyFbAV9bGgAAy5YlxBxJS
	 gEIcPDRacEaq8xsP/Av7AIivlNiN8aF5yS8BAYZbUxqFqxPZVBTG1QyCK2h5IteTMs
	 bxA1qDKsW9zMQ==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-301a83477e5so4624561fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 05:57:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWosmFYPvXL1oVOozvx7avuKTt9Z4GpBc05EH/IAzaoMT/4So4364+V4r3lSy8hM6fw3l1rzpm0HrQTU6sZ7ZRS@lists.infradead.org
X-Gm-Message-State: AOJu0YyeVWbjxCR7tH+3kOLiu759qA4nACPJAqbv5GguAI+XNpr4NRfL
	QpNejmg6mzIAoW2dJCGTJ6cgfE4HXgz+x5EWB8jIvS0eU8hSwruYA7msdddl3HRUGmj4Oiaj1he
	27mLHFz+4tV+QsKvIwxE3Mn2AsCYnb/Y=
X-Google-Smtp-Source: AGHT+IFPAZyhywgLQvoskIOmz2VU+10EYz63YwRwlyu84oAH2UchHeV7tpu0Rg/EeQb9g6axbf5sa7qF+zrfyTHq6AA=
X-Received: by 2002:a05:6870:b001:b0:2ff:9224:b1c8 with SMTP id
 586e51a60fabf-30b67a46c62mr7931975fac.36.1754398650648; Tue, 05 Aug 2025
 05:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250805093330.3715444-1-zhenglifeng1@huawei.com> <20250805093330.3715444-3-zhenglifeng1@huawei.com>
In-Reply-To: <20250805093330.3715444-3-zhenglifeng1@huawei.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 5 Aug 2025 14:57:18 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h3XKXAGHSrx50vt1Aho3uchiJ2kjQa7qCM8jCr03YKTA@mail.gmail.com>
X-Gm-Features: Ac12FXz_6f4R8OhJ2KEpzWPYtfA52SizmFoqZrcEiv1xQxt4mcznPwed7XSItvs
Message-ID: <CAJZ5v0h3XKXAGHSrx50vt1Aho3uchiJ2kjQa7qCM8jCr03YKTA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] cpufreq: Add a new function to get cpufreq policy
 without checking if the CPU is online
To: Lifeng Zheng <zhenglifeng1@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org, 
	viresh.kumar@linaro.org, beata.michalska@arm.com, sudeep.holla@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxarm@huawei.com, 
	jonathan.cameron@huawei.com, vincent.guittot@linaro.org, 
	yangyicong@hisilicon.com, zhanjie9@hisilicon.com, lihuisong@huawei.com, 
	yubowen8@huawei.com, linhongye@h-partners.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_055733_119260_9F79EAF2 
X-CRM114-Status: GOOD (  22.15  )
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

On Tue, Aug 5, 2025 at 11:34=E2=80=AFAM Lifeng Zheng <zhenglifeng1@huawei.c=
om> wrote:
>
> cpufreq_cpu_get_raw() gets cpufreq policy only if the CPU is in
> policy->cpus mask, which means the CPU is already online. But in some
> cases, the policy is needed before the CPU is added to cpus mask. Add a
> function to get the policy in these cases.
>
> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> ---
>  drivers/cpufreq/cpufreq.c | 11 +++++++++++
>  include/linux/cpufreq.h   |  1 +
>  2 files changed, 12 insertions(+)
>
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index fc7eace8b65b..2de76a072893 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -198,6 +198,17 @@ struct cpufreq_policy *cpufreq_cpu_get_raw(unsigned =
int cpu)
>  }
>  EXPORT_SYMBOL_GPL(cpufreq_cpu_get_raw);
>
> +struct cpufreq_policy *cpufreq_cpu_get_raw_no_check(unsigned int cpu)

This is not a particularly nice name.  Maybe call it cpufreq_cpu_policy()?

> +{
> +       struct cpufreq_policy *policy =3D per_cpu(cpufreq_cpu_data, cpu);
> +
> +       if (policy)
> +               return policy;
> +
> +       return NULL;

This could just be a one-liner with this statement in the function body:

  return per_cpu(cpufreq_cpu_data, cpu);

Can't it?

In which case it can be called in all places reading cpufreq_cpu_data
for a given CPU.

> +}
> +EXPORT_SYMBOL_GPL(cpufreq_cpu_get_raw_no_check);
> +
>  unsigned int cpufreq_generic_get(unsigned int cpu)
>  {
>         struct cpufreq_policy *policy =3D cpufreq_cpu_get_raw(cpu);
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index 95f3807c8c55..02ad8173dc10 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -205,6 +205,7 @@ struct cpufreq_freqs {
>
>  #ifdef CONFIG_CPU_FREQ
>  struct cpufreq_policy *cpufreq_cpu_get_raw(unsigned int cpu);
> +struct cpufreq_policy *cpufreq_cpu_get_raw_no_check(unsigned int cpu);
>  struct cpufreq_policy *cpufreq_cpu_get(unsigned int cpu);
>  void cpufreq_cpu_put(struct cpufreq_policy *policy);
>  #else
> --

