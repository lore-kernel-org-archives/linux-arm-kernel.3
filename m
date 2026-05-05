Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7F9FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 18:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luNYyBAnxJ4nZFqNusK+zieJvfObwASYFJHRx4I4bUc=; b=Ivv9U6HG3u63gsXCOTgy9KTn3j
	NxBaxqtwrPL1bX9Zc7qSHv81qisynb6TiSDKD4oS4tUrgJe6PuwPjn3os9lECfEirwjLJl5VosN01
	SnnAA/p15r8jqrp1pA0SwjSBnqVNUTd9OeC8qpU3W2kE/woNt8YIVuZ2PP4Qmvj24EINQe8sH0x4t
	eeawQH4FTBQMJuLTRKJlq5Ksd2QgIb7FZkLKU4dojiBSNFf8NbneZi5aa0kuAc8rMJOwtyc60ltKx
	muS2M3cF0uNinAwCCTrtqJp2vGcHscbXH/2UHqcpphQj/vETjYWCmSjsEhfGAMNLPsvhfY6yu0Umc
	880gVljA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKKF-0000000H8sq-1Jpu;
	Tue, 05 May 2026 18:16:55 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKKC-0000000H8s6-3hYG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 18:16:53 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b461b36990so61426675ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 11:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778005011; x=1778609811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luNYyBAnxJ4nZFqNusK+zieJvfObwASYFJHRx4I4bUc=;
        b=AI4S+KQh31jXuYt2F785Rrkfor/MaaBCbwO86EKl/IgDnwTCrmqy4GP7VmAHNYgik2
         wLPndFLaQ0C/ZZFQ19MqWWDb8WvJAgsMnaRaWmWOSxNqMTlJkJqldr0qRdMwUHks2sOw
         pSvcuBwIozrGRLrXtaQIzKBjL/9iNAUztTQh+fQTf7gUBhWN7BVVni4SJiyWHMZHR9gp
         Ykf/jWbraJ+FDaOdIYa2NzZmW19Zv/uukJZmWZ+xeI/qpynJx9letbUirXDjD3aMBc/x
         bbGC56UbfInqWJL1bgyU+no2Zod/PUPgytzmNkaRHI40wW9/YKKM5PpFxXm2j2Ysqma3
         wmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005011; x=1778609811;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=luNYyBAnxJ4nZFqNusK+zieJvfObwASYFJHRx4I4bUc=;
        b=Epp0MLCH/ldqAMnyl54yTHrnPRuD2NjAvhZCU52aWpysoUYMMZNOZ0I/nxOl8WP1hw
         Qjv1RQHmAiJD5w1nGOUDI/1DW/qcRm4OpVxNjGZNhBhN16tg0GX07/717X2vK0cWyCcH
         ERUa2f2Y66kA0l0aBkXbOaGWaNs/VhWAjxGnBQwRon26NNug/RRISKw9nGZhYWeyPE6A
         fsXqvTB08RcTxSO9qEU2uhmDJrFEVWuIoPpaC947Lh/R7LsaPMct3HQhACuxe2oHhSVj
         nfwB1VgUBzL1reJvJ2JVLH0XnZVA3axU5MTwRYsh2aENxs8y9XRuC5ibEv6HcOxVsxw9
         ejgw==
X-Forwarded-Encrypted: i=1; AFNElJ9ELhLLiGtdPnkmJLPZPFqxFpTcHznxsHOJbRLByrFGgawrIHszDupoCDVT7uttwwejiZQooJeg3cLbDpoZlz56@lists.infradead.org
X-Gm-Message-State: AOJu0YyFXwrGc3IYpUAadNgv/H/Nm5nlPvyZZAbqa5cUAfgMdT6uPEYY
	t5bcuRMCeUlKVoUXBDX80GubWY45YOVBQ+SE3VaLmojamlx0Sa8KvY1wS0nP+vftPmPGSl9g13d
	2Z2DYdg==
X-Received: from plof8.prod.google.com ([2002:a17:902:8608:b0:2b2:5117:a3f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b03:b0:2b9:ff02:a15a
 with SMTP id d9443c01a7336-2ba794c3003mr848615ad.9.1778005010714; Tue, 05 May
 2026 11:16:50 -0700 (PDT)
Date: Tue, 5 May 2026 11:16:50 -0700
In-Reply-To: <CADrL8HX223b3YS8aHr7b=AZZ2J5ga+-SwLQX9Rs9Ep=rMM5wUA@mail.gmail.com>
Mime-Version: 1.0
References: <20260504224213.1049426-2-jthoughton@google.com>
 <20260504231048.1184273-1-jthoughton@google.com> <afohshVlK9YcBk-f@google.com>
 <CADrL8HX223b3YS8aHr7b=AZZ2J5ga+-SwLQX9Rs9Ep=rMM5wUA@mail.gmail.com>
Message-ID: <afo0Er7R4MnMP0MB@google.com>
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
X-CRM114-CacheID: sfid-20260505_111652_929339_91579154 
X-CRM114-Status: GOOD (  25.76  )
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

On Tue, May 05, 2026, James Houghton wrote:
> On Tue, May 5, 2026 at 10:05=E2=80=AFAM Sean Christopherson <seanjc@googl=
e.com> wrote:
> > There are more issues.  kvm->arch.mmu.split_page_cache can be freed by
> > kvm_arch_commit_memory_region(), which holds slots_lock and slots_arch_=
lock,
> > but not mmu_lock.
>=20
> Thanks. I also noticed that kvm->arch.mmu.split_page_cache is
> documented as being protected by kvm->slots_lock; we should be holding
> it here. But we cannot take it here because we are already holding the
> KVM srcu lock.
>=20
> > IMO, the handling of kvm->arch.mmu.split_page_cache should be reworked.=
  I don't
> > entirely get the motivation for aggressively freeing the cache.  The ca=
che will
> > only be filled if KVM actually does eager page splitting, so it's not l=
ike KVM is
> > burning pages for setups that will never use the cache.
> >
> > Maybe I'm underestimating how many pages arm64 needs in the worst case =
scenario?
> > (I can't follow the math, too many macros).  But if KVM is configuring =
the cache
> > with a capacity that's _so_ high that the "wasted" memory is problemati=
c, then we
> > probably should we revisit the capacity and algorithm.  E.g. if KVM is =
splitting
> > from 1GiB =3D> 4KiB in a single pass (I can't tell if KVM does this on =
arm64), then
> > we could break that into a 1GiB =3D> 2MiB =3D> 4KiB sequence.
>=20
> I'm not sure I've fully understood the point you're making, but I
> *think* we can just drop the
>     kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
> line from kvm_uninit_stage2_mmu(). It will get freed when the VM is
> destroyed anyway.

It's not that simple.  KVM arm64 allows userspace to reconfigure the capaci=
ty of
the cache via KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE.  kvm_vm_ioctl_enable_cap(=
)
currently allows userspace to do that so long as there are no memslots.
__kvm_mmu_topup_memory_cache() will (rightly) yell and fail if it's called =
with
the "wrong" capacity, so we'd need to sort that out.

The other issue is that it's not clear to me what happens for large "chunk"=
 sizes.
If KVM is splitting from 1GiB (or whatever huge-hugepage sizes are supporte=
d on
arm64) all the way to 4KiB, e.g. to optimize against break-before-make, the=
n the
capacity of the cache could be significant, e.g. MiB of memory or worse.  M=
y read
of things is that purging the cache when dirty logging is disabled is a gua=
rd
against consuming too much memory when the chunk size is large.

