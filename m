Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797E7D3EE66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 13:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCWSY/O8y74t2hlu/p4/ldA65A7Kgbi5BK6Xzf9k66U=; b=e7lO14Lh0sZHa5Y2flJ88uIWEy
	VGhAVcdMx0rV8kemGpFwL2kC2t4kMbRucxbeyfq0y+4vqcbgJ7UTLA7jlV09GYuOaVpeOtmJ4TCV9
	HuQJMUwDrPgoiEcDZ3sKqnB1jwAPc6LZj1H3xNpjCPI/yfHh5iReG/kCmcaIOTz5nWg1NB3/a/T33
	Opsi047htUI3sTvu46rHuPYn+AWVViV3mjxgjM2AR6naWlRREq1swWTzW9x/N3vsuChFJAoF8fpo+
	y+G9lU7kbd/okLbPbyysvwzGHZ0kD3b6+BbGJJjqXXX4ZrW5rxtyKSDramFz6WraZrBZj32UwjDXh
	TeSsl4nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viutL-00000007ADL-2zql;
	Thu, 22 Jan 2026 13:38:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viutK-00000007ADE-3l08
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 13:38:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BF1A60053;
	Thu, 22 Jan 2026 13:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50279C116C6;
	Thu, 22 Jan 2026 13:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769089109;
	bh=AV3ZCPbAFUyxCCu4Dz1CucUUm9mQCshkFe7ZO65A/kI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J/FJUT7QsalzK3vkTyosdRDIxYUDH0Gk+pD3KR7eY2Hz7wQzUg/V8e0h5lFmBQXf4
	 KMZ9+56k381nE2GBCp3uy/vSjEYuX+D966HJ0Lz6SOLZ3uSF9ynOfUaBqtlAYWf727
	 tS1JO0bQIq+CCig545u8j0kv+DAT09Lx4nxmqpjm6PX/syTJyCg69K4L5M9SGBpIat
	 1XdDhSWNSMwldzKa7/u6ryyd8fuNW8Obc9wasbRcVrJn3hVDZF4V3VjXI7G8jrFiYr
	 eCArtwPs4NYUXk2WnHFzh78lTQfRos3QTERG2DyGX+NfQCQFYQr4UeFUD89up0JnSM
	 d+ikL+oQ1nTBw==
Date: Thu, 22 Jan 2026 13:38:24 +0000
From: Will Deacon <will@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] perf: arm_spe: Properly set hw.state on failures
Message-ID: <aXIoUMLF6aClRrjv@willie-the-truck>
References: <20260121-arm_spe_fix_truncated_flag-v3-1-214747f68b50@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-arm_spe_fix_truncated_flag-v3-1-214747f68b50@arm.com>
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

On Wed, Jan 21, 2026 at 11:33:21AM +0000, Leo Yan wrote:
> When arm_spe_pmu_next_off() fails to calculate a valid limit, it returns
> zero to indicate that tracing should not start.  However, the caller
> arm_spe_perf_aux_output_begin() does not propagate this failure by
> updating hwc->state, cause the error to be silently ignored by upper
> layers.
> 
> Because hwc->state remains zero after a failure, arm_spe_pmu_start()
> continues to programs filter registers unnecessarily.  The driver
> still reports success to the perf core, so the core assumes the SPE
> event was enabled and proceeds to enable other events.  This breaks
> event group semantics: SPE is already stopped while other events in the
> same group are enabled.
> 
> Fix this by updating arm_spe_perf_aux_output_begin() to return a status
> code indicating success (0) or failure (-EAGAIN).  Both the interrupt
> handler and arm_spe_pmu_start() check the return value and call
> arm_spe_pmu_stop() to set PERF_HES_STOPPED in hwc->state.
> 
> In the interrupt handler, the period (e.g., period_left) needs to be
> updated, so PERF_EF_UPDATE is passed to arm_spe_pmu_stop().  When the
> error occurs during event start, the trace unit is not yet enabled, so
> a flag '0' is used to drain buffer and update state only.
> 
> Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
> This change has been verified on Orion6 board.
> ---
> Changes in v3:
> - Updated arm_spe_perf_aux_output_begin() for returning error and used
>   arm_spe_pmu_stop() for setting hw_state properly (Will).
> - Link to v2: https://lore.kernel.org/r/20251110-arm_spe_fix_truncated_flag-v2-0-a629740985cc@arm.com
> ---
>  drivers/perf/arm_spe_pmu.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index 4801115f2b54052d584b59881f458c2640e974ff..b9a6748827cc5557c42023f323a90b5826eadb54 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -106,6 +106,8 @@ struct arm_spe_pmu {
>  /* Keep track of our dynamic hotplug state */
>  static enum cpuhp_state arm_spe_pmu_online;
>  
> +static void arm_spe_pmu_stop(struct perf_event *event, int flags);

This is fine, but I'm also happy if you want to move the functions around
to avoid the forward declaration.

>  enum arm_spe_pmu_buf_fault_action {
>  	SPE_PMU_BUF_FAULT_ACT_SPURIOUS,
>  	SPE_PMU_BUF_FAULT_ACT_FATAL,
> @@ -607,8 +609,8 @@ static u64 arm_spe_pmu_next_off(struct perf_output_handle *handle)
>  	return limit;
>  }
>  
> -static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
> -					  struct perf_event *event)
> +static int arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
> +					 struct perf_event *event)
>  {
>  	u64 base, limit;
>  	struct arm_spe_pmu_buf *buf;
> @@ -622,7 +624,6 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
>  	/* Start a new aux session */
>  	buf = perf_aux_output_begin(handle, event);
>  	if (!buf) {
> -		event->hw.state |= PERF_HES_STOPPED;
>  		/*
>  		 * We still need to clear the limit pointer, since the
>  		 * profiler might only be disabled by virtue of a fault.
> @@ -642,6 +643,7 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
>  
>  out_write_limit:
>  	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
> +	return (limit & PMBLIMITR_EL1_E) ? 0 : -EAGAIN;

I'd probably go with -EIO here. -EAGAIN implies that if the caller
retries the operation then it might succeed, which probably isn't the
case for these failures.

>  static void arm_spe_perf_aux_output_end(struct perf_output_handle *handle)
> @@ -781,7 +783,10 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
>  		 * when we get to it.
>  		 */
>  		if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED)) {
> -			arm_spe_perf_aux_output_begin(handle, event);
> +			if (arm_spe_perf_aux_output_begin(handle, event)) {
> +				arm_spe_pmu_stop(event, PERF_EF_UPDATE);

Why do you need to pass PERF_EF_UPDATE in this case? It looks to me
like we're going to get into a mess with PMBSR_EL1, as that will get
re-read by arm_spe_pmu_buf_get_fault_act() in arm_spe_pmu_stop()
before we've cleared it here in the irq handler.

I was expecting that we would always pass 0 for the flags when handling
the case where we get an error back from arm_spe_perf_aux_output_begin().

Will

