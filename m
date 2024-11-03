Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16C3D11100
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 15:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHQktcKdIhna5z27pQ3PuyXhlPaLntIaSmvbBw7PwoE=; b=lqnyrixo6IMG46RiD8Dmj3shul
	azcA/LQL4skS22fP1u0edloK/r7YJOPPrZPWV2lRdeUcrT/ac4zgZMOA1xDYUSfUo8MRQtlfrBbR6
	WLiTgVL4psp4IY1P+/5yoNCFhiDR1Kl3qyDaUZjYNS6dlxrGOsU4wSTNF6cLs81HcV8S0IdUKkZRK
	Tg6FIf3wOgTa7WBeMcQE8xWQn7eeX9OJDwGSvEBcAz0r+exEuoSnXNrRHEgjxqbmR+3GyIeqY48lt
	Z4qh13T73rPlyf4JtIjGaHWBjfhBFUz8pR/XjnPOKd4x5WOoZkg4wKGCVRaYCtP/wyqUwo8uP3jB2
	XVCcM0MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7cJT-0000000Bc2f-3id3;
	Sun, 03 Nov 2024 15:14:47 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7cHn-0000000Bbve-31rj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 15:13:05 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2e2cc469c62so2353454a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Nov 2024 07:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730646782; x=1731251582; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eHQktcKdIhna5z27pQ3PuyXhlPaLntIaSmvbBw7PwoE=;
        b=alaDU9X2yo1X6Eyc+TOx7FXEJAu9QAUAbHe5qvmfiI2GhUhtY4z/Cx1a2p1G9BJAuu
         sgiAO/gfjvCqx1VWIqUj+bFTLyJaWHUaWtSrZBrEQo6PGgYOELgA+l+gLubc1X02vRQS
         JTGXwRI800kQjFsAnISRHJjkBBrVtMqF5TrFw0KD10zAWpxGkoAuTTITzjpZkoOkPf8q
         EvHPG0tkVmMqzDFimOF+C8UYNE4XWWdcJ5lwVOgOn4NMH4c6piK96DmNi0Wv8JyGisj7
         Le7cXKprDaOZcpzntgLPxErrSC1BFCsKLsEkbM09UkjEcis6fFzkPskjW+fyc6tJN12U
         a41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730646782; x=1731251582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHQktcKdIhna5z27pQ3PuyXhlPaLntIaSmvbBw7PwoE=;
        b=E4m9sPhTiF2daFplbIQW19lXZRGXR7n5W8TZsj9bn+28IQy4ry+xRyE5Zqwsg3rIU2
         LjQH1l2KDT/za2MKvdBn200KKnsP6Bc+4CRKlJb6XlGS8bmu5evKFG59mJe29W2DVJ1U
         jU8Yuq6dcrQJugD/JHlNgUBmvPygI999azMhZFvqNf0SJOIP6Wkl1Kn93iHgq2PGuLVa
         AG1Np4WJJm477WGv1zleWxx6BpitqDSJQSsHyrE+Thfg/qOVf1/JgaCuXz6xj5vlZBPE
         X/NMwolSIWEOhlFVnMi4QQ5OPm5AcPk//2sjjuQLIRIxHHrLxqCdOwxkDshWHO5Tk7nO
         l0mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZF2InG9P/FLndGs3LRQ/+i36yo91cwRJbY34EYoB8eBKpkiZP3TgqcwYbOd/hK7XmfJm5qpOwwafPQu78MEkq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8+Rall6akRNTv6bGPyBrkVOmJeixn4/ODx1nl7vXQ9s2pLevC
	0rl0WSlXACkDRW/LttMNf1R3RtkVd95z3aJ7rrAbX9C4oT7IreXH2C6C6aYmsRSfuv9J6XlKxCO
	EfSFHjlM+y892SkBkuVcgsT7DiJ5x5GlV07HTRA==
X-Google-Smtp-Source: AGHT+IHRIh1ITCIAJ4M7w1UM8me5MLqRixS/tsHhgXfawiZDUkumg9GSz+T7fPFwKnIa+4k1jBzouIXTP6K8KhWz3Do=
X-Received: by 2002:a17:90b:4a86:b0:2e1:ce7b:6069 with SMTP id
 98e67ed59e1d1-2e94c529acamr15224146a91.33.1730646782163; Sun, 03 Nov 2024
 07:13:02 -0800 (PST)
MIME-Version: 1.0
References: <20241031132745.3765612-1-quic_sibis@quicinc.com> <20241031132745.3765612-3-quic_sibis@quicinc.com>
In-Reply-To: <20241031132745.3765612-3-quic_sibis@quicinc.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Sun, 3 Nov 2024 16:12:50 +0100
Message-ID: <CAKfTPtDNBPC8QQzFBNDKNW_sJfkoShSsxo7iMC8Wga+wixyHzA@mail.gmail.com>
Subject: Re: [PATCH V7 2/2] cpufreq: scmi: Register for limit change notifications
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org, 
	viresh.kumar@linaro.org, morten.rasmussen@arm.com, dietmar.eggemann@arm.com, 
	lukasz.luba@arm.com, pierre.gondois@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_mdtipton@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_071303_801488_ACE3B14D 
X-CRM114-Status: GOOD (  25.27  )
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

On Thu, 31 Oct 2024 at 14:28, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> Register for limit change notifications if supported and use the throttled
> frequency from the notification to apply HW pressure.
>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Tested-by: Mike Tipton <quic_mdtipton@quicinc.com>
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>
> v7:
> * Add a new request instead of reusing the max_freq_req [Vincent]
> * Use the non-devm versions of register/unregister of event notifier
>   since we have to remove them when the cpus get removed anyway.
> * Add new patch to fix cleanup path on boost enablement failure.
>
>  drivers/cpufreq/scmi-cpufreq.c | 51 ++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index 07d6f9a9b7c8..ff13f7d4b2c9 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -16,6 +16,7 @@
>  #include <linux/export.h>
>  #include <linux/module.h>
>  #include <linux/pm_opp.h>
> +#include <linux/pm_qos.h>
>  #include <linux/slab.h>
>  #include <linux/scmi_protocol.h>
>  #include <linux/types.h>
> @@ -25,7 +26,10 @@ struct scmi_data {
>         int domain_id;
>         int nr_opp;
>         struct device *cpu_dev;
> +       struct cpufreq_policy *policy;
>         cpumask_var_t opp_shared_cpus;
> +       struct notifier_block limit_notify_nb;
> +       struct freq_qos_request limits_freq_req;
>  };
>
>  static struct scmi_protocol_handle *ph;
> @@ -174,6 +178,25 @@ static struct freq_attr *scmi_cpufreq_hw_attr[] = {
>         NULL,
>  };
>
> +static int scmi_limit_notify_cb(struct notifier_block *nb, unsigned long event, void *data)
> +{
> +       struct scmi_data *priv = container_of(nb, struct scmi_data, limit_notify_nb);
> +       struct scmi_perf_limits_report *limit_notify = data;
> +       struct cpufreq_policy *policy = priv->policy;
> +       unsigned int limit_freq_khz;
> +       int ret;
> +
> +       limit_freq_khz = limit_notify->range_max_freq / HZ_PER_KHZ;
> +
> +       policy->max = clamp(limit_freq_khz, policy->cpuinfo.min_freq, policy->cpuinfo.max_freq);

I don't think that the above is needed or correct, the cpufreq qos
notifier will take care of updating policy->max with handle_update()

> +
> +       ret = freq_qos_update_request(&priv->limits_freq_req, policy->max);
> +       if (ret < 0)
> +               pr_warn("failed to update freq constraint: %d\n", ret);
> +
> +       return NOTIFY_OK;
> +}
> +
>  static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>  {
>         int ret, nr_opp, domain;
> @@ -181,6 +204,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>         struct device *cpu_dev;
>         struct scmi_data *priv;
>         struct cpufreq_frequency_table *freq_table;
> +       struct scmi_device *sdev = cpufreq_get_driver_data();
>
>         cpu_dev = get_cpu_device(policy->cpu);
>         if (!cpu_dev) {
> @@ -294,6 +318,25 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>                 }
>         }
>
> +       ret = freq_qos_add_request(&policy->constraints, &priv->limits_freq_req, FREQ_QOS_MAX,
> +                                  FREQ_QOS_MAX_DEFAULT_VALUE);
> +       if (ret < 0) {
> +               dev_err(cpu_dev, "failed to add qos limits request: %d\n", ret);
> +               goto out_free_table;
> +       }
> +
> +       priv->limit_notify_nb.notifier_call = scmi_limit_notify_cb;
> +       ret = sdev->handle->notify_ops->event_notifier_register(sdev->handle, SCMI_PROTOCOL_PERF,
> +                                                       SCMI_EVENT_PERFORMANCE_LIMITS_CHANGED,
> +                                                       &priv->domain_id,
> +                                                       &priv->limit_notify_nb);
> +       if (ret)
> +               dev_warn(&sdev->dev,
> +                        "failed to register for limits change notifier for domain %d\n",
> +                        priv->domain_id);
> +
> +       priv->policy = policy;
> +
>         return 0;
>
>  out_free_table:
> @@ -313,7 +356,13 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>  static void scmi_cpufreq_exit(struct cpufreq_policy *policy)
>  {
>         struct scmi_data *priv = policy->driver_data;
> +       struct scmi_device *sdev = cpufreq_get_driver_data();
>
> +       sdev->handle->notify_ops->event_notifier_unregister(sdev->handle, SCMI_PROTOCOL_PERF,
> +                                                           SCMI_EVENT_PERFORMANCE_LIMITS_CHANGED,
> +                                                           &priv->domain_id,
> +                                                           &priv->limit_notify_nb);
> +       freq_qos_remove_request(&priv->limits_freq_req);
>         dev_pm_opp_free_cpufreq_table(priv->cpu_dev, &policy->freq_table);
>         dev_pm_opp_remove_all_dynamic(priv->cpu_dev);
>         free_cpumask_var(priv->opp_shared_cpus);
> @@ -372,6 +421,8 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
>         if (!handle)
>                 return -ENODEV;
>
> +       scmi_cpufreq_driver.driver_data = sdev;
> +
>         perf_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PERF, &ph);
>         if (IS_ERR(perf_ops))
>                 return PTR_ERR(perf_ops);
> --
> 2.34.1
>

