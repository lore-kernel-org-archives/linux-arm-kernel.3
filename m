Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A5AFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 18:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Flqcq7A9fTt060tbHzaYrFQsDTDr91NkoAP1DYQOt28=; b=nY05Nv+0ZQ0+Uk1NPDUt3Y89vg
	2Uj0JWv18i0cseSpHaQPeop9x6JXqwmkYxquR8lnom3/blWPrnVAQfm8bSjpjUPTW/0qInwRQP106
	glz466iUILvWYBuBpIN1+dyWTzS+ery1eWQqyXYLNF1axezA7lzZOkuL2vKisyajmcVPtYZQoM8YI
	50xT4xTW3mivX8MLc0f4D7d2LGTCA/t8VDQpfHGVXtPIm86969tvCzXZzBoiQVtEYSzIHBsDK3hE+
	I668TxRbPUwBRbSI1QuHsFA/fixTjUXQc9mu9bVc2vxp5IUExrqaFWDHwvSQ+XKw4bJMuXyY3urKS
	Tgt1A1TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH3tg-0000000Fkak-1Bvm;
	Sun, 26 Apr 2026 18:08:00 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH3td-0000000FkaE-01LC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 18:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1777226871;
	bh=zc5aB7NvKWadhiFZbK5wv5oaFDwCfrp1MnjPGqyFYVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YcTJAX4DGL57HRJLhNgUfb3LeKKyyQRppts6WZnVt1V5nhKTm4r55YbNo7GMOUg+/
	 Inp6fVnTwhsyKzp1mJkqRVizOVcLrrVOmJ4zTug9QWPMrCp8t5AI/RTVZJQPc6ka12
	 Bd79Q8E6pcx9xr1OVRLTK3APW0zdqHJuD/oLbJNE=
Date: Sun, 26 Apr 2026 20:07:49 +0200
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
Subject: Re: [PATCH RFC v2 1/2] arm64: vdso: Prepare for robust futex unlock
 support
Message-ID: <f8e83a24-0b04-4c88-9f67-0879875be25c@t-8ch.de>
References: <20260424-tonyk-robust_arm-v2-0-db4e46f752cf@igalia.com>
 <20260424-tonyk-robust_arm-v2-1-db4e46f752cf@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260424-tonyk-robust_arm-v2-1-db4e46f752cf@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_110757_238660_7FF16ECA 
X-CRM114-Status: GOOD (  23.44  )
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

Hi André,

Some more comments, after doing an actual proper review.

On 2026-04-24 15:56:00-0300, André Almeida wrote:
> There will be a VDSO function to unlock non-contended robust futexes in
> user space. The unlock sequence is racy vs. clearing the list_pending_op
> pointer in the task's robust list head. To plug this race the kernel needs
> to know the critical section window so it can clear the pointer when the
> task is interrupted within that race window. The window is determined by
> labels in the inline assembly.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> Changes from v1:
>  - Fixed linker not finding VDSO symbols
> ---
>  arch/arm64/kernel/vdso.c          | 30 ++++++++++++++++++++++++++++++
>  arch/arm64/kernel/vdso/vdso.lds.S |  7 +++++++
>  2 files changed, 37 insertions(+)

What is the reason for splitting the series into two patches?
To me it looks like it should be one patch.

> diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
> index 592dd8668de4..f9c520a1c942 100644
> --- a/arch/arm64/kernel/vdso.c
> +++ b/arch/arm64/kernel/vdso.c
> @@ -11,6 +11,7 @@
>  #include <linux/clocksource.h>
>  #include <linux/elf.h>
>  #include <linux/err.h>
> +#include <linux/futex.h>
>  #include <linux/errno.h>
>  #include <linux/gfp.h>
>  #include <linux/kernel.h>
> @@ -57,6 +58,33 @@ static struct vdso_abi_info vdso_info[] __ro_after_init = {
>  #endif /* CONFIG_COMPAT_VDSO */
>  };
>  
> +#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
> +static void vdso_futex_robust_unlock_update_ips(enum vdso_abi abi, struct mm_struct *mm)
> +{
> +	unsigned long vdso = (unsigned long) mm->context.vdso;
> +	struct futex_mm_data *fd = &mm->futex;
> +	uintptr_t success, end;
> +
> +	if (abi == VDSO_ABI_AA64) {
> +		success = (uintptr_t) VDSO_SYMBOL(vdso, futex_list64_try_unlock_cs_success);
> +		end = (uintptr_t) VDSO_SYMBOL(vdso, futex_list64_try_unlock_cs_end);
> +
> +		futex_set_vdso_cs_range(fd, 0, vdso, success, end, false);

Both VDSO_SYMBOL() and futex_set_vdso_cs_range() add the vdso base
address to the symbol offsets. The value stored in .start_ip will be
wrong. The fact that futex_set_vdso_cs_range() does the addition looks
like an artifact of it being written for x86 first. IMO its interface
should be changed not to do the addition internally.

> +	}
> +
> +#ifdef CONFIG_COMPAT_VDSO
> +	if (abi == VDSO_ABI_AA32) {
> +		success = (uintptr_t) VDSO_SYMBOL(vdso, futex_list32_try_unlock_cs_success);
> +		end = (uintptr_t) VDSO_SYMBOL(vdso, futex_list32_try_unlock_cs_end);
> +
> +		futex_set_vdso_cs_range(fd, 1, vdso, success, end, true);
> +	}
> +#endif
> +}
> +#else
> +static inline void vdso_futex_robust_unlock_update_ips(enum vdso_abi abi, struct mm_struct *mm) { }
> +#endif /* CONFIG_FUTEX_ROBUST_UNLOCK */
> +
>  static int vdso_mremap(const struct vm_special_mapping *sm,
>  		struct vm_area_struct *new_vma)
>  {

(...)

