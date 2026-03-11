Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F5D104BEC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJUK1c7uh2qWa/PUs7/Gela8m5sgz/NTTAmffjVN7aY=; b=y8vugbiVOk2dFppdwinIRpmwYd
	4JKnqUgf4CPziqX9cXgXcAno27TkNjkBgacnhj5MJmE1sa263q/YS2qDrfAIX5cDGApnviwMN8FSt
	ihRp8QCYMQOVTgosQaQm4U+1gST4ze2+ZeaDGhva8OHU+XzokcNc3wHFQwIg6J1SXd+sUwBR3TK5T
	n6wC1LItpyItrOJTf6hPg9w1Hi+Q62FMdudnXUt01FVp9lxivw6/ZbtNNyQJN0CRKBXB036z4jZgm
	pDfxPTN1VLAbaNJOWrvsdFVpbXzzNWeNivhZzjxxahZwgEWtDFJqZOH1aOfbASVUfIl5Z4w4DcYkd
	vLKtC0fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GZD-0000000BNVk-3zlT;
	Wed, 11 Mar 2026 10:13:27 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GZB-0000000BNV7-3xJO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:13:27 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-509069a7a7fso506251cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:13:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773224004; cv=none;
        d=google.com; s=arc-20240605;
        b=OcybMDA7sthG7UvQ2nrAWx8NeVv3j5PajMbz2zKUFbjspiVHTxCZ/x2f87PUVZfwzy
         VMTOjBkRYNeE0Go0sb4Lb9Eu5yiv03TSn8DPCYRLmOuQFqWjyc+L+5+hPoBFdcHSXE58
         FTDt9jWB5uLaGl/55BqymVSeP3AJzdOcx1vTLmSfjDOkw7kC4GtaCfaAcWgO8lCc1MFp
         I9l+x+++8IldX1rrHPHGjKwcp4DRqxu/xAi+O4/+0NLdy+ayB0wDjB5FxtTIRRhIUwnV
         FDQFbxwYuu6MCLxi5seB7+EWrOnxmif4/GJqJfpIcJ354IL1lpQ2/qUL64n3KoHKrwUR
         2SPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EJUK1c7uh2qWa/PUs7/Gela8m5sgz/NTTAmffjVN7aY=;
        fh=Pz/fvhwYFgM9ujTIVtdNNemxR96Zy16LB6piZDDzthI=;
        b=KsZgOoIFKYv8FP+G/0EALANOfXXtMi6N/CWv2qlcTVA2aoVhE97sLuvkosdtNEiW7z
         ijCrjJkzUXYwH875BFa4Ymxy5XBIx4XdV+Akan2IUD42L3mCAuz2XKZ2SPGnY+LSPSPF
         iKsmOod0XV2UKcQgROvBWUJQ9OiGakmVzlXPVy7CiAM2KS0W1sUpE+gyVvH2LZcU2W+P
         LbsSgyra8Rd/G9YehibTrzUPvCoQqCiTvUjN1/DantpUDiqmd78mluGAdEdSRJ7QOoq8
         /5DKmfcowCSRCHETUp+zW88wqQL+2B6DyOkDYGbA1yZTTCj2LovstnczcuXK6UhW0klg
         7LXQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773224004; x=1773828804; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EJUK1c7uh2qWa/PUs7/Gela8m5sgz/NTTAmffjVN7aY=;
        b=uG2GCsRIdA5G2pNfQCHYNc/4buEp66zArvGeags8eL+4dOfSjVvKRxAmUbly/2Yo/3
         DWBJXpBc2xoRxbEfAkqxjPKkPS9mG8Fi0/b1n/XjSVKeazg1LS6z8VtOiyT59w89oKJj
         PXVzxeAh5zSTXgivfWStupoCmUlnswuKH/5lk1qgqADSo4QsfRChOX12mKxpbGZoNI2y
         oI0+oxpYNenArIqfYSyJL7Vovmg7g8qSJcgnyYpuo7mu+RfpTL0tUcBAt0oykXNDP6ja
         7LkWNLuaFtpdKa8rrBrJq7JCqaqrU+vl/7l5D3bVB671OnSzU9B4wniW3Yhov1uzLB1l
         M2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224004; x=1773828804;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJUK1c7uh2qWa/PUs7/Gela8m5sgz/NTTAmffjVN7aY=;
        b=sswe82R3rPZEs88dVUMhQeBXZAEdQQ70jBgG0wdfjOuoflbqL3sjlGHzmSLE/pAxXN
         whyrV2EbEBpCZmmPPUDmw8NW+d/WINOwzKCEsDH3g47jq8BseBUAWtdb8Irr5qwb7DjI
         MEDg+Qi1f7BDOHgCx/fddX/j7vzKGc6j6vpENPILqKj/jeBoN33vaSQtMUKbpQCTtAsb
         AesIJfj2KvNWT0F7Hau1dfWEsJRdK4z1AYzkT8f7pJ3pR1iT0H/OEVBS6VhQupys5ox8
         vmz44PrNx6+xEQFOSDiJ5303g5dAS6s4ldLGie0RJPX+WDabSHn0szTG+AzIKabZXcht
         vS3g==
X-Forwarded-Encrypted: i=1; AJvYcCVYxDhJDIVTb5fOoUQxo5+avMAe44PV4DBm2wdTlf2P3xUaoUH3g/nueko5xstvDqadEPrdJPhiVcphUrl4LSWO@lists.infradead.org
X-Gm-Message-State: AOJu0YxwaHvsTrNHP2IJe9PgUiJtYvkf3Ua+4Sv/y76E0Qon3NTHxiOI
	Mffmn2BrgKBSxalrgjghHQiUTqah1mtVuwpFlf2AO0CtO/FYJTmPVMJG6mDfViR7yTjkYH2NXOi
	0aD3pMhpmGak/vaZvtBH3qJh5WJ0Tsil4g9lXQYxD
X-Gm-Gg: ATEYQzyV1IA4oHqVsxnZfmgWO62Vg1BthN6VNhKAJeeS+GQdMGoRdtUc4r/FYjUOSkq
	jGAwJNSYt6NkQ8ZufjSJf1cRzjfTpJm/zzBlLmn8GsHU7+64Htcxnp6yQ34JkOgV3yHTqlXvBEW
	nTaPQp5mbqTFRZSvf33E4YarJng6PWUIe/qH7EKAU0IDBfRF/qhj+6VTByTZzTdSD/k7U/hchIL
	MI1n+oPzDX1XXyajWi/KsZA+Fv2/Q30bkADon6llwxwN9WrB78wpq/NGoFNim3LfTf6mF2rcAen
	0w2zZKfHn5ESJItbPCCPqJxjq1YvWvyPGPl8vg==
X-Received: by 2002:a05:622a:1449:b0:509:105c:74a9 with SMTP id
 d75a77b69052e-509382ae1camr11927581cf.18.1773224004181; Wed, 11 Mar 2026
 03:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260305144351.17071-1-will@kernel.org> <20260305144351.17071-18-will@kernel.org>
In-Reply-To: <20260305144351.17071-18-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 10:12:47 +0000
X-Gm-Features: AaiRm50tqIjNQKfWSBmDN7C0OQpW0WkI6OuSdjJkK9RHrz0ZGsHlr6SsTi2slmE
Message-ID: <CA+EHjTxwPPDeDoW7krEpH5NMWHgp8dFZ+Q3RrAGZd=fJAaqx8A@mail.gmail.com>
Subject: Re: [PATCH v3 17/36] KVM: arm64: Support translation faults in inject_host_exception()
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_031325_997485_036B24C6 
X-CRM114-Status: GOOD (  19.80  )
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

On Thu, 5 Mar 2026 at 14:45, Will Deacon <will@kernel.org> wrote:
>
> Extend inject_host_exception() to support the injection of translation
> faults on both the data and instruction side to 32-bit and 64-bit EL0
> as well as 64-bit EL1. This will be used in a subsequent patch when
> resolving an unhandled host stage-2 abort.
>
> Cc: Fuad Tabba <tabba@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/trap_handler.h |  2 ++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c             | 18 +++++++++++++++---
>  2 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h b/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h
> index ba5382c12787..32d7b7746e8e 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h
> @@ -16,4 +16,6 @@
>                                 __always_unused int ___check_reg_ ## reg;       \
>                                 type name = (type)cpu_reg(ctxt, (reg))
>
> +void inject_host_exception(u64 esr);
> +
>  #endif /* __ARM64_KVM_NVHE_TRAP_HANDLER_H__ */
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index adfc0bc15398..6db5aebd92dc 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -705,15 +705,24 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
>         kvm_skip_host_instr();
>  }
>
> -static void inject_host_exception(u64 esr)
> +void inject_host_exception(u64 esr)
>  {
>         u64 sctlr, spsr_el1, spsr_el2, exc_offset = except_type_sync;
>         const u64 spsr_mask = PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT |
>                               PSR_V_BIT | PSR_DIT_BIT | PSR_PAN_BIT;
>
> -       exc_offset += CURRENT_EL_SP_ELx_VECTOR;
> -
>         spsr_el1 = spsr_el2 = read_sysreg_el2(SYS_SPSR);
> +       switch (spsr_el1 & (PSR_MODE_MASK | PSR_MODE32_BIT)) {
> +       case PSR_MODE_EL0t:
> +               exc_offset += LOWER_EL_AArch64_VECTOR;
> +               break;
> +       case PSR_MODE_EL0t | PSR_MODE32_BIT:
> +               exc_offset += LOWER_EL_AArch32_VECTOR;
> +               break;
> +       default:
> +               exc_offset += CURRENT_EL_SP_ELx_VECTOR;
> +       }
> +
>         spsr_el2 &= spsr_mask;
>         spsr_el2 |= PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT |
>                     PSR_MODE_EL1h;
> @@ -728,6 +737,9 @@ static void inject_host_exception(u64 esr)
>         if (system_supports_mte())
>                 spsr_el2 |= PSR_TCO_BIT;
>
> +       if (esr_fsc_is_translation_fault(esr))
> +               write_sysreg_el1(read_sysreg_el2(SYS_FAR), SYS_FAR);
> +
>         write_sysreg_el1(esr, SYS_ESR);
>         write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
>         write_sysreg_el1(spsr_el1, SYS_SPSR);
> --
> 2.53.0.473.g4a7958ca14-goog
>

