Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18480C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSz7v0+bZBCv+9y3qpJ03iO9P9l0SOtnxKU0/Td/tsA=; b=HR/4bEA9ed60Mpljv/TDipy4LX
	F87sGxeOWIg6pHl7lo3fmzKjuNmLV5MgnQkcbgPegy4Sy8y2gPMCAFumEaBBbnudRCQqFmL20HNZs
	MvCUtHkNRppWodCfbv6EgvWhv5++NpoRH3vyXXDtob5j/tmrq0/MghlggVHZHfFrV+e9Q4VGe95uv
	EdlTFVLHUeYJuaFDcCI1JvoWq8LiHg4ejbU0DZmNu5rds/BEOg+xw1vaek4Q5FULOs1BoRJXsBQxx
	byrdYVDYobuip4edkkRTg9DxrSAax6Mvo1qqIYbrKiXGjrBHP/K43Z79KRlKbZmOZeL/0qlI8hjvp
	7GUk8lnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCXq-0000000FMiM-3YQI;
	Fri, 27 Jun 2025 17:07:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBIn-0000000FA0B-1NTS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:47:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0373346224;
	Fri, 27 Jun 2025 15:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4BFC4CEED;
	Fri, 27 Jun 2025 15:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039264;
	bh=rfiJBPDDfivx8ep5W1qpJIZzbsC5eck+jdJeQK1zj/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=erySfnPL4WJFeiRUZkjugde24DiDc68j82GwJ2jE3GdFmrHpROeKsmcc6eOc1Kqsq
	 vEf4vlGKyd4Q6ajY+r2PTRHgcnOnB8wfHpPcPn2DAtJkPsUzjGdya1dpsS+18Uo1Lt
	 M/ZFLHJI2dik2TE036YHwa9g3PAHay5XEsisXvOPNUFag0RSZ80lfhfssaQC81aINi
	 0LMoNNT5b8QdQh+Guy7KJK3PQGTMeeavonqjfPDIyyhGAujnh15R/kxc7+U/cGefwZ
	 1etplg8KKYJs/izIpPfRl+Ho5yJPDdMPi5M7tPhQy7/2Ch7AUP+nryMcOZAtSvxFSA
	 a5uxr9xbgK3UQ==
Date: Fri, 27 Jun 2025 16:47:40 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Luis Claudio R . Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v4 13/13] arm64: debug: remove debug exception
 registration infrastructure
Message-ID: <aF69HH6F6XjIdAqy@willie-the-truck>
References: <20250620211207.773980-1-ada.coupriediaz@arm.com>
 <20250620211207.773980-14-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620211207.773980-14-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_084745_407163_ABDCB26A 
X-CRM114-Status: GOOD (  20.73  )
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

On Fri, Jun 20, 2025 at 10:12:07PM +0100, Ada Couprie Diaz wrote:
> Now that debug exceptions are handled individually and without the need
> for dynamic registration, remove the unused registration infrastructure.
> 
> This removes the external caller for `debug_exception_enter()` and
> `debug_exception_exit()`.
> Make them static again and remove them from the header.
> 
> Remove `early_brk64()` as it has been made redundant by
> (arm64: debug: split brk64 exception entry) and is not used anymore.
> Note : in `early_brk64()` `bug_brk_handler()` is called unconditionally
> as a fall-through, but now `call_break_hook()` only calls it if the
> immediate matches.
> This does not change the behaviour in early boot, as if
> `bug_brk_handler()` was called on a non-BUG immediate it would return
> DBG_HOOK_ERROR anyway, which `call_break_hook()` will do if no immediate
> matches.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> ---
>  arch/arm64/include/asm/debug-monitors.h |  2 -
>  arch/arm64/include/asm/exception.h      |  6 ---
>  arch/arm64/include/asm/system_misc.h    |  4 --
>  arch/arm64/kernel/debug-monitors.c      |  3 --
>  arch/arm64/kernel/entry-common.c        |  4 +-
>  arch/arm64/kernel/traps.c               | 26 +-----------
>  arch/arm64/mm/fault.c                   | 53 -------------------------
>  7 files changed, 3 insertions(+), 95 deletions(-)

[...]

> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 654c8ea46ec6..d6c5268e6947 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -1101,29 +1101,5 @@ int ubsan_brk_handler(struct pt_regs *regs, unsigned long esr)
>  }
>  #endif
>  
> -/*
> - * Initial handler for AArch64 BRK exceptions
> - * This handler only used until debug_traps_init().
> - */
> -int __init early_brk64(unsigned long addr, unsigned long esr,
> -		struct pt_regs *regs)
> -{
> -#ifdef CONFIG_CFI_CLANG
> -	if (esr_is_cfi_brk(esr))
> -		return cfi_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
> -#endif
> -#ifdef CONFIG_KASAN_SW_TAGS
> -	if ((esr_brk_comment(esr) & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
> -		return kasan_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
> -#endif
> -#ifdef CONFIG_UBSAN_TRAP
> -	if (esr_is_ubsan_brk(esr))
> -		return ubsan_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
> -#endif
> -	return bug_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
> -}
> -
>  void __init trap_init(void)
> -{
> -	debug_traps_init();
> -}
> +{}

nit: I think you can actually just remove trap_init() entirely as there's
a weak definition in init/main.c

With that:

Reviewed-by: Will Deacon <will@kernel.org>

Will

