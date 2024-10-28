Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3324D339A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdUZtk1fpQmVlMAy2eFWyRES/zFmVCuya2ON3EbDm7k=; b=JkJw0x6vodjx8/wUtYXjioTWcC
	6uGPQltreifOYAASWeD0931WDTnDdVqd5+5GZHB0Ctl9rbJ+eF3zepfobT8A1bmUM01b1FrEYpakY
	vz7eHSi0QYGNuvVVoYmBSL8FhfHTZzOURr5kGIkbcwwZX0E103xYyllQUNdjRk2V0O4iIC4i4pNFS
	bQb6u1k6yx4Q10PWydbaqqR7mEGZF2YdH89vtmScY/I863Sui9Lees26NHNK190SM0UbsJ5Tf7THw
	mKVztazQKjdfIo4iXFX+lCcZ45bPwO2vCYCHKbcLCNXX+Jd+3aqhiuPOyHHxy/r86oNFTAEafP32N
	i1bnKofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TDo-0000000Bc1X-19Ih;
	Mon, 28 Oct 2024 17:08:04 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SqZ-0000000BY4x-2y4e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 16:44:05 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-460a8d1a9b7so368211cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 09:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730133840; x=1730738640; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdUZtk1fpQmVlMAy2eFWyRES/zFmVCuya2ON3EbDm7k=;
        b=SXPNYw1hDpTRA5CkvANLVomDEDHfrA/Yo8u2mO39CbREKmen06yxSuHItr7h62tMVM
         syZxC4dJE903GqW1iojA8GzpaaYjMNemuDuOA07TFJwSuYqBfbsq5XBCjN3Uin22BKhh
         HZzHB1vrRVSTaBZy48JEA1s472v+pKiglL9zg8vxnBHxFOIwY3ZGBrcC8NmMa8o9dmID
         Fmkobtt1NC1uswMswqrbNz1gnG7v/7jLjb0WE2hjKaVp3QTU8uHH3gfshWO6ku9Iir8t
         oHSEpHYItJlEoSd0DRlica/zcXEfFzNrEntca+rp55YkC1EpJ/Mo26GS/xIzGbRmMo8A
         zR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730133840; x=1730738640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdUZtk1fpQmVlMAy2eFWyRES/zFmVCuya2ON3EbDm7k=;
        b=BS1FfHojuy9BYvNhoIOSFqAcLw/brCrOH7MB04LFV/p3NHNIplF7IGawAkIfGmSguB
         LLu81CIGxcjEk3UEZ5hXGgIRwMzh6e0nHisMRSoMKHs/ABSMeOvB8kVzgHC/Q8UmWYjg
         FUqR5ZjTNZxq4DIQhsGsGdVuvN+dosUk6HaGGo96UHiH1NQHCE9futb4+6YopDjroQkf
         kGXbzPl8iZNrhAMRmc6czimU91FV1fazmqhWvUDTfk22jpnITp24NHFxg2EbLrTqOl6g
         F8mWTX4TO2+juuwfw1bd3fh80TFFx8nj5GeiiIjOSXAJThrEU112cOEtMRM2aM2Vteo4
         3TyA==
X-Forwarded-Encrypted: i=1; AJvYcCWXGlD05CV+1MaudAtyFvgVebMXyclLGnUw5zOSEPNx1GYe8/Klp8t4W5iQeTPZFujEoh1SmtPx4cHyhiHIBUJ9@lists.infradead.org
X-Gm-Message-State: AOJu0YzjXEof034ty+EpGVE2UNNDzkD4MELGpbLdBo7lMdeMwTReqf4S
	PDtPLI1KP8c9T2Ps9LsrIy2aSHiAUvz1c4ICoSjr+7WUKZzbyXREEaToz0L3bJzKEV6G+yfWXdz
	y9GYBtZuf2WLGh0A4O7YVGWUyHb2JZxPha7To
X-Google-Smtp-Source: AGHT+IEghDPlnRG5rp1sejh9aj1o1ldjwh0sg0K+Pts7Qn1e0eo7gyHR2Y3Bk11hNYvDVU4SH68ne++ka9GQaWQoClE=
X-Received: by 2002:ac8:470f:0:b0:461:4150:b833 with SMTP id
 d75a77b69052e-4614150b8f8mr3465511cf.22.1730133840204; Mon, 28 Oct 2024
 09:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241025221220.2985227-1-rananta@google.com> <Zxx_X9-MdmAFzHUO@linux.dev>
 <87ttcztili.wl-maz@kernel.org> <Zx0CT1gdSWVyKLuD@linux.dev>
In-Reply-To: <Zx0CT1gdSWVyKLuD@linux.dev>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 28 Oct 2024 09:43:45 -0700
Message-ID: <CAJHc60wn=vA9j421FhVkMqYc0w8u2ZYuc-9TJ+rvriSXjseKHw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Mark the VM as dead for failed initializations
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	stable@vger.kernel.org, syzbot <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_094403_822612_E26AF2FA 
X-CRM114-Status: GOOD (  27.55  )
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

Hi Oliver,


On Sat, Oct 26, 2024 at 7:53=E2=80=AFAM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> On Sat, Oct 26, 2024 at 08:43:21AM +0100, Marc Zyngier wrote:
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm=
/kvm_host.h
> > index bf64fed9820e..c315bc1a4e9a 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -74,8 +74,6 @@ enum kvm_mode kvm_get_mode(void);
> >  static inline enum kvm_mode kvm_get_mode(void) { return KVM_MODE_NONE;=
 };
> >  #endif
> >
> > -DECLARE_STATIC_KEY_FALSE(userspace_irqchip_in_use);
> > -
> >  extern unsigned int __ro_after_init kvm_sve_max_vl;
> >  extern unsigned int __ro_after_init kvm_host_sve_max_vl;
> >  int __init kvm_arm_init_sve(void);
> > diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> > index 879982b1cc73..1215df590418 100644
> > --- a/arch/arm64/kvm/arch_timer.c
> > +++ b/arch/arm64/kvm/arch_timer.c
> > @@ -206,8 +206,7 @@ void get_timer_map(struct kvm_vcpu *vcpu, struct ti=
mer_map *map)
> >
> >  static inline bool userspace_irqchip(struct kvm *kvm)
> >  {
> > -     return static_branch_unlikely(&userspace_irqchip_in_use) &&
> > -             unlikely(!irqchip_in_kernel(kvm));
> > +     return unlikely(!irqchip_in_kernel(kvm));
> >  }
> >
> >  static void soft_timer_start(struct hrtimer *hrt, u64 ns)
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 48cafb65d6ac..70ff9a20ef3a 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -69,7 +69,6 @@ DECLARE_KVM_NVHE_PER_CPU(struct kvm_cpu_context, kvm_=
hyp_ctxt);
> >  static bool vgic_present, kvm_arm_initialised;
> >
> >  static DEFINE_PER_CPU(unsigned char, kvm_hyp_initialized);
> > -DEFINE_STATIC_KEY_FALSE(userspace_irqchip_in_use);
> >
> >  bool is_kvm_arm_initialised(void)
> >  {
> > @@ -503,9 +502,6 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu=
)
> >
> >  void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
> >  {
> > -     if (vcpu_has_run_once(vcpu) && unlikely(!irqchip_in_kernel(vcpu->=
kvm)))
> > -             static_branch_dec(&userspace_irqchip_in_use);
> > -
> >       kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
> >       kvm_timer_vcpu_terminate(vcpu);
> >       kvm_pmu_vcpu_destroy(vcpu);
> > @@ -848,14 +844,6 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *=
vcpu)
> >                       return ret;
> >       }
> >
> > -     if (!irqchip_in_kernel(kvm)) {
> > -             /*
> > -              * Tell the rest of the code that there are userspace irq=
chip
> > -              * VMs in the wild.
> > -              */
> > -             static_branch_inc(&userspace_irqchip_in_use);
> > -     }
> > -
> >       /*
> >        * Initialize traps for protected VMs.
> >        * NOTE: Move to run in EL2 directly, rather than via a hypercall=
, once
> > @@ -1077,7 +1065,7 @@ static bool kvm_vcpu_exit_request(struct kvm_vcpu=
 *vcpu, int *ret)
> >        * state gets updated in kvm_timer_update_run and
> >        * kvm_pmu_update_run below).
> >        */
> > -     if (static_branch_unlikely(&userspace_irqchip_in_use)) {
> > +     if (unlikely(!irqchip_in_kernel(vcpu->kvm))) {
> >               if (kvm_timer_should_notify_user(vcpu) ||
> >                   kvm_pmu_should_notify_user(vcpu)) {
> >                       *ret =3D -EINTR;
> > @@ -1199,7 +1187,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu=
)
> >                       vcpu->mode =3D OUTSIDE_GUEST_MODE;
> >                       isb(); /* Ensure work in x_flush_hwstate is commi=
tted */
> >                       kvm_pmu_sync_hwstate(vcpu);
> > -                     if (static_branch_unlikely(&userspace_irqchip_in_=
use))
> > +                     if (unlikely(!irqchip_in_kernel(vcpu->kvm)))
> >                               kvm_timer_sync_user(vcpu);
> >                       kvm_vgic_sync_hwstate(vcpu);
> >                       local_irq_enable();
> > @@ -1245,7 +1233,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu=
)
> >                * we don't want vtimer interrupts to race with syncing t=
he
> >                * timer virtual interrupt state.
> >                */
> > -             if (static_branch_unlikely(&userspace_irqchip_in_use))
> > +             if (unlikely(!irqchip_in_kernel(vcpu->kvm)))
> >                       kvm_timer_sync_user(vcpu);
> >
> >               kvm_arch_vcpu_ctxsync_fp(vcpu);
> >
> > I think this would fix the problem you're seeing without changing the
> > userspace view of an erroneous configuration. It would also pave the
> > way for the complete removal of the interrupt notification to
> > userspace, which I claim has no user and is just a shit idea.
>
> Yeah, looks like this ought to get it done.
>
> Even with a fix for this particular issue I do wonder if we should
> categorically harden against late initialization failures and un-init
> the vCPU (or bug VM, where necessary) to avoid dealing with half-baked
> vCPUs/VMs across our UAPI surfaces.
>
> A sane userspace will probably crash when KVM_RUN returns EINVAL anyway.

Thanks for the suggestion. Sure, I'll take another look at the
possible things that we can uninitialize and try to re-spin the patch.

Marc,

If you feel userspace_irqchip_in_use is not necessary anymore, and as
a quick fix to this issue, we can get rid of that independent of the
un-init effort.

Thank you.
Raghavendra

