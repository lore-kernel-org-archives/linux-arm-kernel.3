Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CF1CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 11:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UZqMi8+orKOzgMZdLjTrx/naZ5UFFcjhyDk05zbWAU=; b=1F1lKtxA9hSy53Y3efSUnjcb2Q
	G4YOmwC1jhzyraRvzoOn65Q5aoMPq8fSCg+goMHNrmSrLB8NnbqMN+5wv8QNSLP4NOeSE9D4HOfqf
	TliHpzkTVHl7LuWIi3Vs/OIYI6JKYH+J3kx55h7Aq+L8zQ1qCiNLmK0ZFw3FWQBSqme5aMuJp4ZhD
	CgdxG9bceApMP80wM/70DJWpLyHD7qr+qmHqJ3D23/2AIpKU0ZYeiMV+rbKe53jDnw+fwR4NN3ILJ
	eEiTUgfB6S6EFRtEErjouj9+s+Xv+rTpsErk7bFnBvk0krytsB00Jubba3OV7bjM/fH5SL7uAWtxE
	iKBMyMPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsjv-00000009k0p-2kzw;
	Mon, 03 Nov 2025 11:28:47 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsjs-00000009k0N-1R37
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 11:28:46 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4d0Tl83Cs5z6L5QR;
	Mon,  3 Nov 2025 19:24:52 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id E54BC1401DC;
	Mon,  3 Nov 2025 19:28:38 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 3 Nov
 2025 11:28:38 +0000
Date: Mon, 3 Nov 2025 11:28:36 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: Ard Biesheuvel <ardb+git@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <herbert@gondor.apana.org.au>,
	<ebiggers@kernel.org>
Subject: Re: [PATCH v4 08/21] lib/crc: Switch ARM and arm64 to 'ksimd'
 scoped guard API
Message-ID: <20251103112836.00006966@huawei.com>
In-Reply-To: <CAMj1kXH_YCuBT4CbidTcVDNz2qNvYK9afS+v9eNkNggB3gopBw@mail.gmail.com>
References: <20251031103858.529530-23-ardb+git@google.com>
	<20251031103858.529530-31-ardb+git@google.com>
	<20251031134909.00006bf3@huawei.com>
	<CAMj1kXHMa_Vj3DsuoAR-rvWW12Bsnz10w+BAze6mtngqpABZPw@mail.gmail.com>
	<CAMj1kXH_YCuBT4CbidTcVDNz2qNvYK9afS+v9eNkNggB3gopBw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_032844_698012_96A997A3 
X-CRM114-Status: GOOD (  27.84  )
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

On Fri, 31 Oct 2025 15:05:19 +0100
Ard Biesheuvel <ardb@kernel.org> wrote:

> On Fri, 31 Oct 2025 at 14:52, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Fri, 31 Oct 2025 at 14:49, Jonathan Cameron
> > <jonathan.cameron@huawei.com> wrote:  
> > >
> > > On Fri, 31 Oct 2025 11:39:07 +0100
> > > Ard Biesheuvel <ardb+git@google.com> wrote:
> > >  
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > >
> > > > Before modifying the prototypes of kernel_neon_begin() and
> > > > kernel_neon_end() to accommodate kernel mode FP/SIMD state buffers
> > > > allocated on the stack, move arm64 to the new 'ksimd' scoped guard API,
> > > > which encapsulates the calls to those functions.
> > > >
> > > > For symmetry, do the same for 32-bit ARM too.
> > > >
> > > > Reviewed-by: Eric Biggers <ebiggers@kernel.org>
> > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > > ---
> > > >  lib/crc/arm/crc-t10dif.h   | 16 +++++-----------
> > > >  lib/crc/arm/crc32.h        | 11 ++++-------
> > > >  lib/crc/arm64/crc-t10dif.h | 16 +++++-----------
> > > >  lib/crc/arm64/crc32.h      | 16 ++++++----------
> > > >  4 files changed, 20 insertions(+), 39 deletions(-)
> > > >
> > > > diff --git a/lib/crc/arm/crc-t10dif.h b/lib/crc/arm/crc-t10dif.h
> > > > index 63441de5e3f1..aaeeab0defb5 100644
> > > > --- a/lib/crc/arm/crc-t10dif.h
> > > > +++ b/lib/crc/arm/crc-t10dif.h  
> > >  
> > > >  static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
> > > > @@ -20,21 +19,16 @@ asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
> > > >  static inline u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
> > > >  {
> > > >       if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE) {
> > > > -             if (static_branch_likely(&have_pmull)) {
> > > > -                     if (likely(may_use_simd())) {
> > > > -                             kernel_neon_begin();
> > > > -                             crc = crc_t10dif_pmull64(crc, data, length);
> > > > -                             kernel_neon_end();
> > > > -                             return crc;
> > > > -                     }
> > > > +             if (static_branch_likely(&have_pmull) && likely(may_use_simd())) {
> > > > +                     scoped_ksimd()
> > > > +                             return crc_t10dif_pmull64(crc, data, length);  
> > >  
> > > >               } else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
> > > >                          static_branch_likely(&have_neon) &&
> > > >                          likely(may_use_simd())) {  
> > >
> > > I briefly thought this was a functional change but it's not because
> > > of may_use_simd() being something that isn't going to change between
> > > the two evaluations.
> > >
> > > Would it hurt at all to pull that up to be
> > >         if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE && likely(may_use_simd())) {
> > >                 if (static_branch_likely(&have_pmull)) {
> > >                         scoped_ksimd()
> > >                                 return crc_t10dif_pmull64(crc, data, length);
> > >
> > >                 } else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
> > >                            static_branch_likely(&have_neon)) {
> > >                 ...
> > >
> > > ?
> > >  
> >
> > Yeah that would be a reasonable cleanup, I guess.  
> 
> Actually, looking more closely, that would result in may_use_simd()
> being evaluated even when the static keys are set to false, given that
> the compiler is unlikely to be able to figure out by itself that
> may_use_simd() has no side effects.
Yeah. That was why it was a question :)
Given everything is marked as likely I wasn't sure if we cared about when
the static keys aren't set.

Jonathan

> 


