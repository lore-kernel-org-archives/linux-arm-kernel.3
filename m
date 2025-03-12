Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F406C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P41L4c+Opb1IQnEi9LDyI8HBaw91mzMN/9HEGsnySy8=; b=BBppobCsxwLqRPr3Ms/rhEVJRE
	UUmQ19azxjZrN0MdR5wrkFiC8VP4rhZaJfcdQWISigAunI1xGBpeE1M8bw2TNq9HYi62VD68v/L4v
	DX1rbVBx6YvZEdJ20c23Iq3rcGy+Kz1OXRM5GM4qzKsovTIRosIKXj3MfeTul3EWs7gMy6BkuN04X
	SwpO9Ap4YfxnfwFb5eVptBJjkl6ncPg1ngORaivyYVhl8aC/L7DvrowHLtAma+oaPli+WiL+TQXJj
	immfLpYkUkInVlX2kZlvXsAzAFsxpz20DyDGnVWk69K8RKw/Nnfh7t8EbOqH4RJETth1IGw95e4tD
	SFCXyGOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMwx-00000008flM-0cjK;
	Wed, 12 Mar 2025 14:20:47 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLbp-00000008TNV-1x1T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 12:54:54 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22409077c06so38041945ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 05:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741784093; x=1742388893; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P41L4c+Opb1IQnEi9LDyI8HBaw91mzMN/9HEGsnySy8=;
        b=r7PdN2vq1KKEGp6TZ2TwGY8KucA4cCeZxrLiwS0HowM4XCpzcLlXkhpsZJU/MS2lH0
         u599i1fcVexYkTKpsbAz1ewW/hO2DV5oo3VNHkDc5VYrKUmUoNuri5RRTh8vtkNpFIhS
         BG5CMeVR6IhjfwmmAE/gRXMQGkM9O3WkHv5Qu6Da61/sV1k2hS38T/2bEZTdbGS+xeYS
         JufozBkD4xxnlnbOY397tSyEG9OqWdDaAokDX3xGpyd/rZ+NNKRyZQ9EndjwHMJjrwIK
         HSsXIFIVSSn4Y14Y7KRYNrRxn6j2PT0OTVrCVngr/i5lw/EM5eYgldym8SSa1LCEPtAF
         t/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741784093; x=1742388893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P41L4c+Opb1IQnEi9LDyI8HBaw91mzMN/9HEGsnySy8=;
        b=iOsEXi+0jd+s80zLJP+Mos9EIgr/5dI6Pfm32BrV+fnQObrOeALqqpGQOr+e5wY9g6
         A6qgBz40vfe6WCe8xPI2L6YwQakQS9P1sSi0goMQvFYQ69dk6JHrUL0TcG5lP0x8MiYV
         uCJiHgJQ0CfWPX3BtqwCy/P859QEyDHlgsY+2gIWkE4j79krAUnWWd8MmWOQjydxASB3
         bkfWIZX3fEgLs83s+J7CiDjNxOepUVLnEYCUkGZwr8QHnRwwSg6T3jTzXMFH3ibtCrGF
         DiyuEwAP6sXMKspLIq52qkwNVYOgRRv5N1vPCBotVtdHgF48JYsjO897Jh94CIXIosu9
         jaRA==
X-Forwarded-Encrypted: i=1; AJvYcCUsSnlFRJZ0LPzNeon6ick/kk93HczcT4+qHKLrPy1VhwZG4UywYAXg4wZLzn4URb+Ao7ARrg8s+ojRSwxW7/+g@lists.infradead.org
X-Gm-Message-State: AOJu0YyWTXjDy/y4RQjfN3kO+PvItRnlh5DmGJ9DpGpcdDocOtJnZCti
	hbJDtx0++MICQZMgjVKjooaJhzN7E9koNGr+dcLHDTJ+LqjAPyjKn0oM+VERM9KhwJi19TxcuO/
	WFwd4b/TDtHx23qGYaYdHcJ75wlfJszNWcCKTvw==
X-Gm-Gg: ASbGncu0fjwD4mE4NntEm73ygMtSLOhj+NokfnVF1fnI5mKsP3xpcM2VDhyljq7N5QW
	xP4243tBDemvG97mgVFGExN+4OhCGsIumgd2fG8vCNCHOed/7Mug2PBYlK/n3he7AuUSH1/3TfU
	ylxwR8tbyqFiGnQjgOi59EPILc64U=
X-Google-Smtp-Source: AGHT+IEmvzgsrnWJ3LS9iuiefnI5/Y1q51JDiJPKEl1YavKMn2nS0Mp6TQ/OYLWI5gnSPzE5ELMRM9TgS5WSMkJCuv0=
X-Received: by 2002:a05:6a00:194b:b0:736:5e6f:295b with SMTP id
 d2e1a72fcca58-736aaa5d6c4mr32299739b3a.12.1741784092687; Wed, 12 Mar 2025
 05:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
 <20250310090407.2069489-2-quic_jiegan@quicinc.com> <CAJ9a7Vh7PmBBbvwnUETfCYrTSiXNzeiWpsz+XAGaUWt1Rq1aZw@mail.gmail.com>
 <cef984d5-f369-4892-b970-a71285c2ebc5@quicinc.com>
In-Reply-To: <cef984d5-f369-4892-b970-a71285c2ebc5@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 12 Mar 2025 12:54:41 +0000
X-Gm-Features: AQ5f1JrjHjNAhBmSqhZ9QdvfeDjrNBtawx-M2q_IwgCWoudUHO1tG95UqLFNpqQ
Message-ID: <CAJ9a7VhDD3813LtH_5AYyM-2mhCNP+vRmqXn4RWqg5F8FEe-Mg@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] coresight: tmc: Introduce new APIs to get the RWP
 offset of ETR buffer
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_055453_509256_4313DBBF 
X-CRM114-Status: GOOD (  50.03  )
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

Hi Jie,

On Wed, 12 Mar 2025 at 01:21, Jie Gan <quic_jiegan@quicinc.com> wrote:
>
>
>
> On 3/12/2025 12:49 AM, Mike Leach wrote:
> > Hi,
> >
> > On Mon, 10 Mar 2025 at 09:04, Jie Gan <quic_jiegan@quicinc.com> wrote:
> >>
> >> The new functions calculate and return the offset to the write pointer of
> >> the ETR buffer based on whether the memory mode is SG, flat or reserved.
> >> The functions have the RWP offset can directly read data from ETR buffer,
> >> enabling the transfer of data to any required location.
> >>
> >> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> >> ---
> >>   .../hwtracing/coresight/coresight-tmc-etr.c   | 40 +++++++++++++++++++
> >>   drivers/hwtracing/coresight/coresight-tmc.h   |  1 +
> >>   2 files changed, 41 insertions(+)
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> >> index eda7cdad0e2b..ec636ab1fd75 100644
> >> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> >> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> >> @@ -267,6 +267,46 @@ void tmc_free_sg_table(struct tmc_sg_table *sg_table)
> >>   }
> >>   EXPORT_SYMBOL_GPL(tmc_free_sg_table);
> >>
> >> +static long tmc_flat_resrv_get_rwp_offset(struct tmc_drvdata *drvdata)
> >> +{
> >> +       dma_addr_t paddr = drvdata->sysfs_buf->hwaddr;
> >> +       u64 rwp;
> >> +
> >
> > It is not valid to read RWP if the TMC is running. It must be in the
> > stopped or disabled state - see the specifications for TMC /ETR
> >
> > It is likely that CSUNLOCK / CSLOCK are needed here too,  along with
> > the spinlock that protects drvdata
> >
> > See the code in coresight_tmc_etr.c :-
> >
> > e.g. in
> >
> > tmc_update_etr_buffer()
> >
> > ...
> > <take spinlock>
> > ...
> > CS_UNLOCK(drvdata->base);
> > tmc_flush_and_stop(drvdata); // this ensures tmc is stopped and
> > flushed to memory - essential to ensure full formatted frame is in
> > memory.
> > tmc_sync_etr_buf(drvdata); // this function reads rwp.
> > CS_LOCK(drvdata->base);
> > <release spinlokc>
> >
> > This type of program flow is common to both sysfs and perf handling of
> > TMC buffers.
>
> Hi Mike,
>
> I am fully understood your point here.
>
> The function is designed this way to read the w_offset (which may not be
> entirely accurate because the etr buffer is not synced) when the

Why would you ever base memory access on a pointer that is not
entirely accurate?

The manuals for TMC/ETR all state that reads to both RWP and RRP when
the ETR is running return unknown values. These cannot be used to
access the buffer, or determine how much of the buffer has been used
on a running ETR.

The ETR specification specifically states that it is not permitted to
read the buffer data while the ETR is running, when configured in
circular buffer mode - which is the mode used in the TMC-ETR linux
drivers.

Reading the buffer while ETR is running is only permitted if
configured in Software FIFO mode 2 - were the ETR will stop on full
and stall incoming trace until some data is read out, signalled to the
ETR via the RURP.

I also note that you are reading back the etr_buf data without doing
any dma_sync operations that the perf and sysfs methods in the driver
do, after stopping the tmc.

> byte-cntr devnode is opened, aiming to reduce the length of redundant
> trace data. In this case, we cannot ensure the TMC is stopped or
> disabled.

The specification requires that you must ensure the TMC is stopped to
read these registers.


>The byte-cntr only requires an offset to know where it can
> start before the expected trace data gets into ETR buffer.
>
> The w_offset is also read when the byte-cntr function stops, which
> occurs after the TMC is disabled.
>
> Maybe this is not a good idea and I should read r_offset upon open?
> The primary goal for byte-cntr is trying to transfer useful trace data
> from the ETR buffer to the userspace, if we start from r_offset, a large
> number of redundant trace data which the user does not expect will be
> transferred simultaneously.
>
>

It is difficult to justify adding code to a driver that does not
correspond to the specification of the hardware device.

Regards

Mike

> >
> >> +       rwp = tmc_read_rwp(drvdata);
> >> +       return rwp - paddr;
> >> +}
> >> +
> >> +static long tmc_sg_get_rwp_offset(struct tmc_drvdata *drvdata)
> >> +{
> >> +       struct etr_buf *etr_buf = drvdata->sysfs_buf;
> >> +       struct etr_sg_table *etr_table = etr_buf->private;
> >> +       struct tmc_sg_table *table = etr_table->sg_table;
> >> +       long w_offset;
> >> +       u64 rwp;
> >> +
> >
> > Same comments as above
> >
> >> +       rwp = tmc_read_rwp(drvdata);
> >> +       w_offset = tmc_sg_get_data_page_offset(table, rwp);
> >> +
> >> +       return w_offset;
> >> +}
> >> +
> >> +/*
> >> + * Retrieve the offset to the write pointer of the ETR buffer based on whether
> >> + * the memory mode is SG, flat or reserved.
> >> + */
> >> +long tmc_get_rwp_offset(struct tmc_drvdata *drvdata)
> >> +{
> >> +       struct etr_buf *etr_buf = drvdata->sysfs_buf;
> >> +
> >
> > As this is an exported function, please ensure that the inputs are
> > valid - check the pointers
>
> Sure, will do.
>
> Thanks,
> Jie
>
> >
> > Code to ensure TMC is flushed and stopped could be inserted here.
> >
> > Regards
> >
> > Mike
> >
> >> +       if (etr_buf->mode == ETR_MODE_ETR_SG)
> >> +               return tmc_sg_get_rwp_offset(drvdata);
> >> +       else if (etr_buf->mode == ETR_MODE_FLAT || etr_buf->mode == ETR_MODE_RESRV)
> >> +               return tmc_flat_resrv_get_rwp_offset(drvdata);
> >> +       else
> >> +               return -EINVAL;
> >> +}
> >> +EXPORT_SYMBOL_GPL(tmc_get_rwp_offset);
> >> +
> >>   /*
> >>    * Alloc pages for the table. Since this will be used by the device,
> >>    * allocate the pages closer to the device (i.e, dev_to_node(dev)
> >> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> >> index b48bc9a01cc0..baedb4dcfc3f 100644
> >> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> >> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> >> @@ -442,5 +442,6 @@ void tmc_etr_remove_catu_ops(void);
> >>   struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
> >>                                     enum cs_mode mode, void *data);
> >>   extern const struct attribute_group coresight_etr_group;
> >> +long tmc_get_rwp_offset(struct tmc_drvdata *drvdata);
> >>
> >>   #endif
> >> --
> >> 2.34.1
> >>
> >
> >
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

