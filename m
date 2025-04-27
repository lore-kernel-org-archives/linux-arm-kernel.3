Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21992C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 13:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHSpiOueUoNTIkl27VuQyXCY6OcM3JqCwXOu2CmkJ+I=; b=TR5OQZBAKwxWCr4Y2UmSRWlNg2
	ewuTaWTf86FpA8knUkI01pSh3OJ0/bJHG70g6GPnfbWwpBq+CLBNlRM1Z87FuS0AHta39Guny/b95
	VnI/sbjlKuWaKxAINjzXT6pblUwaSq+GMQkzzIzXlnQ7mXdc1KJccp36S12+6YNs00n2I7lgP7FfX
	okiF5VlI08hHFiRGLrfkzFPXUSGZbZPBeNZi3B5CNpoA2muWnAKVgAyCZQloils16ZKJQ055YHtCE
	Uc76AiZ3lYcO4vI+pvX/IMbZ+extH8luoAS7mDsnrC1ZA3jjb9Al6ZFPM6bKawa91NlSPgzmS4MG8
	I7Da9PGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u91fi-00000003ZWE-0yB4;
	Sun, 27 Apr 2025 13:03:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u91Yj-00000003YQi-09qM;
	Sun, 27 Apr 2025 12:56:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFCA544F7A;
	Sun, 27 Apr 2025 12:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD42C4CEE3;
	Sun, 27 Apr 2025 12:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745758596;
	bh=AgqV1hMsSjVwY25pYZciWVxf7VAWpBvP9JfqHyR35EI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qV/qYJttnMqF/e8OqPLChbglT+OXe0BUI3C3XJkFZdTZhhNyHpOmlW5bb+1pxLyao
	 gwGGLC+l03/YlzGd5+J56KHsYr0ohKSxDi747S0hGoCacZJ2qaaZmYUqJ2US3FnkyK
	 Tu/o38Ex6SQrwWRr+GMMtqdU70l2SZNmFzlAG7PYaH28iELmPY1EI0osYVw1sYYhyG
	 uGzqeuOneXyF0+JHSk9mnATjjGPRJIaqEHig6iKUkyyMDrwIc+ilmnaGMs99Mvxqgv
	 8h/Ac2RS79Wo+V7nYuNH9MBFb5lhQYMARyeMIsV0ibobHTJbQn5pg36EgAkKZDDFP6
	 PxMIuzZeFmMsQ==
Date: Sun, 27 Apr 2025 05:56:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [v2 PATCH 00/13] Architecture-optimized SHA-256 library API
Message-ID: <20250427125641.GB1161@quark>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
 <20250427123514.GA1161@quark>
 <aA4mAlozk3RvxvTe@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA4mAlozk3RvxvTe@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_055637_100358_635530DA 
X-CRM114-Status: GOOD (  15.63  )
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

On Sun, Apr 27, 2025 at 08:41:38PM +0800, Herbert Xu wrote:
> On Sun, Apr 27, 2025 at 05:35:14AM -0700, Eric Biggers wrote:
> >
> > Well, barely a day and you've already ruined my patch series.  Now instead of a
> > clean design where the crypto_shash API is built on top of the normal library
> > API (sha256_update() etc.), there's now a special low-level API
> > "sha256_choose_blocks()" just for shash that it's built on top of instead, for
> > no good reason.  You're also still pushing your broken BLOCK_HASH_UPDATE_BLOCKS
> > macro that doesn't work with size_t, and putting my name on your broken code
> > that uses it.
> 
> Your design is unacceptable because you're forcing the partial block
> handling on shash where it's not needed,

Excuse me?  It's the other way around.  In my version the partial block handling
is only in the library, not shash.  In your version you've forced it into the
shash layer, even though the library does it already.  I understand that you've
added support for partial block handling to crypto/shash.c and you want to feel
like your work is useful, but in this case it's not, since the libray has to
handle arbitrary-length inputs anyway.

> just as you're forcing the hardirq support on everything.

If you want crypto_shash to warn on hardirq usage you should just put a
WARN_ON(in_hardirq()) in crypto_shash_*(), which will actually achieve that.
Not add a shash-specific non-hardirq-safe low-level API to the library that can
silently corrupt random tasks' SIMD registers on production systems.

- Eric

