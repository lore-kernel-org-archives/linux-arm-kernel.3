Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12D9FD8FF5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8Fwf51Mygx0AWGX8r2o9Nphu/I8BQiLR4Do9iJDy5E=; b=lopk5eoq9gOh7vdaNDV8pU0KSe
	PkmjpEgLG1enzxBiR8EPimMnlFsE9IXXF5bUn3z4zRPZxUl9eWuvmOoVNWV0En854Dk5+fXTTAKHT
	LiVoQW7V0v870GHntVd1xsOLMs/2lcJN89vo7HEOvlQb/YT0iNvlIB3/gpTsCIJfqffZZz1up26Nr
	ssReBc68hDHvYyvI8jZZGTSQifkmdukSBAQc2bH6NFkS5uMCYLwcV6NdNG0rO9WvwBZEZ+KeJZPNB
	b7Mn2CvyAUu2tOfoK70TbDTdoqY3cBawzoKRSu8k4LG7nHJYp+zVH2FpFgzCj4fvad59leTquMEmc
	4uyc++8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfqK-00000006vjX-237h;
	Thu, 26 Feb 2026 18:12:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfqJ-00000006vir-0ag8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 18:12:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 318BC60138;
	Thu, 26 Feb 2026 18:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C8BC116C6;
	Thu, 26 Feb 2026 18:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772129525;
	bh=8Cj4mVY38C6nhdFzrjSAka6RCIWO/rW2rKB3wTy3Mrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uorws0FBPDWAIpjNgZRvwPN30CfVU62ec1xMNL1dXXIixREopcQ7IA/snjB8enMNX
	 4M4DirIRgsvtXnogsIHu5KoLlilHDfujrSPV9lYQ49i+aFpDu4iAiOBA5V/dleIRNq
	 /lmx4vsKqbPgFMrjODdA20VP8LqrR+T2yyNXfhnd/Po3TNEFVkD8Ir+5nxFZ+9yBrE
	 0xk82X6+fhdbtZyFWRbLwIFXGA0S2SLkz8L1rzDYKSyjedMbbXnKwLd9xBRQ1tl0VS
	 80dTiyvlzr3/O/UZIB+K6Eldt1WeEFvlMr2dxBhsEFIQrUOTDJ+t9zlZext145mnF6
	 r+u2fReFBZuhg==
Date: Thu, 26 Feb 2026 10:11:14 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [PATCH 02/12] lib/crypto: tests: Add KUnit tests for NH
Message-ID: <20260226181114.GD2251@sol>
References: <20251211011846.8179-1-ebiggers@kernel.org>
 <20251211011846.8179-3-ebiggers@kernel.org>
 <CAMuHMdVFRQZXCKJBOBDJtpENvpVO39AxGMUFWVQdM6xKTpnYYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVFRQZXCKJBOBDJtpENvpVO39AxGMUFWVQdM6xKTpnYYw@mail.gmail.com>
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

On Thu, Feb 26, 2026 at 02:12:38PM +0100, Geert Uytterhoeven wrote:
> Hi Eric,
> 
> On Thu, 11 Dec 2025 at 02:25, Eric Biggers <ebiggers@kernel.org> wrote:
> > Add some simple KUnit tests for the nh() function.
> >
> > These replace the test coverage which will be lost by removing the
> > nhpoly1305 crypto_shash.
> >
> > Note that the NH code also continues to be tested indirectly as well,
> > via the tests for the "adiantum(xchacha12,aes)" crypto_skcipher.
> >
> > Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> 
> Thanks for your patch, which is now commit 7246fe6cd64475d8
> ("lib/crypto: tests: Add KUnit tests for NH") in v7.0-rc1.
> 
> > --- a/lib/crypto/tests/Kconfig
> > +++ b/lib/crypto/tests/Kconfig
> > @@ -45,10 +45,18 @@ config CRYPTO_LIB_MLDSA_KUNIT_TEST
> >         select CRYPTO_LIB_BENCHMARK_VISIBLE
> >         select CRYPTO_LIB_MLDSA
> >         help
> >           KUnit tests for the ML-DSA digital signature algorithm.
> >
> > +config CRYPTO_LIB_NH_KUNIT_TEST
> > +       tristate "KUnit tests for NH" if !KUNIT_ALL_TESTS
> > +       depends on KUNIT
> > +       default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
> > +       select CRYPTO_LIB_NH
> 
> This select means that enabling KUNIT_ALL_TESTS also enables
> extra functionality, which may not be desirable in a production system.
> Fortunately CRYPTO_LIB_NH is tristate, so in the modular case the
> extra functionality is a module, too, and not part of the running
> system by default.  Unfortunately CRYPTO_LIB_NH is invisible, so this
> cannot just be changed from "select" to "depends on".

I'll probably be changing this, pending the result of the discussion on
the similar thread about CRYPTO_LIB_MLDSA_KUNIT_TEST:
https://lore.kernel.org/linux-crypto/20260226180538.GC2251@sol/

- Eric

