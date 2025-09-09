Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40B3CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZAEaki6Q0L84PdwSPbqPxzKdJLJOlsYAAS08cgAbKk=; b=YT+NW8FARKXsQIgz7Sir4BoKZ9
	fXBvZXfG9QoFY7hvCGkyX3EPrBmZ2jKH3jqaJtJEvMmJozfo16Bm/RxUUx32wcjsu92giDxiwdYTb
	UXqnL8Dp7a/kAEJdGG14zgkFNZrHEkfiQYnpqYBp4gxqaBKhuPsYGhLMbpUpqGDJRMMaKg4L0QeLK
	XmKhe2vpvwReRSC7YcgX8HtdnSfsZVeKVUhtVnnr0JpdPyf68JBhzMFLsgIEsAAc2cujnpkgaxZ54
	zs4Iu6Xci+h/nU/4NKHoMRPzFBhTqWpjx2dXkwX4/FfGqfIFAokLGcydxvpegqIM9xyLYSG4pWmZY
	EfsTP8Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw25t-000000093he-0PXi;
	Tue, 09 Sep 2025 17:25:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Rp-000000089wv-2sZV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 15:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wZAEaki6Q0L84PdwSPbqPxzKdJLJOlsYAAS08cgAbKk=; b=U0YXsto2hRnSA8Bk8Q/aj6bu8X
	DwBo7FSh9b3BxSpibIOjU38rpABY9k6nqsHZgHDdtXZC8tH2zNeTkzvf78DeAg8XrGaIEpnDFZkbB
	HkyjjNCqr8WBBQ/ZZ7jLV4o15lhMJVPt9njsYrW3CcZzcEokEqV5bObt+IAOf69X3OdPaUp31xMkw
	9Y5mu6vd6eotTuwp0BTDU8U8lFUE0GQ6U6kRyV8GJGA63xnyhzM7bKDvqlcfaGKjMEyhnyVW7rV4p
	StlcIVO8QkB4+nJ1zF01ug6lH1sKvQFp87JggEKlZUD/JbJ5rKnVK2DlTxeuI6Ew/lwqPRhlrBT6h
	SAcknnfg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Rm-00000005Ou5-1TJ3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 15:39:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54B771424;
	Tue,  9 Sep 2025 08:39:44 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE7F43F694;
	Tue,  9 Sep 2025 08:39:46 -0700 (PDT)
Date: Tue, 9 Sep 2025 16:39:44 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, lcherian@marvell.com,
	bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 16/33] arm_mpam: Add helpers for managing the locking
 around the mon_sel registers
Message-ID: <aMBKQCmlj0Ne56/M@e133380.arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-17-james.morse@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822153048.2287-17-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_163954_803335_46854CCC 
X-CRM114-Status: GOOD (  37.13  )
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

Hi,

On Fri, Aug 22, 2025 at 03:29:57PM +0000, James Morse wrote:
> The MSC MON_SEL register needs to be accessed from hardirq context by the
> PMU drivers, making an irqsave spinlock the obvious lock to protect these

What PMU drivers?  MPAM itself doesn't define its monitors as PMUs, and
(as of this series) there is no intergration with perf.

> registers. On systems with SCMI mailboxes it must be able to sleep, meaning
> a mutex must be used.
> 
> Clearly these two can't exist at the same time.

The locks obvisouly do exist at the same time.  Do you mean that an
individual MSC must be either MMIO or SCMI/PCC?

(I don't think anything prevents both kinds of MSC from existing in the
same system?)

Above, you seem to imply that each kind of MSC interface requires a
different kind of lock, but below, you imply that the locks must be
used together, with holding the outer lock being a precondition for
taking the inner lock. 

Because these functions are introduced with no user, the code doesn't
offer much in the way of clues.  In particular, there is no indication
of what the outer lock is supposed to protect.

> Add helpers for the MON_SEL locking. The outer lock must be taken in a
> pre-emptible context before the inner lock can be taken. On systems with
> SCMI mailboxes where the MON_SEL accesses must sleep - the inner lock
> will fail to be 'taken' if the caller is unable to sleep. This will allow
> the PMU driver to fail without having to check the interface type of

Why is it acceptable to fail (i.e., don't the counts need to be read on
non-MMIO MSCs?)

> each MSC.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/resctrl/mpam_internal.h | 57 ++++++++++++++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index a623f405ddd8..c6f087f9fa7d 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -68,10 +68,19 @@ struct mpam_msc {
>  
>  	/*
>  	 * mon_sel_lock protects access to the MSC hardware registers that are
> -	 * affeted by MPAMCFG_MON_SEL.
> +	 * affected by MPAMCFG_MON_SEL, and the mbwu_state.
> +	 * Both the 'inner' and 'outer' must be taken.
> +	 * For real MMIO MSC, the outer lock is unnecessary - but keeps the
> +	 * code common with:
> +	 * Firmware backed MSC need to sleep when accessing the MSC, which
> +	 * means some code-paths will always fail. For these MSC the outer
> +	 * lock is providing the protection, and the inner lock fails to
> +	 * be taken if the task is unable to sleep.
> +	 *
>  	 * If needed, take msc->probe_lock first.
>  	 */
>  	struct mutex		outer_mon_sel_lock;
> +	bool			outer_lock_held;

Why not use mutex_is_locked()?

>  	raw_spinlock_t		inner_mon_sel_lock;

Why raw?  The commit message makes no mention of it.

(We really to need to sit on a specific CPU while holding this lock, so
"raw" makes sense.  But we're always doing this in a cross-call,
presumably with the hotplug lock held -- so I think we can't be
migrated anyway?)

>  	unsigned long		inner_mon_sel_flags;
>  
> @@ -81,6 +90,52 @@ struct mpam_msc {
>  	struct mpam_garbage	garbage;
>  };
>  
> +static inline bool __must_check mpam_mon_sel_inner_lock(struct mpam_msc *msc)
> +{
> +	/*
> +	 * The outer lock may be taken by a CPU that then issues an IPI to run
> +	 * a helper that takes the inner lock. lockdep can't help us here.
> +	 */
> +	WARN_ON_ONCE(!msc->outer_lock_held);
> +
> +	if (msc->iface == MPAM_IFACE_MMIO) {
> +		raw_spin_lock_irqsave(&msc->inner_mon_sel_lock, msc->inner_mon_sel_flags);
> +		return true;
> +	}
> +
> +	/* Accesses must fail if we are not pre-emptible */
> +	return !!preemptible();

What accesses?

In the MPAM_IFACE_MMIO case, this returns true even though non-
preemptible (because of getting the lock).

So, what is the semantics of the return value?

A comment would probably help.

> +}
> +
> +static inline void mpam_mon_sel_inner_unlock(struct mpam_msc *msc)
> +{
> +	WARN_ON_ONCE(!msc->outer_lock_held);
> +
> +	if (msc->iface == MPAM_IFACE_MMIO)
> +		raw_spin_unlock_irqrestore(&msc->inner_mon_sel_lock, msc->inner_mon_sel_flags);
> +}
> +
> +static inline void mpam_mon_sel_outer_lock(struct mpam_msc *msc)
> +{
> +	mutex_lock(&msc->outer_mon_sel_lock);
> +	msc->outer_lock_held = true;
> +}
> +

> +static inline void mpam_mon_sel_outer_unlock(struct mpam_msc *msc)
> +{
> +	msc->outer_lock_held = false;
> +	mutex_unlock(&msc->outer_mon_sel_lock);
> +}
> +
> +static inline void mpam_mon_sel_lock_held(struct mpam_msc *msc)
> +{
> +	WARN_ON_ONCE(!msc->outer_lock_held);
> +	if (msc->iface == MPAM_IFACE_MMIO)
> +		lockdep_assert_held_once(&msc->inner_mon_sel_lock);
> +	else
> +		lockdep_assert_preemption_enabled();
> +}
> +

Except that monitors may need to be accessed in interrupt context,
I don't see an obvious difference between controls and monitors that
motivates this locking model.

Is the outer lock ever needfully held for extended periods of time,
making a (raw) spinlock unsuitable?

Cheers
---Dave

