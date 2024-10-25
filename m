Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223B5D0C61B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INSD2ldA5Z4EwqfcoFFdt6MATInEKdsZh76zncbN2SE=; b=FblQ/0TkqNpNt/MuMJa81SUGVX
	4fntjx4sUliXfMOeLphLxqkyijlb+OQ7RPJS6dU4w1KJjwvNM6sbyW165f7GWq9zxtc9QITyerpdG
	JNULuASHXd+Rl29S4v135x1jap8TkInqTfEVkRZYhBxVcWnovHZ5ib0qDMIvD/gZQWyU8XQDPSjeH
	HpGQYhWzoyOcXf4CijsVR/hlhknjf7xqF/0h1bplaTzjO25Gi95n4gLwgbk34+4rugSkXP58ihrRG
	Apw5ODgNYRAM9KabYf+OpAp5b/zBFOOBIokHcV3dGvImTs9A3HVErAxY+jeZmi8K2t2CHVrS3O3N3
	D2UHuoMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ldr-000000045Le-1t7E;
	Fri, 25 Oct 2024 14:50:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LWw-000000043b3-0rlo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:43:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35D72339;
	Fri, 25 Oct 2024 07:43:39 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1769C3F73B;
	Fri, 25 Oct 2024 07:43:08 -0700 (PDT)
Date: Fri, 25 Oct 2024 15:43:03 +0100
From: Leo Yan <leo.yan@arm.com>
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf arm-spe: Add support for SPE Data Source packet on
 AmpereOne
Message-ID: <20241025144303.GC359792@e132581.arm.com>
References: <20241024233035.7979-1-ilkka@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024233035.7979-1-ilkka@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_074310_392507_90236C1C 
X-CRM114-Status: GOOD (  24.67  )
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

On Thu, Oct 24, 2024 at 11:30:35PM +0000, Ilkka Koskinen wrote:
> 
> Decode SPE Data Source packets on AmpereOne. The field is IMPDEF.
> 
> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> ---
>  .../util/arm-spe-decoder/arm-spe-decoder.h    |  9 +++
>  tools/perf/util/arm-spe.c                     | 61 +++++++++++++++++++
>  2 files changed, 70 insertions(+)
> 
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> index 1443c28545a9..e4115b1e92b2 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> @@ -67,6 +67,15 @@ enum arm_spe_neoverse_data_source {
>         ARM_SPE_NV_DRAM          = 0xe,
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
> index 138ffc71b32d..04bd21ad7ea8 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -515,10 +515,69 @@ static void arm_spe__synth_data_source_generic(const struct arm_spe_record *reco
>                 data_src->mem_lvl |= PERF_MEM_LVL_REM_CCE1;
>  }
> 
> +static const struct midr_range ampereone_source_spe[] = {
> +       MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
> +       {},
> +};
> +
> +static void arm_spe__synth_data_source_ampereone(const struct arm_spe_record *record,
> +                                                union perf_mem_data_src *data_src,
> +                                                u64 midr)
> +{
> +       if (!is_midr_in_range_list(midr, ampereone_source_spe)) {
> +               arm_spe__synth_data_source_generic(record, data_src);
> +               return;
> +       }

With James' suggestion, I don't think here need to check the CPU
variant again.  All generic data source generating should run in the 
arm_spe__synth_data_source() function.

> +
> +       if (record->op & ARM_SPE_OP_ST) {
> +               data_src->mem_lvl = PERF_MEM_LVL_NA;
> +               data_src->mem_lvl_num = PERF_MEM_LVLNUM_NA;
> +               data_src->mem_snoop = PERF_MEM_SNOOP_NA;
> +               return;
> +       }
> +
> +       switch (record->source) {
> +       case ARM_SPE_AMPEREONE_LOCAL_CHIP_CACHE_OR_DEVICE:
> +               data_src->mem_lvl = PERF_MEM_LVL_L2 | PERF_MEM_LVL_HIT;
> +               data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
> +               data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> +               break;
> +       case ARM_SPE_AMPEREONE_SLC:
> +               data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
> +               data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> +               data_src->mem_snoop = PERF_MEM_SNOOP_HIT;
> +               break;
> +       case ARM_SPE_AMPEREONE_REMOTE_CHIP_CACHE:
> +               data_src->mem_lvl = PERF_MEM_LVL_REM_CCE1;
> +               data_src->mem_lvl_num = PERF_MEM_LVLNUM_ANY_CACHE;
> +               data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
> +               data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> +               break;
> +       case ARM_SPE_AMPEREONE_DDR:
> +               data_src->mem_lvl = PERF_MEM_LVL_LOC_RAM | PERF_MEM_LVL_HIT;
> +               data_src->mem_lvl_num = PERF_MEM_LVLNUM_RAM;
> +               data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +               break;
> +       case ARM_SPE_AMPEREONE_L1D:
> +               data_src->mem_lvl = PERF_MEM_LVL_L1 | PERF_MEM_LVL_HIT;
> +               data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
> +               data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +               break;
> +       case ARM_SPE_AMPEREONE_L2D:
> +               data_src->mem_lvl = PERF_MEM_LVL_L2 | PERF_MEM_LVL_HIT;
> +               data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
> +               data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +               break;

We have another way to do this.  If convert the SoC specific data source
to common data source values, e.g.

  ARM_SPE_AMPEREONE_LOCAL_CHIP_CACHE_OR_DEVICE -> ARM_SPE_NV_PEER_CORE
  ARM_SPE_AMPEREONE_SLC -> ARM_SPE_NV_SYS_CACHE
  ARM_SPE_AMPEREONE_REMOTE_CHIP_CACHE -> ARM_SPE_NV_REMOTE
  ARM_SPE_AMPEREONE_DDR -> ARM_SPE_NV_DRAM
  ...

Then we don't need to maintain two functions with almost same setting.

I have no strong opinion for this. A dedicated function for Ampere CPU
might give a bit flexiblity for later tweaking. It is up to you.

Last thing, please work on the the latest perf-tools-next branch:

  https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git
  branch: perf-tools-next

Recently we have Arm SPE data source refactoring, please rebase on it.

Thanks,
Leo

> +       default:
> +               break;
> +       }
> +}
> +
>  static u64 arm_spe__synth_data_source(const struct arm_spe_record *record, u64 midr)
>  {
>         union perf_mem_data_src data_src = { .mem_op = PERF_MEM_OP_NA };
>         bool is_neoverse = is_midr_in_range_list(midr, neoverse_spe);
> +       bool is_ampereone = (read_cpuid_implementor() == ARM_CPU_IMP_AMPERE);
> 
>         if (record->op & ARM_SPE_OP_LD)
>                 data_src.mem_op = PERF_MEM_OP_LOAD;
> @@ -529,6 +588,8 @@ static u64 arm_spe__synth_data_source(const struct arm_spe_record *record, u64 m
> 
>         if (is_neoverse)
>                 arm_spe__synth_data_source_neoverse(record, &data_src);
> +       else if (is_ampereone)
> +               arm_spe__synth_data_source_ampereone(record, &data_src, midr);
>         else
>                 arm_spe__synth_data_source_generic(record, &data_src);
> 
> --
> 2.47.0
> 
> 

