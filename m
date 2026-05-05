Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96678FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 17:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3ZWo/jJEgMHbppCM8fWNjqKfThN79PtinobDbAzSRU=; b=eej19JyxywquScVibguU6fC8Qo
	RFyVhFCilJUwpSw4NbgUUXWhYDakhcD+PmeDHyMwsbzHGkbuZGNzYvYTKR3hYGA+YEjFJrmgyHRrd
	sqABEP6fobE4myrp8K/XjwDF6cH/bSsS/Xu28/a/WuZxwVSBBecrs/MtcLXriU0BQSd4OvzdOkXyC
	UG/+xIm9Wny7Po6pBfMmT8ah00hjrdK4nlszcXKNha4Ha/8YY6n/M29rMz1l/eeHrk/IRWkIGWk3z
	UQJF4uCeroi966jW2LxQnS0FxLUMvME4sBr9aJPymuNy09dtrgM1B0B0YRaUVps6q3VAvtHFzu7lw
	bzSD2fDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJCz-0000000GzpG-3ZB4;
	Tue, 05 May 2026 17:05:21 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJCx-0000000Gzmm-0ojl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 17:05:20 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-83603145987so1525359b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 10:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778000717; x=1778605517; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3ZWo/jJEgMHbppCM8fWNjqKfThN79PtinobDbAzSRU=;
        b=DjUqfN/Xd8iNiD4ehQfr6VfZOc5bIVZ8lZiVDGjZA3OkL69yACtWKgaVfJXPn5Rzsg
         QoK7/SswHgCpKa4qXTQBsLD1luqzrX0xu+xs5ciaDsFtLaxT+8qtqySFOJkPSydbxOBb
         YB2WhSrdBQ6BMbsdWwDgvZrmQ7HP8Yvz8GzjbPqz+/DfBbX39FzsfOXLNWsm2sr6k06t
         viP8Refk/YwcZ8YV4TZDKE+ntQR9OyHBtKG9XpmwWFaifATjFLMO+kL/z85ucgglA1os
         JXMsKTlXEM6RY35OfCgwxKPWDP+WM504SBejB7/LnrZCwA3k+viicT8LFj29vIdqBD8S
         SyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000717; x=1778605517;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m3ZWo/jJEgMHbppCM8fWNjqKfThN79PtinobDbAzSRU=;
        b=H8w+KjKfnu90q0JhrBQMUU/WpaojA1zVqVA4Ft/vMOPZhmaNkkKaE1D1N6LgPjUPLL
         wXGjhSIYUmDORF40TF+iPWIcknYVuqnrF+AvDYbdwEU+QyZ/SeUCYzFKu42e1PAocACq
         apv9/cjcirpT0k92BY0Pw7DQTa6N1Vxhbn22pIhUNzriTD1DkAmM6tZDq0iD6fsAmcgq
         PUAh75NO6ESC8Sf6M7F57B4sMvJN9IBKz3cG4loiSvpLnlIyMDkgqR6dcVvDcNtI9YO+
         X8n/eOMWicbzaN1osN3FbcRZ0epHiyCffJv2RYRfdI3r2qwNsVNxSvQzJ80c7oo3IZ4a
         OSgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8lTr7z5G4MJGI+oAl29faSbjHOOm7o9Yd9d9Uj4fbI9pozHFTqUkJoVqOl08jL96W+CI6s7fT7DKTfWQoUwin@lists.infradead.org
X-Gm-Message-State: AOJu0YxrkF6az79ceiaELMn++4NWxPksUI79QsSVexYdJ+asSxqIlCxJ
	YuNN0f9vTSXWHAjAaIwcvt589l26g/hq8/9SM3WxQEMPSmN1V86W8O2ZjaAsqFtC9/ccu8LHsJT
	1qH+ecw==
X-Received: from pfblm11.prod.google.com ([2002:a05:6a00:3c8b:b0:82c:e899:f089])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:368c:b0:82c:e1a3:986f
 with SMTP id d2e1a72fcca58-839247bfb7bmr3652379b3a.43.1778000717292; Tue, 05
 May 2026 10:05:17 -0700 (PDT)
Date: Tue, 5 May 2026 10:05:15 -0700
In-Reply-To: <20260504231048.1184273-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260504224213.1049426-2-jthoughton@google.com> <20260504231048.1184273-1-jthoughton@google.com>
Message-ID: <afohshVlK9YcBk-f@google.com>
Subject: Re: [PATCH 1/5] KVM: arm64: Grab KVM MMU write lock in kvm_arch_flush_shadow_all()
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: chenhuacai@kernel.org, gshan@redhat.com, jhogan@kernel.org, 
	joey.gouly@arm.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, maobibo@loongson.cn, 
	maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com, ricarkol@google.com, 
	shahuang@redhat.com, stable@vger.kernel.org, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, zhaotianrui@loongson.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_100519_240131_7C556C16 
X-CRM114-Status: GOOD (  27.26  )
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

On Mon, May 04, 2026, James Houghton wrote:
> On Mon, May 4, 2026 at 3:42=E2=80=AFPM James Houghton <jthoughton@google.=
com> wrote:
> >
> > kvm_arch_flush_shadow_all() may sometimes be called on the same `kvm`
> > concurrently in the event that the KVM's `mm` is __mmput() at the
> > same time that last reference to the KVM is being dropped.
> >
> > T1              T2
> > KVM_CREATE_VM
> >                 Get VM file from T1
> > close VM
> > exit_mm()       close VM
> >
> > T1: exit_mm() -> kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
> >     with only the KVM srcu read lock held.
> >
> > T2: kvm_vm_release() ---> mmu_notifier_unregister() ->
> >     kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
> >     again, with only the KVM srcu read lock held.
> >
> > This leads to a potential double-free of
> > kvm->arch.kvm_mmu_free_memory_cache and now with NV
> > kvm->arch.nested_mmus.

...

> >  void kvm_uninit_stage2_mmu(struct kvm *kvm)
> >  {
> > -       kvm_free_stage2_pgd(&kvm->arch.mmu);
> > +       lockdep_assert_held_write(&kvm->mmu_lock);
>=20
> *facepalm*.... this doesn't account for the other callers of
> kvm_uninit_stage2_mmu(). They will get lockdep warnings.
>=20
> I've attached a diff to the bottom of this reply that *does* deal with th=
em.
> :( Sorry.

...

> > diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> > index 883b6c1008fb..977598bff5e6 100644
> > --- a/arch/arm64/kvm/nested.c
> > +++ b/arch/arm64/kvm/nested.c
> > @@ -1190,11 +1190,13 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
> >  {
> >         int i;
> >
> > +       guard(write_lock)(&kvm->mmu_lock);
> > +
> >         for (i =3D 0; i < kvm->arch.nested_mmus_size; i++) {
> >                 struct kvm_s2_mmu *mmu =3D &kvm->arch.nested_mmus[i];
> >
> >                 if (!WARN_ON(atomic_read(&mmu->refcnt)))
> > -                       kvm_free_stage2_pgd(mmu);
> > +                       kvm_free_stage2_pgd_locked(mmu);
> >         }
> >         kvfree(kvm->arch.nested_mmus);
> >         kvm->arch.nested_mmus =3D NULL;
> > --
> > 2.54.0.545.g6539524ca2-goog
>=20
> And here is the diff that should fix this patch. (Sorry!!)

There are more issues.  kvm->arch.mmu.split_page_cache can be freed by
kvm_arch_commit_memory_region(), which holds slots_lock and slots_arch_lock=
,
but not mmu_lock.

IMO, the handling of kvm->arch.mmu.split_page_cache should be reworked.  I =
don't
entirely get the motivation for aggressively freeing the cache.  The cache =
will
only be filled if KVM actually does eager page splitting, so it's not like =
KVM is
burning pages for setups that will never use the cache.

Maybe I'm underestimating how many pages arm64 needs in the worst case scen=
ario?
(I can't follow the math, too many macros).  But if KVM is configuring the =
cache
with a capacity that's _so_ high that the "wasted" memory is problematic, t=
hen we
probably should we revisit the capacity and algorithm.  E.g. if KVM is spli=
tting
from 1GiB =3D> 4KiB in a single pass (I can't tell if KVM does this on arm6=
4), then
we could break that into a 1GiB =3D> 2MiB =3D> 4KiB sequence.

