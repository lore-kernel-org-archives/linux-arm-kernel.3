Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48A3C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 01:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekZx8lGcrjHW43hl0G7MTcPghlPI8gy2sfoZI2Ifwvs=; b=R0FkeYZxBVvMrpVxh6CJJy/AbV
	S/tOJim2sKmYuF77ONRtHXQHGZYXhWbaLeSAG5THvW/FwMLf90TBl8ZaBFE+zSL0KXssX/9NwD8BQ
	t64rtLBMWn19xq5vinoG8LdZH7a0ysBkwp80TvKONjJVy6RJKdWQ3W/eMPD9CDxH+tVnD6Xza8n+0
	GV0/hieViB2/xqC6C39VXHL392Z8+QNTWUov0X1pWXQHOSI8xQB3VQSBrEfYCPbBVmBhHZLv7cRTM
	qiHlYXYSuCD0hSqIyGCJiE4PW7Mb5bghmstqFW2RCB+LSTAIScrx271oseKHs1LCKSuZ5sS+IBfnJ
	cyWMnXKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttG5y-0000000FeFr-2dQn;
	Sat, 15 Mar 2025 01:13:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttG4I-0000000FeAA-1syf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 01:12:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D62DE5C4CEA;
	Sat, 15 Mar 2025 01:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E22C4CEE3;
	Sat, 15 Mar 2025 01:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742001121;
	bh=VxVUeQhVDSDp3eITSl7EuMQGY6SLNqQttr8K5TBU5UU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NcPBYv+w5et57n2X/eulWxinRoNDsQQ5Gpf0iLPNuN+MKseTHDULxnv6jqaolDWtt
	 1HERGD7lzI/xupScsE/DCQR5DOh5iYlHnhAWlktRTiBHIR2x/UAW0H/uOXDRxhQ2om
	 erLQaWCtQFAXRMIwDjBqk3T/DuAvfaxiaEW+DjkEvxn0FrTn50qPGSpRRMR6u9Om7n
	 uvU2yssZZsE8VPdvj74UBKBqMvLMS6aVpXpuKJvp5fwAY01ASZbSaxnziccTAr54Se
	 vWNMAMe7UZJw4kSaEfPPkO3wkm3NLT1GbR6qMFc0ZX34XhSbns8y6S/KS+6sPjxMuw
	 xd7SUxdrB4hrg==
Date: Fri, 14 Mar 2025 18:11:58 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Yunseong Kim <yskelg@gmail.com>,
	James Clark <james.clark@linaro.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Andi Kleen <ak@linux.intel.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	John Garry <john.g.garry@oracle.com>, Leo Yan <leo.yan@linux.dev>,
	Michael Petlan <mpetlan@redhat.com>,
	Tavian Barnes <tavianator@tavianator.com>,
	Veronika Molnarova <vmolnaro@redhat.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] perf libunwind: Fixup conversion
 perf_sample->user_regs to a pointer
Message-ID: <Z9TT3tGq4TJ76Tm9@google.com>
References: <20250313033121.758978-1-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313033121.758978-1-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_181202_569016_D113DDF4 
X-CRM114-Status: GOOD (  24.62  )
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

On Wed, Mar 12, 2025 at 08:31:21PM -0700, Ian Rogers wrote:
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
> Reviewed-by: Ian Rogers <irogers@google.com>

I think you need to add your own Signed-off-by in this case.
I'll change it for you, ok?

Thanks,
Namhyung


> ---
> v2: Ensure user_regs isn't NULL when read, spotted by Namhyung.
> ---
>  tools/perf/util/unwind-libunwind-local.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/perf/util/unwind-libunwind-local.c b/tools/perf/util/unwind-libunwind-local.c
> index 16c2b03831f3..5f4387e2423a 100644
> --- a/tools/perf/util/unwind-libunwind-local.c
> +++ b/tools/perf/util/unwind-libunwind-local.c
> @@ -579,12 +579,12 @@ static int access_mem(unw_addr_space_t __maybe_unused as,
>  	int ret;
>  
>  	/* Don't support write, probably not needed. */
> -	if (__write || !stack || !ui->sample->user_regs.regs) {
> +	if (__write || !stack || !ui->sample->user_regs || !ui->sample->user_regs->regs) {
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
> +	if (!ui->sample->user_regs || !ui->sample->user_regs->regs) {
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
> +	if (!data->user_regs || !data->user_regs->regs)
>  		return -EINVAL;
>  
>  	if (max_stack <= 0)
> -- 
> 2.49.0.rc0.332.g42c0ae87b1-goog
> 

