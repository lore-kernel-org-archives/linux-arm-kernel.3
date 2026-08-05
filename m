Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708F5C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYipmvy8BI8I1Qtw+TSNrjC+oqcUlujhn8ixrQDKmwc=; b=BZ/QzQtV1dXAl0DgA7rU4qdP4X
	+asmqdtGv4Xr2NzGNB3bgJLnsSC/e8qZa9FytLdJNKddZecn/yqByT9XF9wYJUtyQCsa/lwlTtUTw
	TCi0Vct5dTdphivr0mmcwdoXRZI5GQE782RCxvr8K9WxzQgM/jFENM0pFOhrYoLbjqZKI+Qj2zF2p
	LeYplSDM7C2OtyNL436ijJHm1EUFxxkFygB2WxgVIkV1hz/CvjSSr4HXDHK86Uy5QrGIqcjxRC5jq
	Th3uYoJg9kq2lMaJjkfnjz/cumBqQe3qOUZyINTYW+3s4SYl/2Cvc4BKn/rr7IlPjFdfyslvxphBo
	6vnYaBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYxD-00000003kkH-31k3;
	Wed, 05 Aug 2026 10:34:31 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYx8-00000003kiu-2SJz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 10:34:30 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-81e8c68c0cdso486027b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 03:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785926065; cv=none;
        d=google.com; s=arc-20260327;
        b=fdrhIIaWUCfRZIY8kHUEs7y7KATDnvV6S+XMYQsun2h1tOL0ZtKs9c2miMXzPKARHm
         c8AZavoeoQZLeRFKAYuMF3g+Et6/iNBKwiM7zBL9xDEIeFonIWk3UsYfxIiMXzQESdt2
         /2NvKTzTyzIXG884AuukWIzOXHpaZKjpx+qSTJEjoKxZwLee7jVD993s5q6tBVb5VbRj
         /tUIrK/RFXGZDK3/eH/n0nHOzkl3Bd83a25L0EyOWoskAV7+80rH+L1bsmSoOnmEF8Ns
         r+2kLsYUstaulETnV+Hdy1o/Pl1EUO/slkak1+hCV4L5dezokk4RiwdQnfhWoOa9JCBz
         5h5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CYipmvy8BI8I1Qtw+TSNrjC+oqcUlujhn8ixrQDKmwc=;
        fh=PAYUfWWp/EhAsm1HGmf+C9j3TELy5Oe3MDModqMaaqM=;
        b=TDaR6yqN/S0O7LPSsRfDlUZqEVpysDQYCsfhsf+18/rovrzbztzp7OywZNBxFYdf7a
         OdtM99WLWUjbNCg2UCQ36THCLDuwgOorQD7wUr1IujBQesdFXIlK5PCVGT2iSXesx7tF
         IF6WspK9BmrWmVNPi3qR/6JA9wIPQLIC4U1G8sblsgE3PtTYQTsPt7gWrqEifLfiCBwB
         DXaXGqgRniBlfITUCnQ+ybYq5MJsKBhtrpvSRkop6yAx51/W0A4Y2eB54Dw4YQ1Nnrh3
         aI7TFDwZQz3dQDs+zZGpL/FUyOF/ioZm56fe41QX9duoQhqnALQrBIsujxZHrWqnKmE9
         XWUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785926065; x=1786530865; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CYipmvy8BI8I1Qtw+TSNrjC+oqcUlujhn8ixrQDKmwc=;
        b=Efh0NzkG2Svw+hEeGkcnOLMiFqlGe0KltCfJLp44Odvo2+AabH7nqrVUsv8dyAjwLR
         rIgU1CbvzT//NwItZOne83WZtU+mdGU8EgfqU961JVQEVcVO6BafKDKeH9NWKzkisWEw
         mz2RQNIZA5RGiVpDdzYXchW5mTzeDFhZaceZMSmDRdrEKyZyXLN/Ye3ubwQwOK4TfZkF
         nfR3kALXJVc4Mk1Wwfk8mck1kTxAJ3ISD3jFKMolExQ2i8r9prX/kLoGmuVcvX31uzxM
         9s0S3Zn/aFyvTIxJAIljaIHJGmySEB1LtHbWDqmX8bSikuGvJGiqk1QX62q5zRbaEGKJ
         P6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785926065; x=1786530865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYipmvy8BI8I1Qtw+TSNrjC+oqcUlujhn8ixrQDKmwc=;
        b=Ds1/+i0Lz2jf2Xvu0FYW/BLEq3bs2Q24DULfv9+VrlXuqK4OqJcCB0pjpwARmaYFBr
         m5GyfWrugRThU4O8kkZibVR20aRCE+/KQjzpiXT4BDsLWtzRq09ASrCBT1OCOb9+nnJM
         P/LoLFYmMcMJv/rCCDAXpbZxTBKuC42b7tjNvsA7r9M4pmm3cBpv5jzMX0+CXASLMzn6
         oE0VeKy435uZan+kFk4Gk12FkY8YnbuJU5n5qq8xdvfq0DG9o5PFl1RXo34qsxGZK+u7
         EalePbY061eaOni0MklpMWrKAVx99r1golVKdz4hBbKHicn7RYdE2SWAF8WQVWajqvOm
         7INQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6LlTrQ8ntb0RbFZc2qGk3cGn5NHLIdu9QFZncLIyXyELbcx5pAJval9BR7lhIiwTVjQNfCm4F4D45gBfDaC5x@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5j4KkAQDp2pRNx0K9CBnT9iGc0TudaMDfC6b7v/Jdj0ZBMf2e
	3ijeuUtZnvKPifO1jBXenaWDaEEzcJYzvzpUMwSQBQm3Zib2fAC8lmWl1zeXqBuKlIbNOuJa+oG
	orOlvXnZw83EJA8yz2lx0dAt1F/mxE6o=
X-Gm-Gg: AR+sD10ZvT2Sse6E2YwsmNigyXKLm7Pp3gbX5muiTY9AMJNgPORHqk8dXM8l48Ag7MP
	nGrv1B26h2aliJh5DjbxUwIwiuuPQYr12dPj5UctLXqmaKd/eEww4oRTvowdZJ6XB7oFrNT2Zih
	IH9hFaCbnVtGFHgaSBvDvhKtj4cSX0adLZwXwctsANrNDogRT/1MNMyMYt4IZ+7qkVcCvdjufqL
	lMnaNRS07rnFefmh/hdsHFWLqcs1m+2khZheBAqFiqsLuTWtkbDgPgmZKUml9U8eBNOA+nCCKFG
	BkUnkJNwuj6Bd1E3mHXfmKP6tnSffTwv+y7Re3p/Sm1Z77X5o6zJ3nAhbAGW0ZBRbaengTL+QQX
	smdQDDv+4hs5Nww==
X-Received: by 2002:a05:690c:1b:b0:80d:6405:d23c with SMTP id
 00721157ae682-8201bc5158cmr34391067b3.1.1785926065045; Wed, 05 Aug 2026
 03:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260805063826.95682-1-gahing@gahingwoo.com> <20260805063826.95682-7-gahing@gahingwoo.com>
In-Reply-To: <20260805063826.95682-7-gahing@gahingwoo.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Wed, 5 Aug 2026 12:34:13 +0200
X-Gm-Features: AUfX_mzyPDhGmiDec-KsNNkLfKKPmkeYrGC3VryYdOeTV2b_-URDIRYfaxH-rU4
Message-ID: <CAEWPSH7wFn1Y0P+1nJJiqNcp4V12Eo6kojaFt1tSau3tp-OKQQ@mail.gmail.com>
Subject: Re: [RFC PATCH v5 v5 6/8] accel/rocket: add RK3576 NPU (RKNN) support
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de, 
	ogabbay@kernel.org, zhangqing@rock-chips.com, alchark@flipper.net, 
	chaoyi.chen@rock-chips.com, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_033426_722619_95F137C1 
X-CRM114-Status: GOOD (  43.23  )
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

A few things on this patch. The first two are coordination and a small
inconsistency; the three after them come from reading the new poll and
probe paths rather than from the bench, and none of them are reachable
on RK3588, so I cannot put a measurement behind them.

First, coordination. 6/8 still carries the four clks[].id assignments,
and the commit message still describes the RK3588 path as keeping its
existing behaviour unchanged. That hunk is the standalone fix I have in
flight:

 https://lore.kernel.org/linux-rockchip/20260729130743.128876-1-royalnet026=
@gmail.com/

which carries your Reviewed-by and a Tested-by from Sidong Yang, and is
waiting on Tomeu. Your v3 cover flagged the overlap; v4 and v5 do not,
and I assume that was an editing casualty rather than a decision. If the
standalone lands first, this hunk will not apply cleanly, so it may be
worth either noting the dependency in the cover again or dropping the
hunk here and rebasing on it. Tomeu is the one who has to sequence the
two, so it is probably best said where he will look for it.

Second, a real if currently harmless inconsistency. This patch moves the
reset acquisition to soc->num_resets, which is 1 on RK3576:

  -    err =3D devm_reset_control_bulk_get_exclusive(&pdev->dev,
  -                            ARRAY_SIZE(core->resets),
  +    err =3D devm_reset_control_bulk_get_exclusive(&pdev->dev,
  +                            core->soc->num_resets,

but rocket_core_reset() still asserts and deasserts
ARRAY_SIZE(core->resets), which stays 2:

  void rocket_core_reset(struct rocket_core *core)
  {
      reset_control_bulk_assert(ARRAY_SIZE(core->resets), core->resets);
      udelay(10);
      reset_control_bulk_deassert(ARRAY_SIZE(core->resets), core->resets);
  }

On RK3576 that walks resets[1], which was never acquired. It is benign
today because the reset core returns 0 for a NULL rstc, so it is not a
bug report. But it is the kind of thing that stops being benign the
moment someone adds a NULL check or a WARN, and given that patch 5 has
just made the reset path load bearing for the behaviour you are chasing,
I would rather it read soc->num_resets in both places.

Third, and this is the one I would most like you to check, because I
cannot run it: poll_dying is a one-way latch. rocket_job_fini() sets it

    if (core->soc->poll_completion)
        WRITE_ONCE(core->poll_dying, true);

and nothing ever clears it. rocket_job_init() re-initialises the rest of
the poll state on the same struct, but not that field:

    INIT_WORK(&core->poll_work, rocket_poll_work_fn);
    hrtimer_setup(&core->poll_timer, rocket_poll_timer_fn, CLOCK_MONOTONIC,
              HRTIMER_MODE_REL);
    atomic_set(&core->poll_active, 0);

Across the whole series the flag has exactly three appearances: the
declaration in rocket_core.h, the write above, and the read in
rocket_poll_work_fn().

That matters because struct rocket_core can outlive a bind. rocket_probe()
hands rocket_device_init() the shared facade device rather than its own
pdev:

    rdev =3D rocket_device_init(drm_dev, &rocket_drm_driver);

and rocket_device_init() allocates the core array on it:

    rdev->cores =3D devm_kcalloc(dev, num_cores, sizeof(*rdev->cores),
GFP_KERNEL);

drm_dev is the "rknn" platform device registered in rocket_register().
It never binds a driver, so its devres list is only released at module
exit. Unbinding one core while another stays bound therefore leaves rdev
and that array alive and untouched, and the rebinding core is handed the
same struct rocket_core back. The driver already concedes this:
rocket_core_fini() has to clear core->iommu_group by hand, and that line
only makes sense because the struct survives the unbind.

On RK3576 the poll is the only completion path, so a core that comes
back with poll_dying still set never retires anything through it.
rocket_poll_work_fn() takes job_lock, reads the flag and returns before
the OPERATION_ENABLE and INTERRUPT_CLEAR writes and before
rocket_job_next_locked(), so done_fence is never signalled, the IOMMU
group is never detached and the runtime PM reference is never dropped.
Every job on that core then ends in the 500 ms drm_sched timeout and a
core reset instead, which is also the path that walks resets[1] from the
point above.

Now the part that I think explains why your unbind/rebind test is clean
and this is still there. 8/8 enables only rknn_core_0 on the ROCK 4D,
"the driver binds one core per node and the second core is left to
whoever can test it", so num_cores is 1 and every unbind on that board is
the last one. rocket_remove() then takes

    if (rdev->num_cores =3D=3D 0) {
        rocket_device_fini(rdev);
        rdev =3D NULL;
    }

and the next probe re-runs rocket_device_init(), which devm_kcalloc()s a
fresh, zeroed core array. The struct the rebinding core gets is a
different one, with poll_dying false. So your result is right and
honestly reported; the latch just is not reachable in that
configuration. It needs both rknn_core_0 and rknn_core_1 enabled, which
7/8 already ships the nodes for, and an unbind of one while the other
stays bound:

    echo 27708000.npu > /sys/bus/platform/drivers/rocket/unbind
    echo 27708000.npu > /sys/bus/platform/drivers/rocket/bind

followed by inference on a freshly opened fd, since the scheduler list is
built at open time. Unbinding both cores and rebinding both will not show
it either, for the same reason the single core case does not: that path
reallocates rdev and the array from scratch.

I should disclose that my own in-flight 2/2, "keep core slots stable
across unbind and rebind", is what would make this deterministic. Today
the rebinding core takes index rdev->num_cores, so which struct it lands
in depends on the unbind order; with that patch it always reclaims its
own just-fini'd slot, which is exactly the one rocket_job_fini() latched.
I would rather it were fixed here than found after both land. One line
next to the existing atomic_set() in rocket_job_init() covers it:

    WRITE_ONCE(core->poll_dying, false);

Init side rather than fini side, so a slot left dirty by a failed probe
is covered as well. RK3588 is unaffected either way, since
poll_completion is false there and the flag is never written.

Fourth, still in rocket_job_fini() and connected to the above: the flag
is written without job_lock but read under it, and cancel_work_sync()
comes after hrtimer_cancel(). A poll_work that has already passed the
check inside job_lock can therefore go on to rocket_job_next_locked() ->
rocket_job_hw_submit() and run

    hrtimer_start(&core->poll_timer, ns_to_ktime(RK3576_POLL_INTERVAL_NS),
              HRTIMER_MODE_REL);

after hrtimer_cancel() has already returned. cancel_work_sync() then
waits for that worker and returns with the timer armed. fini returns,
rocket_core_fini() and rocket_remove() return, devres unmaps the register
windows, and roughly a millisecond later the timer fires into
rocket_pc_readl(core, INTERRUPT_RAW_STATUS). That is the property the
comment above the flag claims, "a job running now cannot re-arm the timer
behind the cancel", and I do not think the code has it yet.

Taking job_lock around the WRITE_ONCE would close it: any worker past the
check holds the lock, so fini waits behind it, and every later one
observes the flag. Reordering the two cancels alone only narrows the
window, since the timer callback is what queues the work.

Fifth, an error path. The new attach sits after rocket_job_init():

    err =3D rocket_job_init(core);
    if (err) {
        iommu_group_put(core->iommu_group);
        core->iommu_group =3D NULL;
        return err;
    }

+    if (core->soc->multi_power_domain) {
+        struct dev_pm_domain_list *pd_list;
+
+        err =3D devm_pm_domain_attach_list(dev, NULL, &pd_list);
+        if (err < 0)
+            return dev_err_probe(dev, err,
+                         "failed to attach NPU power domains\n");
+    }

By that point rocket_job_init() has taken two things devres does not own,
core->reset.wq from alloc_ordered_workqueue() and core->sched from
drm_sched_init(), which allocates its own submit workqueue as well, plus
the iommu_group reference that the branch immediately above is careful to
put. The new return unwinds none of them; every other failure after
rocket_job_init() goes through rocket_core_fini(). -EPROBE_DEFER is the
realistic case here, and it retries, so it repeats.

Moving the attach up, above core->iommu_group =3D iommu_group_get(dev),
makes the bare return correct and also attaches the domains before the
IRQ and the scheduler exist, which reads better anyway.

And a nit: the forward declaration

    static void rocket_job_handle_irq(struct rocket_core *core);

has no user. Between it and the definition are rocket_poll_timer_fn(),
rocket_job_next_locked() and rocket_poll_work_fn(), none of which call
it, and the only caller, rocket_job_irq_handler_thread(), sits below the
definition. A leftover from the earlier shape where the poll work called
handle_irq() directly, I think.

Igor

On Wed, Aug 5, 2026 at 8:39=E2=80=AFAM Jiaxing Hu <gahing@gahingwoo.com> wr=
ote:
>
> The RK3576 carries the same RKNN block as the RK3588, with two cores
> instead of three and a few platform differences:
>
>  - the CBUF (convolution buffer) has its own clock domain, so the core
>    needs six clocks rather than four;
>  - the BIU reset moved into the power domain, leaving one reset here;
>  - the NPU spans two power domains, and a device with more than one is
>    skipped by the driver-core single-domain auto-attach, so the list has
>    to be attached explicitly;
>  - the DPU completion interrupt is armed exactly as on RK3588 but never
>    reaches the GIC. The completion is visible in INTERRUPT_RAW_STATUS,
>    so sample that from an hrtimer rather than wait for an interrupt that
>    does not come. The interrupt stays armed, so if it ever does arrive
>    the normal handler finalises the job first.
>
> Select all of that from of_device_id match data so the RK3588 path keeps
> its existing counts and behaviour unchanged.
>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>  drivers/accel/rocket/rocket_core.c   |  26 +++++-
>  drivers/accel/rocket/rocket_core.h   |  20 ++++-
>  drivers/accel/rocket/rocket_device.c |   4 +
>  drivers/accel/rocket/rocket_drv.c    |  22 ++++-
>  drivers/accel/rocket/rocket_job.c    | 121 ++++++++++++++++++++++++---
>  5 files changed, 176 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/ro=
cket_core.c
> index b3b2fa9ba..e08288c8c 100644
> --- a/drivers/accel/rocket/rocket_core.c
> +++ b/drivers/accel/rocket/rocket_core.c
> @@ -8,6 +8,7 @@
>  #include <linux/err.h>
>  #include <linux/iommu.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>
> @@ -21,14 +22,22 @@ int rocket_core_init(struct rocket_core *core)
>         u32 version;
>         int err =3D 0;
>
> +       /* RK3576 moves the BIU reset into its power domain and takes onl=
y srst_a. */
>         core->resets[0].id =3D "srst_a";
>         core->resets[1].id =3D "srst_h";
> -       err =3D devm_reset_control_bulk_get_exclusive(&pdev->dev, ARRAY_S=
IZE(core->resets),
> +       err =3D devm_reset_control_bulk_get_exclusive(&pdev->dev, core->s=
oc->num_resets,
>                                                     core->resets);
>         if (err)
>                 return dev_err_probe(dev, err, "failed to get resets for =
core %d\n", core->index);
>
> -       err =3D devm_clk_bulk_get(dev, ARRAY_SIZE(core->clks), core->clks=
);
> +       core->clks[0].id =3D "aclk";
> +       core->clks[1].id =3D "hclk";
> +       core->clks[2].id =3D "npu";
> +       core->clks[3].id =3D "pclk";
> +       /* RK3576 clocks the CBUF separately; the compute path stalls wit=
hout these. */
> +       core->clks[4].id =3D "aclk_cbuf";
> +       core->clks[5].id =3D "hclk_cbuf";
> +       err =3D devm_clk_bulk_get(dev, core->soc->num_clks, core->clks);
>         if (err)
>                 return dev_err_probe(dev, err, "failed to get clocks for =
core %d\n", core->index);
>
> @@ -65,6 +74,19 @@ int rocket_core_init(struct rocket_core *core)
>                 return err;
>         }
>
> +       /*
> +        * RK3576 spans two power domains, and a multi-domain device is s=
kipped
> +        * by the driver-core single-domain auto-attach, so attach the li=
st here.
> +        */
> +       if (core->soc->multi_power_domain) {
> +               struct dev_pm_domain_list *pd_list;
> +
> +               err =3D devm_pm_domain_attach_list(dev, NULL, &pd_list);
> +               if (err < 0)
> +                       return dev_err_probe(dev, err,
> +                                            "failed to attach NPU power =
domains\n");
> +       }
> +
>         pm_runtime_use_autosuspend(dev);
>
>         /*
> diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/ro=
cket_core.h
> index f6d738285..205ff070d 100644
> --- a/drivers/accel/rocket/rocket_core.h
> +++ b/drivers/accel/rocket/rocket_core.h
> @@ -6,6 +6,7 @@
>
>  #include <drm/gpu_scheduler.h>
>  #include <linux/clk.h>
> +#include <linux/hrtimer.h>
>  #include <linux/io.h>
>  #include <linux/mutex_types.h>
>  #include <linux/reset.h>
> @@ -27,16 +28,25 @@
>  #define rocket_core_writel(core, reg, value) \
>         writel(value, (core)->core_iomem + (REG_CORE_##reg) - REG_CORE_S_=
STATUS)
>
> +/* Per-SoC differences, selected by the of_device_id match data. */
> +struct rocket_soc_data {
> +       unsigned int num_clks;          /* clk_bulk count: 4 base, 6 with=
 CBUF */
> +       unsigned int num_resets;        /* reset_bulk count: 2 base, 1 on=
 RK3576 */
> +       bool multi_power_domain;        /* device spans more than one PM =
domain */
> +       bool poll_completion;           /* completion IRQ never reaches t=
he GIC */
> +};
> +
>  struct rocket_core {
>         struct device *dev;
>         struct rocket_device *rdev;
> +       const struct rocket_soc_data *soc;
>         unsigned int index;
>
>         int irq;
>         void __iomem *pc_iomem;
>         void __iomem *cna_iomem;
>         void __iomem *core_iomem;
> -       struct clk_bulk_data clks[4];
> +       struct clk_bulk_data clks[6];
>         struct reset_control_bulk_data resets[2];
>
>         struct iommu_group *iommu_group;
> @@ -52,6 +62,14 @@ struct rocket_core {
>                 atomic_t pending;
>         } reset;
>
> +       struct hrtimer poll_timer;
> +       struct work_struct poll_work;
> +       atomic_t poll_active;
> +       unsigned int poll_ticks;
> +       unsigned int poll_seq;
> +       unsigned int poll_work_seq;
> +       bool poll_dying;
> +
>         struct drm_gpu_scheduler sched;
>         u64 fence_context;
>         u64 emit_seqno;
> diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/=
rocket_device.c
> index 46e6ee1e7..bfb00f967 100644
> --- a/drivers/accel/rocket/rocket_device.c
> +++ b/drivers/accel/rocket/rocket_device.c
> @@ -31,6 +31,10 @@ struct rocket_device *rocket_device_init(struct platfo=
rm_device *pdev,
>                 if (of_device_is_available(core_node))
>                         num_cores++;
>
> +       for_each_compatible_node(core_node, NULL, "rockchip,rk3576-rknn-c=
ore")
> +               if (of_device_is_available(core_node))
> +                       num_cores++;
> +
>         rdev->cores =3D devm_kcalloc(dev, num_cores, sizeof(*rdev->cores)=
, GFP_KERNEL);
>         if (!rdev->cores)
>                 return ERR_PTR(-ENOMEM);
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/roc=
ket_drv.c
> index 8bbbce594..7f7dfa374 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -176,6 +176,7 @@ static int rocket_probe(struct platform_device *pdev)
>
>         rdev->cores[core].rdev =3D rdev;
>         rdev->cores[core].dev =3D &pdev->dev;
> +       rdev->cores[core].soc =3D of_device_get_match_data(&pdev->dev);
>         rdev->cores[core].index =3D core;
>
>         rdev->num_cores++;
> @@ -213,8 +214,23 @@ static void rocket_remove(struct platform_device *pd=
ev)
>         }
>  }
>
> +static const struct rocket_soc_data rk3588_soc_data =3D {
> +       .num_clks =3D 4,
> +       .num_resets =3D 2,
> +       .multi_power_domain =3D false,
> +       .poll_completion =3D false,
> +};
> +
> +static const struct rocket_soc_data rk3576_soc_data =3D {
> +       .num_clks =3D 6,
> +       .num_resets =3D 1,
> +       .multi_power_domain =3D true,
> +       .poll_completion =3D true,
> +};
> +
>  static const struct of_device_id dt_match[] =3D {
> -       { .compatible =3D "rockchip,rk3588-rknn-core" },
> +       { .compatible =3D "rockchip,rk3588-rknn-core", .data =3D &rk3588_=
soc_data },
> +       { .compatible =3D "rockchip,rk3576-rknn-core", .data =3D &rk3576_=
soc_data },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);
> @@ -240,7 +256,7 @@ static int rocket_device_runtime_resume(struct device=
 *dev)
>         if (core < 0)
>                 return -ENODEV;
>
> -       err =3D clk_bulk_prepare_enable(ARRAY_SIZE(rdev->cores[core].clks=
), rdev->cores[core].clks);
> +       err =3D clk_bulk_prepare_enable(rdev->cores[core].soc->num_clks, =
rdev->cores[core].clks);
>         if (err) {
>                 dev_err(dev, "failed to enable (%d) clocks for core %d\n"=
, err, core);
>                 return err;
> @@ -260,7 +276,7 @@ static int rocket_device_runtime_suspend(struct devic=
e *dev)
>         if (!rocket_job_is_idle(&rdev->cores[core]))
>                 return -EBUSY;
>
> -       clk_bulk_disable_unprepare(ARRAY_SIZE(rdev->cores[core].clks), rd=
ev->cores[core].clks);
> +       clk_bulk_disable_unprepare(rdev->cores[core].soc->num_clks, rdev-=
>cores[core].clks);
>
>         return 0;
>  }
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index bb77b6bf0..28845ac4e 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -7,6 +7,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
>  #include <drm/rocket_accel.h>
> +#include <linux/hrtimer.h>
>  #include <linux/interrupt.h>
>  #include <linux/overflow.h>
>  #include <linux/iommu.h>
> @@ -21,6 +22,15 @@
>
>  #define JOB_TIMEOUT_MS 500
>
> +/*
> + * RK3576 arms the same DPU completion as RK3588, but the interrupt neve=
r
> + * reaches the GIC. The completion itself is visible in INTERRUPT_RAW_ST=
ATUS,
> + * so sample that instead. The tick cap bounds jobs that never raise it =
at all,
> + * which is the same open problem as the wrong inference results.
> + */
> +#define RK3576_POLL_INTERVAL_NS        1000000LL       /* 1 ms */
> +#define RK3576_POLL_MAX_TICKS  8
> +
>  static struct rocket_job *
>  to_rocket_job(struct drm_sched_job *sched_job)
>  {
> @@ -151,6 +161,14 @@ static void rocket_job_hw_submit(struct rocket_core =
*core, struct rocket_job *jo
>
>         rocket_pc_writel(core, OPERATION_ENABLE, PC_OPERATION_ENABLE_OP_E=
N(1));
>
> +       if (core->soc->poll_completion) {
> +               core->poll_ticks =3D 0;
> +               core->poll_seq++;
> +               atomic_set(&core->poll_active, 1);
> +               hrtimer_start(&core->poll_timer, ns_to_ktime(RK3576_POLL_=
INTERVAL_NS),
> +                             HRTIMER_MODE_REL);
> +       }
> +
>         dev_dbg(core->dev, "Submitted regcmd at 0x%llx to core %d", task-=
>regcmd, core->index);
>  }
>
> @@ -341,25 +359,87 @@ static struct dma_fence *rocket_job_run(struct drm_=
sched_job *sched_job)
>         return ERR_PTR(ret);
>  }
>
> +static void rocket_job_handle_irq(struct rocket_core *core);
> +
> +static enum hrtimer_restart rocket_poll_timer_fn(struct hrtimer *timer)
> +{
> +       struct rocket_core *core =3D container_of(timer, struct rocket_co=
re, poll_timer);
> +       u32 raw;
> +
> +       if (!atomic_read(&core->poll_active))
> +               return HRTIMER_NORESTART;
> +
> +       core->poll_work_seq =3D core->poll_seq;
> +
> +       raw =3D rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
> +       if ((raw & (PC_INTERRUPT_RAW_STATUS_DPU_0 | PC_INTERRUPT_RAW_STAT=
US_DPU_1)) ||
> +           ++core->poll_ticks >=3D RK3576_POLL_MAX_TICKS) {
> +               atomic_set(&core->poll_active, 0);
> +               schedule_work(&core->poll_work);
> +               return HRTIMER_NORESTART;
> +       }
> +
> +       hrtimer_forward_now(timer, ns_to_ktime(RK3576_POLL_INTERVAL_NS));
> +       return HRTIMER_RESTART;
> +}
> +
> +/* Start the job's next task, or retire it. Caller holds job_lock. */
> +static void rocket_job_next_locked(struct rocket_core *core)
> +{
> +       lockdep_assert_held(&core->job_lock);
> +
> +       if (!core->in_flight_job)
> +               return;
> +
> +       if (core->in_flight_job->next_task_idx < core->in_flight_job->tas=
k_count) {
> +               rocket_job_hw_submit(core, core->in_flight_job);
> +               return;
> +       }
> +
> +       iommu_detach_group(NULL, iommu_group_get(core->dev));
> +       dma_fence_signal(core->in_flight_job->done_fence);
> +       pm_runtime_put_autosuspend(core->dev);
> +       core->in_flight_job =3D NULL;
> +}
> +
> +static void rocket_poll_work_fn(struct work_struct *work)
> +{
> +       struct rocket_core *core =3D container_of(work, struct rocket_cor=
e, poll_work);
> +
> +       pm_runtime_mark_last_busy(core->dev);
> +
> +       scoped_guard(mutex, &core->job_lock) {
> +               /*
> +                * The interrupt can land while this work is queued, reti=
re the job
> +                * and start the next task. poll_seq only moves under job=
_lock, in
> +                * hw_submit, so comparing it here says whether that happ=
ened. Doing
> +                * it outside the lock would leave the window open rather=
 than close
> +                * it, and this work would then submit a task on top of a=
 live one.
> +                */
> +               if (READ_ONCE(core->poll_dying) || core->poll_work_seq !=
=3D core->poll_seq)
> +                       return;
> +
> +               rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
> +               rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
> +
> +               rocket_job_next_locked(core);
> +       }
> +}
> +
>  static void rocket_job_handle_irq(struct rocket_core *core)
>  {
> +       if (core->soc->poll_completion) {
> +               atomic_set(&core->poll_active, 0);
> +               hrtimer_cancel(&core->poll_timer);
> +       }
> +
>         pm_runtime_mark_last_busy(core->dev);
>
>         rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
>         rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
>
>         scoped_guard(mutex, &core->job_lock)
> -               if (core->in_flight_job) {
> -                       if (core->in_flight_job->next_task_idx < core->in=
_flight_job->task_count) {
> -                               rocket_job_hw_submit(core, core->in_fligh=
t_job);
> -                               return;
> -                       }
> -
> -                       iommu_detach_group(NULL, iommu_group_get(core->de=
v));
> -                       dma_fence_signal(core->in_flight_job->done_fence)=
;
> -                       pm_runtime_put_autosuspend(core->dev);
> -                       core->in_flight_job =3D NULL;
> -               }
> +               rocket_job_next_locked(core);
>  }
>
>  static void
> @@ -460,6 +540,10 @@ int rocket_job_init(struct rocket_core *core)
>         int ret;
>
>         INIT_WORK(&core->reset.work, rocket_reset_work);
> +       INIT_WORK(&core->poll_work, rocket_poll_work_fn);
> +       hrtimer_setup(&core->poll_timer, rocket_poll_timer_fn, CLOCK_MONO=
TONIC,
> +                     HRTIMER_MODE_REL);
> +       atomic_set(&core->poll_active, 0);
>         spin_lock_init(&core->fence_lock);
>         mutex_init(&core->job_lock);
>
> @@ -501,8 +585,23 @@ int rocket_job_init(struct rocket_core *core)
>
>  void rocket_job_fini(struct rocket_core *core)
>  {
> +       /*
> +        * Stop the poll from starting hardware work before tearing anyth=
ing
> +        * down: it submits the next task, and drm_sched_fini() does not =
wait
> +        * for work already queued. Cancel after the scheduler is gone, s=
o a
> +        * job running now cannot re-arm the timer behind the cancel.
> +        */
> +       if (core->soc->poll_completion)
> +               WRITE_ONCE(core->poll_dying, true);
> +
>         drm_sched_fini(&core->sched);
>
> +       if (core->soc->poll_completion) {
> +               atomic_set(&core->poll_active, 0);
> +               hrtimer_cancel(&core->poll_timer);
> +               cancel_work_sync(&core->poll_work);
> +       }
> +
>         cancel_work_sync(&core->reset.work);
>         destroy_workqueue(core->reset.wq);
>  }
> --
> 2.43.0
>

