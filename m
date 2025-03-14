Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DA1C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 14:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdlZPQacY7WF2SEKB06YPKehd8J9E8+LtVa0C/rc4Zw=; b=QFSVoeusFEf35gzZCpxzAZtxYI
	M3RMC1fLbHdbATX9aprlvRgmH1OsfHB6O04uzQK1qvmH6QaJ4fWunfFUPjP5jlfqVsWCNGXHkIIrH
	2R6VV+j3Iz03QQ0RsbXiXR9bXfj6dWLtdmw5zYasA8tF4R0x3B+uXvOd3n3peivGHdQYkF+l/QQQB
	CzEg60gGtWgN/ueQnAaI/VIm45rUjnM8ursfoBkZCzgd3dWynFy7NlKlyenH4P2Qe12T4SQ5epyP9
	mJbeXX0Fr1ScZXyrvKGjrEyomcn5UlhLb1WJmBf5d7Wy+XQrRncY1mO3WC+mltcXca2IOVl3ADlsx
	fKBfYfFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6PV-0000000ESgB-2ds1;
	Fri, 14 Mar 2025 14:53:17 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6MX-0000000ESB2-2GjC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 14:50:14 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-223a7065ff8so60514305ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 07:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741963812; x=1742568612; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EdlZPQacY7WF2SEKB06YPKehd8J9E8+LtVa0C/rc4Zw=;
        b=hDGzjmg1dDIm9h611y2fXYSHeTC0hI5cGiBNIUw9Y8LeXs7yM9b9TMYoxB2xiC7Aju
         vN22XlgmXuqhja4QsPrWrUxpTRefEnrvFZwtm+ENrznwzJi9gCj8oITylro8lZjB9+jY
         rCDJ26d/dsTpX12wIvCOCxdtapA1CVBdC3jodr0zC+qCRmJkwQM6KtjbfWD2sG/+jX0o
         Iwxp1DNyWLCscWsWdD1t2li7P4ARq/j+v2xwNJLtz/FwOPLxOOJE2gYbg5ye7RttNuFB
         qfHF7gyHMwHRQpYoI5ytetVJW3nONKIvjyIS6mk4ifmt6EHhHJcqGLLhOfeJTJDWvZ0M
         L7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741963812; x=1742568612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EdlZPQacY7WF2SEKB06YPKehd8J9E8+LtVa0C/rc4Zw=;
        b=Anidag2gFBYJ1lScXqFrXYZVO7OgL4MoqxTlMf6WxfyefsHM4q271UKmRvvLHLeIPc
         E7JiyQ0utmERx6G94QUr51J21KHhjWoiFvbNqfmM7KGboLbRXYxHrPA7n3MogLpSbfY0
         jd25VZz/w+rxzfDZbmn7FjEK2O3cTCSbvsc3XPQJ3VKBEGMmRwloLdKYcNnPCf47TyQz
         8mg96kjYUQHpF7uVRxrq3YNxqaX5uGMvpyiByX6fWRKyWKbBgnkRcvLuacN0doS6iP/b
         w0oWui24Qw6oyt7zBa5B9GOBsMNX6OpXuA9ChaAyMC8dB4fPnRMgav7m69Sw7eQoBK5B
         R4Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWl9vPncqF97gsiVQzXZKYb8yGVeVvVQzXvpi+d0mOv+xCgll7CBkmQD7yHr5TTchfhLu8nP6eaYofbWikx6yge@lists.infradead.org
X-Gm-Message-State: AOJu0YwqbRCvzB+wwZH/RtVPnvi6Hdz+nhG5W9Hav6Hz+xdPaTAfOzFU
	veQeJaGZLpY3LJU+nOmHTvfBbnLcndm/bg6rxogSO0XlbHBcdp3moNWyVcbTTqsDtuGdUA8O++6
	0GXcXiuPCg07lTpiCf6n2h37wYcMmOGwS+KRsOOh5gpD/tDoz
X-Gm-Gg: ASbGncuKGobPTf4n429o92y/47zHIq6olH0U09/uyenXVJhPH1HwwObVLQ5+H4aa469
	j6xBlc/s+d6pO4x/UmU4RmbcyrN0SNplWv/dmguu4RG6ANaNwAHsguOfBYRU+4+4P12Ul1IQLGH
	SDrRSz3Yr2bWBvuUj5TH+nBJeCUVY=
X-Google-Smtp-Source: AGHT+IHfNAUp36XMnCX/SK1JaWPhnvmshNR+2Vk1C9duS1GWTRT77F98TfUOhGL5wJRSLUOHOb+RdxqUV9fFS+99g+c=
X-Received: by 2002:a17:902:ef51:b0:220:c143:90a0 with SMTP id
 d9443c01a7336-225e0aaf01dmr49754705ad.24.1741963812527; Fri, 14 Mar 2025
 07:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250109171956.3535294-1-yeoreum.yun@arm.com>
In-Reply-To: <20250109171956.3535294-1-yeoreum.yun@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 14 Mar 2025 14:50:00 +0000
X-Gm-Features: AQ5f1JoxOsWKyJm3DNqvZjWuUp7uRpfo7Q2U9LCVyTj9tsYddKfxgU51SLSJ53Q
Message-ID: <CAJ9a7ViuVntYL62q=WYPkFR3++cyufPdKUHm0FUAPyGy76pB_A@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] coresight: prevent deactivate active config while
 enabling the config
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, james.clark@linaro.org, 
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_075013_605494_390A9EC7 
X-CRM114-Status: GOOD (  36.77  )
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

Hi,

On Thu, 9 Jan 2025 at 17:20, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
>
> While enable active config via cscfg_csdev_enable_active_config(),
> active config could be deactivated via configfs' sysfs interface.
> This could make UAF issue in below scenario:
>
> CPU0                                          CPU1
> (sysfs enable)                                load module
>                                               cscfg_load_config_sets()
>                                               activate config. // sysfs
>                                               (sys_active_cnt == 1)
> ...
> cscfg_csdev_enable_active_config()
>   lock(csdev->cscfg_csdev_lock)
>   // here load config activate by CPU1
>   unlock(csdev->cscfg_csdev_lock)
>
>                                               deactivate config // sysfs
>                                               (sys_activec_cnt == 0)
>                                               cscfg_unload_config_sets()
>                                               unload module
>
>   // access to config_desc which freed
>   // while unloading module.
>   cfs_csdev_enable_config
>
> To address this, use cscfg_config_desc's active_cnt as a reference count
> which will be holded when
>     - activate the config.
>     - enable the activated config.
> and put the module reference when config_active_cnt == 0.
>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
> from v2 to v3:
>     - add cscfg_config_desc_get()/put() (from Suzuki).
>     - remove sys_enable_cnt.
>
> from v1 to v2:
>     - modify commit message.
> ---
>  .../hwtracing/coresight/coresight-config.h    |  2 +-
>  .../coresight/coresight-etm4x-core.c          |  3 +
>  .../hwtracing/coresight/coresight-syscfg.c    | 55 ++++++++++++++-----
>  3 files changed, 44 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> index b9ebc9fcfb7f..90fd937d3bd8 100644
> --- a/drivers/hwtracing/coresight/coresight-config.h
> +++ b/drivers/hwtracing/coresight/coresight-config.h
> @@ -228,7 +228,7 @@ struct cscfg_feature_csdev {
>   * @feats_csdev:references to the device features to enable.
>   */
>  struct cscfg_config_csdev {
> -       const struct cscfg_config_desc *config_desc;
> +       struct cscfg_config_desc *config_desc;
>         struct coresight_device *csdev;
>         bool enabled;
>         struct list_head node;
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 86893115df17..6218ef40acbc 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -986,6 +986,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>         smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
>
>         raw_spin_unlock(&drvdata->spinlock);
> +
> +       cscfg_csdev_disable_active_config(csdev);
> +
>         cpus_read_unlock();
>
>         /*
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index a70c1454b410..8766f72db33e 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -391,14 +391,17 @@ static void cscfg_owner_put(struct cscfg_load_owner_info *owner_info)
>  static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, void *load_owner)
>  {
>         struct cscfg_config_csdev *config_csdev, *tmp;
> +       unsigned long flags;
>
>         if (list_empty(&csdev->config_csdev_list))
>                 return;
>
> +       raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
>         list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_list, node) {
>                 if (config_csdev->config_desc->load_owner == load_owner)
>                         list_del(&config_csdev->node);
>         }
> +       raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>  }
>
>  static void cscfg_remove_owned_csdev_features(struct coresight_device *csdev, void *load_owner)
> @@ -867,6 +870,28 @@ void cscfg_csdev_reset_feats(struct coresight_device *csdev)
>  }
>  EXPORT_SYMBOL_GPL(cscfg_csdev_reset_feats);
>
> +static bool cscfg_config_desc_get(struct cscfg_config_desc *config_desc, bool enable)
> +{
> +       if (enable)
> +               return atomic_inc_not_zero(&config_desc->active_cnt);
> +

Not sure why we have an "enable" parameter here - it completely
changes the meaning of the function - with no comment at the start.

From where it is called it makes figuring out the logic confusing.

Just keep the "get" functionality and drop the parameter & the nz check.

> +       /* when activate config */
> +
> +       /* must ensure that config cannot be unloaded in use */
> +       if (cscfg_owner_get(config_desc->load_owner))
> +               return false;
> +
> +       atomic_inc(&config_desc->active_cnt);
> +
> +       return true;
> +}
> +
> +static void cscfg_config_desc_put(struct cscfg_config_desc *config_desc)
> +{
> +       if (!atomic_dec_return(&config_desc->active_cnt))
> +               cscfg_owner_put(config_desc->load_owner);
> +}
> +
>  /*
>   * This activate configuration for either perf or sysfs. Perf can have multiple
>   * active configs, selected per event, sysfs is limited to one.
> @@ -890,22 +915,17 @@ static int _cscfg_activate_config(unsigned long cfg_hash)
>                         if (config_desc->available == false)
>                                 return -EBUSY;
>
> -                       /* must ensure that config cannot be unloaded in use */
> -                       err = cscfg_owner_get(config_desc->load_owner);
> -                       if (err)
> +                       if (!cscfg_config_desc_get(config_desc, false)) {

Drop the false parameter here.

> +                               err = -EINVAL;
>                                 break;
> +                       }
> +
>                         /*
>                          * increment the global active count - control changes to
>                          * active configurations
>                          */
>                         atomic_inc(&cscfg_mgr->sys_active_cnt);
>
> -                       /*
> -                        * mark the descriptor as active so enable config on a
> -                        * device instance will use it
> -                        */
> -                       atomic_inc(&config_desc->active_cnt);
> -
>                         err = 0;
>                         dev_dbg(cscfg_device(), "Activate config %s.\n", config_desc->name);
>                         break;
> @@ -920,9 +940,8 @@ static void _cscfg_deactivate_config(unsigned long cfg_hash)
>
>         list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item) {
>                 if ((unsigned long)config_desc->event_ea->var == cfg_hash) {
> -                       atomic_dec(&config_desc->active_cnt);
>                         atomic_dec(&cscfg_mgr->sys_active_cnt);
> -                       cscfg_owner_put(config_desc->load_owner);
> +                       cscfg_config_desc_put(config_desc);
>                         dev_dbg(cscfg_device(), "Deactivate config %s.\n", config_desc->name);
>                         break;
>                 }
> @@ -1047,7 +1066,7 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
>                                      unsigned long cfg_hash, int preset)
>  {
>         struct cscfg_config_csdev *config_csdev_active = NULL, *config_csdev_item;
> -       const struct cscfg_config_desc *config_desc;
> +       struct cscfg_config_desc *config_desc;
>         unsigned long flags;
>         int err = 0;
>
> @@ -1062,8 +1081,8 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
>         raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
>         list_for_each_entry(config_csdev_item, &csdev->config_csdev_list, node) {
>                 config_desc = config_csdev_item->config_desc;
> -               if ((atomic_read(&config_desc->active_cnt)) &&
> -                   ((unsigned long)config_desc->event_ea->var == cfg_hash)) {
> +               if (((unsigned long)config_desc->event_ea->var == cfg_hash) &&
> +                               cscfg_config_desc_get(config_desc, true)) {

This obfuscates the logic of the comparisons without good reason. With
the true parameter, the function does no "get" operation but just
replicates the logic being replaced - checking the active_cnt is
non-zero.

Restore this to the original logic to make it readable again

Regards

Mike

>                         config_csdev_active = config_csdev_item;
>                         csdev->active_cscfg_ctxt = (void *)config_csdev_active;
>                         break;
> @@ -1097,7 +1116,11 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
>                                 err = -EBUSY;
>                         raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>                 }
> +
> +               if (err)
> +                       cscfg_config_desc_put(config_desc);
>         }
> +
>         return err;
>  }
>  EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
> @@ -1136,8 +1159,10 @@ void cscfg_csdev_disable_active_config(struct coresight_device *csdev)
>         raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>
>         /* true if there was an enabled active config */
> -       if (config_csdev)
> +       if (config_csdev) {
>                 cscfg_csdev_disable_config(config_csdev);
> +               cscfg_config_desc_put(config_csdev->config_desc);
> +       }
>  }
>  EXPORT_SYMBOL_GPL(cscfg_csdev_disable_active_config);
>
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

