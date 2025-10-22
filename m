Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA23CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zyzDM70PHOr4SAYKOb2qbC6ifKj82l5+t1x+gd/C8bE=; b=RgUvAtwrOtL84ViMCXrO1P9OEa
	8Op6JGzeSOmbtnFSu3o22wYmSoBrJNgVV9sRDFTuGj3VQxYR6GInmo00cORB1LCQuvAyP/zgxFuqm
	azeZpzzqkyjmdn6eJUaaAZbeaFDXf+NrjJLxOx4h7cmQLSMG+gGqBJWN9YVZ73kqTt/pHpPVmD8K0
	NGktFFCBUN+zFkDyqBOY7+d16tGQAq1MsvlCtLEvPKUH7a0W3hrj6oPA6Hfn4mua8L4vfUxin7vzH
	V31z2gvxb6D1bEhtJj3ls0PGo7ka58jBfv5Y2tcDIQC1m4zF3b5hvdQH54dmd1fQMlcJFoEqhcDn1
	2w7smjsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVqe-00000002Qrt-44AD;
	Wed, 22 Oct 2025 10:13:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVqa-00000002Qq9-1t0r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:13:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74D924A3A8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 10:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546FEC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 10:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761128015;
	bh=xbleyjew/gUw5tjiH+F/GM5sPSqPUuGp5zFrXdHnEss=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cf+J0OUsUIRcsHSBwhz7YYf0Z9ymKDK8GA1J6sql1jQu86YEQyfe66TD9dRlWn0fJ
	 QxrInwySwhAi0o5kYZrKes3WJ2nzRGBOCd7FwAdipREv5jRGCRMV3IUUimULjKLnfl
	 +Z0mdXVCUyzfK5up5HUbAFqPGJZcQ8OFOYfLsrPTmYSAcZjplbwcIg7YbDT8uyTR4Z
	 i/IZKEQtk83EbTkiPASU5XBSDqduHq4NPrpPw2voDdoZ/fvNbX6Xt0yPJqXlVV0nHy
	 lzJCtpmGOXU1EZV5iqntyALSeMSBpqBto9lXNShOBD0OXh5Fn5LIZU6quA5krtgF0j
	 GJ74B0vbZiqsQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-591eb980286so2277973e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 03:13:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTMtKt7lbvJZkJvJF3ihxqJZEWVDFvn2kM9GNKnj43uEQsgn2Qu3CrlqN2A/9tlzDHul83Dmo9ZfXIjjk2YWis@lists.infradead.org
X-Gm-Message-State: AOJu0YykMkN3J9MHvneWXJggLClyLLps4ZzDqaOLifCe5OOHW+m92Z4C
	JTdBXUcKJJhsCI0fEirXAUpA8bWmHN9w/98j03QqCIDn1Oj48IFaMIFCVUgtQz7ClR+h1T4PB2W
	+V1a0U742JmduAN4FygoQexM4maycONI=
X-Google-Smtp-Source: AGHT+IFcCPrNwnq8tqyu26uoCns+CxnDTAM88jzdNDUEvsfOGixRrsmaAiH98/VG4HRDwveCRetRp7qwt02Fdgsnfd0=
X-Received: by 2002:a05:6512:159b:b0:55f:6fb4:e084 with SMTP id
 2adb3069b0e04-591d85739edmr7396384e87.50.1761128013726; Wed, 22 Oct 2025
 03:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251020005038.661542-1-ebiggers@kernel.org>
In-Reply-To: <20251020005038.661542-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 22 Oct 2025 12:13:22 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEh=nS+pFgJUm5Vsyk1fMvY0dJNjLzA90Zj4AQPrD5ZYg@mail.gmail.com>
X-Gm-Features: AS18NWDkFNpIn7aOJ7I-K06jIqbriS-x6sjlQuJbYrgZlUVLWfy8F6r6U1x3XZ0
Message-ID: <CAMj1kXEh=nS+pFgJUm5Vsyk1fMvY0dJNjLzA90Zj4AQPrD5ZYg@mail.gmail.com>
Subject: Re: [PATCH 00/17] SHA-3 library
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_031336_552026_A1D2477E 
X-CRM114-Status: GOOD (  17.21  )
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

On Mon, 20 Oct 2025 at 02:53, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series is targeting libcrypto-next.  It can also be retrieved from:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha3-lib-v1
>
> This series builds on the first 5 patches of David's v6 series
> (https://lore.kernel.org/r/20251017144311.817771-1-dhowells@redhat.com),
> which I've included unmodified as the initial patches.  The remaining
> patches improve the SHA-3 library, for example by simplifying the API
> and migrating the existing arm64 and s390-optimized SHA-3 code into the
> library.  The last patch reimplements the sha3-* crypto_shash algorithms
> on top of the library.
>
> If the s390 folks could re-test the s390 optimized SHA-3 code, that
> would be helpful.  QEMU doesn't support the instructions it uses.
>
> David Howells (5):
>   s390/sha3: Rename conflicting functions
>   arm64/sha3: Rename conflicting functions
>   lib/crypto: Add SHA3-224, SHA3-256, SHA3-384, SHA3-512, SHAKE128,
>     SHAKE256
>   lib/crypto: Move the SHA3 Iota transform into the single round
>     function
>   lib/crypto: Add SHA3 kunit tests
>
> Eric Biggers (12):
>   lib/crypto: sha3: Fix libsha3 build condition
>   lib/crypto: sha3: Use appropriate conversions in
>     sha3_keccakf_generic()
>   lib/crypto: sha3: Drop unfinished SHAKE support from
>     gen-hash-testvecs.py
>   lib/crypto: sha3: Consistently use EXPORT_SYMBOL_GPL
>   lib/crypto: sha3: Replace redundant ad-hoc test with FIPS test
>   lib/crypto: sha3: Simplify the API
>   lib/crypto: sha3: Document one-shot functions in header and improve
>     docs
>   crypto: arm64/sha3 - Update sha3_ce_transform() to prepare for library
>   lib/crypto: arm64/sha3: Migrate optimized code into library
>   lib/crypto: s390/sha3: Migrate optimized code into library
>   crypto: jitterentropy - use default sha3 implementation
>   crypto: sha3 - Reimplement using library API
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

