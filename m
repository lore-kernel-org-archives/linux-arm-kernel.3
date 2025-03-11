Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E51C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 11:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+TSkJ/CLUn0erEj6Eb5oYVx4T0mqKWD6ulalhCQevTY=; b=NzXBsqirL+G3smEkGBaUetcG/X
	b2r82trj+v8I/VL7jEeaG3yq/XkzDyNE2PE2OzNryaRE+jy+/R+4UG0SueklQ6xxRnhqYcncxbH9E
	hxO+rfWZ3U8DM7CmLAYyW+MpBxARiRByFNUbdsNcFEGus7QITDQDMSgl2bmG2F0C8g/bjL3RhfOI4
	tMXuHHxsDcmsflPiQzxll7iZXKJupV470UIQ5/FDPJcly7kbPFFoNfpp1T8FhUiFuXrTODi0I8hfa
	19z64x+2PkBGAk1xkylZMJFJRlmW7zBSeCURIL1pMI099mLUxZBOjDJMY1BoPE0DpLbpIFlTspRFt
	lXoHBxhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trxyR-00000005VDq-2uzB;
	Tue, 11 Mar 2025 11:40:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trxvQ-00000005Uot-1ZcL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Mar 2025 11:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+TSkJ/CLUn0erEj6Eb5oYVx4T0mqKWD6ulalhCQevTY=; b=nRv1eHpMSjU2DB1tU3WcGykNUH
	qYT2t7fDcKx0//VfL5kGnFrjZMT/MsKEjx47ARAFxh2BxtjdskAYMYKvLtY+e1v2krIz4KvvChJ2I
	/1+xypbWdJLLUOAdTq3wxihbKXXIDsiKfsZlz+rWu9M1pvPK3NGpXvyyN4+F4K3anWgWzaVUDVMxb
	HQObBuMFRGOlW1mmgDpbSu64OS0Jngc8CqqS6OJo45GrTZJ2xLpAKTjyUN2wgbwXldvg7xwjvEit3
	A2ZlghIFCyYig4PsXG9KD3GLwAVIZwZ0THYZ7S4uD4x5ZqZevhUpvhiZmeytYKIZp9TRtRmGGh7pj
	Fp0wLxpQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1trxvM-0000000Gzhj-3xou;
	Tue, 11 Mar 2025 11:37:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A5DA13002C7; Tue, 11 Mar 2025 12:37:27 +0100 (CET)
Date: Tue, 11 Mar 2025 12:37:27 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mark.barnett@arm.com
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	irogers@google.com, ben.gainey@arm.com, deepak.surti@arm.com,
	ak@linux.intel.com, will@kernel.org, james.clark@arm.com,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/5] perf: Allow adding fixed random jitter to the
 alternate sampling period
Message-ID: <20250311113727.GB9968@noisy.programming.kicks-ass.net>
References: <20250307202247.648633-1-mark.barnett@arm.com>
 <20250307202247.648633-4-mark.barnett@arm.com>
 <20250311113128.GD19424@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311113128.GD19424@noisy.programming.kicks-ass.net>
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

On Tue, Mar 11, 2025 at 12:31:29PM +0100, Peter Zijlstra wrote:
> +	sample_period = hwc->sample_period_base;
> +	if (hwc->state & PERF_HES_HF_RAND) {
> +		u64 rand = 1 << event->attr.hf_sample_rand;
> +		sample_period -= rand / 2;
> +		sample_period += prandom_u32_state(&perf_rand) & (rand - 1);
> +	}
> +	if (hwc->state & PERF_HES_HF_ON) {
> +		u64 hf_sample_period = event->attr.hf_sample_period;
> +
> +		if (sample_period < hf_sample_period) {
> +			hwc->state &= ~PERF_HES_HF_ON;
> +			goto set_period;
> +		}
> +
> +		if (!(hwc->state & PERF_HES_HF_SAMPLE)) {
> +			hwc->sample_period -= hf_sample_period;
> +			hwc->state |= PERF_HES_HF_SAMPLE;
> +		} else {
> +			hwc->sample_period = hf_sample_period;
> +			hwc->state &= ~PERF_HES_HF_SAMPLE;

and obviously this should be the local sample_period modified above, not
the hwc one.

> +		}
> +	}
> +set_period:
> +	hwc->sample_period = sample_period;

