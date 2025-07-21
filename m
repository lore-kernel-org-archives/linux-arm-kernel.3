Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C56CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 04:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqL64E0WaMLc/FnxjzSVqDcurOye9V23wVEhgyqwmQs=; b=onbj1RhvmLcRW9sAOxaEUQD/3C
	Gg2Bqnz1ZfOGzoz7a7/BXK6Vf5jkPfu2gg9ntu40s7D8WQL+PRLZSpp4Po/X1wwxEKPnRY2YufMG4
	suKg+9g3DTQsz+DQeTZIZ1HSmD+55+4UNPWTXqyIZzKNnaLrpU+gLByWLJyt9sMBnCHF6GmiKb3cx
	FeoMeZ1Ls5oSLN7bxsy9hgH0mXh/wT9cWkeQ0kCpWS37Q/hjuy3rUq0I9+sM1XqW4IFLiph5FMNoL
	Cgk6uGk2zdcUTvP4f7QK15xkEDb+9Ai3Q8zT89ONH4d4kGgpNUQnwhm0A0ljaQe3Vh1Hm3UnJ/+BB
	W7AiYrAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udi9x-0000000GAAs-3P5w;
	Mon, 21 Jul 2025 04:29:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udi7Y-0000000G9vC-16vl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 04:27:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D37D5C59FD
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 04:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0A0C4CEF4
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 04:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753072043;
	bh=8dgyfEbmJqLN/JlFQN1SsvAQKGG4nd/sA5ZvXhduMW8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=afaDesuvyltngPYnCxStPMJGltpe6n0jbxVO7k9kc5jGaZkw0ShY6Gre84Zdw87+L
	 g/LHaMipzzJ7cq0cs2iUOsnJTHNsbqvLXVVbx+n1lqsujXO8UvrfFqh2RDwsj0DU0j
	 0qEZ5JqdmjYuehAkRPwkRTbwb/mifWnA+SxNgM+9YbsrvtJDJHFjmUtAegBpuJndmZ
	 MNmkHgiRqvbfLdKXNqilUcv+LMCaVcRHANmDkRzBER5UYFXlL+5AkVNaQOPfzKdtmE
	 +iDI5++YcjFjxPv38Ceyg75iBUJQWoNREGvjbMCTyijXo/NLA3WDs5mHmC7cRApMZD
	 JPZzWvl1uEH1w==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b7cf56cacso35932691fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 21:27:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUm1JJwYSj1pb9mX7V1lzIvjQjdiBURfV0a+66rTfsxM1sKe35qHyi2CzAgk644LY3vzHXUnmIEv5kmtw1D3zqD@lists.infradead.org
X-Gm-Message-State: AOJu0YxUtNiNO4s285L7L6Jw2W09fGU3K53R7g6NWBwtvy/Xx8/SLrY+
	+5MuETJMJ607oBzo//dNJtJgyT70OQQpu9/eeYQo+DK54vUF2J73LIdBSlZ4oWzd2H/6A9fOzfh
	Dv27WjpFIzNnp1l7aDf1wWh9buQmOYCs=
X-Google-Smtp-Source: AGHT+IGiuUNh87LCrb7VSq3AVAZccJpnT4QP0VLWGeEGeV8zpfl3Atv/V5DIVwAbktM2xN/nKA/bqHnpGEF/NTVkPkw=
X-Received: by 2002:a2e:80d4:0:b0:32b:755e:6cd7 with SMTP id
 38308e7fff4ca-3308e56e179mr51719521fa.32.1753072041588; Sun, 20 Jul 2025
 21:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250718220706.475240-1-ebiggers@kernel.org> <CAMj1kXG8rEGH9suNf+s26174-SDrVWaV3RcuY53ysiBbrJtKUQ@mail.gmail.com>
 <20250721041735.GA3372@sol>
In-Reply-To: <20250721041735.GA3372@sol>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 21 Jul 2025 14:27:04 +1000
X-Gmail-Original-Message-ID: <CAMj1kXEtPo7FfGMfE==DtHT=yk-H1KOdSdsfmKLk=t3gQ2hYEg@mail.gmail.com>
X-Gm-Features: Ac12FXyZCID0FAxVJicIJaQrAE5BZzJiaoJ6Xq3J25u7KqcMLHoud3mAw9Ay-tY
Message-ID: <CAMj1kXEtPo7FfGMfE==DtHT=yk-H1KOdSdsfmKLk=t3gQ2hYEg@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: arm64/sha512-ce: Drop compatibility macros
 for older binutils
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_212724_386400_998A96D5 
X-CRM114-Status: GOOD (  32.22  )
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

On Mon, 21 Jul 2025 at 14:18, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Mon, Jul 21, 2025 at 01:31:47PM +1000, Ard Biesheuvel wrote:
> > On Sat, 19 Jul 2025 at 08:07, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > Now that the oldest supported binutils version is 2.30, the macros that
> > > emit the SHA-512 instructions as '.inst' words are no longer needed.  So
> > > drop them.  No change in the generated machine code.
> > >
> > > Changed from the original patch by Ard Biesheuvel:
> > > (https://lore.kernel.org/r/20250515142702.2592942-2-ardb+git@google.com):
> > >  - Reduced scope to just SHA-512
> > >  - Added comment that explains why "sha3" is used instead of "sha2"
> > >
> > > Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> >
> > Acked-by: Ard Biesheuvel <ardb@kernel.org>
> >
> > Nit below
> >
> > > ---
> > >
> > > This patch is targeting libcrypto-next
> > >
> > >  lib/crypto/arm64/sha512-ce-core.S | 27 +++++++--------------------
> > >  1 file changed, 7 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/lib/crypto/arm64/sha512-ce-core.S b/lib/crypto/arm64/sha512-ce-core.S
> > > index 7d870a435ea38..eaa485244af52 100644
> > > --- a/lib/crypto/arm64/sha512-ce-core.S
> > > +++ b/lib/crypto/arm64/sha512-ce-core.S
> > > @@ -10,30 +10,17 @@
> > >   */
> > >
> > >  #include <linux/linkage.h>
> > >  #include <asm/assembler.h>
> > >
> > > -       .irp            b,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
> > > -       .set            .Lq\b, \b
> > > -       .set            .Lv\b\().2d, \b
> > > -       .endr
> > > -
> > > -       .macro          sha512h, rd, rn, rm
> > > -       .inst           0xce608000 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> > > -       .endm
> > > -
> > > -       .macro          sha512h2, rd, rn, rm
> > > -       .inst           0xce608400 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> > > -       .endm
> > > -
> > > -       .macro          sha512su0, rd, rn
> > > -       .inst           0xcec08000 | .L\rd | (.L\rn << 5)
> > > -       .endm
> > > -
> > > -       .macro          sha512su1, rd, rn, rm
> > > -       .inst           0xce608800 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> > > -       .endm
> > > +       /*
> > > +        * While SHA-512 is part of the SHA-2 family of algorithms, the
> > > +        * corresponding arm64 instructions are actually part of the "sha3" CPU
> > > +        * feature.  (Except in binutils 2.30 through 2.42, which used "sha2".
> >
> > Nit: the ARM ARM describes these features as FEAT_SHA256, FEAT_SHA512
> > and FEAT_SHA3, and the latter two happen to have appeared in the same
> > architecture revision. So this is likely just the GCC/binutils devs
> > getting confused, and assuming a) that SHA-3 implies SHA-2 (which is
> > silly if you know the difference) and b) SHA512 has anything to do
> > with SHA-3.
>
> How does the following look?
>
>         /*
>          * We have to specify the "sha3" feature here, since the GNU and clang
>          * assemblers both consider the SHA-512 instructions to be part of the
>          * "sha3" feature.  (Except binutils 2.30 through 2.42, which used
>          * "sha2".  But "sha3" implies "sha2", so "sha3" still works in those
>          * versions.)  "sha3" doesn't make a lot of sense, since SHA-512 is part
>          * of the SHA-2 family of algorithms, and also the Arm Architecture
>          * Reference Manual defines FEAT_SHA512 and FEAT_SHA3 separately.
>          * Regardless, we must use "sha3" to be compatible with the assemblers.
>          */
>

LGTM

> By the way, the ARM ARM does actually have the following:
>
>     If FEAT_SHA256 is implemented, then FEAT_SHA1 is implemented.
>     If FEAT_SHA512 is implemented, then FEAT_SHA256 and FEAT_SHA1 are implemented.
>     If FEAT_SHA3 is implemented, then FEAT_SHA256 and FEAT_SHA1 are implemented.
>
> So some of the SHAs do imply other ones.  But notably absent is
> FEAT_SHA3 implying FEAT_SHA512...

Yeah, and such policies usually evaporate into thin air as soon as
Apple decides to implement something different, so they tend to be
rather meaningless. (E.g, FEAT_SME used to imply FEAT_SVE but it no
longer does)

