Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A72CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 11:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdg5+UPrJdhmk7JGtwh9VivovQ3SmkgChrYFYtG0TWU=; b=eZ5dUx9lIfyvQX7XMnkdnwLaV9
	mD6OryPkDRHkAEGPRlrAURc5LI4cWB9ThjBRFDe0n1HDCVw6Jgbli5GJlexQbYYfW47o9dMsjiT2/
	rOudh9ETDrbkwjusythFQ6XrpWLt6uo0ysJc3TC747unLHi9UIGlsuo25gWDMEOM9wQtNPCJZhbJp
	r+zSorqzOjW5EaJ00K9MqsGzIslbFF7h/s/PXIjwAkmxO1qzRbBJ+QfOuB8+cKhGnF0gBaE8Kk6JC
	/poYqpIBjaXybrL+77Lq0xM0VxP42EirYEUAPJ6Nvp8H52jFqUfWZLFDCRtEG+848H2/0YojbQOha
	Y9+qZmAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxYh-0000000FzTu-0BsP;
	Mon, 17 Nov 2025 11:38:11 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxYe-0000000FzTU-1j4g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 11:38:09 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4ee147baf7bso427341cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 03:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763379487; x=1763984287; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kdg5+UPrJdhmk7JGtwh9VivovQ3SmkgChrYFYtG0TWU=;
        b=UN4XYah5v0OWdZhmAQzoB0k2AXp0ZdhCezdTTUh/Gd8/4PA7Kk9ZCqhILO0wcfbD8g
         UjoDz7KK9P85JPzBqJtGX9o3mdAXxPbp/3VrbriZEt3OEW1YgI9iw9s6AdwGpk8CzAI+
         Y57um688ZbVkkjcCbyfhxBSFe6qL+AA4RefQnd77KCkvYK2YYh5z1JuysOBzYWq3/yWg
         nlZ5DFCXOdixqcsP6KpWsvRgsDDyORAXJr80qWwyMyc179OTk1mrx9hQMXTT1peDe8C+
         FKF4yq3bss19gaqagis0Xe2IoPVMTrpUQs+N66Lq+xqLIygFJ4kvVz7OlEGvBNpyNPv4
         d6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379487; x=1763984287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdg5+UPrJdhmk7JGtwh9VivovQ3SmkgChrYFYtG0TWU=;
        b=oThsd1Q3JrqFZ80hIWHnLqrHZLwJBDdAmdsKmUxoXohgQjOm2Mh1pC8aEWy58m3qyZ
         Hq45dZ84wrVFesVorBR53NmA4Xeu9gXcyBuk1MeN1RI/uozK5oQ6U/dnKjBmKTk10rzs
         WoSJ76/V4prYPiHF4t2PBBcriOv/shjDD/2pjkOCWIaKq5cxBJJSw1FV/HIQJsItvN8E
         9chj2xbMVxjkruRbuv0ntyxjM3YaoRetnls3uTj3l0m0k9Jqm5cnzwCVHuYYcGVKrEHs
         IdLOUJSkx4CMZbOhAhJalhtBNHVGoL7KUYrBevYJIgak1Q37xRoDZNOODzqthpDaTJxi
         yvCA==
X-Forwarded-Encrypted: i=1; AJvYcCVA6TgR3hMr9SuJNpx1UoG/B99tHUAHZJMARGmZnT8flXaPOMFe3vy456HJV0UnSzpHGQpiSQ+W4MM+wDjH5yX1@lists.infradead.org
X-Gm-Message-State: AOJu0YzYvNlfIZTRgsRaSvZJ71/5ObpV+D4JddOnh0gqwQ3tV+m57JcN
	I3YXtWekBilZX/4eFcALue3nOWaYnV0PRJLObWX2PP/Co0w3Y1GTk49Mkr6uOFw4nqcdbbp0rnS
	YBPJu6jv8tO5KCl2nddisvd4ZbbOZ6vp5lef/J1hYYILdFJ0eG8Pgyctkx7c=
X-Gm-Gg: ASbGncvrS4HJmk52ErEVq4xxgooYW2d3epXKPringGGmu8nMAQW9BYkMisULQIlPke1
	iXGm2P9dtT6mP2t0A3Lq19VWPVhg2ClzQSXwH8FiK+HB2c3bAbOq/d4d2HndOPceMuIzJRu7/kN
	nk2gpWtEhqgEBVRDG/pv7mGVa1ki/tdZy5dgFrenLsza0n62bEHicGSuCz3VO8X2Wvb9O0bwpST
	Zs9kxzESObjh2uS7euPXbNwAP+KVm1Jo4kkZUhhfajs493/ZmwNedm62evef0BZg2FOmIr3X7GL
	wyL8RA==
X-Google-Smtp-Source: AGHT+IEUzk1J8x9rcLQDUa8qBh/biui07QWgEMDHESbR/FCoW/EKjye7pZu/VI/SwwQaKSEzkd8zFPpkSrkKcc1IZ9E=
X-Received: by 2002:a05:622a:410:b0:4b7:9617:4b51 with SMTP id
 d75a77b69052e-4ee02c68ca6mr10730511cf.15.1763379486951; Mon, 17 Nov 2025
 03:38:06 -0800 (PST)
MIME-Version: 1.0
References: <20251117091527.1119213-1-maz@kernel.org> <20251117091527.1119213-4-maz@kernel.org>
 <CA+EHjTwn7PUykGngWRpK3T9gQ_w8=3+BrmEk9GthH0MgMi3FVw@mail.gmail.com> <864iqsuc46.wl-maz@kernel.org>
In-Reply-To: <864iqsuc46.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Nov 2025 11:37:30 +0000
X-Gm-Features: AWmQ_bl2OOGtg5EpxsSP4-l5nGFXjbgI8_cv-QkngiBO_SM1kp2CRHSJUuDRotw
Message-ID: <CA+EHjTzJhQ3RFm-kNavoSux78AeoErWKU_4Qt0NTqedgNNkgig@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251117_033808_773027_0F922D4F 
X-CRM114-Status: GOOD (  40.92  )
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

On Mon, 17 Nov 2025 at 11:34, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 17 Nov 2025 11:24:24 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi Marc,
> >
> >
> > On Mon, 17 Nov 2025 at 09:15, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > The current approach to nested GICv3 support is to not do anything
> > > while L2 is running, wait a transition from L2 to L1 to resync
> > > LRs, VMCR and HCR, and only then evaluate the state to decide
> > > whether to generate a maintenance interrupt.
> > >
> > > This doesn't provide a good quality of emulation, and it would be
> > > far preferable to find out early that we need to perform a switch.
> > >
> > > Move the LRs/VMCR and HCR resync into vgic_v3_sync_nested(), so
> > > that we have most of the state available. As we turning the vgic
> > > off at this stage to avoid a screaming host MI, add a new helper
> > > vgic_v3_flush_nested() that switches the vgic on again. The MI can
> > > then be directly injected as required.
> > >
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  arch/arm64/include/asm/kvm_hyp.h     |  1 +
> > >  arch/arm64/kvm/hyp/vgic-v3-sr.c      |  2 +-
> > >  arch/arm64/kvm/vgic/vgic-v3-nested.c | 69 ++++++++++++++++------------
> > >  arch/arm64/kvm/vgic/vgic.c           |  6 ++-
> > >  arch/arm64/kvm/vgic/vgic.h           |  1 +
> > >  5 files changed, 46 insertions(+), 33 deletions(-)
> > >
> > > diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
> > > index dbf16a9f67728..76ce2b94bd97e 100644
> > > --- a/arch/arm64/include/asm/kvm_hyp.h
> > > +++ b/arch/arm64/include/asm/kvm_hyp.h
> > > @@ -77,6 +77,7 @@ DECLARE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
> > >  int __vgic_v2_perform_cpuif_access(struct kvm_vcpu *vcpu);
> > >
> > >  u64 __gic_v3_get_lr(unsigned int lr);
> > > +void __gic_v3_set_lr(u64 val, int lr);
> > >
> > >  void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if);
> > >  void __vgic_v3_restore_state(struct vgic_v3_cpu_if *cpu_if);
> > > diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> > > index 71199e1a92940..99342c13e1794 100644
> > > --- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
> > > +++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> > > @@ -60,7 +60,7 @@ u64 __gic_v3_get_lr(unsigned int lr)
> > >         unreachable();
> > >  }
> > >
> > > -static void __gic_v3_set_lr(u64 val, int lr)
> > > +void __gic_v3_set_lr(u64 val, int lr)
> > >  {
> > >         switch (lr & 0xf) {
> > >         case 0:
> > > diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > > index 17bceef83269e..bf37fd3198ba7 100644
> > > --- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > > +++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > > @@ -70,13 +70,14 @@ static int lr_map_idx_to_shadow_idx(struct shadow_if *shadow_if, int idx)
> > >   * - on L2 put: perform the inverse transformation, so that the result of L2
> > >   *   running becomes visible to L1 in the VNCR-accessible registers.
> > >   *
> > > - * - there is nothing to do on L2 entry, as everything will have happened
> > > - *   on load. However, this is the point where we detect that an interrupt
> > > - *   targeting L1 and prepare the grand switcheroo.
> > > + * - there is nothing to do on L2 entry apart from enabling the vgic, as
> > > + *   everything will have happened on load. However, this is the point where
> > > + *   we detect that an interrupt targeting L1 and prepare the grand
> > > + *   switcheroo.
> > >   *
> > > - * - on L2 exit: emulate the HW bit, and deactivate corresponding the L1
> > > - *   interrupt. The L0 active state will be cleared by the HW if the L1
> > > - *   interrupt was itself backed by a HW interrupt.
> > > + * - on L2 exit: resync the LRs and VMCR, emulate the HW bit, and deactivate
> > > + *   corresponding the L1 interrupt. The L0 active state will be cleared by
> > > + *   the HW if the L1 interrupt was itself backed by a HW interrupt.
> > >   *
> > >   * Maintenance Interrupt (MI) management:
> > >   *
> > > @@ -265,15 +266,30 @@ static void vgic_v3_create_shadow_lr(struct kvm_vcpu *vcpu,
> > >         s_cpu_if->used_lrs = hweight16(shadow_if->lr_map);
> > >  }
> > >
> > > +void vgic_v3_flush_nested(struct kvm_vcpu *vcpu)
> > > +{
> > > +       u64 val = __vcpu_sys_reg(vcpu, ICH_HCR_EL2);
> > > +
> > > +       write_sysreg_s(val | vgic_ich_hcr_trap_bits(), SYS_ICH_HCR_EL2);
> > > +}
> > > +
> > >  void vgic_v3_sync_nested(struct kvm_vcpu *vcpu)
> > >  {
> > >         struct shadow_if *shadow_if = get_shadow_if();
> > >         int i;
> > >
> > >         for_each_set_bit(i, &shadow_if->lr_map, kvm_vgic_global_state.nr_lr) {
> > > -               u64 lr = __vcpu_sys_reg(vcpu, ICH_LRN(i));
> > > +               u64 val, host_lr, lr;
> > >                 struct vgic_irq *irq;
> > >
> > > +               host_lr = __gic_v3_get_lr(lr_map_idx_to_shadow_idx(shadow_if, i));
> > > +
> > > +               /* Propagate the new LR state */
> > > +               lr = __vcpu_sys_reg(vcpu, ICH_LRN(i));
> > > +               val = lr & ~ICH_LR_STATE;
> > > +               val |= host_lr & ICH_LR_STATE;
> > > +               __vcpu_assign_sys_reg(vcpu, ICH_LRN(i), val);
> > > +
> >
> > As I said before, I am outside of my comfort zone here. However,
> > should the following check be changed to use the merged 'val', rather
> > than the guest lr as it was?
>
> [...]
>
> >
> > >                 if (!(lr & ICH_LR_HW) || !(lr & ICH_LR_STATE))
> > >                         continue;
>
> No, this decision must be taken based on the *original* state, before
> the L2 guest was run. If the LR was in an invalid state the first
> place, there is nothing to do.
>
> > >
> > > @@ -286,12 +302,21 @@ void vgic_v3_sync_nested(struct kvm_vcpu *vcpu)
> > >                 if (WARN_ON(!irq)) /* Shouldn't happen as we check on load */
> > >                         continue;
> > >
> > > -               lr = __gic_v3_get_lr(lr_map_idx_to_shadow_idx(shadow_if, i));
> > > -               if (!(lr & ICH_LR_STATE))
> > > +               if (!(host_lr & ICH_LR_STATE))
> > >                         irq->active = false;
>
> And here, if we see that the *new* state (as fished out of the HW LRs)
> is now invalid, this means that a deactivation has taken place in L2,
> and we must propagate it to L1.

Thanks for the clarification.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

