Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD534CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+SlWd+R6FHMx0bnMiaGbLvKD9s9LCxqkPOhhHODI9I=; b=l03wVOyRnkkkO7DrIBYHMqEwf5
	11f/sg3ZbEnSf2rvVvKxZqs0TD9KHaByShBu9wrLb714if+eMOjHf8vtCp/UYf1OIlj8Vcb2DqeTa
	vnDSxUPFEBzw9uA8WV3jikY3LkAtCd1GiBZe08nO8vtiPmSt91TizCHkF6PnN7F3EdWv8RRKCMMfY
	GiaQupzoqw8km+FHgHcBZl7CpmeQ8iCDNDS8eOSXJ4dRdF0xcsU8ujVLPOFn2FJCQGU8AEci/xqBQ
	U2ciVeO4JWImf11XcZ3J0o+QlAT0UKkoSjAV5lWx+RBy7wmkcIOX/17cTAArl+nAxIpIoDCXHZNmo
	zrhGtRRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvKq-0000000A0Yk-3Dll;
	Mon, 03 Nov 2025 14:15:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvKo-0000000A0Ya-3VZi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:15:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF7F66013E;
	Mon,  3 Nov 2025 14:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EAD4C4CEE7;
	Mon,  3 Nov 2025 14:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762179301;
	bh=fs90Ul4vTnu9dV9I/VxXT9SC/TJ8z2rQUAx6krg4/Gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3o01LlDmBO8alUjN9fiIY8ZAoR7Yj4bPPQbuFzEScyf0Q+7jfwgwoRGax0TZ3ojY
	 tzyICCPRCpa3zMyy/7yD27/7XPdsRJKROidbqzVoisReUN7xz3/qO5eQpYtP+0n6A+
	 34LWRNe/+fecNcLTHGQPnYdnTsVIHQS17sRl0IOPv+7Q+bvTglLRtYh82ZIRHggnbS
	 IlPpUHlT5+zj0383kredcBozFfs9sR65eKFqhRDVZfuacSnlVtfOMy90LDKuqYxA8v
	 edKiJH984rvPsqH/NuUuzAS/qRIfHyzmhuTlxxicOom0g9wiUFZ31J4wexSJ9qpm8J
	 tWMwbSQu69+lg==
Date: Mon, 3 Nov 2025 14:14:56 +0000
From: Will Deacon <will@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf: arm_spe: Ensure trace is disabled when TRUNCATED
 flag is set
Message-ID: <aQi44CZOiwhI19dd@willie-the-truck>
References: <20251015-arm_spe_fix_truncated_flag-v1-1-555e328cba05@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-arm_spe_fix_truncated_flag-v1-1-555e328cba05@arm.com>
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

On Wed, Oct 15, 2025 at 07:23:37PM +0100, Leo Yan wrote:
> The TRUNCATED flag can be set in the following cases:
> 
>  1. When data loss is detected (PMBSR_EL1.DL == 0b1).
>  2. When arm_spe_perf_aux_output_begin() fails to find a valid limit
>     because it runs out of free space.
> 
> Currently, only the first case invokes irq_work_run() to execute the
> event disable callback, while the second case does not.
> 
> Move the call to irq_work_run() later with checking the TRUNCATED flag,
> so that both cases are handled and redundant calls are avoided.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/perf/arm_spe_pmu.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index fa50645feddadbea5dc1e404f80f62cf5aa96fd4..05ba977f75d607a1d524f68694db9ea18a6ef20c 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -731,12 +731,6 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
>  	if (act == SPE_PMU_BUF_FAULT_ACT_SPURIOUS)
>  		return IRQ_NONE;
>  
> -	/*
> -	 * Ensure perf callbacks have completed, which may disable the
> -	 * profiling buffer in response to a TRUNCATION flag.
> -	 */
> -	irq_work_run();
> -
>  	switch (act) {
>  	case SPE_PMU_BUF_FAULT_ACT_FATAL:
>  		/*
> @@ -765,6 +759,15 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
>  		break;
>  	}
>  
> +	/*
> +	 * The TRUNCATED flag is set when data loss is detected by PMBSR_EL1.DL,
> +	 * or arm_spe_perf_aux_output_begin() sets the flag if runs out of free
> +	 * space. Ensure that all perf callbacks have completed for disabling
> +	 * the profiling buffer.
> +	 */
> +	if (handle->aux_flags & PERF_AUX_FLAG_TRUNCATED)
> +		irq_work_run();

I'm not sure about this. afaict, perf_aux_output_begin() can fail
(return NULL) without setting the TRUNCATED flag but with a disable
pending in irq work. It also feels a little fragile moving the existing
irq_work_run() call as that could easily break in future if e.g. irq
work is used for other manipulation of the buffer controls.

Given that this isn't a fast path, isn't it simpler and safer just to
do something like the below?

Will

--->8

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index fa50645fedda..8a38d69e9600 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -758,6 +758,10 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
                if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED)) {
                        arm_spe_perf_aux_output_begin(handle, event);
                        isb();
+
+                       /* Insightful comment here */
+                       if (event->hw.state)
+                               irq_work_run();
                }
                break;
        case SPE_PMU_BUF_FAULT_ACT_SPURIOUS:


