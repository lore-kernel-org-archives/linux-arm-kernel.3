Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03DCCFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiIiqdRvqRFIoTAn7xIJfq8h4+STQisiAkduroQ+D74=; b=pc9C4a2wDB1rqmA5cDLAhd1pHB
	OBTWLbFdHOk8K5Wnj1u9/ZWspCaOEI+ReclUrfDTBrgiHqJNkzolU/bbmwAyhU4da1nTHl2KYBob1
	/lOJg4bvYnCoynDfDgEKyeSNfXBFiuWucNAR2suh91Fr5cybF1w3p+A7O3NvSJOzssTLmo7BuYj5s
	ispn+T3vXVJUTIYElLR89KvOvHTs738BGkKMiufuxLljTuHsOyFaBLgwhg+ZF7PAGE1LchK5e7g+N
	VADc0OrY5pqP+wot2lwMzVo2KHrVPAwiWZYTd5hUSI/m6GwMzhw7243sjpCLiU3fMQkU7in+nBrYa
	/K7krD6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZCw-0000000Bype-3IFv;
	Mon, 24 Nov 2025 16:14:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZCu-0000000Byp4-1sY4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 16:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18A7141AD5;
	Mon, 24 Nov 2025 16:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769F6C4CEF1;
	Mon, 24 Nov 2025 16:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764000868;
	bh=G9H9wGmU1A3UKAZvzaabdyQPVDbzmy328mGagCCY2HE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVf+cccLqZeIumQJBrKQmcOzC4IQbSYnAiDhcu+WlJ815ho82ogCeo63mawAgqQUz
	 qN7OXkYouTRmI6b5neBgoZmF9voOPg5VX0uf3DKeXV8MfK8v3hVIb+nnY9ARBuLRry
	 XuN2K3QXfHXyKU9qjo1r6RkMlaHnWZWKY/Sg9DZhycIhSE86bR771Cv6CvMqPyzdxz
	 2Byh0p/RmMhjNai65JmDmRvvFYgHm8l1lCP8WVZEYEYjIKtWU0mldFdx85JUMN35pz
	 DhqtVfB3UhOw87MTpLATfJrvESq4xImvwEzApdf7sW5qiMvkdjn/nXW0cHVxB2lkjX
	 jibPH3lTObHHA==
Date: Mon, 24 Nov 2025 16:14:23 +0000
From: Will Deacon <will@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] perf: arm_spe: Correct setting the
 PERF_HES_STOPPED flag
Message-ID: <aSSEXzMr1drvL2zz@willie-the-truck>
References: <20251110-arm_spe_fix_truncated_flag-v2-0-a629740985cc@arm.com>
 <20251110-arm_spe_fix_truncated_flag-v2-1-a629740985cc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-arm_spe_fix_truncated_flag-v2-1-a629740985cc@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_081428_502558_52D4D65D 
X-CRM114-Status: GOOD (  20.65  )
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

On Mon, Nov 10, 2025 at 04:28:31PM +0000, Leo Yan wrote:
> In arm_spe_perf_aux_output_begin(), if the calculation of limit fails
> and arm_spe_pmu_next_off() returns zero, the driver misses to set the
> PERF_HES_STOPPED flag for the event.  As a result, hwc->state does not
> reflect the latest state, which can mislead subsequent operations.
> 
> Validate the limit when exiting the function: if the limit is 0,
> that tracing is disabled, set the PERF_HES_STOPPED flag accordingly.
> 
> Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/perf/arm_spe_pmu.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index fa50645feddadbea5dc1e404f80f62cf5aa96fd4..fc8f908c2c3a270f2d1ae574c2badb1fbcf51484 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -597,7 +597,6 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
>  	/* Start a new aux session */
>  	buf = perf_aux_output_begin(handle, event);
>  	if (!buf) {
> -		event->hw.state |= PERF_HES_STOPPED;
>  		/*
>  		 * We still need to clear the limit pointer, since the
>  		 * profiler might only be disabled by virtue of a fault.
> @@ -608,15 +607,19 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
>  
>  	limit = buf->snapshot ? arm_spe_pmu_next_snapshot_off(handle)
>  			      : arm_spe_pmu_next_off(handle);
> -	if (limit)
> -		limit |= PMBLIMITR_EL1_E;
> +	if (!limit)
> +		goto out_write_limit;

Is 'limit == 0' always indicative of an error, even in snapshot mode?

If __arm_spe_pmu_next_off() fails, it will call perf_aux_output_end()
with the TRUNCATED flag set, which should then disable the event
via arm_spe_pmu_del() and update the state there.

Is that not happening?

Will

