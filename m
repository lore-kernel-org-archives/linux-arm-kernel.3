Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9B3C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 20:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRUJqhFRaTaP65+s8JfrT3m24dGMvcy/WQaeObOfwQU=; b=qKps9iZfP/rS6FPLQBBj/cGlcu
	QgAuXEfzEdqYlJ8XmFHNZJHeEw6X64xoLDhY1unl6bt7Aea1tWgv45d0EaatoPuGg3xioGZkozvIw
	KG4wExy/ZyqH0s9swhx68F4An43RbdLOhODI8j0WVCy+Uxv7snxQGqsVZiGUfJLk2XsdIPDqzdOYz
	Wx++NyFhAkAA3onmbm698F7iSW5tMVL+gi6XjX1rCTZBMzdaUtrpRud3Azh7uRqqneLxOfwdSFWyx
	AoKtdBv7FGUi/2P6yp5IXI4rclJoF49shjTxkfTHZbn4/z2KzGpA9P/jtAz3o/8PMN2m+S8R+Hfjn
	Adbr/KAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj2A6-0000000BJeJ-1Xd6;
	Mon, 04 Aug 2025 20:52:02 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj27Y-0000000BJZN-2njg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 20:49:26 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-76bc55f6612so4279117b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 13:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754340564; x=1754945364; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRUJqhFRaTaP65+s8JfrT3m24dGMvcy/WQaeObOfwQU=;
        b=rHyWXX9kLR93byWNMl/EjcVFAnen28l+y7fqSsX1/U8z3pFWIczFlhnKuC4LC3pkM2
         LrJpj75UZFfXfsho/M7QBARegnQo/k5gywl6mUvly/RX52KFd+1T7+BfqgcQvk4zCcJE
         Pj9M6zGnt20wD2zaTAgflZbFE/nh/+qPmAeSe/z3CDp7VwJk670zwrMRnh3SUK11IZkd
         /Dc+geiB1unxxDcim0ZTphPOTfotdIexGdiilPo+eQU2+bVc46cWTZSzB5FRhdqNOqZB
         7nIAGLWGwqkyGtuWVjsiFnj9oz8QvpNg6BWjgZaqC74E7oOVwTrdKsx5CpcsdNGRgFFh
         6Qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754340564; x=1754945364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRUJqhFRaTaP65+s8JfrT3m24dGMvcy/WQaeObOfwQU=;
        b=cJt4lHrleb7eDCb8aDXz6H/WDfei6tXUFLhSlO1sj3CxM0LKDkKUvgAnaoN8eO94tm
         /2n7t2BFIbEuob34LW2jl2wP2IbTDIqivGAW2NCP3iRU1XzxzF2dmaXWP0/IiEyjyvIq
         8FIWfMWEpARcGlMsXi9/xEPnm2HW2Muf0BEf+Uk/LygKZc4qjWoCx55U3opJ+cRbqWqp
         JqIIYLGqXgJaMUSI8i2AilDs8rEdESfhftmpAsKwys1sdmhwPz3tOo5ZMbZnz9p3t3DN
         kxDZ0+2Zrszc85ZYBHA3FocIqBCkLRG7e1kxRKspTR+k4uy3j/i/CWoBjR+Kgl47vamQ
         Sh7w==
X-Forwarded-Encrypted: i=1; AJvYcCV6a7xNsjKFoKZ1QAKFx6hFi5Gdedd7t+4aOENu1vYcY2dpN8SK5Zy6XIrQOkZRzzWWiSqT6+mEPphhmWGM+Xin@lists.infradead.org
X-Gm-Message-State: AOJu0YzHkzv2mFCRVVq3EQvCwGZr4JKr/giAExvFeBqyWHh8BFI/onDW
	sG2s6By0hRhVv/GqFhTXkkCsG40seTUF+VbZz6e0XdWZVkjzXFo0dQ7JZNRViqFIYfHkMpeVFK2
	H+45+nQYAbD/ZUGBaNQpfJfc4v42ZZ6JFwiBz1Q3yVw==
X-Gm-Gg: ASbGncsPQQxGGKGpQWw8H25G/+yfWobD/bawPwdv+VuhSiclR+TtuTWBozsqvhcR0ND
	qHh7gnhp8zZVC2PqS7k4SXIOPhYUorp6+GXQ6Xc3cKiA8EojR1Z+sFmJg+QTNvTzr4zknrIYr8s
	EIVC/helBb0bSWnjZXaS9tlKVmHppYLIhfgNGmdEDrVLAujstPrqwlvwueGR6pUkitmp2BNl+Br
	XxSzXkH8wf0lCemdFF1+1GXWBS6rtGeHunTCzI=
X-Google-Smtp-Source: AGHT+IHKeFk2BJspe9Io51wCucMGYCs7hHEllmPOrD1BS9ira6xDvcm3J17dvKV07UolYD/6NU3fL3Kf3rTiAX4SQs4=
X-Received: by 2002:a05:6a20:3947:b0:233:105f:ed62 with SMTP id
 adf61e73a8af0-2401ea17eb6mr1578358637.10.1754340563466; Mon, 04 Aug 2025
 13:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com> <20250722081405.2947294-3-quic_jinlmao@quicinc.com>
In-Reply-To: <20250722081405.2947294-3-quic_jinlmao@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 4 Aug 2025 21:49:12 +0100
X-Gm-Features: Ac12FXzRyNpiwnBIsgDuF59CwQ-bbsXRcFaA-5fo_Hn4n9Fb0mt23oMrDU_a84o
Message-ID: <CAJ9a7VhSLdPnVdJfbsCTKLri7i8SKP4WaO9W8=mOU4Wjo0VbyQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Yingchao Deng <quic_yingdeng@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_134924_728126_91E575AB 
X-CRM114-Status: GOOD (  31.55  )
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

On Tue, 22 Jul 2025 at 09:14, Mao Jinlong <quic_jinlmao@quicinc.com> wrote:
>
> From: Yingchao Deng <quic_yingdeng@quicinc.com>
>
> The QCOM extended CTI is a heavily parameterized version of ARM=E2=80=99s=
 CSCTI.
> It allows a debugger to send to trigger events to a processor or to send
> a trigger event to one or more processors when a trigger event occurs
> on another processor on the same SoC, or even between SoCs. For Qualcomm
> extended CTI, it supports up to 128 triggers.
>
> Signed-off-by: Yingchao Deng <quic_yingdeng@quicinc.com>
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../hwtracing/coresight/coresight-cti-core.c  | 127 +++++++++++++----
>  .../coresight/coresight-cti-platform.c        |  16 ++-
>  .../hwtracing/coresight/coresight-cti-sysfs.c | 128 ++++++++++++++----
>  drivers/hwtracing/coresight/coresight-cti.h   |  75 +++++-----
>  4 files changed, 245 insertions(+), 101 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/h=
wtracing/coresight/coresight-cti-core.c
> index 8fb30dd73fd2..d6a28df48484 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -15,6 +15,7 @@
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
>  #include <linux/spinlock.h>
> @@ -22,6 +23,54 @@
>  #include "coresight-priv.h"
>  #include "coresight-cti.h"
>
> +#define CTI_EXTENDED "qcom,coresight-cti-extended"
> +
> +static const int cti_normal_offset[] =3D {
> +       [CTIINTACK]             =3D 0x010,
> +       [CTIAPPSET]             =3D 0x014,
> +       [CTIAPPCLEAR]           =3D 0x018,
> +       [CTIAPPPULSE]           =3D 0x01C,
> +       [CTIINEN]               =3D 0x020,
> +       [CTIOUTEN]              =3D 0x0A0,
> +       [CTITRIGINSTATUS]       =3D 0x130,
> +       [CTITRIGOUTSTATUS]      =3D 0x134,
> +       [CTICHINSTATUS]         =3D 0x138,
> +       [CTICHOUTSTATUS]        =3D 0x13C,
> +       [CTIGATE]               =3D 0x140,
> +       [ASICCTL]               =3D 0x144,
> +       [ITCHINACK]             =3D 0xEDC,
> +       [ITTRIGINACK]           =3D 0xEE0,
> +       [ITCHOUT]               =3D 0xEE4,
> +       [ITTRIGOUT]             =3D 0xEE8,
> +       [ITCHOUTACK]            =3D 0xEEC,
> +       [ITTRIGOUTACK]          =3D 0xEF0,
> +       [ITCHIN]                =3D 0xEF4,
> +       [ITTRIGIN]              =3D 0xEF8,
> +};
> +

Why not all CTI registers in these arrays?
Do not use hardcoded values in here - use the #defines from the header file=
.


> +static const int cti_extended_offset[] =3D {
> +       [CTIINTACK]             =3D 0x020,
> +       [CTIAPPSET]             =3D 0x004,
> +       [CTIAPPCLEAR]           =3D 0x008,
> +       [CTIAPPPULSE]           =3D 0x00C,
> +       [CTIINEN]               =3D 0x400,
> +       [CTIOUTEN]              =3D 0x800,
> +       [CTITRIGINSTATUS]       =3D 0x040,
> +       [CTITRIGOUTSTATUS]      =3D 0x060,
> +       [CTICHINSTATUS]         =3D 0x080,
> +       [CTICHOUTSTATUS]        =3D 0x084,
> +       [CTIGATE]               =3D 0x088,
> +       [ASICCTL]               =3D 0x08c,
> +       [ITCHINACK]             =3D 0xE70,
> +       [ITTRIGINACK]           =3D 0xE80,
> +       [ITCHOUT]               =3D 0xE74,
> +       [ITTRIGOUT]             =3D 0xEA0,
> +       [ITCHOUTACK]            =3D 0xE78,
> +       [ITTRIGOUTACK]          =3D 0xEC0,
> +       [ITCHIN]                =3D 0xE7C,
> +       [ITTRIGIN]              =3D 0xEE0,
> +};
> +

Again use #defines from header - in this case prehaps a new
qcom-cti.h, #define values QCOM_CTINTACK etc...

>  /*
>   * CTI devices can be associated with a PE, or be connected to CoreSight
>   * hardware. We have a list of all CTIs irrespective of CPU bound or
> @@ -57,6 +106,12 @@ static struct cti_drvdata *cti_cpu_drvdata[NR_CPUS];
>   */
>  DEFINE_CORESIGHT_DEVLIST(cti_sys_devs, "cti_sys");
>
> +u32 cti_offset(struct cti_drvdata *drvdata, int index, int num)
> +{
> +       return (drvdata->is_extended_cti ? cti_extended_offset[index]
> +                       : cti_normal_offset[index]) + (4 * num);

have a pointer to the offset array in drvdata and set it at probe
time. This fn could probalb ybe inlines and then becomes

return drvdata->offsets[index] + (4 * num);


> +}
> +
>  /* write set of regs to hardware - call with spinlock claimed */
>  void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
>  {
> @@ -70,15 +125,15 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvda=
ta)
>
>         /* write the CTI trigger registers */
>         for (i =3D 0; i < config->nr_trig_max; i++) {
> -               writel_relaxed(config->ctiinen[i], drvdata->base + CTIINE=
N(i));
> +               writel_relaxed(config->ctiinen[i], drvdata->base + cti_of=
fset(drvdata, CTIINEN, i));
>                 writel_relaxed(config->ctiouten[i],
> -                              drvdata->base + CTIOUTEN(i));
> +                               drvdata->base + cti_offset(drvdata, CTIOU=
TEN, i));
>         }
>
>         /* other regs */
> -       writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
> -       writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
> -       writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
> +       writel_relaxed(config->ctigate, drvdata->base + cti_offset(drvdat=
a, CTIGATE, 0));
> +       writel_relaxed(config->asicctl, drvdata->base + cti_offset(drvdat=
a, ASICCTL, 0));
> +       writel_relaxed(config->ctiappset, drvdata->base + cti_offset(drvd=
ata, CTIAPPSET, 0));
>
>         /* re-enable CTI */
>         writel_relaxed(1, drvdata->base + CTICONTROL);
> @@ -99,10 +154,13 @@ static int cti_enable_hw(struct cti_drvdata *drvdata=
)
>         if (config->hw_enabled || !config->hw_powered)
>                 goto cti_state_unchanged;
>
> -       /* claim the device */
> -       rc =3D coresight_claim_device(drvdata->csdev);
> -       if (rc)
> -               goto cti_err_not_enabled;
> +       /* There is no relationship between the CLR and SET pair for exte=
nded CTI. */

What does this mean? - these are CoreSight required management
registers required by software to claim the resource. Are they not
present of this device or has the functionality of these registers
been dropped.
Either way this is no longer a Coresight compatible CTI device without thes=
e.

> +       if (!drvdata->is_extended_cti) {
> +               /* claim the device */
> +               rc =3D coresight_claim_device(drvdata->csdev);
> +               if (rc)
> +                       goto cti_err_not_enabled;
> +       }
>
>         cti_write_all_hw_regs(drvdata);
>
> @@ -175,7 +233,8 @@ static int cti_disable_hw(struct cti_drvdata *drvdata=
)
>         writel_relaxed(0, drvdata->base + CTICONTROL);
>         config->hw_enabled =3D false;
>
> -       coresight_disclaim_device_unlocked(csdev);
> +       if (!drvdata->is_extended_cti)
> +               coresight_disclaim_device_unlocked(csdev);
>         CS_LOCK(drvdata->base);
>         raw_spin_unlock(&drvdata->spinlock);
>         return ret;
> @@ -270,8 +329,10 @@ int cti_add_connection_entry(struct device *dev, str=
uct cti_drvdata *drvdata,
>         cti_dev->nr_trig_con++;
>
>         /* add connection usage bit info to overall info */
> -       drvdata->config.trig_in_use |=3D tc->con_in->used_mask;
> -       drvdata->config.trig_out_use |=3D tc->con_out->used_mask;
> +       bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_us=
e,
> +                 tc->con_in->used_mask, drvdata->config.nr_trig_max);
> +       bitmap_or(drvdata->config.trig_out_use, drvdata->config.trig_out_=
use,
> +                 tc->con_out->used_mask, drvdata->config.nr_trig_max);
>
>         return 0;
>  }
> @@ -314,7 +375,6 @@ int cti_add_default_connection(struct device *dev, st=
ruct cti_drvdata *drvdata)
>  {
>         int ret =3D 0;
>         int n_trigs =3D drvdata->config.nr_trig_max;
> -       u32 n_trig_mask =3D GENMASK(n_trigs - 1, 0);
>         struct cti_trig_con *tc =3D NULL;
>
>         /*
> @@ -325,8 +385,9 @@ int cti_add_default_connection(struct device *dev, st=
ruct cti_drvdata *drvdata)
>         if (!tc)
>                 return -ENOMEM;
>
> -       tc->con_in->used_mask =3D n_trig_mask;
> -       tc->con_out->used_mask =3D n_trig_mask;
> +       bitmap_fill(tc->con_in->used_mask, n_trigs);
> +       bitmap_fill(tc->con_out->used_mask, n_trigs);
> +
>         ret =3D cti_add_connection_entry(dev, drvdata, tc, NULL, "default=
");
>         return ret;
>  }
> @@ -339,7 +400,6 @@ int cti_channel_trig_op(struct device *dev, enum cti_=
chan_op op,
>  {
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cti_config *config =3D &drvdata->config;
> -       u32 trig_bitmask;
>         u32 chan_bitmask;
>         u32 reg_value;
>         int reg_offset;
> @@ -349,25 +409,23 @@ int cti_channel_trig_op(struct device *dev, enum ct=
i_chan_op op,
>            (trigger_idx >=3D config->nr_trig_max))
>                 return -EINVAL;
>
> -       trig_bitmask =3D BIT(trigger_idx);
> -
>         /* ensure registered triggers and not out filtered */
>         if (direction =3D=3D CTI_TRIG_IN)   {
> -               if (!(trig_bitmask & config->trig_in_use))
> +               if (!(test_bit(trigger_idx, config->trig_in_use)))
>                         return -EINVAL;
>         } else {
> -               if (!(trig_bitmask & config->trig_out_use))
> +               if (!(test_bit(trigger_idx, config->trig_out_use)))
>                         return -EINVAL;
>
>                 if ((config->trig_filter_enable) &&
> -                   (config->trig_out_filter & trig_bitmask))
> +                   test_bit(trigger_idx, config->trig_out_filter))
>                         return -EINVAL;
>         }
>
>         /* update the local register values */
>         chan_bitmask =3D BIT(channel_idx);
> -       reg_offset =3D (direction =3D=3D CTI_TRIG_IN ? CTIINEN(trigger_id=
x) :
> -                     CTIOUTEN(trigger_idx));
> +       reg_offset =3D (direction =3D=3D CTI_TRIG_IN ? cti_offset(drvdata=
, CTIINEN, trigger_idx) :
> +                       cti_offset(drvdata, CTIOUTEN, trigger_idx));
>
>         raw_spin_lock(&drvdata->spinlock);
>
> @@ -451,19 +509,19 @@ int cti_channel_setop(struct device *dev, enum cti_=
chan_set_op op,
>         case CTI_CHAN_SET:
>                 config->ctiappset |=3D chan_bitmask;
>                 reg_value  =3D config->ctiappset;
> -               reg_offset =3D CTIAPPSET;
> +               reg_offset =3D cti_offset(drvdata, CTIAPPSET, 0);
>                 break;
>
>         case CTI_CHAN_CLR:
>                 config->ctiappset &=3D ~chan_bitmask;
>                 reg_value =3D chan_bitmask;
> -               reg_offset =3D CTIAPPCLEAR;
> +               reg_offset =3D cti_offset(drvdata, CTIAPPCLEAR, 0);
>                 break;
>
>         case CTI_CHAN_PULSE:
>                 config->ctiappset &=3D ~chan_bitmask;
>                 reg_value =3D chan_bitmask;
> -               reg_offset =3D CTIAPPPULSE;
> +               reg_offset =3D cti_offset(drvdata, CTIAPPPULSE, 0);
>                 break;
>
>         default:
> @@ -857,6 +915,19 @@ static void cti_remove(struct amba_device *adev)
>         coresight_unregister(drvdata->csdev);
>  }
>
> +static bool of_is_extended_cti(struct device *dev)
> +{
> +       struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> +
> +       if (is_of_node(fwnode)) {
> +               if (of_device_is_compatible(to_of_node(fwnode),
> +                                           CTI_EXTENDED))
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
>  static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>  {
>         int ret =3D 0;
> @@ -950,9 +1021,11 @@ static int cti_probe(struct amba_device *adev, cons=
t struct amba_id *id)
>         drvdata->csdev_release =3D drvdata->csdev->dev.release;
>         drvdata->csdev->dev.release =3D cti_device_release;
>
> +       drvdata->is_extended_cti =3D of_is_extended_cti(dev);

Better as drvdata->cti_subtype - see comments below.
> +
>         /* all done - dec pm refcount */
>         pm_runtime_put(&adev->dev);
> -       dev_info(&drvdata->csdev->dev, "CTI initialized\n");
> +       dev_info(&drvdata->csdev->dev, "CTI initialized %d\n", drvdata->i=
s_extended_cti);
>         return 0;
>
>  pm_release:
> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drive=
rs/hwtracing/coresight/coresight-cti-platform.c
> index d0ae10bf6128..4bef860a0484 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> @@ -136,8 +136,8 @@ static int cti_plat_create_v8_etm_connection(struct d=
evice *dev,
>                 goto create_v8_etm_out;
>
>         /* build connection data */
> -       tc->con_in->used_mask =3D 0xF0; /* sigs <4,5,6,7> */
> -       tc->con_out->used_mask =3D 0xF0; /* sigs <4,5,6,7> */
> +       bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
> +       bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
>
>         /*
>          * The EXTOUT type signals from the ETM are connected to a set of=
 input
> @@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct de=
vice *dev,
>                 goto of_create_v8_out;
>
>         /* Set the v8 PE CTI connection data */
> -       tc->con_in->used_mask =3D 0x3; /* sigs <0 1> */
> +       bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
>         tc->con_in->sig_types[0] =3D PE_DBGTRIGGER;
>         tc->con_in->sig_types[1] =3D PE_PMUIRQ;
> -       tc->con_out->used_mask =3D 0x7; /* sigs <0 1 2 > */
> +       bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
>         tc->con_out->sig_types[0] =3D PE_EDBGREQ;
>         tc->con_out->sig_types[1] =3D PE_DBGRESTART;
>         tc->con_out->sig_types[2] =3D PE_CTIIRQ;
> @@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct devi=
ce *dev,
>                 goto of_create_v8_out;
>
>         /* filter pe_edbgreq - PE trigout sig <0> */
> -       drvdata->config.trig_out_filter |=3D 0x1;
> +       set_bit(0, drvdata->config.trig_out_filter);
>
>  of_create_v8_out:
>         return ret;
> @@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct cti_trig_g=
rp *tgrp,
>         if (!err) {
>                 /* set the signal usage mask */
>                 for (idx =3D 0; idx < tgrp->nr_sigs; idx++)
> -                       tgrp->used_mask |=3D BIT(values[idx]);
> +                       set_bit(values[idx], tgrp->used_mask);
>         }
>
>         kfree(values);
> @@ -331,7 +331,9 @@ static int cti_plat_process_filter_sigs(struct cti_dr=
vdata *drvdata,
>
>         err =3D cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SI=
GS);
>         if (!err)
> -               drvdata->config.trig_out_filter |=3D tg->used_mask;
> +               bitmap_or(drvdata->config.trig_out_filter,
> +                         drvdata->config.trig_out_filter,
> +                         tg->used_mask, drvdata->config.nr_trig_max);
>
>         kfree(tg);
>         return err;
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/=
hwtracing/coresight/coresight-cti-sysfs.c
> index 572b80ee96fb..cc680a4b900a 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -172,9 +172,8 @@ static struct attribute *coresight_cti_attrs[] =3D {
>
>  /* register based attributes */
>
> -/* Read registers with power check only (no enable check). */
> -static ssize_t coresight_cti_reg_show(struct device *dev,
> -                          struct device_attribute *attr, char *buf)
> +static ssize_t coresight_cti_mgmt_reg_show(struct device *dev,
> +                                          struct device_attribute *attr,=
 char *buf)
>  {
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cs_off_attribute *cti_attr =3D container_of(attr, struct c=
s_off_attribute, attr);
> @@ -189,6 +188,53 @@ static ssize_t coresight_cti_reg_show(struct device =
*dev,
>         return sysfs_emit(buf, "0x%x\n", val);
>  }
>
> +/* Read registers with power check only (no enable check). */
> +static ssize_t coresight_cti_reg_show(struct device *dev,
> +                                     struct device_attribute *attr, char=
 *buf)
> +{
> +       struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> +       struct cs_off_attribute *cti_attr =3D container_of(attr, struct c=
s_off_attribute, attr);
> +       struct cti_config *cfg =3D &drvdata->config;
> +       u32 val =3D 0;
> +       int i, num;
> +       ssize_t size =3D 0;
> +
> +       pm_runtime_get_sync(dev->parent);
> +       raw_spin_lock(&drvdata->spinlock);
> +       if (drvdata->config.hw_powered) {
> +               switch (cti_attr->off) {
> +               case CTICHINSTATUS:
> +               case CTICHOUTSTATUS:
> +               case ITCHINACK:
> +               case ITCHOUT:
> +               case ITCHOUTACK:
> +               case ITCHIN:
> +                       val =3D readl_relaxed(drvdata->base + cti_offset(=
drvdata, cti_attr->off, 0));
> +                       size +=3D sysfs_emit(buf, "0x%x\n", val);
> +                       break;
> +
> +               case CTITRIGINSTATUS:
> +               case CTITRIGOUTSTATUS:
> +               case ITTRIGINACK:
> +               case ITTRIGOUT:
> +               case ITTRIGOUTACK:
> +               case ITTRIGIN:
> +                       num =3D (cfg->nr_trig_max - 1) / 32;
> +                       for (i =3D 0; i <=3D num; i++) {
> +                               val =3D readl_relaxed(drvdata->base +
> +                                               cti_offset(drvdata, cti_a=
ttr->off, i));
> +                               size +=3D sysfs_emit_at(buf, size, "0x%x =
", val);
> +                       }
> +                       if (size > 0)
> +                               buf[size - 1] =3D '\n';
> +                       break;
> +               }
> +       }
> +       raw_spin_unlock(&drvdata->spinlock);
> +       pm_runtime_put_sync(dev->parent);
> +       return size;
> +}
> +
>  /* Write registers with power check only (no enable check). */
>  static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev=
,
>                                                       struct device_attri=
bute *attr,
> @@ -197,19 +243,45 @@ static __maybe_unused ssize_t coresight_cti_reg_sto=
re(struct device *dev,
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cs_off_attribute *cti_attr =3D container_of(attr, struct c=
s_off_attribute, attr);
>         unsigned long val =3D 0;
> +       int num, i;
>
>         if (kstrtoul(buf, 0, &val))
>                 return -EINVAL;
>
>         pm_runtime_get_sync(dev->parent);
>         raw_spin_lock(&drvdata->spinlock);
> -       if (drvdata->config.hw_powered)
> -               cti_write_single_reg(drvdata, cti_attr->off, val);
> +       if (drvdata->config.hw_powered) {
> +               switch (cti_attr->off) {
> +               case ITCHINACK:
> +               case ITCHOUT:
> +                       cti_write_single_reg(drvdata, cti_offset(drvdata,=
 cti_attr->off, 0), val);
> +                       break;
> +
> +               case ITTRIGINACK:
> +               case ITTRIGOUT:
> +               case ITTRIGOUTACK:
> +                       num =3D val / 32;

Why?

> +                       i =3D val % 32;

Why? - "val" is the 32 bit value you want ot put into a 32 bit register.

> +                       for (i =3D 0; i <=3D num; i++)
> +                               cti_write_single_reg(drvdata,
> +                                                    cti_offset(drvdata, =
cti_attr->off, i), BIT(i));

I cannot understand what this code is trying to do. Why is this
attempting to write to multiple registers with some BIT(i) value
rather than the input "val"
e.g. The complete 32biut value "val" should be written to ITTRIGOUT -
which is what the original code did. This breaks the original
functionality

Has this code been tested?

> +                       break;
> +               }
> +       }
> +
>         raw_spin_unlock(&drvdata->spinlock);
>         pm_runtime_put_sync(dev->parent);
>         return size;
>  }
>
> +#define coresight_cti_mgmt_reg(name, offset)                            =
       \
> +       (&((struct cs_off_attribute[]) {                                \
> +          {                                                            \
> +               __ATTR(name, 0444, coresight_cti_mgmt_reg_show, NULL),  \
> +               offset                                                  \
> +          }                                                            \
> +       })[0].attr.attr)
> +
>  #define coresight_cti_reg(name, offset)                                 =
       \
>         (&((struct cs_off_attribute[]) {                                \
>            {                                                            \
> @@ -237,17 +309,17 @@ static __maybe_unused ssize_t coresight_cti_reg_sto=
re(struct device *dev,
>
>  /* coresight management registers */
>  static struct attribute *coresight_cti_mgmt_attrs[] =3D {
> -       coresight_cti_reg(devaff0, CTIDEVAFF0),
> -       coresight_cti_reg(devaff1, CTIDEVAFF1),
> -       coresight_cti_reg(authstatus, CORESIGHT_AUTHSTATUS),
> -       coresight_cti_reg(devarch, CORESIGHT_DEVARCH),
> -       coresight_cti_reg(devid, CORESIGHT_DEVID),
> -       coresight_cti_reg(devtype, CORESIGHT_DEVTYPE),
> -       coresight_cti_reg(pidr0, CORESIGHT_PERIPHIDR0),
> -       coresight_cti_reg(pidr1, CORESIGHT_PERIPHIDR1),
> -       coresight_cti_reg(pidr2, CORESIGHT_PERIPHIDR2),
> -       coresight_cti_reg(pidr3, CORESIGHT_PERIPHIDR3),
> -       coresight_cti_reg(pidr4, CORESIGHT_PERIPHIDR4),
> +       coresight_cti_mgmt_reg(devaff0, CTIDEVAFF0),
> +       coresight_cti_mgmt_reg(devaff1, CTIDEVAFF1),
> +       coresight_cti_mgmt_reg(authstatus, CORESIGHT_AUTHSTATUS),
> +       coresight_cti_mgmt_reg(devarch, CORESIGHT_DEVARCH),
> +       coresight_cti_mgmt_reg(devid, CORESIGHT_DEVID),
> +       coresight_cti_mgmt_reg(devtype, CORESIGHT_DEVTYPE),
> +       coresight_cti_mgmt_reg(pidr0, CORESIGHT_PERIPHIDR0),
> +       coresight_cti_mgmt_reg(pidr1, CORESIGHT_PERIPHIDR1),
> +       coresight_cti_mgmt_reg(pidr2, CORESIGHT_PERIPHIDR2),
> +       coresight_cti_mgmt_reg(pidr3, CORESIGHT_PERIPHIDR3),
> +       coresight_cti_mgmt_reg(pidr4, CORESIGHT_PERIPHIDR4),
>         NULL,
>  };
>
> @@ -284,11 +356,12 @@ static ssize_t cti_reg32_show(struct device *dev, c=
har *buf,
>   * if reg_offset >=3D 0 then write through if enabled.
>   */
>  static ssize_t cti_reg32_store(struct device *dev, const char *buf,
> -                              size_t size, u32 *pcached_val, int reg_off=
set)
> +                              size_t size, u32 *pcached_val, int index)
>  {
>         unsigned long val;
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cti_config *config =3D &drvdata->config;
> +       int reg_offset;
>
>         if (kstrtoul(buf, 0, &val))
>                 return -EINVAL;
> @@ -298,6 +371,7 @@ static ssize_t cti_reg32_store(struct device *dev, co=
nst char *buf,
>         if (pcached_val)
>                 *pcached_val =3D (u32)val;
>
> +       reg_offset =3D cti_offset(drvdata, index, 0);
>         /* write through if offset and enabled */
>         if ((reg_offset >=3D 0) && cti_active(config))
>                 cti_write_single_reg(drvdata, reg_offset, val);
> @@ -306,14 +380,14 @@ static ssize_t cti_reg32_store(struct device *dev, =
const char *buf,
>  }
>
>  /* Standard macro for simple rw cti config registers */
> -#define cti_config_reg32_rw(name, cfgname, offset)                     \
> +#define cti_config_reg32_rw(name, cfgname, index)                      \

Why the pointless change of a parameter name in a macro?

>  static ssize_t name##_show(struct device *dev,                         \
>                            struct device_attribute *attr,               \
>                            char *buf)                                   \
>  {                                                                      \
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);    =
 \
>         return cti_reg32_show(dev, buf,                                 \
> -                             &drvdata->config.cfgname, offset);        \
> +                             &drvdata->config.cfgname, index);         \
>  }                                                                      \
>                                                                         \
>  static ssize_t name##_store(struct device *dev,                         =
       \
> @@ -322,7 +396,7 @@ static ssize_t name##_store(struct device *dev,      =
                       \
>  {                                                                      \
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);    =
 \
>         return cti_reg32_store(dev, buf, size,                          \
> -                              &drvdata->config.cfgname, offset);       \
> +                              &drvdata->config.cfgname, index);        \
>  }                                                                      \
>  static DEVICE_ATTR_RW(name)
>
> @@ -389,7 +463,7 @@ static ssize_t inen_store(struct device *dev,
>
>         /* write through if enabled */
>         if (cti_active(config))
> -               cti_write_single_reg(drvdata, CTIINEN(index), val);
> +               cti_write_single_reg(drvdata, cti_offset(drvdata, CTIINEN=
, index), val);
>         raw_spin_unlock(&drvdata->spinlock);
>         return size;
>  }
> @@ -428,7 +502,7 @@ static ssize_t outen_store(struct device *dev,
>
>         /* write through if enabled */
>         if (cti_active(config))
> -               cti_write_single_reg(drvdata, CTIOUTEN(index), val);
> +               cti_write_single_reg(drvdata, cti_offset(drvdata, CTIOUTE=
N, index), val);
>         raw_spin_unlock(&drvdata->spinlock);
>         return size;
>  }
> @@ -711,10 +785,8 @@ static ssize_t trigout_filtered_show(struct device *=
dev,
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cti_config *cfg =3D &drvdata->config;
>         int size =3D 0, nr_trig_max =3D cfg->nr_trig_max;
> -       unsigned long mask =3D cfg->trig_out_filter;
>
> -       if (mask)
> -               size =3D bitmap_print_to_pagebuf(true, buf, &mask, nr_tri=
g_max);
> +       size =3D bitmap_print_to_pagebuf(true, buf, cfg->trig_out_filter,=
 nr_trig_max);
>         return size;
>  }
>  static DEVICE_ATTR_RO(trigout_filtered);
> @@ -926,9 +998,8 @@ static ssize_t trigin_sig_show(struct device *dev,
>         struct cti_trig_con *con =3D (struct cti_trig_con *)ext_attr->var=
;
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cti_config *cfg =3D &drvdata->config;
> -       unsigned long mask =3D con->con_in->used_mask;
>
> -       return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max=
);
> +       return bitmap_print_to_pagebuf(true, buf, con->con_in->used_mask,=
 cfg->nr_trig_max);
>  }
>
>  static ssize_t trigout_sig_show(struct device *dev,
> @@ -940,9 +1011,8 @@ static ssize_t trigout_sig_show(struct device *dev,
>         struct cti_trig_con *con =3D (struct cti_trig_con *)ext_attr->var=
;
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cti_config *cfg =3D &drvdata->config;
> -       unsigned long mask =3D con->con_out->used_mask;
>
> -       return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max=
);
> +       return bitmap_print_to_pagebuf(true, buf, con->con_out->used_mask=
, cfg->nr_trig_max);
>  }
>
>  /* convert a sig type id to a name */
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtrac=
ing/coresight/coresight-cti.h
> index 8362a47c939c..7d052e76d116 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -18,46 +18,42 @@
>
>  struct fwnode_handle;
>
> -/*
> - * Device registers
> - * 0x000 - 0x144: CTI programming and status
> - * 0xEDC - 0xEF8: CTI integration test.
> - * 0xF00 - 0xFFC: Coresight management registers.
> - */
> -/* CTI programming registers */
> -#define CTICONTROL             0x000
> -#define CTIINTACK              0x010
> -#define CTIAPPSET              0x014
> -#define CTIAPPCLEAR            0x018
> -#define CTIAPPPULSE            0x01C
> -#define CTIINEN(n)             (0x020 + (4 * n))
> -#define CTIOUTEN(n)            (0x0A0 + (4 * n))
> -#define CTITRIGINSTATUS                0x130
> -#define CTITRIGOUTSTATUS       0x134
> -#define CTICHINSTATUS          0x138
> -#define CTICHOUTSTATUS         0x13C
> -#define CTIGATE                        0x140
> -#define ASICCTL                        0x144
> -/* Integration test registers */
> -#define ITCHINACK              0xEDC /* WO CTI CSSoc 400 only*/
> -#define ITTRIGINACK            0xEE0 /* WO CTI CSSoc 400 only*/
> -#define ITCHOUT                        0xEE4 /* WO RW-600 */
> -#define ITTRIGOUT              0xEE8 /* WO RW-600 */
> -#define ITCHOUTACK             0xEEC /* RO CTI CSSoc 400 only*/
> -#define ITTRIGOUTACK           0xEF0 /* RO CTI CSSoc 400 only*/
> -#define ITCHIN                 0xEF4 /* RO */
> -#define ITTRIGIN               0xEF8 /* RO */
> -/* management registers */
> -#define CTIDEVAFF0             0xFA8
> -#define CTIDEVAFF1             0xFAC
> -

Do not remove these from this file. Use them in the .c file to
populate the offset array. See above comments


>  /*
>   * CTI CSSoc 600 has a max of 32 trigger signals per direction.
>   * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
>   * Max of in and out defined in the DEVID register.
>   * - pick up actual number used from .dts parameters if present.
>   */
> -#define CTIINOUTEN_MAX         32
> +#define CTIINOUTEN_MAX         128
> +
> +#define CTICONTROL             0x000
> +
> +/* management registers */
> +#define CTIDEVAFF0             0xFA8
> +#define CTIDEVAFF1             0xFAC
> +
> +enum cti_offset_index {
> +       CTIINTACK,
> +       CTIAPPSET,
> +       CTIAPPCLEAR,
> +       CTIAPPPULSE,
> +       CTIINEN,
> +       CTIOUTEN,
> +       CTITRIGINSTATUS,
> +       CTITRIGOUTSTATUS,
> +       CTICHINSTATUS,
> +       CTICHOUTSTATUS,
> +       CTIGATE,
> +       ASICCTL,
> +       ITCHINACK,
> +       ITTRIGINACK,
> +       ITCHOUT,
> +       ITTRIGOUT,
> +       ITCHOUTACK,
> +       ITTRIGOUTACK,
> +       ITCHIN,
> +       ITTRIGIN,
> +};
>
>  /**
>   * Group of related trigger signals
> @@ -68,7 +64,7 @@ struct fwnode_handle;
>   */
>  struct cti_trig_grp {
>         int nr_sigs;
> -       u32 used_mask;
> +       DECLARE_BITMAP(used_mask, CTIINOUTEN_MAX);
>         int sig_types[];
>  };
>
> @@ -147,9 +143,10 @@ struct cti_config {
>         bool hw_powered;
>
>         /* registered triggers and filtering */
> -       u32 trig_in_use;
> -       u32 trig_out_use;
> -       u32 trig_out_filter;
> +       DECLARE_BITMAP(trig_in_use, CTIINOUTEN_MAX);
> +       DECLARE_BITMAP(trig_out_use, CTIINOUTEN_MAX);
> +       DECLARE_BITMAP(trig_out_filter, CTIINOUTEN_MAX);
> +
>         bool trig_filter_enable;
>         u8 xtrig_rchan_sel;
>
> @@ -180,6 +177,7 @@ struct cti_drvdata {
>         struct cti_config config;
>         struct list_head node;
>         void (*csdev_release)(struct device *dev);
> +       bool is_extended_cti;

use an enum type here - e.g. enum cti_subtype {  ARM_STD_CTI, QCOM_CTI };


>  };
>
>  /*
> @@ -232,6 +230,7 @@ int cti_create_cons_sysfs(struct device *dev, struct =
cti_drvdata *drvdata);
>  struct coresight_platform_data *
>  coresight_cti_get_platform_data(struct device *dev);
>  const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
> +u32 cti_offset(struct cti_drvdata *drvdata, int index, int num);
>
>  /* cti powered and enabled */
>  static inline bool cti_active(struct cti_config *cfg)
> --
> 2.25.1
>

Regards

Mike
--=20
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

