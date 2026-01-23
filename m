Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC0DD74EDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 14:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SEXU5/9cwn7qlvL5YlcV2Y9fFA1BSHNr+ixC+uLgoM=; b=STQLRRckc1y3z5cd3PHV68qiR+
	E46LwTPmFXKizvzfIrhDaiJxmr9XH83TIlSOGMAvHCxlVI8Y1U7olTqBmQUSZ9hqxWXkKW5sSZLQs
	Y0SJSgcbSL13QEPQLPBKVQmu8Xc/BWQNY3yXjZkoCfgtOoQbMqRjSRVnFIBggmaRT7dCXw6X2SDgz
	hho9o9g6sKE5Fc1wYSRNlKWocWgwVSPt7Utp5Y/EDpBWfrMzWiv00JL6f7WScBea5riibFrSy3y3g
	jkQ/+B3y1wTUKcrHBtJB0hQ5ZJgAOjU9S43LAIR4IVRIkFekM5z3KSYYgHmr12Dh1XyorbnUfqRQ2
	l4qyWrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjIAf-000000092lv-0Hmr;
	Fri, 23 Jan 2026 14:29:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjIAb-000000092l4-1Uhh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 14:29:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEE1B1476;
	Fri, 23 Jan 2026 06:29:43 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18F8F3F740;
	Fri, 23 Jan 2026 06:29:44 -0800 (PST)
Date: Fri, 23 Jan 2026 14:29:42 +0000
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
Message-ID: <aXOF1gYB_HEK8QPX@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-7-ben.horgan@arm.com>
 <aWkqt37FJ5l6QD0E@arm.com>
 <f19cab15-0626-4d13-b25e-1c194294e62f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f19cab15-0626-4d13-b25e-1c194294e62f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_062953_484364_0ACFC74D 
X-CRM114-Status: GOOD (  39.06  )
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

On Mon, Jan 19, 2026 at 12:23:13PM +0000, Ben Horgan wrote:
> On 1/15/26 17:58, Catalin Marinas wrote:
> > On Mon, Jan 12, 2026 at 04:58:33PM +0000, Ben Horgan wrote:
> >> +static inline void mpam_thread_switch(struct task_struct *tsk)
> >> +{
> >> +	u64 oldregval;
> >> +	int cpu = smp_processor_id();
> >> +	u64 regval = mpam_get_regval(tsk);
> >> +
> >> +	if (!static_branch_likely(&mpam_enabled))
> >> +		return;
> >> +
> >> +	if (regval == READ_ONCE(arm64_mpam_global_default))
> >> +		regval = READ_ONCE(per_cpu(arm64_mpam_default, cpu));
> >> +
> >> +	oldregval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
> >> +	if (oldregval == regval)
> >> +		return;
> >> +
> >> +	write_sysreg_s(regval, SYS_MPAM1_EL1);
> >> +	isb();
> >> +
> >> +	/* Synchronising the EL0 write is left until the ERET to EL0 */
> >> +	write_sysreg_s(regval, SYS_MPAM0_EL1);
> > 
> > Since we have an isb() already, does it make any difference if we write
> > MPAM0 before the barrier? Similar question for other places where we
> > write these two registers.
> 
> The reason for the isb() placement is to document that it's not required
> for the MPAM0_EL1. All instructions running at EL1take their MPAM
> configuration from MPAM1_EL1. This includes LDTR and STTR as you asked
> about in a different thread.

It's fine to keep it this way if LDTR/STTR are not affected by the MPAM0
register.

> >> +
> >> +	WRITE_ONCE(per_cpu(arm64_mpam_current, cpu), regval);
> > 
> > Is it too expensive to read the MPAM sysregs and avoid carrying around
> > another per-CPU state? You use it for pm restoring but we could just
> > save it in cpu_do_suspend() like other sysregs. Not a big issue, it just
> > feels like this function got unnecessarily complicated (it took me a bit
> > to figure out what it all does).
> 
> It's done this way as it matches what's done in x86. I expect it would
> be cheap enough to read the register to check whether a write is required.

Since you use it for CPU suspend/resume, I guess it's fine, it saves us
from having to preserve it in the low-level asm sleep code. I don't have
a strong preference either way.

> > A related question - is resctrl_arch_set_cdp_enabled() always called in
> > non-preemptible contexts? We potentially have a race between setting
> > current->mpam_partid_msg and arm64_mpam_global_default, so the check in
> > mpam_thread_switch() can get confused.
> 
> The resctrl filesystem can only ever get mounted once and
> resctrl_arch_set_cdp_enabled() is always called in mount. In
> rdt_get_tree(), rdt_enable_ctx() calls resctrl_arch_set_cdp_enabled().
> This is done while holding the rdtgroup_mutex and the user can't change
> the mpam configuration from the default until the mutex is released and
> it can claim it.

What if resctrl_arch_set_cdp_enabled() gets preempted between updating
current task partid and setting arm64_mpam_global_default? The mutex
doesn't help.

> > And I couldn't figure out where the MPAMx_EL1 registers are written. If
> > any global/per-cpu/per-task value is changed, does the kernel wait until
> > the next thread switch to write the sysreg? The only places I can found
> > touching these sysregs are the thread switch, pm notifiers and KVM.
> 
> If the task configuration is changed then the MPAM sysreg will only be
> updated the next time it goes into the kernel.

Is it updated when it goes into the kernel or when we have a context
switch? If you have a long-running user thread that is never scheduled
out, it may not notice the update even if it entered the kernel (but no
context switch).

> So, just eventually
> consistent. For cpu configuration, update_closid_rmid() gets called
> which ipis the cpus and ends up calling mpam_thread_switch() from
> resctrl_arch_sched_in().

I see, it should be fine.

-- 
Catalin

