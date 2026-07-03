Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB2BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 09:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IILEoiVbjF29U2QWGQolzOtYw8B8ZOuiJ9wWV3+dcLo=; b=ouBJfIOUEqrK9k5nIBl9sUNz9k
	eLfs7pYr9E6EO5g3PALZB8x0Ji2wvd7vMvWEhAlUX3Wx/cMkzFU257XwaOHsJqTQhP+0aIMYO6vDo
	p2zVWAzdt5hf7HTnkUfLestD9HKEWe9wq5Tvt9zQMgqnKnlztXdOlL3/r8RJseltJQCEcK2vcoKAE
	PaEKgYl7AX1G+XR70Jl73WKxnKa/s1ILhyUlfVRTyaUIdQJZCKbsid72hPbhejew3W2Ut56DQHhZe
	VyznA3mOikm49wt/ZUMdJ6DHY8fA8m3bn0I38NeYSU9FBooQeCPeIr9wvdZxxQgTxbr4wuwGP6vgJ
	OIrUGdAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZkX-00000006QdF-3ASP;
	Fri, 03 Jul 2026 08:59:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZkU-00000006Qct-3COz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:59:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E91001684;
	Fri,  3 Jul 2026 01:59:43 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DADDB3F905;
	Fri,  3 Jul 2026 01:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783069188; bh=ArxNuhsV39DcuOHPL8HguLPPdxicz93aKTFRes9110A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHhH5n1Jsgre31CxsoUhig0gdvKRnUF1wE11oMoxGleTt/bYr2cYdcNL4YkNqqXqa
	 VxVbMJ+NnGsJuErudYorxueu1o93h/sUaAZCj4ladyiVYxFOIKgR8HCkrqaNVLXigx
	 n3Jtr+oMjEZrbJ5cnoc5WHZhJgFnNyMMNFdjzYzQ=
Date: Fri, 3 Jul 2026 09:59:40 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, slipher <slipher@protonmail.com>
Subject: Re: [PATCH v2] RFC: ARM: breakpoint: CFI breakpoints only on demand
Message-ID: <akd5_G5oA2dxdg89@J2N7QTR9R3>
References: <20260701-arm32-cfi-bug-v2-1-9bf922593e00@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-arm32-cfi-bug-v2-1-9bf922593e00@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_015950_904340_A8A8E5B0 
X-CRM114-Status: GOOD (  34.48  )
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

On Wed, Jul 01, 2026 at 09:11:54AM +0200, Linus Walleij wrote:
> This removes the stub hw_breakpoint_cfi_handler() from ARM, making
> it not steal breakpoint type 0x03 (ARM_ENTRY_CFI_BREAKPOINT) unless
> CFI is actively used in the kernel.
> 
> When not instrumenting with CFI, we fall through to return 1 from
> hw_breakpoint_pending() "unhandled fault" so userspace can make use
> of this breakpoint.
> 
> This of course does not work if userspace want to use CFI and custom
> breakpoints at the same time, and CONFIG_CFI does exist as something
> users might want to select for their kernel.

I don't follow this part. CONFIG_CFI is for the kernel; it has nothing
to do with what userspace wnats to do.

AFAICT, when the kernel is built with CONFIG_CFI, if userspace uses BKPT
at all, for any reason, it can cause the kernel to die().

> If this is not good acceptable we need to think about other ways for
> CFI to interfer, such as not using BKPT at all (rather something like
> BUG()) and back out the offending patch until the compiler behaviour
> has changed.

See comments below.

> Fixes: c3f89986fde7 ("ARM: 9391/2: hw_breakpoint: Handle CFI breakpoints")
> Reported-by: slipher <slipher@protonmail.com>
> Closes: https://lore.kernel.org/lkml/kJqktbpLphg_Pk5I5SPptgTLjl3E3eq5mN5UzCslyFj7Q1Irp-wDid4mj5eQVd2iZtRGXgeZd8goq195EkXdjyt864YMc8mVb2B9NGH91NQ=@protonmail.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Trying to solve the CFI bug. Let's see of this first
> approach is acceptable for the reporter.
> ---
> Changes in v2:
> - Resending as non-RFC so it can be applied as a band-aid.
> - Link to v1: https://patch.msgid.link/20260626-arm32-cfi-bug-v1-1-a467b5050c0b@kernel.org
> ---
>  arch/arm/kernel/hw_breakpoint.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/kernel/hw_breakpoint.c b/arch/arm/kernel/hw_breakpoint.c
> index cd4b34c96e35..007023db6a5d 100644
> --- a/arch/arm/kernel/hw_breakpoint.c
> +++ b/arch/arm/kernel/hw_breakpoint.c
> @@ -929,10 +929,6 @@ static void hw_breakpoint_cfi_handler(struct pt_regs *regs)
>  		break;
>  	}
>  }
> -#else
> -static void hw_breakpoint_cfi_handler(struct pt_regs *regs)
> -{
> -}
>  #endif
>  
>  /*
> @@ -964,9 +960,11 @@ static int hw_breakpoint_pending(unsigned long addr, unsigned int fsr,
>  	case ARM_ENTRY_SYNC_WATCHPOINT:
>  		watchpoint_handler(addr, fsr, regs);
>  		break;
> +#ifdef CONFIG_CFI
>  	case ARM_ENTRY_CFI_BREAKPOINT:
>  		hw_breakpoint_cfi_handler(regs);
>  		break;
> +#endif

AFAICT, hw_breakpoint_cfi_handler() is only intended to handle
BKPT instructions executed in kernel mode, and even when the kernel is
build with CF support, it doesn't make sense to call that for BKPT
instructions executed in user mode.

On arm64, we have separate paths for BRK exceptions from user mode
(do_el0_brk64()) and kernel mode (do_el1_brk64()).

Surely you can check kernel_mode(regs) or user_mode(regs) to distinguish
the two cases, and only call hw_breakpoint_cfi_handler() when the
exception was taken from kernel mode?

Mark.

>  	default:
>  		ret = 1; /* Unhandled fault. */
>  	}
> 
> ---
> base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
> change-id: 20260626-arm32-cfi-bug-10fb960749c4
> 
> Best regards,
> --  
> Linus Walleij <linusw@kernel.org>
> 
> 

