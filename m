Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58931C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnXyfi4eFUm3Dhw6TUTy/FtA5tseEgd/6lkBd9XA0SA=; b=YviuanQrfS/3KfJGl0npQZovk1
	gPWxMzTxEw9wM6GR3zEMS00zE11C2ZfReoldTnxBe0pY5c/YBcWa+bVkj5CQ91uQANM6nB881qX+0
	/NE/b8o4Qr8u16PcYMGGCxqXsm+VyTvfvEzyTiyX4m7sHPijt6F6CiBKqLUaBRGogS7YLOfulnMI+
	/gr3HdSwsf3FrFwak1d1D4xu1LjBvHwBVwcVXBgf4cDOBfclbsYZLbh3l6bZ59GDowacPBaPtWTfJ
	yOQXR6t2Rol+6iqhNQ+n0NGfOi1YiTPWkZ/5+xXI0Jy+A5xcBLh0u1Y1TsCDL3El6TstQr5b+avoT
	SCd82LKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHghi-0000000FSkV-1Gx3;
	Wed, 21 May 2025 10:29:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfu3-0000000FLeC-2lWg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 09:38:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B4C9B6000A;
	Wed, 21 May 2025 09:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5A3C4CEE4;
	Wed, 21 May 2025 09:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747820302;
	bh=trtJxy+t7bBns8gjZ4v7aEoLs4ZD0K1117ubmU9QMzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UA+xWgKDGhO/odDbWno48lciTkr5TcJqBkfWNojtOhqT+ROUantWrpp6GJQmxzErD
	 Y67EuD2go3pBjv6q++E1HxCPPK+9SpisNlOPAuZu7MvjWvEiQtsigPBUd4UJ2Qw1o0
	 405ERIsi/HXLTk2/upEglaasc/PN4TWfmzUG4aiMh93ViwTyyCr4OzjWY+lc2xVcyF
	 AJVbOoTxSJxda4KcuaqqKspomV8lV4p33gM0a0f4liCBOoUj0370jhyhORyW67Cpgv
	 kFrNuubm99E5mXNsBveRx/JEzHObjw3LDj8NGwjn3WodLHULDqcmvhoIOHxzZeW1iw
	 dD9yfnfJYBSnw==
Date: Wed, 21 May 2025 10:38:17 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v2 11/11] arm64: debug: remove debug exception
 registration infrastructure
Message-ID: <20250521093817.GA20245@willie-the-truck>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-12-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512174326.133905-12-ada.coupriediaz@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, May 12, 2025 at 06:43:26PM +0100, Ada Couprie Diaz wrote:
> Now that debug exceptions are handled individually and without the need
> for dynamic registration, remove the unused registration infrastructure.
> 
> Remove `early_brk64` as it has been made redundant by
> (arm64: debug: split brk64 exception entry) and is not used anymore.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/include/asm/debug-monitors.h |  2 -
>  arch/arm64/include/asm/exception.h      |  2 -
>  arch/arm64/include/asm/system_misc.h    |  4 --
>  arch/arm64/kernel/debug-monitors.c      |  3 -
>  arch/arm64/kernel/traps.c               | 26 +--------
>  arch/arm64/mm/fault.c                   | 75 -------------------------
>  6 files changed, 1 insertion(+), 111 deletions(-)

[...]

> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 53f0b2281f14..a5f344e556df 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -346,9 +346,6 @@ int aarch32_break_handler(struct pt_regs *regs)
>  }
>  NOKPROBE_SYMBOL(aarch32_break_handler);
>  
> -void __init debug_traps_init(void)
> -{}
> -
>  /* Re-enable single step for syscall restarting. */
>  void user_rewind_single_step(struct task_struct *task)
>  {
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 50d7a6a75f45..ce20f46e08cb 100644
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
> -	if ((esr_brk_comment(esr) & ~UBSAN_BRK_MASK) == UBSAN_BRK_IMM)
> -		return ubsan_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
> -#endif
> -	return bug_brk_handler(regs, esr) != DBG_HOOK_HANDLED;

The early bug handler is now only called if the brk immediate matches,
but I couldn't spot any problems with that.

Will

