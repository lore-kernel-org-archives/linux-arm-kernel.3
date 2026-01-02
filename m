Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4D6FC6166
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 00:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lu2XOwAewPAf2hIqWYAVG0zECJ1HMFf+2EIxiKJs26A=; b=EDcVXaXzgesaAZeALKbha7WSqH
	L3TUHk0md9KpHGGe70e6xBVemxk9XVKq1Q3avAuiO0SbWUNVOXHodnLUQtwJ54gO2r6HUXUSppZIi
	GEpf/NG0skSu1XZz4jutNPTiFZXQDuqvlWaKZnx7COuK0JZwRSN+e5Ai66wKh/i9k/oWg8t4SvN7V
	mpYV5LaL5sGjSOeGC4GoQ7JUKYpq5aLw4K8+0JDPIjXNriF0Sts92v7KNfy82ZI04tNBxSCxGIcJU
	1rAVRPj//dpK1GDhv+GQ2THtgQ3vNuxQfgL1XH0kO5Ehc6CSZlfMnaDRDKTmT2GPiT8moIP89l1ht
	ZCKGSYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbpe4-00000008osL-3WDt;
	Sat, 03 Jan 2026 00:37:29 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbpe2-00000008ory-1raO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 00:37:27 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b7277324204so1814060566b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 16:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767400644; x=1768005444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu2XOwAewPAf2hIqWYAVG0zECJ1HMFf+2EIxiKJs26A=;
        b=kSiN5LuKL1dn4Qxd2uG4/VLvyKmMke39Pyc2m8h/xOR4buO4xraaifFGVA2kdL1alV
         gPoHYpc0ws0heyUrNu8P/9r41EkDsBw4aFZB7+bg74cpXDRaVtbCLk5u2lMYKlPKDbYI
         GZC53/1prI8SvOkQiEj85kPqjwm1zp18sD3dOaoG2sPiR5Y6iWaqyQe1f/pYjSO1FUMs
         NyV+09zNK9ZT0it0Qo/5uigH6uA86V3cqUjYdk9ZsDJ00NzwtbD60cqdLHkWJWGwNE70
         br2FhygcASc5FQwtWg1XQIJ6snYXzrKfv2drtausZZQ1KuiKoRkKz5NR6uauOu11u90F
         LeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767400644; x=1768005444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lu2XOwAewPAf2hIqWYAVG0zECJ1HMFf+2EIxiKJs26A=;
        b=v1WiiHqeHbdHI1WWosL49t3DFDrNPCi5stFxkjCm0czLo3fNKpsQK0hq402uQkTgMb
         4ChKRI2JMZp8JRCXsnX7GjykXMoVoj1g02VXyHs+OJ9PMKw/2OON2EqMCGE6mMI1x6aH
         IyOY4/nSq/Q27QN8MXAMsXc6C0FI8t182JtQGst2b03MzBue0z0RCJdb435Vjwp5x6tB
         p8HzXBLoZUB40GvT6vqY49vFF7qInzDRhgA5d+VtYevoZf45N+MKOuYhRdOcfP3c6NGd
         52FdIYDgLfx95hP4jS3qAGzrrYqzEPPAjELYtj+ix3Qzywu9tDIOAyfW/U+qLDdpgXze
         RbFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyMkCNd8JuhBsBscLd29QRXJlGN+QyAQ1K5Qy7QN4FQBS7PbWhOeRn+98AFRbQCybivZ/zK1ONxya2f/Mzlu45@lists.infradead.org
X-Gm-Message-State: AOJu0YwvPU+mZjlAbpMVp/X4ch4I0KL7RR1slVFw7tEMi04Bt3maAEOp
	iFjxqvaWN8jJ5w4Romel0ajECxbj39762OSXaQysv9Asdk4FnE93OCBZFAURow==
X-Gm-Gg: AY/fxX7ibL08o0DQh4QTJkncgQB+oezNgN5t68yllbgGxqQ/825sHaSwriwEhI9HDQe
	cW3r80Y+s/HRsjJLDKt7WBqstZ9P8+xUR+R+bkJRO25RbYJ58IS/tGDPQkEb7ugSIk8XtkzKDcD
	7Y4O+50Y3nB0CBr5G3SllpgQNL4W4qgCOrvt51re+zEQB3oycSVb420jxtpCg8PCIG8fuELN8R9
	ppEPApsVWYLVHukVAX+IbLaAnRzDU+oxzFLVfHlGehCvgUgruCOMHg2c/cofrMt/1A8V+O8A3iN
	f8KyiT4K9+ro2QWCqgDOwcMTRefYSKN6r08e9xgFSPyET8qH2O2zHIE8A64oWq/JXmIu3gwWWfR
	NRegpMHQerbuzhaUqV+L7zNVBt5VBEgSKzEJeValqWRnHI8MSGNjAeti3/DZ/ARzcuX+ydApFl5
	MGSPlJcyO7Yq8kG2onBN9E7jkA7FEeQPxuXLJUyZmQhGvx2aP7+JCt
X-Google-Smtp-Source: AGHT+IFdvdEcrAIYSA22XzNr2wKPflwtXqsVf2mK8AXHiedc5sR4d+y6uOcJKoLds0TT7gNd5aiiog==
X-Received: by 2002:a05:600c:458e:b0:47a:9560:ec28 with SMTP id 5b1f17b1804b1-47d19566d27mr540529425e9.13.1767393875116;
        Fri, 02 Jan 2026 14:44:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452c69sm6169675e9.9.2026.01.02.14.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 14:44:34 -0800 (PST)
Date: Fri, 2 Jan 2026 22:44:32 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy
 Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] randomize_kstack: Maintain kstack_offset per
 task
Message-ID: <20260102224432.172b1247@pumpkin>
In-Reply-To: <20260102131156.3265118-2-ryan.roberts@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-2-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_163726_521313_AACBBE5F 
X-CRM114-Status: GOOD (  38.70  )
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

On Fri,  2 Jan 2026 13:11:52 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> kstack_offset was previously maintained per-cpu, but this caused a
> couple of issues. So let's instead make it per-task.
> 
> Issue 1: add_random_kstack_offset() and choose_random_kstack_offset()
> expected and required to be called with interrupts and preemption
> disabled so that it could manipulate per-cpu state. But arm64, loongarch
> and risc-v are calling them with interrupts and preemption enabled. I
> don't _think_ this causes any functional issues, but it's certainly
> unexpected and could lead to manipulating the wrong cpu's state, which
> could cause a minor performance degradation due to bouncing the cache
> lines. By maintaining the state per-task those functions can safely be
> called in preemptible context.
> 
> Issue 2: add_random_kstack_offset() is called before executing the
> syscall and expands the stack using a previously chosen rnadom offset.
                                                           <>
	David

> choose_random_kstack_offset() is called after executing the syscall and
> chooses and stores a new random offset for the next syscall. With
> per-cpu storage for this offset, an attacker could force cpu migration
> during the execution of the syscall and prevent the offset from being
> updated for the original cpu such that it is predictable for the next
> syscall on that cpu. By maintaining the state per-task, this problem
> goes away because the per-task random offset is updated after the
> syscall regardless of which cpu it is executing on.
> 
> Fixes: 39218ff4c625 ("stack: Optionally randomize kernel stack offset each syscall")
> Closes: https://lore.kernel.org/all/dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  include/linux/randomize_kstack.h | 26 +++++++++++++++-----------
>  include/linux/sched.h            |  4 ++++
>  init/main.c                      |  1 -
>  kernel/fork.c                    |  2 ++
>  4 files changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/randomize_kstack.h b/include/linux/randomize_kstack.h
> index 1d982dbdd0d0..5d3916ca747c 100644
> --- a/include/linux/randomize_kstack.h
> +++ b/include/linux/randomize_kstack.h
> @@ -9,7 +9,6 @@
>  
>  DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
>  			 randomize_kstack_offset);
> -DECLARE_PER_CPU(u32, kstack_offset);
>  
>  /*
>   * Do not use this anywhere else in the kernel. This is used here because
> @@ -50,15 +49,14 @@ DECLARE_PER_CPU(u32, kstack_offset);
>   * add_random_kstack_offset - Increase stack utilization by previously
>   *			      chosen random offset
>   *
> - * This should be used in the syscall entry path when interrupts and
> - * preempt are disabled, and after user registers have been stored to
> - * the stack. For testing the resulting entropy, please see:
> - * tools/testing/selftests/lkdtm/stack-entropy.sh
> + * This should be used in the syscall entry path after user registers have been
> + * stored to the stack. Preemption may be enabled. For testing the resulting
> + * entropy, please see: tools/testing/selftests/lkdtm/stack-entropy.sh
>   */
>  #define add_random_kstack_offset() do {					\
>  	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,	\
>  				&randomize_kstack_offset)) {		\
> -		u32 offset = raw_cpu_read(kstack_offset);		\
> +		u32 offset = current->kstack_offset;			\
>  		u8 *ptr = __kstack_alloca(KSTACK_OFFSET_MAX(offset));	\
>  		/* Keep allocation even after "ptr" loses scope. */	\
>  		asm volatile("" :: "r"(ptr) : "memory");		\
> @@ -69,9 +67,9 @@ DECLARE_PER_CPU(u32, kstack_offset);
>   * choose_random_kstack_offset - Choose the random offset for the next
>   *				 add_random_kstack_offset()
>   *
> - * This should only be used during syscall exit when interrupts and
> - * preempt are disabled. This position in the syscall flow is done to
> - * frustrate attacks from userspace attempting to learn the next offset:
> + * This should only be used during syscall exit. Preemption may be enabled. This
> + * position in the syscall flow is done to frustrate attacks from userspace
> + * attempting to learn the next offset:
>   * - Maximize the timing uncertainty visible from userspace: if the
>   *   offset is chosen at syscall entry, userspace has much more control
>   *   over the timing between choosing offsets. "How long will we be in
> @@ -85,14 +83,20 @@ DECLARE_PER_CPU(u32, kstack_offset);
>  #define choose_random_kstack_offset(rand) do {				\
>  	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,	\
>  				&randomize_kstack_offset)) {		\
> -		u32 offset = raw_cpu_read(kstack_offset);		\
> +		u32 offset = current->kstack_offset;			\
>  		offset = ror32(offset, 5) ^ (rand);			\
> -		raw_cpu_write(kstack_offset, offset);			\
> +		current->kstack_offset = offset;			\
>  	}								\
>  } while (0)
> +
> +static inline void random_kstack_task_init(struct task_struct *tsk)
> +{
> +	tsk->kstack_offset = 0;
> +}
>  #else /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
>  #define add_random_kstack_offset()		do { } while (0)
>  #define choose_random_kstack_offset(rand)	do { } while (0)
> +#define random_kstack_task_init(tsk)		do { } while (0)
>  #endif /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
>  
>  #endif
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index d395f2810fac..9e0080ed1484 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1591,6 +1591,10 @@ struct task_struct {
>  	unsigned long			prev_lowest_stack;
>  #endif
>  
> +#ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
> +	u32				kstack_offset;
> +#endif
> +
>  #ifdef CONFIG_X86_MCE
>  	void __user			*mce_vaddr;
>  	__u64				mce_kflags;
> diff --git a/init/main.c b/init/main.c
> index b84818ad9685..27fcbbde933e 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -830,7 +830,6 @@ static inline void initcall_debug_enable(void)
>  #ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
>  DEFINE_STATIC_KEY_MAYBE_RO(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
>  			   randomize_kstack_offset);
> -DEFINE_PER_CPU(u32, kstack_offset);
>  
>  static int __init early_randomize_kstack_offset(char *buf)
>  {
> diff --git a/kernel/fork.c b/kernel/fork.c
> index b1f3915d5f8e..b061e1edbc43 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -95,6 +95,7 @@
>  #include <linux/thread_info.h>
>  #include <linux/kstack_erase.h>
>  #include <linux/kasan.h>
> +#include <linux/randomize_kstack.h>
>  #include <linux/scs.h>
>  #include <linux/io_uring.h>
>  #include <linux/bpf.h>
> @@ -2231,6 +2232,7 @@ __latent_entropy struct task_struct *copy_process(
>  	if (retval)
>  		goto bad_fork_cleanup_io;
>  
> +	random_kstack_task_init(p);
>  	stackleak_task_init(p);
>  
>  	if (pid != &init_struct_pid) {


