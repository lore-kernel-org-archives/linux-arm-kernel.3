Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A237CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 20:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOAwuyt3rtVWRkmVcOSIKCDRqR2NsdJAT4GPMkewjlg=; b=yirnYG2SnVOhmTg9LhONSr7nbM
	1O4NCis0KIcPRtceolR48hGOxgVu0kG9VqSACe2/RBmPJFFwuQiOlvKg5xucgdKvM7bpLKO9vO0cO
	iEhFdTCXqhRSd5dvO8Ws5NlwpeIRidZNesGxjYYBW+NUFZ6mIwUe0DIu5b143uvVhV7nUeSmnld76
	bSj8AJhRxxkVRya8uVflt1INi8NfieF7g7iZi0CwPr/VBWFlwMuT60esvNfyseusmOZ3FstP7Hl7h
	jRp0dhQdriSN2tk20YUueCBTeGMwwDjFgAPTsPqIRwCr7C2tUolMdyHKmSr6/1j2gSRHGY4n1Bk1T
	pBaq8IXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKMAG-0000000HOvA-19h2;
	Tue, 05 May 2026 20:14:44 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKMAE-0000000HOuW-1ipy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 20:14:43 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2b2e06219cbso46617185ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 13:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778012080; x=1778616880; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOAwuyt3rtVWRkmVcOSIKCDRqR2NsdJAT4GPMkewjlg=;
        b=QY2G51YnvrJVS3GKr29e34bzQ6lt1V1f+VxmgSSgNVcOUJtRDJlMq7MuE5pUVZTKM0
         2+gQZbLvwVZKbzvKdq1tntQCprqs5cT3QJifJ9llBpVp0cWl+Dkr/4fVFN+u2JZObNQq
         MIcsefrP8n5qBqn+yCp3Y1vWsUFpFskkG2WIaOqQBa8bvYFZ4+Zz8lmV/piiIdQcSi0Q
         3Oi32TRula1kZvpUbF0RSrup0m6EaPjhSW6CmjhZwxBlITZG4AZtSfB6pz7l7Q0lUemp
         5DhZ2qH0uljMozk/ob1qiRz4bhAFHVuT0s2lDUZtURxv7G24Y5xSbExp3fuBzPnJqH9d
         I8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778012080; x=1778616880;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FOAwuyt3rtVWRkmVcOSIKCDRqR2NsdJAT4GPMkewjlg=;
        b=NHo4ExTO/Q17/HI8o9kgXz4aXmmBMUQ4jdf1pAf7mVM89pTiBaYjrAgcyOpKlrLW7o
         vvG7r+p1PuR+tf55PFHy+aho/cCp77W9DysMkkTEeO9qelem+pCP2Jwqc6AH02nG9lfC
         4qP9PzAG3qHDMVDyS49zT60Wc+9TXJbQbFEEqXK3mc3yN8Jbz2JEgypH+/qgQgt49Z6s
         fpOtOl05K9NdMljjR6urhGS89xqJIsnNJboFpxj7LfgnOGoZFDfmdSzUxoU/WImrc10B
         Hp23zhjh130LQaYNJecXnyjH4kbdiSDnrKAniDBBTZZBluuWfSRHeyeLVcgp/J6IqB89
         w4Eg==
X-Forwarded-Encrypted: i=1; AFNElJ/fSfVS6vTZOD4SXYR2MkxS+2xAlVTMUnxn8tWsaJt3/oky+rEvvCJFvb18X64a1WBmlgafFd5rw26GIILUzVe5@lists.infradead.org
X-Gm-Message-State: AOJu0YyRsLxTYc5Q5+0IwLZz/5a8ilSPZeMyTCX2HWmjwnk+IGcm8Twj
	Fu0GnEk7Nigv0ycZIQtvoN5Whg5yKR7IRDckIokSWDAMfyi4sXA8R/0nXOhghDyoY3aKQGoCxOF
	0bZ6c2A==
X-Received: from pgmt3.prod.google.com ([2002:a63:2243:0:b0:c73:fc44:8bb5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7d9c:b0:39f:27ab:2454
 with SMTP id adf61e73a8af0-3aa5ab17b2bmr365628637.49.1778012080089; Tue, 05
 May 2026 13:14:40 -0700 (PDT)
Date: Tue, 5 May 2026 13:14:39 -0700
In-Reply-To: <afo0Er7R4MnMP0MB@google.com>
Mime-Version: 1.0
References: <20260504224213.1049426-2-jthoughton@google.com>
 <20260504231048.1184273-1-jthoughton@google.com> <afohshVlK9YcBk-f@google.com>
 <CADrL8HX223b3YS8aHr7b=AZZ2J5ga+-SwLQX9Rs9Ep=rMM5wUA@mail.gmail.com> <afo0Er7R4MnMP0MB@google.com>
Message-ID: <afpPr-a00an1v6mZ@google.com>
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
X-CRM114-CacheID: sfid-20260505_131442_451857_084D49BC 
X-CRM114-Status: GOOD (  35.19  )
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

On Tue, May 05, 2026, Sean Christopherson wrote:
> On Tue, May 05, 2026, James Houghton wrote:
> > On Tue, May 5, 2026 at 10:05=E2=80=AFAM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > > There are more issues.  kvm->arch.mmu.split_page_cache can be freed b=
y
> > > kvm_arch_commit_memory_region(), which holds slots_lock and slots_arc=
h_lock,
> > > but not mmu_lock.
> >=20
> > Thanks. I also noticed that kvm->arch.mmu.split_page_cache is
> > documented as being protected by kvm->slots_lock; we should be holding
> > it here. But we cannot take it here because we are already holding the
> > KVM srcu lock.
> >=20
> > > IMO, the handling of kvm->arch.mmu.split_page_cache should be reworke=
d.  I don't
> > > entirely get the motivation for aggressively freeing the cache.  The =
cache will
> > > only be filled if KVM actually does eager page splitting, so it's not=
 like KVM is
> > > burning pages for setups that will never use the cache.
> > >
> > > Maybe I'm underestimating how many pages arm64 needs in the worst cas=
e scenario?
> > > (I can't follow the math, too many macros).  But if KVM is configurin=
g the cache
> > > with a capacity that's _so_ high that the "wasted" memory is problema=
tic, then we
> > > probably should we revisit the capacity and algorithm.  E.g. if KVM i=
s splitting
> > > from 1GiB =3D> 4KiB in a single pass (I can't tell if KVM does this o=
n arm64), then
> > > we could break that into a 1GiB =3D> 2MiB =3D> 4KiB sequence.
> >=20
> > I'm not sure I've fully understood the point you're making, but I
> > *think* we can just drop the
> >     kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
> > line from kvm_uninit_stage2_mmu(). It will get freed when the VM is
> > destroyed anyway.
>=20
> It's not that simple.  KVM arm64 allows userspace to reconfigure the capa=
city of
> the cache via KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE.  kvm_vm_ioctl_enable_ca=
p()
> currently allows userspace to do that so long as there are no memslots.
> __kvm_mmu_topup_memory_cache() will (rightly) yell and fail if it's calle=
d with
> the "wrong" capacity, so we'd need to sort that out.
>=20
> The other issue is that it's not clear to me what happens for large "chun=
k" sizes.
> If KVM is splitting from 1GiB (or whatever huge-hugepage sizes are suppor=
ted on
> arm64) all the way to 4KiB, e.g. to optimize against break-before-make, t=
hen the
> capacity of the cache could be significant, e.g. MiB of memory or worse. =
 My read
> of things is that purging the cache when dirty logging is disabled is a g=
uard
> against consuming too much memory when the chunk size is large.

If we go down the "let's simplify things" path, one way to simplify the han=
dling
of KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE would be to disallow changing the chu=
nk size
once the cache has been used.  That would allow deferring teardown of the c=
ache
until VM destruction.

diff --git arch/arm64/kvm/arm.c arch/arm64/kvm/arm.c
index 176cbe8baad3..671f7ac5e31d 100644
--- arch/arm64/kvm/arm.c
+++ arch/arm64/kvm/arm.c
@@ -165,7 +165,8 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
                 * To keep things simple, allow changing the chunk
                 * size only when no memory slots have been created.
                 */
-               if (kvm_are_all_memslots_empty(kvm)) {
+               if (kvm_are_all_memslots_empty(kvm) &&
+                   !kvm->arch.mmu.split_page_cache.capacity) {
                        u64 new_cap =3D cap->args[0];
=20
                        if (!new_cap || kvm_is_block_size_supported(new_cap=
)) {


