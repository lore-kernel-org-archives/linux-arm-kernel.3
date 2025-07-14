Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC0DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 11:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYsZgpGyc92tylgoOl1ueE7I+vTEL4X4JFlPanY31ls=; b=4Ca2wV8qcXamMUlz64yX5vNuNe
	Q26oaMCZ2sJvA4QmlHxzGtJn6jPwgLUQ59sA/xzPO49IzBLvQnifiqKzDc49aioGmBLVgskqnmXWl
	AsAO3wQYKvK6s3csZZxyBtnNr+6RR80Qrdg1iVRp9mHF280+xvHJ4NQFGlFyZPzLt1nmt13P9rv0+
	TcK0alDSxpuhBBc22VJCmKpjlco9nhWu+xtyXayvguw/rRIaYr/VDGjXq2gCq4NQ2yH9pBhTPSlxB
	BNeN5c5/nvXrbFWpmUbv7t8MRAeE0hYcBBLQwoF38QAS5Yh2nkkeNzYjHUBBSEfjgQqaqJdM+sqcC
	8IZiT2DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHA4-000000020hX-463B;
	Mon, 14 Jul 2025 11:15:56 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubH7c-000000020Q2-3bun
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 11:13:26 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e81a7d90835so3199636276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 04:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752491604; x=1753096404; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iYsZgpGyc92tylgoOl1ueE7I+vTEL4X4JFlPanY31ls=;
        b=cZW3WsWnSNWNnfU7iLl1TsREuokEKEoukBZTiWtdhNwuI3l2DrFe2VJDpG1w/rND14
         RRshO1+027Ogs59J9TMyHLx9Ta4PpG2Ot794Wf0PHIFbb0nSN6uS8m4zou4fhUrQfLv9
         tmf0UwO6+ZHMD9F4L+js0o1hJx+wXz3Hl1d80XpBbvLzs7u2ZRprh8t0E61lBsPPIk/k
         +zIrYD6N2z4Z5TGRLQrcsdVXEe6lsCRzv48WhTKx9iS/kIKyUOHfS9m9ECFVpuWFOa/E
         wl1yDKK5DUm90OJ3yi1S7u3Z+kw0X3VVwBhZ07Lj4mDVCXJemW098eWvLrYO0fy6lj5j
         271g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752491604; x=1753096404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYsZgpGyc92tylgoOl1ueE7I+vTEL4X4JFlPanY31ls=;
        b=jNetJY6WCD0U3LnbSrglPGmIP2y94LaIBqjOJbLdBqFHP5spjKuNvnTK+6qwnybGjv
         gSFIQu9ToeHccx1ohNtTrMGfHAxzfjlE4D7cDdILeFTCvmixYH5pz5s73x9ljaM18BjP
         jKRWEJIGtz/bKjqha1xnJ3BUBAAQkjRjW9a0XT2cg0VoXAeyO9V2+70yKrZg8r1teDnM
         bZPqzm0HvAd35JFTt52/mGYk/Rorq3crjqcpuXf0wnDzZr6S7q72DUmPWMMd9Bh3SqG9
         qT6xQ8NqpOVbFcEQAcRvUFbBoc9UspPIqLfb73hocTv0X5VmbFo94gphLN1kFYEvzrNG
         6sJw==
X-Forwarded-Encrypted: i=1; AJvYcCXUgriCIYMogkYRS1YHqasEAJ+u7oxpsjSY/5J+IfnnSsORYX6A4fbKNC2ft7MIsaRxrWiRlK3eoHWIx8CVG6gr@lists.infradead.org
X-Gm-Message-State: AOJu0Yymqh1sBU05XhI+fC9sk1Fo22aZPDQ5R3antfElGwd78HMTGFbk
	FVv+ExJVDGzpalKISaTx8I9fiuTWB9wyMrxnijtni4ftczu+a4Aqma0pcBkpp8ZuBLWP1+c44vy
	ONdBegnkiQU1rMY9Hd3g/+Ba/kco78+6rxAonEiYf+Q==
X-Gm-Gg: ASbGncshIa6ldUndehp8pN9E2CZwMMjV+wO6D2CzpyTqANWUTnDWnQBmltQeF7TcoBm
	VF2ZEkbaVGZbbq9vUknYvRvU7h4QMY/Wj0djWu0W7XBR9oCZJRN+4pt2/xG96Ig6yfXPDJ2uVPr
	aoI+99X+3CaeGSuM2eJPlwllBtS/veQeWCizXVsLGl3PW/2eIrAZmv33PUl1hVHMtC4YH5AXZXN
	knYbDwl
X-Google-Smtp-Source: AGHT+IEo5nowTE/kmucDEHrishTa1XrYiiyuTFtayRgTTm+E8uO5OzwI/Scst1QOoi4vBiyg+Oy6sxmd+YJaGyA1WnM=
X-Received: by 2002:a05:690c:d19:b0:70d:ffaf:48df with SMTP id
 00721157ae682-717d786dda1mr175760437b3.3.1752491603539; Mon, 14 Jul 2025
 04:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250709154728.733920-1-daniel.lezcano@linaro.org>
In-Reply-To: <20250709154728.733920-1-daniel.lezcano@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 14 Jul 2025 13:12:47 +0200
X-Gm-Features: Ac12FXxaeX7OXBuCkXJ-j03hUCK21Ze9ZEebSgiQ5mn7RsuZUrOhhvlhJZv3Zm8
Message-ID: <CAPDyKFp9up-okoVZf5j+LFvpCOFgLjS8FY1eEqoaDU8remD8Hg@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: psci: Fix cpuhotplug routine with PREEMPT_RT=y
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, sudeep.holla@arm.com, linux-pm@vger.kernel.org, 
	linux-rt-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Raghavendra Kakarla <quic_rkakarla@quicinc.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	"open list:Real-time Linux (PREEMPT_RT)" <linux-rt-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_041324_919850_806CD243 
X-CRM114-Status: GOOD (  26.73  )
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

On Wed, 9 Jul 2025 at 17:47, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> Currently cpu hotplug with the PREEMPT_RT option set in the kernel is
> not supported because the underlying generic power domain functions
> used in the cpu hotplug callbacks are incompatible from a lock point
> of view. This situation prevents the suspend to idle to reach the
> deepest idle state for the "cluster" as identified in the
> undermentioned commit.
>
> Use the compatible ones when PREEMPT_RT is enabled and remove the
> boolean disabling the hotplug callbacks with this option.
>
> With this change the platform can reach the deepest idle state
> allowing at suspend time to consume less power.
>
> Tested-on Lenovo T14s with the following script:
>
> echo 0 > /sys/devices/system/cpu/cpu3/online
> BEFORE=$(cat /sys/kernel/debug/pm_genpd/power-domain-cpu-cluster0/idle_states | grep S0 | awk '{ print $3 }') ;
> rtcwake -s 1 -m mem;
> AFTER=$(cat /sys/kernel/debug/pm_genpd/power-domain-cpu-cluster0/idle_states | grep S0 | awk '{ print $3 }');
> if [ $BEFORE -lt $AFTER ]; then
>     echo "Test successful"
> else
>     echo "Test failed"
> fi
> echo 1 > /sys/devices/system/cpu/cpu3/online
>
> Fixes: 1c4b2932bd62 ("cpuidle: psci: Enable the hierarchical topology for s2idle on PREEMPT_RT")
> Cc: Raghavendra Kakarla <quic_rkakarla@quicinc.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Applied for fixes and by adding a stable-tag, thanks!

Kind regards
Uffe

> ---
>  drivers/cpuidle/cpuidle-psci.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> index 4e1ba35deda9..b19bc60cc627 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -45,7 +45,6 @@ struct psci_cpuidle_domain_state {
>  static DEFINE_PER_CPU_READ_MOSTLY(struct psci_cpuidle_data, psci_cpuidle_data);
>  static DEFINE_PER_CPU(struct psci_cpuidle_domain_state, psci_domain_state);
>  static bool psci_cpuidle_use_syscore;
> -static bool psci_cpuidle_use_cpuhp;
>
>  void psci_set_domain_state(struct generic_pm_domain *pd, unsigned int state_idx,
>                            u32 state)
> @@ -124,8 +123,12 @@ static int psci_idle_cpuhp_up(unsigned int cpu)
>  {
>         struct device *pd_dev = __this_cpu_read(psci_cpuidle_data.dev);
>
> -       if (pd_dev)
> -               pm_runtime_get_sync(pd_dev);
> +       if (pd_dev) {
> +               if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> +                       pm_runtime_get_sync(pd_dev);
> +               else
> +                       dev_pm_genpd_resume(pd_dev);
> +       }
>
>         return 0;
>  }
> @@ -135,7 +138,11 @@ static int psci_idle_cpuhp_down(unsigned int cpu)
>         struct device *pd_dev = __this_cpu_read(psci_cpuidle_data.dev);
>
>         if (pd_dev) {
> -               pm_runtime_put_sync(pd_dev);
> +               if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> +                       pm_runtime_put_sync(pd_dev);
> +               else
> +                       dev_pm_genpd_suspend(pd_dev);
> +
>                 /* Clear domain state to start fresh at next online. */
>                 psci_clear_domain_state();
>         }
> @@ -196,9 +203,6 @@ static void psci_idle_init_cpuhp(void)
>  {
>         int err;
>
> -       if (!psci_cpuidle_use_cpuhp)
> -               return;
> -
>         err = cpuhp_setup_state_nocalls(CPUHP_AP_CPU_PM_STARTING,
>                                         "cpuidle/psci:online",
>                                         psci_idle_cpuhp_up,
> @@ -259,10 +263,8 @@ static int psci_dt_cpu_init_topology(struct cpuidle_driver *drv,
>          * s2ram and s2idle.
>          */
>         drv->states[state_count - 1].enter_s2idle = psci_enter_s2idle_domain_idle_state;
> -       if (!IS_ENABLED(CONFIG_PREEMPT_RT)) {
> +       if (!IS_ENABLED(CONFIG_PREEMPT_RT))
>                 drv->states[state_count - 1].enter = psci_enter_domain_idle_state;
> -               psci_cpuidle_use_cpuhp = true;
> -       }
>
>         return 0;
>  }
> @@ -339,7 +341,6 @@ static void psci_cpu_deinit_idle(int cpu)
>
>         dt_idle_detach_cpu(data->dev);
>         psci_cpuidle_use_syscore = false;
> -       psci_cpuidle_use_cpuhp = false;
>  }
>
>  static int psci_idle_init_cpu(struct device *dev, int cpu)
> --
> 2.43.0
>

