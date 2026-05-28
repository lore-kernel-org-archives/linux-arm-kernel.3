Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFEBCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 04:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXQOc51jw9CbTzkn1dp+Gluq7g3RzHfKmC/71EKuA3w=; b=ylhTwcF24jvdf92uAJKsw0/wSp
	UBWcu0EPGqElKf9sYK9r0vgKfURgoSsQXEAgOnY7180jc9S2fnC9+OB2dx5R6C7B53YJKnMez4lMS
	ioN+HuFOWzRsBSQDWcKqH1LkJYZPp5Z796LwYKWmM+FHelvGXaLWgbCsW4ryxmoZM+By7xEBw8qTm
	7Mo4a97b+c8dpZIJqZDLq4zvOBsilXlur+5muN0eq8QLTZqBNMcvIThnrCDiZsCXida3rDIBu6rWr
	uZ9cz0DmvHnLhQFMQM9u5wAZllWOmcoVxe0Dyk4uneNirq782bdb77PQXaQ40t8L0tidzUvaAHBF3
	2uhd2lfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSSWj-000000056ri-245u;
	Thu, 28 May 2026 04:39:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSSWg-000000056r8-2bYQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 04:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779943161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jXQOc51jw9CbTzkn1dp+Gluq7g3RzHfKmC/71EKuA3w=;
	b=ammU1tnlGjmt12zp1NUkdFMPH2OpV4r0eoJtmXepTZdyyDWzTDCJB0w/XnKIXioBil4F3R
	fd8+MusdYMDMROO9ET2uIdYjSZ5MCSEWFCkq0kd6njix8VvntCmtTOCVowsnlJvWIU2qUo
	Tb6+F8IfNF5ZW0FzUPYQHVDxWsR49Ro=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-S2c9ZRaPPBqXbTqmPaM9zw-1; Thu, 28 May 2026 00:39:15 -0400
X-MC-Unique: S2c9ZRaPPBqXbTqmPaM9zw-1
X-Mimecast-MFC-AGG-ID: S2c9ZRaPPBqXbTqmPaM9zw_1779943155
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3662668b825so6292398a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 21:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779943154; x=1780547954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXQOc51jw9CbTzkn1dp+Gluq7g3RzHfKmC/71EKuA3w=;
        b=joF5eCU0RnlMST2mYFE8n178QY1NYiuHVfkqm3f/dD6J2DY4mdMQLYjpwGkO7/chaR
         ft52Qna/afvJaXF+0qeyF63cXemdHJHoSMmVr+5VMjqejL3GsZe+cp8SMouICPnd7X49
         tPphW0MFbikFpRDolPOg9mr1v65u2flfriVZRkcSVcL8G6J1xA2REPGob6sgkJ/IK6yx
         6VxlwqZUHVMUvppMbFgy90H1i+J8/vGWazBGA3s6pqYWro/q91DEDaDQwM0VNQzLcpYV
         2IY3jsghNDsWQMUW8FTnrSlgZ/+dq3jj4EGntv7k0AZipQ9eHjprXwbIusHys53oTQNc
         kBkw==
X-Forwarded-Encrypted: i=1; AFNElJ81dk7OgKEhx/Mx67gtqyOHOK/eBSQiGp6dzzjPWt54lWu/cb6qL0CMYSlZMuahgFEt9MHWms1fR2DoiiZJHE05@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+rLA+Ulx6wkhIwp2XELC+lpDNU1AmG2N5CrCjLU05d6NHiIep
	URdOWT4Iehzkps619FSX/p6r3CJvXn+3BvJKc0WAC3Nx/R19ggsA/J2T4zIdiFrQWXr7Oy6RUY0
	ZcB5zgWAcMXgpcXGRfGj8lOZUZZBz3JMIP4KkV34eYiwiVTICWBDAx1ipNkA5e0+cJpaeRi24MT
	JQ
X-Gm-Gg: Acq92OFqAFKOrjWI1KaxLoq9m4F89/jM57c4ZxeQCUWwmMVRWWrS6tnjbUrDdn7f5rN
	MA6fjdPO64gpTHoXf6jX5fwNedr9KyNXLaEgi5JKzSBa0ASQBd98Yvm32Pvpf6wxwWdwuNUx0sf
	w2DS6vajt3s2zSS6OukmgJfPeqWyogwzDXQLSFqZHXSkVBUaFlhIxM3X767WeNHuzkevUIRTv7X
	A4NkQDX4rJqV5KIvVfgqb7P9IGp36V2W1grvL3YK5IVk/kGym09EW+tq0PLqgkddCl2e/TZmAA3
	ivOKP4IsJTR15yOqwO7jpaPrEYO4mqaazFvfQM1EzJ9R14ahI5XTBtGIZtHmIFhRDAUFmifn49V
	E9WzBxEdLf8udnuu3oqJdeOj1wqkvOFId3InrOu4dY41r4hsN7+Modg0IawDgAxRgEx3mIZO6JE
	Y=
X-Received: by 2002:a17:90b:2e8c:b0:368:a297:bd38 with SMTP id 98e67ed59e1d1-36a67704b2cmr24847553a91.7.1779943154543;
        Wed, 27 May 2026 21:39:14 -0700 (PDT)
X-Received: by 2002:a17:90b:2e8c:b0:368:a297:bd38 with SMTP id 98e67ed59e1d1-36a67704b2cmr24847511a91.7.1779943153881;
        Wed, 27 May 2026 21:39:13 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b90d23ef2sm463249a91.17.2026.05.27.21.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 21:39:13 -0700 (PDT)
Message-ID: <e6cb82fc-a8be-49d3-8fa3-0107c8ab97f7@redhat.com>
Date: Thu, 28 May 2026 14:38:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 22/44] arm64: RMI: Handle realm enter/exit
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-23-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260513131757.116630-23-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2DoBE_rViHxzhdnxrazWhnzGNPdZzuWi1FdSuPJ-Q_I_1779943155
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_213922_820692_3CC66FED 
X-CRM114-Status: GOOD (  45.75  )
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

Hi Steve,

On 5/13/26 11:17 PM, Steven Price wrote:
> Entering a realm is done using a SMC call to the RMM. On exit the
> exit-codes need to be handled slightly differently to the normal KVM
> path so define our own functions for realm enter/exit and hook them
> in if the guest is a realm guest.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> ---
> Chanegs since v13:
>   * The RMM is now required to provide an ESR value with the correct
>     information to emulate MMIO, so we no longer need to hardcode 0s in
>     rec_exit_sys_reg().
>   * The PSCI changes mean that there is a potential race when turning on
>     a VCPU which can cause a RMI_ERROR_REC return. Exit to user space
>     with -EAGAIN in this case.
> Changes since v12:
>   * Call guest_state_{enter,exit}_irqoff() around rmi_rec_enter().
>   * Add handling of the IRQ exception case where IRQs need to be briefly
>     enabled before exiting guest timing.
> Changes since v8:
>   * Introduce kvm_rec_pre_enter() called before entering an atomic
>     section to handle operations that might require memory allocation
>     (specifically completing a RIPAS change introduced in a later patch).
>   * Updates to align with upstream changes to hpfar_el2 which now (ab)uses
>     HPFAR_EL2_NS as a valid flag.
>   * Fix exit reason when racing with PSCI shutdown to return
>     KVM_EXIT_SHUTDOWN rather than KVM_EXIT_UNKNOWN.
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
>   arch/arm64/include/asm/kvm_rmi.h |   4 +
>   arch/arm64/kvm/Makefile          |   2 +-
>   arch/arm64/kvm/arm.c             |  26 ++++-
>   arch/arm64/kvm/rmi-exit.c        | 186 +++++++++++++++++++++++++++++++
>   arch/arm64/kvm/rmi.c             |  42 +++++++
>   5 files changed, 254 insertions(+), 6 deletions(-)
>   create mode 100644 arch/arm64/kvm/rmi-exit.c
> 
> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
> index d99bf4fc3c39..feb534a6678e 100644
> --- a/arch/arm64/include/asm/kvm_rmi.h
> +++ b/arch/arm64/include/asm/kvm_rmi.h
> @@ -84,6 +84,10 @@ void kvm_destroy_realm(struct kvm *kvm);
>   void kvm_realm_destroy_rtts(struct kvm *kvm);
>   void kvm_destroy_rec(struct kvm_vcpu *vcpu);
>   
> +int kvm_rec_enter(struct kvm_vcpu *vcpu);
> +int kvm_rec_pre_enter(struct kvm_vcpu *vcpu);
> +int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_status);
> +
>   static inline bool kvm_realm_is_private_address(struct realm *realm,
>   						unsigned long addr)
>   {
> diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
> index ed3cf30eb06e..4a2d52fdb6a2 100644
> --- a/arch/arm64/kvm/Makefile
> +++ b/arch/arm64/kvm/Makefile
> @@ -16,7 +16,7 @@ CFLAGS_handle_exit.o += -Wno-override-init
>   kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
>   	 inject_fault.o va_layout.o handle_exit.o config.o \
>   	 guest.o debug.o reset.o sys_regs.o stacktrace.o \
> -	 vgic-sys-reg-v3.o fpsimd.o pkvm.o rmi.o \
> +	 vgic-sys-reg-v3.o fpsimd.o pkvm.o rmi.o rmi-exit.o \
>   	 arch_timer.o trng.o vmid.o emulate-nested.o nested.o at.o \
>   	 vgic/vgic.o vgic/vgic-init.o \
>   	 vgic/vgic-irqfd.o vgic/vgic-v2.o \
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 21d9dfdb1ea0..ed88a203b892 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1331,6 +1331,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>   		if (ret > 0)
>   			ret = check_vcpu_requests(vcpu);
>   
> +		if (ret > 0 && vcpu_is_rec(vcpu))
> +			ret = kvm_rec_pre_enter(vcpu);
> +
>   		/*
>   		 * Preparing the interrupts to be injected also
>   		 * involves poking the GIC, which must be done in a
> @@ -1378,7 +1381,10 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
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
> @@ -1424,7 +1430,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>   		 * context synchronization event) is necessary to ensure that
>   		 * pending interrupts are taken.
>   		 */
> -		if (ARM_EXCEPTION_CODE(ret) == ARM_EXCEPTION_IRQ) {
> +		if (ARM_EXCEPTION_CODE(ret) == ARM_EXCEPTION_IRQ ||
> +		    (vcpu_is_rec(vcpu) &&
> +		     vcpu->arch.rec.run->exit.exit_reason == RMI_EXIT_IRQ)) {
>   			local_irq_enable();
>   			isb();
>   			local_irq_disable();

The condition could be posssibly imprecise because ARM_EXCEPTION_CODE(ret)
can be ARM_EXCEPTION_IRQ even for a REC. So the precise condition would be:

		if ((!vcpu_is_rec(vcpu) && ARM_EXCEPTION_CODE(ret) == ARM_EXCEPTION_IRQ) ||
		    (vcpu_is_rec(vcpu) && vcpu->arch.rec.run->exit.exit_reason == RMI_EXIT_IRQ)) {

> @@ -1436,8 +1444,13 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>   
>   		trace_kvm_exit(ret, kvm_vcpu_trap_get_class(vcpu), *vcpu_pc(vcpu));
>   
> -		/* Exit types that need handling before we can be preempted */
> -		handle_exit_early(vcpu, ret);
> +		if (!vcpu_is_rec(vcpu)) {
> +			/*
> +			 * Exit types that need handling before we can be
> +			 * preempted
> +			 */
> +			handle_exit_early(vcpu, ret);
> +		}
>   
>   		kvm_nested_sync_hwstate(vcpu);
>   
> @@ -1462,7 +1475,10 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
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
> diff --git a/arch/arm64/kvm/rmi-exit.c b/arch/arm64/kvm/rmi-exit.c
> new file mode 100644
> index 000000000000..e7c51b6cf6ce
> --- /dev/null
> +++ b/arch/arm64/kvm/rmi-exit.c
> @@ -0,0 +1,186 @@
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
> +#include <asm/kvm_rmi.h>
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

s/rec->run->exit.esr/kvm_vcpu_get_esr(vcpu), rec->run->exit.esr has been
copied to the storage space pointed by kvm_vcpu_get_esr() in its caller.

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

s/rec->run->exit.esr/kvm_vcpu_get_esr(vcpu)

> +static int rec_exit_sys_reg(struct kvm_vcpu *vcpu)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +	unsigned long esr = kvm_vcpu_get_esr(vcpu);
> +	int rt = kvm_vcpu_sys_get_rt(vcpu);
> +	bool is_write = (esr & ESR_ELx_SYS64_ISS_DIR_MASK) == ESR_ELx_SYS64_ISS_DIR_WRITE;
> +	int ret;
> +
> +	if (is_write)
> +		vcpu_set_reg(vcpu, rt, rec->run->exit.gprs[rt]);
> +
> +	ret = kvm_handle_sys_reg(vcpu);
> +	if (!is_write)
> +		rec->run->enter.gprs[rt] = vcpu_get_reg(vcpu, rt);
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
> +		/* Set RMI_REJECT bit */
> +		rec->run->enter.flags = REC_ENTER_FLAG_RIPAS_RESPONSE;
> +		return -EINVAL;
> +	}

I doubt if the flag (REC_ENTER_FLAG_RIPAS_RESPONSE) will be handed over to RMM
since the negative return value forces we're exiting to VMM like QEMU where
how this problematic case can be handled is TBD.

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
> +	__vcpu_assign_sys_reg(vcpu, CNTV_CTL_EL0, rec->run->exit.cntv_ctl);
> +	__vcpu_assign_sys_reg(vcpu, CNTV_CVAL_EL0, rec->run->exit.cntv_cval);
> +	__vcpu_assign_sys_reg(vcpu, CNTP_CTL_EL0, rec->run->exit.cntp_ctl);
> +	__vcpu_assign_sys_reg(vcpu, CNTP_CVAL_EL0, rec->run->exit.cntp_cval);
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
> +	if (status == RMI_ERROR_REALM) {
> +		vcpu->run->exit_reason = KVM_EXIT_SHUTDOWN;
> +		return 0;
> +	}
> +
> +	/*
> +	 * If a VCPU has been turned on, but the REC state hasn't been updated
> +	 * we may experience RMI_ERROR_REC. Exit to the userspace with -EAGAIN
> +	 * for a retry.
> +	 */
> +	if (status == RMI_ERROR_REC)
> +		return -EAGAIN;
> +	if (rec_run_ret)
> +		return -ENXIO;
> +
> +	vcpu->arch.fault.esr_el2 = rec->run->exit.esr;
> +	vcpu->arch.fault.far_el2 = rec->run->exit.far;
> +	/* HPFAR_EL2 is only valid for RMI_EXIT_SYNC */
> +	vcpu->arch.fault.hpfar_el2 = 0;
> +
> +	update_arch_timer_irq_lines(vcpu);
> +
> +	/* Reset the emulation flags for the next run of the REC */
> +	rec->run->enter.flags = 0;
> +
> +	switch (rec->run->exit.exit_reason) {
> +	case RMI_EXIT_SYNC:
> +		/*
> +		 * HPFAR_EL2_NS is hijacked to indicate a valid HPFAR value,
> +		 * see __get_fault_info()
> +		 */
> +		vcpu->arch.fault.hpfar_el2 = rec->run->exit.hpfar | HPFAR_EL2_NS;
> +		return rec_exit_handlers[esr_ec](vcpu);
> +	case RMI_EXIT_IRQ:
> +	case RMI_EXIT_FIQ:
> +	case RMI_EXIT_SERROR:
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
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> index 353a5ca45e78..d8a5fb12db2d 100644
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -173,6 +173,48 @@ static int realm_ensure_created(struct kvm *kvm)
>   	return -ENXIO;
>   }
>   
> +/*
> + * kvm_rec_pre_enter - Complete operations before entering a REC
> + *
> + * Some operations require work to be completed before entering a realm. That
> + * work may require memory allocation so cannot be done in the kvm_rec_enter()
> + * call.
> + *
> + * Return: 1 if we should enter the guest
> + *	   0 if we should exit to userspace
> + *	   < 0 if we should exit to userspace, where the return value indicates
> + *	   an error
> + */
> +int kvm_rec_pre_enter(struct kvm_vcpu *vcpu)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +
> +	if (kvm_realm_state(vcpu->kvm) != REALM_STATE_ACTIVE)
> +		return -EINVAL;
> +
> +	switch (rec->run->exit.exit_reason) {
> +	case RMI_EXIT_HOST_CALL:
> +		for (int i = 0; i < REC_RUN_GPRS; i++)
> +			rec->run->enter.gprs[i] = vcpu_get_reg(vcpu, i);
> +		break;
> +	}
> +
> +	return 1;
> +}
> +
> +int noinstr kvm_rec_enter(struct kvm_vcpu *vcpu)
> +{
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +	int ret;
> +
> +	guest_state_enter_irqoff();
> +	ret = rmi_rec_enter(virt_to_phys(rec->rec_page),
> +			    virt_to_phys(rec->run));
> +	guest_state_exit_irqoff();
> +
> +	return ret;
> +}
> +
>   static int kvm_create_rec(struct kvm_vcpu *vcpu)
>   {
>   	struct user_pt_regs *vcpu_regs = vcpu_gp_regs(vcpu);

Thanks,
Gavin


