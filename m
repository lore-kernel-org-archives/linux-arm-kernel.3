Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD76D41D50
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWMX1jyjXeIgNw1WZzMJikLtB4FVJ9nrhVzaVMwg74Q=; b=cYsS1YNXkLauZGkU6guTqoPpcn
	djG1e1SVdULNI0CmdRW+4iN390CKzqq4CDCKXFOsevjRPJ/uwwHv4EfluDJFySU3NcVU1QoclELKg
	CcJfaudPZ4rmqDpqfSFwT2AEv0Rv+KG4G0/hhvsA0qdjUBNXPBVwpxM/dSkYQg64s9H1lHUupdg5x
	kpXhJ3VduMWBtrfu1Y1J+8APyy3ACH0ZDAW3J/rQn5MMpocvg6g9TJBq652vxyNkM6UcyxGm9Osjo
	tHczMG27naVbWmas2UR/XJ4b4iSo823AIglc2AjASIYt/RF04EgkREmAhfv4eNY533AsFu6Gl1LQM
	JF3Mrw3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTi1W-0000000Gk5R-2AlF;
	Thu, 11 Dec 2025 14:52:06 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTi1T-0000000Gk55-3Q6c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 14:52:04 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4ee147baf7bso445041cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:52:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765464722; cv=none;
        d=google.com; s=arc-20240605;
        b=S6wyLdb2+uT4/6RUfsYQ8wxAttGQwjY7TZQ8MZIx3WT06If01W6qr+OdhTvkrURUn3
         LT5r5/RuXJdnsBHqOXvBj37zQJPvpu98nJZTYrEA9V48YbewcjnWLko+mdS+Z3PhqUd3
         Ef/C7OBqkF+wEvR7HEccPwSgFxhqcB/CUdOofwW0R3O8YGt/Nof7paaxaBgVlwZLbHaC
         IQw8dJpiUOuISVP2CXVXN2NwajB4U2KBUfVOkiKz3z1xZAZ5rNkhpmkWB84bOPgiS+Jd
         Vxa2ph/S3ebdpc6de/H9jJu/61p1nVCwZw+LlQMpyUPkyB8pAd/uf63Be7OAu91ueeXj
         tVzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yWMX1jyjXeIgNw1WZzMJikLtB4FVJ9nrhVzaVMwg74Q=;
        fh=ZRt0fkDnS1+JeD0DxDKtaY6TdJ66NZPNBb+9Jc5zZVU=;
        b=CXQxONV/7n3/4U4eDZwiQaGSsziEkmq6mT+MSSxS2mm0AzyzuEifKy7yMaAOd0fsdN
         JPwzG3SQikNsoPMIlkTmJzJoCOottqoc3Ckkvkd7xozK7G+ckZArqEp18GYMrtQV6IIo
         OCsDTQuAeYSr5ktiue0XSGko3a8rnDP4QL9+5RXIMogEhfL9Uz+ao/6K4zkckm5YdKtP
         QYcBJgmlDINA7Rjh6NGOOsbjBcHaUKjL/R3/oA7ekw8BArAv/3xjewwj76Wl3W+2+PTM
         Es/VqsLLQHYw/VGK5xynlU3+6NICXEY9+2jjnRJfTuR2VkUr/EnMgy/wACwk92yqjTwx
         +cdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765464722; x=1766069522; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yWMX1jyjXeIgNw1WZzMJikLtB4FVJ9nrhVzaVMwg74Q=;
        b=mFGiNSAmbe7Uo6QlGdL7dmu1lcRfxY6gU9acxr7PMJQKEc5BQYUJkUdt8yyqGpWNBE
         FGTA8QKdHrXYYwR+piwh0E7Z9ZefoCMGbOvzNfvFX2oJlxQw6043KOch+9EUJVFf9wR7
         XTL4ph/JB9bvrBq2ORDIN+I4y7YVdONa18lt2B+mGzrE+WMSAzLDeNx+gMDRhRrDp65m
         lv8ieZUG6j4H5wRCcEwD2M9AYA1J4FtuLN936o/tHpqsqQ1j1EEGeX6UHncN2kSv7J4H
         pV2Gg4RSnUgfuI/63/e6UNINOY/D5gQF+qyu6xrHp2uQqxp1HmbCZoa/DTIw5fFSxthH
         585g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765464722; x=1766069522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWMX1jyjXeIgNw1WZzMJikLtB4FVJ9nrhVzaVMwg74Q=;
        b=CFD8MmnmUBlF1pifTlKnUo4qfnZDUVa+WIg5JAoiQq6CTMd2/3gbZEIV0i8R+tINKZ
         WNUKdeIesw6A0RpXApQ/PoXetRlaV6FW2s7N3xu2M9j2WjmY6PAUwhTxb8Q3UmgR0dMz
         npBxEq9I2+/SG87YwAAwRjD4w2sWyrj4FNi8QmHETOnyS7B+qV9TLZ1o1feJzhR0zlS+
         AChmBq/qcEGWO6smBDq4zpynCVue71BshRk0+0U/kbsCHpPO8KZ9P94QXXz5DyojZ7sW
         0D1ew1XC2FN1DA3wzhMtp6MLMxVcTVfoXegQZ7/GCOl6n8SYc7jzyCQCBdXVQ61fcSlP
         UpsA==
X-Forwarded-Encrypted: i=1; AJvYcCXIl7xGMHkf5UwAHhFVcetjEU3gtv+tWPZ8RAcEn2XYKUYoGxihrbDWbddRQx8ATt4X8AxqkcNF8Q/dOLz0t1Wr@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa/SLRohLcad5gatidPHP/If25UHbUkAp/vSWKx3yEEfDfqfip
	IDpzV50Lv7PvxxLV2Eon3ZI93UHoMt0XWKj5hQ4mj0P0T6Clc3xtwtmyBheEE01/U5EW+HSJRGy
	NFkmKHd7kJYwHleDwzkc9Cev4cgbb08cR0nnh89jY
X-Gm-Gg: AY/fxX655hidYAz7Y+vq+OqFB1SHALkLNS1DL3Y6phqmyv2acaAtk3ucMxY9b1JS6iK
	ISyfRiuOEv65XHDDGFpDFChLBQQKN6rjWGQNeg2VNBnPNa1ifc+eNKKK1fIvUVz+qP5jC96NMmA
	cYpWbSP/rEsz87OW7DzhTGBRZxMGMSHdQkqRvzxvWKkmdEjhH00Z4xV94xHZ3KHR/KcFlVe0Ojs
	lIVMYdY5E2w0Wsqwsl4uyk5z3MiL+kgRBzQUafWNVH9azzMiXzKpMDGmZIz2uf8PQVN5sZa
X-Google-Smtp-Source: AGHT+IFQKP5fapGPHx5ImO6c09xm7GohUJLdBZ1CUTPePaNGb2mNfszOTXSYC0I42sptlzmkcKe68l3xaix/F5ByaNg=
X-Received: by 2002:a05:622a:1995:b0:4b2:ecb6:e6dd with SMTP id
 d75a77b69052e-4f1bed26845mr9697741cf.1.1765464722271; Thu, 11 Dec 2025
 06:52:02 -0800 (PST)
MIME-Version: 1.0
References: <20251210173024.561160-1-maz@kernel.org> <20251210173024.561160-7-maz@kernel.org>
In-Reply-To: <20251210173024.561160-7-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 11 Dec 2025 14:51:25 +0000
X-Gm-Features: AQt7F2o1Eo4xEzZ0xMgWpr24G9qnYMnYlv-SMNtZ7eV3yobp_YNt8tudLckw7Mw
Message-ID: <CA+EHjTwi3S-BVYQWf6_TAyd4fi18Ng3G3HkxKh2MB8PrE_32Uw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] KVM: arm64: Honor UX/PX attributes for EL2 S1 mappings
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Sascha Bischoff <Sascha.Bischoff@arm.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_065203_867191_9B97DF0A 
X-CRM114-Status: GOOD (  18.39  )
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
> Now that we potentially have two bits to deal with when setting
> execution permissions, make sure we correctly handle them when both
> when building the page tables and when reading back from them.
>
> Reported-by: Alexandru Elisei <alexandru.elisei@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

/fuad

> ---
>  arch/arm64/include/asm/kvm_pgtable.h | 12 +++---------
>  arch/arm64/kvm/hyp/pgtable.c         | 24 +++++++++++++++++++++---
>  2 files changed, 24 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index be68b89692065..095e6b73740a6 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -87,15 +87,9 @@ typedef u64 kvm_pte_t;
>
>  #define KVM_PTE_LEAF_ATTR_HI_SW                GENMASK(58, 55)
>
> -#define __KVM_PTE_LEAF_ATTR_HI_S1_XN   BIT(54)
> -#define __KVM_PTE_LEAF_ATTR_HI_S1_UXN  BIT(54)
> -#define __KVM_PTE_LEAF_ATTR_HI_S1_PXN  BIT(53)
> -
> -#define KVM_PTE_LEAF_ATTR_HI_S1_XN                                     \
> -       ({ cpus_have_final_cap(ARM64_KVM_HVHE) ?                        \
> -                       (__KVM_PTE_LEAF_ATTR_HI_S1_UXN |                \
> -                        __KVM_PTE_LEAF_ATTR_HI_S1_PXN) :               \
> -                       __KVM_PTE_LEAF_ATTR_HI_S1_XN; })
> +#define KVM_PTE_LEAF_ATTR_HI_S1_XN     BIT(54)
> +#define KVM_PTE_LEAF_ATTR_HI_S1_UXN    BIT(54)
> +#define KVM_PTE_LEAF_ATTR_HI_S1_PXN    BIT(53)
>
>  #define KVM_PTE_LEAF_ATTR_HI_S2_XN     GENMASK(54, 53)
>
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index e0bd6a0172729..97c0835d25590 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -342,6 +342,9 @@ static int hyp_set_prot_attr(enum kvm_pgtable_prot prot, kvm_pte_t *ptep)
>         if (!(prot & KVM_PGTABLE_PROT_R))
>                 return -EINVAL;
>
> +       if (!cpus_have_final_cap(ARM64_KVM_HVHE))
> +               prot &= ~KVM_PGTABLE_PROT_UX;
> +
>         if (prot & KVM_PGTABLE_PROT_X) {
>                 if (prot & KVM_PGTABLE_PROT_W)
>                         return -EINVAL;
> @@ -351,8 +354,16 @@ static int hyp_set_prot_attr(enum kvm_pgtable_prot prot, kvm_pte_t *ptep)
>
>                 if (system_supports_bti_kernel())
>                         attr |= KVM_PTE_LEAF_ATTR_HI_S1_GP;
> +       }
> +
> +       if (cpus_have_final_cap(ARM64_KVM_HVHE)) {
> +               if (!(prot & KVM_PGTABLE_PROT_PX))
> +                       attr |= KVM_PTE_LEAF_ATTR_HI_S1_PXN;
> +               if (!(prot & KVM_PGTABLE_PROT_UX))
> +                       attr |= KVM_PTE_LEAF_ATTR_HI_S1_UXN;
>         } else {
> -               attr |= KVM_PTE_LEAF_ATTR_HI_S1_XN;
> +               if (!(prot & KVM_PGTABLE_PROT_PX))
> +                       attr |= KVM_PTE_LEAF_ATTR_HI_S1_XN;
>         }
>
>         attr |= FIELD_PREP(KVM_PTE_LEAF_ATTR_LO_S1_AP, ap);
> @@ -373,8 +384,15 @@ enum kvm_pgtable_prot kvm_pgtable_hyp_pte_prot(kvm_pte_t pte)
>         if (!kvm_pte_valid(pte))
>                 return prot;
>
> -       if (!(pte & KVM_PTE_LEAF_ATTR_HI_S1_XN))
> -               prot |= KVM_PGTABLE_PROT_X;
> +       if (cpus_have_final_cap(ARM64_KVM_HVHE)) {
> +               if (!(pte & KVM_PTE_LEAF_ATTR_HI_S1_PXN))
> +                       prot |= KVM_PGTABLE_PROT_PX;
> +               if (!(pte & KVM_PTE_LEAF_ATTR_HI_S1_UXN))
> +                       prot |= KVM_PGTABLE_PROT_UX;
> +       } else {
> +               if (!(pte & KVM_PTE_LEAF_ATTR_HI_S1_XN))
> +                       prot |= KVM_PGTABLE_PROT_PX;
> +       }
>
>         ap = FIELD_GET(KVM_PTE_LEAF_ATTR_LO_S1_AP, pte);
>         if (ap == KVM_PTE_LEAF_ATTR_LO_S1_AP_RO)
> --
> 2.47.3
>

