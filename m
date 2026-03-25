Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D66109C057
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 19:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3jXRKuQ+zscB32uOukv3fqFuaunkYR2fmb+32Ylt9Zk=; b=YUo+uJT7I4Jt3r782dIhSCHtys
	HyXPNnMXvqF0Wka57WMm5zp/rSnyg90bSfjJXgDwCahemPFX7wDpjnotb2df6gugWjuxQ4+BkUUra
	Nhr1NegCaXjOtusyjGI56TIjKjjIZhGFokefJfnI9LCku6g7K8cCcxGTFHVOpeGUOVrkAhx9nm8El
	lrqkxCRG39bVnCoBPdGSlk7abwHoAMzgrEiXMhbhq4AL3kHV/tNyAMMEQ01EBm1YQos6nxAstQxJf
	XHQRZMZCSpwBMoqsvYM8Rk4XCYmQHgOcJeU+q26llPU36NXkuzof/udkhrbBnAM3PZNSC6sggRGTf
	AoLbrTHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ttn-000000049Y3-0LdA;
	Wed, 25 Mar 2026 19:28:15 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ttk-000000049Xd-3RpO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 19:28:14 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-5091ed02c54so11521cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 12:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774466891; cv=none;
        d=google.com; s=arc-20240605;
        b=YiyxbGgj0mu3cFhVlrFWK//NV7kdiiESZrLSXsfrnoOiu5QrsiNnTZRZAi/AeGDSWS
         KTPg+7PPR+xpQUx4DzTtfqqdpN+4hiD7MWXY1/1oYRIvc59mm5jO68yf5tvKH8t2nQvx
         YPKO62+GISVKq/fkvWgOfTEWi4Fm6uZjy0FPa25s2Al34wgFcreiDo4js9z8j6FDqCiZ
         mnt2cmmdFerKA76XwAf+tkA1EEknKNnnO+sOy5NfykQGFWq10eI6fakUSYGRIXyRYxEQ
         02P0R4vAPdQ9tfZZVW9HLU3xu4LwIGNccIgfWLZpCOkE8CtuuPYUS3HkdnGObYAX9qXz
         xAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3jXRKuQ+zscB32uOukv3fqFuaunkYR2fmb+32Ylt9Zk=;
        fh=+c0Eip69H4/S9Uin7WOJtkDWr9CmhYiCCYdUJukyPN8=;
        b=RqH8fPycRlSYFOO1sZGAYzgcNINFUh4hkOowAK+hH+Nc3d4VlX04rVOLebakk8+Mzz
         4q08EvKUBKHls3yWYj8YiTTVR5tfMMdz+M5rsNeFYWmUu3cqohqObUQoFMKmTt4Xk6P/
         BohMUOKX1/zKR2o3mXWOcgEctTGC2uhwUNxu9bLTIshaVoecAsaUWqtUkAGS2EeXE30W
         zfZUR8FQMFj9bxdl8MJElf6iRg+wv2roX4dhz2jrCm+zmm2/XhC6LI88kKD45D7hF+rN
         oUf+OpSLfhbnEwnvfa5grvM/GLAgUTXG6QwZQ77onb/sngYXq8jJk+GyPNWk5XRaXMfs
         Zi1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774466891; x=1775071691; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3jXRKuQ+zscB32uOukv3fqFuaunkYR2fmb+32Ylt9Zk=;
        b=sAmCxj5xEhoHHXYTWzwjr5Merlfd5Zjqwg4CnbvxA0eOcD9+gqKVwLxzELeKVNZaGv
         8adXw1NTylFA5dMWrovw3z7NLWTBP7FTyuObuwnYNV2Qv8b5h+bUlm+79JAIRjTE9Cp3
         8pyLvV7JTQDh72LvWYq1dBcGan8qQKhmGdKYNbsufaE1UOXTUR0/t85LGZ2lmyeMSNcV
         DghZkYMwKp6n4gq5nWNIZInFrVcqHX6PkZkBIcf0qaaWnIBvukZXlK7qKJnTk/r9XwA/
         isusAImaGiL4jEWbGmTc4CZcfgE94LR0cIzOonuT4ofmcD9rTod7c1vrH9Oo4xE31SJi
         yUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466891; x=1775071691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jXRKuQ+zscB32uOukv3fqFuaunkYR2fmb+32Ylt9Zk=;
        b=pz9Kj113fvo4pxWIA8qD5/JREt+qz9hugkv4MoGyPfa/sA+pMB3aetCBwsJNc2Mvxv
         aOfKZtw8ouvgJIE/5YdUwbUQXy94dPDjdVgi83xYXBDkMvIjQJkYp5Y4Cv3Cwf6Gzq4t
         4i95lqJuIIjI8DK4R/DkFewRFHFqcpaNafY4XbzLc88V3NWNyeiMiw3Ht9390n5lxiB5
         9cujEZGv58ByEGvA/1jJKLZsO0tywaFFquaTZx5a/FLljDM6WUyh1DiMPgnn0Bj43q0v
         LYGE60SyPd53ye7LCvD8QDPV0Tt7bpdJfOLW2ubh8sJzHzEdPZaL66+dCWBQv+eu69qC
         TRNA==
X-Forwarded-Encrypted: i=1; AJvYcCWWGZWI3MNHYLzZr04fX3EvRCYbH2qCp1HfdqbwrubCJCll5Ilw9p54PUJ1OyK4MwW6jMltQC7nf0c22Fm3ZBVb@lists.infradead.org
X-Gm-Message-State: AOJu0YyPQTFDj+Klt83Ai7V8YaCdBIZsOPQml9mUBJIyyK5tHm+k6n6o
	ajGlF+KSFHamKskEonaq8uvVb7sDt78g1eqf3Y2c7az8GWXaeC/9obQEbHoLbvffyvxpAQ22fQ0
	R9NQxuRvexqx0eS/QZTJ+lneEZYG/e0XXIgPUdFqsHWzVDgfL4HryIVQDK3Q=
X-Gm-Gg: ATEYQzzFLVkfVECe3fDkhuXlojAUgKwZZhwOfubmig0DaY0FlUXtnV8ezjhycc1MKAm
	sPZNbouG3RlyBX6fCS9pip45np8v+cWeJtZB4Q4JMEf308ZsakrHzhTem/uqqkscbEG97fW6jhN
	ePtLLwKvc99LjARcMGLCVnSWyf6Fj3bkn8wYhrOFyRZJ4kyC5jINH/uolKjlmhSY4UXDWy0N+fx
	kU9WovZ+Pv41teWzwftIJE9/o1TeN8wDk5KEhKoh7MW55alF1Ug2M7NvZpkIMaEuHfaAhNEbfWp
	Dogii10V
X-Received: by 2002:a05:622a:a950:b0:509:21ff:cd49 with SMTP id
 d75a77b69052e-50b93a03cafmr822391cf.4.1774466890075; Wed, 25 Mar 2026
 12:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260227212136.7660-1-will@kernel.org> <20260227212136.7660-2-will@kernel.org>
In-Reply-To: <20260227212136.7660-2-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 25 Mar 2026 19:27:32 +0000
X-Gm-Features: AQROBzBtSgn9cQ7N1iYo4S0niMNCLJ309hN3EBlrhv7VQmdymp5sBSZavqCW-tE
Message-ID: <CA+EHjTxcc2FArmi1hu17LW3BHUZ5zTnqbaQP0kbV39HXZfp9+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] KVM: arm64: Disable TRBE Trace Buffer Unit when
 running in guest context
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_122812_885764_87377B7B 
X-CRM114-Status: GOOD (  35.16  )
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

Hi Will,

Now that I have backported this to various Android versions....

On Fri, 27 Feb 2026 at 21:22, Will Deacon <will@kernel.org> wrote:
>
> The nVHE world-switch code relies on zeroing TRFCR_EL1 to disable trace
> generation in guest context when self-hosted TRBE is in use by the host.
>
> Per D3.2.1 ("Controls to prohibit trace at Exception levels"), clearing
> TRFCR_EL1 means that trace generation is prohibited at EL1 and EL0 but
> per R_YCHKJ the Trace Buffer Unit will still be enabled if
> TRBLIMITR_EL1.E is set. R_SJFRQ goes on to state that, when enabled, the
> Trace Buffer Unit can perform address translation for the "owning
> exception level" even when it is out of context.
>
> Consequently, we can end up in a state where TRBE performs speculative
> page-table walks for a host VA/IPA in guest/hypervisor context depending
> on the value of MDCR_EL2.E2TB, which changes over world-switch. The
> potential result appears to be a heady mixture of SErrors, data
> corruption and hardware lockups.
>
> Extend the TRBE world-switch code to clear TRBLIMITR_EL1.E after
> draining the buffer, restoring the register on return to the host. This
> unfortunately means we need to tackle CPU errata #2064142 and #2038923
> which add additional synchronisation requirements around manipulations
> of the limit register. Hopefully this doesn't need to be fast.
>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: James Clark <james.clark@linaro.org>
> Cc: Leo Yan <leo.yan@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Alexandru Elisei <alexandru.elisei@arm.com>
> Fixes: a1319260bf62 ("arm64: KVM: Enable access to TRBE support for host")
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h  |  1 +
>  arch/arm64/kvm/hyp/nvhe/debug-sr.c | 73 ++++++++++++++++++++++++++----
>  arch/arm64/kvm/hyp/nvhe/switch.c   |  2 +-
>  3 files changed, 66 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 5d5a3bbdb95e..1532ad2b2ec2 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -770,6 +770,7 @@ struct kvm_host_data {
>                 u64 pmscr_el1;
>                 /* Self-hosted trace */
>                 u64 trfcr_el1;
> +               u64 trblimitr_el1;
>                 /* Values of trap registers for the host before guest entry. */
>                 u64 mdcr_el2;
>                 u64 brbcr_el1;
> diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> index 2a1c0f49792b..3dbdee1148d3 100644
> --- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> +++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> @@ -57,12 +57,56 @@ static void __trace_do_switch(u64 *saved_trfcr, u64 new_trfcr)
>         write_sysreg_el1(new_trfcr, SYS_TRFCR);
>  }
>
> -static bool __trace_needs_drain(void)
> +static void __trace_drain_and_disable(void)
>  {
> -       if (is_protected_kvm_enabled() && host_data_test_flag(HAS_TRBE))
> -               return read_sysreg_s(SYS_TRBLIMITR_EL1) & TRBLIMITR_EL1_E;
> +       u64 *trblimitr_el1 = host_data_ptr(host_debug_state.trblimitr_el1);
>
> -       return host_data_test_flag(TRBE_ENABLED);
> +       *trblimitr_el1 = 0;
> +
> +       if (is_protected_kvm_enabled()) {
> +               if (!host_data_test_flag(HAS_TRBE))
> +                       return;
> +       } else {
> +               if (!host_data_test_flag(TRBE_ENABLED))
> +                       return;
> +       }

Can we simplify this? e.g.,

+      bool needs_drain = is_protected_kvm_enabled() ?
host_data_test_flag(HAS_TRBE) : host_data_test_flag(TRBE_ENABLED);
....

That said:

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> +
> +       *trblimitr_el1 = read_sysreg_s(SYS_TRBLIMITR_EL1);
> +       if (*trblimitr_el1 & TRBLIMITR_EL1_E) {
> +               /*
> +                * The host has enabled the Trace Buffer Unit so we have
> +                * to beat the CPU with a stick until it stops accessing
> +                * memory.
> +                */
> +
> +               /* First, ensure that our prior write to TRFCR has stuck. */
> +               isb();
> +
> +               /* Now synchronise with the trace and drain the buffer. */
> +               tsb_csync();
> +               dsb(nsh);
> +
> +               /*
> +                * With no more trace being generated, we can disable the
> +                * Trace Buffer Unit.
> +                */
> +               write_sysreg_s(0, SYS_TRBLIMITR_EL1);
> +               if (cpus_have_final_cap(ARM64_WORKAROUND_2064142)) {
> +                       /*
> +                        * Some CPUs are so good, we have to drain 'em
> +                        * twice.
> +                        */
> +                       tsb_csync();
> +                       dsb(nsh);
> +               }
> +
> +               /*
> +                * Ensure that the Trace Buffer Unit is disabled before
> +                * we start mucking with the stage-2 and trap
> +                * configuration.
> +                */
> +               isb();
> +       }
>  }
>
>  static bool __trace_needs_switch(void)
> @@ -79,15 +123,26 @@ static void __trace_switch_to_guest(void)
>
>         __trace_do_switch(host_data_ptr(host_debug_state.trfcr_el1),
>                           *host_data_ptr(trfcr_while_in_guest));
> -
> -       if (__trace_needs_drain()) {
> -               isb();
> -               tsb_csync();
> -       }
> +       __trace_drain_and_disable();
>  }
>
>  static void __trace_switch_to_host(void)
>  {
> +       u64 trblimitr_el1 = *host_data_ptr(host_debug_state.trblimitr_el1);
> +
> +       if (trblimitr_el1 & TRBLIMITR_EL1_E) {
> +               /* Re-enable the Trace Buffer Unit for the host. */
> +               write_sysreg_s(trblimitr_el1, SYS_TRBLIMITR_EL1);
> +               isb();
> +               if (cpus_have_final_cap(ARM64_WORKAROUND_2038923)) {
> +                       /*
> +                        * Make sure the unit is re-enabled before we
> +                        * poke TRFCR.
> +                        */
> +                       isb();
> +               }
> +       }
> +
>         __trace_do_switch(host_data_ptr(trfcr_while_in_guest),
>                           *host_data_ptr(host_debug_state.trfcr_el1));
>  }
> diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
> index 779089e42681..f00688e69d88 100644
> --- a/arch/arm64/kvm/hyp/nvhe/switch.c
> +++ b/arch/arm64/kvm/hyp/nvhe/switch.c
> @@ -278,7 +278,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
>          * We're about to restore some new MMU state. Make sure
>          * ongoing page-table walks that have started before we
>          * trapped to EL2 have completed. This also synchronises the
> -        * above disabling of BRBE, SPE and TRBE.
> +        * above disabling of BRBE and SPE.
>          *
>          * See DDI0487I.a D8.1.5 "Out-of-context translation regimes",
>          * rule R_LFHQG and subsequent information statements.
> --
> 2.53.0.473.g4a7958ca14-goog
>

