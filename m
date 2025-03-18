Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8F2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 18:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nsv268yhHZH6nOUDDhUedPSmw3/1fPp59OIh7Ku38B8=; b=r6Un6bxZ5cjeoyRsvTTbQRLe2h
	8ViiVu6xfpw7XVjRiFophvzUtlEzt+nlyJnNY8DUTOcqV9mgLEwk63TAnYhatKJPK+JZ61Hc+CuXH
	jGyC3NGFqjOS4iU5ee7gRSfmOeSx22rVZTxP5gzTw3+6FW/XW86SvNzbI6/r6QaU4QWJXcVG1Fypc
	xQmgRIgzqeOoqUOoMmWZYF4KJFM47GBXqg0swkHnWL9Fm0n6/vnfIXSUhN00O/UlbqOewzOw5ALwb
	GmyaWS/VW7O80/4wjawKeS0r5qtvmBHQDlRHnygosJqX0DTfWcK3BxhaVLUQZGo21Ljlzl4qBbA2t
	OTAZ2MlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tubJN-00000006kxZ-3WVj;
	Tue, 18 Mar 2025 18:05:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tubGc-00000006kY5-47rb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 18:02:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4338CA48D0D;
	Tue, 18 Mar 2025 17:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF070C4CEDD;
	Tue, 18 Mar 2025 18:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742320937;
	bh=wjs6vsTclECnstXx8XOME5Hl6++49dOy3x3tajN/WcI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LU+huyz5q4ilqnOnsXZfx1o3lPLWz64FrTbQGks+ujxYQArHhAdfVyCaMvFPI/abz
	 wVGcuNTFBCu8kD8YQoSDpmgUq6MBemSa7h7LHR4rEGMRm4heLqWUNEuleUnQbtMJTn
	 j4IDZsHA1eJEMjoj4aVYUYLmUTH9k3QRYPH4FvZFgJj9EfCB6o06D0f5qfAHAHvN+m
	 HYJf04XpqTHDDpqx6WJtfXM8xslv53JS4UxChLtTm2uvOJcDspVxz5Gy2bXGFNVS1G
	 rxLFFOcNjJg6hc3YO9mx1F2SbA8d975siZr7B6f5I3HgZmsYg6pNxVsyO6QRXbrDrX
	 ziESI7x+1tGcA==
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Kan Liang <kan.liang@linux.intel.com>, Yunseong Kim <yskelg@gmail.com>, 
 James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 Andi Kleen <ak@linux.intel.com>, Charlie Jenkins <charlie@rivosinc.com>, 
 John Garry <john.g.garry@oracle.com>, Leo Yan <leo.yan@linux.dev>, 
 Michael Petlan <mpetlan@redhat.com>, 
 Tavian Barnes <tavianator@tavianator.com>, 
 Veronika Molnarova <vmolnaro@redhat.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250313033121.758978-1-irogers@google.com>
References: <20250313033121.758978-1-irogers@google.com>
Subject: Re: [PATCH v2] perf libunwind: Fixup conversion
 perf_sample->user_regs to a pointer
Message-Id: <174232093676.2542685.15670125863336766245.b4-ty@kernel.org>
Date: Tue, 18 Mar 2025 11:02:16 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_110219_085371_D3DC3595 
X-CRM114-Status: GOOD (  10.63  )
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

On Wed, 12 Mar 2025 20:31:21 -0700, Ian Rogers wrote:
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
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



