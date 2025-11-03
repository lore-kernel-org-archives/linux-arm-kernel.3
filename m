Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EEACCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOqyI9S+KGv31QsqnF4bpJn1/yga6iCb83NHjSfOK7w=; b=13kw64GmwHvclhyxfCEOtdwUCN
	mzt0r9jswY0R12Th0Xe2vTVWXR5kSXisRZez7Qpm21OCjoFGcnPMUDeIWcshC9I8U4hQm7gIOTQGi
	JMCyWnY7X/1RgfBFVFy+oaUlxxEAwW6O9jG+f2gszys+H20TRWKT/VyqnK9XM0O+k7QrYEFKwXerK
	0z5prwGtmeOJPcltbqR2BKhKVAx6rlWBUGL/dyhC/2Qj9+yg24JvahL40DIVdrU1pOuWEzSMQffuI
	wgOzhn7GQpQ8bzVfbKV6oOec5+STyT3YxgcD0ED276DYG8Mbjo3Xl/IhG8NGLjhd9srBT77chvekX
	J5hX/Vag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvZa-0000000A1HZ-2PYc;
	Mon, 03 Nov 2025 14:30:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvZZ-0000000A1HP-2UW3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5F5560191;
	Mon,  3 Nov 2025 14:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA09CC4CEFD;
	Mon,  3 Nov 2025 14:30:14 +0000 (UTC)
Date: Mon, 3 Nov 2025 14:30:12 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Will Deacon <will@kernel.org>, Aishwarya.TCV@arm.com
Subject: Re: [PATCH] mm/huge_memory: Initialise the tags of the huge zero
 folio
Message-ID: <aQi8dA_QpXM8XqrE@arm.com>
References: <20251031170133.280742-1-catalin.marinas@arm.com>
 <aQiu-hU3x5V5drHF@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQiu-hU3x5V5drHF@finisterre.sirena.org.uk>
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

On Mon, Nov 03, 2025 at 01:32:42PM +0000, Mark Brown wrote:
> On Fri, Oct 31, 2025 at 04:57:50PM +0000, Catalin Marinas wrote:
> 
> > On arm64 with MTE enabled, a page mapped as Normal Tagged (PROT_MTE) in
> > user space will need to have its allocation tags initialised. This is
> > normally done in the arm64 set_pte_at() after checking the memory
> > attributes. Such page is also marked with the PG_mte_tagged flag to
> > avoid subsequent clearing. Since this relies on having a struct page,
> > pte_special() mappings are ignored.
> 
> We are seeing breakage in userspace on a range of arm64 platforms which
> bisects to this commit in -next.  We see traces like:
> 
> [   59.746701] Internal error: Oops - Undefined instruction: 0000000002000000 [#1]  SMP
> 
> ...
> 
> [   59.819007] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   59.826055] pc : mte_zero_clear_page_tags+0x1c/0x40
> [   59.830980] lr : tag_clear_highpage+0x68/0x118
> 
> ...
> 
> [   59.911874] Call trace:
> [   59.914333]  mte_zero_clear_page_tags+0x1c/0x40 (P)
> [   59.919278]  get_page_from_freelist+0x1a60/0x1c80
> [   59.924042]  __alloc_frozen_pages_noprof+0x178/0xd20
> [   59.929068]  alloc_pages_mpol+0xb4/0x1a4
> [   59.933022]  alloc_frozen_pages_noprof+0x48/0xc0
> [   59.937683]  folio_alloc_noprof+0x14/0x68
> [   59.941718]  mm_get_huge_zero_folio+0xf4/0x30c
> [   59.946200]  do_huge_pmd_anonymous_page+0x278/0x6a0
> [   59.951119]  __handle_mm_fault+0x700/0x1834
> [   59.955332]  handle_mm_fault+0x8c/0x2a0
> [   59.959190]  do_page_fault+0x108/0x75c
> [   59.962964]  do_translation_fault+0x5c/0x6c
> [   59.967181]  do_mem_abort+0x40/0x90

Thanks for the report. I missed the fact that the arch
mte_zero_clear_page_tags() arch code issues MTE instructions
irrespective of whether the hardware supports it. We got away with this
so far since we check the VM_MTE flag and that's only set if the
hardware supports MTE.

> Looking at the codes:
> 
> > -       zero_folio = folio_alloc((GFP_TRANSHUGE | __GFP_ZERO) & ~__GFP_MOVABLE,
> > +       zero_folio = folio_alloc((GFP_TRANSHUGE | __GFP_ZERO | __GFP_ZEROTAGS) &
> > +                                ~__GFP_MOVABLE,
> >                         HPAGE_PMD_ORDER);
> 
> This adds an unonditional __GFP_ZEROTAGS - from a quick scan it looks
> like this was previously only enabled by vma_alloc_zeroed_movable_folio()
> when the VMA has VM_MTE, I think we need a similar test here.

We can't do this for the huge zero page since this will be shared by
other vmas and not all would have VM_MTE set. I'll fix it in the arch
code:

-----------8<---------------------------------------------
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index d816ff44faff..125dfa6c613b 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -969,6 +969,16 @@ struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
 
 void tag_clear_highpage(struct page *page)
 {
+	/*
+	 * Check if MTE is supported and fall back to clear_highpage().
+	 * get_huge_zero_folio() unconditionally passes __GFP_ZEROTAGS and
+	 * post_alloc_hook() will invoke tag_clear_highpage().
+	 */
+	if (!system_supports_mte()) {
+		clear_highpage(page);
+		return;
+	}
+
 	/* Newly allocated page, shouldn't have been tagged yet */
 	WARN_ON_ONCE(!try_page_mte_tagging(page));
 	mte_zero_clear_page_tags(page_address(page));
------------------8<------------------------------------------

Testing now.

-- 
Catalin

