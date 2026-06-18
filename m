Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D924CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPaO85K8HsFpXgFwmm6JTmmtU9FLtX+v9bVLPsQDyqo=; b=QSLxaeL2GHw+7qUUbJ7svEP1bd
	lr/JLCdUevRzk1kGQLksgkAVC+IY1ssiKNBFnmzIGQu4ewx9P1Y2o27C11bD5fzBp2ohPYgflEmkD
	Tu2Bp2BEiE/Go5WLPXzDPm5RptF+SwBfxog8sl9S+Rk9sJLiK+GyfGlwlJLuZTpLPchslhdm8QP4D
	/14YRl3jQdj2ixBbHzsdKDMz2Unfw+rGlIYatPfwYZjNTa1khlz5BbnLlaob+AHMzAHP8waqBgIXM
	PYihmUMfuDV21qHFzu9UghKjBinulXZl3t1/DeM5leC51SNEtlpaRyN8oSRzKj/X9FHeJOakZw57U
	DP4u+vwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEYL-00000001U62-47aF;
	Thu, 18 Jun 2026 15:21:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEYI-00000001U5V-3LFW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:21:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA7DC478C;
	Thu, 18 Jun 2026 08:21:04 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5DC13F62B;
	Thu, 18 Jun 2026 08:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781796069; bh=oGgwF8aK/7rYqvc78U7lWrqC/B0wHzxcghfeIw54Foc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E0lxLHFB4fRWfL3eM0siPVQkV8HiRRr+RALT3wAz3iGwfhhyCFg0xsK44FSjpCGFH
	 1bTE1155UVzFhxgBHyKbujkwPDOe9koHGtsqsZSdqKUBtb167a0AAgUZXv4dSpFlRJ
	 KafG3gPjYY38BjD7yJ3Cm1vg6U/j3em48dheHsdI=
Date: Thu, 18 Jun 2026 20:51:05 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Sayali Kulkarni <sk@gentwo.org>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, will@kernel.org, ryan.roberts@arm.com,
	yang@os.amperecomputing.com, cl@gentwo.org,
	sskulkarni@amperecomputing.com
Subject: Re: [PATCH v2] arm64: tlbflush: Reset active_cpu on ASID rollover
Message-ID: <ajQM4bkKfWdPowpM@a079125.arm.com>
References: <airWIxSd_a5kR65-@arm.com>
 <20260612232254.2856649-1-sk@gentwo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260612232254.2856649-1-sk@gentwo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_082110_915756_8E79A1F0 
X-CRM114-Status: GOOD (  26.14  )
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

On Fri, Jun 12, 2026 at 04:21:06PM -0700, Sayali Kulkarni wrote:
> From: Sayali Kulkarni <sskulkarni@amperecomputing.com>
> 
> Hi Catalin,  
> 
> Thank you for the review. I’ve addressed your feedback in v2:  
> 
> - Moved `WRITE_ONCE(mm->context.active_cpu, ACTIVE_CPU_NONE)` from `check_and_switch_context()` to `new_context()` after the `set_asid` label. At this point, a brand new ASID has been allocated that no CPU has ever used, so the reset is safe even for multi-threaded processes where other CPUs may still be running with the old ASID via `reserved_asids`.  
> - Updated the commit message to correct the safety reasoning: `flush_context()` only sets `tlb_flush_pending`; it does not issue a global TLB flush.  
> 
> Thanks,  
> Sayali
> 
> 
> Once active_cpu flips to ACTIVE_CPU_MULTIPLE it never resets, even if
> the process settles back to one CPU. Reset it to ACTIVE_CPU_NONE in
> new_context() after a new ASID is allocated at the set_asid label.
> 
> At this point a brand new ASID has been assigned that no CPU has ever
> used, so ACTIVE_CPU_NONE accurately reflects reality. Any other threads
> of the same process continue running with the old ASID via
> reserved_asids and are unaffected.
> 
> This gives processes a fresh chance at the local-only flush fast path
> after each ASID generation rollover.
> 
> Signed-off-by: Sayali Kulkarni <sskulkarni@amperecomputing.com> (Ampere)
> ---
>  arch/arm64/mm/context.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
> index f34ed78393e0..46c7fd07b9bf 100644
> --- a/arch/arm64/mm/context.c
> +++ b/arch/arm64/mm/context.c
> @@ -209,6 +209,7 @@ static u64 new_context(struct mm_struct *mm)
>  set_asid:
>  	__set_bit(asid, asid_map);
>  	cur_idx = asid;
> +	WRITE_ONCE(mm->context.active_cpu, ACTIVE_CPU_NONE);

Can the above store race with the store to active_cpu in another thread,
that updates it to ACTIVE_CPU_MULTIPLE ?

Lets say we have two threads both initially running in CPU 0,

Thread 1: Runs in CPU 0 

Encounters a rollover, updates mm->context.active_cpu to ACTIVE_CPU_NONE and
updates mm->context.id to new asid.

Thread 2: Scheduled to run on CPU 1 for the first time

Observes the updated mm->context.id that belongs to the current
generation(after the rollover) and hence proceeds to switch_mm_fastpath
and ends up updating the active_cpu to ACTIVE_CPU_MULTIPLE. 

If Thread 1 and Thread 2 races, then active_cpu can get corrupted ?

The reason this could be possible is that, write to active_cpu and
mm->context.id can get reordered and we need to enforce ordering for
correctness ? 

Do you see this as a valid scenario ?

--
Thanks,
Linu Cherian.










