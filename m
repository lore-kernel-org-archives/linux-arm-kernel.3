Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634A5CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 03:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NGg2qzTa7uhmYPhS6f+RlPqR+OA7skbV6BGg/tY8MY=; b=dLbpwy7OGbXJWdOfU3Gh8UuwIu
	QXUvqUtpdmkVD1nQAg1vtrlwemFwLlOU/GFR9zsgXbCRWmbz9ayxwdae/spcC6ewknNvN1rjmxtr2
	mtZ/s8GOYlli2fqDGLH81naALbdncDzaFgR13OkYzCEk3uWTYhNnAV6+R257okQdLZkp+TH8Ys9j8
	25+BbjchGgvVBLGuGdQm3ejwh6SbiveD7QjbH0vglKeDQPWw/Nseozbv+ZledqFBNTyfRJK5hSrCi
	mI67EaAr6rSjUs//UybXn3mmDFbuSfDLwkOZimgKjqsbgb3xt8wN0Vg1oSrFkX41W9lQXDFw0/Zv4
	Nprpx9gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAJjh-0000000Ad2c-3Z1F;
	Sun, 19 Oct 2025 03:05:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAJjg-0000000Ad2H-3NnX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 03:05:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B74CC601DE;
	Sun, 19 Oct 2025 03:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD4BC4CEFE;
	Sun, 19 Oct 2025 03:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760843123;
	bh=9o9O9kFzULuQMA47+02lmYPnOnyhKOLV0LUaGS8NwHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cl7Bx6o1/F98Aq1CkDwk0bIGZ0yxz507ZMsuE3tySTDPmzvG/ZaQoeSbCMcVmZsXd
	 4r9tIz9obvfLbnVUn8vyHFBrExuBXXELCt/9JUl/2iAkl/1VGb+BVfCNAyW+M11+C9
	 vlXJL8EoiyFtfzrcii+AVF5yn96pz2K6HDDOzTnTK6AbTkPyJLKG63CPD5S0SG2q5z
	 E9DExdAGRssYts3XL4l3RE3NPqCm/GDfrdYDfspKzuAJHn5GbJItcNcxtjp/BMYZLQ
	 bqnJAd4gyqds2mHy1c9GFLMv863TKip323zsLGuP+YCTXubdn69ja4CxMWrO3el+s9
	 NnS6mpVNQYPJQ==
Date: Sun, 19 Oct 2025 12:05:17 +0900
From: Namhyung Kim <namhyung@kernel.org>
To: tanze <tanze@kylinos.cn>
Cc: james.clark@linaro.org, leo.yan@linux.dev, irogers@google.com,
	john.g.garry@oracle.com, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	graham.woodward@arm.com, mike.leach@linaro.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Athira Rajeev <atrajeev@linux.ibm.com>
Subject: Re: [PATCH v2] perf arm_spe: Add a macro definition to handle offset
 value
Message-ID: <aPRVbfadB0mCGP4t@google.com>
References: <20251016083019.27935-1-tanze@kylinos.cn>
 <20251017021540.45930-1-tanze@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251017021540.45930-1-tanze@kylinos.cn>
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

Hello,

On Fri, Oct 17, 2025 at 10:15:40AM +0800, tanze wrote:
> Add a macro definition SPE_SYNTH_ID_OFFSET to handle the offset value
> and improve readability.
> 
> Signed-off-by: tanze <tanze@kylinos.cn>

I'm adding relevant folks to CC.

Thanks,
Namhyung

> ---
> Hi, Leo Yan
> 
> Thank you for your guidance and suggestions. I have made revisions according to your requirements. 
> Do you have any further suggestions?
> ---
> Changes in v2:
> - Migrate the macro definitions to the synthetic-events.h file
> - Add modifications to other source files that use the offset value
> ---
>  tools/perf/util/arm-spe.c          | 2 +-
>  tools/perf/util/cs-etm.c           | 2 +-
>  tools/perf/util/intel-bts.c        | 2 +-
>  tools/perf/util/intel-pt.c         | 2 +-
>  tools/perf/util/powerpc-vpadtl.c   | 3 ++-
>  tools/perf/util/synthetic-events.h | 2 ++
>  6 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 71be979f5077..b082cb1666a6 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -1732,7 +1732,7 @@ arm_spe_synth_events(struct arm_spe *spe, struct perf_session *session)
>  	attr.sample_period = spe->synth_opts.period;
>  
>  	/* create new id val to be a fixed offset from evsel id */
> -	id = evsel->core.id[0] + 1000000000;
> +	id = evsel->core.id[0] + PERF_SYNTH_EVENT_ID_OFFSET;
>  
>  	if (!id)
>  		id = 1;
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 30f4bb3e7fa3..46902f7b69f1 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -1726,7 +1726,7 @@ static int cs_etm__synth_events(struct cs_etm_auxtrace *etm,
>  	attr.read_format = evsel->core.attr.read_format;
>  
>  	/* create new id val to be a fixed offset from evsel id */
> -	id = evsel->core.id[0] + 1000000000;
> +	id = evsel->core.id[0] + PERF_SYNTH_EVENT_ID_OFFSET;
>  
>  	if (!id)
>  		id = 1;
> diff --git a/tools/perf/util/intel-bts.c b/tools/perf/util/intel-bts.c
> index 3625c6224750..98b928eca724 100644
> --- a/tools/perf/util/intel-bts.c
> +++ b/tools/perf/util/intel-bts.c
> @@ -777,7 +777,7 @@ static int intel_bts_synth_events(struct intel_bts *bts,
>  	attr.sample_id_all = evsel->core.attr.sample_id_all;
>  	attr.read_format = evsel->core.attr.read_format;
>  
> -	id = evsel->core.id[0] + 1000000000;
> +	id = evsel->core.id[0] + PERF_SYNTH_EVENT_ID_OFFSET;
>  	if (!id)
>  		id = 1;
>  
> diff --git a/tools/perf/util/intel-pt.c b/tools/perf/util/intel-pt.c
> index 9b1011fe4826..4fb9600a7369 100644
> --- a/tools/perf/util/intel-pt.c
> +++ b/tools/perf/util/intel-pt.c
> @@ -3987,7 +3987,7 @@ static int intel_pt_synth_events(struct intel_pt *pt,
>  	attr.sample_id_all = evsel->core.attr.sample_id_all;
>  	attr.read_format = evsel->core.attr.read_format;
>  
> -	id = evsel->core.id[0] + 1000000000;
> +	id = evsel->core.id[0] + PERF_SYNTH_EVENT_ID_OFFSET;
>  	if (!id)
>  		id = 1;
>  
> diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
> index 39a3fb3f1330..5ce5d2bf4c6c 100644
> --- a/tools/perf/util/powerpc-vpadtl.c
> +++ b/tools/perf/util/powerpc-vpadtl.c
> @@ -15,6 +15,7 @@
>  #include "powerpc-vpadtl.h"
>  #include "sample.h"
>  #include "tool.h"
> +#include "util/synthetic-events.h"
>  
>  /*
>   * Structure to save the auxtrace queue
> @@ -656,7 +657,7 @@ powerpc_vpadtl_synth_events(struct powerpc_vpadtl *vpa, struct perf_session *ses
>  	attr.config = PERF_SYNTH_POWERPC_VPA_DTL;
>  
>  	/* create new id val to be a fixed offset from evsel id */
> -	id = evsel->core.id[0] + 1000000000;
> +	id = evsel->core.id[0] + PERF_SYNTH_EVENT_ID_OFFSET;
>  	if (!id)
>  		id = 1;
>  
> diff --git a/tools/perf/util/synthetic-events.h b/tools/perf/util/synthetic-events.h
> index ee29615d68e5..c8a1fe7a3fa4 100644
> --- a/tools/perf/util/synthetic-events.h
> +++ b/tools/perf/util/synthetic-events.h
> @@ -39,6 +39,8 @@ enum perf_record_synth {
>  };
>  #define PERF_SYNTH_ALL  (PERF_SYNTH_MAX - 1)
>  
> +#define PERF_SYNTH_EVENT_ID_OFFSET	(1000000000ULL)
> +
>  int parse_synth_opt(char *str);
>  
>  typedef int (*perf_event__handler_t)(const struct perf_tool *tool, union perf_event *event,
> -- 
> 2.25.1
> 

