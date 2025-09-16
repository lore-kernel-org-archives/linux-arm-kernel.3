Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981E3CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 10:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INzFoqPIJJ4zIhDs1tk4/0Iv3QjJ1kD4uj5WDiJm1Q8=; b=z6J3946UQn+Tt3gCs9/MB1wpWj
	OJCq93psrk6t/ZGNMpnmPbRBUPR28n1oYXJqTmct4PrIl2fqSVpu0CompCY7aTTRI9SJhjXCtfCDj
	0aqjFsORFqu3vV4R7XoLbk+8UorxBnmo0OedMrq1ZRT+hH+YnNMN7eNGOLo6EZe8bXosrx7TAU9x2
	/Gdggdp/PbsbNlYEqJtuws++NXmxmB0Yc2TpwvEQT3wInviBYnAedbdS80MTZfBFkggMJ+4WHKF3y
	jL1+mF5dEfD0RHA2Ux2VM5Q+ltQ6QB17h7chtINHgwu8oLZc8SZfyEHC0xUk1mnLIKoue7LtyJJK2
	6m4bEpaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySxG-00000007XPO-32ET;
	Tue, 16 Sep 2025 10:30:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySxF-00000007XOz-16RK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 10:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 93A74600AE;
	Tue, 16 Sep 2025 10:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7148C4CEEB;
	Tue, 16 Sep 2025 10:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758018632;
	bh=SAAJtRVKcJwiJyR3IHIUauj/vRpTKvM8j3kpPYHSy0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BHb+dGdyRn7Zj3bk8i+PMkTmR3IvnW/TifXFm9rRvMPO/ZaO5pXce+RHUf/AYLN5m
	 ZFjrymyO4KJP39QuuWUan4ZWhzUkqkwGi9L4zGjQ69ZuV4LvnnIIwSrNtKWLRNpY/e
	 9Xd2t3xgqXbIMDet89oXA17Hz7dxpGgF4MThYHz82vFlVmkJjQdOqewWp9Z9wFJ54n
	 pnXV10t8OJNalk/7VJZnza0DYdlBgPBtnX0op5oV7wN8o5GrSxX4PYJarBoQ7GnYIE
	 Y64YxNdJWhIDL6bVgnejuGZKtkQxB5z2PPwj9vNUeEMpXwlAu/yx+9N3bKoHMHLkeK
	 HpbRHh1G/qxdQ==
Date: Tue, 16 Sep 2025 11:30:26 +0100
From: Will Deacon <will@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: catalin.marinas@arm.com, anshuman.khandual@arm.com,
	quic_zhenhuah@quicinc.com, ryan.roberts@arm.com,
	kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com, mark.rutland@arm.com, urezki@gmail.com,
	jthoughton@google.com
Subject: Re: [RESEND PATCH v5] arm64: Enable vmalloc-huge with ptdump
Message-ID: <aMk8QhkumtEoPVTh@willie-the-truck>
References: <20250723161827.15802-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723161827.15802-1-dev.jain@arm.com>
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

Hi Dev,

On Wed, Jul 23, 2025 at 09:48:27PM +0530, Dev Jain wrote:
> @@ -1301,16 +1319,76 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>  	}
>  
>  	table = pmd_offset(pudp, addr);
> +
> +	/*
> +	 * Our objective is to prevent ptdump from reading a PMD table which has
> +	 * been freed.  Assume that ptdump_walk_pgd() (call this thread T1)
> +	 * executes completely on CPU1 and pud_free_pmd_page() (call this thread
> +	 * T2) executes completely on CPU2. Let the region sandwiched by the
> +	 * mmap_write_lock/unlock in T1 be called CS (the critical section).
> +	 *
> +	 * Claim: The CS of T1 will never operate on a freed PMD table.
> +	 *
> +	 * Proof:
> +	 *
> +	 * Case 1: The static branch is visible to T2.
> +	 *
> +	 * Case 1 (a): T1 acquires the lock before T2 can.
> +	 * T2 will block until T1 drops the lock, so pmd_free() will only be
> +	 * executed after T1 exits CS.
> +	 *
> +	 * Case 1 (b): T2 acquires the lock before T1 can.
> +	 * The sequence of barriers issued in __flush_tlb_kernel_pgtable()
> +	 * ensures that an empty PUD (via pud_clear()) is visible to T1 before
> +	 * T1 can enter CS, therefore it is impossible for the CS to get hold
> +	 * of the address of the isolated PMD table.
> +	 *
> +	 * Case 2: The static branch is not visible to T2.
> +	 *
> +	 * Since static_branch_enable() (via dmb(ish)) and mmap_write_lock()
> +	 * have acquire semantics, it is guaranteed that the static branch
> +	 * will be visible to all CPUs before T1 can enter CS. The static
> +	 * branch not being visible to T2 therefore guarantees that T1 has
> +	 * not yet entered CS .... (i)
> +	 * The sequence of barriers via __flush_tlb_kernel_pgtable() in T2
> +	 * implies that if the invisibility of the static branch has been
> +	 * observed by T2 (i.e static_branch_unlikely() is observed as false),
> +	 * then all CPUs will have observed an empty PUD ... (ii)
> +	 * Combining (i) and (ii), we conclude that T1 observes an empty PUD
> +	 * before entering CS => it is impossible for the CS to get hold of
> +	 * the address of the isolated PMD table. Q.E.D
> +	 *
> +	 * We have proven that the claim is true on the assumption that
> +	 * there is no context switch for T1 and T2. Note that the reasoning
> +	 * of the proof uses barriers operating on the inner shareable domain,
> +	 * which means that they will affect all CPUs, and also a context switch
> +	 * will insert extra barriers into the code paths => the claim will
> +	 * stand true even if we drop the assumption.
> +	 *
> +	 * It is also worth reasoning whether something can go wrong via
> +	 * pud_free_pmd_page() -> __pmd_free_pte_page(), since the latter
> +	 * will be called locklessly on this code path.
> +	 *
> +	 * For Case 1 (a), T2 will block until CS is finished, so we are safe.
> +	 * For Case 1 (b) and Case 2, the PMD table will be isolated before
> +	 * T1 can enter CS, therefore it is safe for T2 to operate on the
> +	 * PMD table locklessly.
> +	 */

Although I can see that you put a lot of effort into this comment, I
think we should just remove it. Instead, we should have a litmus test
in the commit message and probably just some small comments here to
explain e.g. why the mmap_read_lock() critical section is empty.

I'm currently trying to put together a litmus test with James (cc'd) so
maybe we can help you out with that part.

In the meantime...

> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
> index 421a5de806c6..65335c7ba482 100644
> --- a/arch/arm64/mm/ptdump.c
> +++ b/arch/arm64/mm/ptdump.c
> @@ -283,6 +283,13 @@ void note_page_flush(struct ptdump_state *pt_st)
>  	note_page(pt_st, 0, -1, pte_val(pte_zero));
>  }
>  
> +static void arm64_ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm)
> +{
> +	static_branch_enable(&arm64_ptdump_lock_key);
> +	ptdump_walk_pgd(st, mm, NULL);
> +	static_branch_disable(&arm64_ptdump_lock_key);
> +}

What serialises the toggling of the static key here? For example, I can't
see what prevents a kernel page-table dump running concurrently with a
check_wx() and the key ending up in the wrong state.

Either we need an additional lock or perhaps using
static_branch_{inc,dec}() would work instead? I haven't thought too hard
about that but it looks like we need _something_.

Will

