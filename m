Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F47E9B37F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nbxn4UV6/YFUf6QCWl6jGJ5FR/U81nsBaDLd3N1l9eE=; b=zlQe1ImD4K4s4oeBdOHyDxYs8U
	SofxOqBFPmOiaQid0LFeHUKyFTySXMgweGO+8HLKypvFAclpqeouyJrxZkJZAARYTy3wywaAA8OjA
	rnqsAITGFgA4696q48WJ1QGF6bZyLLEsKrCfBIIB1ZJTpxnY9RnyFtoxBVrVDV8h8IEogJAvQD/+n
	4Vuyve9WH8PBxSXi4gJ1ajsLxhbmw3FpZvEn4wqd1qTe8l07zwd3SBwPGP5PHURwu6C6ro1gXaSAi
	pt9GJ6TaCF2B6/pNP8i2kBWEjUCAayjw0KI46KjIOd1oJ+DZ3MMMSJY5Gzq5/hyfJ11k1iqhEsaRv
	XcxDDvBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3Tw-0000000D8co-3daz;
	Mon, 02 Mar 2026 13:38:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3Tu-0000000D8cS-2yEV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:38:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1833214BF;
	Mon,  2 Mar 2026 05:38:34 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E88A3F73B;
	Mon,  2 Mar 2026 05:38:38 -0800 (PST)
Date: Mon, 2 Mar 2026 13:38:35 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/1] kernel: kprobes: fix cur_kprobe corruption during
 re-entrant kprobe_busy_begin() calls
Message-ID: <aaWS20g-jGu8mCKH@J2N7QTR9R3>
References: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
 <20260302105347.3602192-1-khaja.khaji@oss.qualcomm.com>
 <20260302105347.3602192-2-khaja.khaji@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302105347.3602192-2-khaja.khaji@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_053842_838234_B6D365CE 
X-CRM114-Status: GOOD (  28.78  )
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
Cc: linux-arm-msm@vger.kernel.org, dev.jain@arm.com, linux-kernel@vger.kernel.org, mhiramat@kernel.org, catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Mar 02, 2026 at 04:23:47PM +0530, Khaja Hussain Shaik Khaji wrote:
> Fix cur_kprobe corruption that occurs when kprobe_busy_begin() is called
> re-entrantly during an active kprobe handler.
> 
> Previously, kprobe_busy_begin() unconditionally overwrites current_kprobe
> with &kprobe_busy, and kprobe_busy_end() writes NULL. This approach works
> correctly when no kprobe is active but fails during re-entrant calls.

The structure of kprobe_busy_begin() and kprobe_busy_end() implies that
re-entrancy is unexpected, and something that should be avoided somehow.

Is that the case, or are kprobe_busy_begin() and kprobe_busy_end()
generally buggy?

> On arm64, arm64_enter_el1_dbg() re-enables IRQs before invoking kprobe
> handlers. 

No, arm64_enter_el1_dbg() does not re-enable IRQs. It only manages state
tracking.

I don't know if you meant to say a different function here, but this
statement is clearly wrong.

> This allows an IRQ during kretprobe
> entry_handler to trigger kprobe_flush_task() via softirq, which calls
> kprobe_busy_begin/end and corrupts cur_kprobe.

This would be easier to follow if the backtrace were included in the
commit message, rather than in the cover letter, such that it could be
referred to easily.

> Problem flow: kretprobe entry_handler -> IRQ -> softirq ->
> kprobe_flush_task -> kprobe_busy_begin/end -> cur_kprobe corruption.

We shouldn't take the IRQ in the first place here. AFAICT, nothing
unmasks IRQs prior to the entry handler.

That suggests that something is going wrong *within* your entry handler
that causes IRQs to be unmasked unexpectedly.

Please can we find out *exactly* where IRQs get unmasked for the first
time?

Mark.

> 
> This corruption causes two issues:
> 1. NULL cur_kprobe in setup_singlestep leading to panic in single-step
> handler
> 2. kprobe_status overwritten with HIT_ACTIVE during execute-out-of-line
> window
> 
> Implement a per-CPU re-entrancy tracking mechanism with:
> - A depth counter to track nested calls
> - Saved state for current_kprobe and kprobe_status
> - Save state on first entry, restore on final exit
> - Increment depth counter for nested calls only
> 
> This approach maintains compatibility with existing callers as
> save/restore of NULL is a no-op.
> 
> Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
> ---
>  kernel/kprobes.c | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index e2cd01cf5968..47a4ae50ee6c 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -70,6 +70,15 @@ static bool kprobes_all_disarmed;
>  static DEFINE_MUTEX(kprobe_mutex);
>  static DEFINE_PER_CPU(struct kprobe *, kprobe_instance);
>  
> +/* Per-CPU re-entrancy state for kprobe_busy_begin/end.
> + * kprobe_busy_begin() may be called while a kprobe handler
> + * is active - e.g. kprobe_flush_task() via softirq during
> + * kretprobe entry_handler on arm64 where IRQs are re-enabled.
> + */
> +static DEFINE_PER_CPU(int, kprobe_busy_depth);
> +static DEFINE_PER_CPU(struct kprobe *, kprobe_busy_saved_current);
> +static DEFINE_PER_CPU(unsigned long, kprobe_busy_saved_status);
> +
>  kprobe_opcode_t * __weak kprobe_lookup_name(const char *name,
>  					unsigned int __unused)
>  {
> @@ -1307,14 +1316,31 @@ void kprobe_busy_begin(void)
>  	struct kprobe_ctlblk *kcb;
>  
>  	preempt_disable();
> -	__this_cpu_write(current_kprobe, &kprobe_busy);
> -	kcb = get_kprobe_ctlblk();
> -	kcb->kprobe_status = KPROBE_HIT_ACTIVE;
> +	if (__this_cpu_read(kprobe_busy_depth) == 0) {
> +		kcb = get_kprobe_ctlblk();
> +		__this_cpu_write(kprobe_busy_saved_current,
> +				 __this_cpu_read(current_kprobe));
> +		__this_cpu_write(kprobe_busy_saved_status,
> +				 kcb->kprobe_status);
> +		__this_cpu_write(current_kprobe, &kprobe_busy);
> +		kcb->kprobe_status = KPROBE_HIT_ACTIVE;
> +	}
> +	__this_cpu_inc(kprobe_busy_depth);
>  }
>  
>  void kprobe_busy_end(void)
>  {
> -	__this_cpu_write(current_kprobe, NULL);
> +	struct kprobe_ctlblk *kcb;
> +
> +	__this_cpu_dec(kprobe_busy_depth);
> +
> +	if (__this_cpu_read(kprobe_busy_depth) == 0) {
> +		kcb = get_kprobe_ctlblk();
> +		__this_cpu_write(current_kprobe,
> +				 __this_cpu_read(kprobe_busy_saved_current));
> +		kcb->kprobe_status =
> +				__this_cpu_read(kprobe_busy_saved_status);
> +	}
>  	preempt_enable();
>  }
>  
> -- 
> 2.34.1
> 

