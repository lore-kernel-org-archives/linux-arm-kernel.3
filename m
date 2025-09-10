Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27EDCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ko9zuNYOMh4wBMwddtZjWEIKtxwl1jCJkRTr3vGBvpU=; b=zOVIMdOZ79F5r8HW4UYuAnepQ5
	f1Uvw084huN0Iae4WB7dXhgEeNjeEYAbbGzfValv2VWRG+qVd9Yhy+jMaMaxNbpd69bDbhZ+HMNRY
	+YOMKugRSTl7DfjEGVT6aprQpCTBKgXVoytG6MartL85jP4zKCVEBTi4cbm2YgIibJW8ekyG8yTms
	WDdJ9zkcL6cx0ModM1IsnKoT8hfTqC4YV29LQsxL5jbY2NDc+SNxn4zoh5jmUj1E4fQ475MSb2XOF
	Psr+lYcyyq08RVdSYSnhOyvprfxbbaKC4wYcUT73Aw9UDu5IFzOz1OyjUtTc73gzdNcp+gvCkLhdA
	nnecj9gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQLd-0000000GEBS-2psk;
	Wed, 10 Sep 2025 19:19:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQLb-0000000GEAL-0izk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 19:19:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 428E516F2;
	Wed, 10 Sep 2025 12:19:06 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8755E3F694;
	Wed, 10 Sep 2025 12:19:08 -0700 (PDT)
Message-ID: <e12dce47-77a3-4993-98e7-c1eba683b4d0@arm.com>
Date: Wed, 10 Sep 2025 20:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/33] arm_mpam: Add helpers for managing the locking
 around the mon_sel registers
To: Dave Martin <Dave.Martin@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-17-james.morse@arm.com>
 <aMBKQCmlj0Ne56/M@e133380.arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <aMBKQCmlj0Ne56/M@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_121915_324296_655FF70F 
X-CRM114-Status: GOOD (  46.18  )
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

Hi Dave,

On 09/09/2025 16:39, Dave Martin wrote:
> On Fri, Aug 22, 2025 at 03:29:57PM +0000, James Morse wrote:
>> The MSC MON_SEL register needs to be accessed from hardirq context by the
>> PMU drivers, making an irqsave spinlock the obvious lock to protect these
> 
> What PMU drivers?  MPAM itself doesn't define its monitors as PMUs, and
> (as of this series) there is no intergration with perf.

I can redraw this as the IPI that is needed on platforms with cache:MSC and PSCI:CPU_SUSPEND.

The PMU driver got dragged further out in time as ABMC may be a viable alternative
for platforms with insufficient monitors. (but there are also platforms which don't
look enough like a Xeon for this to work)


>> registers. On systems with SCMI mailboxes it must be able to sleep, meaning
>> a mutex must be used.
>>
>> Clearly these two can't exist at the same time.
> 
> The locks obvisouly do exist at the same time.  Do you mean that an
> individual MSC must be either MMIO or SCMI/PCC?

Yes, I've reworded that as 'for one MSC at the same time'.

> (I don't think anything prevents both kinds of MSC from existing in the
> same system?)
> 
> Above, you seem to imply that each kind of MSC interface requires a
> different kind of lock, but below, you imply that the locks must be
> used together, with holding the outer lock being a precondition for
> taking the inner lock. 
> 
> Because these functions are introduced with no user, the code doesn't
> offer much in the way of clues.  In particular, there is no indication
> of what the outer lock is supposed to protect.

It's a structure to you do the right things in the right context.
You have to try to take both locks - all the inner lock does on a system that
needs to sleep is check the context, so the outer lock does all the 'protecting'.
On 'normal' systems, the inner lock takes an irqsave spinlock which makes does
all the work, and makes it safe for the overflow interrupt.



>> Add helpers for the MON_SEL locking. The outer lock must be taken in a
>> pre-emptible context before the inner lock can be taken. On systems with
>> SCMI mailboxes where the MON_SEL accesses must sleep - the inner lock
>> will fail to be 'taken' if the caller is unable to sleep. This will allow
>> the PMU driver to fail without having to check the interface type of
> 
> Why is it acceptable to fail (i.e., don't the counts need to be read on
> non-MMIO MSCs?)

They can't from contexts that need to sleep. If you've got this firmware thing
you also need to have a platform that doesn't need IPI to reach the mailbox (why
would it), overflow interrupts, or a PMU driver.
Instead of having two drivers, or type checks all over the place - this structure
lets such a platform get through as much of the driver as possible, before failing
at the point that would deadlock. (need to wait for an interrupt in interrupt context).

I think this is the most maintainable approach as it has the most in common. I don't like
the two drivers alternative.


>> each MSC.



>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index a623f405ddd8..c6f087f9fa7d 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -68,10 +68,19 @@ struct mpam_msc {
>>  
>>  	/*
>>  	 * mon_sel_lock protects access to the MSC hardware registers that are
>> -	 * affeted by MPAMCFG_MON_SEL.
>> +	 * affected by MPAMCFG_MON_SEL, and the mbwu_state.
>> +	 * Both the 'inner' and 'outer' must be taken.
>> +	 * For real MMIO MSC, the outer lock is unnecessary - but keeps the
>> +	 * code common with:
>> +	 * Firmware backed MSC need to sleep when accessing the MSC, which
>> +	 * means some code-paths will always fail. For these MSC the outer
>> +	 * lock is providing the protection, and the inner lock fails to
>> +	 * be taken if the task is unable to sleep.
>> +	 *
>>  	 * If needed, take msc->probe_lock first.
>>  	 */
>>  	struct mutex		outer_mon_sel_lock;
>> +	bool			outer_lock_held;
> 
> Why not use mutex_is_locked()?

That works. I've had a bad experience with the lockdep version of that checking who
owns the mutex, and getting confused when there is an IPI involved.


>>  	raw_spinlock_t		inner_mon_sel_lock;
> 
> Why raw?  The commit message makes no mention of it.
> 
> (We really to need to sit on a specific CPU while holding this lock, so
> "raw" makes sense.  But we're always doing this in a cross-call,
> presumably with the hotplug lock held -- so I think we can't be
> migrated anyway?)

Nothing to do with hotplug. (my recollection as to why this got changed - ) is because an
IPI results in the kind of context where you can't sleep - and regular spinlocks can end
up sleeping. This is the trick RT pulls. Without raw here - the atomic sleep check starts
complaining about taking a spinlock  behind and IPI.


>>  	unsigned long		inner_mon_sel_flags;
>>  
>> @@ -81,6 +90,52 @@ struct mpam_msc {
>>  	struct mpam_garbage	garbage;
>>  };
>>  
>> +static inline bool __must_check mpam_mon_sel_inner_lock(struct mpam_msc *msc)
>> +{
>> +	/*
>> +	 * The outer lock may be taken by a CPU that then issues an IPI to run
>> +	 * a helper that takes the inner lock. lockdep can't help us here.
>> +	 */
>> +	WARN_ON_ONCE(!msc->outer_lock_held);
>> +
>> +	if (msc->iface == MPAM_IFACE_MMIO) {
>> +		raw_spin_lock_irqsave(&msc->inner_mon_sel_lock, msc->inner_mon_sel_flags);
>> +		return true;
>> +	}
>> +
>> +	/* Accesses must fail if we are not pre-emptible */
>> +	return !!preemptible();
> 
> What accesses?

To the mon_sel register.



> In the MPAM_IFACE_MMIO case, this returns true even though non-
> preemptible (because of getting the lock).
> 
> So, what is the semantics of the return value?
> 
> A comment would probably help.

/* Returning false here means accesses to mon_sel must fail and report an error. */


>> +}
>> +
>> +static inline void mpam_mon_sel_inner_unlock(struct mpam_msc *msc)
>> +{
>> +	WARN_ON_ONCE(!msc->outer_lock_held);
>> +
>> +	if (msc->iface == MPAM_IFACE_MMIO)
>> +		raw_spin_unlock_irqrestore(&msc->inner_mon_sel_lock, msc->inner_mon_sel_flags);
>> +}
>> +
>> +static inline void mpam_mon_sel_outer_lock(struct mpam_msc *msc)
>> +{
>> +	mutex_lock(&msc->outer_mon_sel_lock);
>> +	msc->outer_lock_held = true;
>> +}
>> +
> 
>> +static inline void mpam_mon_sel_outer_unlock(struct mpam_msc *msc)
>> +{
>> +	msc->outer_lock_held = false;
>> +	mutex_unlock(&msc->outer_mon_sel_lock);
>> +}
>> +
>> +static inline void mpam_mon_sel_lock_held(struct mpam_msc *msc)
>> +{
>> +	WARN_ON_ONCE(!msc->outer_lock_held);
>> +	if (msc->iface == MPAM_IFACE_MMIO)
>> +		lockdep_assert_held_once(&msc->inner_mon_sel_lock);
>> +	else
>> +		lockdep_assert_preemption_enabled();
>> +}
>> +
> 
> Except that monitors may need to be accessed in interrupt context,
> I don't see an obvious difference between controls and monitors that
> motivates this locking model.

Controls don't have an overflow interrupt, and would never be accessed by perf in nasty
contexts.


> Is the outer lock ever needfully held for extended periods of time,
> making a (raw) spinlock unsuitable?

It's held before sending the IPI - but only because the firmware platforms should never
need to send that IPI.

I can drop the outer lock for now as the firmware platforms haven't properly materialised,
(promised ~three years ago - also promised in December this year). But some kind of
abstraction is needed here to keep the code common, and these mon_sel accesses need to be
something that can fail.


Thanks,

James

