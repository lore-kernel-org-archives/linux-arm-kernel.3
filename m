Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B239BC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 07:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOQ0x/2oKyRh1TPER0TpmKwobVscdzyBFwNCPo3wYIU=; b=fecHygwf/d9KpeI+41EyjgQ5KJ
	LpmDXIC1zUkmaXv6FFNAefsZRrufrvK1h1ET8+E3Gcr/JCCIXdYIN5CRvEkTmDXSq+u2pY2doVJIJ
	rAWKN5n/gH9ZWcWR/WufcT/dSDJODAwsINhosHys9paAFA9qg/E+51BfghYkdd0iSMgVFUOW72ePK
	BQ52XdfTESkPlGhf927Kj8g3irMSh5T96fRf8hIcUMRpnY3rXLlUkcmLowDHFyFJR2iVHnAWUTPdi
	psWLGLkM8hCxh+rzzUM1ponVent4Qv3XF7w7Ql5RnB8IK+hzk+5E8+eABeW2C31MrHWkRcxdpSvYU
	zcXGLhIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVCb-00000004FJO-1wjQ;
	Tue, 01 Jul 2025 07:14:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUSb-0000000495G-0hG2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:27:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3455760053;
	Tue,  1 Jul 2025 06:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23714C4CEEB;
	Tue,  1 Jul 2025 06:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751351235;
	bh=EVqZ5AXgN+Lqg5d4ako7k4AxyCn3s4HtFBq5nXm8ww4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m2MTiFafr+Bb7phzcdlc8BYCSyf2gRzghdPPMWyhLwl5KMpPhehDIwesSV+U402vW
	 M1peJ9nnjknmCW/NF+SaoPDC+hEL6e1FEeodSiuTudcI/GptQdfQK/4T8IhiWyy4dW
	 GVpVdPtQj9FewVwR+MwqWtKALjd4PSNmxxZgQDw7x4ppCTdXoEYLAHLME+eW/s7vXd
	 jE9yHrH9Lkr/G+gu/CTSCQRpkIft1sOAMMOWIJCyLNpKWEPqquO47G6WX6U8cad29Y
	 uEgL2MrINmz48RtA/sj1che6hUUa+Dl8pLhRSEllKKTwvJRRWaYoT6DitmvdeVJigO
	 nWJn8OT293EcA==
Date: Mon, 30 Jun 2025 23:27:12 -0700
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
Subject: Re: [PATCH v5 10/23] perf session: Add an env pointer for the
 current perf_env
Message-ID: <aGN_wBXVt6YN4Itb@google.com>
References: <20250628045017.1361563-1-irogers@google.com>
 <20250628045017.1361563-11-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250628045017.1361563-11-irogers@google.com>
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

On Fri, Jun 27, 2025 at 09:50:04PM -0700, Ian Rogers wrote:
> Initialize to `&header.env`. This will later allow the env value to be
> changed.

I'm curious when it is changed.

Thanks,
Namhyung

> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/util/session.c | 3 ++-
>  tools/perf/util/session.h | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
> index b09d157f7d04..e39a1df7c044 100644
> --- a/tools/perf/util/session.c
> +++ b/tools/perf/util/session.c
> @@ -156,6 +156,7 @@ struct perf_session *__perf_session__new(struct perf_data *data,
>  			     ordered_events__deliver_event, NULL);
>  
>  	perf_env__init(&session->header.env);
> +	session->env = &session->header.env;
>  	if (data) {
>  		ret = perf_data__open(data);
>  		if (ret < 0)
> @@ -2750,5 +2751,5 @@ int perf_session__dsos_hit_all(struct perf_session *session)
>  
>  struct perf_env *perf_session__env(struct perf_session *session)
>  {
> -	return &session->header.env;
> +	return session->env;
>  }
> diff --git a/tools/perf/util/session.h b/tools/perf/util/session.h
> index e7f7464b838f..088868f1004a 100644
> --- a/tools/perf/util/session.h
> +++ b/tools/perf/util/session.h
> @@ -45,6 +45,8 @@ struct perf_session {
>  	struct perf_header	header;
>  	/** @machines: Machines within the session a host and 0 or more guests. */
>  	struct machines		machines;
> +	/** @env: The perf_env being worked with, either from a data file or the host's. */
> +	struct perf_env		*env;
>  	/** @evlist: List of evsels/events of the session. */
>  	struct evlist	*evlist;
>  	/** @auxtrace: callbacks to allow AUX area data decoding. */
> -- 
> 2.50.0.727.gbf7dc18ff4-goog
> 

