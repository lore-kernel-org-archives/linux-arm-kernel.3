Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4853A105F7A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9xqIimxJ+UeFzPGMk9f2uAUJluGwpUG/Yzr8JUFUW4=; b=NglOP3z4eOczqKKM+jYJlYzWWD
	n6jUSLaD95TQVC+5G5Ckid5QLcJo5xxkD/Ug4FLqwENCVwQJHXCxcpeqnXUZ4I/YIo+BWEjAXbkJK
	C/m8GeCS+08Xv1XXF2lM5hREM9ZPODerxRFbOQmMvyuWwKYOHNbRT68RnyF31KjqePZMFakKtAeWc
	PRqS2mp6zo/DheBDO1GxMmFpPkacukHaSFX4kYTwUuJC9w7LLaxX0zFmOcRP6i+ePg+xSoRG7PeXt
	Rx4ynJq9ofKHFVLtxqKKHkXuNiqfsKBawPatG4nHy4L79xN+64AhbmWxisZrc9fLFZktu674l0fV4
	cpFyQ38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13LN-00000000MEr-2cbz;
	Fri, 13 Mar 2026 14:18:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13LK-00000000MDt-2v1R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:18:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BC69152B;
	Fri, 13 Mar 2026 07:18:11 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F13A3F7BD;
	Fri, 13 Mar 2026 07:18:16 -0700 (PDT)
Date: Fri, 13 Mar 2026 14:18:10 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH] arm64: scs: Remove redundant save/restore of SCS SP on
 entry to/from EL0
Message-ID: <abQcohPWkJ06mBBI@J2N7QTR9R3>
References: <20260313123220.29878-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313123220.29878-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_071822_791123_ADDAE2F0 
X-CRM114-Status: GOOD (  18.74  )
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

On Fri, Mar 13, 2026 at 12:32:19PM +0000, Will Deacon wrote:
> When returning to userspace, the SCS is empty and so the SCS SP just
> points to the base address of the SCS page.
> 
> Rather than saving and restoring this address in the current task, we
> can simply restore the SCS SP to point at the base of the stack on entry
> to EL1 from EL0.
> 
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Will Deacon <will@kernel.org>

I think this works either way, so:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/include/asm/scs.h | 8 ++++++++
>  arch/arm64/kernel/entry.S    | 4 +---
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> I just spotted this by inspection when I was hacking on our exception
> entry code.
> 
> diff --git a/arch/arm64/include/asm/scs.h b/arch/arm64/include/asm/scs.h
> index 0fbc2e7867d3..a15a2968e7b6 100644
> --- a/arch/arm64/include/asm/scs.h
> +++ b/arch/arm64/include/asm/scs.h
> @@ -10,6 +10,11 @@
>  #ifdef CONFIG_SHADOW_CALL_STACK
>  	scs_sp	.req	x18
>  
> +	.macro scs_load_current_base
> +	get_current_task scs_sp
> +	ldr	scs_sp, [scs_sp, #TSK_TI_SCS_BASE]
> +	.endm
> +
>  	.macro scs_load_current
>  	get_current_task scs_sp
>  	ldr	scs_sp, [scs_sp, #TSK_TI_SCS_SP]
> @@ -19,6 +24,9 @@
>  	str	scs_sp, [\tsk, #TSK_TI_SCS_SP]
>  	.endm
>  #else
> +	.macro scs_load_current_base
> +	.endm
> +
>  	.macro scs_load_current
>  	.endm
>  
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index f8018b5c1f9a..ab476ba060d1 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -273,7 +273,7 @@ alternative_if ARM64_HAS_ADDRESS_AUTH
>  alternative_else_nop_endif
>  1:
>  
> -	scs_load_current
> +	scs_load_current_base
>  	.else
>  	add	x21, sp, #PT_REGS_SIZE
>  	get_current_task tsk
> @@ -378,8 +378,6 @@ alternative_if ARM64_WORKAROUND_845719
>  alternative_else_nop_endif
>  #endif
>  3:
> -	scs_save tsk
> -
>  	/* Ignore asynchronous tag check faults in the uaccess routines */
>  	ldr	x0, [tsk, THREAD_SCTLR_USER]
>  	clear_mte_async_tcf x0
> -- 
> 2.53.0.851.ga537e3e6e9-goog
> 

