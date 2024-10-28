Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A081FD10C11
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 13:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODHQvvFv62Zx/xb7/IaX9zhCggWHAAlTCQGt9XP7bv8=; b=cmlbSVBCSX2apvbjvpSQsxHv7z
	Q6vDwBawdn3g4q4slSkz/vL6xL0DbDtLAJrbJUkjPjXfC7Nogzvs/sFDXeRWEqe9+bASjfoUTsu+J
	rxQpqxxPacxjJwddl1akYx4L669ZV5gVlDPJaDL8W8T14Njq7vl4OVmh/ifRhfRwRJEFpoq4Zs+dH
	v/slF4G7sTpTlQLh/qdpOvNMDJ/64oodKz8hzozToOLUydGcw3oZ3SoAhUL73oig8N8RFzOhSlJdG
	/p1cIKGjXqLW1J4h81eQJKL+R0qQgDwkj39MOr1bEEYW6qmrnzNZD2K6mz7wREYcSHTuRBipCE7No
	1lBKj+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PpB-0000000AwG3-080z;
	Mon, 28 Oct 2024 13:30:25 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PnU-0000000Avqz-22bn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 13:28:42 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-6e35fb3792eso40036747b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 06:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730122119; x=1730726919; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ODHQvvFv62Zx/xb7/IaX9zhCggWHAAlTCQGt9XP7bv8=;
        b=vBDPLD339suj1Ogl2SqUHBvPj0ayy4eCDb34UnBDoTUXMa1XpD1tXkd+oXI5a2HMF6
         u91rmvM6GZG6tiTq2jaJX+Yec1fAwQ4TCZgYjDy2evh+xOfiGjWn1KZAvDWLY5DKy/w9
         dazDvZMonlOWzepbLGqbHJ1ne4UcUOwJQMePn42uPE35JVZgQQcXV24oTCR1CI+xI9Gh
         eWDxF9qGVtrSDXyZ7V6dx1IrfjSYtnvUvHi0Mignxu3TvDgeq/M2ZjgwvJGNliIp7lQo
         Q9SG0GU07Xot+TZD9DKcV5z/2jNQ99ynv5XnNLOY0sVruc31fZbsOPlnNsvI5W84sIy0
         xsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730122119; x=1730726919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODHQvvFv62Zx/xb7/IaX9zhCggWHAAlTCQGt9XP7bv8=;
        b=Zzpod+mFGwjrGOadZm7cy5phQZqccbB4f1di8nE5rrD8L7lw5iACv4u+Bo2DV/mVL9
         XV8Hbw080RCH28UVDLTrvT3tTzJUfJdU/uO7ENMS6oxNE9v1U3dzwX1vXad4IQ9cD8pl
         qNdGlrX9m2fbhazQP/buK4xTckhgKbulpQuU9HYW8i54HvJ6itcmUWBwV0fnYMdUE+t0
         hbdU7p8iDSJ4QQsG9R78cnrmscmrnRxM3eaV2e199c6HphnGPl44lMTzZQc4hYCyOgPK
         N5lRML4YuoSQoRYhSaXUCu1p6NYXjGP4G3o/jhYstIGtez/zPYy5x6xeng6Z9RYnz1RQ
         YKug==
X-Forwarded-Encrypted: i=1; AJvYcCXQC/Dcaa3lEHQMpEFluUT0H5wMksbD5TcGwTRma5AM+9Juk2AnYY7itvuQ9Jph5IKsKx3aYpps4bzODLUHIGZs@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg/kHXcb+QJsuGdYIj7PeUKyqqH9MFY5GNFWz4I5AozTm5AIaP
	9OdGO35xZZir0iMkxv4Qe7GMm2ZeyH7F9KzQlrL1zwWT7MBmAOSxtURI2cEqHyVI8FyV+j5uXNf
	W/sHojYcu+aKDN2CyjBB7C/nP6XeoJg4tVii5XQ==
X-Google-Smtp-Source: AGHT+IFh/cJQhvJy2qy0gX3xlkp0CbLK8TXymrBa9x8XNk/di4wG/TzrWy42DG2ickeR3FscqmzTTLIBVMvxckF62og=
X-Received: by 2002:a05:690c:ec7:b0:6e2:1527:4447 with SMTP id
 00721157ae682-6e9d8994a3amr76420097b3.1.1730122118910; Mon, 28 Oct 2024
 06:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241023102148.1698910-1-quic_sibis@quicinc.com> <20241023102148.1698910-4-quic_sibis@quicinc.com>
In-Reply-To: <20241023102148.1698910-4-quic_sibis@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Oct 2024 14:28:02 +0100
Message-ID: <CAPDyKFrVopgySevDVZtkZdHBBxiiVNh73VOXLqaHfXs9MyiZ+w@mail.gmail.com>
Subject: Re: [PATCH V4 3/4] pmdomain: core: Fix debugfs node creation failure
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, jassisinghbrar@gmail.com, 
	dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, johan@kernel.org, konradybcio@kernel.org, 
	linux-pm@vger.kernel.org, tstrudel@google.com, rafael@kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_062840_571647_71892EE8 
X-CRM114-Status: GOOD (  26.46  )
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

On Wed, 23 Oct 2024 at 12:22, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> The domain attributes returned by the perf protocol can end up
> reporting identical names across domains, resulting in debugfs
> node creation failure. Fix this failure by ensuring that pm domains
> get a unique name using ida in pm_genpd_init.
>
> Logs: [X1E reports 'NCC' for all its scmi perf domains]
> debugfs: Directory 'NCC' with parent 'pm_genpd' already present!
> debugfs: Directory 'NCC' with parent 'pm_genpd' already present!
>
> Reported-by: Johan Hovold <johan+linaro@kernel.org>
> Closes: https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> Fixes: 718072ceb211 ("PM: domains: create debugfs nodes when adding power domains")
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>
> v3:
> * Update device names only when a name collision occurs [Dmitry/Ulf]
> * Drop Johan's T-b from "fix debugfs node creation failure"
>
>  drivers/pmdomain/core.c   | 65 ++++++++++++++++++++++++++++++---------
>  include/linux/pm_domain.h |  1 +
>  2 files changed, 51 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 76490f0bf1e2..756ed0975788 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -7,6 +7,7 @@
>  #define pr_fmt(fmt) "PM: " fmt
>
>  #include <linux/delay.h>
> +#include <linux/idr.h>
>  #include <linux/kernel.h>
>  #include <linux/io.h>
>  #include <linux/platform_device.h>
> @@ -23,6 +24,9 @@
>  #include <linux/cpu.h>
>  #include <linux/debugfs.h>
>
> +/* Provides a unique ID for each genpd device */
> +static DEFINE_IDA(genpd_ida);
> +
>  #define GENPD_RETRY_MAX_MS     250             /* Approximate */
>
>  #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)         \
> @@ -189,7 +193,7 @@ static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
>
>         if (ret)
>                 dev_warn_once(dev, "PM domain %s will not be powered off\n",
> -                               genpd->name);
> +                             dev_name(&genpd->dev));
>
>         return ret;
>  }
> @@ -274,7 +278,7 @@ static void genpd_debug_remove(struct generic_pm_domain *genpd)
>         if (!genpd_debugfs_dir)
>                 return;
>
> -       debugfs_lookup_and_remove(genpd->name, genpd_debugfs_dir);
> +       debugfs_lookup_and_remove(dev_name(&genpd->dev), genpd_debugfs_dir);
>  }
>
>  static void genpd_update_accounting(struct generic_pm_domain *genpd)
> @@ -731,7 +735,7 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
>         genpd->states[state_idx].power_on_latency_ns = elapsed_ns;
>         genpd->gd->max_off_time_changed = true;
>         pr_debug("%s: Power-%s latency exceeded, new value %lld ns\n",
> -                genpd->name, "on", elapsed_ns);
> +                dev_name(&genpd->dev), "on", elapsed_ns);
>
>  out:
>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON, NULL);
> @@ -782,7 +786,7 @@ static int _genpd_power_off(struct generic_pm_domain *genpd, bool timed)
>         genpd->states[state_idx].power_off_latency_ns = elapsed_ns;
>         genpd->gd->max_off_time_changed = true;
>         pr_debug("%s: Power-%s latency exceeded, new value %lld ns\n",
> -                genpd->name, "off", elapsed_ns);
> +                dev_name(&genpd->dev), "off", elapsed_ns);
>
>  out:
>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
> @@ -1941,7 +1945,7 @@ int dev_pm_genpd_add_notifier(struct device *dev, struct notifier_block *nb)
>
>         if (ret) {
>                 dev_warn(dev, "failed to add notifier for PM domain %s\n",
> -                        genpd->name);
> +                        dev_name(&genpd->dev));
>                 return ret;
>         }
>
> @@ -1988,7 +1992,7 @@ int dev_pm_genpd_remove_notifier(struct device *dev)
>
>         if (ret) {
>                 dev_warn(dev, "failed to remove notifier for PM domain %s\n",
> -                        genpd->name);
> +                        dev_name(&genpd->dev));
>                 return ret;
>         }
>
> @@ -2014,7 +2018,7 @@ static int genpd_add_subdomain(struct generic_pm_domain *genpd,
>          */
>         if (!genpd_is_irq_safe(genpd) && genpd_is_irq_safe(subdomain)) {
>                 WARN(1, "Parent %s of subdomain %s must be IRQ safe\n",
> -                               genpd->name, subdomain->name);
> +                    dev_name(&genpd->dev), subdomain->name);
>                 return -EINVAL;
>         }
>
> @@ -2089,7 +2093,7 @@ int pm_genpd_remove_subdomain(struct generic_pm_domain *genpd,
>
>         if (!list_empty(&subdomain->parent_links) || subdomain->device_count) {
>                 pr_warn("%s: unable to remove subdomain %s\n",
> -                       genpd->name, subdomain->name);
> +                       dev_name(&genpd->dev), subdomain->name);
>                 ret = -EBUSY;
>                 goto out;
>         }
> @@ -2199,6 +2203,23 @@ static void genpd_lock_init(struct generic_pm_domain *genpd)
>         }
>  }
>
> +static bool genpd_name_present(const char *name)
> +{
> +       bool ret = false;
> +       const struct generic_pm_domain *gpd;
> +
> +       mutex_lock(&gpd_list_lock);
> +       list_for_each_entry(gpd, &gpd_list, gpd_list_node) {
> +               if (!strcmp(dev_name(&gpd->dev), name)) {
> +                       ret = true;
> +                       break;
> +               }
> +       }
> +       mutex_unlock(&gpd_list_lock);
> +
> +       return ret;
> +}
> +
>  /**
>   * pm_genpd_init - Initialize a generic I/O PM domain object.
>   * @genpd: PM domain object to initialize.
> @@ -2226,6 +2247,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
>         genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
>         genpd->device_count = 0;
>         genpd->provider = NULL;
> +       genpd->device_id = -ENXIO;
>         genpd->has_provider = false;
>         genpd->accounting_time = ktime_get_mono_fast_ns();
>         genpd->domain.ops.runtime_suspend = genpd_runtime_suspend;
> @@ -2266,7 +2288,18 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
>                 return ret;
>
>         device_initialize(&genpd->dev);
> -       dev_set_name(&genpd->dev, "%s", genpd->name);
> +
> +       if (!genpd_name_present(genpd->name)) {
> +               dev_set_name(&genpd->dev, "%s", genpd->name);
> +       } else {
> +               ret = ida_alloc(&genpd_ida, GFP_KERNEL);
> +               if (ret < 0) {
> +                       put_device(&genpd->dev);
> +                       return ret;
> +               }
> +               genpd->device_id = ret;
> +               dev_set_name(&genpd->dev, "%s_%u", genpd->name, genpd->device_id);
> +       }

If we can't assume that the genpd->name is unique, I think we need to
hold the gpd_list_lock over this entire new section, until we have
added the new genpd in the gpd_list. I am not sure we really want this
as it could hurt (theoretically at least) boot/probing on systems
where a lot of genpds are being used.

That said, I would suggest we go for Dmitry's suggestion to make this
genpd provider specific. Let's add a new genpd flag that genpd
providers can set, if they need an ida to be tagged on to their
device-name. Then we should set that flag for SCMI perf/power domains.

[...]

Kind regards
Uffe

