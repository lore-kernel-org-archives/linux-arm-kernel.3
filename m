Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDDFD1D89F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/W96S/N3029Rq8qBLDoGrRPYujtbY8X5bO1sCHgsBb0=; b=JdlRuWpjnV+E7ZkC6DPbCxUqo4
	3hZV+bzBYzBfqwCMYGBoSpApf8Iz+XzluhQq2rTRa9rI40nh+zXfEQxc0XlofzMlNux5dtlp9UI6Z
	AJvoiC6iGjpVDLVj1xdnLejTQU75HKbo40XA1owOV9WFSAujPriHS3P/JvwPk2Xlbv80gLJHp8bt1
	2+zqUawCZ+f5+hFDiKWqD7uDfRN7co+fg6mtvjus0StfL1gCt4UhaqkefRhEpSSj/0CdPsRggg1Va
	K3kYguyj2HR5aGl6wPAfei6Rtm0+XgmZAvjGtHpx3U8DF5gC1bAKm0uD/co0sNjqJRBW9XAbPuMxm
	K8nb00Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR62w-00000007nz3-1lOq;
	Thu, 04 Dec 2025 09:54:46 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR62t-00000007nyT-2S2N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:54:45 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8b28f983333so69487785a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 01:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764842082; x=1765446882; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/W96S/N3029Rq8qBLDoGrRPYujtbY8X5bO1sCHgsBb0=;
        b=am8f1UGUeM6J6go9FAU1/uS4tCMwr7pS+kjtcWJXf5bbSgrWpeJySvgAYzxiEWe8L/
         PKDq8NDOBlmsRpzAnC1uIGhmH4PjFtgX8iqBotMbRnZ61lnygPFKAyBJtEmgXj1JTREk
         2cM5b+KD/qmyeGH/q488tL2ss3zqonJi3MYYFIFZpwsYBcwfx49txOJszQCGXXctKCHT
         dscRQoUIr4hhbV8jZje0xy+3XvDiVi1g73m/MeZCJ5l8pbb19i81hsWkLkEBwoiVVF8v
         lka+PugB8KCWwOmskp8dTwuUr6WMl+XS/yT3m+m//4W2BXQfdw+w0ruJgR3Xtt+QTNcj
         MF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764842082; x=1765446882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/W96S/N3029Rq8qBLDoGrRPYujtbY8X5bO1sCHgsBb0=;
        b=PNBPCGuyB/tPHHag6egfnGoFrrjs9IXfiz9jCMxpFvtnyer56XSeQUju26vRpv/WW/
         2hp+/0W5d1hD7Lm996YVp1BcSwM50dm8kNK0Ap5szsHLmy3fgg9EZhctD00/l5bmzyht
         NnGt+w2w6eHzAnnh0l/v9LQqOS3TcuK+utHagAr4HzE3cHYyS35J1WtrIY+0+dVcvugq
         J4g+icb4bL3v8U2dfUonCLOgB6CYpZw6p3F3/vOcZWuhHCmrYLZXmWVX9Zg3eyveDj8i
         6biXYP/e/Iad5QramQ4jWmCD5TzpYlRZUgu2WIqG9OYwSqUDTzdQ/glf33Er/dNasxtY
         e4VA==
X-Forwarded-Encrypted: i=1; AJvYcCXU360+Hb8oolmalmYxrlqgM7YjbfF+6pGINng+FJMx89XPDHzoI+EBfjwY4mJtLNeX4dPubnmAgRRL3pYDw4kI@lists.infradead.org
X-Gm-Message-State: AOJu0YzcCfa8a7WI6Bqi7Au4PkB4xRm8o5i9toc8WsCCXeYugIiIDnRa
	cHAw8lxSXC5GfSYVitA6UJ7YB7LEry77x//Kmh7SKuIWrhMKq+4LZFWVPzQ5C8hm74QaTCmr7/O
	ECGH1EUgQqUJarIZeMtyTaLB4lK527zyeZPYgVW7lyw==
X-Gm-Gg: ASbGncvp/O4zbcjck7wTE3/+H0yE4+CdJ6prgG69Tzn/nYyKCnmivXxVnlN98xS+AGu
	Eh0Aw151DsVSf+Pyn2autrxmJY6397hYSbUIdrX6Zi7jU1yY+MCIUxonm28e/3xRkYVG++h/cDr
	nqBuiXOGVJ4fRI92IMu0h5XyBt4KdcPXvFN7D2kWpCWoAZenprVZj/zt+257MbLlMPgrSpM2Moe
	uTwR8pbn1dfamJyyaKgP0OcbGNZhMPOSnkVIJ07z1uu7knIQtxtbnOg8DG+VvaRsy1jyAGqVqlU
	qn6sWhgTXyo5jGTlQyYgKrtWSE45
X-Google-Smtp-Source: AGHT+IHVPoKuCDiQDMIKDwgXMsdw4PFV9Q9xFqfJYR2G5mPxVUURRiMSOc+yG3P5AHHBPpBAAPCYVeto4hVkP6GdHw8=
X-Received: by 2002:a05:620a:450e:b0:84e:2544:6be7 with SMTP id
 af79cd13be357-8b618215117mr296629385a.65.1764842082218; Thu, 04 Dec 2025
 01:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com> <20251202-extended_cti-v6-1-ab68bb15c4f5@oss.qualcomm.com>
In-Reply-To: <20251202-extended_cti-v6-1-ab68bb15c4f5@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 4 Dec 2025 09:54:31 +0000
X-Gm-Features: AWmQ_bm1xRAoFwY8gg1s9h_ZEC5c9HS0iRseWXWx7t4meew-I-EB2Go6OBUsa5Q
Message-ID: <CAJ9a7ViMU0hp1ot9XavWGuZtoiH8sO_Oih4TqWFubVp=aNiLEw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] coresight: cti: Convert trigger usage fields to
 dynamic bitmaps and arrays
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, quic_yingdeng@quicinc.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_015443_918498_D82D5B0D 
X-CRM114-Status: GOOD (  26.98  )
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

You are missing the review-by on this patch I sent for v5

On Tue, 2 Dec 2025 at 06:43, Yingchao Deng
<yingchao.deng@oss.qualcomm.com> wrote:
>
> Replace the fixed-size u32 fields in the cti_config and cti_trig_grp
> structure with dynamically allocated bitmaps and arrays. This allows
> memory to be allocated based on the actual number of triggers during probe
> time, reducing memory footprint and improving scalability for platforms
> with varying trigger counts.
> Additionally, repack struct cti_config to reduce its size from 80 bytes to
> 72 bytes.
>
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-cti-core.c   | 58 ++++++++++++++++------
>  .../hwtracing/coresight/coresight-cti-platform.c   | 16 +++---
>  drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 10 ++--
>  drivers/hwtracing/coresight/coresight-cti.h        | 17 ++++---
>  4 files changed, 65 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index bfbc365bb2ef..f9970e40dd59 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -214,8 +214,8 @@ void cti_write_intack(struct device *dev, u32 ackval)
>  /* DEVID[19:16] - number of CTM channels */
>  #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
>
> -static void cti_set_default_config(struct device *dev,
> -                                  struct cti_drvdata *drvdata)
> +static int cti_set_default_config(struct device *dev,
> +                                 struct cti_drvdata *drvdata)
>  {
>         struct cti_config *config = &drvdata->config;
>         u32 devid;
> @@ -234,12 +234,33 @@ static void cti_set_default_config(struct device *dev,
>                 config->nr_trig_max = CTIINOUTEN_MAX;
>         }
>
> +       config->trig_in_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
> +       if (!config->trig_in_use)
> +               return -ENOMEM;
> +
> +       config->trig_out_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
> +       if (!config->trig_out_use)
> +               return -ENOMEM;
> +
> +       config->trig_out_filter = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
> +       if (!config->trig_out_filter)
> +               return -ENOMEM;
> +
> +       config->ctiinen = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
> +       if (!config->ctiinen)
> +               return -ENOMEM;
> +
> +       config->ctiouten = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
> +       if (!config->ctiouten)
> +               return -ENOMEM;
> +
>         config->nr_ctm_channels = CTI_DEVID_CTMCHANNELS(devid);
>
>         /* Most regs default to 0 as zalloc'ed except...*/
>         config->trig_filter_enable = true;
>         config->ctigate = GENMASK(config->nr_ctm_channels - 1, 0);
>         config->enable_req_count = 0;
> +       return 0;
>  }
>
>  /*
> @@ -270,8 +291,10 @@ int cti_add_connection_entry(struct device *dev, struct cti_drvdata *drvdata,
>         cti_dev->nr_trig_con++;
>
>         /* add connection usage bit info to overall info */
> -       drvdata->config.trig_in_use |= tc->con_in->used_mask;
> -       drvdata->config.trig_out_use |= tc->con_out->used_mask;
> +       bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_use,
> +                 tc->con_in->used_mask, drvdata->config.nr_trig_max);
> +       bitmap_or(drvdata->config.trig_out_use, drvdata->config.trig_out_use,
> +                 tc->con_out->used_mask, drvdata->config.nr_trig_max);
>
>         return 0;
>  }
> @@ -293,12 +316,20 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
>         if (!in)
>                 return NULL;
>
> +       in->used_mask = devm_bitmap_alloc(dev, in_sigs, GFP_KERNEL);
> +       if (!in->used_mask)
> +               return NULL;
> +
>         out = devm_kzalloc(dev,
>                            offsetof(struct cti_trig_grp, sig_types[out_sigs]),
>                            GFP_KERNEL);
>         if (!out)
>                 return NULL;
>
> +       out->used_mask = devm_bitmap_alloc(dev, out_sigs, GFP_KERNEL);
> +       if (!out->used_mask)
> +               return NULL;
> +
>         tc->con_in = in;
>         tc->con_out = out;
>         tc->con_in->nr_sigs = in_sigs;
> @@ -314,7 +345,6 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
>  {
>         int ret = 0;
>         int n_trigs = drvdata->config.nr_trig_max;
> -       u32 n_trig_mask = GENMASK(n_trigs - 1, 0);
>         struct cti_trig_con *tc = NULL;
>
>         /*
> @@ -325,8 +355,9 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
>         if (!tc)
>                 return -ENOMEM;
>
> -       tc->con_in->used_mask = n_trig_mask;
> -       tc->con_out->used_mask = n_trig_mask;
> +       bitmap_fill(tc->con_in->used_mask, n_trigs);
> +       bitmap_fill(tc->con_out->used_mask, n_trigs);
> +
>         ret = cti_add_connection_entry(dev, drvdata, tc, NULL, "default");
>         return ret;
>  }
> @@ -339,7 +370,6 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>  {
>         struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>         struct cti_config *config = &drvdata->config;
> -       u32 trig_bitmask;
>         u32 chan_bitmask;
>         u32 reg_value;
>         int reg_offset;
> @@ -349,18 +379,16 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>            (trigger_idx >= config->nr_trig_max))
>                 return -EINVAL;
>
> -       trig_bitmask = BIT(trigger_idx);
> -
>         /* ensure registered triggers and not out filtered */
>         if (direction == CTI_TRIG_IN)   {
> -               if (!(trig_bitmask & config->trig_in_use))
> +               if (!(test_bit(trigger_idx, config->trig_in_use)))
>                         return -EINVAL;
>         } else {
> -               if (!(trig_bitmask & config->trig_out_use))
> +               if (!(test_bit(trigger_idx, config->trig_out_use)))
>                         return -EINVAL;
>
>                 if ((config->trig_filter_enable) &&
> -                   (config->trig_out_filter & trig_bitmask))
> +                   test_bit(trigger_idx, config->trig_out_filter))
>                         return -EINVAL;
>         }
>
> @@ -892,7 +920,9 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>         raw_spin_lock_init(&drvdata->spinlock);
>
>         /* initialise CTI driver config values */
> -       cti_set_default_config(dev, drvdata);
> +       ret = cti_set_default_config(dev, drvdata);
> +       if (ret)
> +               return ret;
>
>         pdata = coresight_cti_get_platform_data(dev);
>         if (IS_ERR(pdata)) {
> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> index d0ae10bf6128..4bef860a0484 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> @@ -136,8 +136,8 @@ static int cti_plat_create_v8_etm_connection(struct device *dev,
>                 goto create_v8_etm_out;
>
>         /* build connection data */
> -       tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
> -       tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
> +       bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
> +       bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
>
>         /*
>          * The EXTOUT type signals from the ETM are connected to a set of input
> @@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct device *dev,
>                 goto of_create_v8_out;
>
>         /* Set the v8 PE CTI connection data */
> -       tc->con_in->used_mask = 0x3; /* sigs <0 1> */
> +       bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
>         tc->con_in->sig_types[0] = PE_DBGTRIGGER;
>         tc->con_in->sig_types[1] = PE_PMUIRQ;
> -       tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
> +       bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
>         tc->con_out->sig_types[0] = PE_EDBGREQ;
>         tc->con_out->sig_types[1] = PE_DBGRESTART;
>         tc->con_out->sig_types[2] = PE_CTIIRQ;
> @@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct device *dev,
>                 goto of_create_v8_out;
>
>         /* filter pe_edbgreq - PE trigout sig <0> */
> -       drvdata->config.trig_out_filter |= 0x1;
> +       set_bit(0, drvdata->config.trig_out_filter);
>
>  of_create_v8_out:
>         return ret;
> @@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct cti_trig_grp *tgrp,
>         if (!err) {
>                 /* set the signal usage mask */
>                 for (idx = 0; idx < tgrp->nr_sigs; idx++)
> -                       tgrp->used_mask |= BIT(values[idx]);
> +                       set_bit(values[idx], tgrp->used_mask);
>         }
>
>         kfree(values);
> @@ -331,7 +331,9 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
>
>         err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
>         if (!err)
> -               drvdata->config.trig_out_filter |= tg->used_mask;
> +               bitmap_or(drvdata->config.trig_out_filter,
> +                         drvdata->config.trig_out_filter,
> +                         tg->used_mask, drvdata->config.nr_trig_max);
>
>         kfree(tg);
>         return err;
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index 572b80ee96fb..a9df77215141 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -711,10 +711,8 @@ static ssize_t trigout_filtered_show(struct device *dev,
>         struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>         struct cti_config *cfg = &drvdata->config;
>         int size = 0, nr_trig_max = cfg->nr_trig_max;
> -       unsigned long mask = cfg->trig_out_filter;
>
> -       if (mask)
> -               size = bitmap_print_to_pagebuf(true, buf, &mask, nr_trig_max);
> +       size = bitmap_print_to_pagebuf(true, buf, cfg->trig_out_filter, nr_trig_max);
>         return size;
>  }
>  static DEVICE_ATTR_RO(trigout_filtered);
> @@ -926,9 +924,8 @@ static ssize_t trigin_sig_show(struct device *dev,
>         struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
>         struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>         struct cti_config *cfg = &drvdata->config;
> -       unsigned long mask = con->con_in->used_mask;
>
> -       return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
> +       return bitmap_print_to_pagebuf(true, buf, con->con_in->used_mask, cfg->nr_trig_max);
>  }
>
>  static ssize_t trigout_sig_show(struct device *dev,
> @@ -940,9 +937,8 @@ static ssize_t trigout_sig_show(struct device *dev,
>         struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
>         struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>         struct cti_config *cfg = &drvdata->config;
> -       unsigned long mask = con->con_out->used_mask;
>
> -       return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
> +       return bitmap_print_to_pagebuf(true, buf, con->con_out->used_mask, cfg->nr_trig_max);
>  }
>
>  /* convert a sig type id to a name */
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> index 4f89091ee93f..e7b88b07cffe 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -68,7 +68,7 @@ struct fwnode_handle;
>   */
>  struct cti_trig_grp {
>         int nr_sigs;
> -       u32 used_mask;
> +       unsigned long *used_mask;
>         int sig_types[];
>  };
>
> @@ -146,20 +146,21 @@ struct cti_config {
>         bool hw_enabled;
>         bool hw_powered;
>
> -       /* registered triggers and filtering */
> -       u32 trig_in_use;
> -       u32 trig_out_use;
> -       u32 trig_out_filter;
>         bool trig_filter_enable;
>         u8 xtrig_rchan_sel;
>
>         /* cti cross trig programmable regs */
> -       u32 ctiappset;
>         u8 ctiinout_sel;
> -       u32 ctiinen[CTIINOUTEN_MAX];
> -       u32 ctiouten[CTIINOUTEN_MAX];
> +       u32 ctiappset;
>         u32 ctigate;
>         u32 asicctl;
> +       u32 *ctiinen;
> +       u32 *ctiouten;
> +
> +       /* registered triggers and filtering */
> +       unsigned long *trig_in_use;
> +       unsigned long *trig_out_use;
> +       unsigned long *trig_out_filter;
>  };
>
>  /**
>
> --
> 2.43.0
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

