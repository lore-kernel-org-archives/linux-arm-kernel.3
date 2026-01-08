Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55666CF6A81
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HErK+ZAsiLkCooDCBi0EQVptvs7VIv5Dy3Hcl1WrQnM=; b=itXY+dgdwLm/9Z94QQpswswmJa
	ZiH+FjLwz56UTBJIhYciTmvOP9ZMoYLn5ui5IXpm/2/y5N/C6p97pES9AjCWs72eOGOBYURgKCU//
	4bgd745Jnz+c/sGEmaPFsJ0Rtryf5z46lZACvaSEElqRlBW3F9tg9+IxH/Y1SNegmusWu8K7+hoTB
	gAXZbLOEL/ihOtEECIowj3jFGypHxpOwKEjCqFGV33DbiwtA9yGDGSvrwlJWvhDsNNtV3+V5RpC1a
	9WVjFbcc/0xlR8c9oetC7I4wJSKdXrRK0dQgjZdzwu5F3ZAXSDmu2p3DeUZoARpgyArLmA9NzBett
	cElAMehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqij-0000000HHMU-0e5D;
	Thu, 08 Jan 2026 14:10:37 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqif-0000000HHJc-0VLs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 14:10:34 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4ee147baf7bso973531cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 06:10:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767881432; cv=none;
        d=google.com; s=arc-20240605;
        b=bSJsi6yxv0jXsZD6yCHRxjl17Wm8m9vy6BcTJ6EU+hC20UOQkI0uXrdBghYemXDHae
         ZnnPADiuaSvntZ3uXWKHlj8XKextfBw6COmCQQXAD/SQmfmwnqIzJ5bkpb/u6RZUq590
         6SSsyEmlzHNOeR4cknLY9oNMqpE4PhvM4eh090zjypeuhDrIPYTYbtCabKdGsauLsZKy
         7lLskWfSXu+Pbh+Rjh6dAM9iS8IkBFCFM0KcH6GtIjGp6U5/tkdDaZ1spVH3voo5ocoZ
         aoUrBfGkH5MPtAPQ5ZDt0Yd+BA6Uw9KIMc24Y2cIamwhH0ir1adPEEXrKVT/kumAeN4r
         6DnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HErK+ZAsiLkCooDCBi0EQVptvs7VIv5Dy3Hcl1WrQnM=;
        fh=a4jUr7PbxyJtLWCgT+W3R0cS8a9JNGkx/2T/CeoFQdY=;
        b=gasosug3CojrQ6j0peRtjTxkYZ/RFmLB7lvAhIz2I4X2eC7RI29aJIVvLBle1oFHW8
         SerR9ImUgPC5Qo6ohaJCro7c0Pinw1k1SE4wd70/RMxhS68HSMoS735DZ8f1RpXcFcf2
         X6jVNqMGSgeJXZXlolMhjrwVNv/nGFCAW/oTFkEgwZDRzwe8jwTRhV3P6PzUMZf9Fa0X
         QPrvQuVl6UIiqwQP6Fc2/TGv0vV7vjG2vNs7knzWL8Expwp9nG1evox4w6epSdxIkIlk
         8SFF+BblReBEgJcWe3XvlCK7XmWpxy8CpjymoakCOsowH5VWKU8s5b6IpOrJpG2c6Qpq
         tLKA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767881432; x=1768486232; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HErK+ZAsiLkCooDCBi0EQVptvs7VIv5Dy3Hcl1WrQnM=;
        b=v/IGzz/bwbcUc8nN5oq2Tm4rvhHiQQ1lcqMd0oAvFcBwBpay332d5+4AYADTxXYp8n
         S8EVywBdiDU/hub8D/fOK0arsH5NLcEN3DTPkhg+ZTY1OmcGgYNGU7bG9Nm8jqgEVBXX
         U/ih/gPd4wg5V8iUI4MR0nsb5wGjAbZoHq7RAJi6372czqK+vDNE6QRTcG3tpb8X2D7K
         z7oByRn6rO/1oTNzgl6Spwtk106mpU1neTJQobIkwG7WATZwjkbp3yuFzJsJGKBxtD4z
         1xZErQFnCyARGKkKESte8PjjxOwk3eO1Yegs6kGYbkWU5udOipgTabYZ1/1615cY+UMU
         /wGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881432; x=1768486232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HErK+ZAsiLkCooDCBi0EQVptvs7VIv5Dy3Hcl1WrQnM=;
        b=woMbAI1f2pCXQ4iBMQifmH8xcYXERbHkjW4OL7dPmGN8VK0tDZfHySjbWbynt/Pk2W
         2r1frBsiyDo19eReJ7/Vt+Sbp2kbvEBnogl3/1YPEshWGEABPhhM3/WqXDwCc6cZqNgS
         BEdH+0q67SaT1mWDMpoRvYqGIqzVgezX95VpmZrIUbhT8SJYsQAlv3Z5ZxOGWzbLCHXM
         ndo8Z6Mgj6tOytzrc8AzLfH/o0n7nBQRsoToqX0ZYFOeEJ61hcMtpHKbq6jNwR4C3zdq
         KMXPwXVBhEkbsaP0yVXtsSS9y4f83kouaj6BwPKuLMEQr2Azyni//h8avPDT6xl5/h9M
         /fzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7HQHOXBXAhQlGymacWHgWgjMhTDu27Cyj5CNTBjYzUuZXtgkWdGLvn5whi44RlOQv7ZuvQUWETUllyBh+yP1C@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk085nAyyr/A2D5L8Oji/DeLaO5UxgYryZVBRBVDrie5EDSSJ+
	YY9PV0e+jCHE+BuL8Kz/mPjnaJ1+vHv6m3q/lUqroasspn0zr5JYypY6Kdry5h2TYT/bRXbRyTm
	e3tqrxzEYi1bG8Ur2GDzteGq3N2SrlUFhcTSIO4DX
X-Gm-Gg: AY/fxX6BJIPle5161c2a9OPKwpu67aHKcuG5DQBa2pia6JpjkUOqw5ur6aS4tcJcI6g
	H1l7Y+s/hNMa7GEfc+kFjf8cTOehYj576F1OS4F3IvMl3sxuxqH2zbVaMLKf5iox7I9roa2oppJ
	ToxVKm3pDk7jUizqOplfe8Ddjb8/bunRbDzODEd44M6qtC3ibzPoKLKD4FX+hxoyZqyA4HZdExA
	25R5AU1wLdktXUHvjLmN3FjOmb7C5fidU6W8kzg7z26f+uK3E0ySXaj4+82xxmrlsK0joP/
X-Received: by 2002:a05:622a:1489:b0:4ed:ff79:e678 with SMTP id
 d75a77b69052e-4ffc099853bmr8042581cf.18.1767881431457; Thu, 08 Jan 2026
 06:10:31 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-9-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-9-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 8 Jan 2026 14:09:54 +0000
X-Gm-Features: AQt7F2rQXIZDgc9AB-_m9obzDaZR7vHikvpjlR9mwKIH8JfARH3pHLVi2pEmeM4
Message-ID: <CA+EHjTxAzGrgxtSbhb8f5cs4mj_mD31gOGhwUEZFN21xGfoKyg@mail.gmail.com>
Subject: Re: [PATCH v9 09/30] KVM: arm64: Rename SVE finalization constants to
 be more general
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
X-CRM114-CacheID: sfid-20260108_061033_183064_FAA5DBE6 
X-CRM114-Status: GOOD (  27.91  )
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
> Due to the overlap between SVE and SME vector length configuration
> created by streaming mode SVE we will finalize both at once.  Rename the
> existing finalization to use _VEC (vector) for the naming to avoid
> confusion.
>
> Since this includes the userspace API we create an alias
> KVM_ARM_VCPU_VEC for the existing KVM_ARM_VCPU_SVE capability, existing
> code which does not enable SME will be unaffected and any SME only code
> will not need to use SVE constants.
>
> No functional change.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/kvm_host.h |  8 +++++---
>  arch/arm64/include/uapi/asm/kvm.h |  6 ++++++
>  arch/arm64/kvm/guest.c            | 10 +++++-----
>  arch/arm64/kvm/hyp/nvhe/pkvm.c    |  2 +-
>  arch/arm64/kvm/reset.c            | 20 ++++++++++----------
>  5 files changed, 27 insertions(+), 19 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index e6d25db10a6b..0f3d26467bf0 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -988,8 +988,8 @@ struct kvm_vcpu_arch {
>
>  /* KVM_ARM_VCPU_INIT completed */
>  #define VCPU_INITIALIZED       __vcpu_single_flag(cflags, BIT(0))
> -/* SVE config completed */
> -#define VCPU_SVE_FINALIZED     __vcpu_single_flag(cflags, BIT(1))
> +/* Vector config completed */
> +#define VCPU_VEC_FINALIZED     __vcpu_single_flag(cflags, BIT(1))
>  /* pKVM VCPU setup completed */
>  #define VCPU_PKVM_FINALIZED    __vcpu_single_flag(cflags, BIT(2))
>
> @@ -1062,6 +1062,8 @@ struct kvm_vcpu_arch {
>  #define vcpu_has_sve(vcpu)     kvm_has_sve((vcpu)->kvm)
>  #endif
>
> +#define vcpu_has_vec(vcpu) vcpu_has_sve(vcpu)
> +
>  #ifdef CONFIG_ARM64_PTR_AUTH
>  #define vcpu_has_ptrauth(vcpu)                                         \
>         ((cpus_have_final_cap(ARM64_HAS_ADDRESS_AUTH) ||                \
> @@ -1458,7 +1460,7 @@ struct kvm *kvm_arch_alloc_vm(void);
>  int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
>  bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
>
> -#define kvm_arm_vcpu_sve_finalized(vcpu) vcpu_get_flag(vcpu, VCPU_SVE_FINALIZED)
> +#define kvm_arm_vcpu_vec_finalized(vcpu) vcpu_get_flag(vcpu, VCPU_VEC_FINALIZED)
>
>  #define kvm_has_mte(kvm)                                       \
>         (system_supports_mte() &&                               \
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index a792a599b9d6..c67564f02981 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -107,6 +107,12 @@ struct kvm_regs {
>  #define KVM_ARM_VCPU_HAS_EL2           7 /* Support nested virtualization */
>  #define KVM_ARM_VCPU_HAS_EL2_E2H0      8 /* Limit NV support to E2H RES0 */
>
> +/*
> + * An alias for _SVE since we finalize VL configuration for both SVE and SME
> + * simultaneously.
> + */
> +#define KVM_ARM_VCPU_VEC               KVM_ARM_VCPU_SVE
> +
>  struct kvm_vcpu_init {
>         __u32 target;
>         __u32 features[7];
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 1c87699fd886..d15aa2da1891 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -342,7 +342,7 @@ static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>         if (!vcpu_has_sve(vcpu))
>                 return -ENOENT;
>
> -       if (kvm_arm_vcpu_sve_finalized(vcpu))
> +       if (kvm_arm_vcpu_vec_finalized(vcpu))
>                 return -EPERM; /* too late! */
>
>         if (WARN_ON(vcpu->arch.sve_state))
> @@ -497,7 +497,7 @@ static int get_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>         if (ret)
>                 return ret;
>
> -       if (!kvm_arm_vcpu_sve_finalized(vcpu))
> +       if (!kvm_arm_vcpu_vec_finalized(vcpu))
>                 return -EPERM;
>
>         if (copy_to_user(uptr, vcpu->arch.sve_state + region.koffset,
> @@ -523,7 +523,7 @@ static int set_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>         if (ret)
>                 return ret;
>
> -       if (!kvm_arm_vcpu_sve_finalized(vcpu))
> +       if (!kvm_arm_vcpu_vec_finalized(vcpu))
>                 return -EPERM;
>
>         if (copy_from_user(vcpu->arch.sve_state + region.koffset, uptr,
> @@ -599,7 +599,7 @@ static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
>                 return 0;
>
>         /* Policed by KVM_GET_REG_LIST: */
> -       WARN_ON(!kvm_arm_vcpu_sve_finalized(vcpu));
> +       WARN_ON(!kvm_arm_vcpu_vec_finalized(vcpu));
>
>         return slices * (SVE_NUM_PREGS + SVE_NUM_ZREGS + 1 /* FFR */)
>                 + 1; /* KVM_REG_ARM64_SVE_VLS */
> @@ -617,7 +617,7 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
>                 return 0;
>
>         /* Policed by KVM_GET_REG_LIST: */
> -       WARN_ON(!kvm_arm_vcpu_sve_finalized(vcpu));
> +       WARN_ON(!kvm_arm_vcpu_vec_finalized(vcpu));
>
>         /*
>          * Enumerate this first, so that userspace can save/restore in
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 8911338961c5..b402dcb7691e 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -445,7 +445,7 @@ static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *h
>         int ret = 0;
>
>         if (!vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE)) {
> -               vcpu_clear_flag(vcpu, VCPU_SVE_FINALIZED);
> +               vcpu_clear_flag(vcpu, VCPU_VEC_FINALIZED);
>                 return 0;
>         }
>
> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> index 959532422d3a..f7c63e145d54 100644
> --- a/arch/arm64/kvm/reset.c
> +++ b/arch/arm64/kvm/reset.c
> @@ -92,7 +92,7 @@ static void kvm_vcpu_enable_sve(struct kvm_vcpu *vcpu)
>   * Finalize vcpu's maximum SVE vector length, allocating
>   * vcpu->arch.sve_state as necessary.
>   */
> -static int kvm_vcpu_finalize_sve(struct kvm_vcpu *vcpu)
> +static int kvm_vcpu_finalize_vec(struct kvm_vcpu *vcpu)
>  {
>         void *buf;
>         unsigned int vl;
> @@ -122,21 +122,21 @@ static int kvm_vcpu_finalize_sve(struct kvm_vcpu *vcpu)
>         }
>
>         vcpu->arch.sve_state = buf;
> -       vcpu_set_flag(vcpu, VCPU_SVE_FINALIZED);
> +       vcpu_set_flag(vcpu, VCPU_VEC_FINALIZED);
>         return 0;
>  }
>
>  int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature)
>  {
>         switch (feature) {
> -       case KVM_ARM_VCPU_SVE:
> -               if (!vcpu_has_sve(vcpu))
> +       case KVM_ARM_VCPU_VEC:
> +               if (!vcpu_has_vec(vcpu))
>                         return -EINVAL;
>
> -               if (kvm_arm_vcpu_sve_finalized(vcpu))
> +               if (kvm_arm_vcpu_vec_finalized(vcpu))
>                         return -EPERM;
>
> -               return kvm_vcpu_finalize_sve(vcpu);
> +               return kvm_vcpu_finalize_vec(vcpu);
>         }
>
>         return -EINVAL;
> @@ -144,7 +144,7 @@ int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature)
>
>  bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu)
>  {
> -       if (vcpu_has_sve(vcpu) && !kvm_arm_vcpu_sve_finalized(vcpu))
> +       if (vcpu_has_vec(vcpu) && !kvm_arm_vcpu_vec_finalized(vcpu))
>                 return false;
>
>         return true;
> @@ -163,7 +163,7 @@ void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu)
>         kfree(vcpu->arch.ccsidr);
>  }
>
> -static void kvm_vcpu_reset_sve(struct kvm_vcpu *vcpu)
> +static void kvm_vcpu_reset_vec(struct kvm_vcpu *vcpu)
>  {
>         if (vcpu_has_sve(vcpu))
>                 memset(vcpu->arch.sve_state, 0, vcpu_sve_state_size(vcpu));
> @@ -203,11 +203,11 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
>         if (loaded)
>                 kvm_arch_vcpu_put(vcpu);
>
> -       if (!kvm_arm_vcpu_sve_finalized(vcpu)) {
> +       if (!kvm_arm_vcpu_vec_finalized(vcpu)) {
>                 if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE))
>                         kvm_vcpu_enable_sve(vcpu);
>         } else {
> -               kvm_vcpu_reset_sve(vcpu);
> +               kvm_vcpu_reset_vec(vcpu);
>         }
>
>         if (vcpu_el1_is_32bit(vcpu))
>
> --
> 2.47.3
>

