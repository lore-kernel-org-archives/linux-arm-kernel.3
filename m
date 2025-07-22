Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE83C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 16:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdmktz+HZTUTbn+B6pJ2JHvchHsp9zYIbXnQJvw6KvQ=; b=0BQ2IHE4WBqDz0wMF2K6rOp05k
	GUEKnnPHrHcSUKpXB2ml7vMLL/vpiSRpFr9BGOL0saebyeBvRk3L8pjTupaGL6gDdbNHdJNRAHvK9
	StnNDKpSTbV1bYwLBqSXu7uoxMxOdLzDrVZG1jYZelTmHc4iFviEqQNz95yrhcqohQu89bcDtBaPZ
	+jvowMp8KLHrl5/GrAKbOZ8R3IyGFJEqcGs5/9siquodCO5PotTklLTyu1b6MjMoNOYt/iktDLAnn
	zIwtEQGMNQIdeUhxcDVJBlZE5ltchZnVBUTf63a7peLMs1UGy+LwFaVKS2OaXIWlwFZPwd9zBSlfy
	0fwvDLFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFVT-00000002yJ3-1oxQ;
	Tue, 22 Jul 2025 16:06:19 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEqb-00000002rVL-2eCp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 15:24:06 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo8762118a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 08:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753197844; x=1753802644; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fdmktz+HZTUTbn+B6pJ2JHvchHsp9zYIbXnQJvw6KvQ=;
        b=J3DiJ2bYLzfLB2c2K2I+8V4rdONxIO81GhHr1OCXbWdiqFH8isEISuv5bKjUS4fVtb
         q/Gbw+Iwkz0qDhat0RhgqSZv/W/EyDyXkS7D3duMAtatPiRoJWtY0sTjKppxKqTX23kS
         utE56EBPEs7OnZxNm+k3Vu686eF71pgRH4IbB+2gON5QVaDQ6TrLDM0I7z/ABSIAFRvg
         aWO5+yO8Bkd0JH2jVcAQgbpshVxgjefXxhoq/LwnBSlXtCHK0l+tccUsSUNnmQNIn3ur
         55Mf2jAG8bZmuCb99wA4EsOiu4oplCMXs2nctXpBNi+coKVqVXKNg5hxOFCo4OTvqc+A
         42Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753197844; x=1753802644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdmktz+HZTUTbn+B6pJ2JHvchHsp9zYIbXnQJvw6KvQ=;
        b=TFamnNcAufx5pE6FtYuu9+psN7ykKMNNAyFrTF85cUeDjSNznErGU3dXxkFytO7X0b
         wAF1XBuO6DJULNJGe50VBsbPK1bBqpWszP7Gj4TvQeGDWvbgLV+YdlIPM2ALE68SmVOg
         KBaPRmcZvTGys45IHq/4JFMgLeDtLs/XfvXB+LlCyApWtyouDKEB82KEn7wjwN0bNSYB
         xmkzwbRQzkOTGG5fzECiEeWTHzQshU9p29x4l/Mj/hjSBy8qTbHC9mPpdOA3i5GeqimO
         i1OZRdN3+UMt2dJL9KfAuEQLO70whXSVV1jSKzS/N9uMSCpq7hJww6NWnUqfrqpcxKfi
         lcwA==
X-Forwarded-Encrypted: i=1; AJvYcCWS0cRNW325IMbgNFSMGQ+ERVTVN3HQvYaj3j05H5OpIz7DjH8tLSgZV4/FHEQLTTaYKhlBQrB62NVz6JYblszr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/gck+RvRKfsrgzCqIgdx8LNSJDaCvP7VhKwVCQ4uYmYtjU5Hi
	+gkhupj1FmQJw9PjXquj2uyPI8kuwqYpVRBfcc5D7u1SRukwawT1ulte8wOn7C9FTTAT4ohgg5C
	8QPfK1sueAT3vrhivVEbmvCMqyUn4kQuPihV+3vlyAQ==
X-Gm-Gg: ASbGncvGp1H2OQPYu4OXsBCWma0I08X2FDJXgELNNQKW63PphV5Y1XalvPeEk+i4aJZ
	mepqZFvXH5DBIVo+J+A3yjdUxAkMwRiNfuVtPOBZI1xbMOys94Y92bBgh7zyDWl73IVLTTDxrKa
	/MA7UHj/LCXQ7FT5ij3DZioj9XgHkJWZ3GKiZb2cb40nZexrRLIyQPaZL8lojEzW0LnEUom0iC+
	hhY9LBe
X-Google-Smtp-Source: AGHT+IHGua0kPNIopFaYGDBz3tQw8dTP7VhKQwcyrRu8676ug+w++XCBKlPX4XF51IPoaGx/co/CzW3NoN+q+S+ejv0=
X-Received: by 2002:a17:907:7ba9:b0:ae3:b371:e7d3 with SMTP id
 a640c23a62f3a-ae9cddfe62dmr2319560466b.22.1753197843806; Tue, 22 Jul 2025
 08:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com> <20250714063109.591-5-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250714063109.591-5-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 22 Jul 2025 16:23:50 +0100
X-Gm-Features: Ac12FXz7H4K8Bs6oVFSm4-8uw1yqPeHQHTEi6Sh3SOUnyhf9oYsv9Lf9J47hSK4
Message-ID: <CAJ9a7VhEDMSz6TWvhFOwcdGYbtM-4LnRpPH-7eab8Cdq8r616g@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 04/10] coresight: ctcu: enable byte-cntr for TMC
 ETR devices
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
	Mao Jinlong <quic_jinlmao@quicinc.com>, Jie Gan <quic_jiegan@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_082405_681163_F4DEA77A 
X-CRM114-Status: GOOD (  38.20  )
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

There are some parameters in the new structure that are unused in this patch.

please only introduce fields when they start to be used to make review easier.

Regards

Mike

On Mon, 14 Jul 2025 at 07:31, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> The byte-cntr function provided by the CTCU device is used to transfer data
> from the ETR buffer to the userspace. An interrupt is triggered if the data
> size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions and the read function
> will read the data from the ETR buffer.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../testing/sysfs-bus-coresight-devices-ctcu  |   5 +
>  drivers/hwtracing/coresight/Makefile          |   2 +-
>  .../coresight/coresight-ctcu-byte-cntr.c      | 102 ++++++++++++++++++
>  .../hwtracing/coresight/coresight-ctcu-core.c |  94 +++++++++++++++-
>  drivers/hwtracing/coresight/coresight-ctcu.h  |  49 ++++++++-
>  5 files changed, 246 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>  create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
> new file mode 100644
> index 000000000000..e21f5bcb8097
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
> @@ -0,0 +1,5 @@
> +What:           /sys/bus/coresight/devices/<ctcu-name>/irq_val
> +Date:           June 2025
> +KernelVersion:  6.16
> +Contact:        Tingwei Zhang (QUIC) <quic_tingweiz@quicinc.com>; Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>; Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:    (RW) Configure the IRQ value for byte-cntr register.
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 4e7cc3c5bf99..3568d9768567 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -54,5 +54,5 @@ coresight-cti-y := coresight-cti-core.o       coresight-cti-platform.o \
>  obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>  obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>  obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
> -coresight-ctcu-y := coresight-ctcu-core.o
> +coresight-ctcu-y := coresight-ctcu-core.o coresight-ctcu-byte-cntr.o
>  obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> new file mode 100644
> index 000000000000..d3b6eb7a89fb
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/coresight.h>
> +#include <linux/device.h>
> +#include <linux/fs.h>
> +#include <linux/interrupt.h>
> +#include <linux/of_irq.h>
> +#include <linux/uaccess.h>
> +
> +#include "coresight-ctcu.h"
> +#include "coresight-priv.h"
> +#include "coresight-tmc.h"
> +
> +static irqreturn_t byte_cntr_handler(int irq, void *data)
> +{
> +       struct ctcu_byte_cntr *byte_cntr_data = (struct ctcu_byte_cntr *)data;
> +
> +       atomic_inc(&byte_cntr_data->irq_cnt);
> +       wake_up(&byte_cntr_data->wq);
> +
> +       byte_cntr_data->irq_num++;
> +

These two - irq_num & irq_cnt appear to count the same thing. Do not
understand why one has to be atomic and the other does not.

> +       return IRQ_HANDLED;
> +}
> +
> +/* Start the byte-cntr function when the path is enabled. */
> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path)
> +{
> +       struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +       struct coresight_device *sink = coresight_get_sink(path);
> +       struct ctcu_byte_cntr *byte_cntr_data;
> +       int port_num;
> +
> +       if (!sink)
> +               return;
> +
> +       port_num = coresight_get_port_helper(sink, csdev);
> +       if (port_num < 0)
> +               return;
> +
> +       byte_cntr_data = &drvdata->byte_cntr_data[port_num];
> +       /* Don't start byte-cntr function when threshold is not set. */
> +       if (!byte_cntr_data->thresh_val || byte_cntr_data->enable)
> +               return;
> +
> +       guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
> +       byte_cntr_data->enable = true;
> +       byte_cntr_data->reading_buf = false;
> +}
> +
> +/* Stop the byte-cntr function when the path is disabled. */
> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
> +{
> +       struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +       struct coresight_device *sink = coresight_get_sink(path);
> +       struct ctcu_byte_cntr *byte_cntr_data;
> +       int port_num;
> +
> +       if (!sink || coresight_get_mode(sink) == CS_MODE_SYSFS)
> +               return;
> +
> +       port_num = coresight_get_port_helper(sink, csdev);
> +       if (port_num < 0)
> +               return;
> +
> +       byte_cntr_data = &drvdata->byte_cntr_data[port_num];
> +       guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
> +       byte_cntr_data->enable = false;
> +}
> +
> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int etr_num)
> +{
> +       struct ctcu_byte_cntr *byte_cntr_data;
> +       struct device_node *nd = dev->of_node;
> +       int byte_cntr_irq, ret, i;
> +
> +       for (i = 0; i < etr_num; i++) {
> +               byte_cntr_data = &drvdata->byte_cntr_data[i];
> +               byte_cntr_irq = of_irq_get_byname(nd, byte_cntr_data->irq_name);
> +               if (byte_cntr_irq < 0) {
> +                       dev_err(dev, "Failed to get IRQ from DT for %s\n",
> +                               byte_cntr_data->irq_name);
> +                       continue;
> +               }
> +
> +               ret = devm_request_irq(dev, byte_cntr_irq, byte_cntr_handler,
> +                                      IRQF_TRIGGER_RISING | IRQF_SHARED,
> +                                      dev_name(dev), byte_cntr_data);
> +               if (ret) {
> +                       dev_err(dev, "Failed to register IRQ for %s\n",
> +                               byte_cntr_data->irq_name);
> +                       continue;
> +               }
> +
> +               byte_cntr_data->byte_cntr_irq = byte_cntr_irq;
> +               disable_irq(byte_cntr_data->byte_cntr_irq);
> +               init_waitqueue_head(&byte_cntr_data->wq);
> +       }
> +}
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index 28ea4a216345..721836d42523 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -15,6 +15,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
> +#include <linux/sizes.h>
>
>  #include "coresight-ctcu.h"
>  #include "coresight-priv.h"
> @@ -45,17 +46,23 @@ DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
>
>  #define CTCU_ATID_REG_BIT(traceid)     (traceid % 32)
>  #define CTCU_ATID_REG_SIZE             0x10
> +#define CTCU_ETR0_IRQCTRL               0x6c
> +#define CTCU_ETR1_IRQCTRL               0x70
>  #define CTCU_ETR0_ATID0                        0xf8
>  #define CTCU_ETR1_ATID0                        0x108
>
>  static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
>         {
> -               .atid_offset    = CTCU_ETR0_ATID0,
> -               .port_num       = 0,
> +               .atid_offset            = CTCU_ETR0_ATID0,
> +               .irq_ctrl_offset        = CTCU_ETR0_IRQCTRL,
> +               .irq_name               = "etr0",
> +               .port_num               = 0,
>         },
>         {
> -               .atid_offset    = CTCU_ETR1_ATID0,
> -               .port_num       = 1,
> +               .atid_offset            = CTCU_ETR1_ATID0,
> +               .irq_ctrl_offset        = CTCU_ETR1_IRQCTRL,
> +               .irq_name               = "etr1",
> +               .port_num               = 1,
>         },
>  };
>
> @@ -64,6 +71,76 @@ static const struct ctcu_config sa8775p_cfgs = {
>         .num_etr_config = ARRAY_SIZE(sa8775p_etr_cfgs),
>  };
>
> +static void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset)
> +{
> +       CS_UNLOCK(drvdata->base);
> +       ctcu_writel(drvdata, val, offset);
> +       CS_LOCK(drvdata->base);
> +}
> +
> +static ssize_t irq_val_show(struct device *dev, struct device_attribute *attr,
> +                           char *buf)
> +{
> +       struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +       int i, len = 0;
> +
> +       for (i = 0; i < ETR_MAX_NUM; i++) {
> +               if (drvdata->byte_cntr_data[i].irq_ctrl_offset)
> +                       len += scnprintf(buf + len, PAGE_SIZE - len, "%u ",
> +                                        drvdata->byte_cntr_data[i].thresh_val);
> +       }
> +
> +       len += scnprintf(buf + len, PAGE_SIZE - len, "\n");
> +
> +       return len;
> +}
> +
> +/* Program a valid value into IRQCTRL register will enable byte-cntr interrupt */
> +static ssize_t irq_val_store(struct device *dev, struct device_attribute *attr,
> +                            const char *buf, size_t size)
> +{
> +       struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +       u32 thresh_vals[ETR_MAX_NUM] = { 0 };
> +       u32 irq_ctrl_offset;
> +       int num, i;
> +
> +       num = sscanf(buf, "%i %i", &thresh_vals[0], &thresh_vals[1]);
> +       if (num <= 0 || num > ETR_MAX_NUM)
> +               return -EINVAL;
> +
> +       /* Threshold 0 disables the interruption. */
> +       guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
> +       for (i = 0; i < num; i++) {
> +               /* A small threshold will result in a large number of interruptions */
> +               if (thresh_vals[i] && thresh_vals[i] < SZ_4K)
> +                       return -EINVAL;
> +
> +               if (drvdata->byte_cntr_data[i].irq_ctrl_offset) {
> +                       drvdata->byte_cntr_data[i].thresh_val = thresh_vals[i];
> +                       irq_ctrl_offset = drvdata->byte_cntr_data[i].irq_ctrl_offset;
> +                       /* A one value for IRQCTRL register represents 8 bytes */
> +                       ctcu_program_register(drvdata, thresh_vals[i] / 8, irq_ctrl_offset);
> +               }
> +       }
> +
> +       return size;
> +}
> +static DEVICE_ATTR_RW(irq_val);
> +

I think it may make more sense to call this something with "threshold"
- as it is thresholds that are being set.

> +static struct attribute *ctcu_attrs[] = {
> +       &dev_attr_irq_val.attr,
> +       NULL,
> +};
> +
> +static struct attribute_group ctcu_attr_grp = {
> +       .attrs = ctcu_attrs,
> +};
> +
> +static const struct attribute_group *ctcu_attr_grps[] = {
> +       &ctcu_attr_grp,
> +       NULL,
> +};
> +
>  static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, u32 reg_offset,
>                                        u8 bit, bool enable)
>  {
> @@ -143,6 +220,8 @@ static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode, void *
>  {
>         struct coresight_path *path = (struct coresight_path *)data;
>
> +       ctcu_byte_cntr_start(csdev, path);
> +
>         return ctcu_set_etr_traceid(csdev, path, true);
>  }
>
> @@ -150,6 +229,8 @@ static int ctcu_disable(struct coresight_device *csdev, void *data)
>  {
>         struct coresight_path *path = (struct coresight_path *)data;
>
> +       ctcu_byte_cntr_stop(csdev, path);
> +
>         return ctcu_set_etr_traceid(csdev, path, false);
>  }
>
> @@ -200,7 +281,11 @@ static int ctcu_probe(struct platform_device *pdev)
>                         for (i = 0; i < cfgs->num_etr_config; i++) {
>                                 etr_cfg = &cfgs->etr_cfgs[i];
>                                 drvdata->atid_offset[i] = etr_cfg->atid_offset;
> +                               drvdata->byte_cntr_data[i].irq_name = etr_cfg->irq_name;
> +                               drvdata->byte_cntr_data[i].irq_ctrl_offset =
> +                                       etr_cfg->irq_ctrl_offset;
>                         }
> +                       ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
>                 }
>         }
>
> @@ -212,6 +297,7 @@ static int ctcu_probe(struct platform_device *pdev)
>         desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU;
>         desc.pdata = pdata;
>         desc.dev = dev;
> +       desc.groups = ctcu_attr_grps;
>         desc.ops = &ctcu_ops;
>         desc.access = CSDEV_ACCESS_IOMEM(base);
>
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
> index e9594c38dd91..71266371591b 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu.h
> +++ b/drivers/hwtracing/coresight/coresight-ctcu.h
> @@ -5,19 +5,27 @@
>
>  #ifndef _CORESIGHT_CTCU_H
>  #define _CORESIGHT_CTCU_H
> +
> +#include <linux/time.h>
>  #include "coresight-trace-id.h"
>
>  /* Maximum number of supported ETR devices for a single CTCU. */
>  #define ETR_MAX_NUM    2
>
> +#define BYTE_CNTR_TIMEOUT      (5 * HZ)
> +
>  /**
>   * struct ctcu_etr_config
>   * @atid_offset:       offset to the ATID0 Register.
> - * @port_num:          in-port number of CTCU device that connected to ETR.
> + * @port_num:          in-port number of the CTCU device that connected to ETR.
> + * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
> + * @irq_name:           IRQ name in dt node.
>   */
>  struct ctcu_etr_config {
>         const u32 atid_offset;
>         const u32 port_num;
> +       const u32 irq_ctrl_offset;
> +       const char *irq_name;
>  };
>
>  struct ctcu_config {
> @@ -25,15 +33,54 @@ struct ctcu_config {
>         int num_etr_config;
>  };
>
> +/**
> + * struct ctcu_byte_cntr
> + * @enable:            indicates that byte_cntr function is enabled or not.
> + * @reading:           indicates that its byte-cntr reading.
> + * @reading_buf:       indicates that byte-cntr is reading buffer.
> + * @thresh_val:                threshold to trigger a interruption.
> + * @total_size:                total size of transferred data.
> + * @byte_cntr_irq:     IRQ number.
> + * @irq_cnt:           IRQ count.
> + * @irq_num:           number of the byte_cntr IRQ for one session.

the difference between byte_cntr_irg and irq_cnt is not clear.

> + * @wq:                        workqueue of reading ETR data.
> + * @read_work:         work of reading ETR data.
> + * @spin_lock:         spinlock of byte cntr data.
> + *                     the byte cntr is stopped.
> + * @irq_ctrl_offset:   offset to the BYTECNTVAL Register.
> + * @irq_name:          IRQ name in DT.
> + */
> +struct ctcu_byte_cntr {
> +       bool                    enable;
> +       bool                    reading;

This parameter is unused in this patch

> +       bool                    reading_buf;
> +       u32                     thresh_val;
> +       u64                     total_size;

parameter unused in this patch

> +       int                     byte_cntr_irq;
> +       atomic_t                irq_cnt;
> +       int                     irq_num;
> +       wait_queue_head_t       wq;
> +       struct work_struct      read_work;
> +       raw_spinlock_t          spin_lock;
> +       u32                     irq_ctrl_offset;
> +       const char              *irq_name;
> +};
> +
>  struct ctcu_drvdata {
>         void __iomem            *base;
>         struct clk              *apb_clk;
>         struct device           *dev;
>         struct coresight_device *csdev;
> +       struct ctcu_byte_cntr   byte_cntr_data[ETR_MAX_NUM];
>         raw_spinlock_t          spin_lock;
>         u32                     atid_offset[ETR_MAX_NUM];
>         /* refcnt for each traceid of each sink */
>         u8                      traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
>  };
>
> +/* Byte-cntr functions */
> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path);
> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path);
> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int port_num);
> +
>  #endif
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

