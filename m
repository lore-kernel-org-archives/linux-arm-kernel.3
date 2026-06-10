Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA17CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 16:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fY+/iwaOPYWuto/d+Egk+UNuK/OHewkC2tBLDoQLz7I=; b=xbpRptYfq2vVLNX7LJYe3mAW7u
	Ud8qZyBNXi7wAhLrSbPiiFk+m8eadgR7znUEy58ivau2hcPsFBY/41QnT8r0AxRPl7leD7fnGS4Y1
	LVtYnqxH/P2Ap7MDCk6TnleljypyQB9DVrl2hurD09BlbmxyakbZWNEgrkpF6nioo8r8tarDW84Ij
	pg/QX/cEkE1cYZjNKEl6npYHO2hF58HJ2OJe7jnwmStO1Sriq/J2R+LcgiRRwxDBD6qKTUoDwiveL
	pe7JdR5Ph9r1Ct8d36cBcMi4spjDIHvrCBvPtm341B5KNzyrYErMbhPiERAemeceZRj0PgTyvMNeG
	bhIVH1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXLyE-000000088PU-3UnT;
	Wed, 10 Jun 2026 16:40:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXLyD-000000088Ox-0xQv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 16:40:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C9350601E2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 16:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC081F0089A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 16:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781109599;
	bh=fY+/iwaOPYWuto/d+Egk+UNuK/OHewkC2tBLDoQLz7I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OvMH6ICwhQKkIUGA+edTgG0PKBmg5SlpfwOfYZ34l99VedDIaip3L+7MVDvXeCWtt
	 g6U+cI5bZoe9q0fCZEtjBzOHV3t6rRmH35PBUegQ8cs4IM6bmf/NfyuAm+3cWKMGmm
	 nOcq1MRjcvSMKNHpJbT4mB1RI3qUGDFgHOUrHN+1t4/pCHrzVOvsNhuMMPTrN4G8mg
	 XScp2AqXA3lTp3p8oqqznFl6pxZxsx4lgcFElF9zUsEHus5rI8M85UjZdrnfGPDIoe
	 GXcqfRFhmJ6xHRsH2Vjqpui/a8MKhZBlxv+QuJaIl86LZvyjneghsdu51/ZQ91+y03
	 iaXs6PqJQLhIQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bed4f2f0898so894257866b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 09:39:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+TmNlr1Jw7L7WJ0Zr5VZJ51Nfl4bAbApqVVuVR0Ybkce3Nng1YyCAwNQIb3C3z4giY6DhVaEsW6OUSs5xbfs51@lists.infradead.org
X-Gm-Message-State: AOJu0Yy13VRrrB1p5ev6cvmss4BvaY5iaXAw3DlzAXgVNNdAq0IdAqkj
	vStRDA7kD65kQKjSd0tFTCQvOdOnfwqr5F/uN+S7OAovGyergefj/CmtCOYieBLFdBdsYp8sXxT
	3iDLpxxec+mvFyuzjZv1Dh6bDppkxiCA=
X-Received: by 2002:a17:907:7fa8:b0:beb:4674:6a1d with SMTP id
 a640c23a62f3a-bf936bec9e4mr497683466b.11.1781109598524; Wed, 10 Jun 2026
 09:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260608081108.2244133-1-maz@kernel.org> <aicqzM4W4NN-GndT@google.com>
 <86ldcotbub.wl-maz@kernel.org> <CAO9r8zMpvxoVcDvWn3q0C0Dv=0Kknt_BqZ8KqddwuKa5bd44Dw@mail.gmail.com>
 <868q8mu0hr.wl-maz@kernel.org>
In-Reply-To: <868q8mu0hr.wl-maz@kernel.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 10 Jun 2026 09:39:46 -0700
X-Gmail-Original-Message-ID: <CAO9r8zO8e9LCCevab2Rf9ArV9eHJ=L+n-hPWCGgkC47udEVARA@mail.gmail.com>
X-Gm-Features: AVVi8CcVcXwzy45XyjikMi6K7M6sV9Fac4tlWVWAJx-O0hPoeftmoxR-za9Ausc
Message-ID: <CAO9r8zO8e9LCCevab2Rf9ArV9eHJ=L+n-hPWCGgkC47udEVARA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Hold kvm->mmu_lock while initialising vcpu->arch.vncr_tlb
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jun 10, 2026 at 3:57=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Tue, 09 Jun 2026 18:57:26 +0100,
> Yosry Ahmed <yosry@kernel.org> wrote:
> >
> > > > If yes, I think the code looks confusing, at least to a layman like
> > > > myself. It initially seems like the lock protects against concurren=
t
> > > > initializations, but then the NULL check is not done again under th=
e
> > > > lock. The goal of the lock is not clear without the original report=
.
> > > >
> > > > Mayeb it's clearer to explicitly use barriers if the goal is preven=
ting
> > > > reordering?
> > >
> > > This would require both the initialisation of vncr_tlb to use a store
> > > release, *and* all the other call sites to use a load acquire.
> > >
> > > I really don't think it is worth the churn, nor the (very small)
> > > burden on the readers.
> >
> > That's fair. I was mainly just pointing out my initial confusion and
> > that others may share it. Avoiding the churn on the readers' side is
> > understandable. Maybe a comment here would help explain why the lock
> > needs to be held?
>
> I have added this:
>
>         /*
>          * Taking the lock on assignment ensures that the TLB is
>          * seen as initialised when following the pointer (release
>          * semantics of the unlock), and avoids having acquires on
>          * each user which already take the lock.
>          */

Looks good, thank you!

