Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D053C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cI/8O2/D5ep0lVKPSdtjHlEeEGGOBvVPbnuVh1y/EII=; b=vViEz0PdBeVSyAqAzysUJ10mye
	SosU2d2z5llAz6qG+7o8smBLEUavd9lsN34ZyKteE/yoEjYoxC0mQA+uksQP56k3ffwTSEJDpVGhn
	jmrkKII5VvsJ5IEMI+clEhcVfSA1d3YQbdDuEVaQgeC69fdyxlQ/EgYYUeZ7mvPsGm8cN4n5oKqAN
	NIJ9ZDX1wbmp+u3x/ZA5Ap5NZY4q4/ZfRfRFUpVS5fiwrtGPKdTwizqQrWrSNPBGa9GWdoaqDGE9z
	7bgYIRkh/IVVm5i6NHMqtztP6ZEkUMJ47PSCKjmldXGPNEoMX60Y+V2laroFnMMog71fTi3rh6cO+
	CxSGUghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeym-0000000EIgm-1sfE;
	Fri, 04 Jul 2025 11:53:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeUd-0000000ECom-3jy4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 11:22:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 425376145A;
	Fri,  4 Jul 2025 11:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA469C4CEEF;
	Fri,  4 Jul 2025 11:22:08 +0000 (UTC)
Date: Fri, 4 Jul 2025 12:22:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: will@kernel.org, anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
	ryan.roberts@arm.com, kevin.brodsky@arm.com,
	yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com
Subject: Re: [PATCH v4] arm64: Enable vmalloc-huge with ptdump
Message-ID: <aGe5XjWKhgjzcw7L@arm.com>
References: <20250626052524.332-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626052524.332-1-dev.jain@arm.com>
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

On Thu, Jun 26, 2025 at 10:55:24AM +0530, Dev Jain wrote:
> @@ -1301,16 +1314,39 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>  	}
>  
>  	table = pmd_offset(pudp, addr);
> +	/*
> +	 * Isolate the PMD table; in case of race with ptdump, this helps
> +	 * us to avoid taking the lock in __pmd_free_pte_page().
> +	 *
> +	 * Static key logic:
> +	 *
> +	 * Case 1: If ptdump does static_branch_enable(), and after that we
> +	 * execute the if block, then this patches in the read lock, ptdump has
> +	 * the write lock patched in, therefore ptdump will never read from
> +	 * a potentially freed PMD table.
> +	 *
> +	 * Case 2: If the if block starts executing before ptdump's
> +	 * static_branch_enable(), then no locking synchronization
> +	 * will be done. However, pud_clear() + the dsb() in
> +	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an

Statements like "observes" really need to be relative, not absolute.
Like in "observes an empty PUD before/after ...".

> +	 * empty PUD. Thus, it will never walk over a potentially freed
> +	 * PMD table.
> +	 */
> +	pud_clear(pudp);
> +	__flush_tlb_kernel_pgtable(addr);
> +	if (static_branch_unlikely(&ptdump_lock_key)) {
> +		mmap_read_lock(&init_mm);
> +		mmap_read_unlock(&init_mm);
> +	}

This needs a formal model ;).

static_branch_enable() is called before the mmap_write_lock(), so even
if the above observes the new branch, it may do the read_unlock() before
the ptdump_walk_pgd() attempted the write lock. So your case 1
description is not entirely correct.

I don't get case 2. You want to ensure pud_clear() is observed by the
ptdump code before the pmd_free(). The DSB in the TLB flushing code
ensures some ordering between the pud_clear() and presumably something
that the ptdump code can observe as well. Would that be the mmap
semaphore? However, the read_lock would only be attempted if this code
is seeing the static branch update, which is not guaranteed. I don't
think it even matters since the lock may be released anyway before the
write_lock in ptdump.

For example, you do a pud_clear() above, skip the whole static branch.
The ptdump comes along on another CPU but does not observe the
pud_clear() since there's no synchronisation. It goes ahead and
dereferences it while this CPU does a pmd_free().

And I can't get my head around memory ordering, it doesn't look sound.
static_branch_enable() I don't think has acquire semantics, at least not
in relation to the actual branch update. The static_branch_unlikely()
test, again, not sure what guarantees it has (I don't think it has any
in relation to memory loads). Maybe you have worked it all out and is
fine but it needs a better explanation and ideally some simple formal
model. Show it's correct with a global variable first and then we can
optimise with static branches.

-- 
Catalin

