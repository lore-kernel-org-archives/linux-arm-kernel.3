Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60557D1D89D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqw+EebIwHp46cQfn/N8sGyh7QJ3WgTvVo/7sX+WXxA=; b=Uvmte29aMEZUIYYcqUEwJaRbr8
	SpSByBBB4jE0x4JkrTSjuTRPfwLZCiOP1Kd42ll57opNSOkHN2aw46h3q+vcyVR/MjRPOl5TS1V3Z
	j9WxeD2NswEElZgORGwQTI18Nf420TBC0vL/ofyOclT+inJYIS/AVNQV8OngWifsC/uwNgWtbBWho
	mGGPfOED+zXBmkZB0kJXpAOZuq1hGFtwhFSq/yM2FxbffTaoIljdtXf835mMj9wsPqfe42ijBk3jW
	HzsJ1QanjnAy/Mh6UbRKtaBFAh5FGXkTMjijeI8wQk4tqJ0cfP0XbCoptm/268ZrLTYjlwnqdNxNJ
	qyuFMkyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5Jr-00000007jjX-2aR1;
	Thu, 04 Dec 2025 09:08:11 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5Jo-00000007jj3-3NRU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:08:10 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8b2dec4d115so68951885a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 01:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764839287; x=1765444087; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqw+EebIwHp46cQfn/N8sGyh7QJ3WgTvVo/7sX+WXxA=;
        b=cAKBAjtaC6vAv0zM78nnClXfwLqmGRfyVyOfD8oAIIKJwLf7ZxgpCojFaD83AaQD36
         Xlrv5+ZTUZj9MJhMDM09tfs5yVY5dLZsxcR3XiQl17o2UaOzu1OPQXUN79NMcViImBWy
         lC+zBba0R7da2UiOb/WljwKGnzlBlADcbX82zyaPW8FoIAhRTD0+NqW1x7pb6JbIBj8H
         PCYl0mFfkhNwfakhunZKo3/vF2Ao7ArYEWcZ8Ujwep2jRiNx/TFBle3T1TjjIeB9yoQg
         UISyj6WJbBYNnPScwMPVp/FiLhlqp3Pzp0labvSSQz0w1MXjwpCdNXdG59aegLygGYJ/
         teWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764839287; x=1765444087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sqw+EebIwHp46cQfn/N8sGyh7QJ3WgTvVo/7sX+WXxA=;
        b=DO7rW+MhQFgMRndDSVpjUbQG6q0hu1FUYaQprfqtrEzjVHOz6tMteeT9Q8cga2WkK9
         7qX7x6EFzurlq7wfJlqRiQjI+4VBEsJ+6IgloknAPuJGhJynCyUvHRDtQsblsL9zLnD7
         wAwsimOjKiDKsNYMqRDdQm5K+icd1KpjMfsd/p9nvnxfOOAx38DEqFoCc8zQK0nq6hfG
         GP9/vFD6tViCDR2ppWIcaFFnGlghphqGMjMwv67pGmVTeb1mRuTyhvV6O9aN/8jcuzJy
         /OInUG0xt/1cRnE+ig9enbj0X+LLh43CObaE8HVb/b3gs2nWHxRa2eLObrX5fDTUe2Ym
         c0+w==
X-Forwarded-Encrypted: i=1; AJvYcCUOd5dfUxdmQ/+YrzPhRJXVRyj0WJGSHZbF1HwlDWsUey7WmKmFeC/ExTEbz30HML9mf0vL85eJ+Qk2xzEV9U03@lists.infradead.org
X-Gm-Message-State: AOJu0YwrXz22r+PCS87Dl+8ZaAB0YAxLDXP/6tdRfHp4tDsPO4Aify6h
	CjGgJOjb5B1od48/KWE0gf6Q+Vwb99uY8VER42uLqMOln7Wq+Ot5tmGBGp4MKAZ8qXjvbP03+BI
	A5aeqL0+f8eK7N4QH62SJZSoWFRMQyimbpkMvducAZw==
X-Gm-Gg: ASbGncssIO9BU8LfhqtzV8fqOlrawYDPWk5gxpmVOqVPj6ywrzjdDRsuV40lOBpjywD
	aBxU00ZrFMrYN4HApjQ5FdUXB3gG23KrSUNlRVc/GWcqlntvjDzywoEoCfucReL4fN2fjXG2qeu
	w7UumWTKDlZKfV4ruCq4/9vEQ6DjRaPvjmlig//3sEcudxUbU1SH9c2bvaADfKMg2E6nq+nOWYh
	NOu9SP0uKBKN0BNXYjvT9/hb40mPjA0ZyvA7XdATNMYhjqkUCehUi3LleSvVETsKOC6sqfTBLO3
	9DdjxoqImJTruIvwucQ/k68l0gh7
X-Google-Smtp-Source: AGHT+IE9J+bOQdFX1vMwn4fdSL2pnOXzcAuJ3OKNmZ6eUr+QFD4b99YSmQ+nbeCFM7/1kgizeTqGr2Ah5sVAU4Q7+8c=
X-Received: by 2002:a05:620a:45a6:b0:8b2:a3a9:f770 with SMTP id
 af79cd13be357-8b5e763d5fbmr739318585a.83.1764839287280; Thu, 04 Dec 2025
 01:08:07 -0800 (PST)
MIME-Version: 1.0
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com> <20251203182944.GG724103@e132581.arm.com>
In-Reply-To: <20251203182944.GG724103@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 4 Dec 2025 09:07:56 +0000
X-Gm-Features: AWmQ_bl6ZfAKDXx8EUDBO_mc3-_9slRhN7NYgBfyrNb1p1e_w6dSZcWNAtPxVe0
Message-ID: <CAJ9a7VjWDBEwdmMf53geACBWGusC8BC3pJuOLETeecw24+N35Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Leo Yan <leo.yan@arm.com>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, quic_yingdeng@quicinc.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Mao Jinlong <quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_010808_918819_39957203 
X-CRM114-Status: GOOD (  38.40  )
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

On Wed, 3 Dec 2025 at 18:29, Leo Yan <leo.yan@arm.com> wrote:
>
> On Tue, Dec 02, 2025 at 02:42:21PM +0800, Yingchao Deng wrote:
> > The QCOM extended CTI is a heavily parameterized version of ARM=E2=80=
=99s CSCTI.
> > It allows a debugger to send to trigger events to a processor or to sen=
d
> > a trigger event to one or more processors when a trigger event occurs
> > on another processor on the same SoC, or even between SoCs. Qualcomm CT=
I
> > implementation differs from the standard CTI in the following aspects:
> >
> > 1. The number of supported triggers is extended to 128.
> > 2. Several register offsets differ from the CoreSight specification.
>
> I apologize for my late review of this series.  For easier maintenance
> later, I have several comments for register access.
>
> [...]
>
> > +static const u32 cti_normal_offset[] =3D {
> > +     [INDEX_CTIINTACK]               =3D CTIINTACK,
> > +     [INDEX_CTIAPPSET]               =3D CTIAPPSET,
> > +     [INDEX_CTIAPPCLEAR]             =3D CTIAPPCLEAR,
> > +     [INDEX_CTIAPPPULSE]             =3D CTIAPPPULSE,
> > +     [INDEX_CTIINEN]                 =3D CTIINEN(0),
> > +     [INDEX_CTIOUTEN]                =3D CTIOUTEN(0),
>
> I prefer to update the these two macros to CTIINENn and CTIOUTENn, as
> later we will not use CTIINEN(n) and CTIOUTEN(n) anymore.
>
> > +     [INDEX_CTITRIGINSTATUS]         =3D CTITRIGINSTATUS,
> > +     [INDEX_CTITRIGOUTSTATUS]        =3D CTITRIGOUTSTATUS,
> > +     [INDEX_CTICHINSTATUS]           =3D CTICHINSTATUS,
> > +     [INDEX_CTICHOUTSTATUS]          =3D CTICHOUTSTATUS,
> > +     [INDEX_CTIGATE]                 =3D CTIGATE,
> > +     [INDEX_ASICCTL]                 =3D ASICCTL,
> > +     [INDEX_ITCHINACK]               =3D ITCHINACK,
> > +     [INDEX_ITTRIGINACK]             =3D ITTRIGINACK,
> > +     [INDEX_ITCHOUT]                 =3D ITCHOUT,
> > +     [INDEX_ITTRIGOUT]               =3D ITTRIGOUT,
> > +     [INDEX_ITCHOUTACK]              =3D ITCHOUTACK,
> > +     [INDEX_ITTRIGOUTACK]            =3D ITTRIGOUTACK,
> > +     [INDEX_ITCHIN]                  =3D ITCHIN,
> > +     [INDEX_ITTRIGIN]                =3D ITTRIGIN,
> > +     [INDEX_ITCTRL]                  =3D CORESIGHT_ITCTRL,
> > +};
> > +
> > +static const u32 cti_extended_offset[] =3D {
> > +     [INDEX_CTIINTACK]               =3D QCOM_CTIINTACK,
> > +     [INDEX_CTIAPPSET]               =3D QCOM_CTIAPPSET,
> > +     [INDEX_CTIAPPCLEAR]             =3D QCOM_CTIAPPCLEAR,
> > +     [INDEX_CTIAPPPULSE]             =3D QCOM_CTIAPPPULSE,
> > +     [INDEX_CTIINEN]                 =3D QCOM_CTIINEN,
> > +     [INDEX_CTIOUTEN]                =3D QCOM_CTIOUTEN,
> > +     [INDEX_CTITRIGINSTATUS]         =3D QCOM_CTITRIGINSTATUS,
> > +     [INDEX_CTITRIGOUTSTATUS]        =3D QCOM_CTITRIGOUTSTATUS,
> > +     [INDEX_CTICHINSTATUS]           =3D QCOM_CTICHINSTATUS,
> > +     [INDEX_CTICHOUTSTATUS]          =3D QCOM_CTICHOUTSTATUS,
> > +     [INDEX_CTIGATE]                 =3D QCOM_CTIGATE,
> > +     [INDEX_ASICCTL]                 =3D QCOM_ASICCTL,
> > +     [INDEX_ITCHINACK]               =3D QCOM_ITCHINACK,
> > +     [INDEX_ITTRIGINACK]             =3D QCOM_ITTRIGINACK,
> > +     [INDEX_ITCHOUT]                 =3D QCOM_ITCHOUT,
> > +     [INDEX_ITTRIGOUT]               =3D QCOM_ITTRIGOUT,
> > +     [INDEX_ITCHOUTACK]              =3D QCOM_ITCHOUTACK,
> > +     [INDEX_ITTRIGOUTACK]            =3D QCOM_ITTRIGOUTACK,
> > +     [INDEX_ITCHIN]                  =3D QCOM_ITCHIN,
> > +     [INDEX_ITTRIGIN]                =3D QCOM_ITTRIGIN,
> > +     [INDEX_ITCTRL]                  =3D CORESIGHT_ITCTRL,
> > +};
>
> I saw CTI registers are within 4KiB (0x1000), we can don't convert
> standard regiserts and only convert to QCOM register based on the
> standard ones.  So you can drop the cti_normal_offset strucuture and
> only have a cti_reg_qcom_offset[] struct:
>
>   static const u32 cti_extended_offset[] =3D {
>         [CTIINTACK]             =3D QCOM_CTIINTACK,
>         [CTIAPPSET]             =3D QCOM_CTIAPPSET,
>         [CTIAPPCLEAR]           =3D QCOM_CTIAPPCLEAR,
>         [CTIAPPPULSE]           =3D QCOM_CTIAPPPULSE,
>         [CTIINEN]               =3D QCOM_CTIINEN,
>         ...
>   };
>

I suggested the dual offset approach a couple of patchset revisions
ago as it actually simplifies the code & makes it more efficient. The
offset array in use is set during probe and the remaining code is then
common to both without lots of "if qcom else " occurences.

Regards

Mike

> Then you could create two helpers for register address:
>
>     static void __iomem *cti_reg_addr_with_nr(struct cti_drvdata *drvdata=
,
>                                               u32 reg, u32 nr)
>     {
>         /* convert to qcom specific offset */
>         if (unlikely(drvdata->is_qcom_cti))
>             reg =3D cti_extended_offset[reg];
>
>         return drvdata->base + reg + sizeof(u32) * nr;
>     }
>
>     static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, u32 re=
g)
>     {
>         return cti_reg_addr_with_nr(drvdata, reg, 0);
>     }
>
> >  /*
> >   * CTI devices can be associated with a PE, or be connected to CoreSig=
ht
> > @@ -70,15 +119,16 @@ void cti_write_all_hw_regs(struct cti_drvdata *drv=
data)
> >
> >       /* write the CTI trigger registers */
> >       for (i =3D 0; i < config->nr_trig_max; i++) {
> > -             writel_relaxed(config->ctiinen[i], drvdata->base + CTIINE=
N(i));
> > +             writel_relaxed(config->ctiinen[i],
> > +                            drvdata->base + cti_offset(drvdata, INDEX_=
CTIINEN, i));
>
> writel_relaxed(config->ctiinen[i],
>                cti_reg_addr_with_nr(drvdata, CTIINENn, i));
>
> And apply for the same cases below.
>
> >       /* other regs */
> > -     writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
> > -     writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
> > -     writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
> > +     writel_relaxed(config->ctigate, drvdata->base + cti_offset(drvdat=
a, INDEX_CTIGATE, 0));
>
> writel_relaxed(config->ctigate, cti_reg_addr(drvdata, CTIGATE));
>
> And apply for the same cases below.
>
> [...]
>
> > @@ -394,8 +447,8 @@ int cti_channel_trig_op(struct device *dev, enum ct=
i_chan_op op,
> >
> >       /* update the local register values */
> >       chan_bitmask =3D BIT(channel_idx);
> > -     reg_offset =3D (direction =3D=3D CTI_TRIG_IN ? CTIINEN(trigger_id=
x) :
> > -                   CTIOUTEN(trigger_idx));
> > +     reg_offset =3D (direction =3D=3D CTI_TRIG_IN ? cti_offset(drvdata=
, INDEX_CTIINEN, trigger_idx) :
> > +                     cti_offset(drvdata, INDEX_CTIOUTEN, trigger_idx))=
;
>
> For readable, we can improve a bit with code alignment:
>
>   reg_offset =3D (direction =3D=3D CTI_TRIG_IN) ? cti_reg_addr_with_nr(dr=
vdata, CTIINENn, trigger_idx) :
>                                             cti_reg_addr_with_nr(drvdata,=
 CTIOUTENn, trigger_idx);
>
> [...]
>
> > @@ -981,9 +1035,28 @@ static int cti_probe(struct amba_device *adev, co=
nst struct amba_id *id)
> >       drvdata->csdev_release =3D drvdata->csdev->dev.release;
> >       drvdata->csdev->dev.release =3D cti_device_release;
> >
> > +     /* check architect value*/
> > +     devarch =3D readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
> > +     if (CTI_DEVARCH_ARCHITECT(devarch) =3D=3D ARCHITECT_QCOM) {
> > +             drvdata->subtype =3D QCOM_CTI;
> > +             drvdata->offsets =3D cti_extended_offset;
>
> As a result, we can only set the is_qcom_cti flag:
>
>   drvdata->is_qcom_cti =3D true;
>
> > +             /*
> > +              * QCOM CTI does not implement Claimtag functionality as
> > +              * per CoreSight specification, but its CLAIMSET register
> > +              * is incorrectly initialized to 0xF. This can mislead
> > +              * tools or drivers into thinking the component is claime=
d.
> > +              *
> > +              * Reset CLAIMSET to 0 to reflect that no claims are acti=
ve.
> > +              */
> > +             writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
>
> I am confused for this.  If QCOM CTI does not implement claim tag,
> then what is the designed register at the offset CORESIGHT_CLAIMSET?
>
> Should you bypass all claim tag related operations for QCOM CTI case?
> (I don't see you touch anything for claim and declaim tags).
>
> > +     } else {
> > +             drvdata->subtype =3D ARM_STD_CTI;
> > +             drvdata->offsets =3D cti_normal_offset;
> > +     }
> > +
> >       /* all done - dec pm refcount */
> >       pm_runtime_put(&adev->dev);
> > -     dev_info(&drvdata->csdev->dev, "CTI initialized\n");
> > +     dev_info(&drvdata->csdev->dev, "CTI initialized; subtype=3D%d\n",=
 drvdata->subtype);
>
> dev_info(&drvdata->csdev->dev, "%s CTI initialized\n",
>          drvdata->is_qcom_cti ? "QCOM" : "");
>
> >       return 0;
> >
> >  pm_release:
> > diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/driver=
s/hwtracing/coresight/coresight-cti-sysfs.c
> > index a9df77215141..12a495382999 100644
> > --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> > +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> > @@ -172,9 +172,8 @@ static struct attribute *coresight_cti_attrs[] =3D =
{
> >
> >  /* register based attributes */
> >
> > -/* Read registers with power check only (no enable check). */
> > -static ssize_t coresight_cti_reg_show(struct device *dev,
> > -                        struct device_attribute *attr, char *buf)
> > +static ssize_t coresight_cti_mgmt_reg_show(struct device *dev,
> > +                                        struct device_attribute *attr,=
 char *buf)
> >  {
> >       struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> >       struct cs_off_attribute *cti_attr =3D container_of(attr, struct c=
s_off_attribute, attr);
> > @@ -189,6 +188,40 @@ static ssize_t coresight_cti_reg_show(struct devic=
e *dev,
> >       return sysfs_emit(buf, "0x%x\n", val);
> >  }
> >
> > +/* Read registers with power check only (no enable check). */
> > +static ssize_t coresight_cti_reg_show(struct device *dev,
> > +                                   struct device_attribute *attr, char=
 *buf)
> > +{
> > +     struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> > +     struct cs_off_attribute *cti_attr =3D container_of(attr, struct c=
s_off_attribute, attr);
> > +     u32 idx, val =3D 0;
> > +
> > +     pm_runtime_get_sync(dev->parent);
> > +     raw_spin_lock(&drvdata->spinlock);
> > +     idx =3D drvdata->config.ext_reg_sel;
> > +     if (drvdata->config.hw_powered) {
> > +             switch (cti_attr->off) {
> > +             case INDEX_CTITRIGINSTATUS:
> > +             case INDEX_CTITRIGOUTSTATUS:
> > +             case INDEX_ITTRIGINACK:
> > +             case INDEX_ITTRIGOUT:
> > +             case INDEX_ITTRIGOUTACK:
> > +             case INDEX_ITTRIGIN:
> > +                     val =3D readl_relaxed(drvdata->base +
> > +                                         cti_offset(drvdata, cti_attr-=
>off, idx));
> > +                     break;
> > +
> > +             default:
> > +                     val =3D readl_relaxed(drvdata->base + cti_offset(=
drvdata, cti_attr->off, 0));
> > +                     break;
> > +             }
> > +     }
> > +
> > +     raw_spin_unlock(&drvdata->spinlock);
> > +     pm_runtime_put_sync(dev->parent);
> > +     return sysfs_emit(buf, "0x%x\n", val);
> > +}
> > +
> >  /* Write registers with power check only (no enable check). */
> >  static __maybe_unused ssize_t coresight_cti_reg_store(struct device *d=
ev,
> >                                                     struct device_attri=
bute *attr,
> > @@ -197,19 +230,39 @@ static __maybe_unused ssize_t coresight_cti_reg_s=
tore(struct device *dev,
> >       struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> >       struct cs_off_attribute *cti_attr =3D container_of(attr, struct c=
s_off_attribute, attr);
> >       unsigned long val =3D 0;
> > +     u32 idx;
> >
> >       if (kstrtoul(buf, 0, &val))
> >               return -EINVAL;
> >
> >       pm_runtime_get_sync(dev->parent);
> >       raw_spin_lock(&drvdata->spinlock);
> > -     if (drvdata->config.hw_powered)
> > -             cti_write_single_reg(drvdata, cti_attr->off, val);
> > +     idx =3D drvdata->config.ext_reg_sel;
> > +     if (drvdata->config.hw_powered) {
> > +             switch (cti_attr->off) {
> > +             case INDEX_ITTRIGINACK:
> > +             case INDEX_ITTRIGOUT:
> > +                     cti_write_single_reg(drvdata, cti_offset(drvdata,=
 cti_attr->off, idx), val);
> > +                     break;
> > +
> > +             default:
> > +                     cti_write_single_reg(drvdata, cti_offset(drvdata,=
 cti_attr->off, 0), val);
> > +                     break;
> > +             }
> > +     }
>
> For both coresight_cti_reg_show() and coresight_cti_reg_store(), can
> we always use "cti_attr->off" as the offset for regitser access?  I
> mean we don't need the extra config.ext_reg_sel, eventually any
> register we can calculate a offset for it.
>
> >       raw_spin_unlock(&drvdata->spinlock);
> >       pm_runtime_put_sync(dev->parent);
> >       return size;
> >  }
> >
> > +#define coresight_cti_mgmt_reg(name, offset)                         \
> > +     (&((struct cs_off_attribute[]) {                                \
> > +        {                                                            \
> > +             __ATTR(name, 0444, coresight_cti_mgmt_reg_show, NULL),  \
> > +             offset                                                  \
> > +        }                                                            \
> > +     })[0].attr.attr)
> > +
> >  #define coresight_cti_reg(name, offset)                               =
       \
> >       (&((struct cs_off_attribute[]) {                                \
> >          {                                                            \
> > @@ -237,17 +290,17 @@ static __maybe_unused ssize_t coresight_cti_reg_s=
tore(struct device *dev,
> >
> >  /* coresight management registers */
> >  static struct attribute *coresight_cti_mgmt_attrs[] =3D {
> > -     coresight_cti_reg(devaff0, CTIDEVAFF0),
> > -     coresight_cti_reg(devaff1, CTIDEVAFF1),
> > -     coresight_cti_reg(authstatus, CORESIGHT_AUTHSTATUS),
> > -     coresight_cti_reg(devarch, CORESIGHT_DEVARCH),
> > -     coresight_cti_reg(devid, CORESIGHT_DEVID),
> > -     coresight_cti_reg(devtype, CORESIGHT_DEVTYPE),
> > -     coresight_cti_reg(pidr0, CORESIGHT_PERIPHIDR0),
> > -     coresight_cti_reg(pidr1, CORESIGHT_PERIPHIDR1),
> > -     coresight_cti_reg(pidr2, CORESIGHT_PERIPHIDR2),
> > -     coresight_cti_reg(pidr3, CORESIGHT_PERIPHIDR3),
> > -     coresight_cti_reg(pidr4, CORESIGHT_PERIPHIDR4),
> > +     coresight_cti_mgmt_reg(devaff0, CTIDEVAFF0),
> > +     coresight_cti_mgmt_reg(devaff1, CTIDEVAFF1),
> > +     coresight_cti_mgmt_reg(authstatus, CORESIGHT_AUTHSTATUS),
> > +     coresight_cti_mgmt_reg(devarch, CORESIGHT_DEVARCH),
> > +     coresight_cti_mgmt_reg(devid, CORESIGHT_DEVID),
> > +     coresight_cti_mgmt_reg(devtype, CORESIGHT_DEVTYPE),
> > +     coresight_cti_mgmt_reg(pidr0, CORESIGHT_PERIPHIDR0),
> > +     coresight_cti_mgmt_reg(pidr1, CORESIGHT_PERIPHIDR1),
> > +     coresight_cti_mgmt_reg(pidr2, CORESIGHT_PERIPHIDR2),
> > +     coresight_cti_mgmt_reg(pidr3, CORESIGHT_PERIPHIDR3),
> > +     coresight_cti_mgmt_reg(pidr4, CORESIGHT_PERIPHIDR4),
>
> I don't see any benefit for updating from coresight_cti_reg() to
> coresight_cti_mgmt_reg().  If really want to do this, should remove
> the macro coresight_cti_reg()?
>
> >       NULL,
> >  };
> >
> > @@ -258,13 +311,15 @@ static struct attribute *coresight_cti_mgmt_attrs=
[] =3D {
> >   * If inaccessible & pcached_val not NULL then show cached value.
> >   */
> >  static ssize_t cti_reg32_show(struct device *dev, char *buf,
> > -                           u32 *pcached_val, int reg_offset)
> > +                           u32 *pcached_val, int index)
>
> We don't need to change anything for this.  The passed "reg_offset"
> should be always a final offset, no matter for standard CTI or QCOM
> case, the driver directly uses the offset for register access.
>
> [...]
>
> > +/*
> > + * QCOM CTI supports up to 128 triggers, there are 6 registers need to=
 be
> > + * expanded to up to 4 instances, and ext_reg_sel can be used to indic=
ate
> > + * which one is in use.
> > + * CTITRIGINSTATUS, CTITRIGOUTSTATUS,
> > + * ITTRIGIN, ITTRIGOUT,
> > + * ITTRIGINACK, ITTRIGOUTACK.
> > + */
> > +static ssize_t ext_reg_sel_show(struct device *dev,
> > +                             struct device_attribute *attr,
> > +                             char *buf)
> > +{
> > +     u32 val;
> > +     struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> > +
> > +     raw_spin_lock(&drvdata->spinlock);
> > +     val =3D drvdata->config.ext_reg_sel;
> > +     raw_spin_unlock(&drvdata->spinlock);
> > +     return sprintf(buf, "%d\n", val);
> > +}
> > +
> > +static ssize_t ext_reg_sel_store(struct device *dev,
> > +                              struct device_attribute *attr,
> > +                              const char *buf, size_t size)
> > +{
> > +     unsigned long val;
> > +     struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> > +
> > +     if (kstrtoul(buf, 0, &val))
> > +             return -EINVAL;
> > +     if (val > ((drvdata->config.nr_trig_max + 31) / 32 - 1))
> > +             return -EINVAL;
> > +
> > +     raw_spin_lock(&drvdata->spinlock);
> > +     drvdata->config.ext_reg_sel =3D val;
> > +     raw_spin_unlock(&drvdata->spinlock);
> > +     return size;
> > +}
>
> As said, I don't think the trigger register is any different from
> other register access.  So the existed APIs would be sufficient.
>
> As a result, we don't need to add two above functions.
>
> Thanks,
> Leo



--=20
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

