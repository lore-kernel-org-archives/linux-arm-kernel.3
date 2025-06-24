Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB653C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 13:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOOE3chh08F/O7R/WBaJb8nuz+JcsL39gDG2UPlu8EA=; b=1wiBHLc50yv6EGgMCheWyzaxSY
	faoKtGkabhdYBTr7DxAczHUb0bgLYLoPy/LiHubBI8r+yKMTe53HJNgg0HevVsXJ3X1lUiUrYNDO2
	cErFGz7U69afbZYrPt2fUF9a5AKzqpaKPvHkAsfq1qagww7hY5NHFKNLAXdqxPWB3UjHMPttg0vyT
	riadC4rOt+sMMeQnqPaLsXb3Myz+5TUoGNEiTU7EaIiuo4zV/5LpE9+GdA5fON8wzAcVC8Wdk7H0M
	9Nm33mE+jOlLK5oWzyJnowyygC+z+8Pu/V5ylozEWCwAriX5vsbrrWCh8WPMpUQFXmbLpCpa+Nw/o
	oWSxlnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3st-00000005k6e-3eIk;
	Tue, 24 Jun 2025 13:40:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3bN-00000005hKt-0eiL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:22:18 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so3219915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750771335; x=1751376135; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LOOE3chh08F/O7R/WBaJb8nuz+JcsL39gDG2UPlu8EA=;
        b=L0ZQOk1RPcSoMfoEY42MMDTuXMu908UdrqF5C/hQbdCdNglFbopftXiygDAVT5ZgPd
         MmBP2jBuCC+yo7vpsmaPzDmvkY/XwXRwQCXvpvNgTa/YujMZ5RJHyGIny1IBukShPrE4
         B/uJZbNRQEEA/Hj7F8FqIHl9eZ40wPrrCMSIfWn1cDFbBBixj+uEyUG9pIC2+UV3+hBw
         zeDEFOArR4cSoZRz6Ymsx0y6rG9GRXoIKFWIjOMbkmdOIgwV5XKcEK9czd7IzsiWeF3j
         txDWoQkZ7IlxOInJmR0Fyu3P82GLXhbTwzaMklWvVcHTI2cLLUbnm40FfycbFeuJpLfS
         nP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771335; x=1751376135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LOOE3chh08F/O7R/WBaJb8nuz+JcsL39gDG2UPlu8EA=;
        b=BkjYpcVFx3+5vE8Cn85zH6qPKhu+65BAizZhEo/pqffqbv3M7Ex8kLPetP0rALY5GP
         WnN5h+lluBEvcYeVcAidCYGKRT+scPW9m1iM+WI6EEaaBBbmOipv7L59ih8tib3P48B6
         7QZZWHGCWiihv4TfC41q/cJ6xMK+nOHVtYN8+EFGfm8t2jPlbgAwcld4FYO9lJm81YFX
         fyUPmRSuAzrD7DAlKUmPEJivR2V9f3QbLs3bRbnNSmMfsj9tG4eNkS3473RLs9rjaMDg
         dAHNjFRIY/TUwTwBDAufMBLStrT+ZGyS5NWDZtPWjWKCJFDdHJS+UzK4f2QHp+TgDli6
         EqNw==
X-Forwarded-Encrypted: i=1; AJvYcCWRsUpaj0sS49Aks8LlFvE5CMu7FwFVQ0N9DpFyKt+dzr+3/GCadjFXtqTnrJ3NqJLQ+xP4xFp1zDzkKu81nxpL@lists.infradead.org
X-Gm-Message-State: AOJu0YxRLEDqyE8C6hhUCWgdZKIEeepxMTP+cDJPPg/hdyTYQ1JeOj9/
	QEbk3ScecxHSX3pO4P/xHrbQYkTDqDQbWQlAyh1773tLZSrfXSoZBkM39KD1dXqxbfA=
X-Gm-Gg: ASbGncurz0vf4Ux9nM6Vh2Pg7/zK5tHS4vhiwIpzn9njofMDv7uelumaULW/qkDL9le
	UMa7GT5/+BJ/01h1M5EknSPMo7LPwbqACv8HQOUH/y1wVF1KOJmziG97jlYduiUWetGG1qMKOGD
	9uexbqOlc7mKsfSgNWGS19u6BLCYtMUE14kSSREFqvB/kYc4fBi0ZcfbKFhc4zgkfgpa7Kcrczz
	YT0e39/3QFH19YxQM8Aokn4jUkNKzbn4vSAbk7s/x4MTEH0UNgPf3IntJW+8oe+CNPyaNooA+Uo
	/q1BvxOZcGOxlgvOMxqQ+uT/Kej8qggqEZ5SejGIHtjSN2etPc+SdMWdCdoeQW1axWzy3IrycwH
	pyaj9SeILKXtqP5CQoaQGpO9X
X-Google-Smtp-Source: AGHT+IG+8KGqgrD4nKqGiWFlJ35WJi/rcQ0CDHHa05PY7P7SDQChCXBy5adbtSKpQbTgkIYAR9gLDQ==
X-Received: by 2002:a05:600c:c4aa:b0:453:a95:f07d with SMTP id 5b1f17b1804b1-453654cb7b3mr197942675e9.10.1750771335032;
        Tue, 24 Jun 2025 06:22:15 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8051001sm1940164f8f.1.2025.06.24.06.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:22:14 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:22:12 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/6] clocksource/drivers/exynos_mct: Fix uninitialized
 irq name warning
Message-ID: <aFqmhDQnlUHh4vLY@mai.linaro.org>
References: <20250618210851.661527-1-willmcvicker@google.com>
 <20250618210851.661527-5-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618210851.661527-5-willmcvicker@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_062217_203232_7CA62254 
X-CRM114-Status: GOOD (  26.14  )
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

On Wed, Jun 18, 2025 at 02:08:41PM -0700, Will McVicker wrote:
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
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
> Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/clocksource/exynos_mct.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index a5ef7d64b1c2..62febeb4e1de 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -465,8 +465,6 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
>  		per_cpu_ptr(&percpu_mct_tick, cpu);
>  	struct clock_event_device *evt = &mevt->evt;
>  
> -	snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d", cpu);
> -
>  	evt->name = mevt->name;
>  	evt->cpumask = cpumask_of(cpu);
>  	evt->set_next_event = exynos4_tick_set_next_event;
> @@ -567,6 +565,14 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
>  	for (i = MCT_L0_IRQ; i < nr_irqs; i++)
>  		mct_irqs[i] = irq_of_parse_and_map(np, i);
>  
> +	for_each_possible_cpu(cpu) {
> +		struct mct_clock_event_device *mevt =
> +		    per_cpu_ptr(&percpu_mct_tick, cpu);
> +
> +		snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d",
> +			 cpu);
> +	}
> +
>  	if (mct_int_type == MCT_INT_PPI) {
>  
>  		err = request_percpu_irq(mct_irqs[MCT_L0_IRQ],
> -- 
> 2.50.0.rc2.761.g2dc52ea45b-goog
> 

There are too many for_each_possible_cpu() loops in this function.

Why not move the per cpu relevant code in the hotplug callbacks ?


-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

