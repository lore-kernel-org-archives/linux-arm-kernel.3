Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90A8CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rh5FOFkRpNnkl1U5y71aKAQjA3wCgCmL0rpsiL+tc+I=; b=psYbkcc6uXI8H/J51RzSV79OzV
	eyUVbjDujFpuPakVR1jAMhHenwdIWGk5ovV4Va0WZs++vA9DGy5T0MUhWSVScgInvvmwNLUTaQywp
	YuK6QxsOWpPVQtT3qDuw6tR2A4Qn6wI08sFtImTh/+lKPij2z3AGdtYDYAXgAokBZMfdlZWjpVwIP
	KjjME7c32dn5klY2HR1GB//gJYl/HI7cPhmrKpO9uHhll+edFRRCnsNBiqwJa2NnK31ZjReC93E9o
	XT3XRP0RN3tkZTdqoEzimh/UCcNukahIQgeBpJsAgASH+882ECgslA3i8hJVMjBVd/6um2k4NviP0
	jmArEJkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxM1-0000000Fxru-1r22;
	Mon, 17 Nov 2025 11:25:05 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxLz-0000000FxrB-1hfT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 11:25:05 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4ee243b98caso185041cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 03:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763378702; x=1763983502; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rh5FOFkRpNnkl1U5y71aKAQjA3wCgCmL0rpsiL+tc+I=;
        b=pKRUVQ7HF7unsDeGYJhwR3pHV5kIRhyadcvu4Q7HuvdzeUr3APkSqtoDfl9YtYQmQ2
         4xrrbgHgBWzlp3gkio/E7QwDEJlznotd/2j5qaaEIbY1ZlPgoZJtiBCupz2DQzEY8Juv
         9HDuRa/6sUM61TVcgOvuX/H+7mySDrgV2evNKfSG+OQbKMYKXQywjyPpsvb6L0ww8K53
         ugv9lkhi3hsuS3zwgPe8niYUxeumKs2IOMgL+AHx9K/W2ezhMtA8K/kMWw2wjESTd8uG
         zaLklRo9Vil65raF6FpzFbJsAtaniLvMhP+WQXISWxMDE5E4C8RiLM+tIvKh+ycUgHPG
         mO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763378702; x=1763983502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rh5FOFkRpNnkl1U5y71aKAQjA3wCgCmL0rpsiL+tc+I=;
        b=vtslou9Z/AoNHhtzjb9sW4WgWJNRI5mixh9yrOBhC9MfAKmfghfkdFOdsJvxOc97vh
         wmypnf/Rqgk0hw/NRSVnLqJUOFgzdLVEGBLPnXFiTUnNSpQvxXBvwyi3c90x9F9e+HIo
         9LlHVp74e4Noa8ez5TLbyTxks25olmtjzsACFeGF5N7Vfo9vJC3U6G0hCLKNC9+03w7T
         ZJIVAMa2kNW6RTtZEntiZlaFGnLjtJ7lO4s/949yXhXGAjQsWUWih2UNo12KLml6SUS5
         cyatb3hCruHCRXWsZ3Q036GTQ+sAzMDt8EcbLQTFj9rvIqVokEqooiO6tJgIdfHFt3V0
         W6YQ==
X-Forwarded-Encrypted: i=1; AJvYcCW885Pfhzf/gzm1Drb+zoRHUo7b0jKZ5tGepYUWr/7AcLIGOpIq6Fj2g7Z3+orRcgh+FPCwjB8BDmeIW/nMbZTO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8TvtX1cr7BWxfJcBWjvChs01E6zHanDeQjQw7KPQX3DF6ZRt0
	OIaebvynl3Nw28/rcvZZ7XjDRX/aK0o9CwIWd3BMlW7BazWgzwTlZ7VyCZF7O1NqC43Pk3X1mzp
	FewPv0qHwb7ye/yciNiXzwkDbh/2mOSgdK5WyoxDK
X-Gm-Gg: ASbGncseb4LV777uVsHLOIcqxpkxQABmuO6VUnG3RwCarOtoKNsjDl7p6s0MerYoz+r
	t1AaZD8xV3+ZPFgshPAAxf9L0xis3Yd0zCQ01kiiJXGg+htGPQSzc0m8kL4Gya89+9GbICweGAq
	RjMXauVzuDxuxrUUySIoeJa4mRXxl4aGCLIcY+VUWIIB+Mz7Tw1Y5St04nY55enfL46uEwUmTVA
	KA5taEv1RL8KjkX1LpTXyhZEi6lfYkNw2bdKmkb0kihWiLkL7FVQpgP2Kjxx8hSjq/FFo2i3sY0
	zNHrcw==
X-Google-Smtp-Source: AGHT+IGwkc3akTfjxN7uaclrAjJAN7V5lyAsbd6yOQTpU6wfC6v+tBlTHC2ToYwZiyuRZDHzeitdDIyTlVINs/6Q2RM=
X-Received: by 2002:a05:622a:1911:b0:4ed:b4e3:cfa9 with SMTP id
 d75a77b69052e-4ee029e2217mr11285621cf.5.1763378701641; Mon, 17 Nov 2025
 03:25:01 -0800 (PST)
MIME-Version: 1.0
References: <20251117091527.1119213-1-maz@kernel.org> <20251117091527.1119213-4-maz@kernel.org>
In-Reply-To: <20251117091527.1119213-4-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Nov 2025 11:24:24 +0000
X-Gm-Features: AWmQ_bkAIiTZwAs3rbIEKnLyWq8pHNEA9ts5ZOERyIIpUJHaY0fSVfCHfMladg8
Message-ID: <CA+EHjTwn7PUykGngWRpK3T9gQ_w8=3+BrmEk9GthH0MgMi3FVw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] KVM: arm64: GICv3: nv: Resync LRs/VMCR/HCR early
 for better MI emulation
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_032503_481828_3984EA4D 
X-CRM114-Status: GOOD (  39.18  )
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


On Mon, 17 Nov 2025 at 09:15, Marc Zyngier <maz@kernel.org> wrote:
>
> The current approach to nested GICv3 support is to not do anything
> while L2 is running, wait a transition from L2 to L1 to resync
> LRs, VMCR and HCR, and only then evaluate the state to decide
> whether to generate a maintenance interrupt.
>
> This doesn't provide a good quality of emulation, and it would be
> far preferable to find out early that we need to perform a switch.
>
> Move the LRs/VMCR and HCR resync into vgic_v3_sync_nested(), so
> that we have most of the state available. As we turning the vgic
> off at this stage to avoid a screaming host MI, add a new helper
> vgic_v3_flush_nested() that switches the vgic on again. The MI can
> then be directly injected as required.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_hyp.h     |  1 +
>  arch/arm64/kvm/hyp/vgic-v3-sr.c      |  2 +-
>  arch/arm64/kvm/vgic/vgic-v3-nested.c | 69 ++++++++++++++++------------
>  arch/arm64/kvm/vgic/vgic.c           |  6 ++-
>  arch/arm64/kvm/vgic/vgic.h           |  1 +
>  5 files changed, 46 insertions(+), 33 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
> index dbf16a9f67728..76ce2b94bd97e 100644
> --- a/arch/arm64/include/asm/kvm_hyp.h
> +++ b/arch/arm64/include/asm/kvm_hyp.h
> @@ -77,6 +77,7 @@ DECLARE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
>  int __vgic_v2_perform_cpuif_access(struct kvm_vcpu *vcpu);
>
>  u64 __gic_v3_get_lr(unsigned int lr);
> +void __gic_v3_set_lr(u64 val, int lr);
>
>  void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if);
>  void __vgic_v3_restore_state(struct vgic_v3_cpu_if *cpu_if);
> diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> index 71199e1a92940..99342c13e1794 100644
> --- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
> +++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> @@ -60,7 +60,7 @@ u64 __gic_v3_get_lr(unsigned int lr)
>         unreachable();
>  }
>
> -static void __gic_v3_set_lr(u64 val, int lr)
> +void __gic_v3_set_lr(u64 val, int lr)
>  {
>         switch (lr & 0xf) {
>         case 0:
> diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> index 17bceef83269e..bf37fd3198ba7 100644
> --- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
> +++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> @@ -70,13 +70,14 @@ static int lr_map_idx_to_shadow_idx(struct shadow_if *shadow_if, int idx)
>   * - on L2 put: perform the inverse transformation, so that the result of L2
>   *   running becomes visible to L1 in the VNCR-accessible registers.
>   *
> - * - there is nothing to do on L2 entry, as everything will have happened
> - *   on load. However, this is the point where we detect that an interrupt
> - *   targeting L1 and prepare the grand switcheroo.
> + * - there is nothing to do on L2 entry apart from enabling the vgic, as
> + *   everything will have happened on load. However, this is the point where
> + *   we detect that an interrupt targeting L1 and prepare the grand
> + *   switcheroo.
>   *
> - * - on L2 exit: emulate the HW bit, and deactivate corresponding the L1
> - *   interrupt. The L0 active state will be cleared by the HW if the L1
> - *   interrupt was itself backed by a HW interrupt.
> + * - on L2 exit: resync the LRs and VMCR, emulate the HW bit, and deactivate
> + *   corresponding the L1 interrupt. The L0 active state will be cleared by
> + *   the HW if the L1 interrupt was itself backed by a HW interrupt.
>   *
>   * Maintenance Interrupt (MI) management:
>   *
> @@ -265,15 +266,30 @@ static void vgic_v3_create_shadow_lr(struct kvm_vcpu *vcpu,
>         s_cpu_if->used_lrs = hweight16(shadow_if->lr_map);
>  }
>
> +void vgic_v3_flush_nested(struct kvm_vcpu *vcpu)
> +{
> +       u64 val = __vcpu_sys_reg(vcpu, ICH_HCR_EL2);
> +
> +       write_sysreg_s(val | vgic_ich_hcr_trap_bits(), SYS_ICH_HCR_EL2);
> +}
> +
>  void vgic_v3_sync_nested(struct kvm_vcpu *vcpu)
>  {
>         struct shadow_if *shadow_if = get_shadow_if();
>         int i;
>
>         for_each_set_bit(i, &shadow_if->lr_map, kvm_vgic_global_state.nr_lr) {
> -               u64 lr = __vcpu_sys_reg(vcpu, ICH_LRN(i));
> +               u64 val, host_lr, lr;
>                 struct vgic_irq *irq;
>
> +               host_lr = __gic_v3_get_lr(lr_map_idx_to_shadow_idx(shadow_if, i));
> +
> +               /* Propagate the new LR state */
> +               lr = __vcpu_sys_reg(vcpu, ICH_LRN(i));
> +               val = lr & ~ICH_LR_STATE;
> +               val |= host_lr & ICH_LR_STATE;
> +               __vcpu_assign_sys_reg(vcpu, ICH_LRN(i), val);
> +

As I said before, I am outside of my comfort zone here. However,
should the following check be changed to use the merged 'val', rather
than the guest lr as it was?

Cheers,
/fuad

>                 if (!(lr & ICH_LR_HW) || !(lr & ICH_LR_STATE))
>                         continue;
>
> @@ -286,12 +302,21 @@ void vgic_v3_sync_nested(struct kvm_vcpu *vcpu)
>                 if (WARN_ON(!irq)) /* Shouldn't happen as we check on load */
>                         continue;
>
> -               lr = __gic_v3_get_lr(lr_map_idx_to_shadow_idx(shadow_if, i));
> -               if (!(lr & ICH_LR_STATE))
> +               if (!(host_lr & ICH_LR_STATE))
>                         irq->active = false;
>
>                 vgic_put_irq(vcpu->kvm, irq);
>         }
> +
> +       /* We need these to be synchronised to generate the MI */
> +       __vcpu_assign_sys_reg(vcpu, ICH_VMCR_EL2, read_sysreg_s(SYS_ICH_VMCR_EL2));
> +       __vcpu_rmw_sys_reg(vcpu, ICH_HCR_EL2, &=, ~ICH_HCR_EL2_EOIcount);
> +       __vcpu_rmw_sys_reg(vcpu, ICH_HCR_EL2, |=, read_sysreg_s(SYS_ICH_HCR_EL2) & ICH_HCR_EL2_EOIcount);
> +
> +       write_sysreg_s(0, SYS_ICH_HCR_EL2);
> +       isb();
> +
> +       vgic_v3_nested_update_mi(vcpu);
>  }
>
>  static void vgic_v3_create_shadow_state(struct kvm_vcpu *vcpu,
> @@ -325,7 +350,8 @@ void vgic_v3_load_nested(struct kvm_vcpu *vcpu)
>         __vgic_v3_restore_vmcr_aprs(cpu_if);
>         __vgic_v3_activate_traps(cpu_if);
>
> -       __vgic_v3_restore_state(cpu_if);
> +       for (int i = 0; i < cpu_if->used_lrs; i++)
> +               __gic_v3_set_lr(cpu_if->vgic_lr[i], i);
>
>         /*
>          * Propagate the number of used LRs for the benefit of the HYP
> @@ -338,36 +364,19 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
>  {
>         struct shadow_if *shadow_if = get_shadow_if();
>         struct vgic_v3_cpu_if *s_cpu_if = &shadow_if->cpuif;
> -       u64 val;
>         int i;
>
>         __vgic_v3_save_aprs(s_cpu_if);
> -       __vgic_v3_deactivate_traps(s_cpu_if);
> -       __vgic_v3_save_state(s_cpu_if);
> -
> -       /*
> -        * Translate the shadow state HW fields back to the virtual ones
> -        * before copying the shadow struct back to the nested one.
> -        */
> -       val = __vcpu_sys_reg(vcpu, ICH_HCR_EL2);
> -       val &= ~ICH_HCR_EL2_EOIcount_MASK;
> -       val |= (s_cpu_if->vgic_hcr & ICH_HCR_EL2_EOIcount_MASK);
> -       __vcpu_assign_sys_reg(vcpu, ICH_HCR_EL2, val);
> -       __vcpu_assign_sys_reg(vcpu, ICH_VMCR_EL2, s_cpu_if->vgic_vmcr);
>
>         for (i = 0; i < 4; i++) {
>                 __vcpu_assign_sys_reg(vcpu, ICH_AP0RN(i), s_cpu_if->vgic_ap0r[i]);
>                 __vcpu_assign_sys_reg(vcpu, ICH_AP1RN(i), s_cpu_if->vgic_ap1r[i]);
>         }
>
> -       for_each_set_bit(i, &shadow_if->lr_map, kvm_vgic_global_state.nr_lr) {
> -               val = __vcpu_sys_reg(vcpu, ICH_LRN(i));
> -
> -               val &= ~ICH_LR_STATE;
> -               val |= s_cpu_if->vgic_lr[lr_map_idx_to_shadow_idx(shadow_if, i)] & ICH_LR_STATE;
> +       for (i = 0; i < s_cpu_if->used_lrs; i++)
> +               __gic_v3_set_lr(0, i);
>
> -               __vcpu_assign_sys_reg(vcpu, ICH_LRN(i), val);
> -       }
> +       __vgic_v3_deactivate_traps(s_cpu_if);
>
>         vcpu->arch.vgic_cpu.vgic_v3.used_lrs = 0;
>  }
> diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
> index a2f408754774e..4e4db52008c10 100644
> --- a/arch/arm64/kvm/vgic/vgic.c
> +++ b/arch/arm64/kvm/vgic/vgic.c
> @@ -1056,8 +1056,9 @@ void kvm_vgic_flush_hwstate(struct kvm_vcpu *vcpu)
>          *   abort the entry procedure and inject the exception at the
>          *   beginning of the run loop.
>          *
> -        * - Otherwise, do exactly *NOTHING*. The guest state is
> -        *   already loaded, and we can carry on with running it.
> +        * - Otherwise, do exactly *NOTHING* apart from enabling the virtual
> +        *   CPU interface. The guest state is already loaded, and we can
> +        *   carry on with running it.
>          *
>          * If we have NV, but are not in a nested state, compute the
>          * maintenance interrupt state, as it may fire.
> @@ -1066,6 +1067,7 @@ void kvm_vgic_flush_hwstate(struct kvm_vcpu *vcpu)
>                 if (kvm_vgic_vcpu_pending_irq(vcpu))
>                         kvm_make_request(KVM_REQ_GUEST_HYP_IRQ_PENDING, vcpu);
>
> +               vgic_v3_flush_nested(vcpu);
>                 return;
>         }
>
> diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
> index ec3a61e8e6b30..5f0fc96b4dc29 100644
> --- a/arch/arm64/kvm/vgic/vgic.h
> +++ b/arch/arm64/kvm/vgic/vgic.h
> @@ -446,6 +446,7 @@ static inline bool kvm_has_gicv3(struct kvm *kvm)
>         return kvm_has_feat(kvm, ID_AA64PFR0_EL1, GIC, IMP);
>  }
>
> +void vgic_v3_flush_nested(struct kvm_vcpu *vcpu);
>  void vgic_v3_sync_nested(struct kvm_vcpu *vcpu);
>  void vgic_v3_load_nested(struct kvm_vcpu *vcpu);
>  void vgic_v3_put_nested(struct kvm_vcpu *vcpu);
> --
> 2.47.3
>
>

