Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E22C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 09:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZXSnyn5lFZ5UgdeLT0azNyaJlXpy98p1Ge5OXKtpOU=; b=sB4w3YqCMWOXLHtzmRJUSzailD
	8lriF424oYNiX+Wb5gQxZTDpqmsRS5SMH9r12pexfczB1PPIN9uMxua9mLfBILjy2jO0c9EICN0Dm
	zMYr9wzM0RXh+7oKBK+H1tvL9UDcKwRD3SwInVe79iJTJcIpO4+EwMvu+LpDGzG3PvYms8iT3joro
	D9/ga/rn/CZRSvyyFLk5enpu49uh8Oh1FLECzRNtwtyE3yo+Nde+wimAmOwZFld9XeEyXjtZZWrEH
	YF8CNE3tvb4Fv76+xIFd3YLNnosDoCUmaG/gW1aUrWJzgKSNdIYdz5lHdDORJu71S+/SGG+/FO4yQ
	krCB+3aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaBM-00000006TyQ-1Db7;
	Fri, 03 Jul 2026 09:27:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaBJ-00000006Txf-3Bvb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 09:27:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFE8F1EDB;
	Fri,  3 Jul 2026 02:27:27 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F0003F673;
	Fri,  3 Jul 2026 02:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783070852; bh=JvoU5nbICVMIWRHb0kIPGUpPkes8KJNpKqGQHTJwF10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ikRQDQNahGHiJFINP6/dnNmuIEPdANlrfpfBFrGxrRs/b4KK68wYKWhOXNc+EJNEa
	 vFWsp4D+IrAq/iI69qM2zxoeC9EXqgUPCoYNtcZ2cIZu8S4wc6UUpcRfTYT+KhIOPl
	 THZ9ggf4tGc+y83nvTHAdrGYDpeQhXtGYAoR248Q=
Date: Fri, 3 Jul 2026 10:27:28 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, slipher <slipher@protonmail.com>
Subject: Re: [PATCH v3] ARM: breakpoint: CFI breakpoints only on demand
Message-ID: <akeAgEBWyAshTI9H@J2N7QTR9R3>
References: <20260701-arm32-cfi-bug-v3-1-e3c37e2b80a4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-arm32-cfi-bug-v3-1-e3c37e2b80a4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_022733_881631_716E17B3 
X-CRM114-Status: GOOD (  33.37  )
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

On Wed, Jul 01, 2026 at 12:42:09PM +0200, Linus Walleij wrote:
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
> users might want to select for their kernel. If this is not good
> acceptable we need to think about other ways for CFI to interfer, such
> as not using BKPT at all (rather something like BUG()) and back out
> the offending patch until the compiler behaviour has changed.
> 
> Fixes: c3f89986fde7 ("ARM: 9391/2: hw_breakpoint: Handle CFI breakpoints")
> Reported-by: slipher <slipher@protonmail.com>
> Closes: https://lore.kernel.org/lkml/kJqktbpLphg_Pk5I5SPptgTLjl3E3eq5mN5UzCslyFj7Q1Irp-wDid4mj5eQVd2iZtRGXgeZd8goq195EkXdjyt864YMc8mVb2B9NGH91NQ=@protonmail.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Trying to solve the CFI bug. Let's see of this first
> approach is acceptable for the reporter.
> ---
> Changes in v3:
> - Actually strip the RFC prefix...
> - Link to v2: https://patch.msgid.link/20260701-arm32-cfi-bug-v2-1-9bf922593e00@kernel.org
> 
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

As commented on v2, I don't think this is the right fix.

I think you should look at which privilege level the exception was taken
from (e.g. useing user_mode(regs), such that a BKPT from user mode never
results in a call into hw_breakpoint_cfi_handler(), an can be treated as
unhandled.

That way the user mode behaviour would be consistent regardless of
CONFIG_CFI, and even when CONFIG_CFI=y, user mode cannot cause the
kernel to die() by executing a BKPT.

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

