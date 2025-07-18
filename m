Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7175C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 22:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsk3V0VQbIGNF9V9BzfAdoh2nj3qMwMbQELsKvZiEGg=; b=earTjdvlUkQDrRw5fxaeTunmLQ
	oUY8Lwci6MLHmq94KYtEly+vDmUROm7FF619uObSx0T/+hsbLJqowO8KEtPnpwYPdikyoeN66YTBX
	vdOcJOBGUCoPXcMz4TceMWG4ZAhKFQrnMyWZDzIQgszT1pRDOsifpH11tYSWyGBlmAjI+TFys//HI
	T/lNkY5yHlIj6PHezyZH+OOnTIav2jm3zNjHrELtcnLft8jLGcdc/luOWrgohk6P5VQBF3nTcZL87
	x3R7Qa30AL6dMjwnR/q8+AJjnFrEHfl3I8BvhijrUlo3K0M3OxHYcA7UFnEPRuglHrmbFcK0SHgEM
	9fyuw2Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctQG-0000000DXJl-3thV;
	Fri, 18 Jul 2025 22:19:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctNo-0000000DX3n-28KB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 22:16:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F62A5C6740;
	Fri, 18 Jul 2025 22:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897F2C4CEEB;
	Fri, 18 Jul 2025 22:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752877006;
	bh=7dLXUaF35JFLXtVTJdtA116rk6KmdNjbrXNKgyo9x2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=smzVaC/zru/NZ1OsUtZOzGpL7N2eQefqsGBjzyFWUkAN0aNtqoCO8KdJL1ox3qIku
	 NppnIL86fa467tWVN8CKnOmaJXQEhjmUd7dIK1qMZ9MMBHlBHZhjgaVwjMHC828xP7
	 EpN7WXxixhShElVmYRKuNzjEOEx4Exh3pFwOPRpp44lucJ6u2MljRWlqMlltLI57iK
	 iWTwvEfRWEVGc00cTLTLCC7VMVd03VU+fMOBd85SCL9ZM1mMnyaN3QCmmFHua0mBcJ
	 8MRuNUHIg8g6MpSqXbGnvZa6FcuP6VJgzxY9TkpoI01ODX4Y5HPwWQWV2RY1bvpzYA
	 dMj4qgCktthIQ==
Date: Fri, 18 Jul 2025 15:16:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	herbert@gondor.apana.org.au, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] crypto: arm64 - Drop asm fallback macros for older
 binutils
Message-ID: <20250718221645.GA295346@quark>
References: <20250515142702.2592942-2-ardb+git@google.com>
 <20250515185254.GE1411@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515185254.GE1411@quark>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_151648_630634_F327B3A7 
X-CRM114-Status: GOOD (  22.30  )
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

Actually "sha2" isn't required here, since "sha3" implies "sha2".

The kernel test robot did report a build error on this series.  But it
was with SHA-3, because in binutils 2.40 and earlier the SHA-3
instructions required both "sha3" and "armv8.2-a", not just "sha3" like
they do in clang and in binutils 2.41 and later.

For now, I split the SHA-512 part into a separate patch
https://lore.kernel.org/r/20250718220706.475240-1-ebiggers@kernel.org

- Eric

