Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336DDE6C61E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvSSpDn6tfILboBeuk8ih5hFAf18nASStnq2g1yQaFk=; b=l7kMafE6D48JDLyuONNbXIpxTH
	AbYQTiP1/5ILFGPUDwC3/Zm7s1YdOkBkeVZh58IUam/xfZDGv+p6c7ZbJHvAtAq8tM8bBQCpySHt1
	yE+bmCNsboOdLIBatEsOWc/7w7VGjms9PbgEH++DIpZT9UTEkb9ZZAM2KiPqW6sImFsARfTCTaZXJ
	BNeDKPOpuzUz0ORPOSJ3UAawjzZ5C2D0AdLsLm+ZDUCKTjZEwhZGqpB1Mb7s8zhv5rAoVBSKb92Ue
	XngS5o8VREgeQOF+HhZecWOvy+bMF4/XA6CBTPllYj8y6acEjBu4m10aVDKw4J06gE4V9sSF8Pj6F
	RyklKNJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOub-00000008oZ7-16et;
	Tue, 03 Dec 2024 09:09:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOtI-00000008oFw-1X5t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 09:08:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 401C3A40FCF;
	Tue,  3 Dec 2024 09:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75741C4CECF;
	Tue,  3 Dec 2024 09:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733216899;
	bh=LjyHrZ2tDGGDqSZ3jGXdPuUL0M88k38XCTKpnlQwq9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FtFJp66cxcfZ1kiaUwWQFKTQOpfp3G1vg8OTOMcHt6wxIqR8BebbDJVbrF20aDlm8
	 yvAuTE60Ql1W+t6MH71rJgXfzOM00mIvjeyg7pX99MXm1OLs+hCwvj/I/PeJK3hdQH
	 XocNP6+rxyJc9hxNwE+0NrpdnUDtSWz715CEX3wW8db7PCnWODkad5RKY3i+YyewKP
	 YFxckok5LnBpASoHDKCnHDXmtT/+N3cYNf9msqBPOp+qT9hHGH8pGx0mHIrIcZj+p3
	 ZbvoqV0HXt07epiSk+J0RYMWFlWscp1HqotjXp4UhjZKg2fOihkHJ+O9+iwLxtn590
	 +YnII2/0CAbxQ==
Date: Tue, 3 Dec 2024 11:08:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	catalin.marinas@arm.com, hch@lst.de, thuth@redhat.com,
	will@kernel.org
Subject: Re: [PATCH] arm64: patching: avoid early page_to_phys()
Message-ID: <Z07KdwY4P37oYVO4@kernel.org>
References: <20241202170359.1475019-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202170359.1475019-1-mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_010820_527341_1FA78D82 
X-CRM114-Status: GOOD (  35.25  )
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

On Mon, Dec 02, 2024 at 05:03:59PM +0000, Mark Rutland wrote:
> When arm64 is configured with CONFIG_DEBUG_VIRTUAL=y, a warning is
> printed from the patching code because patch_map(), e.g.
> 
> | ------------[ cut here ]------------
> | WARNING: CPU: 0 PID: 0 at arch/arm64/kernel/patching.c:45 patch_map.constprop.0+0x120/0xd00
> | CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.13.0-rc1-00002-ge1a5d6c6be55 #1
> | Hardware name: linux,dummy-virt (DT)
> | pstate: 800003c5 (Nzcv DAIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> | pc : patch_map.constprop.0+0x120/0xd00
> | lr : patch_map.constprop.0+0x120/0xd00
> | sp : ffffa9bb312a79a0
> | x29: ffffa9bb312a79a0 x28: 0000000000000001 x27: 0000000000000001
> | x26: 0000000000000000 x25: 0000000000000000 x24: 00000000000402e8
> | x23: ffffa9bb2c94c1c8 x22: ffffa9bb2c94c000 x21: ffffa9bb222e883c
> | x20: 0000000000000002 x19: ffffc1ffc100ba40 x18: ffffa9bb2cf0f21c
> | x17: 0000000000000006 x16: 0000000000000000 x15: 0000000000000004
> | x14: 1ffff5376625b4ac x13: ffff753766a67fb8 x12: ffff753766919cd1
> | x11: 0000000000000003 x10: 1ffff5376625b4c3 x9 : 1ffff5376625b4af
> | x8 : ffff753766254f0a x7 : 0000000041b58ab3 x6 : ffff753766254f18
> | x5 : ffffa9bb312d9bc0 x4 : 0000000000000000 x3 : ffffa9bb29bd90e4
> | x2 : 0000000000000002 x1 : ffffa9bb312d9bc0 x0 : 0000000000000000
> | Call trace:
> |  patch_map.constprop.0+0x120/0xd00 (P)
> |  patch_map.constprop.0+0x120/0xd00 (L)
> |  __aarch64_insn_write+0xa8/0x120
> |  aarch64_insn_patch_text_nosync+0x4c/0xb8
> |  arch_jump_label_transform_queue+0x7c/0x100
> |  jump_label_update+0x154/0x460
> |  static_key_enable_cpuslocked+0x1d8/0x280
> |  static_key_enable+0x2c/0x48
> |  early_randomize_kstack_offset+0x104/0x168
> |  do_early_param+0xe4/0x148
> |  parse_args+0x3a4/0x838
> |  parse_early_options+0x50/0x68
> |  parse_early_param+0x58/0xe0
> |  setup_arch+0x78/0x1f0
> |  start_kernel+0xa0/0x530
> |  __primary_switched+0x8c/0xa0
> | irq event stamp: 0
> | hardirqs last  enabled at (0): [<0000000000000000>] 0x0
> | hardirqs last disabled at (0): [<0000000000000000>] 0x0
> | softirqs last  enabled at (0): [<0000000000000000>] 0x0
> | softirqs last disabled at (0): [<0000000000000000>] 0x0
> | ---[ end trace 0000000000000000 ]---
> 
> The warning has been produced since commit:
> 
>   3e25d5a49f99b75b ("asm-generic: add an optional pfn_valid check to page_to_phys")
> 
> ... which added a pfn_valid() check into page_to_phys(), and at this
> point in boot pfn_valid() will always return false because the vmemmap
> has not yet been initialized and there are no valid mem_sections yet.
> 
> Before that commit, the arithmetic performed by page_to_phys() would
> give the expected physical address, though it is somewhat dubious to use
> vmemmap addresses before the vmemmap has been initialized.
> 
> For historical reasons, the structure of patch_map() is more complicated
> than necessary and can be simplified. For kernel image addresses it's
> sufficient to use __pa_symbol() directly without converting this to a
> page address and back. Aside from kernel image addresses, all executable
> code should be allocated from execmem (where all allocations will fall
> within the vmalloc area), and the vmalloc area), and so there's no need
> for the fallback case when case when CONFIG_EXECMEM=n.
> 
> Simplify patch_map() accordingly, directly converting kernel image
> addresses and removing the redundant fallback case.
> 
> Fixes: 3e25d5a49f99b75b ("asm-generic: add an optional pfn_valid check to page_to_phys")
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/patching.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> Catalin, Will, I wasn't sure whether we'd prefer this or an explicit
> check that the address is a vmalloc addr, e.g.
> 
> 	if (is_image_text(...)) {
> 		phys = ...;
> 	} else if (is_vmalloc_addr(...)) {
> 		phys = ...;
> 	} else {
> 		BUG();
> 	}
> 
> I went for the style below because it was marginally simpler, I'm more
> than happy to respin as above if that's preferable.
> 
> Mark.
> 
> diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
> index 7f99723fbb8c4..1041bc67a3eee 100644
> --- a/arch/arm64/kernel/patching.c
> +++ b/arch/arm64/kernel/patching.c
> @@ -30,20 +30,17 @@ static bool is_image_text(unsigned long addr)
>  
>  static void __kprobes *patch_map(void *addr, int fixmap)
>  {
> -	unsigned long uintaddr = (uintptr_t) addr;
> -	bool image = is_image_text(uintaddr);
> -	struct page *page;
> -
> -	if (image)
> -		page = phys_to_page(__pa_symbol(addr));
> -	else if (IS_ENABLED(CONFIG_EXECMEM))
> -		page = vmalloc_to_page(addr);
> -	else
> -		return addr;
> -
> -	BUG_ON(!page);
> -	return (void *)set_fixmap_offset(fixmap, page_to_phys(page) +
> -			(uintaddr & ~PAGE_MASK));
> +	phys_addr_t phys;
> +
> +	if (is_image_text((unsigned long)addr)) {
> +		phys = __pa_symbol(addr);
> +	} else {
> +		struct page *page = vmalloc_to_page(addr);
> +		BUG_ON(!page);

Not strictly related to this patch, but is it necessary to BUG() here?
Can't patch_map() return NULL and fail the patching more gracefully?

> +		phys = page_to_phys(page) + offset_in_page(addr);
> +	}
> +
> +	return (void *)set_fixmap_offset(fixmap, phys);
>  }
>  
>  static void __kprobes patch_unmap(int fixmap)
> -- 
> 2.30.2
> 

-- 
Sincerely yours,
Mike.

