Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AF6C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 06:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQkYpa8xixAjchEoiIh2Oabtnmxu12nf5M5OZoagmfU=; b=OPU/PBR30ilpS7xIJOddLqRDsZ
	DcRMkHj1RvQqKhnzsFgUjSzez3gezfFtD6HNCf5W+D3i0MqmUBTa8BLcHx4Owmm51otHgHAa2BZDd
	FtDFvgue2G2BU+BtmvttW5Y3hPFsJhWUc1g+2B7DhGV+kpt0qQP5X3D254l5OqTD0yp18wq6JOlBT
	/baXSd3oC6rwUhtQlwwyANuJGB/OalvDb+mE6b41u66mTYgHKHiUcILq3Yao32kgAuDti5hdnBGc4
	8rgvLxCRll3L3kn2zfdol5kJTRoq8aKZr/KEYJ9txkYti2gxm2pHlxQLFkAM2xFI5tgEdLQe+QBDF
	3V6EKMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUpe-00000004Ctn-1qU7;
	Tue, 01 Jul 2025 06:51:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUPM-000000048VG-0O10
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:23:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13E62A50BA0;
	Tue,  1 Jul 2025 06:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093AAC4CEEB;
	Tue,  1 Jul 2025 06:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751351034;
	bh=4i2k8Kls+ue/tzY9XkDvo0G/r5OHrsZEyH8rZH7yUXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j5LfUCQYiCuKVcCGZL1M/sTm07QuKc8OJiWsKbAl7EE8dK6e7X0ErlNehuLyPbspK
	 Bbh8tnUD/9x2eQa/9080LpvNadxyHOt/zRwWNd5kMzjGQBNzGjCkQMzgV7CSNaQdoy
	 MEr7Q076FsjpmKODf9sNK22vOvqTE/MQv3y9+A0NQgwyOmTJgJZojRuCjZPxdJ3+y6
	 83q93N9ZbaDmU+fjgxZUkPQUbOcYT1wwW8074i4bKN3KPI7xFWIzPXmqpMp9he3KyQ
	 Q5jcjbb6V/UflGQyoy0RepiiEBxUBgZXFmhOkXijBYzdZyT15s7dg+HH9YGiyQNbsI
	 S8tqO/fnDHwsA==
Date: Mon, 30 Jun 2025 23:23:51 -0700
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
Subject: Re: [PATCH v5 23/23] perf sort: Use perf_env to set arch sort keys
 and header
Message-ID: <aGN-9079q9sQaW8s@google.com>
References: <20250628045017.1361563-1-irogers@google.com>
 <20250628045017.1361563-24-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250628045017.1361563-24-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_232356_256315_B3B791E8 
X-CRM114-Status: GOOD (  15.38  )
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

On Fri, Jun 27, 2025 at 09:50:17PM -0700, Ian Rogers wrote:
> Previously arch_support_sort_key and arch_perf_header_entry used a
> weak symbol to compile as appropriate for x86 and powerpc. A
> limitation to this is that the handling of a data file could vary in
> cross-platform development. Change to using the perf_env of the
> current session to determine the architecture kind and set the sort
> key and header entries as appropriate.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
[SNIP]
> diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
> index ada8e0166c78..6f24540bdee9 100644
> --- a/tools/perf/builtin-report.c
> +++ b/tools/perf/builtin-report.c
> @@ -1790,7 +1790,7 @@ int cmd_report(int argc, const char **argv)
>  	}
>  
>  	if ((last_key != K_SWITCH_INPUT_DATA && last_key != K_RELOAD) &&
> -	    (setup_sorting(session->evlist) < 0)) {
> +	    (setup_sorting(session->evlist, &session->header.env) < 0)) {

					    perf_session__env(session) ?

Thanks,
Namhyung


>  		if (sort_order)
>  			parse_options_usage(report_usage, options, "s", 1);
>  		if (field_order)

