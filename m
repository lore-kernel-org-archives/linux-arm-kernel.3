Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B31C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJyyu1D+f+Mwklxj3+Vx6E5Q7zHjO6Zps4podbwnTiU=; b=wNGJDfCTq57OB00RPNlz4JGh9I
	kT7pMmOUcVHr1zMafHBEY59fy0QSVlzWdDzspCYBDgaD9FsgnwxU4+XnNX0I/uZp3juJ7hPLxnWQo
	HW4NEOf1eiUSvm4Ob6r5NcvJEGZ5MVJj51DBSdqUHlcDrgDL4hDRFMc0ytfT3FfVKRJUiIxb1al2S
	bHjTa3OK4/v9a4kND7zUbILb44HrdxVgXX0Zel4fJfbnyNL+UIOc3o5Qo8szlkQwBuWDMdcNUJxSO
	YrJ+YKzjjf8kjchfoVm4fI3JegUe1YAyf/86WeZT9l0Cun8R2/1vnpmQtTtbXkHKCRErrZNlvbPG3
	//ZXA1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ReD-00000009B2J-2oXj;
	Wed, 23 Sep 2026 18:24:49 +0000
Received: from out-247.mta1.migadu.com ([95.215.58.247] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Re8-00000009B0h-2OMI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:24:46 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Y9cNY9EVhpGWLF8ouVsemVx73ft+TAzzfsFY52UKAAQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790187882; v=1; x=1790792682;
 b=n7ts0s0Hdoh3uh7WWjdfayD/G7JaXuokkx4fsZZhd0qV9zuT0CX2z/bnZ6BMyA3YBLPvs8C1
 6Gg13Kxq12v2HJxrSEdEmo5tGR8HabMNY/HmwLN82ZQaV/m0NIJ+BP8eCGBONQwk+UIAWm6DrqV
 iDoRkVMoeqeKN9s8wgGvpVgg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4c24db9ff7925fa6;
	Wed, 23 Sep 2026 18:24:42 +0000
X-Mizu-Trace-ID: 4c24db9ff7925fa6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso994e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:24:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx7O4l8mENGMTtCePasUen08cuBkZJEY3s8G7iZP7WFDpoXMDN80bNh+xOVB9TBsxzjTykaeAS67OQ1k9eGNW/f@lists.infradead.org
X-Gm-Message-State: AFuF++mDMD2kHEksOzpnGfy/JDzUJydyym3lDckvKdfyPQITw4UF+yHu
	JIgEtCfNi01k7nGTq8zbOHhB0EhUOqn1qh4jzqu4wFatDkkFkyU6ul5z7rpepL4eaYMTAsFpvGF
	oj1ybuX+K2gStziowA3FDBkP7iG9NKwAS1bNE7Pmq
X-Received: by 2002:a05:6512:1358:b0:5b2:a967:c0e1 with SMTP id
 2adb3069b0e04-5b8dd6d2b18mr46663e87.0.1790187881652; Wed, 23 Sep 2026
 11:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org> <20260923-kvm-arm-prefault-v4-4-d4b0b4dfa8c3@kernel.org>
In-Reply-To: <20260923-kvm-arm-prefault-v4-4-d4b0b4dfa8c3@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 19:24:05 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwFTu1xGM6KBC8sXiHFqwTyynB+0_DTtpb+7BsUc1ervA@mail.gmail.com>
X-Gm-Features: AclHuK8Z8GjELqKo_KOGvxxJrDlIp-LJq9-fwgXmkezmX3voRH420SsqXo68zc8
Message-ID: <CA+EHjTwFTu1xGM6KBC8sXiHFqwTyynB+0_DTtpb+7BsUc1ervA@mail.gmail.com>
Subject: Re: [PATCH v4 04/14] KVM: arm64: Propagate and use esr in s2fd when
 handling guest aborts
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
X-CRM114-CacheID: sfid-20260923_112444_891311_FA73271F 
X-CRM114-Status: GOOD (  24.44  )
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
> kvm_handle_guest_abort() establishes a kvm_s2_fault_desc data structure,
> s2fd, to store and propagate state to either pkvm_mem_abort(), gmem_abort()
> or user_mem_abort() handlers.
>
> Each of these, however, examines the Exception Syndrome Register (ESR) via
> s2fd->vcpu.
>
> Introduce an s2fd->esr field to abstract this and propagate it to callers.
>
> The value of this (beyond refactoring) is to be able to later generate
> faults with a synthetic esr, specifically to implement stage 2 page table
> pre-faulting.
>
> Abort handlers which use kvm_s2_fault_desc - gmem_abort() and
> user_mem_abort() - now only reference s2fd->esr and do not look it up in
> any other way, which makes it safe to pass a synthetic s2fd->esr value to
> these functions.
>
> No functional change intended.
>
> Reviewed-by: Oliver Upton <oupton@kernel.org>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/mmu.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 5e10a4cd31ea..cb677ab76484 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1655,21 +1655,22 @@ struct kvm_s2_fault_desc {
>         struct kvm_s2_trans     *nested;
>         struct kvm_memory_slot  *memslot;
>         unsigned long           hva;
> +       unsigned long           esr;
>  };
>
>  static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
>  {
> -       return esr_fsc_is_permission_fault(kvm_vcpu_get_esr(s2fd->vcpu));
> +       return esr_fsc_is_permission_fault(s2fd->esr);
>  }
>
>  static bool kvm_s2_fault_is_exec(const struct kvm_s2_fault_desc *s2fd)
>  {
> -       return esr_abt_is_exec_fault(kvm_vcpu_get_esr(s2fd->vcpu));
> +       return esr_abt_is_exec_fault(s2fd->esr);
>  }
>
>  static bool kvm_s2_fault_is_write(const struct kvm_s2_fault_desc *s2fd)
>  {
> -       return esr_abt_is_write_fault(kvm_vcpu_get_esr(s2fd->vcpu));
> +       return esr_abt_is_write_fault(s2fd->esr);
>  }
>
>  static u64 kvm_s2_perm_fault_granule(const struct kvm_s2_fault_desc *s2fd)
> @@ -1678,7 +1679,7 @@ static u64 kvm_s2_perm_fault_granule(const struct kvm_s2_fault_desc *s2fd)
>
>         if (!kvm_s2_fault_is_perm(s2fd))
>                 return 0;
> -       level = kvm_vcpu_get_esr(s2fd->vcpu) & ESR_ELx_FSC_LEVEL;
> +       level = s2fd->esr & ESR_ELx_FSC_LEVEL;
>         return BIT(ARM64_HW_PGTABLE_LEVEL_SHIFT(level));
>  }
>
> @@ -2067,7 +2068,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>          * and trigger the exception here. Since the memslot is valid, inject
>          * the fault back to the guest.
>          */
> -       if (esr_fsc_is_excl_atomic_fault(kvm_vcpu_get_esr(s2fd->vcpu))) {
> +       if (esr_fsc_is_excl_atomic_fault(s2fd->esr)) {
>                 kvm_inject_dabt_excl_atomic(s2fd->vcpu, kvm_vcpu_get_hfar(s2fd->vcpu));
>                 return 1;
>         }
> @@ -2518,6 +2519,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>                 .nested         = nested,
>                 .memslot        = memslot,
>                 .hva            = hva,
> +               .esr            = esr,
>         };
>
>         if (kvm_vm_is_protected(vcpu->kvm)) {
>
> --
> 2.55.0
>

