Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628321049527
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6RFxb0yaU/mENvxQNg2l26KsJagj/pxhPvCmxc9Q0I=; b=MXISKdLwhit4f8x0Ws93NJVnZo
	1U6m6of5ei4/kFMyqaig//0isdLEnrPeqO10JTATxK6mlmaqfGYOL1bg4NKF6mGPD7SXaCvWTE4qg
	Mg03+gp8qePE454hRDMQGkbxPYkZufMSnftrT0DxHkW2IkpuN5TD76eZgj/+PPAGeHkl1XeZjsM7P
	dqNNvD2m2MhdftShrwgu40mC7eLtgj5RbyvAbZjLQAo9YY76ZAKPxGYo/lV2G+f35/IekGXnqnfyY
	v8yAd5/IJs1UAFo+GS73pmCBAq2SACF07i+YN+KviUfOY9OxHW4YAfO1GNTXpW+DQ8WxJLN8PrqcB
	PlUjpRoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gcg-0000000BO8r-1G9U;
	Wed, 11 Mar 2026 10:17:02 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gce-0000000BO8H-26iK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:17:01 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-5091ed02c54so400821cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773224219; cv=none;
        d=google.com; s=arc-20240605;
        b=cP0zrEcRREaeEQiHMVVAX/G2B0+Aa1XuDcLEOnL6oDU4a+z2h/aeHk2iPtygVh/5e6
         ZR0fqJtgoaDCfwVCJ2l6Kz5tWGrU0XGRzfXquW099yUqgQ3HJh8AGaXDQS+Ig7utjN0U
         ZZ6tCVlb+rIOTu8tR+LdpsTyZUeFweI5i/nUm601TTwYG+OBIDBPI9dLUic0cglOnpyF
         dz4s9qlGsne+IV84+onNy6o0NftzpTMUNPjSPhe4Z8KwJDx8G7XxryhY0llAv/qIvbaN
         gEu8qTt1MKcuLtQGPRj5XXkxQLHX04l5IRBuq3eev8prqhH0z0HCQAWGFkWulJsLagBA
         U5ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B6RFxb0yaU/mENvxQNg2l26KsJagj/pxhPvCmxc9Q0I=;
        fh=L8gKUhxE33rU5+jJgElpRAfdjg6lDaTGdUXuvGr6gb0=;
        b=etvcI7kNXyGXsQSwXl8fUFvYMEGW92xD6+l4f1x4anQhB23RP4JMafn0eTFwVngIX7
         u6sDVCDy09ZENo9KOMFkNfzUmXzul1QbZ7HCBcEkgS5+CygiCaVp+cf2lXUCaaiYN3sx
         q54f5Z1nkBgNFRRh2ck2XN+dXppm58odfmKbZl93HmOcSxhuFFA0akTHToL3Efu2OWL3
         PAecfs4HpRiTGSResJ8Ul2B+CZg5e5k4JUc/pNQEG8iVfj1/D2rVh8lN6GR18qpUtCIJ
         EPtdhV6JGChvg993dRJ2plpO2E6UlzAlJIB7efcnCzY8zrtZPkFYjRgeoqKEm8BdU9Tq
         7Kcg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773224219; x=1773829019; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B6RFxb0yaU/mENvxQNg2l26KsJagj/pxhPvCmxc9Q0I=;
        b=Qspx0m16g+2P4aEOIjQib2679tVIjvDn+uNY6s1SJ57KNtLU7pagA1Kn8YryzcYJJB
         gw5Vquh6lD6gvh1ZfuB/T/6KGfl4RyKILW8A5NYWFTxjFMZnwr19hW2xjQT9vNR9yXtp
         5FXSKjB372sucSxxq43wprL3DPzP2cdiQlPuXKX1K/3gRjmRo/tSzciWk9DdSANgocOr
         WYbD/osA6YmiOVwHlKAwLVhSKbwmpv86diI84CfPZ2ESqOKwJnQSNDXrU6KjdCMGynSe
         nrJGZ0KU4/PyeGbpgOkvqvnQA7XWOY0NDA1NzRelqYlx90wdbBrAD8pXIwvQ/VkrhF5K
         EUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224219; x=1773829019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6RFxb0yaU/mENvxQNg2l26KsJagj/pxhPvCmxc9Q0I=;
        b=Yt/Ali5b/QfFmxGn5WSfO+ugKi3MRN/gv04tNL/ar+sLeEo3EZfIm40GiemVlS/SH0
         3ZT4nNCJUJzsvLqvR7kKWwltvNiDnaIQV93kGo77slVdGg0iQmOWKFpbTNFNxOVmDRq3
         NdBd5bwQF+axhkgLFzwyUHuXSl9UM41gARrc2dWLlg/BTASYZAJkO4eKwf8fJvXpe/2k
         6XCZZjsg//vG68nfl9jmNcsf9njLDkjvWkUvZgZ8QBJUAxyTCoQ1fqaDne11vroXny3R
         rAfJojTpEkGYOb/IYZC2WRZAJ3gC7bZYOt5jUb54gJJ6Pus0AzkjvAxTljeOLC2eCfG4
         kRpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1TX/vWC0KlDDz0o/Zv0/XuaQk6W6DSt/Jtexa6pQeN5cVWXnoN2Q0IXj0wSc2NqlMYTd2NCxmgXHcmXLpT4kF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Hu+AQyYhiMOGiFX/plemiW1iylFbzGBC1Jj8zQYEvVSot2WF
	MEzih2wVQxyJ6G2Y//u1u8sdsIa52Hn4D5efmbFoZBf+TSg5LgogRpaSfr7aUQmYwUecQDvWHQk
	3RHL6Ri5QATBLFx+vFyKrNjYaVASjy4aygCtNPlA6
X-Gm-Gg: ATEYQzw55059/ZcxPiaE60aSAkNDf2YdJw/9CJ/Hdr90xdUTYiGZVFigQJahuFcJSkg
	IkVBZCRo1fh8fg7xE92Npzz3V2et0zaKBGFB63whfU6i7ZFOKNIzg7h1iuPHMo6LQdD5hiTtHgY
	QtRoSmZzJjLmqRw/Sma9jD8gj4IC+qo7LqqMZ1GoSKoao3Jm1cSv3CtIlu8o8N0l1nw6ohxedyf
	x7UHFZITr1ygREofkkV7ZfLGZJCvptWIRHi0U0UVF1lmxa7rJ4MY/xfPuuFy4WkQNh73yMA+4X+
	opcsX1CDunIMcaIb0pra66sUdiiJ4AumxAjc8w==
X-Received: by 2002:ac8:7c52:0:b0:509:25c5:42b4 with SMTP id
 d75a77b69052e-50939a712b5mr8934141cf.13.1773224218723; Wed, 11 Mar 2026
 03:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260305144351.17071-1-will@kernel.org> <20260305144351.17071-7-will@kernel.org>
In-Reply-To: <20260305144351.17071-7-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 10:16:22 +0000
X-Gm-Features: AaiRm53tzKibGyxw6pmicDBO5NhlB4E-DgLOJdV-mGhPiyZXSjv4EXvKiR4Er3I
Message-ID: <CA+EHjTzu1XCpwNCu767i5m3+gG1Fzitj=VYyKeUK7eHU_TE_Aw@mail.gmail.com>
Subject: Re: [PATCH v3 06/36] KVM: arm64: Remove is_protected_kvm_enabled()
 checks from hypercalls
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_031700_571152_2424852C 
X-CRM114-Status: GOOD (  24.80  )
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
> When pKVM is not enabled, the host shouldn't issue pKVM-specific
> hypercalls and so there's no point checking for this in the pKVM
> hypercall handlers.
>
> Remove the redundant is_protected_kvm_enabled() checks from each
> hypercall and instead rejig the hypercall table so that the
> pKVM-specific hypercalls are unreachable when pKVM is not being used.
>
> Reviewed-by: Quentin Perret <qperret@google.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/kvm_asm.h   | 24 +++++++-----
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 63 ++++++++++--------------------
>  2 files changed, 34 insertions(+), 53 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index a1ad12c72ebf..7b72aac4730d 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -51,7 +51,7 @@
>  #include <linux/mm.h>
>
>  enum __kvm_host_smccc_func {
> -       /* Hypercalls available only prior to pKVM finalisation */
> +       /* Hypercalls that are unavailable once pKVM has finalised. */
>         /* __KVM_HOST_SMCCC_FUNC___kvm_hyp_init */
>         __KVM_HOST_SMCCC_FUNC___pkvm_init = __KVM_HOST_SMCCC_FUNC___kvm_hyp_init + 1,
>         __KVM_HOST_SMCCC_FUNC___pkvm_create_private_mapping,
> @@ -60,16 +60,9 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___vgic_v3_init_lrs,
>         __KVM_HOST_SMCCC_FUNC___vgic_v3_get_gic_config,
>         __KVM_HOST_SMCCC_FUNC___pkvm_prot_finalize,
> +       __KVM_HOST_SMCCC_FUNC_MIN_PKVM = __KVM_HOST_SMCCC_FUNC___pkvm_prot_finalize,
>
> -       /* Hypercalls available after pKVM finalisation */
> -       __KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
> -       __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
> -       __KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
> -       __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
> -       __KVM_HOST_SMCCC_FUNC___pkvm_host_relax_perms_guest,
> -       __KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
> -       __KVM_HOST_SMCCC_FUNC___pkvm_host_test_clear_young_guest,
> -       __KVM_HOST_SMCCC_FUNC___pkvm_host_mkyoung_guest,
> +       /* Hypercalls that are always available and common to [nh]VHE/pKVM. */
>         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
>         __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
>         __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> @@ -81,6 +74,17 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
>         __KVM_HOST_SMCCC_FUNC___vgic_v3_save_aprs,
>         __KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
> +       __KVM_HOST_SMCCC_FUNC_MAX_NO_PKVM = __KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
> +
> +       /* Hypercalls that are available only when pKVM has finalised. */
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_relax_perms_guest,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_test_clear_young_guest,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_mkyoung_guest,
>         __KVM_HOST_SMCCC_FUNC___pkvm_reserve_vm,
>         __KVM_HOST_SMCCC_FUNC___pkvm_unreserve_vm,
>         __KVM_HOST_SMCCC_FUNC___pkvm_init_vm,
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index e7790097db93..127decc2dd2b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -169,9 +169,6 @@ static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
>         DECLARE_REG(u64, hcr_el2, host_ctxt, 3);
>         struct pkvm_hyp_vcpu *hyp_vcpu;
>
> -       if (!is_protected_kvm_enabled())
> -               return;
> -
>         hyp_vcpu = pkvm_load_hyp_vcpu(handle, vcpu_idx);
>         if (!hyp_vcpu)
>                 return;
> @@ -188,12 +185,8 @@ static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
>
>  static void handle___pkvm_vcpu_put(struct kvm_cpu_context *host_ctxt)
>  {
> -       struct pkvm_hyp_vcpu *hyp_vcpu;
> +       struct pkvm_hyp_vcpu *hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
>
> -       if (!is_protected_kvm_enabled())
> -               return;
> -
> -       hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
>         if (hyp_vcpu)
>                 pkvm_put_hyp_vcpu(hyp_vcpu);
>  }
> @@ -257,9 +250,6 @@ static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
>         struct pkvm_hyp_vcpu *hyp_vcpu;
>         int ret = -EINVAL;
>
> -       if (!is_protected_kvm_enabled())
> -               goto out;
> -
>         hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
>         if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
>                 goto out;
> @@ -281,9 +271,6 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
>         struct pkvm_hyp_vm *hyp_vm;
>         int ret = -EINVAL;
>
> -       if (!is_protected_kvm_enabled())
> -               goto out;
> -
>         hyp_vm = get_np_pkvm_hyp_vm(handle);
>         if (!hyp_vm)
>                 goto out;
> @@ -301,9 +288,6 @@ static void handle___pkvm_host_relax_perms_guest(struct kvm_cpu_context *host_ct
>         struct pkvm_hyp_vcpu *hyp_vcpu;
>         int ret = -EINVAL;
>
> -       if (!is_protected_kvm_enabled())
> -               goto out;
> -
>         hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
>         if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
>                 goto out;
> @@ -321,9 +305,6 @@ static void handle___pkvm_host_wrprotect_guest(struct kvm_cpu_context *host_ctxt
>         struct pkvm_hyp_vm *hyp_vm;
>         int ret = -EINVAL;
>
> -       if (!is_protected_kvm_enabled())
> -               goto out;
> -
>         hyp_vm = get_np_pkvm_hyp_vm(handle);
>         if (!hyp_vm)
>                 goto out;
> @@ -343,9 +324,6 @@ static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *ho
>         struct pkvm_hyp_vm *hyp_vm;
>         int ret = -EINVAL;
>
> -       if (!is_protected_kvm_enabled())
> -               goto out;
> -
>         hyp_vm = get_np_pkvm_hyp_vm(handle);
>         if (!hyp_vm)
>                 goto out;
> @@ -362,9 +340,6 @@ static void handle___pkvm_host_mkyoung_guest(struct kvm_cpu_context *host_ctxt)
>         struct pkvm_hyp_vcpu *hyp_vcpu;
>         int ret = -EINVAL;
>
> -       if (!is_protected_kvm_enabled())
> -               goto out;
> -
>         hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
>         if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
>                 goto out;
> @@ -424,12 +399,8 @@ static void handle___kvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
>  static void handle___pkvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
> -       struct pkvm_hyp_vm *hyp_vm;
> +       struct pkvm_hyp_vm *hyp_vm = get_np_pkvm_hyp_vm(handle);
>
> -       if (!is_protected_kvm_enabled())
> -               return;
> -
> -       hyp_vm = get_np_pkvm_hyp_vm(handle);
>         if (!hyp_vm)
>                 return;
>
> @@ -603,14 +574,6 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__vgic_v3_get_gic_config),
>         HANDLE_FUNC(__pkvm_prot_finalize),
>
> -       HANDLE_FUNC(__pkvm_host_share_hyp),
> -       HANDLE_FUNC(__pkvm_host_unshare_hyp),
> -       HANDLE_FUNC(__pkvm_host_share_guest),
> -       HANDLE_FUNC(__pkvm_host_unshare_guest),
> -       HANDLE_FUNC(__pkvm_host_relax_perms_guest),
> -       HANDLE_FUNC(__pkvm_host_wrprotect_guest),
> -       HANDLE_FUNC(__pkvm_host_test_clear_young_guest),
> -       HANDLE_FUNC(__pkvm_host_mkyoung_guest),
>         HANDLE_FUNC(__kvm_adjust_pc),
>         HANDLE_FUNC(__kvm_vcpu_run),
>         HANDLE_FUNC(__kvm_flush_vm_context),
> @@ -622,6 +585,15 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__kvm_timer_set_cntvoff),
>         HANDLE_FUNC(__vgic_v3_save_aprs),
>         HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
> +
> +       HANDLE_FUNC(__pkvm_host_share_hyp),
> +       HANDLE_FUNC(__pkvm_host_unshare_hyp),
> +       HANDLE_FUNC(__pkvm_host_share_guest),
> +       HANDLE_FUNC(__pkvm_host_unshare_guest),
> +       HANDLE_FUNC(__pkvm_host_relax_perms_guest),
> +       HANDLE_FUNC(__pkvm_host_wrprotect_guest),
> +       HANDLE_FUNC(__pkvm_host_test_clear_young_guest),
> +       HANDLE_FUNC(__pkvm_host_mkyoung_guest),
>         HANDLE_FUNC(__pkvm_reserve_vm),
>         HANDLE_FUNC(__pkvm_unreserve_vm),
>         HANDLE_FUNC(__pkvm_init_vm),
> @@ -635,7 +607,7 @@ static const hcall_t host_hcall[] = {
>  static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(unsigned long, id, host_ctxt, 0);
> -       unsigned long hcall_min = 0;
> +       unsigned long hcall_min = 0, hcall_max = -1;
>         hcall_t hfn;
>
>         /*
> @@ -647,14 +619,19 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
>          * basis. This is all fine, however, since __pkvm_prot_finalize
>          * returns -EPERM after the first call for a given CPU.
>          */
> -       if (static_branch_unlikely(&kvm_protected_mode_initialized))
> -               hcall_min = __KVM_HOST_SMCCC_FUNC___pkvm_prot_finalize;
> +       if (static_branch_unlikely(&kvm_protected_mode_initialized)) {
> +               hcall_min = __KVM_HOST_SMCCC_FUNC_MIN_PKVM;
> +       } else {
> +               hcall_max = __KVM_HOST_SMCCC_FUNC_MAX_NO_PKVM;
> +       }
>
>         id &= ~ARM_SMCCC_CALL_HINTS;
>         id -= KVM_HOST_SMCCC_ID(0);
>
> -       if (unlikely(id < hcall_min || id >= ARRAY_SIZE(host_hcall)))
> +       if (unlikely(id < hcall_min || id > hcall_max ||
> +                    id >= ARRAY_SIZE(host_hcall))) {
>                 goto inval;
> +       }
>
>         hfn = host_hcall[id];
>         if (unlikely(!hfn))
> --
> 2.53.0.473.g4a7958ca14-goog
>

