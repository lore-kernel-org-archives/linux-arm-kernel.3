Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04547D73E80
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPx3FQm16cHh/4wjy/zL7AjgWXFPiOJBez90RRz9q3A=; b=35kSbOVRirpufcS0NKBbHIfhPz
	XJBeMOb1F8VCprxgZuGl7emjJsK7SnaUxIZY9ou4jK0N1mNEn33AxI0i+SPsYmhxMcmRAIedXEjMH
	y0oHz4I7xDnGHONOQMcZjqMWbjLHX69qm6ufQ1LeApI0+GY+ZudJXgo6uJNmx666hSlTIPNULAtI2
	9b5Kr6ByE3OZOc2o1AW+wIcD1JbnzUlXHxefvIF4JILo9/dskajWe2TsfMtkiRGQ/dPHOyVWJqFFJ
	MM6pDO0L3FaSHsnrdxQdiEGmJPEFV11+tZKi87tdf3rnvCXQpoBIjRpejL3Tjl4OpzBUdXMxQk7Et
	HemczdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlW3o-00000000Svh-0iym;
	Thu, 29 Jan 2026 17:44:04 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlW3l-00000000Stp-2vqp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:44:02 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-5033b0b6eabso1771cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 09:44:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769708640; cv=none;
        d=google.com; s=arc-20240605;
        b=PzNdVcfMYhetWhCru8fm1V95VbjfUXjBPukeMbTtTbN2VtBciu9UGTV8TbrQ5eKP3s
         vFAi2MtIqQVC6VEZZVb01Xk0YOlz0MBGrj3Gx11VowKsxhSLqk4plPoelW3LYpCjmp9T
         mAwcJrCuVqpqsaIdRoaHy/qinEevxEtZhK4cqzJO/LX4dv4l/NYIyeXLytdmh8U+n/8w
         GAlveFp29b2Cg52eOoEsZ57sg4OT9Dd6OQ0rNaFFTG4+kQ1G5IoUmgJZ4PAq5pHEMMkZ
         CWNijduTi6dy7WiEU+fb23uKjlNXx5twMr4MeV0Z3UWd5jGow5FMIawzHQUzzqG6Awh5
         TiCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BPx3FQm16cHh/4wjy/zL7AjgWXFPiOJBez90RRz9q3A=;
        fh=ulPtNigKJe+rEMtxzJy3um+XcyKEYT9I1y9kbMKRZNw=;
        b=RPc2NZmjBrJckoeSzpJTXry3LaUi6ZA3QxzVF78/LuYi3hPvrBki8Hp2XJdJzGv16B
         kWWMMDwWTzyUsFpyfrxQ2Xkb/q6ogZEgV+r/0KyOw624sat1ItiFj4UNTcKzf3dWfXRN
         YrL6h4DwuWkDtY9JCMqvX+mnNGwNj2OIU9xUqFGi2CzpCxmjdAWXbaX/VUmROYPQKxvR
         6xmT/V0VHfuRTWe54mlOGRZR6PaoH5ljTLbH0PTIIniC6n36NgpDKKKfgsO8atNTq8Ft
         9PptY0jbQl2ng/dnJ3VOndJqRORS5wDsJILToalhltL/l+vAfSkA7hdnzvpJghE1CpKJ
         6Hng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769708640; x=1770313440; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BPx3FQm16cHh/4wjy/zL7AjgWXFPiOJBez90RRz9q3A=;
        b=2ljUHHIMXJfgA2iUFmTWBSvtegMoaaJzzpxKhrcJuc6BBN0+dDt7nEG/ms7nGeXx47
         +6d4ZWbRMuTesatio9wcMszX+xo7R5iGghgfQWzQ9HPeP8F/hv1GnPUC/kG+uN93rjXM
         J/qvBChm7MHr4otrvsQ8qMvb1SHzFAZULU+zoCi16fpiOYtnSo9a2b3iEPlfXkfYalkd
         PexGuK2Nl/Xz3n5QJy9HMq0lorSpIJpYILGeKGArYVSfU6pL05fgPAbl8oZBB0urwaru
         KRJYO5MVHu8Fh6FIApMuWsf2XRlzeK29RWNG9tJX2U8Wqe2N5YFdb65ZTKgIMPQdLR4o
         nw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769708640; x=1770313440;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPx3FQm16cHh/4wjy/zL7AjgWXFPiOJBez90RRz9q3A=;
        b=Jaevd6dipL/3FCceB9wZmkzINZ4LZzHIOZghbQjBWqbwG0D3tUg61+9ofwfJyE7+7R
         hd1ye0/o0QW3W+JVGt3D6mE3vvNoFRX0Mxg/BHUGg5T8FjRexgTxImarPAeuzpOxJkAX
         QEtlEu8UsK6yL2EaNdh9tUnga+T7Rsm6ZR328biFaLcruZ2wEiaVWKQcXe9oiQWJapzA
         sgk2TMRh6r+d45B/CwMEM+8X9AAfFZYzFNlr1z+9nuLEv2A/PqLW88eLCTnTlGYPrx0I
         vVbjKwS5nxQ19OQsmOl2ajWDNlSE1DetM3uokWwcTkLd2YCzApTyLw8DrViNPPyJx+WN
         9NJg==
X-Forwarded-Encrypted: i=1; AJvYcCUMqHPo7UyXtUT0PaJcZdd0SXxX1RO+Q9rgKVV62Qyv+bygiVOb5hO/RQQGcN1n5FKtvg4faUtRVjSjVrdwIQ0A@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4O2KlOTzLtvN7dbi6sz31Pg7dxbv5ONwOmFBxzg05x8ahBerR
	F8h6+KdJO6+decQ7aCrc9qYO5VazxKqL9Xa+5jw+gBIkfGZHtsGtjpLfqZ4VOQxQK6mCbB3x38u
	jqJ7yUy69yy6IKY0vmPvd9DRL7Dksyt6RAHU2eTwsX26sfrmprMflh0I/
X-Gm-Gg: AZuq6aI/6BO53LGZYsHFu21Jl84UuEZ9P0ZZG07YxhR/HnpLi/urKZhMzg4/S3+qq+L
	f51IOoLF+jFVq4iZiVP3cLvvqLaUdJy5R03CLwgo0+Wex8llzwIkS1sEtKZPoGMdteSkm7mdZms
	EIIZkywkG6u542H1hZ0/z84ArsamKVShZXULIrGgf6PWPc37KrarPn7i26CNQ6qW4COdMTXLQaa
	loR8ROZbE9jaTYmONWz3hrCb17mQOB9SBs65E7FKFuSMU1OH4w3yve5P9PYf4BNbtkE5B7W
X-Received: by 2002:ac8:7c45:0:b0:4ff:bfdd:3f46 with SMTP id
 d75a77b69052e-504310ac4a2mr11679881cf.15.1769708639982; Thu, 29 Jan 2026
 09:43:59 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-18-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-18-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 29 Jan 2026 17:43:23 +0000
X-Gm-Features: AZwV_QhgZBr5ml0xnQ-vrwj2DQaUpUwkeGPKKe1ptuTmjpFjMzKIrzIPGRs2pns
Message-ID: <CA+EHjTzvwhu4zkLmn4AtA0GZuUy85LDnZ-YUesw1PeoJPqdt_A@mail.gmail.com>
Subject: Re: [PATCH 17/20] KVM: arm64: Remove all traces of FEAT_TME
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_094401_759583_8FA4AE4D 
X-CRM114-Status: GOOD (  16.46  )
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

On Mon, 26 Jan 2026 at 12:17, Marc Zyngier <maz@kernel.org> wrote:
>
> FEAT_TME has been dropped from the architecture. Retrospectively.
> I'm sure someone is crying somewhere, but most of us won't.

:'-(

Please don't do a web search for my name and "Transactional Memory".

> Clean-up time.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

I checked and it is indeed withdrawn. So with a heavy heart:

Reviewed-by: Fuad Tabba <tabba@google.com>

RIP,
/fuad







> ---
>  arch/arm64/kvm/config.c                         |  7 -------
>  arch/arm64/kvm/nested.c                         |  5 -----
>  arch/arm64/tools/sysreg                         | 12 +++---------
>  tools/perf/Documentation/perf-arm-spe.txt       |  1 -
>  tools/testing/selftests/kvm/arm64/set_id_regs.c |  1 -
>  5 files changed, 3 insertions(+), 23 deletions(-)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 0c037742215ac..f892098b70c0b 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -184,7 +184,6 @@ struct reg_feat_map_desc {
>  #define FEAT_RME               ID_AA64PFR0_EL1, RME, IMP
>  #define FEAT_MPAM              ID_AA64PFR0_EL1, MPAM, 1
>  #define FEAT_S2FWB             ID_AA64MMFR2_EL1, FWB, IMP
> -#define FEAT_TME               ID_AA64ISAR0_EL1, TME, IMP
>  #define FEAT_TWED              ID_AA64MMFR1_EL1, TWED, IMP
>  #define FEAT_E2H0              ID_AA64MMFR4_EL1, E2H0, IMP
>  #define FEAT_SRMASK            ID_AA64MMFR4_EL1, SRMASK, IMP
> @@ -997,7 +996,6 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
>         NEEDS_FEAT(HCR_EL2_FIEN, feat_rasv1p1),
>         NEEDS_FEAT(HCR_EL2_GPF, FEAT_RME),
>         NEEDS_FEAT(HCR_EL2_FWB, FEAT_S2FWB),
> -       NEEDS_FEAT(HCR_EL2_TME, FEAT_TME),
>         NEEDS_FEAT(HCR_EL2_TWEDEL       |
>                    HCR_EL2_TWEDEn,
>                    FEAT_TWED),
> @@ -1109,11 +1107,6 @@ static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
>         NEEDS_FEAT(SCTLR_EL1_EnRCTX, FEAT_SPECRES),
>         NEEDS_FEAT(SCTLR_EL1_DSSBS, FEAT_SSBS),
>         NEEDS_FEAT(SCTLR_EL1_TIDCP, FEAT_TIDCP1),
> -       NEEDS_FEAT(SCTLR_EL1_TME0       |
> -                  SCTLR_EL1_TME        |
> -                  SCTLR_EL1_TMT0       |
> -                  SCTLR_EL1_TMT,
> -                  FEAT_TME),
>         NEEDS_FEAT(SCTLR_EL1_TWEDEL     |
>                    SCTLR_EL1_TWEDEn,
>                    FEAT_TWED),
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 75a23f1c56d13..96e899dbd9192 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1505,11 +1505,6 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
>         u64 orig_val = val;
>
>         switch (reg) {
> -       case SYS_ID_AA64ISAR0_EL1:
> -               /* Support everything but TME */
> -               val &= ~ID_AA64ISAR0_EL1_TME;
> -               break;
> -
>         case SYS_ID_AA64ISAR1_EL1:
>                 /* Support everything but LS64 and Spec Invalidation */
>                 val &= ~(ID_AA64ISAR1_EL1_LS64  |
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 969a75615d612..650d7d477087e 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -1856,10 +1856,7 @@ UnsignedEnum     31:28   RDM
>         0b0000  NI
>         0b0001  IMP
>  EndEnum
> -UnsignedEnum   27:24   TME
> -       0b0000  NI
> -       0b0001  IMP
> -EndEnum
> +Res0   27:24
>  UnsignedEnum   23:20   ATOMIC
>         0b0000  NI
>         0b0010  IMP
> @@ -2432,10 +2429,7 @@ Field    57      EPAN
>  Field  56      EnALS
>  Field  55      EnAS0
>  Field  54      EnASR
> -Field  53      TME
> -Field  52      TME0
> -Field  51      TMT
> -Field  50      TMT0
> +Res0   53:50
>  Field  49:46   TWEDEL
>  Field  45      TWEDEn
>  Field  44      DSSBS
> @@ -3840,7 +3834,7 @@ Field     43      NV1
>  Field  42      NV
>  Field  41      API
>  Field  40      APK
> -Field  39      TME
> +Res0   39
>  Field  38      MIOCNCE
>  Field  37      TEA
>  Field  36      TERR
> diff --git a/tools/perf/Documentation/perf-arm-spe.txt b/tools/perf/Documentation/perf-arm-spe.txt
> index 8b02e5b983fa9..201a82bec0de4 100644
> --- a/tools/perf/Documentation/perf-arm-spe.txt
> +++ b/tools/perf/Documentation/perf-arm-spe.txt
> @@ -176,7 +176,6 @@ and inv_event_filter are:
>    bit 10    - Remote access (FEAT_SPEv1p4)
>    bit 11    - Misaligned access (FEAT_SPEv1p1)
>    bit 12-15 - IMPLEMENTATION DEFINED events (when implemented)
> -  bit 16    - Transaction (FEAT_TME)
>    bit 17    - Partial or empty SME or SVE predicate (FEAT_SPEv1p1)
>    bit 18    - Empty SME or SVE predicate (FEAT_SPEv1p1)
>    bit 19    - L2D access (FEAT_SPEv1p4)
> diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> index c4815d3658167..73de5be58bab0 100644
> --- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
> +++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> @@ -91,7 +91,6 @@ static const struct reg_ftr_bits ftr_id_aa64isar0_el1[] = {
>         REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR0_EL1, SM3, 0),
>         REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR0_EL1, SHA3, 0),
>         REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR0_EL1, RDM, 0),
> -       REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR0_EL1, TME, 0),
>         REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR0_EL1, ATOMIC, 0),
>         REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR0_EL1, CRC32, 0),
>         REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR0_EL1, SHA2, 0),
> --
> 2.47.3
>

