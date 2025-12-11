Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8E2D41C3E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 14:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbriQ0SkVMvNN6P53laWKo2APdvbpd18INbzHTP59Xc=; b=yUQyhGp0ZjkEjfrQrIBtieDDGF
	WeqZwvBEPdkhjO8nKXy8Y64CSjCpV9mN0dHo/P6L+z5j3xPcV1DArIz4LqCTSnHuVLK0c/tfmRCOY
	e2ZDafcDXsxVd8pSOusndxSuvBHwSaLV/lu/DR9ZJK+c5icwmVVEVjqHORXjZvqkRtuFNJD0ig/sP
	qff5IkvjggvP0OM8hKn3Hx1PCxhoRIuXowffD0DC7lGpQtxM9CSRbHqx/MnUQuz1iRa3TF9nGeFyy
	rZLdkBRS2G6V8Kbb3+aFFbZKSCem80DLhuLtMaxNgF3ZbhKXo3PlTJNbXSGDUE8XxPH9jbJO7kWWp
	+fXA9K+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThQh-0000000Gi5U-1y2K;
	Thu, 11 Dec 2025 14:14:03 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThQe-0000000Gi58-3VmC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 14:14:02 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4ed67a143c5so534601cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:14:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765462440; cv=none;
        d=google.com; s=arc-20240605;
        b=c/M5kbARweqXnpq8/m6/tDKDujlFxCmmvwAkk5SCOho+80B6mGhP/zSY8zs4xit0WM
         YAtyugC8oDhZMkIKPUFnUNMu7Lyad8+svhJRgofNkASGN3nk8GiWF3MbgxQTiz0QoZiw
         il0V8JJdqlMCJrzrevvZbegAC1sCBH2t/5OBMeg0Nv6TvCjmKzpzULmxrbDoggQMe6ck
         XzwPwqXXd6Y+EsPSwUkZDP4s1FGmu52Ld6yy4LyamHLQwKCqDdWrlO7e1fzDjnZll0Us
         dGQxbbRCvXUSG+ayiU6QlwVhVgTNhqTX9Ja4m6mt1x5ViTv3q9+jY9Pw1MJFL9BQIaby
         NF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DbriQ0SkVMvNN6P53laWKo2APdvbpd18INbzHTP59Xc=;
        fh=5hgy70nkrizhcSYKcSLNP4XOvPzgK96L3+hI15C9G+8=;
        b=T+yi/20UEIkpQtzXT3GfSwGIchv2iBgYZMrVPgBs+hoGjwMQD/d/8tw17sa0t6D/Sn
         ryEvKZ6fGKI7tIYZVOl+VbZfT/AfbDLWrOX3MJeFJmh5fRQL94ydb3wwgfvCpQzL+Y/b
         K5ow4jRRKuyTYkg3117qnhDFy7xBl/Ej9JHfkCl8Fz5LaPL9JLQa0d1JQSDEFEvnNbEc
         VuIGOSsYxnpogvHVDnjlfn05+AM+CmQuqr5oS82FUXiwbIvQ3Ab73eBQwvPaKxJIF+Za
         SvgWzDrgUEVj548hf6C8wGw9umTImYL8fP/FB0H3lYDHqcK/KFo4caeidjnZLS5xrzVP
         bZog==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765462439; x=1766067239; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DbriQ0SkVMvNN6P53laWKo2APdvbpd18INbzHTP59Xc=;
        b=Tfp+S3yJhvGpdG9I1uAdN1E0tOcbPkPitm2CXuYDcXa1tSs8mM+cEBxl4F3Qq/854w
         U/61uwrXSRysbMzQCHCJWzPuna3Wc7p4qqUltVicuOjBBC0+kXcps2jIMLFb5iHV+dVY
         43tcMEvgyi0CzW/rn1EPOwvCWzwP8i7ohwXPx/p437SUSCPOoG/8jRd58oNP650cx+Ut
         0u5XOoZsL+pc44SkBcU4SjgXx6r2yPhHVOoaeU1+BBL7b5j40rIMYSEd1FFQ8RKZAlnK
         1oY62wjOG7GMjstZWwG6t83I/kwOyDc+m5cfAw6jNMWNf+2ZVmE/1R/l/4vvMHnWXrBI
         f+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765462440; x=1766067240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbriQ0SkVMvNN6P53laWKo2APdvbpd18INbzHTP59Xc=;
        b=qcKaOyQdOh97TmQiSvdZoOdv1KeScy4xXd4irtCloTwINML14w0rb7NtnVyeebxbh0
         rzRwQ/NGME/p2erDYGDj9XhaTkSMRsy30eiPNvaHdBfzbnvS2mmc1LunX+D1v3/6MgSj
         cGe72Vu8jux5fcnYPhdXUcR/EGnqr45KOGB8zOhowrfSyl9jMqleJRnVSI88y7aaQGDg
         CSt0pn1m4kdDuefjgrk8gK+QIWADJ5+8qE4lkMqM9WAUvknYVewiAuxj9byOOE4xqbvP
         ByIdPUhkfc7VaOvjmBfcq5Un16jj1xkcBwz7Z7EEiQua87ozvsf56fbEbu8wVvjyx/bi
         qOtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpX2Dkic5Z91Jy06/MwrbJbCM71acv9kbd8xMJ3aThxy4QtPvz1p9oSw0+uDMNk0+2TwzjPi2Ulyw7YDRUtFs+@lists.infradead.org
X-Gm-Message-State: AOJu0YxN7lBnEdVitoa2wngZCoOf7/kqDaaXcoQ7KH1GZ8IHL034FpEg
	RIWrrs7SXHUhplNJB9Hu2eZ4/enJYimK5FKIGJwpPQxbE4edgAebkIgKxO38FMJ2dpqtGUvvSb5
	fMSN7lH00mxY2xkoWFh9ACVgNpdD0ZGypv6VHaREh
X-Gm-Gg: AY/fxX6YZnQ7JtxCv3cv8MdYSjShc6PulBm4s3sCx3VvOf07O2w347+uIwX2alfoM2z
	OPNlWF04Ou4jFSEr7Km1R0LIxy4g9b4sJd4pjBbKfKn3Pp1lBufOnrOvLzLk0uujEm1ST3877fZ
	/preNVvx7TKHO6l51HdZSMcxxcBHGjNhLgq5yzN2DNvLR2L6hnIFc+Sbb7vfYdfx9iu5p5MkGW7
	LnHmRLGU0ihC5BfMZFm04UuBTtP+GN2KZ0GK7EzMs2yRfx7nkhoebSgw8xD9Gxny8Oegbpj
X-Google-Smtp-Source: AGHT+IHsR5PweMeVDYCfFKFjDQpdQaAflU2RyEDDm5BFseo6Sjuat6mmlH3xwySmJNO3hwq7ZAvO0aIfX0lj5pQvCmM=
X-Received: by 2002:a05:622a:2a18:b0:4f1:bee9:f24a with SMTP id
 d75a77b69052e-4f1bee9f407mr9010731cf.0.1765462439165; Thu, 11 Dec 2025
 06:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20251210173024.561160-1-maz@kernel.org> <20251210173024.561160-4-maz@kernel.org>
In-Reply-To: <20251210173024.561160-4-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 11 Dec 2025 14:13:22 +0000
X-Gm-Features: AQt7F2rr9PtjIIiHtnFsFtlWwu7AuIjaSq1NTTsgICgihl-4XDKmWFGJmdfGQpU
Message-ID: <CA+EHjTyJFZttD4jTH=q_T28BwMR2CDdYSyH7G-WTQvULyjy-Tw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] arm64: Convert VTCR_EL2 to sysreg infratructure
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Sascha Bischoff <Sascha.Bischoff@arm.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_061400_926222_6A38B620 
X-CRM114-Status: GOOD (  25.98  )
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

Hi Marc,

In subject: infratructure -> infrastructure


On Wed, 10 Dec 2025 at 17:30, Marc Zyngier <maz@kernel.org> wrote:
>
> Our definition of VTCR_EL2 is both partial (tons of fields are
> missing) and totally inconsistent (some constants are shifted,
> some are not). They are also expressed in terms of TCR, which is
> rather inconvenient.
>
> Replace the ad-hoc definitions with the the generated version.

Duplicate "the"

> This results in a bunch of additional changes to make the code
> with the unshifted nature of generated enumerations.
>
> The register data was extracted from the BSD licenced AARCHMRS
> (AARCHMRS_OPENSOURCE_A_profile_FAT-2025-09_ASL0).
>
> Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

After checking the bits against the spec, and with the nits above:

Reviewed-by: Fuad Tabba <tabba@google.com>

/fuad

> ---
>  arch/arm64/include/asm/kvm_arm.h | 52 +++++++----------------------
>  arch/arm64/include/asm/sysreg.h  |  1 -
>  arch/arm64/kvm/hyp/pgtable.c     |  8 ++---
>  arch/arm64/kvm/nested.c          |  8 ++---
>  arch/arm64/tools/sysreg          | 57 ++++++++++++++++++++++++++++++++
>  5 files changed, 76 insertions(+), 50 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
> index e500600e4b9b8..dfdbd2b65db9e 100644
> --- a/arch/arm64/include/asm/kvm_arm.h
> +++ b/arch/arm64/include/asm/kvm_arm.h
> @@ -124,37 +124,7 @@
>  #define TCR_EL2_MASK   (TCR_EL2_TG0_MASK | TCR_EL2_SH0_MASK | \
>                          TCR_EL2_ORGN0_MASK | TCR_EL2_IRGN0_MASK)
>
> -/* VTCR_EL2 Registers bits */
> -#define VTCR_EL2_DS            TCR_EL2_DS
> -#define VTCR_EL2_RES1          (1U << 31)
> -#define VTCR_EL2_HD            (1 << 22)
> -#define VTCR_EL2_HA            (1 << 21)
> -#define VTCR_EL2_PS_SHIFT      TCR_EL2_PS_SHIFT
> -#define VTCR_EL2_PS_MASK       TCR_EL2_PS_MASK
> -#define VTCR_EL2_TG0_MASK      TCR_TG0_MASK
> -#define VTCR_EL2_TG0_4K                TCR_TG0_4K
> -#define VTCR_EL2_TG0_16K       TCR_TG0_16K
> -#define VTCR_EL2_TG0_64K       TCR_TG0_64K
> -#define VTCR_EL2_SH0_MASK      TCR_SH0_MASK
> -#define VTCR_EL2_SH0_INNER     TCR_SH0_INNER
> -#define VTCR_EL2_ORGN0_MASK    TCR_ORGN0_MASK
> -#define VTCR_EL2_ORGN0_WBWA    TCR_ORGN0_WBWA
> -#define VTCR_EL2_IRGN0_MASK    TCR_IRGN0_MASK
> -#define VTCR_EL2_IRGN0_WBWA    TCR_IRGN0_WBWA
> -#define VTCR_EL2_SL0_SHIFT     6
> -#define VTCR_EL2_SL0_MASK      (3 << VTCR_EL2_SL0_SHIFT)
> -#define VTCR_EL2_T0SZ_MASK     0x3f
> -#define VTCR_EL2_VS_SHIFT      19
> -#define VTCR_EL2_VS_8BIT       (0 << VTCR_EL2_VS_SHIFT)
> -#define VTCR_EL2_VS_16BIT      (1 << VTCR_EL2_VS_SHIFT)
> -
> -#define VTCR_EL2_T0SZ(x)       TCR_T0SZ(x)
> -
>  /*
> - * We configure the Stage-2 page tables to always restrict the IPA space to be
> - * 40 bits wide (T0SZ = 24).  Systems with a PARange smaller than 40 bits are
> - * not known to exist and will break with this configuration.
> - *
>   * The VTCR_EL2 is configured per VM and is initialised in kvm_init_stage2_mmu.
>   *
>   * Note that when using 4K pages, we concatenate two first level page tables
> @@ -162,9 +132,6 @@
>   *
>   */
>
> -#define VTCR_EL2_COMMON_BITS   (VTCR_EL2_SH0_INNER | VTCR_EL2_ORGN0_WBWA | \
> -                                VTCR_EL2_IRGN0_WBWA | VTCR_EL2_RES1)
> -
>  /*
>   * VTCR_EL2:SL0 indicates the entry level for Stage2 translation.
>   * Interestingly, it depends on the page size.
> @@ -196,30 +163,35 @@
>   */
>  #ifdef CONFIG_ARM64_64K_PAGES
>
> -#define VTCR_EL2_TGRAN                 VTCR_EL2_TG0_64K
> +#define VTCR_EL2_TGRAN                 64K
>  #define VTCR_EL2_TGRAN_SL0_BASE                3UL
>
>  #elif defined(CONFIG_ARM64_16K_PAGES)
>
> -#define VTCR_EL2_TGRAN                 VTCR_EL2_TG0_16K
> +#define VTCR_EL2_TGRAN                 16K
>  #define VTCR_EL2_TGRAN_SL0_BASE                3UL
>
>  #else  /* 4K */
>
> -#define VTCR_EL2_TGRAN                 VTCR_EL2_TG0_4K
> +#define VTCR_EL2_TGRAN                 4K
>  #define VTCR_EL2_TGRAN_SL0_BASE                2UL
>
>  #endif
>
>  #define VTCR_EL2_LVLS_TO_SL0(levels)   \
> -       ((VTCR_EL2_TGRAN_SL0_BASE - (4 - (levels))) << VTCR_EL2_SL0_SHIFT)
> +       FIELD_PREP(VTCR_EL2_SL0, (VTCR_EL2_TGRAN_SL0_BASE - (4 - (levels))))
>  #define VTCR_EL2_SL0_TO_LVLS(sl0)      \
>         ((sl0) + 4 - VTCR_EL2_TGRAN_SL0_BASE)
>  #define VTCR_EL2_LVLS(vtcr)            \
> -       VTCR_EL2_SL0_TO_LVLS(((vtcr) & VTCR_EL2_SL0_MASK) >> VTCR_EL2_SL0_SHIFT)
> +       VTCR_EL2_SL0_TO_LVLS(FIELD_GET(VTCR_EL2_SL0, (vtcr)))
> +
> +#define VTCR_EL2_FLAGS (SYS_FIELD_PREP_ENUM(VTCR_EL2, SH0, INNER)          | \
> +                        SYS_FIELD_PREP_ENUM(VTCR_EL2, ORGN0, WBWA)         | \
> +                        SYS_FIELD_PREP_ENUM(VTCR_EL2, IRGN0, WBWA)         | \
> +                        SYS_FIELD_PREP_ENUM(VTCR_EL2, TG0, VTCR_EL2_TGRAN) | \
> +                        VTCR_EL2_RES1)
>
> -#define VTCR_EL2_FLAGS                 (VTCR_EL2_COMMON_BITS | VTCR_EL2_TGRAN)
> -#define VTCR_EL2_IPA(vtcr)             (64 - ((vtcr) & VTCR_EL2_T0SZ_MASK))
> +#define VTCR_EL2_IPA(vtcr)             (64 - FIELD_GET(VTCR_EL2_T0SZ, (vtcr)))
>
>  /*
>   * ARM VMSAv8-64 defines an algorithm for finding the translation table
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index c231d2a3e5159..acad7a7621b9e 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -516,7 +516,6 @@
>  #define SYS_TTBR1_EL2                  sys_reg(3, 4, 2, 0, 1)
>  #define SYS_TCR_EL2                    sys_reg(3, 4, 2, 0, 2)
>  #define SYS_VTTBR_EL2                  sys_reg(3, 4, 2, 1, 0)
> -#define SYS_VTCR_EL2                   sys_reg(3, 4, 2, 1, 2)
>
>  #define SYS_HAFGRTR_EL2                        sys_reg(3, 4, 3, 1, 6)
>  #define SYS_SPSR_EL2                   sys_reg(3, 4, 4, 0, 0)
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 947ac1a951a5b..e0bd6a0172729 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -583,8 +583,8 @@ u64 kvm_get_vtcr(u64 mmfr0, u64 mmfr1, u32 phys_shift)
>         u64 vtcr = VTCR_EL2_FLAGS;
>         s8 lvls;
>
> -       vtcr |= kvm_get_parange(mmfr0) << VTCR_EL2_PS_SHIFT;
> -       vtcr |= VTCR_EL2_T0SZ(phys_shift);
> +       vtcr |= FIELD_PREP(VTCR_EL2_PS, kvm_get_parange(mmfr0));
> +       vtcr |= FIELD_PREP(VTCR_EL2_T0SZ, (UL(64) - phys_shift));
>         /*
>          * Use a minimum 2 level page table to prevent splitting
>          * host PMD huge pages at stage2.
> @@ -624,9 +624,7 @@ u64 kvm_get_vtcr(u64 mmfr0, u64 mmfr1, u32 phys_shift)
>                 vtcr |= VTCR_EL2_DS;
>
>         /* Set the vmid bits */
> -       vtcr |= (get_vmid_bits(mmfr1) == 16) ?
> -               VTCR_EL2_VS_16BIT :
> -               VTCR_EL2_VS_8BIT;
> +       vtcr |= (get_vmid_bits(mmfr1) == 16) ? VTCR_EL2_VS : 0;
>
>         return vtcr;
>  }
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 911fc99ed99d9..e1ef8930c97b3 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -377,7 +377,7 @@ static void vtcr_to_walk_info(u64 vtcr, struct s2_walk_info *wi)
>  {
>         wi->t0sz = vtcr & TCR_EL2_T0SZ_MASK;
>
> -       switch (vtcr & VTCR_EL2_TG0_MASK) {
> +       switch (FIELD_GET(VTCR_EL2_TG0_MASK, vtcr)) {
>         case VTCR_EL2_TG0_4K:
>                 wi->pgshift = 12;        break;
>         case VTCR_EL2_TG0_16K:
> @@ -513,7 +513,7 @@ static u8 get_guest_mapping_ttl(struct kvm_s2_mmu *mmu, u64 addr)
>
>         lockdep_assert_held_write(&kvm_s2_mmu_to_kvm(mmu)->mmu_lock);
>
> -       switch (vtcr & VTCR_EL2_TG0_MASK) {
> +       switch (FIELD_GET(VTCR_EL2_TG0_MASK, vtcr)) {
>         case VTCR_EL2_TG0_4K:
>                 ttl = (TLBI_TTL_TG_4K << 2);
>                 break;
> @@ -530,7 +530,7 @@ static u8 get_guest_mapping_ttl(struct kvm_s2_mmu *mmu, u64 addr)
>
>  again:
>         /* Iteratively compute the block sizes for a particular granule size */
> -       switch (vtcr & VTCR_EL2_TG0_MASK) {
> +       switch (FIELD_GET(VTCR_EL2_TG0_MASK, vtcr)) {
>         case VTCR_EL2_TG0_4K:
>                 if      (sz < SZ_4K)    sz = SZ_4K;
>                 else if (sz < SZ_2M)    sz = SZ_2M;
> @@ -593,7 +593,7 @@ unsigned long compute_tlb_inval_range(struct kvm_s2_mmu *mmu, u64 val)
>
>         if (!max_size) {
>                 /* Compute the maximum extent of the invalidation */
> -               switch (mmu->tlb_vtcr & VTCR_EL2_TG0_MASK) {
> +               switch (FIELD_GET(VTCR_EL2_TG0_MASK, mmu->tlb_vtcr)) {
>                 case VTCR_EL2_TG0_4K:
>                         max_size = SZ_1G;
>                         break;
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 9d388f87d9a13..6f43b2ae5993b 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -4400,6 +4400,63 @@ Field    56:12   BADDR
>  Res0   11:0
>  EndSysreg
>
> +Sysreg VTCR_EL2        3       4       2       1       2
> +Res0   63:46
> +Field  45      HDBSS
> +Field  44      HAFT
> +Res0   43:42
> +Field  41      TL0
> +Field  40      GCSH
> +Res0   39
> +Field  38      D128
> +Field  37      S2POE
> +Field  36      S2PIE
> +Field  35      TL1
> +Field  34      AssuredOnly
> +Field  33      SL2
> +Field  32      DS
> +Res1   31
> +Field  30      NSA
> +Field  29      NSW
> +Field  28      HWU62
> +Field  27      HWU61
> +Field  26      HWU60
> +Field  25      HWU59
> +Res0   24:23
> +Field  22      HD
> +Field  21      HA
> +Res0   20
> +Enum   19      VS
> +       0b0     8BIT
> +       0b1     16BIT
> +EndEnum
> +Field  18:16   PS
> +Enum   15:14   TG0
> +       0b00    4K
> +       0b01    64K
> +       0b10    16K
> +EndEnum
> +Enum   13:12   SH0
> +       0b00    NONE
> +       0b01    OUTER
> +       0b11    INNER
> +EndEnum
> +Enum   11:10   ORGN0
> +       0b00    NC
> +       0b01    WBWA
> +       0b10    WT
> +       0b11    WBnWA
> +EndEnum
> +Enum   9:8     IRGN0
> +       0b00    NC
> +       0b01    WBWA
> +       0b10    WT
> +       0b11    WBnWA
> +EndEnum
> +Field  7:6     SL0
> +Field  5:0     T0SZ
> +EndSysreg
> +
>  Sysreg GCSCR_EL2       3       4       2       5       0
>  Fields GCSCR_ELx
>  EndSysreg
> --
> 2.47.3
>

