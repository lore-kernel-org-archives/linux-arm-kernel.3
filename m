Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4905FCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGAnFwEnHBldyC19wfHUDKGZkjsePFCHd7Iuxyaa00k=; b=2T4ctlFXYhSekKGeCS1OvwGrrb
	OGHn3h0KPEU4WGwJpqsLTszv9XyX74aXzc5rCuUhO2YJIc1AcB0+2HXBtUTKwGHqVWS7usMWns8a5
	KdxHZWmLV/zgcBq1DjH7/UmZ0s7hmEOZz/Yb3FG3C4ZQH0MWtT1zVzeJ2G4Mx0rQVqj3b8SgymeAx
	DBD6I8q+2IMuIWUA53WaGAlGv3AyoAQEV1Qj0iN/bnj2WkwCV0DT4lE9H0cOPoX5E9+iXyFu8MdBP
	RtWNKE1maWmWdUM3xY0OIWWuFVEsUqFeVDY4VwDYJReh2oLJTjo3BSfNMZ1XjyMfa/pZZ6k5yWsyC
	/eiq2Skw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ss8-00000006XcV-12BV;
	Thu, 09 Oct 2025 15:48:04 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ss5-00000006XbD-1S9o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:48:02 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-781010ff051so821820b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 08:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760024880; x=1760629680; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XGAnFwEnHBldyC19wfHUDKGZkjsePFCHd7Iuxyaa00k=;
        b=oTXuU5nw0sEpwPNw3FZvczxtpsKydVFM0wPOiag0az+7qE7kcal3tc/QjN8qituhZ/
         NTB4vABaEcO9xH60YEUUWBHW6aUrRCyfl6HtW/P6CWAlr8Er4y0hRz/8VRLHLVY7kH+l
         jeBD1x6LuVWnXXqnjVNEfM0WGSw0xFJ9mnT0B5AAMkKCmt5Z+BH+M0TQeLQsgFW5F6d6
         Y9YDk5mV5HYhj4oBZfdeaPGKDOpREmkFCOxblm+8OAmHnOgsQ2gQUyf75kHOnxsUlSbK
         7yserxgCKnj5FgyVv/k0Jk0CaAV2jatvZHYaQG5TaAReTrYzcVglneEnAFcIWjLh6H0j
         oINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760024880; x=1760629680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGAnFwEnHBldyC19wfHUDKGZkjsePFCHd7Iuxyaa00k=;
        b=BTILY4CwJwANhc7NfbVV2RUtVVoswcU8IIgGaeCe3XdzMRXY6UZbMq13QaIzb0056P
         Eo1W+DSCBa7DaKjf1D1CrE+Fje4kmUf4JneNF59TPAte/ZJGdHHnWAmLWbelJmFpZWSu
         qbcQTolpO5khaFto518YHT5VfhSEXDG0RpDfNlNluOk++SWTprDmkM9bQGRWP/DWWeO5
         G38l7svaMeJH5GH0cr1CWeNlaJYWzQ/Kaev372S1Y2weGFJ4h75Vhrn3iKZt5wfdgrzB
         TILQxbXZuAfNnzuvt0nEcSM1/IzghmidN9JtvM1/qwWY5OfFkk77DlqZB2/2EJAxdf2J
         fPfA==
X-Forwarded-Encrypted: i=1; AJvYcCU+DKQfdIHEOFLI6RU3JNE7xdfgeiclkQEyjCfsE8xROoscjDIiVn3eMo/UbMivohuZhNO8xSH+/tfVfi1zPMzF@lists.infradead.org
X-Gm-Message-State: AOJu0YzGIU1uZ2bFxqJIIDK3YNj4bx2HNXj/2a5CRaf7j+bsGHVtcsmp
	RtRSQ21Iq6r+VuSNkjM8xmf5n+ZsBbL+FBdlkhsyGsfIqEmlJELkj1DyVCWa3VJD0g87jIb8Vec
	phRTU0BM3OYNTN8oUad/3ABYyt9s2HBs3STo5vThcCQ==
X-Gm-Gg: ASbGncsN97lFb7B97Uy8Hc995/tPaUhraXWEJNpAwXtyHVZdLFPnzXE1G01EPQ+T2KV
	CX+yIDFUPNdrASVbo9o8J0us/zY1UM9zA749nNhbwV8M/+LjHQL9L2Ht8pQV4rHDeG/zuTu+DUZ
	SQzjnOfwSZqDG6u5yLKbh+GPuR2YVuAP3sOBHOIMo4IEwM2l23ICiic9r5Enq4I2Ze7crAVIxqX
	hF/tiViR25FPCtI2aG3oyV4/h6qe+LMxN9e
X-Google-Smtp-Source: AGHT+IF6lNhbzZO84mSJkdUy7VjpvOVO74iscs8MhONQ8FrkcE27gvqJ+bzvDUmuhGFY3PpfCCeaHDOpOi7Q63g9uok=
X-Received: by 2002:a05:6a00:987:b0:77e:7302:dbe7 with SMTP id
 d2e1a72fcca58-7938792ac35mr8571610b3a.27.1760024880220; Thu, 09 Oct 2025
 08:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org> <20251002-james-cs-syncfreq-v3-4-fe5df2bf91d1@linaro.org>
In-Reply-To: <20251002-james-cs-syncfreq-v3-4-fe5df2bf91d1@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 9 Oct 2025 16:47:48 +0100
X-Gm-Features: AS18NWB8g7ZmaX0Xqd_icgqiHaagJoUhKP2NaShs4bRrD5R5X7h97DTqGwlgzNw
Message-ID: <CAJ9a7VjGfiZ2VsnyB05YVv4zZ7FC03uBueKH4M4NUys+=eCaQQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] coresight: Add format attribute for setting the
 timestamp interval
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_084801_415276_3BEBEA01 
X-CRM114-Status: GOOD (  34.75  )
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

Hi James

On Thu, 2 Oct 2025 at 11:10, James Clark <james.clark@linaro.org> wrote:
>
> Timestamps are currently emitted at the maximum rate possible, which is
> much too frequent for most use cases. Add an attribute to be able to set
> the interval. Granular control is not required, so save space in the
> config by interpreting it as 2 ^ ts_interval. And then 4 bits (0 - 15) is
> enough to set the interval to be larger than the existing SYNC timestamp
> interval.
>
> No sysfs file is needed for this attribute because counter generated
> timestamps are only configured for Perf mode.
>
> Only show this attribute for ETM4x because timestamps aren't configured
> in the same way for ETM3x. The attribute is only ever read in
> coresight-etm4x-core.c.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c   | 16 +++++++++++++++-
>  drivers/hwtracing/coresight/coresight-etm-perf.h   |  7 +++++++
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 21 ++++++++++++---------
>  3 files changed, 34 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index f677c08233ba..0c1b990fc56e 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -13,6 +13,7 @@
>  #include <linux/mm.h>
>  #include <linux/init.h>
>  #include <linux/perf_event.h>
> +#include <linux/perf/arm_pmu.h>
>  #include <linux/percpu-defs.h>
>  #include <linux/slab.h>
>  #include <linux/stringhash.h>
> @@ -69,7 +70,8 @@ PMU_FORMAT_ATTR(sinkid,               "config2:0-31");
>  /* config ID - set if a system configuration is selected */
>  PMU_FORMAT_ATTR(configid,      "config2:32-63");
>  PMU_FORMAT_ATTR(cc_threshold,  "config3:0-11");
> -
> +/* Interval = (2 ^ ts_level) */
> +GEN_PMU_FORMAT_ATTR(ts_level);
>
>  /*
>   * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
> @@ -103,11 +105,23 @@ static struct attribute *etm_config_formats_attr[] = {
>         &format_attr_configid.attr,
>         &format_attr_branch_broadcast.attr,
>         &format_attr_cc_threshold.attr,
> +       &format_attr_ts_level.attr,
>         NULL,
>  };
>
> +static umode_t etm_format_attr_is_visible(struct kobject *kobj,
> +                                         struct attribute *attr, int unused)
> +{
> +       if (attr == &format_attr_ts_level.attr &&
> +           !IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
> +               return 0;
> +
> +       return attr->mode;
> +}
> +
>  static const struct attribute_group etm_pmu_format_group = {
>         .name   = "format",
> +       .is_visible = etm_format_attr_is_visible,
>         .attrs  = etm_config_formats_attr,
>  };
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index 5febbcdb8696..d2664ffb33e5 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> @@ -7,6 +7,7 @@
>  #ifndef _CORESIGHT_ETM_PERF_H
>  #define _CORESIGHT_ETM_PERF_H
>
> +#include <linux/bits.h>
>  #include <linux/percpu-defs.h>
>  #include "coresight-priv.h"
>
> @@ -20,6 +21,12 @@ struct cscfg_config_desc;
>   */
>  #define ETM_ADDR_CMP_MAX       8
>
> +#define ATTR_CFG_FLD_ts_level_CFG      config3
> +#define ATTR_CFG_FLD_ts_level_LO       12
> +#define ATTR_CFG_FLD_ts_level_HI       15
> +#define ATTR_CFG_FLD_ts_level_MASK     GENMASK(ATTR_CFG_FLD_ts_level_HI, \
> +                                               ATTR_CFG_FLD_ts_level_LO)
> +
>  /**
>   * struct etm_filter - single instruction range or start/stop configuration.
>   * @start_addr:        The address to start tracing on.
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 920d092ef862..034844f52bb2 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -28,6 +28,7 @@
>  #include <linux/amba/bus.h>
>  #include <linux/seq_file.h>
>  #include <linux/uaccess.h>
> +#include <linux/perf/arm_pmu.h>
>  #include <linux/perf_event.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> @@ -616,7 +617,7 @@ static void etm4_enable_hw_smp_call(void *info)
>   *  +--------------+
>   *         |
>   *  +------v-------+
> - *  | Counter x    |   (reload to 1 on underflow)
> + *  | Counter x    |   (reload to 2 ^ ts_level on underflow)
>   *  +--------------+
>   *         |
>   *  +------v--------------+
> @@ -627,11 +628,17 @@ static void etm4_enable_hw_smp_call(void *info)
>   *  | Timestamp Generator  |  (timestamp on resource y)
>   *  +----------------------+
>   */
> -static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
> +static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
> +                                      struct perf_event_attr *attr)
>  {
>         int ctridx;
>         int rselector;
>         struct etmv4_config *config = &drvdata->config;
> +       u8 ts_level = ATTR_CFG_GET_FLD(attr, ts_level);
> +
> +       /* Disable when ts_level == MAX */
> +       if (ts_level == FIELD_GET(ATTR_CFG_FLD_ts_level_MASK, UINT_MAX))
> +               return 0;
>
>         /* No point in trying if we don't have at least one counter */
>         if (!drvdata->nr_cntr)
> @@ -667,12 +674,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>                 return -ENOSPC;
>         }
>
> -       /*
> -        * Initialise original and reload counter value to the smallest
> -        * possible value in order to get as much precision as we can.
> -        */
> -       config->cntr_val[ctridx] = 1;
> -       config->cntrldvr[ctridx] = 1;
> +       /* Initialise original and reload counter value. */
> +       config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << ts_level;
>
>         /*
>          * Trace Counter Control Register TRCCNTCTLRn
> @@ -762,7 +765,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>                  * order to correlate instructions executed on different CPUs
>                  * (CPU-wide trace scenarios).
>                  */
> -               ret = etm4_config_timestamp_event(drvdata);
> +               ret = etm4_config_timestamp_event(drvdata, attr);
>
>                 /*
>                  * No need to go further if timestamp intervals can't
>
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

