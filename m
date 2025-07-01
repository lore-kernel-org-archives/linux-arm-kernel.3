Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAA5C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 05:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0X1nMVJj6b9yNlN1TBnnxoz9lqNCQt94xHhb8pBAqoc=; b=dJzm3ksje9FZ6OeadUInXfb/tR
	mHpGVpITTSu3/E/cqJNmNPUfnUEqlyHpk3lK5iaPgJWEgLVRFAkqnVG6x5P6P9/BwkVaJIi0fSGB1
	pdBuMBFQEFIUJOkFtMtp0puReB46uiVdHmPLVbvDEMvZ1EbqME3ceB9wedKQDy2XVrdR2ecU/eR1+
	IGEuBfcpi0b0e6WfSy/uAB5V7WiLtCXAERf5i7yK+mSUMIwTTaAfGQM2v7TKoAkmusO1K11eo8/Bt
	Q/OUGGtO0KGPj/PoTnh/r+z6WFzNpaxEefH5J7+OsW504hCRH5gy1kVhVtndzYd1JuCiRCb1tou7H
	NrcmIy1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWTom-000000044vH-4BCe;
	Tue, 01 Jul 2025 05:46:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWTmP-000000044bw-0LEF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 05:43:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13A86A50553;
	Tue,  1 Jul 2025 05:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E993C4CEEB;
	Tue,  1 Jul 2025 05:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751348619;
	bh=giPZsywmdagr4kvRiGurSj79VhU8gLdO64p2gc9hhy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cAgkZKYuhlaJG6ZtRFebXYb6EHheh0EI3KYS1XzHjO+dkCenj1OPBgKbWrP9s9HPU
	 dIhWWLcNHfP+nGetrGFv3cM3DfZwX5TxYArN+H0iR9eWnUz6Bo/d5uiQl2U4aZxS/E
	 mkYr52AFTmpyn5EmOyjS4yptkdQ4qfjWwPU1bPsN8QJwyJ/cESBaurRzzV6tQLWVuG
	 InMMZHiDjOc5ydQMRIBwPS+uPd9rEEsdvpF1chLW+Q2l3ByFYxpL6D3uDK11SD8v9+
	 XabJjl0PcEn+gsAyKhnH42x1hF190rkvcCQcS+EtlW5bvfXNLh8tpk6fV3TFUiQMOb
	 OMTSmKGQC5jNg==
Date: Mon, 30 Jun 2025 22:43:36 -0700
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
Subject: Re: [PATCH v5 08/23] perf record: Make --buildid-mmap the default
Message-ID: <aGN1iPzoeNVxW5fQ@google.com>
References: <20250628045017.1361563-1-irogers@google.com>
 <20250628045017.1361563-9-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250628045017.1361563-9-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_224341_340635_B7B91751 
X-CRM114-Status: GOOD (  34.66  )
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

On Fri, Jun 27, 2025 at 09:50:02PM -0700, Ian Rogers wrote:
> Support for build IDs in mmap2 perf events has been present since
> Linux v5.12:
> https://lore.kernel.org/lkml/20210219194619.1780437-1-acme@kernel.org/
> Build ID mmap events don't avoid the need to inject build IDs for DSO
> touched by samples as the build ID cache is populated by perf
> record. They can avoid some cases of symbol mis-resolution caused by
> the file system changing from when a sample occurred and when the DSO
> is sought. To disable build ID scanning
> 
> Unlike the --buildid-mmap option, this doesn't disable the build ID
> cache but it does disable the processing of samples looking for DSOs
> to inject build IDs for. To disable the build ID cache the -B
> (--no-buildid) option should be used.

I think we need to add a config option to control this behavior later.
Let me think about this more.

> 
> Making this option the default was raised on the list in:
> https://lore.kernel.org/linux-perf-users/CAP-5=fXP7jN_QrGUcd55_QH5J-Y-FCaJ6=NaHVtyx0oyNh8_-Q@mail.gmail.com/
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/builtin-record.c        | 33 +++++++++++++++++++-----------
>  tools/perf/util/symbol_conf.h      |  2 +-
>  tools/perf/util/synthetic-events.c | 16 +++++++--------
>  3 files changed, 30 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
> index 53971b9de3ba..29428fb8ac67 100644
> --- a/tools/perf/builtin-record.c
> +++ b/tools/perf/builtin-record.c
> @@ -171,6 +171,7 @@ struct record {
>  	bool			no_buildid_cache_set;
>  	bool			buildid_all;
>  	bool			buildid_mmap;
> +	bool			buildid_mmap_set;
>  	bool			timestamp_filename;
>  	bool			timestamp_boundary;
>  	bool			off_cpu;
> @@ -1811,6 +1812,7 @@ record__finish_output(struct record *rec)
>  			data->dir.files[i].size = lseek(data->dir.files[i].fd, 0, SEEK_CUR);
>  	}
>  
> +	/* Buildid scanning disabled or build ID in kernel and synthesized map events. */
>  	if (!rec->no_buildid) {
>  		process_buildids(rec);
>  
> @@ -3005,6 +3007,8 @@ static int perf_record_config(const char *var, const char *value, void *cb)
>  			rec->no_buildid = true;
>  		else if (!strcmp(value, "mmap"))
>  			rec->buildid_mmap = true;
> +		else if (!strcmp(value, "no-mmap"))
> +			rec->buildid_mmap = false;
>  		else
>  			return -1;
>  		return 0;
> @@ -3411,6 +3415,7 @@ static struct record record = {
>  		.synth               = PERF_SYNTH_ALL,
>  		.off_cpu_thresh_ns   = OFFCPU_THRESH,
>  	},
> +	.buildid_mmap = true,
>  };
>  
>  const char record_callchain_help[] = CALLCHAIN_RECORD_HELP
> @@ -3577,8 +3582,8 @@ static struct option __record_options[] = {
>  		   "file", "vmlinux pathname"),
>  	OPT_BOOLEAN(0, "buildid-all", &record.buildid_all,
>  		    "Record build-id of all DSOs regardless of hits"),
> -	OPT_BOOLEAN(0, "buildid-mmap", &record.buildid_mmap,
> -		    "Record build-id in map events"),
> +	OPT_BOOLEAN_SET(0, "buildid-mmap", &record.buildid_mmap, &record.buildid_mmap_set,
> +			"Legacy record build-id in map events option which is now the default. Behaves indentically to --no-buildid. Disable with --no-buildid-mmap"),

Looks too long.  Maybe just like below:
  "Record build-id in mmap events and skip build-id processing."

The detailed explanation can go to the documentation.


>  	OPT_BOOLEAN(0, "timestamp-filename", &record.timestamp_filename,
>  		    "append timestamp to output filename"),
>  	OPT_BOOLEAN(0, "timestamp-boundary", &record.timestamp_boundary,
> @@ -4108,19 +4113,23 @@ int cmd_record(int argc, const char **argv)
>  		record.opts.record_switch_events = true;
>  	}
>  
> +	if (!rec->buildid_mmap) {
> +		pr_debug("Disabling build id in synthesized mmap2 events.\n");
> +		symbol_conf.no_buildid_mmap2 = true;
> +	} else if (rec->buildid_mmap_set) {
> +		/*
> +		 * Explicitly passing --buildid-mmap disables buildid processing
> +		 * and cache generation.
> +		 */
> +		rec->no_buildid = true;
> +	}
> +	if (rec->buildid_mmap && !perf_can_record_build_id()) {
> +		pr_warning("Missing support for build id in kernel mmap events. Disable this warning with --no-buildid-mmap\n");

This can be in two lines.  I can make the changes if you're ok.

Thanks,
Namhyung


> +		rec->buildid_mmap = false;
> +	}
>  	if (rec->buildid_mmap) {
> -		if (!perf_can_record_build_id()) {
> -			pr_err("Failed: no support to record build id in mmap events, update your kernel.\n");
> -			err = -EINVAL;
> -			goto out_opts;
> -		}
> -		pr_debug("Enabling build id in mmap2 events.\n");
> -		/* Enable mmap build id synthesizing. */
> -		symbol_conf.buildid_mmap2 = true;
>  		/* Enable perf_event_attr::build_id bit. */
>  		rec->opts.build_id = true;
> -		/* Disable build id cache. */
> -		rec->no_buildid = true;
>  	}
>  
>  	if (rec->opts.record_cgroup && !perf_can_record_cgroup()) {
> diff --git a/tools/perf/util/symbol_conf.h b/tools/perf/util/symbol_conf.h
> index cd9aa82c7d5a..7a80d2c14d9b 100644
> --- a/tools/perf/util/symbol_conf.h
> +++ b/tools/perf/util/symbol_conf.h
> @@ -43,7 +43,7 @@ struct symbol_conf {
>  			report_individual_block,
>  			inline_name,
>  			disable_add2line_warn,
> -			buildid_mmap2,
> +			no_buildid_mmap2,
>  			guest_code,
>  			lazy_load_kernel_maps,
>  			keep_exited_threads,
> diff --git a/tools/perf/util/synthetic-events.c b/tools/perf/util/synthetic-events.c
> index 69b98023ce74..638d7dd7fa4b 100644
> --- a/tools/perf/util/synthetic-events.c
> +++ b/tools/perf/util/synthetic-events.c
> @@ -532,7 +532,7 @@ int perf_event__synthesize_mmap_events(const struct perf_tool *tool,
>  		event->mmap2.pid = tgid;
>  		event->mmap2.tid = pid;
>  
> -		if (symbol_conf.buildid_mmap2)
> +		if (!symbol_conf.no_buildid_mmap2)
>  			perf_record_mmap2__read_build_id(&event->mmap2, machine, false);
>  
>  		if (perf_tool__process_synth_event(tool, event, machine, process) != 0) {
> @@ -690,7 +690,7 @@ static int perf_event__synthesize_modules_maps_cb(struct map *map, void *data)
>  		return 0;
>  
>  	dso = map__dso(map);
> -	if (symbol_conf.buildid_mmap2) {
> +	if (!symbol_conf.no_buildid_mmap2) {
>  		size = PERF_ALIGN(dso__long_name_len(dso) + 1, sizeof(u64));
>  		event->mmap2.header.type = PERF_RECORD_MMAP2;
>  		event->mmap2.header.size = (sizeof(event->mmap2) -
> @@ -734,9 +734,9 @@ int perf_event__synthesize_modules(const struct perf_tool *tool, perf_event__han
>  		.process = process,
>  		.machine = machine,
>  	};
> -	size_t size = symbol_conf.buildid_mmap2
> -		? sizeof(args.event->mmap2)
> -		: sizeof(args.event->mmap);
> +	size_t size = symbol_conf.no_buildid_mmap2
> +		? sizeof(args.event->mmap)
> +		: sizeof(args.event->mmap2);
>  
>  	args.event = zalloc(size + machine->id_hdr_size);
>  	if (args.event == NULL) {
> @@ -1124,8 +1124,8 @@ static int __perf_event__synthesize_kernel_mmap(const struct perf_tool *tool,
>  						struct machine *machine)
>  {
>  	union perf_event *event;
> -	size_t size = symbol_conf.buildid_mmap2 ?
> -			sizeof(event->mmap2) : sizeof(event->mmap);
> +	size_t size = symbol_conf.no_buildid_mmap2 ?
> +			sizeof(event->mmap) : sizeof(event->mmap2);
>  	struct map *map = machine__kernel_map(machine);
>  	struct kmap *kmap;
>  	int err;
> @@ -1159,7 +1159,7 @@ static int __perf_event__synthesize_kernel_mmap(const struct perf_tool *tool,
>  		event->header.misc = PERF_RECORD_MISC_GUEST_KERNEL;
>  	}
>  
> -	if (symbol_conf.buildid_mmap2) {
> +	if (!symbol_conf.no_buildid_mmap2) {
>  		size = snprintf(event->mmap2.filename, sizeof(event->mmap2.filename),
>  				"%s%s", machine->mmap_name, kmap->ref_reloc_sym->name) + 1;
>  		size = PERF_ALIGN(size, sizeof(u64));
> -- 
> 2.50.0.727.gbf7dc18ff4-goog
> 

