Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85384C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 00:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcyfpPUqLHcmXEYYEMoAoUCuMRUkHggn/cuf/nj3QHo=; b=x534+JTi0DTxA5ZQ/VwM4y3r2h
	6vubrLoErKoPDe6NV4szSvR7nL3bYZPCJTDgT92bsvLdGlRN0SGOZSEsejXIhmYDzTIyXgo6RWu1A
	vwagZttp1yDFpIOueY5a29PouGInMe9hP67kNk8Kf3fQTCTjEJlDn+1tomD6TG/zQQZvGa2sE4+Xj
	6b6El2C4AlC0HCTxrEH7ygs5inLy1aynmz059MpyhMH5uAB9ilQgfAdNg1liQKb1NMFVip3iMqeK/
	IKcQfGaC1LuKG4J5DZV+IL0fBOzuB2ujI8s5WBfNPwmEo0B9oQ00KHqRcX5IHaqXrR5CE8dzt6A0D
	Od2uIisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuhI8-00000007Zfh-0f6S;
	Wed, 19 Mar 2025 00:28:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuhGP-00000007ZA6-15Jr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 00:26:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742343986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dcyfpPUqLHcmXEYYEMoAoUCuMRUkHggn/cuf/nj3QHo=;
	b=AaaMBNqfNfra/blUHUTGh9najA1usa3WUQoqfpikZ+JNPwJu4pXWlQKHawTTS6H6KANE/U
	5Goj+HqLJ/6Y5+jyqRSQc2BJA3iEuUfnSg0+om2FIS5Muw33/xVD8t6zX93Fhp5zZ8czZI
	UZQQgCHb27TJi1Rv8L9j4XlDT506DGA=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-vvZdnv0vNs2JSPszTsfz3g-1; Tue, 18 Mar 2025 20:26:23 -0400
X-MC-Unique: vvZdnv0vNs2JSPszTsfz3g-1
X-Mimecast-MFC-AGG-ID: vvZdnv0vNs2JSPszTsfz3g_1742343982
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2242ca2a4a5so85314145ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 17:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742343982; x=1742948782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcyfpPUqLHcmXEYYEMoAoUCuMRUkHggn/cuf/nj3QHo=;
        b=oDGvZQ/hnuqkEmK+Dd06CB7Ekh9rESzBjp2vL83bHtseaCyrSBCr1Ihc1jFKbZmBEO
         CNH9sa+etDU39fInI+bjW/xSjsk9IIKv1D9QmLmn2aw8JKHpsDjJeFY064/p7ezqVFbn
         OSDd1iOKuDDtx7GmO7bQ2u9R/PpO5+9DcEmflD/ZsFvCxzCglOm5N9i/cvfuXY0cwyox
         Ip7b1K00DdbS+oXDecHlJjUqt/5zjbpQbg/LOnSoQcY76BjeCg2p627ZQs7k9HNEUOJN
         LJliGfXJLquKtFpVMkPqz72AmJs034rnCQ6l3L2LeokyPZjFUS1M9gSfVXWGSQIaSLlu
         Cmxw==
X-Gm-Message-State: AOJu0YwBVfqNmx6R0KeAi2NODdblg407+KQg2Kl5RABKEgGAoSHDYduK
	P3JryyVg1XJ/P5eoocAnFK12smLzOZp/+0/ZHFToADinFjE3I96CMQ8D9qMcVCk0BgCRQQbjfOX
	yjT4tuesId89AgiC8UOQlP58RhopJxVi1ZB7ZxJ+j20lIkNfKNR7cKPebr/0uw7qD18GdV1Kw
X-Gm-Gg: ASbGncv4S+gcbDnPdHxD3MIIh5zUJ5PfDzWUSYMfAblJeelfoVNooLcsjHJO7+3doU0
	RdA9qc9P9mXkRDJGc9xK08sxbSywtd78i4VGdp77p8AMfi9ycL5HOhNIyL9sTEPkHSYLEXbjPlH
	6/870dM6IGWRAXmAITmU4bljenQ75Yj7+VA4zr6Q7DuSu3Q16nEMJmIIEUg0gegJOJnlnMfckBF
	TiuRjvaFJUZMsC1vISrWQcMGqMGvgUr4s6tj94GrHRI39z+BgtadUC6Ky4FaoDa+I4m0nicyOY4
	5VaVCTl0Hogb1mjruw==
X-Received: by 2002:a17:902:d2c6:b0:21f:bd66:cafa with SMTP id d9443c01a7336-226499365cbmr9077845ad.17.1742343982229;
        Tue, 18 Mar 2025 17:26:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM1JeJlzG9hcTXu6MosOqDs29giW5SOPOo+RoLQCTNH0YvRQ0etfbZb8zUKi40Yd9vIUSDww==
X-Received: by 2002:a17:902:d2c6:b0:21f:bd66:cafa with SMTP id d9443c01a7336-226499365cbmr9077535ad.17.1742343981868;
        Tue, 18 Mar 2025 17:26:21 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22647996c7asm3545705ad.20.2025.03.18.17.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 17:26:20 -0700 (PDT)
Message-ID: <019afc2d-b047-4e33-971c-7debbbaec84d@redhat.com>
Date: Wed, 19 Mar 2025 10:26:14 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 8/8] KVM: arm64: Eagerly switch ZCR_EL{1,2}
To: Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>
References: <20250314-stable-sve-6-12-v1-0-ddc16609d9ba@kernel.org>
 <20250314-stable-sve-6-12-v1-8-ddc16609d9ba@kernel.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250314-stable-sve-6-12-v1-8-ddc16609d9ba@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: __XPLQ9HFBMyZD7vt9FdQ72g3OFe58QCJ5W2aVOeYPw_1742343982
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_172629_384509_B2ADB8AF 
X-CRM114-Status: GOOD (  37.01  )
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

Hi Mark,

On 3/14/25 10:35 AM, Mark Brown wrote:
> From: Mark Rutland <mark.rutland@arm.com>
> 
> [ Upstream commit 59419f10045bc955d2229819c7cf7a8b0b9c5b59 ]
> 
> In non-protected KVM modes, while the guest FPSIMD/SVE/SME state is live on the
> CPU, the host's active SVE VL may differ from the guest's maximum SVE VL:
> 
> * For VHE hosts, when a VM uses NV, ZCR_EL2 contains a value constrained
>    by the guest hypervisor, which may be less than or equal to that
>    guest's maximum VL.
> 
>    Note: in this case the value of ZCR_EL1 is immaterial due to E2H.
> 
> * For nVHE/hVHE hosts, ZCR_EL1 contains a value written by the guest,
>    which may be less than or greater than the guest's maximum VL.
> 
>    Note: in this case hyp code traps host SVE usage and lazily restores
>    ZCR_EL2 to the host's maximum VL, which may be greater than the
>    guest's maximum VL.
> 
> This can be the case between exiting a guest and kvm_arch_vcpu_put_fp().
> If a softirq is taken during this period and the softirq handler tries
> to use kernel-mode NEON, then the kernel will fail to save the guest's
> FPSIMD/SVE state, and will pend a SIGKILL for the current thread.
> 
> This happens because kvm_arch_vcpu_ctxsync_fp() binds the guest's live
> FPSIMD/SVE state with the guest's maximum SVE VL, and
> fpsimd_save_user_state() verifies that the live SVE VL is as expected
> before attempting to save the register state:
> 
> | if (WARN_ON(sve_get_vl() != vl)) {
> |         force_signal_inject(SIGKILL, SI_KERNEL, 0, 0);
> |         return;
> | }
> 
> Fix this and make this a bit easier to reason about by always eagerly
> switching ZCR_EL{1,2} at hyp during guest<->host transitions. With this
> happening, there's no need to trap host SVE usage, and the nVHE/nVHE
> __deactivate_cptr_traps() logic can be simplified to enable host access
> to all present FPSIMD/SVE/SME features.
> 
> In protected nVHE/hVHE modes, the host's state is always saved/restored
> by hyp, and the guest's state is saved prior to exit to the host, so
> from the host's PoV the guest never has live FPSIMD/SVE/SME state, and
> the host's ZCR_EL1 is never clobbered by hyp.
> 
> Fixes: 8c8010d69c132273 ("KVM: arm64: Save/restore SVE state for nVHE")
> Fixes: 2e3cf82063a00ea0 ("KVM: arm64: nv: Ensure correct VL is loaded before saving SVE state")
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Tested-by: Mark Brown <broonie@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Will Deacon <will@kernel.org>
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> Link: https://lore.kernel.org/r/20250210195226.1215254-9-mark.rutland@arm.com
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   arch/arm64/kvm/fpsimd.c                 | 30 -----------------
>   arch/arm64/kvm/hyp/entry.S              |  5 +++
>   arch/arm64/kvm/hyp/include/hyp/switch.h | 59 +++++++++++++++++++++++++++++++++
>   arch/arm64/kvm/hyp/nvhe/hyp-main.c      | 13 ++++----
>   arch/arm64/kvm/hyp/nvhe/switch.c        | 33 +++++++++++++++---
>   arch/arm64/kvm/hyp/vhe/switch.c         |  4 +++
>   6 files changed, 103 insertions(+), 41 deletions(-)
> 

[...]

> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 4e757a77322c9efc59cdff501745f7c80d452358..1c8e2ad32e8c396fc4b11d5fec2e86728f2829d9 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -5,6 +5,7 @@
>    */
>   
>   #include <hyp/adjust_pc.h>
> +#include <hyp/switch.h>
>   
>   #include <asm/pgtable-types.h>
>   #include <asm/kvm_asm.h>
> @@ -176,8 +177,12 @@ static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
>   		sync_hyp_vcpu(hyp_vcpu);
>   		pkvm_put_hyp_vcpu(hyp_vcpu);
>   	} else {
> +		struct kvm_vcpu *vcpu = kern_hyp_va(host_vcpu);
> +
>   		/* The host is fully trusted, run its vCPU directly. */
> -		ret = __kvm_vcpu_run(host_vcpu);
> +		fpsimd_lazy_switch_to_guest(vcpu);
> +		ret = __kvm_vcpu_run(vcpu);
> +		fpsimd_lazy_switch_to_host(vcpu);
>   	}
>   

@host_vcpu should have been hypervisor's linear mapping address in v6.12. It looks
incorrect to assume it's a kernel's linear mapping address and convert it (@host_vcpu)
to the hypervisor's linear address agin, if I don't miss anything.

https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/kvm/hyp/nvhe/hyp-main.c?h=linux-6.12.y

Thanks,
Gavin

>   out:
> @@ -486,12 +491,6 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
>   	case ESR_ELx_EC_SMC64:
>   		handle_host_smc(host_ctxt);
>   		break;
> -	case ESR_ELx_EC_SVE:
> -		cpacr_clear_set(0, CPACR_ELx_ZEN);
> -		isb();
> -		sve_cond_update_zcr_vq(sve_vq_from_vl(kvm_host_sve_max_vl) - 1,
> -				       SYS_ZCR_EL2);
> -		break;
>   	case ESR_ELx_EC_IABT_LOW:
>   	case ESR_ELx_EC_DABT_LOW:
>   		handle_host_mem_abort(host_ctxt);
> diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
> index ee74006c47bc44ca1d9bdf1ce7d4d8a41cf8e494..a1245fa838319544f3770a05a58eeed5233f0324 100644
> --- a/arch/arm64/kvm/hyp/nvhe/switch.c
> +++ b/arch/arm64/kvm/hyp/nvhe/switch.c
> @@ -40,6 +40,9 @@ static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
>   {
>   	u64 val = CPTR_EL2_TAM;	/* Same bit irrespective of E2H */
>   
> +	if (!guest_owns_fp_regs())
> +		__activate_traps_fpsimd32(vcpu);
> +
>   	if (has_hvhe()) {
>   		val |= CPACR_ELx_TTA;
>   
> @@ -48,6 +51,8 @@ static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
>   			if (vcpu_has_sve(vcpu))
>   				val |= CPACR_ELx_ZEN;
>   		}
> +
> +		write_sysreg(val, cpacr_el1);
>   	} else {
>   		val |= CPTR_EL2_TTA | CPTR_NVHE_EL2_RES1;
>   
> @@ -62,12 +67,32 @@ static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
>   
>   		if (!guest_owns_fp_regs())
>   			val |= CPTR_EL2_TFP;
> +
> +		write_sysreg(val, cptr_el2);
>   	}
> +}
>   
> -	if (!guest_owns_fp_regs())
> -		__activate_traps_fpsimd32(vcpu);
> +static void __deactivate_cptr_traps(struct kvm_vcpu *vcpu)
> +{
> +	if (has_hvhe()) {
> +		u64 val = CPACR_ELx_FPEN;
> +
> +		if (cpus_have_final_cap(ARM64_SVE))
> +			val |= CPACR_ELx_ZEN;
> +		if (cpus_have_final_cap(ARM64_SME))
> +			val |= CPACR_ELx_SMEN;
> +
> +		write_sysreg(val, cpacr_el1);
> +	} else {
> +		u64 val = CPTR_NVHE_EL2_RES1;
> +
> +		if (!cpus_have_final_cap(ARM64_SVE))
> +			val |= CPTR_EL2_TZ;
> +		if (!cpus_have_final_cap(ARM64_SME))
> +			val |= CPTR_EL2_TSM;
>   
> -	kvm_write_cptr_el2(val);
> +		write_sysreg(val, cptr_el2);
> +	}
>   }
>   
>   static void __activate_traps(struct kvm_vcpu *vcpu)
> @@ -120,7 +145,7 @@ static void __deactivate_traps(struct kvm_vcpu *vcpu)
>   
>   	write_sysreg(this_cpu_ptr(&kvm_init_params)->hcr_el2, hcr_el2);
>   
> -	kvm_reset_cptr_el2(vcpu);
> +	__deactivate_cptr_traps(vcpu);
>   	write_sysreg(__kvm_hyp_host_vector, vbar_el2);
>   }
>   
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index 46c1f5caf007331cdbbc806a184e9b4721042fc0..496abfd3646b9858e95e06a79edec11eee3a5893 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -462,6 +462,8 @@ static int __kvm_vcpu_run_vhe(struct kvm_vcpu *vcpu)
>   
>   	sysreg_save_host_state_vhe(host_ctxt);
>   
> +	fpsimd_lazy_switch_to_guest(vcpu);
> +
>   	/*
>   	 * Note that ARM erratum 1165522 requires us to configure both stage 1
>   	 * and stage 2 translation for the guest context before we clear
> @@ -486,6 +488,8 @@ static int __kvm_vcpu_run_vhe(struct kvm_vcpu *vcpu)
>   
>   	__deactivate_traps(vcpu);
>   
> +	fpsimd_lazy_switch_to_host(vcpu);
> +
>   	sysreg_restore_host_state_vhe(host_ctxt);
>   
>   	if (guest_owns_fp_regs())
> 


