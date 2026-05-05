Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E45FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 18:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQUZmjv7aHFLMaMFauN5kz/OKqGsuDJKsdlinZQqRbc=; b=wWOr3Kb0csGa7jmMyLCFyU2/Vn
	pgz7YLQLLU1fVs39/RlfUDa1QJ1/vWpZEnDcD13SHDC9Aot4iObE7fzuR9yIG7GQa9xhdLWYf8sJG
	SM/nem3LsstjctIMY/LpNBV0p6wgDllDhCVXrh9zaej3r79v9fyoXzm8z+zn0ASgoKxFzjSVIkd7x
	a6a5eEGJFHOGPXo7734WO888B0iSd4xrzo7gGtLcMLztVJlt5gpoLAQH37DI8OyLJ1AKIRidNUd1y
	JIWjIeRGzQgwT/Gj0/HwYZQkLlCgj/S/+RZgGuxEkRG3K1MOIXA2YVd2xT+UZaRWgWzn+Y5cICR39
	SSMSd6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKK5W-0000000H79Z-0wx8;
	Tue, 05 May 2026 18:01:42 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKK5T-0000000H78l-2aCq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 18:01:40 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-bba0dde4f43so876802266b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 11:01:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778004098; cv=none;
        d=google.com; s=arc-20240605;
        b=aR6crEYUnLh8DcrK4FynuSjAQp1P5Nv7Zr/K7zQHquMO8OzjA2lo9ukzKz3xLCEtPE
         ouYMws5pc0SJlKFWgu4TTptBGRRJOnnz2SVJb2GmO28ykbUcVOULhVuEPk6s48ctVOKX
         UJTA8HDBdWoBuTLQYFdYZMdk32KJoFP6KVfVvjBbNSkEcuBeegS3YPHew/w75velLA2f
         EalLkno7il8XuA3X/z+v8x+CyMLH6QjzWpTMzV6oFauLD6/PRuq4M5hA80+rzs+aHzqK
         JY+ZpwheJWP5CM1N1E+nadk3kTAVkPnXDgUq7GZ2M1PkwTe7Q4RvjUDO7CankL1KsQ9O
         qnAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nQUZmjv7aHFLMaMFauN5kz/OKqGsuDJKsdlinZQqRbc=;
        fh=OGqZsHKx9FI7H/1FWqPDgL83llwiVS0yC7WRRMQAn6s=;
        b=D2KD3FeNZ3nWPyXnDANu7c5a/WNFS4TXGXvYtLFdi/iUmzTWq14PdNjtpGhDWKuSuf
         o1tzFjvoMD4RtDw1CGWNnZPwgmmBls3OED8YpFZoGAn59jssRqj+OpILQcMQDx55dVD1
         Ee0qfd/JcqB/wX5hm1WdT8t9ss+EbIILjU6nEFeowvDPqZXwDti+Fda2HlOZtDseszXn
         r+zS3PTlDTescqTkvkgnnxD1IpRpdzNz4gnFWe6Dvzyeu0CasCWzx35fBo2QjIliohYc
         qyGqG05nHCeB556Jlc2/dmfWqAFjUESxHACK5V6KBkykGgENC/NwxmE7wi9ww79lTBY2
         02IQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778004098; x=1778608898; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQUZmjv7aHFLMaMFauN5kz/OKqGsuDJKsdlinZQqRbc=;
        b=Q1PU/PCSv4SGczIQRVbdyJZYAM3i64uTDDitekHMm0FWeSYucFU0Qj/KOjQvzdg7KO
         hXW+HgGsawWzOXBBlYWFgZUmS5COSPKdzbcDGjK1vUhUJ/oJDAvC22PjAdiq07TedyJo
         /PyeHeyygZbOpNQfd4IRrOaNaib3QQ9fQWK7btRzid8W8nxK6LQMB0dhGtO/ph/8SFmW
         6513HpOD68nJ6J+YvPKo9+FLkym1RLkv57yqD5QqVXmShJKiiVZDUSvUHzzyz/9vlvrI
         ZBV1CbSZ1su5uwQTYsiT+sGYRhDeWxcrTfNlaF8DRG/Pt78W53COupq50R7+1nZqLaD6
         cWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778004098; x=1778608898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nQUZmjv7aHFLMaMFauN5kz/OKqGsuDJKsdlinZQqRbc=;
        b=MFkrIiDwgKNmK/DbnqY6xh6POGqvQ1ViUSdApG/HqrFMzlpnxl87UzyQ6925IzqKp1
         zSCLs4kVudFVpEFo1d7z2oEt4blHqv5dLaMLG/jTvBBZP4MYXGuhV0RDr5rciYRUKjgI
         doAuOvtf0ZnAYh+ObKcPCP1KQH39kif9R5JQlyjO5CmrZtSVr0O+eL8tlPPjIefG8MiL
         pRVfJ2QvZnZEi3i0KiFoNPtD7uXniZoX0Xw0I8Gzky2ju3oIo1RoHVPCHUjBWClM9ojH
         zs7M6isk4IYZUlwdW9QzEdgJ48tzCEU5Qw6BQvTCIkqAVgRAJyh/jfL8C9d1vH2I0dGU
         02mw==
X-Forwarded-Encrypted: i=1; AFNElJ8PzOWy3sQ3u0xRbeB3nBr+lMVyrCPmY3pac39ki0EHrhZFl7TCWeo4ChC73e7S8lAxmnDFj/RQVQKHF925mrJl@lists.infradead.org
X-Gm-Message-State: AOJu0YxMrT9ptY/76rTVEKEv2ubW8+pNRrRJ2g6JjFg+bomSAK2CSfW/
	5789cnQeOIxHRLM6Aa9oAShkN/y7Om6N0em7xrDIxVPFra9uGAicN1P0dWRxCjQYxCjYG33U4cj
	9Ga11JyF6H5yHj5RH6qaC8Hz5rTvQL3yn8vBIj5ZV
X-Gm-Gg: AeBDievFN3b1lnVyfVO+mA9qhIVBBKaqM/wQiWpnU+DPvQ/9P4OXNhmo7A8CmmyOxgq
	XR4vx4lUg9gLZWLIBscDnMybwBfqbXzz76oK1tiUqVMlTs+agzQJ1Zev8yssznz4/Azf8MGE/KX
	7KR19mtwHgvn0e0TDSQP0XMWxuLqiVv6VlJRsAZHutG83Hd2otTCC3fQplTvm09RXLDWkDHl2P9
	Z4pHEY0bchyLU3lmwy7r0lrv/FtOnFfCJVU/KWMgky29MN7pccTV4XSiOc7m1KZoqPu53iITLRw
	faCh4iQnolYwiDqw5F9DDeOu4dnRW/4TYlo26WSd5DCG5LPp/yFpSZdFYMvi4fR+rfuJAVKi/Ys
	4g2Vn8KeR8c6W5AX/BYL9bbphNw==
X-Received: by 2002:a17:906:9f87:b0:ba7:cc67:488b with SMTP id
 a640c23a62f3a-bbffab33111mr887380266b.5.1778004097049; Tue, 05 May 2026
 11:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260504224213.1049426-2-jthoughton@google.com>
 <20260504231048.1184273-1-jthoughton@google.com> <afohshVlK9YcBk-f@google.com>
In-Reply-To: <afohshVlK9YcBk-f@google.com>
From: James Houghton <jthoughton@google.com>
Date: Tue, 5 May 2026 11:01:00 -0700
X-Gm-Features: AVHnY4J0Tr074uKX9gnTkNPmv46TNeS2NEyt9u-k5f94BeNvCS-2m8Zf89eFVRE
Message-ID: <CADrL8HX223b3YS8aHr7b=AZZ2J5ga+-SwLQX9Rs9Ep=rMM5wUA@mail.gmail.com>
Subject: Re: [PATCH 1/5] KVM: arm64: Grab KVM MMU write lock in kvm_arch_flush_shadow_all()
To: Sean Christopherson <seanjc@google.com>
Cc: chenhuacai@kernel.org, gshan@redhat.com, jhogan@kernel.org, 
	joey.gouly@arm.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, maobibo@loongson.cn, 
	maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com, ricarkol@google.com, 
	shahuang@redhat.com, stable@vger.kernel.org, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, zhaotianrui@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_110139_691129_011C19B6 
X-CRM114-Status: GOOD (  34.80  )
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

On Tue, May 5, 2026 at 10:05=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Mon, May 04, 2026, James Houghton wrote:
> > On Mon, May 4, 2026 at 3:42=E2=80=AFPM James Houghton <jthoughton@googl=
e.com> wrote:
> > >
> > > kvm_arch_flush_shadow_all() may sometimes be called on the same `kvm`
> > > concurrently in the event that the KVM's `mm` is __mmput() at the
> > > same time that last reference to the KVM is being dropped.
> > >
> > > T1              T2
> > > KVM_CREATE_VM
> > >                 Get VM file from T1
> > > close VM
> > > exit_mm()       close VM
> > >
> > > T1: exit_mm() -> kvm_mmu_notifier_release() -> kvm_flush_shadow_all()=
,
> > >     with only the KVM srcu read lock held.
> > >
> > > T2: kvm_vm_release() ---> mmu_notifier_unregister() ->
> > >     kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
> > >     again, with only the KVM srcu read lock held.
> > >
> > > This leads to a potential double-free of
> > > kvm->arch.kvm_mmu_free_memory_cache and now with NV
> > > kvm->arch.nested_mmus.
>
> ...
>
> > >  void kvm_uninit_stage2_mmu(struct kvm *kvm)
> > >  {
> > > -       kvm_free_stage2_pgd(&kvm->arch.mmu);
> > > +       lockdep_assert_held_write(&kvm->mmu_lock);
> >
> > *facepalm*.... this doesn't account for the other callers of
> > kvm_uninit_stage2_mmu(). They will get lockdep warnings.
> >
> > I've attached a diff to the bottom of this reply that *does* deal with =
them.
> > :( Sorry.
>
> ...
>
> > > diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> > > index 883b6c1008fb..977598bff5e6 100644
> > > --- a/arch/arm64/kvm/nested.c
> > > +++ b/arch/arm64/kvm/nested.c
> > > @@ -1190,11 +1190,13 @@ void kvm_arch_flush_shadow_all(struct kvm *kv=
m)
> > >  {
> > >         int i;
> > >
> > > +       guard(write_lock)(&kvm->mmu_lock);
> > > +
> > >         for (i =3D 0; i < kvm->arch.nested_mmus_size; i++) {
> > >                 struct kvm_s2_mmu *mmu =3D &kvm->arch.nested_mmus[i];
> > >
> > >                 if (!WARN_ON(atomic_read(&mmu->refcnt)))
> > > -                       kvm_free_stage2_pgd(mmu);
> > > +                       kvm_free_stage2_pgd_locked(mmu);
> > >         }
> > >         kvfree(kvm->arch.nested_mmus);
> > >         kvm->arch.nested_mmus =3D NULL;
> > > --
> > > 2.54.0.545.g6539524ca2-goog
> >
> > And here is the diff that should fix this patch. (Sorry!!)
>
> There are more issues.  kvm->arch.mmu.split_page_cache can be freed by
> kvm_arch_commit_memory_region(), which holds slots_lock and slots_arch_lo=
ck,
> but not mmu_lock.

Thanks. I also noticed that kvm->arch.mmu.split_page_cache is
documented as being protected by kvm->slots_lock; we should be holding
it here. But we cannot take it here because we are already holding the
KVM srcu lock.

> IMO, the handling of kvm->arch.mmu.split_page_cache should be reworked.  =
I don't
> entirely get the motivation for aggressively freeing the cache.  The cach=
e will
> only be filled if KVM actually does eager page splitting, so it's not lik=
e KVM is
> burning pages for setups that will never use the cache.
>
> Maybe I'm underestimating how many pages arm64 needs in the worst case sc=
enario?
> (I can't follow the math, too many macros).  But if KVM is configuring th=
e cache
> with a capacity that's _so_ high that the "wasted" memory is problematic,=
 then we
> probably should we revisit the capacity and algorithm.  E.g. if KVM is sp=
litting
> from 1GiB =3D> 4KiB in a single pass (I can't tell if KVM does this on ar=
m64), then
> we could break that into a 1GiB =3D> 2MiB =3D> 4KiB sequence.

I'm not sure I've fully understood the point you're making, but I
*think* we can just drop the
    kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
line from kvm_uninit_stage2_mmu(). It will get freed when the VM is
destroyed anyway.

So I'm thinking of splitting this patch into two (unless someone tells
me otherwise):

1. Drop the kvm_mmu_free_memory_cache() from kvm_uninit_stage2_mmu()
    Fixes: e7bf7a490c68 ("KVM: arm64: Split huge pages when dirty
logging is enabled")

2. Grab the MMU write lock around the kvfree(nested_mmus) bit in
kvm_arch_flush_shadow_all(); do the kvfree() without holding the the
lock.
    Fixes: 4f128f8e1aaac ("KVM: arm64: nv: Support multiple nested
Stage-2 mmu structures")

