Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A112CFD345
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 18:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNVrYCsyAm8UHi1MQl7sBfSQXgOpBYYtQN3G2pleKGk=; b=IeNcUQrnxTBagKAXjT2IOnOUct
	/nWGE9w+rDzHvCKNGysb07NpaL8JBIjBo0pHolUNdD2yTo1hMxKpGozPl4DPMnvjywjpFqgCBbndF
	CzDERiOPssCAEBHkD4/DBj8JIA4r66dOjudZokksKMF+VWJdlXLPCRtqS1HDhXPz4NP5kwSPckwL6
	NPDZWW0ernbZgAejEsWSTN8wwEkOPT9bJXri7W8a0UHVrtK79TtrCGB8NriyZqbEty2sy4H1Kl1xm
	uK/Vfgb/1gNW9+D8Zrp8l7DtNTBt5K3annCk3LCHKgXDiJEUttDtMv/s+LLoADlvDQYI2bHKxxB+i
	Tnu/L0tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbbq-0000000CCI1-2VVx;
	Mon, 24 Nov 2025 18:48:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbbo-0000000CCHP-0BBE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 18:48:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0F7C1477;
	Mon, 24 Nov 2025 10:48:09 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F36293F86F;
	Mon, 24 Nov 2025 10:48:16 -0800 (PST)
Date: Mon, 24 Nov 2025 18:48:15 +0000
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] perf: arm_spe: Correct setting the
 PERF_HES_STOPPED flag
Message-ID: <20251124184815.GC724103@e132581.arm.com>
References: <20251110-arm_spe_fix_truncated_flag-v2-0-a629740985cc@arm.com>
 <20251110-arm_spe_fix_truncated_flag-v2-1-a629740985cc@arm.com>
 <aSSEXzMr1drvL2zz@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSSEXzMr1drvL2zz@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_104820_203618_256B7B2A 
X-CRM114-Status: GOOD (  27.91  )
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

On Mon, Nov 24, 2025 at 04:14:23PM +0000, Will Deacon wrote:
> On Mon, Nov 10, 2025 at 04:28:31PM +0000, Leo Yan wrote:
> > In arm_spe_perf_aux_output_begin(), if the calculation of limit fails
> > and arm_spe_pmu_next_off() returns zero, the driver misses to set the
> > PERF_HES_STOPPED flag for the event.  As a result, hwc->state does not
> > reflect the latest state, which can mislead subsequent operations.
> > 
> > Validate the limit when exiting the function: if the limit is 0,
> > that tracing is disabled, set the PERF_HES_STOPPED flag accordingly.
> > 
> > Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  drivers/perf/arm_spe_pmu.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> > index fa50645feddadbea5dc1e404f80f62cf5aa96fd4..fc8f908c2c3a270f2d1ae574c2badb1fbcf51484 100644
> > --- a/drivers/perf/arm_spe_pmu.c
> > +++ b/drivers/perf/arm_spe_pmu.c
> > @@ -597,7 +597,6 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
> >  	/* Start a new aux session */
> >  	buf = perf_aux_output_begin(handle, event);
> >  	if (!buf) {
> > -		event->hw.state |= PERF_HES_STOPPED;
> >  		/*
> >  		 * We still need to clear the limit pointer, since the
> >  		 * profiler might only be disabled by virtue of a fault.
> > @@ -608,15 +607,19 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
> >  
> >  	limit = buf->snapshot ? arm_spe_pmu_next_snapshot_off(handle)
> >  			      : arm_spe_pmu_next_off(handle);
> > -	if (limit)
> > -		limit |= PMBLIMITR_EL1_E;
> > +	if (!limit)
> > +		goto out_write_limit;
> 
> Is 'limit == 0' always indicative of an error, even in snapshot mode?

Yes, the 'limit' would never be zero unless an error occurs.

> If __arm_spe_pmu_next_off() fails, it will call perf_aux_output_end()
> with the TRUNCATED flag set, which should then disable the event
> via arm_spe_pmu_del() and update the state there.
> 
> Is that not happening?

Correct.  However, this patch is not for the flow you mentioned.

If an error is returned from arm_spe_pmu_next_off(), because hw.state
is not set to PERF_HES_STOPPED, the caller arm_spe_pmu_start() cannot
detect error properly:

    arm_spe_pmu_start()
    {
        ...

        hwc->state = 0;
        arm_spe_perf_aux_output_begin(handle, event); // Miss to set hwc->state
                                                      // for error case.
        if (hwc->state)    // Fail to detect error.
                return;

        reg = arm_spe_event_to_pmsfcr(event);
        write_sysreg_s(reg, SYS_PMSFCR_EL1);

        ...
     }

This patch consolidates arm_spe_perf_aux_output_begin() to always set
the PERF_HES_STOPPED flag for errors, ensuring consistent error
handling.

A side effect is that arm_spe_pmu_del() will skip disabling buffer unit
when "hwc->state==PERF_HES_STOPPED".  This is why we need the patch 02
to explicitly disable the buffer unit in interrupt handler.

Thanks,
Leo

