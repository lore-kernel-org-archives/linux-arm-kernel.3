Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8832E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtNo7fVqZjlOZbRAISsnKYdQDkPnwQuUoIK88hKTmk0=; b=394UeSO2vrHvaYpdCZraaJ0Ua5
	LC6Nlo+9CJ3X8wszoGrZZiuaxjuKdd+uabNsx4oYz9TAW6lkHTQ9lokR9RbTRxT1jtVlyH+1L220m
	IyiQU0pB+dAP6FL2/wv3IZyuuoO4+e67+HRRH2yLbuHa8NWrSDkb4TJS31vM0CAtjXK6UKq8amLQK
	WdMipKwcHTAycBfSfwfnrdOofbtlyII1H3CYwV9OYUVJZN6FXdHqiZdygQF7v60/YORq2/GKQG8vU
	yTPUWrDKu2nxZg/dcEr6AdHgWKzkt1uPrpEm/syvxESquCucAqyx+PiCAL6PzLLgdjyKsMTac6pYW
	fStBHttQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFjU-00000001oTx-22Kn;
	Thu, 19 Dec 2024 12:34:24 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFa5-00000001mHp-47FQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 12:24:43 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ee786b3277so450962a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 04:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734611081; x=1735215881; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LtNo7fVqZjlOZbRAISsnKYdQDkPnwQuUoIK88hKTmk0=;
        b=eVcOHAfPuw3WNz2nUbk3YXQOvr3kdEtE00UDTu0DsaRzXBxANE+Aq8HMiU0FxEFia2
         B58wiQ2Ilptaxpc5zh0km0F0efBRF/qDnDvjblJrz28uBJnhnkZRt1UZmh0OgJJYpRFn
         HKzOPvDzZDG7rTx//qR+d9lQWzSlyYSDiRw09mtTmwXzl34Aip+feAjOBEjXwxwLBKx1
         v0Sh+K3VMaY4MgK2tJvKlXAkP7UL7tHKO/50L+SF/NCbK+rjI7lfc5wvl6BwpY2wGYLe
         S+yEt+XUQVzPitkmhpORAjBhx85DN5LgrTt1j3rAvYUuqfe75+KMAXZCwvfRn6ZAAd42
         x9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734611081; x=1735215881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtNo7fVqZjlOZbRAISsnKYdQDkPnwQuUoIK88hKTmk0=;
        b=vmBAfE6K/1VjQ6MNjDa5XIxJrwutK+R2M1j1tqaJifqsTfgtjXgM9tVidAS0JT0+o/
         6evlCKLH5blrrBT+yNedg5tIN81+AI9CnB02+rpxxUqP6DCt6BAI8+rLi5hUtK8GSaZ5
         6xsYxATCiomIz1tGCTY/rWFqWLhg4L3wNfC3dRViSupkQ3u7m7ZkKhkHXo62gZEXmZA1
         6VQp9dlzD9e/qwA5mK4CsuVvIMmotjXa+xABk7WR2OHytYqnVLZoWRKwACjHe/8gRzK5
         OlAgLxjCeO79jmt3tZFFLhBPuqt1eTOl+nr+6vesnC2pFLCBKhY6D7RXQkUf1u8vdmTn
         c7Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWt/vSC9Wq7moYdneEV3N63RoBIIowzR3r7Wy26i315HAhArhoNpImWS6hTnaj7ZIXnG+8lvMUHaAyxdKanGBNe@lists.infradead.org
X-Gm-Message-State: AOJu0Yyogsxfrj/+EiroJNKUMBegEg/FuZWLPsQQ0jhGjaeK5bAy6/9r
	/zh1NIZml5jr0GfhIGSc6L/VHm1MQxO7YFve+4X865J+hg/U636qyI81Miw7/fg0/Z5MJ/0DMMM
	WzwzbEZW5Uj2jbxv3lh5yWQl02CqmAG1vueIf+g==
X-Gm-Gg: ASbGnct/EvwuUnIRy6+cIpZA6jxlDbungxzJxJhMPI02gxcR+1Ru5ASbHXrznjPPkvK
	5uYhO1nli1AvZZVyd5ifmOdMBccdV8hC7/EN0UYs=
X-Google-Smtp-Source: AGHT+IEnAE2LzN4jVXimihufrQh1R5X23VGf0CFWVYGPAXTFsBCfa1ulDrdzBMCcon7eqUbj2eF9Ww1xrtYDsBX/wSQ=
X-Received: by 2002:a17:90b:2802:b0:2ee:ab29:1a63 with SMTP id
 98e67ed59e1d1-2f2e91c2d85mr9619666a91.3.1734611081049; Thu, 19 Dec 2024
 04:24:41 -0800 (PST)
MIME-Version: 1.0
References: <20241216115006.415861-1-yeoreum.yun@arm.com> <20241216115006.415861-7-yeoreum.yun@arm.com>
In-Reply-To: <20241216115006.415861-7-yeoreum.yun@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 19 Dec 2024 12:24:30 +0000
Message-ID: <CAJ9a7Vju8N=i5s=OUTXdCu8j2d95ZsqYT43jR54v6rui8o3DYw@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] coresight-funnel: change funnel_drvdata spinlock's
 type to raw_spinlock_t
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, james.clark@linaro.org, 
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de, 
	clrkwllms@kernel.org, rostedt@goodmis.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_042442_018910_1288514E 
X-CRM114-Status: GOOD (  21.24  )
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
> In coresight-funnel drivers, cti_drvdata->spinlock can be held
> during __schedule() by perf_event_task_sched_out()/in().
>
> Since funnel_drvdata->spinlock type is spinlock_t and
> perf_event_task_sched_out()/in() is called after acquiring rq_lock,
> which is raw_spinlock_t (an unsleepable lock),
> this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.
>
> To address this, change type funnel_drvdata->spinlock in
> coresight-funnel drivers, which can be called by
> perf_event_task_sched_out()/in(), from spinlock_t to raw_spinlock_t.
>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-funnel.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 33efe1acbef7..a566c8854327 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -47,7 +47,7 @@ struct funnel_drvdata {
>         struct clk              *pclk;
>         struct coresight_device *csdev;
>         unsigned long           priority;
> -       spinlock_t              spinlock;
> +       raw_spinlock_t          spinlock;
>  };
>
>  static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
> @@ -85,7 +85,7 @@ static int funnel_enable(struct coresight_device *csdev,
>         unsigned long flags;
>         bool first_enable = false;
>
> -       spin_lock_irqsave(&drvdata->spinlock, flags);
> +       raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>         if (atomic_read(&in->dest_refcnt) == 0) {
>                 if (drvdata->base)
>                         rc = dynamic_funnel_enable_hw(drvdata, in->dest_port);
> @@ -94,7 +94,7 @@ static int funnel_enable(struct coresight_device *csdev,
>         }
>         if (!rc)
>                 atomic_inc(&in->dest_refcnt);
> -       spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +       raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>
>         if (first_enable)
>                 dev_dbg(&csdev->dev, "FUNNEL inport %d enabled\n",
> @@ -129,13 +129,13 @@ static void funnel_disable(struct coresight_device *csdev,
>         unsigned long flags;
>         bool last_disable = false;
>
> -       spin_lock_irqsave(&drvdata->spinlock, flags);
> +       raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>         if (atomic_dec_return(&in->dest_refcnt) == 0) {
>                 if (drvdata->base)
>                         dynamic_funnel_disable_hw(drvdata, in->dest_port);
>                 last_disable = true;
>         }
> -       spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +       raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>
>         if (last_disable)
>                 dev_dbg(&csdev->dev, "FUNNEL inport %d disabled\n",
> @@ -266,7 +266,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
>         }
>         dev->platform_data = pdata;
>
> -       spin_lock_init(&drvdata->spinlock);
> +       raw_spin_lock_init(&drvdata->spinlock);
>         desc.type = CORESIGHT_DEV_TYPE_LINK;
>         desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
>         desc.ops = &funnel_cs_ops;
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

