Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72F2D3EE89
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykUx2adOJBFFHJ6Im+3WGL6svGsBspQMBwAL5DEsYtc=; b=Q2JjvO9lCrZ/JYOc1DUVsr9deo
	WLYIR4+W5sF9kr0Iy61a1KG+4CnTp2yJlWUff5muzQuOzD3QeLMsnbZBUoVCodsBD2Xw7RfNLxEWi
	dEeevMjTfcLxFRp0kyOjOLLmr8X1TShY+S9d08/U7+rQMlp1c/J1QePmPv6zBvJgW5sZP7jOtkkcJ
	WquPTZrp2pMQRDKrQEcipn+xnGBPXoKPywKjYNEHe2f5fc73lK2nBUKBM/d5DTmY09J6dJqX2v85M
	DS/WbPKJfLMR+RLmEyrOjNQcWUgVCxVzIo4LPPR4FeyeqleSFdzVmmrJrHgvJz/b04G2c0XhgBWqQ
	AfYvRjig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixZj-00000007S6q-3CCV;
	Thu, 22 Jan 2026 16:30:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixZf-00000007S6E-32b1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:30:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 091131476;
	Thu, 22 Jan 2026 08:30:07 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2178A3F694;
	Thu, 22 Jan 2026 08:30:12 -0800 (PST)
Date: Thu, 22 Jan 2026 16:30:10 +0000
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] perf: arm_spe: Properly set hw.state on failures
Message-ID: <20260122163010.GA40455@e132581.arm.com>
References: <20260121-arm_spe_fix_truncated_flag-v3-1-214747f68b50@arm.com>
 <aXIoUMLF6aClRrjv@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXIoUMLF6aClRrjv@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_083023_851941_A6075219 
X-CRM114-Status: GOOD (  26.72  )
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

On Thu, Jan 22, 2026 at 01:38:24PM +0000, Will Deacon wrote:
> On Wed, Jan 21, 2026 at 11:33:21AM +0000, Leo Yan wrote:

[...]

> > +static void arm_spe_pmu_stop(struct perf_event *event, int flags);
> 
> This is fine, but I'm also happy if you want to move the functions around
> to avoid the forward declaration.

I also dislike the forward declaration, but the current code is well
organized (the PMU start/stop/add/del helpers are grouped together).

Moving arm_spe_pmu_stop() elsewhere might hurt the readability.

> > @@ -642,6 +643,7 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
> >  
> >  out_write_limit:
> >  	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
> > +	return (limit & PMBLIMITR_EL1_E) ? 0 : -EAGAIN;
> 
> I'd probably go with -EIO here. -EAGAIN implies that if the caller
> retries the operation then it might succeed, which probably isn't the
> case for these failures.

Will do.

> >  static void arm_spe_perf_aux_output_end(struct perf_output_handle *handle)
> > @@ -781,7 +783,10 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
> >  		 * when we get to it.
> >  		 */
> >  		if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED)) {
> > -			arm_spe_perf_aux_output_begin(handle, event);
> > +			if (arm_spe_perf_aux_output_begin(handle, event)) {
> > +				arm_spe_pmu_stop(event, PERF_EF_UPDATE);
> 
> Why do you need to pass PERF_EF_UPDATE in this case?

The main purpose is to read PMSICR_EL1 and save the left count to
"hwc->period_left".  This might be used in next enable.

> It looks to me
> like we're going to get into a mess with PMBSR_EL1, as that will get
> re-read by arm_spe_pmu_buf_get_fault_act() in arm_spe_pmu_stop()
> before we've cleared it here in the irq handler.

When arm_spe_perf_aux_output_begin() fails, either because
perf_aux_output_begin() fails to start a new session or because an
invalid limit is detected and perf_aux_output_end(handle, 0) is
called.

In either case, perf_get_aux(handle) returns NULL after the failure,
and arm_spe_pmu_stop() has no chance to run into the path that
re-reads PMBSR_EL1.

> I was expecting that we would always pass 0 for the flags when handling
> the case where we get an error back from arm_spe_perf_aux_output_begin().

We can look at this another way.  If we do not call arm_spe_pmu_stop()
in the interrupt handler and instead defer stopping the trace to
arm_spe_pmu_del(), the PERF_EF_UPDATE flag is used.  This patch simply
keeps the same behavior while stopping the trace earlier in the
interrupt handler.  Make sense?

Thanks,
Leo

