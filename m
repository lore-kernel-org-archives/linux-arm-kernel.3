Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DB6C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9TwKjeZoFGEHgdNTQQols46LO/1SYqRmMIWZsa4kgQ=; b=LrgNXzo0nfhkMpCSj+50D4g5ZW
	5QFnW37nQkAXjnSBqfOQc4O/oqI3IYOr7WpPAEOXwZvGplVpFSjsVphCh4/PvpFnaProY7NQN20y4
	WJbEFTJm3upxEE7Ulc16xU4Aga16a4PkqYfZ0vNd8CCYVzFsr2EF25eYH0oDz9OkksqjiebRs9AQW
	QnZuraJ8WG9IUhQkClJ0sVrYSPQjam5EkUfOqg3DHPp1zz0DOJcdzpr6pynMuQgxiLGQtKPnqh5jI
	vvjLAMO/PyOGI2stEoBw0Za0iHQy6e8/MyRtWf7fsFHlR3shDXwUTIBkKMcWL7uJP42EKq1ZeiWMe
	QFSHHS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6CW-00000008si2-1C1k;
	Tue, 21 Jul 2026 08:51:44 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6CT-00000008shd-3Mgg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:51:43 +0000
Date: Tue, 21 Jul 2026 10:51:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784623899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W9TwKjeZoFGEHgdNTQQols46LO/1SYqRmMIWZsa4kgQ=;
	b=jDOYsNOrU1yusQhNG5aeS0V+izFL5Y2bD5K3ObzlRU7GEt91WIWtcrmhqwTeVdgbU9jgAj
	cO6xFFutXUrcQ7SEv4egvGgbxV/eMrfKG67ljoI9+JCCrxlFatL3RSUj5U5A/llWcxbC9W
	qg5R+JJQ8TaGMIemWmZ30/zGVHLEZE3MmERNWXoDnzhQNiVX6AHjwfUN55R/a5beTzX5co
	8vLOUrKiJgkGiAQDcTDHPKHgRtfipw1AAAKJwbEI2qe1F85vTu5TrHl7lFMPwIv0s0HFQV
	J3sDwT1M0d59KnbTFo4CoN+teS9Wp15UtTs3rSIsk2mcgr/Mm8bz1tNyMu6b7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784623899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W9TwKjeZoFGEHgdNTQQols46LO/1SYqRmMIWZsa4kgQ=;
	b=xZBtK6QrcF4AbeXA19rBSObL+K9ljnWUP2jHK8XRJbfunVzvMbLbLrMMs4LQYsO2x4hN0x
	sffALUD3WomVk9CQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v17 15/15] arm64: vdso: Expose sigreturn address on vdso
 to the kernel
Message-ID: <20260721104810-0a8ab042-2705-43e8-90d2-74e221f3fab5@linutronix.de>
References: <20260721081858.1169276-1-ruanjinjie@huawei.com>
 <20260721081858.1169276-16-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721081858.1169276-16-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_015141_985129_9E95DA37 
X-CRM114-Status: GOOD (  15.00  )
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
Cc: mark.rutland@arm.com, kees@kernel.org, catalin.marinas@arm.com, oleg@redhat.com, will@kernel.org, peterz@infradead.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linux-mm@kvack.org, linusw@kernel.org, linux-kernel@vger.kernel.org, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, yeoreum.yun@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2026 at 04:18:58PM +0800, Jinjie Ruan wrote:
> Syscall User Dispatch (SUD) must not intercept the signal trampoline
> code, otherwise returning from a signal with a locked selector may
> cause infinite recursion into the signal handler.
> 
> Provide an arm64 implementation of arch_syscall_is_vdso_sigreturn()
> to exclude these sigreturn syscalls from dispatch.
> 
> For native 64-bit tasks, check whether the current PC matches the 'svc #0'
> instruction inside the vDSO sigreturn trampoline (defined in
> arch/arm64/kernel/vdso/sigreturn.S as below).
> 
> 	SYM_CODE_START(__kernel_rt_sigreturn)
> 		mov     x8, #__NR_rt_sigreturn
> 		svc     #0
> 	SYM_CODE_END(__kernel_rt_sigreturn)

With the new label this code snippet here shouldnt be needed anymore.

> For COMPAT tasks, verify that the instruction falls within the dedicated
> 'sigpage' range, since compat signal handlers use this architecture-
> specific page (not the vDSO) for their return trampoline. This prevents
> SUD from incorrectly dispatching syscalls issued during signal return.
> 
> Suggested-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Suggested-by: kemal <kmal@cock.li>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/Kconfig                 |  1 +
>  arch/arm64/include/asm/elf.h       |  1 +
>  arch/arm64/kernel/vdso.c           | 16 ++++++++++++++++
>  arch/arm64/kernel/vdso/sigreturn.S |  1 +
>  arch/arm64/kernel/vdso/vdso.lds.S  |  1 +
>  5 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index aea686dce3d5..a41d2b593899 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -86,6 +86,7 @@ config ARM64
>  	select ARCH_SUPPORTS_SCHED_SMT
>  	select ARCH_SUPPORTS_SCHED_CLUSTER
>  	select ARCH_SUPPORTS_SCHED_MC
> +	select ARCH_SUPPORTS_SYSCALL_USER_DISPATCH

From the subject and description I would not have expected this to be in here.
Split into its own patch?

>  	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
>  	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
>  	select ARCH_WANT_DEFAULT_BPF_JIT

(...)

For the rest:

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>


Thomas

