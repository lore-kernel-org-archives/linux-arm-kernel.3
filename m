Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CD0C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuzz1+vtL6q9IVKTuSaFdZbMIP54D/fr9Bx9hPkbwhk=; b=gqOEOn5fNKepyJlgD3w2TiZbjx
	x8gsMdQX7aQVEj8UN/ZmxXfjZTW7fEI2OcN7O8cfCJZOCAVXahwLXwuslkP0juIgBzXk38ZsSgUiW
	zULpZ3YYlNLy/3fxeLYD6Kjbh3laY1R3PzaMSrMtY6NmLpajbuOaTc/Vp3Sv+Yj276jsX+KxiAT4J
	5MiQIw4l19Td+T/yslYupr+iIF2fvGzCIxI81mn7DoMHQS1dStfo5KzmuxQwUlV810ZOx3FAWzP+W
	O0SPghr80Pu5a321UnuxY9PnSzVeVOOAgFFwQOazg09MX5S2JZdE4edrYq1JPcY2g9pc5RjQ/p2dl
	wzEZRGag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jZ3-0000000F9cu-3Qaa;
	Thu, 10 Sep 2026 18:32:02 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jZ0-0000000F9c7-1bFS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:32:00 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747eb79fbso13484085ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789065117; x=1789669917; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kuzz1+vtL6q9IVKTuSaFdZbMIP54D/fr9Bx9hPkbwhk=;
        b=N2na/KNyeHxsH7FuOTp7wiNY7fMIBgqrkLWwEjoXSDJzWzi2MR+8E6tq1V/gU/4aDw
         7ozhgNiCHtBClmpsYr/VLxvPWWxHHPAysfPBbZ9kbDmHG3ZCQZZw7aElRv/JHhsHrFLS
         EWovxZF6jLOacUM7G4P5SNEnO0yAPYZGLCo+bwgn3cf96ZxPHujP7PYArFqaVR6fKy2x
         w7lusFrDo5c0ziOVdPwBue8h5mbta52SDKyJLX8B0WfFOuXi6dEf2y6WDmgSdEF29pGL
         NFWWl9QWSvrO/56ckmtCZNW2gPfOiRS1rZ3yLC5XdDN2nkHliQ9njbZiOwHORZjkSrs+
         42CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065117; x=1789669917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kuzz1+vtL6q9IVKTuSaFdZbMIP54D/fr9Bx9hPkbwhk=;
        b=l+IzpCkGae6++B/ZIpU5Gf8M5TkNEik5n2Y0D5yyVlXquQD6TJn1nZId7eMV4vhiwv
         1K3BnSf+mw8Uy8CgJX1v7bTYnNc187apGMpQBKyiyYGLg9qAQUx9ueoIfbl4Xlr4WJAW
         6i7hunN93yTEmtVToi0MhU/8De7mYCVve3kWwid4fmD0h6gvlZw+jSDJFY9BTpZ/ry7H
         nfBtwfir7mgR2DHEni0x7pJqP9TD8UuC9vO5Ht8J0xqVG9wJGnzN0xLbFvVE6N7RqxKz
         UaLQZDu+ckBF3AMJKumBd28hEmRlfeuKGGC+Ln1oWidpF5S/5asF/8b2YOe8C1XMfSa5
         HExg==
X-Forwarded-Encrypted: i=1; AKwUvByNUXJ6VpoW2mi/MNHyFbUyi7tQ3DFolzmmrX6abk0YyB89loB4wmPzafD/83Sjq7lENCE1fJaOHRUKGKppHY4/@lists.infradead.org
X-Gm-Message-State: AFuF++mLrNy82yKmb3fx1Vzjtobe68lp5owqOG7h/av1pMslTJpkMZvP
	SJzHNMElfe8SC6Am8BcoEAnH0g2c3zqauH5wuK/9+/CN5b41r88ELdkI
X-Gm-Gg: AYBFou1d/40edLwh0tER9UzTCTiqlFsGRFRfnWkurwjgNYrt5LoqOGSOMT4acxDyIRZ
	B+O/SDGR8HoFXnai6pCmdb+YiRoE4GPC1fHnbHcIecZI7cP+AyFtN8nWYuzWyiQx9dmPDNoIt3F
	HZodNy6zdRCjHMRVSEF1WpEtLJTMUsIVNl35Qg2f6fcknvR3n+jLmjaSVOoHiIn1w7AQRHlWJCw
	u8PesILMH2WHmAo6hqm4LUC7ILhglXyYxRrmbfKi2e+GD9Kx12d61wwurnxU40vkAMP6gEdpFFM
	9Dd0/QZRDDQMzuh5Tykl2rJc2xx2hOQpJ4VagHOoZxVZEh/AdVRZazV5lPHQmeP0tjwVCiLEEha
	ue9hlO/SbZpQB4yVPhv3MAZYNKaWB3ftU/BJNehNBBlq5m/xUAPw3f6E8C5l0BSBdcDtEiKTy/T
	13LuRx2H4s75ciBoyKsmtUbI7g6bZwh9a8te8NdZR+BFFGmMhHttYa3CSaU2XKRfG4rswiWsDhi
	DmnQRf5IAHAZFXNtD9NQv9NFJanB4R6CoIMX+2FTJsd9wNkELCOpw==
X-Received: by 2002:a17:902:cccd:b0:2d8:d4d3:da50 with SMTP id d9443c01a7336-2dd2a471a7fmr16602305ad.20.1789065116855;
        Thu, 10 Sep 2026 11:31:56 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:432:91:952a:b76f? ([2406:7400:56:e503:432:91:952a:b76f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33b95282a73sm5942038eec.31.2026.09.10.11.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 11:31:56 -0700 (PDT)
Message-ID: <02b29827-3ca3-414b-9377-972f3d46eb03@gmail.com>
Date: Fri, 11 Sep 2026 00:01:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM
 domain to do power on
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
 <20260907111659.263324-3-ulf.hansson@oss.qualcomm.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <20260907111659.263324-3-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_113158_435569_F50FD7B3 
X-CRM114-Status: GOOD (  41.96  )
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

On 07-09-2026 16:46, Ulf Hansson wrote:
> A driver for a non-CPU device that is attached to a CPU PM domain (the
> genpd has the GENPD_FLAG_CPU_DOMAIN configuration set), is currently not
> able to power on the PM domain. More precisely, to power on a CPU PM domain
> one of its corresponding CPUs needs to be woken up if they are idle.
> 
> The current support for a non-CPU device is that its driver can only
> prevent an already powered on CPU PM domain from being powered off. This
> leads to problems for a driver while probing its device or when it needs to
> call pm_runtime_get_sync() to turn on the power for it. From the driver
> point of view it looks like it all works fine, but when accessing the
> device it may end up with various errors as the device may not be fully
> powered on.
> 
> To fix the behavior for these types of devices, let's adjust the behaviour
> in genpd_power_on() to wake up an idle CPU that belongs to it, in cases
> when it's needed.
> 
> Link: https://lore.kernel.org/all/CAPx+jO-sCierYj8jnoKQHckJG16dOBxnNrsZVYO=38R2cLV8nw@mail.gmail.com/
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> ---
> 
> Changes in v3:
> 	- Moved to atomic polling, pointed out by Dhruva.

Thanks, but even in v3 we still have potential issues.
It does not fully address the consequences of polling for five seconds in that context,
nor the parent-lock nesting issue.

This seems to have been pointed out by this corresponding sashiko review as well [1]

[1] https://sashiko.dev/#/patchset/20260907111659.263324-1-ulf.hansson%40oss.qualcomm.com

> 
> Changes in v2:
> 	- Rename a function according to Abel's suggestion.
> ---
>  drivers/pmdomain/core.c | 80 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 75 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 6abe8b198949..b62d4e544bc5 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -10,6 +10,7 @@
>  #include <linux/idr.h>
>  #include <linux/kernel.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
> @@ -19,11 +20,14 @@
>  #include <linux/slab.h>
>  #include <linux/err.h>
>  #include <linux/sched.h>
> +#include <linux/smp.h>
>  #include <linux/suspend.h>
>  #include <linux/export.h>
>  #include <linux/cpu.h>
>  #include <linux/debugfs.h>
>  
> +#include <trace/events/ipi.h>
> +
>  /* Provides a unique ID for each genpd device */
>  static DEFINE_IDA(genpd_ida);
>  
> @@ -32,7 +36,9 @@ static const struct bus_type genpd_provider_bus_type = {
>  	.name		= "genpd_provider",
>  };
>  
> -#define GENPD_RETRY_MAX_MS	250		/* Approximate */
> +#define GENPD_RETRY_MAX_MS		250		/* Approximate */
> +#define GENPD_CPU_ON_POLL_PERIOD_US	100		/* 100us */
> +#define GENPD_CPU_ON_TIMEOUT_US		5000000		/* 5s */
>  
>  #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)		\
>  ({								\
> @@ -1026,15 +1032,75 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>  	}
>  }
>  
> +static bool genpd_status_on(struct generic_pm_domain *genpd)
> +{
> +	bool is_on;
> +
> +	genpd_lock(genpd);
> +	is_on = genpd_status_on_unlocked(genpd);
> +	genpd_unlock(genpd);
> +
> +	return is_on;
> +}
> +
> +static int genpd_wakeup_cpu(struct generic_pm_domain *genpd)
> +{
> +	unsigned int cpu;
> +	bool is_on;
> +	int ret;
> +
> +	/* Find the first online CPU in the genpd's cpumask. */
> +	cpu = cpumask_first_and(genpd->cpus, cpu_online_mask);
> +	if (cpu >= nr_cpu_ids)
> +		return -EAGAIN;
> +
> +	genpd_unlock(genpd);
> +
> +	/* Send a IPI to wakeup the selected CPU. */
> +	smp_send_reschedule(cpu);
> +
> +	/* Poll to wait for it to complete the power on sequence. */
> +	ret = readx_poll_timeout_atomic(genpd_status_on, genpd, is_on, is_on,
> +					GENPD_CPU_ON_POLL_PERIOD_US,
> +					GENPD_CPU_ON_TIMEOUT_US);
> +
> +	genpd_lock(genpd);
> +
> +	/* Re-check the status as we have released the lock in between. */
> +	if (ret || !genpd_status_on_unlocked(genpd))
> +		return -EAGAIN;
> +
> +	return 0;
> +}
> +
> +static bool genpd_need_alive_cpu(struct generic_pm_domain *genpd,
> +				 struct device *dev)
> +{
> +	if (!genpd_is_cpu_domain(genpd))
> +		return false;
> +
> +	/* This is not for CPU devices as those are managed differently. */
> +	if (to_gpd_data(dev->power.subsys_data->domain_data)->cpu >= 0)
> +		return false;
> +
> +	/*
> +	 * If the current CPU doesn't belong to the genpd's cpumask, we need to
> +	 * wake up one of those idle CPUs to power on the CPU domain correctly.
> +	 */
> +	return !cpumask_test_cpu(smp_processor_id(), genpd->cpus);
> +}
> +
>  /**
>   * genpd_power_on - Restore power to a given PM domain and its parents.
>   * @genpd: PM domain to power up.
> + * @dev: The device that needs the PM domain to power on.
>   * @depth: nesting count for lockdep.
>   *
>   * Restore power to @genpd and all of its parents so that it is possible to
>   * resume a device belonging to it.
>   */
> -static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
> +static int genpd_power_on(struct generic_pm_domain *genpd, struct device *dev,
> +			  unsigned int depth)
>  {
>  	struct gpd_link *link;
>  	int ret = 0;
> @@ -1042,6 +1108,10 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
>  	if (genpd_status_on_unlocked(genpd))
>  		return 0;
>  
> +	/* Special case for a device attached to a CPU domain. */
> +	if (genpd_need_alive_cpu(genpd, dev))
> +		return genpd_wakeup_cpu(genpd);
> +
>  	/* Reflect over the entered idle-states residency for debugfs. */
>  	genpd_reflect_residency(genpd);
>  
> @@ -1056,7 +1126,7 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
>  		genpd_sd_counter_inc(parent);
>  
>  		genpd_lock_nested(parent, depth + 1);
> -		ret = genpd_power_on(parent, depth + 1);
> +		ret = genpd_power_on(parent, dev, depth + 1);
>  		genpd_unlock(parent);
>  
>  		if (ret) {
> @@ -1306,7 +1376,7 @@ static int genpd_runtime_resume(struct device *dev)
>  
>  	genpd_lock(genpd);
>  	genpd_restore_performance_state(dev, gpd_data->rpm_pstate);
> -	ret = genpd_power_on(genpd, 0);
> +	ret = genpd_power_on(genpd, dev, 0);
>  	genpd_unlock(genpd);
>  
>  	if (ret)
> @@ -3410,7 +3480,7 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
>  
>  	if (power_on) {
>  		genpd_lock(pd);
> -		ret = genpd_power_on(pd, 0);
> +		ret = genpd_power_on(pd, dev, 0);
>  		genpd_unlock(pd);
>  	}
>  


