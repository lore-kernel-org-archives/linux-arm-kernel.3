Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A693EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 11:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+BUF8LHMOMHgaoPBg7nP0seKfub+/iuD/KD56FHLno=; b=ki7kiXfX3++kl/hMRt10RZKbOm
	XyJ9FoRBhSlRvaUvBOZsEIVswSTUmWI4npyqZqUXQ6tKoyf5dnDEktv6Pgfbywtm53SxywwDzdJ4z
	aReIJRARQjmDaa4XUGGDXU4TY2+iTrGG1Toj6Q/uXLE3IlYWvxI3RxEExXEjsH99IyB8hSFXTF/iK
	t2Wa+1tQH9p7VFbiddCY9iEXe+Dw/2e4zGdbPScNziro6+dpaLLZyjgxmHI34taULmTkQXU4k5Zd1
	J8sd4X1eRwY0YVo4oMRqXI4iuupxoNFmSGavUHjmPe1Dn7JD5mWkcssUFvGl6u02nsPEoMiZcjP5t
	i49TYI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ii7-00000009O9m-2oYr;
	Tue, 29 Apr 2025 11:01:11 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gmU-000000091q6-1iBg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:57:35 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b074d908e56so4243764a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 01:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745917054; x=1746521854; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+BUF8LHMOMHgaoPBg7nP0seKfub+/iuD/KD56FHLno=;
        b=BlXYK7V/4SYFgeBvbz4uuWzG9674CsUPZdcO7Hw59gRtg8Gr0TtCIH9teBuWXEx3hW
         obgBJhnDUiAKYcmvOqBB97zYYzNAOlJ1v1arZwtcmHk8uhOI+wCV5pJfrzwViUqfIOmW
         M6JUimSOzN2tndiWiQHIdrj/bVtp8ld1wGy2Bu4K16QyUHWnQgtlWNAXaqcEp9Rx4rRD
         YQMgQuWoIqA3Ik2bvOpTad8MTCovpWDKbjzn5sp0ss9L7p3LsfIsqyrIjUpYQhiBR1D3
         CAFZhszokOEKbI3wBnkJc9z8sw+02sHbsVLh8HH/MUV/Mzve5x8L4Ue5lXeYgdq87+g1
         Lv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917054; x=1746521854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+BUF8LHMOMHgaoPBg7nP0seKfub+/iuD/KD56FHLno=;
        b=BlxiG9vIK42owVfhiHdJ8e6dyDN0EJDYzCWrvgVP8kYzQh+Cmw/uQAcZpB6dRemtyA
         8BiHVA2z6qzebsMkRjGNwbEGyRp9Hl0FIK1FQolRO54ez306ju5/xBYjJjYk4VfRmMs4
         FRwUxYDNq6PGF+gdZ/yqiGqyFWj5lpM5jHBbeKnQTUR7Z9cyZRRQNce3FoO1aZ/d1Wc+
         YrJPnFwBLK99JlDLF4SaFXA5n1oj90MDeQd7/f6dg6GGql15EbtBPh2BTYSIpp5d6SEi
         IfrlC5+dtH06OmK82t6nqCGH2eww69S7ETFBUyB7UGTDBT+dCL+8kHwIzEQ3fK2DN5Za
         uJTA==
X-Forwarded-Encrypted: i=1; AJvYcCW3YOUTkxyt+00UJFZySmYrXDabfq5wzi5K1T+y0NCo2Qoz1iS9UqodYeI8s6qe8rR04ghTV38IsHPYBUgY+mYX@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv4HdrddOrwqgrfzZAqV9mPIzokE87gCxNi1KZlGuOIDlvqDjp
	w5WNY4UFoFdmczkc0xaqC5xYbPs/dho1L2QpVvLLqDfPNaQ7o3RYqmlkQTLwvcbjUEtfWvsDUl7
	gcCBme0coqnJqTHRHVsTDUF8mbb27n/PZZmlYNvSsVqUlKjje
X-Gm-Gg: ASbGncuXnlrJ0CpvhZt/xdsKO3YFuhsmmYa0bh4aQsBJdE3Lr2mG0X5HrfQdRSepBt4
	rkhs21vxG3OfRT7HXDbZS6WydVj+bGyhI/2+OVtwEMBvv5wZl171HepBUw/gkg5QUCzFGKtMs1w
	ukV4oNWUQh8VrvcWXs12HpPTc=
X-Google-Smtp-Source: AGHT+IG5Yl9nvPCfoSRm5sLDOpYMtVOVuFMKoyk0otCEWhia2R4jL0cJwcCaLiGNjy7IFBNR2BJGO1AVDTULWpq2WhY=
X-Received: by 2002:a05:6a20:9f9a:b0:1f5:6c7b:8920 with SMTP id
 adf61e73a8af0-2046a3eec69mr15995176637.9.1745917053450; Tue, 29 Apr 2025
 01:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250429071841.1158315-1-quic_jinlmao@quicinc.com> <20250429071841.1158315-3-quic_jinlmao@quicinc.com>
In-Reply-To: <20250429071841.1158315-3-quic_jinlmao@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 29 Apr 2025 09:57:22 +0100
X-Gm-Features: ATxdqUGjZvoPgcDvhcExcGtkdJp4x4O0Bjw0OTl7194Zncz2lPQNbvVuWpWqMsg
Message-ID: <CAJ9a7ViLqe=b+fe+vEZGFWLk3puN1d5V5D6M7mG6f8-QSSs4VQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_015734_467744_EBB2286A 
X-CRM114-Status: GOOD (  32.95  )
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

A few initial comments.

On Tue, 29 Apr 2025 at 08:19, Mao Jinlong <quic_jinlmao@quicinc.com> wrote:
>
> The QCOM extended CTI is a heavily parameterized version of ARM=E2=80=99s=
 CSCTI.
> It allows a debugger to send to trigger events to a processor or to send
> a trigger event to one or more processors when a trigger event occurs
> on another processor on the same SoC, or even between SoCs. For Qualcomm
> extended CTI, it supports up to 128 triggers.
>
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../hwtracing/coresight/coresight-cti-core.c  | 127 ++++++++++++++----
>  .../coresight/coresight-cti-platform.c        |  16 ++-
>  .../hwtracing/coresight/coresight-cti-sysfs.c | 124 +++++++++++++----
>  drivers/hwtracing/coresight/coresight-cti.h   |  72 +++++-----
>  4 files changed, 240 insertions(+), 99 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/h=
wtracing/coresight/coresight-cti-core.c
> index d2b5a5718c29..7fb5d31b0557 100644
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
> +       0x010,          /* CTIINTACK */
> +       0x014,          /* CTIAPPSET */
> +       0x018,          /* CTIAPPCLEAR */
> +       0x01C,          /* CTIAPPPULSE */
> +       0x020,          /* CTIINEN */
> +       0x0A0,          /* CTIOUTEN */
> +       0x130,          /* CTITRIGINSTATUS */
> +       0x134,          /* CTITRIGOUTSTATUS */
> +       0x138,          /* CTICHINSTATUS */
> +       0x13C,          /* CTICHOUTSTATUS */
> +       0x140,          /* CTIGATE */
> +       0x144,          /* ASICCTL */
> +       0xEDC,          /* ITCHINACK */
> +       0xEE0,          /* ITTRIGINACK */
> +       0xEE4,          /* ITCHOUT */
> +       0xEE8,          /* ITTRIGOUT */
> +       0xEEC,          /* ITCHOUTACK */
> +       0xEF0,          /* ITTRIGOUTACK */
> +       0xEF4,          /* ITCHIN */
> +       0xEF8,          /* ITTRIGIN */
> +};
> +
> +static const int cti_extended_offset[] =3D {
> +       0x020,          /* CTIINTACK */
> +       0x004,          /* CTIAPPSET */
> +       0x008,          /* CTIAPPCLEAR */
> +       0x00C,          /* CTIAPPPULSE */
> +       0x400,          /* CTIINEN */
> +       0x800,          /* CTIOUTEN */
> +       0x040,          /* CTITRIGINSTATUS */
> +       0x060,          /* CTITRIGOUTSTATUS */
> +       0x080,          /* CTICHINSTATUS */
> +       0x084,          /* CTICHOUTSTATUS */
> +       0x088,          /* CTIGATE */
> +       0x08c,          /* ASICCTL */
> +       0xE70,          /* ITCHINACK */
> +       0xE80,          /* ITTRIGINACK */
> +       0xE74,          /* ITCHOUT */
> +       0xEA,           /* ITTRIGOUT */
> +       0xE78,          /* ITCHOUTACK */
> +       0xEC0,          /* ITTRIGOUTACK */
> +       0xE7C,          /* ITCHIN */
> +       0xEE0,          /* ITTRIGIN */
> +};
> +
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
fset(drvdata, CTIINEN, 0));

This changes the functionality - why is 'i' dropped - this looks like
it repeatedly writes to the same register, rather than all the trigger
registers.

>                 writel_relaxed(config->ctiouten[i],
> -                              drvdata->base + CTIOUTEN(i));
> +                              drvdata->base + cti_offset(drvdata, CTIOUT=
EN, 0));
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

The CLAIMSET and CLAIMCLR registers are a CoreSight architectural
requirement. I do not understand what this comment means.
The set/clr registers must be used to claim the resource to prevent
external debug agents from using the resource when it is used by the
OS and vice versa.
This still applies to any CoreSight compliant component - including
the extended CTI you have here.

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
>         spin_unlock(&drvdata->spinlock);
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
> +                       tc->con_in->used_mask, drvdata->config.nr_trig_ma=
x);
> +       bitmap_or(drvdata->config.trig_out_use, drvdata->config.trig_out_=
use,
> +                       tc->con_out->used_mask, drvdata->config.nr_trig_m=
ax);
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
> +                       test_bit(trigger_idx, config->trig_out_filter))
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
> +                     cti_offset(drvdata, CTIOUTEN, trigger_idx));
>
>         spin_lock(&drvdata->spinlock);
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
> +static bool is_extended_cti(struct device *dev)

you may want to call this of_is_extended_cti()

> +{
> +       struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> +
> +       if (is_of_node(fwnode)) {
> +               if (of_device_is_compatible(to_of_node(fwnode),
> +                               CTI_EXTENDED))
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
>  static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>  {
>         int ret =3D 0;
> @@ -948,9 +1019,11 @@ static int cti_probe(struct amba_device *adev, cons=
t struct amba_id *id)
>         drvdata->csdev_release =3D drvdata->csdev->dev.release;
>         drvdata->csdev->dev.release =3D cti_device_release;
>
> +       drvdata->is_extended_cti =3D is_extended_cti(dev);
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
> index d0ae10bf6128..f5c25748ca30 100644
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
> +                               drvdata->config.trig_out_filter,
> +                               tg->used_mask, drvdata->config.nr_trig_ma=
x);
>
>         kfree(tg);
>         return err;
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/=
hwtracing/coresight/coresight-cti-sysfs.c
> index d25dd2737b49..0c15b9c9f125 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -172,8 +172,7 @@ static struct attribute *coresight_cti_attrs[] =3D {
>
>  /* register based attributes */
>
> -/* Read registers with power check only (no enable check). */
> -static ssize_t coresight_cti_reg_show(struct device *dev,
> +static ssize_t coresight_cti_mgmt_reg_show(struct device *dev,
>                            struct device_attribute *attr, char *buf)
>  {

Revers this change - the new coresight_cti_reg_show does not appear to
be called anywhere.

>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> @@ -189,6 +188,52 @@ static ssize_t coresight_cti_reg_show(struct device =
*dev,
>         return sysfs_emit(buf, "0x%x\n", val);
>  }
>
> +/* Read registers with power check only (no enable check). */
> +static ssize_t coresight_cti_reg_show(struct device *dev,
> +                          struct device_attribute *attr, char *buf)

This function appears to never be called. Drop it.

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
> +       spin_lock(&drvdata->spinlock);
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
> +                               size +=3D sysfs_emit_at(buf, size, "0x%x\=
n", val);

Multi-line output in sysfs is generally not permiitted. 1 file, 1 line.

> +                       }
> +                       break;
> +               }
> +
> +       }
> +       spin_unlock(&drvdata->spinlock);
> +       pm_runtime_put_sync(dev->parent);
> +       return size;
> +}
> +
>  /* Write registers with power check only (no enable check). */
>  static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev=
,
>                                                       struct device_attri=
bute *attr,
> @@ -197,19 +242,44 @@ static __maybe_unused ssize_t coresight_cti_reg_sto=
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
>         spin_lock(&drvdata->spinlock);
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
> +                       i =3D val % 32;
> +                       for (i =3D 0; i <=3D num; i++)
> +                               cti_write_single_reg(drvdata,
> +                                               cti_offset(drvdata, cti_a=
ttr->off, i), BIT(i));
> +                       break;
> +               }
> +       }

This appears to write multiple registers from a single value? Should
only wrtie one?
>         spin_unlock(&drvdata->spinlock);
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
> @@ -237,17 +307,17 @@ static __maybe_unused ssize_t coresight_cti_reg_sto=
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
> @@ -284,11 +354,12 @@ static ssize_t cti_reg32_show(struct device *dev, c=
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
> @@ -298,6 +369,7 @@ static ssize_t cti_reg32_store(struct device *dev, co=
nst char *buf,
>         if (pcached_val)
>                 *pcached_val =3D (u32)val;
>
> +       reg_offset =3D cti_offset(drvdata, index, 0);
>         /* write through if offset and enabled */
>         if ((reg_offset >=3D 0) && cti_active(config))
>                 cti_write_single_reg(drvdata, reg_offset, val);
> @@ -306,14 +378,14 @@ static ssize_t cti_reg32_store(struct device *dev, =
const char *buf,
>  }
>
>  /* Standard macro for simple rw cti config registers */
> -#define cti_config_reg32_rw(name, cfgname, offset)                     \
> +#define cti_config_reg32_rw(name, cfgname, index)                      \
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
> @@ -322,7 +394,7 @@ static ssize_t name##_store(struct device *dev,      =
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
> @@ -389,7 +461,7 @@ static ssize_t inen_store(struct device *dev,
>
>         /* write through if enabled */
>         if (cti_active(config))
> -               cti_write_single_reg(drvdata, CTIINEN(index), val);
> +               cti_write_single_reg(drvdata, cti_offset(drvdata, CTIINEN=
, index), val);
>         spin_unlock(&drvdata->spinlock);
>         return size;
>  }
> @@ -428,7 +500,7 @@ static ssize_t outen_store(struct device *dev,
>
>         /* write through if enabled */
>         if (cti_active(config))
> -               cti_write_single_reg(drvdata, CTIOUTEN(index), val);
> +               cti_write_single_reg(drvdata, cti_offset(drvdata, CTIOUTE=
N, index), val);
>         spin_unlock(&drvdata->spinlock);
>         return size;
>  }
> @@ -711,10 +783,8 @@ static ssize_t trigout_filtered_show(struct device *=
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
> @@ -926,9 +996,8 @@ static ssize_t trigin_sig_show(struct device *dev,
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
> @@ -940,9 +1009,8 @@ static ssize_t trigout_sig_show(struct device *dev,
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
> index cb9ee616d01f..642f4b2be93c 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -18,45 +18,41 @@
>  #include "coresight-priv.h"
>
>  /*
> - * Device registers
> - * 0x000 - 0x144: CTI programming and status
> - * 0xEDC - 0xEF8: CTI integration test.
> - * 0xF00 - 0xFFC: Coresight management registers.
> + * CTI CSSoc 600 has a max of 32 trigger signals per direction.
> + * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
> + * Max of in and out defined in the DEVID register.
> + * - pick up actual number used from .dts parameters if present.
>   */
> -/* CTI programming registers */
> +#define CTIINOUTEN_MAX         128
> +
>  #define CTICONTROL             0x000
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
> +
>  /* management registers */
>  #define CTIDEVAFF0             0xFA8
>  #define CTIDEVAFF1             0xFAC
>
> -/*
> - * CTI CSSoc 600 has a max of 32 trigger signals per direction.
> - * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
> - * Max of in and out defined in the DEVID register.
> - * - pick up actual number used from .dts parameters if present.
> - */
> -#define CTIINOUTEN_MAX         32
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
> @@ -67,7 +63,7 @@
>   */
>  struct cti_trig_grp {
>         int nr_sigs;
> -       u32 used_mask;
> +       DECLARE_BITMAP(used_mask, CTIINOUTEN_MAX);
>         int sig_types[];
>  };
>
> @@ -146,9 +142,9 @@ struct cti_config {
>         bool hw_powered;
>
>         /* registered triggers and filtering */
> -       u32 trig_in_use;
> -       u32 trig_out_use;
> -       u32 trig_out_filter;
> +       DECLARE_BITMAP(trig_in_use, CTIINOUTEN_MAX);
> +       DECLARE_BITMAP(trig_out_use, CTIINOUTEN_MAX);
> +       DECLARE_BITMAP(trig_out_filter, CTIINOUTEN_MAX);
>         bool trig_filter_enable;
>         u8 xtrig_rchan_sel;
>
> @@ -179,6 +175,7 @@ struct cti_drvdata {
>         struct cti_config config;
>         struct list_head node;
>         void (*csdev_release)(struct device *dev);
> +       bool is_extended_cti;
>  };
>
>  /*
> @@ -231,6 +228,7 @@ int cti_create_cons_sysfs(struct device *dev, struct =
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

