Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE8E606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WCPV0YfK;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wy65muEI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/NsG/k61SgKGNBtT9Y6zpwIPwXzGtY/Em27D4FxMuwU=; b=WCPV0YfK53HX0sgIyIqJxYyxy9
	ts8yyTUoWJ3AG/cz0p2arGl1GbmKqz61js+QwKCV58cB60jmTTMSREhknWkGIsOiUZ5mjrVr7NEE2
	EL2sPWVrGKxADo4zjJoEFsx3yLY7La2/llasQLMr0U9YV2PWh86qOwdECLGqyo/vgfoxH1nHnKn1k
	wzk+7r7WAd3jGi30ZiWtjg5xi7UphR3yBkN329jZH+7GVVn3/aktGh2qTjJ+mPsrEmYgF+CYPezR5
	DZVwUfzsaAT3dSlMzUsi7z3f29aLzUvVuKfHHOwk0ZoXcsUEr4St5i4QsH4D+xQEXOzd8RdVZgozy
	sWpkfy4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdbK-0000000ExGq-1B2w;
	Sun, 01 Nov 2026 22:00:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdbI-0000000ExGk-2VBd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 22:00:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 49B2F43A31;
	Sun,  1 Nov 2026 22:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239F51F000C1;
	Sun,  1 Nov 2026 22:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570428;
	bh=/NsG/k61SgKGNBtT9Y6zpwIPwXzGtY/Em27D4FxMuwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wy65muEI16UbrZF8U12iYKWcfYfjwFOUGE0H6XtVmJWBES/b0HMQ2fT1EzAHv1lF8
	 iCW7h9wKfEpEwcPR7VT5peJrj2MdNydheEh1x2Q1dZ4d0WiJx+EekeZRjIZyoeZF6u
	 r2BG/TJJVIntRCze78IhKBwsU0/ZqZ+mSLYdaAzE9jH0xXZi5jvx2NAeDIt6Bf7Cpr
	 fx64tbOhwXEZQR/jYcmfJWdvzpfOZMSvchV7wEGNdesPe027vOIF08sKw1pnbYquqG
	 /8XyRaKRf4OqaYsoXWVSyhnq3Nu3/t4SUxk+Am11vAhmzruXaJv7NDZ5gttz6bN0iw
	 ed8T8mCSiRuuQ==
Date: Sun, 1 Nov 2026 14:00:23 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 0/4] Get rid of all NEON intrinsics stdint.h type hacks
Message-ID: <20261101220023.GA2689@quark>
References: <20261029135020.272082-6-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029135020.272082-6-ardb+git@google.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 02:50:20PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Recent Clang has become more finicky when it comes to overriding the
> type macros that the freestanding stdint.h consumes when defining the
> uintXX_t types, and so it is time to finally get rid of this entirely.
> 
> So instead of making stdint.h (which comes from the compiler when
> -ffreestanding is set on the command line) agree with the kernel's
> linux/types.h header, avoid the latter entirely in the compilation units
> that actually use the NEON intrinsics (which are always leaf functions
> that are not tightly coupled to kernel APIs).
> 
> Note that the disagreements are about long vs. long long on arm64, and
> long vs. int on 32-bit ARM, so never about types that actually have
> conflicting representations.
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> 
> Ard Biesheuvel (4):
>   lib/crc: Don't include <linux/types.h> in NEON intrinsics code
>   xor: arm/arm64: Move NEON xor_gen() dispatch into the glue code
>   arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h
>   ARM: Drop stdint.h type overrides from asm/neon-intrinsics.h

Reviewed-by: Eric Biggers <ebiggers@kernel.org>

- Eric

