Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632C0CAC585
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqyllpnym2WNHN8ocFk5S/4SKt3E7oWCVj9gkUsf4IE=; b=rPH29+Ar1j+lUiq6EfOJ5I8eUt
	IcXduW4kAsSM9g9FfvMF+YbAr4F1mLXabFAoS22p21MCn3jn7t4ZzHEehQChSkoXLw3QGFZtMu775
	k1WzxKCmSEp3dwAb1xqkfp7/NnD9ReSyvpEQHPB5ZMBTj/6QxoOkj+BpAo0vWAPCjsI19sJoaoDsa
	JIrVG03WrdUu8IvBZ+aroLRNhnKi54ht2q63PZgDGgUDEue1mwtu2tYCMS/X1PKQMkAQwai2CyRoj
	8bSdhxeyih/0OS6AuTaC3+fwrJL+ZhZBsRmIE5gTtTIPkjja96rITBx0UzR0Jg4S+hTKupYpomviy
	NM2xkt7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfLa-000000010UR-05Ng;
	Mon, 08 Sep 2025 17:08:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvank-0000000GxLm-2gt8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 12:16:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1565D60051;
	Mon,  8 Sep 2025 12:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8193FC4CEF1;
	Mon,  8 Sep 2025 12:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757333811;
	bh=JeLtMr5mbqMvT4H9vUGBXZD2zJiawG8cSjyIWuyr4gU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MD+YBum7Mx2eaGyAQVN3pLSwfpOjSDtqxERnPq8HaEktORlVu7mh4KhuhpdrT76ni
	 VJ7/fy6w0B7vArsp7kKuthIvVpT3ny8Vrzfjvf/nPmI5pP2b7wVLoH+JJOcDC46eT5
	 4lvew7YzSY4ZEVHbKN0bwiF9vikmw4FGzy7bZjAvyv9t7IpMvBXMiCUvT/zDnkptTk
	 83eNBoK2+Vz6D5RActWo9crw0M8NxzEqOI8/i8i0rLzezIrYqw3xGuNWtu/zZ89iAZ
	 v0OGV6WTM569w6k8xvBwhJSQMJ0moc9ggg7z1VlSF70sEXHHOnNAZxHG8D2YAaDAUT
	 sOpADMT1o+0Rg==
Date: Mon, 8 Sep 2025 13:16:45 +0100
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 1/2] KVM: arm64: Dump instruction on hyp panic
Message-ID: <aL7JLbljvX1JATP3@willie-the-truck>
References: <20250717234744.2254371-1-smostafa@google.com>
 <20250717234744.2254371-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250717234744.2254371-2-smostafa@google.com>
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

On Thu, Jul 17, 2025 at 11:47:43PM +0000, Mostafa Saleh wrote:
> Similar to the kernel panic, where the instruction code is printed,
> we can do the same for hypervisor panics.
> 
> This patch does that only in case of “CONFIG_NVHE_EL2_DEBUG” or nvhe.
> 
> The next patch adds support for pKVM.
> 
> Also, remove the hardcoded argument dump_kernel_instr().
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/include/asm/traps.h |  1 +
>  arch/arm64/kernel/traps.c      | 20 +++++++++++++-------
>  arch/arm64/kvm/handle_exit.c   |  5 +++++
>  3 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/traps.h b/arch/arm64/include/asm/traps.h
> index 82cf1f879c61..0d7e86a95d62 100644
> --- a/arch/arm64/include/asm/traps.h
> +++ b/arch/arm64/include/asm/traps.h
> @@ -30,6 +30,7 @@ void arm64_force_sig_mceerr(int code, unsigned long far, short lsb, const char *
>  void arm64_force_sig_ptrace_errno_trap(int errno, unsigned long far, const char *str);
>  
>  int early_brk64(unsigned long addr, unsigned long esr, struct pt_regs *regs);
> +void dump_instr(unsigned long addr);
>  
>  /*
>   * Move regs->pc to next instruction and do necessary setup before it
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 9bfa5c944379..d692c05e3686 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -149,15 +149,11 @@ pstate_check_t * const aarch32_opcode_cond_checks[16] = {
>  
>  int show_unhandled_signals = 0;
>  
> -static void dump_kernel_instr(const char *lvl, struct pt_regs *regs)
> +void dump_instr(unsigned long addr)
>  {
> -	unsigned long addr = instruction_pointer(regs);
>  	char str[sizeof("00000000 ") * 5 + 2 + 1], *p = str;
>  	int i;
>  
> -	if (user_mode(regs))
> -		return;
> -
>  	for (i = -4; i < 1; i++) {
>  		unsigned int val, bad;

I'm a little worried that this function might be used to try and dump
instructions from userspace now that it just takes an address.

Maybe we could:

  - Keep the name unchanged, e.g. void dump_kernel_instr(unsigned long kaddr)
  - Inline the user_mode(regs) and instruction_pointer(regs) calls into
    __die()
  - Check is_ttbr1_addr(kaddr) in dump_kernel_instr()

WDYT?

Will

