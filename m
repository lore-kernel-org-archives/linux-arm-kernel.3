Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6123FC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 15:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9hzpMymLHd0tOskj55BKws7W4GFUy+vHJNe1oPqssU=; b=H7GBm4ZR2kWBtmo+QDssiww0N+
	+a/zC1oYgTJ5iS7fUrTaojEAG5qQtZnt217JQvPL7Kt1k9O6Jiqs9t7dvsqzwiyrzKEdd9dcNyMVb
	Ff/gpZRcjOv1/TWNnfMWngpBKUmYDMxCwCwOuUNW9Leopby25JMzXk7Z9VOy8pxg1pH0E7kolYckC
	ahou9v2THJO3RpVqN6LAfx3a/hKuFNem6muHyY1YYUV8UPcrCpP8zNBU6BfH+o3YQ15dE/YGGkJFu
	t1wSkhdtMcqxOaETTkQrSLuEvibog/5V2Dq7nE1uo99RiqIyuuHz+0aN0y8s931ZNNCjxFeEmMcVy
	jXqJkb/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfiw-0000000FXlI-3Sd2;
	Wed, 06 Aug 2025 15:06:38 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfgI-0000000FX7m-08uD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 15:03:55 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-459e497776cso95835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 08:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754492632; x=1755097432; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9hzpMymLHd0tOskj55BKws7W4GFUy+vHJNe1oPqssU=;
        b=3zRqFpEwDOTpCeU5YM79yHp9gZ9N57EQx3KoVXTxaVRC9eEtNECgHMx+WPfwX878AD
         N7IvnLM4tcYpFG7rkKngir66BXKcqXSq6AjKiEtmzmi/2hCYvOl9HHQDp1+2C/njKRhu
         duw80U7VEmqmEyiQZnej+OiObXmuyU3QC8RMh0bc0XEkaqv0xWTTs17qhWWzQTfYfLAR
         1fHz+SPDvLN5Ay9wThZxpirlCkrjkgNLkWXf1lcgQENWASeCqX0PzZhc+AlaKPvIUL3S
         3oM2qhDqKJEsQvpQU4cSyFIbS7cOBJmtQ2vysxvN4fpFPdfk5ojn91TAG7953MhjqnAW
         kmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754492632; x=1755097432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9hzpMymLHd0tOskj55BKws7W4GFUy+vHJNe1oPqssU=;
        b=mynnwfmvXq/2rhRujn1AI8FCJQVOOEMfpYdQtT9yg0/xM6aBhQCgSPopo3kkQjYtuc
         K+om2lQdIhMJiNkqvn6IohdCJVTUSxYTJlCZD/eZlw9H6Bk854isy+N/6q0wthsDeonR
         mKmEmPlgrbOngN1biuKUmOnrsrt/S2UhbiMNEh6PuvnRS2r1+d8uoipuVDjQ2S/2H7d8
         PFZMN90tPlP5aWdncNZOCA6v/dVQsEl6Uv7Y4Z7kKT5T0aBzMc+9NY2g/W7DLuTF8bRY
         oXxkEUTVXkwzj/sz0DwfHQIIXOgNlH9H9YzmnfmEI6Wu8ApueHmAuZlPCLAf0bbeytV/
         Khww==
X-Forwarded-Encrypted: i=1; AJvYcCVzxI1jrAjJkpahDGmExlN3BVRxEKash/aIpQYdumy1CgyQdKaXmEuuM+jQN7Om5lZxj54BtHTeVH9pKMTh8uOP@lists.infradead.org
X-Gm-Message-State: AOJu0YwG0KfQFW18bf/q3y/6HQp7jC4xnKV4Q1puxY7HO5NucuHKRbx9
	Hy567W4XHG5J70PkXJ0uveikrzx4mn8hDpt4i92IR2AsLhUA5wdzEHBB+1sfz3LYAKR4swwdGWo
	t/SwvXqXDGqS421PwyHpjrqPGmtM/oAgCFrYsY3eI
X-Gm-Gg: ASbGncud2Bgh18fsHJsIZy9dlvwROyxlUnNuStpwz38AUdIixyObqw4gWyVkd/Yt3v9
	1PlT2YZ3YleY1Od4Npk1Eg/CzIPezeF/Yt/kVUZ4g3tu1yi3VkE1qqt6eGyAva6QDFaB3ufBnSF
	FXm9kts/Npp/+qqf9xKF07buQyx57OxgJb0o31yw5zguIdegJfA4l30CBPiSkQiNPOXUbkB54cz
	1HgVvhBpzCDXoZBs4OoXkb+RQ6hqqTEWbnFZtNM
X-Google-Smtp-Source: AGHT+IFRSHXB1edxE24M2cr8EagNxoS3Umr3ekhDunEvzG71eZ1BXAYU7hknAAcoq+dJ3w6ps9DyZyBPQWpQnPYmDrs=
X-Received: by 2002:a05:600d:18:b0:453:65e6:b4a6 with SMTP id
 5b1f17b1804b1-459e6c8b7ccmr1554045e9.6.1754492631287; Wed, 06 Aug 2025
 08:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250731205844.1346839-1-jiaqiyan@google.com> <20250731205844.1346839-2-jiaqiyan@google.com>
In-Reply-To: <20250731205844.1346839-2-jiaqiyan@google.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Wed, 6 Aug 2025 08:03:39 -0700
X-Gm-Features: Ac12FXxJqYpQQ--vvuonDndHyeTf3i5rlJy2TpzkQAYWmQtSnPZvo6WJzUZ-3Qo
Message-ID: <CACw3F53dQmeLjwc4LG5SipiEhB7jj9hK+C_XWrT2eFQghMHXQg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] KVM: arm64: VM exit to userspace to handle SEA
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	duenwen@google.com, rananta@google.com, jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_080354_093337_EC3646FB 
X-CRM114-Status: GOOD (  35.05  )
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

Friendly ping for review

On Thu, Jul 31, 2025 at 1:58=E2=80=AFPM Jiaqi Yan <jiaqiyan@google.com> wro=
te:
>
> When APEI fails to handle a stage-2 synchronous external abort (SEA),
> today KVM directly injects an async SError to the VCPU then resumes it,
> which usually results in unpleasant guest kernel panic.
>
> One major situation of guest SEA is when vCPU consumes recoverable
> uncorrected memory error (UER). Although SError and guest kernel panic
> effectively stops the propagation of corrupted memory, guest may
> re-use the corrupted memory if auto-rebooted; in worse case, guest
> boot may run into poisoned memory. So there is room to recover from
> an UER in a more graceful manner.
>
> Alternatively KVM can redirect the synchronous SEA event to VMM to
> - Reduce blast radius if possible. VMM can inject a SEA to VCPU via
>   KVM's existing KVM_SET_VCPU_EVENTS API. If the memory poison
>   consumption or fault is not from guest kernel, blast radius can be
>   limited to the triggering thread in guest userspace, so VM can
>   keep running.
> - Allow VMM to protect from future memory poison consumption by
>   unmapping the page from stage-2, or to interrupt guest of the
>   poisoned page so guest kernel can unmap it from stage-1 page table.
> - Allow VMM to track SEA events that VM customers care about, to restart
>   VM when certain number of distinct poison events have happened,
>   to provide observability to customers in log management UI.
>
> Introduce an userspace-visible feature to enable VMM handle SEA:
> - KVM_CAP_ARM_SEA_TO_USER. As the alternative fallback behavior
>   when host APEI fails to claim a SEA, userspace can opt in this new
>   capability to let KVM exit to userspace during SEA if it is not
>   owned by host.
> - KVM_EXIT_ARM_SEA. A new exit reason is introduced for this.
>   KVM fills kvm_run.arm_sea with as much as possible information about
>   the SEA, enabling VMM to emulate SEA to guest by itself.
>   - Sanitized ESR_EL2. The general rule is to keep only the bits
>     useful for userspace and relevant to guest memory.
>   - Flags indicating if faulting guest physical address is valid.
>   - Faulting guest physical and virtual addresses if valid.
>
> Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
> Co-developed-by: Oliver Upton <oliver.upton@linux.dev>
> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> ---
>  arch/arm64/include/asm/kvm_host.h |  2 +
>  arch/arm64/kvm/arm.c              |  5 +++
>  arch/arm64/kvm/mmu.c              | 68 ++++++++++++++++++++++++++++++-
>  include/uapi/linux/kvm.h          | 10 +++++
>  4 files changed, 84 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/k=
vm_host.h
> index d373d555a69ba..8b4133a5aacf3 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -349,6 +349,8 @@ struct kvm_arch {
>  #define KVM_ARCH_FLAG_GUEST_HAS_SVE                    9
>         /* MIDR_EL1, REVIDR_EL1, and AIDR_EL1 are writable from userspace=
 */
>  #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS             10
> +       /* Unhandled SEAs are taken to userspace */
> +#define KVM_ARCH_FLAG_EXIT_SEA                         11
>         unsigned long flags;
>
>         /* VM-wide vCPU feature set */
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 7a1a8210ff918..aec6034db1e75 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -133,6 +133,10 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>                 }
>                 mutex_unlock(&kvm->lock);
>                 break;
> +       case KVM_CAP_ARM_SEA_TO_USER:
> +               r =3D 0;
> +               set_bit(KVM_ARCH_FLAG_EXIT_SEA, &kvm->arch.flags);
> +               break;
>         default:
>                 break;
>         }
> @@ -322,6 +326,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, lon=
g ext)
>         case KVM_CAP_IRQFD_RESAMPLE:
>         case KVM_CAP_COUNTER_OFFSET:
>         case KVM_CAP_ARM_WRITABLE_IMP_ID_REGS:
> +       case KVM_CAP_ARM_SEA_TO_USER:
>                 r =3D 1;
>                 break;
>         case KVM_CAP_SET_GUEST_DEBUG2:
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 9a45daf817bfd..f6a545700c15b 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1812,8 +1812,48 @@ static void handle_access_fault(struct kvm_vcpu *v=
cpu, phys_addr_t fault_ipa)
>         read_unlock(&vcpu->kvm->mmu_lock);
>  }
>
> +/*
> + * Returns true if the SEA should be handled locally within KVM if the a=
bort
> + * is caused by a kernel memory allocation (e.g. stage-2 table memory).
> + */
> +static bool host_owns_sea(struct kvm_vcpu *vcpu, u64 esr)
> +{
> +       /*
> +        * Without FEAT_RAS HCR_EL2.TEA is RES0, meaning any external abo=
rt
> +        * taken from a guest EL to EL2 is due to a host-imposed access (=
e.g.
> +        * stage-2 PTW).
> +        */
> +       if (!cpus_have_final_cap(ARM64_HAS_RAS_EXTN))
> +               return true;
> +
> +       /* KVM owns the VNCR when the vCPU isn't in a nested context. */
> +       if (is_hyp_ctxt(vcpu) && (esr & ESR_ELx_VNCR))
> +               return true;
> +
> +       /*
> +        * Determine if an external abort during a table walk happened at
> +        * stage-2 is only possible when S1PTW is set. Otherwise, since K=
VM
> +        * sets HCR_EL2.TEA, SEAs due to a stage-1 walk (i.e. accessing t=
he
> +        * PA of the stage-1 descriptor) can reach here and are reported
> +        * with a TTW ESR value.
> +        */
> +       return (esr_fsc_is_sea_ttw(esr) && (esr & ESR_ELx_S1PTW));
> +}
> +
>  int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
>  {
> +       struct kvm *kvm =3D vcpu->kvm;
> +       struct kvm_run *run =3D vcpu->run;
> +       u64 esr =3D kvm_vcpu_get_esr(vcpu);
> +       u64 esr_mask =3D ESR_ELx_EC_MASK  |
> +                      ESR_ELx_IL       |
> +                      ESR_ELx_FnV      |
> +                      ESR_ELx_EA       |
> +                      ESR_ELx_CM       |
> +                      ESR_ELx_WNR      |
> +                      ESR_ELx_FSC;
> +       u64 ipa;
> +
>         /*
>          * Give APEI the opportunity to claim the abort before handling i=
t
>          * within KVM. apei_claim_sea() expects to be called with IRQs en=
abled.
> @@ -1822,7 +1862,33 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
>         if (apei_claim_sea(NULL) =3D=3D 0)
>                 return 1;
>
> -       return kvm_inject_serror(vcpu);
> +       if (host_owns_sea(vcpu, esr) ||
> +           !test_bit(KVM_ARCH_FLAG_EXIT_SEA, &vcpu->kvm->arch.flags))
> +               return kvm_inject_serror(vcpu);
> +
> +       /* ESR_ELx.SET is RES0 when FEAT_RAS isn't implemented. */
> +       if (kvm_has_ras(kvm))
> +               esr_mask |=3D ESR_ELx_SET_MASK;
> +
> +       /*
> +        * Exit to userspace, and provide faulting guest virtual and phys=
ical
> +        * addresses in case userspace wants to emulate SEA to guest by
> +        * writing to FAR_ELx and HPFAR_ELx registers.
> +        */
> +       memset(&run->arm_sea, 0, sizeof(run->arm_sea));
> +       run->exit_reason =3D KVM_EXIT_ARM_SEA;
> +       run->arm_sea.esr =3D esr & esr_mask;
> +
> +       if (!(esr & ESR_ELx_FnV))
> +               run->arm_sea.gva =3D kvm_vcpu_get_hfar(vcpu);
> +
> +       ipa =3D kvm_vcpu_get_fault_ipa(vcpu);
> +       if (ipa !=3D INVALID_GPA) {
> +               run->arm_sea.flags |=3D KVM_EXIT_ARM_SEA_FLAG_GPA_VALID;
> +               run->arm_sea.gpa =3D ipa;
> +       }
> +
> +       return 0;
>  }
>
>  /**
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index e4e566ff348b0..b2cc3d74d769c 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -179,6 +179,7 @@ struct kvm_xen_exit {
>  #define KVM_EXIT_LOONGARCH_IOCSR  38
>  #define KVM_EXIT_MEMORY_FAULT     39
>  #define KVM_EXIT_TDX              40
> +#define KVM_EXIT_ARM_SEA          41
>
>  /* For KVM_EXIT_INTERNAL_ERROR */
>  /* Emulate instruction failed. */
> @@ -469,6 +470,14 @@ struct kvm_run {
>                                 } get_tdvmcall_info;
>                         };
>                 } tdx;
> +               /* KVM_EXIT_ARM_SEA */
> +               struct {
> +#define KVM_EXIT_ARM_SEA_FLAG_GPA_VALID        (1ULL << 0)
> +                       __u64 flags;
> +                       __u64 esr;
> +                       __u64 gva;
> +                       __u64 gpa;
> +               } arm_sea;
>                 /* Fix the size of the union. */
>                 char padding[256];
>         };
> @@ -957,6 +966,7 @@ struct kvm_enable_cap {
>  #define KVM_CAP_ARM_EL2_E2H0 241
>  #define KVM_CAP_RISCV_MP_STATE_RESET 242
>  #define KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED 243
> +#define KVM_CAP_ARM_SEA_TO_USER 244
>
>  struct kvm_irq_routing_irqchip {
>         __u32 irqchip;
> --
> 2.50.1.565.gc32cd1483b-goog
>

