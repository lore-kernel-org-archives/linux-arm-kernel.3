Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67847CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 17:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDt+JrdlohBvxagHZgSQAHfei5akcBOzM2s5BZ92PCA=; b=ZDZ0thhUkFcPlMFKfPsVty0Jrk
	Ne0MXoM+7Qcs9+YSsR+cnqh7mzjYjFP9QZEarC/wALbOrd4oczniZyIY/8h+HeukN+UqX/fj4mdSR
	ebhUflTtUe/P5QkZw8kk1x2Z+GbP23h0rXWaHVXSgO93Y62V/Hnr7nCXp1frRmTciiTIMsGh7BVYa
	9ra7RzVVw/f/k2w1VhV89eihxUnAgx9mzb5QZMlvq3nD46hx9TAxRy1ug0If/zU7l12zXzmgds/xQ
	92x2zUz/XWlcPpESf0WprsmHy5sMhql/2Ba95h87cBwoLOx2HeIELFzQLJH4DX9QwXUMJ588xGtZk
	Bzu6aZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0r5-00000007yyR-1mIO;
	Fri, 29 May 2026 17:18:43 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0r3-00000007yxa-3R6v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 17:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780075118;
	bh=Pf8j5LUxZPMlyxOo7oP/tpqDVWFR6J4EvzR+xRCYqoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gW8lfxt/giEOQXCMNUf+WOd+H9C1l8SsT+dZTwTtaewDlYGKtTpJGfp8XdG02bk7Z
	 TKYQUw6EQr4kBUm1fjaLxfGvHCnC0M2XeX4sWSLXlorXtceY8ltQFUulxu3+hcY9s9
	 acQge5u9uy98h9VOVvYr6mD4HGaTqszeGi7nbLaU=
Date: Fri, 29 May 2026 19:18:37 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Carlos O'Donell <carlos@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Florian Weimer <fweimer@redhat.com>, 
	Rich Felker <dalias@aerifal.cx>, Torvald Riegel <triegel@redhat.com>, 
	Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Uros Bizjak <ubizjak@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	kernel-dev@igalia.com
Subject: Re: [PATCH v3 2/5] arm64: vdso: Implement
 __vdso_futex_robust_try_unlock()
Message-ID: <7f1e1aae-41d5-4583-b47e-9dcc7ad82ea1@t-8ch.de>
References: <20260529-tonyk-robust_arm-v3-0-a6f02684d4fe@igalia.com>
 <20260529-tonyk-robust_arm-v3-2-a6f02684d4fe@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529-tonyk-robust_arm-v3-2-a6f02684d4fe@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_101842_003337_CBF9F922 
X-CRM114-Status: GOOD (  22.20  )
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

On 2026-05-29 13:33:54-0300, André Almeida wrote:
> Based on the x86 implementation, implement the vDSO function for unlocking
> a robust futex correctly.
> 
> Commit xxxxxxxxxxxx ("x86/vdso: Implement __vdso_futex_robust_try_unlock()") has
> the full explanation about why this mechanism is needed.
> 
> The unlock assembly sequence for arm64 is:
> 
> 	__vdso_futex_robust_list64_try_unlock:
> 	retry:
> 		ldxr	w8, [x0] // Load the value from *futex
> 		cmp	w1, w8   // Compare with TID
> 		b.ne	__vdso_futex_list64_try_unlock_cs_end
> 		stlxr	w9, wzr, [x0] // Try to zero *futex
> 		cbnz	w9, retry
> 	__vdso_futex_list64_try_unlock_cs_start:
> 		str	xzr, [x2] // After zeroing *futex, zero *op_pending
> 	__vdso_futex_list64_try_unlock_cs_end>:
> 
> The decision regarding if the pointer should be cleared or not lies on checking
> the condition flag zero:
> 
> 	return (regs->user_regs.pstate & PSR_Z_BIT) ?
> 		(void __user *) regs->user_regs.regs[2] : NULL;
> 
> If it's not zero, that means that the comparassion worked and the kernel should
> clear op_pending (if userspace didn't managed to) stored at x2.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> Notes:
>  - Only LL/SC for now but I can add LSE later if this looks good
> 
> v3:
>  - Managed to get pop to always be stored at x2
> ---
>  arch/arm64/Kconfig                    |  1 +
>  arch/arm64/include/asm/futex_robust.h | 20 ++++++++++++++++++++
>  arch/arm64/kernel/vdso/Makefile       |  9 ++++++++-
>  arch/arm64/kernel/vdso/vfutex.c       | 34 ++++++++++++++++++++++++++++++++++
>  include/vdso/futex.h                  |  1 +
>  5 files changed, 64 insertions(+), 1 deletion(-)

(...)

> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> index 7dec05dd33b7..3c7f220fe783 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -9,7 +9,8 @@
>  # Include the generic Makefile to check the built vdso.
>  include $(srctree)/lib/vdso/Makefile.include
>  
> -obj-vdso := vgettimeofday.o note.o sigreturn.o vgetrandom.o vgetrandom-chacha.o
> +obj-vdso := vgettimeofday.o note.o sigreturn.o vgetrandom.o vgetrandom-chacha.o \
> +	    vfutex.o

Should depend on CONFIG_FUTEX_ROBUST_UNLOCK ?

>  
>  # Build rules
>  targets := $(obj-vdso) vdso.so vdso.so.dbg
> @@ -45,9 +46,11 @@ CC_FLAGS_ADD_VDSO := -O2 -mcmodel=tiny -fasynchronous-unwind-tables
>  
>  CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_vgetrandom.o = $(CC_FLAGS_REMOVE_VDSO)
> +CFLAGS_REMOVE_vfutex.o = $(CC_FLAGS_REMOVE_VDSO)
>  
>  CFLAGS_vgettimeofday.o = $(CC_FLAGS_ADD_VDSO)
>  CFLAGS_vgetrandom.o = $(CC_FLAGS_ADD_VDSO)
> +CFLAGS_vfutex.o = $(CC_FLAGS_ADD_VDSO)
>  
>  ifneq ($(c-gettimeofday-y),)
>    CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
> @@ -57,6 +60,10 @@ ifneq ($(c-getrandom-y),)
>    CFLAGS_vgetrandom.o += -include $(c-getrandom-y)
>  endif
>  
> +ifneq ($(c-futex-y),)
> +  CFLAGS_vfutex.o += -include $(c-futex-y)
> +endif
> +
>  targets += vdso.lds
>  CPPFLAGS_vdso.lds += -P -C -U$(ARCH)

(...)

> diff --git a/include/vdso/futex.h b/include/vdso/futex.h
> index 3cd175eefe64..80934561a10d 100644
> --- a/include/vdso/futex.h
> +++ b/include/vdso/futex.h
> @@ -4,6 +4,7 @@
>  
>  #include <uapi/linux/types.h>
>  
> +

Spurious change.

>  /**
>   * __vdso_futex_robust_list64_try_unlock - Try to unlock an uncontended robust futex
>   *					   with a 64-bit pending op pointer
> 
> -- 
> 2.54.0
> 

