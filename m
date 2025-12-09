Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CB3D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 14:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuaEDZeFd52d4h0ZzErwMFCXix5XFpMjCOHMPcvnu4I=; b=i6veGEy9gwx2VjDGz8S+Xtx+GR
	wK0Z2/6eYf/+eqj6OW4LPRPYvRXcte02Z/8Q0gOuaMcWHbKARR2a/wjFqvxHf5WjSWGw/hL8qveR+
	PsTEMOE4rOZ6L1liKRdB5WeN79CcWoMVWl+aS4HIT94F6UfsuBJhGIfCilxY2Ws5o7TfVrGzUvC6D
	bfomiDVoj2aTyG91jL3sHYubxPOgzwTHEOq2LD0uYq49EPHMEtq6x9QcZJrlwUClTxL6MCfY7jhOS
	RgJeyt4BUnmkulQBpkWK82uKD/J3J8gqh/xqJMMbn7AQMSdeLyBBRgLPtCxl0tsbL6NVOPenhmRGk
	7jycusQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSz1a-0000000EQFA-2kIz;
	Tue, 09 Dec 2025 14:49:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSz1Y-0000000EQEo-00d0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 14:49:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB73B175D;
	Tue,  9 Dec 2025 06:48:58 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2B163F73B;
	Tue,  9 Dec 2025 06:49:02 -0800 (PST)
Message-ID: <b1cb5da6-3e08-44b7-9d4d-cef34be15df4@arm.com>
Date: Tue, 9 Dec 2025 14:49:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/38] arm64: mpam: Context switch the MPAM registers
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Gavin Shan
 <gshan@redhat.com>, rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-2-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251205215901.17772-2-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_064908_130087_314808FC 
X-CRM114-Status: GOOD (  32.20  )
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

Hi James,

On 12/5/25 21:58, James Morse wrote:
> MPAM allows traffic in the SoC to be labeled by the OS, these labels
> are used to apply policy in caches and bandwidth regulators, and to
> monitor traffic in the SoC. The label is made up of a PARTID and PMG
> value. The x86 equivalent calls these CLOSID and RMID, but they don't
> map precisely.
> 
[...]
> 
> All this should depend on whether there is an MPAM driver, hide
> it behind CONFIG_MPAM.

CONFIG_MPAM -> CONFIG_ARM64_MPAM

> 
> CC: Amit Singh Tomar <amitsinght@marvell.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  arch/arm64/Kconfig                   |  2 +
>  arch/arm64/include/asm/mpam.h        | 74 ++++++++++++++++++++++++++++
>  arch/arm64/include/asm/thread_info.h |  3 ++
>  arch/arm64/kernel/Makefile           |  1 +
>  arch/arm64/kernel/mpam.c             | 13 +++++
>  arch/arm64/kernel/process.c          |  7 +++
>  drivers/resctrl/mpam_devices.c       |  2 -
>  drivers/resctrl/mpam_internal.h      |  2 +
>  8 files changed, 102 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/include/asm/mpam.h
>  create mode 100644 arch/arm64/kernel/mpam.c
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 004d58cfbff8..558baa9e7c08 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2048,6 +2048,8 @@ config ARM64_MPAM
>  
>  	  MPAM is exposed to user-space via the resctrl pseudo filesystem.
>  
> +	  This option enables the extra context switch code.
> +
>  endmenu # "ARMv8.4 architectural features"
>  
>  menu "ARMv8.5 architectural features"
> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
> new file mode 100644
> index 000000000000..86a55176f884
> --- /dev/null
> +++ b/arch/arm64/include/asm/mpam.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2025 Arm Ltd. */
> +
> +#ifndef __ASM__MPAM_H
> +#define __ASM__MPAM_H
> +
> +#include <linux/bitops.h>
> +#include <linux/init.h>
> +#include <linux/jump_label.h>
> +#include <linux/percpu.h>
> +#include <linux/sched.h>
> +
> +#include <asm/cpucaps.h>
> +#include <asm/cpufeature.h>
> +#include <asm/sysreg.h>
> +
> +DECLARE_STATIC_KEY_FALSE(mpam_enabled);
> +DECLARE_PER_CPU(u64, arm64_mpam_default);
> +DECLARE_PER_CPU(u64, arm64_mpam_current);
> +
> +/*
> + * The value of the MPAM0_EL1 sysreg when a task is in resctrl's default group.
> + * This is used by the context switch code to use the resctrl CPU property
> + * instead. The value is modified when CDP is enabled/disabled by mounting
> + * the resctrl filesystem.
> + */
> +extern u64 arm64_mpam_global_default;
> +
> +/*
> + * The resctrl filesystem writes to the partid/pmg values for threads and CPUs,
> + * which may race with reads in __mpam_sched_in(). Ensure only one of the old
> + * or new values are used. Particular care should be taken with the pmg field
> + * as __mpam_sched_in() may read a partid and pmg that don't match, causing
> + * this value to be stored with cache allocations, despite being considered
> + * 'free' by resctrl.

__mpam_sched_in() -> mpam_thread_switch()
This is called from resctrl_arch_sched_in().

> + *
> + * A value in struct thread_info is used instead of struct task_struct as the
> + * cpu's u64 register format is used, but struct task_struct has two u32'.
> + */
> +static inline u64 mpam_get_regval(struct task_struct *tsk)
> +{
> +#ifdef CONFIG_ARM64_MPAM
> +	return READ_ONCE(task_thread_info(tsk)->mpam_partid_pmg);
> +#else
> +	return 0;
> +#endif
> +}
> +
> +static inline void mpam_thread_switch(struct task_struct *tsk)
> +{
> +	u64 oldregval;
> +	int cpu = smp_processor_id();
> +	u64 regval = mpam_get_regval(tsk);
> +
> +	if (!IS_ENABLED(CONFIG_ARM64_MPAM) ||
> +	    !static_branch_likely(&mpam_enabled))
> +		return;
> +
> +	if (regval == READ_ONCE(arm64_mpam_global_default))
> +		regval = READ_ONCE(per_cpu(arm64_mpam_default, cpu));
> +
> +	oldregval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
> +	if (oldregval == regval)
> +		return;
> +
> +	write_sysreg_s(regval, SYS_MPAM1_EL1);
> +	isb();
> +
> +	/* Synchronising the EL0 write is left until the ERET to EL0 */
> +	write_sysreg_s(regval, SYS_MPAM0_EL1);
> +
> +	WRITE_ONCE(per_cpu(arm64_mpam_current, cpu), regval);
> +}
> +#endif /* __ASM__MPAM_H */
> diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
> index f241b8601ebd..c226dabd5019 100644
> --- a/arch/arm64/include/asm/thread_info.h
> +++ b/arch/arm64/include/asm/thread_info.h
> @@ -41,6 +41,9 @@ struct thread_info {
>  #ifdef CONFIG_SHADOW_CALL_STACK
>  	void			*scs_base;
>  	void			*scs_sp;
> +#endif
> +#ifdef CONFIG_ARM64_MPAM
> +	u64			mpam_partid_pmg;
>  #end if
>  	u32			cpu;
>  };
> diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
> index 76f32e424065..15979f366519 100644
> --- a/arch/arm64/kernel/Makefile
> +++ b/arch/arm64/kernel/Makefile
> @@ -67,6 +67,7 @@ obj-$(CONFIG_CRASH_DUMP)		+= crash_dump.o
>  obj-$(CONFIG_VMCORE_INFO)		+= vmcore_info.o
>  obj-$(CONFIG_ARM_SDE_INTERFACE)		+= sdei.o
>  obj-$(CONFIG_ARM64_PTR_AUTH)		+= pointer_auth.o
> +obj-$(CONFIG_ARM64_MPAM)		+= mpam.o
>  obj-$(CONFIG_ARM64_MTE)			+= mte.o
>  obj-y					+= vdso-wrap.o
>  obj-$(CONFIG_COMPAT_VDSO)		+= vdso32-wrap.o
> diff --git a/arch/arm64/kernel/mpam.c b/arch/arm64/kernel/mpam.c
> new file mode 100644
> index 000000000000..9866d2ca0faa
> --- /dev/null
> +++ b/arch/arm64/kernel/mpam.c
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2025 Arm Ltd. */
> +
> +#include <asm/mpam.h>
> +
> +#include <linux/jump_label.h>
> +#include <linux/percpu.h>
> +
> +DEFINE_STATIC_KEY_FALSE(mpam_enabled);
> +DEFINE_PER_CPU(u64, arm64_mpam_default);
> +DEFINE_PER_CPU(u64, arm64_mpam_current);
> +
> +u64 arm64_mpam_global_default;
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index fba7ca102a8c..b510c0699313 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -51,6 +51,7 @@
>  #include <asm/fpsimd.h>
>  #include <asm/gcs.h>
>  #include <asm/mmu_context.h>
> +#include <asm/mpam.h>
>  #include <asm/mte.h>
>  #include <asm/processor.h>
>  #include <asm/pointer_auth.h>
> @@ -737,6 +738,12 @@ struct task_struct *__switch_to(struct task_struct *prev,
>  	if (prev->thread.sctlr_user != next->thread.sctlr_user)
>  		update_sctlr_el1(next->thread.sctlr_user);
>  
> +	/*
> +	 * MPAM thread switch happens after the DSB to ensure prev's accesses
> +	 * use prev's MPAM settings.
> +	 */
> +	mpam_thread_switch(next);
> +
>  	/* the actual thread switch */
>  	last = cpu_switch_to(prev, next);
>  
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 0b5b158e1aaf..2996ad93fc3e 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -29,8 +29,6 @@
>  
>  #include "mpam_internal.h"
>  
> -DEFINE_STATIC_KEY_FALSE(mpam_enabled); /* This moves to arch code */
> -
>  /*
>   * mpam_list_lock protects the SRCU lists when writing. Once the
>   * mpam_enabled key is enabled these lists are read-only,
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index e79c3c47259c..4508a6654fe0 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -17,6 +17,8 @@
>  #include <linux/srcu.h>
>  #include <linux/types.h>
>  
> +#include <asm/mpam.h>
> +
>  #define MPAM_MSC_MAX_NUM_RIS	16
>  
>  struct platform_device;

The DECLARE_STATIC_KEY_FALSE(mpam_enabled) on the next line can now be
removed.

Thanks,

Ben


