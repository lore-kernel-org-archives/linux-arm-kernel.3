Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4511BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00dwqZHVc0FEuHqjwXW/3nir90oyie8Ek4oT/YeulX0=; b=wNia9ByYwiVyJnCSpYO1+fMhkx
	fEWNAZ3tEIlpVPVh6xajXN8x3c7qQnDPH6KMn9CIH+xxX7VfdMAda8rItUXTifsTKngU0Ok+gYJC2
	qRz4nGr2H3ts4b79Hdx/5Mo3GyrkHTcF9gfQfWK2UL06HC0FqFj86bqGciMONSSY9YjJ/0q48hrjA
	smzcOVf8vbMX7JK9pOFO6EHJbWq4CWfWt+3HKBJWWgQqUfD5O20T3Wcg3uhgUYzEWs2UVIlCoT1Y+
	2KUo1hx7zyiXyAPErfTsjWoTNnM4PYmQHgp/hXbsjMyxrGt9nhm/A3PDq5FxwEWnZTp49Z02uSwfD
	ds1xrVHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBQ6-00000008US8-42MI;
	Mon, 13 Jul 2026 07:49:42 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBQ2-00000008UR9-3yr6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:49:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=00dwqZHVc0FEuHqjwXW/3nir90oyie8Ek4oT/YeulX0=;
	b=e79kpjXEU0R1g6JsGAVYZTTubeITyeLe9BIohSGdoVoqVqDxV73JulO5e/Cn6geINygNccitZ
	A1odlrBqqJf5WoKXg1KstZQHGUQC4aBVQLKTTgA8K4dxULMXcXZ8+lkQVS2tmmwaaPKcQktzYyn
	sG9gFSoucBereibwCRRBEhI=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gzDqX5LHFzmVXs;
	Mon, 13 Jul 2026 15:40:08 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 044E640586;
	Mon, 13 Jul 2026 15:49:26 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Jul 2026 15:49:19 +0800
Message-ID: <1610f167-1af0-4d20-877c-b362b9b49d94@huawei.com>
Date: Mon, 13 Jul 2026 15:49:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: ptrace: use live x0 for seccomp and audit after
 ptrace
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: Yiqi Sun <sunyiqixm@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <rmk+kernel@armlinux.org.uk>,
	<kees@kernel.org>, <mark.rutland@arm.com>
References: <20260529065444.1336608-1-sunyiqixm@gmail.com>
 <2f435bab0d61d0bf8fbaa54203525aae8e8f5371.1782384161.git.sunyiqixm@gmail.com>
 <akJuljttiQoki3sq@willie-the-truck> <akP8-ddTn9bhIDEW@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <akP8-ddTn9bhIDEW@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_004939_611677_FAE5A3A6 
X-CRM114-Status: GOOD (  58.28  )
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



On 7/1/2026 1:29 AM, Catalin Marinas wrote:
> Hi Will,
> 
> On Mon, Jun 29, 2026 at 02:09:42PM +0100, Will Deacon wrote:
>> On Thu, Jun 25, 2026 at 06:45:02PM +0800, Yiqi Sun wrote:
>>> On arm64, seccomp obtains syscall arguments via
>>> syscall_get_arguments(), where arg0 is currently read from
>>> regs->orig_x0. audit_syscall_entry() in syscall_trace_enter() also
>>> takes arg0 from regs->orig_x0. However, the syscall wrapper consumes
>>> live arguments from regs->regs[0..5].
>>>
>>> A ptracer can modify x0 on syscall-enter stop before seccomp and audit
>>> run, but cannot update orig_x0 through the native syscall-stop
>>> interface. This can leave seccomp and audit checking stale arg0 while
>>> the syscall executes with updated live x0.
>>>
>>> Make both paths read arg0 from regs->regs[0], matching the actual
>>> dispatch arguments and keeping seccomp and audit aligned after ptrace
>>> updates.
>>>
>>> Fixes: f27bb139c387 ("arm64: Miscellaneous library functions")
>>> Signed-off-by: Yiqi Sun <sunyiqixm@gmail.com>
>>> ---
>>> Changes in v2:
>>> - Also switch the arm64 audit entry path to use live x0
>>> - Clarify the orig_x0 synchronization comment in syscall_set_arguments()
>>> ---
>>>  arch/arm64/include/asm/syscall.h | 7 +++----
>>>  arch/arm64/kernel/ptrace.c       | 2 +-
>>>  2 files changed, 4 insertions(+), 5 deletions(-)
>>
>> Sashiko has pointed out some issues with this patch that look legitimate
>> to me:
>>
>> https://sashiko.dev/#/patchset/2f435bab0d61d0bf8fbaa54203525aae8e8f5371.1782384161.git.sunyiqixm@gmail.com
>>
>> Specifically, we don't appear to handle NO_SYSCALL properly and the
>> syscall-exit stop is now going to see the return code instead of the
>> syscall number.
> 
> Yes, good points from Sashiko.
> 
>> Looking at this more broadly, it looks like orig_x0 is used for three
>> different cases:
> 
> At least the reported problem is real, the seccomp/audit code needs to
> see the values the tracer modified and, IIUC, that's the behaviour x86
> implements (it doesn't even clobber the arguments with the return
> value). Unlike arm64, powerpc, arm32 expose orig_* to the ptrace
> interface. We can't extend the user_pt_regs structure but we could
> expose a new structure via ptrace.
> 
>> 1. syscall restarting:
>> 			We restore from orig_x0, which should hold the
>> 			original value passed by userspace.
> 
> Yes, we definitely need the orig_x0 since regs[0] was clobbered by the
> return value.
> 
>> 2. syscall_get_arguments():
>> 			This must work correctly vs syscall_set_arguments()
>> 			(returning the latest set x0) but also
>> 			syscall_get_return_value() (so we need to
>> 			distinguish the return value and the argument
>> 			somehow).
> 
> syscall_set_arguments() also updates orig_x0. W.r.t.
> syscall_set_return_value(), it sets regs[0] which also matches what
> syscall_get_return_value() reads. But yes, mismatch with the above.
> 
>> 3. syscall_rollback():
>> 			Seccomp wants to restore the original values
>> 			passed by userspace.
> 
> The "original values" comment is slightly misleading and just restoring
> orig_x0 won't help with the other args anyway. x86 doesn't roll back any
> arguments, it just uses the tracer's new values if they've been set via
> syscall_trace_enter(). We do the same if the arguments are set via
> syscall_set_arguments() since it updates orig_x0 but not if the tracer
> did a gpr_set(). I don't think we can safely update orig_x0 via
> gpr_set() since it has no idea whether it's in a syscall or not, may
> mess up syscall restarting. Interestingly, riscv's SC_RISCV_REGS_TO_ARGS
> uses orig_a0, a0 is always the return value even for gpr_get/set(). If
> they want to change the syscall arguments, it's only possible via
> PTRACE_SET_SYSCALL_INFO.
> 
>> So (1) and (3) look to require the same behaviour, but (2) wants
>> something different because it needs to reflect changes made via
>> syscall_set_arguments().
>>
>> The bodge we have for (2) today is that syscall_set_arguments() updates
>> orig_x0, but I think that breaks (1) and (2) which is the underlying
>> problem you're facing here.
> 
> I think the reason (1) needs orig_x0 is because regs[0] was clobbered by
> the return value. For (3), orig_x0 and regs[0] are mostly in sync on
> this path other than the NO_SYSCALL case where el0_svc_common() sets
> regs[0] to -ENOSYS early, before we even reach a tracer.
> 
>> I haven't yet figured out the right way to fix this, but I'd be interested
>> to hear from others. I think the starting point would be removing orig_x0
>> from syscall_{get,set}_arguments() altogether so that it accurately
>> represents the initial value passed by userspace.
> 
> I thought this might be a cleaner way forward but it's pretty messed up.
> Depending on when syscall_get_arguments() is called, it needs different
> things: we have seccomp before syscall and regs[0] would do but also
> collect_syscall() at the end of a syscall and regs[0] has been clobbered
> with the return value.
> 
> I also looked at replacing orig_x0 (or its meaning) with a ret_x0 and
> only update it on the ERET to user but it breaks the ABI since a tracer
> may expect to see the syscall return value in regs[0] on the exit path.
> 
> I think we need to keep orig_x0 as our original arg0 throughout the
> kernel and just fix the tracer path to sync it on the syscall entry. It
> doesn't unclutter the code but it shouldn't break the ABI either (unless
> someone relied on the ptrace change x0 and not being noticed by
> seccomp). Something like below:
> 
> ----------------8<-----------------------------
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 4d08598e2891..cd21b301e154 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2417,6 +2417,18 @@ int syscall_trace_enter(struct pt_regs *regs)
>  		ret = report_syscall_entry(regs);
>  		if (ret || (flags & _TIF_SYSCALL_EMU))
>  			return NO_SYSCALL;
> +		/*
> +		 * Keep orig_x0 authoritative so that seccomp (via
> +		 * syscall_get_arguments()), audit and the restart path all
> +		 * see the same first argument the syscall is dispatched with,
> +		 * even if it has been updated by a tracer. Skip this for
> +		 * NO_SYSCALL (set either by the user or the tracer) as
> +		 * regs[0] holds the return value (see the comment in
> +		 * el0_svc_common()). For compat, orig_r0 is provided directly
> +		 * through GPR index 17.
> +		 */
> +		if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
> +			regs->orig_x0 = regs->regs[0];

Hi, Will

Can we place this fix in report_syscall_entry()? The generic entry
framework has already reserved the function
arch_ptrace_report_syscall_permit_entry() for architecture-specific
customization, so switching to it might be more convenient.

>  	}
>  
>  	/* Do the secure computing after ptrace; failures should be fast. */
> ----------------8<-----------------------------
> 
> If we want to change the ABI, we could do like riscv and only set the
> arguments via PTRACE_SET_SYSCALL_INFO while the GPR ptrace accesses
> whatever is in regs[0] - either the original arg or the return value. I
> think they changed this inadvertently in 2023 when they moved to the
> generic syscall.
> 
> We could also introduce NT_ARM_ORIG_X0 but on its own it feels a bit
> weird for a tracer to know when the kernel may use orig_x0 or regs[0].
> 
> So quick hack above if it works, otherwise we need to look into change
> the ABI and hoping no-one notices ;).
> 


