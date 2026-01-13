Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E9AD2D109
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGNeqZdCFRkUH8pVy9i0xdJ5BW3N5lXnZA/HlFDK8XQ=; b=sgOTQXiPzt0BrJpchw74NglP3j
	6YepomRX+D7oWZJBWVeES7nTWL5Gv8jv3mRe/JDJ/eTXStXmwlZ5hZwpfeDlOujPSnl9Y6ggkne2Y
	ZDmaE6Gx3cVXSIWMIL7tDY6OAiTED57AxaV95xBRiXjlXKqfhYPGCnVpfhq5CCKL4aXefHeEYR+FF
	HC/jcP+9+mEVAH7esILJrM51nvrtOoUssdjDx65QbQvH4Mn6hRQnz21lx0pQxPATGtc0sQDId/0to
	pgaA2xG3AehNhLfR4B8VTRyPfSJ+PtxXlMs+rsKPqDCGUEc9fKVd8ycWAdsQAQvYSSHJKIeOPifXb
	ECSMCsZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vff3X-00000007Cd0-10YY;
	Tue, 13 Jan 2026 14:07:35 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vff3V-00000007Cce-1Dqe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 14:07:34 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4ffbaaafac4so559771cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 06:07:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768313251; cv=none;
        d=google.com; s=arc-20240605;
        b=iR3MRkKzru4UpOJmKtey0xzPUgCGECFo49HJPNUq0oLenx9zpxySYJfMRVt9L7Nzpe
         XmO6KSuiKpxZYk+ohdc7QEpK2Vr78I2iL0fJuOuPQ0o33rraRlOfl6JI32LIM41zox7u
         O5cluljEwt4N99gJPxAD8CDaL7DTl+Vpxoh35XJ96yAk6QSNHl7gxMxZ7qj9rG1NC8T0
         macAbLynIxF3baA9tc7qvy5v+eGK6KxyayKSyy3jCUg3UtcS386XOUUmCyK9mukB/39G
         DIcKfnSq8bzuhFAbJlp9OdJEGnOE50LbsmUzIFFC0vloTW3RoryF3n0e8cWd7c292iSu
         8CDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vGNeqZdCFRkUH8pVy9i0xdJ5BW3N5lXnZA/HlFDK8XQ=;
        fh=dsA8Wj6FUiuiY3MjjXZrW1AQugc/u9YCofahPA4d1lk=;
        b=LckUG0z0kQmI6OzV+wNQYa93G7brIf/GJbPoEijdUdQz4YYhytNrX4miHFVlUHNqmb
         dV2CqrYK4yM5mA38u6DQ+NTi0C3XXJvLjTh927c+dFaZXw/SBnZcaEPnAstxDO812yTQ
         AeWoFuVtcEkhTqnslDHk57L0TzGEMx0MgQHcy9HH/q/SfCosVzZjFR4ausSXtK90KELg
         k7PWUnO4bL4N9SSC9nibwkW4HWAylWgs2FavVlRWak8cOJheDSKXqnJ/quFiDz+/gRML
         3TdjcUGUvxxE4/MRuOA6105FveWAWVx+J26H+MNs6c4Q1QYQeEtQSEXTupFfmepUqZw2
         maqg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768313251; x=1768918051; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vGNeqZdCFRkUH8pVy9i0xdJ5BW3N5lXnZA/HlFDK8XQ=;
        b=XeftGGHLwk2vsOXFUcpYXYMGSAtl7uNAUjHh3F/+EfBoBUnPi85z3FP7CfmDj4dWO8
         Kuy/4qbfE58a8jF1R2t6UBoI0mhrGJmmBvosAygTh5sCl+Fo+3lrrLTful6xRZ4Poefj
         3rA3IQwawne166ZhJejoFf6CSE81ysXm1h/rlpLeV/fAv2hJ+wQeZ6SNKyE2OxOcOC3y
         js3/RYjDHuzEY3Ahm9oKcbawLP6IhQd1YXnZOm5M7LtnowVnjRzSvRuppUekltjorxDl
         WMGCHTQ31GOP+fS5NC0QGcwYJA03TRBz/r1cVRUPmusDjaLtjRO1Q04x7edwbcqagK/0
         Vahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768313251; x=1768918051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGNeqZdCFRkUH8pVy9i0xdJ5BW3N5lXnZA/HlFDK8XQ=;
        b=Pl5k2R3jYMXNMIw6PJNsQPt0YDkuLGNwlkRN0S0TZ0AP9BkIidbdO+tzXRNO87eOWt
         dkXJ4rR3fR5XDuxyZgBA1l4D5sqwgv85QYHb19H3bY/hJtHZY/WdRSrOa2QlB8HLPK5X
         WP3e2pIfaDOeSDSCUWFOFGocxzJLDWTp+cvItF4fZ4PiN9FWixYwbPVQ2OouJyf8n1QM
         kjI0X4tlRleJt/JHPksdFkT04/YUHDhqndtyMd3sDMr68XC0Shmf+lc3RzLmGfO8kFuX
         EvF41hoVa3JIK6UMmQwJD3fwQ8npnCDAylOOwq09KdULE7yYrsbTTWIhuvbmD9M56eLz
         Kg3g==
X-Forwarded-Encrypted: i=1; AJvYcCXcImHl+v+Idp6oS2WkdXRKfSTg1E17VyLcIjeovnFx2W6QP5UaBfWCJVs85gGRfVPJOqkcCvtxv9y8jrcJmgVE@lists.infradead.org
X-Gm-Message-State: AOJu0YwplQMPip8G/vQpOsPhpbJ/Rec4zpFOgWFitPC0y4UBLOn6pKBO
	+IY0AlzxXmSbJ8Wl3syrE9xC+sCbdJnSz8OsQx36k5ZLuKj6Ru5T9xcVbiCfw4sFzljj0nnXjWp
	/ion3gnL079wO01sNYOKO7NEXJmYXFKo+ymheGa4T
X-Gm-Gg: AY/fxX6IcCZWr2GF+uM+HHtjaFYNLLY/mR0UvqE5+Bw4SGGDL0X/9JfCytQ95beMkXY
	QvQ8+Hzt5kuUNGpIluK5YADp0uQDQBWdeXS0AXPTHzjsXJP0+s5ZlBz/RkD0tB+ez438FNErjoA
	hHZmZN11XXob9ZLIM88lFbu1xmfP3q3wK7krcH95CuTsG7hMD0LR6QJliQYDo0Wdlw50kpJLHrN
	3xoPQLoInKymbd75pKMuxyvUjUeZ2dF/FAmn+vsCmoA+6Wf5sZB+swUG9npP4PoEyEQQx7X8Jlu
	br/2wJa3NokJZHTpgAwQ/r+Mbg==
X-Received: by 2002:ac8:7fc1:0:b0:4fb:e3b0:aae6 with SMTP id
 d75a77b69052e-5013af6a711mr9755261cf.1.1768313250350; Tue, 13 Jan 2026
 06:07:30 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-22-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-22-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 13 Jan 2026 14:06:53 +0000
X-Gm-Features: AZwV_QhU40Lwhaq_0NHueSMC3WoVnp6Uc6Xt-liPmw7nnlV9MFwsJtQrpboZVDo
Message-ID: <CA+EHjTwMy1crsZLqfy8_Y56NFPJZ7vGyN-egc433GhxB_n=7aA@mail.gmail.com>
Subject: Re: [PATCH v9 22/30] KVM: arm64: Expose SME specific state to userspace
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
X-CRM114-CacheID: sfid-20260113_060733_390322_B4C62702 
X-CRM114-Status: GOOD (  42.98  )
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
> SME introduces two new registers, the ZA matrix register and the ZT0 LUT
> register.  Both of these registers are only accessible when PSTATE.ZA is
> set and ZT0 is only present if SME2 is enabled for the guest. Provide
> support for configuring these from VMMs.
>
> The ZA matrix is a single SVL*SVL register which is available when
> PSTATE.ZA is set. We follow the pattern established by the architecture
> itself and expose this to userspace as a series of horizontal SVE vectors
> with the streaming mode vector length, using the format already established
> for the SVE vectors themselves.
>
> ZT0 is a single register with a refreshingly fixed size 512 bit register
> which is like ZA accessible only when PSTATE.ZA is set. Add support for it
> to the userspace API, as with ZA we allow the register to be read or written
> regardless of the state of PSTATE.ZA in order to simplify userspace usage.
> The value will be reset to 0 whenever PSTATE.ZA changes from 0 to 1,
> userspace can read stale values but these are not observable by the guest
> without manipulation of PSTATE.ZA by userspace.
>
> While there is currently only one ZT register the naming as ZT0 and the
> instruction encoding clearly leave room for future extensions adding more
> ZT registers. This encoding can readily support such an extension if one is
> introduced.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/uapi/asm/kvm.h |  17 ++++++
>  arch/arm64/kvm/guest.c            | 114 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 129 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index 498a49a61487..9a19cc58d227 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -357,6 +357,23 @@ struct kvm_arm_counter_offset {
>  /* SME registers */
>  #define KVM_REG_ARM64_SME              (0x17 << KVM_REG_ARM_COPROC_SHIFT)
>
> +#define KVM_ARM64_SME_VQ_MIN __SVE_VQ_MIN
> +#define KVM_ARM64_SME_VQ_MAX __SVE_VQ_MAX
> +
> +/* ZA and ZTn occupy blocks at the following offsets within this range: */
> +#define KVM_REG_ARM64_SME_ZA_BASE      0
> +#define KVM_REG_ARM64_SME_ZT_BASE      0x600
> +
> +#define KVM_ARM64_SME_MAX_ZAHREG       (__SVE_VQ_BYTES * KVM_ARM64_SME_VQ_MAX)
> +
> +#define KVM_REG_ARM64_SME_ZAHREG(n, i)                                 \
> +       (KVM_REG_ARM64 | KVM_REG_ARM64_SME | KVM_REG_ARM64_SME_ZA_BASE | \
> +        KVM_REG_SIZE_U2048 |                                           \
> +        (((n) & (KVM_ARM64_SME_MAX_ZAHREG - 1)) << 5) |                \
> +        ((i) & (KVM_ARM64_SVE_MAX_SLICES - 1)))
> +
> +#define KVM_REG_ARM64_SME_ZTREG_SIZE   (512 / 8)
> +
>  /* Vector lengths pseudo-register: */
>  #define KVM_REG_ARM64_SME_VLS          (KVM_REG_ARM64 | KVM_REG_ARM64_SME | \
>                                          KVM_REG_SIZE_U512 | 0xfffe)
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 90dcacb35f01..d4e30eb57a9c 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -594,23 +594,133 @@ static int set_sme_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>         return set_vec_vls(ARM64_VEC_SME, vcpu, reg);
>  }
>
> +/*
> + * Validate SVE register ID and get sanitised bounds for user/kernel SVE
> + * register copy
> + */
> +static int sme_reg_to_region(struct vec_state_reg_region *region,
> +                            struct kvm_vcpu *vcpu,
> +                            const struct kvm_one_reg *reg)
> +{
> +       /* reg ID ranges for ZA.H[n] registers */
> +       unsigned int vq = vcpu_sme_max_vq(vcpu) - 1;
> +       const u64 za_h_max = vq * __SVE_VQ_BYTES;
> +       const u64 zah_id_min = KVM_REG_ARM64_SME_ZAHREG(0, 0);
> +       const u64 zah_id_max = KVM_REG_ARM64_SME_ZAHREG(za_h_max - 1,
> +                                                      SVE_NUM_SLICES - 1);
> +       unsigned int reg_num;
> +
> +       unsigned int reqoffset, reqlen; /* User-requested offset and length */
> +       unsigned int maxlen; /* Maximum permitted length */
> +
> +       size_t sme_state_size;
> +
> +       reg_num = (reg->id & SVE_REG_ID_MASK) >> SVE_REG_ID_SHIFT;

You use array_index_nospec() below for koffset, but it might be worth
using it for intermediate values, such as this one.

> +
> +       if (reg->id >= zah_id_min && reg->id <= zah_id_max) {
> +               if (!vcpu_has_sme(vcpu) || (reg->id & SVE_REG_SLICE_MASK) > 0)
> +                       return -ENOENT;
> +
> +               /* ZA is exposed as SVE vectors ZA.H[n] */
> +               reqoffset = ZA_SIG_ZAV_OFFSET(vq, reg_num) -
> +                       ZA_SIG_REGS_OFFSET;
> +               reqlen = KVM_SVE_ZREG_SIZE;
> +               maxlen = SVE_SIG_ZREG_SIZE(vq);
> +       } else if (reg->id == KVM_REG_ARM64_SME_ZT_BASE) {
> +               /* ZA is exposed as SVE vectors ZA.H[n] */
> +               if (!kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SME, SME2) ||
> +                   (reg->id & SVE_REG_SLICE_MASK) > 0 ||
> +                   reg_num > 0)
> +                       return -ENOENT;
> +
> +               /* ZT0 is stored after ZA */
> +               reqlen = KVM_REG_ARM64_SME_ZTREG_SIZE;
> +               maxlen = KVM_REG_ARM64_SME_ZTREG_SIZE;
> +       } else {
> +               return -EINVAL;
> +       }
> +
> +       sme_state_size = vcpu_sme_state_size(vcpu);

Is it worth caching this value and storing it in arch, since the state
size doesn't change after finalization?

> +       if (WARN_ON(!sme_state_size))
> +               return -EINVAL;
> +
> +       region->koffset = array_index_nospec(reqoffset, sme_state_size);
> +       region->klen = min(maxlen, reqlen);
> +       region->upad = reqlen - region->klen;
> +
> +       return 0;
> +}
> +
> +/*
> + * ZA is exposed as an array of horizontal vectors with the same
> + * format as SVE, mirroring the architecture's LDR ZA[Wv, offs], [Xn]
> + * instruction.
> + */
> +
>  static int get_sme_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  {
> +       int ret;
> +       struct vec_state_reg_region region;
> +       char __user *uptr = (char __user *)reg->addr;
> +
>         /* Handle the KVM_REG_ARM64_SME_VLS pseudo-reg as a special case: */
>         if (reg->id == KVM_REG_ARM64_SME_VLS)
>                 return get_sme_vls(vcpu, reg);
>
> -       return -EINVAL;
> +       /* Try to interpret reg ID as an architectural SME register... */
> +       ret = sme_reg_to_region(&region, vcpu, reg);
> +       if (ret)
> +               return ret;
> +
> +       if (!kvm_arm_vcpu_vec_finalized(vcpu))
> +               return -EPERM;
> +
> +       /*
> +        * None of the SME specific registers are accessible unless
> +        * PSTATE.ZA is set.
> +        */
> +       if (!vcpu_za_enabled(vcpu))
> +               return -EINVAL;

I think this should be something other than -EINVAL, since the issue
isn't that the register isn't valid, but that it's inaccessible, as
the comment says. -EACCESS or something?

> +
> +       if (copy_from_user(vcpu->arch.sme_state + region.koffset, uptr,
> +                          region.klen))
> +               return -EFAULT;

This should be copy_to_user()

> +
> +       return 0;
>  }
>
>  static int set_sme_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  {
> +       int ret;
> +       struct vec_state_reg_region region;
> +       char __user *uptr = (char __user *)reg->addr;
> +
>         /* Handle the KVM_REG_ARM64_SME_VLS pseudo-reg as a special case: */
>         if (reg->id == KVM_REG_ARM64_SME_VLS)
>                 return set_sme_vls(vcpu, reg);
>
> -       return -EINVAL;
> +       /* Try to interpret reg ID as an architectural SME register... */
> +       ret = sme_reg_to_region(&region, vcpu, reg);
> +       if (ret)
> +               return ret;
> +
> +       if (!kvm_arm_vcpu_vec_finalized(vcpu))
> +               return -EPERM;
> +
> +       /*
> +        * None of the SME specific registers are accessible unless
> +        * PSTATE.ZA is set.
> +        */
> +       if (!vcpu_za_enabled(vcpu))
> +               return -EINVAL;

Same as get_sme_reg().

Cheers,
/fuad



> +
> +       if (copy_from_user(vcpu->arch.sme_state + region.koffset, uptr,
> +                          region.klen))
> +               return -EFAULT;
> +
> +       return 0;
>  }
> +
>  int kvm_arch_vcpu_ioctl_get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
>  {
>         return -EINVAL;
>
> --
> 2.47.3
>

