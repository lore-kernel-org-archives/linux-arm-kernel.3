Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792EDFC72C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 15:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TMp7zsq0XX2Ydy/N6WFEOqdEvOC8DyuCjYsPFMbMJY=; b=zOThbelzgyTIGtPM5kQkTxs/3I
	jpCnT7YXKNqLa5j5YqbQ5F64djRysOS6o3xNl5tyvGTIDRdsXDqQxJusPhaYMeRVqDDI1RSa5v63v
	faZQggK5XhaRFEUjBkjJhUhJo4Ao7fIDAfSK1UC8/p3C0JoiVw+dCCFix0bCa7N+Tq9DBef2YTwTV
	wQ0l7/Hk2Ok0xfOAJHRkZPHQPgFm+Z1IfH9nkZP9Pt99VY25+pkihsSxEAwqMbBfMpdr/QVl/sRTH
	EIsmmIxiLhyFbWNko0fqSswFrhyNVIej4AEFDvrbjxX/cI8PFeSME607WkcdCfc7RXrYrjaag13o8
	5Gbgk32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4L4U-0000000FTOH-43ie;
	Sun, 22 Mar 2026 15:50:34 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4L4P-0000000FTNm-1vui
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 15:50:32 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50b30d61be6so932511cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 08:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774194628; cv=none;
        d=google.com; s=arc-20240605;
        b=eiyLJb/SFHnDlVZMdM8HmsLeNaXyEg4e/Z/RpOvcfWospB2pH1To1Iu289Pi/BBBRA
         GZCI792ni5Yyvjm2o++8Cq0dqSZLdJ3ULdaMFWZYdDu/Asj+dvXKdw/5KP9ax8njeswD
         vh5ulNMsG/y66JlgvXyJW69brttajHP+8ZrA6TMUHrYWXTZ6LVg9Ml9zaBmswo/vL69r
         gq3rAPOW7Wrd8TV7QmpvTMNTCBICP1czZAvH1zI4Zbahe43h6BJXIUef27gn+mK8lGUF
         5Xt/nk3b+gRgYEcXrO7SZmlfCir8VPUM6ybfwe4WEp4KqIQ/1V/Yj0nmCGBQtJw7iOTm
         pPgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9TMp7zsq0XX2Ydy/N6WFEOqdEvOC8DyuCjYsPFMbMJY=;
        fh=3Tyk8eLwe4HzDAqhtBTO7zmIHjP+JkmB72VpOip22QU=;
        b=D8Qvj54r3DvjeD8TUZSpsSdonxXujb4z+EYd9FVAxXC3rE//B1oqaS7VPzEwA68RYM
         ebtG7okyVqhNRiLvojUM/bvwVyCEDYmOk/DjtYqHiuAPdX8L1lyeFkLDdSv6GmbCT9vW
         M5xlzguSPsvnqfR17CE3neNQMQeDmQIksnhDTMaPZLrsuhLLAzRkMUTtLpiRISxWXoR/
         3VE6QHsvh/MfzQTrtWIrUuQ5QbH1MoKQzrZlUoBIZbH8C2O43rETKTmAFrx3NR4/bT7h
         o3Rez6jlrswlx1cwe5zXqWocIC9WYe6FMOeugK8WkdOoJsHyiLTXEhxERuVnC6tuXTXM
         0Tig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774194628; x=1774799428; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9TMp7zsq0XX2Ydy/N6WFEOqdEvOC8DyuCjYsPFMbMJY=;
        b=PsrSy6RY9PMiBRaLTyk6dL9mhtuMwgVwRZs9U35p8INvj0x3S2RbXISoP9yW8zwKXd
         GWyjisLdWeWxSsoPEs/QSWqPe4s0tZoquAHItE/lrkgFLCPNHbZtpBqTS2wY6qIE7cxh
         WIJAxSAKzWnu+m06VsXZdrQHExRxKXQPvdFR1qDkO0PrTfmOh/1uePGjAHtQf+ZRY1UO
         WmYkzlAM5wr+esuh0l1SHOJdFi96x1dkWGCBznPc6MG+s6vZ+qMmBnFcu5OkALTpJX2J
         b3RS+ljUOyMzWIPqk8edYxzaAkF4l1tRyXXzYXjXLYIPfOK00+H3D+wu/4w64ubqWm3i
         BDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774194628; x=1774799428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TMp7zsq0XX2Ydy/N6WFEOqdEvOC8DyuCjYsPFMbMJY=;
        b=DINmnbbsp2MUMHkjPRb8Nm37TQwhByf8ygO2aMH+DkOvcqZJ8Kf5kxzG559cklHR17
         KVnfAEFFVYhD+07vmPwV6/JEUb54rs5zuyhV1EFW68uvubsPzjHavDYP9t9VEcQMghbd
         umpSW+CifyZ69LGoE+1Tnc9D5/l/w6TkrMPt96jmgHwBnbYs9nh8x3GsxLBWNbPthxSm
         0YHSRgk4rHFIBAVEXZxt+EOWBGMTpmcxvkJ/6tR8/yc3w9MTNEXVswDj2l/Ym/9P+tDW
         q2q9wskkgsSpRJ+UnmX3Tq6JA7bv+rMtvvB3sAq2psE7UCdTFZ1+gDfIGruAnuxwPf3S
         v/KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs8rps6Gub+nctxVyhAlEaIz+16l2Bnuh47uHw67iTrv0SeYlUBlFmAzLIAcg2N0tXQvm7J9fhsR2sYJZYzpUv@lists.infradead.org
X-Gm-Message-State: AOJu0YxhWD9S5IdqG73K9cLQu87wJt9tOKg485f3bC8PQP/sMjJw3sTn
	Vmpwlj+m5aLec1lzP3J7hv8g3EkIFDLSxlzueeAYI9jXE6HzHcjt3/UZ27EuDb1wSIor73cjcHh
	bfWf4Wzipo/knQa1wq8ma2AydEKSla/7VMX0QPQ/3Qk9klb8FDHXHA/pfXXU=
X-Gm-Gg: ATEYQzzqNAJ2/s6ABakrJhv2gclHfvj0b4vCZrK3znFGsKgZcQKKYJOuAEKTT7gIRQP
	5QTZuFQBYrzHLaMgKoGpN+A89vaePuEGXWc47dYCWVKBGL+WILdjHtkvu7Qc3CvrNZEl17HkXdj
	0CSV9p33CEIAzd/dloSIc0NPMUbmsRYqTOHqHg9mvjHcZWX9+JFtGX3VXKEhJ4x0juqIjIUBIYU
	oHV0tNFnNZmwJ8wgEhUuOlztvCMqRMXduIYQkFEv87PNJkd1oRQc8OhKVUjGRNwzAp3KpJmQxjv
	xQg1ZgBJ
X-Received: by 2002:ac8:5f8e:0:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-50b48098112mr16468731cf.5.1774194627629; Sun, 22 Mar 2026
 08:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260321212419.2803972-1-maz@kernel.org> <20260321212419.2803972-5-maz@kernel.org>
In-Reply-To: <20260321212419.2803972-5-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 22 Mar 2026 15:49:50 +0000
X-Gm-Features: AQROBzDQA782Knk4hyvgu0Qa0fNpkNAT5ojfrw4qkd--fM3yU2R8wbZU-YGI_Xs
Message-ID: <CA+EHjTyeuE3aqqmx8Fe4REOM7WstEAp_A0tvMNygPJCLT7V7wQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] KVM: arm64: pkvm: Use direct function pointers for cpu_{on,resume}
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Mostafa Saleh <smostafa@google.com>, Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_085031_737273_B2737353 
X-CRM114-Status: GOOD (  22.53  )
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

On Sat, 21 Mar 2026 at 21:24, Marc Zyngier <maz@kernel.org> wrote:
>
> Instead of using a boolean to decide whether a CPU is booting or
> resuming, just pass an actual function pointer around.
>
> This makes the code a bit more straightforward to understand.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_asm.h     |  3 ++-
>  arch/arm64/kvm/hyp/nvhe/hyp-init.S   |  9 +++----
>  arch/arm64/kvm/hyp/nvhe/psci-relay.c | 39 +++++++++++++++++-----------
>  3 files changed, 29 insertions(+), 22 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index a1ad12c72ebf1..f4c769857fdfc 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -291,7 +291,8 @@ asmlinkage void __noreturn hyp_panic_bad_stack(void);
>  asmlinkage void kvm_unexpected_el2_exception(void);
>  struct kvm_cpu_context;
>  void handle_trap(struct kvm_cpu_context *host_ctxt);
> -asmlinkage void __noreturn __kvm_host_psci_cpu_entry(bool is_cpu_on);
> +asmlinkage void __noreturn __kvm_host_psci_cpu_on_entry(void);
> +asmlinkage void __noreturn __kvm_host_psci_cpu_resume_entry(void);
>  void __noreturn __pkvm_init_finalise(void);
>  void kvm_nvhe_prepare_backtrace(unsigned long fp, unsigned long pc);
>  void kvm_patch_vector_branch(struct alt_instr *alt,
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> index 2e80fcbff2dff..64296b31da73d 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> @@ -173,7 +173,7 @@ SYM_CODE_END(___kvm_hyp_init)
>   * x0: struct kvm_nvhe_init_params PA
>   */
>  SYM_CODE_START(kvm_hyp_cpu_entry)
> -       mov     x1, #1                          // is_cpu_on = true
> +       ldr     x29, =__kvm_host_psci_cpu_on_entry
>         b       __kvm_hyp_init_cpu
>
>  /*
> @@ -182,11 +182,10 @@ SYM_CODE_START(kvm_hyp_cpu_entry)
>   * x0: struct kvm_nvhe_init_params PA
>   */
>  SYM_CODE_START(kvm_hyp_cpu_resume)
> -       mov     x1, #0                          // is_cpu_on = false
> +       ldr     x29, =__kvm_host_psci_cpu_resume_entry
>
>  SYM_INNER_LABEL(__kvm_hyp_init_cpu, SYM_L_LOCAL)
>         mov     x28, x0                         // Stash arguments
> -       mov     x29, x1
>
>         /* Check that the core was booted in EL2. */
>         mrs     x0, CurrentEL
> @@ -204,9 +203,7 @@ SYM_INNER_LABEL(__kvm_hyp_init_cpu, SYM_L_LOCAL)
>         bl      ___kvm_hyp_init                 // Clobbers x0..x2
>
>         /* Leave idmap -- using BLR is OK, LR is restored from host context */
> -       mov     x0, x29
> -       ldr     x1, =__kvm_host_psci_cpu_entry
> -       blr     x1
> +       blr     x29
>
>         // The core booted in EL1, or the C code unexpectedly returned.
>         // Either way, KVM cannot be initialized on it.
> diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
> index c3e196fb8b18f..cc698ceee9c8c 100644
> --- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
> +++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
> @@ -200,23 +200,12 @@ static int psci_system_suspend(u64 func_id, struct kvm_cpu_context *host_ctxt)
>                          __hyp_pa(init_params), 0);
>  }
>
> -asmlinkage void __noreturn __kvm_host_psci_cpu_entry(bool is_cpu_on)
> +static void __noreturn __kvm_host_psci_cpu_entry(unsigned long pc, unsigned long r0)
>  {
> -       struct psci_boot_args *boot_args;
> -       struct kvm_cpu_context *host_ctxt;
> -
> -       host_ctxt = host_data_ptr(host_ctxt);
> -
> -       if (is_cpu_on)
> -               boot_args = this_cpu_ptr(&cpu_on_args);
> -       else
> -               boot_args = this_cpu_ptr(&suspend_args);
> -
> -       cpu_reg(host_ctxt, 0) = boot_args->r0;
> -       write_sysreg_el2(boot_args->pc, SYS_ELR);
> +       struct kvm_cpu_context *host_ctxt = host_data_ptr(host_ctxt);
>
> -       if (is_cpu_on)
> -               release_boot_args(boot_args);
> +       cpu_reg(host_ctxt, 0) = r0;
> +       write_sysreg_el2(pc, SYS_ELR);
>
>         write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
>         write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);
> @@ -224,6 +213,26 @@ asmlinkage void __noreturn __kvm_host_psci_cpu_entry(bool is_cpu_on)
>         __host_enter(host_ctxt);
>  }
>
> +asmlinkage void __noreturn __kvm_host_psci_cpu_on_entry(void)
> +{
> +       struct psci_boot_args *boot_args = this_cpu_ptr(&cpu_on_args);
> +       unsigned long pc, r0;
> +
> +       pc = READ_ONCE(boot_args->pc);
> +       r0 = READ_ONCE(boot_args->r0);
> +
> +       release_boot_args(boot_args);
> +
> +       __kvm_host_psci_cpu_entry(pc, r0);
> +}
> +
> +asmlinkage void __noreturn __kvm_host_psci_cpu_resume_entry(void)
> +{
> +       struct psci_boot_args *boot_args = this_cpu_ptr(&cpu_on_args);

This should be suspend_args:
+     struct psci_boot_args *boot_args = this_cpu_ptr(&suspend_args);

With this fixed:

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad




> +
> +       __kvm_host_psci_cpu_entry(boot_args->pc, boot_args->r0);
> +}
> +
>  static unsigned long psci_0_1_handler(u64 func_id, struct kvm_cpu_context *host_ctxt)
>  {
>         if (is_psci_0_1(cpu_off, func_id) || is_psci_0_1(migrate, func_id))
> --
> 2.47.3
>

