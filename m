Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61230C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 22:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7qdWvM8EyNyyLV1s5I3noHe3+mIP5w/jg5ubON/3+w=; b=smlDJXDTbay8m+GBCToJRVapGf
	40nYupIdz55/8DhuH06R0bd+kzcQaaKYflzpvI6Dv/HSmWQUYl9nTc8KTWg7rUE3zl1WdqPKz2lbp
	ehr1xAPiyKfzkQ/FuzpigEsym76UHfnYx6S05ayJY7n6DdyQe9A+KCeRVEPsDks819iAl5czZ4fh1
	nEtWDENMVug3YZ229ccnfl5si9MzNkCykrhtWfQA++JTI+672mRlNzDgb3klKH5Rs3XaT/bRvxkZa
	e2UXPQaioZzWUaAC3PIiJYc3NjJMHP6LpV8zO+VzSdeh/eM7sosauvcoX+L5QNVn1Di0y084NhIga
	fIkToo6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trlau-000000047pH-0Rbq;
	Mon, 10 Mar 2025 22:27:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trlZG-000000047Qf-1LXZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 22:25:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E6A265C64C5;
	Mon, 10 Mar 2025 22:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9169BC4CEE5;
	Mon, 10 Mar 2025 22:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741645549;
	bh=PLPtMAdLqw+G8AEgUeRDvdMNU1ywbWvZVWcSJqJVCSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=raoDUdzNardNOCECYAuYbPHqIqYsoFxpzOUR+lQcuh+xrasC39dnlsloBBSv+rn5v
	 RNKBG47byV/IlEwc86WXlZ1hNcBSMlRGWoH8FUg8FOaoGuz2YH6CpIkuC5To/yHYyF
	 pCjjHC7zY0XO2Qb+TF94aUkKJ5dN1MypbL+mcL0w2zp6RTLSfjG5GjDiHFwCgbPXWI
	 nakaeZwfZrB+1ttJSo5IjBk4PEALH7F4we75JrtB3vU29vYVhywp5EwRAUQhLziiyX
	 MmZQ6XbBAd1KPp93aYizlZIoWSjIUPOz0SckXnD7BV7j9xFgWol94MFPeYC/P3HVpA
	 CW8Kkjf4ik6bg==
Date: Mon, 10 Mar 2025 15:25:47 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andi Kleen <ak@linux.intel.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Ingo Molnar <mingo@redhat.com>,
	John Garry <john.g.garry@oracle.com>, Leo Yan <leo.yan@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Petlan <mpetlan@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tavian Barnes <tavianator@tavianator.com>,
	Veronika Molnarova <vmolnaro@redhat.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1 next] perf libunwind: Fixup conversion
 perf_sample->user_regs to a pointer
Message-ID: <Z89m67GyL88ctvO7@google.com>
References: <20250307153448.250871-1-acme@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250307153448.250871-1-acme@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_152550_444183_E65C288A 
X-CRM114-Status: GOOD (  26.02  )
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

On Fri, Mar 07, 2025 at 12:34:48PM -0300, Arnaldo Carvalho de Melo wrote:
> From: Arnaldo Carvalho de Melo <acme@redhat.com>
> 
> The dc6d2bc2d893a878 ("perf sample: Make user_regs and intr_regs optional") misses
> the changes to a file, resulting in this problem:
> 
>   $ make LIBUNWIND=1 -C tools/perf O=/tmp/build/perf-tools-next install-bin
>   <SNIP>
>     CC      /tmp/build/perf-tools-next/util/unwind-libunwind-local.o
>     CC      /tmp/build/perf-tools-next/util/unwind-libunwind.o
>   <SNIP>
>   util/unwind-libunwind-local.c: In function ‘access_mem’:
>   util/unwind-libunwind-local.c:582:56: error: ‘ui->sample->user_regs’ is a pointer; did you mean to use ‘->’?
>     582 |         if (__write || !stack || !ui->sample->user_regs.regs) {
>         |                                                        ^
>         |                                                        ->
>   util/unwind-libunwind-local.c:587:38: error: passing argument 2 of ‘perf_reg_value’ from incompatible pointer type [-Wincompatible-pointer-types]
>     587 |         ret = perf_reg_value(&start, &ui->sample->user_regs,
>         |                                      ^~~~~~~~~~~~~~~~~~~~~~
>         |                                      |
>         |                                      struct regs_dump **
> <SNIP>
>   ⬢ [acme@toolbox perf-tools-next]$ git bisect bad
>   dc6d2bc2d893a878e7b58578ff01b4738708deb4 is the first bad commit
>   commit dc6d2bc2d893a878e7b58578ff01b4738708deb4 (HEAD)
>   Author: Ian Rogers <irogers@google.com>
>   Date:   Mon Jan 13 11:43:45 2025 -0800
> 
>       perf sample: Make user_regs and intr_regs optional
> 
> Detected using:
> 
>   make -C tools/perf build-test
> 
> Fixes: dc6d2bc2d893a878 ("perf sample: Make user_regs and intr_regs optional")
> Cc: Adrian Hunter <adrian.hunter@intel.com>
> Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> Cc: Andi Kleen <ak@linux.intel.com>
> Cc: Charlie Jenkins <charlie@rivosinc.com>
> Cc: Ian Rogers <irogers@google.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: James Clark <james.clark@linaro.org>
> Cc: John Garry <john.g.garry@oracle.com>
> Cc: Kan Liang <kan.liang@linux.intel.com>
> Cc: Leo Yan <leo.yan@linux.dev>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Michael Petlan <mpetlan@redhat.com>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Tavian Barnes <tavianator@tavianator.com>
> Cc: Veronika Molnarova <vmolnaro@redhat.com>
> Cc: coresight@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> ---
>  tools/perf/util/unwind-libunwind-local.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/perf/util/unwind-libunwind-local.c b/tools/perf/util/unwind-libunwind-local.c
> index 16c2b03831f39afc..cc0e41f2c2f2ef10 100644
> --- a/tools/perf/util/unwind-libunwind-local.c
> +++ b/tools/perf/util/unwind-libunwind-local.c
> @@ -579,12 +579,12 @@ static int access_mem(unw_addr_space_t __maybe_unused as,
>  	int ret;
>  
>  	/* Don't support write, probably not needed. */
> -	if (__write || !stack || !ui->sample->user_regs.regs) {
> +	if (__write || !stack || !ui->sample->user_regs->regs) {

The sample->user_regs can be NULL and I guess it's only allocated when
it has some regs.  Then probably it should be like:

	if (__write || !stack || !ui->sample->user_regs) {


>  		*valp = 0;
>  		return 0;
>  	}
>  
> -	ret = perf_reg_value(&start, &ui->sample->user_regs,
> +	ret = perf_reg_value(&start, perf_sample__user_regs(ui->sample),
>  			     perf_arch_reg_sp(arch));
>  	if (ret)
>  		return ret;
> @@ -628,7 +628,7 @@ static int access_reg(unw_addr_space_t __maybe_unused as,
>  		return 0;
>  	}
>  
> -	if (!ui->sample->user_regs.regs) {
> +	if (!ui->sample->user_regs->regs) {

Ditto.


>  		*valp = 0;
>  		return 0;
>  	}
> @@ -637,7 +637,7 @@ static int access_reg(unw_addr_space_t __maybe_unused as,
>  	if (id < 0)
>  		return -EINVAL;
>  
> -	ret = perf_reg_value(&val, &ui->sample->user_regs, id);
> +	ret = perf_reg_value(&val, perf_sample__user_regs(ui->sample), id);
>  	if (ret) {
>  		if (!ui->best_effort)
>  			pr_err("unwind: can't read reg %d\n", regnum);
> @@ -741,7 +741,7 @@ static int get_entries(struct unwind_info *ui, unwind_entry_cb_t cb,
>  	unw_cursor_t c;
>  	int ret, i = 0;
>  
> -	ret = perf_reg_value(&val, &ui->sample->user_regs,
> +	ret = perf_reg_value(&val, perf_sample__user_regs(ui->sample),
>  			     perf_arch_reg_ip(arch));
>  	if (ret)
>  		return ret;
> @@ -808,7 +808,7 @@ static int _unwind__get_entries(unwind_entry_cb_t cb, void *arg,
>  		.best_effort  = best_effort
>  	};
>  
> -	if (!data->user_regs.regs)
> +	if (!data->user_regs->regs)

Ditto.

Thanks,
Namhyung


>  		return -EINVAL;
>  
>  	if (max_stack <= 0)
> -- 
> 2.47.0
> 

