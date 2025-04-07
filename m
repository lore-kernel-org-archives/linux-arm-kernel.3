Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27CDC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNy53/ZwTHSLz+zRzyZ238Lusm7CUXwB7x08xN1b9bw=; b=cCl9RaYEwG3wrR7tJHVEAU1btx
	+8PpGTi4HI84tYRHIEgKdnEzoz9lU6VZI/hmK248kxrNGSRAjXEGkRMDZH+taMxcedEFT1hDJMp08
	cYIOzym90ofmieLdFu9AdY8+fi7hZmJZ5XJ+jabebOvaaup7OfmbTkYzvTkqP2mS43UUzw2bVt1e3
	QSY7yd891S7lKb22v8Tex6jNvK2KBtyLUA0GUUf+8+gABxAn7Rh/6Ae7ph8+rIrtbfIdXR0YBU/PV
	Ds33700fRe2FYekRKM+s4eW5w/lYoWwBqlhfzba4iXuqrZtHjlXCXP0R+DjMIdjP83OONkISS4uMW
	F2AUMZQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pZ2-00000001FtM-3woD;
	Mon, 07 Apr 2025 16:43:12 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oh2-000000010fd-0UsL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 15:47:25 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so3577424b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 08:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744040843; x=1744645643; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bNy53/ZwTHSLz+zRzyZ238Lusm7CUXwB7x08xN1b9bw=;
        b=yGCSvdGgKd9Rlxm16aqJ4Oo79GCSn/XR7qCR3w2r1aCfjq7sxhs8m5+RxsKTeX11kP
         QVv+CeO1F7hJpdhMTRs4ijgGjpucNcitCn1SajiJAM+ekjzfvWQHOOU9LviQ1AG7uhIH
         OC7WBJIwi/i1IQfD8dQPvtiWkqCiycA3pBGeTHcAkmCSSKGPNCtj+mdANrOr7wAn7KmN
         Hg0CuW10XMg7T8MRIj4IBhzS/h3sp4B8/aeznrxTvDVnYZr2VxH+XbcthyoDp4YSDOZ+
         a9pHLu8DzHFq0zKndIxXRoU2uUleVxtE8989BZBxHEFEmN05ZIwspPZGoQTatM0HZvUV
         hy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744040843; x=1744645643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNy53/ZwTHSLz+zRzyZ238Lusm7CUXwB7x08xN1b9bw=;
        b=GzX/xbprpzeveISUrze4M5u9sOO0RPFbmSEzClh+T4ooE4RJAoUzZvd/6l2JNxgpxp
         I9DiVozFjtAHE7qoQG6McvybxmPjbnZiKDTzQh58KK4HD+tXvCpKjcjLJs6kxboZLFUw
         naHIZmpFBAcUheeQOV1xggCkrsc1WQ/fAyjSjcvAzj4DxutUwQxLd2Biq/qpa4EX/Bxl
         CZFHOENW/VwPUGhizKRVX5r0dB9cx4DtyPUtcmfvz7dABGOtUc640Me66NbWuGgPKE9B
         TvslrpUadO/Dyd8KkKBVvMJZAuyNlcK5+uxHaJj321WSngvdg/FYXAUkYhLE4FvL0n1Y
         jqzw==
X-Forwarded-Encrypted: i=1; AJvYcCVQeFWZgyKTodOYKvB3o7Vj+nSSvU2/mE5kybU5q99mVu7shSO4/3nPlhB1vxQzTwZLWedcsnwS2VAxkgxD+cZ7@lists.infradead.org
X-Gm-Message-State: AOJu0YzQsdSfdTE1P91+IVOZDOZ+iGx9OqPttpFZsD9U9sumalSL9ui0
	e6474xmgH5cnHrxOZjRo36o79ufvxgq0NvRqk0+qqc4WzbLdJ9Y8uzZHj6sX40+SFdgUD48WhYE
	TigtiesuAikUJSGdqRwRpTnUGjo6QJeeTVTvHxQ==
X-Gm-Gg: ASbGnctUrZ9jwWEDi2WTiLGZ5NDYOrebvKd0fBOKpkE+melJYF2E8p3jOKbraoIve8Q
	HnVavMrrcrjGrYUMIdxdIOpW59wrvbMOeX1Hx9hDGRe2ERk1gpP6FUN88qV/jx3h08wUqNpGnYG
	W6tDqbDSrwC6jOjGFUNFkLMCuHHCNhr2RwJs4ErSebM173zassQi64/vzRgZM=
X-Google-Smtp-Source: AGHT+IFsF8BZ9rpj3D/vrDRwMv4ljfHYt9ZuYNYZ7VfoyGlYWpvoDHXT8dp74ZQrtLPbP7l//cYdzSnBUvRETkNj0IE=
X-Received: by 2002:a05:6a00:4603:b0:736:5dae:6b0d with SMTP id
 d2e1a72fcca58-73b6aa44d71mr11392059b3a.10.1744040842652; Mon, 07 Apr 2025
 08:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com> <20250226-trace-noc-driver-v2-2-8afc6584afc5@quicinc.com>
In-Reply-To: <20250226-trace-noc-driver-v2-2-8afc6584afc5@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 7 Apr 2025 16:47:11 +0100
X-Gm-Features: ATxdqUGwptWmWGuTEMFywAJMbM58Cdy5rm8GMkf77_zrs0cIkHqC_ImQSl0RKT0
Message-ID: <CAJ9a7Vhkp2xBZmjGO9iqCVkJJAt2+Dh+QkRH-BaCMUZ=6G+t4g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] coresight: add coresight Trace NOC driver
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com, 
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, kernel@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_084724_167815_08D59505 
X-CRM114-Status: GOOD (  36.94  )
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

On Wed, 26 Feb 2025 at 11:06, Yuanfang Zhang <quic_yuanfang@quicinc.com> wrote:
>
> Add driver to support Coresight device Trace NOC(Network On Chip).
> Trace NOC is an integration hierarchy which is a replacement of
> Dragonlink configuration. It brings together debug components like
> TPDA, funnel and interconnect Trace Noc.
>
> It sits in the different subsystem of SOC and aggregates the trace
> and transports to QDSS trace bus.
>
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  drivers/hwtracing/coresight/Kconfig          |  13 ++
>  drivers/hwtracing/coresight/Makefile         |   1 +
>  drivers/hwtracing/coresight/coresight-tnoc.c | 190 +++++++++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tnoc.h |  53 ++++++++
>  4 files changed, 257 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index 06f0a7594169c5f03ca5f893b7debd294587de78..6cfd160f09d383ab5f5aa276fa57496a52c8f961 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -247,4 +247,17 @@ config CORESIGHT_DUMMY
>
>           To compile this driver as a module, choose M here: the module will be
>           called coresight-dummy.
> +
> +config CORESIGHT_TNOC
> +       tristate "Coresight Trace Noc driver"
> +       help
> +         This driver provides support for Trace NoC component.
> +         Trace NoC is a interconnect that is used to collect trace from
> +         various subsystems and transport it QDSS trace sink.It sits in
> +         the different tiles of SOC and aggregates the trace local to the
> +         tile and transports it another tile or to QDSS trace sink eventually.
> +
> +         To compile this driver as a module, choose M here: the module will be
> +         called coresight-tnoc.
> +
>  endif
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 4ba478211b318ea5305f9f98dda40a041759f09f..60b729979f19c8f8848c77c290605132dba1a991 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_CORESIGHT_SINK_TPIU) += coresight-tpiu.o
>  obj-$(CONFIG_CORESIGHT_SINK_ETBV10) += coresight-etb10.o
>  obj-$(CONFIG_CORESIGHT_LINKS_AND_SINKS) += coresight-funnel.o \
>                                            coresight-replicator.o
> +obj-$(CONFIG_CORESIGHT_TNOC) += coresight-tnoc.o
>  obj-$(CONFIG_CORESIGHT_SOURCE_ETM3X) += coresight-etm3x.o
>  coresight-etm3x-y := coresight-etm3x-core.o coresight-etm-cp14.o \
>                      coresight-etm3x-sysfs.o
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..fad8e61f05ef25989aba1be342c547f835e8953a
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <linux/amba/bus.h>
> +#include <linux/io.h>
> +#include <linux/coresight.h>
> +#include <linux/of.h>
> +
> +#include "coresight-priv.h"
> +#include "coresight-tnoc.h"
> +#include "coresight-trace-id.h"
> +
> +static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
> +{
> +       u32 val;
> +
> +       /* Set ATID */
> +       writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
> +
> +       /* Config sync CR */
> +       writel_relaxed(0xffff, drvdata->base + TRACE_NOC_SYNCR);
> +
> +       /* Set frequency value */
> +       writel_relaxed(drvdata->freq_req_val, drvdata->base + TRACE_NOC_FREQVAL);
> +
> +       /* Set Ctrl register */
> +       val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
> +
> +       if (drvdata->flag_type == FLAG_TS)
> +               val = val | TRACE_NOC_CTRL_FLAGTYPE;
> +       else
> +               val = val & ~TRACE_NOC_CTRL_FLAGTYPE;
> +
> +       if (drvdata->freq_type == FREQ_TS)
> +               val = val | TRACE_NOC_CTRL_FREQTYPE;
> +       else
> +               val = val & ~TRACE_NOC_CTRL_FREQTYPE;
> +
> +       val = val | TRACE_NOC_CTRL_PORTEN;
> +       writel_relaxed(val, drvdata->base + TRACE_NOC_CTRL);
> +
> +       dev_dbg(drvdata->dev, "Trace NOC is enabled\n");
> +}
> +
> +static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
> +                           struct coresight_connection *outport)
> +{
> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       spin_lock(&drvdata->spinlock);
> +       if (csdev->refcnt == 0)
> +               trace_noc_enable_hw(drvdata);
> +
> +       csdev->refcnt++;
> +       spin_unlock(&drvdata->spinlock);
> +
> +       return 0;
> +}
> +
> +static void trace_noc_disable_hw(struct trace_noc_drvdata *drvdata)
> +{
> +       writel_relaxed(0x0, drvdata->base + TRACE_NOC_CTRL);
> +       dev_dbg(drvdata->dev, "Trace NOC is disabled\n");
> +}
> +
> +static void trace_noc_disable(struct coresight_device *csdev, struct coresight_connection *inport,
> +                             struct coresight_connection *outport)
> +{
> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       spin_lock(&drvdata->spinlock);
> +       if (--csdev->refcnt == 0)
> +               trace_noc_disable_hw(drvdata);
> +
> +       spin_unlock(&drvdata->spinlock);
> +       dev_info(drvdata->dev, "Trace NOC is disabled\n");
> +}
> +
> +static const struct coresight_ops_link trace_noc_link_ops = {
> +       .enable         = trace_noc_enable,
> +       .disable        = trace_noc_disable,
> +};
> +
> +static const struct coresight_ops trace_noc_cs_ops = {
> +       .link_ops       = &trace_noc_link_ops,
> +};
> +
> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
> +{
> +       int atid;
> +
> +       atid = coresight_trace_id_get_system_id();
> +       if (atid < 0)
> +               return atid;
> +
> +       drvdata->atid = atid;
> +
> +       drvdata->freq_type = FREQ_TS;
> +       drvdata->flag_type = FLAG;
> +       drvdata->freq_req_val = 0;
> +
> +       return 0;
> +}
> +
> +static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +       struct device *dev = &adev->dev;
> +       struct coresight_platform_data *pdata;
> +       struct trace_noc_drvdata *drvdata;
> +       struct coresight_desc desc = { 0 };
> +       int ret;
> +
> +       desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
> +       if (!desc.name)
> +               return -ENOMEM;
> +       pdata = coresight_get_platform_data(dev);
> +       if (IS_ERR(pdata))
> +               return PTR_ERR(pdata);
> +       adev->dev.platform_data = pdata;
> +
> +       drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +       if (!drvdata)
> +               return -ENOMEM;
> +
> +       drvdata->dev = &adev->dev;
> +       dev_set_drvdata(dev, drvdata);
> +
> +       drvdata->base = devm_ioremap_resource(dev, &adev->res);
> +       if (!drvdata->base)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&drvdata->spinlock);
> +
> +       ret = trace_noc_init_default_data(drvdata);
> +       if (ret)
> +               return ret;
> +
> +       desc.ops = &trace_noc_cs_ops;
> +       desc.type = CORESIGHT_DEV_TYPE_LINK;
> +       desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
> +       desc.pdata = adev->dev.platform_data;
> +       desc.dev = &adev->dev;
> +       desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
> +       drvdata->csdev = coresight_register(&desc);
> +       if (IS_ERR(drvdata->csdev))
> +               return PTR_ERR(drvdata->csdev);
> +
> +       pm_runtime_put(&adev->dev);
> +
> +       return 0;
> +}
> +
> +static void trace_noc_remove(struct amba_device *adev)
> +{
> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
> +
> +       coresight_trace_id_put_system_id(drvdata->atid);
> +       coresight_unregister(drvdata->csdev);
> +}
> +
> +static struct amba_id trace_noc_ids[] = {
> +       {
> +               .id     = 0x000f0c00,
> +               .mask   = 0x000fff00,
> +       },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(amba, trace_noc_ids);
> +
> +static struct amba_driver trace_noc_driver = {
> +       .drv = {
> +               .name   = "coresight-trace-noc",
> +               .owner  = THIS_MODULE,
> +               .suppress_bind_attrs = true,
> +       },
> +       .probe          = trace_noc_probe,
> +       .remove         = trace_noc_remove,
> +       .id_table       = trace_noc_ids,
> +};
> +
> +module_amba_driver(trace_noc_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Trace NOC driver");
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.h b/drivers/hwtracing/coresight/coresight-tnoc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..b6bd1ef659897d8e0994c5e8514e8cbdd16eebd8
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#define TRACE_NOC_CTRL 0x008
> +#define TRACE_NOC_XLD  0x010
> +#define TRACE_NOC_FREQVAL      0x018
> +#define TRACE_NOC_SYNCR        0x020
> +
> +/* Enable generation of output ATB traffic.*/



> +#define TRACE_NOC_CTRL_PORTEN  BIT(0)
> +/* Writing 1 to issue a FREQ or FREQ_TS packet*/
> +#define TRACE_NOC_CTRL_FREQTSREQ       BIT(5)
> +/* Sets the type of issued ATB FLAG packets. 0: 'FLAG' packets; 1: 'FLAG_TS' packets.*/
> +#define TRACE_NOC_CTRL_FLAGTYPE                BIT(7)
> +/* sets the type of issued ATB FREQ packets. 0: 'FREQ' packets; 1: 'FREQ_TS' packets.*/
> +#define TRACE_NOC_CTRL_FREQTYPE                BIT(8)
> +DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");

Coresight links do not generate their own packets - please explain
what these are.

As far as I am aware, frequency and flag packets are not part of the
ATB specification.

If the output bus for this device is not in fact an ATB bus, then it
should not be referred to as such.

Thanks and regards

 Mike

> +
> +/**
> + * struct trace_noc_drvdata - specifics associated to a trace noc component
> + * @base:      memory mapped base address for this component.
> + * @dev:       device node for trace_noc_drvdata.
> + * @csdev:     component vitals needed by the framework.
> + * @spinlock:  only one at a time pls.
> + * @atid:      id for the trace packet.
> + * @freqtype:  0: 'FREQ' packets; 1: 'FREQ_TS' packets.
> + * @flagtype:  0: 'FLAG' packets; 1: 'FLAG_TS' packets.
> + * @freq_req_val:       set frequency values carried by 'FREQ' and 'FREQ_TS' packets.
> + */
> +struct trace_noc_drvdata {
> +       void __iomem            *base;
> +       struct device           *dev;
> +       struct coresight_device *csdev;
> +       spinlock_t              spinlock; /* lock for the drvdata. */
> +       u32                     atid;
> +       u32                     freq_type;
> +       u32                     flag_type;
> +       u32                     freq_req_val;
> +};
> +
> +/* freq type */
> +enum freq_type {
> +       FREQ,
> +       FREQ_TS,
> +};
> +
> +/* flag type */
> +enum flag_type {
> +       FLAG,
> +       FLAG_TS,
> +};
>
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

