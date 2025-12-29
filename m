Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232F3E92FC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 18:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcXWyaF+NJeFlqFqgUEhw0SIGLhjPi7QaZzLkvUWKwk=; b=2z6lFDNScEXQFWxGekSNTcetoV
	WQWgmZ6VIh4CfCdNo/CC+Q4n+lKcrmCUXRd1xs8P4Fo9oNK5hFLWiGoo3sI83GvdQPxV0UcJEGONZ
	LRRxFAq7VdO0OePrRP3WaDcbLbdKQFlM8jb89ZKceOio/c/4lrxq9znHyaaSGYRfFDLYYClVVEIAz
	wYvuUDZ1Y7idzx48t5PiIwNXFlgr1hCwB6vscSs1kehSnOEqLWSjtehEq/tfmWMP1G+kbF1Z34vwK
	/2/lZGLWYPjyF5/rPlcMhLJ3KPtJMn80MPtMrQ0ZPO05nhf6Zw1JDolBxL/kzISaHnNNliSjZccok
	fCF5Iplw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaHax-00000003w1r-12Kv;
	Mon, 29 Dec 2025 18:03:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaHav-00000003w1J-06kV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 18:03:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2877339;
	Mon, 29 Dec 2025 10:03:37 -0800 (PST)
Received: from [10.57.45.222] (unknown [10.57.45.222])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3994E3F694;
	Mon, 29 Dec 2025 10:03:39 -0800 (PST)
Message-ID: <f3c32e7f-f940-4cb0-941c-cb7f7f628d88@arm.com>
Date: Mon, 29 Dec 2025 19:03:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 11/16] entry: Split syscall_exit_to_user_mode_work()
 for arch reuse
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 macro@orcam.me.uk, charlie@rivosinc.com, akpm@linux-foundation.org,
 ldv@strace.io, anshuman.khandual@arm.com, mark.rutland@arm.com,
 thuth@redhat.com, song@kernel.org, ryan.roberts@arm.com,
 ada.coupriediaz@arm.com, broonie@kernel.org, liqiang01@kylinos.cn,
 pengcan@kylinos.cn, kmal@cock.li, dvyukov@google.com,
 richard.weiyang@gmail.com, reddybalavignesh9979@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-12-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251222114737.1334364-12-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_100349_152516_D9F4937A 
X-CRM114-Status: GOOD (  21.26  )
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

On 22/12/2025 12:47, Jinjie Ruan wrote:
> In the generic entry code, the beginning of
> syscall_exit_to_user_mode_work() can be reused on arm64 so it makes
> sense to split it.
>
> In preparation for moving arm64 over to the generic entry
> code, split out syscall_exit_to_user_mode_work_prepare() helper from
> syscall_exit_to_user_mode_work().
>
> No functional changes.
>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  include/linux/entry-common.h | 35 ++++++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 13 deletions(-)
>
> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index 87efb38b7081..0de0e60630e1 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -121,20 +121,11 @@ static __always_inline long syscall_enter_from_user_mode(struct pt_regs *regs, l
>   */
>  void syscall_exit_work(struct pt_regs *regs, unsigned long work);
>  
> -/**
> - * syscall_exit_to_user_mode_work - Handle work before returning to user mode
> - * @regs:	Pointer to currents pt_regs
> - *
> - * Same as step 1 and 2 of syscall_exit_to_user_mode() but without calling
> - * exit_to_user_mode() to perform the final transition to user mode.
> - *
> - * Calling convention is the same as for syscall_exit_to_user_mode() and it
> - * returns with all work handled and interrupts disabled. The caller must
> - * invoke exit_to_user_mode() before actually switching to user mode to
> - * make the final state transitions. Interrupts must stay disabled between
> - * return from this function and the invocation of exit_to_user_mode().
> +/*
> + * Syscall specific exit to user mode preparation. Runs with interrupts
> + * enabled.
>   */
> -static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
> +static __always_inline void syscall_exit_to_user_mode_work_prepare(struct pt_regs *regs)
>  {
>  	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
>  	unsigned long nr = syscall_get_nr(current, regs);
> @@ -155,6 +146,24 @@ static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
>  	 */
>  	if (unlikely(work & SYSCALL_WORK_EXIT))
>  		syscall_exit_work(regs, work);
> +}
> +
> +/**
> + * syscall_exit_to_user_mode_work - Handle work before returning to user mode
> + * @regs:	Pointer to currents pt_regs
> + *
> + * Same as step 1 and 2 of syscall_exit_to_user_mode() but without calling
> + * exit_to_user_mode() to perform the final transition to user mode.
> + *
> + * Calling convention is the same as for syscall_exit_to_user_mode() and it
> + * returns with all work handled and interrupts disabled. The caller must
> + * invoke exit_to_user_mode() before actually switching to user mode to
> + * make the final state transitions. Interrupts must stay disabled between
> + * return from this function and the invocation of exit_to_user_mode().
> + */
> +static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
> +{
> +	syscall_exit_to_user_mode_work_prepare(regs);

The naming is getting awfully confusing, with the separate introduction
of syscall_exit_to_user_mode_prepare().

Having had a closer look, do we really need
syscall_exit_to_user_mode_work() as it currently stands? Nothing calls
it except the generic syscall_exit_to_user_mode(). Which makes me think:
how about moving the two lines below into syscall_exit_to_user_mode()
instead of creating a new helper? IOW:

@@ -155,8 +155,6 @@ static __always_inline void
syscall_exit_to_user_mode_work(struct pt_regs *regs)
      */
     if (unlikely(work & SYSCALL_WORK_EXIT))
         syscall_exit_work(regs, work);
-    local_irq_disable_exit_to_user();
-    syscall_exit_to_user_mode_prepare(regs);
 }
 
 /**
@@ -192,6 +190,8 @@ static __always_inline void
syscall_exit_to_user_mode(struct pt_regs *regs)
 {
     instrumentation_begin();
     syscall_exit_to_user_mode_work(regs);
+    local_irq_disable_exit_to_user();
+    syscall_exit_to_user_mode_prepare(regs);
     instrumentation_end();
     exit_to_user_mode();
 }

- Kevin

>  	local_irq_disable_exit_to_user();
>  	syscall_exit_to_user_mode_prepare(regs);
>  }

