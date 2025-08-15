Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A079CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 18:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLBACWIzrhFnrO2MK/mcRHnwpESiGz6YvmILFeuKmEg=; b=NmwN2HxeKhW3LO1nxa7NVACKK/
	G+f+eAqpVcMsRRB5BQbb1XZqoHfGkDLXOWwyJ9llk5qYwOzb2dvseObXAY+LLOHJvCQZAzbIDoOps
	ulZHolffWyxcumpXKJJQOGEvU33P+h5ITAUTYfPXmnHyS65P0FklPZ0pUEpgHS86pWrs6C9WImiRK
	7vwTcIUiA1fS1fveStEEb8PniajXvevWvccvS8SAyRfoHjPeKr+wcbjL1Q1b0UcVEqcBtK2cTNmPV
	VOb3lm+BQDtPIfNP8IcdBlp+LCevvz+QAfedmT7V04roB/2GrBJ7cLvxKNaipbfPTJqHzDksDzgg+
	J4dPz2zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umz4q-00000003F0I-13mS;
	Fri, 15 Aug 2025 18:22:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxSI-00000002zY3-3bN5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 16:39:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05EABA58309;
	Fri, 15 Aug 2025 16:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6195C4CEEB;
	Fri, 15 Aug 2025 16:38:57 +0000 (UTC)
Date: Fri, 15 Aug 2025 17:38:55 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, shameerali.kolothum.thodi@huawei.com,
	joey.gouly@arm.com, james.morse@arm.com, ardb@kernel.org,
	scott@os.amperecomputing.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/5] arm64: futex: refactor futex atomic operation
Message-ID: <aJ9in0fUI01J3a4S@arm.com>
References: <20250811163635.1562145-1-yeoreum.yun@arm.com>
 <20250811163635.1562145-5-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811163635.1562145-5-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_093903_020939_FD2A452F 
X-CRM114-Status: GOOD (  21.20  )
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

On Mon, Aug 11, 2025 at 05:36:34PM +0100, Yeoreum Yun wrote:
> Refactor futex atomic operations using ll/sc method with
> clearing PSTATE.PAN to prepare to apply FEAT_LSUI on them.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/include/asm/futex.h | 183 ++++++++++++++++++++++-----------
>  1 file changed, 124 insertions(+), 59 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
> index bc06691d2062..fdec4f3f2b15 100644
> --- a/arch/arm64/include/asm/futex.h
> +++ b/arch/arm64/include/asm/futex.h
> @@ -7,73 +7,164 @@
>  
>  #include <linux/futex.h>
>  #include <linux/uaccess.h>
> +#include <linux/stringify.h>
>  
>  #include <asm/errno.h>
>  
> -#define FUTEX_MAX_LOOPS	128 /* What's the largest number you can think of? */
> +#define LLSC_MAX_LOOPS	128 /* What's the largest number you can think of? */
>  
> -#define __futex_atomic_op(insn, ret, oldval, uaddr, tmp, oparg)		\
> -do {									\
> -	unsigned int loops = FUTEX_MAX_LOOPS;				\
> +#define LLSC_FUTEX_ATOMIC_OP(op, asm_op)				\
> +static __always_inline int						\
> +__llsc_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
> +{									\
> +	unsigned int loops = LLSC_MAX_LOOPS;				\
> +	int ret, val, tmp;						\
>  									\
>  	uaccess_enable_privileged();					\
> -	asm volatile(							\
> -"	prfm	pstl1strm, %2\n"					\
> -"1:	ldxr	%w1, %2\n"						\
> -	insn "\n"							\
> -"2:	stlxr	%w0, %w3, %2\n"						\
> -"	cbz	%w0, 3f\n"						\
> -"	sub	%w4, %w4, %w0\n"					\
> -"	cbnz	%w4, 1b\n"						\
> -"	mov	%w0, %w6\n"						\
> -"3:\n"									\
> -"	dmb	ish\n"							\
> +	asm volatile("// __llsc_futex_atomic_" #op "\n"		\
> +	"	prfm	pstl1strm, %2\n"				\
> +	"1:	ldxr	%w1, %2\n"					\
> +	"	" #asm_op "	%w3, %w1, %w5\n"			\
> +	"2:	stlxr	%w0, %w3, %2\n"					\
> +	"	cbz	%w0, 3f\n"					\
> +	"	sub	%w4, %w4, %w0\n"				\
> +	"	cbnz	%w4, 1b\n"					\
> +	"	mov	%w0, %w6\n"					\
> +	"3:\n"								\
> +	"	dmb	ish\n"						\

Don't change indentation and code in the same patch, it makes it harder
to follow what you actually changed. I guess the only difference is
asm_op instead of insn.

>  	_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %w0)				\
>  	_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %w0)				\
> -	: "=&r" (ret), "=&r" (oldval), "+Q" (*uaddr), "=&r" (tmp),	\
> +	: "=&r" (ret), "=&r" (val), "+Q" (*uaddr), "=&r" (tmp),		\

And here you changed oldval to val (was this necessary?)

>  	  "+r" (loops)							\
>  	: "r" (oparg), "Ir" (-EAGAIN)					\
>  	: "memory");							\
>  	uaccess_disable_privileged();					\
> -} while (0)
> +									\
> +	if (!ret)							\
> +		*oval = val;						\
> +									\
> +	return ret;							\
> +}
> +
> +LLSC_FUTEX_ATOMIC_OP(add, add)
> +LLSC_FUTEX_ATOMIC_OP(or, orr)
> +LLSC_FUTEX_ATOMIC_OP(and, and)
> +LLSC_FUTEX_ATOMIC_OP(eor, eor)
> +
> +static __always_inline int
> +__llsc_futex_atomic_set(int oparg, u32 __user *uaddr, int *oval)
> +{
> +	unsigned int loops = LLSC_MAX_LOOPS;
> +	int ret, val;
> +
> +	uaccess_enable_privileged();
> +	asm volatile("//__llsc_futex_xchg\n"
> +	"	prfm	pstl1strm, %2\n"
> +	"1:	ldxr	%w1, %2\n"
> +	"2:	stlxr	%w0, %w4, %2\n"
> +	"	cbz	%w3, 3f\n"
> +	"	sub	%w3, %w3, %w0\n"
> +	"	cbnz	%w3, 1b\n"
> +	"	mov	%w0, %w5\n"
> +	"3:\n"
> +	"	dmb	ish\n"
> +	_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %w0)
> +	_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %w0)
> +	: "=&r" (ret), "=&r" (val), "+Q" (*uaddr), "+r" (loops)
> +	: "r" (oparg), "Ir" (-EAGAIN)
> +	: "memory");
> +	uaccess_disable_privileged();

Was this separate function just to avoid the "mov" instruction for the
"set" case? The patch description states that the reworking is necessary
for the FEAT_LSUI use but it looks to me like it does more. Please split
it in separate patches, though I'd leave any potential optimisation for
a separate series and keep the current code as close as possible to the
original one.

-- 
Catalin

