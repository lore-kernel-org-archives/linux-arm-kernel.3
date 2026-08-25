Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391C9C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 12:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0gYjv1ucDokxKoaaL4BAfVfT4VkNcel3INzlS65MsI=; b=sezxoyzAz+5ZA9Nm0ZYTCyEuc+
	6n9IpYKBZYb79xvE+5eJlJ9yn9niu6tP4oVa33K/BhKT5Z8Knj/NPQ5gshxyaJoj+0yRaAqJ4U/Cv
	UBW9FX0ox1srzFFfqBuSMk9Yo56cblzv4YdxHlwu3cz0LQZfXJimyCRufDmhoiAmoGh0XOsRglHK0
	uYmp32V7KIaASZITbu+gkHAoUfuaZkCX9RdG9gb4zRje5eiJF+47lR6a0NlhVEGJkgpISdJJn2Pvs
	Bs7DG8ZT+EiumenB2OyPCbgvX86ssVDolvntUC/c8PXGZtTP78QNjDLF5FjZVfQbBCR+z3EIxOluK
	px4J1BMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqJX-00000000mCC-3cIF;
	Tue, 25 Aug 2026 12:31:40 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqJU-00000000mA8-31l8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 12:31:38 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-836c4d3fa28so2594527b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 05:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787661091; cv=none;
        d=google.com; s=arc-20260327;
        b=XqH5hf72w7uWLGDDkq2H2B5IzshmtrirBfWH9B/r/AFwamH8/34kzkU1HehiSS9h/0
         lLPJpQCiSqv9n1nfkT1rp4pjdPQQb6aavNeAWR9eGLTsDT8dfXhfqVUtY61SYtwN7/4V
         lbknV83Bdh7C6XTDLzPhNxiIGXxrsNpTlySrKUjumcMhLpJFGdFVOsaON/zUK4IcGk+d
         GxoFp00rWB3Nmuo3q/i745JtynrfuzYSfr7eG82cfqQ1AITyNlfO9ZvHme16oP1mMEhB
         xzgs2H6QYW+Ul9dhe0z154U/0KT2DIzdBu05imEXjmJR2Zi5TRR+Nw+4Or/tO4v78LoD
         5nfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q0gYjv1ucDokxKoaaL4BAfVfT4VkNcel3INzlS65MsI=;
        fh=2uIaM4Wa4mxuG5Ytt5wdvaErsgXoxlX7oagEAF+Az38=;
        b=ZpdGQrCQKu0+BcAlrfn0WxffJXmG12Mag1StH17ifkClmose0GG6tIfrkGle4p3mRk
         X1Cj66e7c/ZsQOZKvSLKU9UaGcHTEJRpiOEUmbhcix1xXy/MhxryGu1+EjH/XvrimUna
         WHerN7JNKGYV/7t2D2NmZUl75ARjoZHuSvRqOKqmZx2CBGNn9zPpyM5ZYvD/wScHoj2M
         osWOIWn82XdJvDv0We9foVz1tLZG9RxZoUaF+zKBfPW7Iv2/Xvh9gYJvS1mdm2NtezVa
         Jqjo0Tgv81908dEHCEztY8A+q7feQ2e/CBILk5JMvxLo3h05/2UshwoLMjv57Cta2Dw+
         VTFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787661091; x=1788265891; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q0gYjv1ucDokxKoaaL4BAfVfT4VkNcel3INzlS65MsI=;
        b=Rk0ueDL1Lk2ekHvW1M6IOT+EFD/LAtbAl81JpEapil7FmgE06rBorJt8sxXkJeV6Eh
         Ques1CucX2xiH5YeozPhrEtGLlhUcVCsGoXOENpMXO4J7+CH7scxk2XRhOBbQJs53iX/
         2dRuNBa/WumWcoXVRjOnwbQ0x1BE00MIc+TXpPzMVc8QhVAQnVqxhIf3kffRkedOIYiI
         DeivV2an8gorp5XJc1b139wtUtdyOJGc3kCjQYfuzU0t5iiqMECEGQ1zK5hS6GNJ7kba
         VhFuzohJjtzT3B29aJK/dSuRkseH2ewDtGqL9FpOieXlhgQRDGVASQVjcOpPJoetot/t
         Ugig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661091; x=1788265891;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0gYjv1ucDokxKoaaL4BAfVfT4VkNcel3INzlS65MsI=;
        b=ASXRl7hd8DbCN8AfcHFyB23b/816vfUif53OevW7Lb8N0yRM7gZGrFG36Lz/CQmeo4
         jHuBCHwtu03NsOaL19ERAziYMO5vtgaCwhZDhsijUWWbYrvC5ZaAUZOZ1DWlB+SSHZz+
         bd2ncPERHL4YzYmyoTjxgoMQg4sUIoSsXsdJWT7PObhxSo17IChhWr/K/+BO61kr6VGw
         5fQDnjPQat+3qdzuQjU4q38xAMjzzXscs7GSfC4T46iLq6FmGsyiLoUvVn+GVxrMLsoe
         7omrV5qObFbF7DVp+G8mgLkfEMH1M61MwgEoZ+rpcSdQU1liAe111MEblbzvNEfpxWca
         8alA==
X-Forwarded-Encrypted: i=1; AHgh+RomfXdBIMYdKJ2BZnebscURkFhtByjGRWGNcefdb1uO0fvfprfutG8S63utvIzz54QPOkdp6d1dmNfK6893Qitu@lists.infradead.org
X-Gm-Message-State: AFuF++mIHd4bL+L79bmpkpYoL4afxDkcsyD8xDWxuvYev03Fl5D6Ztld
	T5nDnOvjIqR0rQii0xPf15c7LQsDqeQoYT2ptiUsqQTqtP5Fnbf+Y5wh+iUAHzwBLTEIp4gAac/
	lriJINgy+rg3CCVzNc6RTyvb8zxeylFA=
X-Gm-Gg: AR+sD13m4dR5M/HMKmmEpkBPLPmCmAdLdv11comW9TvhxS/YmOdjQfdDf3b1KMgmo2x
	wOJ+Z7XvxQAcpN0YvW1ePbmI1SB2+/eiTF0DBg7yE4slHLWKSbiGdlS4OJLzM1fvqdofObx1dwA
	KFL1ikKleYDzsjJ797aZ/tfDBTO/CM3rCSXVq9E/DnL48s6fjXA20efvqBjHDnnmgNbAsp2tReo
	jkCrSB5c+ApJ8SrPwZXdrgT2TjpcuU+JiwZ06J6WT5ZSf13FY+YN9osIctUOTI+tQl++UAB3v3G
	onS8cmAHSokb2+zXwqE8B5IEM6luSYZFjPjyFsWKDCA+WA==
X-Received: by 2002:a05:690c:610d:b0:81f:45f0:21b7 with SMTP id
 00721157ae682-854bd19ce2bmr22184007b3.0.1787661091147; Tue, 25 Aug 2026
 05:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <f1805c2bce56c89d8ace35f67c665b24bab90965.1787568944.git.gahing@gahingwoo.com>
 <7d47bbef8b629eb287fdfa3e8d6c62b95de6b61d.1787568944.git.gahing@gahingwoo.com>
In-Reply-To: <7d47bbef8b629eb287fdfa3e8d6c62b95de6b61d.1787568944.git.gahing@gahingwoo.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Tue, 25 Aug 2026 14:31:19 +0200
X-Gm-Features: AcwNN1UBjSiDmBbvi-rdrGxY2QMseNtuQmYMP06jtM-iH2d8s_qF62MX0JMUhl8
Message-ID: <CAEWPSH5mxTbUkNouxm6yecMZYvDowquhvYvhaXQ8HoMtHD5U1g@mail.gmail.com>
Subject: Re: [PATCH v9 02/13] accel/rocket: wait for a running IRQ handler
 before resetting a core
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de, 
	ogabbay@kernel.org, zhangqing@rock-chips.com, u.kleine-koenig@baylibre.com, 
	chaoyi.chen@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_053136_784073_4BB3612C 
X-CRM114-Status: GOOD (  49.66  )
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

As promised, the 19 August protocol re-run on v9, as-is.

Setup, identical to the run reported against v8 1-2/12: same
board (RK3588, Orange Pi 5 Plus), same personal 7.2-rc6 tree,
same config (PROVE_LOCKING=3Dy, DEBUG_ATOMIC_SLEEP=3Dy), all three
cores bound with scheduler-driven placement, and the same local
test-only patch lowering JOB_TIMEOUT_MS to 2 ms. The serial
console was captured on a second machine for the whole session.
Two passes per kernel, at console_loglevel 8 and 4. The only
difference from 19 August: the two rocket changes on top of the
base are now v9 1/13 and 2/13 instead of the v8 pair. Both
applied cleanly.

v9 arm: two passes, 12 and 11 induced "NPU job timed out"
resets. Every reset recovered, every inference matched the CPU
oracle within 1 (48/48), including the one issued after a
forced autosuspend and resume. No MMU faults, no raw reset
messages, no lockdep hits, nothing on the serial console.

Differential arm, fresh in the same session (same base with the
two patches removed, same config, same timeout): five runs -
the protocol pair at loglevel 8 and 4, plus three extra runs at
loglevel 8 to gauge repeatability. Reset counts 8/10/12/8/15,
all recovered. Four runs clean. One of the extra runs came back
with something I had not seen before: the inference after the
forced autosuspend "succeeded" but returned a constant buffer -
all 48 output channels uniformly 128 (0x80), which is not the
output zero point of this model, while the CPU reference varies
normally. Zero kernel messages, zero lockdep hits, nothing on
the serial console. A job that signals completion while its
output buffer is never written is exactly the silent flavour of
the race these two patches close, and in 102 induced resets
across nine runs today it appeared only on the arm that does
not carry them. Full artifacts are preserved (scorer output,
runtime and genpd state, journal, serial log) if anyone wants
them.

Before testing I also compared the tagged patches against their
v8 counterparts: 1/13 is byte-identical to v8 1/12 up to the
base-commit trailer, and 4/13 is identical to v8 3/12, so the
tags they carry describe exactly what was tested here.

For this patch:

Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588, three
cores, induced reset, differential base, JOB_TIMEOUT_MS=3D2

Regards,
Igor

On Mon, Aug 24, 2026 at 1:09=E2=80=AFPM Jiaxing Hu <gahing@gahingwoo.com> w=
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
> Mask the block before the sync as well. INTERRUPT_MASK is armed by
> hw_submit() on every submit and cleared only by the hardirq, so on an
> ordinary timeout it is still live and a completion can arrive after
> synchronize_irq() returns. Nothing is lost by clearing it, since the next
> submit arms it again.
>
> That write is the first register access this function has ever made, and
> it is guarded, because the function holds no runtime PM reference of its
> own. The only reference in the window belongs to in_flight_job, and the
> completion path can have put it and cleared the pointer before the
> timeout worker arrives: drm_sched_stop() sits in between and can block on
> cancel_work_sync() and on a dma_fence_wait(), and it subtracts every
> pending job's credits, so rocket_job_is_idle() is true and
> rocket_device_runtime_suspend() will not refuse. With the autosuspend
> delay elapsed the clocks are off and both NPU domains are down. A
> register access in that state takes an async SError on this hardware,
> which is the failure two later patches in this series describe from the
> power-on side.
>
> pm_runtime_get_if_active() resumes nothing and allocates nothing; if the
> core is already down there is no live interrupt to mask and the following
> synchronize_irq() is all that is needed. Igor Paunovic asked the general
> form of this on v8 -- whether rocket_reset() should hold a reference --
> and it was deferred then because nothing in the path touched a register.
> This patch is what makes it matter.
>
> The deadlock this placement avoids would not have been reported. The wait
> is on desc->wait_for_threads rather than on a lock, so lockdep does not
> model it and it would have hung silently.
>
> Suggested-by: Igor Paunovic <royalnet026@gmail.com>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>  drivers/accel/rocket/rocket_job.c | 34 ++++++++++++++++++++++++++++---
>  1 file changed, 31 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index 5f0f9682e..3c0ed4605 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -377,9 +377,37 @@ rocket_reset(struct rocket_core *core, struct drm_sc=
hed_job *bad)
>         drm_sched_stop(&core->sched, bad);
>
>         /*
> -        * Remaining interrupts have been handled, but we might still hav=
e
> -        * stuck jobs. Let's make sure the PM counters stay balanced by
> -        * manually calling pm_runtime_put_noidle().
> +        * Mask the block before waiting. hw_submit() arms INTERRUPT_MASK=
 on
> +        * every submit and only the hardirq clears it, so on an ordinary
> +        * timeout it is still live and a completion can arrive after the=
 sync
> +        * returns. The next submit re-arms it, so nothing is lost here.
> +        *
> +        * Only when the device is already awake, though. This function h=
olds no
> +        * runtime PM reference of its own: the only one in the window be=
longs to
> +        * in_flight_job, and the completion path may have put it and cle=
ared the
> +        * pointer before the timeout worker got here. drm_sched_stop() a=
bove can
> +        * block for a long time, and it drops every pending job's credit=
s, so
> +        * rocket_job_is_idle() is true and nothing keeps the core resume=
d. On
> +        * this hardware a register access with the domain down takes an =
async
> +        * SError, so a reset must not be the thing that causes one.
> +        */
> +       if (pm_runtime_get_if_active(core->dev) > 0) {
> +               rocket_pc_writel(core, INTERRUPT_MASK, 0x0);
> +               pm_runtime_put_autosuspend(core->dev);
> +       }
> +
> +       /*
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

