Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2A9CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 14:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jze/RmyHtOpHQht0aUXYjSQW1Qzc7yAVHWZ49+h192I=; b=OYpuDEM52tLLVctUtwujjdSR3S
	ouyCmIbPPy2fT3oAgPbNzd6j9U4IcNZtpbZ5TL+c/pv1KiGyp8fdnAiYq6MdJdiJuPKn2nezIYFGK
	qg0NrVWMGGEH2niGIHqKKIfvdjeA/6Yyz1YOGGeFhLATofGvHmGzQZ+3GovS+W/c2NxPLBk3EHBkZ
	8Q/TMQOZiPDs2bQLRfzHbtlfdv6YCuGAX23/dIr2XVZ7qHYvKSn6CpTjr8Qfmx9yPBEjQfTha/HKS
	ppmJXb3H9ZVwW1JgPcLdim2ElzTWOIuNn3vIX4Y+Wpbq4KcID9dmSJC5xj+zV7XTW81/c0ocE/UMD
	3tNc9ZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpl1-00000006CXx-1eGm;
	Fri, 31 Oct 2025 14:05:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpl0-00000006CXi-1ANp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 14:05:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E1D86206E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 14:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1E9C116B1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 14:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761919533;
	bh=uj/ZlfFSuGh87bLUZBain32EiwylAIzOLbNNPboS71c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UFJrYsXbqrOJNvjxLmImQz4gJ+MWtlDo5SyX6Oc0Ool0gh13fHTVQpPuML3GLF74v
	 WKl6J4HtDo1hfwREpyz0F7IwSaYUfzVB8neaNmYVpHHciGdZdO193RZ/XF+E7VJS5T
	 AyOg7qnZBsZCj5q80JaOYlTBx2qeENWa5cfI7wYObFhv8C8V1bZ5oIambHR1edFOjZ
	 to+dLqSNQCgtc78NR0xYaXuBOaM+DAlzmsnGePsEyRPOzz7p7HDnHrQlMs6rvyfYpi
	 GAjx6SnSA2SiQs4k1RfgwbkDLfZyyaJNN+hC/Lk/D1V1ns2x/6KQbC5iWWY++6V+b0
	 LVlCHCMThzVig==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-592f29e273bso2162800e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 07:05:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXS0ubxnU2OMPS4Z8VONVR03ugIHfrleKw4ZnSUdogwRAU8YNmCKLZuww8FS7NgQto6pCOFIj27AAoonBoQe3Ji@lists.infradead.org
X-Gm-Message-State: AOJu0YwnQWxTu7OhgYEq3OHnxmOAG8jNVUKN54Exor9giJPLt9kc28pb
	PjYijhP5keXuwo/kV+fvEX1SsF2sH9osS2aqv1ODJMLywgM8Zw27FH5pzHbs6m3v0pAyQsIekS+
	wNauzWbzz8gUKgpN0XZGkcVIBrO03i4s=
X-Google-Smtp-Source: AGHT+IHxedjSkvxKkv90NCDn2L1W+uzOFU/ki2EFNLnaSTgc3pXi1eADnpmiAPba+uDgY3ddk1bvQQvTu14wKMJoNJQ=
X-Received: by 2002:a05:6512:4019:b0:592:f41d:4dae with SMTP id
 2adb3069b0e04-5941d511d69mr1308147e87.3.1761919531454; Fri, 31 Oct 2025
 07:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com> <20251031103858.529530-31-ardb+git@google.com>
 <20251031134909.00006bf3@huawei.com> <CAMj1kXHMa_Vj3DsuoAR-rvWW12Bsnz10w+BAze6mtngqpABZPw@mail.gmail.com>
In-Reply-To: <CAMj1kXHMa_Vj3DsuoAR-rvWW12Bsnz10w+BAze6mtngqpABZPw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 31 Oct 2025 15:05:19 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH_YCuBT4CbidTcVDNz2qNvYK9afS+v9eNkNggB3gopBw@mail.gmail.com>
X-Gm-Features: AWmQ_bl0cRHww67O1TA2qm0ejud4NB4PHqq4Dz-q88By71LxnM0QIuZZvhBuGWw
Message-ID: <CAMj1kXH_YCuBT4CbidTcVDNz2qNvYK9afS+v9eNkNggB3gopBw@mail.gmail.com>
Subject: Re: [PATCH v4 08/21] lib/crc: Switch ARM and arm64 to 'ksimd' scoped
 guard API
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 31 Oct 2025 at 14:52, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Fri, 31 Oct 2025 at 14:49, Jonathan Cameron
> <jonathan.cameron@huawei.com> wrote:
> >
> > On Fri, 31 Oct 2025 11:39:07 +0100
> > Ard Biesheuvel <ardb+git@google.com> wrote:
> >
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Before modifying the prototypes of kernel_neon_begin() and
> > > kernel_neon_end() to accommodate kernel mode FP/SIMD state buffers
> > > allocated on the stack, move arm64 to the new 'ksimd' scoped guard API,
> > > which encapsulates the calls to those functions.
> > >
> > > For symmetry, do the same for 32-bit ARM too.
> > >
> > > Reviewed-by: Eric Biggers <ebiggers@kernel.org>
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > ---
> > >  lib/crc/arm/crc-t10dif.h   | 16 +++++-----------
> > >  lib/crc/arm/crc32.h        | 11 ++++-------
> > >  lib/crc/arm64/crc-t10dif.h | 16 +++++-----------
> > >  lib/crc/arm64/crc32.h      | 16 ++++++----------
> > >  4 files changed, 20 insertions(+), 39 deletions(-)
> > >
> > > diff --git a/lib/crc/arm/crc-t10dif.h b/lib/crc/arm/crc-t10dif.h
> > > index 63441de5e3f1..aaeeab0defb5 100644
> > > --- a/lib/crc/arm/crc-t10dif.h
> > > +++ b/lib/crc/arm/crc-t10dif.h
> >
> > >  static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
> > > @@ -20,21 +19,16 @@ asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
> > >  static inline u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
> > >  {
> > >       if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE) {
> > > -             if (static_branch_likely(&have_pmull)) {
> > > -                     if (likely(may_use_simd())) {
> > > -                             kernel_neon_begin();
> > > -                             crc = crc_t10dif_pmull64(crc, data, length);
> > > -                             kernel_neon_end();
> > > -                             return crc;
> > > -                     }
> > > +             if (static_branch_likely(&have_pmull) && likely(may_use_simd())) {
> > > +                     scoped_ksimd()
> > > +                             return crc_t10dif_pmull64(crc, data, length);
> >
> > >               } else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
> > >                          static_branch_likely(&have_neon) &&
> > >                          likely(may_use_simd())) {
> >
> > I briefly thought this was a functional change but it's not because
> > of may_use_simd() being something that isn't going to change between
> > the two evaluations.
> >
> > Would it hurt at all to pull that up to be
> >         if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE && likely(may_use_simd())) {
> >                 if (static_branch_likely(&have_pmull)) {
> >                         scoped_ksimd()
> >                                 return crc_t10dif_pmull64(crc, data, length);
> >
> >                 } else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
> >                            static_branch_likely(&have_neon)) {
> >                 ...
> >
> > ?
> >
>
> Yeah that would be a reasonable cleanup, I guess.

Actually, looking more closely, that would result in may_use_simd()
being evaluated even when the static keys are set to false, given that
the compiler is unlikely to be able to figure out by itself that
may_use_simd() has no side effects.

