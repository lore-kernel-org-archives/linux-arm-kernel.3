Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C9FD1D899
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVHCpHtQVW7oVknV3GXOrLI7oUUH5Agyd8+pzjccO1Q=; b=jMrbLTdokHDFx69F6EdBD5/86F
	PbhAnG8ZPB2lhEOkQcxyxK23KTwh7uvTzfpthpT0kkWkTLeTmUuvFVEeBfVTRmcDnCzccwWW8m/MB
	2RgWGYmEPNwdN4krMwKtRYtHJmpRkwwRsrPWSxmsWFQTth/Zg0tiN6mNCNOxNNIP56rkhcDcm4/hc
	8vvEtXGTCS4y/Ph9pEME0LYO5a/73c42Mji03BrC+Nobb6ry2zj+m2urUh+gsuqvP1mKsr5D3D7OE
	gzz8cbE2Id6bXlqVig0h1PyJ+BS0O0PSgp0KjwUa2w10DNxWBBuukgWALxQ/kqx7U1KE9ypmzLyB+
	b89iw+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5G6-00000007jPX-2rxj;
	Thu, 04 Dec 2025 09:04:18 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5G3-00000007jP4-16tw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:04:16 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-8b31a665ba5so65286585a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 01:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764839054; x=1765443854; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AVHCpHtQVW7oVknV3GXOrLI7oUUH5Agyd8+pzjccO1Q=;
        b=EWtRDAJ+danmCjN1FR6cIHoXIHGqnHhO/oFaPcaVslfy6hcJfM4SKPFRxwFaUj7iBB
         EYXfCkeXqus3+2rk5a1b5LMV7pcCqMl3VWgLz2jhwlpepYycyw2MFHAdK2L4llx+7mHD
         lDkF51Glx29jF51zvy2Ld9FXiRvK+Yudhi4L80tzCt5RefAMwRcIn/NdgOMDPpKMjKYp
         ojVbT/2Js3ApU42AFIWoveBTAnk/atERY7YvT9FvzdXltXBFtRaFlA0ak2IC+l0M8BZx
         by5EqBWY6VZow+/kkKIKa7Q7U62GBqmAXpUhax8JOJ1gBBGtaaPOywcPx9MAna0MOl9e
         t4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764839054; x=1765443854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVHCpHtQVW7oVknV3GXOrLI7oUUH5Agyd8+pzjccO1Q=;
        b=T9XsHJjzCFRJ5dRmkEG/r6qgK1YkowTjAHytm6fngYsLWyiviKIsNvLAsvyueLdbvC
         YPRt/kGzlF+MvFATgma6d4a7Q5C5w7+ZeT0IkYwTxfmFDg7Lq4tYLJkuG0aArU1sQagO
         Fj9KLqspZaqG74zzQRMMr8e6SsSMsR5MpaZ8Pzq3Iy53BaU+opWBrSA0CIr4/rhLxF5B
         8roMcCmHPDwtrmNul13sLHXwpw52s1mz/N0bBgItxvTaqHe1TQE6/cWFANHQpktbiW5P
         eyGWkvjvw7pAUsZIIQbz1NeP0AjXofcuCbd8zLM2vnTmGh2H0aS9KmszTod5qBcrISs7
         O2gw==
X-Forwarded-Encrypted: i=1; AJvYcCV/KngiG0bslD/1YL1YezT4n5T/ItpuOw+QwDyDJr5Yz7dHhnbIjuJhXkyCxzuajc3lp0p5U2LlnpeoXwkvXSFo@lists.infradead.org
X-Gm-Message-State: AOJu0YwcESnZ0GYRsmqf92Aegeamt7HecPCd8Y/9GRgs39NarYqisRfh
	ERu2z5mWtvrlflDB8ClGV1RL8DKbHYi0WuvWFLaOOSXN2IjA1YZ56JjjIaQ1vaGpFpQymsWl3bM
	z9LgrWVplHSHzRmDl+aqTWizU5hUeEn73H6wqe8I+T+fLBaAcR87I
X-Gm-Gg: ASbGncsm3J7pwCqAVBJ7xza4IEoY/lG4Zt6W8412J1lQFI57MwwKVBvCi1B+pfoKApo
	3eb7GnaxYuM9KFT2o+eSU72t2q7iY2xM3LQj45AQCY/9lAasLbGFdsYqO7Sd0oEC/Jh1gzs1MR3
	7VUcHdv0f27M0WXDwSizBd27tWE9WVLpDrv/MoIfJtKlB4McKw8Or2Lk54qvvarRh1EA6kfC6lh
	55xAa1R6Jqui34gHCh0VGiIxHt3t6kBLLYGFTaw09KkZY44tioz5Sfoh6uHEKGh4TDMbgCIuc2Z
	TrZm0utJgWDm6QNipj4LmiZ73AXD
X-Google-Smtp-Source: AGHT+IHAefwJNrPXIdvcD0VC8H+/6pCL2G+K3lmWUTMCJWZonyOLlPRSIG/rYZOBua+bNHZe4bQwsh7kr7hshZa3Yug=
X-Received: by 2002:a05:620a:472c:b0:8b1:7c0c:e292 with SMTP id
 af79cd13be357-8b61817298cmr291244285a.38.1764839053919; Thu, 04 Dec 2025
 01:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com> <20251204083802.GI724103@e132581.arm.com>
In-Reply-To: <20251204083802.GI724103@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 4 Dec 2025 09:04:03 +0000
X-Gm-Features: AWmQ_bk3JsrCv_qVCQKeYV3ob7uzVgQRApMkr_SYTS_68B4wgVQYuo_3fUOblcg
Message-ID: <CAJ9a7VhNW6cQt_O6NX+99LXfo-t3mFTejzdNjWcyssbMrXR4OQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Leo Yan <leo.yan@arm.com>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, quic_yingdeng@quicinc.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Mao Jinlong <quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_010415_315310_91FA09A6 
X-CRM114-Status: GOOD (  24.64  )
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

On Thu, 4 Dec 2025 at 08:38, Leo Yan <leo.yan@arm.com> wrote:
>
> On Wed, Dec 03, 2025 at 06:29:44PM +0000, Coresight ML wrote:
>
> [...]
>
> > > +/* Read registers with power check only (no enable check). */
> > > +static ssize_t coresight_cti_reg_show(struct device *dev,
> > > +                                 struct device_attribute *attr, char *buf)
> > > +{
> > > +   struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > > +   struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
> > > +   u32 idx, val = 0;
> > > +
> > > +   pm_runtime_get_sync(dev->parent);
> > > +   raw_spin_lock(&drvdata->spinlock);
> > > +   idx = drvdata->config.ext_reg_sel;
> > > +   if (drvdata->config.hw_powered) {
> > > +           switch (cti_attr->off) {
> > > +           case INDEX_CTITRIGINSTATUS:
> > > +           case INDEX_CTITRIGOUTSTATUS:
> > > +           case INDEX_ITTRIGINACK:
> > > +           case INDEX_ITTRIGOUT:
> > > +           case INDEX_ITTRIGOUTACK:
> > > +           case INDEX_ITTRIGIN:
>
> I read again and now I understand why you need "config.ext_reg_sel"
> as an index for these expending registers.
>

Having this index for these extended registers matches what we do for
the INEN and OUTEN registers. This gives the user a consistent
approach. We do not want the unnecessary attributes as  it will
increase the memory footprint for all cti instances, not just the qcom
ones.

The first patch in this series works to reduce the memory footprint by
only allocating resource based on the actual configuration. For
example for an ARM designed CTI with 8 trigger registers, we no longer
declare static 128 x 32 bit arrays for each of INEN and OUTEN which
were required by the original design.

Given that there can be 10s or 100s of CTIs in a large multicore
system, reducing the footprint to match the actual configuration, and
offering a level of compression by using an index + single file to
access a set of registers improves the efficiency of the driver.

Regards

Mike

> I think you should extend attrs for the new adding registers:
>
>   static struct attribute *coresight_cti_regs_attrs[] = {
>       ...
>       coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
>       /* Qcom CTI only for triginstatus1/2/3 */
>       coresight_cti_reg(triginstatus1, CTITRIGINSTATUS + 0x4),
>       coresight_cti_reg(triginstatus2, CTITRIGINSTATUS + 0x8),
>       coresight_cti_reg(triginstatus3, CTITRIGINSTATUS + 0xc),
>       ...
>   }
>
> Then, you can add a is_visible() in coresight_cti_regs_group:
>
>   static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
>                   struct attribute *attr, int n)
>   {
>           struct device *dev = container_of(kobj, struct device, kobj);
>           struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>
>           /* Mute QCOM CTI registers for standard CTI module */
>           if (!drvdata->is_qcom_cti) {
>               if (attr == &triginstatus1.attr ||
>                   attr == &triginstatus2.attr ||
>                   attr == &triginstatus3.attr)
>                   return 0;
>           }
>
>           return attr->mode;
>   }
>
>   static const struct attribute_group coresight_cti_regs_group = {
>           .attrs = coresight_cti_regs_attrs,
>           .name = "regs",
>           .is_visible = coresight_cti_regs_is_visible,
>   };
>
> Thanks,
> Leo



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

