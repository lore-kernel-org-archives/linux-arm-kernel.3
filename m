Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFF0CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 17:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Id2EYLL8iifJNqwKS6WsQkVknrksaHJQmtPjUMKslZM=; b=D2J2R7/iJaAZiRsIowEib02JHi
	PhYpMYaP/s92MFhKhbbUSaQklk29cDZjicZmbaB2RfjqQt9MjuauAU+89oK7zWXi7IZsTutG+6FUa
	/pc9A4FQBmzrLBGbwMBGXqZlKHukkCCvNcEZRh965bsI0GmfQafxC+pGEJpnwlHuLGZlbtCvq3Fjg
	f+JS4+K4oiA8pIxVf+MnVJmzjIPyPeqlI5JeCkJ/asFd2mP2tLdd39BwGqZKMJ49a0JlJzGGLZgtw
	LCEzdcIuIewYukoKMy+9S2DzT19g5aDYcCEGOzmrZweYrDvFRik0bNL92b+qKOLL3ylXyPH8kiu0K
	QKd1PtqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux7H0-0000000Ahm3-42m5;
	Fri, 12 Sep 2025 17:09:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux7Gy-0000000AhlV-1IBE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 17:09:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01CC741B04;
	Fri, 12 Sep 2025 17:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1EAC4CEF1;
	Fri, 12 Sep 2025 17:09:17 +0000 (UTC)
Date: Fri, 12 Sep 2025 18:09:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 6/6] arm64: futex: support futex with FEAT_LSUI
Message-ID: <aMRTu3lcwqhu-dYY@arm.com>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <20250816151929.197589-7-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816151929.197589-7-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_100920_368208_AEEE622A 
X-CRM114-Status: GOOD (  14.00  )
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

On Sat, Aug 16, 2025 at 04:19:29PM +0100, Yeoreum Yun wrote:
> @@ -115,11 +117,137 @@ __llsc_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
>  	return ret;
>  }
> 
> +#ifdef CONFIG_AS_HAS_LSUI
> +
> +#define __LSUI_PREAMBLE	".arch_extension lsui\n"
> +
> +#define LSUI_FUTEX_ATOMIC_OP(op, asm_op, mb)				\
> +static __always_inline int						\
> +__lsui_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
> +{									\
> +	int ret = 0;							\
> +	int oldval;							\
> +									\
> +	uaccess_ttbr0_enable();						\

I think we can drop uaccess_ttbr0_*() from these functions. At the
kconfig level, TTBR0_PAN selects PAN. Hardware with LSUI will also
have PAN (since 8.1), so the above is an unnecessary branch or nop,
depending on how the alternatives play out. But add a comment instead.

> +static __always_inline int
> +__lsui_futex_atomic_eor(int oparg, u32 __user *uaddr, int *oval)
> +{
> +	unsigned int loops = LLSC_MAX_LOOPS;
> +	int ret, oldval, tmp;
> +
> +	uaccess_ttbr0_enable();
> +	/*
> +	 * there are no ldteor/stteor instructions...
> +	 */
> +	asm volatile("// __lsui_futex_atomic_eor\n"
> +	__LSUI_PREAMBLE
> +"	prfm	pstl1strm, %2\n"
> +"1:	ldtxr	%w1, %2\n"
> +"	eor	%w3, %w1, %w5\n"
> +"2:	stltxr	%w0, %w3, %2\n"
> +"	cbz	%w0, 3f\n"
> +"	sub	%w4, %w4, %w0\n"
> +"	cbnz	%w4, 1b\n"
> +"	mov	%w0, %w6\n"
> +"3:\n"
> +"	dmb	ish\n"
> +	_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %w0)
> +	_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %w0)
> +	: "=&r" (ret), "=&r" (oldval), "+Q" (*uaddr), "=&r" (tmp),
> +	  "+r" (loops)
> +	: "r" (oparg), "Ir" (-EAGAIN)
> +	: "memory");
> +	uaccess_ttbr0_disable();
> +
> +	if (!ret)
> +		*oval = oldval;
> +
> +	return ret;
> +}

That's an unfortunate omission from the architecture.

> +#define __lsui_llsc_body(op, ...)					\
> +({									\
> +	alternative_has_cap_likely(ARM64_HAS_LSUI) ?			\
> +		__lsui_##op(__VA_ARGS__) : __llsc_##op(__VA_ARGS__);	\
> +})
> +
> +#else	/* CONFIG_AS_HAS_LSUI */
> +
> +#define __lsui_llsc_body(op, ...)	__llsc_##op(__VA_ARGS__)
> +
> +#endif	/* CONFIG_AS_HAS_LSUI */
> +
> +
>  #define FUTEX_ATOMIC_OP(op)						\
>  static __always_inline int						\
>  __futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)		\
>  {									\
> -	return __llsc_futex_atomic_##op(oparg, uaddr, oval);		\
> +	return __lsui_llsc_body(futex_atomic_##op, oparg, uaddr, oval);	\
>  }

That's what I got confused about. It looks fine:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

