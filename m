Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE22104BEC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfLV59o4o1tglwLSOeFGWvFMCd8yTLZw+74FUNPihEs=; b=k91jslRzuVBEOhZPrt3T6oeyX7
	5txQAp7vQ+nC8dBVyAyELvrbeGXB/ASoinOqrBGFt6yS7SgU14Wkxi5GXg+Oajbz0h4gk2gC56za8
	M59pt1LQuKibYhmXUM58o11Gq6SLRPdRyKfV0bL55KyZ4YY35XZXp2fn4UbXXMsM8zCORSfY0Rj4L
	mE+ioVR5c03SZCAkNlCo2/hUbd2zHtOfbf2J/0cde9A29GeWiZRpxel2boSarwk/mKt/9PwoF2cCa
	lVqwFCQXh1CXmjrOOvgVKq+nwtyC+EfKld9qvQKHvCdLCaw7GvOLUMH5Oof2oXdWC9Ne5yZ5rqewu
	hP+TUfqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GaC-0000000BNic-34by;
	Wed, 11 Mar 2026 10:14:28 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ga9-0000000BNhx-2ReI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:14:26 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-509069a7a7fso506711cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773224064; cv=none;
        d=google.com; s=arc-20240605;
        b=YBG242YMozqt0FnJDa6vV3LVwNVjckBc93rIHmMezl/2BO1gHfGEvp/hBllsE+HxA4
         vWnXvZnrocjpnb8jdgVaW1rQkRZWQbskM4IyJvHXIGHCY4GarQgTqIiW0jaklTiKmtT2
         t1/B64saGamol+7EjYY/6GYVyHdj3cvausGElfBU78ziTPiqbra1tE33tRAWqKr1bImR
         K0j0LyKdy8kC89vDVgCPcwfoC9RwBKHaf8F88sMeaIAoSYlqo5iAT69HjpB5qB0UJJlH
         TnYQXt1VaGADqtQG4dmHKpJxUkjElAqL2ppHQcvYJ7iavznvjOSI2izX28EG3lTedqIs
         1BaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lfLV59o4o1tglwLSOeFGWvFMCd8yTLZw+74FUNPihEs=;
        fh=HTMzdMU5dygH7tBQqa17DLIuTaoUNXm0ZVeqdrkK8vE=;
        b=GUOlw8WiQVxev/iy1sJ353jqK/GWYyOet47dMp9GGfc/XfAH3kZKsP+oEd0pYWNuQE
         jBS0LwmUYcQ43pNMgzPWZqvVzwb/qc+FT1gE2hYxjE1T1Zd6V7LFDKkqJJ+bcLOBrMDK
         Si4hd/bJdW7ObquFHDeNFKLAWDXw0dxkve30MYJd27QlWSneBlwiQjyQiJ2sHRUbV2sv
         +IJFMhQRjoVXgV7FjTbthg2Manbbbi8/rCu5gLO5FiQjzLmbK+92c76Mbk2b6yKhtQta
         M0nsYO7RkZZe6InL1XJOZHjBN5SN6tgLocAk4p1mfwIebSSCHmkNSd1kKgdCFlDhfzBd
         ZUEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773224064; x=1773828864; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lfLV59o4o1tglwLSOeFGWvFMCd8yTLZw+74FUNPihEs=;
        b=MqhUOuDUnEBmoPlzV6SeqgIwTyyhN3bzBrFdG5CrPLQaSTT07BuGceLfObozh0kAJE
         vxEks0WfQEU00gZKKBZT1UsN1O+eq/B6PNqHBi1RE/T5hpVWbqlUlxz7cgiYm8gFq76c
         7AuTJmIZE6RGtWvAjvRGe+tofg8RVF/rU3F9saJAdaMVslxJSTN0e9JdWfDbvoXZ8Dqf
         o7ANVN79Mn60hNyiyflIOW74PmU1Jq+qelxw4Z9S6uRtHtj5/qmvGWkTFOw4Ao4JCdz2
         fpWp2d8M2QMP1fDUBZtDqHLkMIMOPTtZ7+XonSytaiMmijf7DHkDV8qDvVaDRl0Xt1jZ
         sgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224064; x=1773828864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfLV59o4o1tglwLSOeFGWvFMCd8yTLZw+74FUNPihEs=;
        b=sRE4XUNT+1bjfFmnGM4RxjLQFutiMCQRjtkhPLxAQVaVw367forvHkN1gq0u75827G
         e8YATvKzxXcJuA1sqHj64qI/yluZKQm/O0q8PynMRjw/6iB2fU0m7UnzpOlm+CxmCqDw
         9NejPgHLJYE9gq7sG0ug8qWs7EArdah0gFbMswJOh5aeXUyGb6juB9iVuAXSaqijo6+k
         BdO32FV5QrtcDxYU3/Ofp4EokzgCT6CzM2vNfeipy4rUkEmtwTyCUkLl/S0TZTvoZL2J
         k62j7+vz651TqxaCRYQOeotBWIpjRvyvK0U51U/OxDNZsEapQbBiLwD2PpNW07qHt8Q0
         qJ8w==
X-Forwarded-Encrypted: i=1; AJvYcCV23V0+bwEQAWgrXRNqEIf7RWCKtUWPMNKhohHVi2U+8vJjIYAtBgrk/qySyzJaxxj/mc5yFtVKnIYfid6sd5DH@lists.infradead.org
X-Gm-Message-State: AOJu0YxYhcCjZMYs5kixOHu90qK2QDdHYPFNz/N9gpjcmaJEd+sB2fKy
	jEQRfy4C2jtkgpXqDukpWZ9Md+X61taiScVE7NooTbhaQVQpto6qy8uQ10RAnA3GkLlX/tFEW29
	2PJva2LhokKDXnxBiPV6N4BNAIhpS79LEO0ngE4jP
X-Gm-Gg: ATEYQzxgFc4pQt4ueEz2IyeSpLVbXl7kjxcULS4jrjIk+1PRpTJ0iHDEI9oYiVfUXXg
	i4keNUsAfvUUOtzPW6Eqc+jM8MWil0R2AEVbijXwp1viAu7n99/qKzoZXEH92M0dQVF/F0rBEbu
	Ndmm/MRJSNSPoKyqssaHbVcIuz15h5fIgymoqhsn4doabWnsmsEiGl9lhH8QBNLRKNWAto01QAn
	bPCHXMMg+LwWi2zVUJoRPbNPLFNrMeVlLEuP3sHaiNN9jIy0mG/OM1yDB89hDcivwA0sKYUrciK
	zhVvP/YZHdeKg24daEwedFjoQz9jpze/1pPi47XmkIOKmne1
X-Received: by 2002:ac8:7c53:0:b0:503:4bc:c925 with SMTP id
 d75a77b69052e-50939a5cc4bmr8975271cf.13.1773224063283; Wed, 11 Mar 2026
 03:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260305144351.17071-1-will@kernel.org> <20260305144351.17071-19-will@kernel.org>
In-Reply-To: <20260305144351.17071-19-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 10:13:46 +0000
X-Gm-Features: AaiRm52JOrlHxk-wEWSReaveEiUCp-2PTv-VngEIYEq9CUZ8OT8VXU4ZwIjWCks
Message-ID: <CA+EHjTwORdwR2QRQ16CmJGuGSOdjnRXoP53C5mBt_Rn0R6aH_A@mail.gmail.com>
Subject: Re: [PATCH v3 18/36] KVM: arm64: Inject SIGSEGV on illegal accesses
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_031425_637447_3B00DB36 
X-CRM114-Status: GOOD (  31.02  )
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
> From: Quentin Perret <qperret@google.com>
>
> The pKVM hypervisor will currently panic if the host tries to access
> memory that it doesn't own (e.g. protected guest memory). Sadly, as
> guest memory can still be mapped into the VMM's address space, userspace
> can trivially crash the kernel/hypervisor by poking into guest memory.
>
> To prevent this, inject the abort back in the host with S1PTW set in the
> ESR, hence allowing the host to differentiate this abort from normal
> userspace faults and inject a SIGSEGV cleanly.
>
> Signed-off-by: Quentin Perret <qperret@google.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 37 +++++++++++++++++++++++++++
>  arch/arm64/mm/fault.c                 | 22 ++++++++++++++++
>  2 files changed, 59 insertions(+)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 31b6a52e5e4c..0dc1d6fc546c 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -18,6 +18,7 @@
>  #include <nvhe/memory.h>
>  #include <nvhe/mem_protect.h>
>  #include <nvhe/mm.h>
> +#include <nvhe/trap_handler.h>
>
>  #define KVM_HOST_S2_FLAGS (KVM_PGTABLE_S2_AS_S1 | KVM_PGTABLE_S2_IDMAP)
>
> @@ -612,6 +613,39 @@ static int host_stage2_idmap(u64 addr)
>         return ret;
>  }
>
> +static void host_inject_mem_abort(struct kvm_cpu_context *host_ctxt)
> +{
> +       u64 ec, esr, spsr;
> +
> +       esr = read_sysreg_el2(SYS_ESR);
> +       spsr = read_sysreg_el2(SYS_SPSR);
> +
> +       /* Repaint the ESR to report a same-level fault if taken from EL1 */
> +       if ((spsr & PSR_MODE_MASK) != PSR_MODE_EL0t) {
> +               ec = ESR_ELx_EC(esr);
> +               if (ec == ESR_ELx_EC_DABT_LOW)
> +                       ec = ESR_ELx_EC_DABT_CUR;
> +               else if (ec == ESR_ELx_EC_IABT_LOW)
> +                       ec = ESR_ELx_EC_IABT_CUR;
> +               else
> +                       WARN_ON(1);
> +               esr &= ~ESR_ELx_EC_MASK;
> +               esr |= ec << ESR_ELx_EC_SHIFT;
> +       }
> +
> +       /*
> +        * Since S1PTW should only ever be set for stage-2 faults, we're pretty
> +        * much guaranteed that it won't be set in ESR_EL1 by the hardware. So,
> +        * let's use that bit to allow the host abort handler to differentiate
> +        * this abort from normal userspace faults.
> +        *
> +        * Note: although S1PTW is RES0 at EL1, it is guaranteed by the
> +        * architecture to be backed by flops, so it should be safe to use.
> +        */
> +       esr |= ESR_ELx_S1PTW;
> +       inject_host_exception(esr);
> +}
> +
>  void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
>  {
>         struct kvm_vcpu_fault_info fault;
> @@ -635,6 +669,9 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
>         addr = FIELD_GET(HPFAR_EL2_FIPA, fault.hpfar_el2) << 12;
>
>         switch (host_stage2_idmap(addr)) {
> +       case -EPERM:
> +               host_inject_mem_abort(host_ctxt);
> +               fallthrough;
>         case -EEXIST:
>         case 0:
>                 break;
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index be9dab2c7d6a..3abfc7272d63 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -43,6 +43,7 @@
>  #include <asm/system_misc.h>
>  #include <asm/tlbflush.h>
>  #include <asm/traps.h>
> +#include <asm/virt.h>
>
>  struct fault_info {
>         int     (*fn)(unsigned long far, unsigned long esr,
> @@ -269,6 +270,15 @@ static inline bool is_el1_permission_fault(unsigned long addr, unsigned long esr
>         return false;
>  }
>
> +static bool is_pkvm_stage2_abort(unsigned int esr)
> +{
> +       /*
> +        * S1PTW should only ever be set in ESR_EL1 if the pkvm hypervisor
> +        * injected a stage-2 abort -- see host_inject_mem_abort().
> +        */
> +       return is_pkvm_initialized() && (esr & ESR_ELx_S1PTW);
> +}
> +
>  static bool __kprobes is_spurious_el1_translation_fault(unsigned long addr,
>                                                         unsigned long esr,
>                                                         struct pt_regs *regs)
> @@ -279,6 +289,9 @@ static bool __kprobes is_spurious_el1_translation_fault(unsigned long addr,
>         if (!is_el1_data_abort(esr) || !esr_fsc_is_translation_fault(esr))
>                 return false;
>
> +       if (is_pkvm_stage2_abort(esr))
> +               return false;
> +
>         local_irq_save(flags);
>         asm volatile("at s1e1r, %0" :: "r" (addr));
>         isb();
> @@ -395,6 +408,8 @@ static void __do_kernel_fault(unsigned long addr, unsigned long esr,
>                         msg = "read from unreadable memory";
>         } else if (addr < PAGE_SIZE) {
>                 msg = "NULL pointer dereference";
> +       } else if (is_pkvm_stage2_abort(esr)) {
> +               msg = "access to hypervisor-protected memory";
>         } else {
>                 if (esr_fsc_is_translation_fault(esr) &&
>                     kfence_handle_page_fault(addr, esr & ESR_ELx_WNR, regs))
> @@ -621,6 +636,13 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>                                          addr, esr, regs);
>         }
>
> +       if (is_pkvm_stage2_abort(esr)) {
> +               if (!user_mode(regs))
> +                       goto no_context;
> +               arm64_force_sig_fault(SIGSEGV, SEGV_ACCERR, far, "stage-2 fault");
> +               return 0;
> +       }
> +
>         perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
>
>         if (!(mm_flags & FAULT_FLAG_USER))
> --
> 2.53.0.473.g4a7958ca14-goog
>

