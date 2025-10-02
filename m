Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E72CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 11:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pv9NiJR3U5mTlNqyExgoYzJ+4KeryQaXBRQipi8d7QI=; b=evkuGIu0+vWN/8FY2oIoldn0On
	FKfA0sOeGrsy/Apfk0H1XjWxaB23hj3VMs/M5fNAjvQr0LZhuWIzEf+AeP+Gr7gnN2wV48odMfn4u
	7psDoKIX9DpzI6NBYO2JNFesLpy7uUvCJWxoLgDhyzg7hkl4iDUJWPBtMvf8sK+PgMpDzNx0WEduE
	xndDsRS97IfGeIloT/mBU2Y2A/j2Kcqxk0rJnH0XkC0cLSVW1BRJuQdgYn5iQh+JGD9TlomhQ6cay
	UZQ9Br/s2NJMvoYLn5NwHuVNx0McmCXKC9SK+aTI05V+0w5lK7nYT+mr1Wz4LTd6YHpZBerap1V53
	UPeKURUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4HEV-0000000ALaq-3jrN;
	Thu, 02 Oct 2025 11:12:23 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4HES-0000000ALaU-3o2U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 11:12:22 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-27edcbbe7bfso11436245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 04:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759403540; x=1760008340; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pv9NiJR3U5mTlNqyExgoYzJ+4KeryQaXBRQipi8d7QI=;
        b=l3K5E5JjTdroReR6aX4E6iHuiJqOT2zLUyzHvmzm89joqA67gK01jy/4JAbtnL32q+
         An3+xl+BPpOa1yq3neEPcJaGvhAA6qzBsV2I9dGh97Cwg/E8ziT3av3qWgMZ3mADz5LG
         zdt5JLe/w1WvXd4g8okX7sjBrENHg6jAimcuNdUi/y62ARIXbEmF+xacSFajiG16UYvp
         fnherl5sJRXOOhpLQ7Nj2ESN/tnsBIqrnGZzYjAcVpiwO6tNMLaTnshX5szS5r8db60c
         NT4MYIZlT4dtGzsC3vV3DkH+kfHcVMZxUAnmNneRjNuCJU/2eTm5TthoAz8Z4Bwusa7c
         tjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759403540; x=1760008340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pv9NiJR3U5mTlNqyExgoYzJ+4KeryQaXBRQipi8d7QI=;
        b=CepkzjU7O+5Iy8AZNi/LtvZdn7tLXt4A6qZtQ1NuC/1SNvkK2L4x4/N8RFN/gfQ4nY
         EfvOvJnDi0o7ZDtgZ7xFhri24Lg0bjLAnRq8kzzX/eXqEsHyiV70DK94oE14AHz/Onui
         FHWpwOdlry8+zhbXbdNT0zi7xtRdEV33BInD5Ja6SPIYkMVjPcBazaHIulvDHBMdpkp9
         HQPF6K+drlHCr8ZOYdwWYoCtq/ki4h8IJAulUDXWp5yZF7kRIolIsCvRz/3qsTj6xIOr
         GSbj3nhkreFewnoXPRSh/2Md631k4SW8ELjy3Sl4Er4kL4WXWbn18In7K80QnC4+FHQ3
         viDA==
X-Forwarded-Encrypted: i=1; AJvYcCWA1zQtUibIiHmt6qF6saMHalUpheph2r/JjjOFprgEHMwu50DPcSL020ZD9lIbb8oGUB6nnNCJWPoRMckt3LN+@lists.infradead.org
X-Gm-Message-State: AOJu0YyndZLoVU4Ydy5V3Jfg/SPfOPojbepMoymu/VOhZpC967z3NMro
	JxiMIXT0N8xV+wUoSvRifHumJEUnDLuwPwyhutF8NAQam2hFXSsPJ3bkaEjAloWFrrEmVYV+8gD
	eocgwpjc99zmxqfH6bigClzy+lf0VnT+YQkBkMIsNdL9CQjCsroa6
X-Gm-Gg: ASbGnctz7hRiwN11NwRDSQeUPph0ZbiAYse7bvt8c7Eo+mTTN0c76e9e1UR4q86uPPR
	DtcwhjsbVMSi0C2q76Tf4KTCqfhanSgoLEiySCFn0FGPVL0mb9a97vpV9+pwqQS2JF9G9kGFVlB
	wgepfx0KgD+cQOfSUBemk7qxnoD42eL3ehKkxx9kf7tJAQ0OrsV9fuvttShabg5f3xh+sLXubRJ
	anBePPeAgM7glnNxvXrCEyU7LsKTXHyKn3u
X-Google-Smtp-Source: AGHT+IF7+w5F4PX1rjrvWncY0G8SiPJrG4b/Mt6Kl4ZL3tfWXB10a5fTZbNvIu6TZvViGFL7ZLUvw6caNtqPIP7HWlU=
X-Received: by 2002:a17:903:1110:b0:250:bd52:4cdb with SMTP id
 d9443c01a7336-28e7f325631mr83235735ad.32.1759403539749; Thu, 02 Oct 2025
 04:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-14-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-14-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 2 Oct 2025 12:12:08 +0100
X-Gm-Features: AS18NWCIbKqkGMaSZC1EnCh_qfxVG7maxEfwOtJ0xcjMlAwX15TrbDXwLTS9EAk
Message-ID: <CAJ9a7Vhy7iocVFuz47nYFF8PGtCXSX6mwW9wLyPDhQK-geNumQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/31] coresight: Register CPU PM notifier in core layer
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_041220_959383_C276B649 
X-CRM114-Status: GOOD (  34.82  )
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

Hi Leo,

This could be made more generic from the start - as multiple devices
will eventually come under PM control.

Improve naming by explicitly mentioning _pm_ in function names.

On Mon, 15 Sept 2025 at 11:34, Leo Yan <leo.yan@arm.com> wrote:
>
> The current implementation only saves and restores the context for ETM
> sources while ignoring the context of links.  However, if funnels or
> replicators on a linked path resides in a CPU or cluster power domain,
> the hardware context for the link will be lost after resuming from low
> power states.
>
> To support context management for links during CPU low power modes, a
> better way is to implement CPU PM callbacks in the Arm CoreSight core
> layer.  As the core layer has sufficient information for linked paths,
> from tracers to links, which can be used for power management.
>
> As a first step, this patch registers CPU PM notifier in the core layer.
> If a source driver provides callbacks for saving and restoring context,
> these callbacks will be invoked in CPU suspend and resume.
>
> Further changes will extend for controlling path.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c | 62 ++++++++++++++++++++++++++++
>  include/linux/coresight.h                    |  4 ++
>  2 files changed, 66 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 25a530cde8938b366bbb144fdcc107271ebae276..f944a610c85e9e3fce43497543ccc48ab7c2c0d9 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -6,6 +6,7 @@
>  #include <linux/acpi.h>
>  #include <linux/bitfield.h>
>  #include <linux/build_bug.h>
> +#include <linux/cpu_pm.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/types.h>
> @@ -422,6 +423,21 @@ int coresight_resume_source(struct coresight_device *csdev)
>  }
>  EXPORT_SYMBOL_GPL(coresight_resume_source);
>
> +static int coresight_save_source(struct coresight_device *csdev)

See comments below & make this a generic coresight_pm_save() fn.

> +{
> +       if (csdev && source_ops(csdev)->save)

and this could become

if(csdev && coresight_ops(csdev)->pm_save_disable)

> +               return source_ops(csdev)->save(csdev);
> +
> +       /* Return success if callback is not supported */
> +       return 0;
> +}
> +
> +static void coresight_restore_source(struct coresight_device *csdev)

As above

> +{
> +       if (csdev && source_ops(csdev)->restore)
> +               source_ops(csdev)->restore(csdev);
> +}
> +
>  /*
>   * coresight_disable_path_from : Disable components in the given path beyond
>   * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
> @@ -1575,6 +1591,45 @@ char *coresight_alloc_device_name(struct coresight_dev_list *dict,
>  }
>  EXPORT_SYMBOL_GPL(coresight_alloc_device_name);
>
> +static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
> +                                  void *v)
> +{
> +       unsigned int cpu = smp_processor_id();
> +       struct coresight_device *source = per_cpu(csdev_source, cpu);
> +
> +       if (!source)
> +               return NOTIFY_OK;
> +
> +       switch (cmd) {
> +       case CPU_PM_ENTER:
> +               if (coresight_save_source(source))
> +                       return NOTIFY_BAD;
> +               break;
> +       case CPU_PM_EXIT:
> +       case CPU_PM_ENTER_FAILED:
> +               coresight_restore_source(source);
> +               break;
> +       default:
> +               return NOTIFY_DONE;
> +       }
> +
> +       return NOTIFY_OK;
> +}
> +
> +static struct notifier_block coresight_cpu_pm_nb = {
> +       .notifier_call = coresight_cpu_pm_notify,
> +};
> +
> +static int __init coresight_pm_setup(void)
> +{
> +       return cpu_pm_register_notifier(&coresight_cpu_pm_nb);
> +}
> +
> +static void coresight_pm_cleanup(void)
> +{
> +       cpu_pm_unregister_notifier(&coresight_cpu_pm_nb);
> +}
> +
>  const struct bus_type coresight_bustype = {
>         .name   = "coresight",
>  };
> @@ -1629,9 +1684,15 @@ static int __init coresight_init(void)
>
>         /* initialise the coresight syscfg API */
>         ret = cscfg_init();
> +       if (ret)
> +               goto exit_notifier;
> +
> +       ret = coresight_pm_setup();
>         if (!ret)
>                 return 0;
>
> +       cscfg_exit();
> +exit_notifier:
>         atomic_notifier_chain_unregister(&panic_notifier_list,
>                                              &coresight_notifier);
>  exit_perf:
> @@ -1643,6 +1704,7 @@ static int __init coresight_init(void)
>
>  static void __exit coresight_exit(void)
>  {
> +       coresight_pm_cleanup();
>         cscfg_exit();
>         atomic_notifier_chain_unregister(&panic_notifier_list,
>                                              &coresight_notifier);
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 222597ec7a089e10ad763df206917e90f34bb5c2..d0764a9c7692181d2619c277acb83701c6b0115e 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -400,6 +400,8 @@ struct coresight_ops_link {
>   * @disable:   disables tracing for a source.
>   * @resume_perf: resumes tracing for a source in perf session.
>   * @pause_perf:        pauses tracing for a source in perf session.
> + * @save:      save context for a source.
> + * @restore:   restore context for a source.
>   */
>  struct coresight_ops_source {
>         int (*cpu_id)(struct coresight_device *csdev);
> @@ -409,6 +411,8 @@ struct coresight_ops_source {
>                         struct perf_event *event);
>         int (*resume_perf)(struct coresight_device *csdev);
>         void (*pause_perf)(struct coresight_device *csdev);
> +       int (*save)(struct coresight_device *csdev);
> +       void (*restore)(struct coresight_device *csdev);

These functions should have more explicit names - better describe what
they do and prevent a future developer thinking they are a benign
states save/restore set (as they used to be!)

e.g.:

pm_save_disable / pm_restore_enable.

Further, since the only parameter is the csdev being acted on, the
functions could be part of the generic coresight_ops structure (as per
trace_id) rather than repeat the addition for each coresight type
variant. Should simplify the handling code too.

Regards

Mike

>  };
>
>  /**
>
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

