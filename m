Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A29CCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 12:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4J4Dpi2D5zioTsLWQ3uc8x00HFc+r2OHM6Nh4nvlvcw=; b=wZmYlOUtPYzCwfmq16fDmFYAN2
	1JLM3oOhMTHB7uQz7nAckM05yKvk9nsKWEMpyEeaF1Qay+W9Tuw6xyu8DBYrVe1l5li/ch8PacTeX
	zzvxGVYtY5khaV1qn3iA7p/0bgnip47zZExEJz3th4yJ0yWjbrHB/1SHXX8Q/t/z3hPh37/gu3dnQ
	abDHrKIekd6LQzrf1vGndT2ycwFGtiNEHtDUTvGcZ+MNcH4w7M/AxHSsByyVv55UgUArvi5XMxATb
	pOI42BqQOXiTfLSdoyD+ioeJmsJZIsvzZN4guV9Tl04hAKjns5rJ8ctGxcxPNtzOstYnIWH5TZgEy
	IzTDY/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ImD-0000000ATk7-0Ref;
	Thu, 02 Oct 2025 12:51:17 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Im8-0000000ATjL-38fG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 12:51:15 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-330b0bb4507so998510a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 05:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759409472; x=1760014272; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4J4Dpi2D5zioTsLWQ3uc8x00HFc+r2OHM6Nh4nvlvcw=;
        b=yS8syJvnsGgiwYthcWh4wbOfPqHAfZ7S/54QedX5cNmkVydi/FQXfn9aGztPk9UAeB
         kyuC/qlrNyqwoS9wDN2FUmJzUvVqDIRl7/ApgLzkKbpHI89VtEwXS6e1CJf3155yGvP5
         ZHjby+XvxzVEen9wtkFs0VuAS0gQVI4n8tXyj87BQzJwJltRPxrnZL3UgHqwyCJpHb1j
         TZDHbQsvGz1m82m8xGeOJBBuxX8jN/lrze4HZf77kkZEBnzQda4le03dTEMkD8WYG6dy
         pEj/jpur3lZ4C8QD7nplf2c39e0cwsW+0/co8KrIf7CMOoC9+/rV3CTU95LltE4Hf2p0
         QBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409472; x=1760014272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4J4Dpi2D5zioTsLWQ3uc8x00HFc+r2OHM6Nh4nvlvcw=;
        b=H8tglIFxXm6pUWgcDmQ5sqBdczR6u+dDzo0eI2pyQU6E8E7dPB4utr+xBovfjU4Qva
         vYFHzNcrs1tMEVZr1yJzp1X5JL1Mp5HM9Fk03MH9UTyEMsAPjdRTj12ydDSvd+hwcwAj
         Q6IoTsUX9Z6V/28MPckbtRkCIDFW18ZL6bvvptZfpZAUp4adTswZnzXMzt8c3AgqkOF5
         nt2zJM+8s1ylqDh8DRDL40juWFi9I5A6R5uKdAq2ooQEuquaPKFOT+Rgv4cMuCNa0jaj
         iWlv91sLOBJwGQNec06CZPVs+VfdUwHVg5fXG4itRXqGt+81st6RiGA7IMJdr8oixtAu
         2tpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoO+edcxa0bHrHqjrVLJQBhj6WBCEZLyeSU9FLnpvhtKWuFOQqhWAf7WWU2793oP38fJu7VB5rJswHQhnLKMIA@lists.infradead.org
X-Gm-Message-State: AOJu0YxvyJwH/06wdJUxsmpOh1zWcmrhkYqoebP1Uma1f0QupG2VpMnE
	aoxJILPA06B7SKXZHNyWtZDf++VKX+lcb6w3SWOZIHaPPFD4odvJI9mPkxzVhRCxfn2GwUYC19d
	JiIXcf17UVvFUgZ8/pTYbcC7xFw/Uywc6qC7a4d3n3g==
X-Gm-Gg: ASbGncvmOVIz2VwalOC9UhvxHpD0f2H8/xdoM1n6FAppWZLlXIa0Pg7kL9+t6cq76mI
	hHSr5Pf1SrckkOLQk7e4UtPa/vCDqS8IRE/tlVNSoxa5z9HuA+4bnXrz/KPmxwtZ6Rj4r2MS4mn
	QJ44DuaoHaBUt+ZN6yWvqw0IK1lfXg0oquHDown80yV23J+EkSmRX23uHlaI+fVvlM6hcnFPaJz
	DHM9J8n6txAT5lY8Y10DXgvUjG4CKKyzl6sZTaE+wj2vyw=
X-Google-Smtp-Source: AGHT+IGzxUAG69pyQ7+pKx/vtMoyi8Z5OU+uNKm/EEIk0hfYdt9MZmVO/uXnhyVS7S1SnzXE7nKlIS/ayJ+s5FU23GI=
X-Received: by 2002:a17:90b:17cf:b0:32e:aaac:907 with SMTP id
 98e67ed59e1d1-339a6e74a8amr8405783a91.5.1759409471846; Thu, 02 Oct 2025
 05:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-15-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-15-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 2 Oct 2025 13:50:59 +0100
X-Gm-Features: AS18NWD2QapMYOb5g9_Vza4OPn8mpjQPuYI3Rg79kCfTgTfXiPMsWjZHraS_jXI
Message-ID: <CAJ9a7Vi6fOXh6LTp3YYn_bJc20jijEew+V8_cBRnJLVb7qXCSw@mail.gmail.com>
Subject: Re: [PATCH v3 15/31] coresight: etm4x: Hook CPU PM callbacks
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_055112_799737_E0E08DB3 
X-CRM114-Status: GOOD (  23.36  )
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

On Mon, 15 Sept 2025 at 11:34, Leo Yan <leo.yan@arm.com> wrote:
>
> Since the CoreSight core layer has registered CPU PM notifiers, this
> patch hooks CPU save and restore callbacks to be invoked from the core
> layer.
>
> The CPU PM notifier in the ETMv4 driver is no longer needed, remove it
> along with its registration and unregistration code.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 73 ++++++----------------
>  1 file changed, 18 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 7e66d094269de4a1344f5d962bc320b2603b7627..ec7e8d09ce58d62dac826fba9edafc967504a1a5 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1186,19 +1186,6 @@ static void etm4_pause_perf(struct coresight_device *csdev)
>         drvdata->paused = true;
>  }
>
> -static const struct coresight_ops_source etm4_source_ops = {
> -       .cpu_id         = etm4_cpu_id,
> -       .enable         = etm4_enable,
> -       .disable        = etm4_disable,
> -       .resume_perf    = etm4_resume_perf,
> -       .pause_perf     = etm4_pause_perf,
> -};
> -
> -static const struct coresight_ops etm4_cs_ops = {
> -       .trace_id       = coresight_etm_get_trace_id,
> -       .source_ops     = &etm4_source_ops,
> -};
> -
>  static bool cpu_supports_sysreg_trace(void)
>  {
>         u64 dfr0 = read_sysreg_s(SYS_ID_AA64DFR0_EL1);
> @@ -1903,8 +1890,9 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>         return ret;
>  }
>
> -static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
> +static int etm4_cpu_save(struct coresight_device *csdev)
>  {
> +       struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>         int ret = 0;
>
>         if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
> @@ -1927,8 +1915,10 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>         etm4_enable_hw(drvdata, false);
>  }
>
> -static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
> +static void etm4_cpu_restore(struct coresight_device *csdev)
>  {
> +       struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
>         if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
>                 return;
>
> @@ -1936,38 +1926,19 @@ static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>                 __etm4_cpu_restore(drvdata);
>  }
>
> -static int etm4_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
> -                             void *v)
> -{
> -       struct etmv4_drvdata *drvdata;
> -       unsigned int cpu = smp_processor_id();
> -
> -       if (!etmdrvdata[cpu])
> -               return NOTIFY_OK;
> -
> -       drvdata = etmdrvdata[cpu];
> -
> -       if (WARN_ON_ONCE(drvdata->cpu != cpu))
> -               return NOTIFY_BAD;
> -
> -       switch (cmd) {
> -       case CPU_PM_ENTER:
> -               if (etm4_cpu_save(drvdata))
> -                       return NOTIFY_BAD;
> -               break;
> -       case CPU_PM_EXIT:
> -       case CPU_PM_ENTER_FAILED:
> -               etm4_cpu_restore(drvdata);
> -               break;
> -       default:
> -               return NOTIFY_DONE;
> -       }
> -
> -       return NOTIFY_OK;
> -}
> +static const struct coresight_ops_source etm4_source_ops = {
> +       .cpu_id         = etm4_cpu_id,
> +       .enable         = etm4_enable,
> +       .disable        = etm4_disable,
> +       .resume_perf    = etm4_resume_perf,
> +       .pause_perf     = etm4_pause_perf,
> +       .save           = etm4_cpu_save,
> +       .restore        = etm4_cpu_restore,
> +};
>
> -static struct notifier_block etm4_cpu_pm_nb = {
> -       .notifier_call = etm4_cpu_pm_notify,
> +static const struct coresight_ops etm4_cs_ops = {
> +       .trace_id       = coresight_etm_get_trace_id,
> +       .source_ops     = &etm4_source_ops,
>  };
>
>  /* Setup PM. Deals with error conditions and counts */
> @@ -1975,16 +1946,12 @@ static int __init etm4_pm_setup(void)
>  {
>         int ret;
>
> -       ret = cpu_pm_register_notifier(&etm4_cpu_pm_nb);
> -       if (ret)
> -               return ret;
> -
>         ret = cpuhp_setup_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING,
>                                         "arm/coresight4:starting",
>                                         etm4_starting_cpu, etm4_dying_cpu);
>
>         if (ret)
> -               goto unregister_notifier;
> +               return ret;
>
>         ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
>                                         "arm/coresight4:online",
> @@ -1998,15 +1965,11 @@ static int __init etm4_pm_setup(void)
>
>         /* failed dyn state - remove others */
>         cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
> -
> -unregister_notifier:
> -       cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
>         return ret;
>  }
>
>  static void etm4_pm_clear(void)
>  {
> -       cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
>         cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
>         if (hp_online) {
>                 cpuhp_remove_state_nocalls(hp_online);
>
> --
> 2.34.1
>

c.f. my previous comments regarding save/restore nameing and location

otherwise looks fine.

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

