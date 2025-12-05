Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D76FD2E008
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 06:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:In-Reply-To:
	Content-Transfer-Encoding:Message-Id:Mime-Version:Cc:To:References:
	Content-Type:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbbPQmGT66XgpcQTC/NHTJu3sZ6jTELyOqJLg0OipEM=; b=pYqvXnTulp27DJuHIP5PEv+oaU
	FbNJ16Jhq38V3zjsN12+uR6QLa/+HYLuwwBeEbi7nlgprXNJCdcUZgnVhF+Sl8OMKYnBpANcXN/zs
	CsnzBpDwEneekrbz8yFZHxrSZOAoJJCT7j6YZyljEMkTMP8489eFrnCOvmoGEAxnKMgFSE0RqvYYc
	5mQDdAf715wylpb0AGweYBjtlc3+IgH4uCbXTBjGa1du5HuyR6BOafWGacxrQaSRfAFATCFELkK9d
	2rv8wVEXD96Te0sXwohPzBgTYR35QKGR+dnzk0kXqhRFgDE2ixOnU/ZsntoWUYIZMW4vFM9o4ZJen
	x7wYGOCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRP3n-000000095EY-3dbu;
	Fri, 05 Dec 2025 06:12:55 +0000
Received: from sg-1-38.ptr.blmpb.com ([118.26.132.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRP3j-000000095Dc-2CyG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 06:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=picoheart-com.20200927.dkim.feishu.cn; t=1764915159;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=CbbPQmGT66XgpcQTC/NHTJu3sZ6jTELyOqJLg0OipEM=;
 b=JBfuGE69Do+bFrVN6EcOnjae8w/VdKFoH5FAjG+LcfFoNkUBEwUEPq/HA499GvjxjqF0m2
 fIEgs56nbY3QIGXT0GIepUUM3kJiSh0722TMMb4aZWXR6Ylz5yOfcrkrMoK5pQTuSEmzKV
 kh60gDU+K2qn/GcMtTpzv+Calxl9PmmY9+gwMbgfc/cuSXdI8a8wq8SdGNLMMiiKCC1uBb
 mrjaE5wDsqGGf27ctDVJi96JBoj4rqErALrE5nFqb2/OIHFIH14sPvIAKiouxLyllN4zSi
 hRfyfyzTizO9B7AmdtBl8WEUZi3rmEkGnuZ4jD4SZWpQLR0uioTEAbMk2c64Zg==
From: "Yicong Yang" <yang.yicong@picoheart.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
X-Lms-Return-Path: <lba+2693277d5+8bff50+lists.infradead.org+yang.yicong@picoheart.com>
Received: from [100.86.226.133] ([58.250.106.109]) by smtp.feishu.cn with ESMTPS; Fri, 05 Dec 2025 14:12:36 +0800
References: <20251114033243.76509-1-cuiyunhui@bytedance.com> <20251114033243.76509-3-cuiyunhui@bytedance.com>
To: "Yunhui Cui" <cuiyunhui@bytedance.com>
Cc: <akpm@linux-foundation.org>, <alex@ghiti.fr>, <anup@brainfault.org>, 
	<aou@eecs.berkeley.edu>, <atish.patra@linux.dev>, 
	<catalin.marinas@arm.com>, <dianders@chromium.org>, 
	<johannes@sipsolutions.net>, <lihuafei1@huawei.com>, 
	<mark.rutland@arm.com>, <masahiroy@kernel.org>, <maz@kernel.org>, 
	<mingo@kernel.org>, <nicolas.schier@linux.dev>, <palmer@dabbelt.com>, 
	<paul.walmsley@sifive.com>, <suzuki.poulose@arm.com>, 
	<thorsten.blum@linux.dev>, <wangjinchao600@gmail.com>, <will@kernel.org>, 
	<yangyicong@hisilicon.com>, <zhanjie9@hisilicon.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<linux-perf-users@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	"Paul Walmsley" <pjw@kernel.org>, <yang.yicong@picoheart.com>, 
	<geshijian@picoheart.com>
Mime-Version: 1.0
Message-Id: <96fd2a69-baf4-4109-8341-0d4bb6c60393@picoheart.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <20251114033243.76509-3-cuiyunhui@bytedance.com>
Subject: Re: [PATCH v6 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
Date: Fri, 5 Dec 2025 14:12:33 +0800
User-Agent: Mozilla Thunderbird
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_221252_634889_15F5BCE3 
X-CRM114-Status: GOOD (  17.65  )
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

Hi Yunhui,

this has conflicts on the mainline master. looks like you have a dependency
on the SSE PMU support patchset [1], need to mention it for the maintainer
to apply.

[1] https://lore.kernel.org/linux-riscv/20250908181717.1997461-5-cleger@rivosinc.com/

one comment below.

On 2025/11/14 11:32, Yunhui Cui wrote:
> Enable the HARDLOCKUP_DETECTOR_PERF function based on RISC-V SSE.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Paul Walmsley <pjw@kernel.org>
> ---
>  arch/riscv/Kconfig           |  3 +++
>  drivers/perf/riscv_pmu_sbi.c | 10 ++++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index fadec20b87a8e..46ccd33732fa8 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -186,6 +186,9 @@ config RISCV
>  	select HAVE_PAGE_SIZE_4KB
>  	select HAVE_PCI
>  	select HAVE_PERF_EVENTS
> +	select HAVE_PERF_EVENTS_NMI if RISCV_PMU_SBI_SSE
> +	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
> +	select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR_PERF
>  	select HAVE_PERF_REGS
>  	select HAVE_PERF_USER_STACK_DUMP
>  	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index c852f64a50221..0c7c5924687c9 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -22,6 +22,7 @@
>  #include <linux/sched/clock.h>
>  #include <linux/soc/andes/irq.h>
>  #include <linux/workqueue.h>
> +#include <linux/nmi.h>
>  
>  #include <asm/errata_list.h>
>  #include <asm/sbi.h>
> @@ -1192,6 +1193,13 @@ static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
>  }
>  #endif
>  
> +#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
> +bool arch_perf_nmi_is_available(void)
> +{
> +	return IS_ENABLED(CONFIG_RISCV_PMU_SBI_SSE);

this looks incorrect per implementation in [1]. we'll fallback to the normal
interrupt if failed to register the SSE event, in which case NMI is not
available for the PMU. Check the kconfig is not sufficient.

you can check pmu->sse_evt instead for the NMI support here, or cached the
NMI status somewhere like how arm_pmu does.

Thanks.

> +}
> +#endif
> +
>  static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
>  {
>  	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
> @@ -1618,6 +1626,8 @@ static int __init pmu_sbi_devinit(void)
>  	/* Notify legacy implementation that SBI pmu is available*/
>  	riscv_pmu_legacy_skip_init();
>  
> +	lockup_detector_retry_init();
> +
>  	return ret;
>  }
>  device_initcall(pmu_sbi_devinit)

