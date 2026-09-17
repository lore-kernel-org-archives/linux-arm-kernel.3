Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01475C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwB4oGVaqvE0XuVU5JK6VZ+NF7cmDwIYhCaP4utxUD8=; b=i5SSU8EHBjq+D7iuV/VqK4luM6
	8UYCIM7LjCmM1LldVIfQ8MiZe8C0HHFbiFAnuvJ+VOd8N+9Ecl3fBD8rGDnLr+YLWj8M8A2W/f6lj
	Ix3a6ZI7gDPeckoXSrCrpHgKd/ZjN0VqqXeGCeFoF60PR3rEiOwylA04gNJYYT6FZC6Z/D+wBkks4
	oa1ZI48shpribB6IWLnVOtqhoSS0mO3NeJbYVKO6LTzXV8pX/QD91ly+wsqPVXAESxlJVS42lBlaz
	aqETZEDEseU7bL1YAoqvFl7qwVu34mNeIZdzBjc4sPEco+4iq0qdECtcSoYmUlqbV/iFQEqFIFArQ
	IRaGlbJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77H0-0000000Aro9-17YZ;
	Thu, 17 Sep 2026 08:15:14 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Gw-0000000ArmI-3tk6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:15:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RwB4oGVaqvE0XuVU5JK6VZ+NF7cmDwIYhCaP4utxUD8=;
	b=NPp+pkdfX2Zb5zgzNMBheMnSgRD+T/C12ACahmhc/6Lcb+4TYfcuh3AA80WYeiD4Q3AIIIQPJ
	DcTlVhTKU6aYqSs0oGin12lWUQ83kvS/Tz3J7dYtBmzdrhP67iKHnINUXZuriuibqbIiat5OVwK
	aTii3ciXRTaJkrcxibYfeMg=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hlpDP2Ppgz12LHj;
	Thu, 17 Sep 2026 16:03:49 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id F2BC74056D;
	Thu, 17 Sep 2026 16:14:56 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 17 Sep 2026 16:14:56 +0800
Message-ID: <96fc2985-a4a2-4f07-8f27-603d876e0fea@huawei.com>
Date: Thu, 17 Sep 2026 16:14:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/38] arm64: replace local_daif helpers
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<maz@kernel.org>, <lpieralisi@kernel.org>, <liaochang1@huawei.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-10-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260914102102.68597-10-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_011511_622804_2F858E3A 
X-CRM114-Status: GOOD (  37.36  )
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



在 2026/9/14 18:20, Vladimir Murzin 写道:
> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> Replace existing `local_daif_...` usage with the new `local_all_irqs...`
> helpers, adding the necessary save-state struct where required.
> 
> Slightly rework `apei_claim_sea()`'s handling of interrupt masking to
> fit with the new APIs.  Currently, it saves the DAIF flags to restore
> later and the `local_irq` ones to check if interrupts are disabled.
> It then masks AIF to signal the SEA (forcing DAIF masking), and will
> unmask to IF (re-enabling PMR masking if pseudo-NMIs are in use) if it
> interrupted a task with interrupts unmaksed, restoring with the DAIF
> flags from the beginning afterwards.
> 
> As we want to preserve a "mask/unmask" process, change the logic from
> "mask AIF/unmask A/unmask IF" to "mask IF/mask A/unmask A/unmask IF" :
> first mask with `local_irq_save()`, mask/unmask further around the
> SEA signaling, and restore at the end with `local_irq_restore()`.
> Now that both APIs properly work with DAIF and PMR, this works
> as expected and also removes the need for a "save flags without masking"
> function for the new helpers, as this was the only user.
> 
> Remove the use of GIC_PRIO_PSR_I_SET in `kvm/hyp/nvhe/switch.c`,
> as we now check both PMR and DAIF everywhere and we don't need to signal
> interrupts being masked in DAIF in the PMR anymore.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/acpi.c          | 15 +++++++--------
>  arch/arm64/kernel/hibernate.c     | 14 +++++++-------
>  arch/arm64/kernel/machine_kexec.c |  4 ++--
>  arch/arm64/kernel/setup.c         |  4 ++--
>  arch/arm64/kernel/smp.c           | 10 +++++-----
>  arch/arm64/kernel/suspend.c       | 14 +++++++-------
>  arch/arm64/kvm/hyp/nvhe/switch.c  |  2 +-
>  arch/arm64/kvm/hyp/vgic-v3-sr.c   |  7 ++++---
>  arch/arm64/kvm/hyp/vhe/switch.c   | 14 ++++++++------
>  arch/arm64/mm/mmu.c               |  7 ++++---
>  10 files changed, 47 insertions(+), 44 deletions(-)
> 
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index 681aa2bbc399..ea9a9da7e412 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -33,7 +33,7 @@
>  #include <acpi/processor.h>
>  #include <asm/cputype.h>
>  #include <asm/cpu_ops.h>
> -#include <asm/daifflags.h>
> +#include <asm/interrupts/masking.h>
>  #include <asm/smp_plat.h>
>  
>  int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
> @@ -391,15 +391,14 @@ int apei_claim_sea(struct pt_regs *regs)
>  	int err = -ENOENT;
>  	bool return_to_irqs_enabled;
>  	unsigned long current_flags;
> +	arm64_exc_hwstates_t hwstate;
>  
>  	if (!IS_ENABLED(CONFIG_ACPI_APEI_GHES))
>  		return err;
>  
> -	current_flags = local_daif_save_flags();
> -
> -	/* current_flags isn't useful here as daif doesn't tell us about pNMI */
> -	return_to_irqs_enabled = !irqs_disabled_flags(arch_local_save_flags());
> +	local_irq_save(current_flags);
>  
> +	return_to_irqs_enabled = !irqs_disabled_flags(current_flags);
>  	if (regs)
>  		return_to_irqs_enabled = !regs_irqs_disabled(regs);
>  
> @@ -407,10 +406,11 @@ int apei_claim_sea(struct pt_regs *regs)
>  	 * SEA can interrupt SError, mask it and describe this as an NMI so
>  	 * that APEI defers the handling.
>  	 */
> -	local_daif_restore(DAIF_ERRCTX);
> +	hwstate = local_exceptions_save_mask(ERROR_CONTEXT);
>  	nmi_enter();
>  	err = ghes_notify_sea();
>  	nmi_exit();
> +	local_exceptions_restore(hwstate);

Hi Vladimir,

I think mixing local_irq_save()/local_irq_restore() and
local_exceptions_save_mask()/local_exceptions_restore here may be
problematic, because arch_local_irq_save() does not take into full
account the state of DAIF and the pseudo-NMI. For example, when the
pseudo-NMI is enabled, arch_local_irq_save() only sets PMR to
GIC_PRIO_IRQOFF without taking DAIF into consideration, whereas
local_exceptions_save_mask(NOIRQ_CONTEXT) additionally clears all the
DAIF bits.

But whereas local_exceptions_save_mask() returns exactly the current
hwstate arch_local_irq_save() sets, and local_exceptions_restore() also
needs to restore a unified state.

Best regards,
Jinjie

>  
>  	/*
>  	 * APEI NMI-like notifications are deferred to irq_work. Unless
> @@ -418,7 +418,6 @@ int apei_claim_sea(struct pt_regs *regs)
>  	 */
>  	if (!err) {
>  		if (return_to_irqs_enabled) {
> -			local_daif_restore(DAIF_PROCCTX_NOIRQ);
>  			__irq_enter();
>  			irq_work_run();
>  			__irq_exit();
> @@ -428,7 +427,7 @@ int apei_claim_sea(struct pt_regs *regs)
>  		}
>  	}
>  
> -	local_daif_restore(current_flags);
> +	local_irq_restore(current_flags);
>  
>  	return err;
>  }
> diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
> index 7bf117427777..74848a89ba37 100644
> --- a/arch/arm64/kernel/hibernate.c
> +++ b/arch/arm64/kernel/hibernate.c
> @@ -20,7 +20,7 @@
>  #include <asm/barrier.h>
>  #include <asm/cacheflush.h>
>  #include <asm/cputype.h>
> -#include <asm/daifflags.h>
> +#include <asm/interrupts/masking.h>
>  #include <asm/irqflags.h>
>  #include <asm/kexec.h>
>  #include <asm/memory.h>
> @@ -332,16 +332,16 @@ static void swsusp_mte_restore_tags(void)
>  
>  int swsusp_arch_suspend(void)
>  {
> -	int ret = 0;
> -	unsigned long flags;
>  	struct sleep_stack_data state;
> +	arm64_exc_hwstates_t hwstate;
> +	int ret = 0;
>  
>  	if (cpus_are_stuck_in_kernel()) {
>  		pr_err("Can't hibernate: no mechanism to offline secondary CPUs.\n");
>  		return -EBUSY;
>  	}
>  
> -	flags = local_daif_save();
> +	hwstate = local_exceptions_save_mask(CRITICAL_CONTEXT);
>  
>  	if (__cpu_suspend_enter(&state)) {
>  		/* make the crash dump kernel image visible/saveable */
> @@ -349,7 +349,7 @@ int swsusp_arch_suspend(void)
>  
>  		ret = swsusp_mte_save_tags();
>  		if (ret) {
> -			local_daif_restore(flags);
> +			local_exceptions_restore(hwstate);
>  			return ret;
>  		}
>  
> @@ -393,7 +393,7 @@ int swsusp_arch_suspend(void)
>  		spectre_v4_enable_mitigation(NULL);
>  	}
>  
> -	local_daif_restore(flags);
> +	local_exceptions_restore(hwstate);
>  
>  	return ret;
>  }
> @@ -477,7 +477,7 @@ int __nocfi swsusp_arch_resume(void)
>  	 *   swsusp_arch_resume(), and expects to be re-entered in the
>  	 *   same state : with all DAIF exceptions masked.
>  	 */
> -	local_daif_save();
> +	local_exceptions_save_mask(CRITICAL_CONTEXT);
>  	hibernate_exit(virt_to_phys(tmp_pg_dir), resume_hdr.ttbr1_el1,
>  		       resume_hdr.reenter_kernel, restore_pblist,
>  		       resume_hdr.__hyp_stub_vectors, virt_to_phys(zero_page));
> diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
> index 8f9bc2327dc8..f1353ca6c86b 100644
> --- a/arch/arm64/kernel/machine_kexec.c
> +++ b/arch/arm64/kernel/machine_kexec.c
> @@ -17,7 +17,7 @@
>  
>  #include <asm/cacheflush.h>
>  #include <asm/cpu_ops.h>
> -#include <asm/daifflags.h>
> +#include <asm/interrupts/masking.h>
>  #include <asm/memory.h>
>  #include <asm/mmu.h>
>  #include <asm/mmu_context.h>
> @@ -174,7 +174,7 @@ void machine_kexec(struct kimage *kimage)
>  
>  	pr_info("Bye!\n");
>  
> -	local_daif_mask();
> +	local_exceptions_final_mask();
>  
>  	/*
>  	 * Both restart and kernel_reloc will shutdown the MMU, disable data
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index 29c6100f0c50..7f4cf0e50551 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -37,7 +37,7 @@
>  #include <asm/fixmap.h>
>  #include <asm/cpu.h>
>  #include <asm/cputype.h>
> -#include <asm/daifflags.h>
> +#include <asm/interrupts/masking.h>
>  #include <asm/elf.h>
>  #include <asm/cpufeature.h>
>  #include <asm/cpu_ops.h>
> @@ -311,7 +311,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
>  	 * IRQ and FIQ will be unmasked after the root irqchip has been
>  	 * detected and initialized.
>  	 */
> -	local_daif_restore(DAIF_PROCCTX_NOIRQ);
> +	local_exceptions_cpu_init_mask(NOIRQ_CONTEXT);
>  
>  	/*
>  	 * TTBR0 is only used for the identity mapping at this stage. Make it
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 17e4557404f2..f29094ec3843 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -43,7 +43,7 @@
>  #include <asm/cpu.h>
>  #include <asm/cputype.h>
>  #include <asm/cpu_ops.h>
> -#include <asm/daifflags.h>
> +#include <asm/interrupts/masking.h>
>  #include <asm/kvm_mmu.h>
>  #include <asm/mmu_context.h>
>  #include <asm/nmi.h>
> @@ -265,7 +265,7 @@ asmlinkage notrace void secondary_start_kernel(void)
>  	 * as the root irqchip has already been detected and initialized we can
>  	 * unmask IRQ and FIQ at the same time.
>  	 */
> -	local_daif_restore(DAIF_PROCCTX);
> +	local_exceptions_cpu_init_mask(PROCESS_CONTEXT);
>  
>  	/*
>  	 * OK, it's off to the idle thread for us
> @@ -372,7 +372,7 @@ void __noreturn cpu_die(void)
>  
>  	idle_task_exit();
>  
> -	local_daif_mask();
> +	local_exceptions_final_mask();
>  
>  	/* Tell cpuhp_bp_sync_dead() that this CPU is now safe to dispose of */
>  	cpuhp_ap_report_dead();
> @@ -898,14 +898,14 @@ void __noreturn arm64_nmi_cpu_stop(struct pt_regs *regs, bool die_on_crash)
>  	bool crash = IS_ENABLED(CONFIG_KEXEC_CORE) && crash_stop;
>  
>  	/*
> -	 * Use local_daif_mask() instead of local_irq_disable() to make sure
> +	 * Use local_exceptions_final_mask() instead of local_irq_disable() to make sure
>  	 * that pseudo-NMIs are disabled. The "stop" code starts with an IRQ
>  	 * and falls back to NMI (which might be pseudo). If the IRQ finally
>  	 * goes through right as we're timing out then the NMI could interrupt
>  	 * us. It's better to prevent the NMI and let the IRQ finish since the
>  	 * pt_regs will be better.
>  	 */
> -	local_daif_mask();
> +	local_exceptions_final_mask();
>  
>  #ifdef CONFIG_KEXEC_CORE
>  	if (crash && regs)
> diff --git a/arch/arm64/kernel/suspend.c b/arch/arm64/kernel/suspend.c
> index c41724a40b75..61012b783279 100644
> --- a/arch/arm64/kernel/suspend.c
> +++ b/arch/arm64/kernel/suspend.c
> @@ -9,7 +9,7 @@
>  #include <asm/cacheflush.h>
>  #include <asm/cpufeature.h>
>  #include <asm/cpuidle.h>
> -#include <asm/daifflags.h>
> +#include <asm/interrupts/masking.h>
>  #include <asm/debug-monitors.h>
>  #include <asm/exec.h>
>  #include <asm/fpsimd.h>
> @@ -69,7 +69,7 @@ void notrace __cpu_suspend_exit(void)
>  	/*
>  	 * Restore HW breakpoint registers to sane values
>  	 * before debug exceptions are possibly reenabled
> -	 * by cpu_suspend()s local_daif_restore() call.
> +	 * by cpu_suspend()s local_exceptions_restore() call.
>  	 */
>  	if (hw_breakpoint_restore)
>  		hw_breakpoint_restore(cpu);
> @@ -97,7 +97,7 @@ void notrace __cpu_suspend_exit(void)
>  int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
>  {
>  	int ret = 0;
> -	unsigned long flags;
> +	arm64_exc_hwstates_t hwstate;
>  	struct sleep_stack_data state;
>  
>  	/*
> @@ -119,12 +119,12 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
>  	 *
>  	 * Strictly speaking the trace_hardirqs_off() here is superfluous,
>  	 * hardirqs should be firmly off by now. This really ought to use
> -	 * something like raw_local_daif_save().
> +	 * something like raw_local_exceptions_save_mask().
>  	 *
>  	 * This also unmasks interrupts in PMR in order to reliably
>  	 * resume if we're using pseudo-NMIs.
>  	 */
> -	flags = local_daif_save();
> +	hwstate = local_exceptions_save_mask(CRITICAL_CONTEXT);
>  
>  	/*
>  	 * Function graph tracer state gets inconsistent when the kernel
> @@ -158,11 +158,11 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
>  	unpause_graph_tracing();
>  
>  	/*
> -	 * Restore pstate flags. OS lock and mdscr have been already
> +	 * Restore interrupt masks. OS lock and mdscr have been already
>  	 * restored, so from this point onwards, debugging is fully
>  	 * reenabled if it was enabled when core started shutdown.
>  	 */
> -	local_daif_restore(flags);
> +	local_exceptions_restore(hwstate);
>  
>  	return ret;
>  }
> diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
> index 7318e3e6a5f3..50566b455c80 100644
> --- a/arch/arm64/kvm/hyp/nvhe/switch.c
> +++ b/arch/arm64/kvm/hyp/nvhe/switch.c
> @@ -270,7 +270,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
>  	 * Naturally, we want to avoid this.
>  	 */
>  	if (system_uses_irq_prio_masking()) {
> -		gic_write_pmr(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET);
> +		gic_write_pmr(GIC_PRIO_IRQON);
>  		pmr_sync();
>  	}
>  
> diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> index 74d4a509f1de..ee0d829a0642 100644
> --- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
> +++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> @@ -10,6 +10,7 @@
>  #include <linux/irqchip/arm-gic-v3.h>
>  #include <linux/kvm_host.h>
>  
> +#include <asm/interrupts/masking.h>
>  #include <asm/kvm_emulate.h>
>  #include <asm/kvm_hyp.h>
>  #include <asm/kvm_mmu.h>
> @@ -440,8 +441,8 @@ void __vgic_v3_init_lrs(void)
>  /* Return true if GICv3 is MMIO (GICv2) capable, false otherwise */
>  bool __vgic_v3_get_gic_config(void)
>  {
> +	arm64_exc_hwstates_t hwstate;
>  	u64 val, sre;
> -	unsigned long flags = 0;
>  
>  	sre = read_gicreg(ICC_SRE_EL1);
>  	/*
> @@ -462,7 +463,7 @@ bool __vgic_v3_get_gic_config(void)
>  	 * of the exception entry to EL2.
>  	 */
>  	if (has_vhe()) {
> -		flags = local_daif_save();
> +		hwstate = local_exceptions_save_mask(CRITICAL_CONTEXT);
>  	} else {
>  		sysreg_clear_set_hcr(0, HCR_AMO | HCR_FMO | HCR_IMO);
>  		isb();
> @@ -477,7 +478,7 @@ bool __vgic_v3_get_gic_config(void)
>  	isb();
>  
>  	if (has_vhe()) {
> -		local_daif_restore(flags);
> +		local_exceptions_restore(hwstate);
>  	} else {
>  		sysreg_clear_set_hcr(HCR_AMO | HCR_FMO | HCR_IMO, 0);
>  		isb();
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index 7875911c0506..11d9feea7d20 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -17,6 +17,7 @@
>  
>  #include <asm/barrier.h>
>  #include <asm/cpufeature.h>
> +#include <asm/interrupts/masking.h>
>  #include <asm/kprobes.h>
>  #include <asm/kvm_asm.h>
>  #include <asm/kvm_emulate.h>
> @@ -661,9 +662,10 @@ NOKPROBE_SYMBOL(__kvm_vcpu_run_vhe);
>  
>  int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
>  {
> +	arm64_exc_hwstates_t hwstate;
>  	int ret;
>  
> -	local_daif_mask();
> +	hwstate = local_exceptions_save_mask(CRITICAL_CONTEXT);
>  
>  	/*
>  	 * Having IRQs masked via PMR when entering the guest means the GIC
> @@ -671,18 +673,18 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
>  	 * only way to get out will be via guest exceptions.
>  	 * Naturally, we want to avoid this.
>  	 *
> -	 * local_daif_mask() already sets GIC_PRIO_PSR_I_SET, we just need a
> -	 * dsb to ensure the redistributor is forwards EL2 IRQs to the CPU.
> +	 * local_exceptions_save_mask(), via helpers, sets
> +	 * GIC_PRIO_IRQON along with pmr_sync(), so we can be shure
> +	 * that redistributor forwards EL2 IRQs to the CPU.
>  	 */
> -	pmr_sync();
>  
>  	ret = __kvm_vcpu_run_vhe(vcpu);
>  
>  	/*
> -	 * local_daif_restore() takes care to properly restore PSTATE.DAIF
> +	 * local_exceptions_restore() takes care to properly restore PSTATE.DAIF
>  	 * and the GIC PMR if the host is using IRQ priorities.
>  	 */
> -	local_daif_restore(DAIF_PROCCTX_NOIRQ);
> +	local_exceptions_restore(hwstate);
>  
>  	return ret;
>  }
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 79d90226fd5d..abe89b60a64a 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -33,6 +33,7 @@
>  
>  #include <asm/barrier.h>
>  #include <asm/cputype.h>
> +#include <asm/interrupts/masking.h>
>  #include <asm/fixmap.h>
>  #include <asm/kasan.h>
>  #include <asm/kernel-pgtable.h>
> @@ -2329,7 +2330,7 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
>  	typedef void (ttbr_replace_func)(phys_addr_t);
>  	extern ttbr_replace_func idmap_cpu_replace_ttbr1;
>  	ttbr_replace_func *replace_phys;
> -	unsigned long daif;
> +	arm64_exc_hwstates_t hwstate;
>  
>  	/* phys_to_ttbr() zeros lower 2 bits of ttbr with 52-bit PA */
>  	phys_addr_t ttbr1 = phys_to_ttbr(virt_to_phys(pgdp));
> @@ -2345,9 +2346,9 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
>  	 * We really don't want to take *any* exceptions while TTBR1 is
>  	 * in the process of being replaced so mask everything.
>  	 */
> -	daif = local_daif_save();
> +	hwstate = local_exceptions_save_mask(CRITICAL_CONTEXT);
>  	replace_phys(ttbr1);
> -	local_daif_restore(daif);
> +	local_exceptions_restore(hwstate);
>  
>  	cpu_uninstall_idmap();
>  }


