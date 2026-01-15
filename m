Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD738D4660A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 17:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sctf2sbhpGEwbYoz83tcfpXjWueupcooSyy4CsiMWw=; b=fgyUTrn9O/HrZQxjTY7O1W0rzp
	HMLpB2bpZz8CPzBl3c7BJjEfe11D7sCn8wNSH939fAkF3ZUtykmY82UZdkqZqxUFkn6hLT85VhdZ8
	J6kiD62KUk+PyNn0jWy7nc3/MCi7iKCFUf6grB2V8Fd5Ct9I0UQFo0WVOvxgHf/ycS9HFy/7taJjo
	8sMjXp5xSceBL0znnsibC2zSpoU/Ib+cDt8qCucEcncF2dKn8FU3ugbOaZ6mrcn1OBGUfOkvZtnJd
	HCZ/XIjG1pJ9LvAx1glhSnsqJoCm1nKJI/7ewzBnqjJLuo4HrXnHNMw3RMpT1vg+cCW1IVW2HvaVY
	BCh/O3Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRc7-0000000CutD-0NF4;
	Thu, 15 Jan 2026 17:58:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRc3-0000000Cusj-3Hi5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 17:58:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC2261515;
	Thu, 15 Jan 2026 09:58:16 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3ADC73F632;
	Thu, 15 Jan 2026 09:58:18 -0800 (PST)
Date: Thu, 15 Jan 2026 17:58:15 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
	dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
	fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
	jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	peternewman@google.com, punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com, reinette.chatre@intel.com,
	rohit.mathew@arm.com, scott@os.amperecomputing.com,
	sdonthineni@nvidia.com, tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com, will@kernel.org, corbet@lwn.net,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 06/47] arm64: mpam: Context switch the MPAM registers
Message-ID: <aWkqt37FJ5l6QD0E@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-7-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112165914.4086692-7-ben.horgan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_095827_957668_CEE8E7C8 
X-CRM114-Status: GOOD (  27.70  )
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

On Mon, Jan 12, 2026 at 04:58:33PM +0000, Ben Horgan wrote:
>  menu "ARMv8.5 architectural features"
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

Since we have an isb() already, does it make any difference if we write
MPAM0 before the barrier? Similar question for other places where we
write these two registers.

At some point, we should go through __switch_to() and coalesce the isbs
into fewer as we keep accumulating them (e.g. all those switch function
setting some sync variable if needed).

> +
> +	WRITE_ONCE(per_cpu(arm64_mpam_current, cpu), regval);

Is it too expensive to read the MPAM sysregs and avoid carrying around
another per-CPU state? You use it for pm restoring but we could just
save it in cpu_do_suspend() like other sysregs. Not a big issue, it just
feels like this function got unnecessarily complicated (it took me a bit
to figure out what it all does).

A related question - is resctrl_arch_set_cdp_enabled() always called in
non-preemptible contexts? We potentially have a race between setting
current->mpam_partid_msg and arm64_mpam_global_default, so the check in
mpam_thread_switch() can get confused.

And I couldn't figure out where the MPAMx_EL1 registers are written. If
any global/per-cpu/per-task value is changed, does the kernel wait until
the next thread switch to write the sysreg? The only places I can found
touching these sysregs are the thread switch, pm notifiers and KVM.

-- 
Catalin

