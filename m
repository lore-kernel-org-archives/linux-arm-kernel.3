Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBC6D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 15:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtMBZcajxCOgwMc5Cr5khAy3BKxvnEEBT1x3xJ3pIV0=; b=1PJFrEkqS0dfyitAzZCJdSPs1E
	rW2s5++Kpk1teHqj6DzoUvQVDP1uFlMjD5pa3lD7RHqVjvyV9zPre/HbS7jAeH6XLpxV5+NOc+wiL
	Ukz1i4t6TBFq+9dwrY7NkJ+psngISBTA6kRqgBCvmqzUFnz26lIXEd3k/LXC73dGNgjv2IVXilZEW
	rORzmhGfTvN+OSfj9TZxbfsY9C8UcqMUd4yenHmkp0bNfFygEWCLFdWuH7Ufjh6iL6qoqQv4xbtPI
	BBZq+jBK+lFHhqnnYJwDh95K9TTZWHLiDEb5h5mNxZK/Dety8Q+hEwp1AfTYHLFt6gXYusfRWyzz2
	9MM41GaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOeEF-0000000Grj7-17TL;
	Thu, 27 Nov 2025 15:48:19 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOeEC-0000000GriX-3j4S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 15:48:18 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8b1b8264c86so82568185a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 07:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764258495; x=1764863295; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vtMBZcajxCOgwMc5Cr5khAy3BKxvnEEBT1x3xJ3pIV0=;
        b=nscU/Hd/s263CTsmgaN8pjakWChKzEeoXBdQZ19/9eaZu3oaBBW0uSpj6Xt5WE/Flp
         QJvoBcepeL3CAJsmJMTDIYc5khpZul08nHoOEdtSNC4S00tWHJLHxv2fqM0o+QIdfE0G
         ryZ9Wsx5CpwAcL2CvRa/WqpkRhWtRsN7LSm0qdhjiD0dMVNqY7b2Ar6EB6xFvKPzr2aC
         bD9vES4yJ3zkNY9QJXUxmneJ3+Fo3wtZnuj1LkZzELCpvNwmulYkepDNYBIOOC6jTyRk
         4zNRvpAEPUshl/dh+Z+9VgK++Piq2hBFGzbR99bREITLm8Hg56sj6VFpz2BL79NLrFrA
         79UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764258495; x=1764863295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtMBZcajxCOgwMc5Cr5khAy3BKxvnEEBT1x3xJ3pIV0=;
        b=Z3Vvvp0yX4GnUhfUwLhOraC2itHaekUc9bmsclznS7l8N26E6i+cIHS+FpiZZXrBT+
         Vhsg2ieogpirA45+VlPpPui0i/UWphvrV/U26sI7vjq6cZ1P+MjlJXaeBGj9URf6W4qw
         4yqWSL8ctz6WHKlIyYrUYhU7Xw72NVlBDJp3uQ/PLjosUAMOQWdppHBzn33Uro/eDr+4
         DpUafZyiRqDhW+FzMdYWBwGE0uEqUXpfO3+f5QQMOrh0M8SUBrZF+S6YHuXYdKjSEip2
         KbVQ22s/mBBvLp87t/fS7oGv4isdo37bIEjzSjjKjywy+xWV3V0vYsZOaq54afWHJhTb
         lBVw==
X-Forwarded-Encrypted: i=1; AJvYcCWXms4z2O09+OR5feiZyJZ9Uo6062BBc8W6CwVWQcUk+GZ+ctd6l22QyYBHCbZcFQx0J4CjEZJPJopkETOHTVqZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzQRo/qTI9Ypf0geGZrH5RafHsl9PeQC6DHb2jPMD6LVYRMLvgB
	dyzOl3I/UWoWdZeEwEqULwZyFkKOce1OAvwW4yB1YUD9o3/i9MpQWwCeJS2eXvXifDrwpbI64Ee
	zBxF+k/jlp6XG2zHxvRKIv20iddpDnbJW90BDd7f8FefDP7OlC/us
X-Gm-Gg: ASbGncuhTYI8dmEl7JkLYpPWxSdUzQF4TuGH6dy76QCnVKV5p/ZfKwdujFzDsWUppzZ
	+vpoKYc9bODmCAvvp16OEsPL0ZMSWnpV9L08nI6wmd6enHqva1FueFMG0uJ3R1+K4sOXm5wbwOM
	hfrxj+WLFE2L+ssBzerzO3Nhwzo6hiKHDijmuPzSejKDFqMgqwE3KseS/2wM8VMeNTrTtJQ67l5
	fhua//8vpMPPzjVvz/0DX+5XFuTxeZ2PCx7+pqlbDi7mq7D7iygTD8kI/+wqw+X0rTtGntx5Gbl
	sa6gOmWU8+PAmvHPQXWNddlfApS4
X-Google-Smtp-Source: AGHT+IFGwX2xKjZ8zJ3ufBUfaizsNdUaJKyCmefwgS6iGyjsDIT0trjpyT1ZheKEA+VbXy1GrSLZjBsVFvn+NFM/III=
X-Received: by 2002:a05:620a:708a:b0:89f:db05:1643 with SMTP id
 af79cd13be357-8b33d48e2f2mr3163411085a.89.1764258495434; Thu, 27 Nov 2025
 07:48:15 -0800 (PST)
MIME-Version: 1.0
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org> <20251126-james-cs-syncfreq-v7-12-7fae5e0e5e16@linaro.org>
In-Reply-To: <20251126-james-cs-syncfreq-v7-12-7fae5e0e5e16@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 27 Nov 2025 15:48:03 +0000
X-Gm-Features: AWmQ_bkzMba4JL0CdLihlk22izMToOw3dK8aUMj5q3QJJV-vmdb-ii6vOW6lFiQ
Message-ID: <CAJ9a7VgqGJ=YLG6+ypMnqV9YJ_dMBw6qyhusXdR_NR2=RTis-w@mail.gmail.com>
Subject: Re: [PATCH v7 12/13] coresight: Allow setting the timestamp interval
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_074816_959271_7E8C03EF 
X-CRM114-Status: GOOD (  29.88  )
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

On Wed, 26 Nov 2025 at 10:57, James Clark <james.clark@linaro.org> wrote:
>
> Timestamps are currently emitted at the maximum rate possible, which is
> much too frequent for most use cases. Set the interval using the value
> from the timestamp field. Granular control is not required, so save
> space in the config by interpreting it as 2 ^ timestamp. And then 4
> bits (0 - 15) is enough to set the interval to be larger than the
> existing SYNC timestamp interval.
>
> No sysfs mode support is needed for this attribute because counter
> generated timestamps are only configured for Perf mode.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.h   |  1 +
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 28 +++++++++++++++-------
>  2 files changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index 24d929428633..128f80bb1443 100644
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
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index c7bf73c8f2d7..0129b0502726 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -651,7 +651,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
>   *  +--------------+
>   *         |
>   *  +------v-------+
> - *  | Counter x    |   (reload to 1 on underflow)
> + *  | Counter x    |   (reload to 2 ^ timestamp on underflow)
>   *  +--------------+
>   *         |
>   *  +------v--------------+
> @@ -662,11 +662,25 @@ static void etm4_enable_sysfs_smp_call(void *info)
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
> +       struct perf_event_attr max_timestamp = {
> +               .ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
> +       };
> +
> +       /* timestamp may be 0 if deprecated_timestamp is used, so make min 1 */
> +       u8 ts_level = max(1, ATTR_CFG_GET_FLD(attr, timestamp));
> +

I could be missing something here - but if we have a perf command line:

perf -e cs_etm/timestamp=0/

is this bit not changing that to timestamp=1 regardless? The docs
(patch 13) indicate timestamp=0 to be timestamps off.

This command is used in test_arm_coresight.sh when testing the
combination of options on the CS system.

Mike

> +       /*
> +        * Disable counter generated timestamps when timestamp == MAX. Leave
> +        * only SYNC timestamps.
> +        */
> +       if (ts_level == ATTR_CFG_GET_FLD(&max_timestamp, timestamp))
> +               return 0;
>
>         /* No point in trying if we don't have at least one counter */
>         if (!drvdata->nr_cntr)
> @@ -704,12 +718,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
> +       config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << (ts_level - 1);
>
>         /*
>          * Trace Counter Control Register TRCCNTCTLRn
> @@ -799,7 +809,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
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

