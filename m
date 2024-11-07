Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1E7D43370
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hup0pnvWTu61mfUbCzSJRRpXGOfCqeeb+ttX8cQycfY=; b=TJAd7tUboY+jI+r5Fwp1Ji1bdj
	BM2JC7cd+C/ybaT4pODTx42vDJ8Zka64dG+dvTLZkuKlPdNerEjB3MPWxP2pKRw1QSNWxgQ1JpAFd
	uUoLHpQtS9iBUd5LYDVLJwS0sABIyq6u9e5/RmUydEZNsLk4wDJHm+ksLxCBOdKJ8ilW9sslH48bY
	Hfw4g0sbVvX3fPHhDc5+jFVpsGpzzCitZ9rRTBh9kfNeOWE2jrbFmF2KO0TaShrMxda6M2Id23mWv
	3qQgU458HV6eo9nElFu+4jRL+YQEQy+68kUue3vbvAgCUUPV4WN8fMDneTAU5vuTGugiUL/HiST88
	Gf/2uqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t94iI-00000007U1v-1v6x;
	Thu, 07 Nov 2024 15:46:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t94gW-00000007Teo-46sG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 15:44:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79F4E1063;
	Thu,  7 Nov 2024 07:45:05 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4639F3F66E;
	Thu,  7 Nov 2024 07:44:35 -0800 (PST)
Date: Thu, 7 Nov 2024 15:44:24 +0000
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
Subject: Re: [PATCH v3 2/2] perf arm-spe: Add support for SPE Data Source
 packet on AmpereOne
Message-ID: <20241107154424.GD47850@e132581.arm.com>
References: <20241106193740.6159-1-ilkka@os.amperecomputing.com>
 <20241106193740.6159-3-ilkka@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106193740.6159-3-ilkka@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_074437_131734_F7427A10 
X-CRM114-Status: GOOD (  23.35  )
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

On Wed, Nov 06, 2024 at 07:37:40PM +0000, Ilkka Koskinen wrote:
> Warning: EXTERNAL SENDER, use caution when opening links or attachments.
> 
> 
> Decode SPE Data Source packets on AmpereOne. The field is IMPDEF.
> 
> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> ---
>  .../util/arm-spe-decoder/arm-spe-decoder.h    |  9 +++++
>  tools/perf/util/arm-spe.c                     | 39 +++++++++++++++++++
>  2 files changed, 48 insertions(+)
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
> index b222557cc27a..40847a3d18b0 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -531,6 +531,44 @@ static void arm_spe__synth_data_source_common(const struct arm_spe_record *recor
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
> +               /* Assign a bogus value that's not used for common coding */
> +               common_record.source = 0xffff;

For unsupported source value, just bail out and no need to calling
arm_spe__synth_data_source_common().

It is good to use pr_warning_once() to print out warning log to remind
users.

Thanks,
Leo

> +               break;
> +       }
> +
> +       common_record.op = record->op;
> +       arm_spe__synth_data_source_common(&common_record, data_src);
> +}
> +
>  static const struct data_src data_sources[] = {
>         DS(MIDR_ALL_VERSIONS(MIDR_CORTEX_A720), data_source_common),
>         DS(MIDR_ALL_VERSIONS(MIDR_CORTEX_A725), data_source_common),
> @@ -541,6 +579,7 @@ static const struct data_src data_sources[] = {
>         DS(MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2), data_source_common),
>         DS(MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1), data_source_common),
>         DS(MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2), data_source_common),
> +       DS(MIDR_ALL_VERSIONS(MIDR_AMPERE1A), data_source_ampereone),
>         {},
>  };
> 
> --
> 2.47.0
> 
> 

