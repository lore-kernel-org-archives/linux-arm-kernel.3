Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0B3CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KE6Sj61b2koz6A8aE1LGhmxRMmb0llLu8ZrWsTcUtgo=; b=sV+drH/wxvnEgchFVTqr249V/Z
	iN28T9ITFxanMxaeLaTtq4e15U1+dM2DT7oeT8ZKJ5kgYWT9kPF5lw1HrptReZXMmYkFWQ7kNPYVm
	48hR2Lndcq007IgcapUyQOGCsUvzbXzdVDrvDzFxX1j036G5684iVKr4Pkw6u68pF6H9C9/jnNFSB
	BSXdFbSs7W5w4FvyChTlFZv6xYrKpu53FE7a7gg/QIMAUymcGSGG81cpimMB1axKgLKmLQ5E9xZGk
	H4eNRpRUOigHQi5BXdtX6WCf1oyBqlf9ByLqHpzZeiTANWR8mso9yzHk553fR6ucR/gwsOQjCwy05
	8gxFyDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjEH-00000003tWp-2dSV;
	Thu, 11 Sep 2025 15:28:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjEG-00000003tW0-2lwD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:28:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 19E9C60234;
	Thu, 11 Sep 2025 15:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0BBC4CEF0;
	Thu, 11 Sep 2025 15:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757604535;
	bh=7zogeD5U+3a3b8x9LW5ah9FYZnDdsBjL9Qsg7Ua4oy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pHRwvcbfBxyQUYkjkexYTVYl9ySPcLwALUBC4vaBD1UyWRvgoRdRvwd70UoKnqD5Q
	 FUDwHqjMtZSoO7VTmFDwt1oZ/6G/kdyQJ473Rzg6wfd6q4NpwXtotx3v4WBYp6IWGk
	 PrhGM4z6ZXc0yVSj2AQd3OQwgwXimWGgBX82ZgtE0yy3ZYyUWVKeHX+mb9HRDeZmdE
	 xlcJuztvM3qEDnS9zTrh0CcDCldYE0/o6NpiE/oJnBqd1N3b9xRPiOZpWRQCLMWJ9Y
	 Vh5dbqboW1BkhyaT6KmsJxTMUZqHro3kF+fpJ5ArvSlVwQGF4/zNlRaYd3G3OiRSkJ
	 2ylPwTbCDibeg==
Date: Thu, 11 Sep 2025 16:28:49 +0100
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 RESEND 5/6] arm64: futex: small optimisation for
 __llsc_futex_atomic_set()
Message-ID: <aMLqsez5y9R6FIdJ@willie-the-truck>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <20250816151929.197589-6-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816151929.197589-6-yeoreum.yun@arm.com>
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

On Sat, Aug 16, 2025 at 04:19:28PM +0100, Yeoreum Yun wrote:
> __llsc_futex_atomic_set() is implmented using
> LLSC_FUTEX_ATOMIC_OP() macro with "mov  %w3, %w5".
> But this instruction isn't required to implement fux_atomic_set()
> so make a small optimisation by implementing __llsc_futex_atomic_set()
> as separate function.
> 
> This will make usage of LLSC_FUTEX_ATOMIC_OP() macro more simple.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/include/asm/futex.h | 43 ++++++++++++++++++++++++++++------
>  1 file changed, 36 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
> index ab7003cb4724..22a6301a9f3d 100644
> --- a/arch/arm64/include/asm/futex.h
> +++ b/arch/arm64/include/asm/futex.h
> @@ -13,7 +13,7 @@
> 
>  #define LLSC_MAX_LOOPS	128 /* What's the largest number you can think of? */
> 
> -#define LLSC_FUTEX_ATOMIC_OP(op, insn)					\
> +#define LLSC_FUTEX_ATOMIC_OP(op, asm_op)				\
>  static __always_inline int						\
>  __llsc_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
>  {									\
> @@ -24,7 +24,7 @@ __llsc_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
>  	asm volatile("// __llsc_futex_atomic_" #op "\n"			\
>  "	prfm	pstl1strm, %2\n"					\
>  "1:	ldxr	%w1, %2\n"						\
> -	insn "\n"							\
> +"	" #asm_op "	%w3, %w1, %w5\n"				\
>  "2:	stlxr	%w0, %w3, %2\n"						\
>  "	cbz	%w0, 3f\n"						\
>  "	sub	%w4, %w4, %w0\n"					\
> @@ -46,11 +46,40 @@ __llsc_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
>  	return ret;							\
>  }
> 
> -LLSC_FUTEX_ATOMIC_OP(add, "add	%w3, %w1, %w5")
> -LLSC_FUTEX_ATOMIC_OP(or, "orr	%w3, %w1, %w5")
> -LLSC_FUTEX_ATOMIC_OP(and, "and	%w3, %w1, %w5")
> -LLSC_FUTEX_ATOMIC_OP(eor, "eor	%w3, %w1, %w5")
> -LLSC_FUTEX_ATOMIC_OP(set, "mov	%w3, %w5")
> +LLSC_FUTEX_ATOMIC_OP(add, add)
> +LLSC_FUTEX_ATOMIC_OP(or, orr)
> +LLSC_FUTEX_ATOMIC_OP(and, and)
> +LLSC_FUTEX_ATOMIC_OP(eor, eor)
> +
> +static __always_inline int
> +__llsc_futex_atomic_set(int oparg, u32 __user *uaddr, int *oval)
> +{
> +	unsigned int loops = LLSC_MAX_LOOPS;
> +	int ret, oldval;
> +
> +	uaccess_enable_privileged();
> +	asm volatile("//__llsc_futex_xchg\n"
> +"	prfm	pstl1strm, %2\n"
> +"1:	ldxr	%w1, %2\n"
> +"2:	stlxr	%w0, %w4, %2\n"
> +"	cbz	%w3, 3f\n"
> +"	sub	%w3, %w3, %w0\n"
> +"	cbnz	%w3, 1b\n"
> +"	mov	%w0, %w5\n"
> +"3:\n"
> +"	dmb	ish\n"
> +	_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %w0)
> +	_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %w0)
> +	: "=&r" (ret), "=&r" (oldval), "+Q" (*uaddr), "+r" (loops)
> +	: "r" (oparg), "Ir" (-EAGAIN)
> +	: "memory");
> +	uaccess_disable_privileged();
> +
> +	if (!ret)
> +		*oval = oldval;

Hmm, I'm really not sure this is worthwhile. I doubt the "optimisation"
actually does anything and adding a whole new block of asm just for the
SET case isn't much of an improvement on the maintainability side, either.

Will

