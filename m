Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB79C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 14:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kavBJrWMoEXOlmfl1NFVvnCa8WpRzs2d/kXFVbejgNU=; b=vXWrvPNLGG1zeGuVjbc4loJush
	rKQruWvZhv42L/9U1NvR4m+C4BaFnwhxf1/mKB/79vJPkrN6H4dHQf+HZEU6t36dkKiKeklMQvchE
	ab8k5We6tKxwjDTC1B8zQh3swO2YcUL/kI2WBVOLHEc/HTDjsTu9lEM8XQ3C5jPj7hjay+LBMFhyx
	qelYtozOHzx1ps9JBniJNxfWetflwRKYP6K0TgcFsT0XJ77li4PR2x8ydj0GPiRmZJalOcVPBhZhZ
	x1WykoIJnX9eQhjlHriewmloDXmOnvXuR/7JIcR+TQA6Szq3YD3+JvN/UK5jnI0bIfEWgVQIDmKgS
	MYHH81gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEmq-0000000F1q3-2DVw;
	Fri, 11 Jul 2025 14:31:40 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEjq-0000000F1cK-0O1e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 14:28:35 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso1872164b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752244113; x=1752848913; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kavBJrWMoEXOlmfl1NFVvnCa8WpRzs2d/kXFVbejgNU=;
        b=JTuhy8LFzWjF7dXNhqrYRpTERRRGzjlHBQNQfTmtj+pYjjjPWC5lCUKo2Jn7fE6IMm
         WhCoj7OmfxiQxYoTysMZ62y+L6T7vUElElALKf0mJuf2TTUQSRKfyFrUo1nxG8B82bL9
         8NJKjpYIxcwQZRvYmgHLBAZLInX5pcJI9jYKARcE9OSCzjS/6NkoZzhWcMlmhfAnRV1I
         IUBKnu4trfgHYjPBEgIS53QKxbpYD62KVykDFZZ3FoJWesyHKm6GT7NAleU0mQ3t2590
         QTphYSRA49aDnh1vzvcVdaSydRdplodI5NJYtwSuyRNJ5bP6hQS+JDrQY0nSahkKQ19l
         CAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752244113; x=1752848913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kavBJrWMoEXOlmfl1NFVvnCa8WpRzs2d/kXFVbejgNU=;
        b=H1KSQfYa1F0EIubJqUAgCD1WGqRi2XpAXUbvFJ7kukv/tb9mzyGuF1yF49fDFi4NSH
         zt4O8zZQHH1ruX641U2JVGYQplQf29eYVZgA0pRUGyPqnPAVbx1uV0wHTYOVibVtG2Mx
         /krQLN+ZZg4WWkT2MQKBITfUjtb9SMJR47nBF3QmjgpfK9kLpDKFPWztiJpXC/l87wNR
         MPoNLTT0kk2fK+hKgqpRNy2m1M10oKtXYAEx2B2fVxq0dLtG3MKVoSHS+kDqU+b7iT3M
         7KngLDZ2PVvmTgFDUXI9H8IkiM46QO4Jp4tx9YC51QkG1gXMyFmm7NVXAKlR6/XlFLur
         BR6g==
X-Forwarded-Encrypted: i=1; AJvYcCXVxc8O0RvY7zRM1Eym6EYR9w0eq2qsYqbCFjX0C1zu3mrjurnDTTJZlXi/YHA4xiX0xk5II4aVkXiSIzwVa7sN@lists.infradead.org
X-Gm-Message-State: AOJu0YxQTPdhlXaxQLB/KxMAFPmCmBaxnse5jfme3DAiKju3saXpqnsq
	TRjjI3evM4h9rHl67/+Y6Z0lcEVnOaXyCyhUEiBeDwFyKxRTgKckO0Zwh4EApFWRuTXXS9+ntNp
	Qa44Bzk35GzNPtlqBThp+gggTZkVsjrJTmjFHYkldhA==
X-Gm-Gg: ASbGnctSU78jVhsd8+3AGkBlwdcBPYpZe8I2LtoanXd2PiA42M7zafGGGPGCUR8oumO
	O1xzVv5wODWDt08hftggAPXkjRqaMiXsz2/kuNEaj+5V8tUoaq2U1Cj2wgJjU0iBbsJzQExq68t
	RNGTy4Ny08ZxM84t8E1Lp5SfQUewmkGEFBsirVv7qA1JiQCzxKXy1Px0Z2O32ty4C/0hc3w5b09
	Qj4IOjfAoO1JFF7eLLG+dFJRdJ6ukBQkjZYy8Cp
X-Google-Smtp-Source: AGHT+IFQEaj4XEmCCZd/lDPyMbe3Az5tjgXWpi25VZ2oSOWrvTAIzBIrbh29POWkk83PSgv9fZuRzT5r2CSPjpUha6A=
X-Received: by 2002:a05:6a00:180c:b0:740:aa31:fe66 with SMTP id
 d2e1a72fcca58-74ee03a14d1mr4867171b3a.4.1752244112974; Fri, 11 Jul 2025
 07:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250710-trace-noc-v11-0-f849075c40b8@quicinc.com> <20250710-trace-noc-v11-2-f849075c40b8@quicinc.com>
In-Reply-To: <20250710-trace-noc-v11-2-f849075c40b8@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 11 Jul 2025 15:28:21 +0100
X-Gm-Features: Ac12FXwP-5p6tbob2mC_VaXP7_PYnF7qOh1BBZjIaH7H8bD6G7mpriawAwP7p3E
Message-ID: <CAJ9a7ViquNGu=L6AmSf92bQAvEA4UE33y_25wXL=k2EoUH_T2A@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] coresight: add coresight Trace Network On Chip driver
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_072834_152463_AE5431D6 
X-CRM114-Status: GOOD (  34.11  )
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

On Thu, 10 Jul 2025 at 06:28, Yuanfang Zhang <quic_yuanfang@quicinc.com> wrote:
>
> Add a driver to support Coresight device Trace Network On Chip (TNOC),
> which is an integration hierarchy integrating functionalities of TPDA
> and funnels. It aggregates the trace and transports to coresight trace
> bus.
>
> Compared to current configuration, it has the following advantages:
> 1. Reduce wires between subsystems.
> 2. Continue cleaning the infrastructure.
> 3. Reduce Data overhead by transporting raw data from source to target.
>
>   +------------------------+                +-------------------------+
>   | Video Subsystem        |                |Video Subsystem          |
>   |       +-------------+  |                |       +------------+    |
>   |       | Video TPDM  |  |                |       | Video TPDM |    |
>   |       +-------------+  |                |       +------------+    |
>   |            |           |                |              |          |
>   |            v           |                |              v          |
>   |   +---------------+    |                |        +-----------+    |
>   |   | Video funnel  |    |                |        |Video TNOC |    |
>   |   +---------------+    |                |        +-----------+    |
>   +------------|-----------+                +------------|------------+
>                |                                         |
>                v-----+                                   |
> +--------------------|---------+                         |
> |  Multimedia        v         |                         |
> |  Subsystem   +--------+      |                         |
> |              |  TPDA  |      |                         v
> |              +----|---+      |              +---------------------+
> |                   |          |              |   Aggregator  TNOC  |
> |                   |          |              +----------|----------+
> |                   +--        |                         |
> |                     |        |                         |
> |                     |        |                         |
> |              +------v-----+  |                         |
> |              |  Funnel    |  |                         |
> |              +------------+  |                         |
> +----------------|-------------+                         |
>                  |                                       |
>                  v                                       v
>       +--------------------+                    +------------------+
>       |   Coresight Sink   |                    |  Coresight Sink  |
>       +--------------------+                    +------------------+
>
>        Current Configuration                            TNOC
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  drivers/hwtracing/coresight/Kconfig          |  12 ++
>  drivers/hwtracing/coresight/Makefile         |   1 +
>  drivers/hwtracing/coresight/coresight-tnoc.c | 242 +++++++++++++++++++++++++++
>  3 files changed, 255 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index f064e3d172b3d630515bb3a11450e883a6b5b4bf..6a4239ebb582e95f0ebe8e9c8738a726f27f60a1 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -268,4 +268,16 @@ config CORESIGHT_KUNIT_TESTS
>             Enable Coresight unit tests. Only useful for development and not
>             intended for production.
>
> +config CORESIGHT_TNOC
> +       tristate "Coresight Trace Network On Chip driver"
> +       help
> +         This driver provides support for Trace Network On Chip (TNOC) component.
> +         TNOC is an interconnect used to collect traces from various subsystems
> +         and transport to a coresight trace sink. It sits in the different
> +         tiles of SOC and aggregates the trace local to the tile and transports
> +         it another tile or to coresight trace sink eventually.
> +
> +         To compile this driver as a module, choose M here: the module will be
> +         called coresight-tnoc.
> +
>  endif
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 4e7cc3c5bf994d4066adc3b6c203edd19e88a823..ab16d06783a572ea1308dfb3a30c96df9e5ffdb7 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_CORESIGHT_SINK_TPIU) += coresight-tpiu.o
>  obj-$(CONFIG_CORESIGHT_SINK_ETBV10) += coresight-etb10.o
>  obj-$(CONFIG_CORESIGHT_LINKS_AND_SINKS) += coresight-funnel.o \
>                                            coresight-replicator.o
> +obj-$(CONFIG_CORESIGHT_TNOC) += coresight-tnoc.o
>  obj-$(CONFIG_CORESIGHT_SOURCE_ETM3X) += coresight-etm3x.o
>  coresight-etm3x-y := coresight-etm3x-core.o coresight-etm-cp14.o \
>                      coresight-etm3x-sysfs.o
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..0e4164707eea974e6f34d2de01693354d6eefdcd
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -0,0 +1,242 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> + #include <linux/amba/bus.h>
> + #include <linux/coresight.h>
> + #include <linux/device.h>
> + #include <linux/io.h>
> + #include <linux/kernel.h>
> + #include <linux/module.h>
> + #include <linux/of.h>
> + #include <linux/platform_device.h>
> +
> +#include "coresight-priv.h"
> +#include "coresight-trace-id.h"
> +
> +#define TRACE_NOC_CTRL      0x008
> +#define TRACE_NOC_XLD       0x010
> +#define TRACE_NOC_FREQVAL   0x018
> +#define TRACE_NOC_SYNCR     0x020
> +
> +/* Enable generation of output ATB traffic.*/
> +#define TRACE_NOC_CTRL_PORTEN   BIT(0)
> +/* Sets the type of issued ATB FLAG packets.*/
> +#define TRACE_NOC_CTRL_FLAGTYPE BIT(7)
> +/* Sets the type of issued ATB FREQ packet*/
> +#define TRACE_NOC_CTRL_FREQTYPE BIT(8)
> +
> +#define TRACE_NOC_SYNC_INTERVAL        0xFFFF
> +
> +/*
> + * struct trace_noc_drvdata - specifics associated to a trace noc component
> + * @base:      memory mapped base address for this component.
> + * @dev:       device node for trace_noc_drvdata.
> + * @csdev:     component vitals needed by the framework.
> + * @spinlock:  serialize enable/disable operation.
> + * @atid:      id for the trace packet.
> + */
> +struct trace_noc_drvdata {
> +       void __iomem            *base;
> +       struct device           *dev;
> +       struct coresight_device *csdev;
> +       spinlock_t              spinlock;
> +       u32                     atid;
> +};
> +
> +DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");
> +
> +static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
> +{
> +       u32 val;
> +
> +       /* Set ATID */
> +       writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
> +
> +       /* Set the data word count between 'SYNC' packets */
> +       writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
> +
> +       /* Set the Control register:
> +        * - Set the FLAG packets to 'FLAG' packets
> +        * - Set the FREQ packets to 'FREQ_TS' packets
> +        * - Enable generation of output ATB traffic
> +        */
> +
> +       val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
> +
> +       val &= ~TRACE_NOC_CTRL_FLAGTYPE;
> +       val |= TRACE_NOC_CTRL_FREQTYPE;
> +       val |= TRACE_NOC_CTRL_PORTEN;
> +
> +       writel(val, drvdata->base + TRACE_NOC_CTRL);
> +}
> +
> +static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
> +                           struct coresight_connection *outport)
> +{
> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       scoped_guard(spinlock, &drvdata->spinlock) {
> +               if (csdev->refcnt == 0)
> +                       trace_noc_enable_hw(drvdata);
> +
> +               csdev->refcnt++;
> +       }
> +
> +       dev_dbg(drvdata->dev, "Trace NOC is enabled\n");
> +       return 0;
> +}
> +
> +static void trace_noc_disable(struct coresight_device *csdev, struct coresight_connection *inport,
> +                             struct coresight_connection *outport)
> +{
> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       scoped_guard(spinlock, &drvdata->spinlock) {
> +               if (--csdev->refcnt == 0)
> +                       writel(0x0, drvdata->base + TRACE_NOC_CTRL);
> +       }
> +       dev_dbg(drvdata->dev, "Trace NOC is disabled\n");
> +}
> +
> +static int trace_noc_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> +                       __maybe_unused struct coresight_device *sink)
> +{
> +       struct trace_noc_drvdata *drvdata;
> +
> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       return drvdata->atid;
> +}
> +
> +static const struct coresight_ops_link trace_noc_link_ops = {
> +       .enable         = trace_noc_enable,
> +       .disable        = trace_noc_disable,
> +};
> +
> +static const struct coresight_ops trace_noc_cs_ops = {
> +       .trace_id       = trace_noc_id,
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
> +       return 0;
> +}
> +
> +static ssize_t traceid_show(struct device *dev,
> +                           struct device_attribute *attr, char *buf)
> +{
> +       unsigned long val;
> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +       val = drvdata->atid;
> +       return sprintf(buf, "%#lx\n", val);
> +}
> +static DEVICE_ATTR_RO(traceid);
> +
> +static struct attribute *coresight_tnoc_attrs[] = {
> +       &dev_attr_traceid.attr,
> +       NULL,
> +};
> +
> +static const struct attribute_group coresight_tnoc_group = {
> +       .attrs = coresight_tnoc_attrs,
> +};
> +
> +static const struct attribute_group *coresight_tnoc_groups[] = {
> +       &coresight_tnoc_group,
> +       NULL,
> +};
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
> +
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
> +       desc.groups = coresight_tnoc_groups;
> +       drvdata->csdev = coresight_register(&desc);
> +       if (IS_ERR(drvdata->csdev)) {
> +               coresight_trace_id_put_system_id(drvdata->atid);
> +               return PTR_ERR(drvdata->csdev);
> +       }
> +       pm_runtime_put(&adev->dev);
> +
> +       return 0;
> +}
> +
> +static void trace_noc_remove(struct amba_device *adev)
> +{
> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
> +
> +       coresight_unregister(drvdata->csdev);
> +       coresight_trace_id_put_system_id(drvdata->atid);
> +}
> +
> +static struct amba_id trace_noc_ids[] = {
> +       {
> +               .id     = 0x000f0c00,
> +               .mask   = 0x00ffff00,
> +       },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(amba, trace_noc_ids);
> +
> +static struct amba_driver trace_noc_driver = {
> +       .drv = {
> +               .name   = "coresight-trace-noc",
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
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.com>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

