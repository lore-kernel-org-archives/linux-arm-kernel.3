Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9751062896
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxN2TuBJpKCWoW6nl/QePmQRR2LS3Y0rV9eV5GatiMo=; b=vymsXrFnm1kNeiSy8ct0PcwRGm
	mMRgoCJx4WTiE7+FWA6lNqJCi8ruYa7OR9047H6foYAhfrkesx6bzuPmAA9A5RLj8QdelLQLszYqz
	5Zn42KuyBrd9keIVo9czc36HGZTU3D8DE3K0h/jjjcOY401YL2g7eXtzLiJKidznmbbOnrFDF2KWv
	Q9vLwQjvD1TFi+MIcMza/EwmUaFZbblbteky5qxSKmiIm5nHdUoT8b7sS2qdVYzidmNPvisQbXfnR
	thWnXxtELccFjpRPKAoJTM74Nv7EvzkAhCCbG7b1s5kTzQPT7rm2ZPMiexGIYL+11WHTkIgH7xHzc
	Ap0U47qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0J1P-0000000Bakb-1vgW;
	Wed, 11 Mar 2026 12:50:43 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0J1M-0000000Bajt-3rZ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 12:50:42 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-509062d829dso474341cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 05:50:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773233440; cv=none;
        d=google.com; s=arc-20240605;
        b=SaDDOsDVcjpSrSeWPCNLDB+UhjT14ma5nmKnAsEKZcQPJdv77OV1Xps+gJREaRmBlf
         CTmHX485aHnTrSQyPpfZJOKHVdMi9Pc91hWWP08TqGhvjFqg9pavYlSHNEpvxpQPp2xK
         IwoSIaAxpJ1KtVGWRWrnOtKtmf6ioIPhV8z/55ZIV5OJJ+S14lJxWfKcTuPWXz7KLgHz
         7EqC7nc0WJ0DrNjn5IIDaaG63KF6bxbLQ2mgFsxVC0rnIHS/t1HZ6QwSVBUVOr8DLIsp
         bk6DTsVcXejtAdBhF1LYeJ9JXkFW6AEXR7VSDJYAzS3Q0QbWQWmcUh1L6JVgJhfKjNVU
         OZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qxN2TuBJpKCWoW6nl/QePmQRR2LS3Y0rV9eV5GatiMo=;
        fh=zsio+CwJa17snpQAlghea1jikuSejT3oVLiV60TYZDE=;
        b=VAg0iS/K7CacHm2uV+9JhG7byWrdVmbFdX/LHBab6kOSFC6nZOgEGPsiCSpEkw2zRm
         hzVILzyYyy3yPfIlL5edaS1Ald0dulDxFOhL+tXj9zvQ+xzhl5pLS18xbWGT4gnCQRjV
         RnItTFjpuY5ebOauG0dvO6Zlsz8coomIciyyZQbkjeKHUuufK/iLT0LTwZvu68c5unLr
         88RFNAyAqr1IggQf411gUW2YTOJJi+3shYoZwlhC6JLTFq9+vgxtiGQzUig3SrkCUkeh
         xyzOJarrQ9W/f6ogn4w+8JEqdk8g1IfzXX8ERvMfxw9K2FD6z7bYsJAVDbh86mrsHSJr
         G+xQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773233440; x=1773838240; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qxN2TuBJpKCWoW6nl/QePmQRR2LS3Y0rV9eV5GatiMo=;
        b=ZD5Hdsf39bNCobAmqbCZokOmG/Vy904V7JzvtcA4xflzB1AHSR/3Sf80wLgDuArDxz
         8mvREodvKo54a0nnM3c+N5z9k3RTISXngLn2OxZ2CrnhmcsbsgKNyvCjxPyVuSGcJM5S
         ilIWWxNdDouCcFT7loEQGvF7Ax+tFODuIKGNzd7Jx6D3Ou5ZgInhjQd39a2LDFwz6GG+
         k09L542lhUfrhrBg9FZyWZkIlCaPBueheQ/GAqNvaIKchH1N5UpnbPVGRAdUQSYhwASi
         tZI9cqDl7oc0tnPIxqtG+0gquznm5qBsHYcpnOyrPMpoCTVOQez0orMEyI+0Q93TiIE1
         mrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773233440; x=1773838240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxN2TuBJpKCWoW6nl/QePmQRR2LS3Y0rV9eV5GatiMo=;
        b=BWvo7AJhm5RBUsvDgGL0Z+RBR9Wt6dA/0JQFhHi9Otq/y4OeTSWJZtayC84xl4pomH
         9Tz+N1V3RBfMqt0GygDl+CzmGxYjhvuilRWCjemNtEsD0u+2K7NPYTQWiThWOsUg4kVr
         P1n8d2WkPIKP+eRYaFOYNZkGA6yXdE5rJDHZOnfbwIOc6xIECfYP/OorZDgEt4+Xab/p
         hv6KvPtc0FRMrDG/8T2Gyp2jnKxAx2zkqe+8LkiJ7R5ER5NpMWaM+34DG2/bF8gUQ8C1
         pwr5OXtZX8qtsX8wCudB4Oq5/UdpqTcPInic3fkYIUsGIru3Fug+lLiullO4ymVKAWHT
         NLBg==
X-Forwarded-Encrypted: i=1; AJvYcCWP28III5nnCRzmR0PqZsPVj8dnZQ6pHHFtc8tA+gNVlrIylWw5snO+XGYKJJn+2qm7JrFfRWPBXxe2cxGKVyaF@lists.infradead.org
X-Gm-Message-State: AOJu0YwlqNqe1HFm1kWzo7RhSSOds0DbJVzpV2Dkh0g1deaW2C7EmCSu
	iGUt48floEnPXemP6Ev+WOn29xShE+mP+G4jvBfPeGcP07rf5R5/bdP35NOCdesRfMJPPPEfOoe
	jraEbWygZls/5K5WESBUqJX+zR+oGNHOXh3H1lQn5
X-Gm-Gg: ATEYQzymV75+hCpbyi/wwht0cdd2jwcm9y64HwQbnT2m+9Soaj4ncMjcNu04DxHmTzR
	qh1L69ZQ9ZhA+A6mZeNxEWHEmoSY6+ASA+pA4SOZtq8LjMxleoJiMO6BcTiBp6g7MxOfz1u13+G
	Iu1WQpMECtkKmfTJe7XtGTupx51Fm9g0Tgwm3P0UpyAhuxzMR6dlyIDUuu/mGyGUuakTQ/YfUyi
	UDaDGO2wYytBIed+JlHRJlIs8K6kSV8LnYGRAvoCIaT4H/o5+dljue79Ox9W+0kvYCVC5WR4rFH
	7a0K7ggvM3z7IkjXjITudLgjT06UIb1c6Xbi6Q==
X-Received: by 2002:a05:622a:1350:b0:508:fd42:fd05 with SMTP id
 d75a77b69052e-50939a71860mr10578861cf.15.1773233439313; Wed, 11 Mar 2026
 05:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260305144351.17071-1-will@kernel.org> <20260305144351.17071-8-will@kernel.org>
In-Reply-To: <20260305144351.17071-8-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 12:50:01 +0000
X-Gm-Features: AaiRm51sTqxrySh9KC3XT21S-_vQhCPKCeyE6B5vcg193qR82nHh14nvlAF10uY
Message-ID: <CA+EHjTxRNVTGM67RfwaVmPUkPmtqhyn5cA8jqKBrUgos9Sp65Q@mail.gmail.com>
Subject: Re: [PATCH v3 07/36] KVM: arm64: Ignore MMU notifier callbacks for
 protected VMs
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_055040_968630_EC16EB65 
X-CRM114-Status: GOOD (  19.27  )
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

On Thu, 5 Mar 2026 at 14:44, Will Deacon <will@kernel.org> wrote:
>
> In preparation for supporting the donation of pinned pages to protected
> VMs, return early from the MMU notifiers when called for a protected VM,
> as the necessary hypercalls are exposed only for non-protected guests.
>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/mmu.c  |  9 ++++++---
>  arch/arm64/kvm/pkvm.c | 19 ++++++++++++++++++-
>  2 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index ec2eee857208..43632c69adaf 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -340,6 +340,9 @@ static void __unmap_stage2_range(struct kvm_s2_mmu *mmu, phys_addr_t start, u64
>  void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
>                             u64 size, bool may_block)
>  {
> +       if (kvm_vm_is_protected(kvm_s2_mmu_to_kvm(mmu)))
> +               return;
> +
>         __unmap_stage2_range(mmu, start, size, may_block);
>  }
>
> @@ -2219,7 +2222,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>
>  bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
> -       if (!kvm->arch.mmu.pgt)
> +       if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
>                 return false;
>
>         __unmap_stage2_range(&kvm->arch.mmu, range->start << PAGE_SHIFT,
> @@ -2234,7 +2237,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
>         u64 size = (range->end - range->start) << PAGE_SHIFT;
>
> -       if (!kvm->arch.mmu.pgt)
> +       if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
>                 return false;
>
>         return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
> @@ -2250,7 +2253,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
>         u64 size = (range->end - range->start) << PAGE_SHIFT;
>
> -       if (!kvm->arch.mmu.pgt)
> +       if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
>                 return false;
>
>         return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 42f6e50825ac..20d50abb3b94 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -407,7 +407,12 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
>
>  int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  {
> -       lockdep_assert_held_write(&kvm_s2_mmu_to_kvm(pgt->mmu)->mmu_lock);
> +       struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> +
> +       if (WARN_ON(kvm_vm_is_protected(kvm)))
> +               return -EPERM;
> +
> +       lockdep_assert_held_write(&kvm->mmu_lock);
>
>         return __pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
>  }
> @@ -419,6 +424,9 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
>         struct pkvm_mapping *mapping;
>         int ret = 0;
>
> +       if (WARN_ON(kvm_vm_is_protected(kvm)))
> +               return -EPERM;
> +
>         lockdep_assert_held(&kvm->mmu_lock);
>         for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
>                 ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn,
> @@ -450,6 +458,9 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
>         struct pkvm_mapping *mapping;
>         bool young = false;
>
> +       if (WARN_ON(kvm_vm_is_protected(kvm)))
> +               return -EPERM;
> +
>         lockdep_assert_held(&kvm->mmu_lock);
>         for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
>                 young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
> @@ -461,12 +472,18 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
>  int pkvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr, enum kvm_pgtable_prot prot,
>                                     enum kvm_pgtable_walk_flags flags)
>  {
> +       if (WARN_ON(kvm_vm_is_protected(kvm_s2_mmu_to_kvm(pgt->mmu))))
> +               return -EPERM;
> +
>         return kvm_call_hyp_nvhe(__pkvm_host_relax_perms_guest, addr >> PAGE_SHIFT, prot);
>  }
>
>  void pkvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr,
>                                  enum kvm_pgtable_walk_flags flags)
>  {
> +       if (WARN_ON(kvm_vm_is_protected(kvm_s2_mmu_to_kvm(pgt->mmu))))
> +               return;
> +
>         WARN_ON(kvm_call_hyp_nvhe(__pkvm_host_mkyoung_guest, addr >> PAGE_SHIFT));
>  }
>
> --
> 2.53.0.473.g4a7958ca14-goog
>

