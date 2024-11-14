Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5CCD65C5B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 08:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToT77NODsvlbLTUvpom6vRLwi61ldhVszxA0ETyzPrk=; b=ZYGPxnBNiSpYyqOrQqVpwKTHZP
	W/do5TbeHQvkGK7wc36nDs7VY4jLgUm/3GyyeTaVihmHUU9oRNWO4jss6+z9pLDh7R99tp9J42kf5
	NVmp9heQjJlM5zvhm9Kjblpo1sjytMNYTFCVs+4n293lfNUgkdOxExoVx05/0bzv2NiWI8ktTj2/U
	OjQ449a/Sp46vJqewn7vcd3URmiALhAOXA38RZuxGIglTUxRokmTvgaDrjm5c/1QzTcHVJn37MRli
	43xtmy6qPJgsEP1cdl9Xw44Jyj4kgvOMX4ggi2nr0ALpJyaQu1yci1eH5SzszB28xSOJDJ3n4fB0z
	DT1/BfUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBVfv-00000009HLP-0hxB;
	Thu, 14 Nov 2024 08:58:03 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBVe2-00000009Gyk-1OMn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 08:56:08 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7240d93fffdso255507b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 00:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731574565; x=1732179365; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ToT77NODsvlbLTUvpom6vRLwi61ldhVszxA0ETyzPrk=;
        b=kOtyPZbgLLVVd9YFAA9tAn9h9lU3Jp8ga2o0P/+VbyuKFQGfaWopfUPDOj70HMAA7Y
         /vfHpuFRkhsOI+hUW0UGusF8aHn+jgP+Yqz2OEOT2NMv+Ue7BX1HV2lO66GdH7eGYJGL
         +ZHee/zEPFrMN7g/dXyIO6hMVFOH0/3DWVQebHvoY9fBXc6XN8uj9dAORu8pb20lNAeN
         ozvspAzR29CzVNgkgmHMlqu5r6FDmTnC81ByJd/dV9OCWFmEyJyHbtIFShcD1akM2ILp
         +wOHNG3LDStKSQJSrnauRSTLed3HBzHNQpGFOu58LaytqgDaEU5yqkSToG3oTOY+n59s
         eLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731574565; x=1732179365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ToT77NODsvlbLTUvpom6vRLwi61ldhVszxA0ETyzPrk=;
        b=AdOhmaLdR6DVIaeczzO7iVeFYs7WfOkei/WUbQk6sOM6NBnypWcpM2VKo3q3upIKkm
         gPTj+BmcbTsl51pJ7EU50xcJPsLJzLEf8CuYqpfrfyF2oOz2NMgVg7vugH0NIsTGlL9j
         vSjmKq5QkOopQXfgB8VmrZr2Wbj8iNC8SEPqYH7ERTUuPAcVv2aEaqSBEtFssaYhPK8l
         cTRbpgXcC5ocTb76LJMREnlP3jwIYLyIFblGMI1EBfHRlGkCK+ZPu/yYS2bFEv8Y4t6k
         zh28sBrxQxKO8NW1i0rFBk2VhqkZG1EOnLK3xYy1GjW0Y9C3UPIVOXgk864zJUMAtyc2
         HwCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeh/gQfx2kZUuWND+WbQH+nAMp8e57WZHvxoPHf1l3f2jYWyoPVryp6LEaon4um9Mr6MeGz2wJlr0HCFq8cWLK@lists.infradead.org
X-Gm-Message-State: AOJu0YyJSSrVqSp+DTXHz0fqgj9y1K98hoa4grFDoHRwTCLQ3SQg00We
	QeBtwXIqcYCXZPqRMXdq3qDw+VGE1AqGvQh6cyrKqNkz6F+Z/jqd3mSJ7x+sKslBpU5Nbh6X32l
	BmvjtE0alB0IlYzLZiiuF3DOyl6Bm2KFYC2RdaA==
X-Google-Smtp-Source: AGHT+IEF/+2QRuIhdeC8yK5JAR2WX1SxP2TpNFoDaoCNxUEcokJnn2HBF5GtJzruhPEUticVRg3x/kmVprSaln0zgc4=
X-Received: by 2002:a17:90b:1647:b0:2e2:c6c2:b3d5 with SMTP id
 98e67ed59e1d1-2e9f2c7476bmr7530583a91.9.1731574564784; Thu, 14 Nov 2024
 00:56:04 -0800 (PST)
MIME-Version: 1.0
References: <20241114022916.644899-1-quic_sibis@quicinc.com> <20241114022916.644899-2-quic_sibis@quicinc.com>
In-Reply-To: <20241114022916.644899-2-quic_sibis@quicinc.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 14 Nov 2024 09:55:53 +0100
Message-ID: <CAKfTPtDnyDak1BsdufYuN=wQwhJ+XTJedjMEezAz1evhsB86Jg@mail.gmail.com>
Subject: Re: [PATCH V8 1/1] cpufreq: scmi: Register for limit change notifications
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org, 
	viresh.kumar@linaro.org, morten.rasmussen@arm.com, dietmar.eggemann@arm.com, 
	lukasz.luba@arm.com, pierre.gondois@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_mdtipton@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_005606_414911_9BBBAB73 
X-CRM114-Status: GOOD (  23.21  )
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

On Thu, 14 Nov 2024 at 03:29, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> Register for limit change notifications if supported and use the throttled
> frequency from the notification to apply HW pressure.
>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Tested-by: Mike Tipton <quic_mdtipton@quicinc.com>
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

Looks good to me
Acked-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>
> v8:
> * Drop patch 1 since it was picked up by Viresh
> * Leave policy->max update to the cpufreq_qos notifier [Vincent]
> * We sanitized the range_max from V3 since we dealt with
>   policy->max, now we can drop the check and policy member
>   from scmi_data.
>
>  drivers/cpufreq/scmi-cpufreq.c | 45 ++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index 07d6f9a9b7c8..b8fe758aeb01 100644
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
> @@ -26,6 +27,8 @@ struct scmi_data {
>         int nr_opp;
>         struct device *cpu_dev;
>         cpumask_var_t opp_shared_cpus;
> +       struct notifier_block limit_notify_nb;
> +       struct freq_qos_request limits_freq_req;
>  };
>
>  static struct scmi_protocol_handle *ph;
> @@ -174,6 +177,22 @@ static struct freq_attr *scmi_cpufreq_hw_attr[] = {
>         NULL,
>  };
>
> +static int scmi_limit_notify_cb(struct notifier_block *nb, unsigned long event, void *data)
> +{
> +       struct scmi_data *priv = container_of(nb, struct scmi_data, limit_notify_nb);
> +       struct scmi_perf_limits_report *limit_notify = data;
> +       unsigned int limit_freq_khz;
> +       int ret;
> +
> +       limit_freq_khz = limit_notify->range_max_freq / HZ_PER_KHZ;
> +
> +       ret = freq_qos_update_request(&priv->limits_freq_req, limit_freq_khz);
> +       if (ret < 0)
> +               pr_warn("failed to update freq constraint: %d\n", ret);
> +
> +       return NOTIFY_OK;
> +}
> +
>  static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>  {
>         int ret, nr_opp, domain;
> @@ -181,6 +200,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>         struct device *cpu_dev;
>         struct scmi_data *priv;
>         struct cpufreq_frequency_table *freq_table;
> +       struct scmi_device *sdev = cpufreq_get_driver_data();
>
>         cpu_dev = get_cpu_device(policy->cpu);
>         if (!cpu_dev) {
> @@ -294,6 +314,23 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
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
>         return 0;
>
>  out_free_table:
> @@ -313,7 +350,13 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
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
> @@ -372,6 +415,8 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
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

