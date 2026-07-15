Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591D8C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 16:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFbmr1xKBDTV97iC3Cb+5mPyWuZMy4WCxAYvCPZrqco=; b=DSYgfIW8kAPWi1pIZ/bTxJm9lq
	arr6SQegGb2M4G/4RDPJ1ipnARoWaaoyUdwS3DSXjtLAtwHZVZJYp9UHhPTBIpzpH8BUQGwiSIxSb
	topf6Y4pOBpste0KGHD9nByQcDdmcYW1FzJb3YHWOcPLis819LBCz3/wPpr+pxygl7QQaiYXgSyES
	oZIb2S0LDCI4h/b88UhaQZiat7kuveE5am72PCm2V++3jmZPJuyBZZYt5cxb3bht6eObr/mt2RC1Y
	4qS7X/KC2O+us8dgWoqXrKSZVzxXI6IdgnDjphXs/x7sogUgEAJ9FY/d3DeA2EAvO7GPHBTAcSLXK
	HtQIOKOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2MU-0000000FRqa-0OhB;
	Wed, 15 Jul 2026 16:21:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2MT-0000000FRpl-1Abs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 16:21:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF99041FAC;
	Wed, 15 Jul 2026 16:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05D41F000E9;
	Wed, 15 Jul 2026 16:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784132488;
	bh=iFbmr1xKBDTV97iC3Cb+5mPyWuZMy4WCxAYvCPZrqco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A4gxDzuqUQCWqzJL8K3smRzi+U9fGzjd55IkvC4H6D+Dja9ZwZfKVKmgGN2IbjNYh
	 7ygrPlSqASFHP3oBT8sRrXbAmj0x9oLA178+U1mLioZkiE4nOcv6v7hQmDSuzGB/uT
	 oERkWexSs8MKrIjkKAcTwjKV4BlaUSLM1/LJps0uGZP2dDxh65mkpei3YdkNPO1y4p
	 0KSwk/GIG/4ZXG0t81asFDQxm3loWIL+MPwwqSM47lvJRAmpst0HV1/rZz2H92YT0g
	 URBlTIq9b115EHTXNphBU/svQIhF0XdafJNbFsNvbcXX71EwjatjkpbkVIO/jhGlys
	 2IyTXlouiiIew==
Date: Wed, 15 Jul 2026 09:21:28 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	slipher <slipher@protonmail.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ARM: breakpoint: CFI breakpoints only on demand
Message-ID: <202607150919.32DFB37@keescook>
References: <20260703-arm32-cfi-bug-v4-1-c26acb640a8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-arm32-cfi-bug-v4-1-c26acb640a8f@kernel.org>
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

On Fri, Jul 03, 2026 at 02:25:27PM +0200, Linus Walleij wrote:
> This removes the stub hw_breakpoint_cfi_handler() from ARM, making
> it not steal breakpoint type 0x03 (ARM_ENTRY_CFI_BREAKPOINT) unless
> CFI is actively used in the kernel.
> 
> When not instrumenting with CFI, or when a breakpoint is issued in
> userspace, we fall through to return 1 from hw_breakpoint_pending()
> "unhandled fault" so userspace can make use of this breakpoint.
> 
> Tested with LKDTM and this command line:
> echo CFI_FORWARD_PROTO > /sys/kernel/debug/provoke-crash/DIRECT
> still works as expected.
> 
> Fixes: c3f89986fde7 ("ARM: 9391/2: hw_breakpoint: Handle CFI breakpoints")

Reviewed-by: Kees Cook <kees@kernel.org>

BTW, I still would like to get the decoding implemented:
https://lore.kernel.org/lkml/20250904034656.3670313-9-kees@kernel.org/

But I'll need to rework the above patch, as the breakpoint code in
c3f89986fde7 seems to be better than the register_undef_hook() approach
I used.

-Kees

> Reported-by: slipher <slipher@protonmail.com>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Closes: https://lore.kernel.org/lkml/kJqktbpLphg_Pk5I5SPptgTLjl3E3eq5mN5UzCslyFj7Q1Irp-wDid4mj5eQVd2iZtRGXgeZd8goq195EkXdjyt864YMc8mVb2B9NGH91NQ=@protonmail.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Trying to solve the CFI bug. Let's see of this first
> approach is acceptable for the reporter.
> ---
> Changes in v4:
> - Dodge the BKPT if we are coming from userspace!
> - Would be great if the reporter can test this with and without
>   CONFIG_CFI.
> - Link to v3: https://patch.msgid.link/20260701-arm32-cfi-bug-v3-1-e3c37e2b80a4@kernel.org
> 
> Changes in v3:
> - Actually strip the RFC prefix...
> - Link to v2: https://patch.msgid.link/20260701-arm32-cfi-bug-v2-1-9bf922593e00@kernel.org
> 
> Changes in v2:
> - Resending as non-RFC so it can be applied as a band-aid.
> - Link to v1: https://patch.msgid.link/20260626-arm32-cfi-bug-v1-1-a467b5050c0b@kernel.org
> 
> To: Will Deacon <will@kernel.org>
> To: Mark Rutland <mark.rutland@arm.com>
> To: Russell King <linux@armlinux.org.uk>
> To: Kees Cook <kees@kernel.org>
> To: Sami Tolvanen <samitolvanen@google.com>
> To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> To: Linus Walleij <linusw@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-perf-users@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm/kernel/hw_breakpoint.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/kernel/hw_breakpoint.c b/arch/arm/kernel/hw_breakpoint.c
> index cd4b34c96e35..38feb30dfb5f 100644
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
> @@ -964,9 +960,14 @@ static int hw_breakpoint_pending(unsigned long addr, unsigned int fsr,
>  	case ARM_ENTRY_SYNC_WATCHPOINT:
>  		watchpoint_handler(addr, fsr, regs);
>  		break;
> +#ifdef CONFIG_CFI
>  	case ARM_ENTRY_CFI_BREAKPOINT:
> -		hw_breakpoint_cfi_handler(regs);
> +		if (user_mode(regs))
> +			ret = 1; /* Don't handle userspace BKPT */
> +		else
> +			hw_breakpoint_cfi_handler(regs);
>  		break;
> +#endif
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

-- 
Kees Cook

