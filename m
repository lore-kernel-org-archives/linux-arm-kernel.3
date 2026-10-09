Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDC8CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 13:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19+fSLDw62bv9wKAJomFIb9fA14T6XtF00e9ZBRQsYg=; b=XPtIcJFxfeNAl4BzES7/5ZGGbn
	Z0Om95pZo2hfr2E2QpuYYFdT37HPnnJunZDUN91UQPLU5hw40HWnzSEg/1LlH0F1yWYEvHvURGSd2
	Yy16W7OwJidqgHmMRNY1djXwbtGHQ6NL7EOPgebwGrOTpi8UOun3o5/ZKtHrGSpZeYq4V88EoqDgL
	RpE8HGT4VgQe+yJvj5k72kgh6UmDDfxj243JdHg3SltrRg3zX5oRoamjwfL9rQEjkG/OoH5B3q92Q
	DzYFePg0XV7E+r/9uGy7FIoawBEszcK1uJNA97BJTZmZeNVFyJ/G6p+318ZuEXP5G1ML47RXe3VlI
	+brlEvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAFP-00000006Lxj-3emB;
	Fri, 09 Oct 2026 13:02:51 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAFN-00000006LxM-1Ur3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 13:02:50 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so877507366b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 06:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791550967; x=1792155767; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=19+fSLDw62bv9wKAJomFIb9fA14T6XtF00e9ZBRQsYg=;
        b=kxdaMqgMtA71l4yKlxC7vldEEbSRr9vnWnKEUCJ1hcPYXfi76n1/2MxWqKvSOMzzL/
         fbVOXlUjam3A7YNMmvTprU500gmZPETt508eIcT+0IB3NpEP493UBqc2Bi0WUsJGLCWb
         MY7vgPHv1GztsHKRNv8z+lacvEtQtz4Qjb6Wq29ABARmQGf/yWAHiWHy/otzQNFLlmsK
         xvb8S2A9XY9xXSPfD2lCQnZqUMK7yVxji+CnFRGHUCd+xG7DASdqoA0I0TByKkfaUxDd
         Xgkh2tqyqVpMVWfET31hwI/sFY3UL0ju0X4oncSl+56rGMT4v2xCiX9PoUs1RrOa7Ok5
         tRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791550967; x=1792155767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=19+fSLDw62bv9wKAJomFIb9fA14T6XtF00e9ZBRQsYg=;
        b=oEjDZ+cHYuvQ8tc4VQUOzdrlsoDgkI0+1ErmCjB9ccjdoxXYfdEYVoxGGbM64Ck76f
         13co6BAX1dC+Danp7Ci3aDHyn7kGI1uj3TdKmL0KoPHSdN9mknqM4ODlTyOnbbh2eV0o
         Yuq13GHaHYYZDoyUy/Z2gg4Antzz+jbRjfWhj6r2VgjINMrR6YJwNFXNlyv7/bb0xyht
         8VIikf1CIZkKuEB5VLdmehhMwe5PwH+WZtnYNnnX7hHgYcKjP/YOhQueFj0NTw4o1XAD
         3qv+xGYiUpgR6V75yc/+nRVS/xkYLwkwnMKzXgLOrQP7g7iA+Y/bv5/O2yyv6UHWcnMC
         Sugw==
X-Forwarded-Encrypted: i=1; AKwUvBy2ow4NRwFmpzPb3spEYQOpttqbhv6BB3GWHjtpRSCh95fO1T4Jj1x9WTc1TaqrQazgxgkhnaZ9CI5uTeL/m4u6@lists.infradead.org
X-Gm-Message-State: AFq9FYJMrteU2C7CW25g1YRMNk85Uepf+OFIFo4AFXLhuUvfp3rQ+NKD
	ZNDmV1FzPafh0GM3tZuRW8mqQFgz3jnEfmC7coyf2x9uHmDD6ES1VD3KLY+3AfHivw==
X-Gm-Gg: AYBFou3qyyeb/kPuquOiAa1tlh3UNwqo9+onWVRdmnFnqps1e96lbxzMIR9Sm2txLPd
	dtyC+XKBnKLBb5J/mDnkHUhpURvNRMfuUlgJpAPWzAUq86Onf2hq2bJsphVYO342Bxd+hnwoyxc
	FtgfhvJf1z70Fv8qjd5KD8ucX1UcmokbQSjEoAplxey+KIgLZhMHiheBJeLd8SSXBI8a0iBL4Im
	xa2kpiib+0+dFSm3SbxOcZLpKqDRvHCrlUVTtSFIfh/Pv6POVSEjA+y19qgpL7vv1RC3/o6qu9Z
	XMxw0aoZgrZWIWqy+suGkJ0PoVX1z7fZKbPJPwc9r4zH7PrYOK/nObfxAJ06vAzq3ZGHw8+KBpM
	VxAQKE4tet8JRnOyZyOCRismypYZBK2fC2ba/QFMj2TZxRsg+QvR8lvldU+7lerURUVj9NesNEX
	P2h20Qg7TyUS09PrSxMawtwMJKDc68J4k6PT4kyOMCoRemIRLDWnvc2cooWqka7QNtuBb51Ufx7
	OGLHN0i8zKHnJBHxhZpETDYJQGeO6MriAdgeO3W4xgwliQp8rFa5w==
X-Received: by 2002:a17:907:8687:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c31aa02a1ebmr190818466b.21.1791550966562;
        Fri, 09 Oct 2026 06:02:46 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acdb6dsm3670054f8f.48.2026.10.09.06.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:02:45 -0700 (PDT)
Date: Fri, 9 Oct 2026 14:02:41 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com
Subject: Re: [PATCH v1 1/3] KVM: arm64: Add ESR class to the hyp_enter hyp
 event
Message-ID: <asjl8czHAD017Bha@google.com>
References: <20261009084529.462577-1-vdonnefort@google.com>
 <20261009084529.462577-2-vdonnefort@google.com>
 <CA+EHjTwNTarWqSc_XVXGFT6mHUZD=QuTeVWrd087jUtexxCScg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwNTarWqSc_XVXGFT6mHUZD=QuTeVWrd087jUtexxCScg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_060249_737638_7785D3E0 
X-CRM114-Status: GOOD (  37.15  )
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

On Fri, Oct 09, 2026 at 12:30:56PM +0100, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Fri, 09 Oct 2026 09:45:27 +0100, Vincent Donnefort
> <vdonnefort@google.com> wrote:
> 
> [...]
> > To distinguish between a trap from host and from guest, add a "from="
> > field, which has 3 possibilities: "host", "vcpu" or "firmware". This
> > value can be deducted based on the existing vcpu field.
> 
> nit: "deduced". Also, "firmware" comes from the reason rather than
> from the vcpu field.
> 
> [...]
> > diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
> 
> [...]
> > @@ -10,15 +10,10 @@
> >  #ifndef __HYP_ENTER_EXIT_REASON
> >  #define __HYP_ENTER_EXIT_REASON
> >  enum hyp_enter_exit_reason {
> > -        HYP_REASON_SMC,
> > -        HYP_REASON_HVC,
> > -        HYP_REASON_SYS,
> > +        HYP_REASON_SMC = ESR_ELx_EC_MAX + 1,
> 
> This header now uses ESR_ELx_EC_MAX, so it should include <asm/esr.h>
> rather than rely on its includers.
> 
> >          HYP_REASON_PSCI,
> > -        HYP_REASON_HOST_ABORT,
> > -        HYP_REASON_GUEST_EXIT,
> > -        HYP_REASON_ERET_HOST,
> > -        HYP_REASON_ERET_GUEST,
> > -        HYP_REASON_UNKNOWN        /* Must be last */
> > +        HYP_REASON_IRQ,
> > +        HYP_REASON_ERET,
> >  };
> 
> Aren't fixed trace points ABI? This changes the raw values of the
> reason field (1 was hvc and is now WFx) and the strings it prints.
> Keeping the old values and recording the EC in a new field would avoid
> that.

The event format is described precisely in events/hypervisor/hyp_enter/format.
Any tooling should use that, so it doesn't seem like ABI to me. Also, this is
behind NVHE_EL2_DEBUG. The only precedent I know is in kernel/sched/ where there
are only tracepoints to avoid having trace events. 

Finally, we do not expose (yet :)) the raw interface. So this part is definitely
not ABI.

I tried to avoid having the EC separately to keep the event as small as
possible.

> 
> [...]
> > diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
> [...]
> > @@ -213,7 +213,7 @@ static void __noreturn __kvm_host_psci_cpu_entry(unsigned long pc, unsigned long
> >          write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
> >          write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);
> >
> > -        trace_hyp_exit(host_ctxt, HYP_REASON_PSCI);
> > +        trace_hyp_exit(host_ctxt, HYP_REASON_ERET);
> >          __host_enter(host_ctxt);
> 
> This also replaces the PSCI, ERET_HOST and ERET_GUEST exit reasons
> with a single ERET, which the commit message doesn't mention.

ERET_HOST is now "to=host reason=eret" and ERET_GUEST "to=guest reason=ERET".

This one here could be considered a bug fix and I could make it a separate
patch?

> 
> [...]
> > diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
> 
> [...]
> > @@ -324,13 +324,15 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
> >          __debug_switch_to_guest(vcpu);
> >
> >          do {
> > -                trace_hyp_exit(host_ctxt, HYP_REASON_ERET_GUEST);
> > +                trace_hyp_exit(host_ctxt, HYP_REASON_ERET);
> >
> >                  /* Jump in the fire! */
> >                  exit_code = __guest_enter(vcpu);
> >
> >                  /* And we're baaack! */
> > -                trace_hyp_enter(host_ctxt, HYP_REASON_GUEST_EXIT);
> > +                trace_hyp_enter(host_ctxt,
> > +                                ARM_EXCEPTION_CODE(exit_code) == ARM_EXCEPTION_IRQ ?
> > +                                HYP_REASON_IRQ : ESR_ELx_EC(read_sysreg_el2(SYS_ESR)));
> >          } while (fixup_guest_exit(vcpu, &exit_code));
> 
> Could ESR_EL2 be read only when the event is enabled? The read happens
> even when tracing is disabled or compiled out, so every non-IRQ guest
> exit now does an extra one: with NVHE_EL2_DEBUG=n, __kvm_vcpu_run()
> goes from two reads of ESR_EL2 to three.

Hum, that's a good point. I was thinking about having a HYP_REASON_ESR that when
sent actually read the ESR. But then handle_trap() would read it twice, unless
this one still gives the esr directly.

Alternatively, I thought of moving the esr_el2 = read_sysreg_el2(SYS_ESR) out of
__fixup_guest_exit(). But it didn't look nice.

WDYS?

> 
> [...]
> > diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> [...]
> >  static const char *__hyp_enter_exit_reason_str(u8 reason)
> >  {
> [...]
> > +        if (reason <= ESR_ELx_EC_MAX) {
> > +                int i;
> > +
> > +                for (i = 0; i < ARRAY_SIZE(class); i++) {
> > +                        if (class[i].mask == reason)
> > +                                return class[i].name;
> > +                }
> > +
> > +                return "UNKNOWN_ESR";
> > +        }
> 
> Could this print the EC value when it isn't in the table?
> kvm_arm_exception_class has no entry for ILL, BTI, SME or GCS among
> others, so an ARM_EXCEPTION_IL exit (EC 0x0E) shows up as UNKNOWN_ESR.

I can extend kvm_arm_exception_class. Having a dynamic format string is not
possible here.

> 
> Cheers,
> /fuad

-- 
Vincent

