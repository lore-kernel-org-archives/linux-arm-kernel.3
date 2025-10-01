Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FACECAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 09:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKrjhYW5GuEMBkVhNKUNqpQephnordn8VEWO9SXLeqY=; b=kPtFaCui+Fbw3YMiChrzJpE4DH
	hGDt6UeBieFGxt/TEBf4e+oihArOjvcokCfKcd+IoHCtEI53CnyfXJjlPj0QrlvRld8xxKea73q9v
	V+AZ48Vnz6HnyNKlwKKTqZc4Ytsphe+pyHFbxGK4mIfmmaQkk8PucaAg0ojDpu8dkW+gg5ajQEBv3
	+5BuzM2RRZnZK/BVNsnT7BoMRNeyNp0Fp3b/4PgQ308AWgkeD1mW+xu55N9R6fFnaSjNwzaud8/Bf
	N4kOWFQhkXT9NJgQnOaaaB7bIyMluhujob9yBAvwdPnuFs71srreAr/qp4vFcVQ7mke2bHN7w/Wpg
	HVH8Es9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3tCf-000000079gX-2qKE;
	Wed, 01 Oct 2025 09:32:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3tCe-000000079g9-1CpV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 09:32:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ACE8561755;
	Wed,  1 Oct 2025 09:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02C5C4CEF4;
	Wed,  1 Oct 2025 09:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759311171;
	bh=UJ5Nrj//XI4MYIzbnakq8QPry+1jzsB8A4m7sh8T2gA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxJWr6HCADQ9SHytSVb/WM8rkT5Hl/hXX+JyJIO5LalLr0RzMDHRv1dc0VvekL+D1
	 23vRK/27KxUmvCPzn3AO2jUDXVCo5nLygHKcOoHwHLW6cqSHs8CHFaol9FD+0CL6l6
	 fxVhrkzxLSPo8y0CCrlmojDvYL+Rsyge2tm4eLvjdkWCc43WHud7OLkMPhCfAlKTF8
	 Fmq5grfl9oz2tbArCTErEJ/PpqhGTo6bouJ9LQ+2J/zAU63tM/LMgSFiHg29Buf54C
	 wcVqHKEFNywNwzSNLS/LLEgGNl66mspsZZQRag8IrTRKGavS6VfvYF0Jm8Q+5DhL+1
	 OVZQvQPXTM2MQ==
Date: Wed, 1 Oct 2025 10:32:46 +0100
From: Will Deacon <will@kernel.org>
To: Kenneth Van Alstyne <kvanals@kvanals.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
	catalin.marinas@arm.com, ardb@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org
Subject: Re: KVM: arm64: Regression in at least linux-6.1.y tree with recent
 FPSIMD/SVE/SME fix
Message-ID: <aNz1PnARMC4DPeYb@willie-the-truck>
References: <010001999bae0958-4d80d25d-8dda-4006-a6b9-798f3e774f6c-000000@email.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <010001999bae0958-4d80d25d-8dda-4006-a6b9-798f3e774f6c-000000@email.amazonses.com>
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

Hi Kenneth,

Thanks for the report.

On Tue, Sep 30, 2025 at 05:31:38PM +0000, Kenneth Van Alstyne wrote:
> Sending via plain text email -- apologies if you receive this twice.
> 
> If this isn't the process for reporting a regression in a LTS kernel per
> https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html,
> I'm happy to follow another process.
> 
> Kernel 6.1.149 introduced a regression, at least on our ARM Cortex
> A57-based platforms, via commit 8f4dc4e54eed4bebb18390305eb1f721c00457e1
> in arch/arm64/kernel/fpsimd.c where booting KVM VMs eventually leads to a
> spinlock recursion BUG and crash of the box.
> 
> Reverting that commit via the below reverts to the old (working) behavior:
> 
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index 837d1937300a57..bc42163a7fd1f0 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1851,10 +1851,10 @@ void fpsimd_save_and_flush_cpu_state(void)
>   if (!system_supports_fpsimd())
>   return;
>   WARN_ON(preemptible());
> - get_cpu_fpsimd_context();
> + __get_cpu_fpsimd_context();
>   fpsimd_save();
>   fpsimd_flush_cpu_state();
> - put_cpu_fpsimd_context();
> + __put_cpu_fpsimd_context();
>  }
>   #ifdef CONFIG_KERNEL_MODE_NEON

Hmm, the problem with doing that is it will reintroduce the bug that
8f4dc4e54eed ("KVM: arm64: Fix kernel BUG() due to bad backport of
FPSIMD/SVE/SME fix") was trying to fix (see the backtrace in the commit
message). So the old behaviour is still broken, just in a slightly
different way.

> It's not entirely clear to me if this is specific to our firmware,
> specific to ARM Cortex A57, or more systemic as we lack sufficiently
> differentiated hardware to know.  I've tested on the latest 6.1 kernel in
> addition to the one in the log below and have also tested a number of
> firmware versions available for these boxes.
> 
> Steps to reproduce:
> 
> Boot VM in qemu-system-aarch64 with "-accel kvm" and "-cpu host" flags set -- no other arguments seem to matter
> Generate CPU load in VM
> 
> Kernel log:
> 
> [sjc1] root@si-compute-kvm-e0fff70016b4:/# [  805.905413] BUG: spinlock recursion on CPU#7, CPU 3/KVM/57616
> [  805.905452]  lock: 0xffff3045ef850240, .magic: dead4ead, .owner: CPU 3/KVM/57616, .owner_cpu: 7
> [  805.905477] CPU: 7 PID: 57616 Comm: CPU 3/KVM Tainted: G           O       6.1.152 #1
> [  805.905495] Hardware name: SoftIron SoftIron Platform Mainboard/SoftIron Platform Mainboard, BIOS 1.31 May 11 2023
> [  805.905516] Call trace:
> [  805.905524]  dump_backtrace+0xe4/0x110
> [  805.905538]  show_stack+0x20/0x30
> [  805.905548]  dump_stack_lvl+0x6c/0x88
> [  805.905561]  dump_stack+0x18/0x34
> [  805.905571]  spin_dump+0x98/0xac
> [  805.905583]  do_raw_spin_lock+0x70/0x128
> [  805.905596]  _raw_spin_lock+0x18/0x28
> [  805.905607]  raw_spin_rq_lock_nested+0x18/0x28
> [  805.905620]  update_blocked_averages+0x70/0x550
> [  805.905634]  run_rebalance_domains+0x50/0x70
> [  805.905645]  handle_softirqs+0x198/0x328
> [  805.905659]  __do_softirq+0x1c/0x28
> [  805.905669]  ____do_softirq+0x18/0x28
> [  805.905680]  call_on_irq_stack+0x30/0x48
> [  805.905691]  do_softirq_own_stack+0x24/0x30
> [  805.905703]  do_softirq+0x74/0x90
> [  805.905714]  __local_bh_enable_ip+0x64/0x80

Argh, this is because we can't simply mask/unmask softirqs and so when
they get re-enabled we process anything pending. I _think_ irqs are
disabled at this point, so perhaps we should only bother with
disabling/enabling softirqs if hardirqs are enabled, a bit like the hack
Ard had in:

https://lore.kernel.org/all/20250924152651.3328941-13-ardb+git@google.com/

Hacky diff at the end.

> [  805.905727]  fpsimd_save_and_flush_cpu_state+0x5c/0x68
> [  805.905740]  kvm_arch_vcpu_put_fp+0x4c/0x88
> [  805.905752]  kvm_arch_vcpu_put+0x28/0x88
> [  805.905764]  kvm_sched_out+0x38/0x58

(I think we run context_switch() => prepare_task_switch() here, so irqs
are disabled)

Will

--->8

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index fc51cdd5aaa7..a79df0804d67 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -184,7 +184,8 @@ static void __get_cpu_fpsimd_context(void)
  */
 static void get_cpu_fpsimd_context(void)
 {
-       local_bh_disable();
+       if (!irqs_disabled())
+               local_bh_disable();
        __get_cpu_fpsimd_context();
 }
 
@@ -205,7 +206,8 @@ static void __put_cpu_fpsimd_context(void)
 static void put_cpu_fpsimd_context(void)
 {
        __put_cpu_fpsimd_context();
-       local_bh_enable();
+       if (!irqs_disabled())
+               local_bh_enable();
 }
 
 static bool have_cpu_fpsimd_context(void)


