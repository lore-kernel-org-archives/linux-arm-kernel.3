Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A47C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdwxmEwGAVaWxBcFASmVA+2qnyozZBSbOEWsN4ftwnI=; b=L8yWMBwX8ix25b7bZBZqU2qU1f
	34QcTVBYVxPE1yUNr6GMQRQBQkE5WNC6K72Py5VclwICAWV/9AJaj9GwPtDIQywPM6N40rCFabMab
	5WVtV+VTLKXZ999QP56xHTFTmamqE8RX4eJozFjap7lr85vXzKKg/GMK5XpqMhr3HRfugW+1WZWVF
	XFHBKCccM4mEonmFPzBaoMFAr6EQ9q1QkrjDaTekF6UH9CG4YjiYDmmI2oeCHKe3tXoPMFuYzaXPY
	6L+sCnzRJHdcAj/TZaGGscL0JgQVhsNSqftEJpul1L8fH4iOm62l5O4WUpOqjOZMW5KNMVj/Vx2R0
	UViDrl7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4iu-00000005QAj-2Tbf;
	Mon, 17 Feb 2025 17:16:00 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3Ux-00000005Ae2-1lAg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:57:32 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-471f1dd5b80so208681cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 07:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739807850; x=1740412650; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hdwxmEwGAVaWxBcFASmVA+2qnyozZBSbOEWsN4ftwnI=;
        b=s/TPtvOpQr8m079e5yksRlqjHp5xnVmTbJUwauB1KlSCIPAW1ZpY9OXRyfhG34nAMB
         EPRVxJ+6mHFcgdUWD00P1wjg4ywO6bPSVz6QLRyqhsEC/0MYnLuwoozdsCqsnVnOE7M9
         ntZFiDyXsaF+fUbAnv3ljEPz2H0SA4tC9vwi49FyK6tCX06z15os1Q9//VcZogquUyGr
         ydDJ4IhG+BJbikdQnI4lRRMxpPGsJ3yOkjAJ5NHkBF4YmpwIdIudRhGJpteLfz9zTaEE
         xE0IhBoeEE+APTsE1BYEn3wNLmCJk3JP1k9/MK8FHL+16ibHnUGPJOd+9pOg3MEBLUmn
         beUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739807850; x=1740412650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdwxmEwGAVaWxBcFASmVA+2qnyozZBSbOEWsN4ftwnI=;
        b=sB4wErOuv/P6zNtkW1R5zF/ODLIoSqLVQ0JT7j80nuzuwkSwmlUoBD80KA54lQ9p3W
         OhUecLtktYBvX1z5GG4kEl52yrQTceJyAawVlx/+YSIJ1THVH6tRBaQX4BqIwOcv+qAt
         J7LaxZkmOuxteoSpyE1vVue6fbixSfP2x8wY5V139YyI5+GL3+UNzCTntdhLEUvEBDB0
         TEstpoPuADkKEzktEy30cwjaYRseVIWyFw4mCpdrZ0FdCOl9WeeC86hMBA/wGVooXSGh
         IGnQ1+EAn6obSvOfqEMb0b/IAbRWW+5RtMdv8Ox9XfJCO6ZkmrhC9jPPXlqZ1V+sriYs
         R7xw==
X-Forwarded-Encrypted: i=1; AJvYcCWJgdQghL5C6aG9ejrfT1bP1BAULTYbBECC5q2ZgKJwHjgCvWF3NYnwzZ5FO09oNQyw0vLnk8IdjSdVF5Ypt2rx@lists.infradead.org
X-Gm-Message-State: AOJu0Ywty++x8fvBMn+jZmZp8LEK4gTAI20Rgokdzsbl469mosL3uB+2
	Jo46c2OVHWNF/rjznPrasez2CmpYe2GY+lAIz0Wn9QIFsscfAHkjTRuzzwhROh4TsfD4J1m1UIa
	gEBP98L5V4i3HXHGzpR+DrWzpAVduxhfNcJ1M
X-Gm-Gg: ASbGnctjyRFL5yVgYwu89faNkI1B5UZLOdB8IXhpSjT8eNaqug8QFWMxQiitYIORGZ8
	1ysg6FoFUftFbdjovQUE2q04k1z3S4TghDoOAVmm/Q4vqAcCl066GxBNV5mbrwKLioa1MHt4=
X-Google-Smtp-Source: AGHT+IFYjVjyk51aYuA0xgEP1r81NXa4uUmrTwcuX1LAIFx2e5X6SYCkOVaP2cczo18FT3m0bA6e4juvCYH94Jd75dc=
X-Received: by 2002:a05:622a:54e:b0:471:badd:bd2f with SMTP id
 d75a77b69052e-471dc6602d2mr7426021cf.0.1739807850116; Mon, 17 Feb 2025
 07:57:30 -0800 (PST)
MIME-Version: 1.0
References: <20250214150258.464798-1-tabba@google.com> <20250214150258.464798-4-tabba@google.com>
 <20250217153031.GA16398@willie-the-truck> <CA+EHjTyOk_VpcTaD-VsH9X7KjpPKWu-HyVE3EEV+rzhnHar84A@mail.gmail.com>
In-Reply-To: <CA+EHjTyOk_VpcTaD-VsH9X7KjpPKWu-HyVE3EEV+rzhnHar84A@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Feb 2025 15:56:53 +0000
X-Gm-Features: AWEUYZmLG6GraU3YF5iPhS1GFxu1UOebrI4yee2IulD_nEJ1kmtP1NSNIbx20Uo
Message-ID: <CA+EHjTzLW1HiiPr+=vStMYJcYEHUBFcEy_YMT3uJuLRA3zDzEw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] KVM: arm64: Create each pKVM hyp vcpu after its
 corresponding host vcpu
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, qperret@google.com, 
	vdonnefort@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_075731_456969_DC7D58FF 
X-CRM114-Status: GOOD (  28.38  )
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

Hi Will,

On Mon, 17 Feb 2025 at 15:41, Fuad Tabba <tabba@google.com> wrote:
>
> Hi Will,
>
> On Mon, 17 Feb 2025 at 15:30, Will Deacon <will@kernel.org> wrote:
> >
> > On Fri, Feb 14, 2025 at 03:02:58PM +0000, Fuad Tabba wrote:
> > > Instead of creating and initializing _all_ hyp vcpus in pKVM when
> > > the first host vcpu runs for the first time, initialize _each_
> > > hyp vcpu in conjunction with its corresponding host vcpu.
> > >
> > > Some of the host vcpu state (e.g., system registers and traps
> > > values) are not initialized until the first time the host vcpu is
> > > run. Therefore, initializing a hyp vcpu before its corresponding
> > > host vcpu has run for the first time might not view the complete
> > > host state of these vcpus.
> > >
> > > Additionally, this behavior is inline with non-protected modes.
> > >
> > > Signed-off-by: Fuad Tabba <tabba@google.com>
> > > ---
> > >  arch/arm64/include/asm/kvm_host.h      |  2 +
> > >  arch/arm64/include/asm/kvm_pkvm.h      |  1 +
> > >  arch/arm64/kvm/arm.c                   |  4 ++
> > >  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  6 ---
> > >  arch/arm64/kvm/hyp/nvhe/pkvm.c         | 54 +++++++++++++++-----------
> > >  arch/arm64/kvm/pkvm.c                  | 28 ++++++-------
> > >  6 files changed, 53 insertions(+), 42 deletions(-)
> >
> > [...]
> >
> > >  static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
> > >                             struct pkvm_hyp_vm *hyp_vm,
> > > -                           struct kvm_vcpu *host_vcpu,
> > > -                           unsigned int vcpu_idx)
> > > +                           struct kvm_vcpu *host_vcpu)
> > >  {
> > >       int ret = 0;
> > >
> > >       if (hyp_pin_shared_mem(host_vcpu, host_vcpu + 1))
> > >               return -EBUSY;
> > >
> > > -     if (host_vcpu->vcpu_idx != vcpu_idx) {
> > > -             ret = -EINVAL;
> > > -             goto done;
> > > -     }
> > > -
> > >       hyp_vcpu->host_vcpu = host_vcpu;
> > >
> > >       hyp_vcpu->vcpu.kvm = &hyp_vm->kvm;
> > >       hyp_vcpu->vcpu.vcpu_id = READ_ONCE(host_vcpu->vcpu_id);
> > > -     hyp_vcpu->vcpu.vcpu_idx = vcpu_idx;
> > > +     hyp_vcpu->vcpu.vcpu_idx = READ_ONCE(host_vcpu->vcpu_idx);
> > >
> > >       hyp_vcpu->vcpu.arch.hw_mmu = &hyp_vm->kvm.arch.mmu;
> > >       hyp_vcpu->vcpu.arch.cflags = READ_ONCE(host_vcpu->arch.cflags);
> > > @@ -687,27 +689,28 @@ int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
> > >               goto unlock;
> > >       }
> > >
> > > -     idx = hyp_vm->nr_vcpus;
> > > +     ret = init_pkvm_hyp_vcpu(hyp_vcpu, hyp_vm, host_vcpu);
> > > +     if (ret)
> > > +             goto unlock;
> > > +
> > > +     idx = hyp_vcpu->vcpu.vcpu_idx;
> > >       if (idx >= hyp_vm->kvm.created_vcpus) {
> > >               ret = -EINVAL;
> > >               goto unlock;
> > >       }
> > >
> > > -     ret = init_pkvm_hyp_vcpu(hyp_vcpu, hyp_vm, host_vcpu, idx);
> > > -     if (ret)
> > > +     if (hyp_vm->vcpus[idx]) {
> > > +             ret = -EINVAL;
> > >               goto unlock;
> > > +     }
> >
> > I'm not sure how much we care at EL2, but it looks like there's a
> > potential spectre gadget here given that 'idx' is now untrusted.
> > Perhaps chuck something like:
> >
> >         idx = array_index_nospec(idx, hyp_vm->kvm.created_vcpus);
> >
> > before indexing into 'hyp_vm->vcpus[]'?
>
> I'll add that when I respin.

pKVM is riddled with these kinds of accesses (e.g.,
get_vm_by_handle(). It might be better if I address this in a separate
series.

Cheers,
/fuad

>
> > Either way:
> >
> > Acked-by: Will Deacon <will@kernel.org>
>
> Thanks,
> /fuad
>
> > Will

