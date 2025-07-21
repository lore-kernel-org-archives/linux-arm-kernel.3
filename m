Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4590C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 04:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtYBN9lmkjC76Mt7Kx6/I8B7N0OCpeKMMiOI6vxVohs=; b=nEjoslIDKT+tBEgYdhFDkIWQdl
	dVPXAl0B+XVOXYYbt+o8uv+Exd4shvwA89H41yn7nixYh3Yfh6Gf1gUSIBcQRXO3hPxL/2ZniTLtV
	Z+zN9rSFQMOuJDnA6PKM4xYIxZoIQRfwPS5O3ZMe8huJAEEZVeu6LZITe5bzHGsw1FjMFD0wFg4nN
	UrPiuwslepMmv3abzkWsPbRsLZxMcvR2t8n4WR+3Nt6iHpFCCCjsCHKyu3e+4haG8DVSagiaOr+6n
	lLjTYg8yXy0q3qUkQT4Ae1CxLC2bczOZMyZM6wGhXu0nGpGg7/nx+xdHHWzHXPRfZ2Zr/7Qd+TMKD
	+g3aKXVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udi1G-0000000G9MV-24sF;
	Mon, 21 Jul 2025 04:20:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udhyq-0000000G96z-2WJT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 04:18:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C855143250;
	Mon, 21 Jul 2025 04:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81797C4CEF1;
	Mon, 21 Jul 2025 04:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753071503;
	bh=seQWfNuMVmyihCKpCTMeU9CJJYqh/Fo379bjZ/VmuxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YTtMxOTPjd7MKWNvvkeeVPk9smErtwp04Rb17iw342NCepv5QlT7ben5f0G/Qhbq3
	 3NdeICgNq2VYTmcpqbNT248HVbm4AhezD5xfOuV89RTqlqh77miE0CTsDBh7oq243f
	 Vu8682zZlzi4KhrlAjb44waI9kRdaiNjHk5WMcPEXcHmSFZkbN1ZEuzFTVcFL3/oJw
	 nWlmEchS5ZLohmMTQnPcYiwNBKarV3qioKaOpMt7gG+DvJs4pAz4Arxk8inWWIXZPJ
	 nGrOIWB1l5JSYhHqVNg+HiQUH1EecI9+ml8roM288Se7xh60NtlfLONex0/f8ocLtM
	 SWaNymQ6dtgmw==
Date: Sun, 20 Jul 2025 21:17:35 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] lib/crypto: arm64/sha512-ce: Drop compatibility macros
 for older binutils
Message-ID: <20250721041735.GA3372@sol>
References: <20250718220706.475240-1-ebiggers@kernel.org>
 <CAMj1kXG8rEGH9suNf+s26174-SDrVWaV3RcuY53ysiBbrJtKUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXG8rEGH9suNf+s26174-SDrVWaV3RcuY53ysiBbrJtKUQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_211824_678549_F9446A9C 
X-CRM114-Status: GOOD (  25.89  )
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

On Mon, Jul 21, 2025 at 01:31:47PM +1000, Ard Biesheuvel wrote:
> On Sat, 19 Jul 2025 at 08:07, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > Now that the oldest supported binutils version is 2.30, the macros that
> > emit the SHA-512 instructions as '.inst' words are no longer needed.  So
> > drop them.  No change in the generated machine code.
> >
> > Changed from the original patch by Ard Biesheuvel:
> > (https://lore.kernel.org/r/20250515142702.2592942-2-ardb+git@google.com):
> >  - Reduced scope to just SHA-512
> >  - Added comment that explains why "sha3" is used instead of "sha2"
> >
> > Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> 
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> 
> Nit below
> 
> > ---
> >
> > This patch is targeting libcrypto-next
> >
> >  lib/crypto/arm64/sha512-ce-core.S | 27 +++++++--------------------
> >  1 file changed, 7 insertions(+), 20 deletions(-)
> >
> > diff --git a/lib/crypto/arm64/sha512-ce-core.S b/lib/crypto/arm64/sha512-ce-core.S
> > index 7d870a435ea38..eaa485244af52 100644
> > --- a/lib/crypto/arm64/sha512-ce-core.S
> > +++ b/lib/crypto/arm64/sha512-ce-core.S
> > @@ -10,30 +10,17 @@
> >   */
> >
> >  #include <linux/linkage.h>
> >  #include <asm/assembler.h>
> >
> > -       .irp            b,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
> > -       .set            .Lq\b, \b
> > -       .set            .Lv\b\().2d, \b
> > -       .endr
> > -
> > -       .macro          sha512h, rd, rn, rm
> > -       .inst           0xce608000 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> > -       .endm
> > -
> > -       .macro          sha512h2, rd, rn, rm
> > -       .inst           0xce608400 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> > -       .endm
> > -
> > -       .macro          sha512su0, rd, rn
> > -       .inst           0xcec08000 | .L\rd | (.L\rn << 5)
> > -       .endm
> > -
> > -       .macro          sha512su1, rd, rn, rm
> > -       .inst           0xce608800 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> > -       .endm
> > +       /*
> > +        * While SHA-512 is part of the SHA-2 family of algorithms, the
> > +        * corresponding arm64 instructions are actually part of the "sha3" CPU
> > +        * feature.  (Except in binutils 2.30 through 2.42, which used "sha2".
> 
> Nit: the ARM ARM describes these features as FEAT_SHA256, FEAT_SHA512
> and FEAT_SHA3, and the latter two happen to have appeared in the same
> architecture revision. So this is likely just the GCC/binutils devs
> getting confused, and assuming a) that SHA-3 implies SHA-2 (which is
> silly if you know the difference) and b) SHA512 has anything to do
> with SHA-3.

How does the following look?

	/*
	 * We have to specify the "sha3" feature here, since the GNU and clang
	 * assemblers both consider the SHA-512 instructions to be part of the
	 * "sha3" feature.  (Except binutils 2.30 through 2.42, which used
	 * "sha2".  But "sha3" implies "sha2", so "sha3" still works in those
	 * versions.)  "sha3" doesn't make a lot of sense, since SHA-512 is part
	 * of the SHA-2 family of algorithms, and also the Arm Architecture
	 * Reference Manual defines FEAT_SHA512 and FEAT_SHA3 separately.
	 * Regardless, we must use "sha3" to be compatible with the assemblers.
	 */

By the way, the ARM ARM does actually have the following:

    If FEAT_SHA256 is implemented, then FEAT_SHA1 is implemented.
    If FEAT_SHA512 is implemented, then FEAT_SHA256 and FEAT_SHA1 are implemented.
    If FEAT_SHA3 is implemented, then FEAT_SHA256 and FEAT_SHA1 are implemented.

So some of the SHAs do imply other ones.  But notably absent is
FEAT_SHA3 implying FEAT_SHA512...

- Eric

