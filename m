Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A23D19502
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 19:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8nW7IA3t2d5eDSn1XOhXwRuyT29iLySHj0qie2BijU=; b=cJ3msfX8cvF0GUOonpAvkw/9xs
	OZb53KvHx8zKXHnoT3VZm63jr2sbEkyN8k+e+8w2jCdeqM9/EiPXOeLWlVLKuie+rkiCnvphNhEcm
	PhdZ4/g1wki1/bGF2PGSZvvhQU98hj5/lryeNi4DEqAl+TQ99cX7GA09AWWSUygo+G7ioeXgwIV7/
	U00tb5GyvbuLn+pRA9OOuQPYLGzx3Cc0VL65C5f/6UYVTAOwJo8NItm5z2bd6q7zcwCqd4YfY8eFn
	FDy+34qR3l7qmVKZ93/MdKCYopRtLMGh8i8Ss1pR8d9RfGM64azxGsGGBsB7lYOqXYE6qhygK7ezp
	pGY0+4/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRrb-0000000D7Ld-1OuV;
	Mon, 26 Jan 2026 19:03:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRrZ-0000000D7LX-2enj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 19:03:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A32860136;
	Mon, 26 Jan 2026 19:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F40C116C6;
	Mon, 26 Jan 2026 19:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769454180;
	bh=NMpmmo676tzOTXBkbWzjq51xX+ZDtptvSmw/dCizBnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7R8O7DQde8PBTJMl4lJAtJCbCkYvd2dlGK++9bhHIE2+Sh3CaBlVA3eM6xctJ6Fi
	 1FUvByfXUDgMmEohYC1qb4XpTDfrfTtuZ1a8OWFF6yDtLB/5B0SQzCCQR/LpDwg9E1
	 mdjJLPbQi54dGnDtLQxgvYHQYvb09MScWJGuhIXUQyxoctKo4MMRu0mb6hjcV6IFU4
	 FKp69LSbUISJj3iKEhDv3AgHba8o5R9F9q2/CGYhEkmnrHsZ/PH+8hzT4tE/3cwzvH
	 jaCMhGEY5qDwTlwCKeZStYXrr6VXLblmYa9jTMgw4UpS5Nbi8KxHATgJtOW0BvG+rl
	 T80bpLVqbP4dw==
Date: Mon, 26 Jan 2026 19:02:51 +0000
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v10 05/16] arm64: ptrace: Move rseq_syscall() before
 audit_syscall_exit()
Message-ID: <aXe6W69Esd1NLEU8@willie-the-truck>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-6-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222114737.1334364-6-ruanjinjie@huawei.com>
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, kees@kernel.org, linux-arm-kernel@lists.infradead.org, kmal@cock.li, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, charlie@rivosinc.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, tglx@linutronix.de, richard.weiyang@gmail.com, dvyukov@google.com, wad@chromium.org, oleg@redhat.com, linux-kernel@vger.kernel.org, liqiang01@kylinos.cn, akpm@linux-foundation.org, reddybalavignesh9979@gmail.com, macro@orcam.me.uk
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Dec 22, 2025 at 07:47:26PM +0800, Jinjie Ruan wrote:
> commit a9f3a74a29af ("entry: Provide generic syscall exit function")
> introduce generic syscall exit function and call rseq_syscall()
> before audit_syscall_exit() and arch_syscall_exit_tracehook().
> 
> And commit b74406f37737 ("arm: Add syscall detection for restartable
> sequences") add rseq support for arm32, which also call rseq_syscall()
> before audit_syscall_exit() and tracehook_report_syscall().
> 
> However, commit 409d5db49867c ("arm64: rseq: Implement backend rseq
> calls and select HAVE_RSEQ") implement arm64 rseq and call
> rseq_syscall() after audit_syscall_exit() and tracehook_report_syscall().
> 
> So compared to the generic entry and arm32 code, arm64 terminates
> the process a bit later if the syscall is issued within
> a restartable sequence.

Given that signals are processed until later, is this actually true?

> But as commit b74406f37737 ("arm: Add syscall detection for restartable
> sequences") said, syscalls are not allowed inside restartable sequences,
> so should call rseq_syscall() at the very beginning of system call
> exiting path for CONFIG_DEBUG_RSEQ=y kernel. This could help us to detect
> whether there is a syscall issued inside restartable sequences.
> 
> It makes sense to raise SIGSEGV via rseq_syscall() before auditing
> and ptrace syscall exit, because this guarantees that the process is
> already in an error state with SIGSEGV pending when those later steps
> run. Although it makes no practical difference to signal delivery (signals
> are processed at the very end in arm64_exit_to_user_mode()), the ordering
> is more logical: detect and flag the error first, then proceed with
> the remaining work.
> 
> To make it more reasonable and in preparation for moving arm64 over to
> the generic entry code, move rseq_syscall() ahead before
> audit_syscall_exit().

I've been struggling a bit to see how this helps to align with the
generic code. I'm also concerned that rseq_debug_update_user_cs()
operates on instruction_pointer(regs) which is something that can be
chaned by ptrace.

So, I'm not saying this is wrong, but it feels like a user-visible
change that needs better justification.

Will

