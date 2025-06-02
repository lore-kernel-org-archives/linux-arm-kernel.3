Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D155C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 10:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6oHW+OYRZzbm2Ge3apmaQyktoCm1Mvzr/hGY9oS7Oc=; b=Xwq5fdic3KiVL/e8FdNw4GY31A
	xFqlCCod2pdv+MUnEjzh40OBtJxd46/kPcNErtdsuOVrUa+lxLDdEa4dZwuGoYvMSbfjUpYrwECsq
	3dkAxQiCFvGrDvaIJ/qiNedBiGAnxpTIXX9b69OtoyW7oBBoq754+7SHAOhQb1/yMpvSjBNrDkVbV
	wQOOJ8pjZK+2l0pB97X4wg67bS7DvPdzYYzGigY9ddUEE07+z81nCvqivuGPbl4TqHksjO/zIU1uG
	+WO4iwSYGEf+dgjmVIyPlbK319RzQtMUdYDLp/tOAr9lUNKsXCLe410nSD5PkQ66vSRnlpoAQfwVj
	/gkWqYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM2Ic-00000007BD9-2AWn;
	Mon, 02 Jun 2025 10:21:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM2Fk-00000007AsA-06Ep
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 10:18:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7B17A4FF54
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Jun 2025 10:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F20C4CEF2
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Jun 2025 10:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748859526;
	bh=uLQazk56BTexUgsHGJMDpigwB9tywPCf55jmlZm6j/8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aQH2Xeu8G8u7KvsNJNgOrp2DnTDQl6YMRHaBOkdCqci5ulQbkBmqH/plTo+sHkyRb
	 yxOfTgEpagaDgRFkI0eQ5CXLrJ1cfCMGWeYCM0YsZk0aGCaXvsavmhW8vOZfASxg20
	 zRgHlDrYwk8dN+Sd/p7m3D4djfvNTI5CouNfOeHquwXoTXopfW95JEjg3XxDSjh9lp
	 CG8sfDS26LfRjQOEF8GEdPPh3kiDRKZ3CQbXGBVanq5rBsFBqvPG57a+t/d8qpy365
	 chbMJgUlEh70baMg/hAsOcrzmphUKG47ncoYfsToNwJek+u/dpK7p/RuvCljhbAXry
	 LmH93GZWTGuQw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55220699ba8so5215351e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 03:18:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFSxAoj40y0kjRW7HlSh6fQ1Thkp+lnKiZKq/skJK0D7PYyIB31hOA5miD0m7JiF+UX0+8NvpDpjg8sFXG/orV@lists.infradead.org
X-Gm-Message-State: AOJu0YznHcaeU0QYv3FUoC/uoonjYydkHMsg/02QU4CjxAJhCoqF2otJ
	KKAD4XNv+0My518SVZ3l4GsjoCeASxAjE79B5xsjImjEAf4WsyHwFeCck8nPgW2rb+TTy981iJN
	PBmn56SatIq/K6DoFoPvvEtyobu1fo54=
X-Google-Smtp-Source: AGHT+IFi9HK9WNzL4nXyoqhZF+tafWf9gRJFq8rKqeVagEgYLbmiY1W9Y5P6iWsmEp8Wznqox9DdglvyNKnbXkBjqLo=
X-Received: by 2002:a05:6512:3e0f:b0:553:28f1:66ec with SMTP id
 2adb3069b0e04-5533d19dbbamr3202081e87.31.1748859524677; Mon, 02 Jun 2025
 03:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250529073507.2984959-2-ardb+git@google.com> <20250530133811.GB30622@willie-the-truck>
 <CAMj1kXHypqdC9O+8WH7n1=aDOySMScZc2y526S3gc_-QNpqO=w@mail.gmail.com> <20250602100932.GA919@willie-the-truck>
In-Reply-To: <20250602100932.GA919@willie-the-truck>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 2 Jun 2025 12:18:33 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEKMyR0PoQnY2zvQ=BVPJfEb4EO9HCUWKURUW+_Dj5h4w@mail.gmail.com>
X-Gm-Features: AX0GCFtV7EFK8QfbOKqdQzWZFlqFjENgJ20dK-v1vdlyJN6pNEtBwCNmuIl6VrY
Message-ID: <CAMj1kXEKMyR0PoQnY2zvQ=BVPJfEb4EO9HCUWKURUW+_Dj5h4w@mail.gmail.com>
Subject: Re: [PATCH] arm64: Disable LLD linker ASSERT()s for the time being
To: Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb+git@google.com>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com, nathan@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_031848_197901_E8F3E337 
X-CRM114-Status: GOOD (  36.24  )
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

On Mon, 2 Jun 2025 at 12:09, Will Deacon <will@kernel.org> wrote:
>
> On Fri, May 30, 2025 at 04:23:16PM +0200, Ard Biesheuvel wrote:
> > On Fri, 30 May 2025 at 15:38, Will Deacon <will@kernel.org> wrote:
> > >
> > > On Thu, May 29, 2025 at 09:35:08AM +0200, Ard Biesheuvel wrote:
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > >
> > > > It turns out that the way LLD handles ASSERT()s in the linker script can
> > > > result in spurious failures, so disable them for the newly introduced
> > > > BSS symbol export checks.
> > > >
> > > > Link: https://github.com/ClangBuiltLinux/linux/issues/2094
> > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > > ---
> > > >  arch/arm64/kernel/image-vars.h | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> > > > index c5266430284b..86f088a16147 100644
> > > > --- a/arch/arm64/kernel/image-vars.h
> > > > +++ b/arch/arm64/kernel/image-vars.h
> > > > @@ -10,6 +10,10 @@
> > > >  #error This file should only be included in vmlinux.lds.S
> > > >  #endif
> > > >
> > > > +#if defined(CONFIG_LD_IS_LLD) && CONFIG_LLD_VERSION < 210000
> > > > +#define ASSERT(...)
> > > > +#endif
> > > > +
> > > >  #define PI_EXPORT_SYM(sym)           \
> > > >       __PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
> > > >  #define __PI_EXPORT_SYM(sym, pisym, msg)\
> > > > @@ -142,4 +146,6 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
> > > >  _kernel_codesize = ABSOLUTE(__inittext_end - _text);
> > > >  #endif
> > > >
> > > > +#undef ASSERT
> > >
> > > What about the ASSERT()s at the end of vmlinux.lds.S? Are they not
> > > affected by the bug, for some reason?
> > >
> > > Also, even with this patch applied, I still see a link failure:
> > >
> > >   | ld.lld: error: assignment to symbol __init_end does not converge
> > >
> > > with the .config you sent me off-list.
> > >
> >
> > That is a different error that has been lurking for a while now; Arnd
> > occasionally hits it but I haven't seen any other reports of it. AIUI,
> > the issue is that INIT_IDMAP_DIR_PAGES and INIT_DIR_SIZE are defined
> > in terms of (_end - KIMAGE_VADDR), resulting in a circular dependency.
>
> Ok, I'll ignore that one for the moment, then...
>
> > The config in the kernel test robot's report [0] appears to build fine
> > with this patch applied.
> >
> >
> > [0] https://lore.kernel.org/all/202505261019.OUlitN6m-lkp@intel.com/T/#u
>
> ... but I'm still not sure why the ASSERT()s in vmlinux.lds.S are not
> affected. Is it just that we've not hit a .config which breaks with
> those yet, or is it something more fundamental than that?

The former, as far as I can tell. The BSS patch just adds a fair
amount of ASSERT()s so the attack surface has become larger. And
perhaps those checks are more susceptible due to the fact that they
compare symbols living in different sections? But that is just
conjecture.

> I'd have
> thought we'd need to so something like below (on top of your patch) to
> fix this issue properly.
>

Yes, it is the more thorough fix, but we'd lose coverage for those
ASSERT()s which are arguably more important than the ones I added.

