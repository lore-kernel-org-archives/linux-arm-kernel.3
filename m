Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0B3E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 08:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9aOMhauyNEGMb+lCk/+Fik0KUFbDUblO2f0wjbG5sGk=; b=PYIE6lhACwoW89Bx2jq8S/gV8J
	iaYvz63iJuo8aZSMEDDIAXsBfgmc2VYe8RN4UbM4gPLC0XquSLIMxBCxJgnJP6L8+DqqnkSEvFrHM
	95kIONtljWB9S13FEUtbL5z4F9f4U+IJk5AKtAC45vorcl5xuKs6FIZY8uK6GNKMVdibiHqVNKL18
	WKKWI6cUu5tSSefgNVmWzcI4JAfN+/PvAWZSaOQ7CmjrMkrLn8CYbnIybZGQYg36XczfioV7TRXAW
	r1FBZT3BA0GV1KEeC2APmmKU+uiYIMOkVRZFXUcfChTnsC+nI+NBvqRqPcnwrXoNrrgvk4dWQnFDD
	zqfY+2IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTEr-0000000ClBd-0dPs;
	Tue, 17 Dec 2024 08:47:33 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTBa-0000000CkJG-46n3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 08:44:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4361d5730caso26975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 00:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734425049; x=1735029849; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9aOMhauyNEGMb+lCk/+Fik0KUFbDUblO2f0wjbG5sGk=;
        b=g0P96S3YrQ/tuFZIPGgwkgTrTuXQYGlSRa8HHG1TK4Tj9vHuY0zvEp5p2gQzgayVNx
         Dz3h6lJC72YQuOvjVAoUIvxRkSXV8vuLXXXPM0rfxvYc83bCH6ZGOrcF55kVDTL3rGT2
         Xi8g0I4zFbeZSUPpAnACZ0N+3SvdmWa0QeiR2nNpS5Sr+0YbXkQ8WFPHUmYX+A7ZfQ4I
         +IXZdh/hmsqjTLWh8vQvAgMstml/fu4sQYgwV0tW9Br69gWxT6MGdM/sk4DWSzEo4q31
         PUz5UNEN4ogpc12sZHls9IWE4qYT2HX2H9/04yvWZjU1tx+wVQOEto8G8qcASFAiy8iX
         orjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425049; x=1735029849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9aOMhauyNEGMb+lCk/+Fik0KUFbDUblO2f0wjbG5sGk=;
        b=Wb+0f9qmITWMbw6x1VS4lSBTjHjO6BbpPFuIkIijmz6cuXLppXgDf3yuCLaQkG+uTy
         u5mY2YxC/Cd4ZuY9JoL5PS6r1ptqVqvKMohnE6GYIdbLbyobhL0CTnWZOGlioF4GrAi1
         C8FXti1JOEqKHyfoTLMrv3V5U79x8OXQ/6fMmM6NaVxb3BJEcRMSZOo0jSMTorxnjqiM
         0b/xdTDp5QgeXrpZKsFwriKxBCQ4C4XHDl7Xc7r/ZxUmmph9rIxjUdK+3kZKjxtgBRLH
         /uYBBQ/dlgetF6KnRt4UbynP46FpUweAU0T0p8VdixQj+5j86q/sDIXsbtm58oUnH5Wm
         2g+w==
X-Forwarded-Encrypted: i=1; AJvYcCV4Tng+aDEjWTODVoX2ALlbBLOxnT5bV79mEWRWzkdDSqFDgX7fQVCoMxeUkpykq7iHGrk8N0rPpWE56tlkRxhd@lists.infradead.org
X-Gm-Message-State: AOJu0YydzcCd4vBB4dTu0O6lgVGXhvagt64HCpxZL/T3OO1zT3cDEun8
	Cf+f1WZW6LBEKqNo5D9LK07/+Blekl0Ty+sXvtwK9rIYzGXoEG6QudKStRdVcD+62cvNiTAg83U
	kxmtuOWiW/E5/csa0hqSENoViRku7efcSzyDE
X-Gm-Gg: ASbGncs8QXxkv9HoFkVLhp4bSGveupOtLLwmw+HQLvIBliV/ehpcc8iZOKKnX6deHe3
	syrQmap4fdfbjEQkIeq99449zA1bx5lGcJfTau7DDCNCxF8ybbW2+X7/2JeMXVkosD/E=
X-Google-Smtp-Source: AGHT+IF4JRtgEWyFkNnA7Okyum1zxkryf5hfSceNzF5pRsh6nPxBddG8vtt5SAlgqybP5Y0TnQhiQk19Bz3LqCTEjLo=
X-Received: by 2002:a05:600c:4d21:b0:436:1aa8:d05d with SMTP id
 5b1f17b1804b1-43648c98e30mr922405e9.0.1734425049163; Tue, 17 Dec 2024
 00:44:09 -0800 (PST)
MIME-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com> <20241216175803.2716565-3-qperret@google.com>
In-Reply-To: <20241216175803.2716565-3-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Dec 2024 08:43:32 +0000
Message-ID: <CA+EHjTxmt4QdmiqCCJh9kf9aGL36hVXRXCr+EgdT1TDk_arJ=w@mail.gmail.com>
Subject: Re: [PATCH v3 02/18] KVM: arm64: Move enum pkvm_page_state to memory.h
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_004411_016515_3BE336A7 
X-CRM114-Status: GOOD (  20.52  )
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

On Mon, 16 Dec 2024 at 17:58, Quentin Perret <qperret@google.com> wrote:
>
> In order to prepare the way for storing page-tracking information in
> pKVM's vmemmap, move the enum pkvm_page_state definition to
> nvhe/memory.h.
>
> No functional changes intended.
>
> Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 34 +------------------
>  arch/arm64/kvm/hyp/include/nvhe/memory.h      | 33 ++++++++++++++++++
>  2 files changed, 34 insertions(+), 33 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 8c30362af2b9..25038ac705d8 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -11,42 +11,10 @@
>  #include <asm/kvm_mmu.h>
>  #include <asm/kvm_pgtable.h>
>  #include <asm/virt.h>
> +#include <nvhe/memory.h>
>  #include <nvhe/pkvm.h>
>  #include <nvhe/spinlock.h>
>
> -/*
> - * SW bits 0-1 are reserved to track the memory ownership state of each page:
> - *   00: The page is owned exclusively by the page-table owner.
> - *   01: The page is owned by the page-table owner, but is shared
> - *       with another entity.
> - *   10: The page is shared with, but not owned by the page-table owner.
> - *   11: Reserved for future use (lending).
> - */
> -enum pkvm_page_state {
> -       PKVM_PAGE_OWNED                 = 0ULL,
> -       PKVM_PAGE_SHARED_OWNED          = BIT(0),
> -       PKVM_PAGE_SHARED_BORROWED       = BIT(1),
> -       __PKVM_PAGE_RESERVED            = BIT(0) | BIT(1),
> -
> -       /* Meta-states which aren't encoded directly in the PTE's SW bits */
> -       PKVM_NOPAGE                     = BIT(2),
> -};
> -#define PKVM_PAGE_META_STATES_MASK     (~(BIT(0) | BIT(1)))
> -
> -#define PKVM_PAGE_STATE_PROT_MASK      (KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
> -static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
> -                                                enum pkvm_page_state state)
> -{
> -       prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> -       prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> -       return prot;
> -}
> -
> -static inline enum pkvm_page_state pkvm_getstate(enum kvm_pgtable_prot prot)
> -{
> -       return FIELD_GET(PKVM_PAGE_STATE_PROT_MASK, prot);
> -}
> -
>  struct host_mmu {
>         struct kvm_arch arch;
>         struct kvm_pgtable pgt;
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> index ab205c4d6774..c84b24234ac7 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> @@ -7,6 +7,39 @@
>
>  #include <linux/types.h>
>
> +/*
> + * SW bits 0-1 are reserved to track the memory ownership state of each page:
> + *   00: The page is owned exclusively by the page-table owner.
> + *   01: The page is owned by the page-table owner, but is shared
> + *       with another entity.
> + *   10: The page is shared with, but not owned by the page-table owner.
> + *   11: Reserved for future use (lending).
> + */
> +enum pkvm_page_state {
> +       PKVM_PAGE_OWNED                 = 0ULL,
> +       PKVM_PAGE_SHARED_OWNED          = BIT(0),
> +       PKVM_PAGE_SHARED_BORROWED       = BIT(1),
> +       __PKVM_PAGE_RESERVED            = BIT(0) | BIT(1),
> +
> +       /* Meta-states which aren't encoded directly in the PTE's SW bits */
> +       PKVM_NOPAGE                     = BIT(2),
> +};
> +#define PKVM_PAGE_META_STATES_MASK     (~(BIT(0) | BIT(1)))
> +
> +#define PKVM_PAGE_STATE_PROT_MASK      (KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
> +static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
> +                                                enum pkvm_page_state state)
> +{
> +       prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> +       prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> +       return prot;
> +}
> +
> +static inline enum pkvm_page_state pkvm_getstate(enum kvm_pgtable_prot prot)
> +{
> +       return FIELD_GET(PKVM_PAGE_STATE_PROT_MASK, prot);
> +}
> +
>  struct hyp_page {
>         unsigned short refcount;
>         unsigned short order;
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

