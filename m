Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD37C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 07:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExZ8NmDYOFOFwFTOaNdmOxwrV4eY5N/56T75mPWrWPE=; b=48tIZmaonafKYNzoMOE3vcYJEP
	BXmJZBnRHFp1WzMjSqemowB4x20zT1FDJmx6S0qBpaCkjCwozY/8Z6dme5ZlsnSD9W9YSN2LhaJjl
	4RhWFfrqBsjWYQmA7Zp3/vcJWKG/hnYiLFUK5Nn1gk+h7Z7YC5nY79diu0Xgy48BjG8s84Ik68wnk
	xUeDAU1S1Gl8kEuRYEhD1dtOtPnn7/eWArRHI6PoOv/6tNVYln2UlfttJ4Gc0HNDYMilpd8xCuH0o
	m9/UsyLj4EGyrAucIqaBUr14mMk2eF6WNdXJ5Il7yxTBSE5nQa+pcarJkII1Wn1RCaT8udEYuyg2H
	Ki1o01kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVHB-00000004FnS-2eUm;
	Tue, 01 Jul 2025 07:19:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUWo-000000049pq-28g8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:31:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A35B85C20F0;
	Tue,  1 Jul 2025 06:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA917C4CEEB;
	Tue,  1 Jul 2025 06:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751351497;
	bh=vxtng46Zkrgb6pbHnrLeH4QC3wxfXfI8X/RlF6fD+54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xa70FacU/nH4ycAz32cK1j+CNRDcOTKAPpFV6yg9gpJG/X7BpIwRNALXMP4lLeNo5
	 uUsbosneGZUgg8JE9+/vot7FWTRq2AfOPXmgFccMuuilEcxda0n1YX11ab5v2ayUKA
	 esmT9oVr2QwC9XpWFcG4+q2qyt2UGQmJKExnWqMzL5UwvLlDuZ5TbBZyByBHVryshf
	 Ip2XBgQh8HKLIoJzTFvmOSwX1D5nBypyuVuNhLvcAgxK+6MLaJGsRE8jFToWXEYdSb
	 F1HoVU/9xO8c17NcEWA1zC51p0IpKcN1S2wppjoRMeoNoBHNSoAXZRos3WMCHkYiHT
	 iEY9tzeUuvINA==
Date: Mon, 30 Jun 2025 23:31:34 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>,
	Graham Woodward <graham.woodward@arm.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Zhongqiu Han <quic_zhonhan@quicinc.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Athira Rajeev <atrajeev@linux.ibm.com>,
	Kajol Jain <kjain@linux.ibm.com>, Li Huafei <lihuafei1@huawei.com>,
	"Steinar H. Gunderson" <sesse@google.com>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Chun-Tse Shao <ctshao@google.com>, Yujie Liu <yujie.liu@intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Levi Yun <yeoreum.yun@arm.com>, Howard Chu <howardchu95@gmail.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Thomas Falcon <thomas.falcon@intel.com>,
	Matt Fleming <matt@readmodwrite.com>,
	Veronika Molnarova <vmolnaro@redhat.com>,
	Krzysztof =?utf-8?Q?=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>,
	Zixian Cai <fzczx123@gmail.com>,
	Steve Clevenger <scclevenger@os.amperecomputing.com>,
	Ben Gainey <ben.gainey@arm.com>,
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
	Martin Liska <martin.liska@hey.com>,
	Martin =?utf-8?B?TGnFoWth?= <m.liska@foxlink.cz>,
	Song Liu <song@kernel.org>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 11/23] perf evlist: Change env variable to session
Message-ID: <aGOAxhqOGzCgKnbq@google.com>
References: <20250628045017.1361563-1-irogers@google.com>
 <20250628045017.1361563-12-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250628045017.1361563-12-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_233138_630901_FE7822EE 
X-CRM114-Status: GOOD (  21.49  )
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

On Fri, Jun 27, 2025 at 09:50:05PM -0700, Ian Rogers wrote:
> The session holds a perf_env pointer env. In UI code container_of is
> used to turn the env to a session, but this assumes the session
> header's env is in use. Rather than a dubious container_of, hold the
> session in the evlist and derive the env from the session with
> evsel__env, perf_session__env, etc.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/builtin-report.c      |  6 +++++-
>  tools/perf/builtin-script.c      |  2 +-
>  tools/perf/builtin-top.c         |  2 +-
>  tools/perf/tests/topology.c      |  1 +
>  tools/perf/ui/browser.h          |  4 ++--
>  tools/perf/ui/browsers/header.c  |  4 +---
>  tools/perf/ui/browsers/hists.c   |  2 +-
>  tools/perf/util/amd-sample-raw.c |  2 +-
>  tools/perf/util/arm-spe.c        |  2 +-
>  tools/perf/util/evlist.h         |  2 +-
>  tools/perf/util/evsel.c          | 12 +++++++++---
>  tools/perf/util/evsel.h          |  1 +
>  tools/perf/util/header.c         |  2 +-
>  tools/perf/util/s390-cpumsf.c    |  2 +-
>  tools/perf/util/sample-raw.c     |  7 ++++---
>  tools/perf/util/sample-raw.h     |  2 +-
>  tools/perf/util/session.c        |  4 +++-
>  17 files changed, 35 insertions(+), 22 deletions(-)
> 
> diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
> index 704576e46e4b..ada8e0166c78 100644
> --- a/tools/perf/builtin-report.c
> +++ b/tools/perf/builtin-report.c
> @@ -1274,6 +1274,8 @@ static int process_attr(const struct perf_tool *tool __maybe_unused,
>  			union perf_event *event,
>  			struct evlist **pevlist)
>  {
> +	struct perf_session *session;
> +	struct perf_env *env;
>  	u64 sample_type;
>  	int err;
>  
> @@ -1286,7 +1288,9 @@ static int process_attr(const struct perf_tool *tool __maybe_unused,
>  	 * on events sample_type.
>  	 */
>  	sample_type = evlist__combined_sample_type(*pevlist);
> -	callchain_param_setup(sample_type, perf_env__arch((*pevlist)->env));
> +	session = (*pevlist)->session;
> +	env = perf_session__env(session);
> +	callchain_param_setup(sample_type, perf_env__arch(env));
>  	return 0;
>  }
>  
> diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
> index 8a452353c867..2c25eda4be26 100644
> --- a/tools/perf/builtin-script.c
> +++ b/tools/perf/builtin-script.c
> @@ -2535,7 +2535,7 @@ static int process_attr(const struct perf_tool *tool, union perf_event *event,
>  	 * on events sample_type.
>  	 */
>  	sample_type = evlist__combined_sample_type(evlist);
> -	callchain_param_setup(sample_type, perf_env__arch((*pevlist)->env));
> +	callchain_param_setup(sample_type, perf_env__arch(perf_session__env(scr->session)));
>  
>  	/* Enable fields for callchain entries */
>  	if (symbol_conf.use_callchain &&
> diff --git a/tools/perf/builtin-top.c b/tools/perf/builtin-top.c
> index 84b223a94dcf..72f9be5a3b30 100644
> --- a/tools/perf/builtin-top.c
> +++ b/tools/perf/builtin-top.c
> @@ -1654,7 +1654,6 @@ int cmd_top(int argc, const char **argv)
>  			"Couldn't read the cpuid for this machine: %s\n",
>  			str_error_r(errno, errbuf, sizeof(errbuf)));
>  	}
> -	top.evlist->env = &perf_env;
>  
>  	argc = parse_options(argc, argv, options, top_usage, 0);
>  	if (argc)
> @@ -1822,6 +1821,7 @@ int cmd_top(int argc, const char **argv)
>  		perf_top__update_print_entries(&top);
>  		signal(SIGWINCH, winch_sig);
>  	}
> +	top.session->env = &perf_env;

Looks like it's accessing top.session before it's created?

Thanks,
Namhyung

>  
>  	top.session = perf_session__new(NULL, NULL);
>  	if (IS_ERR(top.session)) {

