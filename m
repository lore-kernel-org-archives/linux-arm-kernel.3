Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B95C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 12:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sWYGz5XT9OAhWSz7+RnTv94A8j0P9pbFdVtTXC675o=; b=2RhxZLhoQJFCJyCJjiHpep0B8p
	28dTL530n4z7sQGmO0oVTJNRFkDHDFoUg68NIrL04+z4GvfsniDFLaKXc2hlad+MFLN/U+dTKTxj4
	P8vcUWg5BFPkruPuKhfK5kNzsV5U8Y3W9gt91po1mW8F+BivXEO814Ic6ugUlIZd9ZLfb2EThIw11
	AQDv8z6HiHhHszZcGGGQBMcXAH9sGW98y/hOxMgSh1Elipfn6Nedx8BclDshFz8FjYYUbvIOfhM5n
	7uNxNrHx6fJMhNmS2iERNLJJVPKsEs/VWfUZRz5gSavkBlLWy1UrRKa8ftcVyQCYEtAmi352sXwci
	NuOG2qwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwtd-00000006AKo-1Z6E;
	Mon, 17 Aug 2026 12:56:57 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwta-00000006AJO-0g7D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 12:56:56 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-660a40aac63so379653d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 05:56:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786971413; cv=none;
        d=google.com; s=arc-20260327;
        b=RxT9AKd8wFqCg23MbFmD30v0Kzcdu/+JemzAVJF49vih7Ypygm1lqlnEROJV0uOFdO
         AIpb4ucMJLxgC8vlAG5ZcKZh0wrVbszuDLiu8Bgb2AizoqnGzvYrWr2L6XW5b5DK+hZE
         /K25O8YpcYQXB/5PDHi25hGixcw5dovfcrWO8wexW9Oc6Pav+1FAcoPjAAJ1ugUb7e0G
         mGW13QBBt2D8lwUa0SEWxIffjqMqgssSVoMTUrqNmKyL7DEerlIo1bTFHe2NTMNXGabh
         U4kNK8iXNMuDT1Gm1a+fJZXh5EwhtWxm9zoFe//atbUQZGqVqDvZYXAZYsiMoe0dvtzj
         IG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+sWYGz5XT9OAhWSz7+RnTv94A8j0P9pbFdVtTXC675o=;
        fh=icJRjnQn96SFD1N4W5xWyCs63bX5+eE3RHd+2ioIcRQ=;
        b=R9YrNmqdWnHD3nSYC20FAJA33MXkROK9JKjXw3LuAscvmoUIIt/g21XMuKQiaDjPyH
         4Sn97Rm0sC7wA2BqNaWtSFhazNrNMi/ovzt9ofw4fDELr5OD05JUdURGxRoBF5f8Ppod
         s5+63E7Tfk7igS3QWqs6T329QaZfY+P+gNESRwPS6tnwU10ZPYdr8JC0L8ENVWxYTI/R
         HMdy6K5BsLNJIpyGyIKG92qjg8XV7wyIVahTFrra0sDcfN4cpEvl5vgzQGFD3a+yPsQL
         eLNVnvwN2gr+l3ClusLWGb4TTapc7B3rWkxo66PaRObmJ9ItByoLHU28nKd8zvhnZMHG
         46Mg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786971413; x=1787576213; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+sWYGz5XT9OAhWSz7+RnTv94A8j0P9pbFdVtTXC675o=;
        b=bFZfUWy9ZZwSesQ+PlhzIO1MdgqueJ/U/UFk13GaYAWe+poNZ4kc7TumsWUKNK15+b
         0uQ/3Ugdt8ku4s3TRIwWbyNpaF1BpeFzEP1SyFpEsoboha78rmyQvGP51LCmmzQcgsJa
         +W7SkR0EyxAjjkxbquWnImuB5YVNBGZpqL441/ClZJ2gU2e1dijOtfv9lk6zPGypb5ta
         OGw9vgciSe06DEHe4kGd4UqZu9qCz0+MV7r/CxwA7s161anhiNec3V40MhLVodeumCNO
         UoLNabriYbfu1eZJIUXNNSNIoaK0lTCnEHfWVfk4I7Z3i3mXwsqtBRopfmyMUs34P5s2
         PRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786971413; x=1787576213;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+sWYGz5XT9OAhWSz7+RnTv94A8j0P9pbFdVtTXC675o=;
        b=ma2kCozzuz4rMIUvJUFbzkPgTREZ+cn6G5eXAZqEBgQ2NAagBHv0QT0wRbBwpTAZHe
         tkt2c5JK6cFiJE6fywkuzkfUXOAxDOVTmVh1+/o5ROCXQvwqHrqyYHWjnnwL/iqzYQEa
         J/L91FPiEupPq5usP70ncX47/0NvENNNpJ9UaXVnLFmdecjp3l/r1iR3Ql5EhtbYW48v
         L5yMLJv/CQ3ucWqUbZ5h/+F6iPBVi27oyUoXrdEOewv8N3NudunmnvKXP9zEMmz+LGhd
         o6IeHyvu1vfacEEvFutB/wRdV/nwnMHMFEz/8U6oBDzs5RJ/GO4/HjMZCmQ9xehy4bzm
         cZNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvO7gc209FVDAmn6Hl0AiMywS5lCsheNHu89yb31mK+Zt52XfPltJqhtBGf9Vyuv/G9I4+Mq2rf315l9iHkKte@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1YFmlO74Silbd3CgyGVDBn5uOUwVPmrZEpTT/7FLSR1PMNPYR
	9Xt301M+iNLmSwsjwBVkcy2NjEjP3T8Rc5lixiv0zEuPHwFxwN+BcD7mu7+ki0yOUc5MN4DONZ6
	wZnDYAOkBQtWQzrqnRDM8xnAHIo2klKE=
X-Gm-Gg: AR+sD11EbmeZlfiMqd46jptG62AYz+FIQDN2dnx/DsMsWq2Ah/Xb0NaMRwPl5IxWBR1
	SV7Is7kyUM3OLD+ruXyzqOaQXFS357yA51SrV4ktFRIAw90MZxc7Xe0FwFCaDn21BcZ1kArHRYa
	zWzmoYprD6xZlWQlbPrvGkIG99KUZzI7ILCmrA2KHDN2dq26QYB21bb4/vIYhpvw8wbb3ikPolM
	TLLofZSg/aMvLLwZjhOg33aOyvmP2sXHjcwQnZ/R9J0yFvfKCBZM70jVFjWPu0i2dglIOrbDW45
	nDZk9jTUsvjTl7e9tSVNH5wXzKBCIY3NkXWPwtIJVkijHEGKbaow57fryRVTxIfBIUeUHUQd4xa
	z6NI=
X-Received: by 2002:a05:690c:4c07:b0:7f0:9099:daed with SMTP id
 00721157ae682-837081dbb86mr86189087b3.0.1786971412607; Mon, 17 Aug 2026
 05:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260817113603.1436067-1-gahing@gahingwoo.com> <20260817113603.1436067-3-gahing@gahingwoo.com>
In-Reply-To: <20260817113603.1436067-3-gahing@gahingwoo.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Mon, 17 Aug 2026 14:56:40 +0200
X-Gm-Features: AcwNN1V-5NLT5_FLJWlZREIascUsv5ajt7d1tsDmiA1E2hxh05iV2LoVrZcqDUw
Message-ID: <CAEWPSH7tM9WQUJ0H13ghkiHGzDcdycC1syTuO5B8DpC6cUSnfg@mail.gmail.com>
Subject: Re: [PATCH v8 02/12] accel/rocket: wait for a running IRQ handler
 before resetting a core
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de, 
	ogabbay@kernel.org, zhangqing@rock-chips.com, chaoyi.chen@rock-chips.com, 
	diederik@cknow-tech.com, alchark@flipper.net, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_055654_254371_734EF7D7 
X-CRM114-Status: GOOD (  50.28  )
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

Hi Jiaxing,

I have not run v8 on hardware yet. Everything below is source review.
My Tested-by on 1/12 is from the v7 run and I am not extending it to
this patch yet; the last section says why, and what I will run instead.
Line numbers are next-20260814.

The patch is right and the reasoning in the message is right.
synchronize_irq() is the correct one of the pair: __synchronize_irq()
does the hardirq spin and then waits on desc->wait_for_threads
(kernel/irq/manage.c), so it fences the threaded handler, which is the
one that takes job_lock. synchronize_hardirq() would not have. Worth
adding to your placement argument: the deadlock you avoided would have
been a silent hang rather than a lockdep splat, because that wait is on
a waitqueue and not on a lock, so lockdep does not model it at all.
Nothing would have told you.

Two questions, both about what the reset path does not do.

1. Would you also mask the block before the sync?

rocket_reset() is descended from panfrost_reset(), and the comment this
patch replaces is inherited from it word for word. In panfrost that
comment is earned, because three things happen before it:

    job_write(pfdev, JOB_INT_MASK, 0);
    synchronize_irq(pfdev->js->irq);
    ... soft-stop ...
    panfrost_jm_handle_irqs(pfdev);

(panfrost_job.c:692-693 and :710, with the same sentence rocket carries
at :712-715). Rocket inherited the sentence and none of the three steps,
which is your point, and 2/12 restores one of them.

Without the device level mask a fresh completion interrupt can still
arrive after synchronize_irq() returns. INTERRUPT_MASK is armed on every
submit (rocket_job.c:142) and the only place it is cleared is the
hardirq (:446); rocket_reset() never touches it. In the ordinary
timeout, where no interrupt fired before the job hung, the mask is still
live. So: would you write

    rocket_pc_writel(core, INTERRUPT_MASK, 0x0);

immediately before the synchronize_irq()? It is safe to do, since
hw_submit() re-arms the mask on every submit, so nothing is lost.

I do not think this is a hole. The reset.pending check in hw_submit()
(:116, returning before next_task_idx++ at :123) already stops the
resubmit branch from firing here. It is about making the new comment
literally true. I have no TRM, so I am not claiming that a write landing
on a block under reset is harmful.

2. Should rocket_reset() hold a runtime PM reference?

This one surprised me. drm_sched_stop() zeroes the credit counter and it
is only restored in drm_sched_start(), the last line of rocket_reset().
That counter is the only thing gating suspend: rocket_job_is_idle() is
exactly atomic_read(&core->sched.credit_count) (rocket_job.c:540-543),
and rocket_device_runtime_suspend() returns -EBUSY iff that says busy,
then disables the clocks (rocket_drv.c). So for the whole body of
rocket_reset() the driver is telling runtime PM the core is idle while
holding no reference, and rocket_core_reset() is an assert, udelay(10),
deassert on top of that.

The part that touches this patch: the two puts are not equivalent.
pm_runtime_put_noidle() is a bare decrement with no idle request, so
nothing is armed. put_autosuspend() arms the 50 ms timer. Before 2/12 it
depended on who won the lock. After 2/12, if a completion interrupt was
in flight, the handler is guaranteed to finish its retire first, so
put_autosuspend() runs, the reset finds in_flight_job NULL and skips its
put_noidle, and rocket_core_reset() runs with a live timer. In the plain
hung-job case there is no handler and put_noidle still runs, so this is
only the racing case.

I have not seen it fire, and panfrost has the same
is_idle-on-credit_count shape, so this may be inherited and intended.
But would you bracket the reset with pm_runtime_get_sync() and
pm_runtime_put_autosuspend()? For contrast, panfrost_device_reset()
re-powers the block and re-initialises the MMU; rocket_core_reset()
toggles the reset lines and returns.

On the RK3576 non-recovery in your cover

You wrote that you have not worked out what sits between
rocket_core_reset() and rk_iommu re-enabling the MMU. Three things from
the source that may narrow it. I have no RK3576, so this is a direction,
not a diagnosis.

- That message is rk_iommu_force_reset(), reached only from
  rk_iommu_enable(), via attach or runtime_resume. Never from
  rocket_core_reset(). Since rocket attaches per job, the report is at
  the next job, so the damage precedes it. That matches your "a few
  seconds later".

- The check is a write-then-readback of RK_MMU_DTE_ADDR, and
  rk_iommu_enable_stall() returns 0 silently when paging is not enabled,
  which it decides by reading RK_MMU_STATUS. So a block whose registers
  read back zero produces exactly that message with nothing printed
  before it. It means the MMU is not responding at all, rather than
  being in a wrong state. Worth grepping the same run for "stall request
  timed out" and "paging request timed out"; if they are absent, that
  reading holds.

- Between the reset and the next job the core does not power cycle.
  put_noidle leaves usage_count at 0 with the device still active and no
  idle request pending. So the domain stays up, and on RK3576 the BIU
  reset your 9/12 cycles on power-on never gets cycled. If the MMU needs
  that to come back, it never gets it.

One build would settle it: put_autosuspend() instead of put_noidle() at
the end of rocket_reset(), or force a suspend and resume before the next
job, and see whether the block returns.

One question only you can answer: did MMU_DTE_ADDR appear on v7 too,
before the rail moved to domain-supply? If it did not, "existing
behaviour rather than something the series introduces" may want another
look.

What I will run, and why no tag yet

I am not putting Tested-by on this patch from an ordinary run, because
an ordinary run cannot reach the code it changes. rocket_reset()
early-returns unless reset.pending (:368), and
atomic_set(&core->reset.pending, 1) appears at exactly one site in the
driver, inside rocket_job_timedout() (:405). No debugfs knob, no sysfs
trigger, no error path. (Separately, rocket_reset_work() is never queued
anywhere, which does not affect your message but is a cleanup
candidate.) At 182 inf/s an RK3588 job is about 5.5 ms against a 500 ms
timeout, so I have never been near it.

So: a test build with JOB_TIMEOUT_MS lowered to 2, which makes healthy
jobs time out with a completion interrupt genuinely in flight, which is
the window 1/12 and 2/12 exist for. Twenty induced resets per core
across all three, with and without 1/12+2/12 for a differential, at
least one inference after each reset and one after an autosuspend and
resume, and PROVE_LOCKING plus DEBUG_ATOMIC_SLEEP on. On RK3588 core 0
sits in PD_NPUTOP, which is the parent of PD_NPU1 and PD_NPU2, so I will
do core 0 with the other two busy and core 1 on its own. Capturing
dmesg, the per-core lines in /proc/interrupts either side of each
timeout, runtime status, the genpd summary, and the output tensor
against my existing bit-exact baseline.

If all three cores come back clean, that says your non-recovery is
RK3576-specific, which is the useful answer. If RK3588 logs the same
MMU_DTE_ADDR, it is rocket-wide and pre-existing, wants its own patch,
and should not hold up v8. Either way I will report it with the lowered
timeout stated in the trailer.

Reviewed-by on 3/12 sent separately.

Regards,
Igor


On Mon, Aug 17, 2026 at 1:36=E2=80=AFPM Jiaxing Hu <gahing@gahingwoo.com> w=
rote:
>
> rocket_reset() calls drm_sched_stop(), which stops the scheduler and
> returns. It does not wait for a threaded handler that is already
> running, so the comment that follows, "Remaining interrupts have been
> handled", states an assumption rather than something the code arranges.
>
> Call synchronize_irq(core->irq) after drm_sched_stop() and reword the
> comment to say what holds afterwards.
>
> It has to go before the scoped_guard(mutex, &core->job_lock) rather than
> inside it. rocket_job_handle_irq() takes job_lock, so waiting for the
> handler while holding that lock would be waiting for a handler that is
> waiting for us. Nothing is held at that point, and both callers,
> rocket_job_timedout() and rocket_reset_work(), run in process context,
> so sleeping there is allowed.
>
> This does not stop a handler that has already read in_flight_job from
> finishing its work on the job the reset is about to drop. That window
> needs the check and the register writes to be one step under the lock,
> which is what the previous patch does; the two are complementary.
>
> Suggested-by: Igor Paunovic <royalnet026@gmail.com>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>  drivers/accel/rocket/rocket_job.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index 5f0f9682e..d484a3a6f 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -377,9 +377,17 @@ rocket_reset(struct rocket_core *core, struct drm_sc=
hed_job *bad)
>         drm_sched_stop(&core->sched, bad);
>
>         /*
> -        * Remaining interrupts have been handled, but we might still hav=
e
> -        * stuck jobs. Let's make sure the PM counters stay balanced by
> -        * manually calling pm_runtime_put_noidle().
> +        * drm_sched_stop() returns without waiting for a threaded handle=
r that
> +        * is already running, so wait for one here. This has to stay out=
side
> +        * job_lock: the handler takes that lock, so waiting for it while
> +        * holding it would deadlock instead of fencing anything.
> +        */
> +       synchronize_irq(core->irq);
> +
> +       /*
> +        * No handler is running now, but we might still have stuck jobs.=
 Let's
> +        * make sure the PM counters stay balanced by manually calling
> +        * pm_runtime_put_noidle().
>          */
>         scoped_guard(mutex, &core->job_lock) {
>                 if (core->in_flight_job)
> --
> 2.43.0
>

