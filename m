Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3D1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 00:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kx0iuUtrXjaS9cECOj10GYU2PRdzkgNl851QXdF7aTw=; b=KmPcHmiklHxf9wJ6OosbglAIOV
	2P4osDNEir4gXLQQV/oObxuskCibdJ40lHtfw/ltZL92RTMhoqsHiMe4STHVi1NKuGpybBZwwaBOT
	otP4ihoI67+R7Az8hOQvRcLOeqfP+T91SnQUcL+rS1X8+4ieg3fgxHlEkS4QDWVPbo7/YikPrdEHq
	intGJpxF3Xq7uK5uDK8ADasLtFIFfLYNlwaH1schKxie0ztPydaWby05lzG+2ppMd5oh2idPUhhOM
	z3cbIya7k6zfkO+7BVfgtnPh/us2ysJ9/FVMu6MG3LF3liW+m3fpAfqkSxymAlFNYYqjx7d6MjR2C
	P0CP3GKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaNjb-0000000G5Hx-1Y2X;
	Sat, 12 Jul 2025 00:04:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaNeH-0000000G4KF-0Ojr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 23:59:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-456007cfcd7so26115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 16:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752278363; x=1752883163; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kx0iuUtrXjaS9cECOj10GYU2PRdzkgNl851QXdF7aTw=;
        b=sOYeoKJve+7H7tlQI46wPC5XR33LKXPnxgZVw6cpv5B5u1T5jdpornf5TmCxQf7aCY
         hmc7J/gzs/GX1rwlr3MLFEBdmr8dD6mPjevlvrxagea9GsULTXRtg+nq0WoYgQ1Ai4pO
         snZnsrmvcHPLhoZRFvXiePx3O6JDUDl+nG6bUJTfOBpfjD46iDzV6CsXfgvRm9/MPT4E
         BVNqqTZQm2VOuyflAx2CN4KDtlNFFfEqn2djzDc8E+C1JBFu3EuwpUuLmqz8e6PjMFU4
         MYsovVWBV3s4evmGIlRLfyBzVslQ/W0jC51nMDwlsuB1x6LQpisJaBHW1N5ihkFeLq0Y
         CZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752278363; x=1752883163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kx0iuUtrXjaS9cECOj10GYU2PRdzkgNl851QXdF7aTw=;
        b=o+z7YYqHJIFBzTl6taiGndU/emP1tLgJdCTex6aOC7zYUICdLNMO72nn2kIFXykiRT
         B6fexyPDsrVTsYLUEhUe8YggvSSZzM1xfCMhE3J+QSj6kfj3YaQrYsd0eYAzQSinmJVL
         C70JT7EIO5HkcnXFE19UehI+DcYEO6QcR4dk2+rpaVIsgpSuidTi3NwHa1gysHoOvSKO
         Ze/DCW7NEKOXl1uPpKO/4JSzt80SSVQqK15erKi/95LgO2dGOqjI91aUKcH3dCgAzrGF
         IiWg21V88ksXvwZmmuK5Q2S68F5XX1XJrLCF+f+OUujm4O6W0j8x7yutF8YXtfhrPJHE
         t5dA==
X-Forwarded-Encrypted: i=1; AJvYcCW6c8wHvN2peDs4pVe5B2lTiybYMbCGTxJxeu17IOohKfHyKAAMtuLa+fHyTDKEDhXFGeDFvZVfzufYoN16duPJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0YqEqOInNYEDOQ5Ifv1o/U94b9QZz5g6gR7RIdo9JK97BJPY4
	3bVtpYzAvB0DIPXQT1rEJn/MUxaEZPDeSnO82WpEL71V8NDRHC1YWjtWL0U9pdoVZEe2KaH0akZ
	29RJbc6tY4V8rjNjibIOiN6Wo5HkKyrWurgvXsRuQ
X-Gm-Gg: ASbGncuUlw4sQMe/7xtF+xsjh1EjFj8CuPclhZNSLREwp2GbLG3eztOZql6drUaNMPe
	IoEDN8i5LiVFSAxUdLVErDaOgptbvTKf35fSQfffvHYpntk0gzKuTadIp+yYABcfK3vODx1RL/T
	X8C8axTqDP8tRl6gVz24W8uVNVdhsB/YBiVOwvJgxEtFpQ5xzp+iMSXlLtQlRebPBWxE8Csp1Fu
	mQgmAISprTpZxDDhYaJH1WObQ50ezjuS4By0w==
X-Google-Smtp-Source: AGHT+IHvHUxIq2c9hcTn9eoB+mM5K/ydF4PCHTTqsyGsI0A7WB9cz5lSEPAy1h5s7uUVuuYzUNVhGEJc8cN5YSZdxzw=
X-Received: by 2002:a05:600c:4302:b0:442:feea:622d with SMTP id
 5b1f17b1804b1-45604731777mr157435e9.1.1752278363318; Fri, 11 Jul 2025
 16:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250604050902.3944054-1-jiaqiyan@google.com> <20250604050902.3944054-2-jiaqiyan@google.com>
 <aHFohmTb9qR_JG1E@linux.dev>
In-Reply-To: <aHFohmTb9qR_JG1E@linux.dev>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Fri, 11 Jul 2025 16:59:11 -0700
X-Gm-Features: Ac12FXyEUSuxc7r8GLcMk5nWGgqkSYOPBBV406o0QqoPhRyOHiOSPV8Iz9e8AVY
Message-ID: <CACw3F509B=AHhpaTcuH9O851rrDdHh1baC8uRYy7bDa7BSMhgg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] KVM: arm64: VM exit to userspace to handle SEA
To: Oliver Upton <oliver.upton@linux.dev>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, duenwen@google.com, rananta@google.com, 
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_165925_138468_1F555A3E 
X-CRM114-Status: GOOD (  48.02  )
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

On Fri, Jul 11, 2025 at 12:40=E2=80=AFPM Oliver Upton <oliver.upton@linux.d=
ev> wrote:
>
> Hi Jiaqi,
>
> On Wed, Jun 04, 2025 at 05:08:56AM +0000, Jiaqi Yan wrote:
> > When APEI fails to handle a stage-2 synchronous external abort (SEA),
> > today KVM directly injects an async SError to the VCPU then resumes it,
> > which usually results in unpleasant guest kernel panic.
> >
> > One major situation of guest SEA is when vCPU consumes recoverable
> > uncorrected memory error (UER). Although SError and guest kernel panic
> > effectively stops the propagation of corrupted memory, there is room
> > to recover from an UER in a more graceful manner.
> >
> > Alternatively KVM can redirect the synchronous SEA event to VMM to
> > - Reduce blast radius if possible. VMM can inject a SEA to VCPU via
> >   KVM's existing KVM_SET_VCPU_EVENTS API. If the memory poison
> >   consumption or fault is not from guest kernel, blast radius can be
> >   limited to the triggering thread in guest userspace, so VM can
> >   keep running.
> > - VMM can protect from future memory poison consumption by unmapping
> >   the page from stage-2, or interrupt guest of the poisoned guest page
> >   so guest kernel can unmap it from stage-1.
> > - VMM can also track SEA events that VM customers care about, restart
> >   VM when certain number of distinct poison events have happened,
> >   provide observability to customers in log management UI.
> >
> > Introduce an userspace-visible feature to enable VMM to handle SEA:
> > - KVM_CAP_ARM_SEA_TO_USER. As the alternative fallback behavior
> >   when host APEI fails to claim a SEA, userspace can opt in this new
> >   capability to let KVM exit to userspace during SEA if it is not
> >   caused by access on memory of stage-2 translation table.
> > - KVM_EXIT_ARM_SEA. A new exit reason is introduced for this.
> >   KVM fills kvm_run.arm_sea with as much as possible information about
> >   the SEA, enabling VMM to emulate SEA to guest by itself.
> >   - Sanitized ESR_EL2. The general rule is to keep only the bits
> >     useful for userspace and relevant to guest memory. See code
> >     comments for why bits are hidden/reported.
> >   - If faulting guest virtual and physical addresses are available.
> >   - Faulting guest virtual address if available.
> >   - Faulting guest physical address if available.
> >
> > Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
>
> I was reviewing this locally and wound up making enough changes where it
> just made more sense to share the diff. General comments:

Thanks for the diff, Oliver! I will work on a v3 based on it.

>
>  - Avoid adding helpers to headers when they're used in a single
>    callsite / compilation unit
>
>  - Add some detail about FEAT_RAS where we may still exit to userspace
>    for host-controlled memory, as we cannot differentiate between a
>    stage-1 or stage-2 TTW SEA when taken on the descriptor PA

Ah, IIUC, you are saying even if the FSC code tells fault is on TTW
(esr_fsc_is_secc_ttw or esr_fsc_is_sea_ttw), it can either be guest
stage-1's or stage-2's descriptor PA, and we can tell which from
which.

However, if ESR_ELx_S1PTW is set, we can tell this is a sub-case of
stage-2 descriptor PA, their usage is for stage-1 PTW but they are
stage-2 memory.

Is my current understanding right?

>
>  - Explicitly handle SEAs due to VNCR (I have a separate prereq patch)
>
> From aac0bb8f90c43b5b17c3b4e50379cb8ca828812c Mon Sep 17 00:00:00 2001
> From: Jiaqi Yan <jiaqiyan@google.com>
> Date: Wed, 4 Jun 2025 05:08:56 +0000
> Subject: [PATCH] KVM: arm64: VM exit to userspace to handle SEA
>
> When APEI fails to handle a stage-2 synchronous external abort (SEA),
> today KVM directly injects an async SError to the VCPU then resumes it,
> which usually results in unpleasant guest kernel panic.
>
> One major situation of guest SEA is when vCPU consumes recoverable
> uncorrected memory error (UER). Although SError and guest kernel panic
> effectively stops the propagation of corrupted memory, there is room
> to recover from an UER in a more graceful manner.
>
> Alternatively KVM can redirect the synchronous SEA event to VMM to
> - Reduce blast radius if possible. VMM can inject a SEA to VCPU via
>   KVM's existing KVM_SET_VCPU_EVENTS API. If the memory poison
>   consumption or fault is not from guest kernel, blast radius can be
>   limited to the triggering thread in guest userspace, so VM can
>   keep running.
> - VMM can protect from future memory poison consumption by unmapping
>   the page from stage-2, or interrupt guest of the poisoned guest page
>   so guest kernel can unmap it from stage-1.
> - VMM can also track SEA events that VM customers care about, restart
>   VM when certain number of distinct poison events have happened,
>   provide observability to customers in log management UI.
>
> Introduce an userspace-visible feature to enable VMM to handle SEA:
> - KVM_CAP_ARM_SEA_TO_USER. As the alternative fallback behavior
>   when host APEI fails to claim a SEA, userspace can opt in this new
>   capability to let KVM exit to userspace during SEA if it is not
>   caused by access on memory of stage-2 translation table.
> - KVM_EXIT_ARM_SEA. A new exit reason is introduced for this.
>   KVM fills kvm_run.arm_sea with as much as possible information about
>   the SEA, enabling VMM to emulate SEA to guest by itself.
>   - Sanitized ESR_EL2. The general rule is to keep only the bits
>     useful for userspace and relevant to guest memory. See code
>     comments for why bits are hidden/reported.
>   - If faulting guest virtual and physical addresses are available.
>   - Faulting guest virtual address if available.
>   - Faulting guest physical address if available.
>
> Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
> Link: https://lore.kernel.org/r/20250604050902.3944054-2-jiaqiyan@google.=
com
> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> ---
>  arch/arm64/include/asm/kvm_host.h |  2 +
>  arch/arm64/kvm/arm.c              |  5 +++
>  arch/arm64/kvm/mmu.c              | 67 ++++++++++++++++++++++++++++++-
>  include/uapi/linux/kvm.h          | 10 +++++
>  4 files changed, 83 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/k=
vm_host.h
> index e54d29feb469..98ce2d58ac8d 100644
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
> index 7a1a8210ff91..aec6034db1e7 100644
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
> index a34924d75069..26b2e71994be 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1813,8 +1813,48 @@ static void handle_access_fault(struct kvm_vcpu *v=
cpu, phys_addr_t fault_ipa)
>         read_unlock(&vcpu->kvm->mmu_lock);
>  }
>
> +/*
> + * Returns true if the SEA should be handled locally within KVM if the a=
bort is
> + * caused by a kernel memory allocation (e.g. stage-2 table memory).
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
> +        * Determining if an external abort during a table walk happened =
at
> +        * stage-2 is only possible with S1PTW is set. Otherwise, since K=
VM
> +        * sets HCR_EL2.TEA, SEAs due to a stage-1 walk (i.e. accessing t=
he PA
> +        * of the stage-1 descriptor) can reach here and are reported wit=
h a
> +        * TTW ESR value.
> +        */
> +       return esr_fsc_is_sea_ttw(esr) && (esr & ESR_ELx_S1PTW);

Should we include esr_fsc_is_secc_ttw? like
  (esr_fsc_is_sea_ttw(esr) || esr_fsc_is_secc_ttw(esr)) && (esr & ESR_ELx_S=
1PTW)

> +}
> +
>  int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
>  {
> +       u64 esr =3D kvm_vcpu_get_esr(vcpu);
> +       struct kvm_run *run =3D vcpu->run;
> +       struct kvm *kvm =3D vcpu->kvm;
> +       u64 esr_mask =3D ESR_ELx_EC_MASK  |
> +                      ESR_ELx_FnV      |
> +                      ESR_ELx_EA       |
> +                      ESR_ELx_CM       |
> +                      ESR_ELx_WNR      |
> +                      ESR_ELx_FSC;

Do you (and why) exclude ESR_ELx_IL on purpose?

BTW, if my previous statement about TTW SEA is correct, then I also
understand why we need to explicitly exclude ESR_ELx_S1PTW.

> +       u64 ipa;
> +
> +
>         /*
>          * Give APEI the opportunity to claim the abort before handling i=
t
>          * within KVM. apei_claim_sea() expects to be called with IRQs
> @@ -1824,7 +1864,32 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
>         if (apei_claim_sea(NULL) =3D=3D 0)

I assume kvm should still lockdep_assert_irqs_enabled(), right? That
is, a WARN_ON_ONCE is still useful in case?


>                 return 1;
>
> -       return kvm_inject_serror(vcpu);
> +       if (host_owns_sea(vcpu, esr) || !test_bit(KVM_ARCH_FLAG_EXIT_SEA,=
 &kvm->arch.flags))
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
> +        * writing to FAR_EL1 and HPFAR_EL1 registers.
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
> index e4e566ff348b..b2cc3d74d769 100644
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
> 2.39.5

