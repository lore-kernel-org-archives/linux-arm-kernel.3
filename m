Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F7ECFD348
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 19:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmmSPdJl3K7g0vYrR5PzWSeexHm/mp6mW5X46Ly/gUI=; b=OsrWmSttEMUFBPhw8569/EMut1
	CqDRzzb5ln0mfcc6ZnPi2sFeW/FqcqmlmC2Mcgfl+Mu3YbDZZ9QU8uXDnIk0l2OISxklVuuvM9swB
	BQrVFlwMmM7RTUP6ci+FDBj+MZiy49LU9TwPm//FMrLnuuTHHkXNAhtV8ZDv/f+VcgCwiv4CHE6nX
	+rWwS3MCD9aqJcu2dDgJ1xLi/5DVdEgRozh7i/UQns+ANHPkW4cHmjfGQaDRUt6Z9nE73nrvwHcaX
	4naEIsMs172feh0B0MAg++zwSSjLz4oYAZR5JTmyyS4KVJcwbDe27TBXMkObZEu04Dddh1LwEBzh1
	H3z5tYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbpG-0000000CDCk-2cHi;
	Mon, 24 Nov 2025 19:02:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbpE-0000000CDBt-1lTU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 19:02:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C87C340E14;
	Mon, 24 Nov 2025 19:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33823C4CEF1;
	Mon, 24 Nov 2025 19:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764010931;
	bh=uD7Maoubwz/B9JiuTc7YFA7RBSK4vwlOgZPF2XYEwFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r30mEbj+WvnJRyOhTtrNhs+NqNMXjUVtxUST6L9f42xGeJtj5MikU7F0SgCiTGgIG
	 M/MfliWdX44MhVcYIbncUgfkHL57LunAUnTEzbgjq9hsnlvhpg+Kby9xbhjjiMIeC/
	 SYCNIsKIDE/CtUxNTozDDsSzdJDk9gkeMkqi1lEytgMgjCnTggMnDxH37B5L939s7c
	 cYlZ8xM3i9JIwsAOz5U385JyDwkVXyAybrF39QQie0k7wzFRMGA+o7r7zxM5d7uXrU
	 qGPAAySKuL/p9igksvocIgb0YSif5cxJF0gCEIMQ02FZR+Q3aUC1wpd0U7ZnexqedX
	 S2jXnWoZsywoQ==
Date: Mon, 24 Nov 2025 19:02:06 +0000
From: Will Deacon <will@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] perf: arm_spe: Correct setting the
 PERF_HES_STOPPED flag
Message-ID: <aSSrrmX_nAl82GKE@willie-the-truck>
References: <20251110-arm_spe_fix_truncated_flag-v2-0-a629740985cc@arm.com>
 <20251110-arm_spe_fix_truncated_flag-v2-1-a629740985cc@arm.com>
 <aSSEXzMr1drvL2zz@willie-the-truck>
 <20251124184815.GC724103@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124184815.GC724103@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_110212_523845_795ACCE8 
X-CRM114-Status: GOOD (  30.48  )
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

On Mon, Nov 24, 2025 at 06:48:15PM +0000, Leo Yan wrote:
> On Mon, Nov 24, 2025 at 04:14:23PM +0000, Will Deacon wrote:
> > On Mon, Nov 10, 2025 at 04:28:31PM +0000, Leo Yan wrote:
> > > In arm_spe_perf_aux_output_begin(), if the calculation of limit fails
> > > and arm_spe_pmu_next_off() returns zero, the driver misses to set the
> > > PERF_HES_STOPPED flag for the event.  As a result, hwc->state does not
> > > reflect the latest state, which can mislead subsequent operations.
> > > 
> > > Validate the limit when exiting the function: if the limit is 0,
> > > that tracing is disabled, set the PERF_HES_STOPPED flag accordingly.
> > > 
> > > Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
> > > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > > ---
> > >  drivers/perf/arm_spe_pmu.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> > > index fa50645feddadbea5dc1e404f80f62cf5aa96fd4..fc8f908c2c3a270f2d1ae574c2badb1fbcf51484 100644
> > > --- a/drivers/perf/arm_spe_pmu.c
> > > +++ b/drivers/perf/arm_spe_pmu.c
> > > @@ -597,7 +597,6 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
> > >  	/* Start a new aux session */
> > >  	buf = perf_aux_output_begin(handle, event);
> > >  	if (!buf) {
> > > -		event->hw.state |= PERF_HES_STOPPED;
> > >  		/*
> > >  		 * We still need to clear the limit pointer, since the
> > >  		 * profiler might only be disabled by virtue of a fault.
> > > @@ -608,15 +607,19 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
> > >  
> > >  	limit = buf->snapshot ? arm_spe_pmu_next_snapshot_off(handle)
> > >  			      : arm_spe_pmu_next_off(handle);
> > > -	if (limit)
> > > -		limit |= PMBLIMITR_EL1_E;
> > > +	if (!limit)
> > > +		goto out_write_limit;
> > 
> > Is 'limit == 0' always indicative of an error, even in snapshot mode?
> 
> Yes, the 'limit' would never be zero unless an error occurs.
> 
> > If __arm_spe_pmu_next_off() fails, it will call perf_aux_output_end()
> > with the TRUNCATED flag set, which should then disable the event
> > via arm_spe_pmu_del() and update the state there.
> > 
> > Is that not happening?
> 
> Correct.  However, this patch is not for the flow you mentioned.

How is it not for this flow? You're talking about:

arm_spe_pmu_start
	=> arm_spe_perf_aux_output_begin
		=> arm_spe_pmu_next_off // Returns error

The only way arm_spe_pmu_next_off() returns an error is if
__arm_spe_pmu_next_off() fails, and that's the flow I'm talking about.

> If an error is returned from arm_spe_pmu_next_off(), because hw.state
> is not set to PERF_HES_STOPPED, the caller arm_spe_pmu_start() cannot
> detect error properly:

But why isn't PERF_HES_STOPPED set by the sequence I described?

I have a feeling you're right, but I can't piece it together from the
information here.

Will

