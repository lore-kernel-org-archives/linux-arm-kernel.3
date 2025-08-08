Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F1DC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWz/uc9hgvE7dxPlldQLju1Vb9EWCD5Jsm3PkdZyOX8=; b=Y6En3Qm0LJSohGxxF8huQni/9K
	TK9P4EEboHHJETSL48eh3IZCfdGmDTEOVfKNUP9xF7mziCPSLs4RzS4HD9EMTBl9LIrTG+hJCozLi
	tzQiVPir/I2YS7Fjc48T9lLYyXfisFENuPytAfcLMZ7o0bShRFkZFA5X5z9FsI8QIYbEKSQiqxF4w
	CSwYvvHPnMOS8YPlX9z0Il3fRpUGkJcXNI/5iodzDTt3iLKICeiNDgYjw633GIwo80UiARGFGb+4j
	t/Ba4rGZe8qbmfRuGgBtPaY856ckvqbST5fN+T+gr6TBJYDD5Suesb6U3p0nTa+s2K2dApZjN2syc
	dZZ9YqIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukM9D-00000002nU7-254R;
	Fri, 08 Aug 2025 12:24:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLgG-00000002jLB-067F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:54:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 943B443FD0;
	Fri,  8 Aug 2025 11:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DD2C4CEED;
	Fri,  8 Aug 2025 11:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754654079;
	bh=kl2NK5vZVEJ1cuoKOne6B1eUNATkpcR/aXK7M5rs130=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BgiQTmPPOPRhi9AtZUIzrmLsRGQkexyZmeK4Fldz+wXGGd7C1h9p+xHiAN2sfGRf+
	 4YT/vbnFNtsNybr0ENQSAAFmbJCS4X8nCAJnMe1vxTfGhz9cEaZlXrEcyPCVWzmEu4
	 HLhG24zvFS5G/1Lp+FROqtllP3skQfUoaZvVl5+qvOBMfu9fDXo8998uLeywmMC+BK
	 3tykewBaob4txA60uvnR/d4bbmoCVskFzJ/VKu1jra9oXmHShgYdtVXZ0d9hb246Oa
	 9FBrm1Rn79bN4QVRLY5pThl3QdKKl6ANzFmXojrFOLqEAxEUG9AZQgacwdlg/KCqam
	 1POVlUeoDkhbQ==
Date: Fri, 8 Aug 2025 12:54:34 +0100
From: Will Deacon <will@kernel.org>
To: fanqincui@163.com
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Fanqin Cui <cuifq1@chinatelecom.cn>,
	maz@kernel.org
Subject: Re: [PATCH] arm64/module: Support for patching modules during runtime
Message-ID: <aJXlegQfZTdimS3k@willie-the-truck>
References: <20250807072700.348514-1-fanqincui@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807072700.348514-1-fanqincui@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_045440_081865_A4010ED2 
X-CRM114-Status: GOOD (  20.41  )
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

On Thu, Aug 07, 2025 at 03:27:00AM -0400, fanqincui@163.com wrote:
> From: Fanqin Cui <cuifq1@chinatelecom.cn>
> 
> If use the ALTERNATIVE_CB interface in a kernel module to
> patch code, the kernel will crash. The relevant log is as follows:
> 
>  Mem abort info:
>    ESR = 0x000000008600000f
>    EC = 0x21: IABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
>    FSC = 0x0f: level 3 permission fault
>  swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000013cfbed000
>  [ffff80007b0b0000] pgd=0000000000000000, p4d=10000013d0d03003,
> pud=1000000103175403, pmd=1000000115804403, pte=0068000116b77703
>  Internal error: Oops: 000000008600000f [#1]  SMP
> 
>  Call trace:
>   0xffff80007b0b0000 (P)
>   apply_alternatives_module+0x48/0x7c
>   module_finalize+0xc0/0x134
>   load_module+0x15c0/0x1c08
>   init_module_from_file+0x8c/0xcc
>   __arm64_sys_finit_module+0x1c0/0x2d4
>   invoke_syscall+0x48/0x110
>   el0_svc_common.constprop.0+0xc0/0xe0
>   do_el0_svc+0x1c/0x28
>   el0_svc+0x34/0xf0
>   el0t_64_sync_handler+0xa0/0xe4
>   el0t_64_sync+0x198/0x19c
>  Code: 00000000 00000000 00000000 00000000 (d503233f)
>  ---[ end trace 0000000000000000 ]---
> 
> To avoid this problem, this commit supports add a new section.
> When the module is loading, this section will be found and the
> page table attributes will be set to executable state in advance.
> 
> Signed-off-by: Fanqin Cui <cuifq1@chinatelecom.cn>
> ---
>  arch/arm64/kernel/module.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index 40148d2725ce..2160b2877935 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -24,6 +24,7 @@
>  #include <asm/scs.h>
>  #include <asm/sections.h>
>  #include <asm/text-patching.h>
> +#include <asm-generic/set_memory.h>
>  
>  enum aarch64_reloc_op {
>  	RELOC_OP_NONE,
> @@ -477,6 +478,9 @@ int module_finalize(const Elf_Ehdr *hdr,
>  	const Elf_Shdr *s;
>  	int ret;
>  
> +	s = find_section(hdr, sechdrs, ".text.alternative_cb");
> +	if (s && s->sh_size > PAGE_SIZE && PAGE_ALIGNED(s->sh_addr))
> +		set_memory_x(s->sh_addr, s->sh_size >> PAGE_SHIFT);

Hmm, so the alternatives callback function lives in the module itself?
Which module does that? I'm a bit nervous about running module code
before the module has actually finished loading...

Does layout_sections() correctly map '.text.alternative_cb' as
executable later on?

Will

