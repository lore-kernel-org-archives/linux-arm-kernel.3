Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46823C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 06:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHQ6HhuOSZ5FeC+LNjITpI2HOkpHtVVzibOzD0NAQsI=; b=QnvIB//ZOOpbFd/+yDDnfvxR/i
	RrfiE6PhTJPdcBlgYanbORH3cCRyZswXdO2aH/PgW4PrJW05IS0DGgGOt+B3wIUzzl74hPbdBgvaa
	4o4UPjikRELpBXI/Q7xM9/Wol78roBVKSYrQMy6tVFDk7p3oo+hYg6MaLmuzcYUXTrr/8XmQbcHHr
	0tqwgnWU5T6POYjDlunzR8G/2AmaZZLUmK5nBqYBmoFACpZEyVU3aB/+9bdjM4kwS6ajOg+cpaYGd
	JjoQFAUScRSYIzdQsP3vZBV/UVWgrAa5ke+WbF4HjuhFTs1byiUZn5sGVTNepQ10CY6mkNC9PvLeG
	BQNDq4rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUA6-000000046ZJ-21Gr;
	Tue, 01 Jul 2025 06:08:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWU7l-0000000469p-0WNk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:05:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DFF9DA50542;
	Tue,  1 Jul 2025 06:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE12CC4CEEB;
	Tue,  1 Jul 2025 06:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751349943;
	bh=5wxaXCZgzcsOdU2YdEfVEPx37l7c81hL3jRM5rarvbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Icn2+5KX57HRZwT5+1VGTOQCeQNj7UvRQ1GCzOQXSWdK6KsMrm2Fja5AZMUgspLAS
	 JmTY4hIHuEUR+Ay7H39x6XFH1ZxTMKvEkZ3Xb7uB4Cd7xoF96Iy0uizi6ENT6gyQpU
	 IZ8ACk5hRfSAZ2PHpWdm7NUTuz1oND+KF8ZndKkiZhtnTDVsg6DcZKtdpYCJ6+zcyI
	 +hVc1FNKtGtv2gh4eHfU7IHY1CHQJvkEy8OB+KWu5Gr3ZvmqMLcqd/na8D+x9rhORE
	 Q/EHI+Wfz70CGui1wd2uWR5lFuKVFAjBTtU7JqAwukkwxQDhzgc+YiBzIPsxYjYfsJ
	 or68BrKQcPnkA==
Date: Mon, 30 Jun 2025 23:05:40 -0700
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
Subject: Re: [PATCH v5 16/23] perf bench synthesize: Avoid use of global
 perf_env
Message-ID: <aGN6tPDP50RrNTnq@google.com>
References: <20250628045017.1361563-1-irogers@google.com>
 <20250628045017.1361563-17-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250628045017.1361563-17-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_230545_354883_2B5E3E63 
X-CRM114-Status: GOOD (  22.42  )
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

On Fri, Jun 27, 2025 at 09:50:10PM -0700, Ian Rogers wrote:
> The benchmark doesn't use a data file and so the header perf_env isn't
> used. Stack allocate a host perf_env for use to avoid the use of the
> global perf_env.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/bench/synthesize.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/perf/bench/synthesize.c b/tools/perf/bench/synthesize.c
> index 9b333276cbdb..79d99ba50284 100644
> --- a/tools/perf/bench/synthesize.c
> +++ b/tools/perf/bench/synthesize.c
> @@ -114,10 +114,13 @@ static int run_single_threaded(void)
>  		.pid = "self",
>  	};
>  	struct perf_thread_map *threads;
> +	struct perf_env host_env;
>  	int err;
>  
>  	perf_set_singlethreaded();
> -	session = perf_session__new(NULL, NULL);
> +	perf_env__init(&host_env);
> +	session = __perf_session__new(/*data=*/NULL, /*tool=*/NULL,
> +				      /*trace_event_repipe=*/false, &host_env);
>  	if (IS_ERR(session)) {
>  		pr_err("Session creation failed.\n");
>  		return PTR_ERR(session);

Missing perf_env__exit() ?


> @@ -144,6 +147,7 @@ static int run_single_threaded(void)
>  		perf_thread_map__put(threads);
>  
>  	perf_session__delete(session);
> +	perf_env__exit(&host_env);
>  	return err;
>  }
>  
> @@ -154,17 +158,21 @@ static int do_run_multi_threaded(struct target *target,
>  	u64 runtime_us;
>  	unsigned int i;
>  	double time_average, time_stddev, event_average, event_stddev;
> -	int err;
> +	int err = 0;
>  	struct stats time_stats, event_stats;
>  	struct perf_session *session;
> +	struct perf_env host_env;
>  
> +	perf_env__init(&host_env);
>  	init_stats(&time_stats);
>  	init_stats(&event_stats);
>  	for (i = 0; i < multi_iterations; i++) {
> -		session = perf_session__new(NULL, NULL);
> -		if (IS_ERR(session))
> -			return PTR_ERR(session);
> -
> +		session = __perf_session__new(/*data=*/NULL, /*tool=*/NULL,
> +					      /*trace_event_repipe=*/false, &host_env);
> +		if (IS_ERR(session)) {
> +			err = PTR_ERR(session);
> +			goto err_out;
> +		}
>  		atomic_set(&event_count, 0);
>  		gettimeofday(&start, NULL);
>  		err = __machine__synthesize_threads(&session->machines.host,
> @@ -173,10 +181,8 @@ static int do_run_multi_threaded(struct target *target,
>  						process_synthesized_event,
>  						true, false,
>  						nr_threads_synthesize);
> -		if (err) {
> -			perf_session__delete(session);
> -			return err;
> -		}
> +		if (err)
> +			goto err_out;

Missing perf_session__delete() ?


>  
>  		gettimeofday(&end, NULL);
>  		timersub(&end, &start, &diff);
> @@ -198,7 +204,9 @@ static int do_run_multi_threaded(struct target *target,
>  
>  	printf("    Average time per event %.3f usec\n",
>  		time_average / event_average);
> -	return 0;
> +err_out:
> +	perf_env__exit(&host_env);
> +	return err;
>  }
>  
>  static int run_multi_threaded(void)
> -- 
> 2.50.0.727.gbf7dc18ff4-goog
> 

