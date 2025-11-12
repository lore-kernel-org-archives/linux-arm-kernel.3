Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D084FCD4845
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 21:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiyLHWCJJk9m9DbFu1tkzVKbvQeBMiaznu9v7APw9Eg=; b=uvGOStJ1INPL9LaXqW/tJ0RcTI
	qUjk+RY0KfQCkamU0rceAL6KBpYzJKE1lqSWBL1dt8XbkvvI9qzFJy6uUhO1GpBiObwEZPl1aAMVO
	P52qwt4UTJzQspaZPcP66p7iNQ0iKJxZuqshWTtzufHOQ/6Tz2W83sgPdcepoTzh+u+Dr9mB/ReCC
	Mjsk/WWDIoajnc2Ptj00aqOE+YQr47cNTUUo/wFESnOuKGZqDC8JzLIgF/P3lICdRpFTxi6QJbB85
	pn5E5Xu7K0brTrgm/J1Vq70iIHjuoZOMM0T19g4VHw4SleOPx0yBSc9wCqTc0Z+WgmqbZgTQf6SAu
	XWax7+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJHww-00000009VmR-23ic;
	Wed, 12 Nov 2025 21:00:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJHwt-00000009Vlr-1J12
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 21:00:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 333E142DEB;
	Wed, 12 Nov 2025 21:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07FAC4CEF7;
	Wed, 12 Nov 2025 21:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762981213;
	bh=y4Ld6BCnq7KX+vDSRVwSUYQvdimBcRrIcm5ooyZboEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s9KNBCdIQnX4NqogZP5t9fr/bVLmOpAcYpydtyT11eaAXfRe32MGmyfP5gaQnnRhR
	 o+9E5tSgi/SjmlpWTbxOuCyJKjMh8iu/ma+NnD2czJ9USvlo/1FIARwRNNJPQuEcRZ
	 /4g8rMzdFJRGYzgPaU+OzpK68OoVqpft4p5G3p4J7J83YxYi3026N9ncSGU6UY00KB
	 H5WQJ+8AuoptYS9SGk0WTrzT0LAq59zhNyFP5NdM0wliZ0bEPaYpsaVDwfj44z3cXW
	 tPzbx8wfs1tCxUPsWgd8wKiDDPIUMvO69WBRCmocsFTY2PUNsJhNs6nJeuQQ+/jcz4
	 LxJUKHmbuav0g==
Date: Wed, 12 Nov 2025 12:58:32 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
	Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au
Subject: Re: [PATCH v4 08/21] lib/crc: Switch ARM and arm64 to 'ksimd' scoped
 guard API
Message-ID: <20251112205832.GC1760@sol>
References: <20251031103858.529530-23-ardb+git@google.com>
 <20251031103858.529530-31-ardb+git@google.com>
 <20251031134909.00006bf3@huawei.com>
 <CAMj1kXHMa_Vj3DsuoAR-rvWW12Bsnz10w+BAze6mtngqpABZPw@mail.gmail.com>
 <CAMj1kXH_YCuBT4CbidTcVDNz2qNvYK9afS+v9eNkNggB3gopBw@mail.gmail.com>
 <20251103112836.00006966@huawei.com>
 <CAMj1kXGog9bwqc=1qCv+Lh3giK081jf9h4AFCvQ=6Ls6N27LyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGog9bwqc=1qCv+Lh3giK081jf9h4AFCvQ=6Ls6N27LyA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_130016_641578_CBA1695B 
X-CRM114-Status: GOOD (  36.33  )
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

On Tue, Nov 04, 2025 at 04:32:28PM +0100, Ard Biesheuvel wrote:
> On Mon, 3 Nov 2025 at 12:28, Jonathan Cameron
> <jonathan.cameron@huawei.com> wrote:
> >
> > On Fri, 31 Oct 2025 15:05:19 +0100
> > Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > > On Fri, 31 Oct 2025 at 14:52, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > >
> > > > On Fri, 31 Oct 2025 at 14:49, Jonathan Cameron
> > > > <jonathan.cameron@huawei.com> wrote:
> > > > >
> > > > > On Fri, 31 Oct 2025 11:39:07 +0100
> > > > > Ard Biesheuvel <ardb+git@google.com> wrote:
> > > > >
> > > > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > > > >
> > > > > > Before modifying the prototypes of kernel_neon_begin() and
> > > > > > kernel_neon_end() to accommodate kernel mode FP/SIMD state buffers
> > > > > > allocated on the stack, move arm64 to the new 'ksimd' scoped guard API,
> > > > > > which encapsulates the calls to those functions.
> > > > > >
> > > > > > For symmetry, do the same for 32-bit ARM too.
> > > > > >
> > > > > > Reviewed-by: Eric Biggers <ebiggers@kernel.org>
> > > > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > > > > ---
> > > > > >  lib/crc/arm/crc-t10dif.h   | 16 +++++-----------
> > > > > >  lib/crc/arm/crc32.h        | 11 ++++-------
> > > > > >  lib/crc/arm64/crc-t10dif.h | 16 +++++-----------
> > > > > >  lib/crc/arm64/crc32.h      | 16 ++++++----------
> > > > > >  4 files changed, 20 insertions(+), 39 deletions(-)
> > > > > >
> > > > > > diff --git a/lib/crc/arm/crc-t10dif.h b/lib/crc/arm/crc-t10dif.h
> > > > > > index 63441de5e3f1..aaeeab0defb5 100644
> > > > > > --- a/lib/crc/arm/crc-t10dif.h
> > > > > > +++ b/lib/crc/arm/crc-t10dif.h
> > > > >
> > > > > >  static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
> > > > > > @@ -20,21 +19,16 @@ asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
> > > > > >  static inline u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
> > > > > >  {
> > > > > >       if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE) {
> > > > > > -             if (static_branch_likely(&have_pmull)) {
> > > > > > -                     if (likely(may_use_simd())) {
> > > > > > -                             kernel_neon_begin();
> > > > > > -                             crc = crc_t10dif_pmull64(crc, data, length);
> > > > > > -                             kernel_neon_end();
> > > > > > -                             return crc;
> > > > > > -                     }
> > > > > > +             if (static_branch_likely(&have_pmull) && likely(may_use_simd())) {
> > > > > > +                     scoped_ksimd()
> > > > > > +                             return crc_t10dif_pmull64(crc, data, length);
> > > > >
> > > > > >               } else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
> > > > > >                          static_branch_likely(&have_neon) &&
> > > > > >                          likely(may_use_simd())) {
> > > > >
> > > > > I briefly thought this was a functional change but it's not because
> > > > > of may_use_simd() being something that isn't going to change between
> > > > > the two evaluations.
> > > > >
> > > > > Would it hurt at all to pull that up to be
> > > > >         if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE && likely(may_use_simd())) {
> > > > >                 if (static_branch_likely(&have_pmull)) {
> > > > >                         scoped_ksimd()
> > > > >                                 return crc_t10dif_pmull64(crc, data, length);
> > > > >
> > > > >                 } else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
> > > > >                            static_branch_likely(&have_neon)) {
> > > > >                 ...
> > > > >
> > > > > ?
> > > > >
> > > >
> > > > Yeah that would be a reasonable cleanup, I guess.
> > >
> > > Actually, looking more closely, that would result in may_use_simd()
> > > being evaluated even when the static keys are set to false, given that
> > > the compiler is unlikely to be able to figure out by itself that
> > > may_use_simd() has no side effects.
> > Yeah. That was why it was a question :)
> > Given everything is marked as likely I wasn't sure if we cared about when
> > the static keys aren't set.
> >
> 
> Yeah, it is rather doubtful that those annotations (or the use of
> static keys, for that matter) make a meaningful difference here.

Well, this change makes crc_t10dif_update() not usable during early boot
on arm64, as it will start hitting the
WARN_ON(!system_capabilities_finalized() in may_use_simd().

I doubt there are any current callers where that matters, but I've been
trying to avoid this sort of unnecessary pitfall in the CRC functions.

Checking the static key first eliminates this pitfall and is also more
efficient on CPUs that don't support the relevant CPU feature.

- Eric

