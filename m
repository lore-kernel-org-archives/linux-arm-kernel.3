Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C35CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsxuMdd6RrihoMAKbV5hYDVQr05+T/j4IJi9lGCXVa8=; b=W0jaBnHOYiRBIx92fAc7zwKCPR
	iT0Q913iTZdbyEancbvefEFCtRgm2o369ZDMsZXwmRseCz6eAotCJeLYPprkSw89Pe1hOia3q4xlu
	mHYD7c15DV53YOAuCRIR+Sjiq31Zc1xld8F6Hdh4y3Fc8/5y9HXv8PZ2Kj1rNpgTuHlbi7YWsdOjc
	ZizHXWDt2SU7kvcrlnPDBi5CKt5ABhCHX2ZouuNkan0H3QS4x+CKtO6qZOjfEEGiA95XMznmxhEL6
	nM6b0+maOYTZe6hNAlRzo6ye8LGbXNZP22pVA15FsVFo1YRJfgJ9CIPmB7/MpPJXGKJkuWHqL+0tT
	ztkMeKQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGB1-0000000Bmqj-1hyz;
	Tue, 04 Nov 2025 12:30:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGAz-0000000BmqZ-3Ph6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E2490601EB;
	Tue,  4 Nov 2025 12:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2306C4CEF7;
	Tue,  4 Nov 2025 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762259416;
	bh=MZIP2Vo/gI1gRzCbLHz5bkWBJ3/2vubyG03MUxEOUI0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QA5/d8OR7N25ood+uCzN+8M8eXNybgpsS0Zikk6JaS4iAYPAI6hc+uc6wUMin7Q1W
	 LXB7Twi1nRvFzC1fjvJCQHiKO4a/OwdsMB9/rfVtZzD/dla3WfmWwjHAULILSNMeip
	 7m7nx565NMH4YsxVGiXMg7BnKev/jvNKdI9vSWtI44ea4TYTCcafDXGuW3IFoXRkJg
	 4cF7pldCUU7+bawmis6HMkZaia+vCK2ClbdPnzLCtK4X8cYcbVNGa7rOlt8Romo14X
	 UcZsi/GPOes7998mBZ8s5ux0ljyYEcaLhUiVW9Z08X1BDxHBGy7aF8dzYTJEyDHrty
	 L1TZARslJQQRQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Almeida
 <daniel.almeida@collabora.com>
Subject: Re: [PATCH v13 04/17] preempt: Introduce __preempt_count_{sub,
 add}_return()
In-Reply-To: <20251013155205.2004838-5-lyude@redhat.com>
References: <20251013155205.2004838-1-lyude@redhat.com>
 <20251013155205.2004838-5-lyude@redhat.com>
Date: Tue, 04 Nov 2025 13:30:00 +0100
Message-ID: <87bjli7zg7.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Juergen Christ <jchrist@linux.ibm.com>, "open list:S390
 ARCHITECTURE" <linux-s390@vger.kernel.org>, "maintainer:X86
 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>, "open list:GENERIC INCLUDE/ASM
 HEADER FILES" <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Vasily Gorbik <gor@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Uros Bizjak <ubizjak@gmail.com>, Brian Gerst <brgerst@gmail.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Sven Schnelle <svens@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Will Deacon <will@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>, "moderated list:ARM64 PORT \(AARCH64
 ARCHITECTURE\)" <linux-arm-kernel@lists.infradead.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Lyude Paul <lyude@redhat.com> writes:

> From: Boqun Feng <boqun.feng@gmail.com>
>
> In order to use preempt_count() to tracking the interrupt disable
> nesting level, __preempt_count_{add,sub}_return() are introduced, as
> their name suggest, these primitives return the new value of the
> preempt_count() after changing it. The following example shows the usage
> of it in local_interrupt_disable():
>
> 	// increase the HARDIRQ_DISABLE bit
> 	new_count = __preempt_count_add_return(HARDIRQ_DISABLE_OFFSET);
>
> 	// if it's the first-time increment, then disable the interrupt
> 	// at hardware level.
> 	if (new_count & HARDIRQ_DISABLE_MASK == HARDIRQ_DISABLE_OFFSET) {
> 		local_irq_save(flags);
> 		raw_cpu_write(local_interrupt_disable_state.flags, flags);
> 	}
>
> Having these primitives will avoid a read of preempt_count() after
> changing preempt_count() on certain architectures.
>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
>
> ---
> V10:
> * Add commit message I forgot
> * Rebase against latest pcpu_hot changes
> V11:
> * Remove CONFIG_PROFILE_ALL_BRANCHES workaround from
>   __preempt_count_add_return()
>
>  arch/arm64/include/asm/preempt.h | 18 ++++++++++++++++++
>  arch/s390/include/asm/preempt.h  | 10 ++++++++++
>  arch/x86/include/asm/preempt.h   | 10 ++++++++++
>  include/asm-generic/preempt.h    | 14 ++++++++++++++
>  4 files changed, 52 insertions(+)
>
> diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
> index 932ea4b620428..0dd8221d1bef7 100644
> --- a/arch/arm64/include/asm/preempt.h
> +++ b/arch/arm64/include/asm/preempt.h
> @@ -55,6 +55,24 @@ static inline void __preempt_count_sub(int val)
>  	WRITE_ONCE(current_thread_info()->preempt.count, pc);
>  }
>  
> +static inline int __preempt_count_add_return(int val)
> +{
> +	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
> +	pc += val;
> +	WRITE_ONCE(current_thread_info()->preempt.count, pc);
> +
> +	return pc;
> +}
> +
> +static inline int __preempt_count_sub_return(int val)
> +{
> +	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
> +	pc -= val;
> +	WRITE_ONCE(current_thread_info()->preempt.count, pc);
> +
> +	return pc;
> +}
> +

I am wondering how this works when preemption is enabled? Will the
kernel never preempt itself? I would think this would have to be atomic?
I can see the surrounding code is using the same pattern, so it is
probably fine. But I am curious as to why that is.


Best regards,
Andreas Hindborg




