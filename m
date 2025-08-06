Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714A0C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 07:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YF//15yqZSlqqumHm5+I1dKqkACpOoAiiur9eCb1Jyo=; b=cC7dHMn9cftfYSW2+F5B9WyUJs
	J7IvnbBIlQLIp1XYniTjRX4E99pObeZVnzEGa+ARtS2JVDiKl/dVSP2Z1/P3KHDUfEp1do/RHKfg2
	qXjDQbOpOXV70ECE+v/XT6TLr0qgRe+DjuL6qRFAax+p1+BTxvhI/z/WFNfIxWecsrDK7X3xM2aqU
	jZoRKpM1kmrTNJEVeXDG4imDJAao7LYH8beCa+ftHIuMjAsl7DYdrb9SH+7h5Vx3QSE8TuyqsDuU/
	G+5EXzcRE83Q8xObkoQzWcep9iX8tAu1DvbX8wSmfMcNSgqc/TvNZcxWGKB8lALWwL682cxHJ2VxL
	VV+GpHPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYBD-0000000ET5A-2krF;
	Wed, 06 Aug 2025 07:03:19 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujY4q-0000000ERzm-2sUb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 06:56:45 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-76bc5e68e26so6410676b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 23:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754463404; x=1755068204; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YF//15yqZSlqqumHm5+I1dKqkACpOoAiiur9eCb1Jyo=;
        b=TDmrg5bcXwKMT5y1l/rPePMhQGPLD6phpD29/eUrpFWZ9bSsEHaE1Ph1JCBiWpit+r
         sVXlvHiwumyL0uQYOnA28FNtTPJAjTcyBt5fcWUUQzV1kqiz2T12i9oFRbS886qi8+Cj
         ZgKK7McGwI785xuAP48t1r/rMuZRZXiODWCDqaqzT2bzWOYEP9AO9MFGrYgsrrJXZLfq
         Box5je9zNW2BjjIsAc0Ytc2BTvj3y1Y1BHvOiLYdLKVUGkc3j7J870TpGGu+mwjIJLX9
         Vftm4KM7WIv8PaW9LEfvqrLGz228+Ld569mLBALP+v/GM/JE3zaJDSf427SoXHisuzSo
         Ti2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754463404; x=1755068204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YF//15yqZSlqqumHm5+I1dKqkACpOoAiiur9eCb1Jyo=;
        b=L0syOf75qHLeIDNZwhXac8q/8gTtk3S8M5dx4uvPHk40rlvRZUygTHz66RrnHr4aua
         b3/Jq6AngHIAuKdEpqjV7ddYN0OLUJ08nLaiZuIX09R5tOspwZQgqhzCyyUDIyjdF2gn
         VEoiCv23h8+YoSTTIQC0EEVZcg3h5ylCmcWisACvwSMc1dJ0h5iDaBLdX3rJHRdJWI7u
         7LxnA7WgOT5gfG251kHTBJzQce5TnSEZpy2Zx8sCM+VdWcxV2PW3qcrTuRy4SBDsIrOY
         48jVE0hT9E0S3/8nvGw/N2a40L3AmWRwx3Gdlv/nVRnSR36VKCU903u8+pd07OD7/rac
         FCdg==
X-Forwarded-Encrypted: i=1; AJvYcCUtKI8oIxeXXnYr1qE10Sywxd6UXDtTQx40umsWRDAw6CixBla4kjKZyYdeNLD8VDbZOIhtLK+KQHtE/y3L9pFB@lists.infradead.org
X-Gm-Message-State: AOJu0YxkPNy+/5+JM/vvlF26EELBTC1Vrx5MMa9KfKItz9AVasolaxb/
	vv3HYp8C8dLGtPDLdN227tWHmcSjra2LSudeBor/73xzLWEZWtgEdY+b/pjyRxXMHQLJ4HKEg/+
	m5ZyjBPx/9Ph8dBvSIRqNY9LM+eTxSWopJu1KH9XPig==
X-Gm-Gg: ASbGncuRJaEuHV++e519W2YG9ZN4eHXuN3w0py3Av1t9+hwOUb3fnZ4H+T60LUIyEIz
	eui6Pye1QbqLEeADpR9bElyDsBsYIz6w1AynyQwaw83MoHDCIFMsF+/c/Jty7JIyfsVvt03FWwq
	ObFqYgoojJItUhz59PNrn1RLFWpao8ZNkufOJ8GwRnz7H9mPR2J9l16sJvylXsdBueK8mgdqxg+
	wqx1IrF/onIdU2W/y20SHchABCND+OLHlIfLTp0
X-Google-Smtp-Source: AGHT+IG/NnFO90EFyREBzeUJTQVnE81eCptHFDA8wq6F7FCqcH2EFp5FH3fAorJsFe129JIXWBiwYYR+36/rIKv43Tg=
X-Received: by 2002:a05:6a21:339c:b0:233:927b:3ffa with SMTP id
 adf61e73a8af0-2403131d8b2mr2874171637.12.1754463403646; Tue, 05 Aug 2025
 23:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
 <20250725100806.1157-6-jie.gan@oss.qualcomm.com> <CAJ9a7VgYTUsBn8=qtfwmkoS6Lib-8LgESLBDxXrRVqLnScLKZA@mail.gmail.com>
 <70bf0c0c-4a78-4caa-ab86-76a2c99c113a@oss.qualcomm.com>
In-Reply-To: <70bf0c0c-4a78-4caa-ab86-76a2c99c113a@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 6 Aug 2025 07:56:32 +0100
X-Gm-Features: Ac12FXwaby67uLz0_UOrF1Ong2A1ayI6v2u4tME5WMfEjkOI4dnPs8iNbSSg6cs
Message-ID: <CAJ9a7VjTYSePycUrL7jODLD7Vgj-qFHz0rUtfBPDhgKx59xKJA@mail.gmail.com>
Subject: Re: [PATCH v4 05/10] coresight: tmc: Introduce tmc_read_ops to wrap
 read operations
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jinlong Mao <jinlong.mao@oss.qualcomm.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_235644_733386_DDEFB917 
X-CRM114-Status: GOOD (  27.77  )
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

On Wed, 6 Aug 2025 at 07:30, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
>
>
> On 8/5/2025 6:55 PM, Mike Leach wrote:
> > Hi
> >
> > On Fri, 25 Jul 2025 at 11:08, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
> >>
> >> Introduce tmc_read_ops as a wrapper, wrap read operations, for reading
> >> trace data from the TMC buffer.
> >>
> >> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> >> ---
> >>   .../hwtracing/coresight/coresight-tmc-core.c  | 50 +++++++++----------
> >>   drivers/hwtracing/coresight/coresight-tmc.h   | 17 +++++++
> >>   2 files changed, 40 insertions(+), 27 deletions(-)
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> >> index 4d249af93097..f668047c5df4 100644
> >> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> >> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> >> @@ -232,17 +232,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
> >>   {
> >>          int ret = 0;
> >>
> >> -       switch (drvdata->config_type) {
> >> -       case TMC_CONFIG_TYPE_ETB:
> >> -       case TMC_CONFIG_TYPE_ETF:
> >> -               ret = tmc_read_prepare_etb(drvdata);
> >> -               break;
> >> -       case TMC_CONFIG_TYPE_ETR:
> >> -               ret = tmc_read_prepare_etr(drvdata);
> >> -               break;
> >> -       default:
> >> +       if (drvdata->read_ops)
> >> +               ret = drvdata->read_ops->read_prepare(drvdata);
> >> +       else
> >>                  ret = -EINVAL;
> >> -       }
> >>
> >>          if (!ret)
> >>                  dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
> >> @@ -254,17 +247,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
> >>   {
> >>          int ret = 0;
> >>
> >> -       switch (drvdata->config_type) {
> >> -       case TMC_CONFIG_TYPE_ETB:
> >> -       case TMC_CONFIG_TYPE_ETF:
> >> -               ret = tmc_read_unprepare_etb(drvdata);
> >> -               break;
> >> -       case TMC_CONFIG_TYPE_ETR:
> >> -               ret = tmc_read_unprepare_etr(drvdata);
> >> -               break;
> >> -       default:
> >> +       if (drvdata->read_ops)
> >> +               ret = drvdata->read_ops->read_unprepare(drvdata);
> >> +       else
> >>                  ret = -EINVAL;
> >> -       }
> >>
> >>          if (!ret)
> >>                  dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
> >> @@ -291,13 +277,8 @@ static int tmc_open(struct inode *inode, struct file *file)
> >>   static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
> >>                                     char **bufpp)
> >>   {
> >> -       switch (drvdata->config_type) {
> >> -       case TMC_CONFIG_TYPE_ETB:
> >> -       case TMC_CONFIG_TYPE_ETF:
> >> -               return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
> >> -       case TMC_CONFIG_TYPE_ETR:
> >> -               return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
> >> -       }
> >> +       if (drvdata->read_ops)
> >> +               return drvdata->read_ops->get_trace_data(drvdata, pos, len, bufpp);
> >>
> >>          return -EINVAL;
> >>   }
> >> @@ -769,6 +750,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
> >>                          "Valid crash tracedata found\n");
> >>   }
> >>
> >> +static const struct tmc_read_ops tmc_etb_read_ops = {
> >> +       .read_prepare   = tmc_read_prepare_etb,
> >> +       .read_unprepare = tmc_read_unprepare_etb,
> >> +       .get_trace_data = tmc_etb_get_sysfs_trace,
> >> +};
> >> +
> >> +static const struct tmc_read_ops tmc_etr_read_ops = {
> >> +       .read_prepare   = tmc_read_prepare_etr,
> >> +       .read_unprepare = tmc_read_unprepare_etr,
> >> +       .get_trace_data = tmc_etr_get_sysfs_trace,
> >> +};
> >> +
> >>   static int __tmc_probe(struct device *dev, struct resource *res)
> >>   {
> >>          int ret = 0;
> >> @@ -818,6 +811,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
> >>                  desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
> >>                  desc.ops = &tmc_etb_cs_ops;
> >>                  dev_list = &etb_devs;
> >> +               drvdata->read_ops = &tmc_etb_read_ops;
> >>                  break;
> >>          case TMC_CONFIG_TYPE_ETR:
> >>                  desc.groups = coresight_etr_groups;
> >> @@ -831,6 +825,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
> >>                  mutex_init(&drvdata->idr_mutex);
> >>                  dev_list = &etr_devs;
> >>                  INIT_LIST_HEAD(&drvdata->etr_buf_list);
> >> +               drvdata->read_ops = &tmc_etr_read_ops;
> >>                  break;
> >>          case TMC_CONFIG_TYPE_ETF:
> >>                  desc.groups = coresight_etf_groups;
> >> @@ -839,6 +834,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
> >>                  desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
> >>                  desc.ops = &tmc_etf_cs_ops;
> >>                  dev_list = &etf_devs;
> >> +               drvdata->read_ops = &tmc_etb_read_ops;
> >>                  break;
> >>          default:
> >>                  pr_err("%s: Unsupported TMC config\n", desc.name);
> >> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> >> index 3cb8ba9f88f5..2ad8e288c94b 100644
> >> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> >> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> >> @@ -223,6 +223,8 @@ struct etr_buf_node {
> >>          struct list_head        node;
> >>   };
> >>
> >> +struct tmc_read_ops;
> >> +
> >
> > declare the entire structure here rather than later.
>
> There is an issue of declare the entire structure here because the
> function pointer needs use the struct tmc_drvdata which is not defined
> at this point and it will cause a compile error.
>

Understood.

Mike

> Thanks,
> Jie
>
> >
> >>   /**
> >>    * struct tmc_drvdata - specifics associated to an TMC component
> >>    * @pclk:      APB clock if present, otherwise NULL
> >> @@ -259,6 +261,7 @@ struct etr_buf_node {
> >>    *              Used by ETR/ETF.
> >>    * @etr_buf_list: List that is used to manage allocated etr_buf.
> >>    * @reading_node: Available buffer for byte-cntr reading.
> >> + * @tmc_read_ops: Read operations for TMC device.
> >>    */
> >>   struct tmc_drvdata {
> >>          struct clk              *pclk;
> >> @@ -290,6 +293,20 @@ struct tmc_drvdata {
> >>          struct tmc_resrv_buf    crash_mdata;
> >>          struct list_head        etr_buf_list;
> >>          struct etr_buf_node     *reading_node;
> >> +       const struct tmc_read_ops       *read_ops;
> >
> > probably should be named sysfs_read_ops to be consistent with the
> > perf/sysfs differentiation within the rest of the structure
> >
> >> +};
> >> +
> >> +/**
> >> + * struct tmc_read_ops - read operations for TMC and its helper devices
> >> + * @read_prepare:      prepare operation.
> >> + * @read_unprepare:    unprepare operation.
> >> + * @get_trace_data:    read operation.
> >> + */
> >> +struct tmc_read_ops {
> >> +       int (*read_prepare)(struct tmc_drvdata *drvdata);
> >> +       int (*read_unprepare)(struct tmc_drvdata *drvdata);
> >> +       ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
> >> +                                 size_t len, char **bufpp);
> >>   };
> >>
> >>   struct etr_buf_operations {
> >> --
> >> 2.34.1
> >>
> >
> > with the above changes:-
> >
> > Reviewed-by: Mike Leach <mike.leach@linaro.org>
> >
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

