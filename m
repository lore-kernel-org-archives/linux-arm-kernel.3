Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBC8109C059
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 19:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIokNmwGM3kd/1AiAW2m0XTptRlPEYAfbrhHNMyEeRg=; b=4pJnKdHvcmODvArPnPnS3DEBGg
	k+lYLJK4gnn7zf4grkLGMykxhMhIAq59vnsiomZ0Yau8Urhp+9DRqYmjnhBL6jXx1rFTnWLNIoHjj
	I0OqAl4zgb1tDwVqfH2CmSM6HqREctmw+yFNF+SscK9ZRgX4l2zgsaa7VBfHcLKU1+DfkHaN/Y2TL
	aqY/XnXVZ7FGAlEbPODO3E7tWL+nj1v+kY4dEeQPGAMAaCyTSmzkQPX1xs/ne6srXKTsfnmTakZC8
	LLuBNWDLPp3GTbCjW019Lg4nKVK/DVYJBMjJnC//qY2jwTw8FjI3aKRnaais1mX1AVQSd2+I9kC/D
	d4HRI9eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5TuI-000000049d9-3oMz;
	Wed, 25 Mar 2026 19:28:46 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5TuH-000000049cG-0wMn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 19:28:46 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5091ed02c54so11771cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 12:28:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774466924; cv=none;
        d=google.com; s=arc-20240605;
        b=IF5ptHXKztu+WwHyesebfCStu+zf7NLDWpVS4sRwKbvPDxLwrAKCqS0+WN4y7LazQe
         CRwShZlCBsbBR3x55oN232HT5V+uLUrnWqAsXNEIbOVLHLOi3Ji60ptG3vKdq59u/5SR
         pm/lBVNLOPGrl1JU4ttOcJyyRDC4dTliyc4NN8i3UAI/3CoWL9KtXEMS0L6Q/UvkYOPz
         PTWlVrSDcVy+E3f+81I7cV2yGbHlh0FrRDSdoOpXUJk1gTMOTMLaHeG+Xk1OZK8THy0i
         pK1jPLJ/rtv+Wszq4fqIxRxYVsSKBRMmO7av3N0xXstJsimnBKEpZLLwiD2BKMjlOiLp
         A1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wIokNmwGM3kd/1AiAW2m0XTptRlPEYAfbrhHNMyEeRg=;
        fh=8s/XdhgVx2I2fUAamAFWFklH9kDxwPzDwcWJ2tOzvKQ=;
        b=lNIUOYWmh4h4FmflOrnxdW8BVw2760mA452ds64V5ScfyXyMYrg1MspHNxt1bSx2c/
         hY3c3dGk9d3SXWjtMa7i1iceo/TKNdYgJlRztLnXleMSVsXN4AbJ1bRxKvsUUeGs5g76
         10yE8su9+p3YSGOYMRPioxvvZUJWXR1ypWvRmmyv/MYcg6yZTeCQnscird8/2KGdSxDO
         Cb6748eYRZYlTZH5ig3Ux3jM9sJ6ax4865INOKuLeIKcBj++FLneU12cUzpMwVmBsUXw
         N6X/zbnvTLET1YnOHgIK2fprtdlO1gh3bvWPU7dDr+a9ytfIiU0atvedLDQvgngFCn+9
         qg3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774466924; x=1775071724; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wIokNmwGM3kd/1AiAW2m0XTptRlPEYAfbrhHNMyEeRg=;
        b=E5oVsYyYzjom+2xshZn5xScSKRKhPwSA6iga882YawZNN8PqwuPH4QM6xebiEM9hR1
         07u0sW2Qd3ZMGeWt+el+H7J1NDdACImt3tF8Jcyf0o9R8Qk8w8ib7TaZegIeCZye6bkU
         7Qf8irqa5GPAhvuqFdKljhXfcbnTyNwfO6wk+emdYb3GvDR9M9pwz4nz09X6cGQHXFs4
         PaJ4QaT1XEbfF8dSf53wSjMEx02tvFhPm6zs7B5/hX5QjzX9jODy6mUB9xm36XD8bbqR
         /thYW02dGZrP24MAPmszAgOnlH6xfxYKobQ1E3fBlMH9aHoxzKOGU24RwpeVTJOqzMyg
         6o6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466924; x=1775071724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIokNmwGM3kd/1AiAW2m0XTptRlPEYAfbrhHNMyEeRg=;
        b=kFzINklcYOMFSbftziO2cJuymOHHzKa7MA7aAGOgbA3GixdixzesDgKYplTfaWXv6d
         jMCRhJQB5lbNMZutQU+Q1FNE7lwQ5e1H76Ba5LNPUaxyZrOhJs+i1kKNg4YkWtJTIv28
         v7YbECbomPoiVVyy8Yq7wdWUn75KbR/5rN2LgSRq7B7UF2fmfHf4MLKXX5ycx3Lg5J1T
         D30UWeeJvlfH7FIEb0LtUbAXtLqy7aY0wI/0dt4XofFvjp2SLTxtOBOaLVwOJWHlH57m
         MksYRDqM/ATXfIljML6zwUufkuf51idiVkqx+q+36xL8yxbOLepDVsz3k8551ummNz5v
         PJ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkTODT5viV0C2v15aM98XqKJ325B4cfA5/E7cFFhvpk9RBF7M7eDb3Nb3qQvvGRMGiNU5iOGZrAVBXouFFMAv1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0PO4BLOHm+dyQHgfWN6BTRmzjhrGT1gB37uWni7mbczchfO9R
	1goRoX6eAHbr/g94WUEH+DmiS81xJvYiyWSTr1jvOWXzkoC4FeN1Q6h/jojJH0IbUELzqKuLjcP
	cpffc7C6djFhultVL60ga/RZh9eullWdyM5+p6ylU
X-Gm-Gg: ATEYQzwwZU5oB8yBw5bs6ouQNjSQbBRDQMoQPTm4h041k6Um+flsL2UXusw0BxyRqaD
	coyNVJii2mEBfZTb1Ex8IKpzAe3iOrTXXKZMDMCKi6PNHQwTI4imYi/ZmtItD2usYrllPH/G+nS
	6+VdHHnCCPRpUpxAD3rJkjxSCahIVlAa062DyvXCegKabUqMnwkeumrYbwpz4En8ZiICW28BjtA
	vmXwnOf7JQ4VVxNKJQJW5T2MGaEJiIC5p5ZLalxe59qkAYj1F6Ca2dbIAxrz9sH9AL0tyyIpTdN
	kPlb6lU3
X-Received: by 2002:a05:622a:15c7:b0:509:371:f2ab with SMTP id
 d75a77b69052e-50b93b7ed1dmr1169981cf.16.1774466923434; Wed, 25 Mar 2026
 12:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260227212136.7660-1-will@kernel.org> <20260227212136.7660-3-will@kernel.org>
In-Reply-To: <20260227212136.7660-3-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 25 Mar 2026 19:28:06 +0000
X-Gm-Features: AQROBzCdbyLPa1JZSjpKKNOftTCsN0s4jT6rOyJ633tQAAZ1oZqbJolcz5MXyP8
Message-ID: <CA+EHjTxM7Mju1Z8+=oshpESJ59=QVdezL7CY2AhKGnvYOtUXMw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] KVM: arm64: Disable SPE Profiling Buffer when
 running in guest context
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_122845_279553_D68701C3 
X-CRM114-Status: GOOD (  32.99  )
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

On Fri, 27 Feb 2026 at 21:22, Will Deacon <will@kernel.org> wrote:
>
> The nVHE world-switch code relies on zeroing PMSCR_EL1 to disable
> profiling data generation in guest context when SPE is in use by the
> host.
>
> Unfortunately, this may leave PMBLIMITR_EL1.E set and consequently we
> can end up running in guest/hypervisor context with the Profiling Buffer
> enabled. The current "known issues" document for Rev M.a of the Arm ARM
> states that this can lead to speculative, out-of-context translations:
>
>   | 2.18 D23136:
>   |
>   | When the Profiling Buffer is enabled, profiling is not stopped, and
>   | Discard mode is not enabled, the Statistical Profiling Unit might
>   | cause speculative translations for the owning translation regime,
>   | including when the owning translation regime is out-of-context.
>
> In a similar fashion to TRBE, ensure that the Profiling Buffer is
> disabled during the nVHE world switch before we start messing with the
> stage-2 MMU and trap configuration.
>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: James Clark <james.clark@linaro.org>
> Cc: Leo Yan <leo.yan@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Alexandru Elisei <alexandru.elisei@arm.com>
> Fixes: f85279b4bd48 ("arm64: KVM: Save/restore the host SPE state when entering/leaving a VM")
> Signed-off-by: Will Deacon <will@kernel.org>

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/kvm_host.h  |  1 +
>  arch/arm64/kvm/hyp/nvhe/debug-sr.c | 33 ++++++++++++++++++++----------
>  arch/arm64/kvm/hyp/nvhe/switch.c   |  2 +-
>  3 files changed, 24 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 1532ad2b2ec2..d527c77977dd 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -768,6 +768,7 @@ struct kvm_host_data {
>                 struct kvm_guest_debug_arch regs;
>                 /* Statistical profiling extension */
>                 u64 pmscr_el1;
> +               u64 pmblimitr_el1;
>                 /* Self-hosted trace */
>                 u64 trfcr_el1;
>                 u64 trblimitr_el1;
> diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> index 3dbdee1148d3..75158a9cd06a 100644
> --- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> +++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> @@ -14,20 +14,20 @@
>  #include <asm/kvm_hyp.h>
>  #include <asm/kvm_mmu.h>
>
> -static void __debug_save_spe(u64 *pmscr_el1)
> +static void __debug_save_spe(void)
>  {
> -       u64 reg;
> +       u64 *pmscr_el1, *pmblimitr_el1;
>
> -       /* Clear pmscr in case of early return */
> -       *pmscr_el1 = 0;
> +       pmscr_el1 = host_data_ptr(host_debug_state.pmscr_el1);
> +       pmblimitr_el1 = host_data_ptr(host_debug_state.pmblimitr_el1);
>
>         /*
>          * At this point, we know that this CPU implements
>          * SPE and is available to the host.
>          * Check if the host is actually using it ?
>          */
> -       reg = read_sysreg_s(SYS_PMBLIMITR_EL1);
> -       if (!(reg & BIT(PMBLIMITR_EL1_E_SHIFT)))
> +       *pmblimitr_el1 = read_sysreg_s(SYS_PMBLIMITR_EL1);
> +       if (!(*pmblimitr_el1 & BIT(PMBLIMITR_EL1_E_SHIFT)))
>                 return;
>
>         /* Yes; save the control register and disable data generation */
> @@ -37,18 +37,29 @@ static void __debug_save_spe(u64 *pmscr_el1)
>
>         /* Now drain all buffered data to memory */
>         psb_csync();
> +       dsb(nsh);
> +
> +       /* And disable the profiling buffer */
> +       write_sysreg_s(0, SYS_PMBLIMITR_EL1);
> +       isb();
>  }
>
> -static void __debug_restore_spe(u64 pmscr_el1)
> +static void __debug_restore_spe(void)
>  {
> -       if (!pmscr_el1)
> +       u64 pmblimitr_el1 = *host_data_ptr(host_debug_state.pmblimitr_el1);
> +
> +       if (!(pmblimitr_el1 & BIT(PMBLIMITR_EL1_E_SHIFT)))
>                 return;
>
>         /* The host page table is installed, but not yet synchronised */
>         isb();
>
> +       /* Re-enable the profiling buffer. */
> +       write_sysreg_s(pmblimitr_el1, SYS_PMBLIMITR_EL1);
> +       isb();
> +
>         /* Re-enable data generation */
> -       write_sysreg_el1(pmscr_el1, SYS_PMSCR);
> +       write_sysreg_el1(*host_data_ptr(host_debug_state.pmscr_el1), SYS_PMSCR);
>  }
>
>  static void __trace_do_switch(u64 *saved_trfcr, u64 new_trfcr)
> @@ -177,7 +188,7 @@ void __debug_save_host_buffers_nvhe(struct kvm_vcpu *vcpu)
>  {
>         /* Disable and flush SPE data generation */
>         if (host_data_test_flag(HAS_SPE))
> -               __debug_save_spe(host_data_ptr(host_debug_state.pmscr_el1));
> +               __debug_save_spe();
>
>         /* Disable BRBE branch records */
>         if (host_data_test_flag(HAS_BRBE))
> @@ -195,7 +206,7 @@ void __debug_switch_to_guest(struct kvm_vcpu *vcpu)
>  void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu)
>  {
>         if (host_data_test_flag(HAS_SPE))
> -               __debug_restore_spe(*host_data_ptr(host_debug_state.pmscr_el1));
> +               __debug_restore_spe();
>         if (host_data_test_flag(HAS_BRBE))
>                 __debug_restore_brbe(*host_data_ptr(host_debug_state.brbcr_el1));
>         if (__trace_needs_switch())
> diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
> index f00688e69d88..9b6e87dac3b9 100644
> --- a/arch/arm64/kvm/hyp/nvhe/switch.c
> +++ b/arch/arm64/kvm/hyp/nvhe/switch.c
> @@ -278,7 +278,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
>          * We're about to restore some new MMU state. Make sure
>          * ongoing page-table walks that have started before we
>          * trapped to EL2 have completed. This also synchronises the
> -        * above disabling of BRBE and SPE.
> +        * above disabling of BRBE.
>          *
>          * See DDI0487I.a D8.1.5 "Out-of-context translation regimes",
>          * rule R_LFHQG and subsequent information statements.
> --
> 2.53.0.473.g4a7958ca14-goog
>

