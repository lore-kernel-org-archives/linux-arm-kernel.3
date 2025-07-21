Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B82C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 12:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VctJMslEYVZcVlpXvooYWTcgUZ/ZQQB8V6K7a7pI+oY=; b=BuQtMPq6ZqOKOHNSdp3PhlVjOk
	OrzMOQxIJni6CnRk0cWz67ykRa7bDtKFy4N5EFh5EWx2wr/aHUNtJwgHKZbs9dFLRFwO666gA3cov
	0iGCx8GZnmktKYN4VkjYIjJHRO2f6jouwZ1f2sebPfBsF5GGAgicBcDUOcZjsIzEO+eI9jpumqYDW
	H0PVJ4p5A1VIiKqz8FLfJMZsWbpKzZCh6RBYhm1XY89Py0KAlVexiRUkoUlrWau/gz/DbpnRbQXuO
	uvOq5yIsxNWOgBRLaND9DUpObKCqqv0F8OEtVsciuAI9dP668omFrNAXFV+dMrdM+SfdGXtC2hcw5
	J+OhJA1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udpt2-0000000HHY0-3wJb;
	Mon, 21 Jul 2025 12:44:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoCT-0000000H0rF-3REG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 10:56:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F9A3153B;
	Mon, 21 Jul 2025 03:56:47 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48F6D3F6A8;
	Mon, 21 Jul 2025 03:56:51 -0700 (PDT)
Date: Mon, 21 Jul 2025 11:56:48 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, ardb@kernel.org, frederic@kernel.org,
	james.morse@arm.com, joey.gouly@arm.com,
	scott@os.amperecomputing.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] arm64/futex: move futex atomic logic with
 clearing PAN bit
Message-ID: <aH4c8J3-qp9guE__@J2N7QTR9R3>
References: <20250721083618.2743569-1-yeoreum.yun@arm.com>
 <20250721083618.2743569-5-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721083618.2743569-5-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_035653_934631_4D59D848 
X-CRM114-Status: GOOD (  23.17  )
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

On Mon, Jul 21, 2025 at 09:36:15AM +0100, Yeoreum Yun wrote:
> Move current futex atomic logics which uses ll/sc method with cleraing
> PSTATE.PAN to separate file (futex_ll_sc_u.h) so that
> former method will be used only when FEAT_LSUI isn't supported.

This isn't moving logic, this is *duplicating* the existing logic. As of
this patch, this logic in the <asm/futex_ll_sc_u.h> header is unused,
and the existing logic in <asm/futex.h> is still used as-is.

Please refactor the existing logic first. The deletion of the existing
code should happen at the same time as this addition. That way it's
possible to see that the deleted logic corresponds to what is being
added in the header, and it's generally nicer for bisection.

Mark.

> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/include/asm/futex_ll_sc_u.h | 115 +++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 arch/arm64/include/asm/futex_ll_sc_u.h
> 
> diff --git a/arch/arm64/include/asm/futex_ll_sc_u.h b/arch/arm64/include/asm/futex_ll_sc_u.h
> new file mode 100644
> index 000000000000..6702ba66f1b2
> --- /dev/null
> +++ b/arch/arm64/include/asm/futex_ll_sc_u.h
> @@ -0,0 +1,115 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2025 Arm Ltd.
> + */
> +#ifndef __ASM_FUTEX_LL_SC_U_H
> +#define __ASM_FUTEX_LL_SC_U_H
> +
> +#include <linux/uaccess.h>
> +#include <linux/stringify.h>
> +
> +#define FUTEX_ATOMIC_OP(op, asm_op)					\
> +static __always_inline int						\
> +__ll_sc_u_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
> +{									\
> +	unsigned int loops = LL_SC_MAX_LOOPS;				\
> +	int ret, val, tmp;						\
> +									\
> +	uaccess_enable_privileged();					\
> +	asm volatile("// __ll_sc_u_futex_atomic_" #op "\n"		\
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
> +	_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %w0)				\
> +	_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %w0)				\
> +	: "=&r" (ret), "=&r" (val), "+Q" (*uaddr), "=&r" (tmp),		\
> +	  "+r" (loops)							\
> +	: "r" (oparg), "Ir" (-EAGAIN)					\
> +	: "memory");							\
> +	uaccess_disable_privileged();					\
> +									\
> +	if (!ret)							\
> +		*oval = val;						\
> +									\
> +	return ret;							\
> +}
> +
> +FUTEX_ATOMIC_OP(add, add)
> +FUTEX_ATOMIC_OP(or, orr)
> +FUTEX_ATOMIC_OP(and, and)
> +FUTEX_ATOMIC_OP(eor, eor)
> +
> +#undef FUTEX_ATOMIC_OP
> +
> +static __always_inline int
> +__ll_sc_u_futex_atomic_set(int oparg, u32 __user *uaddr, int *oval)
> +{
> +	unsigned int loops = LL_SC_MAX_LOOPS;
> +	int ret, val;
> +
> +	uaccess_enable_privileged();
> +	asm volatile("//__ll_sc_u_futex_xchg\n"
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
> +
> +	if (!ret)
> +		*oval = val;
> +
> +	return ret;
> +}
> +
> +static __always_inline int
> +__ll_sc_u_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
> +{
> +	int ret = 0;
> +	unsigned int loops = LL_SC_MAX_LOOPS;
> +	u32 val, tmp;
> +
> +	uaccess_enable_privileged();
> +	asm volatile("//__ll_sc_u_futex_cmpxchg\n"
> +	"	prfm	pstl1strm, %2\n"
> +	"1:	ldxr	%w1, %2\n"
> +	"	eor	%w3, %w1, %w5\n"
> +	"	cbnz	%w3, 4f\n"
> +	"2:	stlxr	%w3, %w6, %2\n"
> +	"	cbz	%w3, 3f\n"
> +	"	sub	%w4, %w4, %w3\n"
> +	"	cbnz	%w4, 1b\n"
> +	"	mov	%w0, %w7\n"
> +	"3:\n"
> +	"	dmb	ish\n"
> +	"4:\n"
> +	_ASM_EXTABLE_UACCESS_ERR(1b, 4b, %w0)
> +	_ASM_EXTABLE_UACCESS_ERR(2b, 4b, %w0)
> +	: "+r" (ret), "=&r" (val), "+Q" (*uaddr), "=&r" (tmp), "+r" (loops)
> +	: "r" (oldval), "r" (newval), "Ir" (-EAGAIN)
> +	: "memory");
> +	uaccess_disable_privileged();
> +
> +	if (!ret)
> +		*oval = val;
> +
> +	return ret;
> +}
> +
> +#endif /* __ASM_FUTEX_LL_SC_U_H */
> -- 
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 
> 

