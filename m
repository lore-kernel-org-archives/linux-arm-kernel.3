Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44178D2D10F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyT7yshjxI28rxht5+ZbiYBc0/2eKd+sQKdTY3zp/D4=; b=azFCCNtnzDtXt83895J9qnvUQh
	KR3jENk3VfTdAlbW0n90OHQ4uY/Hy5n7I+twRa+zv1vxIatBZ3vjxSKe31PMaeL36eg12hI1rp0Di
	PdPN0Yn9yVVdDqCc6gewtzOAtShrExqa7uE2OGfS5jhu8XC4GTCc1CTiPatZQegJZb4KsqSy9pac0
	7W2p4ibIpqZyqXLfhfPuCWp28IPwJ/kF52nJUSW6oHyaxct1OoPhfoYdaquN4n/v5iIsCvvgFdwHR
	LhGNVqFOIQrhnBjVMQsXl81230BHqp22e1Y7G87JC52RZm8ILTlAJ+S0+sSyzbirSF6se1hRSv50X
	bHO+ImxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffaX-00000007HD9-2WFM;
	Tue, 13 Jan 2026 14:41:41 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffaU-00000007HCn-01CE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 14:41:40 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4ee243b98caso457451cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 06:41:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768315296; cv=none;
        d=google.com; s=arc-20240605;
        b=GpsGDiFsVl4LzV1tsnX2FJKpTkall2mAzLkHwIUlGHrNXv1oQ9DWqcQNo83qsrQH3j
         L+TUQLu4iUd7db1F+GoedPj7LJ4sZDa9V75pEOxKv7DrDXTXZ8CDDPeskJTm4Sngf4Ww
         nxoQ9aApZ/S4RHnCwGaUY7v1jGCSJSXSDNtT0X6TnjVxAnFKypTrk36av9L/1fHG/RsV
         hT6Y8bf2N8xe1Keo4XEkP2Mi9v34VizA4ul62e6tMudrHtlNR58GMNv4jNU8J1Geh/Yh
         4jUXIqsMbSvuG/0cyuzQhi0TIxctUvHsRE8hL5pxJ5p6/r2/fv3TtB3bVOeaZ9Alpzl0
         VuvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NyT7yshjxI28rxht5+ZbiYBc0/2eKd+sQKdTY3zp/D4=;
        fh=eyPJsw+ViZUaQVZqpCptZGVkpK2JPvRwf/rjiGeAyck=;
        b=QDNQ7pBdBjxN9G08BUD6GmKmLM78ADAAINNCgKcwJFI5nr1FX8q1ytzm5Se4FNkTq1
         hQc4+2mP2KYveV4cIFIHldU81K5WLPhwXW1W+pQR+QEDmPq3kxABUvcySjI9NyLzzA6x
         xNdt35MVcmtGi8u6emPv+0oKlBkkENyrB7Vzd0l2QQ1ceRa7sBtvMYaa+/1v+lJUlpom
         sP0APRA836y+f7jvNtvhhCL08LqJ+FF6/0mFh9lSgJlMMP9RQ0yNAhXz1c/ukUVhbku8
         6n3qXOxSMb8DrYBi8yN/kezgE/JcrmWHPlHUYwJev1zqHue6tJDLrc20A03dS01xi2+/
         IDVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768315296; x=1768920096; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NyT7yshjxI28rxht5+ZbiYBc0/2eKd+sQKdTY3zp/D4=;
        b=JEUB9BxWW5OG5lGYut8tuA7CBSUII3gohFfWx3S/xgvNw1nbQ0sFYe3Hc9uWzPCKXH
         U7eYYEKVZd3VY1+dFkl3rtVmM173U47XWCSY8tskpaeetO5yEuAE2KgeMDl14M3ZVXbl
         zkj9qbe5vbWtbpTdgat8iVKyjZUwphNxMW3EazRcjrqVO9Nionqfpfy/c8RscZDfS8jC
         weTROKLCqAOrZZjg79ihtMhshTNGylrheoKqy6Dl8xuckGxORQGLNi+jyizb4MhEM9V6
         /ZdjZY5mxxYXGTnzdq+4XHDihPA8OjpmNjeHtXX91A3tJJpmZuS4b5jZHss5mvQrUtyc
         /BzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315296; x=1768920096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyT7yshjxI28rxht5+ZbiYBc0/2eKd+sQKdTY3zp/D4=;
        b=J5Rys8k0c7EyU5YA0PQZ7XS1CSa27TA4dBJxjK2REAKIKoXg2gkj2o6SZGwlYPBHpc
         ++6uqG1ORsJIeVYnUjvzICxmMO7t+3lFc5v5j1f7A0xKTLgplRU2B+w/FPtDyIWaSP35
         oZHKWMtf4TPpTTP96UaYRYJu57uzMD9mVYGRHW0rESnJIh7q/Fln7hlk7kGlsBdMgOnf
         mQvzxdC8lCgq8WuLaVoRVgfXJK+l5HTqi98ItbLVjs2fvv1NXS8S6m5kHiFJ2OBLwkbB
         vkzYJfNOdDjmSASdfC7uiqg3XTtyXnWO3oim1Wr8izDislSLUCKYRqmTWzl/KZVxGvJ4
         bqAg==
X-Forwarded-Encrypted: i=1; AJvYcCUDk+t0d/cANTXWnJI0KakWRJu2+AkBEp59BEz/z4vy1phurfu99guHh/MCEEnn1/InuMfzE6z8YOG3HwsOpIwR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy91iwUz+BV3AEfNOl07MsypQwefv7ISeGiCs63H59wRd17ij6Q
	p4o5HhhbJyLt5fSfzrcpp5xDL7EaB7JFtlPKDeHyit7oX5SiT3Kym9mjhF4nXMfsIZLro3QEr8f
	SZVs87G2/cAX5Zxlkdd1nJELWISAVnQVm7FjnHNXf
X-Gm-Gg: AY/fxX5sNWA72yoEbrF4fVyNkF3Uv94foX1FTohQ/FwbJukr4AILSxDP7fQBbm70quT
	nYlkTwtqcGJDC5m2b5XZvrAPJ0C07Y6/zFXE0vUD5A27EsyWLTn+1NXaYbHOh1bB+Z+HOrbE+OW
	cggsMzm8hsqXtjvDEwS5nLLh5m8m54hYt5oMJ2xaXo82w3NP/v+yrkMOWehKESmEyd0pq/gIUs2
	y/xD+8/yT6Tej3+THd2UvfTXaVzKZCYrux0wYZbKc1d8TcWnapScIAUHgt+gHgmlPxwhNFyI1GN
	C+Tij41ek/Ocz5J/eHtNoml9dg==
X-Received: by 2002:a05:622a:3cd:b0:4ff:cb75:2a22 with SMTP id
 d75a77b69052e-5013af6d173mr9629161cf.3.1768315295481; Tue, 13 Jan 2026
 06:41:35 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-26-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-26-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 13 Jan 2026 14:40:58 +0000
X-Gm-Features: AZwV_Qjs5e4uEcbnEJuVrBfT-1moEDZsHvN3tHWheQOa84fBcmYp4v7F-T0DOhM
Message-ID: <CA+EHjTxFfY_XkEQrNvme94uHoxQLWEaX1q1MikbcmwmUMq=NwA@mail.gmail.com>
Subject: Re: [PATCH v9 26/30] KVM: arm64: Provide interface for configuring
 and enabling SME for guests
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_064139_476823_03FA06AC 
X-CRM114-Status: GOOD (  33.91  )
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

On Tue, 23 Dec 2025 at 01:23, Mark Brown <broonie@kernel.org> wrote:
>
> Since SME requires configuration of a vector length in order to know the
> size of both the streaming mode SVE state and ZA array we implement a
> capability for it and require that it be enabled and finalized before
> the SME specific state can be accessed, similarly to SVE.
>
> Due to the overlap with sizing the SVE state we finalise both SVE and
> SME with a single finalization, preventing any further changes to the
> SVE and SME configuration once KVM_ARM_VCPU_VEC (an alias for _VCPU_SVE)
> has been finalised. This is not a thing of great elegance but it ensures

With KVM_ARM_VCPU_VEC being an alias for KVM_ARM_VCPU_SVE, wouldn't
kvm_arm_vcpu_finalize() fail for guests that have only SME enabled but
not SVE?

Cheers,
/fuad


> that we never have a state where one of SVE or SME is finalised and the
> other not, avoiding complexity.
>
> SME is supported for normal and protected guests.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h  |  12 +++-
>  arch/arm64/include/uapi/asm/kvm.h  |   1 +
>  arch/arm64/kvm/arm.c               |  10 ++++
>  arch/arm64/kvm/hyp/nvhe/pkvm.c     |  76 +++++++++++++++++++-----
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c |   6 ++
>  arch/arm64/kvm/reset.c             | 116 +++++++++++++++++++++++++++++++------
>  include/uapi/linux/kvm.h           |   1 +
>  7 files changed, 189 insertions(+), 33 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index bceaf0608d75..011debfc1afd 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -39,7 +39,7 @@
>
>  #define KVM_MAX_VCPUS VGIC_V3_MAX_CPUS
>
> -#define KVM_VCPU_MAX_FEATURES 9
> +#define KVM_VCPU_MAX_FEATURES 10
>  #define KVM_VCPU_VALID_FEATURES        (BIT(KVM_VCPU_MAX_FEATURES) - 1)
>
>  #define KVM_REQ_SLEEP \
> @@ -82,6 +82,7 @@ extern unsigned int __ro_after_init kvm_host_max_vl[ARM64_VEC_MAX];
>  DECLARE_STATIC_KEY_FALSE(userspace_irqchip_in_use);
>
>  int __init kvm_arm_init_sve(void);
> +int __init kvm_arm_init_sme(void);
>
>  u32 __attribute_const__ kvm_target_cpu(void);
>  void kvm_reset_vcpu(struct kvm_vcpu *vcpu);
> @@ -1149,7 +1150,14 @@ struct kvm_vcpu_arch {
>         __size_ret;                                                     \
>  })
>
> -#define vcpu_sve_state_size(vcpu) sve_state_size_from_vl((vcpu)->arch.max_vl[ARM64_VEC_SVE])
> +#define vcpu_sve_state_size(vcpu) ({                                   \
> +       unsigned int __max_vl;                                          \
> +                                                                       \
> +       __max_vl = max((vcpu)->arch.max_vl[ARM64_VEC_SVE],              \
> +                      (vcpu)->arch.max_vl[ARM64_VEC_SME]);             \
> +                                                                       \
> +       sve_state_size_from_vl(__max_vl);                               \
> +})
>
>  #define vcpu_sme_state(vcpu) (kern_hyp_va((vcpu)->arch.sme_state))
>
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index 9a19cc58d227..b4be424e4230 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -106,6 +106,7 @@ struct kvm_regs {
>  #define KVM_ARM_VCPU_PTRAUTH_GENERIC   6 /* VCPU uses generic authentication */
>  #define KVM_ARM_VCPU_HAS_EL2           7 /* Support nested virtualization */
>  #define KVM_ARM_VCPU_HAS_EL2_E2H0      8 /* Limit NV support to E2H RES0 */
> +#define KVM_ARM_VCPU_SME               9 /* enable SME for this CPU */
>
>  /*
>   * An alias for _SVE since we finalize VL configuration for both SVE and SME
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 4f80da0c0d1d..7de7b497f74f 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -402,6 +402,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>         case KVM_CAP_ARM_SVE:
>                 r = system_supports_sve();
>                 break;
> +       case KVM_CAP_ARM_SME:
> +               r = system_supports_sme();
> +               break;
>         case KVM_CAP_ARM_PTRAUTH_ADDRESS:
>         case KVM_CAP_ARM_PTRAUTH_GENERIC:
>                 r = kvm_has_full_ptr_auth();
> @@ -1456,6 +1459,9 @@ static unsigned long system_supported_vcpu_features(void)
>         if (!system_supports_sve())
>                 clear_bit(KVM_ARM_VCPU_SVE, &features);
>
> +       if (!system_supports_sme())
> +               clear_bit(KVM_ARM_VCPU_SME, &features);
> +
>         if (!kvm_has_full_ptr_auth()) {
>                 clear_bit(KVM_ARM_VCPU_PTRAUTH_ADDRESS, &features);
>                 clear_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, &features);
> @@ -2878,6 +2884,10 @@ static __init int kvm_arm_init(void)
>         if (err)
>                 return err;
>
> +       err = kvm_arm_init_sme();
> +       if (err)
> +               return err;
> +
>         err = kvm_arm_vmid_alloc_init();
>         if (err) {
>                 kvm_err("Failed to initialize VMID allocator.\n");
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index b656449dff69..30ee9f371b0d 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -148,10 +148,6 @@ static int pkvm_check_pvm_cpu_features(struct kvm_vcpu *vcpu)
>             !kvm_has_feat(kvm, ID_AA64PFR0_EL1, AdvSIMD, IMP))
>                 return -EINVAL;
>
> -       /* No SME support in KVM right now. Check to catch if it changes. */
> -       if (kvm_has_feat(kvm, ID_AA64PFR1_EL1, SME, IMP))
> -               return -EINVAL;
> -
>         return 0;
>  }
>
> @@ -377,6 +373,11 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
>                 kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_GUEST_HAS_SVE);
>         }
>
> +       if (kvm_pvm_ext_allowed(KVM_CAP_ARM_SME)) {
> +               set_bit(KVM_ARM_VCPU_SME, allowed_features);
> +               kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_GUEST_HAS_SME);
> +       }
> +
>         bitmap_and(kvm->arch.vcpu_features, host_kvm->arch.vcpu_features,
>                    allowed_features, KVM_VCPU_MAX_FEATURES);
>  }
> @@ -399,6 +400,18 @@ static void unpin_host_sve_state(struct pkvm_hyp_vcpu *hyp_vcpu)
>                              sve_state + vcpu_sve_state_size(&hyp_vcpu->vcpu));
>  }
>
> +static void unpin_host_sme_state(struct pkvm_hyp_vcpu *hyp_vcpu)
> +{
> +       void *sme_state;
> +
> +       if (!vcpu_has_feature(&hyp_vcpu->vcpu, KVM_ARM_VCPU_SME))
> +               return;
> +
> +       sme_state = kern_hyp_va(hyp_vcpu->vcpu.arch.sme_state);
> +       hyp_unpin_shared_mem(sme_state,
> +                            sme_state + vcpu_sme_state_size(&hyp_vcpu->vcpu));
> +}
> +
>  static void unpin_host_vcpus(struct pkvm_hyp_vcpu *hyp_vcpus[],
>                              unsigned int nr_vcpus)
>  {
> @@ -412,6 +425,7 @@ static void unpin_host_vcpus(struct pkvm_hyp_vcpu *hyp_vcpus[],
>
>                 unpin_host_vcpu(hyp_vcpu->host_vcpu);
>                 unpin_host_sve_state(hyp_vcpu);
> +               unpin_host_sme_state(hyp_vcpu);
>         }
>  }
>
> @@ -438,23 +452,35 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
>         mmu->pgt = &hyp_vm->pgt;
>  }
>
> -static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *host_vcpu)
> +static int pkvm_vcpu_init_vec(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *host_vcpu)
>  {
>         struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
> -       unsigned int sve_max_vl;
> -       size_t sve_state_size;
> -       void *sve_state;
> +       unsigned int sve_max_vl, sme_max_vl;
> +       size_t sve_state_size, sme_state_size;
> +       void *sve_state, *sme_state;
>         int ret = 0;
>
> -       if (!vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE)) {
> +       if (!vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE) &&
> +           !vcpu_has_feature(vcpu, KVM_ARM_VCPU_SME)) {
>                 vcpu_clear_flag(vcpu, VCPU_VEC_FINALIZED);
>                 return 0;
>         }
>
>         /* Limit guest vector length to the maximum supported by the host. */
> -       sve_max_vl = min(READ_ONCE(host_vcpu->arch.max_vl[ARM64_VEC_SVE]),
> -                        kvm_host_max_vl[ARM64_VEC_SVE]);
> -       sve_state_size = sve_state_size_from_vl(sve_max_vl);
> +       if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE))
> +               sve_max_vl = min(READ_ONCE(host_vcpu->arch.max_vl[ARM64_VEC_SVE]),
> +                                kvm_host_max_vl[ARM64_VEC_SVE]);
> +       else
> +               sve_max_vl = 0;
> +
> +       if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_SME))
> +               sme_max_vl = min(READ_ONCE(host_vcpu->arch.max_vl[ARM64_VEC_SME]),
> +                                kvm_host_max_vl[ARM64_VEC_SME]);
> +       else
> +               sme_max_vl = 0;
> +
> +       /* We need SVE storage for the larger of normal or streaming mode */
> +       sve_state_size = sve_state_size_from_vl(max(sve_max_vl, sme_max_vl));
>         sve_state = kern_hyp_va(READ_ONCE(host_vcpu->arch.sve_state));
>
>         if (!sve_state || !sve_state_size) {
> @@ -466,12 +492,36 @@ static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *h
>         if (ret)
>                 goto err;
>
> +       if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_SME)) {
> +               sme_state_size = sme_state_size_from_vl(sme_max_vl,
> +                                                       vcpu_has_sme2(vcpu));
> +               sme_state = kern_hyp_va(READ_ONCE(host_vcpu->arch.sme_state));
> +
> +               if (!sme_state || !sme_state_size) {
> +                       ret = -EINVAL;
> +                       goto err_sve_mapped;
> +               }
> +
> +               ret = hyp_pin_shared_mem(sme_state, sme_state + sme_state_size);
> +               if (ret)
> +                       goto err_sve_mapped;
> +       } else {
> +               sme_state = 0;
> +       }
> +
>         vcpu->arch.sve_state = sve_state;
>         vcpu->arch.max_vl[ARM64_VEC_SVE] = sve_max_vl;
>
> +       vcpu->arch.sme_state = sme_state;
> +       vcpu->arch.max_vl[ARM64_VEC_SME] = sme_max_vl;
> +
>         return 0;
> +
> +err_sve_mapped:
> +       hyp_unpin_shared_mem(sve_state, sve_state + sve_state_size);
>  err:
>         clear_bit(KVM_ARM_VCPU_SVE, vcpu->kvm->arch.vcpu_features);
> +       clear_bit(KVM_ARM_VCPU_SME, vcpu->kvm->arch.vcpu_features);
>         return ret;
>  }
>
> @@ -501,7 +551,7 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
>         if (ret)
>                 goto done;
>
> -       ret = pkvm_vcpu_init_sve(hyp_vcpu, host_vcpu);
> +       ret = pkvm_vcpu_init_vec(hyp_vcpu, host_vcpu);
>  done:
>         if (ret)
>                 unpin_host_vcpu(host_vcpu);
> diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> index 3108b5185c20..40127ba86335 100644
> --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> @@ -66,6 +66,11 @@ static bool vm_has_ptrauth(const struct kvm *kvm)
>                 kvm_vcpu_has_feature(kvm, KVM_ARM_VCPU_PTRAUTH_GENERIC);
>  }
>
> +static bool vm_has_sme(const struct kvm *kvm)
> +{
> +       return system_supports_sme() && kvm_vcpu_has_feature(kvm, KVM_ARM_VCPU_SME);
> +}
> +
>  static bool vm_has_sve(const struct kvm *kvm)
>  {
>         return system_supports_sve() && kvm_vcpu_has_feature(kvm, KVM_ARM_VCPU_SVE);
> @@ -102,6 +107,7 @@ static const struct pvm_ftr_bits pvmid_aa64pfr0[] = {
>  };
>
>  static const struct pvm_ftr_bits pvmid_aa64pfr1[] = {
> +       MAX_FEAT_FUNC(ID_AA64PFR1_EL1, SME, SME2, vm_has_sme),
>         MAX_FEAT(ID_AA64PFR1_EL1, BT, IMP),
>         MAX_FEAT(ID_AA64PFR1_EL1, SSBS, SSBS2),
>         MAX_FEAT_ENUM(ID_AA64PFR1_EL1, MTE_frac, NI),
> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> index a8684a1346ec..e6dc04267cbb 100644
> --- a/arch/arm64/kvm/reset.c
> +++ b/arch/arm64/kvm/reset.c
> @@ -76,6 +76,34 @@ int __init kvm_arm_init_sve(void)
>         return 0;
>  }
>
> +int __init kvm_arm_init_sme(void)
> +{
> +       if (system_supports_sme()) {
> +               kvm_max_vl[ARM64_VEC_SME] = sme_max_virtualisable_vl();
> +               kvm_host_max_vl[ARM64_VEC_SME] = sme_max_vl();
> +               kvm_nvhe_sym(kvm_host_max_vl[ARM64_VEC_SME]) = kvm_host_max_vl[ARM64_VEC_SME];
> +
> +               /*
> +                * The get_sve_reg()/set_sve_reg() ioctl interface will need
> +                * to be extended with multiple register slice support in
> +                * order to support vector lengths greater than
> +                * VL_ARCH_MAX:
> +                */
> +               if (WARN_ON(kvm_max_vl[ARM64_VEC_SME] > VL_ARCH_MAX))
> +                       kvm_max_vl[ARM64_VEC_SME] = VL_ARCH_MAX;
> +
> +               /*
> +                * Don't even try to make use of vector lengths that
> +                * aren't available on all CPUs, for now:
> +                */
> +               if (kvm_max_vl[ARM64_VEC_SME] < sme_max_vl())
> +                       pr_warn("KVM: SME vector length for guests limited to %u bytes\n",
> +                               kvm_max_vl[ARM64_VEC_SME]);
> +       }
> +
> +       return 0;
> +}
> +
>  static void kvm_vcpu_enable_sve(struct kvm_vcpu *vcpu)
>  {
>         vcpu->arch.max_vl[ARM64_VEC_SVE] = kvm_max_vl[ARM64_VEC_SVE];
> @@ -88,42 +116,86 @@ static void kvm_vcpu_enable_sve(struct kvm_vcpu *vcpu)
>         set_bit(KVM_ARCH_FLAG_GUEST_HAS_SVE, &vcpu->kvm->arch.flags);
>  }
>
> +static void kvm_vcpu_enable_sme(struct kvm_vcpu *vcpu)
> +{
> +       vcpu->arch.max_vl[ARM64_VEC_SME] = kvm_max_vl[ARM64_VEC_SME];
> +
> +       /*
> +        * Userspace can still customize the vector lengths by writing
> +        * KVM_REG_ARM64_SME_VLS.  Allocation is deferred until
> +        * kvm_arm_vcpu_finalize(), which freezes the configuration.
> +        */
> +       set_bit(KVM_ARCH_FLAG_GUEST_HAS_SME, &vcpu->kvm->arch.flags);
> +}
> +
>  /*
> - * Finalize vcpu's maximum SVE vector length, allocating
> - * vcpu->arch.sve_state as necessary.
> + * Finalize vcpu's maximum vector lengths, allocating
> + * vcpu->arch.sve_state and vcpu->arch.sme_state as necessary.
>   */
>  static int kvm_vcpu_finalize_vec(struct kvm_vcpu *vcpu)
>  {
> -       void *buf;
> +       void *sve_state, *sme_state;
>         unsigned int vl;
> -       size_t reg_sz;
>         int ret;
>
> -       vl = vcpu->arch.max_vl[ARM64_VEC_SVE];
> -
>         /*
>          * Responsibility for these properties is shared between
>          * kvm_arm_init_sve(), kvm_vcpu_enable_sve() and
>          * set_sve_vls().  Double-check here just to be sure:
>          */
> -       if (WARN_ON(!sve_vl_valid(vl) || vl > sve_max_virtualisable_vl() ||
> -                   vl > VL_ARCH_MAX))
> -               return -EIO;
> +       if (vcpu_has_sve(vcpu)) {
> +               vl = vcpu->arch.max_vl[ARM64_VEC_SVE];
> +               if (WARN_ON(!sve_vl_valid(vl) ||
> +                           vl > sve_max_virtualisable_vl() ||
> +                           vl > VL_ARCH_MAX))
> +                       return -EIO;
> +       }
>
> -       reg_sz = vcpu_sve_state_size(vcpu);
> -       buf = kzalloc(reg_sz, GFP_KERNEL_ACCOUNT);
> -       if (!buf)
> +       /* Similarly for SME */
> +       if (vcpu_has_sme(vcpu)) {
> +               vl = vcpu->arch.max_vl[ARM64_VEC_SME];
> +               if (WARN_ON(!sve_vl_valid(vl) ||
> +                           vl > sme_max_virtualisable_vl() ||
> +                           vl > VL_ARCH_MAX))
> +                       return -EIO;
> +       }
> +
> +       sve_state = kzalloc(vcpu_sve_state_size(vcpu), GFP_KERNEL_ACCOUNT);
> +       if (!sve_state)
>                 return -ENOMEM;
>
> -       ret = kvm_share_hyp(buf, buf + reg_sz);
> -       if (ret) {
> -               kfree(buf);
> -               return ret;
> +       ret = kvm_share_hyp(sve_state, sve_state + vcpu_sve_state_size(vcpu));
> +       if (ret)
> +               goto err_sve_alloc;
> +
> +       if (vcpu_has_sme(vcpu)) {
> +               sme_state = kzalloc(vcpu_sme_state_size(vcpu),
> +                                   GFP_KERNEL_ACCOUNT);
> +               if (!sme_state) {
> +                       ret = -ENOMEM;
> +                       goto err_sve_map;
> +               }
> +
> +               ret = kvm_share_hyp(sme_state,
> +                                   sme_state + vcpu_sme_state_size(vcpu));
> +               if (ret)
> +                       goto err_sme_alloc;
> +       } else {
> +               sme_state = NULL;
>         }
> -
> -       vcpu->arch.sve_state = buf;
> +
> +       vcpu->arch.sve_state = sve_state;
> +       vcpu->arch.sme_state = sme_state;
>         vcpu_set_flag(vcpu, VCPU_VEC_FINALIZED);
>         return 0;
> +
> +err_sme_alloc:
> +       kfree(sme_state);
> +err_sve_map:
> +       kvm_unshare_hyp(sve_state, sve_state + vcpu_sve_state_size(vcpu));
> +err_sve_alloc:
> +       kfree(sve_state);
> +       return ret;
>  }
>
>  int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature)
> @@ -153,12 +225,16 @@ bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu)
>  void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu)
>  {
>         void *sve_state = vcpu->arch.sve_state;
> +       void *sme_state = vcpu->arch.sme_state;
>
>         kvm_unshare_hyp(vcpu, vcpu + 1);
>         if (sve_state)
>                 kvm_unshare_hyp(sve_state, sve_state + vcpu_sve_state_size(vcpu));
>         kfree(sve_state);
>         free_page((unsigned long)vcpu->arch.ctxt.vncr_array);
> +       if (sme_state)
> +               kvm_unshare_hyp(sme_state, sme_state + vcpu_sme_state_size(vcpu));
> +       kfree(sme_state);
>         kfree(vcpu->arch.vncr_tlb);
>         kfree(vcpu->arch.ccsidr);
>  }
> @@ -167,6 +243,8 @@ static void kvm_vcpu_reset_vec(struct kvm_vcpu *vcpu)
>  {
>         if (vcpu_has_sve(vcpu))
>                 memset(vcpu->arch.sve_state, 0, vcpu_sve_state_size(vcpu));
> +       if (vcpu_has_sme(vcpu))
> +               memset(vcpu->arch.sme_state, 0, vcpu_sme_state_size(vcpu));
>  }
>
>  /**
> @@ -206,6 +284,8 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
>         if (!kvm_arm_vcpu_vec_finalized(vcpu)) {
>                 if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE))
>                         kvm_vcpu_enable_sve(vcpu);
> +               if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_SME))
> +                       kvm_vcpu_enable_sme(vcpu);
>         } else {
>                 kvm_vcpu_reset_vec(vcpu);
>         }
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index dddb781b0507..d9e068db3b73 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -974,6 +974,7 @@ struct kvm_enable_cap {
>  #define KVM_CAP_GUEST_MEMFD_FLAGS 244
>  #define KVM_CAP_ARM_SEA_TO_USER 245
>  #define KVM_CAP_S390_USER_OPEREXEC 246
> +#define KVM_CAP_ARM_SME 247
>
>  struct kvm_irq_routing_irqchip {
>         __u32 irqchip;
>
> --
> 2.47.3
>

