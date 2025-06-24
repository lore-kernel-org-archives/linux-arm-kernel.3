Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86328C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 12:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpbvBFRgVNiOR52WtcQgFji4Ck6KdtyZCENW2J3nYUw=; b=u6VrQ5fs34M8eLXLVn+uk4Mgpa
	yQ4u7155mPo0Strsa2z1J3wdlOTfjsmOrYoRGxmVnabxNqYcXPTnueWfUBGf6BMomETeL+cnBuJo2
	4tyWnucyrfMoHRu0LGUpY9DKYz4CXaR+nCGQ4rn6Fmdn5Utrzfq+Y4ga+v5q/8W8RBU4kkEtYoZxe
	35ODJ22uoFC88kIAFHCrtIQ8JJLPqZnfJ37ro3Nz8tAOwPDqE7Kks5VdWa7Ny2P0TR/Ncu5s12wH6
	ha5Z1PN+06gGsQgFQqwB64K6efAq76ypU+xoidPuXFBDUpwwXUWrIabwocOtQqXj7wo1Bzt7rLoys
	kD6D8RJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU31g-00000005cMO-2xKn;
	Tue, 24 Jun 2025 12:45:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2oB-00000005aZY-2K9x;
	Tue, 24 Jun 2025 12:31:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 808ED6116F;
	Tue, 24 Jun 2025 12:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A5CC4AF0B;
	Tue, 24 Jun 2025 12:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750768286;
	bh=A1vlO/L1VKH8WOeSv/ouj3ncracjwzpEiurRYiS/ALg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eu9htEvBiVbL44j/hDA/XL5IHMVRkTjREoK+yoJofVs3i2H7zYeWM4nuOEa8lvA1q
	 draOJBWRmasaODlA4846qtfnrHoWcfrlpN7SdkOAt9CRDuKgz+Jijdfb0hME3v4zjT
	 vySbdesGJCidQHCf0M229vamBtjKXpnwatmAh49jUKp+nVNq+/QlhEUFGI/3hC6dpM
	 MBpiZpEieyvMUEHttV5HVCNFcwOz97BYbHpUnESxPT0XUV2ac4VY/kC4HNi3iT2U1C
	 nndDqpkUc6Rj2nldXF12iLWnmS6e5StbWpsEaS9jarXC/+el4cuLLpnkbs9yytEYsC
	 jjsFUJ19nZmUg==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso768502a12.2;
        Tue, 24 Jun 2025 05:31:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5LAcMmOEo0V2tr9rvzDH9L8gsX8Bn8QXfvVq41ML1ISix1HmrExTsfvEnkajkAq8vaVYNnvAKonRR2SFTSWfA@lists.infradead.org, AJvYcCWcbsnvWXclN9ibRngFvvKQSi06Hr1IjiJ+DArroO8ybdlolS+tjZrsjFpmYd/HTOMNDUWKAu9dzUSkw14=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2MQgxj7gCbAdT49Y0tRysr1ybScjP9xZqqGRnmaHOttZ5fuEh
	ojQ5EnSpp0EG6DmbxThUPaTIRUU2nbhRfRsqpMSqqftkN8SLq6aaw75Wd7RcIw1lb1V6am0T7ec
	Zo8J4E7soHUhh12awf0WyAorMYbD6GKo=
X-Google-Smtp-Source: AGHT+IG78TOJtNBgPo6KUbppTtQyUVPXosqjkC+mjKzFM6GuMzZpIE/4mn6DMDsxVG8gc/mo29CZZDSg4K3moyGLako=
X-Received: by 2002:a50:9e07:0:b0:607:5987:5ba1 with SMTP id
 4fb4d7f45d1cf-60a1d1676eamr10402408a12.20.1750768284578; Tue, 24 Jun 2025
 05:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250523043251.it.550-kees@kernel.org> <20250523043935.2009972-10-kees@kernel.org>
 <CAAhV-H4WxAwXTYVFOnphgHN80-_6jt77YZ_rw-sOBoBjjiN-yQ@mail.gmail.com>
In-Reply-To: <CAAhV-H4WxAwXTYVFOnphgHN80-_6jt77YZ_rw-sOBoBjjiN-yQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 24 Jun 2025 20:31:12 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5oHPG+etNawAmVwyDtg80iKUrAM_m3Vj57bBO0scHqvQ@mail.gmail.com>
X-Gm-Features: AX0GCFsgXJm0uAqj4ZcBCmgCp5XFBS8cfA5fjKZVFWrLP2ySZYpAIUKeGDxIJgs
Message-ID: <CAAhV-H5oHPG+etNawAmVwyDtg80iKUrAM_m3Vj57bBO0scHqvQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] loongarch: Handle KCOV __init vs inline mismatches
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Gleixner <tglx@linutronix.de>, Tianyang Zhang <zhangtianyang@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Christoph Hellwig <hch@lst.de>, Marco Elver <elver@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, 
	llvm@lists.linux.dev
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

Hi, Kees,

On Thu, Jun 19, 2025 at 4:55=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Kees,
>
> On Fri, May 23, 2025 at 12:39=E2=80=AFPM Kees Cook <kees@kernel.org> wrot=
e:
> >
> > When KCOV is enabled all functions get instrumented, unless
> > the __no_sanitize_coverage attribute is used. To prepare for
> > __no_sanitize_coverage being applied to __init functions, we have to
> > handle differences in how GCC's inline optimizations get resolved. For
> > loongarch this exposed several places where __init annotations were
> > missing but ended up being "accidentally correct". Fix these cases and
> > force one function to be inline with __always_inline.
> >
> > Signed-off-by: Kees Cook <kees@kernel.org>
> > ---
> > Cc: Huacai Chen <chenhuacai@kernel.org>
> > Cc: WANG Xuerui <kernel@xen0n.name>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Tianyang Zhang <zhangtianyang@loongson.cn>
> > Cc: Bibo Mao <maobibo@loongson.cn>
> > Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Cc: <loongarch@lists.linux.dev>
> > ---
> >  arch/loongarch/include/asm/smp.h | 2 +-
> >  arch/loongarch/kernel/time.c     | 2 +-
> >  arch/loongarch/mm/ioremap.c      | 4 ++--
> >  3 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/=
asm/smp.h
> > index ad0bd234a0f1..88e19d8a11f4 100644
> > --- a/arch/loongarch/include/asm/smp.h
> > +++ b/arch/loongarch/include/asm/smp.h
> > @@ -39,7 +39,7 @@ int loongson_cpu_disable(void);
> >  void loongson_cpu_die(unsigned int cpu);
> >  #endif
> >
> > -static inline void plat_smp_setup(void)
> > +static __always_inline void plat_smp_setup(void)
> Similar to x86 and arm, I prefer to mark it as __init rather than
> __always_inline.
If you have no objections, I will apply this patch with the above modificat=
ion.


Huacai

>
> Huacai
>
> >  {
> >         loongson_smp_setup();
> >  }
> > diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.=
c
> > index bc75a3a69fc8..367906b10f81 100644
> > --- a/arch/loongarch/kernel/time.c
> > +++ b/arch/loongarch/kernel/time.c
> > @@ -102,7 +102,7 @@ static int constant_timer_next_event(unsigned long =
delta, struct clock_event_dev
> >         return 0;
> >  }
> >
> > -static unsigned long __init get_loops_per_jiffy(void)
> > +static unsigned long get_loops_per_jiffy(void)
> >  {
> >         unsigned long lpj =3D (unsigned long)const_clock_freq;
> >
> > diff --git a/arch/loongarch/mm/ioremap.c b/arch/loongarch/mm/ioremap.c
> > index 70ca73019811..df949a3d0f34 100644
> > --- a/arch/loongarch/mm/ioremap.c
> > +++ b/arch/loongarch/mm/ioremap.c
> > @@ -16,12 +16,12 @@ void __init early_iounmap(void __iomem *addr, unsig=
ned long size)
> >
> >  }
> >
> > -void *early_memremap_ro(resource_size_t phys_addr, unsigned long size)
> > +void * __init early_memremap_ro(resource_size_t phys_addr, unsigned lo=
ng size)
> >  {
> >         return early_memremap(phys_addr, size);
> >  }
> >
> > -void *early_memremap_prot(resource_size_t phys_addr, unsigned long siz=
e,
> > +void * __init early_memremap_prot(resource_size_t phys_addr, unsigned =
long size,
> >                     unsigned long prot_val)
> >  {
> >         return early_memremap(phys_addr, size);
> > --
> > 2.34.1
> >

