Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEDCC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 04:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xX4FNeTuSGXtFH26CirPRJt3Ku8KpY645McDczejZA=; b=y9GlLrqb9z2bz1zxL7yqgWnJPW
	h2GNkwowXqTpUcYrHEEuXOw/QhbbItRPWBsz414rx4479aVKUd2PinRoU3XahBAWmiiWFSqNYXrWb
	St6fvvLY0OWs2o0MTb4Cf2kunuM04sVmYdjCTRyG00lYfgBOeO+4PUncR81kJe+GVmytsF88O5t9o
	e/XIq6S8Bvb6UTLjXBMfMy25HOLb/68o9X7c/uj4n9wSFNCf8KHaekBi/nx+HDUHbsX78OBghHJKk
	K0NrJEltKFTFP+W38T2tqD2LsYUnP4iMk7WPlKqq1Hj47sMhuoW/UdT8w2LS/JFnzgDsf+0XX51Hg
	G7BfTyiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udiQH-0000000GCED-0S58;
	Mon, 21 Jul 2025 04:46:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udiJB-0000000GBKE-2YCj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 04:39:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A6A00A52746
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 04:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3F2C4CEF4
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 04:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753072764;
	bh=+NBfCXOVbJTCcOUVmuXMnaKWytljkns5NLJTUzQdkT8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AsAp/svaIVEgP1VpxIVkZO33cX4wAekY+udfWkSUnSKMRlSGvLlYY2utXrHjspxFQ
	 TCJvJyaVm6c4VaL+V8a70fPDo4NxRsgMKinWa4N+sPVZm3+CAlQ5haAt7C3GrKIYDe
	 FF3HXRPPL7ygJFOLXt3H4BOcQW4hPs+zB94mgEPykDe+DsHv7kwWRkneqY2TLkmGSp
	 okfpx2xChaw6ZYvbbsfKilJS/v165UiB1CVeJvuI/IgsJBrH+EOy5RtYevctmzcuUq
	 VXaaLjI27xXWYmj9yhN1HUi7K9F8dseSNveHxmPx8M/Cit1JEX7WOqVcd3vzOP8IBo
	 i6xAy4jnXi86w==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32e14ce168eso42795591fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 21:39:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvJkEc1sjQFnr1Qo+NTPNuPsHGZxDrzGPcXiKAHvxTwL0u9HaqyWwmEQhy61aLsATJzFSvRwjy8k1nUXIFDF3c@lists.infradead.org
X-Gm-Message-State: AOJu0YyVpcATUeSXsGkv8oYtODRlgC23OM5qW/93G+K44/aZxyp6iEsH
	ZF11qZ0dgDL0XM60RWIVh/ab9BjYqgABK2+ZQdJYwy1YRlApgq2nMWe8WHZRFvoZ+s3RXpCaRMR
	GEM3tfWubjP0grXvMeV8yqM250RkAbqA=
X-Google-Smtp-Source: AGHT+IEGeV7RQBO68+P8sQxm2CQn5VI9n6G5dpD6w9QCbCBwUCCgh9IpBbAyyug/+b7rFd+0lHZpVseIsQyv1AFi5Lk=
X-Received: by 2002:a2e:ae18:0:10b0:32f:22f8:a7a1 with SMTP id
 38308e7fff4ca-3308f61c682mr40110971fa.32.1753072762733; Sun, 20 Jul 2025
 21:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250515142702.2592942-2-ardb+git@google.com> <20250515185254.GE1411@quark>
 <20250718221645.GA295346@quark>
In-Reply-To: <20250718221645.GA295346@quark>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 21 Jul 2025 14:39:05 +1000
X-Gmail-Original-Message-ID: <CAMj1kXGp-643YkYko4V-L=nARY5OEMJPp+zQ+2tqzjj4MuyHQQ@mail.gmail.com>
X-Gm-Features: Ac12FXwhjxTpeivRdfUvJzMe4UjTzvKkHRmLnAluAqeGcL4VFi4H-osOnzM-reQ
Message-ID: <CAMj1kXGp-643YkYko4V-L=nARY5OEMJPp+zQ+2tqzjj4MuyHQQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: arm64 - Drop asm fallback macros for older binutils
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, herbert@gondor.apana.org.au
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_213925_779552_5A6474F7 
X-CRM114-Status: GOOD (  29.00  )
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

On Sat, 19 Jul 2025 at 08:16, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Thu, May 15, 2025 at 11:52:54AM -0700, Eric Biggers wrote:
> > On Thu, May 15, 2025 at 04:27:03PM +0200, Ard Biesheuvel wrote:
> > > diff --git a/arch/arm64/crypto/sha512-ce-core.S b/arch/arm64/crypto/sha512-ce-core.S
> > > index 91ef68b15fcc..deb2469ab631 100644
> > > --- a/arch/arm64/crypto/sha512-ce-core.S
> > > +++ b/arch/arm64/crypto/sha512-ce-core.S
> > > @@ -12,26 +12,7 @@
> > >  #include <linux/linkage.h>
> > >  #include <asm/assembler.h>
> > >
> > > -   .irp            b,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
> > > -   .set            .Lq\b, \b
> > > -   .set            .Lv\b\().2d, \b
> > > -   .endr
> > > -
> > > -   .macro          sha512h, rd, rn, rm
> > > -   .inst           0xce608000 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> > > -   .endm
> > > -
> > > -   .macro          sha512h2, rd, rn, rm
> > > -   .inst           0xce608400 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> > > -   .endm
> > > -
> > > -   .macro          sha512su0, rd, rn
> > > -   .inst           0xcec08000 | .L\rd | (.L\rn << 5)
> > > -   .endm
> > > -
> > > -   .macro          sha512su1, rd, rn, rm
> > > -   .inst           0xce608800 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> > > -   .endm
> > > +   .arch   armv8-a+sha3
> >
> > This looked like a mistake: SHA-512 is part of SHA-2, not SHA-3.  However, the
> > current versions of binutils and clang do indeed put it under sha3.  There
> > should be a comment that mentions this unfortunate quirk.
> >
> > However, there's also the following commit which went into binutils 2.43:
> >
> >     commit 0aac62aa3256719c37be9e0ce6af8b190f45c928
> >     Author: Andrew Carlotti <andrew.carlotti@arm.com>
> >     Date:   Fri Jan 19 13:01:40 2024 +0000
> >
> >         aarch64: move SHA512 instructions to +sha3
> >
> >         SHA512 instructions were added to the architecture at the same time as SHA3
> >         instructions, but later than the SHA1 and SHA256 instructions.  Furthermore,
> >         implementations must support either both or neither of the SHA512 and SHA3
> >         instruction sets.  However, SHA512 instructions were originally (and
> >         incorrectly) added to Binutils under the +sha2 flag.
> >
> >         This patch moves SHA512 instructions under the +sha3 flag, which matches the
> >         architecture constraints and existing GCC and LLVM behaviour.
> >
> > So probably we need ".arch armv8-a+sha2+sha3" to support binutils 2.30 through
> > 2.42, as well as clang and the latest version of binutils?  (I didn't test it
> > yet, but it seems likely...)
>
> Actually "sha2" isn't required here, since "sha3" implies "sha2".
>
> The kernel test robot did report a build error on this series.  But it
> was with SHA-3, because in binutils 2.40 and earlier the SHA-3
> instructions required both "sha3" and "armv8.2-a",

... even though it is part of the ARMv8.1 architecture revision ...

> not just "sha3" like
> they do in clang and in binutils 2.41 and later.
>
> For now, I split the SHA-512 part into a separate patch
> https://lore.kernel.org/r/20250718220706.475240-1-ebiggers@kernel.org
>

That looks fine. I'll revisit the remaining ones at some point, but
not a priority.

