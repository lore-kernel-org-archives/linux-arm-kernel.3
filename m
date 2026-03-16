Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D8EF53D81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2B/Hw24N6OrkUr4MKnYANAo96l5CjLsjEOK0CMTu1R8=; b=AtRbYqRUE1XKsnHNfYWbWHP1CG
	dPM0skz67/kh7XOFmoEWzCVGpvdt+na2NLQeBulHltWo6Gf8RQZrKSnyjundHtGKqg0yr6741zPi0
	CaKUKTn+3ZEtK9hZJMF0fjG+gfIGz7ouw4lG+kueCJcKfGZu91P3npd2K05wDUSZfHV9iW/dxnlc5
	E2NRefnTzrypPayGdZoF2txwEFcZYYDojVakEd0Jj7kK/cg5QgnC281FNHwRHuXzCSEHk6cdxBQPw
	fLH4CwGkQIG86b6kYTbHI7TZY/53ztF+8tslG2lBnk7qhZHow3p8GIEMiscD5GeEpre2r5C6Ydjht
	jd3a+CxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bvf-00000004b3z-0eac;
	Mon, 16 Mar 2026 17:40:35 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bvd-00000004b3a-1HEf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:40:34 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-509069a7a7fso62841cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 10:40:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773682832; cv=none;
        d=google.com; s=arc-20240605;
        b=TXemEA2A3ykPfAFUZnpJD5fq/IlnoowbGSIRA6a9pY8l9moerwpp4bsBRqBmUXK0OT
         ZSYMtXy+U4q6ZIa4Govoik1t4/JHXpoUzv/BAIrHlHqeheXlgIXH/6Z0E+oR3O4zRbjR
         yed/gobDW7aNi1RV06tNHjQ1Qsc9HC7ALR4gSMXu/O8DI25TqORR6aVZYP3G/Zdvk6Ki
         hs0JrSgBiawW+dY8+f6ozXWcaI+N6jSeAMuOIdP5NUL0iGVFvN9jw3GhvAsL2irtJOmP
         72eccEVSdSPBngu0oyN62c3iEY5FsIkwh93I5vLaM61z725kzFEe0khNu5tVC05JJFdh
         fGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2B/Hw24N6OrkUr4MKnYANAo96l5CjLsjEOK0CMTu1R8=;
        fh=p2KCluBia5LdvxVRhktEm/M/JKxPRFWmkJCiVPysfVw=;
        b=K789OntKeq+aLhHvumK6Vq2Iz7q3vgf4fVVhJokdl1we/6px+bTs/gRjr5UgnZwAKm
         pr+h/ug6wRSp81NtqFy7VndIZJN+PfcnoMcXYx4TdV0icNwpb1z25MVzUDFd+kurOach
         VqctEeQoWZ2z7L/zY6C8/veUtwzP3SJElB12ehhnRJUv+Xavgm6f1eNvilgse+0jZe/o
         lPsQhkyz8zVAkvUhnYJLilGDvnH1IwHlQ7rwdNC8yS6L1bmMMLmZhAcyjQXQNcGn4iWH
         5qviUYn+81qrRGj4v7qu2yX1lxY1rzbigpS+9ZVuDTH9VIsd6hZxEd7Ih4nUASRjITLe
         wfQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773682832; x=1774287632; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2B/Hw24N6OrkUr4MKnYANAo96l5CjLsjEOK0CMTu1R8=;
        b=U94yE8hdx/j9OwvRYOWVmUvJ4URESh/xGr6Zq2jUCjR13WWZmYEAXTiWPRxBwqaqhX
         qjjtp+8bjqjAeMXTC5Sm8/PGfHB2+Yoa/Jqo9kiYhYwPiaHOljLHo1slxshcS596YSRo
         5tIEFRFRnCt7fKq2eHogtJJdbuWBGxj2guWsLiUQEzgpKmVlW3URtMvAVU/MDpGH5MNL
         rKm30+2B/LAdtdnMhIg6qAG2GpUxHKs4u+hO66/eh2x50hjHDOrfrTmmUa9exz6x2q/7
         Mn3wQPVjDG0KPKcuUQ6Eplck/25qwa+va0PXVz2VrWUfRcANe/0zbJzOo91oTMh0u94x
         uPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682832; x=1774287632;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2B/Hw24N6OrkUr4MKnYANAo96l5CjLsjEOK0CMTu1R8=;
        b=Yw9RQJdFGJ/Av6JYkYXXM5US26KiyDtzIAWEx7M6rwvffx5ea5s9opF7s3zTmLGBOz
         YNdxiYAnN0L7YSt6XUw3VcN5HAxdmFEDkC49iiLzzo2yXkryarizW7u4iQnPE/HXuxJ2
         24xYQKB1nq4C/tbVN42EJlAgbkg0kCKUk/+pVIcIyNTRFnLkEhJ4im8/xnr7suId/iv9
         pDQ8oPCy9dm79zCNuZAg8c/V1xc3OaGC/dvQ0OBsEun0akZ5gczF9tTOe6BYtQWcywWu
         vJm/t/PsrUTc9UQLBlwCYs8e61dhb28DVAmJ2sjZ771JcSwVy8KdbKSU8GpJHIy42zzL
         0d6w==
X-Forwarded-Encrypted: i=1; AJvYcCUGqOpm45lIfmNN40IP9VDzakL/MGokyU9bcxhk0EyVl3Pufrbjm8fQ2ehtno6PbEnaIh5uCtKYttmihrp1ZTG7@lists.infradead.org
X-Gm-Message-State: AOJu0YzYNgqwbcG5JNofeX6jg/Db9Sz0G4KrEQKuM4Cu6IYBtxAMR9Z6
	L+bt1cQTY7XsWDxCWwNO1MpQNgguEX/Klkwraj/RZtK1an0woMm+5k+Cq9SWjLKK++QoNzbQwDO
	QKINFiwxBD8Qek8FhmpljxYoPbf4rc+Gqs0e/DZ3O
X-Gm-Gg: ATEYQzyQEj5ClePAZ3k+zQD7vXTpdKdx9rZkaMU9cQ+YdCUM1fVt7satOt4OxoIUrlT
	AZMaK7jOLH5wGg5QoQvxxuUFxeMXjyElpMZDQb8xApFKSXH4mkeUF/4sq9C/suvo7hQtbP96V+o
	jvNk09q8fhSn26uTVgSu0s2E1MwB5LHrwRdoysRHt4VTeXYjuZYnp2DMQr06OcDwFdQLePmjb4O
	tCWV7rpCCkHW9ySOkhO4lRWBW5lgO9jvuc4TWgVomLcwWNvcjBfrtQR+qN4q3FywzHdn7EBT+sz
	txSTvxkV
X-Received: by 2002:a05:622a:19a2:b0:506:9852:75ec with SMTP id
 d75a77b69052e-50998e55e96mr506131cf.9.1773682831265; Mon, 16 Mar 2026
 10:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
In-Reply-To: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 16 Mar 2026 17:39:54 +0000
X-Gm-Features: AaiRm51MmyCvtm_bSDH6RlSuyxS1mhei1yUIraU7TS88YvROq1cCmUBLQf9Svp4
Message-ID: <CA+EHjTz6yJeEj4NT3N7iti03HruaTncKuAiwxR7nqkp=twgAHw@mail.gmail.com>
Subject: Re: [PATCH 00/10] KVM: arm64: Adopt scoped resource management
 (guard) for EL1 and EL2
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <linux-arm-kernel@lists.infradead.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <kvmarm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_104033_383774_9D22C194 
X-CRM114-Status: GOOD (  28.25  )
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

Hi again,

On Mon, 16 Mar 2026 at 17:35, Fuad Tabba <tabba@google.com> wrote:
>
> Hi everyone,

This was my first time using b4, and I thought it would strip the
Change-id's, and this was supposed to be a "reflect" run, but
obviously something went wrong there :)

Other than that, this series is ready for review. Sorry for the Change-id n=
oise!

Cheers,
/fuad

>
> I stumbled upon a lock leak while reviewing Sebastien's recent GIC Harden=
ing
> series [1] on an early error path. It reminded me that we've run into thi=
s exact
> kind of bug pretty often while working on pKVM. Since we're going to be
> hopefully upstream even more pKVM code soon, I'd like to try and fix this
> pattern once and for all.
>
> This series refactors a good chunk of KVM/arm64 codebase=E2=80=94covering=
 both the host
> at EL1 and the hypervisor at EL2=E2=80=94to use the guard() and scoped_gu=
ard() macros
> from <linux/cleanup.h>.
>
> By tying our locks to the scope:
> - We can safely use early returns (like return -EINVAL;) without accident=
ally
>   leaking locks.
> - We can get rid of a lot of tangled goto exit labels.
> - Reviewing patches gets a lot easier since we don't have to mentally tra=
ck lock
>   states across giant functions.
>
> A common concern with these RAII-style macros is that they might bloat th=
e
> generated assembly. However, looking at the compiled code, it actually do=
es the
> opposite. As an example, looking at the EL2 object file
> arch/arm64/kvm/hyp/nvhe/pkvm.nvhe.o before and after this series:
> - Instruction count: Dropped by 39 lines of assembly.
> - .text segment size: Shrank by 166 bytes.
>
> This happens because the compiler no longer has to generate dedicated bra=
nch
> targets for exit blocks, nor the stack frame unwinding jumps just to call
> hyp_spin_unlock. It just efficiently inlines the unlock instruction right=
 where
> the return happens.
>
> The series is split into two parts:
> - Patches 1-5 (EL2): Adds the DEFINE_LOCK_GUARD_1 wrapper for hyp_spinloc=
k and
>   cleans up the nvhe/ directory.
> - Patches 6-10 (EL1): Cleans up manual mutex_lock and spin_lock calls acr=
oss the
>   standard KVM host code (mmu.c, arm.c, psci.c, reset.c, pkvm.c).
>
> There are definitely other parts of the KVM codebase that could benefit f=
rom
> this (especially the vGIC), but I'm stopping here for now to see what eve=
ryone
> thinks of the approach before touching anything else.
>
> Based on Linux 7.0-rc3.
>
> Cheers,
> /fuad
>
> [1] https://lore.kernel.org/all/CA+EHjTy051kjdReuESmk3HpMsBEW=3Ds3DxhJXa8=
vQJFHz--wG2Q@mail.gmail.com/
>
> To:
>
> ---
> Fuad Tabba (10):
>       KVM: arm64: Add scoped resource management (guard) for hyp_spinlock
>       KVM: arm64: Use guard(hyp_spinlock) in page_alloc.c
>       KVM: arm64: Use guard(hyp_spinlock) in ffa.c
>       KVM: arm64: Use guard(hyp_spinlock) in mm.c
>       KVM: arm64: Use guard(hyp_spinlock) in pkvm.c
>       KVM: arm64: Use guard(mutex) in mmu.c
>       KVM: arm64: Use scoped resource management in arm.c
>       KVM: arm64: Use guard(spinlock) in psci.c
>       KVM: arm64: Use guard(spinlock) in reset.c
>       KVM: arm64: Use guard(mutex) in pkvm.c
>
>  arch/arm64/kvm/arm.c                       |  53 +++++--------
>  arch/arm64/kvm/hyp/include/nvhe/spinlock.h |   5 ++
>  arch/arm64/kvm/hyp/nvhe/ffa.c              |  86 +++++++++-----------
>  arch/arm64/kvm/hyp/nvhe/mm.c               |  37 +++------
>  arch/arm64/kvm/hyp/nvhe/page_alloc.c       |  13 +--
>  arch/arm64/kvm/hyp/nvhe/pkvm.c             | 122 ++++++++++++-----------=
------
>  arch/arm64/kvm/mmu.c                       |  95 +++++++++-------------
>  arch/arm64/kvm/pkvm.c                      |  19 ++---
>  arch/arm64/kvm/psci.c                      |  19 ++---
>  arch/arm64/kvm/reset.c                     |   8 +-
>  10 files changed, 182 insertions(+), 275 deletions(-)
> ---
> base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
> change-id: 20260316-tabba-el2_guard-2f7e3fa06f69
>
> Best regards,
> --
> Fuad Tabba <tabba@google.com>
>

