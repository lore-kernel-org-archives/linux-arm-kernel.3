Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EF0C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 05:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rgSRmRXZEE26X8vSLtT6PrIru0MhRBWz1OoeGzH61U=; b=Ufbi9IaRlxboCaUIsDrRuE2pLM
	D4Pyl4mN+fQaU+rbC3nJ2+WgSSVc+9yJUYPBT0Io+ohB6PlMDvPjpPu5g1SWZDh17kBN+Kh58dj7b
	w+sGk3ZD/omFV7W8Z1a+Gls23s5XxlWUNSoKMtohmXk+hGkqfinS7iRYufY/fD21XSTxvAgUAcAc+
	lfcPZJaCtqL9GS+QCNB7p0fIBNL3w1FvzciZ1VqKwruiYK6XQnE0SLlBTikIhxKWBx/6PXulykqct
	SOnvDnpl7XovrQMwDrO9qV3dVksdvXT7gleQ5VOVLo9oHRiH6un1tFP7yBjFA0hYs07IwunTGTycZ
	BnxqQZww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubBgP-00000001BjM-2i8r;
	Mon, 14 Jul 2025 05:24:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubBdy-00000001BCz-3Ed4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 05:22:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B634D60053
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 05:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBBDC4CEF8
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 05:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752470545;
	bh=pAb5wRbhQET+kmUSyBJ7QX6Te7INTWO7qdGK9VkXql0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lzd55PdUdq+c+mAd5uySwMSoUH+kaA4A1+lO4Bp2rWjPOuURmtFTKJqiu8+7oHe/2
	 IWd04Cz6zEMUQGxVCULy4y7Pt258a8kqHbqQ9KRbbYTL89XmaCBSNKFzrQ4lSDmxz6
	 Tn1fhnyzKHfp0lVx3oVYAYX0CFijcSHtacycMNx1oM1cSeYl06AGSSe68K4TL24j/q
	 SndjW3Hf+al+rTdChZ/5v3b+HTWeEzWXggdgAGknnrTSFiaHT1uky0a6o1NuEQsFmJ
	 hO719WuReX0D1U/zm/1TrSO2KoWdJXzHoRvgs2M7wj2fT/zaF4pcbrq0ecVLli1GES
	 XIeDW4bt8QHAg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32f144d0db8so26058461fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 22:22:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVB9MkYt5TwSM13HLepw+z7csLj0F4oa8Q66VV0/mRucnU73iCJWg+Xw+q583DMY12CNPIG3tFMD1yNKbsSpo9@lists.infradead.org
X-Gm-Message-State: AOJu0YxtATKY7wvvViz5672l5mHmfM3MUDEeR60pjk2PFRouZKdmXnnS
	GeGQGtZMkGRDvxhaBJvXYeY98TbabYFvNAUZj62veol4UZTBUtYCUr1+fto6DVoa+at3v5CriVp
	4r82DZbJJ6HsJFVrgv71XEiY2UZ/u7VA=
X-Google-Smtp-Source: AGHT+IF8eKcSow8wXiBWe1ZtHXBbfzA+mJh/QYc9UT+26PKpYbp48jE/SYcyCuO5sRz/aNI8XoUCHiEWvfP2lMj1cew=
X-Received: by 2002:a2e:b894:0:b0:30d:c4c3:eafa with SMTP id
 38308e7fff4ca-330520af931mr41229641fa.7.1752470543799; Sun, 13 Jul 2025
 22:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250712232329.818226-1-ebiggers@kernel.org>
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 14 Jul 2025 15:22:12 +1000
X-Gmail-Original-Message-ID: <CAMj1kXHUY_1nF8_Yiqn9K-G7nkOPQgH5rkmhcHem2pPsxKaQVQ@mail.gmail.com>
X-Gm-Features: Ac12FXyawDsE4qmZuudtL0JGLEW7eYqwCyaWBTQgeIZfWtrJNQHxtUbS816vJ3g
Message-ID: <CAMj1kXHUY_1nF8_Yiqn9K-G7nkOPQgH5rkmhcHem2pPsxKaQVQ@mail.gmail.com>
Subject: Re: [PATCH 00/26] SHA-1 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 13 Jul 2025 at 09:26, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series is also available at:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha1-lib-v1
>
> Patches 1-14 reorganize the kernel's SHA-1 code to be consistent with
> the way the SHA-2 code is now organized:
>
> - Add SHA-1 and HMAC-SHA1 library functions.
> - Make the SHA-1 (and HMAC-SHA1) library functions use the existing
>   architecture-optimized SHA-1 code, which is moved into lib/crypto/.
> - Reimplement the old-school crypto API's "sha1" and "hmac(sha1)"
>   algorithms on top of the SHA-1 and HMAC-SHA1 library functions.
>
> The diffstat for that part is:
>
>     65 files changed, 1052 insertions(+), 1582 deletions(-)
>
> This hopefully should look quite boring and familiar by now, as
> essentially the same cleanup was already applied to SHA-2.
>
> Patch 15 adds sha1_kunit.
>
> Note that while SHA-1 is a legacy algorithm, it still has many in-kernel
> users for legacy protocols.  So it's not like we'll be able to remove
> the SHA-1 code from the kernel anytime soon.  And some of these users
> are currently having to jump through some *major* hoops to work around
> the limitations of the old-school crypto API.  The library API greatly
> simplifies things, and it makes the SHA-1 code consistent with the SHA-2
> code.  So, IMO it's well worth doing this reorganization of the SHA-1
> code, even though SHA-1 is a legacy algorithm.
>
> To show this even more clearly, patches 16-26 convert various users to
> use the SHA-1 library API (or both SHA-1 and SHA-2, in the case of some
> users that use both algorithms).  The diffstat for that part is:
>
>     27 files changed, 169 insertions(+), 903 deletions(-)
>
> For 6.17, I'd like to take patches 1-15 at the most.  Patches 16-26
> would be for later, and I'll probably resend them individually later for
> subsystem maintainers to take.
>
> Eric Biggers (26):
>   crypto: x86/sha1 - Rename conflicting symbol
>   lib/crypto: sha1: Rename sha1_init() to sha1_init_raw()
>   lib/crypto: sha1: Add SHA-1 library functions
>   lib/crypto: sha1: Add HMAC support
>   crypto: sha1 - Wrap library and add HMAC support
>   crypto: sha1 - Use same state format as legacy drivers
>   lib/crypto: arm/sha1: Migrate optimized code into library
>   lib/crypto: arm64/sha1: Migrate optimized code into library
>   lib/crypto: mips/sha1: Migrate optimized code into library
>   lib/crypto: powerpc/sha1: Migrate optimized code into library
>   lib/crypto: s390/sha1: Migrate optimized code into library
>   lib/crypto: sparc/sha1: Migrate optimized code into library
>   lib/crypto: x86/sha1: Migrate optimized code into library
>   crypto: sha1 - Remove sha1_base.h
>   lib/crypto: tests: Add KUnit tests for SHA-1 and HMAC-SHA1
>   bpf: Use sha1() instead of sha1_transform() in bpf_prog_calc_tag()
>   sctp: Use HMAC-SHA1 and HMAC-SHA256 library functions
>   ipv6: sr: Use HMAC-SHA1 and HMAC-SHA256 library functions
>   tee: Use SHA-1 library instead of crypto_shash
>   lib/digsig: Use SHA-1 library instead of crypto_shash
>   drm/bridge: it6505: Use SHA-1 library instead of crypto_shash
>   nfc: s3fwrn5: Use SHA-1 library instead of crypto_shash
>   ppp: mppe: Use SHA-1 library instead of crypto_shash
>   KEYS: trusted_tpm1: Use SHA-1 library instead of crypto_shash
>   ipv6: Switch to higher-level SHA-1 functions
>   lib/crypto: sha1: Remove low-level functions from API
>
...
>  92 files changed, 1472 insertions(+), 2474 deletions(-)

Again, the diffstat speaks for itself.

For the series,

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

