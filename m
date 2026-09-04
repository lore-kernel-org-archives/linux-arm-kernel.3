Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42140C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BauMjs1SRuPjbFG+n0MnSau2eIvhuX4gcrdx4dJMYEY=; b=dRDor1l5P73wO4+MlwEFPleM2S
	8uI4HrKrqE3qXJywYiq2toeecrezRiS3QsujbMlLBnouvzarlEJcRP+3AQCxZY/2aGdgawsPUu/Nh
	ArqDEZZeRZC1FZV+o7bP7uRx0lEKDf+CeEScyIfJumopsVbstHxv+YTYpFNiWs9EhmuKYNsLw27LH
	MNNukhcpf5P4HOStC/3wEYgf+5CPoN+W8sQY7nQJHoJi3/Hhp4dlgKwHNjSXo++JivBJgZUYnFyjA
	Ym3XYKA7BFlChF9GNpaWf6VZWOZiyxVk749lb2IGHV0KUeZZMoIv4xTaCToM+SSXA/v1ePt6pnjcU
	vwM+YLxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wkj-00000002jBB-1qjw;
	Fri, 04 Sep 2026 16:26:57 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wkg-00000002jAo-17a3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:26:55 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7f4df360cc9so1474528a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 09:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539213; x=1789144013; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BauMjs1SRuPjbFG+n0MnSau2eIvhuX4gcrdx4dJMYEY=;
        b=hA9o7kbrzkha/gIPPPOT76wjSXnzFpqDf8O/EqKshJGjm2EsMC3AMlYBv4XuFNBLB3
         aY1v9yRGXAwX1TKTh7ARc1ajmu7kAFayQk0Uy9PR0xvhO/R4xKWoAj9x39/tIwZBrXvQ
         hAIGuROwyAJnnMHA2/BTj9rmQFhmTmxxy8KDbOtoycqT7XD/5orJZjpB92z7QZHuCbtm
         zzVNH6GfR4P1upWnHJSlosaDtQeS9CJP5Qz0C7b4TdcGyMZPSc1NvQ44jsDkcs9kPFfr
         H0wehDXVStmuqly68x+Kucdv63b4RWRUMsJx39zf2Eg0KM2Zo57QJgYr7mkYPXNfqdsJ
         iZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539213; x=1789144013;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BauMjs1SRuPjbFG+n0MnSau2eIvhuX4gcrdx4dJMYEY=;
        b=S0AC3ti44X9fPtzqLu2P3cfPWxpixmQjzwxihmkKhtX9f4W6e47y7UkIrOvsn/G9Dt
         UGrM3AlVuQ1TyoCYC+bB0P5T3UhyL9MaMtxl34DHHcp0hmKlkwZWGW/0ON7JIhKbcV8q
         yQTgX0OgPxE5W8zEJgOUScz8q53RoeEFZljcsIV0bXlvBSNfQAt/s52ADaJuvSwdCnsh
         H8f9HRaHljkVjockGBWO+Zl4GXv+4RzCeMysBAD44Y6Y7bOcA1Mo0kTTkpAn7vWFeLEL
         AXIF/ZwuCExZbaTPzv5sl82VZ7+0lih6VEMwqAYX7pA2r3P350uDRqTMHnQTJ8lZjKG5
         C7hg==
X-Forwarded-Encrypted: i=1; AKwUvBxzkqpQ83S+9SEHrElG2i42m+HnLIH4Zha2UM7ZPElERbxINiI1r7Uo37fYgUD6gvDOs9HCpj1mmKUXLrJJ/2/6@lists.infradead.org
X-Gm-Message-State: AFuF++ljmQf1iZBI54EbC0BFboXxVBnbL81FiUX7i6ay89RjytPv40/P
	mBVfWVfEjK11vGW86QkwdTSILuBzpjqWGKH1p5+HEeLQfn6xMLhgvht1
X-Gm-Gg: AYBFou2xCPE1STVB2UuRuWWw+XJAjxp7MDUH4j4mWNrNbJfTWJjb0j/eMvE23WxXT3G
	7IGRiYHJBJjOLeQgyCM7cu5X3sn2VVnHoPoU8AnGx1Q1pYeM879xfj5PTqbW+/UdysHBjSBanIz
	jFR290+FCQsuBtK6t0aawVs6SjJXxu/ZT/2qPxu1r1EQ50hu/A6/E42tpxXSyyVYyhTyX3UvtmP
	SezUnQEHzNcN3qLojDYjrJT7TWzrOgY/kgHJYv00SMAu+4ZVcf3Fj+xefZvEdBTcJ+kHe1EtqQm
	hmkUMjjJEAEvw9ITGm8hMTSagAObKFoBfUrQyNLEcXP4ysbO88+knrpEb3jqHKRmaARY1MK8gQ8
	eSDRT9YflYYOPMv6CrLIprMvfRb5+B5qCrNlWrADfmLSgXxJktoLP4XX0WBWtV4pU1igyijoaIM
	Zq/+IU3+O3+alKH/XF2MWH8gdd4cSzL55hlZJsJAnsdZs1q3xEHQ2DGTqV+PFwj7BoWOxGxgNpD
	LSwamMUJ+zjdCugIkKkUKB8bhWSD+IC9MT5D69FlmXg7DOb6g==
X-Received: by 2002:a05:6830:a20a:10b0:7f4:3f10:7843 with SMTP id 46e09a7af769-7f89bc593b4mr4528909a34.10.1788539212476;
        Fri, 04 Sep 2026 09:26:52 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:ad72:fda5:83e8:be95? ([2406:7400:56:e503:ad72:fda5:83e8:be95])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fa888f614dsm1849437a34.15.2026.09.04.09.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 09:26:51 -0700 (PDT)
Message-ID: <12268d64-08c7-421f-83e2-e6306fde9a88@gmail.com>
Date: Fri, 4 Sep 2026 21:56:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dhruva G <goledhruva@gmail.com>
Subject: Re: [PATCH v2 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM
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
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
 <20260901111441.122436-3-ulf.hansson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260901111441.122436-3-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_092654_338674_0CE401CF 
X-CRM114-Status: GOOD (  44.29  )
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

On 01-09-2026 16:44, Ulf Hansson wrote:
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
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> ---
> 
> Changes in v2:
> 	- Rename a function according to Abel's suggestion.
> 
> ---
>  drivers/pmdomain/core.c | 80 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 75 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 6ac1ce18fda3..97273ed2f825 100644
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
> @@ -1027,15 +1033,75 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
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
> +	ret = readx_poll_timeout(genpd_status_on, genpd, is_on, is_on,
> +				 GENPD_CPU_ON_POLL_PERIOD_US,
> +				 GENPD_CPU_ON_TIMEOUT_US);

How is sleeping here made safe for IRQ-safe consumers and child domains?

For a hypothetical example, consider an IRQ-safe SPI controller in an IRQ-safe child domain D,
whose parent P is a CPU domain. CPU A is outside P, and CPU B belongs to P. Both domains are initially off.

A runtime-resume request on CPU A follows this path in drivers/pmdomain/core.c:

genpd_runtime_resume(SPI device)
-> lock D
-> genpd_power_on(D)
-> lock parent P
-> genpd_power_on(P)
-> genpd_wakeup_cpu(P)

genpd_wakeup_cpu() drops P's lock and sends an IPI to CPU B, but D's spinlock remains held. readx_poll_timeout() 
can then reach usleep_range() while D’s spinlock is still held.

There is also a problem without the child domain: for an IRQ-safe device attached directly to P, __rpm_callback()
leaves interrupts disabled. Dropping P’s lock restores the already-disabled interrupt state, so readx_poll_timeout()
still cannot be used with a nonzero sleep interval and timeout.

I have not reproduced this on a board; this is a hypothetical configuration illustrating the paths.

Is there a restriction elsewhere that prevents either configuration? Otherwise, this wait cannot sleep,
and the parent lock needs to be reacquired with the same nesting depth used by genpd_power_on().



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
> @@ -1043,6 +1109,10 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
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
> @@ -1057,7 +1127,7 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
>  		genpd_sd_counter_inc(parent);
>  
>  		genpd_lock_nested(parent, depth + 1);
> -		ret = genpd_power_on(parent, depth + 1);
> +		ret = genpd_power_on(parent, dev, depth + 1);
>  		genpd_unlock(parent);
>  
>  		if (ret) {
> @@ -1307,7 +1377,7 @@ static int genpd_runtime_resume(struct device *dev)
>  
>  	genpd_lock(genpd);
>  	genpd_restore_performance_state(dev, gpd_data->rpm_pstate);
> -	ret = genpd_power_on(genpd, 0);
> +	ret = genpd_power_on(genpd, dev, 0);
>  	genpd_unlock(genpd);
>  
>  	if (ret)
> @@ -3411,7 +3481,7 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
>  
>  	if (power_on) {
>  		genpd_lock(pd);
> -		ret = genpd_power_on(pd, 0);
> +		ret = genpd_power_on(pd, dev, 0);
>  		genpd_unlock(pd);
>  	}
>  


