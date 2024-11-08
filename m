Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A44AD5C0ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 15:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdKQvOcQJxZptAwqj+FsnnLXfX8HFpuTSIQn7SrgDMM=; b=XBbhn/MuLzpQG8pxxUgW8qK4aE
	g8h6weCNu8s5FXJlnqiC0c5ZT6N29Ss1RH17BwAsGjZaqy14VXdycijllvMTo2P+VKwCB1dP0U261
	79g365k1RayJiSLIKA4ikshhcD/8iHNnkfvVSdyAbZsxOWuO4IfGq+9tkMhdup893aNA7AvnkWyi9
	9hL2t8ddl4NkNEb3ydK3RmE7MsM/hvvuzEYcLxxYcQL2tDSzJqPLGVstE7etz6yb1AfifxlhKDxNp
	Au5z7rUWIrGELhy7e5c2oTkxJbRTioq0vOGmOFuKNDEhdv9iYb0mILA5JyQfW0s2YRC4QC1FT+Dgi
	csn+kgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QxB-0000000B2EE-3r5x;
	Fri, 08 Nov 2024 15:31:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QKr-0000000AujJ-0nty
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:51:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 969FD339;
	Fri,  8 Nov 2024 06:52:10 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61A143F66E;
	Fri,  8 Nov 2024 06:51:40 -0800 (PST)
Date: Fri, 8 Nov 2024 14:51:38 +0000
From: Leo Yan <leo.yan@arm.com>
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Graham Woodward <graham.woodward@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] perf arm-spe: Add support for SPE Data Source
 packet on AmpereOne
Message-ID: <20241108145138.GF47850@e132581.arm.com>
References: <20241108010911.58412-1-ilkka@os.amperecomputing.com>
 <20241108010911.58412-3-ilkka@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108010911.58412-3-ilkka@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_065141_339251_24A418E9 
X-CRM114-Status: GOOD (  21.56  )
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

On Fri, Nov 08, 2024 at 01:09:11AM +0000, Ilkka Koskinen wrote:
> 
> Decode SPE Data Source packets on AmpereOne. The field is IMPDEF.
> 
> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  .../util/arm-spe-decoder/arm-spe-decoder.h    |  9 ++++
>  tools/perf/util/arm-spe.c                     | 44 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> index 358c611eeddb..4bcd627e859f 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> @@ -67,6 +67,15 @@ enum arm_spe_common_data_source {
>         ARM_SPE_COMMON_DS_DRAM          = 0xe,
>  };
> 
> +enum arm_spe_ampereone_data_source {
> +       ARM_SPE_AMPEREONE_LOCAL_CHIP_CACHE_OR_DEVICE    = 0x0,
> +       ARM_SPE_AMPEREONE_SLC                           = 0x3,
> +       ARM_SPE_AMPEREONE_REMOTE_CHIP_CACHE             = 0x5,
> +       ARM_SPE_AMPEREONE_DDR                           = 0x7,
> +       ARM_SPE_AMPEREONE_L1D                           = 0x8,
> +       ARM_SPE_AMPEREONE_L2D                           = 0x9,
> +};
> +
>  struct arm_spe_record {
>         enum arm_spe_sample_type type;
>         int err;
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index dfb0c07cb7fe..df84933b673d 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -455,8 +455,14 @@ static const struct midr_range common_ds_encoding_cpus[] = {
>         {},
>  };
> 
> +static const struct midr_range ampereone_ds_encoding_cpus[] = {
> +       MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
> +       {},
> +};
> +
>  static const struct data_source_handle data_source_handles[] = {
>         DS(common_ds_encoding_cpus, data_source_common),
> +       DS(ampereone_ds_encoding_cpus, data_source_ampereone),
>  };
> 
>  static void arm_spe__sample_flags(struct arm_spe_queue *speq)
> @@ -548,6 +554,44 @@ static void arm_spe__synth_data_source_common(const struct arm_spe_record *recor
>         }
>  }
> 
> +/*
> + * Source is IMPDEF. Here we convert the source code used on AmpereOne cores
> + * to the common (Neoverse, Cortex) to avoid duplicating the decoding code.
> + */
> +static void arm_spe__synth_data_source_ampereone(const struct arm_spe_record *record,
> +                                                union perf_mem_data_src *data_src)
> +{
> +       struct arm_spe_record common_record;
> +
> +       switch (record->source) {
> +       case ARM_SPE_AMPEREONE_LOCAL_CHIP_CACHE_OR_DEVICE:
> +               common_record.source = ARM_SPE_COMMON_DS_PEER_CORE;
> +               break;
> +       case ARM_SPE_AMPEREONE_SLC:
> +               common_record.source = ARM_SPE_COMMON_DS_SYS_CACHE;
> +               break;
> +       case ARM_SPE_AMPEREONE_REMOTE_CHIP_CACHE:
> +               common_record.source = ARM_SPE_COMMON_DS_REMOTE;
> +               break;
> +       case ARM_SPE_AMPEREONE_DDR:
> +               common_record.source = ARM_SPE_COMMON_DS_DRAM;
> +               break;
> +       case ARM_SPE_AMPEREONE_L1D:
> +               common_record.source = ARM_SPE_COMMON_DS_L1D;
> +               break;
> +       case ARM_SPE_AMPEREONE_L2D:
> +               common_record.source = ARM_SPE_COMMON_DS_L2;
> +               break;
> +       default:
> +               pr_warning_once("AmpereOne: Unknown data source (0x%x)\n",
> +                               record->source);
> +               return;
> +       }
> +
> +       common_record.op = record->op;
> +       arm_spe__synth_data_source_common(&common_record, data_src);
> +}
> +
>  static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
>                                         union perf_mem_data_src *data_src)
>  {
> --
> 2.47.0
> 
> 

