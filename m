Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44429D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 16:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GapapUbs7e3KQYoiEBxDXMAXQNgCZcbnNy9kg7gHKRs=; b=hgl0VPqsjoGv3DD8ZAkTDGDIeu
	k2S2Oh8p2cz43v4bud7ab83lY9FVpYQVLaqAN0wpFW6HMk0jZlkAM7fvDM6y1+MItm4RkXozDMa2J
	ZYD+bElhiOzUPrbW/9ojN2tBwYxMEMmmZtbRromQRFn4163Xo2EZFeL5QQOnhYm0SfzI16qEPWlif
	E5LwVhzBHbqUZl4WOvHoPebAJeCv6Y+mk+7hDEt3sxbkk50SzMnFGb1cFYgCqfj9QU+Kz7EEgK37C
	FL9SSoLW+aETgdaYqKIQT38GZxr4JY1IzQW++TjzFjoHmKpybGosaTF9qm/lWaybEw9wc5uP9FiCx
	FebI7JoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOebJ-0000000Guia-1LoO;
	Thu, 27 Nov 2025 16:12:09 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOebG-0000000GuiB-2cte
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 16:12:07 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8b22624bcdaso111226985a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 08:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764259925; x=1764864725; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GapapUbs7e3KQYoiEBxDXMAXQNgCZcbnNy9kg7gHKRs=;
        b=RNv0hFkMBogMCGSdnXNVBVHLqB6BMOhF8JU/ERus78SzmBu/iSI8ht0hcXlVdjzXNC
         GsjhsyscRG8dUY9ZelE5mfr2hGMIDsdq8P2bFyukbDFBaoqEk21+nkmMUegDIAA8nwRj
         IZflyP7r/DKSNpROteH3Rqs92ilxo1gE9RZ4Z52UyB+ef8EeJbZ9sk0g91V+TxLKowtu
         8lcwZOk2fn/zsmAyTO+SnBjis1H1zHXaDzvYO1eI4fFjC1fQ0fymldOC/wBkEM4rsKNz
         j7rgV5wM05IsLGuLf+UyVhyQT/jKFSrJrm08V8lQu0BYTI0a7wpAtRjOHRj9p7nNmoJf
         hrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259925; x=1764864725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GapapUbs7e3KQYoiEBxDXMAXQNgCZcbnNy9kg7gHKRs=;
        b=nPUz70SWGFZLqFJ+C2ZuxLpF074HILTa3A9Nxrzk/zOiSEdmkfyJNN9wE8cC3AVI9w
         ytHgP8P2o9ewslvz5ZFYEKkqpJAR6LQb/sOGp63l4p6++bMNWAbgDrqfctUj/nM9emX0
         vl6KxNrIKoCIBimfHRxR3wliOM8DeKZyySD3fc8LQwjT0ShCPsbWKtReUFkqENCqasoR
         qExpKw5bzi9MEaTU0sNVQcX+GS9srvPfkiHdAplj2/+j1swI86H5EjS+RMTGkSdeKGWi
         CzKLB4ECSRqLrLrWYT3CCFE1e3PUfaz4Clnfb0qk+lf9XeYe+c2dioJztocxJg/yMuJ4
         p1pw==
X-Forwarded-Encrypted: i=1; AJvYcCX4/XAlJ02rxvE/nMqbBx/qNWBxpAJGk5d633fXsun/4/2XJ/MS+/NvwFNIGMeBPLBklXeS7t+2DFH1GpA0AtW0@lists.infradead.org
X-Gm-Message-State: AOJu0YxTczcWz/x4ZxypTbmC7nG6mScldFCUZFPYiMupftn53vFBPZiM
	cmuSUv8xpDiB4GswQo2WY0cV3gaTRoD4zRESvPDEUIIo7dDmdjrVw8qGuczg/A/BXiu8aV7Rr3Z
	+QPNXLhgrrQwbNJSDcmSP03QsXq/A4V1Y/9L8/1CGjQ==
X-Gm-Gg: ASbGncsnoqZSbq0mq3uI0PABcTe2G3H4cz2+Ypwa51CvCe1wkJZfAooOKuVRw9iHf9M
	Q3LOofxpLKFqkk+RX/3ssfvpLh/19zCsTRGKcVX7f5PTKMxoqFGiKmlTFtatYV19RmUKIQQQFni
	VLsowUwUdcMA+1KfA+GaK5T1e61tuWbAzY1Sa7z39OIXYFGN+I2DopwfEsKTHDkMf2q1a8Y29px
	QJ12mkQVVqNDbbzQteimqDGnBXnxfj4ZWiFb5mhfQm2gC99Rx30JH+JWX+Shjl7MGjizPaBjVJG
	CnnaESp6blR3rJe79hRDLjWAjinx
X-Google-Smtp-Source: AGHT+IHsGV3TEa2pdwvHDjBWy4WnWcNbtFiNFi+YFp/54ivvMFJzi1TLM9DpHmzYKL5gS2uzB0O836iJUO6h3xgHaZE=
X-Received: by 2002:a05:620a:2982:b0:8a1:762a:ab13 with SMTP id
 af79cd13be357-8b33d1dd003mr3272403985a.10.1764259925082; Thu, 27 Nov 2025
 08:12:05 -0800 (PST)
MIME-Version: 1.0
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-12-7fae5e0e5e16@linaro.org> <CAJ9a7VgqGJ=YLG6+ypMnqV9YJ_dMBw6qyhusXdR_NR2=RTis-w@mail.gmail.com>
In-Reply-To: <CAJ9a7VgqGJ=YLG6+ypMnqV9YJ_dMBw6qyhusXdR_NR2=RTis-w@mail.gmail.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 27 Nov 2025 16:11:54 +0000
X-Gm-Features: AWmQ_blRpcZYUNReouRYTIPa5Ymx0XpGoIz3jg-XNCjhMsDaPOcIssoxm5yqYbU
Message-ID: <CAJ9a7VjOP4_VtO9zi21xDxRqkybeS7V3iGnH5AKhHLEPYUCQCQ@mail.gmail.com>
Subject: Re: [PATCH v7 12/13] coresight: Allow setting the timestamp interval
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_081206_704268_834C2792 
X-CRM114-Status: GOOD (  36.21  )
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

OK I see it now. The real problem is that the logic to determine if we
are to set a counter based timestamp is confusingly spread across two
functions and two patches.

On Thu, 27 Nov 2025 at 15:48, Mike Leach <mike.leach@linaro.org> wrote:
>
> Hi James
>
> On Wed, 26 Nov 2025 at 10:57, James Clark <james.clark@linaro.org> wrote:
> >
> > Timestamps are currently emitted at the maximum rate possible, which is
> > much too frequent for most use cases. Set the interval using the value
> > from the timestamp field. Granular control is not required, so save
> > space in the config by interpreting it as 2 ^ timestamp. And then 4
> > bits (0 - 15) is enough to set the interval to be larger than the
> > existing SYNC timestamp interval.
> >
> > No sysfs mode support is needed for this attribute because counter
> > generated timestamps are only configured for Perf mode.
> >
> > Reviewed-by: Leo Yan <leo.yan@arm.com>
> > Tested-by: Leo Yan <leo.yan@arm.com>
> > Signed-off-by: James Clark <james.clark@linaro.org>
> > ---
> >  drivers/hwtracing/coresight/coresight-etm-perf.h   |  1 +
> >  drivers/hwtracing/coresight/coresight-etm4x-core.c | 28 +++++++++++++++-------
> >  2 files changed, 20 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> > index 24d929428633..128f80bb1443 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> > +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> > @@ -7,6 +7,7 @@
> >  #ifndef _CORESIGHT_ETM_PERF_H
> >  #define _CORESIGHT_ETM_PERF_H
> >
> > +#include <linux/bits.h>
> >  #include <linux/percpu-defs.h>
> >  #include "coresight-priv.h"
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index c7bf73c8f2d7..0129b0502726 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -651,7 +651,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
> >   *  +--------------+
> >   *         |
> >   *  +------v-------+
> > - *  | Counter x    |   (reload to 1 on underflow)
> > + *  | Counter x    |   (reload to 2 ^ timestamp on underflow)
> >   *  +--------------+
> >   *         |
> >   *  +------v--------------+
> > @@ -662,11 +662,25 @@ static void etm4_enable_sysfs_smp_call(void *info)
> >   *  | Timestamp Generator  |  (timestamp on resource y)
> >   *  +----------------------+
> >   */
> > -static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
> > +static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
> > +                                      struct perf_event_attr *attr)

Should pass ts_level in here

> >  {
> >         int ctridx;
> >         int rselector;
> >         struct etmv4_config *config = &drvdata->config;
> > +       struct perf_event_attr max_timestamp = {
> > +               .ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
> > +       };
> > +
> > +       /* timestamp may be 0 if deprecated_timestamp is used, so make min 1 */
> > +       u8 ts_level = max(1, ATTR_CFG_GET_FLD(attr, timestamp));
> > +
>
> I could be missing something here - but if we have a perf command line:
>
> perf -e cs_etm/timestamp=0/
>
> is this bit not changing that to timestamp=1 regardless? The docs
> (patch 13) indicate timestamp=0 to be timestamps off.
>
> This command is used in test_arm_coresight.sh when testing the
> combination of options on the CS system.
>
> Mike
>
> > +       /*
> > +        * Disable counter generated timestamps when timestamp == MAX. Leave
> > +        * only SYNC timestamps.
> > +        */
> > +       if (ts_level == ATTR_CFG_GET_FLD(&max_timestamp, timestamp))
> > +               return 0;

All the attr manipulation logic should be where this function is
called not in here.

Mike

> >
> >         /* No point in trying if we don't have at least one counter */
> >         if (!drvdata->nr_cntr)
> > @@ -704,12 +718,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
> >                 return -ENOSPC;
> >         }
> >
> > -       /*
> > -        * Initialise original and reload counter value to the smallest
> > -        * possible value in order to get as much precision as we can.
> > -        */
> > -       config->cntr_val[ctridx] = 1;
> > -       config->cntrldvr[ctridx] = 1;
> > +       /* Initialise original and reload counter value. */
> > +       config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << (ts_level - 1);
> >
> >         /*
> >          * Trace Counter Control Register TRCCNTCTLRn
> > @@ -799,7 +809,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
> >                  * order to correlate instructions executed on different CPUs
> >                  * (CPU-wide trace scenarios).
> >                  */
> > -               ret = etm4_config_timestamp_event(drvdata);
> > +               ret = etm4_config_timestamp_event(drvdata, attr);
> >
> >                 /*
> >                  * No need to go further if timestamp intervals can't
> >
> > --
> > 2.34.1
> >
>
>
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

