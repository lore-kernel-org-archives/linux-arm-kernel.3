Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55983CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 18:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZ7wmyeoCr/n+eEz+2rVPc9HZYTWQxyrTPZm5rRd0V8=; b=QPBE9qJj11t4grc/GVPRPpn2nf
	alzmzswExezOEQ5t1LkOd9Tqfdhfhq2rdy9r1pb6eni6m02vx5ZDRrcQxpqNJuo8kMQ32Ef4RJNsR
	SE8kGlTWyY6yj21RQz1ZmcsnzUUYij7t3Z+LjbPL/xCH+viirzsKA77WS6jD3INPW0DeOrvy+QMVl
	gO5UEBlloZz8+WyU4q5Uk49kMJ7pbHl18maMjNOlxO6zg74W2RL4mh/mzSVDHYcXyqlVEE1ibwyPK
	zOL9o5t7qoS71IpoxffupN6U0liu9JFfQ2S8/r00+AgruUi1FCJt3DziSJwUSp01JN5hfaIACAse9
	2JhlQdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9oqN-00000008eK9-48E8;
	Fri, 17 Oct 2025 18:06:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9oqM-00000008eJz-2cMD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 18:06:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BCB2F6482E;
	Fri, 17 Oct 2025 18:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76468C4CEE7;
	Fri, 17 Oct 2025 18:06:19 +0000 (UTC)
Date: Fri, 17 Oct 2025 19:06:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Huang Ying <ying.huang@linux.alibaba.com>
Cc: Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Gavin Shan <gshan@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] arm64, mm: avoid always making PTE dirty in pte_mkwrite()
Message-ID: <aPKFmHg-FrkGJxWd@arm.com>
References: <20251015023712.46598-1-ying.huang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015023712.46598-1-ying.huang@linux.alibaba.com>
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

On Wed, Oct 15, 2025 at 10:37:12AM +0800, Huang Ying wrote:
> Current pte_mkwrite_novma() makes PTE dirty unconditionally.  This may
> mark some pages that are never written dirty wrongly.  For example,
> do_swap_page() may map the exclusive pages with writable and clean PTEs
> if the VMA is writable and the page fault is for read access.
> However, current pte_mkwrite_novma() implementation always dirties the
> PTE.  This may cause unnecessary disk writing if the pages are
> never written before being reclaimed.
> 
> So, change pte_mkwrite_novma() to clear the PTE_RDONLY bit only if the
> PTE_DIRTY bit is set to make it possible to make the PTE writable and
> clean.
> 
> The current behavior was introduced in commit 73e86cb03cf2 ("arm64:
> Move PTE_RDONLY bit handling out of set_pte_at()").  Before that,
> pte_mkwrite() only sets the PTE_WRITE bit, while set_pte_at() only
> clears the PTE_RDONLY bit if both the PTE_WRITE and the PTE_DIRTY bits
> are set.
> 
> To test the performance impact of the patch, on an arm64 server
> machine, run 16 redis-server processes on socket 1 and 16
> memtier_benchmark processes on socket 0 with mostly get
> transactions (that is, redis-server will mostly read memory only).
> The memory footprint of redis-server is larger than the available
> memory, so swap out/in will be triggered.  Test results show that the
> patch can avoid most swapping out because the pages are mostly clean.
> And the benchmark throughput improves ~23.9% in the test.
> 
> Fixes: 73e86cb03cf2 ("arm64: Move PTE_RDONLY bit handling out of set_pte_at()")
> Signed-off-by: Huang Ying <ying.huang@linux.alibaba.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Gavin Shan <gshan@redhat.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Cc: Yicong Yang <yangyicong@hisilicon.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm64/include/asm/pgtable.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index aa89c2e67ebc..0944e296dd4a 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -293,7 +293,8 @@ static inline pmd_t set_pmd_bit(pmd_t pmd, pgprot_t prot)
>  static inline pte_t pte_mkwrite_novma(pte_t pte)
>  {
>  	pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
> -	pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
> +	if (pte_sw_dirty(pte))
> +		pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
>  	return pte;
>  }

This seems to be the right thing. I recall years ago I grep'ed
(obviously not hard enough) and most pte_mkwrite() places had a
pte_mkdirty(). But I missed do_swap_page() and possibly others.

For this patch:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

I wonder whether we should also add (as a separate patch):

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 830107b6dd08..df1c552ef11c 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -101,6 +101,7 @@ static void __init pte_basic_tests(struct pgtable_debug_args *args, int idx)
 	WARN_ON(pte_dirty(pte_mkclean(pte_mkdirty(pte))));
 	WARN_ON(pte_write(pte_wrprotect(pte_mkwrite(pte, args->vma))));
 	WARN_ON(pte_dirty(pte_wrprotect(pte_mkclean(pte))));
+	WARN_ON(pte_dirty(pte_mkwrite_novma(pte_mkclean(pte))));
 	WARN_ON(!pte_dirty(pte_wrprotect(pte_mkdirty(pte))));
 }

For completeness, also (and maybe other combinations):

	WARN_ON(!pte_write(pte_mkdirty(pte_mkwrite_novma(pte))));

I cc'ed linux-mm in case we missed anything. If nothing raised, I'll
queue it next week.

Thanks.

-- 
Catalin

