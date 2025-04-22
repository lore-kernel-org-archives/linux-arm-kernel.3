Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0C5C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxK2qkoAMNM0WUhPE/h1QXCGdH9duqGnhiZNcP1N2Pg=; b=UaV/R590FCF3j2LK+l5FXYV58u
	LuQQ5FDU+81CcZU3t6McrDIap4Ys7w26Y7PfEV1XkuYnsy+00Fz5B1A8omKshYzg2IHJ2rpMGrfbE
	lINnZxYbP2W5tfIAPTaqDvtDz5T+sp3obarECDh0KE+AtX5oF2+M/k8T/S3oTTj+s/PQPF48ItYEX
	dZxufmvExvCG5alXsRHIwsiMA529SU1wyjTilUUx/vYffjobjF6JHH44PL1Tbb2YzxyWZhQlhf5qU
	ViikQtaNU2u/np+279o/cCTlkdk9lD4MV+eY1aaDuwBQqvTuhRp3+RiWXWLCOy9GMNQzOTJsx48Bh
	p7Gbg6BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AaQ-00000006hFl-0WaN;
	Tue, 22 Apr 2025 10:10:42 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79V5-00000006T6H-3wiL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 09:01:10 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZhbhP163xzvWrs;
	Tue, 22 Apr 2025 16:56:53 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id D1F65180478;
	Tue, 22 Apr 2025 17:01:01 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 22 Apr 2025 17:01:00 +0800
CC: <yangyicong@hisilicon.com>, <jonathan.cameron@huawei.com>,
	<hejunhao3@huawei.com>, <linuxarm@huawei.com>, <wangyushan12@huawei.com>,
	<caijingtao@huawei.com>, <xueshan2@huawei.com>, <prime.zeng@hisilicon.com>
Subject: Re: [PATCH] perf arm-spe: Add support for SPE Data Source packet on
 HiSilicon HIP12
To: <acme@kernel.org>, <namhyung@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
	<mark.rutland@arm.com>, <jolsa@kernel.org>, <john.g.garry@oracle.com>,
	<james.clark@linaro.org>, <leo.yan@linux.dev>, <irogers@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>
References: <20250408122809.37884-1-yangyicong@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <d7ff959e-2df3-4638-c189-08e1a7a19c64@huawei.com>
Date: Tue, 22 Apr 2025 17:01:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250408122809.37884-1-yangyicong@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_020108_337105_80D2609C 
X-CRM114-Status: GOOD (  19.15  )
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

A gentle ping for this straightforward support.

Thanks.

On 2025/4/8 20:28, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Add data source encoding for HiSilicon HIP12 and coresponding mapping
> to the perf's memory data source. This will help to synthesize the data
> and support upper layer tools like perf-mem and perf-c2c.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  arch/arm64/include/asm/cputype.h              |   2 +
>  tools/arch/arm64/include/asm/cputype.h        |   2 +
>  .../util/arm-spe-decoder/arm-spe-decoder.h    |  17 +++
>  tools/perf/util/arm-spe.c                     | 101 ++++++++++++++++++
>  4 files changed, 122 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index d1cc0571798b..36c5bbfbb6e9 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -133,6 +133,7 @@
>  
>  #define HISI_CPU_PART_TSV110		0xD01
>  #define HISI_CPU_PART_HIP09			0xD02
> +#define HISI_CPU_PART_HIP12		0xD06
>  
>  #define APPLE_CPU_PART_M1_ICESTORM	0x022
>  #define APPLE_CPU_PART_M1_FIRESTORM	0x023
> @@ -220,6 +221,7 @@
>  #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
>  #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
>  #define MIDR_HISI_HIP09 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP09)
> +#define MIDR_HISI_HIP12 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP12)
>  #define MIDR_APPLE_M1_ICESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM)
>  #define MIDR_APPLE_M1_FIRESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_FIRESTORM)
>  #define MIDR_APPLE_M1_ICESTORM_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM_PRO)
> diff --git a/tools/arch/arm64/include/asm/cputype.h b/tools/arch/arm64/include/asm/cputype.h
> index 488f8e751349..9a5d85cfd1fb 100644
> --- a/tools/arch/arm64/include/asm/cputype.h
> +++ b/tools/arch/arm64/include/asm/cputype.h
> @@ -129,6 +129,7 @@
>  #define FUJITSU_CPU_PART_A64FX		0x001
>  
>  #define HISI_CPU_PART_TSV110		0xD01
> +#define HISI_CPU_PART_HIP12		0xD06
>  
>  #define APPLE_CPU_PART_M1_ICESTORM	0x022
>  #define APPLE_CPU_PART_M1_FIRESTORM	0x023
> @@ -202,6 +203,7 @@
>  #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
>  #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
>  #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
> +#define MIDR_HISI_HIP12 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP12)
>  #define MIDR_APPLE_M1_ICESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM)
>  #define MIDR_APPLE_M1_FIRESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_FIRESTORM)
>  #define MIDR_APPLE_M1_ICESTORM_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM_PRO)
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> index 5d232188643b..0410abed5009 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> @@ -82,6 +82,23 @@ enum arm_spe_ampereone_data_source {
>  	ARM_SPE_AMPEREONE_L2D                           = 0x9,
>  };
>  
> +enum arm_spe_hisi_hip_data_source {
> +	ARM_SPE_HISI_HIP_PEER_CPU		= 0,
> +	ARM_SPE_HISI_HIP_PEER_CPU_HITM		= 1,
> +	ARM_SPE_HISI_HIP_L3			= 2,
> +	ARM_SPE_HISI_HIP_L3_HITM		= 3,
> +	ARM_SPE_HISI_HIP_PEER_CLUSTER		= 4,
> +	ARM_SPE_HISI_HIP_PEER_CLUSTER_HITM	= 5,
> +	ARM_SPE_HISI_HIP_REMOTE_SOCKET		= 6,
> +	ARM_SPE_HISI_HIP_REMOTE_SOCKET_HITM	= 7,
> +	ARM_SPE_HISI_HIP_LOCAL			= 8,
> +	ARM_SPE_HISI_HIP_REMOTE			= 9,
> +	ARM_SPE_HISI_HIP_NC_DEV			= 13,
> +	ARM_SPE_HISI_HIP_L2			= 16,
> +	ARM_SPE_HISI_HIP_L2_HITM		= 17,
> +	ARM_SPE_HISI_HIP_L1			= 18,
> +};
> +
>  struct arm_spe_record {
>  	enum arm_spe_sample_type type;
>  	int err;
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 2a9775649cc2..eceae4219601 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -571,6 +571,11 @@ static const struct midr_range ampereone_ds_encoding_cpus[] = {
>  	{},
>  };
>  
> +static const struct midr_range hisi_hip_ds_encoding_cpus[] = {
> +	MIDR_ALL_VERSIONS(MIDR_HISI_HIP12),
> +	{},
> +};
> +
>  static void arm_spe__sample_flags(struct arm_spe_queue *speq)
>  {
>  	const struct arm_spe_record *record = &speq->decoder->record;
> @@ -718,9 +723,105 @@ static void arm_spe__synth_data_source_ampereone(const struct arm_spe_record *re
>  	arm_spe__synth_data_source_common(&common_record, data_src);
>  }
>  
> +static void arm_spe__synth_data_source_hisi_hip(const struct arm_spe_record *record,
> +						union perf_mem_data_src *data_src)
> +{
> +	/* Use common synthesis method to handle store operations */
> +	if (record->op & ARM_SPE_OP_ST) {
> +		arm_spe__synth_data_source_common(record, data_src);
> +		return;
> +	}
> +
> +	switch (record->source) {
> +	case ARM_SPE_HISI_HIP_PEER_CPU:
> +		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> +		break;
> +	case ARM_SPE_HISI_HIP_PEER_CPU_HITM:
> +		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
> +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> +		break;
> +	case ARM_SPE_HISI_HIP_L3:
> +		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +		break;
> +	case ARM_SPE_HISI_HIP_L3_HITM:
> +		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
> +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> +		break;
> +	case ARM_SPE_HISI_HIP_PEER_CLUSTER:
> +		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE1 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> +		break;
> +	case ARM_SPE_HISI_HIP_PEER_CLUSTER_HITM:
> +		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE1 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
> +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> +		break;
> +	case ARM_SPE_HISI_HIP_REMOTE_SOCKET:
> +		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE2;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_ANY_CACHE;
> +		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
> +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> +		break;
> +	case ARM_SPE_HISI_HIP_REMOTE_SOCKET_HITM:
> +		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE2;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_ANY_CACHE;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
> +		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
> +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> +		break;
> +	case ARM_SPE_HISI_HIP_LOCAL:
> +		data_src->mem_lvl = PERF_MEM_LVL_LOC_RAM | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_RAM;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +		break;
> +	case ARM_SPE_HISI_HIP_REMOTE:
> +		data_src->mem_lvl = PERF_MEM_LVL_REM_RAM1 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_RAM;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
> +		break;
> +	case ARM_SPE_HISI_HIP_NC_DEV:
> +		data_src->mem_lvl = PERF_MEM_LVL_IO | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_IO;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +		break;
> +	case ARM_SPE_HISI_HIP_L2:
> +		data_src->mem_lvl = PERF_MEM_LVL_L2 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +		break;
> +	case ARM_SPE_HISI_HIP_L2_HITM:
> +		data_src->mem_lvl = PERF_MEM_LVL_L2 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
> +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> +		break;
> +	case ARM_SPE_HISI_HIP_L1:
> +		data_src->mem_lvl = PERF_MEM_LVL_L1 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
>  static const struct data_source_handle data_source_handles[] = {
>  	DS(common_ds_encoding_cpus, data_source_common),
>  	DS(ampereone_ds_encoding_cpus, data_source_ampereone),
> +	DS(hisi_hip_ds_encoding_cpus, data_source_hisi_hip),
>  };
>  
>  static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
> 

