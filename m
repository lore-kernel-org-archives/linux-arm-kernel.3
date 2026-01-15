Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2CAD3CCB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 06:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVGRYSJE6r9drCGU0tuZ5wClI+1Q/rZ9cJ9pzodJ08w=; b=Lx0V3hFYfqEyNQS2ZuQRtEZj0a
	82tO4C2FFiZbnzWdGadkTiovTtXpcNpUn/HwF1DqO61l86V4Yp4JhpmwdkLdxIY9Cf8Bj3knUWIe1
	aQIH2bq+a9uNZx0QRPkeEJTbovScsQUWjA1LU7WUrhjvGK5a6XrOK2GcX3SCbjRJWEvh+rKhh3K2m
	YK7tvBXmXZoLDM5QgCmZvlxGtcrKBD/AhADyh7VYKow2ogQt8auPI+vb9FQHZuIvVm+CSqQXQqq1z
	KvYW/GJaBTan/MdSdLWoxDR9rTvutKAobi0zxtOP/ZKPSUvdntlPlzyj6WLc8u/JY2LCmgRvVRekV
	Gs8QrVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgH96-0000000Bsb7-3fkz;
	Thu, 15 Jan 2026 06:47:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgH93-0000000Bsab-1qQ0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 06:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768459667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DVGRYSJE6r9drCGU0tuZ5wClI+1Q/rZ9cJ9pzodJ08w=;
	b=QM1HMToAndwSSf0clrV6dzPHOfyzVJVsxJ+hB3Gsv58RE5jStJPM1gSAnqScsJVjmtG0em
	1jVNHfEqqimC7zY/tBFW2+cD1OrgRNoJYNNZ2p8Pc93CwW0y4//MicLlK0tsaxKj4XqhSQ
	vvbDOmY0i3bgbpgrvpawJO0ibfu/TjA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-46Mpd000PYioHtcquZ97tg-1; Thu, 15 Jan 2026 01:47:45 -0500
X-MC-Unique: 46Mpd000PYioHtcquZ97tg-1
X-Mimecast-MFC-AGG-ID: 46Mpd000PYioHtcquZ97tg_1768459664
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34cc88eca7eso518653a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 22:47:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459664; x=1769064464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVGRYSJE6r9drCGU0tuZ5wClI+1Q/rZ9cJ9pzodJ08w=;
        b=QRncO0GQIRx2jZl4v76HdFR0yfJ/rovr/uNaq6PHGwfc/m5jSd0afFKkBd/MCgdcBk
         oMSequcB3T73UitbrIcTHuXuGT4Up5f24ncx2JBkm0kf5eqVyc+L+tKOuyNNhlGQ7qA4
         Y98qQ3WE0GItl5mJLR5+kD4YRoW0hyMBbcy1ri03J0nhKKgx/0IxoaT3NxPT97uiQmjI
         uOc0+AsQR6NOx89SpOi7X5k0tV7Z/ABOfKFWCYuPf+bMB5IjlZ5HqSkdCXdwtuMlkaz/
         TgCtTLv7DTgrb5LKrzZUc5O8mjZPyFChIlXqiwQYZutXVybMc/GABHWmb3mt8PpOhDKA
         SOFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYBFM9jLWiD1eC+AY0sdLk1Ax4f4ejwSMGJSU0negTSbyPQUh6LA9h+Z5fRNUhuaN68xIGWHcdIKAMFSA2Tzs+@lists.infradead.org
X-Gm-Message-State: AOJu0YwuLBLRYPxQA5NkzBoSIaTkT81PhOvuofcor2KJo7hlAIxzjRwE
	Q+CdQPxbZS/Vda86QKhX9mC4VsENF1ByEbksgDA5DQDW5NoxZhH8KzXPBsSKXkqfvUZygbSyKcK
	AewGpvzHOfWHEedAOGRREGAbRRZ5CiKIM8fsCFc621/51NXIbR56qZ7/xlTEt90yr9WheHIWMbv
	gS
X-Gm-Gg: AY/fxX6lz5N7ovgaNAuoYppULfEx37qWGBZ2QHQgx4/YCx/ej7IljMmGcS6EPeRKylQ
	ClhlOGqHwtHw8gRloS6g7BFgGl/Iw8df2/+mRRMGevc//9E4IyfIv/PpRZthr5YywnXT67oWTgh
	g8I3qOgBZhjWwJzimqE+97qw6Y5GTiqOaAaVMlv12Rn08dfO2OANwly24AsHCn8ypHoXt/8Gr9l
	3KRJCkp5Od7MwwfoeNuC6d9duJGX+h4ne2rQorwlWEEoLv595aiZm+UTpibMABMPdE0pY86keic
	lQ9DMXP00Q8gAZayHfnKnV1qIBOJtRowE/Sgfi4ehQtujCRqqkjTKWRPNcOX9fjBM5HniG4+7gC
	e7sytxl5pjV0=
X-Received: by 2002:a17:90a:dfce:b0:34a:47d0:9a82 with SMTP id 98e67ed59e1d1-3510b1267c2mr5053381a91.23.1768459664012;
        Wed, 14 Jan 2026 22:47:44 -0800 (PST)
X-Received: by 2002:a17:90a:dfce:b0:34a:47d0:9a82 with SMTP id 98e67ed59e1d1-3510b1267c2mr5053339a91.23.1768459663556;
        Wed, 14 Jan 2026 22:47:43 -0800 (PST)
Received: from [10.72.112.168] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352678c6dbesm1149011a91.16.2026.01.14.22.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 22:47:42 -0800 (PST)
Message-ID: <12779ebc-1928-42db-8a44-ee97e2a58fd1@redhat.com>
Date: Thu, 15 Jan 2026 14:47:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/47] arm64: mpam: Context switch the MPAM registers
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-7-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260112165914.4086692-7-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BKyUXV4V2YVtNH564gYTvPQ09beImXP0jSWT4ywBUSc_1768459664
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_224749_657042_7AC0F746 
X-CRM114-Status: GOOD (  48.97  )
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

Hi Ben,

On 1/13/26 12:58 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> MPAM allows traffic in the SoC to be labeled by the OS, these labels are
> used to apply policy in caches and bandwidth regulators, and to monitor
> traffic in the SoC. The label is made up of a PARTID and PMG value. The x86
> equivalent calls these CLOSID and RMID, but they don't map precisely.
> 
> MPAM has two CPU system registers that is used to hold the PARTID and PMG
> values that traffic generated at each exception level will use. These can
> be set per-task by the resctrl file system. (resctrl is the defacto
> interface for controlling this stuff).
> 
> Add a helper to switch this.
> 
> struct task_struct's separate CLOSID and RMID fields are insufficient to
> implement resctrl using MPAM, as resctrl can change the PARTID (CLOSID) and
> PMG (sort of like the RMID) separately. On x86, the rmid is an independent
> number, so a race that writes a mismatched closid and rmid into hardware is
> benign. On arm64, the pmg bits extend the partid.
> (i.e. partid-5 has a pmg-0 that is not the same as partid-6's pmg-0).  In
> this case, mismatching the values will 'dirty' a pmg value that resctrl
> believes is clean, and is not tracking with its 'limbo' code.
> 
> To avoid this, the partid and pmg are always read and written as a
> pair. This requires a new u64 field. In struct task_struct there are two
> u32, rmid and closid for the x86 case, but as we can't use them here do
> something else. Add this new field, mpam_partid_pmg, to struct thread_info
> to avoid adding more architecture specific code to struct task_struct.
> Always use READ_ONCE()/WRITE_ONCE() when accessing this field.
> 
> Resctrl allows a per-cpu 'default' value to be set, this overrides the
> values when scheduling a task in the default control-group, which has
> PARTID 0. The way 'code data prioritisation' gets emulated means the
> register value for the default group needs to be a variable.
> 
> The current system register value is kept in a per-cpu variable to avoid
> writing to the system register if the value isn't going to change.  Writes
> to this register may reset the hardware state for regulating bandwidth.
> 
> Finally, there is no reason to context switch these registers unless there
> is a driver changing the values in struct task_struct. Hide the whole thing
> behind a static key. This also allows the driver to disable MPAM in
> response to errors reported by hardware. Move the existing static key to
> belong to the arch code, as in the future the MPAM driver may become a
> loadable module.
> 
> All this should depend on whether there is an MPAM driver, hide it behind
> CONFIG_ARM64_MPAM.
> 
> CC: Amit Singh Tomar <amitsinght@marvell.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> CONFIG_MPAM -> CONFIG_ARM64_MPAM in commit message
> Remove extra DECLARE_STATIC_KEY_FALSE
> Function name in comment, __mpam_sched_in() -> mpam_thread_switch()
> Remove unused headers
> Expand comment (Jonathan)
> 
> Changes since v2:
> Tidy up ifdefs
> ---
>   arch/arm64/Kconfig                   |  2 +
>   arch/arm64/include/asm/mpam.h        | 67 ++++++++++++++++++++++++++++
>   arch/arm64/include/asm/thread_info.h |  3 ++
>   arch/arm64/kernel/Makefile           |  1 +
>   arch/arm64/kernel/mpam.c             | 13 ++++++
>   arch/arm64/kernel/process.c          |  7 +++
>   drivers/resctrl/mpam_devices.c       |  2 -
>   drivers/resctrl/mpam_internal.h      |  4 +-
>   8 files changed, 95 insertions(+), 4 deletions(-)
>   create mode 100644 arch/arm64/include/asm/mpam.h
>   create mode 100644 arch/arm64/kernel/mpam.c
> 

With the following nitpick addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 93173f0a09c7..cdcc5b76a110 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2049,6 +2049,8 @@ config ARM64_MPAM
>   
>   	  MPAM is exposed to user-space via the resctrl pseudo filesystem.
>   
> +	  This option enables the extra context switch code.
> +
>   endmenu # "ARMv8.4 architectural features"
>   
>   menu "ARMv8.5 architectural features"
> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
> new file mode 100644
> index 000000000000..14011e5970ce
> --- /dev/null
> +++ b/arch/arm64/include/asm/mpam.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2025 Arm Ltd. */
> +
> +#ifndef __ASM__MPAM_H
> +#define __ASM__MPAM_H
> +
> +#include <linux/jump_label.h>
> +#include <linux/percpu.h>
> +#include <linux/sched.h>
> +
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
> + * which may race with reads in mpam_thread_switch(). Ensure only one of the old
> + * or new values are used. Particular care should be taken with the pmg field as
> + * mpam_thread_switch() may read a partid and pmg that don't match, causing this
> + * value to be stored with cache allocations, despite being considered 'free' by
> + * resctrl.
> + */
> +#ifdef CONFIG_ARM64_MPAM
> +static inline u64 mpam_get_regval(struct task_struct *tsk)
> +{
> +	return READ_ONCE(task_thread_info(tsk)->mpam_partid_pmg);
> +}
> +
> +static inline void mpam_thread_switch(struct task_struct *tsk)
> +{
> +	u64 oldregval;
> +	int cpu = smp_processor_id();
> +	u64 regval = mpam_get_regval(tsk);
> +
> +	if (!static_branch_likely(&mpam_enabled))
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
> +#else
> +static inline void mpam_thread_switch(struct task_struct *tsk) {}
> +#endif /* CONFIG_ARM64_MPAM */
> +
> +#endif /* __ASM__MPAM_H */
> diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
> index a803b887b0b4..fc801a26ff9e 100644
> --- a/arch/arm64/include/asm/thread_info.h
> +++ b/arch/arm64/include/asm/thread_info.h
> @@ -41,6 +41,9 @@ struct thread_info {
>   #ifdef CONFIG_SHADOW_CALL_STACK
>   	void			*scs_base;
>   	void			*scs_sp;
> +#endif
> +#ifdef CONFIG_ARM64_MPAM
> +	u64			mpam_partid_pmg;
>   #endif
>   	u32			cpu;
>   };
> diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
> index 76f32e424065..15979f366519 100644
> --- a/arch/arm64/kernel/Makefile
> +++ b/arch/arm64/kernel/Makefile
> @@ -67,6 +67,7 @@ obj-$(CONFIG_CRASH_DUMP)		+= crash_dump.o
>   obj-$(CONFIG_VMCORE_INFO)		+= vmcore_info.o
>   obj-$(CONFIG_ARM_SDE_INTERFACE)		+= sdei.o
>   obj-$(CONFIG_ARM64_PTR_AUTH)		+= pointer_auth.o
> +obj-$(CONFIG_ARM64_MPAM)		+= mpam.o
>   obj-$(CONFIG_ARM64_MTE)			+= mte.o
>   obj-y					+= vdso-wrap.o
>   obj-$(CONFIG_COMPAT_VDSO)		+= vdso32-wrap.o
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

Nitpick: Needn't include those two header files since they have been included
to <asm/mpam.h>
  
> +DEFINE_STATIC_KEY_FALSE(mpam_enabled);
> +DEFINE_PER_CPU(u64, arm64_mpam_default);
> +DEFINE_PER_CPU(u64, arm64_mpam_current);
> +
> +u64 arm64_mpam_global_default;
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 489554931231..47698955fa1e 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -51,6 +51,7 @@
>   #include <asm/fpsimd.h>
>   #include <asm/gcs.h>
>   #include <asm/mmu_context.h>
> +#include <asm/mpam.h>
>   #include <asm/mte.h>
>   #include <asm/processor.h>
>   #include <asm/pointer_auth.h>
> @@ -738,6 +739,12 @@ struct task_struct *__switch_to(struct task_struct *prev,
>   	if (prev->thread.sctlr_user != next->thread.sctlr_user)
>   		update_sctlr_el1(next->thread.sctlr_user);
>   
> +	/*
> +	 * MPAM thread switch happens after the DSB to ensure prev's accesses
> +	 * use prev's MPAM settings.
> +	 */
> +	mpam_thread_switch(next);
> +
>   	/* the actual thread switch */
>   	last = cpu_switch_to(prev, next);
>   
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index b495d5291868..860181266b15 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -29,8 +29,6 @@
>   
>   #include "mpam_internal.h"
>   
> -DEFINE_STATIC_KEY_FALSE(mpam_enabled); /* This moves to arch code */
> -
>   /*
>    * mpam_list_lock protects the SRCU lists when writing. Once the
>    * mpam_enabled key is enabled these lists are read-only,
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index e8971842b124..4632985bcca6 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -16,12 +16,12 @@
>   #include <linux/srcu.h>
>   #include <linux/types.h>
>   
> +#include <asm/mpam.h>
> +
>   #define MPAM_MSC_MAX_NUM_RIS	16
>   
>   struct platform_device;
>   
> -DECLARE_STATIC_KEY_FALSE(mpam_enabled);
> -
>   #ifdef CONFIG_MPAM_KUNIT_TEST
>   #define PACKED_FOR_KUNIT __packed
>   #else

Thanks,
Gavin


