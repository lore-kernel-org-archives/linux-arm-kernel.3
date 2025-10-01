Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8264DCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 10:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Frm8BAZ6rWX+aa8TWqwI3ZISUIM4mvLDCAExSs5zG50=; b=AwPheT2LN5uOXYNoWpQHUcgBWr
	SjFEJXBCWyuFEqGCUYTuq/vHRegE3WnCnIpFKeDtOTo0AfiWFsaQuyDJhSfPwZpBRlS9G1QVbqKc2
	8C8NFUG+14l6JMjHToivDkW3rXzSqrkVkiT5mAvmhMF2HzhLXSPw6LI6ZmhXCrwJDGdv1qG7qxvUw
	iiITB+llJZ842oUgYza27CuM6CoIieWWNj0vFqtcKB5q5hrhe3myHzzABrpWYnKy/AEdBr7EEhkoP
	p+f7k+LJkBu/iYVbAorod2puiNWMA8bG4f4K3vU/mlcpztOPla4kwL/shTNJqA5jpRJT1756YwpuD
	cGPi9ogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3uC5-00000007Gjw-02ks;
	Wed, 01 Oct 2025 10:36:21 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3uC3-00000007GjW-03rn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 10:36:20 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so810219b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 03:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759314978; x=1759919778; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Frm8BAZ6rWX+aa8TWqwI3ZISUIM4mvLDCAExSs5zG50=;
        b=d0FEvU7SNAezwwmT0HhgHqHpci9mI/CKc9q6dxnUNidnljWx9m886ZexZUJ8DUTSMW
         lxDBwepxXbVRJXTQFqKUcm0Wj2E3f/HQeoha6DuV/uaNhvLFivWp/OmCGhYWgNZ4ik1c
         DNfbFh+JtUYPi18UT7ayHJ2M0Z45RaRqS/K9QN14eGFkYQ5qoTo//X5tfPAYkBYOXb02
         6ws0jtfkYMn/A5kOvVthK4cuMuPjGXxesBAAl3EoEZudcG8QM8HwAMxK9+obPBr2onQc
         e4tcr/kwArq/xJwVAx53urJG4Oya8v1yyE7EZC9Zjg3RuK1cq7Hy375m13ClSxNyCNsA
         siYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759314978; x=1759919778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Frm8BAZ6rWX+aa8TWqwI3ZISUIM4mvLDCAExSs5zG50=;
        b=RTrSGuPJM65qCLPjRlNp1geVP62kqyGA2IgqfF1PYniCJZDCR1/mHOyXIlgCN7xw/w
         6dztNVFNjtDmaKSGywTc4CS8ztfLuNWGwXuNrzE1CFu5X4RbleXEtJe+/I120pg+CPXq
         sdYKPwUlz76b+DOoOjTpAEZSC9kjicSwMUk0gHlkNe1L41pIhIMhm7Kkf7GQBcEOnoEp
         a2E802lJxPV6khvyUwKmHaQknsPk7iT/Vb4T0wBunlMHs7cb8EHy38ZBvAdDy1PhmmMw
         acADaU71t4a0Yhp8ftA9YU/1VHWSL+2dx1fJu+e2rBXn69taoKw0itRQhGBYcHdqzLTm
         1C2A==
X-Forwarded-Encrypted: i=1; AJvYcCU5XbI254hjyk5lah6WpO//wF2EVPv9hmaeVK33Tu+65ve74VdctmSqxKGZk/3grFe2Dwza6rGMysILj++iN9nq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6SzRAGA7Bbs5fwERXPvinQNGMTE2Jze6E85FPWc3LH7zfLc0N
	KdGbJvAmytyAGh8OcMv9/jmE/+xo/oDwEPvS/KQ6JTOb4lIR1l0CbMRTunP0rp/Z5hGpc4wBc4K
	INXRXp482JyZ5kkWogQzWsYu0SzQBKQvY9a8UY4HGSQ==
X-Gm-Gg: ASbGnctx7UM8iu3FayjbnelvHj4aTAbX33ekjV3zC/YKvhbj7J5JgjjLLV3e56aJK93
	fnwKMy+FibJ/tyLCBi32+QSUbnWYIqjq+Dk8a3Z7ZjZy3rfxaGVlq/PpjLOf5voNbMkc1nu6zNr
	PQpdKWBlN0jVMXit5eR0WdpSzzsGnPEhXENtW9LUysG4o25Azzi/ikl7TdTVRYU//qvOwwL7NYx
	wI4CBsnq0WY+EA74Tx0s57RU45OOmUZLlUx3c/jJ3hzm9FFOJ6wpvZJFYEz8di9aUA4on6JiNk=
X-Google-Smtp-Source: AGHT+IHMsSldqlWSyKGVyTbAPw+8QjVtsiwnQILSuwxz2ciHwCAiBOn2oZ6xJq6WJYj7Et8HuHyDvfPb8sEKENkP/G8=
X-Received: by 2002:a17:90b:1b49:b0:335:228c:6f24 with SMTP id
 98e67ed59e1d1-339a6f314bamr3175214a91.25.1759314978152; Wed, 01 Oct 2025
 03:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-16-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-16-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 1 Oct 2025 11:36:07 +0100
X-Gm-Features: AS18NWA8lAa169vV9xKkkZqpHyaLH3CWmBFjm1cgd9NEinfIqd53QqYERFKwRN8
Message-ID: <CAJ9a7Vh-PwgiYVRe3DAP9L0gC20=A3tnFk2hEzugVuqyFTShLA@mail.gmail.com>
Subject: Re: [PATCH v3 16/31] coresight: Add callback to determine if context
 save/restore is needed
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_033619_241357_4286FE53 
X-CRM114-Status: GOOD (  28.83  )
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

Hi Leo

On Mon, 15 Sept 2025 at 11:34, Leo Yan <leo.yan@arm.com> wrote:
>
> Add a callback in the source device that returns a boolean indicating
> whether context save and restore operations are required. The save and
> restore flow is skipped if the callback returns false.
>
> The ETMv4 driver implements its own version's callback.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c       | 16 +++++++++++-
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 30 +++++++++++++++++-----
>  include/linux/coresight.h                          |  2 ++
>  3 files changed, 40 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index f944a610c85e9e3fce43497543ccc48ab7c2c0d9..94803cacf1a374ae8a3b9513d7d029d5c77d5925 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -423,6 +423,20 @@ int coresight_resume_source(struct coresight_device *csdev)
>  }
>  EXPORT_SYMBOL_GPL(coresight_resume_source);
>
> +static bool coresight_need_save_restore_source(struct coresight_device *csdev)
> +{
> +       if (!csdev)
> +               return false;
> +
> +       if (source_ops(csdev)->need_context_save_restore)

check the actual save and restore ops here too?

> +               return source_ops(csdev)->need_context_save_restore(csdev);
> +
> +       if (coresight_get_mode(csdev))
> +               return true;
> +

Not needed - should decide only on the previous
need_context_save_restore() test.
Components such as STM, ETR, ETB all use the mode status, but may not
support / need save and restore.

> +       return false;
> +}
> +
>  static int coresight_save_source(struct coresight_device *csdev)
>  {
>         if (csdev && source_ops(csdev)->save)
> @@ -1597,7 +1611,7 @@ static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
>         unsigned int cpu = smp_processor_id();
>         struct coresight_device *source = per_cpu(csdev_source, cpu);
>
> -       if (!source)
> +       if (!coresight_need_save_restore_source(source))
>                 return NOTIFY_OK;
>
>         switch (cmd) {
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index ec7e8d09ce58d62dac826fba9edafc967504a1a5..66aefdb002f075446572df9c4eed9093da19a066 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1839,6 +1839,21 @@ static int etm4_dying_cpu(unsigned int cpu)
>         return 0;
>  }
>
> +static bool etm4_need_context_save_restore(struct coresight_device *csdev)
> +{
> +       if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
> +               return false;
> +
> +       /*
> +        * Save and restore the ETM Trace registers only if
> +        * the ETM is active.
> +        */
> +       if (coresight_get_mode(csdev))
> +               return true;
> +
> +       return false;
> +}
> +
>  static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>  {
>         int ret = 0;
> @@ -1927,13 +1942,14 @@ static void etm4_cpu_restore(struct coresight_device *csdev)
>  }
>
>  static const struct coresight_ops_source etm4_source_ops = {
> -       .cpu_id         = etm4_cpu_id,
> -       .enable         = etm4_enable,
> -       .disable        = etm4_disable,
> -       .resume_perf    = etm4_resume_perf,
> -       .pause_perf     = etm4_pause_perf,
> -       .save           = etm4_cpu_save,
> -       .restore        = etm4_cpu_restore,
> +       .cpu_id                    = etm4_cpu_id,
> +       .enable                    = etm4_enable,
> +       .disable                   = etm4_disable,
> +       .resume_perf               = etm4_resume_perf,
> +       .pause_perf                = etm4_pause_perf,
> +       .save                      = etm4_cpu_save,
> +       .restore                   = etm4_cpu_restore,

Above are just white space change noise as far as I can see.

> +       .need_context_save_restore = etm4_need_context_save_restore,
>  };
>
>  static const struct coresight_ops etm4_cs_ops = {
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index d0764a9c7692181d2619c277acb83701c6b0115e..39781ba24ee2ad9f3065770409aafb0e5af57fa8 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -400,6 +400,7 @@ struct coresight_ops_link {
>   * @disable:   disables tracing for a source.
>   * @resume_perf: resumes tracing for a source in perf session.
>   * @pause_perf:        pauses tracing for a source in perf session.
> + * @need_context_save_restore: if need to save and restore context.
>   * @save:      save context for a source.
>   * @restore:   restore context for a source.
>   */
> @@ -411,6 +412,7 @@ struct coresight_ops_source {
>                         struct perf_event *event);
>         int (*resume_perf)(struct coresight_device *csdev);
>         void (*pause_perf)(struct coresight_device *csdev);
> +       bool (*need_context_save_restore)(struct coresight_device *csdev);
>         int (*save)(struct coresight_device *csdev);
>         void (*restore)(struct coresight_device *csdev);
>  };
>
> --
> 2.34.1
>

Regards

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

