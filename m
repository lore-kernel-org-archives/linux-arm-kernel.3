Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B361FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZ3eswhyKKO+EXQFGfJjdwhvfU6fuM55nHEXlBMnRDk=; b=JpaA+UtHZgWXFymU4BCKT2sP8w
	KKKNRn/8jZN5M+ElxqXbf+YdLHtmWHKJlYQePm8m1OeEge01olvab9Zd0z86BircESFjjaXXSQwM3
	5okz6INDy2s0otkIYzdZEfY6C8wWWYwHeFrINB5OK0UEkhvui+7Piu83Ny/O6SeA7ngKhwGv4arT1
	qFW7pwy4KqUpWBEU06Psu0p5zGYrjtXg/vap5LJxCs4JKoI5IV/Ee7pWmnPJP+YVIQclpgmWH2CO+
	nWr21j2Py5z0JlAhLS1ZC5tm959ahV9x1KPbGGPAqd2rOKhmnkaM7dXHQwFTL53pplpqlO6MwqAJX
	AtcJAxcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFy8q-0000000AON7-1muZ;
	Mon, 03 Nov 2025 17:14:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFy8o-0000000AOMn-2ELK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:14:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 247461D14;
	Mon,  3 Nov 2025 09:14:41 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A18D3F66E;
	Mon,  3 Nov 2025 09:14:48 -0800 (PST)
Date: Mon, 3 Nov 2025 17:14:46 +0000
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf: arm_spe: Ensure trace is disabled when TRUNCATED
 flag is set
Message-ID: <20251103171446.GY281971@e132581.arm.com>
References: <20251015-arm_spe_fix_truncated_flag-v1-1-555e328cba05@arm.com>
 <aQi44CZOiwhI19dd@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQi44CZOiwhI19dd@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_091450_689452_4DD268CF 
X-CRM114-Status: GOOD (  26.30  )
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

On Mon, Nov 03, 2025 at 02:14:56PM +0000, Will Deacon wrote:

[...]

> > @@ -765,6 +759,15 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
> >  		break;
> >  	}
> >  
> > +	/*
> > +	 * The TRUNCATED flag is set when data loss is detected by PMBSR_EL1.DL,
> > +	 * or arm_spe_perf_aux_output_begin() sets the flag if runs out of free
> > +	 * space. Ensure that all perf callbacks have completed for disabling
> > +	 * the profiling buffer.
> > +	 */
> > +	if (handle->aux_flags & PERF_AUX_FLAG_TRUNCATED)
> > +		irq_work_run();
> 
> I'm not sure about this. afaict, perf_aux_output_begin() can fail
> (return NULL) without setting the TRUNCATED flag but with a disable
> pending in irq work. It also feels a little fragile moving the existing
> irq_work_run() call as that could easily break in future if e.g. irq
> work is used for other manipulation of the buffer controls.
> 
> Given that this isn't a fast path, isn't it simpler and safer just to
> do something like the below?

This is fine for me.  However, arm_spe_perf_aux_output_begin() misses to
set the 'hw.state' if arm_spe_pmu_next_off() fails to calculate a valid
limit. We need an extra fix for this (see the pasted code piece).

As a result, we will have two fixes:

  1) Fix 'hw.state' setting in arm_spe_perf_aux_output_begin();
  2) Invoke irq_work_run() if 'hw.state' is non-zero.

Please let me know if this works for you.  Thanks!

Leo

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index fa50645fedda..ff7b1447db0a 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -597,7 +597,6 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
 	/* Start a new aux session */
 	buf = perf_aux_output_begin(handle, event);
 	if (!buf) {
-		event->hw.state |= PERF_HES_STOPPED;
 		/*
 		 * We still need to clear the limit pointer, since the
 		 * profiler might only be disabled by virtue of a fault.
@@ -608,14 +607,18 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
 
 	limit = buf->snapshot ? arm_spe_pmu_next_snapshot_off(handle)
 			      : arm_spe_pmu_next_off(handle);
-	if (limit)
-		limit |= PMBLIMITR_EL1_E;
+	if (!limit)
+		goto out_write_limit;
 
-	limit += (u64)buf->base;
+	limit |= (u64)buf->base | PMBLIMITR_EL1_E;
 	base = (u64)buf->base + PERF_IDX2OFF(handle->head, buf);
 	write_sysreg_s(base, SYS_PMBPTR_EL1);
 
 out_write_limit:
+	/* Stop tracing due to an invalid limit pointer */
+	if (!limit)
+		event->hw.state |= PERF_HES_STOPPED;
 	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
 }
 

> Will
> 
> --->8
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index fa50645fedda..8a38d69e9600 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -758,6 +758,10 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
>                 if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED)) {
>                         arm_spe_perf_aux_output_begin(handle, event);
>                         isb();
> +
> +                       /* Insightful comment here */
> +                       if (event->hw.state)
> +                               irq_work_run();
>                 }
>                 break;
>         case SPE_PMU_BUF_FAULT_ACT_SPURIOUS:
> 

