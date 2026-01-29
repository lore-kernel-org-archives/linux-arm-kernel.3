Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4E7D73E83
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 18:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXMpYReA76VSnWBdSDCeKOepff/FefCdjy4bJ9ZDLq8=; b=TsHJgIHuDA/050sAYwED4x4cuk
	8DYLmKZ5M4zrkjLo+jdjJYz7LMpg6swgbGLJ9xJc+P8yjujieSbF2S9QfP1P4NiiJAPge2ASdJhJa
	5vINk+p9NojmzSkvDFKTY64dor+Y5/9ukQpbvr13X9k5nwuUEBwG6w0A8BxdN7LS+eZi+MTOW+01g
	1GENg3d+p1jFVuAnMIy4drUlg12f/VfncPENbFg1xYAOtlgaEoH0eLM8+plSWQXSiA9wTkhjLSmoh
	MRvkjAOIbA3sm7oxhBvQgUAR3HD9F3bYhEcxHkUeYwBSp39AwDDwquzuHyMSzJvk//s+YR7iSf4/o
	h3nPibMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWUr-00000000UWV-1Jc0;
	Thu, 29 Jan 2026 18:12:01 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWUn-00000000UVU-25yK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 18:11:58 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-5033b64256dso1601cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 10:11:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769710316; cv=none;
        d=google.com; s=arc-20240605;
        b=eKw9R2Vl51de0yOpIrFj0+bDAGo1L/mLT+cUKvQSV1CzlXocbRXnFGAnjh8BLEGbn2
         v2vUiGXiIPaSnnPQK8rXqB0BCwR1amShGSTKH28n6VqATjHfaSZfcVw+eIm0Z+uWa6fj
         c1bVlC20mAjTD4pXrw3mDn9SwLFV5cUm9lTFExUjlkvkzDXwpnKj9MRHX37J5IUa2yW0
         RqDjZLSBItw8rbdxgSijBDg7Qt3YyWBT/OtYhS2O9IAhfymYpUuWxkK/dHMnLf69j9US
         zair6aIhEWyuY3/Yuq7kCDNt/SHKqajWXXITEvzYTDjG1d+JxCNup30NgP2cmc7RVIrj
         /i4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eXMpYReA76VSnWBdSDCeKOepff/FefCdjy4bJ9ZDLq8=;
        fh=K4Mpfj3GzlX5fwbo6wShcoorzkGpyALcnIFzorBJ5mo=;
        b=j74HrXtJkwFbitrH9Yc3B4LKEW2jJdNk2SKQ6u+6CoUgENGjse/eEKARjdceD+Hk5x
         oeZ6foNcunvh5PchzO3MgmxMATCqqDl77ydJl3hdzcOyGQsoQVef2nCKVbAkEN0kqzEQ
         T5OpX3v5qhAfTDRrv8U4gFAT6g0/IbCUOjt6PMiDVIEq17Znqwv81afiKWxOTRMb1bsm
         Dvky0y6D2qiE2sNpAYYTijgUeFvr+c2N3D8te1ETeV1JLE29DBQwdQq8CeRXNajpLI9e
         3U9zn++ZypdkoILpJj8/ujhzd7ijPEYHVHhe0QZyKWjbg+07tejtycVdOf5/ezQHaeRH
         2jlg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769710316; x=1770315116; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eXMpYReA76VSnWBdSDCeKOepff/FefCdjy4bJ9ZDLq8=;
        b=uf7Ng0oKLsY/Xc0HdKbJt7kEgGifqlDXqwWQXgBZIJqGtVQMKOPKkrgPhVA7ufFMXc
         ITIqbvGhQfx8FIrogj1FQSDINB1nt5omD+LI0kZHwxFmvbmQxCdMqbGbRBpENfi+R1y2
         grGqUMQIzUz5EEvCXFnshxwSq3+WOCtB+BaszJD139YqlnO0FZojO7cvRT7oMg9LkGgx
         4NTwGqj30kj4ck6fPSwLJbELO31gHlj23Nb6CUdFgBUgKPwS8jiDaF+4Q/Hxj6kz72l8
         jXRoXnBNEgUmm7T05S4J73YTWS2hLG6Tqe3yn/4/DjdBWsBOKYq6SqCW5l2AMJyGzbtq
         rsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769710316; x=1770315116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXMpYReA76VSnWBdSDCeKOepff/FefCdjy4bJ9ZDLq8=;
        b=MU+DHcP7bCOc/05rttlBm/ptSvjzw9qTumkJ6p8/j06dKhuvCnt8UC3ghPv8ZrfrZm
         RmaKnMTPaWUEF6ghvLiQVVNapwCzPoBAOO0FYbLfmTaEhL7SOIclz+XyM+zsLKgVSBk5
         mWJVFjYn4MMEtcNpA39rNNYL6I8XohKx3VTPiU4pPAVumg2jc1qIZZY4AxbfDjBLKunD
         rCAsa0/t68L1intxcqDMTVSIjqB1M6Bx5tNq0LwtBwGHubQn4rP2sItTrnZ2flXFfY21
         mR4SWBhLGrfQYb8clnBLJSGW/SIyI4ye/rbbBbDChqeBeTV0j0Q9yE7z9saH4RR0npKb
         BrrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjXN/32sxrBj+ynsgnODsPHMOm4SD/bxh49odLfKtCZtT2HGTMdfI2QVzPUD7LGU/16RsrniJWorLYuSFIvHB/@lists.infradead.org
X-Gm-Message-State: AOJu0YwW3PLaDVPzYE5qsw2EhdCmf7SfEx7sAyDruiobGkHWmWUTH/o3
	KX2lezotYgiPqe9OGYjPXHoQEE3J5pGOW5EFLzLzg7qi+vt80MC5m17ze3LgTeuG759OWSiyswS
	yETP56WNh5UvToLFM4WwxpR8HiuQDTRPYmroHQVRovFd9GAP8oe1WQ0V6
X-Gm-Gg: AZuq6aLVPq/O/d7DJFwtX8PeKAz7WJoY+whIwMozYEsvC1EWfiy9Qqn5WZoTNe+Pjs+
	cRypunAQwDLlvSmvT0D7VDS9uV5HL5u7dCk7RYV5ZUwA5Jit/s6SwHb6iZqGBg1CzKwKsWtwGel
	MiIgzjYipYt6mhbvWjCr1PVTJnrZ1n/w2kkea+k7Mm2wOcF59yLkLIOGKZH7rKIW8xyxqol2Ew3
	AJO2lsL0OJe172qhNKrCs7cTETxWmar9Hbw8xOnj8OUXT2wUt0gUVSCMPmZ6pJ5U+phty/B
X-Received: by 2002:a05:622a:cb:b0:502:f07e:854c with SMTP id
 d75a77b69052e-505d2963681mr233281cf.6.1769710313749; Thu, 29 Jan 2026
 10:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-20-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-20-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 29 Jan 2026 18:11:16 +0000
X-Gm-Features: AZwV_QjF5yiUUIg5uEIM22NwSkF34FaWIG-B5xVFNjuS4Wq4b6ejFit-e1Zvicw
Message-ID: <CA+EHjTztDe27zT6yHFiN+_64Husvs36JBWXZyKQ2N3AjuW63gQ@mail.gmail.com>
Subject: Re: [PATCH 19/20] KVM: arm64: Add sanitisation to SCTLR_EL2
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_101157_561361_916D35F9 
X-CRM114-Status: GOOD (  18.98  )
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

On Mon, 26 Jan 2026 at 12:17, Marc Zyngier <maz@kernel.org> wrote:
>
> Sanitise SCTLR_EL2 the usual way. The most important aspect of
> this is that we benefit from SCTLR_EL2.SPAN being RES1 when
> HCR_EL2.E2H==0.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

This would change slightly when you change patch 12, but it matches
the spec and those changes would be trivial to apply here.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad






> ---
>  arch/arm64/include/asm/kvm_host.h |  2 +-
>  arch/arm64/kvm/config.c           | 82 +++++++++++++++++++++++++++++++
>  arch/arm64/kvm/nested.c           |  4 ++
>  3 files changed, 87 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 9dca94e4361f0..c82b071ade2a5 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -495,7 +495,6 @@ enum vcpu_sysreg {
>         DBGVCR32_EL2,   /* Debug Vector Catch Register */
>
>         /* EL2 registers */
> -       SCTLR_EL2,      /* System Control Register (EL2) */
>         ACTLR_EL2,      /* Auxiliary Control Register (EL2) */
>         CPTR_EL2,       /* Architectural Feature Trap Register (EL2) */
>         HACR_EL2,       /* Hypervisor Auxiliary Control Register */
> @@ -526,6 +525,7 @@ enum vcpu_sysreg {
>
>         /* Anything from this can be RES0/RES1 sanitised */
>         MARKER(__SANITISED_REG_START__),
> +       SCTLR_EL2,      /* System Control Register (EL2) */
>         TCR2_EL2,       /* Extended Translation Control Register (EL2) */
>         SCTLR2_EL2,     /* System Control Register 2 (EL2) */
>         MDCR_EL2,       /* Monitor Debug Configuration Register (EL2) */
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index eebafb90bcf62..562513a4683e2 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -1130,6 +1130,84 @@ static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
>  static const DECLARE_FEAT_MAP(sctlr_el1_desc, SCTLR_EL1,
>                               sctlr_el1_feat_map, FEAT_AA64EL1);
>
> +static const struct reg_bits_to_feat_map sctlr_el2_feat_map[] = {
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_CP15BEN,
> +                       RES0_WHEN_E2H1 | RES1_WHEN_E2H0 | REQUIRES_E2H1,
> +                       FEAT_AA32EL0),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_ITD   |
> +                       SCTLR_EL2_SED,
> +                       RES1_WHEN_E2H1 | RES0_WHEN_E2H0 | REQUIRES_E2H1,
> +                       FEAT_AA32EL0),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_BT0, REQUIRES_E2H1, FEAT_BTI),
> +       NEEDS_FEAT(SCTLR_EL2_BT, FEAT_BTI),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_CMOW, REQUIRES_E2H1, FEAT_CMOW),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_TSCXT,
> +                       RES0_WHEN_E2H0 | RES1_WHEN_E2H1 | REQUIRES_E2H1,
> +                       feat_csv2_2_csv2_1p2),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_EIS   |
> +                       SCTLR_EL2_EOS,
> +                       AS_RES1, FEAT_ExS),
> +       NEEDS_FEAT(SCTLR_EL2_EnFPM, FEAT_FPMR),
> +       NEEDS_FEAT(SCTLR_EL2_IESB, FEAT_IESB),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_EnALS, REQUIRES_E2H1, FEAT_LS64),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_EnAS0, REQUIRES_E2H1, FEAT_LS64_ACCDATA),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_EnASR, REQUIRES_E2H1, FEAT_LS64_V),
> +       NEEDS_FEAT(SCTLR_EL2_nAA, FEAT_LSE2),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_LSMAOE        |
> +                       SCTLR_EL2_nTLSMD,
> +                       AS_RES1 | REQUIRES_E2H1, FEAT_LSMAOC),
> +       NEEDS_FEAT(SCTLR_EL2_EE, FEAT_MixedEnd),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_E0E, REQUIRES_E2H1, feat_mixedendel0),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_MSCEn, REQUIRES_E2H1, FEAT_MOPS),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_ATA0  |
> +                       SCTLR_EL2_TCF0,
> +                       REQUIRES_E2H1, FEAT_MTE2),
> +       NEEDS_FEAT(SCTLR_EL2_ATA        |
> +                  SCTLR_EL2_TCF,
> +                  FEAT_MTE2),
> +       NEEDS_FEAT(SCTLR_EL2_ITFSB, feat_mte_async),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_TCSO0, REQUIRES_E2H1, FEAT_MTE_STORE_ONLY),
> +       NEEDS_FEAT(SCTLR_EL2_TCSO,
> +                  FEAT_MTE_STORE_ONLY),
> +       NEEDS_FEAT(SCTLR_EL2_NMI        |
> +                  SCTLR_EL2_SPINTMASK,
> +                  FEAT_NMI),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_SPAN, AS_RES1 | REQUIRES_E2H1, FEAT_PAN),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_EPAN, REQUIRES_E2H1, FEAT_PAN3),
> +       NEEDS_FEAT(SCTLR_EL2_EnDA       |
> +                  SCTLR_EL2_EnDB       |
> +                  SCTLR_EL2_EnIA       |
> +                  SCTLR_EL2_EnIB,
> +                  feat_pauth),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_EnTP2, REQUIRES_E2H1, FEAT_SME),
> +       NEEDS_FEAT(SCTLR_EL2_EnRCTX, FEAT_SPECRES),
> +       NEEDS_FEAT(SCTLR_EL2_DSSBS, FEAT_SSBS),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_TIDCP, REQUIRES_E2H1, FEAT_TIDCP1),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_TWEDEL        |
> +                       SCTLR_EL2_TWEDEn,
> +                       REQUIRES_E2H1, FEAT_TWED),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_nTWE  |
> +                       SCTLR_EL2_nTWI,
> +                       AS_RES1 | REQUIRES_E2H1, FEAT_AA64EL2),
> +       NEEDS_FEAT_FLAG(SCTLR_EL2_UCI   |
> +                       SCTLR_EL2_UCT   |
> +                       SCTLR_EL2_DZE   |
> +                       SCTLR_EL2_SA0,
> +                       REQUIRES_E2H1, FEAT_AA64EL2),
> +       NEEDS_FEAT(SCTLR_EL2_WXN        |
> +                  SCTLR_EL2_I          |
> +                  SCTLR_EL2_SA         |
> +                  SCTLR_EL2_C          |
> +                  SCTLR_EL2_A          |
> +                  SCTLR_EL2_M,
> +                  FEAT_AA64EL2),
> +       FORCE_RES0(SCTLR_EL2_RES0),
> +       FORCE_RES1(SCTLR_EL2_RES1),
> +};
> +
> +static const DECLARE_FEAT_MAP(sctlr_el2_desc, SCTLR_EL2,
> +                             sctlr_el2_feat_map, FEAT_AA64EL2);
> +
>  static const struct reg_bits_to_feat_map mdcr_el2_feat_map[] = {
>         NEEDS_FEAT(MDCR_EL2_EBWE, FEAT_Debugv8p9),
>         NEEDS_FEAT(MDCR_EL2_TDOSA, FEAT_DoubleLock),
> @@ -1249,6 +1327,7 @@ void __init check_feature_map(void)
>         check_reg_desc(&sctlr2_desc);
>         check_reg_desc(&tcr2_el2_desc);
>         check_reg_desc(&sctlr_el1_desc);
> +       check_reg_desc(&sctlr_el2_desc);
>         check_reg_desc(&mdcr_el2_desc);
>         check_reg_desc(&vtcr_el2_desc);
>  }
> @@ -1454,6 +1533,9 @@ struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
>         case SCTLR_EL1:
>                 resx = compute_reg_resx_bits(kvm, &sctlr_el1_desc, 0, 0);
>                 break;
> +       case SCTLR_EL2:
> +               resx = compute_reg_resx_bits(kvm, &sctlr_el2_desc, 0, 0);
> +               break;
>         case MDCR_EL2:
>                 resx = compute_reg_resx_bits(kvm, &mdcr_el2_desc, 0, 0);
>                 break;
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 96e899dbd9192..ed710228484f3 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1766,6 +1766,10 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
>         resx = get_reg_fixed_bits(kvm, SCTLR_EL1);
>         set_sysreg_masks(kvm, SCTLR_EL1, resx);
>
> +       /* SCTLR_EL2 */
> +       resx = get_reg_fixed_bits(kvm, SCTLR_EL2);
> +       set_sysreg_masks(kvm, SCTLR_EL2, resx);
> +
>         /* SCTLR2_ELx */
>         resx = get_reg_fixed_bits(kvm, SCTLR2_EL1);
>         set_sysreg_masks(kvm, SCTLR2_EL1, resx);
> --
> 2.47.3
>

