Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220DCE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 13:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMD1W6cpsE4dlGftuAN55ixpGuMA3g4YGiIJBVrtChc=; b=PPKkxLJJugEzyDBFDxcMma0HOt
	g1yOC3EPnYDAWtetQLTGi+MMi1RI6kTBLEbNh6oqNTCKgjYX2MKf1m+xoqfvMt0GBqhMmceOHNb+F
	QT1xgqHpLTkPA+UO7lStkmIKcFOuOaDfowi3+SOj0iQzulx/9CkbuvvcD7Hm+0eGeRzd/DGjlT5gz
	LYs7Y8eYIz1iHYMe5qYvo8iKvn4LjLLhLTgCtmk8aqB+NwHwrQcfvtD7IBaSoV+/2bcENUoxjbEU2
	+ezNfUJ1zqI6SbQp82ay/MH8NfZKKm7QWtIJJir1d07meaUZOOvDwMiPeF8+NNoeoGx52NTmzhkD8
	AFafctyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGlH-00000001yVG-0UUz;
	Thu, 19 Dec 2024 13:40:19 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFa2-00000001mGe-22D9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 12:24:39 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso1471738a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 04:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734611077; x=1735215877; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xMD1W6cpsE4dlGftuAN55ixpGuMA3g4YGiIJBVrtChc=;
        b=FxgQtY6qur0Bj7F0cgU4YOXTwq7CfZ2eQL/LnPwjwEY3QJieYVmhSNBG9A5AkGAV6Y
         9nJKiCHcHekOpGRK47g6XLhnSywKYvrLxBKU1KNeMszD3TCUmXAHO1D9LntHUJ4olYzW
         C7qJq1nowANuUyS5eoJGIWNyCXGcr4tm2OCb8voFO9d2OQtlkoVhHmhiowUPxJyLG0/X
         Wj5xJhnoQk9KFT+z83ypYWVX9qGUVjxzcP/eelmtolvk53DuZQ9/JxGSwkd/2R4ZwgjB
         FAeO0y0NAgaNlH65Zn0ZQavwk38a4N0L3G3cUHI0E5R+uqiFmurqiNyesEpAZpKx/QAn
         3Xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734611077; x=1735215877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMD1W6cpsE4dlGftuAN55ixpGuMA3g4YGiIJBVrtChc=;
        b=t+EzwSnswRjkKm2joaF4rgdZaWuOvWHbVmwb+iC6jhMStUWRYwxraRMItXp/7hG70K
         kY2pRRjzsNdVcpIPIPfClTdJTw7fo9F6vMFlJVyCH9vNs9DGME0gdRshn4wMqaxV1BT4
         cDf3prq52vcGDzqaR2TrH7XKReEiCEzdLz9HMpBBpdUQ77AkgJtXXyo2ZxIs8IYtzcLq
         3f9s3W7dWfR4NICj2DdQ92pNMo7da/xEnOPBOfgizzcJDz4KW7kKlEUQuM2XVZ6QvaYr
         2oHihGd/jNM9qiVa+0rmCr9ii8HprRw3F4MGWvCq/pTwULrqWSYyiTdhRFFsyR7vOwxF
         bWZw==
X-Forwarded-Encrypted: i=1; AJvYcCXcxl3MXByR6Vflr5Y4NWmjFaDPIiOmjzgDgV8Yu0nZqMxTG1o1Xm2kX0hooTLz69TWjRUT/Ep2VOVgJ3zNGQKV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt6FNQeP0KsYblkqnIGqygC6KuWtJanT98F2FSy2PpwryTtqq+
	tzlfj8xWVQWXwV83UEneIZyLZD6ky/K+WlCHvr/9JeNziP6DzK5765EY2vMeBMvu3KbCGw6N3n4
	fVvSLlaHIiHI570ikPGYtYa8CTOJQC7z9/ZFo2g==
X-Gm-Gg: ASbGncsjgAbTNz6DYfMHJUb+6ZZ4roT+tE0vMpzcE5z3tQlgPQjVL4MnMIU0ef9Htjt
	4PQmY9i1OTOS9sgDElb5zoBA+JorKRV6JU0zQ2mc=
X-Google-Smtp-Source: AGHT+IG7EkxyS4TQVkuiVVr+U0GafJQCULAaD0tMNyJzz6oqJuxymrmgecG5I0N5Jw8IQhcm61gXWaBDUODf0G/ZCRs=
X-Received: by 2002:a17:90b:548c:b0:2ef:e063:b3f8 with SMTP id
 98e67ed59e1d1-2f4435abac6mr5262624a91.7.1734611077500; Thu, 19 Dec 2024
 04:24:37 -0800 (PST)
MIME-Version: 1.0
References: <20241216115006.415861-1-yeoreum.yun@arm.com> <20241216115006.415861-10-yeoreum.yun@arm.com>
In-Reply-To: <20241216115006.415861-10-yeoreum.yun@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 19 Dec 2024 12:24:26 +0000
Message-ID: <CAJ9a7ViC+ZSzNYTo+mKK4UYw=GBO9TCyJ2WHN879=hO-tq8JvQ@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] coresight/ultrasoc: change cti_drvdata spinlock's
 type to raw_spinlock_t
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, james.clark@linaro.org, 
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de, 
	clrkwllms@kernel.org, rostedt@goodmis.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_042438_521453_D0B481DB 
X-CRM114-Status: GOOD (  24.17  )
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

Title of patch - this patch has nothing to do with cti_drvdata.

Mike


On Mon, 16 Dec 2024 at 11:50, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
>
> In ultrasoc-smb drivers, smb_drv_data->spinlock can be held
> during __schedule() by perf_event_task_sched_out()/in().
>
> Since smb__drv_data->spinlock type is spinlock_t and
> perf_event_task_sched_out()/in() is called after acquiring rq_lock,
> which is raw_spinlock_t (an unsleepable lock),
> this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.
>
> To address this, change type smb_drv_data->spinlock in ultrasoc-smb drivers,
> which can be called by perf_event_task_sched_out()/in(),
> from spinlock_t to raw_spinlock_t.
>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  drivers/hwtracing/coresight/ultrasoc-smb.c | 12 ++++++------
>  drivers/hwtracing/coresight/ultrasoc-smb.h |  2 +-
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
> index dc3c9504dd7c..26cfc939e5bd 100644
> --- a/drivers/hwtracing/coresight/ultrasoc-smb.c
> +++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
> @@ -98,7 +98,7 @@ static int smb_open(struct inode *inode, struct file *file)
>         struct smb_drv_data *drvdata = container_of(file->private_data,
>                                         struct smb_drv_data, miscdev);
>
> -       guard(spinlock)(&drvdata->spinlock);
> +       guard(raw_spinlock)(&drvdata->spinlock);
>
>         if (drvdata->reading)
>                 return -EBUSY;
> @@ -152,7 +152,7 @@ static int smb_release(struct inode *inode, struct file *file)
>         struct smb_drv_data *drvdata = container_of(file->private_data,
>                                         struct smb_drv_data, miscdev);
>
> -       guard(spinlock)(&drvdata->spinlock);
> +       guard(raw_spinlock)(&drvdata->spinlock);
>         drvdata->reading = false;
>
>         return 0;
> @@ -245,7 +245,7 @@ static int smb_enable(struct coresight_device *csdev, enum cs_mode mode,
>         struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
>         int ret = 0;
>
> -       guard(spinlock)(&drvdata->spinlock);
> +       guard(raw_spinlock)(&drvdata->spinlock);
>
>         /* Do nothing, the trace data is reading by other interface now */
>         if (drvdata->reading)
> @@ -280,7 +280,7 @@ static int smb_disable(struct coresight_device *csdev)
>  {
>         struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
>
> -       guard(spinlock)(&drvdata->spinlock);
> +       guard(raw_spinlock)(&drvdata->spinlock);
>
>         if (drvdata->reading)
>                 return -EBUSY;
> @@ -378,7 +378,7 @@ static unsigned long smb_update_buffer(struct coresight_device *csdev,
>         if (!buf)
>                 return 0;
>
> -       guard(spinlock)(&drvdata->spinlock);
> +       guard(raw_spinlock)(&drvdata->spinlock);
>
>         /* Don't do anything if another tracer is using this sink. */
>         if (csdev->refcnt != 1)
> @@ -563,7 +563,7 @@ static int smb_probe(struct platform_device *pdev)
>
>         smb_reset_buffer(drvdata);
>         platform_set_drvdata(pdev, drvdata);
> -       spin_lock_init(&drvdata->spinlock);
> +       raw_spin_lock_init(&drvdata->spinlock);
>         drvdata->pid = -1;
>
>         ret = smb_register_sink(pdev, drvdata);
> diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.h b/drivers/hwtracing/coresight/ultrasoc-smb.h
> index a91d39cfccb8..c4c111275627 100644
> --- a/drivers/hwtracing/coresight/ultrasoc-smb.h
> +++ b/drivers/hwtracing/coresight/ultrasoc-smb.h
> @@ -115,7 +115,7 @@ struct smb_drv_data {
>         struct coresight_device *csdev;
>         struct smb_data_buffer sdb;
>         struct miscdevice miscdev;
> -       spinlock_t spinlock;
> +       raw_spinlock_t spinlock;
>         bool reading;
>         pid_t pid;
>  };
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

