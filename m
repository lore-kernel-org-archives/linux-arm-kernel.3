Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286EDD11717
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 07:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Z5ww8tsz14z0EpRv1r8MjOBORCOnzfSXkYCYwpD6ZE=; b=n9H4D3X9ecBs8jRxsihq1gbsya
	jjOZPdya8sjfyVmlKSmPu6TLUNvwo+op+D5jlXciQmXolaepNLxWD/3jymdMgKTT90t+ajIQo/4yT
	5rJ6isTjf8ecc95wV5QOSWSIeHLv+vY9/4Au8VG3Php/e3IsgEq/1OBCKWn20HTi4ddZ8OM8jEOBK
	HioaQNKKQP9Xekb+tVi6JCoD2RthlXUzif7+Ggi/YF8bJKwO2/ybhj6MLNoKLvHZIV5/PuCFCZ8o9
	3yRtHux+GPWbD+Fme5TiXnwzGXFmO/z+ScRlX7N6Jq9TPImhBWY05P57zqT1pQMa0r3pdAnLSLtia
	Q7Z5WrQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ey0-00000002pta-2Ckg;
	Fri, 25 Oct 2024 07:42:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Evu-00000002pZq-0AUP;
	Fri, 25 Oct 2024 07:41:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3AECDA42C18;
	Fri, 25 Oct 2024 07:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8D1C4CEE7;
	Fri, 25 Oct 2024 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729842028;
	bh=MU0jg6+43zlNLQVd5aws5IUywfNhZ0pf6SBTcrSFP0A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Bns4FpYEweNUDYPWIatTemxTcPXBriNtb6rjMCIGvpZQbQ7/qRGjK2NUk57EKd8ri
	 Mk7HPhv+F7E7+ne72q/Ef8D3KErbLL714tyOI87uCXXzpqZPjXEj/i4/+9MWReDl8T
	 31XCgHFlQsFjl2p95RIKGtfYYk1e4JVgIerVkCXXYdafVkZcg3QKpbq5FXjAqZ38fM
	 DtIUhA6qC/BFjMOrnIVEq9dcd5psyxRFBFdvdxlZAU53TWdpVzWckgliF8es3kpb65
	 T8IX9T0uVRiGneDDJjNiP5c9pbh4ac6m1We4OCbuxBE3WORWLtjtdEfr9QTbaV9H3L
	 0RlKKzK9CtgkA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f84907caso1919826e87.3;
        Fri, 25 Oct 2024 00:40:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8v7QTg3wnbWCBwTGmvsmKn+jebZ0GK7hqRJLEEjHB1+pDFth1okbRpueORDgf9i+fsjpXz7C+QXrLmZeWIYfo@lists.infradead.org, AJvYcCXuneE9bw7WG4RnyCZ+JTkxIHH2IfUKneXp9eANinxBbgfjTxWbmaP8T0NrqjBE8rN3bECSwPixJXZHcXc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwI0Sf2DOjSx0W/+QkZmlfznbAoH4MkyIFJcM3uBzAuq2R9ZPtD
	9AplPMQsECbgV5w15/q6Fc5j8kD83CL25HW1R/H5tQndB3OTn/b/PY+CODUChqomsUE1j2Cji19
	OND3RU/7at00kRv+jZMG5AiHIxZs=
X-Google-Smtp-Source: AGHT+IEDAFlBfPHEymedMPiV9v2ocdpZeEcg/F0dpwJWqR1hIRTo+DXjnmCVJHCSWsx5j4Mh2CDnA31kbRPsOrauBps=
X-Received: by 2002:a05:6512:3c8c:b0:539:8f3c:457c with SMTP id
 2adb3069b0e04-53b23e9d130mr2447127e87.53.1729842026517; Fri, 25 Oct 2024
 00:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241021002935.325878-1-ebiggers@kernel.org>
In-Reply-To: <20241021002935.325878-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 25 Oct 2024 09:40:15 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHDo8dijRbSVuHzTddMhp4A+nc1t8AgvoENmS=DZ-kAOQ@mail.gmail.com>
Message-ID: <CAMj1kXHDo8dijRbSVuHzTddMhp4A+nc1t8AgvoENmS=DZ-kAOQ@mail.gmail.com>
Subject: Re: [PATCH 00/15] Wire up CRC32 library functions to arch-optimized code
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_004030_232777_462B78FA 
X-CRM114-Status: GOOD (  34.71  )
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

On Mon, 21 Oct 2024 at 02:29, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This patchset is also available in git via:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc32-lib-v1
>
> CRC32 is a family of common non-cryptographic integrity check algorithms
> that are fairly fast with a portable C implementation and become far
> faster still with the CRC32 or carryless multiplication instructions
> that most CPUs have.  9 architectures already have optimized code for at
> least some CRC32 variants; however, except for arm64 this optimized code
> was only accessible through the crypto API, not the library functions.
>
> This patchset fixes that so that the CRC32 library functions use the
> optimized code.  This allows users to just use the library instead of
> the crypto API.  This is much simpler and also improves performance due
> to eliminating the crypto API overhead including an indirect call.  Some
> examples of updating users are included at the end of the patchset.
>
> Note: crc32c() was a weird case.  It was a library function layered on
> top of the crypto API, which in turn is layered on top of the real
> library functions.  So while it was easy to use, it was still subject to
> the crypto API overhead.  This patchset provides CRC32C acceleration in
> the real library functions directly.
>
> The updated CRC32 library design is:
>
> - Each arch's CRC32 code (all variants) is in arch/$ARCH/lib/crc32*.
>   This adopts what arm64 and riscv already did.  Note, the crypto
>   directory is not used because CRC32 is not a cryptographic algorithm.
>
> - Weak symbols are no longer used.  Instead there are crc32*_base() and
>   crc32*_arch(), and the appropriate ones are called based on the
>   kconfig.  This is similar to how the ChaCha20 library code works.
>
> - Each arch's CRC32 code is enabled by default when CRC32 is enabled,
>   but it can now be disabled, controlled by the choice that previously
>   controlled the base implementation only.  It can also now be built as
>   a module if CRC32 is a module too.
>
> - Instead of lots of pointless glue code that wires up each CRC32
>   variant to the crypto API for each architecture, we now just rely on
>   the existing shash algorithms that use the library functions.
>
> - As before, the library functions don't provide access to off-CPU
>   crypto accelerators.  But these appear to have very little, if any,
>   real-world relevance for CRC32 which is very fast on CPUs.
>
> Future work should apply a similar cleanup to crct10dif which is a
> variant of CRC16.
>
> I tested all arches in QEMU using CONFIG_CRC32_SELFTEST and the crypto
> self-tests, except for mips which I couldn't figure out how to do.
>
> This patchset has the following dependencies on recent patches:
>
> - "crypto - move crypto_simd_disabled_for_test to lib"
>   (https://lore.kernel.org/linux-crypto/20241018235343.425758-1-ebiggers@kernel.org/)
> - "crypto: x86/crc32c - jump table elimination and other cleanups"
>   (https://lore.kernel.org/linux-crypto/20241014042447.50197-1-ebiggers@kernel.org/)
> - "arm64: Speed up CRC-32 using PMULL instructions"
>   (https://lore.kernel.org/linux-crypto/20241018075347.2821102-5-ardb+git@google.com/)
> - "crypto: Enable fuzz testing for arch code"
>   (https://lore.kernel.org/linux-crypto/20241016185722.400643-4-ardb+git@google.com/)
> - "crypto: mips/crc32 - fix the CRC32C implementation"
>   (https://lore.kernel.org/linux-crypto/20241020180258.8060-1-ebiggers@kernel.org/)
>
> Everything can be retrieved from git using the command given earlier.
>
> Since this patchset touches many areas, getting it merged may be
> difficult.  One option is a pull request with the whole patchset
> directly to Linus.  Another is to have at least patches 1-2 and the
> above dependencies taken through the crypto tree in v6.13; then the arch
> patches can land separately afterwards, followed by the rest.
>
> Eric Biggers (15):
>   lib/crc32: drop leading underscores from __crc32c_le_base
>   lib/crc32: improve support for arch-specific overrides
>   arm/crc32: expose CRC32 functions through lib
>   loongarch/crc32: expose CRC32 functions through lib
>   mips/crc32: expose CRC32 functions through lib
>   powerpc/crc32: expose CRC32 functions through lib
>   s390/crc32: expose CRC32 functions through lib
>   sparc/crc32: expose CRC32 functions through lib
>   x86/crc32: update prototype for crc_pcl()
>   x86/crc32: update prototype for crc32_pclmul_le_16()
>   x86/crc32: expose CRC32 functions through lib
>   lib/crc32: make crc32c() go directly to lib
>   ext4: switch to using the crc32c library
>   jbd2: switch to using the crc32c library
>   f2fs: switch to using the crc32 library
>
...
>  89 files changed, 1002 insertions(+), 2455 deletions(-)

Very nice cleanup!

For the series:

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

