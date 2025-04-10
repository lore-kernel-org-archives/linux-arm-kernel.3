Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056E0C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 13:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qa9H55NP8y0lcikIbP/iehZE8InfczV+B4Ob1WcMMVs=; b=fCX3LphftzhUwlPfxqDURz9a6I
	qGqr+pVNYtB1HUEvBAOGZWLomWmzgTO8Pr98H884XKJwPSjYfBKh3FqXYZq16Rt4biiYN6cClW59E
	Y6imwkRjUr741EyZTQGWqVCvS0iJ7yPiQuT3+xxozkbHjMcmZHDk7X/jqE+920AZ5bd31iv/iROtI
	hWkD2cch4TuDRNnh6RlOxXZoLqlrtMnzE2NFoYHnxzTmu27hoRPj2Q0j3wzZdtz5fo9wvLfahoKy3
	GrJJFlvQIJwQbJNDQMa/gjWg5vyL7UjaeUNBn2JrJAv/19EqqGTsuXb8zcnQPGCAAVNbUVN71iTZw
	zxmuTMwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sH7-0000000AjbK-3YtA;
	Thu, 10 Apr 2025 13:49:01 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2s4a-0000000AgtL-2WxQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 13:36:05 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so1669795b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744292164; x=1744896964; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qa9H55NP8y0lcikIbP/iehZE8InfczV+B4Ob1WcMMVs=;
        b=Crmk/2HULsu11DdXrUXbQP7U+aAFup+wfIYch4FP4Hl2lRC2QSIC1rwIccLXSWf/YI
         ceWsqQwoxymdoGQu3nHOlnARRiwEsM95/mJoXVQZ3iPso9oWbUiU8k0Sgxc7nbDjm23g
         nluTcicJ1zpmI15R9BsGQs+TZGgSWhHQDATT8FYMJE3YF/Ccp4AIdbNhv3CKkZE5JXks
         Gdg4TYwc/AXDDqSyOu8DlUq21scFPlUqMvVwxsA3b9BgEvDc8aBAcMm0ebj+jv5b421l
         OnhjX/xI0WcrRXJ6AjPDg8lc05nT965sUQUvdUqwwXcCxuMHs/CDQdjXGWT80JeR3EzJ
         lqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292164; x=1744896964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qa9H55NP8y0lcikIbP/iehZE8InfczV+B4Ob1WcMMVs=;
        b=bA0rSZAPuTFqWk1Cc1U6VyTR1AXuDP1FAv2M0U2YMsXdBxqBqwRZ9VagI7ThoKRqhK
         ayyBnlj1qouQWnquktvTORaDEUg7gOsMbvzx4Xa6eTrPrYI/sKnpVTCwUeXk4Gnwwpb/
         IQddd76Is7zkPOaNsdkK49MJkHc9DgO3KGADq+PHEAsu1mnGzC5pqmbvsZXJ7zznU4MV
         mPreXW5F5LYtMbDhQMbDHsg+DU5+uQazxbzTfYewMCPLGq7UdKQtJ7zBuNcyiH13ivy9
         uEZ51AtSMkv2GU2jBhY0TI6Qfz/XMjjT08C2MvEUJ38dkxelmBzTQVt4dTlMk2xd4+Gb
         4+Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUEPMO8nDkHuuJ087nVNP/iNmPVQQnD4vkYVwlc9podSe8C77WhEJ7sE3UhDJy4tMn5Pvnzw3OybBZAQSW94rfP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5jvp+0VwFemmc1XvDQ93x796W27yed3Mnoz2Jqr+F0os1pt5j
	4BlFoi03GsvA3Dxk9Lt9P6cuAyKOGgYcVeRwQpovXokoAvBrI9IIHLU8K48SvO/aXSMy49hWEVY
	pkh/7jHyHe+VdS7NoQ7ahxeUODAMuP2gm8VmkBw==
X-Gm-Gg: ASbGncuYN5N/3WfdvVmQH7vNQEh9gipQekxiOXxRilmTBX2m0O+R11mZQ4/d57ImcSA
	RpyTRBy1Hk13YQ/9oKSR/kmdEGQEnj6KKJbekP8NLxbEuYXOu8+e/WUX/tt26MsOxRBQO8B4T94
	A7Tpdtt7emzO38LxS5qFuKph8HK/Q5Y/pAeg==
X-Google-Smtp-Source: AGHT+IEHQtHA1hIyrrZ5K3gF9H81/k+y6X+jg/dj+3RpXa9S79dRt2dUU6xPfC7SZcpmtk9E5MNDMlfRZEPvRixGBSI=
X-Received: by 2002:a05:6a00:3d0d:b0:732:56a7:a935 with SMTP id
 d2e1a72fcca58-73bbf6116d1mr4733304b3a.12.1744292163542; Thu, 10 Apr 2025
 06:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250227092640.2666894-1-quic_songchai@quicinc.com>
 <20250227092640.2666894-5-quic_songchai@quicinc.com> <CAJ9a7Vj3eaZB_i8B8ke4cu=Mz7PjB5Z8Gt=MWB13YXZ9MDZyFA@mail.gmail.com>
 <57272ecc-0ebd-4146-8860-a2dd71833d23@quicinc.com>
In-Reply-To: <57272ecc-0ebd-4146-8860-a2dd71833d23@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 10 Apr 2025 14:35:52 +0100
X-Gm-Features: ATxdqUHK1Zmf0voZjxm0DFtdMYH3w6c87lqw0rW9vtlLoKYZdl2MEVe4lp0H328
Message-ID: <CAJ9a7VgksdNNH-3HEoeKd+odgiboskm8fpGBSB-=aPVOG_0KKQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] coresight-tgu: Add TGU decode support
To: songchai <quic_songchai@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_063604_652897_AB664886 
X-CRM114-Status: GOOD (  35.45  )
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

On Thu, 10 Apr 2025 at 08:46, songchai <quic_songchai@quicinc.com> wrote:
>
>
> On 3/7/2025 6:58 PM, Mike Leach wrote:
>
> Hi,
>
> On Thu, 27 Feb 2025 at 09:27, songchai <quic_songchai@quicinc.com> wrote:
>
> From: Songwei Chai <quic_songchai@quicinc.com>
>
> Decoding is when all the potential pieces for creating a trigger
> are brought together for a given step. Example - there may be a
> counter keeping track of some occurrences and a priority-group that
> is being used to detect a pattern on the sense inputs. These 2
> inputs to condition_decode must be programmed, for a given step,
> to establish the condition for the trigger, or movement to another
> step.
>
> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
> Signed-off-by: songchai <quic_songchai@quicinc.com>
> ---
>  .../testing/sysfs-bus-coresight-devices-tgu   |   7 ++
>  drivers/hwtracing/coresight/coresight-tgu.c   | 113 ++++++++++++++++--
>  drivers/hwtracing/coresight/coresight-tgu.h   |  29 ++++-
>  3 files changed, 136 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
> index af7332153833..dd6cc1184d52 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
> @@ -14,3 +14,10 @@ KernelVersion   6.15
>  Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
>  Description:
>                  (RW) Set/Get the sensed siganal with specific step and priority for TGU.
> +
> +What:           /sys/bus/coresight/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
> +Date:           February 2025
> +KernelVersion   6.15
> +Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
> +Description:
> +                (RW) Set/Get the decode mode with specific step for TGU.
> diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
> index f28761619ebe..5eebf5eecbbb 100644
> --- a/drivers/hwtracing/coresight/coresight-tgu.c
> +++ b/drivers/hwtracing/coresight/coresight-tgu.c
> @@ -22,9 +22,21 @@ static int calculate_array_location(struct tgu_drvdata *drvdata, int step_index,
>  {
>         int ret = -EINVAL;
>
> -       ret = operation_index * (drvdata->max_step) *
> -                     (drvdata->max_reg) + step_index * (drvdata->max_reg)
> -                               + reg_index;
> +       switch (operation_index) {
> +       case TGU_PRIORITY0:
> +       case TGU_PRIORITY1:
> +       case TGU_PRIORITY2:
> +       case TGU_PRIORITY3:
> +               ret = operation_index * (drvdata->max_step) *
> +                       (drvdata->max_reg) + step_index * (drvdata->max_reg)
> +                       + reg_index;
> +               break;
> +       case TGU_CONDITION_DECODE:
> +               ret = step_index * (drvdata->max_condition_decode) + reg_index;
> +               break;
> +       default:
> +               break;
> +       }
>
>         return ret;
>  }
> @@ -36,10 +48,23 @@ static ssize_t tgu_dataset_show(struct device *dev,
>         struct tgu_attribute *tgu_attr =
>                 container_of(attr, struct tgu_attribute, attr);
>
> -       return sysfs_emit(buf, "0x%x\n",
> -                         drvdata->value_table->priority[calculate_array_location(
> +       switch (tgu_attr->operation_index) {
> +       case TGU_PRIORITY0:
> +       case TGU_PRIORITY1:
> +       case TGU_PRIORITY2:
> +       case TGU_PRIORITY3:
> +               return sysfs_emit(buf, "0x%x\n",
> +                                 drvdata->value_table->priority[calculate_array_location(
>
> calculate_array_location() can return -EINVAL - you could be
> referencing array value drvdata->value_table->priority[-EINVAL] here.
> Test the return before referencing the array.
>
> Same for all following occurrences.
>
> Both tgu_dataset_store/show and calculate_array_location use switch cases to evaluate tgu_attr->operation_index.
>
>  Therefore, when a case in tgu_dataset_store/show satisfies tgu_attr->operation_index, calculate_array_location
>
>  will not return -EINVAL. This prevents the occurrence of -EINVAL within the array.

If the function can never return -EINVAL, then do not use is at all in
the function - it is unneeded.
It does not matter that you believe that the current implementation
can never produce an incorrect response - if you write a function that
can return -EINVAL, this must be checked for - do not assume that
future changes will retain the apparent "safety".


Regards

Mike

>
>                                   drvdata, tgu_attr->step_index,
>                                   tgu_attr->operation_index, tgu_attr->reg_num)]);
> +       case TGU_CONDITION_DECODE:
> +               return sysfs_emit(buf, "0x%x\n",
> +                                 drvdata->value_table->condition_decode[calculate_array_location(
> +                                 drvdata, tgu_attr->step_index, tgu_attr->operation_index,
> +                                 tgu_attr->reg_num)]);
> +
>
> missing default - did this code compile without warnings?
>
> Will correct it in next version.
>
> +       }
> +       return -EINVAL;
>
>  }
>
> @@ -58,11 +83,25 @@ static ssize_t tgu_dataset_store(struct device *dev,
>                 return ret;
>
>         guard(spinlock)(&tgu_drvdata->spinlock);
> -       tgu_drvdata->value_table->priority[calculate_array_location(
> -               tgu_drvdata, tgu_attr->step_index, tgu_attr->operation_index,
> -               tgu_attr->reg_num)] = val;
> -       ret = size;
> -
> +       switch (tgu_attr->operation_index) {
> +       case TGU_PRIORITY0:
> +       case TGU_PRIORITY1:
> +       case TGU_PRIORITY2:
> +       case TGU_PRIORITY3:
> +               tgu_drvdata->value_table->priority[calculate_array_location(
> +                       tgu_drvdata, tgu_attr->step_index, tgu_attr->operation_index,
> +                       tgu_attr->reg_num)] = val;
> +               ret = size;
> +               break;
> +       case TGU_CONDITION_DECODE:
> +               tgu_drvdata->value_table->condition_decode[calculate_array_location(
> +                       tgu_drvdata, tgu_attr->step_index, tgu_attr->operation_index,
> +                       tgu_attr->reg_num)] = val;
> +               ret = size;
> +               break;
> +       default:
> +               break;
> +       }
>         return ret;
>  }
>
> @@ -79,8 +118,23 @@ static umode_t tgu_node_visible(struct kobject *kobject, struct attribute *attr,
>                 container_of(dev_attr, struct tgu_attribute, attr);
>
>         if (tgu_attr->step_index < drvdata->max_step) {
> -               ret = (tgu_attr->reg_num < drvdata->max_reg) ?
> -                                           attr->mode : 0;
> +               switch (tgu_attr->operation_index) {
> +               case TGU_PRIORITY0:
> +               case TGU_PRIORITY1:
> +               case TGU_PRIORITY2:
> +               case TGU_PRIORITY3:
> +                       ret = (tgu_attr->reg_num < drvdata->max_reg) ?
> +                                     attr->mode : 0;
> +                       break;
> +               case TGU_CONDITION_DECODE:
> +                       ret = (tgu_attr->reg_num <
> +                                       drvdata->max_condition_decode) ?
> +                                               attr->mode : 0;
> +                       break;
> +               default:
> +                       break;
> +               }
> +
>                 return ret;
>         }
>         return SYSFS_GROUP_INVISIBLE;
> @@ -103,6 +157,17 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>                 }
>         }
>
> +       for (i = 0; i < drvdata->max_step; i++) {
> +               for (j = 0; j < drvdata->max_condition_decode; j++) {
> +                       tgu_writel(drvdata,
> +                                  drvdata->value_table
> +                                          ->condition_decode[calculate_array_location(
> +                                                  drvdata, i,
> +                                                  TGU_CONDITION_DECODE, j)],
> +                                  CONDITION_DECODE_STEP(i, j));
> +               }
> +       }
> +
>         /* Enable TGU to program the triggers */
>         tgu_writel(drvdata, 1, TGU_CONTROL);
>         CS_LOCK(drvdata->base);
> @@ -245,6 +310,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
>         PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
>         PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
>         PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
> +       CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(0),
> +       CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(1),
> +       CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(2),
> +       CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(3),
> +       CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(4),
> +       CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
> +       CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
> +       CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
>         NULL,
>  };
>
> @@ -289,6 +362,13 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>         if (ret)
>                 return -EINVAL;
>
> +       ret = of_property_read_u32(adev->dev.of_node, "tgu-conditions",
> +                                  &drvdata->max_condition);
> +       if (ret)
> +               return -EINVAL;
> +
> +       drvdata->max_condition_decode = drvdata->max_condition;
> +
>         drvdata->value_table =
>                 devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
>         if (!drvdata->value_table)
> @@ -303,6 +383,15 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>         if (!drvdata->value_table->priority)
>                 return -ENOMEM;
>
> +       drvdata->value_table->condition_decode = devm_kzalloc(
> +               dev,
> +               drvdata->max_condition_decode * drvdata->max_step *
> +                       sizeof(*(drvdata->value_table->condition_decode)),
> +               GFP_KERNEL);
> +
> +       if (!drvdata->value_table->condition_decode)
> +               return -ENOMEM;
> +
>         drvdata->enable = false;
>         desc.type = CORESIGHT_DEV_TYPE_HELPER;
>         desc.pdata = adev->dev.platform_data;
> diff --git a/drivers/hwtracing/coresight/coresight-tgu.h b/drivers/hwtracing/coresight/coresight-tgu.h
> index 6e5d465117df..c2a9ce38b44f 100644
> --- a/drivers/hwtracing/coresight/coresight-tgu.h
> +++ b/drivers/hwtracing/coresight/coresight-tgu.h
> @@ -46,6 +46,9 @@
>  #define PRIORITY_REG_STEP(step, priority, reg)\
>         (0x0074 + 0x60 * priority + 0x4 * reg + 0x1D8 * step)
>
> +#define CONDITION_DECODE_STEP(step, decode) \
> +       (0x0050 + 0x4 * decode + 0x1D8 * step)
> +
>
> use #define constants with explanations of what they are rather than
> arbitrary magic numbers.
>
> Done.
>
>  #define tgu_dataset_ro(name, step_index, type, reg_num)     \
>         (&((struct tgu_attribute[]){ {                      \
>                 __ATTR(name, 0444, tgu_dataset_show, NULL), \
> @@ -66,6 +69,9 @@
>         tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
>                        reg_num)
>
> +#define STEP_DECODE(step_index, reg_num) \
> +       tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
> +
>  #define STEP_PRIORITY_LIST(step_index, priority)  \
>         {STEP_PRIORITY(step_index, 0, priority),  \
>          STEP_PRIORITY(step_index, 1, priority),  \
> @@ -88,6 +94,14 @@
>          NULL                   \
>         }
>
> +#define STEP_DECODE_LIST(n) \
> +       {STEP_DECODE(n, 0), \
> +        STEP_DECODE(n, 1), \
> +        STEP_DECODE(n, 2), \
> +        STEP_DECODE(n, 3), \
> +        NULL           \
> +       }
> +
>  #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
>         (&(const struct attribute_group){\
>                 .attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
> @@ -95,11 +109,19 @@
>                 .name = "step" #step "_priority" #priority \
>         })
>
> +#define CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(step)\
> +       (&(const struct attribute_group){\
> +               .attrs = (struct attribute*[])STEP_DECODE_LIST(step),\
> +               .is_visible = tgu_node_visible,\
> +               .name = "step" #step "_condition_decode" \
> +       })
> +
>  enum operation_index {
>         TGU_PRIORITY0,
>         TGU_PRIORITY1,
>         TGU_PRIORITY2,
> -       TGU_PRIORITY3
> +       TGU_PRIORITY3,
> +       TGU_CONDITION_DECODE
>
>  };
>
> @@ -115,6 +137,7 @@ struct tgu_attribute {
>
>  struct value_table {
>         unsigned int *priority;
> +       unsigned int *condition_decode;
>  };
>
>  /**
> @@ -127,6 +150,8 @@ struct value_table {
>   * @value_table: Store given value based on relevant parameters.
>   * @max_reg: Maximum number of registers
>   * @max_step: Maximum step size
> + * @max_condition: Maximum number of condition
> + * @max_condition_decode: Maximum number of condition_decode
>   *
>   * This structure defines the data associated with a TGU device, including its base
>   * address, device pointers, clock, spinlock for synchronization, trigger data pointers,
> @@ -141,6 +166,8 @@ struct tgu_drvdata {
>         struct value_table *value_table;
>         int max_reg;
>         int max_step;
> +       int max_condition;
> +       int max_condition_decode;
>  };
>
>  #endif
>
> Regards
>
> Mike
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

