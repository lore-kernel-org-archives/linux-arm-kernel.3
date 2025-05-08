Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB05C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 10:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvv70pMgCJ3FiwAsjSiNoU6Z16zsSHQiIGX3w5dV3qE=; b=bHIFa725BuLhZpyAIVScMD+mnq
	UegFImu5MrUcF8lXaiPCYobojHzd1xU4cGgOxw/fFxa9LDwTzzRO62ls/lX6wg5jYz6eonEgwEftn
	crj3RvVlkVCg1Qt0HeDbyIKGn6GbFAzPMYXRidJBSsHzqPy5PxY7DpVC110/+U/YE2ZM7TBEdLb6Z
	FRZFDRnoFtBHNuo750hMIn20BpQffozGfQ+L79+v+cgZRFwz56a3mSuOYMa3ihvMFiC0PR5ECRji0
	1cW75mK9qymDilxMMmlsc3Sl5ZCeoa5mzNhBomrotWjNJxJc+Na7VQOMrk0mN7SY/bm3YbiXUiWMH
	C9+9SHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyOe-00000000N00-3QKR;
	Thu, 08 May 2025 10:22:32 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyLv-00000000MWu-0huD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 10:19:44 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-2d9b61e02d1so340070fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 03:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746699582; x=1747304382; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fvv70pMgCJ3FiwAsjSiNoU6Z16zsSHQiIGX3w5dV3qE=;
        b=GIBaFR/EgfYSxvrZ1/IEwfVT2EamFHG5ThN+WxFmURr2wGBu0KNz9p3s7EPJ28z3LE
         0/acUqfII5yYlkPI06YmhiY9AQy+wnj3Vfz7ipVnEAiiw5taPdZOMKp64MqAjFvNCZjA
         IuJv/yDdJBx3GHtWT06NDz7Mdc0KkP0pah8+EyJDsAcGibhS8OJ52kDPgZ7I1Fp3imgd
         H7aUy2AP+dLkznyXIiRsYfmH1v+Gr1L04VmYxN/vcMHdfJ3+fhq+A0DZRcyvSMvZa9ov
         qq02ZRyMpSwzBLYFJWDh3H4ih4Hdq9qQ5FgrVK7/pMIeh0OiGzuRNbznZfcgkCm5mY6N
         0KDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746699582; x=1747304382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvv70pMgCJ3FiwAsjSiNoU6Z16zsSHQiIGX3w5dV3qE=;
        b=j5RVG2olnixS9Tr/dEgdRR2ZFiMZFTtImJZRM9B3EjVIkzm7IZmd20vj73Xxat79gy
         8UN1xlR8SOItRQX6Es7vptQNa3nXTGsgg05DzhRDp9GWv4Cj36jmzUZWIrKnSKn9rGpW
         f5/k+MdM7nhp27aDx+fbspDiK03bRdIZPmFCglCdZG9TxocJsZODjmZyht1t1O5/o7rY
         AwK8/usRNsSzZFmPv9GNEpNc5ulX/ve68SamEjd621ZG1DD0/ZM9pkBH1nYr5noE2gW5
         N2AejcJUWi/yG1/FEv+7KRS2kBmrcabMUh8DrluG37J3HEm5QnoCkgJMWJ4Tk7TWI2WP
         n1Ww==
X-Forwarded-Encrypted: i=1; AJvYcCX9EBGn4J0NZ28BMfWLSf18Hr+Ip7lXFeHSr3jU2ofBWYLWsDmjsBXOfTIOpdBzrBKeo2C40aGmQ7jhmbjtUN3c@lists.infradead.org
X-Gm-Message-State: AOJu0YziIq8ZMkvYp9w3TSYWZPCVxmlSt50mHDWN9ej9TrgBoubefOZ1
	iVh2btln8rbqO9vcBd5+RnD40pabMvuXpWSUxReRBYUeXy2e/Q/BclNBrKr/AkW9+Q1FzS/CNF0
	T7Q9i/PjIorm6GlyW47+Bv6tHXsiuxg49QlSP/g==
X-Gm-Gg: ASbGnctZz9lZwSEVGkYK5Bl57ftlxzJUG2YLu1s9oBeHXyPiyEJX6sn2ezfzEmL4p23
	EoBMnNGDVxUdnUB26cRcKRSMfGIqlaDc2j737UkQG/yNRxKU10MDjsXCXxeb1kOgtcGwCd83dIL
	K2gV5Rk2lVbSGC9nn3rCrXeWU=
X-Google-Smtp-Source: AGHT+IF520N+kx+oR9rt9xJhtNWjWu/wTkoOchusiLD7WoO6maRQXw9xMSqaOd3WIebwagelwsLLqkPIqfbMN6EVIXc=
X-Received: by 2002:a05:6870:7020:b0:2c2:2f08:5e5b with SMTP id
 586e51a60fabf-2db5be3141amr4180433fac.13.1746699582240; Thu, 08 May 2025
 03:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com> <20250402233407.2452429-6-willmcvicker@google.com>
In-Reply-To: <20250402233407.2452429-6-willmcvicker@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 8 May 2025 11:19:30 +0100
X-Gm-Features: ATxdqUFInfzL-Wd6UFpfOdOxzv03B4za9dTc_DPavO3LtoEQp9Xr8GSGsSU8UXU
Message-ID: <CADrjBPpDs_itymvGckRYeuJDkMSOo5bc60tYTeRBtAu6Tm8O6Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] clocksource/drivers/exynos_mct: Fix uninitialized
 irq name warning
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_031943_206614_830B7B36 
X-CRM114-Status: GOOD (  24.26  )
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

Hi Will,

On Thu, 3 Apr 2025 at 00:34, Will McVicker <willmcvicker@google.com> wrote:
>
> The Exynos MCT driver doesn't set the clocksource name until the CPU
> hotplug state is setup which happens after the IRQs are requested. This
> results in an empty IRQ name which leads to the below warning at
> proc_create() time. When this happens, the userdata partition fails to
> mount and the device gets stuck in an endless loop printing the error:
>
>   root '/dev/disk/by-partlabel/userdata' doesn't exist or does not contain a /dev.
>
> To fix this, we just need to initialize the name before requesting the
> IRQs.
>
> Warning from Pixel 6 kernel log:
>
> [  T430] name len 0
> [  T430] WARNING: CPU: 6 PID: 430 at fs/proc/generic.c:407 __proc_create+0x258/0x2b4
> [  T430] Modules linked in: dwc3_exynos(E+)
> [  T430]  ufs_exynos(E+) phy_exynos_ufs(E)
> [  T430]  phy_exynos5_usbdrd(E) exynos_usi(E+) exynos_mct(E+) s3c2410_wdt(E)
> [  T430]  arm_dsu_pmu(E) simplefb(E)
> [  T430] CPU: 6 UID: 0 PID: 430 Comm: (udev-worker) Tainted:
>          ... 6.14.0-next-20250331-4k-00008-g59adf909e40e #1 ...
> [  T430] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
> [  T430] Hardware name: Raven (DT)
> [...]
> [  T430] Call trace:
> [  T430]  __proc_create+0x258/0x2b4 (P)
> [  T430]  proc_mkdir+0x40/0xa0
> [  T430]  register_handler_proc+0x118/0x140
> [  T430]  __setup_irq+0x460/0x6d0
> [  T430]  request_threaded_irq+0xcc/0x1b0
> [  T430]  mct_init_dt+0x244/0x604 [exynos_mct ...]
> [  T430]  mct_init_spi+0x18/0x34 [exynos_mct ...]
> [  T430]  exynos4_mct_probe+0x30/0x4c [exynos_mct ...]
> [  T430]  platform_probe+0x6c/0xe4
> [  T430]  really_probe+0xf4/0x38c
> [...]
> [  T430]  driver_register+0x6c/0x140
> [  T430]  __platform_driver_register+0x28/0x38
> [  T430]  exynos4_mct_driver_init+0x24/0xfe8 [exynos_mct ...]
> [  T430]  do_one_initcall+0x84/0x3c0
> [  T430]  do_init_module+0x58/0x208
> [  T430]  load_module+0x1de0/0x2500
> [  T430]  init_module_from_file+0x8c/0xdc
>
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---

You could additionally consider adding a Fixes: tag and CC stable if
you want this to land in LTS tree's.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clocksource/exynos_mct.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index a5ef7d64b1c2..62febeb4e1de 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -465,8 +465,6 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
>                 per_cpu_ptr(&percpu_mct_tick, cpu);
>         struct clock_event_device *evt = &mevt->evt;
>
> -       snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d", cpu);
> -
>         evt->name = mevt->name;
>         evt->cpumask = cpumask_of(cpu);
>         evt->set_next_event = exynos4_tick_set_next_event;
> @@ -567,6 +565,14 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
>         for (i = MCT_L0_IRQ; i < nr_irqs; i++)
>                 mct_irqs[i] = irq_of_parse_and_map(np, i);
>
> +       for_each_possible_cpu(cpu) {
> +               struct mct_clock_event_device *mevt =
> +                   per_cpu_ptr(&percpu_mct_tick, cpu);
> +
> +               snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d",
> +                        cpu);
> +       }
> +
>         if (mct_int_type == MCT_INT_PPI) {
>
>                 err = request_percpu_irq(mct_irqs[MCT_L0_IRQ],
> --
> 2.49.0.472.ge94155a9ec-goog
>

