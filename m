Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642BAC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 12:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hv/gVLl2qHT3OP5ugQYjdLZvq+nefm2QS0Hproa/Q1s=; b=1wkF9l9qyRhhnc9gw/bnboqY9X
	6WwatwCxIPPiAVmDPBBAKHYF3Pd2txS5ap2+IGIrH5JCsLw7P4sDzAxvDjEfpoCe3EegV9OfOAKY0
	gFn3PU9opWhD4LaqlcH7qJZ38R0YwtLru8c0DxOEdtJ/1cJKwDr4AN+2NjXnYpvKa0dTQXuv7fMF6
	uWEKgckZiE1l1alUnLQe6ZdOF+Vh1a2QpnYtTZNlLYwer5rFbqMpJRowUtoasWhSf7UMUH0qEaSrR
	rFf6MiR4gloOBSDZEveC5HXJ07VsQ0BArlmnMSCFnyGYJIdBg8BKRD8qApXuryjB4bfQuowZ8ypsU
	E8JeYNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWiA-0000000EAej-1BSW;
	Fri, 07 Mar 2025 12:21:54 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWdj-0000000EA54-1m0c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 12:17:20 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-224171d6826so3281905ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 04:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741349838; x=1741954638; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hv/gVLl2qHT3OP5ugQYjdLZvq+nefm2QS0Hproa/Q1s=;
        b=Z9M8plVojVgXuhueF+TMqFKMUJp7OK1wDiEZMULShASI06ibn81nw/AmCVIVRrHOI7
         BM3K5BJyVzEr76D+B10A+IcOBIHlukIBBAXOW+AaY5SwVVEXZbs14joCD/c8x4UDSJvU
         gRFtzRwGy5g9mk5TlbW9xbdm/gQUV9ofbPSxkwteyB1uZmj3oTKBEOv9SIo5VkU8SrdI
         /b0pG/n/kFXdA7oA3RkJbdShodGZVwzVyo15bwjhI9c+IPBNKVyVT/EimqnvHgS1cKfb
         0b4wYJWTluDtnZY6KhRIbonWtiYLGOzStBz0E6VkegSLqRV5vT16/Mg3Mb1pKlryXOMK
         iGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741349838; x=1741954638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hv/gVLl2qHT3OP5ugQYjdLZvq+nefm2QS0Hproa/Q1s=;
        b=RdnZf+LxD+Y7WVtKUwyP2Hflj3htY6Nf7CwZkWqtD0p8mf0cuJzXPJjWbft6ql0OVt
         LRqUxAJWThRz69SZQe+FyQcaT3hi+wMssB6T/q/nLtzYXHVuspOHIZRjbGxkzCNgQxCk
         faztQvRNARE5Pio+NejcezyIRAur8nv+FX+BHltReYhH4GTWzFt5VYNXkbHfSKuCwMw5
         pBoDWOWi9rWRnMWopYokqNI4Az3PAxxiNqEx9Gtj8mfbsTnAhiHLy7Q9neaAk0Wfw/9I
         y9tR6RIoiaW//WNFz3pInmSEwQ4EymGqbK3z1tIZ+q2rolUmsbTnHKUjbjGmnHyiGiJk
         PU1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDem6j7WljeWD4a60mQCbozE1rmQJdz02uQ78LmvxI3ihszMjYKQ7gB0uHvLOo49Wf/Mro4fuE6X/JlvWqPCyD@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb5txfwD3hrFXZ7kuQEYCOUOv8yHw49+bB3I1wZfSJWiSYC6bN
	+2nb+CZ2YLntsJo807FinZKtAopmbGsZg5dgY/DZy3HCkTmsdezmwg369uGxq+tDwmJ3jjR3+KG
	s8X015G0X/YUgGXbRDV9zTceQIsSGNIMFqZbldQ==
X-Gm-Gg: ASbGncuWJmPObXvy9us5M8FzitplYYfM4nfIl5xNMw/60ZqyYkjkPVUr/b/JXTbA5yA
	tWIv2ZdPXMgoONrr5z3Gzi33QPyFRPQZGS28SfPEA4B/3z3d1OpCMgCsgxif8G3c1LruwhjJePA
	cG/g/Y4GhQLTL9ckTp70ORuiQ499w=
X-Google-Smtp-Source: AGHT+IH573IS5QtUx20I6gmw8IwbjOS9N3JKhGKodkJA2RjHHnjVw0eGQJw9/ecW7LGByF/yQgZQ/285vJSUaEc7A0Y=
X-Received: by 2002:a05:6a00:843:b0:736:a973:748 with SMTP id
 d2e1a72fcca58-736aaad3d00mr5126533b3a.22.1741349838300; Fri, 07 Mar 2025
 04:17:18 -0800 (PST)
MIME-Version: 1.0
References: <20250227092640.2666894-1-quic_songchai@quicinc.com> <20250227092640.2666894-4-quic_songchai@quicinc.com>
In-Reply-To: <20250227092640.2666894-4-quic_songchai@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 7 Mar 2025 12:17:05 +0000
X-Gm-Features: AQ5f1JokkN84bPdZY7gP5fhbY5F7Y4Itc_hcgefVYh4EcU6KzYt95XIRUUYFQ2Q
Message-ID: <CAJ9a7Vi9CWGKGYe6jBELFN_X6dSG4EfQQd5moju5ekbrLWxi2g@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] coresight-tgu: Add signal priority support
To: songchai <quic_songchai@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_041719_487349_484FDC81 
X-CRM114-Status: GOOD (  29.30  )
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

Hi

On Thu, 27 Feb 2025 at 09:27, songchai <quic_songchai@quicinc.com> wrote:
>
> From: Songwei Chai <quic_songchai@quicinc.com>
>
> Like circuit of a Logic analyzer, in TGU, the requirement could be
> configured in each step and the trigger will be created once the
> requirements are met. Add priority functionality here to sort the
> signals into different priorities. The signal which is wanted could
> be configured in each step's priority node, the larger number means
> the higher priority and the signal with higher priority will be sensed
> more preferentially.
>
> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
> Signed-off-by: songchai <quic_songchai@quicinc.com>
> ---
>  .../testing/sysfs-bus-coresight-devices-tgu   |   7 +
>  drivers/hwtracing/coresight/coresight-tgu.c   | 139 ++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tgu.h   | 110 ++++++++++++++
>  3 files changed, 256 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
> index 741bc9fd9df5..af7332153833 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
> @@ -7,3 +7,10 @@ Description:
>                 Accepts only one of the 2 values -  0 or 1.
>                 0 : disable TGU.
>                 1 : enable TGU.
> +
> +What:           /sys/bus/coresight/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:17]
> +Date:           February 2025
> +KernelVersion   6.15
> +Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
> +Description:
> +                (RW) Set/Get the sensed siganal with specific step and priority for TGU.

sp/siganal/signal

> diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
> index da4c04ac1097..f28761619ebe 100644
> --- a/drivers/hwtracing/coresight/coresight-tgu.c
> +++ b/drivers/hwtracing/coresight/coresight-tgu.c
> @@ -17,9 +17,92 @@
>
>  DEFINE_CORESIGHT_DEVLIST(tgu_devs, "tgu");
>
> +static int calculate_array_location(struct tgu_drvdata *drvdata, int step_index,
> +                         int operation_index, int reg_index)
> +{
> +       int ret = -EINVAL;
> +
> +       ret = operation_index * (drvdata->max_step) *
> +                     (drvdata->max_reg) + step_index * (drvdata->max_reg)
> +                               + reg_index;
> +
> +       return ret;
> +}
> +
> +static ssize_t tgu_dataset_show(struct device *dev,
> +                               struct device_attribute *attr, char *buf)
> +{
> +       struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +       struct tgu_attribute *tgu_attr =
> +               container_of(attr, struct tgu_attribute, attr);
> +
> +       return sysfs_emit(buf, "0x%x\n",
> +                         drvdata->value_table->priority[calculate_array_location(
> +                                 drvdata, tgu_attr->step_index,
> +                                 tgu_attr->operation_index, tgu_attr->reg_num)]);
> +
> +}
> +
> +static ssize_t tgu_dataset_store(struct device *dev,
> +                                struct device_attribute *attr, const char *buf,
> +                                size_t size)
> +{
> +       unsigned long val;
> +       ssize_t ret = -EINVAL;
> +
> +       struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev->parent);
> +       struct tgu_attribute *tgu_attr =
> +               container_of(attr, struct tgu_attribute, attr);
> +
> +       if (kstrtoul(buf, 0, &val))
> +               return ret;
> +
> +       guard(spinlock)(&tgu_drvdata->spinlock);
> +       tgu_drvdata->value_table->priority[calculate_array_location(
> +               tgu_drvdata, tgu_attr->step_index, tgu_attr->operation_index,
> +               tgu_attr->reg_num)] = val;
> +       ret = size;
> +
> +       return ret;

ret is unneeded - directly return either size or -EINVAL.

> +}
> +
> +static umode_t tgu_node_visible(struct kobject *kobject, struct attribute *attr,
> +                               int n)
> +{
> +       struct device *dev = kobj_to_dev(kobject);
> +       struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +       int ret = 0;
> +
> +       struct device_attribute *dev_attr =
> +               container_of(attr, struct device_attribute, attr);
> +       struct tgu_attribute *tgu_attr =
> +               container_of(dev_attr, struct tgu_attribute, attr);
> +
> +       if (tgu_attr->step_index < drvdata->max_step) {
> +               ret = (tgu_attr->reg_num < drvdata->max_reg) ?
> +                                           attr->mode : 0;
> +               return ret;
> +       }
> +       return SYSFS_GROUP_INVISIBLE;
> +}

default ret as SYSFS_GROUP_INVISIBLE, and returnret at end

> +
>  static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>  {
> +       int i, j, k;
> +
>         CS_UNLOCK(drvdata->base);
> +
> +       for (i = 0; i < drvdata->max_step; i++) {
> +               for (j = 0; j < MAX_PRIORITY; j++) {
> +                       for (k = 0; k < drvdata->max_reg; k++) {
> +                               tgu_writel(drvdata,
> +                                          drvdata->value_table->priority
> +                                                  [calculate_array_location(drvdata, i, j, k)],
> +                                          PRIORITY_REG_STEP(i, j, k));
> +                       }
> +               }
> +       }
> +
>         /* Enable TGU to program the triggers */
>         tgu_writel(drvdata, 1, TGU_CONTROL);
>         CS_LOCK(drvdata->base);
> @@ -130,6 +213,38 @@ static const struct attribute_group tgu_common_grp = {
>
>  static const struct attribute_group *tgu_attr_groups[] = {
>         &tgu_common_grp,
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(0, 1),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(0, 2),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(0, 3),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(1, 0),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(1, 1),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(1, 2),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(1, 3),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(2, 0),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(2, 1),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(2, 2),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(2, 3),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(3, 0),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(3, 1),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(3, 2),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(3, 3),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(4, 0),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(4, 1),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(4, 2),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(4, 3),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(5, 0),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(5, 1),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(5, 2),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(5, 3),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(6, 0),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(6, 1),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(6, 2),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(6, 3),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(7, 0),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
> +       PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
>         NULL,
>  };
>
> @@ -164,6 +279,30 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>
>         spin_lock_init(&drvdata->spinlock);
>
> +       ret = of_property_read_u32(adev->dev.of_node, "tgu-regs",
> +                                  &drvdata->max_reg);
> +       if (ret)
> +               return -EINVAL;
> +
> +       ret = of_property_read_u32(adev->dev.of_node, "tgu-steps",
> +                                  &drvdata->max_step);
> +       if (ret)
> +               return -EINVAL;
> +
> +       drvdata->value_table =
> +               devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
> +       if (!drvdata->value_table)
> +               return -ENOMEM;
> +
> +       drvdata->value_table->priority = devm_kzalloc(
> +               dev,
> +               MAX_PRIORITY * drvdata->max_reg * drvdata->max_step *
> +                       sizeof(*(drvdata->value_table->priority)),
> +               GFP_KERNEL);
> +
> +       if (!drvdata->value_table->priority)
> +               return -ENOMEM;
> +
>         drvdata->enable = false;
>         desc.type = CORESIGHT_DEV_TYPE_HELPER;
>         desc.pdata = adev->dev.platform_data;
> diff --git a/drivers/hwtracing/coresight/coresight-tgu.h b/drivers/hwtracing/coresight/coresight-tgu.h
> index 380686f94130..6e5d465117df 100644
> --- a/drivers/hwtracing/coresight/coresight-tgu.h
> +++ b/drivers/hwtracing/coresight/coresight-tgu.h
> @@ -13,6 +13,110 @@
>  #define tgu_writel(drvdata, val, off) __raw_writel((val), drvdata->base + off)
>  #define tgu_readl(drvdata, off) __raw_readl(drvdata->base + off)
>
> +/*
> + *  TGU configuration space                              Step configuration
> + *  offset table                                         space layout
> + * x-------------------------x$                          x-------------x$
> + * |                         |$                          |             |$
> + * |                         |                           |   reserve   |$
> + * |                         |                           |             |$
> + * |coresight management     |                           |-------------|base+n*0x1D8+0x1F4$
> + * |     registe             |                     |---> |prioroty[3]  |$
> + * |                         |                     |     |-------------|base+n*0x1D8+0x194$
> + * |                         |                     |     |prioroty[2]  |$
> + * |-------------------------|                     |     |-------------|base+n*0x1D8+0x134$
> + * |                         |                     |     |prioroty[1]  |$
> + * |         step[7]         |                     |     |-------------|base+n*0x1D8+0xD4$
> + * |-------------------------|->base+0x40+7*0x1D8  |     |prioroty[0]  |$
> + * |                         |                     |     |-------------|base+n*0x1D8+0x74$
> + * |         ...             |                     |     |  condition  |$
> + * |                         |                     |     |   select    |$
> + * |-------------------------|->base+0x40+1*0x1D8  |     |-------------|base+n*0x1D8+0x60$
> + * |                         |                     |     |  condition  |$
> + * |         step[0]         |-------------------->      |   decode    |$
> + * |-------------------------|-> base+0x40               |-------------|base+n*0x1D8+0x50$
> + * |                         |                           |             |$
> + * | Control and status space|                           |Timer/Counter|$
> + * |        space            |                           |             |$
> + * x-------------------------x->base                     x-------------x base+n*0x1D8+0x40$
> + *
> + */
> +
> +/* Calculate compare step addresses */
> +#define PRIORITY_REG_STEP(step, priority, reg)\
> +       (0x0074 + 0x60 * priority + 0x4 * reg + 0x1D8 * step)
> +

use #defines + explanation instead of arbitrary magic numbers

> +#define tgu_dataset_ro(name, step_index, type, reg_num)     \
> +       (&((struct tgu_attribute[]){ {                      \
> +               __ATTR(name, 0444, tgu_dataset_show, NULL), \
> +               step_index,                                 \
> +               type,                                       \
> +               reg_num,                                    \
> +       } })[0].attr.attr)
> +


This define unused in this patch, Drop till it is used.

> +#define tgu_dataset_rw(name, step_index, type, reg_num)                  \
> +       (&((struct tgu_attribute[]){ {                                   \
> +               __ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
> +               step_index,                                              \
> +               type,                                                    \
> +               reg_num,                                                 \
> +       } })[0].attr.attr)
> +
> +#define STEP_PRIORITY(step_index, reg_num, priority)                     \
> +       tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
> +                      reg_num)
> +
> +#define STEP_PRIORITY_LIST(step_index, priority)  \
> +       {STEP_PRIORITY(step_index, 0, priority),  \
> +        STEP_PRIORITY(step_index, 1, priority),  \
> +        STEP_PRIORITY(step_index, 2, priority),  \
> +        STEP_PRIORITY(step_index, 3, priority),  \
> +        STEP_PRIORITY(step_index, 4, priority),  \
> +        STEP_PRIORITY(step_index, 5, priority),  \
> +        STEP_PRIORITY(step_index, 6, priority),  \
> +        STEP_PRIORITY(step_index, 7, priority),  \
> +        STEP_PRIORITY(step_index, 8, priority),  \
> +        STEP_PRIORITY(step_index, 9, priority),  \
> +        STEP_PRIORITY(step_index, 10, priority), \
> +        STEP_PRIORITY(step_index, 11, priority), \
> +        STEP_PRIORITY(step_index, 12, priority), \
> +        STEP_PRIORITY(step_index, 13, priority), \
> +        STEP_PRIORITY(step_index, 14, priority), \
> +        STEP_PRIORITY(step_index, 15, priority), \
> +        STEP_PRIORITY(step_index, 16, priority), \
> +        STEP_PRIORITY(step_index, 17, priority), \
> +        NULL                   \
> +       }
> +
> +#define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
> +       (&(const struct attribute_group){\
> +               .attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
> +               .is_visible = tgu_node_visible,\
> +               .name = "step" #step "_priority" #priority \
> +       })
> +
> +enum operation_index {
> +       TGU_PRIORITY0,
> +       TGU_PRIORITY1,
> +       TGU_PRIORITY2,
> +       TGU_PRIORITY3
> +
> +};
> +
> +/* Maximum priority that TGU supports */
> +#define MAX_PRIORITY 4
> +
> +struct tgu_attribute {
> +       struct device_attribute attr;
> +       u32 step_index;
> +       enum operation_index operation_index;
> +       u32 reg_num;
> +};
> +
> +struct value_table {
> +       unsigned int *priority;
> +};
> +
>  /**
>   * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit) device
>   * @base: Memory-mapped base address of the TGU device
> @@ -20,6 +124,9 @@
>   * @csdev: Pointer to the associated coresight device
>   * @spinlock: Spinlock for handling concurrent access
>   * @enable: Flag indicating whether the TGU device is enabled
> + * @value_table: Store given value based on relevant parameters.
> + * @max_reg: Maximum number of registers
> + * @max_step: Maximum step size
>   *
>   * This structure defines the data associated with a TGU device, including its base
>   * address, device pointers, clock, spinlock for synchronization, trigger data pointers,
> @@ -31,6 +138,9 @@ struct tgu_drvdata {
>         struct coresight_device *csdev;
>         spinlock_t spinlock;
>         bool enable;
> +       struct value_table *value_table;
> +       int max_reg;
> +       int max_step;
>  };
>
>  #endif

Regards

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

