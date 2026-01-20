Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFDDCA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 16:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YG9/2O7Q9BUZpJMGBd3L2go6Kf1zcvgZgaUCKJwR+8s=; b=okYsz3S3kphoh4zWAwmRxTFKme
	6nQJLwSutlfhu5sFM05jxH/qhCNjQqmuf3so3oUWpDz7LMS9aYinUmMSCRWA+CQX3D1+1BJrb8MTw
	RXXUQjUJd3pjPi4zxjL9DDOZsx6qQhiU3DPjKp9o/xL/lLY3okQyCiOpr6LBlU096R3t8oO20ubF/
	zMMq5KrpO2WG5UoFQpGpi/y9k92UWUPRinGpRlJ4/R625JPYNVLsl28cVorv8nAI5skIQA9EWAgdh
	DApxHtRAD69AC+hzQIY+N0ioRq8FXnQR+RZJrCBuCcW2dUIBC8E+mrkKCguUv0lyeSC2mVKXb9ust
	RVENpBdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEoZ-00000004C35-0iyT;
	Tue, 20 Jan 2026 16:42:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEoX-00000004C2w-31U6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 16:42:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E924D60008;
	Tue, 20 Jan 2026 16:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F9BC16AAE;
	Tue, 20 Jan 2026 16:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768927364;
	bh=XfTOr/b3kCkXkd8pSzNTRxg+QJfJoP47QMmKJ8TgXxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dVDcuf1dF4rWdHOnptrAjcgUDeFiKxzcItVFr6UyfS1D7WqxzZrQYMl5xVRiTLMl6
	 8kzRXp+NfNPE5pBW5Hge4fnA1fXMODw0uwwE/4/RBs8Oea1ZSyMVMx5Vt6GUextX6U
	 7857eSOwuhfH6RiyLVJCtOc/lA9ETQ7Si6nrYmUtRGT916SXzZvTkR09uoX3UO38NS
	 81N69DKfAoljrwICBHQj2wVvEYcoTgeC3gUEl0EbvCqQOhfzOrRStlqCZqXW7Bai56
	 7VrMWEHrAJfGnVG5vMccPve3GnfnJhNbC5NXHEgUuadv95epuNmvd6/MJ5PzJkEF91
	 ANYZ2mxWA9X2w==
Date: Tue, 20 Jan 2026 16:42:39 +0000
From: Will Deacon <will@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] perf: arm_spe: Correct setting the
 PERF_HES_STOPPED flag
Message-ID: <aW-wfy3u5OD3BQAQ@willie-the-truck>
References: <20251110-arm_spe_fix_truncated_flag-v2-0-a629740985cc@arm.com>
 <20251110-arm_spe_fix_truncated_flag-v2-1-a629740985cc@arm.com>
 <aSSEXzMr1drvL2zz@willie-the-truck>
 <20251124184815.GC724103@e132581.arm.com>
 <aSSrrmX_nAl82GKE@willie-the-truck>
 <20251125142036.GE724103@e132581.arm.com>
 <aV_aHi9BLFzjnmx7@willie-the-truck>
 <20260114175240.GA1286628@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114175240.GA1286628@e132581.arm.com>
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

On Wed, Jan 14, 2026 at 05:52:40PM +0000, Leo Yan wrote:
> > > The issue is a mismatch between the state machine and the hardware
> > > state.  When arm_spe_perf_aux_output_begin() detects an error and does
> > > not set PMBLIMITR_EL1_E, the trace unit is effectively stopped, but
> > > the state machine is not updated to PERF_HES_STOPPED. This causes
> > > callers to handle errors incorrectly [1][2].
> > > 
> > > It is arguable that the disable IRQ work will eventually disable the
> > > trace unit and update hw.state, but the state should be updated in the
> > > first place by the PMU driver to notify even core layer.
> > 
> > From what I can tell, perf_aux_output_end() will call
> > perf_event_disable_inatomic() which should end up invoking
> > perf_pending_disable() via an IPI-to-self to disable the event and put
> > it in the PERF_HES_STOPPED state before we return to userspace.
> > 
> > So I still struggle to see the problem here.
> 
> The issue is that the SPE driver does not properly propagate errors when
> arm_spe_pmu_next_off() fails.  Instead, it behaves as if tracing was
> enabled successfully, which leads to redundant operations and an
> inconsistent state in the perf core.
> 
> Let us dig a bit.
> 
>   arm_spe_pmu_start()
>   {
>       hwc->state = 0;
> 
>       /* Fails inside arm_spe_pmu_next_off() */
>       arm_spe_perf_aux_output_begin(handle, event);
> 
>       /* hwc->state remains 0, so execution continues */
>       if (hwc->state)
>           return;
> 
>       reg = arm_spe_event_to_pmsfcr(event);
>       write_sysreg_s(reg, SYS_PMSFCR_EL1);
>       ...
>   }
> 
> In arm_spe_pmu_start(), a failure in arm_spe_perf_aux_output_begin()
> does not set PERF_HES_STOPPED, so hwc->state remains zero and the
> function continues to program filters even though has failed.
> 
> Moveover, the driver still returns success to the perf core.  As a
> result, event_sched_in() assumes the event was started correctly and
> proceeds to enable other events.
> 
>   event_sched_in()
>   {
>       ...
> 
>       if (event->pmu->add(event, PERF_EF_START)) {
>         perf_event_set_state(event, PERF_EVENT_STATE_INACTIVE);
>         event->oncpu = -1;
>         ret = -EAGAIN;
>         goto out;
>       }
> 
>       ...
>   }
> 
> This breaks event group case, for example:
> 
>   perf record -e '{cs_etm//,cycles}' -- test
> 
> The perf core expects all events in a group to start and stop together,
> but the SPE driver's incorrect reporting causes misalignment.

Ok, so looking at this and the next patch I wonder if we could simplify
things a little by having arm_spe_perf_aux_output_begin() return an 'int'
to indicate success/failure instead of touching 'hwc->state'.

Then arm_spe_pmu_start() and the interrupt handler could call into
arm_spe_pmu_stop() if they get an error code back. Would that work?

Will

