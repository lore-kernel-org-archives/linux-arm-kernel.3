Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8000EE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ys18WnBkglanp1sG+Ft/swdVhnnKfXQLN44jZUIpgWY=; b=BhZgjDzKTnSPCpGykGuq3dcQ+5
	m/zKpTBmJzxV3X00eVqCqHfIDjprtiYRVBtedwYbZXpq6eqKKw4oyXFibiS3bfxvW5waBpaCHJPSW
	UBicvSrCfvKe0tcKN4VrpeQsIss9UdWbmcSz+mzK1vLl6xC0ufeUCIiSbb2vVjyGimpmQu+QgUgby
	v4y3MHiFOhqaS9jVGjLWJF0ENx4mWU21vkWbw41+XGtZ68sjJSA/nv9m/zvWtwUhBOP81+ZghgC/B
	+NljsF3yAacG9PEIr8oykoDuUFJ5+J0nAj+dBYxlqVWVxexScJB0dDgKnomAWf/PDOsq4l3/2mcSM
	hCUklhHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFd0-00000001mwe-1elJ;
	Thu, 19 Dec 2024 12:27:42 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFZX-00000001m7A-1P5U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 12:24:08 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso512201a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 04:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734611046; x=1735215846; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ys18WnBkglanp1sG+Ft/swdVhnnKfXQLN44jZUIpgWY=;
        b=ai0M06vQayfUv22kupnA5Q+Z4UTrBD4oMb7zbPfJhwTVGgVJytU2zj8wh2/mzr8UDw
         wccCG2Ui2CcfeTt3ngCjKNbkpPZG3Z5HTPoAPnaRuic0yK8Trdd0qbCY5G2L/kSDPEz0
         o1snG8pjkUQWaLA5/Tib+VIFUiI67HEo8pzQxz9l8HYHCjbXqwKkFHNeDknrjdkc2x45
         xWO87jcHerWjPQyBgiYdqUClSxPpA9ltzILXMkSVSNqagkbe+wYiF5jknnZi9GAKdyrP
         L7C+Spec8BY+DXLYfzqIuMJ4YnvyAWi3UGbZ4pgs+fA252MAKkl1h/D0QFWEaQtQcLWU
         KPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734611046; x=1735215846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ys18WnBkglanp1sG+Ft/swdVhnnKfXQLN44jZUIpgWY=;
        b=WKw6rG8IU/iSdqT6PgIVpcpr9JpiYEYwsgFZM+L/VlM4S9XUXKrAQS97ems3ZQjQAW
         J52aMT5zAP/nZ8WsU/OjE81NL9Kf4laqNEHK82Xm1gZ1wMGZ0tHylUtgWmOsVzCI0s7u
         BEHFFjBCLljUMf9j75RUrBuDEdh6nHuYyXjC1L1D9yLqF2cFnrHS2yB6j7BXkmCLYx2a
         t0jmTxki8B6ouWqYJZhYnMTCEOsx4RbbzTewoOT/YrbmHzoOfaQm0SpM/1iepL5Oas4y
         GBz8DB+8IB+31/kw+QJ6gavkwvWEYLpjd576hyTsfwfeO3GMYr947dcdrd9Rq6t6VDi/
         BEsg==
X-Forwarded-Encrypted: i=1; AJvYcCX04lo7yGtq+4DYYe6wgrdEkqDYOClYliPgsyBYxUdTetQt8fFUo31qhtrz+nBnBAsDHvCdSoE1I75WetQwggQO@lists.infradead.org
X-Gm-Message-State: AOJu0YxW1pNnrNUhIoJTcGX9HKb+YSsiP77wYtippK14UIaHGE12vDVD
	4AbsxCL7R52+vRB/KxUbrD2Xr//2F2II1SWzNcTjyQ06p+o2rHmGwwGlKiM9hdsJAzoyIEde4k5
	dpXXaZZTWTXIftTHar+ct+fkMMHUz0QjXEf9IQg==
X-Gm-Gg: ASbGncuFrXQf2HmbeUGHmv3PtYH+b5IFGmZnd3GcLxzh/+9Ra8EEa4Wj+wKoPKE19tY
	uKdOJjVbKgOYbgj0pj7cWoFv7qqpbxCg/cVVQ9M4=
X-Google-Smtp-Source: AGHT+IHyJ75kkKZcotZKRSWO3KXec2uxN2Q3jqJQ3MCYrpXRl4utw/3Mvc8xC9SaLOCdJtKK9KirKR0oNAZIGcXXpx8=
X-Received: by 2002:a17:90b:5244:b0:2ee:cddd:2454 with SMTP id
 98e67ed59e1d1-2f443ced9e5mr5053806a91.15.1734611046351; Thu, 19 Dec 2024
 04:24:06 -0800 (PST)
MIME-Version: 1.0
References: <20241216115006.415861-1-yeoreum.yun@arm.com> <20241216115006.415861-2-yeoreum.yun@arm.com>
In-Reply-To: <20241216115006.415861-2-yeoreum.yun@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 19 Dec 2024 12:23:55 +0000
Message-ID: <CAJ9a7VgJNLJK2oa9Us9bFAEiEmi8_u+NJ1zNrnd5WhhHgxhPxA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] coresight: change coresight_device lock type to raw_spinlock_t
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, james.clark@linaro.org, 
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de, 
	clrkwllms@kernel.org, rostedt@goodmis.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_042407_373675_AA621E8A 
X-CRM114-Status: GOOD (  24.54  )
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

On Mon, 16 Dec 2024 at 11:50, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
>
> coresight_device->cscfg_csdev_lock can be held during __schedule()
> by perf_event_task_sched_out()/in().
>
> Since coresight->cscfg_csdev_lock type is spinlock_t and
> perf_event_task_sched_out()/in() is called after acquiring rq_lock,
> which is raw_spinlock_t (an unsleepable lock),
> this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.
>
> To address this, change type of coresight_device->cscfg_csdev_lock
> from spinlock_t to raw_spinlock_t.
>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  .../hwtracing/coresight/coresight-syscfg.c    | 26 +++++++++----------
>  include/linux/coresight.h                     |  2 +-
>  2 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index 11138a9762b0..a70c1454b410 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -89,9 +89,9 @@ static int cscfg_add_csdev_cfg(struct coresight_device *csdev,
>         }
>         /* if matched features, add config to device.*/
>         if (config_csdev) {
> -               spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> +               raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
>                 list_add(&config_csdev->node, &csdev->config_csdev_list);
> -               spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
> +               raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>         }
>
>         return 0;
> @@ -194,9 +194,9 @@ static int cscfg_load_feat_csdev(struct coresight_device *csdev,
>
>         /* add to internal csdev feature list & initialise using reset call */
>         cscfg_reset_feat(feat_csdev);
> -       spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> +       raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
>         list_add(&feat_csdev->node, &csdev->feature_csdev_list);
> -       spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
> +       raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>
>         return 0;
>  }
> @@ -765,7 +765,7 @@ static int cscfg_list_add_csdev(struct coresight_device *csdev,
>
>         INIT_LIST_HEAD(&csdev->feature_csdev_list);
>         INIT_LIST_HEAD(&csdev->config_csdev_list);
> -       spin_lock_init(&csdev->cscfg_csdev_lock);
> +       raw_spin_lock_init(&csdev->cscfg_csdev_lock);
>
>         return 0;
>  }
> @@ -855,7 +855,7 @@ void cscfg_csdev_reset_feats(struct coresight_device *csdev)
>         struct cscfg_feature_csdev *feat_csdev;
>         unsigned long flags;
>
> -       spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> +       raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
>         if (list_empty(&csdev->feature_csdev_list))
>                 goto unlock_exit;
>
> @@ -863,7 +863,7 @@ void cscfg_csdev_reset_feats(struct coresight_device *csdev)
>                 cscfg_reset_feat(feat_csdev);
>
>  unlock_exit:
> -       spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
> +       raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>  }
>  EXPORT_SYMBOL_GPL(cscfg_csdev_reset_feats);
>
> @@ -1059,7 +1059,7 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
>          * Look for matching configuration - set the active configuration
>          * context if found.
>          */
> -       spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> +       raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
>         list_for_each_entry(config_csdev_item, &csdev->config_csdev_list, node) {
>                 config_desc = config_csdev_item->config_desc;
>                 if ((atomic_read(&config_desc->active_cnt)) &&
> @@ -1069,7 +1069,7 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
>                         break;
>                 }
>         }
> -       spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
> +       raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>
>         /*
>          * If found, attempt to enable
> @@ -1090,12 +1090,12 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
>                          *
>                          * Set enabled if OK, err if not.
>                          */
> -                       spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> +                       raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
>                         if (csdev->active_cscfg_ctxt)
>                                 config_csdev_active->enabled = true;
>                         else
>                                 err = -EBUSY;
> -                       spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
> +                       raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>                 }
>         }
>         return err;
> @@ -1124,7 +1124,7 @@ void cscfg_csdev_disable_active_config(struct coresight_device *csdev)
>          * If it was not enabled, we have no work to do, otherwise mark as disabled.
>          * Clear the active config pointer.
>          */
> -       spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> +       raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
>         config_csdev = (struct cscfg_config_csdev *)csdev->active_cscfg_ctxt;
>         if (config_csdev) {
>                 if (!config_csdev->enabled)
> @@ -1133,7 +1133,7 @@ void cscfg_csdev_disable_active_config(struct coresight_device *csdev)
>                         config_csdev->enabled = false;
>         }
>         csdev->active_cscfg_ctxt = NULL;
> -       spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
> +       raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>
>         /* true if there was an enabled active config */
>         if (config_csdev)
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index c13342594278..924b58c343b3 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -296,7 +296,7 @@ struct coresight_device {
>         /* system configuration and feature lists */
>         struct list_head feature_csdev_list;
>         struct list_head config_csdev_list;
> -       spinlock_t cscfg_csdev_lock;
> +       raw_spinlock_t cscfg_csdev_lock;
>         void *active_cscfg_ctxt;
>  };
>
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

