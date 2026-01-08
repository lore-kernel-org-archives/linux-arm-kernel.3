Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47417CF6A81
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NaZEGS72KLSqcxT/8N5H1mx02StcfqZHeuPXe2e7POg=; b=UiVGCXJh70ebK4ZmXtCm5+8H3s
	xHcYTvnn22sJ4fP4E7z4HV4R9HY4zx0DS3zCjKA3wZBMexaKCTvLiames4g9NsuiyIoMT2Y0Z3v6q
	Ay6t3jQcFyaoMsYCMK3aYwKxNsb5qWRuAeECfkaKIKgQcOoGj5AffHLdmfuqWd4heXjYhEV01jv3/
	tZ1f2Ji9TqiFeEwmdS9e3y19mBqJ+B8lDFs+NUJCqM61gX1WQmbSKAhQz1zrkvdaN1Rg/BIM7aAeE
	SM5MaWPYLTRCOGxLXdwjYOkERdYLwWaefoFAsjn29GSlbYFaBdmEmW7DAEb9Z/vBH5tKQLt8EH7ha
	P02rXUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqiY-0000000HHGv-4Agr;
	Thu, 08 Jan 2026 14:10:26 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqiW-0000000HHFp-3aEE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 14:10:26 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4ee147baf7bso973351cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 06:10:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767881423; cv=none;
        d=google.com; s=arc-20240605;
        b=C9qKAeksjqWoQDAYX7Hac+Yuu3eBMdc5Zhes1VuVzW0Az+c3T+wjQ1lrF8tRvyPIv4
         GcTx55VGwGo3zZex+A0FK4D4E8s+NPn4ErNuG3M4fL2XPXjJO9hmyM41BP/ZFSkSSqti
         iAhjpgMD9AnP1+Ku07JxOMTalyRhgDp1UAOoTXHIJx/TA/KgTie7YP4VnayVKC37AZlB
         MPJY7AXjFwVEGtDRmqS8tGcdnUmweH4/AJ3tOPp5JYqT13NOZJFaeLpX213d5hd6JYWt
         ds5ovgNov3lbmsRQVE21CTpfEnjcbnx6szkzaEfCS4pi/CUniBAm1XtUyYpe+X4aCkNH
         CoMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NaZEGS72KLSqcxT/8N5H1mx02StcfqZHeuPXe2e7POg=;
        fh=y8EswOGOQ+LUtL2pu8W7uGa8eT/wmhxvGopZzwYHXc8=;
        b=kj7kcxVxLFYpR7zelbHnmrjdUdgghMGAv+3wCLfDjwZupssiqxN6loowLSZYxOhmYI
         2XFkKjtkVwAXck/RjBNEVpT6ktA11wPZSxSt8z/OdrVWOPEjlly+YpzxNris1yAspTb5
         eivIWy0RYECKD9W9I85CBDHkeDVjdQnBsmeQstgsQVeCBkEgPFOIDQ8sGW0e8w7Sgbl5
         FkF4OmLLj5e0Ehpl6IriD7wmTpgh+maODIwcsfMCRUBY/QhQVL40JjQacgOZgETTXKD6
         Lr7GnnEuF7nPJpQSVnmauaSWWIG9Ovp6caTZQKPFGpJw6+6MSbIuZZRslDuOsF9nFQvu
         Xywg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767881423; x=1768486223; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NaZEGS72KLSqcxT/8N5H1mx02StcfqZHeuPXe2e7POg=;
        b=LVNrdFWLbvzIswB2x8uwx6iPmHCH+YAnJ0DmaTAnqRWoXEYHk7WINBY/BA6IUVfB1E
         qjbUD7J3PkFjzdckxNg7fNugIjHL/71sD7J3vRKA1k/xsDh9KW0gxTg1eE/p0Viohp8b
         nmUFjKXRe30IbYPm9kiMznek0bet+kdGxDa9CglBypb4eC2dzFb2KAv71BVwfpb8W3XC
         Tdn0IQNTlGDuyzHWNqgJpEaotf9VtVBqA7tYEuFyVgmgVWm9ZZ3sGtjK+UVGsfl/aje8
         X+savflucUakkSxpCZC2vs9w9JqxzcellupkwbUVjHQEVI18pvMUslEucHmklRD8SZgS
         ij6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881423; x=1768486223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaZEGS72KLSqcxT/8N5H1mx02StcfqZHeuPXe2e7POg=;
        b=n9QPpy/wcqMc511rrPsj0Um/xC2IOogF5mTFNOFQ5xlJdAkrwn+stsGnACZ4SNQx9r
         mm4YxoCx62VGDkeKc+PUlVELJjw6yIZ0MNK36ab3NLGAx87I3xfvKQio+jWSCyGejqmr
         RC/gZxGZL8Gl5O2Fw7MLdrOt11YGuwzRHPueVvZ0/IIDrR37bhGL0eF4q0IOlsaP5gFM
         yIxkxha2ycAoh/tRLlz0q1FTObuCxS8SoV54c1lvqQdY872q3r53fAuoPFoADWa4LlfB
         8L9p1ByqpB3/45ELHppi30EUDyRDJnchfcmOq2KCks8eGAOUuX0TyYekAewPmeAQVXa/
         kVww==
X-Forwarded-Encrypted: i=1; AJvYcCVa7N4QO9vTmOhmmCaYe3guLiu4RZOzA2Uz3OZL2nZfR+PcngvfNQgS4wu29Nia/lMS9/87YFhlnTBwbSlkuJ8h@lists.infradead.org
X-Gm-Message-State: AOJu0YzBvAaA4KaRgVOSApBk82TesHkKazWFmAv6blVBKFeAl+OUXSw2
	Bk+Dvv81yBomN0vFBzQ2kMRY5FKf5oqwyfz8xQdoBP7uOuMUVkjv/vokH5zRcxrrHk2VLzyGG21
	CViAU8mhZAjTIzg2uaV33pC0KVBBHjV5UyS4nSG8o
X-Gm-Gg: AY/fxX7JMmL1VXxFoAsZTENgJmhSyhvVkbVqMaMZiU3xhvHfQK6ZSdgwZAdQlsPohwf
	IXYNyJAYrdtiJBH86NjNgiZHsVDvcVJPNQaIGZ1Y/VnIcx8E/nceoUxLcGJ2EN4nhKp80Bf363J
	/0BlhCHbfq3/Y3QmGiyvwJDQqFZgCtzUbCncZJyEe6Fjxn1gW/imkTZgSsi35AipYjnO4LIOvlm
	DV1AaJSs4dKf5mD8QzJzBBJQQci1YdvAMk5hFTH8GN0BkpPXFudLH15gDbqPopRb9a0REVP
X-Received: by 2002:ac8:574f:0:b0:4f1:9c6e:cf1c with SMTP id
 d75a77b69052e-4ffc0997e9emr8640981cf.17.1767881422911; Thu, 08 Jan 2026
 06:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-7-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-7-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 8 Jan 2026 14:09:46 +0000
X-Gm-Features: AQt7F2pJrrFIu8j-RnjtZsOw-SyaBAdPJA09Q8QxhF8SmvfGBU7bWTwW9oJJhUU
Message-ID: <CA+EHjTzTjaZoGQzivOSd97Z9VzySOAM=Qvye0p-R5rzUDwrSFw@mail.gmail.com>
Subject: Re: [PATCH v9 07/30] KVM: arm64: Pull ctxt_has_ helpers to start of sysreg-sr.h
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
X-CRM114-CacheID: sfid-20260108_061024_906258_62FCFA7C 
X-CRM114-Status: GOOD (  18.26  )
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

On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> Rather than add earlier prototypes of specific ctxt_has_ helpers let's just
> pull all their definitions to the top of sysreg-sr.h so they're all
> available to all the individual save/restore functions.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 84 +++++++++++++++---------------
>  1 file changed, 41 insertions(+), 43 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> index a17cbe7582de..5624fd705ae3 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> @@ -16,8 +16,6 @@
>  #include <asm/kvm_hyp.h>
>  #include <asm/kvm_mmu.h>
>
> -static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt);
> -
>  static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
>  {
>         struct kvm_vcpu *vcpu = ctxt->__hyp_running_vcpu;
> @@ -28,47 +26,6 @@ static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
>         return vcpu;
>  }
>
> -static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
> -{
> -       return host_data_ptr(host_ctxt) != ctxt;
> -}
> -
> -static inline u64 *ctxt_mdscr_el1(struct kvm_cpu_context *ctxt)
> -{
> -       struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
> -
> -       if (ctxt_is_guest(ctxt) && kvm_host_owns_debug_regs(vcpu))
> -               return &vcpu->arch.external_mdscr_el1;
> -
> -       return &ctxt_sys_reg(ctxt, MDSCR_EL1);
> -}
> -
> -static inline u64 ctxt_midr_el1(struct kvm_cpu_context *ctxt)
> -{
> -       struct kvm *kvm = kern_hyp_va(ctxt_to_vcpu(ctxt)->kvm);
> -
> -       if (!(ctxt_is_guest(ctxt) &&
> -             test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &kvm->arch.flags)))
> -               return read_cpuid_id();
> -
> -       return kvm_read_vm_id_reg(kvm, SYS_MIDR_EL1);
> -}
> -
> -static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
> -{
> -       *ctxt_mdscr_el1(ctxt)   = read_sysreg(mdscr_el1);
> -
> -       // POR_EL0 can affect uaccess, so must be saved/restored early.
> -       if (ctxt_has_s1poe(ctxt))
> -               ctxt_sys_reg(ctxt, POR_EL0)     = read_sysreg_s(SYS_POR_EL0);
> -}
> -
> -static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
> -{
> -       ctxt_sys_reg(ctxt, TPIDR_EL0)   = read_sysreg(tpidr_el0);
> -       ctxt_sys_reg(ctxt, TPIDRRO_EL0) = read_sysreg(tpidrro_el0);
> -}
> -
>  static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
>  {
>         struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
> @@ -131,6 +88,47 @@ static inline bool ctxt_has_sctlr2(struct kvm_cpu_context *ctxt)
>         return kvm_has_sctlr2(kern_hyp_va(vcpu->kvm));
>  }
>
> +static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
> +{
> +       return host_data_ptr(host_ctxt) != ctxt;
> +}
> +
> +static inline u64 *ctxt_mdscr_el1(struct kvm_cpu_context *ctxt)
> +{
> +       struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
> +
> +       if (ctxt_is_guest(ctxt) && kvm_host_owns_debug_regs(vcpu))
> +               return &vcpu->arch.external_mdscr_el1;
> +
> +       return &ctxt_sys_reg(ctxt, MDSCR_EL1);
> +}
> +
> +static inline u64 ctxt_midr_el1(struct kvm_cpu_context *ctxt)
> +{
> +       struct kvm *kvm = kern_hyp_va(ctxt_to_vcpu(ctxt)->kvm);
> +
> +       if (!(ctxt_is_guest(ctxt) &&
> +             test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &kvm->arch.flags)))
> +               return read_cpuid_id();
> +
> +       return kvm_read_vm_id_reg(kvm, SYS_MIDR_EL1);
> +}
> +
> +static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
> +{
> +       *ctxt_mdscr_el1(ctxt)   = read_sysreg(mdscr_el1);
> +
> +       // POR_EL0 can affect uaccess, so must be saved/restored early.
> +       if (ctxt_has_s1poe(ctxt))
> +               ctxt_sys_reg(ctxt, POR_EL0)     = read_sysreg_s(SYS_POR_EL0);
> +}
> +
> +static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
> +{
> +       ctxt_sys_reg(ctxt, TPIDR_EL0)   = read_sysreg(tpidr_el0);
> +       ctxt_sys_reg(ctxt, TPIDRRO_EL0) = read_sysreg(tpidrro_el0);
> +}
> +
>  static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
>  {
>         ctxt_sys_reg(ctxt, SCTLR_EL1)   = read_sysreg_el1(SYS_SCTLR);
>
> --
> 2.47.3
>

