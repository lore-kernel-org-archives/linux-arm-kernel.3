Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A361CC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 15:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEXxfEgtN/xrLfgCd/dARCZmm2kj2U1GUX6ueKkdWis=; b=MZPvDIeYSx+Rujx5Zq518ukxNI
	uvf3EaDpOu0GpXCLrkC+clWCpSUhfdcV5uj1KU75CbEe/KD2lITCc7LOy4BH/KXXlCdwQhkHcYB68
	TKNqJ5U2GDCpCTgtewpDQBN2xIerqimBcnFrQ/abJJbmc7U02a3w71mOWef4s2alHFAwQeHbavQip
	fM5E6qh0mt33wicl6EJhxfON5TFcrn3+MSyT414l5clwmf+1YYx6LLQOvFLjx8MfdFd0t0XTKHjEv
	h33jVn5FUIkaBFTolQ+CHbXexPbcVceOmsxFBnQLgQM60mPOOxU3xcUt65KFvso3SXqyKWdFqcx7c
	c1/LLNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0zV-00000001Iwe-0Uvf;
	Sun, 26 Jul 2026 15:42:13 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0zS-00000001IvK-275m
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 15:42:12 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-69ea0595598so1977083a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 08:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785080528; cv=none;
        d=google.com; s=arc-20260327;
        b=IseK9aktkJ69DgnLrGY8uuaOKtpQMJEbGAc3zaR3/3iKTFNiSKDeoBWyI/8iPL2ohB
         75iyoiZdIkGHiM7Kuu3oS43TYDXBy5jRBM18pqVhZc7njUEs2NmQk2y5NKZ9ZIU0Ojqv
         JiohTHa+4eMzMKOD2eBiDr/vRzmNCp46Z1c1xuwvBiHuMijrpGHh+0VjrpBcaTiU8Ksr
         cVpjNc0MjAmW8d6m6jT9OlQWDBtqKUe38t+YKj8ONP8q0pSGJQP7u1y3h/kknXg9+K3j
         +QMWWWk88Lq35k2pIQcsedOoShCzKu5PgofxUFndsqWFYQDcOUWft5lQdUh8XF4DakY7
         +Sdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WEXxfEgtN/xrLfgCd/dARCZmm2kj2U1GUX6ueKkdWis=;
        fh=zw+/YOvExLiVWiPkNF5iTFJ3buKC96DU43PGFFZD14E=;
        b=EpmbA45ss7NUba1+Islx+XsBcmg500d01/SPVAgBOD0lTwudCjOuadyO2LeGdMLjaK
         cRzjwd31yGNZtzEVq9nEdJo0GANP6m9365SVFjyEG2lVL7X/c+n9jrjxWtZHHgVrmAd9
         11t6rtBB6FXpVR3hs9cCs9mLsLyNeoK34mPHRCXlvJOz00D+IksLms+ulgPqzEG3F5Lf
         Y6/FU+i5GjFsMKPkvMLKjO/IHlHZwx5b9KUrgfTv66cZuzWREpJVVy8E0ZL+OBLjrB+5
         ts/w50DYHVixDYeSRk4miu44XfxoAfBJQXW8ejYHdjb2OwIAm27tPPt80cC8ltXl8pAP
         3uxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785080528; x=1785685328; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WEXxfEgtN/xrLfgCd/dARCZmm2kj2U1GUX6ueKkdWis=;
        b=cnvNmec/4uXl7F6J68US0KAFKC/kZ8wlIEMrkQADO8FjYTY7x9DfXCboIsLiZekXBV
         SizgAY4QRomtvY8n0tLpVUVBqOhUm6yJVr61cU8OUEObHqWEDX/O4ThMfI91+bUtiJ9m
         cQ1oPlOy/49fcH8h/SFn9fVh9Aas+NNdHdkyXFANNWlQRS4Vpf6jC2KO1NU5GImbGAiw
         Y95hWb8tyuscd1pd7eciov0haRMH8WAExJyV88IlhltLy2ISJskzj/V0FsennvXqubma
         XJf26iBOWOmh2bzv16ef6TANmeJjtxM8Os4YHEYW4jfwJ/+uOuiLxnMtKJD74YpyLXuy
         N0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785080528; x=1785685328;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WEXxfEgtN/xrLfgCd/dARCZmm2kj2U1GUX6ueKkdWis=;
        b=D7ImCn5NDHtrbYPuJYDJVi3GWFf5ujUK0sWew648Tn/pwX5vt2DAkYIhu/MYMzcMqd
         +E1ljd3Iph7md1Kgqn1RK7LFXAMtHDGVbc6M13fhKq78Cw2UJoKiw6aPQ00ZDMEtX2Qh
         xpk/EmN4rn3QTMSKCj3w36kX00T9Gut4ZqEVV6U5z1l3ewH9TjG1fgjP6gMwm9Wl/tlF
         sWa21jPFnnEP5AQ54cTkPjkUHbsPLY2MNawUfbPxhLjN86sY/C0vBluYwT/3+d0Smukv
         L2ZqrEu4KLTCeHIgWmlgzimGwMLaozKfSjAfpivoCCJQlIUBbdwXwQJGvIm3KlqVEIAS
         73YA==
X-Forwarded-Encrypted: i=1; AHgh+RrDG0ZX/HkRD7dBWJQhlTRZprlcyg12BxWdmTUPXLFpW0ZXnrsCShc1MpWD2HOkPd8CxGWvesMHW+3Ukq67VNS3@lists.infradead.org
X-Gm-Message-State: AOJu0YxXoohv150oALEERN0xFY6cMrxC/jF0jtlwiEJ3h+T2DvFpaqGS
	lWSyUXnFj2vRQyvVxHu42QRBOb5S/MGeXlyfFsO/gARPwvf0oWQMEv/UenpyiKvBs2Y19VlbCPI
	rckBg3UEqSoypWeGew6DhJ2kquldgQ2Xau3TRBQ+xTA==
X-Gm-Gg: AR+sD10a43F9vD4tHhSG+rU7tJEn0DKu8G8IJqOjG1sN0FeM/B/0UGuZZ7ravQNSbB4
	5OvbXX6Yv6xQ8FP02cWS9llLVHNyN6Oi487gTzSE6pNLTHzAShvIF76EtZ/jXhNhqBKwM+ypoID
	jW8q3imAa+fpjwGchwsPorCd/fxRsEF/jL8ZtcWZw9nlSLyvPatk3SI1HjuTxXsN7aaGESg5Uc/
	j3B2B4n24Sv0aeKg2J/MWF6vygrIZHNdKZCQ/Y942DDLm5+F4+VK+GxHf1EAEA=
X-Received: by 2002:a05:6402:518e:b0:69e:98bc:b74 with SMTP id
 4fb4d7f45d1cf-69fc1178531mr2081934a12.35.1785080527429; Sun, 26 Jul 2026
 08:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
 <20260605-exynos-pmu-cpuhp-idle-fixes-v1-1-0cd05c81a82d@linaro.org>
 <CADrjBPoDC68jyEY2HZtoh1SLfVwFPpzKea7T6QLyfY99MsNVcQ@mail.gmail.com> <DJZGVB7DOX4L.318L4AZWEFQBE@linaro.org>
In-Reply-To: <DJZGVB7DOX4L.318L4AZWEFQBE@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 26 Jul 2026 16:41:50 +0100
X-Gm-Features: AUfX_mzMjkQcMBVfevDXjcIpqzBWckoO6ast3bT9N3LNyKp-DvhMeUqpSXU7zEA
Message-ID: <CADrjBPqq7mfvyfoKeJmjt4-mxwy7emsG_X3a9ABD+92_kp9HLw@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc: samsung: exynos-pmu: use target cpu ID in
 hotplug callbacks
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_084210_615254_DE773847 
X-CRM114-Status: GOOD (  54.11  )
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

Hi Alexey,

Thanks for your analysis on this issue.

On Wed, 15 Jul 2026 at 22:35, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> On Wed Jun 10, 2026 at 10:55 AM BST, Peter Griffin wrote:
> > Hi Alexey,
> >
> > Thanks for your patch.
> >
> > On Fri, 5 Jun 2026 at 21:19, Alexey Klimov <alexey.klimov@linaro.org> wrote:
> >>
> >> The CPU hotplug state callbacks __gs101_cpu_pmu_online() and
> >> __gs101_cpu_pmu_offline() currently partially use smp_processor_id() to
> >> determine the target register offset for the CPU inform hints. This may
> >> be fine for cpuidle flow but broken for cpu hotplug where the target
> >> cpu is passed as an argument and could be different from cpu where
> >> that is executing (e.g. CPU 0 offlining CPU 1), meaning that
> >> smp_processor_id() returns the id of local CPU but hotplug flow
> >> deals with another CPU core undergoing the transition.
> >
> > This was intentional. The powermode hint is always programmed based on
> > the currently executing CPU core in the gs101 downstream code (for
> > both CPU Idle and CPU hotplug paths). See
> > https://android.googlesource.com/kernel/google-modules/raviole-device/+/refs/heads/android-gs-raviole-mainline/drivers/soc/google/cal-if/pmucal_powermode.c#15
> > and the pmu_intr_gen is done based on the actual CPU being
> > enabled/disabled.
>
> Beware of the Downstream bearing gifts.
> Dowstream may or may not contain mistakes or maybe they have something
> that workarounds potential problems. I agree that it is a good source
> of reference but I doubt that we must use it as an ultimate GOAT reference
> source.
>
> Even Qualcomm downstream things have mistakes sometimes.
>
> > It's possible Exynos850 requires something different. I suggest
> > checking the equivalent function in the e850 downstream kernel.
> >
> >>
> >> This causes the pmu driver to write power down and power on configuration
> >> hints to the wrong hardware registers, messing up the power state of active
> >> cores and failing to configure the target core. Fix this by removing the
> >> cpuhint variable entirely and utilizing the target 'cpu' argument passed
> >> to the callbacks by the hotplug core infrastructure.
> >
> > Unfortunately I think you're introducing the bug you describe with this patch.
>
> I wouldn't be so quick judging this like this. I think this patch actually
> does fixes a problem. IIRC I also tested this and there were no issues.
>
> Considering that neither your team nor me have access to the implementation
> details it would be easier to just drop it instead of endlessly debating
> over this if there is no interest narrowing it down.
> FWIW this was reported by Sashiko in the first place so I couldn't say what
> justification can be provided.
> https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
>
> Let's go over details. Idle callbacks are executed on target CPUs so
> target CPU is the same as local CPU.
> The hotplug callbacks are slightly different. Offline CPU callback executes
> on target CPU so again the local CPU is equal to target CPU (CPU offlines
> itself). The online hotplug callback stands out. It is executed on
> some CPU and deal with target CPU, that some CPU is not the same as target CPU
> as system assumes that CPU undergoing online transition is not ready yet.
>
> All these callbacks write to CPUx_INFORM register (where x -- is CPU id).
> The number of these regs are equal to the number of CPUs. I think these
> are per-CPU registers.
>
> Idle callbacks and hotplug offline callback write cpu power state hint
> to the local CPU's cpu_inform register. On online callback, the random
> CPUx_INFORM register is chosen and its state is cleared (because online
> callback can be executed on random available CPU). Does it make any sense
> to you? Why among 4 callbacks one of them updates random CPUx_INFORM
> register?

I agree it seems inconsistent. Since hints are always programmed when
entering a power state, clearing the hint is probably not really
required.

>
> I think these callbacks should deal with target CPU undergoing transition
> and not with random CPU id.
>
> If I consumed enough coffee and can still trust my eyes, I tested two
> configurations:
> -- this commit (and similar change for e850);
> -- change where CPU_INFORM_CLEAR write is removed from online callback.
>
> On e850 (with consecutive series) and gs101. All were fine.
>
> My understanding from experiments is that:
> -- clears of CPUx_INFORM are less important and maybe not needed at all;
> -- important thing is the value in correct CPUx_INFORM when CPU goes
> into a power state, upon executing psci call.
>
> The potential race doesn't reproduce presumably because hotplug ops
> are fully serialized.
>
> The downstream probably uses smp_processor_id() for cluster power
> down and up states. Perhaps, cluster offline callbacks don't have CPU id
> for transition into CPD state and they are executed on the last CPU from
> cluster undergoing power state transition.
>
> Anyhow, I think it will less compilcated to remove this change rather
> than speculate without a way to confirm the behaviour.

I agree, let's drop this patch temporarily and continue to follow up
with Samsung folks. Hopefully we can get clarification or confirmation
from someone who has access to the firmware code. If/when revisiting,
I think some of the analysis from this email could probably be added
to create a more verbose commit message or possibly a comment to
clearly explain why upstream deviates from the downstream
implementation. Of course, the best solution would be a fully
compliant PSCI firmware, which doesn't require any hints.

Thanks,

Peter.

>
> BR,
> Alexey.
>
> >> Reported-by: Sashiko <sashiko-bot@kernel.org>
> >> Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
> >> Fixes: 598995027b91 ("soc: samsung: exynos-pmu: enable CPU hotplug support for gs101")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >> ---
> >>  drivers/soc/samsung/exynos-pmu.c | 7 ++-----
> >>  1 file changed, 2 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> >> index d58376c38179..6e635872247a 100644
> >> --- a/drivers/soc/samsung/exynos-pmu.c
> >> +++ b/drivers/soc/samsung/exynos-pmu.c
> >> @@ -235,11 +235,10 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
> >>  static int __gs101_cpu_pmu_online(unsigned int cpu)
> >>         __must_hold(&pmu_context->cpupm_lock)
> >>  {
> >> -       unsigned int cpuhint = smp_processor_id();
> >>         u32 reg, mask;
> >>
> >>         /* clear cpu inform hint */
> >> -       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
> >> +       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu),
> >>                      CPU_INFORM_CLEAR);
> >>
> >>         mask = BIT(cpu);
> >> @@ -296,12 +295,10 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
> >>  static int __gs101_cpu_pmu_offline(unsigned int cpu)
> >>         __must_hold(&pmu_context->cpupm_lock)
> >>  {
> >> -       unsigned int cpuhint = smp_processor_id();
> >>         u32 reg, mask;
> >>
> >>         /* set cpu inform hint */
> >> -       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
> >> -                    CPU_INFORM_C2);
> >> +       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu), CPU_INFORM_C2);
> >>
> >>         mask = BIT(cpu);
> >>         regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
> >>
> >> --
> >> 2.51.0
> >>
>

