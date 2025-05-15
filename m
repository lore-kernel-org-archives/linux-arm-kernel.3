Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A41C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 19:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1LDMZWzKKUnc76AV3JTXeJIaKwsx4smaIC3+XL7NXc=; b=kNSpNn5e4aia/VEGEgF+FC6CkN
	6C3A24v3HYdRDLnbsr5OZYHU1gUvjBrC3Jy1zyxE9kYBMRcohSUg7CHJyJwon2Mv5A3PrLJsVOn4E
	VaPyZs7gj8eW1RRUJmiDdrm+5h2DcgAfzOcxjd/GT76Yk6ac4cEB9c52WS9nbo0xG1/jOTEEXOPMT
	5l/UTqg8lrTmROsA4u+LcXwLNRGrp3Z8awCZhXlfVASjt7KOKBI8G+7LTbiv0cba1NbLowSFT6W4J
	5zOAwtGuW79NH/6o7WoXRxGeE6haxt6h9njzs9pA90b1cpPqS2IHkBAtqdOmqGUT0/zT6YO5XZU+J
	SzFjCu3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFe14-00000001efv-3HEN;
	Thu, 15 May 2025 19:13:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFds1-00000001dQc-24HE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 19:03:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 967875C5CB4;
	Thu, 15 May 2025 19:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4796DC4CEED;
	Thu, 15 May 2025 19:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747335832;
	bh=VRagaSXsAIeqVRRt2t467sjr8Yeh2sZcXNEljQZBvMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHcQZoZoih1+JodqxsZE/ed3QeB7hprD3wT8BXY6az9msb/0XaXtL3/tJ7gny1yxY
	 lpa10rv5j0h/05KyFtj8S7wr/jDVelySWK3ncdEizHTxSiRKzdxFIdFpxOGjOn09r8
	 Kcah5X7qsHgrqXhiMJXXANEbR03jWO0C/HRxNiwtSvl1faUOSwDDCoUmbNOgdW4sxJ
	 N894zZvMFCIJMk+JrEVpGJIv45FmbEYV7I/RU5Kn+54t7mPpOTn+N7ck9SBC0Apso0
	 3HHe3IaaL6v9d/UM1ghjKFH1DKYZxhUIinhBUXqnCLEc0VVedWJmJ7bMPLBWRu7pIB
	 PVAyX0iIN2Tsw==
Date: Thu, 15 May 2025 12:03:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	herbert@gondor.apana.org.au, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] crypto: arm64 - Drop asm fallback macros for older
 binutils
Message-ID: <20250515190350.GF1411@quark>
References: <20250515142702.2592942-2-ardb+git@google.com>
 <20250515185254.GE1411@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515185254.GE1411@quark>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_120353_618554_C61C7E8C 
X-CRM114-Status: GOOD (  22.47  )
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

On Thu, May 15, 2025 at 11:52:54AM -0700, Eric Biggers wrote:
> On Thu, May 15, 2025 at 04:27:03PM +0200, Ard Biesheuvel wrote:
> > diff --git a/arch/arm64/crypto/sha512-ce-core.S b/arch/arm64/crypto/sha512-ce-core.S
> > index 91ef68b15fcc..deb2469ab631 100644
> > --- a/arch/arm64/crypto/sha512-ce-core.S
> > +++ b/arch/arm64/crypto/sha512-ce-core.S
> > @@ -12,26 +12,7 @@
> >  #include <linux/linkage.h>
> >  #include <asm/assembler.h>
> >  
> > -	.irp		b,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
> > -	.set		.Lq\b, \b
> > -	.set		.Lv\b\().2d, \b
> > -	.endr
> > -
> > -	.macro		sha512h, rd, rn, rm
> > -	.inst		0xce608000 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> > -	.endm
> > -
> > -	.macro		sha512h2, rd, rn, rm
> > -	.inst		0xce608400 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> > -	.endm
> > -
> > -	.macro		sha512su0, rd, rn
> > -	.inst		0xcec08000 | .L\rd | (.L\rn << 5)
> > -	.endm
> > -
> > -	.macro		sha512su1, rd, rn, rm
> > -	.inst		0xce608800 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> > -	.endm
> > +	.arch	armv8-a+sha3
> 
> This looked like a mistake: SHA-512 is part of SHA-2, not SHA-3.  However, the
> current versions of binutils and clang do indeed put it under sha3.  There
> should be a comment that mentions this unfortunate quirk.
> 
> However, there's also the following commit which went into binutils 2.43:
> 
>     commit 0aac62aa3256719c37be9e0ce6af8b190f45c928
>     Author: Andrew Carlotti <andrew.carlotti@arm.com>
>     Date:   Fri Jan 19 13:01:40 2024 +0000
> 
>         aarch64: move SHA512 instructions to +sha3
> 
>         SHA512 instructions were added to the architecture at the same time as SHA3
>         instructions, but later than the SHA1 and SHA256 instructions.  Furthermore,
>         implementations must support either both or neither of the SHA512 and SHA3
>         instruction sets.  However, SHA512 instructions were originally (and
>         incorrectly) added to Binutils under the +sha2 flag.
> 
>         This patch moves SHA512 instructions under the +sha3 flag, which matches the
>         architecture constraints and existing GCC and LLVM behaviour.
> 
> So probably we need ".arch armv8-a+sha2+sha3" to support binutils 2.30 through
> 2.42, as well as clang and the latest version of binutils?  (I didn't test it
> yet, but it seems likely...)

I see there's also a similar quirk where "sm4" enables the SM3 instructions.
The use of that in sm3-ce-core.S could use a comment as well...

Fortunately at least in that case it looks like the instructions were always
under "sm4" in both binutils and clang.

- Eric

