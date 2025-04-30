Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9D5C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnq3OLYaF+K0sVWrSL5fn61Vue0Rlx0kE9aNbGR/m3o=; b=hzAmhNtM1PvsKv3RULxQx93Snv
	M517vXEvWlqlpCVkfEEPNG5GetkGQAiu+/qbJh1F5h5uGfmuHn3chOw0kiALRCAS2Y7qMD3H0zRo5
	qsngqbiVSAsbEWz2wex2gFwFq+wNGpQz4MpWlVQsYF60qnVo3+3oveG6f+XXGhclLNHWCvzSu5F3r
	XxCT0a8pgfS8W9ZL1UaRbTawkHbqlt2y3hnaorNibHSqKOFgfCKrd3AHntI3+cwvIRoc7DNO5bbNn
	uimnp5Xgaarn8gXGh5oUJmyiF8RDe26PcyEOe0oa4RdrAUWmnM3V9u16vAmxncUyxG80Z3HHqjeeF
	OsZP2W0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA64r-0000000Cl8z-3yja;
	Wed, 30 Apr 2025 11:58:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA624-0000000Ckg4-08Wa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 11:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746014118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xnq3OLYaF+K0sVWrSL5fn61Vue0Rlx0kE9aNbGR/m3o=;
	b=hqo66fjqHxSNZsMrkpDZbBeup3GzgLger3sHX/UroVW0Ncb9XRvMBco+/g4SjwmWkIBDl7
	vvvlVKCZfwwpFVSBgUFPZ0ybP8QTouU144pOhD+EjqccCUFK7mTkH8myLGmoAM0stUDbF2
	SAbspEvGzWUeO7ab6W/wR5siuyqILz4=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-A9zsBiW5PuGmDEDxdoGcQQ-1; Wed, 30 Apr 2025 07:55:16 -0400
X-MC-Unique: A9zsBiW5PuGmDEDxdoGcQQ-1
X-Mimecast-MFC-AGG-ID: A9zsBiW5PuGmDEDxdoGcQQ_1746014115
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-739515de999so5556808b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 04:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746014115; x=1746618915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xnq3OLYaF+K0sVWrSL5fn61Vue0Rlx0kE9aNbGR/m3o=;
        b=DYznib5oDlSkhOdy+/4CRuyrbtn2UGf2m6UUPlnK1qDmjKxWjN9cqxiTB89ewNlUYU
         4Bs6kN7kpgTjFggaXLBRWqY86026X+epv6l5TKkpb1j6r0Tnwq6eAwSbXMrs+PdWpJam
         IeSuz+GQHikAqhqeTKbNYmwX/LgLWElr5qZmSTbxPmtzMiQ7NqOGeRv45veqPRKVG305
         QD6Mftl66zQ59a6bKfXUXAozX/jWdw/k9eXhWbr4bIzzJTnFSVCrS+gMIKOuNjEtiXCz
         EFS5d+FtsC6xtvqn/znA+on/lhs5yhgkjAXjoocdxoDpn7PSccuPe80ZkEu0jINWqr4O
         /00w==
X-Forwarded-Encrypted: i=1; AJvYcCUV9ueD/KeF+Q6HAHtu57ERz71FlpunErPGWd0ovITtXf7nSx4N0QOMVvQIj5DxK6eiXekQhtdb/AG+L3h9QQsG@lists.infradead.org
X-Gm-Message-State: AOJu0YwYUmTdD8vahsdNieCC2p/AX+Qdwn4TQzCJQXz47AYpRIsSmP/I
	1sog3PRGM9Oo88k/djAZ/Kbu/imcFuZOKbqEa8Ys1ShwR7ug3VIpcJT2HnqQ9OnuxaZa4i7wBjj
	ZQ3EnxCcTgsD1hOhixUI5j1yMJ0Lw3Sq633xT5wUqwnbfG6Z76hK8FzCZy2isoUIVeF4VzNJA
X-Gm-Gg: ASbGncuJNOmtCWMbEh9ZabMRfld0XrWzzeCZWOUsD/YYTvli6MzMvhRxhOdgBLgeeGs
	+Ga1E2YAJ9W/11yopbvfDS++LduqFa5mSmpKbK/GSSyJRQZvCtxqIk4vYWBOmCAX75ROFBTANo7
	2Ju64aQ8BlIb1UtzIgGfHnFKth23GjgO4FTfSpGnBqOiYOYosPgggbA8Jsl+UFrKVeexAqyo8VY
	CTPsxuqnemEroj2v2gPaCYrQyn+OuK3se6vnllFmPZqS+XNAHvGuO7th4EOG+Juip6d+dNGJ7F0
	yfXrpWrOB1DF
X-Received: by 2002:a05:6a00:1414:b0:72f:590f:2859 with SMTP id d2e1a72fcca58-740389ba998mr3850413b3a.13.1746014115270;
        Wed, 30 Apr 2025 04:55:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSfuAYjpYj51WsKtmoHkz37YKpvduGHDsHCx97KPPTiCcp6hHFcIFol3aPI4I+SwKGgfY2og==
X-Received: by 2002:a05:6a00:1414:b0:72f:590f:2859 with SMTP id d2e1a72fcca58-740389ba998mr3850388b3a.13.1746014114855;
        Wed, 30 Apr 2025 04:55:14 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740398f982csm1420938b3a.21.2025.04.30.04.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 04:55:14 -0700 (PDT)
Message-ID: <e6a69a4a-8014-44b4-aef6-37afe0fa8d29@redhat.com>
Date: Wed, 30 Apr 2025 21:55:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/43] arm64: RME: Handle realm enter/exit
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-17-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-17-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iw0vz7LRFyI0zS9AKgMlfjGeEqu5BLPXaXF_FKQr29A_1746014115
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_045520_241654_B3D30E8A 
X-CRM114-Status: GOOD (  42.51  )
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

On 4/16/25 11:41 PM, Steven Price wrote:
> Entering a realm is done using a SMC call to the RMM. On exit the
> exit-codes need to be handled slightly differently to the normal KVM
> path so define our own functions for realm enter/exit and hook them
> in if the guest is a realm guest.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * A return of 0 from kvm_handle_sys_reg() doesn't mean the register has
>     been read (although that can never happen in the current code). Tidy
>     up the condition to handle any future refactoring.
> Changes since v6:
>   * Use vcpu_err() rather than pr_err/kvm_err when there is an associated
>     vcpu to the error.
>   * Return -EFAULT for KVM_EXIT_MEMORY_FAULT as per the documentation for
>     this exit type.
>   * Split code handling a RIPAS change triggered by the guest to the
>     following patch.
> Changes since v5:
>   * For a RIPAS_CHANGE request from the guest perform the actual RIPAS
>     change on next entry rather than immediately on the exit. This allows
>     the VMM to 'reject' a RIPAS change by refusing to continue
>     scheduling.
> Changes since v4:
>   * Rename handle_rme_exit() to handle_rec_exit()
>   * Move the loop to copy registers into the REC enter structure from the
>     to rec_exit_handlers callbacks to kvm_rec_enter(). This fixes a bug
>     where the handler exits to user space and user space wants to modify
>     the GPRS.
>   * Some code rearrangement in rec_exit_ripas_change().
> Changes since v2:
>   * realm_set_ipa_state() now provides an output parameter for the
>     top_iap that was changed. Use this to signal the VMM with the correct
>     range that has been transitioned.
>   * Adapt to previous patch changes.
> ---
>   arch/arm64/include/asm/kvm_rme.h |   3 +
>   arch/arm64/kvm/Makefile          |   2 +-
>   arch/arm64/kvm/arm.c             |  19 +++-
>   arch/arm64/kvm/rme-exit.c        | 170 +++++++++++++++++++++++++++++++
>   arch/arm64/kvm/rme.c             |  19 ++++
>   5 files changed, 207 insertions(+), 6 deletions(-)
>   create mode 100644 arch/arm64/kvm/rme-exit.c
> 

One nitpick below.

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
> index b916db8565a2..d86051ef0c5c 100644
> --- a/arch/arm64/include/asm/kvm_rme.h
> +++ b/arch/arm64/include/asm/kvm_rme.h
> @@ -101,6 +101,9 @@ void kvm_realm_destroy_rtts(struct kvm *kvm, u32 ia_bits);
>   int kvm_create_rec(struct kvm_vcpu *vcpu);
>   void kvm_destroy_rec(struct kvm_vcpu *vcpu);
>   
> +int kvm_rec_enter(struct kvm_vcpu *vcpu);
> +int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_status);
> +
>   void kvm_realm_unmap_range(struct kvm *kvm,
>   			   unsigned long ipa,
>   			   unsigned long size,
> diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
> index 2ebc66812d49..c4b10012faa3 100644
> --- a/arch/arm64/kvm/Makefile
> +++ b/arch/arm64/kvm/Makefile
> @@ -24,7 +24,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
>   	 vgic/vgic-mmio.o vgic/vgic-mmio-v2.o \
>   	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
>   	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o \
> -	 rme.o
> +	 rme.o rme-exit.o
>   
>   kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
>   kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 7c0bb1b05f4c..cf707130ef66 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1263,7 +1263,10 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>   		trace_kvm_entry(*vcpu_pc(vcpu));
>   		guest_timing_enter_irqoff();
>   
> -		ret = kvm_arm_vcpu_enter_exit(vcpu);
> +		if (vcpu_is_rec(vcpu))
> +			ret = kvm_rec_enter(vcpu);
> +		else
> +			ret = kvm_arm_vcpu_enter_exit(vcpu);
>   
>   		vcpu->mode = OUTSIDE_GUEST_MODE;
>   		vcpu->stat.exits++;
> @@ -1319,10 +1322,13 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>   
>   		local_irq_enable();
>   
> -		trace_kvm_exit(ret, kvm_vcpu_trap_get_class(vcpu), *vcpu_pc(vcpu));
> -
>   		/* Exit types that need handling before we can be preempted */
> -		handle_exit_early(vcpu, ret);
> +		if (!vcpu_is_rec(vcpu)) {
> +			trace_kvm_exit(ret, kvm_vcpu_trap_get_class(vcpu),
> +				       *vcpu_pc(vcpu));
> +
> +			handle_exit_early(vcpu, ret);
> +		}
>   
>   		preempt_enable();
>   
> @@ -1345,7 +1351,10 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>   			ret = ARM_EXCEPTION_IL;
>   		}
>   
> -		ret = handle_exit(vcpu, ret);
> +		if (vcpu_is_rec(vcpu))
> +			ret = handle_rec_exit(vcpu, ret);
> +		else
> +			ret = handle_exit(vcpu, ret);
>   	}
>   
>   	/* Tell userspace about in-kernel device output levels */
> diff --git a/arch/arm64/kvm/rme-exit.c b/arch/arm64/kvm/rme-exit.c
> new file mode 100644
> index 000000000000..a1adf5610455
> --- /dev/null
> +++ b/arch/arm64/kvm/rme-exit.c
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 ARM Ltd.
> + */
> +
> +#include <linux/kvm_host.h>
> +#include <kvm/arm_hypercalls.h>
> +#include <kvm/arm_psci.h>
> +
> +#include <asm/rmi_smc.h>
> +#include <asm/kvm_emulate.h>
> +#include <asm/kvm_rme.h>
> +#include <asm/kvm_mmu.h>
> +
> +typedef int (*exit_handler_fn)(struct kvm_vcpu *vcpu);
> +
> +static int rec_exit_reason_notimpl(struct kvm_vcpu *vcpu)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +
> +	vcpu_err(vcpu, "Unhandled exit reason from realm (ESR: %#llx)\n",
> +		 rec->run->exit.esr);
> +	return -ENXIO;
> +}
> +
> +static int rec_exit_sync_dabt(struct kvm_vcpu *vcpu)
> +{
> +	return kvm_handle_guest_abort(vcpu);
> +}
> +
> +static int rec_exit_sync_iabt(struct kvm_vcpu *vcpu)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +
> +	vcpu_err(vcpu, "Unhandled instruction abort (ESR: %#llx).\n",
> +		 rec->run->exit.esr);
> +	return -ENXIO;
> +}
> +
> +static int rec_exit_sys_reg(struct kvm_vcpu *vcpu)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +	unsigned long esr = kvm_vcpu_get_esr(vcpu);
> +	int rt = kvm_vcpu_sys_get_rt(vcpu);
> +	bool is_write = !(esr & 1);
> +	int ret;
> +
> +	if (is_write)
> +		vcpu_set_reg(vcpu, rt, rec->run->exit.gprs[0]);
> +
> +	ret = kvm_handle_sys_reg(vcpu);
> +	if (ret > 0 && !is_write)
> +		rec->run->enter.gprs[0] = vcpu_get_reg(vcpu, rt);

kvm_handle_sys_reg() always returns positive value, so it can be:

	if (!is_write)
		rc->run->enter.gprs[0] = vcpu_get_reg(vcpu, rt);

> +
> +	return ret;
> +}
> +
> +static exit_handler_fn rec_exit_handlers[] = {
> +	[0 ... ESR_ELx_EC_MAX]	= rec_exit_reason_notimpl,
> +	[ESR_ELx_EC_SYS64]	= rec_exit_sys_reg,
> +	[ESR_ELx_EC_DABT_LOW]	= rec_exit_sync_dabt,
> +	[ESR_ELx_EC_IABT_LOW]	= rec_exit_sync_iabt
> +};
> +
> +static int rec_exit_psci(struct kvm_vcpu *vcpu)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +	int i;
> +
> +	for (i = 0; i < REC_RUN_GPRS; i++)
> +		vcpu_set_reg(vcpu, i, rec->run->exit.gprs[i]);
> +
> +	return kvm_smccc_call_handler(vcpu);
> +}
> +
> +static int rec_exit_ripas_change(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm *kvm = vcpu->kvm;
> +	struct realm *realm = &kvm->arch.realm;
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +	unsigned long base = rec->run->exit.ripas_base;
> +	unsigned long top = rec->run->exit.ripas_top;
> +	unsigned long ripas = rec->run->exit.ripas_value;
> +
> +	if (!kvm_realm_is_private_address(realm, base) ||
> +	    !kvm_realm_is_private_address(realm, top - 1)) {
> +		vcpu_err(vcpu, "Invalid RIPAS_CHANGE for %#lx - %#lx, ripas: %#lx\n",
> +			 base, top, ripas);
> +		return -EINVAL;
> +	}
> +
> +	/* Exit to VMM, the actual RIPAS change is done on next entry */
> +	kvm_prepare_memory_fault_exit(vcpu, base, top - base, false, false,
> +				      ripas == RMI_RAM);
> +
> +	/*
> +	 * KVM_EXIT_MEMORY_FAULT requires an return code of -EFAULT, see the
> +	 * API documentation
> +	 */
> +	return -EFAULT;
> +}
> +
> +static void update_arch_timer_irq_lines(struct kvm_vcpu *vcpu)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +
> +	__vcpu_sys_reg(vcpu, CNTV_CTL_EL0) = rec->run->exit.cntv_ctl;
> +	__vcpu_sys_reg(vcpu, CNTV_CVAL_EL0) = rec->run->exit.cntv_cval;
> +	__vcpu_sys_reg(vcpu, CNTP_CTL_EL0) = rec->run->exit.cntp_ctl;
> +	__vcpu_sys_reg(vcpu, CNTP_CVAL_EL0) = rec->run->exit.cntp_cval;
> +
> +	kvm_realm_timers_update(vcpu);
> +}
> +
> +/*
> + * Return > 0 to return to guest, < 0 on error, 0 (and set exit_reason) on
> + * proper exit to userspace.
> + */
> +int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +	u8 esr_ec = ESR_ELx_EC(rec->run->exit.esr);
> +	unsigned long status, index;
> +
> +	status = RMI_RETURN_STATUS(rec_run_ret);
> +	index = RMI_RETURN_INDEX(rec_run_ret);
> +
> +	/*
> +	 * If a PSCI_SYSTEM_OFF request raced with a vcpu executing, we might
> +	 * see the following status code and index indicating an attempt to run
> +	 * a REC when the RD state is SYSTEM_OFF.  In this case, we just need to
> +	 * return to user space which can deal with the system event or will try
> +	 * to run the KVM VCPU again, at which point we will no longer attempt
> +	 * to enter the Realm because we will have a sleep request pending on
> +	 * the VCPU as a result of KVM's PSCI handling.
> +	 */
> +	if (status == RMI_ERROR_REALM && index == 1) {
> +		vcpu->run->exit_reason = KVM_EXIT_UNKNOWN;
> +		return 0;
> +	}
> +
> +	if (rec_run_ret)
> +		return -ENXIO;
> +
> +	vcpu->arch.fault.esr_el2 = rec->run->exit.esr;
> +	vcpu->arch.fault.far_el2 = rec->run->exit.far;
> +	vcpu->arch.fault.hpfar_el2 = rec->run->exit.hpfar;
> +
> +	update_arch_timer_irq_lines(vcpu);
> +
> +	/* Reset the emulation flags for the next run of the REC */
> +	rec->run->enter.flags = 0;
> +
> +	switch (rec->run->exit.exit_reason) {
> +	case RMI_EXIT_SYNC:
> +		return rec_exit_handlers[esr_ec](vcpu);
> +	case RMI_EXIT_IRQ:
> +	case RMI_EXIT_FIQ:
> +		return 1;
> +	case RMI_EXIT_PSCI:
> +		return rec_exit_psci(vcpu);
> +	case RMI_EXIT_RIPAS_CHANGE:
> +		return rec_exit_ripas_change(vcpu);
> +	}
> +
> +	kvm_pr_unimpl("Unsupported exit reason: %u\n",
> +		      rec->run->exit.exit_reason);
> +	vcpu->run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
> +	return 0;
> +}
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index 33eb793d8bdb..bee9dfe12e03 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -863,6 +863,25 @@ void kvm_destroy_realm(struct kvm *kvm)
>   	kvm_free_stage2_pgd(&kvm->arch.mmu);
>   }
>   
> +int kvm_rec_enter(struct kvm_vcpu *vcpu)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +
> +	switch (rec->run->exit.exit_reason) {
> +	case RMI_EXIT_HOST_CALL:
> +	case RMI_EXIT_PSCI:
> +		for (int i = 0; i < REC_RUN_GPRS; i++)
> +			rec->run->enter.gprs[i] = vcpu_get_reg(vcpu, i);
> +		break;
> +	}
> +
> +	if (kvm_realm_state(vcpu->kvm) != REALM_STATE_ACTIVE)
> +		return -EINVAL;
> +
> +	return rmi_rec_enter(virt_to_phys(rec->rec_page),
> +			     virt_to_phys(rec->run));
> +}
> +
>   static void free_rec_aux(struct page **aux_pages,
>   			 unsigned int num_aux)
>   {

Thanks,
Gavin


