Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09A6C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 12:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihQ/VbWmZcFyxXNFSmYvt2uTSVuE8Kjfs2Jlv/Uz9z8=; b=REQU8ONpI602iXzNXrX1kBKOYX
	nt1tIA+1ScDHq4nLx3alTF3izyiLxm2cLLHgZMfwzUSzI9EZipDzeB74wkOenp15fxxKgc3bP7UV9
	BTTdC2E4vghFBy+Aj/tk9qD4zsecILRxKWnqEvi4STobGlTP2ekH8t5IqNp3JMrR24I265hztW1Mf
	QWKRmpctJY+d33GwXpLRhUTpYVjUn7GKJ5wBsumjmzqt1vBprd0H59wRFC2JkgH6ErWSmAVOeKBC/
	HMvQaw3s4Guuvx07J+gHP1PFVXCXUvHmptY0+NkTtn+h39Kha5tMPQYJW5qmeTx9T78Cpq7tgxUTf
	I5GkCxVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM3se-00000007KGD-3r6v;
	Mon, 02 Jun 2025 12:03:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM3qS-00000007K9y-3Cfq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 12:00:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E30C5C4AD3;
	Mon,  2 Jun 2025 11:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DEE9C4CEEB;
	Mon,  2 Jun 2025 12:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748865647;
	bh=REd3vAZDGWbEM2oAxUFtW2OPMm/SFCgdjgUeoy/uMrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YszuxWwhUjdEQtlyCKREgAR2z49sjnuuRwXwNgzY8E4ijsIkxuianWTmx806I9Hkn
	 53y9vFEnRx+s76MYFk5TSgQV3nuCSPJYTFNYm2VdoP6esgTAhhj+npAkVRdhhj+LgY
	 TEr+PJh5HVzuICi51U6bYtwUgIjZnMYzLtBUuJaz5HFWd5HuNMjsG0LaXYCzKpGSQT
	 MNaKEmwoQqHYn8wsMlIKJPDO3JhTpBenXDHYDL5AhWHNTCXMWN3H0cOdIxBtjpy/aJ
	 gANXq6WqyEjvc67Qr3Ozrpu3wlux8N8S7+4xOydalj1pmuGQF6SmEkVs4b2IAH9ccU
	 iqAJUB3AiWxaA==
Date: Mon, 2 Jun 2025 13:00:43 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Barry Song <baohua@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64/mm: Close theoretical race where stale TLB
 entry remains valid
Message-ID: <20250602120042.GB1227@willie-the-truck>
References: <20250530152445.2430295-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530152445.2430295-1-ryan.roberts@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_050048_893782_9A04B96B 
X-CRM114-Status: GOOD (  35.94  )
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

On Fri, May 30, 2025 at 04:23:47PM +0100, Ryan Roberts wrote:
> Commit 3ea277194daa ("mm, mprotect: flush TLB if potentially racing with
> a parallel reclaim leaving stale TLB entries") describes a race that,
> prior to the commit, could occur between reclaim and operations such as
> mprotect() when using reclaim's tlbbatch mechanism. See that commit for
> details but the summary is:
> 
> """
> Nadav Amit identified a theoritical race between page reclaim and
> mprotect due to TLB flushes being batched outside of the PTL being held.
> 
> He described the race as follows:
> 
> 	CPU0				CPU1
> 	----				----
> 					user accesses memory using RW PTE
> 					[PTE now cached in TLB]
> 	try_to_unmap_one()
> 	==> ptep_get_and_clear()
> 	==> set_tlb_ubc_flush_pending()
> 					mprotect(addr, PROT_READ)
> 					==> change_pte_range()
> 					==> [ PTE non-present - no flush ]
> 
> 					user writes using cached RW PTE
> 	...
> 
> 	try_to_unmap_flush()
> """
> 
> The solution was to insert flush_tlb_batched_pending() in mprotect() and
> friends to explcitly drain any pending reclaim TLB flushes. In the
> modern version of this solution, arch_flush_tlb_batched_pending() is
> called to do that synchronisation.
> 
> arm64's tlbbatch implementation simply issues TLBIs at queue-time
> (arch_tlbbatch_add_pending()), eliding the trailing dsb(ish). The
> trailing dsb(ish) is finally issued in arch_tlbbatch_flush() at the end
> of the batch to wait for all the issued TLBIs to complete.
> 
> Now, the Arm ARM states:
> 
> """
> The completion of the TLB maintenance instruction is guaranteed only by
> the execution of a DSB by the observer that performed the TLB
> maintenance instruction. The execution of a DSB by a different observer
> does not have this effect, even if the DSB is known to be executed after
> the TLB maintenance instruction is observed by that different observer.
> """
> 
> arch_tlbbatch_add_pending() and arch_tlbbatch_flush() conform to this
> requirement because they are called from the same task (either kswapd or
> caller of madvise(MADV_PAGEOUT)), so either they are on the same CPU or
> if the task was migrated, __switch_to() contains an extra dsb(ish).
> 
> HOWEVER, arm64's arch_flush_tlb_batched_pending() is also implemented as
> a dsb(ish). But this may be running on a CPU remote from the one that
> issued the outstanding TLBIs. So there is no architectural gurantee of
> synchonization. Therefore we are still vulnerable to the theoretical
> race described in Commit 3ea277194daa ("mm, mprotect: flush TLB if
> potentially racing with a parallel reclaim leaving stale TLB entries").
> 
> Fix this by flushing the entire mm in arch_flush_tlb_batched_pending().
> This aligns with what the other arches that implement the tlbbatch
> feature do.
> 
> Fixes: 43b3dfdd0455 ("arm64: support batched/deferred tlb shootdown during page reclamation/migration")

Barry -- it would be great if you could re-run some of the benchmarks
from that commit with this fix applied.

> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index eba1a98657f1..7d564c2a126f 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -323,13 +323,14 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>  }
> 
>  /*
> - * If mprotect/munmap/etc occurs during TLB batched flushing, we need to
> - * synchronise all the TLBI issued with a DSB to avoid the race mentioned in
> - * flush_tlb_batched_pending().
> + * If mprotect/munmap/etc occurs during TLB batched flushing, we need to ensure
> + * all the previously issued TLBIs targeting mm have completed. But since we
> + * can be executing on a remote CPU, a DSB cannot guarrantee this like it can
> + * for arch_tlbbatch_flush(). Our only option is to flush the entire mm.
>   */
>  static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
>  {
> -	dsb(ish);
> +	flush_tlb_mm(mm);
>  }

Thanks, Ryan. I'll pick this as a fix, but perhaps the core code should
do this given that all the architectures selecting
ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH now have an identical implementation
of arch_flush_tlb_batched_pending()?

Will

