Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4A7CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 14:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyplaDw83KpDeNY1s4EqA5ojQ8ClQh9SiYzDLXCpO6w=; b=Fw6/xlyKsTG9Yej4OmSYUikdUJ
	gZzRYE5xC69uW7x5LWQz1rd3qzPfwxsvQ0bAkl8N/tAU61XBdSyoyZ9EQcTluQGKDoUIN3uOe5u/+
	m+MoV6N9Hew7QbcMzxPYU3RpK9N4/vzB68LvSyRHXrtl0+mO3Lv1WGhZ6j9EYQn0nOaMwE890eQ3d
	KajVqX7aN7UI/54l9VPodRvCYNe7tGWv1YP8qN+XKm/qCA09diTzTN8Orv9gytRwvvuR4ns+ZMvqg
	dWoI4XG41tLPRCdvys46titsgIsyH87jPAD59uOvh5T3rXiVu/5EGMNK06kGnTm9h8Nrv/J95TZax
	uifAeUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v292D-00000001nVG-38h7;
	Fri, 26 Sep 2025 14:02:53 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2925-00000001nPA-0Dh2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 14:02:46 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-330b4739538so2358985a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 07:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758895364; x=1759500164; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QyplaDw83KpDeNY1s4EqA5ojQ8ClQh9SiYzDLXCpO6w=;
        b=OqdWoYSVcVR0jbH5C7utBqn5QBObt8Q7Un6EFIx02PlRvDI1wgseWGzTgR0lhYBkV/
         jr0Lvpma7B4aN/OjOVI0a1ze4aT/1967h9T1mualf6MbuJTM2lZ2Rmsgaw+jOIf8oHBO
         8lWhqQB5nRV6Jm/s8QGC3VJIkQ5qREPxkhfFQAw4Vx3QnJQI11OaZqgmTuVqSIaMJv21
         ov2hd5NK2i3J38omO7QsmiSmTF0iEcRD6Jucw19T1Ym5oNdfpZOu3kXdhNgMTBl4oxG7
         JCfn7CTf3NLOmVFr+SXcDV+/MOqDuTM0KdIF0TMXyIglEAQzKbLUVncNhc8srT+3GAyc
         5hSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758895364; x=1759500164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QyplaDw83KpDeNY1s4EqA5ojQ8ClQh9SiYzDLXCpO6w=;
        b=G1ydP7hqnj/zAjj52qXkjBVHdhnW4aw/BJ9v4m4ig0AZ0HEJySU3F+P5AV1nwWgFEU
         PHvvaoi3O10QhrFS0NtGob1lsnWcRE/mI/X4GJxcLpI+MdLAjhlBJxN9h06kxD0RNF8+
         rxUOFb5/hit1xI/XwhkEmtkUlCZU5ttO0a753kENBlZuT6AYG2PetFZ780reRRGzh8+M
         OF24+kQhBSC6XRqdghNyK17USyuS8vhp1+j2jmcQjGuEHs5Sh0VAFkh2TypaDUBAiRbZ
         EOLpQXdnzr9BzxUDCMbnhKzvQztzBBZ+J5+CW7uWr8d0dCWxaQmi+ulgE6UT3L9SUNPI
         i/Yw==
X-Forwarded-Encrypted: i=1; AJvYcCV7dPesimAxcbveAtzAr1sXcF40oabbFl9io8nhg71Tu/6pyN6qjSlTuNAu/TxxRkWgUHldDmb8CgXWcL8bG7jW@lists.infradead.org
X-Gm-Message-State: AOJu0YyVQxWXCPLHU5aZWqJ78JC1L0qv/BV2pWj8khS0YVfUTF/6GES5
	p17OJ2+vGLWK8X/CXI9z3a4KK59aH6Ox+dZtM8K5NQOg53gVS6jMfe9glpUV3UMC1EHVw6euNnH
	FHH7puJxE5NE4SK2dwEFkv0AcyL7YKJMDyx4vvNwajw==
X-Gm-Gg: ASbGncsZJhktcE7Xr1KU1JT5yKiyc3rGCoQ/QyQ5h/AE0N7tQ71b0zVyvkUvLuEWbv9
	ca8mFkvJIiNT6gblQvzKClqsfB45YckTN1Q6TmgmjOpBol/jflmoobLQk/jW8zUzs1fFu4d7SUm
	4d9Y3Cud9wXVRglp7WhPPytBLBWj0OytL55ZZIyohwCieUpeL5CzT8j5DuBsJYAxs+gSA0TzY3q
	JQfaMBB
X-Google-Smtp-Source: AGHT+IFoLCdTZ4NabU6J07+3RfHxa6P1+W++pdRLg8S2OsCrXJ++4vB0Sr1fuxeFE/sM34kmUsq+RajzFIKWvB0sF5o=
X-Received: by 2002:a17:90b:3d4e:b0:32d:db5b:7636 with SMTP id
 98e67ed59e1d1-3342a2c2982mr7673491a91.27.1758895363919; Fri, 26 Sep 2025
 07:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-2-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-2-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 26 Sep 2025 15:02:32 +0100
X-Gm-Features: AS18NWByyu1V8Sk-ZxZGp0OqUl_bz410BbiYvuuQdWJIfgY1Ryv6-3IJEOzSS_k
Message-ID: <CAJ9a7VjMHJBzHB1mGE7czFjsJCWuR8CAMPsNqpT6LMiVq-SRiA@mail.gmail.com>
Subject: Re: [PATCH v3 02/31] coresight: etm4x: Always set tracer's device
 mode on target CPU
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_070245_097665_003FC90A 
X-CRM114-Status: GOOD (  33.71  )
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

On Mon, 15 Sept 2025 at 11:33, Leo Yan <leo.yan@arm.com> wrote:
>
> When enabling a tracer via SysFS interface, the device mode may be set
> by any CPU - not necessarily the target CPU. This can lead to race
> condition in SMP, and may result in incorrect mode values being read.
>
> Consider the following example, where CPU0 attempts to enable the tracer
> on CPU1 (the target CPU):
>
>  CPU0                                    CPU1
>  etm4_enable()
>   ` coresight_take_mode(SYSFS)
>   ` etm4_enable_sysfs()
>      ` smp_call_function_single() ---->  etm4_enable_hw_smp_call()
>                                         /
>                                        /  CPU idle:
>                                       /   etm4_cpu_save()
>                                      /     ` coresight_get_mode()
>                Failed to enable h/w /         ^^^
>   ` coresight_set_mode(DISABLED) <-'          Read the intermediate SYSFS mode
>
> In this case, CPU0 initiates the operation by taking the SYSFS mode to
> avoid conflicts with the Perf mode. It then sends an IPI to CPU1 to
> configure the tracer registers. If any error occurs during this process,
> CPU0 rolls back by setting the mode to DISABLED.
>
> However, if CPU1 enters an idle state during this time, it might read
> the intermediate SYSFS mode. As a result, the CPU PM flow could wrongly
> save and restore tracer context that is actually disabled.
>
> To resolve the issue, this commit moves the device mode setting logic on
> the target CPU. This ensures that the device mode is only modified by
> the target CPU, eliminating race condition between mode writes and reads
> across CPUs.
>
> An additional change introduces the etm4_disable_hw_smp_call() function
> for SMP calls, which disables the tracer and explicitly set the mode to
> DISABLED during SysFS operations.
>
> The flow is updated with this change:
>
>  CPU0                                    CPU1
>  etm4_enable()
>   ` etm4_enable_sysfs()
>      ` smp_call_function_single() ---->  etm4_enable_hw_smp_call()
>                                           ` coresight_take_mode(SYSFS)
>                                             Failed, set back to DISABLED
>                                           ` coresight_set_mode(DISABLED)
>
>                                           CPU idle:
>                                           etm4_cpu_save()
>                                            ` coresight_get_mode()
>                                               ^^^
>                                               Read out the DISABLED mode
>
> Fixes: c38a9ec2b2c1 ("coresight: etm4x: moving etm_drvdata::enable to atomic field")
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 48 +++++++++++++++-------
>  1 file changed, 33 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 020f070bf17dc0557dfb3ae4f282b0a0c1778bd8..02ad41da7356547a67c53ff0a9146aec844f89da 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -592,10 +592,23 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>  static void etm4_enable_hw_smp_call(void *info)
>  {
>         struct etm4_enable_arg *arg = info;
> +       struct coresight_device *csdev;
>
>         if (WARN_ON(!arg))
>                 return;
> +
> +       csdev = arg->drvdata->csdev;
> +       if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
> +               /* Someone is already using the tracer */
> +               arg->rc = -EBUSY;
> +               return;
> +       }
> +
>         arg->rc = etm4_enable_hw(arg->drvdata);
> +
> +       /* The tracer didn't start */
> +       if (arg->rc)
> +               coresight_set_mode(csdev, CS_MODE_DISABLED);
>  }
>
>  /*
> @@ -811,6 +824,9 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>         int ret = 0;
>         struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>
> +       if (!coresight_take_mode(csdev, CS_MODE_PERF))
> +               return -EBUSY;
> +
>         if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id())) {
>                 ret = -EINVAL;
>                 goto out;
> @@ -830,6 +846,9 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>         ret = etm4_enable_hw(drvdata);
>
>  out:
> +       /* The tracer didn't start */
> +       if (ret)
> +               coresight_set_mode(csdev, CS_MODE_DISABLED);
>         return ret;
>  }
>
> @@ -882,11 +901,6 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
>  {
>         int ret;
>
> -       if (!coresight_take_mode(csdev, mode)) {
> -               /* Someone is already using the tracer */
> -               return -EBUSY;
> -       }
> -
>         switch (mode) {
>         case CS_MODE_SYSFS:
>                 ret = etm4_enable_sysfs(csdev, path);
> @@ -898,10 +912,6 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
>                 ret = -EINVAL;
>         }
>
> -       /* The tracer didn't start */
> -       if (ret)
> -               coresight_set_mode(csdev, CS_MODE_DISABLED);
> -
>         return ret;
>  }
>
> @@ -953,10 +963,9 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
>         isb();
>  }
>
> -static void etm4_disable_hw(void *info)
> +static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>  {
>         u32 control;
> -       struct etmv4_drvdata *drvdata = info;
>         struct etmv4_config *config = &drvdata->config;
>         struct coresight_device *csdev = drvdata->csdev;
>         struct csdev_access *csa = &csdev->access;
> @@ -993,6 +1002,15 @@ static void etm4_disable_hw(void *info)
>                 "cpu: %d disable smp call done\n", drvdata->cpu);
>  }
>
> +static void etm4_disable_hw_smp_call(void *info)
> +{
> +       struct etmv4_drvdata *drvdata = info;
> +
> +       etm4_disable_hw(drvdata);
> +
> +       coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
> +}
> +
>  static int etm4_disable_perf(struct coresight_device *csdev,
>                              struct perf_event *event)
>  {
> @@ -1022,6 +1040,8 @@ static int etm4_disable_perf(struct coresight_device *csdev,
>         /* TRCVICTLR::SSSTATUS, bit[9] */
>         filters->ssstatus = (control & BIT(9));
>
> +       coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
> +
>         /*
>          * perf will release trace ids when _free_aux() is
>          * called at the end of the session.
> @@ -1047,7 +1067,8 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>          * Executing etm4_disable_hw on the cpu whose ETM is being disabled
>          * ensures that register writes occur when cpu is powered.
>          */
> -       smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
> +       smp_call_function_single(drvdata->cpu, etm4_disable_hw_smp_call,
> +                                drvdata, 1);
>
>         raw_spin_unlock(&drvdata->spinlock);
>
> @@ -1087,9 +1108,6 @@ static void etm4_disable(struct coresight_device *csdev,
>                 etm4_disable_perf(csdev, event);
>                 break;
>         }
> -
> -       if (mode)
> -               coresight_set_mode(csdev, CS_MODE_DISABLED);
>  }
>
>  static int etm4_resume_perf(struct coresight_device *csdev)
>
> --
> 2.34.1
>

Reviewed-by: mike Leach <mike.leach@linaro.org>

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

