Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7761CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 15:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UFmKBMmHDZNNfnvZdVAmY9qZv1wTufNTvob56m+tHE=; b=IYhRSchgP21Ufmnniuh1uAK4v0
	NZ1xmT5DenMnyld/CwRTAz2yJKaXys/ntt0nyBm4xV2CK2fZruF3QqcKoUnUCGW60m5WaesmHQjag
	wHXF1KsMtCKExji0Io7NzhJyKzDjX7WmadiRSW+NxvrtDOK61ULuo5hfQU/kxunZHSp18oNKa00sH
	obbN95GHTDL1tTBPzcLpwuOSHLmDQVxGAkjRoRfyZASl1YpVejE+bZC6gSv4ZCCCnSwkwdMxzLUEN
	LFGyWAweMoCrAgewuzN2G2fEFv6jCrgEyg1KYt+cVgDbeAjn/F8T/UroSwrwcOZd+3jcgte3LUaie
	nhT23sJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc36C-00000006XUu-3oAU;
	Tue, 23 Jun 2026 15:31:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc369-00000006XUK-47sc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 15:31:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 240541476;
	Tue, 23 Jun 2026 08:31:32 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC6773F62B;
	Tue, 23 Jun 2026 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782228696; bh=Xx7ALwuJ6fTtnyFrqu5uJjnXocUd+HCS4pgJJo0KEBw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Oi7uJrGbWhAFX+smidbuzAqnhvtxjpaa3jXcB4wIn2Q0CllZ4+m2XDB6cFBw+kTrQ
	 5R/QCaiNs7PUBJtsm8AYAnN6mbeKxrHznbqFfXefaeqk/Ai2WoUEkQsMexnnkawXuD
	 22clrn5tqBVQYUeG6NNoRKfI49hZ1Xp5WcN+5d1g=
Message-ID: <59c283b1-0436-4ea1-8feb-996dba617b6d@arm.com>
Date: Tue, 23 Jun 2026 16:31:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add tracepoint for EVTQ events
To: Chen Jun <chenjun102@huawei.com>, will@kernel.org, joro@8bytes.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: zhangyuwei20@huawei.com
References: <20260613130007.18563-1-chenjun102@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260613130007.18563-1-chenjun102@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_083138_197680_9EAD30BB 
X-CRM114-Status: GOOD (  22.54  )
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

On 13/06/2026 2:00 pm, Chen Jun wrote:
> Events reported by the SMMU can severely impact accelerator
> performance. Currently, only events that the SMMU fails to handle are
> printed to the kernel log, leaving most events invisible to users.
> To analyze and optimize accelerator performance, complete visibility
> into all SMMU-reported events is required.

What events, exactly? AFAICS the only events we should expect to handle 
"invisibly", without being some unexpected error condition worth 
screaming about, would be stalls for SVA page faults, and if SVA isn't 
generically accounting page faults itself then I would imagine it 
probably should.

Thanks,
Robin.

> Add a tracepoint in the EVTQ interrupt handler to capture every
> event record reported by the SMMU. This allows users to collect all
> event information via ftrace/perf for further analysis, complementing
> the existing event decoder and error dump which only cover a subset
> of events.
> 
> Signed-off-by: Chen Jun <chenjun102@huawei.com>
> ---
>   drivers/iommu/arm/arm-smmu-v3/Makefile      |  2 +-
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  3 ++
>   drivers/iommu/arm/arm-smmu-v3/trace.c       |  9 ++++
>   drivers/iommu/arm/arm-smmu-v3/trace.h       | 53 +++++++++++++++++++++
>   4 files changed, 66 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/iommu/arm/arm-smmu-v3/trace.c
>   create mode 100644 drivers/iommu/arm/arm-smmu-v3/trace.h
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
> index 493a659cc66b..63a8d71bfc93 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/Makefile
> +++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   obj-$(CONFIG_ARM_SMMU_V3) += arm_smmu_v3.o
> -arm_smmu_v3-y := arm-smmu-v3.o
> +arm_smmu_v3-y := arm-smmu-v3.o trace.o
>   arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_IOMMUFD) += arm-smmu-v3-iommufd.o
>   arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
>   arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index e8d7dbe495f0..85e6c25b73ed 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -34,6 +34,8 @@
>   #include "arm-smmu-v3.h"
>   #include "../../dma-iommu.h"
>   
> +#include "trace.h"
> +
>   static bool disable_msipolling;
>   module_param(disable_msipolling, bool, 0444);
>   MODULE_PARM_DESC(disable_msipolling,
> @@ -2271,6 +2273,7 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
>   
>   	do {
>   		while (!queue_remove_raw(q, evt)) {
> +			trace_smmu_evtq_event(smmu, evt);
>   			arm_smmu_decode_event(smmu, evt, &event);
>   			if (arm_smmu_handle_event(smmu, evt, &event))
>   				arm_smmu_dump_event(smmu, evt, &event, &rs);
> diff --git a/drivers/iommu/arm/arm-smmu-v3/trace.c b/drivers/iommu/arm/arm-smmu-v3/trace.c
> new file mode 100644
> index 000000000000..77378698b1a3
> --- /dev/null
> +++ b/drivers/iommu/arm/arm-smmu-v3/trace.c
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ARM SMMUv3 trace support
> + *
> + * Copyright (c) 2026 OpenCloudOS / openEuler
> + */
> +
> +#define CREATE_TRACE_POINTS
> +#include "trace.h"
> diff --git a/drivers/iommu/arm/arm-smmu-v3/trace.h b/drivers/iommu/arm/arm-smmu-v3/trace.h
> new file mode 100644
> index 000000000000..7cec8d41745e
> --- /dev/null
> +++ b/drivers/iommu/arm/arm-smmu-v3/trace.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * ARM SMMUv3 trace support
> + *
> + * Copyright (c) 2026 OpenCloudOS / openEuler
> + */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM arm_smmu_v3
> +
> +#if !defined(_TRACE_ARM_SMMU_V3_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_ARM_SMMU_V3_H
> +
> +#include <linux/tracepoint.h>
> +
> +#include "arm-smmu-v3.h"
> +
> +TRACE_EVENT(smmu_evtq_event,
> +
> +	TP_PROTO(struct arm_smmu_device *smmu, u64 *evt),
> +
> +	TP_ARGS(smmu, evt),
> +
> +	TP_STRUCT__entry(
> +		__string(iommu, dev_name(smmu->dev))
> +		__field(u64, evt0)
> +		__field(u64, evt1)
> +		__field(u64, evt2)
> +		__field(u64, evt3)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(iommu);
> +		__entry->evt0 = evt[0];
> +		__entry->evt1 = evt[1];
> +		__entry->evt2 = evt[2];
> +		__entry->evt3 = evt[3];
> +	),
> +
> +	TP_printk("%s evt: 0x%016llx 0x%016llx 0x%016llx 0x%016llx",
> +		__get_str(iommu),
> +		__entry->evt0, __entry->evt1,
> +		__entry->evt2, __entry->evt3)
> +);
> +
> +#endif /* _TRACE_ARM_SMMU_V3_H */
> +
> +/* This part must be outside protection */
> +#undef TRACE_INCLUDE_PATH
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_PATH ../../drivers/iommu/arm/arm-smmu-v3/
> +#define TRACE_INCLUDE_FILE trace
> +#include <trace/define_trace.h>


