Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08813C9EC7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 12:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EhverceljAAUxMEU3GTIMI93Myxn5CKaFJOdFr79HIY=; b=KsYz/5VZeBc2N2RHcJudbq/J74
	NIilEm083CsjTuDY9YrfL2kVPn789AwyisdVnbhqGIKtcDd72JX0iTKeHDk6VxYqDD140/ViCvsxm
	mrc7rBroL4kNUaUWPvneLPdEXsZhv4PXJuX/89DBHtCXcsZ0YZSQNSZjBNztvy03urKZkrwXjtMGk
	a0wlnxK0pV9P3AGN0ZQeC8lKV6YjSF8C6IiY3dNHRlqWr8wGeaiU6xH6Yht0OVTUtr4BySnFLK1af
	umHklP3r26rCRBv6DgyJA3gTd2jACH+p5BSRw2AEBLutGN9HJezWBIUEtN95FoeDBCpoei/CY+szU
	9jiIiqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGaa-00000005IPc-0XPv;
	Mon, 12 Jan 2026 12:00:04 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGaX-00000005IOh-0nhU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 12:00:02 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4ffbaaafac4so898241cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 04:00:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768219200; cv=none;
        d=google.com; s=arc-20240605;
        b=T3HjTo14N+vC5zy902WtH+rA2ZgxoqqjaKwuVf+2J2R1GyF96Ju8tzipvSjMSJVPSc
         yEil31e0XMQ+Iwfmc9ndIGi4MEwWy2wQYI3tS6BNTuis5Fssf7ZCb41P+CtyHnTMwuDd
         ps/ERcFCCZXC8zA5FT/KqV89XKLjSVI5+oaRm8B5qglRcqgnQnbIMz+0ESysenRFBKLB
         rzQ3rGUm/gMr8l2nysrlk6HRgfYJ0JJx+AD85AMDoI1S+EQBT0fPloYuZX0S4Itnwg4/
         HyrthfwNpdpBVVXyWm3anbw3FM5kf6ERZ4DouPLnzsSqyrqP1OOnYMxF/b6L2DswJlQI
         vgqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EhverceljAAUxMEU3GTIMI93Myxn5CKaFJOdFr79HIY=;
        fh=/o9HipW/nC248gv+7SFfvuHC25qJuzcfbxMP70Xg3yU=;
        b=dJPz/rNPSrMc+nC7QLa6/OGoyX379HNTO9e/hRGesJhnbe/3e0+AVrNgyk21zffQwz
         YVggkvJ5dC2saDn9qFvwZCQbtQnUZJq+wUqWZwVPvWp6r0a92HiG8MsTvBZeG3zc3nZa
         hEqZNDgXYf0tjo+uYy8UfETl3XjXUraVgPGmuJvao5XiWLH/excCEkYkK4E7pTVQWWf9
         1iNMu517v9RMzORa4IS9YAoYzK9XnF2Bnbgw4Z7+PgW35u2hLTTxa4VimtLVXeHCUfuE
         yMI34LUqY22MdflBIJMO6a1IKGF/KKvXEW50cdliA6OVfrwzWKYpd27UTGmccexpDtV1
         mKbQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768219200; x=1768824000; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EhverceljAAUxMEU3GTIMI93Myxn5CKaFJOdFr79HIY=;
        b=IPgG/nlue5VGOOEf3sOg2628S3mpedjwQl6y7DCkWaNb18cmpy9HaDdBS4/SWgvTsd
         j0/LLirdq0oRRIUjaxiTPP2YJQaOzW9tVsNX7C3FwjEXn5sBzZ0xPu2TIER6ZGjGnB7W
         2052U/fUjdc3BDl5XjaqGjeUjxgL+5iN8bk/EYhdfmsji/SMx1Wf6Y8oVPrnqrwRjMAB
         ZAXml5j5rA5W/94WzdMyAXsewycrPxSYLr1CkIl2L2aJayTn2fpoDi0Sx/NnAjqvkZ2b
         +7kQ6LuHtKhjP1jlsMjB3EVyYXC5frWXcJnhnjlqeIe9Y0XlyHy19uQHC+7bd3cPIrzO
         u/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768219200; x=1768824000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhverceljAAUxMEU3GTIMI93Myxn5CKaFJOdFr79HIY=;
        b=I+kuuOxkAGL67tNqOPV8Uxq3YvROVauxnkokndd4uH+SctoARYSsDJT34nMK3RxLbc
         cWxRP2Q2SrOt1dMSBGU9T5I9pFKa0OayVk0SWuNYYYVPUaxqmJlO4poaTtZC5qzXIR9s
         el0gCty1yQXeDmOWJG1qgLLiOmxBmLN5UdrkjEB9vde9QDGUgA/JhF17W7/kyFY8m36s
         BmB75Ehfwt4D+3htIFPiJp+6L0ALkkRUSyYwVkHlrGlbIVZveia0Of1vzibqLEqhmKuz
         +5rpWkxn3sOWkKdKfUD7FoBOJE4jLPh6ZzAiUl6KTdq9e8coJ/3wqo0ho3dreOy9UMnv
         ugwg==
X-Forwarded-Encrypted: i=1; AJvYcCVegaCiLeSvFd0vdL2LieVUsXbpSZ8jorxV1ghftdj50rBUyg4HXEbzCczWyfv+s79nPUsLgoaMB/uPw/mO3BjN@lists.infradead.org
X-Gm-Message-State: AOJu0YzTA4htPiSqsXsVSOSDHx4d5SQ0W0dpdS+mqDGCZU9NCswb9SeZ
	TSPYyTQUSp51gGAPWnhOv5KBZX4pXZswhKuINj0VNj+A26E0HO+fRKfOVIlRWJ3G7dpf66tEH2y
	wNf3CeG7+lOUqoQ0AWtNEZoG1lMpFw++SW8wY/8Tk
X-Gm-Gg: AY/fxX4Lj/FlM6Z5yA3Zz89XuaH3B4iscjnpQ2c+PEPEx5Gzsskt93bpZjt7Qz8/0/S
	W1CEqoGmwi2hO+Wk2HG7e1JhUHvdNnHiivOvDPZmYC7vPSZF5ZfPxOYDYh3xPEfJcFKdzDFsl+b
	9cCtQjnxUo9uTLhfnUxTqZOeNXoqgO8Elv9avbIUZzK6tN9oKs8b01C1KS5of6MnejZzRQ4v7/c
	Je332pUDssH6IvWvZ6eqcNUh98ChnW6xUTfy6g+BiZi7glIDPhnwH254M20RmDqonq0Tz4j
X-Received: by 2002:ac8:5891:0:b0:4ff:bfdd:3f46 with SMTP id
 d75a77b69052e-5011979b086mr17248321cf.15.1768219199451; Mon, 12 Jan 2026
 03:59:59 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-18-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-18-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 12 Jan 2026 11:59:22 +0000
X-Gm-Features: AZwV_QjlL10TIxuJSo-17cIhu7wpBka538OyBuaIYcHbCwZvW100GJwAVVv1kGY
Message-ID: <CA+EHjTwxc=+1TodVR7X96fnKu-mykivdFxMbB5nUrw_h4MGKHg@mail.gmail.com>
Subject: Re: [PATCH v9 18/30] KVM: arm64: Support SME priority registers
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_040001_258676_EAEF52AE 
X-CRM114-Status: GOOD (  38.23  )
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

Hi Mark,

On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> SME has optional support for configuring the relative priorities of PEs
> in systems where they share a single SME hardware block, known as a
> SMCU. Currently we do not have any support for this in Linux and will
> also hide it from KVM guests, pending experience with practical
> implementations. The interface for configuring priority support is via
> two new system registers, these registers are always defined when SME is
> available.
>
> The register SMPRI_EL1 allows control of SME execution priorities. Since
> we disable SME priority support for guests this register is RES0, define
> it as such and enable fine grained traps for SMPRI_EL1 to ensure that
> guests can't write to it even if the hardware supports priorites.  Since

nit: priorites -> priorities

> the register should be readable with fixed contents we only trap writes,
> not reads. Since there is no host support for using priorities the
> register currently left with a value of 0 by the host so we do not need
> to update the value for guests.
>
> There is also an EL2 register SMPRIMAP_EL2 for virtualisation of
> priorities, this is RES0 when priority configuration is not supported
> but has no specific traps available.  When saving state from a nested
> guest we overwite any value the guest stored.

nit: overwite -> overwrite

>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h     |  1 +
>  arch/arm64/include/asm/vncr_mapping.h |  1 +
>  arch/arm64/kvm/config.c               |  3 +++
>  arch/arm64/kvm/hyp/vhe/sysreg-sr.c    |  7 +++++++
>  arch/arm64/kvm/sys_regs.c             | 30 +++++++++++++++++++++++++++++-
>  5 files changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index fead6988f47c..44595a789a97 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -546,6 +546,7 @@ enum vcpu_sysreg {
>         VNCR(CPACR_EL1),/* Coprocessor Access Control */
>         VNCR(ZCR_EL1),  /* SVE Control */
>         VNCR(SMCR_EL1), /* SME Control */
> +       VNCR(SMPRIMAP_EL2),     /* Streaming Mode Priority Mapping Register */
>         VNCR(TTBR0_EL1),/* Translation Table Base Register 0 */
>         VNCR(TTBR1_EL1),/* Translation Table Base Register 1 */
>         VNCR(TCR_EL1),  /* Translation Control Register */
> diff --git a/arch/arm64/include/asm/vncr_mapping.h b/arch/arm64/include/asm/vncr_mapping.h
> index 44b12565321b..a2a84af6585b 100644
> --- a/arch/arm64/include/asm/vncr_mapping.h
> +++ b/arch/arm64/include/asm/vncr_mapping.h
> @@ -45,6 +45,7 @@
>  #define VNCR_ZCR_EL1            0x1E0
>  #define VNCR_HAFGRTR_EL2       0x1E8
>  #define VNCR_SMCR_EL1          0x1F0
> +#define VNCR_SMPRIMAP_EL2      0x1F0

This should be 0x1F8.

>  #define VNCR_TTBR0_EL1          0x200
>  #define VNCR_TTBR1_EL1          0x210
>  #define VNCR_FAR_EL1            0x220
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 7e26991b2df1..0088635a95bd 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -1481,6 +1481,9 @@ static void __compute_hfgwtr(struct kvm_vcpu *vcpu)
>
>         if (cpus_have_final_cap(ARM64_WORKAROUND_AMPERE_AC03_CPU_38))
>                 *vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
> +
> +       if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SME, IMP))
> +               *vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_nSMPRI_EL1;

Is the intention to _disable_ the trap in this case? I think you
wanted to enable them.

>  }
>
>  static void __compute_hdfgwtr(struct kvm_vcpu *vcpu)
> diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> index f28c6cf4fe1b..07aa4378c58a 100644
> --- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> +++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> @@ -80,6 +80,13 @@ static void __sysreg_save_vel2_state(struct kvm_vcpu *vcpu)
>
>         if (ctxt_has_sctlr2(&vcpu->arch.ctxt))
>                 __vcpu_assign_sys_reg(vcpu, SCTLR2_EL2, read_sysreg_el1(SYS_SCTLR2));
> +
> +       /*
> +        * We block SME priorities so SMPRIMAP_EL2 is RES0, however we
> +        * do not have traps to block access so the guest might have
> +        * updated the state, overwrite anything there.

nit: overwrite -> overwriting

Cheers,
/fuad

> +        */
> +       __vcpu_assign_sys_reg(vcpu, SMPRIMAP_EL2, 0);
>  }
>
>  static void __sysreg_restore_vel2_state(struct kvm_vcpu *vcpu)
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index a7ab02822023..51f175bbe8d1 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -691,6 +691,15 @@ static bool trap_raz_wi(struct kvm_vcpu *vcpu,
>                 return read_zero(vcpu, p);
>  }
>
> +static int set_res0(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
> +                   u64 val)
> +{
> +       if (val)
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
>  /*
>   * ARMv8.1 mandates at least a trivial LORegion implementation, where all the
>   * RW registers are RES0 (which we can implement as RAZ/WI). On an ARMv8.0
> @@ -1979,6 +1988,15 @@ static unsigned int fp8_visibility(const struct kvm_vcpu *vcpu,
>         return REG_HIDDEN;
>  }
>
> +static unsigned int sme_raz_visibility(const struct kvm_vcpu *vcpu,
> +                                      const struct sys_reg_desc *rd)
> +{
> +       if (vcpu_has_sme(vcpu))
> +               return REG_RAZ;
> +
> +       return REG_HIDDEN;
> +}
> +
>  static u64 sanitise_id_aa64pfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
>  {
>         if (!vcpu_has_sve(vcpu))
> @@ -3349,7 +3367,14 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>
>         { SYS_DESC(SYS_ZCR_EL1), NULL, reset_val, ZCR_EL1, 0, .visibility = sve_visibility },
>         { SYS_DESC(SYS_TRFCR_EL1), undef_access },
> -       { SYS_DESC(SYS_SMPRI_EL1), undef_access },
> +
> +       /*
> +        * SMPRI_EL1 is UNDEF when SME is disabled, the UNDEF is
> +        * handled via FGU which is handled without consulting this
> +        * table.
> +        */
> +       { SYS_DESC(SYS_SMPRI_EL1), trap_raz_wi, .visibility = sme_raz_visibility },
> +
>         { SYS_DESC(SYS_SMCR_EL1), NULL, reset_val, SMCR_EL1, 0, .visibility = sme_visibility },
>         { SYS_DESC(SYS_TTBR0_EL1), access_vm_reg, reset_unknown, TTBR0_EL1 },
>         { SYS_DESC(SYS_TTBR1_EL1), access_vm_reg, reset_unknown, TTBR1_EL1 },
> @@ -3719,6 +3744,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>
>         EL2_REG_VNCR(HCRX_EL2, reset_val, 0),
>
> +       { SYS_DESC(SYS_SMPRIMAP_EL2), .reg = SMPRIMAP_EL2,
> +         .access = trap_raz_wi, .set_user = set_res0, .reset = reset_val,
> +         .val = 0, .visibility = sme_el2_visibility },
>         EL2_REG_FILTERED(SMCR_EL2, access_smcr_el2, reset_val, 0,
>                          sme_el2_visibility),
>
>
> --
> 2.47.3
>

