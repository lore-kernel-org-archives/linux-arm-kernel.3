Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F19CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9e2398wrimmMofFcSgp0UNjMbOsIQgVTCRnmgCn7R5w=; b=CeghzuWLiXcobg33FdGPIl8zAZ
	kiHZYfLqUr7BwCvOaK2rvg9iQgJvW3hLXah4Iw0jC54/5h0ZyFZDEFoqi33P381F/ONwAt3KypBYb
	9F8IzEsg3sERs3dceJQGaUT8EVKvsqpbOe63DwnXM5nsAQBAveo+tQSoPVHZPhOMrYnLgAiLU96+c
	Xa8IhEyjyOgh5AmKhiIgWl7rrf6XyCnUGgAAX0dSKm9+JTD+qtGSZ8Ac/0VisRisIQqHPID5auDp7
	F6faJHZR8Cc7hIaldM7xl3gVehYR+dnCvjQv7UldqKzK+6oTodxPkAXMMrTO9bw8kihioNjg9CBBE
	F9UAAPqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8pA-00000006BJP-1JLo;
	Fri, 09 Oct 2026 11:31:40 +0000
Received: from out-207.mta0.migadu.com ([2001:41d0:1004:224b::cf] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8p7-00000006BHx-3N83
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:31:39 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=uCtXgM21jDXIOWhSaCZvIRnqzIfzMQzSFLIzCqskVow=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791545494; v=1; x=1792150294;
 b=D0Ig9KsN05+ALgXJVdElNV2F3Z2m35gEnJc8CJlxVRIo6qqiHgHGq06LJT+e6MIvY0qUtHEH
 tg/cr3G02PVfGY8ehW6kRMObrdRrXVyfbJKDC3e1IUWs6u4oOnWe/A10OPn73chhqDkrrLlL9b9
 Y4C8l+nf/JZkuGZypyZBGJjM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c4ac0db5f86e0d68;
	Fri, 09 Oct 2026 11:31:33 +0000
X-Mizu-Trace-ID: c4ac0db5f86e0d68
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so6625e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 04:31:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByQlkpcH4RyxmDMJxjFVd82MZzGTNwlQ43edBLZoL14Sf4c919xIxPaHHz38GHQoSxYkNH+Oou4abIM02u8TT9x@lists.infradead.org
X-Gm-Message-State: AFq9FYKUE2hIQKljVY6OtZcDW3YEoPjVge+hh3Ycj+K46RP/znnThr/c
	xIPFgyEQ7ZS1EWSJgyIftIMj4YrXAGOlunb2FGMReYTM7lO+CTUGGZ+nkoWzuu8e3CYxdC0yrEb
	LcwNMvMUxmhOUKfo6iLfBv02zmQorliG2/In5HnWD
X-Received: by 2002:a05:6512:15a5:b0:5ae:b1b3:145a with SMTP id
 2adb3069b0e04-5bcdd52a6acmr112519e87.6.1791545492765; Fri, 09 Oct 2026
 04:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20261009084529.462577-1-vdonnefort@google.com> <20261009084529.462577-2-vdonnefort@google.com>
In-Reply-To: <20261009084529.462577-2-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 9 Oct 2026 12:30:56 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwNTarWqSc_XVXGFT6mHUZD=QuTeVWrd087jUtexxCScg@mail.gmail.com>
X-Gm-Features: AclHuK_cF5JT5S12VCtvnCgSU9UqoMj-R1sTP2STp90bITgupW6QRjwU-nRbT90
Message-ID: <CA+EHjTwNTarWqSc_XVXGFT6mHUZD=QuTeVWrd087jUtexxCScg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] KVM: arm64: Add ESR class to the hyp_enter hyp event
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_043137_987605_92370613 
X-CRM114-Status: GOOD (  21.56  )
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

Hi Vincent,

On Fri, 09 Oct 2026 09:45:27 +0100, Vincent Donnefort
<vdonnefort@google.com> wrote:

[...]
> To distinguish between a trap from host and from guest, add a "from="
> field, which has 3 possibilities: "host", "vcpu" or "firmware". This
> value can be deducted based on the existing vcpu field.

nit: "deduced". Also, "firmware" comes from the reason rather than
from the vcpu field.

[...]
> diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h

[...]
> @@ -10,15 +10,10 @@
>  #ifndef __HYP_ENTER_EXIT_REASON
>  #define __HYP_ENTER_EXIT_REASON
>  enum hyp_enter_exit_reason {
> -        HYP_REASON_SMC,
> -        HYP_REASON_HVC,
> -        HYP_REASON_SYS,
> +        HYP_REASON_SMC = ESR_ELx_EC_MAX + 1,

This header now uses ESR_ELx_EC_MAX, so it should include <asm/esr.h>
rather than rely on its includers.

>          HYP_REASON_PSCI,
> -        HYP_REASON_HOST_ABORT,
> -        HYP_REASON_GUEST_EXIT,
> -        HYP_REASON_ERET_HOST,
> -        HYP_REASON_ERET_GUEST,
> -        HYP_REASON_UNKNOWN        /* Must be last */
> +        HYP_REASON_IRQ,
> +        HYP_REASON_ERET,
>  };

Aren't fixed trace points ABI? This changes the raw values of the
reason field (1 was hvc and is now WFx) and the strings it prints.
Keeping the old values and recording the EC in a new field would avoid
that.

[...]
> diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
[...]
> @@ -213,7 +213,7 @@ static void __noreturn __kvm_host_psci_cpu_entry(unsigned long pc, unsigned long
>          write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
>          write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);
>
> -        trace_hyp_exit(host_ctxt, HYP_REASON_PSCI);
> +        trace_hyp_exit(host_ctxt, HYP_REASON_ERET);
>          __host_enter(host_ctxt);

This also replaces the PSCI, ERET_HOST and ERET_GUEST exit reasons
with a single ERET, which the commit message doesn't mention.

[...]
> diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c

[...]
> @@ -324,13 +324,15 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
>          __debug_switch_to_guest(vcpu);
>
>          do {
> -                trace_hyp_exit(host_ctxt, HYP_REASON_ERET_GUEST);
> +                trace_hyp_exit(host_ctxt, HYP_REASON_ERET);
>
>                  /* Jump in the fire! */
>                  exit_code = __guest_enter(vcpu);
>
>                  /* And we're baaack! */
> -                trace_hyp_enter(host_ctxt, HYP_REASON_GUEST_EXIT);
> +                trace_hyp_enter(host_ctxt,
> +                                ARM_EXCEPTION_CODE(exit_code) == ARM_EXCEPTION_IRQ ?
> +                                HYP_REASON_IRQ : ESR_ELx_EC(read_sysreg_el2(SYS_ESR)));
>          } while (fixup_guest_exit(vcpu, &exit_code));

Could ESR_EL2 be read only when the event is enabled? The read happens
even when tracing is disabled or compiled out, so every non-IRQ guest
exit now does an extra one: with NVHE_EL2_DEBUG=n, __kvm_vcpu_run()
goes from two reads of ESR_EL2 to three.

[...]
> diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
[...]
>  static const char *__hyp_enter_exit_reason_str(u8 reason)
>  {
[...]
> +        if (reason <= ESR_ELx_EC_MAX) {
> +                int i;
> +
> +                for (i = 0; i < ARRAY_SIZE(class); i++) {
> +                        if (class[i].mask == reason)
> +                                return class[i].name;
> +                }
> +
> +                return "UNKNOWN_ESR";
> +        }

Could this print the EC value when it isn't in the table?
kvm_arm_exception_class has no entry for ILL, BTI, SME or GCS among
others, so an ARM_EXCEPTION_IL exit (EC 0x0E) shows up as UNKNOWN_ESR.

Cheers,
/fuad

