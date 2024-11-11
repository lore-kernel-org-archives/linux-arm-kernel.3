Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBE3D2E9E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 13:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FR7CzHtDLiUEBs6wWht6Sao3cVb9MQJElCJgpU72T/I=; b=OT3JXiKHeNJiZnEcYa6WDuE5mq
	X3GlpQsolnEDBk5lhq5A15RBe9WKqDoBeEk5lYMowhkJNVvcLj8/8NGnxwj2gCnHZIphOYo/YCPhb
	Z/tS5RhqUcOuph8gUooOivEnefdB5BjIV280Hu5NtHhIMzMmK/0U4XPWTY+EMa5dVi6QrL0rhizVE
	axSsgQ9BeZVyKarLDX2Vj+gmT297ph6/SI9Ndp2fKO6paF8D6JqRghY5TUO7Wftwr5LTzp26Iiq7w
	HOAocHimv04qHfH7LeWe7Bho0VO+RfkQVr8y4JBY4OirkrCw6x3IZ99utzRKk4VXoAV2KKMIRdmaP
	PIhczk4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAU8q-000000008YQ-0yLc;
	Mon, 11 Nov 2024 13:07:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tATxY-000000004pm-1DIw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 12:56:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 496AD1CE0;
	Mon, 11 Nov 2024 04:56:22 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B01C3F66E;
	Mon, 11 Nov 2024 04:55:51 -0800 (PST)
Date: Mon, 11 Nov 2024 12:55:50 +0000
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
Subject: Re: [PATCH v5 1/2] perf arm-spe: Prepare for adding data source
 packet implementations for other cores
Message-ID: <20241111125550.GA350698@e132581.arm.com>
References: <20241108202946.16835-1-ilkka@os.amperecomputing.com>
 <20241108202946.16835-2-ilkka@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108202946.16835-2-ilkka@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_045600_493345_233BDAD1 
X-CRM114-Status: GOOD (  21.84  )
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

On Fri, Nov 08, 2024 at 08:29:45PM +0000, Ilkka Koskinen wrote:
> 
> Split Data Source Packet handling to prepare adding support for
> other implementations.
> 
> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  tools/perf/util/arm-spe.c | 42 ++++++++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index dbf13f47879c..3064c3f22806 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -103,6 +103,18 @@ struct arm_spe_queue {
>         u32                             flags;
>  };
> 
> +struct data_source_handle {
> +       const struct midr_range *midr_ranges;
> +       void (*ds_synth)(const struct arm_spe_record *record,
> +                        union perf_mem_data_src *data_src);
> +};
> +
> +#define DS(range, func)                                        \
> +       {                                               \
> +               .midr_ranges = range,                   \
> +               .ds_synth = arm_spe__synth_##func,      \
> +       }
> +
>  static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
>                          unsigned char *buf, size_t len)
>  {
> @@ -532,6 +544,10 @@ static void arm_spe__synth_data_source_common(const struct arm_spe_record *recor
>         }
>  }
> 
> +static const struct data_source_handle data_source_handles[] = {
> +       DS(common_ds_encoding_cpus, data_source_common),
> +};
> +
>  static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
>                                         union perf_mem_data_src *data_src)
>  {
> @@ -555,12 +571,14 @@ static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
>                 data_src->mem_lvl |= PERF_MEM_LVL_REM_CCE1;
>  }
> 
> -static bool arm_spe__is_common_ds_encoding(struct arm_spe_queue *speq)
> +static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
> +                             const struct arm_spe_record *record,
> +                             union perf_mem_data_src *data_src)
>  {
>         struct arm_spe *spe = speq->spe;
> -       bool is_in_cpu_list;
>         u64 *metadata = NULL;
> -       u64 midr = 0;
> +       u64 midr;
> +       unsigned int i;
> 
>         /* Metadata version 1 assumes all CPUs are the same (old behavior) */
>         if (spe->metadata_ver == 1) {
> @@ -592,18 +610,20 @@ static bool arm_spe__is_common_ds_encoding(struct arm_spe_queue *speq)
>                 midr = metadata[ARM_SPE_CPU_MIDR];
>         }
> 
> -       is_in_cpu_list = is_midr_in_range_list(midr, common_ds_encoding_cpus);
> -       if (is_in_cpu_list)
> -               return true;
> -       else
> -               return false;
> +       for (i = 0; i < ARRAY_SIZE(data_source_handles); i++) {
> +               if (is_midr_in_range_list(midr, data_source_handles[i].midr_ranges)) {
> +                       data_source_handles[i].ds_synth(record, data_src);
> +                       return true;
> +               }
> +       }
> +
> +       return false;
>  }
> 
>  static u64 arm_spe__synth_data_source(struct arm_spe_queue *speq,
>                                       const struct arm_spe_record *record)
>  {
>         union perf_mem_data_src data_src = { .mem_op = PERF_MEM_OP_NA };
> -       bool is_common = arm_spe__is_common_ds_encoding(speq);
> 
>         if (record->op & ARM_SPE_OP_LD)
>                 data_src.mem_op = PERF_MEM_OP_LOAD;
> @@ -612,9 +632,7 @@ static u64 arm_spe__synth_data_source(struct arm_spe_queue *speq,
>         else
>                 return 0;
> 
> -       if (is_common)
> -               arm_spe__synth_data_source_common(record, &data_src);
> -       else
> +       if (!arm_spe__synth_ds(speq, record, &data_src))
>                 arm_spe__synth_memory_level(record, &data_src);
> 
>         if (record->type & (ARM_SPE_TLB_ACCESS | ARM_SPE_TLB_MISS)) {
> --
> 2.47.0
> 
> 

