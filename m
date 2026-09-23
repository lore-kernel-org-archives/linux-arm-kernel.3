Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7FBC98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPCHCxVObOhTDqTX2XFYVpJgWahn2uORF0ryZ1jQFGQ=; b=MPtAih+kZzP0j9GiAKSMLVsxzC
	puDOmL08mJ5nzYO1AfRXRJPZEyo5EWP/NsXnscSP0Mm/AQrcqIZU75qBytxP9A/2BeT17SDX6qD9I
	n8LeXda4Jyo6GVhdosOtgT7DA6TBawZRq7LTAK9hXftbByUgd9IFkKHTCTsnhD6VNoefLr4jIiMT1
	PCbjLUkqEMOx08GsggRg2vWIR1Tu1coshItjDR5pMv6VKt8uceZcAk0Hz6T9xkLuzzh/xUrOWRo09
	BJBozsT7KmtYQthPE884IqAdgWoRedwtXqD+4L47IPzhw8jAPUr9trQGEjdsgW3j7p/RC0ATgQHW4
	U+TH+gxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Re4-00000009Azn-1Jju;
	Wed, 23 Sep 2026 18:24:40 +0000
Received: from out-232.mta1.migadu.com ([95.215.58.232] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Re0-00000009AyZ-2VH1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:24:39 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=3AT4rByP98oEYY5V0imDm8lqQMNuyQqmSmXAQkSLF74=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790187873; v=1; x=1790792673;
 b=VwsN9/oXVEhYAPDQlbeF7SoMTY2/f0Gr7KjBUTo406m/Q6w2QukiJLyjCanVD+CSGgXtsVYf
 WRQIJ718ReE9UJq7LpwkYm71gvk4p+NQK0mlMBeYFnVMhU1ipwWpX2OK5IZXen6m1REw8MpW998
 ht3HO0EqIdqJj8Nt3wf/4xOA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e87c00c630458800;
	Wed, 23 Sep 2026 18:24:33 +0000
X-Mizu-Trace-ID: e87c00c630458800
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso1156e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:24:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByaK6mUNufaGdOXS9OOkt/VISflPNAAhqPLImFoSPJNe/MSH+qeHTb5zy5YtLLGuPmTPwfNtiUvZ06OShxeQS/h@lists.infradead.org
X-Gm-Message-State: AFuF++lpoUf8H3gUGtsZr2mTNiAdPeuD7Z15sVuQpjDl/zIIS5jEOdNl
	6PuzzSYXh1lTvuJOCyS/ZWR40pPiciqwI5BgC4/3A3DdrLhxsQ0ona596TGb1D1wSnTztzjANrQ
	BMoM1ZWqQb1Y/dBBCBTGw5na33IilIFSi9oWwlS+c
X-Received: by 2002:a05:6512:2529:b0:5ae:b726:5f1f with SMTP id
 2adb3069b0e04-5b8dda18a9fmr50396e87.8.1790187868407; Wed, 23 Sep 2026
 11:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org> <20260923-kvm-arm-prefault-v4-3-d4b0b4dfa8c3@kernel.org>
In-Reply-To: <20260923-kvm-arm-prefault-v4-3-d4b0b4dfa8c3@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 19:23:52 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxU=umsuTgBYV=+Hwr6B88XK27+MuMt_5XR2g=+Svou4Q@mail.gmail.com>
X-Gm-Features: AclHuK9Na85hnpJ9-Yww0aniT8r5X57kXGzjLluJ2YKzjeo2Rd-eBq0aHZYjmw0
Message-ID: <CA+EHjTxU=umsuTgBYV=+Hwr6B88XK27+MuMt_5XR2g=+Svou4Q@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] KVM: arm64: Use ESR helpers in guest abort handling
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
	Jack Thomson <jackabt.amazon@gmail.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_112437_322982_9B1719D4 
X-CRM114-Status: GOOD (  31.40  )
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

On Wed, 23 Sept 2026 at 16:16, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> Convert kvm_vcpu_* ESR wrappers in kvm_emulate.h and the stage-2 abort
> handling logic in mmu.c to use the newly introduced ESR helpers.
>
> kvm_is_write_fault() is split in two, with esr_abt_is_write_fault()
> handling the esr parts of the operation and kvm_is_write_fault() wrapping
> it.
>
> Introduce/modify kvm_s2_fault_is_{perm,exec,write}(),
> kvm_s2_perm_fault_granule() so the abort path reads the ESR from a single
> place.
>
> This is to allow a later change to permit stage 2 pre-faulting via a
> synthetic ESR value.
>
> Remove now-unused kvm_vcpu_dabt_is_cm(), kvm_vcpu_trap_is_exec_fault() and
> kvm_vcpu_trap_get_perm_fault_granule().
>
> No functional change intended.
>
> Reviewed-by: Oliver Upton <oupton@kernel.org>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/kvm_emulate.h | 50 +++++++----------------
>  arch/arm64/kvm/mmu.c                 | 78 ++++++++++++++++++++++--------------
>  2 files changed, 61 insertions(+), 67 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 654e8c1b4461..708a4b6d8823 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -421,18 +421,13 @@ static __always_inline int kvm_vcpu_dabt_get_rd(const struct kvm_vcpu *vcpu)
>
>  static __always_inline bool kvm_vcpu_abt_iss1tw(const struct kvm_vcpu *vcpu)
>  {
> -       return !!(kvm_vcpu_get_esr(vcpu) & ESR_ELx_S1PTW);
> +       return esr_abt_is_s1ptw(kvm_vcpu_get_esr(vcpu));
>  }
>
>  /* Always check for S1PTW *before* using this. */
>  static __always_inline bool kvm_vcpu_dabt_iswrite(const struct kvm_vcpu *vcpu)
>  {
> -       return kvm_vcpu_get_esr(vcpu) & ESR_ELx_WNR;
> -}
> -
> -static inline bool kvm_vcpu_dabt_is_cm(const struct kvm_vcpu *vcpu)
> -{
> -       return !!(kvm_vcpu_get_esr(vcpu) & ESR_ELx_CM);
> +       return esr_dabt_is_write(kvm_vcpu_get_esr(vcpu));
>  }
>
>  static __always_inline unsigned int kvm_vcpu_dabt_get_as(const struct kvm_vcpu *vcpu)
> @@ -453,12 +448,7 @@ static __always_inline u8 kvm_vcpu_trap_get_class(const struct kvm_vcpu *vcpu)
>
>  static inline bool kvm_vcpu_trap_is_iabt(const struct kvm_vcpu *vcpu)
>  {
> -       return kvm_vcpu_trap_get_class(vcpu) == ESR_ELx_EC_IABT_LOW;
> -}
> -
> -static inline bool kvm_vcpu_trap_is_exec_fault(const struct kvm_vcpu *vcpu)
> -{
> -       return kvm_vcpu_trap_is_iabt(vcpu) && !kvm_vcpu_abt_iss1tw(vcpu);
> +       return esr_trap_is_iabt(kvm_vcpu_get_esr(vcpu));
>  }
>
>  static __always_inline u8 kvm_vcpu_trap_get_fault(const struct kvm_vcpu *vcpu)
> @@ -478,26 +468,9 @@ bool kvm_vcpu_trap_is_translation_fault(const struct kvm_vcpu *vcpu)
>         return esr_fsc_is_translation_fault(kvm_vcpu_get_esr(vcpu));
>  }
>
> -static inline
> -u64 kvm_vcpu_trap_get_perm_fault_granule(const struct kvm_vcpu *vcpu)
> -{
> -       unsigned long esr = kvm_vcpu_get_esr(vcpu);
> -
> -       BUG_ON(!esr_fsc_is_permission_fault(esr));
> -       return BIT(ARM64_HW_PGTABLE_LEVEL_SHIFT(esr & ESR_ELx_FSC_LEVEL));
> -}
> -
>  static __always_inline bool kvm_vcpu_abt_issea(const struct kvm_vcpu *vcpu)
>  {
> -       switch (kvm_vcpu_trap_get_fault(vcpu)) {
> -       case ESR_ELx_FSC_EXTABT:
> -       case ESR_ELx_FSC_SEA_TTW(-1) ... ESR_ELx_FSC_SEA_TTW(3):
> -       case ESR_ELx_FSC_SECC:
> -       case ESR_ELx_FSC_SECC_TTW(-1) ... ESR_ELx_FSC_SECC_TTW(3):
> -               return true;
> -       default:
> -               return false;
> -       }
> +       return esr_abt_is_sea(kvm_vcpu_get_esr(vcpu));
>  }
>
>  static __always_inline int kvm_vcpu_sys_get_rt(struct kvm_vcpu *vcpu)
> @@ -506,9 +479,9 @@ static __always_inline int kvm_vcpu_sys_get_rt(struct kvm_vcpu *vcpu)
>         return ESR_ELx_SYS64_ISS_RT(esr);
>  }
>
> -static inline bool kvm_is_write_fault(struct kvm_vcpu *vcpu)
> +static inline bool esr_abt_is_write_fault(unsigned long esr)
>  {
> -       if (kvm_vcpu_abt_iss1tw(vcpu)) {
> +       if (esr_abt_is_s1ptw(esr)) {
>                 /*
>                  * Only a permission fault on a S1PTW should be
>                  * considered as a write. Otherwise, page tables baked
> @@ -521,13 +494,18 @@ static inline bool kvm_is_write_fault(struct kvm_vcpu *vcpu)
>                  * first), then a permission fault to allow the flags
>                  * to be set.
>                  */
> -               return kvm_vcpu_trap_is_permission_fault(vcpu);
> +               return esr_fsc_is_permission_fault(esr);
>         }
>
> -       if (kvm_vcpu_trap_is_iabt(vcpu))
> +       if (esr_trap_is_iabt(esr))
>                 return false;
>
> -       return kvm_vcpu_dabt_iswrite(vcpu);
> +       return esr_dabt_is_write(esr);
> +}
> +
> +static inline bool kvm_is_write_fault(struct kvm_vcpu *vcpu)
> +{
> +       return esr_abt_is_write_fault(kvm_vcpu_get_esr(vcpu));
>  }
>
>  static inline unsigned long kvm_vcpu_get_mpidr_aff(struct kvm_vcpu *vcpu)
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index d6187295c373..5e10a4cd31ea 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1657,10 +1657,35 @@ struct kvm_s2_fault_desc {
>         unsigned long           hva;
>  };
>
> +static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
> +{
> +       return esr_fsc_is_permission_fault(kvm_vcpu_get_esr(s2fd->vcpu));
> +}
> +
> +static bool kvm_s2_fault_is_exec(const struct kvm_s2_fault_desc *s2fd)
> +{
> +       return esr_abt_is_exec_fault(kvm_vcpu_get_esr(s2fd->vcpu));
> +}
> +
> +static bool kvm_s2_fault_is_write(const struct kvm_s2_fault_desc *s2fd)
> +{
> +       return esr_abt_is_write_fault(kvm_vcpu_get_esr(s2fd->vcpu));
> +}
> +
> +static u64 kvm_s2_perm_fault_granule(const struct kvm_s2_fault_desc *s2fd)
> +{
> +       u64 level;
> +
> +       if (!kvm_s2_fault_is_perm(s2fd))
> +               return 0;
> +       level = kvm_vcpu_get_esr(s2fd->vcpu) & ESR_ELx_FSC_LEVEL;
> +       return BIT(ARM64_HW_PGTABLE_LEVEL_SHIFT(level));
> +}
> +
>  static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>  {
>         bool write_fault, exec_fault;
> -       bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
> +       bool perm_fault = kvm_s2_fault_is_perm(s2fd);
>         enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
>         enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
>         struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
> @@ -1690,8 +1715,8 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>         else
>                 gfn = s2fd->fault_ipa >> PAGE_SHIFT;
>
> -       write_fault = kvm_is_write_fault(s2fd->vcpu);
> -       exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu);
> +       write_fault = kvm_s2_fault_is_write(s2fd);
> +       exec_fault = kvm_s2_fault_is_exec(s2fd);
>
>         VM_WARN_ON_ONCE(write_fault && exec_fault);
>
> @@ -1910,11 +1935,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
>         return vma_shift;
>  }
>
> -static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
> -{
> -       return kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
> -}
> -
>  static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
>                                      struct kvm_s2_fault_vma_info *s2vi)
>  {
> @@ -1980,7 +2000,7 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
>                 return ret;
>
>         s2vi->pfn = __kvm_faultin_pfn(s2fd->memslot, get_canonical_gfn(s2fd, s2vi),
> -                                     kvm_is_write_fault(s2fd->vcpu) ? FOLL_WRITE : 0,
> +                                     kvm_s2_fault_is_write(s2fd) ? FOLL_WRITE : 0,
>                                       &s2vi->map_writable, &s2vi->page);
>         if (unlikely(is_error_noslot_pfn(s2vi->pfn))) {
>                 if (s2vi->pfn == KVM_PFN_ERR_HWPOISON) {
> @@ -2038,7 +2058,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>  {
>         struct kvm *kvm = s2fd->vcpu->kvm;
>
> -       if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu) && s2vi->map_non_cacheable)
> +       if (kvm_s2_fault_is_exec(s2fd) && s2vi->map_non_cacheable)
>                 return -ENOEXEC;
>
>         /*
> @@ -2056,13 +2076,13 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>
>         if (s2vi->map_writable && (s2vi->device ||
>                                    !memslot_is_logging(s2fd->memslot) ||
> -                                  kvm_is_write_fault(s2fd->vcpu)))
> +                                  kvm_s2_fault_is_write(s2fd)))
>                 *prot |= KVM_PGTABLE_PROT_W;
>
>         if (s2fd->nested)
>                 *prot = adjust_nested_fault_perms(s2fd->nested, *prot);
>
> -       if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu))
> +       if (kvm_s2_fault_is_exec(s2fd))
>                 *prot |= KVM_PGTABLE_PROT_X;
>
>         if (s2vi->map_non_cacheable)
> @@ -2115,8 +2135,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>         if (mmu_invalidate_retry(kvm, s2vi->mmu_seq))
>                 goto out_unlock;
>
> -       perm_fault_granule = (kvm_s2_fault_is_perm(s2fd) ?
> -                             kvm_vcpu_trap_get_perm_fault_granule(s2fd->vcpu) : 0);
> +       perm_fault_granule = kvm_s2_perm_fault_granule(s2fd);
>         mapping_size = s2vi->vma_pagesize;
>         pfn = s2vi->pfn;
>         gfn = s2vi->gfn;
> @@ -2195,7 +2214,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>
>  static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>  {
> -       bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
> +       bool perm_fault = kvm_s2_fault_is_perm(s2fd);
>         struct kvm_s2_fault_vma_info s2vi = {};
>         enum kvm_pgtable_prot prot;
>         void *memcache;
> @@ -2342,7 +2361,7 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
>  int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  {
>         struct kvm_s2_trans nested_trans, *nested = NULL;
> -       unsigned long esr;
> +       unsigned long esr = kvm_vcpu_get_esr(vcpu);
>         phys_addr_t fault_ipa; /* The address we faulted on */
>         phys_addr_t ipa; /* Always the IPA in the L1 guest phys space */
>         struct kvm_memory_slot *memslot;
> @@ -2351,11 +2370,9 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>         gfn_t gfn;
>         int ret, idx;
>
> -       if (kvm_vcpu_abt_issea(vcpu))
> +       if (esr_abt_is_sea(esr))
>                 return kvm_handle_guest_sea(vcpu);
>
> -       esr = kvm_vcpu_get_esr(vcpu);
> -
>         /*
>          * The fault IPA should be reliable at this point as we're not dealing
>          * with an SEA.
> @@ -2364,7 +2381,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>         if (KVM_BUG_ON(ipa == INVALID_GPA, vcpu->kvm))
>                 return -EFAULT;
>
> -       is_iabt = kvm_vcpu_trap_is_iabt(vcpu);
> +       is_iabt = esr_trap_is_iabt(esr);
>
>         if (esr_fsc_is_translation_fault(esr)) {
>                 /* Beyond sanitised PARange (which is the IPA limit) */
> @@ -2381,7 +2398,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>                 }
>         }
>
> -       trace_kvm_guest_fault(*vcpu_pc(vcpu), kvm_vcpu_get_esr(vcpu),
> +       trace_kvm_guest_fault(*vcpu_pc(vcpu), esr,
>                               kvm_vcpu_get_hfar(vcpu), fault_ipa);
>
>         /* Check the stage-2 fault is trans. fault or write fault */
> @@ -2389,10 +2406,10 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>             !esr_fsc_is_permission_fault(esr) &&
>             !esr_fsc_is_access_flag_fault(esr) &&
>             !esr_fsc_is_excl_atomic_fault(esr)) {
> -               kvm_err("Unsupported FSC: EC=%#x xFSC=%#lx ESR_EL2=%#lx\n",
> -                       kvm_vcpu_trap_get_class(vcpu),
> -                       (unsigned long)kvm_vcpu_trap_get_fault(vcpu),
> -                       (unsigned long)kvm_vcpu_get_esr(vcpu));
> +               kvm_err("Unsupported FSC: EC=%#lx xFSC=%#lx ESR_EL2=%#lx\n",
> +                       ESR_ELx_EC(esr),
> +                       (unsigned long)(esr & ESR_ELx_FSC),
> +                       (unsigned long)esr);
>                 return -EFAULT;
>         }
>
> @@ -2441,7 +2458,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>         gfn = ipa >> PAGE_SHIFT;
>         memslot = gfn_to_memslot(vcpu->kvm, gfn);
>         hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
> -       write_fault = kvm_is_write_fault(vcpu);
> +       write_fault = esr_abt_is_write_fault(esr);
>         if (kvm_is_error_hva(hva) || (write_fault && !writable)) {
>                 /*
>                  * The guest has put either its instructions or its page-tables
> @@ -2454,7 +2471,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>                         goto out;
>                 }
>
> -               if (kvm_vcpu_abt_iss1tw(vcpu)) {
> +               if (esr_abt_is_s1ptw(esr)) {
>                         ret = kvm_inject_sea_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
>                         goto out_unlock;
>                 }
> @@ -2469,7 +2486,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>                  * So let's assume that the guest is just being
>                  * cautious, and skip the instruction.
>                  */
> -               if (kvm_is_error_hva(hva) && kvm_vcpu_dabt_is_cm(vcpu)) {
> +               if (kvm_is_error_hva(hva) && esr_dabt_is_cm(esr)) {
>                         kvm_incr_pc(vcpu);
>                         ret = 1;
>                         goto out_unlock;
> @@ -2506,9 +2523,8 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>         if (kvm_vm_is_protected(vcpu->kvm)) {
>                 ret = pkvm_mem_abort(&s2fd);
>         } else {
> -               VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
> -                               !write_fault &&
> -                               !kvm_vcpu_trap_is_exec_fault(vcpu));
> +               VM_WARN_ON_ONCE(kvm_s2_fault_is_perm(&s2fd) && !write_fault &&
> +                               !kvm_s2_fault_is_exec(&s2fd));
>
>                 if (kvm_slot_has_gmem(memslot))
>                         ret = gmem_abort(&s2fd);
>
> --
> 2.55.0
>

