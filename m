Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751B4C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODMKcE1p5YgqiPmFZ5yGUw8T4mr2KE6M7w5D5YC/OsI=; b=UOEscpwzx+32vV78ZVR4wZrWnh
	R4Tk+ioZOZ2imFcrHanqkK0t1cia93qWdSKjPuQK+gCqneRrSvciIZt5nccbb5vuEGOu5lQwWBfmo
	16Nd5cXd2npQ+HzQ9NpnGq+7I5RAXHlUM7Bzemvb8K6S+ig12NpeLUAQ9+JZLu02fGaWw5L4X2N1r
	LYrnTeTY4mOi3fyEWwf3svjwTYeEh5W/QqgN9dOndNER8EX8DsNjGJky095ZFV2dS00AQTsEnx4lk
	a2Bfa1yGbr6LKHIF/iTEj4bMYP/dCILnL9EQFHF+Q9o4366fy7J5Fi4gFmvzASe5cc/6PIEazMWpP
	HcHXQbEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGqy-0000000FK8A-0sAU;
	Fri, 11 Jul 2025 16:44:04 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGBT-0000000FDVN-3H7G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 16:01:13 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e819ebc3144so2171638276.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 09:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1752249670; x=1752854470; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODMKcE1p5YgqiPmFZ5yGUw8T4mr2KE6M7w5D5YC/OsI=;
        b=JYUlcEUoaiIFc14iCYQGGzjQWxnvEuuYLTzPi9luSFakWv+Ss9qmjWE7KhkiX/VAf/
         W7N9tOoZ2fpwDkdBxZL/db5dN2FxXf+Xk3/o2C2KBXPxJGImj9zYYkPlLdY/Hkxo09gv
         C4MKRr3Co20isyp5IghWDPeerM+mBDU+GoWvDSqcAt1CGG0f7qPvTYFT5z9eoPca5Y1u
         COzzEztycceCI+1SA7pBnHh+sX4X989rXqxnFtZZBtKyg/OO50T05kHDVWkpi84qkzJK
         RkoM8znmL99XZuPZ1DIItiJGiaNkChOxDDGUybPp3ZbX6AONtZaYtg09rrubcGEI1Wzk
         EqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752249670; x=1752854470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODMKcE1p5YgqiPmFZ5yGUw8T4mr2KE6M7w5D5YC/OsI=;
        b=wIb5/6/iaeIQuaOG6L/Lx8prH6uXGdQ9fcNI6DDqclA2gsxpq9ws+3+CG4hgZ1tfIj
         02Jr4VMUGoJfYA0bRvTYsYwnZW7KOgQCanzxyA5cdUlyjU6W/rRe1YB7Xm/1IWZkR1IZ
         6bcRpRq+KfwoSjwpbEZjoQy0XqV2D3L1JcHq+EFjYHLwcLlDkUGJkEFiygFFNa9c7dyd
         tYXkyls8NBYDPtJBcEcrBBdQMvvsY1R2aHQCCOc31NS2LN2NtGNCognY8dpaR5TK6v2L
         1J9wHVnXRI2f74p0/v/bLROGBONklH3oLDJEVZZnfhuvRljNdmnvhiQGBMuo5ogoEEzW
         6MQg==
X-Forwarded-Encrypted: i=1; AJvYcCVgWMrD1o/pc/bBBz5QvxJaDX9AMbqn99peIx8+3yf9RtQ/1+NZ1q8jj/m0XxzE8qQ6dbpLrBvZEiQ6Ec3z6qGr@lists.infradead.org
X-Gm-Message-State: AOJu0YzcsEE6Vwdz/98bG1OzX0PzfH+mHdFGhmRsEbSbVa2CbTtWRN7i
	7pymFKr6ObINurmQ5k1WLIyyBGNghIdvMJMLsDS4TKpRcSWcQoRlRzyE8b5M00MHn/IL5fkk9jR
	d9TKNs/8PUQ==
X-Gm-Gg: ASbGnctnq7ahE7wL9ulVkSIMn+b+LzUSX2G50rBVZHeW1Kj7Y05P07PWq1JBHyVruyg
	Bw4XlRHZQ9k23cCXHg98TC79d1H9s9+m1ZN8rgeUv2S4/kdzQnj6zMsXNhanIKnlQk572TVdTLs
	jX+Sit4rHRiPxHQG9JvYldUxaOYDNqV2hyK8rl6BbKJPAT4MMCkC2FT2gDb9pH9dFkYUD/c2qi/
	y83LnT40oH3pS5h2rgSf8LUVsTfcv3pN8n3W0BHsjAR/zEpBuIrWbuu0/FXXw6Zq4FDoZQXQ2BO
	ZTC42FuYZPs/HOxQHCdwVfDmXox79GBCZ/BcE0ks3KQubgT4CiVyAt0gPwJUejA26V6VNWaVIiR
	ygqo1nQReDjXMUckblt/usi9f4KuSReOn79uP7mFvxs0QA8cI1lj2WuSe9jJFuIrRJg==
X-Google-Smtp-Source: AGHT+IGp+GKVmNh5TLxa7AK35jl3v7iKxSQ115uAW3KfZD17VowWEqbtnUgGL6Ji2J29kh/b0noJCg==
X-Received: by 2002:a05:690c:308:b0:6f9:7a3c:1fe with SMTP id 00721157ae682-717dae77d06mr39739157b3.23.1752249668295;
        Fri, 11 Jul 2025 09:01:08 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c61eb7f3sm8005127b3.98.2025.07.11.09.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 09:01:07 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e7dc89108bfso2040049276.3;
        Fri, 11 Jul 2025 09:01:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpuvYP7QxfaYCPTssJtWj78hrV3ZuriCVtqo1ugFfc1JhUnkbPJR5swXWz1Iqy7DTY/m/eSgPlkkEAFktYP6hl@lists.infradead.org, AJvYcCXLxEL7l/ME5oLMP+mGfGQ84oppXPcnuJYtHDREuzSTJduHOo2QmZvBzQHa/uzM9Pi/4lzrmm3piWsPoBjGFss=@lists.infradead.org
X-Received: by 2002:a05:6902:1ac3:b0:e8b:5388:af71 with SMTP id
 3f1490d57ef6-e8b874165a9mr3797674276.38.1752249665718; Fri, 11 Jul 2025
 09:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-4-dc16cfe6fe4e@tomeuvizoso.net> <fcb3ca23-7ebd-4f48-92d2-969b24936b9b@arm.com>
In-Reply-To: <fcb3ca23-7ebd-4f48-92d2-969b24936b9b@arm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 11 Jul 2025 18:00:54 +0200
X-Gmail-Original-Message-ID: <CAAObsKBiSX0HcxJJjTNGgE4FD4eAYW5wvY=bROtdkZ1mqf_0VQ@mail.gmail.com>
X-Gm-Features: Ac12FXyh56JbSSKIXGZmdm1LF3IopYU6qYCVm7YM4utxq79Gbdb5weokuDKkAc8
Message-ID: <CAAObsKBiSX0HcxJJjTNGgE4FD4eAYW5wvY=bROtdkZ1mqf_0VQ@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] accel/rocket: Add job submission IOCTL
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_090112_078298_17782AF2 
X-CRM114-Status: GOOD (  49.56  )
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

On Tue, Jun 24, 2025 at 3:50=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2025-06-06 7:28 am, Tomeu Vizoso wrote:
> [...]
> > diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocke=
t/rocket_device.h
> > index 10acfe8534f00a7985d40a93f4b2f7f69d43caee..50e46f0516bd1615b5f826c=
5002a6c0ecbf9aed4 100644
> > --- a/drivers/accel/rocket/rocket_device.h
> > +++ b/drivers/accel/rocket/rocket_device.h
> > @@ -13,6 +13,8 @@
> >   struct rocket_device {
> >       struct drm_device ddev;
> >
> > +     struct mutex sched_lock;
> > +
> >       struct mutex iommu_lock;
>
> Just realised I missed this in the last patch, but iommu_lock appears to
> be completely unnecessary now.
>
> >       struct rocket_core *cores;
> [...]
> > +static void rocket_job_hw_submit(struct rocket_core *core, struct rock=
et_job *job)
> > +{
> > +     struct rocket_task *task;
> > +     bool task_pp_en =3D 1;
> > +     bool task_count =3D 1;
> > +
> > +     /* GO ! */
> > +
> > +     /* Don't queue the job if a reset is in progress */
> > +     if (atomic_read(&core->reset.pending))
> > +             return;
> > +
> > +     task =3D &job->tasks[job->next_task_idx];
> > +     job->next_task_idx++;
> > +
> > +     rocket_pc_writel(core, BASE_ADDRESS, 0x1);
> > +
> > +     rocket_cna_writel(core, S_POINTER, 0xe + 0x10000000 * core->index=
);
> > +     rocket_core_writel(core, S_POINTER, 0xe + 0x10000000 * core->inde=
x);
>
> Those really look like bitfield operations rather than actual arithmetic
> to me.
>
> > +
> > +     rocket_pc_writel(core, BASE_ADDRESS, task->regcmd);
>
> I don't see how regcmd is created (I guess that's in userspace?), but
> given that it's explicitly u64 all the way through - and especially
> since you claim to support 40-bit DMA addresses - it definitely seems
> suspicious that the upper 32 bits never seem to be consumed anywhere :/

Yeah, but there's no other register for BASE_ADDRESS address in the TRM.

> > +     rocket_pc_writel(core, REGISTER_AMOUNTS, (task->regcmd_count + 1)=
 / 2 - 1);
> > +
> > +     rocket_pc_writel(core, INTERRUPT_MASK, PC_INTERRUPT_MASK_DPU_0 | =
PC_INTERRUPT_MASK_DPU_1);
> > +     rocket_pc_writel(core, INTERRUPT_CLEAR, PC_INTERRUPT_CLEAR_DPU_0 =
| PC_INTERRUPT_CLEAR_DPU_1);
> > +
> > +     rocket_pc_writel(core, TASK_CON, ((0x6 | task_pp_en) << 12) | tas=
k_count);
> > +
> > +     rocket_pc_writel(core, TASK_DMA_BASE_ADDR, 0x0);
> > +
> > +     rocket_pc_writel(core, OPERATION_ENABLE, 0x1);
> > +
> > +     dev_dbg(core->dev, "Submitted regcmd at 0x%llx to core %d", task-=
>regcmd, core->index);
> > +}
> [...]
> > +static struct dma_fence *rocket_job_run(struct drm_sched_job *sched_jo=
b)
> > +{
> > +     struct rocket_job *job =3D to_rocket_job(sched_job);
> > +     struct rocket_device *rdev =3D job->rdev;
> > +     struct rocket_core *core =3D sched_to_core(rdev, sched_job->sched=
);
> > +     struct dma_fence *fence =3D NULL;
> > +     int ret;
> > +
> > +     if (unlikely(job->base.s_fence->finished.error))
> > +             return NULL;
> > +
> > +     /*
> > +      * Nothing to execute: can happen if the job has finished while
> > +      * we were resetting the GPU.
>
> GPU? (Similarly in various other comments/prints)
>
> > +      */
> > +     if (job->next_task_idx =3D=3D job->task_count)
> > +             return NULL;
> > +
> > +     fence =3D rocket_fence_create(core);
> > +     if (IS_ERR(fence))
> > +             return fence;
> > +
> > +     if (job->done_fence)
> > +             dma_fence_put(job->done_fence);
> > +     job->done_fence =3D dma_fence_get(fence);
> > +
> > +     ret =3D pm_runtime_get_sync(core->dev);
> > +     if (ret < 0)
> > +             return fence;
> > +
> > +     ret =3D iommu_attach_group(job->domain, iommu_group_get(core->dev=
));
>
> I don't see iommu_group_put() anywhere, so you're leaking refcounts all
> over.
>
> > +     if (ret < 0)
> > +             return fence;
> > +
> > +     scoped_guard(spinlock, &core->job_lock) {
> > +             core->in_flight_job =3D job;
> > +             rocket_job_hw_submit(core, job);
> > +     }
> > +
> > +     return fence;
> > +}
> [...]
> > +static void rocket_job_handle_irq(struct rocket_core *core)
> > +{
> > +     u32 status, raw_status;
> > +
> > +     pm_runtime_mark_last_busy(core->dev);
> > +
> > +     status =3D rocket_pc_readl(core, INTERRUPT_STATUS);
> > +     raw_status =3D rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
> > +
> > +     rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
> > +     rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
>
> What was the point of reading the status registers if we're just going
> to blindly clear every possible condition anyway?
>
> > +     scoped_guard(spinlock, &core->job_lock)
> > +             if (core->in_flight_job)
> > +                     rocket_job_handle_done(core, core->in_flight_job)=
;
>
> But then is it really OK to just start the next task regardless of
> whether the current task was reporting successful completion or an error?
>
> > +}
> > +
> > +static void
> > +rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
> > +{
> > +     bool cookie;
> > +
> > +     if (!atomic_read(&core->reset.pending))
> > +             return;
> > +
> > +     /*
> > +      * Stop the scheduler.
> > +      *
> > +      * FIXME: We temporarily get out of the dma_fence_signalling sect=
ion
> > +      * because the cleanup path generate lockdep splats when taking l=
ocks
> > +      * to release job resources. We should rework the code to follow =
this
> > +      * pattern:
> > +      *
> > +      *      try_lock
> > +      *      if (locked)
> > +      *              release
> > +      *      else
> > +      *              schedule_work_to_release_later
> > +      */
> > +     drm_sched_stop(&core->sched, bad);
> > +
> > +     cookie =3D dma_fence_begin_signalling();
> > +
> > +     if (bad)
> > +             drm_sched_increase_karma(bad);
> > +
> > +     /*
> > +      * Mask job interrupts and synchronize to make sure we won't be
> > +      * interrupted during our reset.
> > +      */
> > +     rocket_pc_writel(core, INTERRUPT_MASK, 0x0);
> > +     synchronize_irq(core->irq);
>
> ...except it's a shared IRQ, so it can still merrily fire at any time.
>
> > +
> > +     /* Handle the remaining interrupts before we reset. */
> > +     rocket_job_handle_irq(core);
> > +
> > +     /*
> > +      * Remaining interrupts have been handled, but we might still hav=
e
> > +      * stuck jobs. Let's make sure the PM counters stay balanced by
> > +      * manually calling pm_runtime_put_noidle() and
> > +      * rocket_devfreq_record_idle() for each stuck job.
> > +      * Let's also make sure the cycle counting register's refcnt is
> > +      * kept balanced to prevent it from running forever
>
> Comments that don't match the code are more confusing than helpful :/
>
> > +      */
> > +     scoped_guard(spinlock, &core->job_lock) {
> > +             if (core->in_flight_job)
> > +                     pm_runtime_put_noidle(core->dev);
> > +
> > +             core->in_flight_job =3D NULL;
> > +     }
> > +
> > +     /* Proceed with reset now. */
> > +     pm_runtime_force_suspend(core->dev);
> > +     pm_runtime_force_resume(core->dev);
>
> Can you guarantee that actually resets the hardware if something else is
> holding the power domain open or RPM is disabled? I'm not familiar with
> the details of drm_sched, but if there are other jobs queued behind the
> stuck one would it even pass the rocket_job_is_idle() check for suspend
> to succeed anyway?
>
> Not to mention that you have an actual reset control in the DT binding,
> which isn't even optional... :/

Yeah, I think in my testing the resets didn't work because we didn't
have the right resources in the DT nodes. Have retested and the
documented reset process is enough to reset each core.

Will be sending soon a revised version.

Thanks,

Tomeu

> > +     /* GPU has been reset, we can clear the reset pending bit. */
> > +     atomic_set(&core->reset.pending, 0);
> > +
> > +     /*
> > +      * Now resubmit jobs that were previously queued but didn't have =
a
> > +      * chance to finish.
> > +      * FIXME: We temporarily get out of the DMA fence signalling sect=
ion
> > +      * while resubmitting jobs because the job submission logic will
> > +      * allocate memory with the GFP_KERNEL flag which can trigger mem=
ory
> > +      * reclaim and exposes a lock ordering issue.
> > +      */
> > +     dma_fence_end_signalling(cookie);
> > +     drm_sched_resubmit_jobs(&core->sched);
>
> Since I happened to look, this says it's deprecated?
>
> > +     cookie =3D dma_fence_begin_signalling();
> > +
> > +     /* Restart the scheduler */
> > +     drm_sched_start(&core->sched, 0);
> > +
> > +     dma_fence_end_signalling(cookie);
> > +}
> > +
> > +static enum drm_gpu_sched_stat rocket_job_timedout(struct drm_sched_jo=
b *sched_job)
> > +{
> > +     struct rocket_job *job =3D to_rocket_job(sched_job);
> > +     struct rocket_device *rdev =3D job->rdev;
> > +     struct rocket_core *core =3D sched_to_core(rdev, sched_job->sched=
);
> > +
> > +     /*
> > +      * If the GPU managed to complete this jobs fence, the timeout is
> > +      * spurious. Bail out.
> > +      */
> > +     if (dma_fence_is_signaled(job->done_fence))
> > +             return DRM_GPU_SCHED_STAT_NOMINAL;
>
> Do we really need the same return condition twice? What if the IRQ fires
> immediately after we've made this check, and is handled without delay
> such that sychronize_irq() effectively still does nothing? Either way
> we've taken longer than the timeout value to observe the job completing
> successfully, and either that's significant and worth warning about or
> it's not - I don't see any point in trying to (inaccurately) nitpick
> *why* it might have happened.
>
> > +     /*
> > +      * Rocket IRQ handler may take a long time to process an interrup=
t
> > +      * if there is another IRQ handler hogging the processing.
> > +      * For example, the HDMI encoder driver might be stuck in the IRQ
> > +      * handler for a significant time in a case of bad cable connecti=
on.
>
> What have HDMI cables got to do with anything here? Yes, in general IRQ
> latency can be high, since CPUs can have IRQs masked and/or be taking
> higher-priority interrupts for any number of reasons. I don't see how an
> oddly-specific example (of apparently poor driver design, to boot) is
> useful.
>
> > +      * In order to catch such cases and not report spurious rocket
> > +      * job timeouts, synchronize the IRQ handler and re-check the fen=
ce
> > +      * status.
> > +      */
> > +     synchronize_irq(core->irq);
> > +
> > +     if (dma_fence_is_signaled(job->done_fence)) {
> > +             dev_warn(core->dev, "unexpectedly high interrupt latency\=
n");
> > +             return DRM_GPU_SCHED_STAT_NOMINAL;
> > +     }
> > +
> > +     dev_err(core->dev, "gpu sched timeout");
> > +
> > +     atomic_set(&core->reset.pending, 1);
> > +     rocket_reset(core, sched_job);
> > +     iommu_detach_group(NULL, iommu_group_get(core->dev));
> > +
> > +     return DRM_GPU_SCHED_STAT_NOMINAL;
> > +}
> > +
> > +static void rocket_reset_work(struct work_struct *work)
> > +{
> > +     struct rocket_core *core;
> > +
> > +     core =3D container_of(work, struct rocket_core, reset.work);
> > +     rocket_reset(core, NULL);
> > +}
> > +
> > +static const struct drm_sched_backend_ops rocket_sched_ops =3D {
> > +     .run_job =3D rocket_job_run,
> > +     .timedout_job =3D rocket_job_timedout,
> > +     .free_job =3D rocket_job_free
> > +};
> > +
> > +static irqreturn_t rocket_job_irq_handler_thread(int irq, void *data)
> > +{
> > +     struct rocket_core *core =3D data;
> > +
> > +     rocket_job_handle_irq(core);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static irqreturn_t rocket_job_irq_handler(int irq, void *data)
> > +{
> > +     struct rocket_core *core =3D data;
> > +     u32 raw_status =3D rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
>
> Given that this can be a shared IRQ as above, it would be a good idea to
> take care to avoid register accesses while suspended. Especially if
> you're trying to utilise suspend to reset a failing job that may well be
> throwing IOMMU faults.
>
> > +
> > +     WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
> > +     WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
> > +
> > +     if (!(raw_status & PC_INTERRUPT_RAW_STATUS_DPU_0 ||
> > +           raw_status & PC_INTERRUPT_RAW_STATUS_DPU_1))
> > +             return IRQ_NONE;
> > +
> > +     rocket_pc_writel(core, INTERRUPT_MASK, 0x0);
> > +
> > +     return IRQ_WAKE_THREAD;
> > +}
> > +
> > +int rocket_job_init(struct rocket_core *core)
> > +{
> > +     struct drm_sched_init_args args =3D {
> > +             .ops =3D &rocket_sched_ops,
> > +             .num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> > +             .credit_limit =3D 1,
>
> Ah, does this mean that all the stuff about queued jobs was in fact all
> nonsense anyway?
>
> > +             .timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS),
> > +             .name =3D dev_name(core->dev),
> > +             .dev =3D core->dev,
> > +     };
> > +     int ret;
> > +
> > +     INIT_WORK(&core->reset.work, rocket_reset_work);
> > +     spin_lock_init(&core->job_lock);
> > +
> > +     core->irq =3D platform_get_irq(to_platform_device(core->dev), 0);
> > +     if (core->irq < 0)
> > +             return core->irq;
> > +
> > +     ret =3D devm_request_threaded_irq(core->dev, core->irq,
> > +                                     rocket_job_irq_handler,
> > +                                     rocket_job_irq_handler_thread,
> > +                                     IRQF_SHARED, KBUILD_MODNAME "-job=
",
>
> Is it really a "job" interrupt though? The binding and the register
> definitions suggest it's just a general status interrupt for the core.
> Furthermore since we expect to have multiple cores, being able to more
> easily identify and attribute per-core IRQ activity seems more useful
> for debugging than copy-pasting from something really rather different
> which also expects to be the only one of its kind on the system.
>
> Thanks,
> Robin.
>
> > +                                     core);
> > +     if (ret) {
> > +             dev_err(core->dev, "failed to request job irq");
> > +             return ret;
> > +     }

