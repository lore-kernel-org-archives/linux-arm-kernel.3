Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8F3E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPhnUtMLyr5G8et/r1L4ymfoOV5ZxQgWku1qfbf+ZXc=; b=n0zjfScHW4VGAsaC4RbvBFs5t5
	rglMkzv+vG+O8rJi4/Ip++SLSpRIUu/okLeZNvjMbvNSszwrlbTX9s0sSzgumppuTvxJhSP3N2tSC
	RDgGGDnWnfReI21C2d58pN7b/vPaOWjhNs4N2t5LSSSBbuqBKrFJgR+7QBJ8VmUjUzqfMh5QcMFK1
	KJeQ2RqVCNYIH/viQgdGkARRqMKpQIFc578O1Tme2JfA9hKTCC7diDmciBTUCKeeDKgOdaQmNXRK4
	YE3UzbhhpJgDCgq19q/AUKCsPcdbth4tXxRKfCeQv8D/E8fQQUuvuPDV5RJg+qi2ang0TJIDD7Ymt
	Nfl1RT/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFka-00000001okX-0ZWx;
	Thu, 19 Dec 2024 12:35:32 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFaA-00000001mJM-3T7Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 12:24:47 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7fd17f231a7so400039a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 04:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734611086; x=1735215886; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qPhnUtMLyr5G8et/r1L4ymfoOV5ZxQgWku1qfbf+ZXc=;
        b=jiN544TlibH5E337gVIEZRQBI8kFop826I+fwKJvZSjt/Et9RIfHIsVG9DoQhZPlTF
         8g+3AaDMIfuHllyCEPHCGsRVxRy26qnOTS85b+S+bhUUb/f2dsEDMgkeTFcixyLUsjnI
         XtEK9drtMfxg6Qs6tDjsmRzG7CUwZy5ADdnlRW+4cP4lR0u665vg89TUg5jFgpsbqt9t
         RVRBujy7aHOxkvl/dYjWVVeGFJnI591VOgjP5P53Xhug4eEjyXQyEyOzrdxppMqKrnoN
         8hn/3PaDE4KFEQrYHqYy5TqGG8U9ao0C5/wZpHogxvWynGMzpDDtw7myjO+PFNt3p56S
         hUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734611086; x=1735215886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPhnUtMLyr5G8et/r1L4ymfoOV5ZxQgWku1qfbf+ZXc=;
        b=LAXYpHAvAQxPiTbjv+cpnCfCK7jpe/JQ7tMI8T+44lJ+HQRF0aQ7qd13HuVENQTaTr
         pvUOuEUOIRetYej856KlCiEaRzG/LgXKnSsRcSMLtw3n1QXUrSpIUIdvjWqKPeqJsPMh
         lFqWjqfg+9a6jZtpmnxRR+4osp5qDuFwN9kZs1OkhCExlECNmn6w2+DtCfxU6wDxFaCD
         /srJN8EnPYu/OJdB7/bybp3CEy0jmy/T7D7mnX/+9527p3rK3/mN0sq7PrcTqLi1I7zL
         npw2M/NZnClIuPxTJieuluAY2MvFtiSyV5eqvAk23fYGynhFpv67rZiLdJHxZM5q2F6x
         Y9pg==
X-Forwarded-Encrypted: i=1; AJvYcCXwUDDtTWEMmmDI0VLzgoI4E8WQzunerVRYxXx1a1Bn9xKVHOYfr9MJBqkt7qh9fdV0kf7TLPt+nMq52jcsGCmV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx91cauY/ux5MuFykMC3wfVhKlE6ZV7lJVMxBHrSdKvYBl18jtU
	7Ul2DZwIsQLUyrYSAKvDAdFlB6pGbowzx6mxKg3xMMwI/OGnZ81F1WbpuU/tv4D0ywzPNEcfMuB
	gLb0abuLsIkZf5imK6g2jcIoD3qojwszyVXZ/Gg==
X-Gm-Gg: ASbGncukos4IW4SDHmih5DRs8DXdTqEuwIX8BQ3HFMiFZvfj+JW42nLYXlZtP+w2Zcr
	SX8bgKhW0pbslvXU6CccUlLfXMHTV/3Uz+9tpxEA=
X-Google-Smtp-Source: AGHT+IEXrnCbNYeFkWiIA/RLHv1xEbIWgazA/JzIYdtX2wvrqVKmCi0J7WAM81CbK37oe0D/Sc7DQYvm4jqinUtmcQc=
X-Received: by 2002:a17:90b:50cf:b0:2ee:4b8f:a5b1 with SMTP id
 98e67ed59e1d1-2f443d45527mr4651753a91.24.1734611085853; Thu, 19 Dec 2024
 04:24:45 -0800 (PST)
MIME-Version: 1.0
References: <20241216115006.415861-1-yeoreum.yun@arm.com> <20241216115006.415861-8-yeoreum.yun@arm.com>
In-Reply-To: <20241216115006.415861-8-yeoreum.yun@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 19 Dec 2024 12:24:34 +0000
Message-ID: <CAJ9a7Vg_vyyG7A8N=+oUiE2MCPFR4+XGqZBe+Mq8c222Wq6Q8w@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] coresight-replicator: change replicator_drvdata
 spinlock's type to raw_spinlock_t
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, james.clark@linaro.org, 
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de, 
	clrkwllms@kernel.org, rostedt@goodmis.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_042446_868138_3528F303 
X-CRM114-Status: GOOD (  20.70  )
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
> In coresight-replicator drivers, replicator_drvdata->spinlock can be held
> during __schedule() by perf_event_task_sched_out()/in().
>
> Since replicator_drvdata->spinlock type is spinlock_t and
> perf_event_task_sched_out()/in() is called after acquiring rq_lock,
> which is raw_spinlock_t (an unsleepable lock),
> this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.
>
> To address this, change type replicator_drvdata->spinlock in
> coresight-replicator drivers, which can be called
> by perf_event_task_sched_out()/in(), from spinlock_t to raw_spinlock_t.
>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-replicator.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 0fba87de6d1a..7d36fe2176cc 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -41,7 +41,7 @@ struct replicator_drvdata {
>         struct clk              *atclk;
>         struct clk              *pclk;
>         struct coresight_device *csdev;
> -       spinlock_t              spinlock;
> +       raw_spinlock_t          spinlock;
>         bool                    check_idfilter_val;
>  };
>
> @@ -125,7 +125,7 @@ static int replicator_enable(struct coresight_device *csdev,
>         unsigned long flags;
>         bool first_enable = false;
>
> -       spin_lock_irqsave(&drvdata->spinlock, flags);
> +       raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>         if (atomic_read(&out->src_refcnt) == 0) {
>                 if (drvdata->base)
>                         rc = dynamic_replicator_enable(drvdata, in->dest_port,
> @@ -135,7 +135,7 @@ static int replicator_enable(struct coresight_device *csdev,
>         }
>         if (!rc)
>                 atomic_inc(&out->src_refcnt);
> -       spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +       raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>
>         if (first_enable)
>                 dev_dbg(&csdev->dev, "REPLICATOR enabled\n");
> @@ -179,14 +179,14 @@ static void replicator_disable(struct coresight_device *csdev,
>         unsigned long flags;
>         bool last_disable = false;
>
> -       spin_lock_irqsave(&drvdata->spinlock, flags);
> +       raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>         if (atomic_dec_return(&out->src_refcnt) == 0) {
>                 if (drvdata->base)
>                         dynamic_replicator_disable(drvdata, in->dest_port,
>                                                    out->src_port);
>                 last_disable = true;
>         }
> -       spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +       raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>
>         if (last_disable)
>                 dev_dbg(&csdev->dev, "REPLICATOR disabled\n");
> @@ -277,7 +277,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
>         }
>         dev->platform_data = pdata;
>
> -       spin_lock_init(&drvdata->spinlock);
> +       raw_spin_lock_init(&drvdata->spinlock);
>         desc.type = CORESIGHT_DEV_TYPE_LINK;
>         desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_SPLIT;
>         desc.ops = &replicator_cs_ops;
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

