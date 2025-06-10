Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D886BC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIFWs5Mlh+bXQoz3OCLIjHjnN+GxzIfPlXP7QsSniyA=; b=f5WsITl/3jr+98R5FW/pI+VyrU
	3urpdf5SIECq/WO0APpLL4mwLB+tbBj5TY2/O6zJ9HeyusYB+XYY9fjjw4OWBJceOtkNsvgOZxcSe
	WxAu/Swh4t5pfx6I4AcSOQl7LkbxAyCz/cf0RxeFliAUq4ALl7FaqAqAeLXlVJ59EzIBxqf0APx7C
	K3JcDxApXjOv/yX+AYf5/U8lZcbMGY0MrfgTnX/XZxLQRDcT9e4X0pRkm/WBt9KjPDDjbmwwCyrdk
	ZMigqreqZT/puspVbGErbyoLQch0o8xKq1ZbzZPl4d357hV/a7u943M+ZuTfMKwoPbzRANkMKZEpy
	b7BMxy5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyB6-00000006mUj-34HO;
	Tue, 10 Jun 2025 12:34:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxYr-00000006hEg-3sDv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 11:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zIFWs5Mlh+bXQoz3OCLIjHjnN+GxzIfPlXP7QsSniyA=; b=oEsd/Dfnh2OxOYUG/x7pNOHtjK
	zstUG9frE+h7Sb/BP9aGwV+KgebBVtz6PMLD02fbv/AULn0fuTRH7BVPD+GxGBYwFsYZXQcPd6tFR
	P/F91OQn43Njyf9UNYtAnOkOSqAEpptllhQL96KWvXTUvwVMkpZVZzvzoLy29Td8vw5Ukunv5EF/7
	r9pgIegMHWvDcpbbvfKZp+TLiYBDdxheTlgiAxnE3Zeqk8gxZ6tRS3/xXIMhbuCGHt3oJ2Canx7yp
	vA8kO+cTkCojbFnQBXdEzKWLbk2VoA1oICap9KfIDE4WzAz5lcefc9DAnOHu/PzeQvNam9NYxYyTL
	hzv/2FWA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxYp-00000001n66-2WZz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 11:54:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B418514BF;
	Tue, 10 Jun 2025 04:54:13 -0700 (PDT)
Received: from [10.163.32.103] (unknown [10.163.32.103])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D46FF3F673;
	Tue, 10 Jun 2025 04:54:30 -0700 (PDT)
Message-ID: <66466825-dce2-4a88-993e-3185b1021cfa@arm.com>
Date: Tue, 10 Jun 2025 17:24:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] arm64: refactor aarch32_break_handler()
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <20250609173413.132168-3-ada.coupriediaz@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250609173413.132168-3-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_125435_948737_800C1056 
X-CRM114-Status: GOOD (  21.86  )
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



On 09/06/25 11:04 PM, Ada Couprie Diaz wrote:
> `aarch32_break_handler()` is called in `do_el0_undef()` when we
> are trying to handle an exception whose Exception Syndrome is unknown.
> It checks if the instruction hit might be a 32-bit arm break (be it
> A32 or T2), and sends a SIGTRAP to userspace if it is so that it can
> be handled.
> 
> However, this is badly represented in the naming of the function, and
> is not consistent with the other functions called with the same logic
> in `do_el0_undef()`.

Agreed.

> 
> Rename it `try_handle_aarch32_break()` and change the return value to
> a boolean to align with the logic of the other tentative handlers in
> `do_el0_undef()`, the previous error code being ignored anyway.

Makes sense.

> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/include/asm/debug-monitors.h |  2 +-
>  arch/arm64/kernel/debug-monitors.c      | 10 +++++-----
>  arch/arm64/kernel/traps.c               |  2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/debug-monitors.h b/arch/arm64/include/asm/debug-monitors.h
> index 8f6ba31b8658..e1caf6a8380c 100644
> --- a/arch/arm64/include/asm/debug-monitors.h
> +++ b/arch/arm64/include/asm/debug-monitors.h
> @@ -116,7 +116,7 @@ static inline int reinstall_suspended_bps(struct pt_regs *regs)
>  }
>  #endif
>  
> -int aarch32_break_handler(struct pt_regs *regs);
> +bool try_handle_aarch32_break(struct pt_regs *regs);
>  
>  void debug_traps_init(void);
>  
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 676fa0231935..9e69f2e915e8 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -334,7 +334,7 @@ static int brk_handler(unsigned long unused, unsigned long esr,
>  }
>  NOKPROBE_SYMBOL(brk_handler);
>  
> -int aarch32_break_handler(struct pt_regs *regs)
> +bool try_handle_aarch32_break(struct pt_regs *regs)
>  {
>  	u32 arm_instr;
>  	u16 thumb_instr;
> @@ -342,7 +342,7 @@ int aarch32_break_handler(struct pt_regs *regs)
>  	void __user *pc = (void __user *)instruction_pointer(regs);
>  
>  	if (!compat_user_mode(regs))
> -		return -EFAULT;
> +		return false;
>  
>  	if (compat_thumb_mode(regs)) {
>  		/* get 16-bit Thumb instruction */
> @@ -366,12 +366,12 @@ int aarch32_break_handler(struct pt_regs *regs)
>  	}
>  
>  	if (!bp)
> -		return -EFAULT;
> +		return false;
>  
>  	send_user_sigtrap(TRAP_BRKPT);
> -	return 0;
> +	return true;
>  }
> -NOKPROBE_SYMBOL(aarch32_break_handler);
> +NOKPROBE_SYMBOL(try_handle_aarch32_break);
>  
>  void __init debug_traps_init(void)
>  {
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 9bfa5c944379..685c11b2c553 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -454,7 +454,7 @@ void do_el0_undef(struct pt_regs *regs, unsigned long esr)
>  	u32 insn;
>  
>  	/* check for AArch32 breakpoint instructions */
> -	if (!aarch32_break_handler(regs))
> +	if (try_handle_aarch32_break(regs))
>  		return;
>  
>  	if (user_insn_read(regs, &insn))


