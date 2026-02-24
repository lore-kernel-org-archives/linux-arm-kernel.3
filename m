Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD01EF4BB8A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 20:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4f5u9W6/egZsudHACmX/fsmD2uQUFvwVhhhWtrNCx4=; b=p79sezvhvKGopIoFaznzojycHH
	0+PP/uWhPgDkpeOmpBWGK12XY6UiKXvS5UtO0mbTl4dccD3k6lYxMN7T6AZGHa0eI4w5RDT41TtZQ
	RzDUHfSIck53YljlRPEv1x8pJeGgX6/LCIRqwq6JHBT0rqLvbe6CvXrylmMw9mkdIu1/lQK51Udoz
	uKFex8OuFOcNx8fSzBmfeCJN9F8J4ezOGAvsUQUg1FfrCSGvQeElpQMKMMvikmzh4Wl66hc6A3fpO
	k7I/SwHA0n6shVxlyXSbrdvA5fuFPfRDyTBSoxOe3GzBrHn5cxkf1vLpdLKJkaOmX2hZv2t8cG01W
	QnDKzzyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuzQD-00000002mMH-1vGv;
	Tue, 24 Feb 2026 20:54:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuzQC-00000002mMB-3Wg3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 20:54:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA6EF60053;
	Tue, 24 Feb 2026 20:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279EDC116D0;
	Tue, 24 Feb 2026 20:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771966458;
	bh=EgVAY0e5tBoSz6A6iwW5/XO8EvjgmD/hBAtfckjnAIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fU9VoxpYqnAVrd4t/fIENYWIsMId2KNEP3dfw2h4SjQzeH/MBV/5Cee/wntRTQCP6
	 8EADR9JKKOK/hSexd/fEomD/ZrU3e+Mo0cAkKAlisOPYRwuKJXzT3MA26tdQTXMvpb
	 cFKvEXyKAe/X10m3pmNX2H1z0cczPw3iZWdEsiJJoujd4S5bnLIF7pTBSYnWQRgIVb
	 lO1qmLmIs5NJLzUq5pV5qVfuG1vDdgGb4JylPzxBqN/lvS2sL0Y7jYkwDaBcxLLsMY
	 M8xREJGMjxcu5uVJY3DLJp8/BXSitkrqLBWUKwurl88mBMEyWsx/eqM0TQ42RGOP4K
	 O37lVNZp675Mw==
Date: Tue, 24 Feb 2026 12:54:16 -0800
From: Oliver Upton <oupton@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, catalin.marinas@arm.com,
	will@kernel.org, maz@kernel.org, miko.lenczewski@arm.com,
	kevin.brodsky@arm.com, broonie@kernel.org, ardb@kernel.org,
	suzuki.poulose@arm.com, lpieralisi@kernel.org,
	yangyicong@hisilicon.com, joey.gouly@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v13 7/8] KVM: arm64: use CASLT instruction for swapping
 guest descriptor
Message-ID: <aZ4P-AcVjxfCFsew@kernel.org>
References: <20260223174802.458411-1-yeoreum.yun@arm.com>
 <20260223174802.458411-8-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223174802.458411-8-yeoreum.yun@arm.com>
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

On Mon, Feb 23, 2026 at 05:48:01PM +0000, Yeoreum Yun wrote:
> Use the CASLT instruction to swap the guest descriptor when FEAT_LSUI
> is enabled, avoiding the need to clear the PAN bit.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/include/asm/futex.h | 17 +----------------
>  arch/arm64/include/asm/lsui.h  | 27 +++++++++++++++++++++++++++
>  arch/arm64/kvm/at.c            | 32 +++++++++++++++++++++++++++++++-
>  3 files changed, 59 insertions(+), 17 deletions(-)
>  create mode 100644 arch/arm64/include/asm/lsui.h
> 
> diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
> index b579e9d0964d..6779c4ad927f 100644
> --- a/arch/arm64/include/asm/futex.h
> +++ b/arch/arm64/include/asm/futex.h
> @@ -7,11 +7,9 @@
>  
>  #include <linux/futex.h>
>  #include <linux/uaccess.h>
> -#include <linux/stringify.h>
>  
> -#include <asm/alternative.h>
> -#include <asm/alternative-macros.h>
>  #include <asm/errno.h>
> +#include <asm/lsui.h>
>  
>  #define FUTEX_MAX_LOOPS	128 /* What's the largest number you can think of? */
>  
> @@ -91,8 +89,6 @@ __llsc_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
>  
>  #ifdef CONFIG_ARM64_LSUI
>  
> -#define __LSUI_PREAMBLE	".arch_extension lsui\n"
> -
>  #define LSUI_FUTEX_ATOMIC_OP(op, asm_op)				\
>  static __always_inline int						\
>  __lsui_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
> @@ -235,17 +231,6 @@ __lsui_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
>  {
>  	return __lsui_cmpxchg32(uaddr, oldval, newval, oval);
>  }
> -
> -#define __lsui_llsc_body(op, ...)					\
> -({									\
> -	alternative_has_cap_unlikely(ARM64_HAS_LSUI) ?			\
> -		__lsui_##op(__VA_ARGS__) : __llsc_##op(__VA_ARGS__);	\
> -})
> -
> -#else	/* CONFIG_ARM64_LSUI */
> -
> -#define __lsui_llsc_body(op, ...)	__llsc_##op(__VA_ARGS__)
> -
>  #endif	/* CONFIG_ARM64_LSUI */
>  
>  
> diff --git a/arch/arm64/include/asm/lsui.h b/arch/arm64/include/asm/lsui.h
> new file mode 100644
> index 000000000000..4f956188835e
> --- /dev/null
> +++ b/arch/arm64/include/asm/lsui.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_LSUI_H
> +#define __ASM_LSUI_H
> +
> +#include <linux/compiler_types.h>
> +#include <linux/stringify.h>
> +#include <asm/alternative.h>
> +#include <asm/alternative-macros.h>
> +#include <asm/cpucaps.h>
> +
> +#ifdef CONFIG_ARM64_LSUI
> +
> +#define __LSUI_PREAMBLE	".arch_extension lsui\n"
> +
> +#define __lsui_llsc_body(op, ...)					\
> +({									\
> +	alternative_has_cap_unlikely(ARM64_HAS_LSUI) ?			\
> +		__lsui_##op(__VA_ARGS__) : __llsc_##op(__VA_ARGS__);	\
> +})
> +
> +#else	/* CONFIG_ARM64_LSUI */
> +
> +#define __lsui_llsc_body(op, ...)	__llsc_##op(__VA_ARGS__)
> +
> +#endif	/* CONFIG_ARM64_LSUI */
> +
> +#endif	/* __ASM_LSUI_H */
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index 885bd5bb2f41..1aceeef04567 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -9,6 +9,7 @@
>  #include <asm/esr.h>
>  #include <asm/kvm_hyp.h>
>  #include <asm/kvm_mmu.h>
> +#include <asm/lsui.h>
>  
>  static void fail_s1_walk(struct s1_walk_result *wr, u8 fst, bool s1ptw)
>  {
> @@ -1704,6 +1705,33 @@ int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa, int *level)
>  	}
>  }
>  
> +#ifdef CONFIG_ARM64_LSUI
> +static int __lsui_swap_desc(u64 __user *ptep, u64 old, u64 new)
> +{
> +	u64 tmp = old;
> +	int ret = 0;
> +
> +	uaccess_ttbr0_enable();
> +
> +	asm volatile(__LSUI_PREAMBLE
> +		     "1: caslt	%[old], %[new], %[addr]\n"
> +		     "2:\n"
> +		     _ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w[ret])
> +		     : [old] "+r" (old), [addr] "+Q" (*ptep), [ret] "+r" (ret)
> +		     : [new] "r" (new)
> +		     : "memory");
> +
> +	uaccess_ttbr0_disable();
> +
> +	if (ret)
> +		return ret;
> +	if (tmp != old)
> +		return -EAGAIN;
> +
> +	return ret;
> +}
> +#endif
> +
>  static int __lse_swap_desc(u64 __user *ptep, u64 old, u64 new)
>  {
>  	u64 tmp = old;
> @@ -1779,7 +1807,9 @@ int __kvm_at_swap_desc(struct kvm *kvm, gpa_t ipa, u64 old, u64 new)
>  		return -EPERM;
>  
>  	ptep = (u64 __user *)hva + offset;
> -	if (cpus_have_final_cap(ARM64_HAS_LSE_ATOMICS))
> +	if (IS_ENABLED(CONFIG_ARM64_LSUI) && cpus_have_final_cap(ARM64_HAS_LSUI))

cpucap_is_possible() is where the Kconfig check should go.

Thanks,
Oliver

