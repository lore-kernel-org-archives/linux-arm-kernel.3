Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3F0CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 14:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AWwOkxVq5FqR06Yaq/gMOKThNSxS26hOGA6Ku3F168=; b=o20itVvckAbMQoJ8b6lGMhvsKm
	jpyyxiVGq6k06V8A5v6oyy49dtd9SVP4Ozypmy3t7R3w9Gr9Tq5BMNiyzi/bsbwsNNiFUWhVtlYuq
	QNzm6r30qMZfstKeasriU8V0rY0ZLcm2KSVFEqhcCYEQhHnr1oAigx6WFP/IW5kDyB8aYc0T0DJYH
	iP8Dwbtghns5wTEiyRvOiUupcJn9NgDvvNXMFzaCZOuRL6o+Mf1Nrz4d/jHvhykkVT3FB0lGyGQd6
	5wRcehDbvbRRPB0t26qAN/e5ODWE5h5sYjk+UDTgK59VO/ymY1u5ZHuJLNdXN6jRlJKlFiOqq5j/J
	MUQA7xAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOd6M-0000000GnB2-2MHL;
	Thu, 27 Nov 2025 14:36:06 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOd6I-0000000GnAb-05AV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 14:36:05 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 84F6472C8CC;
	Thu, 27 Nov 2025 17:35:57 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 7A6CC7CCB3A; Thu, 27 Nov 2025 16:35:57 +0200 (IST)
Date: Thu, 27 Nov 2025 16:35:57 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	chris@zankel.net, jcmvbkbc@gmail.com, akpm@linux-foundation.org,
	macro@orcam.me.uk, charlie@rivosinc.com, deller@gmx.de,
	rostedt@goodmis.org, tglx@linutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: Avoid memcpy() for syscall_get_arguments()
Message-ID: <20251127143557.GA2591@strace.io>
References: <20251127123630.4149828-1-ruanjinjie@huawei.com>
 <20251127123630.4149828-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251127123630.4149828-3-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_063602_248093_4D93E6B0 
X-CRM114-Status: GOOD (  16.39  )
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

On Thu, Nov 27, 2025 at 08:36:30PM +0800, Jinjie Ruan wrote:
> Do not use memcpy() to extract syscall arguments from struct pt_regs
> but rather just perform direct assignments.
> 
> The performance benchmarks with Generic Entry patch[1] with audit on
> from perf bench basic syscall on kunpeng920 gives roughly a 1%
> performance uplift and also aligns the implementation with
> x86 and RISC-V.
> 
> | Metric     | W/O this patch | With this patch | Change    |
> | ---------- | -------------- | --------------- | --------- |
> | Total time | 2.241 [sec]    | 2.211 [sec]     |  ↓1.36%   |
> | usecs/op   | 0.224157       | 0.221146        |  ↓1.36%   |
> | ops/sec    | 4,461,157      | 4,501,409       |  ↑0.9%    |
> 
> Before:
> <syscall_get_arguments.constprop.0>:
>        aa0103e2        mov     x2, x1
>        91002003        add     x3, x0, #0x8
>        f9408804        ldr     x4, [x0, #272]
>        f8008444        str     x4, [x2], #8
>        a9409404        ldp     x4, x5, [x0, #8]
>        a9009424        stp     x4, x5, [x1, #8]
>        a9418400        ldp     x0, x1, [x0, #24]
>        a9010440        stp     x0, x1, [x2, #16]
>        f9401060        ldr     x0, [x3, #32]
>        f9001040        str     x0, [x2, #32]
>        d65f03c0        ret
>        d503201f        nop
> 
> After:
>        a9408e82        ldp     x2, x3, [x20, #8]
>        2a1603e0        mov     w0, w22
>        f9400e84        ldr     x4, [x20, #24]
>        f9408a81        ldr     x1, [x20, #272]
>        9401c4ba        bl      ffff800080215ca8 <__audit_syscall_entry>
> 
> [1]: https://lore.kernel.org/all/20251126071446.3234218-1-ruanjinjie@huawei.com/
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/syscall.h | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
> index f3853047c28e..f3564ba97f7e 100644
> --- a/arch/arm64/include/asm/syscall.h
> +++ b/arch/arm64/include/asm/syscall.h
> @@ -82,9 +82,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  					 unsigned long *args)
>  {
>  	args[0] = regs->orig_x0;
> -	args++;
> -
> -	memcpy(args, &regs->regs[1], 5 * sizeof(args[0]));
> +	args[1] = regs->regs[1];
> +	args[2] = regs->regs[2];
> +	args[3] = regs->regs[3];
> +	args[4] = regs->regs[4];
> +	args[5] = regs->regs[5];
>  }
>  
>  static inline void syscall_set_arguments(struct task_struct *task,

Please keep syscall_get_arguments() and syscall_set_arguments() in sync:
if you replace memset() with direct assignments in one of these functions,
please mirror the change in another.


-- 
ldv

