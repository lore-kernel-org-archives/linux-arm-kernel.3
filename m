Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03C5CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 19:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTz2w5HL5Ejr50u7/poHpClQJimjVd3Gl5xrFoUqsig=; b=WEGXstfTQbJRkJWDH6O7l1PXTV
	33C7GUdxKP5zhDPYKpEa0bu1gg6lLeg5DLLxPVmoxn7+BCZRUyzm6mRTjlqbHIY/8WLzRZJiw15OK
	GUk0LcY6y6YaO9Z1LdHjO5VlftIEAxJZIt7sx9q+FGbe7M8v94+DHraTbP3ZbeVLOgY/W2iUvLah4
	8TWrxJrPRlLT5KbAlP8GT1IbY96eDUuJ1SiDv5JN33EYYKlbx5skm1kJuVnp8urF5CsvUjlBZTy/W
	drW1WjpKRs5BstohlGtzchTi2xTjYAdHCrymYuozTT4VKNWdTgntW45IlGxnzkREGakF4NZvkqmee
	vN9gZc1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIBSG-00000004LXj-28W9;
	Sun, 09 Nov 2025 19:52:04 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIBSD-00000004LXI-1xh9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 19:52:02 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4edb59dfda5so108891cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 11:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762717919; x=1763322719; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OTz2w5HL5Ejr50u7/poHpClQJimjVd3Gl5xrFoUqsig=;
        b=BVwXUS/Zn3lafy8vQpc2lznQXKqTSFNZQBXMfkOO99k/9EGCpKOw/NZoy+NnhKe3eT
         l2HAXOeD1WyM3tXLdDclBPzt7B6ZI6YgTN/UkMW/uc/6JfTj22Ki1ij9p9/9+WXK/DTr
         OVFOA8oRn4fUpuFCPOGR8NkReY5hnKEYynbp785COcwbhL1YZARsFRgUYk+F9IP5oXM7
         3a9r6088Kzpmh2+fjARqPxUne13tufmGUyAi1RcTFPC1yO/PDkC2V06CedJq5305W3wL
         HT67XwN9iv+UZBZnvYt9T954YiubC7r7flmZrka8fm3qm28NSlfZ3E1G6fl/WZQ1FKEg
         zztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762717919; x=1763322719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTz2w5HL5Ejr50u7/poHpClQJimjVd3Gl5xrFoUqsig=;
        b=RcPWFXhNZS0TkwL3T4p1Inaf/IrtH28XNGWNGid1XjjYT5WsmPkKu0CZHYFoLL6Zf2
         /gX8s97TiEqr4ootBrbCy0eUKyfRfOAPA1Qc/wxRDY4MWwDC49N8MZd/ztO1xZqRu+LC
         oAWjnPjY389YD/oyfoY6MRvOp++GDAZWq3k0ZqUfBvk6HQwIrd0XUFPVokm073kouzEa
         O9JeaxdldowKqfuOPU9/V9tfl/L9QqHayQmHg4LGHt48Fqf4pTZoTX+rGT5XOG+CJd26
         3ZV208nZSTrGR+XH8vETxwkZJwr9/nXJMDgX8B7+YBwMzlC2S+OGmby2HhfBm6Hh/fqY
         Wwlg==
X-Forwarded-Encrypted: i=1; AJvYcCUdcmO1Bsd4Tqfg39xxGq0uPezrdw94LyjaUIp1ag460TGwB7CcRh1wgSkZ1655epAEiT3tu8reWXgRdZvm5B15@lists.infradead.org
X-Gm-Message-State: AOJu0YyuNFAvitVK8F53iHEceqsPCbtXpcHQJoL0I7wI57GtsJC2+oHL
	nGOfGdGbv76Nnnbde3wFcE4ptK9t7jPagRtYHkWq19Uz8T9IFYsJPRA45G6hZZBrBzDdcIn5OL6
	xChKyFlYVjzuccOR6TGOsJ/sB4O7PwEkRtkLz4NAp
X-Gm-Gg: ASbGncvy3fsoFUtEVAO51g3l09su53vXSNUwOfvoP6F9j0PHZyse2IbRUDbRaS0s/zM
	d5ykkYkVWU2l6k0Fvhs/XNuVSx6yEUzcu4NdNjZ0bTgE8KlyH2aGheQT2A+FnyaCZerZRTCwe1G
	n1rCFO+pXSm5huA4LT3nx2/AbgKVf5weuuGnvR43znFIL0DZdCl+/S1bAbb06CxvpOFbJXKXTkj
	IMxaP5Y/FURyJB461UAiFf911/wDvxl3YCU5yU/PFrDYsZpQlut6a/ekGqHINBIiTJchnaDiCe0
	XfGMjg==
X-Google-Smtp-Source: AGHT+IEzuUR9i/DsGuyvuYeaAupJUFtq6EGjLuIkFDKVIxNAXIx7mqn/rwfeGhZP3dXd1KCbe5d7NKDzoF5DRNUbwMM=
X-Received: by 2002:a05:622a:647:b0:4b7:9a9e:833f with SMTP id
 d75a77b69052e-4eda64cfc84mr8262011cf.7.1762717919109; Sun, 09 Nov 2025
 11:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20251106144418.2847443-1-tabba@google.com> <20251106144418.2847443-5-tabba@google.com>
 <aQ5-9PsBl3z9UxOS@kernel.org>
In-Reply-To: <aQ5-9PsBl3z9UxOS@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 9 Nov 2025 19:51:21 +0000
X-Gm-Features: AWmQ_bk3SE5yKaL2J_2lYDxkTSfrEls5EHxjDwqy6OBdwXsyt8zhDrGNvTnT7Qc
Message-ID: <CA+EHjTyoi+fnw5o3F+J-qKFygKoXz6SKmBG5bS-d5mA0=ysYKg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] KVM: arm64: Prevent host from managing timer
 offsets for protected VMs
To: Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_115201_523330_1CD93957 
X-CRM114-Status: GOOD (  34.13  )
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

On Fri, 7 Nov 2025 at 23:21, Oliver Upton <oupton@kernel.org> wrote:
>
> On Thu, Nov 06, 2025 at 02:44:16PM +0000, Fuad Tabba wrote:
> > For protected VMs, the guest's timer offset state is private and must
> > not be controlled by the host. Protected VMs must always run with a
> > virtual counter offset of 0.
> >
> > The existing timer logic allowed the host to set and manage the timer
> > counter offsets (voffset and poffset) for protected VMs.
> >
> > This patch disables all host-side management of timer offsets for
> > protected VMs by adding checks in the relevant code paths.
>
> "This patch ..." is generally discouraged in changelogs, just state what
> you're doing in an imperative tone.

Ack.

> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/arch_timer.c | 18 +++++++++++++-----
> >  arch/arm64/kvm/sys_regs.c   |  6 ++++--
> >  2 files changed, 17 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> > index 3f675875abea..69f5631ebf84 100644
> > --- a/arch/arm64/kvm/arch_timer.c
> > +++ b/arch/arm64/kvm/arch_timer.c
> > @@ -1056,10 +1056,14 @@ static void timer_context_init(struct kvm_vcpu *vcpu, int timerid)
> >
> >       ctxt->timer_id = timerid;
> >
> > -     if (timerid == TIMER_VTIMER)
> > -             ctxt->offset.vm_offset = &kvm->arch.timer_data.voffset;
> > -     else
> > -             ctxt->offset.vm_offset = &kvm->arch.timer_data.poffset;
> > +     if (!kvm_vm_is_protected(vcpu->kvm)) {
> > +             if (timerid == TIMER_VTIMER)
> > +                     ctxt->offset.vm_offset = &kvm->arch.timer_data.voffset;
> > +             else
> > +                     ctxt->offset.vm_offset = &kvm->arch.timer_data.poffset;
> > +     } else {
> > +             ctxt->offset.vm_offset = NULL;
> > +     }
> >
> >       hrtimer_setup(&ctxt->hrtimer, kvm_hrtimer_expire, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HARD);
> >
> > @@ -1083,7 +1087,8 @@ void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu)
> >               timer_context_init(vcpu, i);
> >
> >       /* Synchronize offsets across timers of a VM if not already provided */
> > -     if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
> > +     if (!vcpu_is_protected(vcpu) &&
> > +         !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
> >               timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read());
> >               timer_set_offset(vcpu_ptimer(vcpu), 0);
> >       }
> > @@ -1687,6 +1692,9 @@ int kvm_vm_ioctl_set_counter_offset(struct kvm *kvm,
> >       if (offset->reserved)
> >               return -EINVAL;
> >
> > +     if (kvm_vm_is_protected(kvm))
> > +             return -EBUSY;
> > +
>
> This should be -EINVAL as pVMs do not even advertise the capability.
>
> Since we already have a generic helper for filtering KVM_CAPs, I'd
> prefer that we have a similar thing for enforcing ioctl limitations too.
>
> For example, you could maintain the ioctl => KVM_CAP mapping in a table
> and use kvm_pvm_ext_allowed() as the source of truth.

Yes, it makes more sense to consolidate these checks. Will do this
when I respin.

> >       mutex_lock(&kvm->lock);
> >
> >       if (!kvm_trylock_all_vcpus(kvm)) {
> > diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> > index e67eb39ddc11..3329a8f03436 100644
> > --- a/arch/arm64/kvm/sys_regs.c
> > +++ b/arch/arm64/kvm/sys_regs.c
> > @@ -1606,11 +1606,13 @@ static int arch_timer_set_user(struct kvm_vcpu *vcpu,
> >               val &= ~ARCH_TIMER_CTRL_IT_STAT;
> >               break;
> >       case SYS_CNTVCT_EL0:
> > -             if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags))
> > +             if (!vcpu_is_protected(vcpu) &&
> > +                 !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags))
> >                       timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read() - val);
> >               return 0;
> >       case SYS_CNTPCT_EL0:
> > -             if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags))
> > +             if (!vcpu_is_protected(vcpu) &&
> > +                 !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags))
> >                       timer_set_offset(vcpu_ptimer(vcpu), kvm_phys_timer_read() - val);
>
> Isn't there a general expectation that userspace not have access to the
> vCPU state of a pVM? That should be the mechanism of enforcement instead
> of special-casing these registers.

I thought I had a good reason for these checks, but now I cannot
remember what it was, nor can I see that there is a good reason, since
like you said, they are not accessible.

I'll remove them,

Cheers,
/fuad

> Thanks,
> Oliver

