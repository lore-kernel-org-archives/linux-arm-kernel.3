Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2299C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 18:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tus/xKdmnWUuLw9jAiqFeN6zHwi82WZU20d/FzIg45Y=; b=hDF0knFUJ+B7M4E+wma53nvmX2
	nUCPgoTgjT+5E3PEQy/lwMki9hWi6wxemObg/hQj9GA5VX8S8sL46FNx0S/RBEuKAV6AQiH51F9av
	TKytUUeyYfra7xOj9iLC4Bh9afzEAJL9pAOumTpjB+YgZSDRWgPW1rTgHcMrwN/0d2/u1ahnR3rPa
	NUoyjXfLxpEzCxBXV3g9NHNe6NgWLJuz3L2z11zY2qaf0SKVQM4TSFoQzILwg4OCbK9grRhG0D8yq
	Z/vwGxDiVPZ5ZIUD/cDt7/06NrS+TBXUWyi5kKaFAI4a4E8sgIaPH3uwLt2NzlJSp66DhyP9CxZeP
	WA3nfnGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdl7-00000001cO3-2mRe;
	Thu, 15 May 2025 18:56:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdhR-00000001bnq-2Eaq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 18:52:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AEB5D6111C;
	Thu, 15 May 2025 18:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CB4C4CEE7;
	Thu, 15 May 2025 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747335176;
	bh=so+lA3jbVBr0hSrnna7hrpN+V6k/EkJwfbhhlyeCQ+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=doZ9NKmePjbsn5RObCBZHFVFasGfyL+bPSS61MbeLfjNCAjZVlhj/bQ9mSuSiFetG
	 GDHpAGe1vxaKcW7+FCKY84uHo6VsiwpHVXldI3Tm3sMnnVAf1gzQy5E/fVAvp1dgOP
	 pdgUmnccTllEQt8xBh9bD/Md7r+nJvnwmJB1tJFLbDjJhdcOJxoMMKdZhEgCafzKPh
	 ibiu9UokKL5mNx+mVnfnMgBl8Lg5dtbum9Al2cEhmlje+NjRrzCJIs2/ioYUhH4/ZA
	 4gYwKRmBM2+0KYgZw9iyb1FKdig4cbaXz61l8n+Pc24o65o3bKPL2dRIGQNHGeY6t3
	 MIWmU1Z91j5NA==
Date: Thu, 15 May 2025 11:52:54 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	herbert@gondor.apana.org.au, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] crypto: arm64 - Drop asm fallback macros for older
 binutils
Message-ID: <20250515185254.GE1411@quark>
References: <20250515142702.2592942-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515142702.2592942-2-ardb+git@google.com>
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

On Thu, May 15, 2025 at 04:27:03PM +0200, Ard Biesheuvel wrote:
> diff --git a/arch/arm64/crypto/sha512-ce-core.S b/arch/arm64/crypto/sha512-ce-core.S
> index 91ef68b15fcc..deb2469ab631 100644
> --- a/arch/arm64/crypto/sha512-ce-core.S
> +++ b/arch/arm64/crypto/sha512-ce-core.S
> @@ -12,26 +12,7 @@
>  #include <linux/linkage.h>
>  #include <asm/assembler.h>
>  
> -	.irp		b,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
> -	.set		.Lq\b, \b
> -	.set		.Lv\b\().2d, \b
> -	.endr
> -
> -	.macro		sha512h, rd, rn, rm
> -	.inst		0xce608000 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> -	.endm
> -
> -	.macro		sha512h2, rd, rn, rm
> -	.inst		0xce608400 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> -	.endm
> -
> -	.macro		sha512su0, rd, rn
> -	.inst		0xcec08000 | .L\rd | (.L\rn << 5)
> -	.endm
> -
> -	.macro		sha512su1, rd, rn, rm
> -	.inst		0xce608800 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> -	.endm
> +	.arch	armv8-a+sha3

This looked like a mistake: SHA-512 is part of SHA-2, not SHA-3.  However, the
current versions of binutils and clang do indeed put it under sha3.  There
should be a comment that mentions this unfortunate quirk.

However, there's also the following commit which went into binutils 2.43:

    commit 0aac62aa3256719c37be9e0ce6af8b190f45c928
    Author: Andrew Carlotti <andrew.carlotti@arm.com>
    Date:   Fri Jan 19 13:01:40 2024 +0000

        aarch64: move SHA512 instructions to +sha3

        SHA512 instructions were added to the architecture at the same time as SHA3
        instructions, but later than the SHA1 and SHA256 instructions.  Furthermore,
        implementations must support either both or neither of the SHA512 and SHA3
        instruction sets.  However, SHA512 instructions were originally (and
        incorrectly) added to Binutils under the +sha2 flag.

        This patch moves SHA512 instructions under the +sha3 flag, which matches the
        architecture constraints and existing GCC and LLVM behaviour.

So probably we need ".arch armv8-a+sha2+sha3" to support binutils 2.30 through
2.42, as well as clang and the latest version of binutils?  (I didn't test it
yet, but it seems likely...)

- Eric

