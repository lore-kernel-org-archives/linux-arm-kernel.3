Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304FDD232FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+I4lReZzR4Frm2iT9MiCuHrNwgioUowaWKgWQS6H4ek=; b=PYt4RR3hwmg5i+4Px8o2h9SNSK
	qxmWxtYAHXa+GyuiLohRWNtexyNDsVAZQGV7LTjYIFHbBwF3WxKgmJLkhooCKejoUW0W4VnnZ8L5y
	ak0ca74qissNyl3JCljj5a6X4cqJvp9Kb97/gxjpFT/kFXByMONEZs806QWPIzExZt0iiijPGRNbF
	iloEX94SP7IlhZxTMLuUZjVMP/7xNGwcSXQkmhRUok1i3RX62Z68L+2TjkSU7RcoK3A8K03M4lkJB
	vOKCuG327ZDvSokdxXfz+OQp2umFM8cZ5H57enLcxF8F3uBjkR6ZfRYiSfFgboti6M9wH9ClfhCkI
	j6xF3pxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8nG-00000002105-1fTI;
	Fri, 09 Jan 2026 09:28:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8nD-000000020za-1122
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:28:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A014DFEC;
	Fri,  9 Jan 2026 01:28:18 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B55C33F694;
	Fri,  9 Jan 2026 01:28:19 -0800 (PST)
Message-ID: <c38d48e4-a4c4-4d35-8ca7-ffef83e03077@arm.com>
Date: Fri, 9 Jan 2026 09:28:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/45] arm64: mpam: Context switch the MPAM registers
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
Cc: "amitsinght@marvell.com" <amitsinght@marvell.com>,
 "baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 "carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
 "dave.martin@arm.com" <dave.martin@arm.com>,
 "david@kernel.org" <david@kernel.org>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "kobak@nvidia.com" <kobak@nvidia.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peternewman@google.com" <peternewman@google.com>,
 "punit.agrawal@oss.qualcomm.com" <punit.agrawal@oss.qualcomm.com>,
 "quic_jiles@quicinc.com" <quic_jiles@quicinc.com>,
 "reinette.chatre@intel.com" <reinette.chatre@intel.com>,
 "rohit.mathew@arm.com" <rohit.mathew@arm.com>,
 "scott@os.amperecomputing.com" <scott@os.amperecomputing.com>,
 "sdonthineni@nvidia.com" <sdonthineni@nvidia.com>,
 "xhao@linux.alibaba.com" <xhao@linux.alibaba.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>,
 "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
 <20251219181147.3404071-8-ben.horgan@arm.com>
 <OSZPR01MB87987088A6A033D03458AD188B85A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <OSZPR01MB87987088A6A033D03458AD188B85A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_012827_409179_88B27738 
X-CRM114-Status: GOOD (  39.42  )
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

Hi Shaopeng,

On 1/8/26 10:06, Shaopeng Tan (Fujitsu) wrote:
> Hello Ben,
> 
>> From: James Morse <james.morse@arm.com>
>>
>> MPAM allows traffic in the SoC to be labeled by the OS, these labels are
>> used to apply policy in caches and bandwidth regulators, and to monitor
>> traffic in the SoC. The label is made up of a PARTID and PMG value. The x86
>> equivalent calls these CLOSID and RMID, but they don't map precisely.
>>
>> MPAM has two CPU system registers that is used to hold the PARTID and PMG
>> values that traffic generated at each exception level will use. These can
>> be set per-task by the resctrl file system. (resctrl is the defacto
>> interface for controlling this stuff).
>>
>> Add a helper to switch this.
>>
>> struct task_struct's separate CLOSID and RMID fields are insufficient to
>> implement resctrl using MPAM, as resctrl can change the PARTID (CLOSID) and
>> PMG (sort of like the RMID) separately. On x86, the rmid is an independent
>> number, so a race that writes a mismatched closid and rmid into hardware is
>> benign. On arm64, the pmg bits extend the partid.
>> (i.e. partid-5 has a pmg-0 that is not the same as partid-6's pmg-0).  In
>> this case, mismatching the values will 'dirty' a pmg value that resctrl
>> believes is clean, and is not tracking with its 'limbo' code.
>>
>> To avoid this, the partid and pmg are always read and written as a pair.
>> Instead of making struct task_struct's closid and rmid fields an
>> endian-unsafe union, add the value to struct thread_info and always use
>> READ_ONCE()/WRITE_ONCE() when accessing this field.
>>
>> Resctrl allows a per-cpu 'default' value to be set, this overrides the
>> values when scheduling a task in the default control-group, which has
>> PARTID 0. The way 'code data prioritisation' gets emulated means the
>> register value for the default group needs to be a variable.
>>
>> The current system register value is kept in a per-cpu variable to avoid
>> writing to the system register if the value isn't going to change.  Writes
>> to this register may reset the hardware state for regulating bandwidth.
>>
>> Finally, there is no reason to context switch these registers unless there
>> is a driver changing the values in struct task_struct. Hide the whole thing
>> behind a static key. This also allows the driver to disable MPAM in
>> response to errors reported by hardware. Move the existing static key to
>> belong to the arch code, as in the future the MPAM driver may become a
>> loadable module.
>>
>> All this should depend on whether there is an MPAM driver, hide it behind
>> CONFIG_ARM64_MPAM.
>>
>> CC: Amit Singh Tomar <amitsinght@marvell.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> CONFIG_MPAM -> CONFIG_ARM64_MPAM in commit message
>> Remove extra DECLARE_STATIC_KEY_FALSE
>> Function name in comment, __mpam_sched_in() -> mpam_thread_switch()
>> Remove unused headers
>> Expand comment (Jonathan)
>> ---
>>  arch/arm64/Kconfig                   |  2 +
>>  arch/arm64/include/asm/mpam.h        | 73 ++++++++++++++++++++++++++++
>>  arch/arm64/include/asm/thread_info.h |  3 ++
>>  arch/arm64/kernel/Makefile           |  1 +
>>  arch/arm64/kernel/mpam.c             | 13 +++++
>>  arch/arm64/kernel/process.c          |  7 +++
>>  drivers/resctrl/mpam_devices.c       |  2 -
>>  drivers/resctrl/mpam_internal.h      |  4 +-
>>  8 files changed, 101 insertions(+), 4 deletions(-)
>>  create mode 100644 arch/arm64/include/asm/mpam.h
>>  create mode 100644 arch/arm64/kernel/mpam.c
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 93173f0a09c7..cdcc5b76a110 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -2049,6 +2049,8 @@ config ARM64_MPAM
>>  
>>            MPAM is exposed to user-space via the resctrl pseudo filesystem.
>>  
>> +         This option enables the extra context switch code.
>> +
>>  endmenu # "ARMv8.4 architectural features"
>>  
>>  menu "ARMv8.5 architectural features"
>> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
>> new file mode 100644
>> index 000000000000..2ab3dca6977c
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/mpam.h
>> @@ -0,0 +1,73 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/* Copyright (C) 2025 Arm Ltd. */
>> +
>> +#ifndef __ASM__MPAM_H
>> +#define __ASM__MPAM_H
>> +
>> +#include <linux/jump_label.h>
>> +#include <linux/percpu.h>
>> +#include <linux/sched.h>
>> +
>> +#include <asm/sysreg.h>
>> +
>> +DECLARE_STATIC_KEY_FALSE(mpam_enabled);
>> +DECLARE_PER_CPU(u64, arm64_mpam_default);
>> +DECLARE_PER_CPU(u64, arm64_mpam_current);
>> +
>> +/*
>> + * The value of the MPAM0_EL1 sysreg when a task is in resctrl's default group.
>> + * This is used by the context switch code to use the resctrl CPU property
>> + * instead. The value is modified when CDP is enabled/disabled by mounting
>> + * the resctrl filesystem.
>> + */
>> +extern u64 arm64_mpam_global_default;
>> +
>> +/*
>> + * The resctrl filesystem writes to the partid/pmg values for threads and CPUs,
>> + * which may race with reads in mpam_thread_switch(). Ensure only one of the old
>> + * or new values are used. Particular care should be taken with the pmg field as
>> + * mpam_thread_switch() may read a partid and pmg that don't match, causing this
>> + * value to be stored with cache allocations, despite being considered 'free' by
>> + * resctrl.
>> + *
>> + * A value in struct thread_info is used instead of struct task_struct as the
>> + * cpu's u64 register format is used. In struct task_struct there are two u32,
>> + * rmid and closid for the x86 case, but as we can't use them here do something
>> + * else. Creating a union would mean only accesses from the created u64 would be
>> + * endian safe and so be less clear.
>> + */
>> +static inline u64 mpam_get_regval(struct task_struct *tsk)
>> +{
>> +#ifdef CONFIG_ARM64_MPAM
>> +       return READ_ONCE(task_thread_info(tsk)->mpam_partid_pmg);
>> +#else
>> +       return 0;
>> +#endif
>> +}
>> +
>> +static inline void mpam_thread_switch(struct task_struct *tsk)
>> +{
>> +       u64 oldregval;
>> +       int cpu = smp_processor_id();
>> +       u64 regval = mpam_get_regval(tsk);
>> +
>> +       if (!IS_ENABLED(CONFIG_ARM64_MPAM) ||
>> +           !static_branch_likely(&mpam_enabled))
>> +               return;
>> +
>> +       if (regval == READ_ONCE(arm64_mpam_global_default))
>> +               regval = READ_ONCE(per_cpu(arm64_mpam_default, cpu));
>> +
>> +       oldregval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
>> +       if (oldregval == regval)
>> +               return;
>> +
>> +       write_sysreg_s(regval, SYS_MPAM1_EL1);
>> +       isb();
>> +
>> +       /* Synchronising the EL0 write is left until the ERET to EL0 */
>> +       write_sysreg_s(regval, SYS_MPAM0_EL1);
>> +
>> +       WRITE_ONCE(per_cpu(arm64_mpam_current, cpu), regval);
>> +}
> 
> How about changing the code as follows? (Refer to "mte_thread_switch(next);" in "arch/arm64/kernel/process.c")
> 
>  static inline u64 mpam_get_regval(struct task_struct *tsk)
>  {
> -#ifdef CONFIG_ARM64_MPAM
>         return READ_ONCE(task_thread_info(tsk)->mpam_partid_pmg);
> -#else
> -       return 0;
> -#endif
>  }
> 
> +#ifdef CONFIG_ARM64_MPAM
>  static inline void mpam_thread_switch(struct task_struct *tsk)
>  {
>         u64 oldregval;
>         int cpu = smp_processor_id();
>         u64 regval = mpam_get_regval(tsk);
> 
> -       if (!IS_ENABLED(CONFIG_ARM64_MPAM) ||
> -           !static_branch_likely(&mpam_enabled))
> +       if (!static_branch_likely(&mpam_enabled))
>                 return;
> 
>         if (regval == READ_ONCE(arm64_mpam_global_default))
> @@ -101,4 +96,8 @@ static inline void mpam_thread_switch(struct task_struct *tsk)
> 
>         WRITE_ONCE(per_cpu(arm64_mpam_current, cpu), regval);
>  }
> +#else
> +static inline void mpam_thread_switch(struct task_struct *tsk){}
> +#endif

Yes, this makes the ifdefs a bit clearer. I'll update.

> +
> Best regards,
> Shaopeng TAN
> 
Thanks,

Ben


