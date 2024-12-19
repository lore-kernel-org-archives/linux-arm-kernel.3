Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F640E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdfCCrlFzDpcoehZbLJW7DJrz1012DE3QLb9varfMtw=; b=1mG4/VLhoX4LlG3CKRrbczECaZ
	VwwhB+0QsYfEpr8g8h/ORmDN26bpmtZzL3Lbh5jDXvUTTksiBhvfcE3H+wUBsMeyNx2YwxqPz8Bav
	XYfII2DpWnCKSjkrlaGMILsctQXPI5rqBtT9jp9WuRitrMbx59y3jmu8MmQSeSgNVmu5C1IHiqo3W
	psm0pKFgOlQQ0OqNirgZyg0OCRyZplRxwkgG7WfzqB/KOyY7UzqGyjSGA5da/iIMuc0YhxD5KBJpD
	kG7vBsj7xvSTQXDWcixbhMTYe4tU8iOa4VWjgPQx4c7IIkT2bj3uZ+VGx4B4//zO3jnTHBjmXtG0g
	bGC0U6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFhK-00000001o0s-2W0L;
	Thu, 19 Dec 2024 12:32:10 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFZu-00000001mCr-3E9P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 12:24:32 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7242f559a9fso916919b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 04:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734611070; x=1735215870; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hdfCCrlFzDpcoehZbLJW7DJrz1012DE3QLb9varfMtw=;
        b=Yexv+H7tLBGrhVTEPU4n44+DK4XeaJzpbEyLzUCyb7QnYWJuMOisXuZA16qn4sKWpo
         HzCFC9SpGQWi0AahfwHsgEiwouZlzkysgvNPceJ44MVFltpu3Qk4Lp6KS6ABKQp++SxC
         HA6JoNWAYUhBlegDXHX6lBl5RV8s30iXPiqesQI+WMNEUTp2pIliUXQHuBpEEChPE/tX
         cBfx5XZdXDCVroOQGccYfmC2jy9YQ61T/DfT2DqDr/HFE9rRIUU/PsmYjtej2Nl9nHqw
         xIm8MxWODaM+oxzL+jCbheVNUhsNsHWxSaabdKSJqm0IENNC5JPrJjiEN2xAXP95tKTn
         7Tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734611070; x=1735215870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdfCCrlFzDpcoehZbLJW7DJrz1012DE3QLb9varfMtw=;
        b=Fhd5HnDNl0xb7oHsB7dlP79bQRSKUpdWgQgwDImvO7jgideeWnW498zBhmAWed012G
         dirOktMA8MWJ9LLjSBFtCMjgHUZcnZAzTD6+1d0dTSyXkkLb0RY5tpBGIcS+QAgtqJFV
         ynIO3u/YATS6egWvgH7MqwsUbX2C/KKeyu+5Oymm9/g533sqa5XUjuGbDQqMX7UbiEAv
         7x+KyP8EI383nnBy+z3XagwucNt2cL69vhei1s3P3N0XBJfPvJw1125AB6dFQMYK4+Yv
         6xDSGzuSmCjwFlGt7GfR7rKC2PPkqikSkAFYIS6yo6RuHbYDBhNv3mYmZLrgD4zRC0Pj
         xhVg==
X-Forwarded-Encrypted: i=1; AJvYcCV7oJpgtR2QhD92CMkDkrUk1zeKM7CJxUewGO7OZN6oI1ISWQlqZIj+Eeijw4sV3wBP6YoVwLzi6b3rdh6l/cvB@lists.infradead.org
X-Gm-Message-State: AOJu0YyNf2INBRWNCLtLBq7fALvRF/OaRXrZvctHzN2VvjdaE93NemQA
	ZJIfd8OSkHnup3Jy1vDZz6yDNu+eG546t93l5DAgSH1k9fCnq9mckYNCDRn1OawqL90FZf6BM0r
	bgmCQ3S4FejOlVHAph4zD7f3pQHx/8gxBF06FTw==
X-Gm-Gg: ASbGncuhq6ozH36upRqGAsQCFarcQyoJzzFYjgMyMwIXL1hu6CsFjfy2dSxZlJnTktL
	cozPFKRDDk17asm+3kWsQfF/5R11vUiev73sO1rc=
X-Google-Smtp-Source: AGHT+IEh4nFwnQ7C0/qsYeQxsTWNOLqEtnDVajywM5YD8mjZhUzATndI0YwIopyvnfT6SubgcEziunhoLCi6mo6uzE0=
X-Received: by 2002:a17:90b:254b:b0:2ee:7870:8835 with SMTP id
 98e67ed59e1d1-2f2e9397ab7mr10124072a91.33.1734611069803; Thu, 19 Dec 2024
 04:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20241216115006.415861-1-yeoreum.yun@arm.com> <20241216115006.415861-6-yeoreum.yun@arm.com>
In-Reply-To: <20241216115006.415861-6-yeoreum.yun@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 19 Dec 2024 12:24:18 +0000
Message-ID: <CAJ9a7Vhzoynt69+O1zya8LM3dOPhar9YxQXqHygbeKQC8CfHtg@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] coresight-etb10: change etb_drvdata spinlock's
 type to raw_spinlock_t
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, james.clark@linaro.org, 
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de, 
	clrkwllms@kernel.org, rostedt@goodmis.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_042430_809927_2D6FC57D 
X-CRM114-Status: GOOD (  23.93  )
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

On Mon, 16 Dec 2024 at 11:50, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
>
> In coresight-etb10 drivers, etb_drvdata->spinlock can be held
> during __schedule() by perf_event_task_sched_out()/in().
>
> Since etb_drvdata->spinlock type is spinlock_t and
> perf_event_task_sched_out()/in() is called after acquiring rq_lock,
> which is raw_spinlock_t (an unsleepable lock),
> this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.
>
> To address this, change type etb_drvdata->spinlock in coresight-etb10 drivers,
> which can be called by perf_event_task_sched_out()/in(),
> from spinlock_t to raw_spinlock_t.
>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etb10.c | 26 +++++++++----------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
> index aea9ac9c4bd0..7948597d483d 100644
> --- a/drivers/hwtracing/coresight/coresight-etb10.c
> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
> @@ -84,7 +84,7 @@ struct etb_drvdata {
>         struct clk              *atclk;
>         struct coresight_device *csdev;
>         struct miscdevice       miscdev;
> -       spinlock_t              spinlock;
> +       raw_spinlock_t          spinlock;
>         local_t                 reading;
>         pid_t                   pid;
>         u8                      *buf;
> @@ -145,7 +145,7 @@ static int etb_enable_sysfs(struct coresight_device *csdev)
>         unsigned long flags;
>         struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>
> -       spin_lock_irqsave(&drvdata->spinlock, flags);
> +       raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>
>         /* Don't messup with perf sessions. */
>         if (coresight_get_mode(csdev) == CS_MODE_PERF) {
> @@ -163,7 +163,7 @@ static int etb_enable_sysfs(struct coresight_device *csdev)
>
>         csdev->refcnt++;
>  out:
> -       spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +       raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>         return ret;
>  }
>
> @@ -176,7 +176,7 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
>         struct perf_output_handle *handle = data;
>         struct cs_buffers *buf = etm_perf_sink_config(handle);
>
> -       spin_lock_irqsave(&drvdata->spinlock, flags);
> +       raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>
>         /* No need to continue if the component is already in used by sysFS. */
>         if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
> @@ -219,7 +219,7 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
>         }
>
>  out:
> -       spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +       raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>         return ret;
>  }
>
> @@ -352,11 +352,11 @@ static int etb_disable(struct coresight_device *csdev)
>         struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>         unsigned long flags;
>
> -       spin_lock_irqsave(&drvdata->spinlock, flags);
> +       raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>
>         csdev->refcnt--;
>         if (csdev->refcnt) {
> -               spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +               raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>                 return -EBUSY;
>         }
>
> @@ -366,7 +366,7 @@ static int etb_disable(struct coresight_device *csdev)
>         /* Dissociate from monitored process. */
>         drvdata->pid = -1;
>         coresight_set_mode(csdev, CS_MODE_DISABLED);
> -       spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +       raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>
>         dev_dbg(&csdev->dev, "ETB disabled\n");
>         return 0;
> @@ -443,7 +443,7 @@ static unsigned long etb_update_buffer(struct coresight_device *csdev,
>
>         capacity = drvdata->buffer_depth * ETB_FRAME_SIZE_WORDS;
>
> -       spin_lock_irqsave(&drvdata->spinlock, flags);
> +       raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>
>         /* Don't do anything if another tracer is using this sink */
>         if (csdev->refcnt != 1)
> @@ -566,7 +566,7 @@ static unsigned long etb_update_buffer(struct coresight_device *csdev,
>         __etb_enable_hw(drvdata);
>         CS_LOCK(drvdata->base);
>  out:
> -       spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +       raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>
>         return to_read;
>  }
> @@ -587,13 +587,13 @@ static void etb_dump(struct etb_drvdata *drvdata)
>  {
>         unsigned long flags;
>
> -       spin_lock_irqsave(&drvdata->spinlock, flags);
> +       raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>         if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
>                 __etb_disable_hw(drvdata);
>                 etb_dump_hw(drvdata);
>                 __etb_enable_hw(drvdata);
>         }
> -       spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +       raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>
>         dev_dbg(&drvdata->csdev->dev, "ETB dumped\n");
>  }
> @@ -746,7 +746,7 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
>         drvdata->base = base;
>         desc.access = CSDEV_ACCESS_IOMEM(base);
>
> -       spin_lock_init(&drvdata->spinlock);
> +       raw_spin_lock_init(&drvdata->spinlock);
>
>         drvdata->buffer_depth = etb_get_buffer_depth(drvdata);
>
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

