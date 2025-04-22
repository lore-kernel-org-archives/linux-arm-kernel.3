Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA94C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAIUiMIMcANp49836dqsOtoIvLH2tYBBYWYFrEFvBSE=; b=0ZbhPZuv/GFSNXoOUvc+OgTVLS
	2E4SdQWbw/8VvEwsTJmmR0nSsN2WmmNatJGcYbCTIwe63PsGCzv3KRZUjmtc0mO53nOVzeU04rzar
	sADOQ7xkTZa36jO+9lQyOhG8Yo51zj1udMt7GrOJ7qiAUGwK0IU32cmgGk1GOy7cmiy8rTbuVnKf6
	N9crMpZCIE4Ix4mIWaTYtFiABIss6nWhP89mvrROWXOou4LK98/qM3zhMt5cq5YTrqgv6fz+DzDVr
	5YXIz63ZQUl8fd968j7KZ5jbdVB65bVCq1BYAYhGwS9ZgB/yO0vo5yqd+t+IXrBtGritRBr/HIXdh
	DTmNN1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CAS-000000071B9-0GhL;
	Tue, 22 Apr 2025 11:52:00 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79kC-00000006WgZ-2b6a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 09:16:45 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so44154645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 02:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745313402; x=1745918202; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LAIUiMIMcANp49836dqsOtoIvLH2tYBBYWYFrEFvBSE=;
        b=Ql18czKWjhCA8xaT+z4mUD34EBsWBBM4Mz1Wrp1a+ReG4xW2aPYtFH/jaKyFYAeHni
         s8NwmAwIw2AQ1xNHicBmOmNusjXfMX7vk8AcZfrzt8BHhd08uWy0Kl+NcWg554BG+SPX
         8kX6E5xpjKynU4pF1csX5F96lEWGV0TmPny15EzxU4E2uNdIBvbSrM1Os4swZUlnhhDS
         0mqxymBUPhMQM0m8Ks5qEMm0CTEZTg1Mspu3bGmNkXoLxV//gQRqw9OewFG+uUaTRqK0
         ogypuVUiXis8CYsgPAWUhi0JT3TFq+f0sNSwo72yyk9IRpy7joNONke54568LqcSzS/V
         5lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745313402; x=1745918202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LAIUiMIMcANp49836dqsOtoIvLH2tYBBYWYFrEFvBSE=;
        b=hN2PE9hCDSLEtfUqAcWG5SJ5jzdjgA/LRyo4Vq8F6TBwUZaAhTAQyG+DDCs9YBkxEH
         8R8v2QZbyD7NrseBzdARNJLw2gC7G8ZE/21tvGOzo3G5RL0cnWgfzHFUohYYuw5g4QVt
         B4kRZR0ziQj0MY7S5tpunyllwOw0HSK2Ol8Dln2tu8ZKKCY8s386VUEQ8DwHRNgthNyf
         NsV4l9Fr9dampceCD7dzEWdkDukz9G+cYRp1Aoi7wBElEhClu+2tfXDrZCNInx/Hejle
         J1vkBoER65fHjlhTu9CKisY1aFim6cgqwbYT661SCl9A+Hg9EWOAnHnikG6Hs6dOQME/
         LaXw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ5voGjqonTvYrP7M209J0WzjYiy+GajXNHfi8I8f6xuAkHKorM7lfjgfEloMtqZ6PB2KMZ5MOjqigmX3mer3W@lists.infradead.org
X-Gm-Message-State: AOJu0YxkSkYlSuRhX3FIuSHe0mnP9adQPKkokujYeIVPYmEktEZXqKAq
	y6jFd+UbvBnzlCPt0+1d4BErFNzFB6qDMBPPqNqyJ2DbQXmVdBcICfTLkhXAKeY=
X-Gm-Gg: ASbGncu5pZukaW7FwNYsWxqo4lCYqGC5q9KFGWCFzTpIRcK6zr9YNaqCRiiapK53W6v
	V+zJcSyO6U1RJLBDk2h/0284uIPNSAOsetvDb9OrZcj1xhfqQbw+r7ZHAzCvwlUgixEW6jyCifE
	auCX09foeNHLOpnc3FQGJlkcN6TGZvzFDjkotzkUg7g1mwpMW7+0GbEH7IwctWW7iJ3mMEuRRiS
	rKFfHhcu2iiYRpXJCoFIYWK8HYrq3/jcOQDkecAtHI8AbhgZ3qvbc8gfDj2555i3qIfJxi+wpfQ
	g6VUNA1RAo/Cz3+Nd/UsiudjgKt68SA4INxfwr/pOJums3eoz6cT5Q==
X-Google-Smtp-Source: AGHT+IHSmn7InVI4HJQAnYc4ixv6KlQi3IVS6vPqSQLW1cy6FbhQcHoFR4nhvDq+BMRCiagfyFUWeg==
X-Received: by 2002:a05:600c:3592:b0:439:9e13:2dd7 with SMTP id 5b1f17b1804b1-4408188366cmr66858785e9.2.1745313402478;
        Tue, 22 Apr 2025 02:16:42 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4407c5c7916sm107783135e9.27.2025.04.22.02.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 02:16:42 -0700 (PDT)
Message-ID: <89741897-6c8f-4b75-8ec3-675111ea60a1@linaro.org>
Date: Tue, 22 Apr 2025 10:16:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf arm-spe: Add support for SPE Data Source packet on
 HiSilicon HIP12
To: Yicong Yang <yangyicong@huawei.com>
Cc: jonathan.cameron@huawei.com, hejunhao3@huawei.com, linuxarm@huawei.com,
 wangyushan12@huawei.com, caijingtao@huawei.com, xueshan2@huawei.com,
 prime.zeng@hisilicon.com, yangyicong@hisilicon.com, acme@kernel.org,
 namhyung@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
 jolsa@kernel.org, john.g.garry@oracle.com, leo.yan@linux.dev,
 irogers@google.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org
References: <20250408122809.37884-1-yangyicong@huawei.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250408122809.37884-1-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_021644_689453_926F5EDA 
X-CRM114-Status: GOOD (  21.27  )
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



On 08/04/2025 1:28 pm, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Add data source encoding for HiSilicon HIP12 and coresponding mapping
> to the perf's memory data source. This will help to synthesize the data
> and support upper layer tools like perf-mem and perf-c2c.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   arch/arm64/include/asm/cputype.h              |   2 +
>   tools/arch/arm64/include/asm/cputype.h        |   2 +
>   .../util/arm-spe-decoder/arm-spe-decoder.h    |  17 +++
>   tools/perf/util/arm-spe.c                     | 101 ++++++++++++++++++
>   4 files changed, 122 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index d1cc0571798b..36c5bbfbb6e9 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -133,6 +133,7 @@
>   
>   #define HISI_CPU_PART_TSV110		0xD01
>   #define HISI_CPU_PART_HIP09			0xD02
> +#define HISI_CPU_PART_HIP12		0xD06
>   
>   #define APPLE_CPU_PART_M1_ICESTORM	0x022
>   #define APPLE_CPU_PART_M1_FIRESTORM	0x023
> @@ -220,6 +221,7 @@
>   #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
>   #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
>   #define MIDR_HISI_HIP09 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP09)
> +#define MIDR_HISI_HIP12 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP12)
>   #define MIDR_APPLE_M1_ICESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM)
>   #define MIDR_APPLE_M1_FIRESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_FIRESTORM)
>   #define MIDR_APPLE_M1_ICESTORM_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM_PRO)
> diff --git a/tools/arch/arm64/include/asm/cputype.h b/tools/arch/arm64/include/asm/cputype.h
> index 488f8e751349..9a5d85cfd1fb 100644
> --- a/tools/arch/arm64/include/asm/cputype.h
> +++ b/tools/arch/arm64/include/asm/cputype.h
> @@ -129,6 +129,7 @@
>   #define FUJITSU_CPU_PART_A64FX		0x001
>   
>   #define HISI_CPU_PART_TSV110		0xD01
> +#define HISI_CPU_PART_HIP12		0xD06
>   
>   #define APPLE_CPU_PART_M1_ICESTORM	0x022
>   #define APPLE_CPU_PART_M1_FIRESTORM	0x023
> @@ -202,6 +203,7 @@
>   #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
>   #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
>   #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
> +#define MIDR_HISI_HIP12 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP12)
>   #define MIDR_APPLE_M1_ICESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM)
>   #define MIDR_APPLE_M1_FIRESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_FIRESTORM)
>   #define MIDR_APPLE_M1_ICESTORM_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM_PRO)
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> index 5d232188643b..0410abed5009 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> @@ -82,6 +82,23 @@ enum arm_spe_ampereone_data_source {
>   	ARM_SPE_AMPEREONE_L2D                           = 0x9,
>   };
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
>   struct arm_spe_record {
>   	enum arm_spe_sample_type type;
>   	int err;
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 2a9775649cc2..eceae4219601 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -571,6 +571,11 @@ static const struct midr_range ampereone_ds_encoding_cpus[] = {
>   	{},
>   };
>   
> +static const struct midr_range hisi_hip_ds_encoding_cpus[] = {
> +	MIDR_ALL_VERSIONS(MIDR_HISI_HIP12),
> +	{},
> +};
> +
>   static void arm_spe__sample_flags(struct arm_spe_queue *speq)
>   {
>   	const struct arm_spe_record *record = &speq->decoder->record;
> @@ -718,9 +723,105 @@ static void arm_spe__synth_data_source_ampereone(const struct arm_spe_record *re
>   	arm_spe__synth_data_source_common(&common_record, data_src);
>   }
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

Hi Yicong,

Is the mem_snoop setting missing from this one?

Other than that, LGTM.

Thanks
James


