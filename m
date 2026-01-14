Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA737D39000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4k4aqUw2MotytLPeK6zIBy9eGXVoe07FjXr6+Mdyrjc=; b=uxuPWcA/hbxC47RRj3+22wcqjH
	W/x2/WWEi5GDXJr1tEH3Bw7ofCtCurv8fWmo61CreaDWp9ylxcqNGtugnmvyVboetJqRC6ypEGyHy
	8YdUDSWb8zNFtaCLDCbpSoSbB1E75l6DESrstPs63YZkF6ZZcP3gwDflLMn+Lrb5DuTydDZTPz3Ms
	OfXEpJbP0zrIRQkBxcYwxm2hGyzavoRzkwOXC0Qyx0IN9uX9DCNpEIGSwRWsdJZ5NWLvg2oqZj01A
	MlfGXeo+YeLKIn7bCBStJ+l3oNiybq0XjNaCkUo3DI9qtyZZAv9RiVHyyrFS5gfUQUlgJIunFd/PR
	bcHYQVag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg532-0000000ADre-12Kf;
	Wed, 14 Jan 2026 17:52:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg52z-0000000ADpB-2IaR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:52:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 256A31515;
	Wed, 14 Jan 2026 09:52:36 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62CD23F632;
	Wed, 14 Jan 2026 09:52:42 -0800 (PST)
Date: Wed, 14 Jan 2026 17:52:40 +0000
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] perf: arm_spe: Correct setting the
 PERF_HES_STOPPED flag
Message-ID: <20260114175240.GA1286628@e132581.arm.com>
References: <20251110-arm_spe_fix_truncated_flag-v2-0-a629740985cc@arm.com>
 <20251110-arm_spe_fix_truncated_flag-v2-1-a629740985cc@arm.com>
 <aSSEXzMr1drvL2zz@willie-the-truck>
 <20251124184815.GC724103@e132581.arm.com>
 <aSSrrmX_nAl82GKE@willie-the-truck>
 <20251125142036.GE724103@e132581.arm.com>
 <aV_aHi9BLFzjnmx7@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV_aHi9BLFzjnmx7@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_095245_746786_A98ECE57 
X-CRM114-Status: GOOD (  24.53  )
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

On Thu, Jan 08, 2026 at 04:23:58PM +0000, Will Deacon wrote:

[...]

> > > How is it not for this flow? You're talking about:
> > > 
> > > arm_spe_pmu_start
> > > 	=> arm_spe_perf_aux_output_begin
> > > 		=> arm_spe_pmu_next_off // Returns error
> > > 
> > > The only way arm_spe_pmu_next_off() returns an error is if
> > > __arm_spe_pmu_next_off() fails, and that's the flow I'm talking about.

[...]

> > The issue is a mismatch between the state machine and the hardware
> > state.  When arm_spe_perf_aux_output_begin() detects an error and does
> > not set PMBLIMITR_EL1_E, the trace unit is effectively stopped, but
> > the state machine is not updated to PERF_HES_STOPPED. This causes
> > callers to handle errors incorrectly [1][2].
> > 
> > It is arguable that the disable IRQ work will eventually disable the
> > trace unit and update hw.state, but the state should be updated in the
> > first place by the PMU driver to notify even core layer.
> 
> From what I can tell, perf_aux_output_end() will call
> perf_event_disable_inatomic() which should end up invoking
> perf_pending_disable() via an IPI-to-self to disable the event and put
> it in the PERF_HES_STOPPED state before we return to userspace.
> 
> So I still struggle to see the problem here.

The issue is that the SPE driver does not properly propagate errors when
arm_spe_pmu_next_off() fails.  Instead, it behaves as if tracing was
enabled successfully, which leads to redundant operations and an
inconsistent state in the perf core.

Let us dig a bit.

  arm_spe_pmu_start()
  {
      hwc->state = 0;

      /* Fails inside arm_spe_pmu_next_off() */
      arm_spe_perf_aux_output_begin(handle, event);

      /* hwc->state remains 0, so execution continues */
      if (hwc->state)
          return;

      reg = arm_spe_event_to_pmsfcr(event);
      write_sysreg_s(reg, SYS_PMSFCR_EL1);
      ...
  }

In arm_spe_pmu_start(), a failure in arm_spe_perf_aux_output_begin()
does not set PERF_HES_STOPPED, so hwc->state remains zero and the
function continues to program filters even though has failed.

Moveover, the driver still returns success to the perf core.  As a
result, event_sched_in() assumes the event was started correctly and
proceeds to enable other events.

  event_sched_in()
  {
      ...

      if (event->pmu->add(event, PERF_EF_START)) {
        perf_event_set_state(event, PERF_EVENT_STATE_INACTIVE);
        event->oncpu = -1;
        ret = -EAGAIN;
        goto out;
      }

      ...
  }

This breaks event group case, for example:

  perf record -e '{cs_etm//,cycles}' -- test

The perf core expects all events in a group to start and stop together,
but the SPE driver's incorrect reporting causes misalignment.

Sorry for late reply.

Thanks,
Leo

