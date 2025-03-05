Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D715BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 15:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiyY4Jfkws2+Yh7A+5Ni8F0WDul36wTv6mtXeiT3z1I=; b=RQFDCJNJ0GFWwYveRYksQuO9wC
	0HCTzO5WqeuasuzhcfKK/ITBNnB68/k/E2sGNdLufpb4E9PdQuJhxx+wnA0xeoh4xRBEaFOcQM1ru
	SoZLzTWRX1ALUJiLzrckETbsjTRM+ai4CWGZNNe5gC/GvC8uE0ie14ntWOINOmtUYlavBiRdfSSgO
	drW3KmVrpaBAoXl9SWz/tTQU2QXNqs31VUgcl7Hh9xSlQXiTzPfh6Jfzpac0UVLhVCP+SM74QhHqZ
	c5IMSYy2gH6i/JnaUHYgB9y+4cBDlkQETemIjawy24lFbylk/1khKRNVinxJ6vYiNqjOBlfrQFpr/
	v2nbKtgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqEc-00000008Rvd-2H5s;
	Wed, 05 Mar 2025 15:00:34 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqCr-00000008RdD-1cEn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 14:58:46 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2fe96dd93b4so1776532a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 06:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741186724; x=1741791524; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UiyY4Jfkws2+Yh7A+5Ni8F0WDul36wTv6mtXeiT3z1I=;
        b=izNRfd2xGa7TEO9WniYIDvw4M8QF0uonsqVbisfCeBhI0V1kWNVUVD4/9gXDWV+C7K
         1wjMrghBgBJ8STTZqqOdTSjDx0Yqh6Y2DqVTJYzENjIvcqlTT90oIn9hcKpf5CvC2km1
         SrB0uH8aLe++qyUy024jLrPvPKG2xyxZbn27Aiz6WnETY9cr6sVsNqpC9cCsqxEygQK+
         FEE31mpfYqabxoIsy25HU4mDs9iRDsLBAnrSiphG/Whf4FmWuqOOHdqYVZwaj1gElVdt
         N/+wclOh+2qTCqOcN+Xg+IfhFIPO3PkfED7ObLCQKebA9xA/rlIJWjnm9vb2I/SDvyH0
         6/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186724; x=1741791524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiyY4Jfkws2+Yh7A+5Ni8F0WDul36wTv6mtXeiT3z1I=;
        b=k01ooBfyqvLsfJ/vrwgNMdiwvapogz7Azu+OlB4Vz2sk0vWJbTkS73cXv+y19T9nZK
         o0DdZvpaucP47c25OkVbh2VU4emDb2kbu3OcBWJxWue4ByFykh6ROZvA6aCDSmCleYYQ
         x/rRPHLlBdwZ3lp11vwEusU7kNQMXO7wpHGvyT6lpG9gDwXL1y47SBwQuxqnoV5UPcbJ
         MMw4z9RT/kt+LcPMR28bNkInrN5yTeejtKM7Xp7KsAoR8N5yR7Ien//stHMXlalby/Qp
         CfL/qPpxDqUFJDRxiOK/FjR9oGQTQhg+idX61GDdoEKmhzd8QSxnxuUOtkiEyTKpW8Ko
         9alA==
X-Forwarded-Encrypted: i=1; AJvYcCX4jNQH8YEQ508bz4RLsALbN++It0WREA53FszjXsZmsKnd1u03Qtvi5F43B3qKT2E/KbMar8DwZJyCWQcA7E1R@lists.infradead.org
X-Gm-Message-State: AOJu0YyCLY66DOntD6NCWF6BwphIkvbvzdnRZYDYPsJb4lLG6t72TDSt
	AJZo9OgjHChrZXjERuo85pOj1g5WFSteczRCVodOkmHVtfXEgTJGuwq9TvLqS/RRVKsI5i0Z2Zb
	ZdiZRRQiiabcoKvr2NChxsWZgKzw2Xi/8olKQVA==
X-Gm-Gg: ASbGncs9zTwYKChdVN4JjF6ceO5FnkfBwI47n7wRF4U+TQwLNmXah+HJ0H9H+gn2qKI
	SFnDfUbNMqPCU68AhO3SneG4uwnq3KoDWkOFfTFLZb6IMWI3SOlsqa9gBflLedelt0LTqZ5qZYP
	38WwkgBOCjrdVkGC7O++lJgt2A4d+4BPfvYkVoxrR1gxisJxZrV5pK+1Xga5I=
X-Google-Smtp-Source: AGHT+IF1hnn2H/pxvEMc/EjcD/ghIoVxFnVVgaEyIEjvBPxjwsVke/s5RkBWrSAm+hl8gp4lko2BStWZK+UW1NMcAhI=
X-Received: by 2002:a05:6a00:2381:b0:736:4d05:2e35 with SMTP id
 d2e1a72fcca58-73681de7f50mr5223947b3a.3.1741186724113; Wed, 05 Mar 2025
 06:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-3-quic_jiegan@quicinc.com> <CAJ9a7VgGp4YqzN-yx0x+NiZG8now6SCmnimaou2Z=exYcoiegw@mail.gmail.com>
 <7fe6c345-85cf-4114-b419-f50d1a6cbef1@quicinc.com>
In-Reply-To: <7fe6c345-85cf-4114-b419-f50d1a6cbef1@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 5 Mar 2025 14:58:31 +0000
X-Gm-Features: AQ5f1JqatIExzGnuaYLCoDTpPZMObEF4Hoa_g5f0yvOuR5hw69A2z3IKabeu33g
Message-ID: <CAJ9a7Vhx293H6r6HGwVOQ46PDu+sQ8LPONvAbwAtxGFt0ad+Ww@mail.gmail.com>
Subject: Re: [PATCH v15 02/10] Coresight: Add trace_id function to retrieving
 the trace ID
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_065845_428235_0861E458 
X-CRM114-Status: GOOD (  30.29  )
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

Hi Jie

On Wed, 5 Mar 2025 at 13:27, Jie Gan <quic_jiegan@quicinc.com> wrote:
>
>
>
> On 3/5/2025 7:07 PM, Mike Leach wrote:
> > Hi,
> >
> > On Mon, 3 Mar 2025 at 03:30, Jie Gan <quic_jiegan@quicinc.com> wrote:
> >>
> >> Add 'trace_id' function pointer in coresight_ops. It's responsible for retrieving
> >> the device's trace ID.
> >>
> >> Co-developed-by: James Clark <james.clark@linaro.org>
> >> Signed-off-by: James Clark <james.clark@linaro.org>
> >> Reviewed-by: James Clark <james.clark@linaro.org>
> >> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> >> ---
> >>   drivers/hwtracing/coresight/coresight-core.c  | 30 +++++++++++++++++++
> >>   drivers/hwtracing/coresight/coresight-dummy.c | 13 +++++++-
> >>   .../coresight/coresight-etm3x-core.c          |  1 +
> >>   .../coresight/coresight-etm4x-core.c          |  1 +
> >>   drivers/hwtracing/coresight/coresight-stm.c   | 11 +++++++
> >>   drivers/hwtracing/coresight/coresight-tpda.c  | 11 +++++++
> >>   include/linux/coresight.h                     |  5 ++++
> >>   7 files changed, 71 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> >> index ab55e10d4b79..32aa07f4f8c1 100644
> >> --- a/drivers/hwtracing/coresight/coresight-core.c
> >> +++ b/drivers/hwtracing/coresight/coresight-core.c
> >> @@ -24,6 +24,7 @@
> >>   #include "coresight-etm-perf.h"
> >>   #include "coresight-priv.h"
> >>   #include "coresight-syscfg.h"
> >> +#include "coresight-trace-id.h"
> >>
> >>   /*
> >>    * Mutex used to lock all sysfs enable and disable actions and loading and
> >> @@ -1557,6 +1558,35 @@ void coresight_remove_driver(struct amba_driver *amba_drv,
> >>   }
> >>   EXPORT_SYMBOL_GPL(coresight_remove_driver);
> >>
> >> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
> >> +                              struct coresight_device *sink)
> >> +{
> >> +       int trace_id;
> >> +       int cpu = source_ops(csdev)->cpu_id(csdev);
> >> +
> >
> > This is a global funciton so need to check that this csdev is a
> > source,. and does provide a cpu  function before calling it.
> >
>
> Hi Mike,
>
> I put this function here because it's required by etm3x and etm4x. It's
> intended to be called only by ETM devices, which are definitely source
> devices and have a cpu function.
>

I fully understand the intent, but for a function that can be accessed
from anywhere, it is safer to validate input rather than assume any
caller will always respect the input conditions.
Lots of other places in the coresight drivers check that these
functions exist before calling them.

Regards

Mike

> Jie
>
> >> +       switch (mode) {
> >> +       case CS_MODE_SYSFS:
> >> +               trace_id = coresight_trace_id_get_cpu_id(cpu);
> >> +               break;
> >> +       case CS_MODE_PERF:
> >> +               if (WARN_ON(!sink))
> >> +                       return -EINVAL;
> >> +
> >> +               trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
> >> +               break;
> >> +       default:
> >> +               trace_id = -EINVAL;
> >> +               break;
> >> +       }
> >> +
> >> +       if (!IS_VALID_CS_TRACE_ID(trace_id))
> >> +               dev_err(&csdev->dev,
> >> +                       "Failed to allocate trace ID on CPU%d\n", cpu);
> >> +
> >> +       return trace_id;
> >> +}
> >> +EXPORT_SYMBOL_GPL(coresight_etm_get_trace_id);
> >> +
> >>   MODULE_LICENSE("GPL v2");
> >>   MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
> >>   MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
> >> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
> >> index 9be53be8964b..b5692ba358c1 100644
> >> --- a/drivers/hwtracing/coresight/coresight-dummy.c
> >> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
> >> @@ -41,6 +41,16 @@ static void dummy_source_disable(struct coresight_device *csdev,
> >>          dev_dbg(csdev->dev.parent, "Dummy source disabled\n");
> >>   }
> >>
> >> +static int dummy_source_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> >> +                                __maybe_unused struct coresight_device *sink)
> >> +{
> >> +       struct dummy_drvdata *drvdata;
> >> +
> >> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> >> +
> >> +       return drvdata->traceid;
> >> +}
> >> +
> >>   static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
> >>                                  void *data)
> >>   {
> >> @@ -62,7 +72,8 @@ static const struct coresight_ops_source dummy_source_ops = {
> >>   };
> >>
> >>   static const struct coresight_ops dummy_source_cs_ops = {
> >> -       .source_ops = &dummy_source_ops,
> >> +       .trace_id       = dummy_source_trace_id,
> >> +       .source_ops     = &dummy_source_ops,
> >>   };
> >>
> >>   static const struct coresight_ops_sink dummy_sink_ops = {
> >> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> >> index c103f4c70f5d..c1dda4bc4a2f 100644
> >> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> >> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> >> @@ -704,6 +704,7 @@ static const struct coresight_ops_source etm_source_ops = {
> >>   };
> >>
> >>   static const struct coresight_ops etm_cs_ops = {
> >> +       .trace_id       = coresight_etm_get_trace_id,
> >>          .source_ops     = &etm_source_ops,
> >>   };
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> >> index 2c1a60577728..cfd116b87460 100644
> >> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> >> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> >> @@ -1067,6 +1067,7 @@ static const struct coresight_ops_source etm4_source_ops = {
> >>   };
> >>
> >>   static const struct coresight_ops etm4_cs_ops = {
> >> +       .trace_id       = coresight_etm_get_trace_id,
> >>          .source_ops     = &etm4_source_ops,
> >>   };
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> >> index b581a30a1cd9..aca25b5e3be2 100644
> >> --- a/drivers/hwtracing/coresight/coresight-stm.c
> >> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> >> @@ -281,12 +281,23 @@ static void stm_disable(struct coresight_device *csdev,
> >>          }
> >>   }
> >>
> >> +static int stm_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> >> +                       __maybe_unused struct coresight_device *sink)
> >> +{
> >> +       struct stm_drvdata *drvdata;
> >> +
> >> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> >> +
> >> +       return drvdata->traceid;
> >> +}
> >> +
> >>   static const struct coresight_ops_source stm_source_ops = {
> >>          .enable         = stm_enable,
> >>          .disable        = stm_disable,
> >>   };
> >>
> >>   static const struct coresight_ops stm_cs_ops = {
> >> +       .trace_id       = stm_trace_id,
> >>          .source_ops     = &stm_source_ops,
> >>   };
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> >> index 573da8427428..94c2201fc8d3 100644
> >> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> >> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> >> @@ -241,12 +241,23 @@ static void tpda_disable(struct coresight_device *csdev,
> >>          dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
> >>   }
> >>
> >> +static int tpda_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> >> +                        __maybe_unused struct coresight_device *sink)
> >> +{
> >> +       struct tpda_drvdata *drvdata;
> >> +
> >> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> >> +
> >> +       return drvdata->atid;
> >> +}
> >> +
> >>   static const struct coresight_ops_link tpda_link_ops = {
> >>          .enable         = tpda_enable,
> >>          .disable        = tpda_disable,
> >>   };
> >>
> >>   static const struct coresight_ops tpda_cs_ops = {
> >> +       .trace_id       = tpda_trace_id,
> >>          .link_ops       = &tpda_link_ops,
> >>   };
> >>
> >> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> >> index c7cd5886c908..ce9a5e71b261 100644
> >> --- a/include/linux/coresight.h
> >> +++ b/include/linux/coresight.h
> >> @@ -335,6 +335,7 @@ enum cs_mode {
> >>          CS_MODE_PERF,
> >>   };
> >>
> >> +#define coresight_ops(csdev)   csdev->ops
> >>   #define source_ops(csdev)      csdev->ops->source_ops
> >>   #define sink_ops(csdev)                csdev->ops->sink_ops
> >>   #define link_ops(csdev)                csdev->ops->link_ops
> >> @@ -421,6 +422,8 @@ struct coresight_ops_panic {
> >>   };
> >>
> >>   struct coresight_ops {
> >> +       int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
> >> +                       struct coresight_device *sink);
> >>          const struct coresight_ops_sink *sink_ops;
> >>          const struct coresight_ops_link *link_ops;
> >>          const struct coresight_ops_source *source_ops;
> >> @@ -709,4 +712,6 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
> >>
> >>   void coresight_remove_driver(struct amba_driver *amba_drv,
> >>                               struct platform_driver *pdev_drv);
> >> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
> >> +                              struct coresight_device *sink);
> >>   #endif         /* _LINUX_COREISGHT_H */
> >> --
> >> 2.34.1
> >>
> >
> >
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

