Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F4DD41D4C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 14:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSuq6GH+l9j6EhEIx7zNXfQeyv6VkbIy7sCSTIctR8A=; b=2E9VbSdJN9Nd4VoOLgzhW/7qdE
	dshLLLjnMz27+49IYavdbKUf0BOGnAOTtLJ0k0ok6mdm/RqLqZ24FXZu4wsqQj8fhfWPdDXKuwhAg
	MMsGOciprsQ2/okwLC0DJmgppCFIB+0rc+Wik0T2bXXrzq824i1/cntO/seoIcSVH0gFK1cKiPSAd
	XkywO1BzfRn9/NJk+rxeI6y6szIXHuT98xdom0+ABRfsbeEzbpvkfA010OwHp8haT4bK+4M4CKx43
	qZkWe8hi+Lu3ou9S/FBmbAthnnT6YP0y6UiGJOIUP628cDZEqkLm9MsHvKntM/SGoLVw0JoFWXpJN
	CU4vBgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThuW-0000000Gjlu-1fmC;
	Thu, 11 Dec 2025 14:44:52 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThuU-0000000GjlQ-2Lrc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 14:44:51 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4ee243b98caso386091cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:44:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765464289; cv=none;
        d=google.com; s=arc-20240605;
        b=Sy3stSFtP1DxvfCdFxm51pMmpHUCzFNHweOsE5XgyWyw892j/Pj0NDVyEg0oLzaC/X
         RrVdg227ml3wZQFu6W+CDiY64imr0uhWJiolCZoWKdSZNo8CX55pcPgOaL/a2xWbkEId
         f0Kjyxb4JiFDcBESLWxCDnbuJ6LVYMqfy80T9Aw0zvnESNO98lrXZPeUbNwlfMxUMS1F
         +FHDdjt5HitSWTfH3rC3wUf4k2+SG6sbfSr4K5+H8dAV8j49rAYbRafCdm4oEfF64U7L
         cpCyWx0151TB8l30eZS4LLiBmJIEdr8p6fHCEzmGpziwxj5ftjNXsqX1gLuoLcKp8A8k
         8tWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KSuq6GH+l9j6EhEIx7zNXfQeyv6VkbIy7sCSTIctR8A=;
        fh=sh7YaO0bCCFK8bURpbg+lVYLQq5l5uTksFtkZ+Ptkaw=;
        b=Xan5pGmA3Ysg/zeGcNYzYwLtI9M8VhCpWAl1ww1XSLdszDN5Q8TnB/8CRTHJTSspOS
         ZXp2ef727DYgS1Ay2EcyMTXAbIofWXMMd1OIzmeaXRmLyA+ouJKSqEZ4sPOorEeepDk3
         aQYzT2dEQVohrScX8kd4Basd2gCgK56RrGjoA3b6ZTvIK9x6Y3LEUkpAqkv4pQeNlyUI
         J9s6XI0W5zgFVWQMht2XtKFUqw2M5WJVCii1Ub7LjaUKFUFxj64ituDuPQDxs3Xn+idP
         c6KNBwTFta8wfTNBLwSwkU3YTJiJ+9X+frvZbUE63uUWVAzlPVQqZXGiMFx/7GmgEsFB
         Z3FA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765464289; x=1766069089; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KSuq6GH+l9j6EhEIx7zNXfQeyv6VkbIy7sCSTIctR8A=;
        b=YEXzNgJrSgCO3udHMnsVd3tOD7srN4SXVSnNPsp4JMSziiCtAS3OdQ7Tj66Ns/A/5v
         EaZqPY/Tx5H5JylJT/o7fgyFAgnw0JHuffTrxvuAr1UW/VkEMDkLNz/joqs2BcekEfdi
         HBhMSUEuN0VCOlwQ5RoBqgeTnpchaWJj7W/anKxUf2s3oR+P58n10Txm7IZcabD4A9Xg
         sfrHtSXjAXnqGGwRGlGWRX7ULKWfw0AZXMMhowTjKzCmkg0e3n8J1Nm+iAGWKGoUaEtb
         jYqL/bETtCA12DmlFF9ba7DY/H6vZwxOILsgAKhhbFglLWrsjaEytfj5hsNxqvPWddn+
         E7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765464289; x=1766069089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSuq6GH+l9j6EhEIx7zNXfQeyv6VkbIy7sCSTIctR8A=;
        b=u1LSL1hO7xW4rGgZkgBAUC9YOIYvLHRQIrpoHcj5a6jE9PzSoWgT/txqHUOR0zk8H0
         EulMRgkP8n6IUNmB6HqG2K4YclIjTayP0cUOOL7fPcRpS3vr59ZzlmWzAGfHZ8zNB3fR
         fSIKJXSLxTMHEHTudjEtgscjzM/A/s6TuuzyIe4kW5gCD21JVktbjvq4yiGjVXARlsRg
         k6EWJhcn6nl/tvNKo16Y6p3k6QOYDKObeW1ORg21FaqxY1CUwVP631AVxB+i62l/KiDi
         L9tA0Y0f8Q342bllcrdo0kX5eDwu+bMWw2K3Dq4Br3n+559e9w+Oj+X2A2mfULQmkKKw
         gUgA==
X-Forwarded-Encrypted: i=1; AJvYcCXL5/Kadv4HP8RBe5/FyTMYdBNYFz/+2bP6uAZ8OJV2fAYWWds6/8TtEGEfaZsmHHHDuEszX/iKSf6Eov17jj1J@lists.infradead.org
X-Gm-Message-State: AOJu0YyNpfw06acrhcyA9oc9xvS/Fv6Qrg2sPTUqMUZ2GQrz4ZUVsZx9
	l1J2Op12sopn6p/62/9DUI0tgJO35QeTsaDL1KiqkCiDEXLOZuoZ2VAvbDdijDT1PkIaINlCvmf
	FcsQ9xw2v+EtKypsMN9SAT/0fV4UBfVeN6HpUaecP
X-Gm-Gg: AY/fxX7NU5Vw1ZPT+sgTFt32pXGjlspZUhVD4SovduDkIHOed8z2lDyDkBe2cxaqVrv
	iz525jvXTNMb9Y7b9qs3AaIICzMmZ0h38q3VSvbC2L0s4YrDsKxIknXz+yL970r8Rwm5IaWJv40
	E0ChrWoo8rKRX5Q/HvMIBo1JfFOkcvyhLhNCaV+dQFJnhltUNW99bezOV7lNeAKmObakrmjZIuB
	veIeZn+Ir1XMb61VXY0AGZbd+diFWNNj+Sa42h09VUNhIg+1J63BDRYN3n2NyINIrgzze7qEaEY
	iYnREsw=
X-Google-Smtp-Source: AGHT+IFWKU+icarWvA6iCnZdZOf2gTsZLSRpOBVgzaM+BkqI//LgNJ2dMzQCF3c3aTVaf+Tt8N2sYXD5YPMUCqYbGng=
X-Received: by 2002:a05:622a:1b8f:b0:4f1:a60e:bc33 with SMTP id
 d75a77b69052e-4f1bd8686dfmr10411511cf.2.1765464288525; Thu, 11 Dec 2025
 06:44:48 -0800 (PST)
MIME-Version: 1.0
References: <20251210173024.561160-1-maz@kernel.org> <20251210173024.561160-6-maz@kernel.org>
In-Reply-To: <20251210173024.561160-6-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 11 Dec 2025 14:44:11 +0000
X-Gm-Features: AQt7F2o1mYHWKzEWh_QN4YUXAwPvOiLsy5RXvpwAstbpCGIo1TVSuF-YNV16snc
Message-ID: <CA+EHjTxzoN_rg9RQsq0BLgp9zp29rAx5Zxrndas07d5sjSQXLQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] KVM: arm64: Convert VTCR_EL2 to config-driven sanitisation
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Sascha Bischoff <Sascha.Bischoff@arm.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_064450_622590_41B1AE00 
X-CRM114-Status: GOOD (  20.29  )
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

On Wed, 10 Dec 2025 at 17:30, Marc Zyngier <maz@kernel.org> wrote:
>
> Describe all the VTCR_EL2 fields and their respective configurations,
> making sure that we correctly ignore the bits that are not defined
> for a given guest configuration.
>
> Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>

/fuad

>  arch/arm64/kvm/config.c | 69 +++++++++++++++++++++++++++++++++++++++++
>  arch/arm64/kvm/nested.c |  3 +-
>  2 files changed, 70 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 3845b188551b6..9c04f895d3769 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -141,6 +141,7 @@ struct reg_feat_map_desc {
>  #define FEAT_AA64EL1           ID_AA64PFR0_EL1, EL1, IMP
>  #define FEAT_AA64EL2           ID_AA64PFR0_EL1, EL2, IMP
>  #define FEAT_AA64EL3           ID_AA64PFR0_EL1, EL3, IMP
> +#define FEAT_SEL2              ID_AA64PFR0_EL1, SEL2, IMP
>  #define FEAT_AIE               ID_AA64MMFR3_EL1, AIE, IMP
>  #define FEAT_S2POE             ID_AA64MMFR3_EL1, S2POE, IMP
>  #define FEAT_S1POE             ID_AA64MMFR3_EL1, S1POE, IMP
> @@ -202,6 +203,8 @@ struct reg_feat_map_desc {
>  #define FEAT_ASID2             ID_AA64MMFR4_EL1, ASID2, IMP
>  #define FEAT_MEC               ID_AA64MMFR3_EL1, MEC, IMP
>  #define FEAT_HAFT              ID_AA64MMFR1_EL1, HAFDBS, HAFT
> +#define FEAT_HDBSS             ID_AA64MMFR1_EL1, HAFDBS, HDBSS
> +#define FEAT_HPDS2             ID_AA64MMFR1_EL1, HPDS, HPDS2
>  #define FEAT_BTI               ID_AA64PFR1_EL1, BT, IMP
>  #define FEAT_ExS               ID_AA64MMFR0_EL1, EXS, IMP
>  #define FEAT_IESB              ID_AA64MMFR2_EL1, IESB, IMP
> @@ -219,6 +222,7 @@ struct reg_feat_map_desc {
>  #define FEAT_FGT2              ID_AA64MMFR0_EL1, FGT, FGT2
>  #define FEAT_MTPMU             ID_AA64DFR0_EL1, MTPMU, IMP
>  #define FEAT_HCX               ID_AA64MMFR1_EL1, HCX, IMP
> +#define FEAT_S2PIE             ID_AA64MMFR3_EL1, S2PIE, IMP
>
>  static bool not_feat_aa64el3(struct kvm *kvm)
>  {
> @@ -362,6 +366,28 @@ static bool feat_pmuv3p9(struct kvm *kvm)
>         return check_pmu_revision(kvm, V3P9);
>  }
>
> +#define has_feat_s2tgran(k, s)                                         \
> +  ((kvm_has_feat_enum(kvm, ID_AA64MMFR0_EL1, TGRAN##s##_2, TGRAN##s) && \
> +    kvm_has_feat(kvm, ID_AA64MMFR0_EL1, TGRAN##s, IMP))                     || \
> +   kvm_has_feat(kvm, ID_AA64MMFR0_EL1, TGRAN##s##_2, IMP))
> +
> +static bool feat_lpa2(struct kvm *kvm)
> +{
> +       return ((kvm_has_feat(kvm, ID_AA64MMFR0_EL1, TGRAN4, 52_BIT)    ||
> +                !kvm_has_feat(kvm, ID_AA64MMFR0_EL1, TGRAN4, IMP))     &&
> +               (kvm_has_feat(kvm, ID_AA64MMFR0_EL1, TGRAN16, 52_BIT)   ||
> +                !kvm_has_feat(kvm, ID_AA64MMFR0_EL1, TGRAN16, IMP))    &&
> +               (kvm_has_feat(kvm, ID_AA64MMFR0_EL1, TGRAN4_2, 52_BIT)  ||
> +                !has_feat_s2tgran(kvm, 4))                             &&
> +               (kvm_has_feat(kvm, ID_AA64MMFR0_EL1, TGRAN16_2, 52_BIT) ||
> +                !has_feat_s2tgran(kvm, 16)));
> +}
> +
> +static bool feat_vmid16(struct kvm *kvm)
> +{
> +       return kvm_has_feat_enum(kvm, ID_AA64MMFR1_EL1, VMIDBits, 16);
> +}
> +
>  static bool compute_hcr_rw(struct kvm *kvm, u64 *bits)
>  {
>         /* This is purely academic: AArch32 and NV are mutually exclusive */
> @@ -1168,6 +1194,44 @@ static const struct reg_bits_to_feat_map mdcr_el2_feat_map[] = {
>  static const DECLARE_FEAT_MAP(mdcr_el2_desc, MDCR_EL2,
>                               mdcr_el2_feat_map, FEAT_AA64EL2);
>
> +static const struct reg_bits_to_feat_map vtcr_el2_feat_map[] = {
> +       NEEDS_FEAT(VTCR_EL2_HDBSS, FEAT_HDBSS),
> +       NEEDS_FEAT(VTCR_EL2_HAFT, FEAT_HAFT),
> +       NEEDS_FEAT(VTCR_EL2_TL0         |
> +                  VTCR_EL2_TL1         |
> +                  VTCR_EL2_AssuredOnly |
> +                  VTCR_EL2_GCSH,
> +                  FEAT_THE),
> +       NEEDS_FEAT(VTCR_EL2_D128, FEAT_D128),
> +       NEEDS_FEAT(VTCR_EL2_S2POE, FEAT_S2POE),
> +       NEEDS_FEAT(VTCR_EL2_S2PIE, FEAT_S2PIE),
> +       NEEDS_FEAT(VTCR_EL2_SL2         |
> +                  VTCR_EL2_DS,
> +                  feat_lpa2),
> +       NEEDS_FEAT(VTCR_EL2_NSA         |
> +                  VTCR_EL2_NSW,
> +                  FEAT_SEL2),
> +       NEEDS_FEAT(VTCR_EL2_HWU62       |
> +                  VTCR_EL2_HWU61       |
> +                  VTCR_EL2_HWU60       |
> +                  VTCR_EL2_HWU59,
> +                  FEAT_HPDS2),
> +       NEEDS_FEAT(VTCR_EL2_HD, ID_AA64MMFR1_EL1, HAFDBS, DBM),
> +       NEEDS_FEAT(VTCR_EL2_HA, ID_AA64MMFR1_EL1, HAFDBS, AF),
> +       NEEDS_FEAT(VTCR_EL2_VS, feat_vmid16),
> +       NEEDS_FEAT(VTCR_EL2_PS          |
> +                  VTCR_EL2_TG0         |
> +                  VTCR_EL2_SH0         |
> +                  VTCR_EL2_ORGN0       |
> +                  VTCR_EL2_IRGN0       |
> +                  VTCR_EL2_SL0         |
> +                  VTCR_EL2_T0SZ,
> +                  FEAT_AA64EL1),
> +};
> +
> +static const DECLARE_FEAT_MAP(vtcr_el2_desc, VTCR_EL2,
> +                             vtcr_el2_feat_map, FEAT_AA64EL2);
> +
>  static void __init check_feat_map(const struct reg_bits_to_feat_map *map,
>                                   int map_size, u64 resx, const char *str)
>  {
> @@ -1211,6 +1275,7 @@ void __init check_feature_map(void)
>         check_reg_desc(&tcr2_el2_desc);
>         check_reg_desc(&sctlr_el1_desc);
>         check_reg_desc(&mdcr_el2_desc);
> +       check_reg_desc(&vtcr_el2_desc);
>  }
>
>  static bool idreg_feat_match(struct kvm *kvm, const struct reg_bits_to_feat_map *map)
> @@ -1425,6 +1490,10 @@ void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *r
>                 *res0 = compute_reg_res0_bits(kvm, &mdcr_el2_desc, 0, 0);
>                 *res1 = MDCR_EL2_RES1;
>                 break;
> +       case VTCR_EL2:
> +               *res0 = compute_reg_res0_bits(kvm, &vtcr_el2_desc, 0, 0);
> +               *res1 = VTCR_EL2_RES1;
> +               break;
>         default:
>                 WARN_ON_ONCE(1);
>                 *res0 = *res1 = 0;
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index e1ef8930c97b3..606cebcaa7c09 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1719,8 +1719,7 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
>         set_sysreg_masks(kvm, VTTBR_EL2, res0, res1);
>
>         /* VTCR_EL2 */
> -       res0 = GENMASK(63, 32) | GENMASK(30, 20);
> -       res1 = BIT(31);
> +       get_reg_fixed_bits(kvm, VTCR_EL2, &res0, &res1);
>         set_sysreg_masks(kvm, VTCR_EL2, res0, res1);
>
>         /* VMPIDR_EL2 */
> --
> 2.47.3
>

