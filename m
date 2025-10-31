Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD6FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 13:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mn5jbJwM2CAxbTkcZq3Fzr3koHOdGsBr8mzb4LmkEr4=; b=bIhN9/4s54jOEZ/uPIErcPK5tR
	lmy5DGepiCcE43aoWbg1cykC2Y+7Hg9MwA/+3E9BPcHYlqVuJ/cQLIxcqqYsSVIjMvomLb7kaoHzY
	+H8p+7mchi39NUspyrh8KMQlpE02cil+7qROUxXQZBruRfdBCOa/UxU5MeR8CikAOZ80ZulF6jrBZ
	bTAS4/5HBXPvZNH4NxT04J3PzQhdiXNvTHrratLCYncHlVhJdPDo23t2hhXciNNpVBS84gv8uEu4z
	+jAf21SR52jjW0c++QovMagAHsFc9N2xDh+nv2QOv5QEq83NNa+4TXdyVDOFBTsNhNVH0OxgEJXpc
	d7FUTgow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpYj-00000006BHL-1D1S;
	Fri, 31 Oct 2025 13:52:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpYg-00000006BGV-3dbW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 13:52:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E989740C32
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 13:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B7AC4CEFD
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 13:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761918769;
	bh=OZOJGVFPVvgoICzb96sWJOAxC8zQUwZgmSqC+4PRa40=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ofeRqvX2L7Pn9ovcq2lQufq0kGpAqAZnOXo3GjIcfAWaclc6jOoG/Q0SnsnttZzOC
	 P+ahLVgGodiule3lfdJ3mBC1BNy3n62cqGnTGRmvuAC3KCwxsymgEql/pq6lxQjDg1
	 wX0yoySYtu/vY/dwi514HL/x+WDf7f3rOyd/CfeZ6D2TVAOSDCcVXR03hAz0jN7czB
	 luk4ImAlSi78rqa89syl6a9Tz5f3zsGX9lLiE2O4Coy1LElMj4bSGomz5zZbyh1WwE
	 hOW+hVO5g5CHecNA0GHm98HVumj1CD32DmSUqv0Eb+wXwbrIdoaoGnVGkkUUpV4zuu
	 btlfQgSNknlDw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5930e30857bso3093976e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 06:52:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/weu/VZ8Ssz8j7+zZvkbOxc3s06SDfYi/njRC2woZXACD+UxmrqIKzUKrNUBZdI8uw7MuxkbesWU2/Wb7qDKx@lists.infradead.org
X-Gm-Message-State: AOJu0YyMpduwLjtEeY1RNulZ3cSdoXP3YR1tJEmT9RKxm9vGjjV2esoL
	tJrtzmFyBSbZcunw09EZJuM0zTCAJ0dsfQmkWZg4MYEJDVrv8ACe872iPnB2QavNArlhx26A5S/
	GgyGhsvQyaBL2GY/hnKe/cy2odS6cpRE=
X-Google-Smtp-Source: AGHT+IGKmCnEm7EzivIgJyR5JKOYXoySZ6tvgvet9bi10ExWbl/TVPMYWyirNSz29x5TQUoCZJBcqca3iDbFf1g6fWQ=
X-Received: by 2002:a05:6512:224c:b0:592:ef1b:da72 with SMTP id
 2adb3069b0e04-5941d505da1mr1434407e87.14.1761918768160; Fri, 31 Oct 2025
 06:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com> <20251031103858.529530-31-ardb+git@google.com>
 <20251031134909.00006bf3@huawei.com>
In-Reply-To: <20251031134909.00006bf3@huawei.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 31 Oct 2025 14:52:36 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHMa_Vj3DsuoAR-rvWW12Bsnz10w+BAze6mtngqpABZPw@mail.gmail.com>
X-Gm-Features: AWmQ_bnUHTmFTpf6_wwhZYvTf56YiWzMFCCLq2ZM6tGMZqDdBbz5PGKileyFjes
Message-ID: <CAMj1kXHMa_Vj3DsuoAR-rvWW12Bsnz10w+BAze6mtngqpABZPw@mail.gmail.com>
Subject: Re: [PATCH v4 08/21] lib/crc: Switch ARM and arm64 to 'ksimd' scoped
 guard API
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_065250_955124_B5ED51D2 
X-CRM114-Status: GOOD (  23.97  )
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

On Fri, 31 Oct 2025 at 14:49, Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Fri, 31 Oct 2025 11:39:07 +0100
> Ard Biesheuvel <ardb+git@google.com> wrote:
>
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Before modifying the prototypes of kernel_neon_begin() and
> > kernel_neon_end() to accommodate kernel mode FP/SIMD state buffers
> > allocated on the stack, move arm64 to the new 'ksimd' scoped guard API,
> > which encapsulates the calls to those functions.
> >
> > For symmetry, do the same for 32-bit ARM too.
> >
> > Reviewed-by: Eric Biggers <ebiggers@kernel.org>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  lib/crc/arm/crc-t10dif.h   | 16 +++++-----------
> >  lib/crc/arm/crc32.h        | 11 ++++-------
> >  lib/crc/arm64/crc-t10dif.h | 16 +++++-----------
> >  lib/crc/arm64/crc32.h      | 16 ++++++----------
> >  4 files changed, 20 insertions(+), 39 deletions(-)
> >
> > diff --git a/lib/crc/arm/crc-t10dif.h b/lib/crc/arm/crc-t10dif.h
> > index 63441de5e3f1..aaeeab0defb5 100644
> > --- a/lib/crc/arm/crc-t10dif.h
> > +++ b/lib/crc/arm/crc-t10dif.h
>
> >  static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
> > @@ -20,21 +19,16 @@ asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
> >  static inline u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
> >  {
> >       if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE) {
> > -             if (static_branch_likely(&have_pmull)) {
> > -                     if (likely(may_use_simd())) {
> > -                             kernel_neon_begin();
> > -                             crc = crc_t10dif_pmull64(crc, data, length);
> > -                             kernel_neon_end();
> > -                             return crc;
> > -                     }
> > +             if (static_branch_likely(&have_pmull) && likely(may_use_simd())) {
> > +                     scoped_ksimd()
> > +                             return crc_t10dif_pmull64(crc, data, length);
>
> >               } else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
> >                          static_branch_likely(&have_neon) &&
> >                          likely(may_use_simd())) {
>
> I briefly thought this was a functional change but it's not because
> of may_use_simd() being something that isn't going to change between
> the two evaluations.
>
> Would it hurt at all to pull that up to be
>         if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE && likely(may_use_simd())) {
>                 if (static_branch_likely(&have_pmull)) {
>                         scoped_ksimd()
>                                 return crc_t10dif_pmull64(crc, data, length);
>
>                 } else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
>                            static_branch_likely(&have_neon)) {
>                 ...
>
> ?
>

Yeah that would be a reasonable cleanup, I guess.

