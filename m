Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EA0D339AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2qaK69S8d1ir0mooHfux1HV+2f4k5U8+ZmSB4W8X3k=; b=rCfCXz8zz3CYGb2PXivDbsuoR4
	MqSEsb0HggqWvIVOIm9NJ6ZZ8JtEKhmacgXt3Banpuwgdykmtg2Nq9jr3/2MS14XCvzNQf1iECtol
	WVrOHUYOIafh0bBGmiaJvLKjgm0mswyLo1gXpZnuULZ6tsMPlHy6uqIs4UfcrSXaIpqdV4dHjQHP0
	6PGJFbY9nKyM6XpwcjP5ToW7kpiqraSPEQv1hlaurzXFaYw25ZqlvF3kSin/YxYKnAfLmMwopHxrw
	a0oMrb7YTmNYNB+yaLtSzHg0go1qb5we8jccduuamu+TE8YLlWp3mY1p8OuKzEZKIhZtT8GGFqNId
	nNWljnmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Teg-0000000BfYT-27Sx;
	Mon, 28 Oct 2024 17:35:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Td2-0000000BfLX-3Dtd;
	Mon, 28 Oct 2024 17:34:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D62785C5C12;
	Mon, 28 Oct 2024 17:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E76C4CEE7;
	Mon, 28 Oct 2024 17:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730136847;
	bh=pcLLhLxlquE4QPOlWW4Lr1bb5MuHYN7k6DZdbDCx9DQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N2N8PbhzCFAC8L9B/R+n6LS/2Vz3FY30Fm8hWgEopytD1knoRkeGPQKL3kqI2YZh4
	 N66V/nX5SYYKx1XlmynUto9sGLWOvhBEmg5rJSntmjzIwGDKa6y6pQ5CqfVhu6ox3z
	 XXy4qMSqLoaPINE/LE66ohBgCVuwypgcmHq7aI6zsMGsZnZ0NSH6AbSvbsTjET7iO5
	 tM6H9w8I9wRriKG8/z+JwgusAW1OG4vSksb8DGG2Dt3CZPSWdvjdM4zjviLYwYBMsG
	 60iDnfcMYPZgh5mphm7YYFd/flxuIVSEHd35xe9nF7CCH1OilerJX6R47wN1hlmM2E
	 GJMGejqlT3Efw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53a007743e7so5250608e87.1;
        Mon, 28 Oct 2024 10:34:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBAo6pbX/nMZ4DWSeW4pJ++IbfxTMicmcYyI21EiKf2/MlayznbJ+RJgDCdl8leEtHKWkv7+CkgJ2sLP+Ljsz/MQ==@lists.infradead.org, AJvYcCVXodPayS/2IcpDWoXjpJ4W/0B2YUn2oXUX+0Rrl8/Bvbvu2VPjUYXnKRAyLYB3sF14KYpSnw==@lists.infradead.org, AJvYcCXsvHC8GDd6pwllSXXhuUy2BDMHFlb6f2QmxZ8YQcDNBk7dra8syTjAPluYiZtixUoXot2mBF2fh8LbwnU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTmaPXYkJnprt3rt+T8dchElQC89DCqaOJTa4jqNbzjVBAH6Qx
	q8cu/rNgb8VHAaENFnJFhDdn5+FOijmC87u6MjcdBlR9PEiSS8SRAT5oH11r4dljSYnoQClB7G8
	vXW7uX8kTNX3iq8V9TJaE1xOXLw==
X-Google-Smtp-Source: AGHT+IF5IETAXGDmlx+LAKug+dwz64NqnsL1okXnnGJyl9RYKmQIgXl4x3+ziMcKV48JBCGh1PNtcevuXjcqmWy53WY=
X-Received: by 2002:a05:6512:224e:b0:539:e85c:c888 with SMTP id
 2adb3069b0e04-53b34a1900emr4148343e87.40.1730136845913; Mon, 28 Oct 2024
 10:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20241023171426.452688-1-usamaarif642@gmail.com> <20241028154054.GE2484@willie-the-truck>
In-Reply-To: <20241028154054.GE2484@willie-the-truck>
From: Rob Herring <robh@kernel.org>
Date: Mon, 28 Oct 2024 12:33:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK=cbknmjKa-rtr9vPhaOoYf26KNzvQ0uGabOwy19jcCA@mail.gmail.com>
Message-ID: <CAL_JsqK=cbknmjKa-rtr9vPhaOoYf26KNzvQ0uGabOwy19jcCA@mail.gmail.com>
Subject: Re: [PATCH v2] of/fdt: add dt_phys arg to early_init_dt_scan and early_init_dt_verify
To: Will Deacon <will@kernel.org>
Cc: Usama Arif <usamaarif642@gmail.com>, mark.rutland@arm.com, leitao@debian.org, 
	catalin.marinas@arm.com, tglx@linutronix.de, chris@zankel.net, 
	saravanak@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-openrisc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_103408_921998_4229AD27 
X-CRM114-Status: GOOD (  23.15  )
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

On Mon, Oct 28, 2024 at 10:41=E2=80=AFAM Will Deacon <will@kernel.org> wrot=
e:
>
> On Wed, Oct 23, 2024 at 06:14:26PM +0100, Usama Arif wrote:
> >  __pa() is only intended to be used for linear map addresses and using
> > it for initial_boot_params which is in fixmap for arm64 will give an
> > incorrect value. Hence save the physical address when it is known at
> > boot time when calling early_init_dt_scan for arm64 and use it at kexec
> > time instead of converting the virtual address using __pa().
> >
> > Reported-by: Breno Leitao <leitao@debian.org>
> > Suggested-by: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> > Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt()"=
)
> > ---
> > v1 -> 2:
> > - pass dt_phys in early_init_dt_scan instead of creating
> >   anorther arch->dt function (Rob Herring)
> > ---
> >  arch/arc/kernel/devtree.c              |  2 +-
> >  arch/arm/kernel/devtree.c              |  2 +-
> >  arch/arm64/kernel/setup.c              |  6 +++++-
> >  arch/csky/kernel/setup.c               |  4 ++--
> >  arch/loongarch/kernel/setup.c          |  2 +-
> >  arch/microblaze/kernel/prom.c          |  2 +-
> >  arch/mips/kernel/prom.c                |  2 +-
> >  arch/mips/kernel/relocate.c            |  2 +-
> >  arch/nios2/kernel/prom.c               |  4 ++--
> >  arch/openrisc/kernel/prom.c            |  2 +-
> >  arch/powerpc/kernel/dt_cpu_ftrs.c      |  2 +-
> >  arch/powerpc/kernel/prom.c             |  2 +-
> >  arch/powerpc/platforms/pseries/plpks.c |  2 +-
> >  arch/riscv/kernel/setup.c              |  2 +-
> >  arch/sh/kernel/setup.c                 |  2 +-
> >  arch/um/kernel/dtb.c                   |  2 +-
> >  arch/x86/kernel/devicetree.c           |  2 +-
> >  arch/xtensa/kernel/setup.c             |  2 +-
> >  drivers/of/fdt.c                       | 14 ++++++++------
> >  drivers/of/kexec.c                     |  2 +-
> >  include/linux/of_fdt.h                 |  5 +++--
> >  21 files changed, 36 insertions(+), 29 deletions(-)
> >
> > diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
> > index 4c9e61457b2f..cc6ac7d128aa 100644
> > --- a/arch/arc/kernel/devtree.c
> > +++ b/arch/arc/kernel/devtree.c
> > @@ -62,7 +62,7 @@ const struct machine_desc * __init setup_machine_fdt(=
void *dt)
> >       const struct machine_desc *mdesc;
> >       unsigned long dt_root;
> >
> > -     if (!early_init_dt_scan(dt))
> > +     if (!early_init_dt_scan(dt, __pa(dt)))
> >               return NULL;
> >
> >       mdesc =3D of_flat_dt_match_machine(NULL, arch_get_next_mach);
> > diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
> > index fdb74e64206a..3b78966e750a 100644
> > --- a/arch/arm/kernel/devtree.c
> > +++ b/arch/arm/kernel/devtree.c
> > @@ -200,7 +200,7 @@ const struct machine_desc * __init setup_machine_fd=
t(void *dt_virt)
> >
> >       mdesc_best =3D &__mach_desc_GENERIC_DT;
> >
> > -     if (!dt_virt || !early_init_dt_verify(dt_virt))
> > +     if (!dt_virt || !early_init_dt_verify(dt_virt, __pa(dt_virt)))
> >               return NULL;
> >
> >       mdesc =3D of_flat_dt_match_machine(mdesc_best, arch_get_next_mach=
);
> > diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> > index b22d28ec8028..177262739c49 100644
> > --- a/arch/arm64/kernel/setup.c
> > +++ b/arch/arm64/kernel/setup.c
> > @@ -175,7 +175,11 @@ static void __init setup_machine_fdt(phys_addr_t d=
t_phys)
> >       if (dt_virt)
> >               memblock_reserve(dt_phys, size);
> >
> > -     if (!dt_virt || !early_init_dt_scan(dt_virt)) {
> > +     /*
> > +      * dt_virt is a fixmap address, hence __pa(dt_virt) can't be used=
.
> > +      * Pass dt_phys directly.
> > +      */
> > +     if (!dt_virt || !early_init_dt_scan(dt_virt, dt_phys)) {
>
> nit: It looks like early_init_dt_verify() will now return false if
> !dt_virt, so we can drop the additional check here.

That was true before, but I'll fix this up when applying.

Rob

