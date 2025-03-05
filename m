Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ADEC28B25
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8Cx5fHR+4jmiXuXaT5oD7FRlDS4S8GZIWX7AhsEi0w=; b=wYyKLPHC2a1ku/EUKGFFPvFvKj
	hq6T8wx6HfgVAL6xQad/6vNb1XRlSgUriaYb2UZEpqSupdbPdgm07a9gPLbyIB1/fpwJtxWKK26Y5
	YSaDsDjTbVSnc/KbxLHyQ1yk5M6RnQKxfINPl/fo8v1xz2H2zPctwlfzNoKA7vPmT5X0C8XOw7opg
	DgnmGsamkImDoJQTU3ZylXtDFhCzO6g6EucoecEtVqN2lgCZ9Vwe02wp/5XZ4TfZEHm76VZTi/SBG
	IakcscdmLquxPxACN9N8b0zjViK5UN6i1BgybHxBb2QvQfLhNSBeSmf3oBVKLCLy86QrYUpIg/Pmo
	DMDvyAzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoPV-000000086lO-2vvv;
	Wed, 05 Mar 2025 13:03:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmbZ-00000007ntp-3NZp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 11:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=h8Cx5fHR+4jmiXuXaT5oD7FRlDS4S8GZIWX7AhsEi0w=; b=M4VFu9uu/J3B7+VzcWQNM5undT
	TcHlSp3xknjbBJOegGQfVrKjMVsm348HJCCH7hfZmhnhBYTocaG2uYobuDxOdJ7zZYWaHKIwesE6Z
	7+PxRMnRAFykYkda1cvCv6bOTz7COb12ns9Dfs0QQ+GNdrYG6E6tuLv53sUGG+i84Qnt5VXv71gUA
	FAgCc/lAg0YlYOYH4r4JGa0wd9IGav+7Ci6ao4VaOrp4irpe3mdzGquPwAYdjb7fdvaSUMeVhrDbR
	R1+4uE+aBH0ExjJAhv0VMqXqddeAcNa9JmFawrlLJhuT06FwE+LJ5OuXH6eR9beLYAJXRefl9fTmA
	tAe3/ilA==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmbW-00000000UKr-46BY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 11:08:00 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22374f56453so125374325ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 03:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741172876; x=1741777676; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h8Cx5fHR+4jmiXuXaT5oD7FRlDS4S8GZIWX7AhsEi0w=;
        b=ZVkkDIFxxjIf4WJZtid4EK9fAuT9QJbtNq7h/JU0h36kT8ZCkLHiHWhr7Az0kDWdlY
         A80L5DEUollSiN+7rMlNKVQHvX7VWIAiBceoDzgA0NgFozgmGj4u53kPeiXnc+8YAD+E
         tN81Ej0pqPFy8dWBy3sa+T+30OQGFDUZyZ+qNEDKX5i1z5GNi1hg83USLjTUpapvtVR2
         g/ysLYjpHJRipTkoszr7ir9ZIPBAsUKiIt3oTkFJHLb5GEqlqqE2QqKdFkeXLHUIETv5
         lISxpk2egzjDrR2z9RDs3tQW/ADRhArToUPzYXzj7m54qmrDGCtXyr9OiliHLaOta+0p
         bdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741172876; x=1741777676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8Cx5fHR+4jmiXuXaT5oD7FRlDS4S8GZIWX7AhsEi0w=;
        b=dMJx9rRxzC7Mr4zDlLcz8zjo57Tc16Nq+8/yUX+WwA6ZJTi4DJXKp00Cpvw9vNvQ27
         kqNJE+aQWIXcLYP2+qYynRlQvt/c9Da3MwOv1xgRS93fy1zuDx9ScP6UElswyxoRL0n/
         5j1B5mWHpwjh+gtR+N1FDftgXe9bxzZCmloX7vZLLgZpfdH9pBXi85UTgC10tM4+Fcke
         pjw4iaX+w/o8j2WWHA1hvrc7mRu5CjVc6co2obP2ZE99jVrZdynusjVTGA7EFcOsuqeq
         ZjwsvbQHkedqRbY7ciTLdCCYW0o0069I755lLEAGI2DCrI5ngkp/h/o+e55PEimITbB3
         L7+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXReyd5kKk/+81uW+37HLwCZYrLgQgHd2ChZlurqzbvw4C8L6PdVBaBVOXJkcBC//iWB4QXAgO/VP2nKr+exf4G@lists.infradead.org
X-Gm-Message-State: AOJu0YyP3TivvMCVXsgJEVUbT28z8wpIbk8z6qNz/NMNAuW2peXAc6Sf
	xlk8bSN/d7UDBBV94ImAgads6BRnjvHmp3TQX36W3cvp3kg3ntL6q6gxR8Vpw5f3p04tagQbNN1
	0F9lW37xsQ8cBMN/URRLIc3JcHL4eeeIiFL+Qlg==
X-Gm-Gg: ASbGncsR0kuY6T+AwJlFlfgTZk8kj++D3ZlLigUJu/t5yhRXVt7HiHrWbNlEGqz/aJX
	VEX/wY42s5J4IGaihFaSFBQShVX31fZVJEZoninXq5kE3r5ol69zjwd7ql73UIAuybJWxyCcq2s
	lSxZ1tAue8bZrnVPbNdKglBGt40fMiZklkOVLMf8Sf6ZttLvEviB+MYOGuLT4=
X-Google-Smtp-Source: AGHT+IGeHajtM6a8RKzvxRCPhC7Gav1e5qdV7p0kvwl/9Chh9iSgselzALrtnrWd7JtUMEd3C1yGOLe31+tUVRNx8X0=
X-Received: by 2002:a05:6a00:3d4a:b0:736:4b08:cc0e with SMTP id
 d2e1a72fcca58-73682c53721mr3253307b3a.17.1741172875711; Wed, 05 Mar 2025
 03:07:55 -0800 (PST)
MIME-Version: 1.0
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com> <20250303032931.2500935-3-quic_jiegan@quicinc.com>
In-Reply-To: <20250303032931.2500935-3-quic_jiegan@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 5 Mar 2025 11:07:43 +0000
X-Gm-Features: AQ5f1Jotwj7vHwxJWb6wdXEyjYphyVf5Uwhw-vghsgB9wb3Lu4bYOf2iNdASjeU
Message-ID: <CAJ9a7VgGp4YqzN-yx0x+NiZG8now6SCmnimaou2Z=exYcoiegw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250305_110759_130087_5971E2E4 
X-CRM114-Status: GOOD (  23.58  )
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

On Mon, 3 Mar 2025 at 03:30, Jie Gan <quic_jiegan@quicinc.com> wrote:
>
> Add 'trace_id' function pointer in coresight_ops. It's responsible for retrieving
> the device's trace ID.
>
> Co-developed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: James Clark <james.clark@linaro.org>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c  | 30 +++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-dummy.c | 13 +++++++-
>  .../coresight/coresight-etm3x-core.c          |  1 +
>  .../coresight/coresight-etm4x-core.c          |  1 +
>  drivers/hwtracing/coresight/coresight-stm.c   | 11 +++++++
>  drivers/hwtracing/coresight/coresight-tpda.c  | 11 +++++++
>  include/linux/coresight.h                     |  5 ++++
>  7 files changed, 71 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index ab55e10d4b79..32aa07f4f8c1 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -24,6 +24,7 @@
>  #include "coresight-etm-perf.h"
>  #include "coresight-priv.h"
>  #include "coresight-syscfg.h"
> +#include "coresight-trace-id.h"
>
>  /*
>   * Mutex used to lock all sysfs enable and disable actions and loading and
> @@ -1557,6 +1558,35 @@ void coresight_remove_driver(struct amba_driver *amba_drv,
>  }
>  EXPORT_SYMBOL_GPL(coresight_remove_driver);
>
> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
> +                              struct coresight_device *sink)
> +{
> +       int trace_id;
> +       int cpu = source_ops(csdev)->cpu_id(csdev);
> +

This is a global funciton so need to check that this csdev is a
source,. and does provide a cpu  function before calling it.

> +       switch (mode) {
> +       case CS_MODE_SYSFS:
> +               trace_id = coresight_trace_id_get_cpu_id(cpu);
> +               break;
> +       case CS_MODE_PERF:
> +               if (WARN_ON(!sink))
> +                       return -EINVAL;
> +
> +               trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
> +               break;
> +       default:
> +               trace_id = -EINVAL;
> +               break;
> +       }
> +
> +       if (!IS_VALID_CS_TRACE_ID(trace_id))
> +               dev_err(&csdev->dev,
> +                       "Failed to allocate trace ID on CPU%d\n", cpu);
> +
> +       return trace_id;
> +}
> +EXPORT_SYMBOL_GPL(coresight_etm_get_trace_id);
> +
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
>  MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
> index 9be53be8964b..b5692ba358c1 100644
> --- a/drivers/hwtracing/coresight/coresight-dummy.c
> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
> @@ -41,6 +41,16 @@ static void dummy_source_disable(struct coresight_device *csdev,
>         dev_dbg(csdev->dev.parent, "Dummy source disabled\n");
>  }
>
> +static int dummy_source_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> +                                __maybe_unused struct coresight_device *sink)
> +{
> +       struct dummy_drvdata *drvdata;
> +
> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       return drvdata->traceid;
> +}
> +
>  static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
>                                 void *data)
>  {
> @@ -62,7 +72,8 @@ static const struct coresight_ops_source dummy_source_ops = {
>  };
>
>  static const struct coresight_ops dummy_source_cs_ops = {
> -       .source_ops = &dummy_source_ops,
> +       .trace_id       = dummy_source_trace_id,
> +       .source_ops     = &dummy_source_ops,
>  };
>
>  static const struct coresight_ops_sink dummy_sink_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index c103f4c70f5d..c1dda4bc4a2f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -704,6 +704,7 @@ static const struct coresight_ops_source etm_source_ops = {
>  };
>
>  static const struct coresight_ops etm_cs_ops = {
> +       .trace_id       = coresight_etm_get_trace_id,
>         .source_ops     = &etm_source_ops,
>  };
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2c1a60577728..cfd116b87460 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1067,6 +1067,7 @@ static const struct coresight_ops_source etm4_source_ops = {
>  };
>
>  static const struct coresight_ops etm4_cs_ops = {
> +       .trace_id       = coresight_etm_get_trace_id,
>         .source_ops     = &etm4_source_ops,
>  };
>
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index b581a30a1cd9..aca25b5e3be2 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -281,12 +281,23 @@ static void stm_disable(struct coresight_device *csdev,
>         }
>  }
>
> +static int stm_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> +                       __maybe_unused struct coresight_device *sink)
> +{
> +       struct stm_drvdata *drvdata;
> +
> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       return drvdata->traceid;
> +}
> +
>  static const struct coresight_ops_source stm_source_ops = {
>         .enable         = stm_enable,
>         .disable        = stm_disable,
>  };
>
>  static const struct coresight_ops stm_cs_ops = {
> +       .trace_id       = stm_trace_id,
>         .source_ops     = &stm_source_ops,
>  };
>
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 573da8427428..94c2201fc8d3 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -241,12 +241,23 @@ static void tpda_disable(struct coresight_device *csdev,
>         dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
>  }
>
> +static int tpda_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> +                        __maybe_unused struct coresight_device *sink)
> +{
> +       struct tpda_drvdata *drvdata;
> +
> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       return drvdata->atid;
> +}
> +
>  static const struct coresight_ops_link tpda_link_ops = {
>         .enable         = tpda_enable,
>         .disable        = tpda_disable,
>  };
>
>  static const struct coresight_ops tpda_cs_ops = {
> +       .trace_id       = tpda_trace_id,
>         .link_ops       = &tpda_link_ops,
>  };
>
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index c7cd5886c908..ce9a5e71b261 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -335,6 +335,7 @@ enum cs_mode {
>         CS_MODE_PERF,
>  };
>
> +#define coresight_ops(csdev)   csdev->ops
>  #define source_ops(csdev)      csdev->ops->source_ops
>  #define sink_ops(csdev)                csdev->ops->sink_ops
>  #define link_ops(csdev)                csdev->ops->link_ops
> @@ -421,6 +422,8 @@ struct coresight_ops_panic {
>  };
>
>  struct coresight_ops {
> +       int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
> +                       struct coresight_device *sink);
>         const struct coresight_ops_sink *sink_ops;
>         const struct coresight_ops_link *link_ops;
>         const struct coresight_ops_source *source_ops;
> @@ -709,4 +712,6 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
>
>  void coresight_remove_driver(struct amba_driver *amba_drv,
>                              struct platform_driver *pdev_drv);
> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
> +                              struct coresight_device *sink);
>  #endif         /* _LINUX_COREISGHT_H */
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

