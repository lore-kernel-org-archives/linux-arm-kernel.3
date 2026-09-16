Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE985C982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1eMAGDwLFJwfjXNy8EMjLxUE+XbLaSzdsN8U7xolnhk=; b=3eswCLdvrXZoro+YB4RZ1Ra/ek
	Ksq3QoRqajx5DfmLjIEGeKWkvT/a6XrA2pMSgPqFpVC/zQ4cTv8VAZcUUTOQ/RhhkdS3rqcpt/wXH
	+0QBBb/U93K0S5QI8fqRoQ3GB5q86HkhkpOxJcExy/jzk0HUmbkaFXkR0yeBZurgrw4zafdP0H2xI
	/ysGjmWR75wJcWyUbAtjVEhZjDEv+WdoeSmnmivr30VsPOV04hZwJ8uD0Nt57ftVL8kwHa+TEerPS
	AfliX8XD/nB2yjR4mRAe1HRf5m9DVK1gmyazuIU6V3G8eaPNdAgYktZ1XQVHiPVsipX77ohc7l+0t
	l8ZVjInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qcb-00000009PSS-3c9k;
	Wed, 16 Sep 2026 14:28:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qcX-00000009PRZ-3mLm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 14:28:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5439176A;
	Wed, 16 Sep 2026 07:28:17 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C1383F7B4;
	Wed, 16 Sep 2026 07:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789568901; bh=spNPD9k6Nx8PbLEKYN8+WDsvPmPgkuszTarX6izkHIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=syNLQ6zBnM1gt+74Ot0yxpVXugmjywzlyYa0Y4SMoh089PhsftIdlhEyUiuHdpw/p
	 8j18sZ84YHcwZ4wx2N3C8ItSn/iYaDMUYNb+m1mp/PBK9o1z2BHBWV7fzKo2cptBHl
	 HEakV4AtFAP8iLh9d8zNfp8KVg3Nh1blHLuEenc8=
Date: Wed, 16 Sep 2026 15:28:16 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Florian Weimer <fweimer@redhat.com>,
	Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
	Uros Bizjak <ubizjak@gmail.com>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH v8 4/4] arm64: vdso32: Implement
 __vdso_futex_robust_try_unlock()
Message-ID: <aqqngEKC_CsrS62n@J2N7QTR9R3>
References: <20260821-tonyk-robust_arm-v8-0-077707b6f1c7@igalia.com>
 <20260821-tonyk-robust_arm-v8-4-077707b6f1c7@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260821-tonyk-robust_arm-v8-4-077707b6f1c7@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_072823_604035_DA743591 
X-CRM114-Status: GOOD (  28.10  )
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

On Fri, Aug 21, 2026 at 06:50:45PM -0300, André Almeida wrote:
> Based on aarch64 implementation, provide a 32 bit entry point for
> this vDSO.
> 
> In order to keep compatibility with arm64_futex_robust_unlock_get_pop(),
> make sure to store the pop address at r2 and the compare result value
> at r3.

Before we add this to the compat vdso, we'll need to implement this on
arch/arm/.

Otherwise, my comments on the patch for the native vdso functions apply
here too.

Mark.

> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v7:
>  - The store needs to be a release store, so s/strex/stlex/
>  - result reg clobber modified to "=&r" to make sure the compiler don't use
>  the r3 reg for something else
>  - pop_reg will be read after the execution so it should be an output
>  parameter with "+Q"
> ---
>  arch/arm64/kernel/vdso.c            | 15 ++++++++++++++-
>  arch/arm64/kernel/vdso32/Makefile   |  4 ++++
>  arch/arm64/kernel/vdso32/vdso.lds.S |  9 +++++++++
>  arch/arm64/kernel/vdso32/vfutex.c   | 34 ++++++++++++++++++++++++++++++++++
>  4 files changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
> index dc6b582736d0..5cae9c17ec72 100644
> --- a/arch/arm64/kernel/vdso.c
> +++ b/arch/arm64/kernel/vdso.c
> @@ -78,11 +78,19 @@ static inline void vdso_futex_update_ips(struct mm_struct *mm)
>  				VDSO_SYMBOL(vdso, futex_list64_try_unlock_cs_end));
>  }
>  
> +static inline void aarch32_vdso_futex_update_ips(struct mm_struct *mm)
> +{
> +	unsigned long vdso = (unsigned long) mm->context.vdso;
> +
> +	__vdso_futex_update_ips(mm, true,
> +				VDSO_SYMBOL(vdso, futex_list32_try_unlock_cs_start),
> +				VDSO_SYMBOL(vdso, futex_list32_try_unlock_cs_end));
> +}
>  #else
>  static inline void vdso_futex_update_ips(struct mm_struct *mm) {}
> +static inline void aarch32_vdso_futex_update_ips(struct mm_struct *mm) {}
>  #endif /* CONFIG_FUTEX_ROBUST_UNLOCK */
>  
> -
>  static int vdso_mremap(const struct vm_special_mapping *sm,
>  		struct vm_area_struct *new_vma)
>  {
> @@ -195,6 +203,8 @@ static int aarch32_mremap(const struct vm_special_mapping *sm,
>  {
>  	current->mm->context.vdso = (void *)new_vma->vm_start;
>  
> +	aarch32_vdso_futex_update_ips(current->mm);
> +
>  	return 0;
>  }
>  
> @@ -327,6 +337,7 @@ static int aarch32_sigreturn_setup(struct mm_struct *mm)
>  	return PTR_ERR_OR_ZERO(ret);
>  }
>  
> +
>  int aarch32_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
>  {
>  	struct mm_struct *mm = current->mm;
> @@ -347,6 +358,8 @@ int aarch32_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
>  	}
>  
>  	ret = aarch32_sigreturn_setup(mm);
> +
> +	aarch32_vdso_futex_update_ips(mm);
>  out:
>  	mmap_write_unlock(mm);
>  	return ret;
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> index 4bd60f059f4a..f3190125c68b 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -97,6 +97,10 @@ munge := ../../../arm/vdso/vdsomunge
>  hostprogs := $(munge)
>  
>  c-obj-vdso := note.o
> +ifdef CONFIG_FUTEX_ROBUST_UNLOCK
> +  c-obj-vdso += vfutex.o
> +endif
> +
>  c-obj-vdso-gettimeofday := vgettimeofday.o
>  
>  ifneq ($(c-gettimeofday-y),)
> diff --git a/arch/arm64/kernel/vdso32/vdso.lds.S b/arch/arm64/kernel/vdso32/vdso.lds.S
> index 12bfc39e8aab..52ced27d6045 100644
> --- a/arch/arm64/kernel/vdso32/vdso.lds.S
> +++ b/arch/arm64/kernel/vdso32/vdso.lds.S
> @@ -89,6 +89,15 @@ VERSION
>  #endif /* CONFIG_COMPAT_32BIT_TIME */
>  		__vdso_clock_gettime64;
>  		__vdso_clock_getres_time64;
> +#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
> +		__vdso_futex_robust_list32_try_unlock;
> +#endif
>  	local: *;
>  	};
>  }
> +
> +#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
> +VDSO_futex_list32_try_unlock_cs_success = __futex_list32_try_unlock_cs_success;
> +VDSO_futex_list32_try_unlock_cs_start = __futex_list32_try_unlock_cs_start;
> +VDSO_futex_list32_try_unlock_cs_end = __futex_list32_try_unlock_cs_end;
> +#endif
> diff --git a/arch/arm64/kernel/vdso32/vfutex.c b/arch/arm64/kernel/vdso32/vfutex.c
> new file mode 100644
> index 000000000000..0d9080b17965
> --- /dev/null
> +++ b/arch/arm64/kernel/vdso32/vfutex.c
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +#include <linux/stringify.h>
> +#include <vdso/futex.h>
> +
> +__u32 __vdso_futex_robust_list32_try_unlock(__u32 *lock, __u32 tid, __u32 *pop)
> +{
> +	register __u32 *pop_reg asm("r2") = pop, result_reg asm("r3") = 0;
> +	__u32 val, zero = 0;
> +
> +	asm volatile (
> +		".globl						  "
> +		"__futex_list32_try_unlock_cs_start,		  "
> +		"__futex_list32_try_unlock_cs_success,		  "
> +		"__futex_list32_try_unlock_cs_end		\n"
> +
> +		"retry:						\n"
> +		"	ldrex %[val], %[lock]			\n"
> +		"	cmp %[tid], %[val]			\n"
> +		"	bne __futex_list32_try_unlock_cs_end	\n"
> +		"	stlex %[result], %[zero], %[lock]	\n"
> +		"__futex_list32_try_unlock_cs_start:		\n"
> +		"	cmp %[result], #0			\n"
> +		"	bne retry				\n"
> +		"__futex_list32_try_unlock_cs_success:		\n"
> +		"	str %[zero], %[pop_reg]			\n"
> +		"__futex_list32_try_unlock_cs_end:		\n"
> +
> +		: [val] "=&r" (val), [result] "=&r" (result_reg), [pop_reg] "+Q" (*pop_reg)
> +		: [tid] "r" (tid), [lock] "Q" (*lock), [zero] "r" (zero)
> +		: "cc", "memory"
> +	);
> +
> +	return val;
> +}
> 
> -- 
> 2.55.0
> 

