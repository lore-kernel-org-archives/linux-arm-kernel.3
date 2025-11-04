Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EAACCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooiEwLkpEn3SIda5ET9ohbaQkm18JEOHhop52KX9ckk=; b=HG83dFvTyy4Da1jKV70wcyb0I6
	wM9krA4p5QEwjGJjQXNtn2q08ujsLM5hCemJG509q7H5EA+V2exE8nR66ohC0dk5Y4V4xjRMnLHS7
	Ng0SDeoI6jvhxhwaBO9zxPPu7kvQWt4Se9sQwbDe1qozxcKfSrfrGqjN7yZsM04X1678uCrq+eXmF
	FeDY3iBjDkZFy/1qWNQBxNoXPoaaHVUNjJ1diTTLTrHVWxumkuXvo2X4rzF77hPrR6fBCR26leIxQ
	lVEHN2vkJkP4+BHgwGvciofxOhJllGNL6izeOF1JoM3iH7GSvJ7+gmDPqstnZz4LZOwj6Is0kUQTF
	AK6GLRnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJ1Y-0000000C6KE-2UOJ;
	Tue, 04 Nov 2025 15:32:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJ1W-0000000C6Ji-46C6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:32:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7BE14180D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Nov 2025 15:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9770BC116B1
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Nov 2025 15:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762270361;
	bh=8ucPxln4jCUuHFhw/d6Q11VjxjnmrQRrHkqL4b1Kkeg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e2EPE5c/iiYhzgcYCbz55pMXl2qSKkkMnUVtPulbwAO6u99+Shf3FP95kREg0IXhC
	 B4Wt9Sry1YTldXDY89BrRStt3l2ju/TJCul/a2Bhs2bDoJvKeT+kibcvhSw8fVBEVb
	 drQeiUd0D/EF4/5iOseSGP+kEvBwDuU5dvOB0efMFp5bGe+PT54w5yQrHQBmSC8ThL
	 jvFRlXZpd3lPx8vi5OU8mZAig6qvSw9JZ/i8BRIEvFS/9geR3yP0wvLo7P2Tk1wiYc
	 KC6o9dIYNWuRd7V1V8fLIovimPSfvz2QIoPFn2/0A8QQHHNAvpSJErxScY/Car2A5J
	 jegtfQx7Qvbwg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37a415a22ecso11454731fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 07:32:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQYjK/wy4MeaRp3i1ncl8LzH40W2SgCm3DLATYCC5x0ndx4T6L3Nz3NsQ9OHO8CniiuAV+U1TTf89C+pFjZLp8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2qOwWrLjoJZQ8KamFIlfNlefEKb1c4hNudg3EkDK1zEOzdLOa
	FrJb0zfOgx4YL96j3k2z/kNM9I1smWgyhKF9kzzBsQ2uM6JPFiO5uTQElhl+Q4Bc0UQ+jGy2xBY
	Jv03u3bg4BN5bUyS0McNjby8DB7qX/mE=
X-Google-Smtp-Source: AGHT+IH+CVhvcHFEROY6DI4fTTA1A0rVOvk6V2lH0Qy3bvx0oWjtx6rv8LHLiMplqLO8Ccc4rIiO5m5I7sknLNpZ/eA=
X-Received: by 2002:a2e:a554:0:b0:372:91d2:f659 with SMTP id
 38308e7fff4ca-37a4e6f08demr36141fa.3.1762270359952; Tue, 04 Nov 2025 07:32:39
 -0800 (PST)
MIME-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com> <20251031103858.529530-31-ardb+git@google.com>
 <20251031134909.00006bf3@huawei.com> <CAMj1kXHMa_Vj3DsuoAR-rvWW12Bsnz10w+BAze6mtngqpABZPw@mail.gmail.com>
 <CAMj1kXH_YCuBT4CbidTcVDNz2qNvYK9afS+v9eNkNggB3gopBw@mail.gmail.com> <20251103112836.00006966@huawei.com>
In-Reply-To: <20251103112836.00006966@huawei.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 4 Nov 2025 16:32:28 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGog9bwqc=1qCv+Lh3giK081jf9h4AFCvQ=6Ls6N27LyA@mail.gmail.com>
X-Gm-Features: AWmQ_bmFX2z95LFUqFBLXa1zysHI_LqNQuskPyUwu9Z4a7PNLTWxdw_qHd8vC_4
Message-ID: <CAMj1kXGog9bwqc=1qCv+Lh3giK081jf9h4AFCvQ=6Ls6N27LyA@mail.gmail.com>
Subject: Re: [PATCH v4 08/21] lib/crc: Switch ARM and arm64 to 'ksimd' scoped
 guard API
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_073243_062675_C3E0C8A1 
X-CRM114-Status: GOOD (  32.79  )
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

On Mon, 3 Nov 2025 at 12:28, Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Fri, 31 Oct 2025 15:05:19 +0100
> Ard Biesheuvel <ardb@kernel.org> wrote:
>
> > On Fri, 31 Oct 2025 at 14:52, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Fri, 31 Oct 2025 at 14:49, Jonathan Cameron
> > > <jonathan.cameron@huawei.com> wrote:
> > > >
> > > > On Fri, 31 Oct 2025 11:39:07 +0100
> > > > Ard Biesheuvel <ardb+git@google.com> wrote:
> > > >
> > > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > > >
> > > > > Before modifying the prototypes of kernel_neon_begin() and
> > > > > kernel_neon_end() to accommodate kernel mode FP/SIMD state buffers
> > > > > allocated on the stack, move arm64 to the new 'ksimd' scoped guard API,
> > > > > which encapsulates the calls to those functions.
> > > > >
> > > > > For symmetry, do the same for 32-bit ARM too.
> > > > >
> > > > > Reviewed-by: Eric Biggers <ebiggers@kernel.org>
> > > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > > > ---
> > > > >  lib/crc/arm/crc-t10dif.h   | 16 +++++-----------
> > > > >  lib/crc/arm/crc32.h        | 11 ++++-------
> > > > >  lib/crc/arm64/crc-t10dif.h | 16 +++++-----------
> > > > >  lib/crc/arm64/crc32.h      | 16 ++++++----------
> > > > >  4 files changed, 20 insertions(+), 39 deletions(-)
> > > > >
> > > > > diff --git a/lib/crc/arm/crc-t10dif.h b/lib/crc/arm/crc-t10dif.h
> > > > > index 63441de5e3f1..aaeeab0defb5 100644
> > > > > --- a/lib/crc/arm/crc-t10dif.h
> > > > > +++ b/lib/crc/arm/crc-t10dif.h
> > > >
> > > > >  static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
> > > > > @@ -20,21 +19,16 @@ asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
> > > > >  static inline u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
> > > > >  {
> > > > >       if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE) {
> > > > > -             if (static_branch_likely(&have_pmull)) {
> > > > > -                     if (likely(may_use_simd())) {
> > > > > -                             kernel_neon_begin();
> > > > > -                             crc = crc_t10dif_pmull64(crc, data, length);
> > > > > -                             kernel_neon_end();
> > > > > -                             return crc;
> > > > > -                     }
> > > > > +             if (static_branch_likely(&have_pmull) && likely(may_use_simd())) {
> > > > > +                     scoped_ksimd()
> > > > > +                             return crc_t10dif_pmull64(crc, data, length);
> > > >
> > > > >               } else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
> > > > >                          static_branch_likely(&have_neon) &&
> > > > >                          likely(may_use_simd())) {
> > > >
> > > > I briefly thought this was a functional change but it's not because
> > > > of may_use_simd() being something that isn't going to change between
> > > > the two evaluations.
> > > >
> > > > Would it hurt at all to pull that up to be
> > > >         if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE && likely(may_use_simd())) {
> > > >                 if (static_branch_likely(&have_pmull)) {
> > > >                         scoped_ksimd()
> > > >                                 return crc_t10dif_pmull64(crc, data, length);
> > > >
> > > >                 } else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
> > > >                            static_branch_likely(&have_neon)) {
> > > >                 ...
> > > >
> > > > ?
> > > >
> > >
> > > Yeah that would be a reasonable cleanup, I guess.
> >
> > Actually, looking more closely, that would result in may_use_simd()
> > being evaluated even when the static keys are set to false, given that
> > the compiler is unlikely to be able to figure out by itself that
> > may_use_simd() has no side effects.
> Yeah. That was why it was a question :)
> Given everything is marked as likely I wasn't sure if we cared about when
> the static keys aren't set.
>

Yeah, it is rather doubtful that those annotations (or the use of
static keys, for that matter) make a meaningful difference here.

