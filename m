Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E855C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUaEJS35ELgIxj/ni27451vAn9uwK4zks0H3xhMjTkA=; b=FqT97JF5qy3IfcaivSCvMLRJXD
	s1duFLVYhtE/Y7ikWGDwR4ipfuGbTHSiEo/Fk/ngwVhiK7OYuBOe9UmcI+ToZEEZ88u2sIQLQfsYl
	YJmcIYrXMHLz6TCZ+pXYh39vN1yaf37TeV6mn451CflP4VKJH7zG1ypP6JN5ECA835NoI6FFhE/wn
	39HRqWy95e/ePF1Po1vSULmS4rKufPvn2Y7YRKJmTiCqloMvAaj+q/R2FQ05I20PTkwzbskfYgsHE
	SZCrhqlWMuCfuvNEkICm0SaP8SQblgUpgAaacg9o4gNF/HICdS5q/ZPH5Idz3e3Z226jA3rvcFQZu
	0ZXQdZOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8efz-00000002LGc-23G6;
	Mon, 21 Sep 2026 14:07:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8efw-00000002LFb-2COa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:07:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64B59176C;
	Mon, 21 Sep 2026 07:07:15 -0700 (PDT)
Received: from [10.0.152.207] (e121487-lin.carmbridge.arm.com [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C55AC3F86C;
	Mon, 21 Sep 2026 07:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789999638; bh=RJq2MhLOQ6DmnvxETI+mhPUf+pRm6eJKme0yx1nM3x8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fwvabSFNdi6+QQYhQ+cMw7fmbpDZShzAiKloApw8mrRJxtQhY19bgPXoUfhDlL3Mk
	 /eTqjI9eUqplxOEuFeqZ3iqlcsQNOdGNWHVcu10xHH0+8JHJQaB4kHBTuE94kiA2vO
	 Ths+2vadhUQstUZCquPXU3XUP/5Rz8aav3raXJuI=
Message-ID: <b8f1e057-ef42-4673-9d7f-ee3bed005185@arm.com>
Date: Mon, 21 Sep 2026 15:07:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/38] arm64: replace local_daif helpers
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 maz@kernel.org, lpieralisi@kernel.org, liaochang1@huawei.com
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-10-vladimir.murzin@arm.com>
 <96fc2985-a4a2-4f07-8f27-603d876e0fea@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <96fc2985-a4a2-4f07-8f27-603d876e0fea@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_070720_657579_9CB6CCD7 
X-CRM114-Status: GOOD (  22.61  )
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

On 9/17/26 09:14, Jinjie Ruan wrote:
> 
> 在 2026/9/14 18:20, Vladimir Murzin 写道:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> Replace existing `local_daif_...` usage with the new `local_all_irqs...`
>> helpers, adding the necessary save-state struct where required.
>>
>> Slightly rework `apei_claim_sea()`'s handling of interrupt masking to
>> fit with the new APIs.  Currently, it saves the DAIF flags to restore
>> later and the `local_irq` ones to check if interrupts are disabled.
>> It then masks AIF to signal the SEA (forcing DAIF masking), and will
>> unmask to IF (re-enabling PMR masking if pseudo-NMIs are in use) if it
>> interrupted a task with interrupts unmaksed, restoring with the DAIF
>> flags from the beginning afterwards.
>>
>> As we want to preserve a "mask/unmask" process, change the logic from
>> "mask AIF/unmask A/unmask IF" to "mask IF/mask A/unmask A/unmask IF" :
>> first mask with `local_irq_save()`, mask/unmask further around the
>> SEA signaling, and restore at the end with `local_irq_restore()`.
>> Now that both APIs properly work with DAIF and PMR, this works
>> as expected and also removes the need for a "save flags without masking"
>> function for the new helpers, as this was the only user.
>>
>> Remove the use of GIC_PRIO_PSR_I_SET in `kvm/hyp/nvhe/switch.c`,
>> as we now check both PMR and DAIF everywhere and we don't need to signal
>> interrupts being masked in DAIF in the PMR anymore.
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/kernel/acpi.c          | 15 +++++++--------
>>  arch/arm64/kernel/hibernate.c     | 14 +++++++-------
>>  arch/arm64/kernel/machine_kexec.c |  4 ++--
>>  arch/arm64/kernel/setup.c         |  4 ++--
>>  arch/arm64/kernel/smp.c           | 10 +++++-----
>>  arch/arm64/kernel/suspend.c       | 14 +++++++-------
>>  arch/arm64/kvm/hyp/nvhe/switch.c  |  2 +-
>>  arch/arm64/kvm/hyp/vgic-v3-sr.c   |  7 ++++---
>>  arch/arm64/kvm/hyp/vhe/switch.c   | 14 ++++++++------
>>  arch/arm64/mm/mmu.c               |  7 ++++---
>>  10 files changed, 47 insertions(+), 44 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
>> index 681aa2bbc399..ea9a9da7e412 100644
>> --- a/arch/arm64/kernel/acpi.c
>> +++ b/arch/arm64/kernel/acpi.c
>> @@ -33,7 +33,7 @@
>>  #include <acpi/processor.h>
>>  #include <asm/cputype.h>
>>  #include <asm/cpu_ops.h>
>> -#include <asm/daifflags.h>
>> +#include <asm/interrupts/masking.h>
>>  #include <asm/smp_plat.h>
>>  
>>  int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
>> @@ -391,15 +391,14 @@ int apei_claim_sea(struct pt_regs *regs)
>>  	int err = -ENOENT;
>>  	bool return_to_irqs_enabled;
>>  	unsigned long current_flags;
>> +	arm64_exc_hwstates_t hwstate;
>>  
>>  	if (!IS_ENABLED(CONFIG_ACPI_APEI_GHES))
>>  		return err;
>>  
>> -	current_flags = local_daif_save_flags();
>> -
>> -	/* current_flags isn't useful here as daif doesn't tell us about pNMI */
>> -	return_to_irqs_enabled = !irqs_disabled_flags(arch_local_save_flags());
>> +	local_irq_save(current_flags);
>>  
>> +	return_to_irqs_enabled = !irqs_disabled_flags(current_flags);
>>  	if (regs)
>>  		return_to_irqs_enabled = !regs_irqs_disabled(regs);
>>  
>> @@ -407,10 +406,11 @@ int apei_claim_sea(struct pt_regs *regs)
>>  	 * SEA can interrupt SError, mask it and describe this as an NMI so
>>  	 * that APEI defers the handling.
>>  	 */
>> -	local_daif_restore(DAIF_ERRCTX);
>> +	hwstate = local_exceptions_save_mask(ERROR_CONTEXT);
>>  	nmi_enter();
>>  	err = ghes_notify_sea();
>>  	nmi_exit();
>> +	local_exceptions_restore(hwstate);
> Hi Vladimir,
> 
> I think mixing local_irq_save()/local_irq_restore() and
> local_exceptions_save_mask()/local_exceptions_restore here may be
> problematic, because arch_local_irq_save() does not take into full
> account the state of DAIF and the pseudo-NMI. For example, when the
> pseudo-NMI is enabled, arch_local_irq_save() only sets PMR to
> GIC_PRIO_IRQOFF without taking DAIF into consideration, whereas
> local_exceptions_save_mask(NOIRQ_CONTEXT) additionally clears all the
> DAIF bits.
> 
> But whereas local_exceptions_save_mask() returns exactly the current
> hwstate arch_local_irq_save() sets, and local_exceptions_restore() also
> needs to restore a unified state.
> 

Hi Jinjie,

Yeah, that nesting makes my head spin. Would it be cleaner to apply
the masking sequentially, something like:

int apei_claim_sea(struct pt_regs *regs)
{
	arm64_exc_hwstates_t hwstate;
	bool irqs_disabled;
	int err = -ENOENT;

	if (!IS_ENABLED(CONFIG_ACPI_APEI_GHES))
		return err;

	/*
	 * SEA can interrupt SError, mask it and describe this as an NMI so
	 * that APEI defers the handling.
	 */
	hwstate = local_exceptions_save_mask(ERROR_CONTEXT);
	nmi_enter();
	err = ghes_notify_sea();
	nmi_exit();
	local_exceptions_restore(hwstate);

	if (err)
		return err;

	/*
	 * APEI NMI-like notifications are deferred to irq_work. Unless
	 * we interrupted irqs-masked code, we can do that now.
	 */
	irqs_disabled = regs ? regs_irqs_disabled(regs) : arch_irqs_disabled_flags(hwstate.saved.flags);

	if (!irqs_disabled) {
		hwstate = local_exceptions_save_mask(NOIRQ_CONTEXT);
		__irq_enter();
		irq_work_run();
		__irq_exit();
		local_exceptions_restore(hwstate);
	} else {
		pr_warn_ratelimited("APEI work queued but not completed\n");
		err = -EINPROGRESS;
	}

	return err;
}


Cheers
Vladimir

> Best regards,
> Jinjie
> 
>>  
>>  	/*
>>  	 * APEI NMI-like notifications are deferred to irq_work. Unless
>> @@ -418,7 +418,6 @@ int apei_claim_sea(struct pt_regs *regs)
>>  	 */
>>  	if (!err) {
>>  		if (return_to_irqs_enabled) {
>> -			local_daif_restore(DAIF_PROCCTX_NOIRQ);
>>  			__irq_enter();
>>  			irq_work_run();
>>  			__irq_exit();
>> @@ -428,7 +427,7 @@ int apei_claim_sea(struct pt_regs *regs)
>>  		}
>>  	}
>>  
>> -	local_daif_restore(current_flags);
>> +	local_irq_restore(current_flags);
>>  
>>  	return err;
>>  }

