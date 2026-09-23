Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA13DC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpSnW0tcXE8Wun87Oph/D5qXO4sz73FbBK/xJn2RUgs=; b=OKaEbwSaXVTkoDbiY0iNt9GX6x
	W7kmHR/wsRzJV8FlrGdeOK3lFCGypAwAnDNNeR24xBHtZbH/mHObm7CbmPE7KVKtGbHA0Vkg2WJ/D
	KKVuczH2UXkM40wkXizMSj+rCxBNcdiQ9qnf0P1oWmZu2AI6XwdGio0C/tP4TBYIvkYGZjg7J65fq
	xbEoVuXo/Nq8LGa9sW4SNCQRx02gDbjaAKU7tffByTzNwgsEJkxyrI9PCraMP2qOxOGH5ntFQAlXH
	QcfsT15JITf2rqLtaIwO4uSz9rsCP8J7rNb8Hr2j8sHWVufcsMWfTVr45YisycF7n+mE5kft2pmjk
	bW3MyCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jcd-00000007nxG-0YB1;
	Wed, 23 Sep 2026 09:50:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JcD-00000007npu-0dhy
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 09:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VpSnW0tcXE8Wun87Oph/D5qXO4sz73FbBK/xJn2RUgs=; b=Kzg3VwFyyKI/FWYmFCkZYosU9V
	zolreXvN16jBEa1HkB2teV12avbKUQRJVEjMlteAjzaHwpVq+0EbS56/AjuSl/dt1ZQFJZvWFt3c1
	i0XffPnfGfCQhFIgnzz2duWaux+zYCW94fVZMobEGdpZ1CexZEzD7NNdlOshFN2OVrZ1QvJkp4E4b
	755nYmLVcIeKXZ2Fs1SdMpiYwRNZ6gMtTjsPFnhDuESqROBp3IO6KO+3r/zxrsLG+JaPGqsnkjau8
	Q4okzdCqx/AHDaUodRfNEHqnLkRC31/DAZZUS0TqdycO6SdPFQmdemwzglKF5NneGkJiFIiwcRdpP
	yNkwuo2g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Jc5-0000000Ebo0-2WA3;
	Wed, 23 Sep 2026 09:50:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 428313005E0; Wed, 23 Sep 2026 11:50:04 +0200 (CEST)
Date: Wed, 23 Sep 2026 11:50:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Usama Arif <usama.arif@linux.dev>, Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] perf/core: sched_task() dispatch and branch entry
 fixes
Message-ID: <20260923095004.GG2009045@noisy.programming.kicks-ass.net>
References: <20260810133540.1947118-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810133540.1947118-1-puranjay@kernel.org>
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

On Mon, Aug 10, 2026 at 06:35:33AM -0700, Puranjay Mohan wrote:

> Puranjay Mohan (3):
>   perf/core: Fix NULL pmu_ctx passed to pmu->sched_task()
>   perf/core: Run sched_task() for PMUs with only CPU-wide events
>   perf/core: Fill branch entries with a single assignment
> 
>  arch/x86/events/amd/brs.c   |  9 +++--
>  arch/x86/events/amd/lbr.c   | 16 ++++-----
>  arch/x86/events/intel/lbr.c | 65 ++++++++++++++++++++-----------------
>  drivers/perf/arm_brbe.c     |  2 +-
>  include/linux/perf_event.h  | 17 ----------
>  kernel/events/core.c        | 15 ++++++---
>  6 files changed, 58 insertions(+), 66 deletions(-)
> 

Found this series ... I'll feed it to the robots and barring them
screaming I'll push it out to -tip.

