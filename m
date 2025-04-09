Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4B7C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 15:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDUIJBUfUWetOQ9XbfKqZntOyLdSRCgncZqRn4gs3n8=; b=sGvzxnDtfvw65i5bbwyjN+4Yj9
	NrjLNGA5idQq8+iJFs1Up1wajbyAY4kt83f4H68e/XHDEQCiUDEK+f2Ev1Cr7eS6xIdyk0rKctHY8
	A5Fhsxn9yl50SbAtZk72r5dpimL67LKzLVv+VHsx2dfAv1uCjRTRS6z5LniyhehOQpUw+LoIk8cQO
	Y59Am7fz0LwnyfAzWrLYbwh6M8jvSZxdCEv4IKnSBmbq9b8swmYyzwEUgxVoP1AbqIOzn+HVexTfy
	r+Jaby8LsBvEB2s827D8Tcl1pwoqz0QAWd2pJGlXloLr7A29MI+4lrqCoLqfERgvH1f5VzYrvF8oQ
	pUcZfF4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XoM-00000007nfk-0rwf;
	Wed, 09 Apr 2025 15:57:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WLk-00000007RJt-2Dpu
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Apr 2025 14:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QDUIJBUfUWetOQ9XbfKqZntOyLdSRCgncZqRn4gs3n8=; b=KTfCf3c8JRBefviFsqU+m7kWm+
	Sj2845Sdimp6jX0y275HopAZl44AeT36Kjv54ltI5NyUHgLevjKv43NxpThdXzfcHo9dRVHegRGjQ
	e/NE9h96bkM/Acyq8fczLJQEcOuUn97dkCTfXG7hTbEcDIhuthdHfH8dcoL/N71Q5wLDKb57buzIq
	rmobayGJc8GuAB2UIBPg3FxlodVRwWvCuyM98e+l/VJZv+EofA0bHMU/Lf57RjzSGKeyV1ToEDRQt
	g/dwSgYjVfT5pI3LFuniTt+fzZBU460QxhVZO9GC26rF8xXLanqYRkDxKjzG9h80H4yPgiXsdtSBh
	ODPFq3BQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WLh-00000001ZhH-3Axy;
	Wed, 09 Apr 2025 14:24:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E9B433003FA; Wed,  9 Apr 2025 16:24:17 +0200 (CEST)
Date: Wed, 9 Apr 2025 16:24:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mark.barnett@arm.com
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	irogers@google.com, ben.gainey@arm.com, deepak.surti@arm.com,
	ak@linux.intel.com, will@kernel.org, james.clark@arm.com,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/5] perf: Allow adding fixed random jitter to the
 sampling period
Message-ID: <20250409142417.GC9833@noisy.programming.kicks-ass.net>
References: <20250408171530.140858-1-mark.barnett@arm.com>
 <20250408171530.140858-4-mark.barnett@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408171530.140858-4-mark.barnett@arm.com>
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

On Tue, Apr 08, 2025 at 06:15:28PM +0100, mark.barnett@arm.com wrote:
> @@ -10224,6 +10227,19 @@ static int __perf_event_overflow(struct perf_event *event,
>  	 *
>  	 * By ignoring the HF samples, we measure the actual period.
>  	 */
> +
> +	/*
> +	 * Apply optional jitter to the overall sample period
> +	 */
> +	if (hwc->sample_period_state & PERF_SPS_HF_RAND
> +			&& !(hwc->sample_period_state & PERF_SPS_HF_SAMPLE)) {

Coding style nit: when breaking lines, the operator goes on the end of
the preceding line.

> +		struct rnd_state *state = &get_cpu_var(sample_period_jitter_rnd);
> +		u64 rand_period = 1 << event->attr.hf_sample_rand;
> +
> +		sample_period -= rand_period / 2;
> +		sample_period += prandom_u32_state(state) & (rand_period - 1);
> +	}
> +
>  	if (hwc->sample_period_state & PERF_SPS_HF_ON) {
>  		u64 hf_sample_period = event->attr.hf_sample_period;
>  

