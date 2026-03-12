Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64A1106ACCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 18:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXNu0+M1oUG4WNnJP19IA9hK1g6BtRGTO2pEOPi0Dno=; b=zOTGUvVJQlZiy63pdZZyOiGwJu
	KZBcOh3B6mN7mZL2URxNfMLoMExyzr2iFOb09zR+F+T+6EFMW9f1MHo9V2ueCVEoc8MjkuHhC/O8u
	s7ZqfbggTEv2thA5KqegrU9aaU4nukPiJzk/4E29TFkLa1SngR14zqMq8Y4ojwQVK04A6iUyLD+x+
	JcNPeZ3e2NiTJMLWcmfa9HqvBDdi0N05lzspgYshQ+bx0vknkO5rCRG+pofNgf+DGWH2kYa+cDDQr
	uUMgqHTOH5Pi0rS5AgA6L1amoMSRztwP65TANQ0PIR+/I2SFz71+CEAhRUn56ly6Xf7xF5ytDounI
	N8SWDTIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kbI-0000000Erbv-4AIs;
	Thu, 12 Mar 2026 18:17:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kbG-0000000ErbE-41VG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 18:17:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75E22165C;
	Thu, 12 Mar 2026 11:17:26 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B4223F73B;
	Thu, 12 Mar 2026 11:17:30 -0700 (PDT)
Date: Thu, 12 Mar 2026 18:17:28 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, will@kernel.org, maz@kernel.org,
	oupton@kernel.org, miko.lenczewski@arm.com, kevin.brodsky@arm.com,
	broonie@kernel.org, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, joey.gouly@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v15 5/8] arm64: futex: support futex with FEAT_LSUI
Message-ID: <abMDOC5DYEm74And@arm.com>
References: <20260227151705.1275328-1-yeoreum.yun@arm.com>
 <20260227151705.1275328-6-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227151705.1275328-6-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_111735_088077_2CC00702 
X-CRM114-Status: GOOD (  29.18  )
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

On Fri, Feb 27, 2026 at 03:17:02PM +0000, Yeoreum Yun wrote:
> +#ifdef CONFIG_ARM64_LSUI
> +
> +/*
> + * FEAT_LSUI is supported since Armv9.6, where FEAT_PAN is mandatory.
> + * However, this assumption may not always hold:
> + *
> + *   - Some CPUs advertise FEAT_LSUI but lack FEAT_PAN.
> + *   - Virtualisation or ID register overrides may expose invalid
> + *     feature combinations.
> + *
> + * Rather than disabling FEAT_LSUI when FEAT_PAN is absent, wrap LSUI
> + * instructions with uaccess_ttbr0_enable()/disable() when
> + * ARM64_SW_TTBR0_PAN is enabled.
> + */

I'd just keep this comment in the commit log. Here you could simply say
that user access instructions don't require (hardware) PAN toggling. It
should be obvious why we use ttbr0 toggling like for other uaccess
routines.

> +#define LSUI_FUTEX_ATOMIC_OP(op, asm_op)				\
> +static __always_inline int						\
> +__lsui_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
> +{									\
> +	int ret = 0;							\
> +	int oldval;							\
> +									\
> +	uaccess_ttbr0_enable();						\
> +									\
> +	asm volatile("// __lsui_futex_atomic_" #op "\n"			\
> +	__LSUI_PREAMBLE							\
> +"1:	" #asm_op "al	%w3, %w2, %1\n"					\

As I mentioned on a previous patch, can we not use named operators here?

> +"2:\n"									\
> +	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)				\
> +	: "+r" (ret), "+Q" (*uaddr), "=r" (oldval)			\
> +	: "r" (oparg)							\
> +	: "memory");							\
> +									\
> +	uaccess_ttbr0_disable();					\
> +									\
> +	if (!ret)							\
> +		*oval = oldval;						\
> +	return ret;							\
> +}
> +
> +LSUI_FUTEX_ATOMIC_OP(add, ldtadd)
> +LSUI_FUTEX_ATOMIC_OP(or, ldtset)
> +LSUI_FUTEX_ATOMIC_OP(andnot, ldtclr)
> +LSUI_FUTEX_ATOMIC_OP(set, swpt)
> +
> +static __always_inline int
> +__lsui_cmpxchg64(u64 __user *uaddr, u64 *oldval, u64 newval)
> +{
> +	int ret = 0;
> +
> +	uaccess_ttbr0_enable();
> +
> +	asm volatile("// __lsui_cmpxchg64\n"
> +	__LSUI_PREAMBLE
> +"1:	casalt	%2, %3, %1\n"
> +"2:\n"
> +	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)
> +	: "+r" (ret), "+Q" (*uaddr), "+r" (*oldval)
> +	: "r" (newval)
> +	: "memory");
> +
> +	uaccess_ttbr0_disable();
> +
> +	return ret;

So here it returns EFAULT only if the check failed. The EAGAIN is only
possible in cmpxchg32. That's fine but I have more comments below.

> +}
> +
> +static __always_inline int
> +__lsui_cmpxchg32(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
> +{
> +	u64 __user *uaddr64;
> +	bool futex_pos, other_pos;
> +	int ret, i;
> +	u32 other, orig_other;
> +	union {
> +		u32 futex[2];
> +		u64 raw;
> +	} oval64, orig64, nval64;
> +
> +	uaddr64 = (u64 __user *) PTR_ALIGN_DOWN(uaddr, sizeof(u64));

Nit: we don't use space after the type cast.

> +	futex_pos = !IS_ALIGNED((unsigned long)uaddr, sizeof(u64));
> +	other_pos = !futex_pos;
> +
> +	oval64.futex[futex_pos] = oldval;
> +	ret = get_user(oval64.futex[other_pos], (u32 __user *)uaddr64 + other_pos);
> +	if (ret)
> +		return -EFAULT;
> +
> +	ret = -EAGAIN;
> +	for (i = 0; i < FUTEX_MAX_LOOPS; i++) {

I was wondering if we still need the FUTEX_MAX_LOOPS bound with LSUI. I
guess with CAS we can have some malicious user that keeps updating the
futex location or the adjacent one on another CPU. However, I think we'd
need to differentiate between futex_atomic_cmpxchg_inatomic() use and
the eor case.

> +		orig64.raw = nval64.raw = oval64.raw;
> +
> +		nval64.futex[futex_pos] = newval;

I'd keep orig64.raw = oval64.raw and set the nval64 separately (I find
it clearer, not sure the compiler cares much):

		nval64.futex[futex_pos] = newval;
		nval64.futex[other_pos] = oval64.futex[other_pos];

> +
> +		if (__lsui_cmpxchg64(uaddr64, &oval64.raw, nval64.raw))
> +			return -EFAULT;
> +
> +		oldval = oval64.futex[futex_pos];
> +		other = oval64.futex[other_pos];
> +		orig_other = orig64.futex[other_pos];
> +
> +		if (other == orig_other) {
> +			ret = 0;
> +			break;
> +		}

Is this check correct? What if the cmpxchg64 failed because futex_pos
was changed but other_pos remained the same, it will just report success
here. You need to compare the full 64-bit value to ensure the cmpxchg64
succeeded.

> +	}
> +
> +	if (!ret)
> +		*oval = oldval;
> +
> +	return ret;
> +}
> +
> +static __always_inline int
> +__lsui_futex_atomic_and(int oparg, u32 __user *uaddr, int *oval)
> +{
> +	/*
> +	 * Undo the bitwise negation applied to the oparg passed from
> +	 * arch_futex_atomic_op_inuser() with FUTEX_OP_ANDN.
> +	 */
> +	return __lsui_futex_atomic_andnot(~oparg, uaddr, oval);
> +}
> +
> +static __always_inline int
> +__lsui_futex_atomic_eor(int oparg, u32 __user *uaddr, int *oval)
> +{
> +	u32 oldval, newval, val;
> +	int ret, i;
> +
> +	if (get_user(oldval, uaddr))
> +		return -EFAULT;
> +
> +	/*
> +	 * there are no ldteor/stteor instructions...
> +	 */
> +	for (i = 0; i < FUTEX_MAX_LOOPS; i++) {
> +		newval = oldval ^ oparg;
> +
> +		ret = __lsui_cmpxchg32(uaddr, oldval, newval, &val);

Since we have a FUTEX_MAX_LOOPS here, do we need it in cmpxchg32 as
well?

For eor, we need a loop irrespective of whether futex_pos or other_pos
have changed. For cmpxchg, we need the loop only if other_pos has
changed and return -EAGAIN if futex_pos has changed since the caller
needs to update oldval and call again.

So try to differentiate these cases, maybe only keep the loop outside
cmpxchg32 (I haven't put much though into it).

> +		if (ret)
> +			return ret;
> +
> +		if (val == oldval) {
> +			*oval = val;
> +			return 0;
> +		}

I can see you are adding another check here for the actual value which
solves the other_pos comparison earlier but that's only for eor and not
the __lsui_futex_cmpxchg() case.

> +
> +		oldval = val;
> +	}
> +
> +	return -EAGAIN;
> +}
> +
> +static __always_inline int
> +__lsui_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
> +{
> +	return __lsui_cmpxchg32(uaddr, oldval, newval, oval);
> +}
> +#endif	/* CONFIG_ARM64_LSUI */

-- 
Catalin

