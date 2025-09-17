Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC98DCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 13:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HV4vArV7VH8vROqN53f6FqlCpI9+Ns88aBVMNfA2mlU=; b=jseT5mtWoAwCS9rhgU0Xjkj6GT
	CF73YjGwqs6oNnZ4Ld8pdgabbmXkJlAOiFgJX0MDDGVVGTWtGgoTBAFUC3Jv+OcOwBSImE5fv76YN
	0WPbemSdI/dipA1fQCFOe6+Ei9VGaoNmV60jGT0ckicNvGx2hudY2Ga5w3B71UWOyDfo37zxw/1M8
	bkzX1iajmlrdT9LOtSXZB1PbWaMybu0ajQR2btydcDAXtPUf1d0/xWlZNgcwf9e+bP2uYhTwA+Xvo
	1H7GkkOOkpxthISIB1r5EbS218zi3EHybBRXcMyQBcYuL6bFbzxO5Ocov20xMifG2svYu2ayGlfyf
	NzWoWC5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrqc-0000000BWwR-36BP;
	Wed, 17 Sep 2025 13:05:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrqa-0000000BWu3-2ugR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 13:05:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83712267F;
	Wed, 17 Sep 2025 06:05:09 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E86B3F66E;
	Wed, 17 Sep 2025 06:05:15 -0700 (PDT)
Date: Wed, 17 Sep 2025 14:04:43 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	james.morse@arm.com, ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/5] arm64: futex: support futex with FEAT_LSUI
Message-ID: <aMqx67lZZEgYW-x5@J2N7QTR9R3>
References: <20250917110838.917281-1-yeoreum.yun@arm.com>
 <20250917110838.917281-6-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917110838.917281-6-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_060520_822297_623FE4F1 
X-CRM114-Status: GOOD (  17.79  )
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

On Wed, Sep 17, 2025 at 12:08:38PM +0100, Yeoreum Yun wrote:
> +static __always_inline int
> +__lsui_cmpxchg64(u64 __user *uaddr, u64 *oldval, u64 newval)
> +{
> +	int ret = 0;
> +
> +	asm volatile("// __lsui_cmpxchg64\n"
> +	__LSUI_PREAMBLE
> +"1:	casalt	%x2, %x3, %1\n"
> +"2:\n"
> +	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)
> +	: "+r" (ret), "+Q" (*uaddr), "+r" (*oldval)
> +	: "r" (newval)
> +	: "memory");
> +
> +	return ret;
> +}
> +
> +static __always_inline int
> +__lsui_cmpxchg32(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
> +{
> +	u64 __user *uaddr_al;

Please use 'uaddr64' to match the other 64-bit variables.

I assume that the '_al' suffix is meant to be short for 'aligned', but I
think using '64' is more consistent and clearer.

> +	u64 oval64, nval64, tmp;

Likewise, 'orig64' would be clearer than 'tmp' here.

> +	static const u64 hi_mask = IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ?
> +		GENMASK_U64(63, 32): GENMASK_U64(31, 0);
> +	static const u8 hi_shift = IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? 32 : 0;
> +	static const u8 lo_shift = IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? 0 : 32;
> +
> +	uaddr_al = (u64 __user *) PTR_ALIGN_DOWN(uaddr, sizeof(u64));
> +	if (get_user(oval64, uaddr_al))
> +		return -EFAULT;
> +
> +	if ((u32 __user *)uaddr_al != uaddr) {
> +		nval64 = ((oval64 & ~hi_mask) | ((u64)newval << hi_shift));
> +		oval64 = ((oval64 & ~hi_mask) | ((u64)oldval << hi_shift));
> +	} else {
> +		nval64 = ((oval64 & hi_mask) | ((u64)newval << lo_shift));
> +		oval64 = ((oval64 & hi_mask) | ((u64)oldval << lo_shift));
> +	}
> +
> +	tmp = oval64;
> +
> +	if (__lsui_cmpxchg64(uaddr_al, &oval64, nval64))
> +		return -EFAULT;
> +
> +	if (tmp != oval64)
> +		return -EAGAIN;

This means that we'll immediately return -EAGAIN upon a spurious failure
(where the adjacent 4 bytes have changed), whereas the LL/SC ops would
retry FUTEX_MAX_LOOPS before returning -EGAIN.

I suspect we want to retry here (or in the immediate caller).

> +
> +	*oval = oldval;
> +
> +	return 0;
> +}

Aside from the retry issue, I *think* you can simplify this to something
like:

static __always_inline int
__lsui_cmpxchg32(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
{
	uaddr64 = (u64 __user *)PTR_ALIGN_DOWN(uaddr, sizeof(u64));
	u64 oval64, nval64, orig64;

	if (get_user(oval64, uaddr64)
		return -EFAULT;
	
	if (IS_ALIGNED(addr, sizeof(u64)) == IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN))  {
		FIELD_MODIFY(GENMASK_U64(31, 0), &oval64, oldval);
		FIELD_MODIFY(GENMASK_U64(31, 0), &nval64, newval);
	} else {
		FIELD_MODIFY(GENMASK_U64(63, 32), &oval64, oldval);
		FIELD_MODIFY(GENMASK_U64(63, 32), &nval64, newval);
	}
	orig64 = oval64;

	if (__lsui_cmpxchg64(uaddr_al, &oval64, nval64))
		return -EFAULT;
	
	if (oval64 != orig64)
		return -EAGAIN;

	*oval = oldval;
	return 0;
}

Mark.

> +
> +static __always_inline int
> +__lsui_futex_atomic_and(int oparg, u32 __user *uaddr, int *oval)
> +{
> +	return __lsui_futex_atomic_andnot(~oparg, uaddr, oval);
> +}
> +
> +static __always_inline int
> +__lsui_futex_atomic_eor(int oparg, u32 __user *uaddr, int *oval)
> +{
> +	u32 oldval, newval;
> +
> +	/*
> +	 * there are no ldteor/stteor instructions...
> +	 */
> +	if (get_user(oldval, uaddr))
> +		return -EFAULT;
> +
> +	newval = oldval ^ oparg;
> +
> +	return __lsui_cmpxchg32(uaddr, oldval, newval, oval);
> +
> +}
> +
> +static __always_inline int
> +__lsui_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
> +{
> +	return __lsui_cmpxchg32(uaddr, oldval, newval, oval);
> +}
> +
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
>  
>  FUTEX_ATOMIC_OP(add)
> -- 
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 

