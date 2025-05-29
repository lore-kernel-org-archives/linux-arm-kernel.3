Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2FEC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 21:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTNYtq1UD+R7Rv0tjNNBO8Ei3GpFoMN9I+bpJd0/ywc=; b=2/bnCqAuaLvEvyjadQXJtWLaMm
	fxOjY5l8NbY6nLvoV36ZMdRbUGaX9RClfsidNReNlv+tdhjVziJUC3wPuUN3/+ujtUnZLia97f+8l
	tgpcE+8W+Ef1Ci73o31C6h/+LsIu1gm3bYTilduq5XT8BjxWIZceOG+TqD28lDsgK6S8zZBPsU2eC
	hI5isw42nKCtUZzRyLU0HdYW9bERdnYzhCf8+/SAKnw3U/o4jryVJSJ7RN81R6CShc1IFjl1uIm69
	mMCwKL8su/qPw3mfpfRwzzioDG+DOkeC2yvmxBJifzR+6iTpNp2+pZJx4oKMMfbGXQIYHOlVPwjz9
	GuiTHIog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKkec-0000000GYXR-1aKS;
	Thu, 29 May 2025 21:19:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKkcT-0000000GYHZ-3zTo;
	Thu, 29 May 2025 21:16:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D0A95A4FCA7;
	Thu, 29 May 2025 21:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1369DC4CEE7;
	Thu, 29 May 2025 21:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748553416;
	bh=XwSNpCLmOFYgZlT+vqB/zkYXZoNvF9LKBVo7R5SnQvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QE8FafhOJkbO0j8ajuGRE3oOAuSmqOSe7+1Bbv1xaRWE+GEqFHoQqKjHSPvlNvh8X
	 xaUXj42tdidF41Kr/O4VBBHdBcT46ME5JSAvysORACebdBaYt/za2ZLB9918zp+HG/
	 MnTpyOhxty75uU+RXJ/hyhZ6ZnSbvFM0C/SEeS/SzucQNcldj5qInocL0jscgQrZRV
	 HhOFx1gcMCLB7GCwEsyACsRzhuz4ZFAVektyXrTVvZu3lyC0ag9CwrjioZ4ERbFnpv
	 2HihaHdw1NUs7EO0PJ+YiMAi46LzXEFvynTHxRPB6/YcS/xwivV8yxQqvqZb39Kokc
	 VTl+yzDZkdWRA==
Date: Thu, 29 May 2025 14:16:39 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
Message-ID: <20250529211639.GD23614@sol>
References: <20250428170040.423825-1-ebiggers@kernel.org>
 <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com>
 <20250529173702.GA3840196@google.com>
 <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_141658_148068_B0BB1B74 
X-CRM114-Status: GOOD (  39.72  )
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

On Thu, May 29, 2025 at 01:14:31PM -0700, Linus Torvalds wrote:
> On Thu, 29 May 2025 at 10:37, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > Long-term, I'd like to find a clean way to consolidate the library code for each
> > algorithm into a single module.
> 
> No, while I think the current situation isn't great, I think the "make
> it one single module" is even worse.
> 
> For most architectures - including s390 - you end up being in the
> situation that these kinds of hw accelerated crypto things depend on
> some CPU capability, and aren't necessarily statically always
> available.
> 
> So these things end up having stupid extra overhead due to having some
> conditional.
> 
> That extra overhead is then in turn minimized with tricks like static
> branches, but that's all just just piling more ugly hacks on top
> because it picked a bad choice to begin with.
> 
> So what's the *right* thing to do?
> 
> The right thing to do is to just link the right routine in the first
> place, and *not* have static branch hackery at all. Because you didn't
> need it.
> 
> And we already do runtime linking at module loading time. So if it's a
> module, if the hardware acceleration doesn't exist, the module load
> should just fail, and the loader should go on to load the next option.

So using crc32c() + ext4 + x86 as an example (but SHA-256 would be very
similar), the current behavior is that ext4.ko depends on the crc32c_arch()
symbol.  That causes crc32-x86.ko to be loaded, which then depends on the
crc32c_base() symbol as a fallback, which causes crc32.ko to be loaded too.  My
idea is to consolidate the two crc32 modules into one (they always go together,
after all), keeping the same symbols.  The main challenge is just the current
directory structure.

Your suggestion sounds like: ext4.ko would depend on the crc32c() symbol, which
would be defined in *both* crc32-x86.ko and crc32.ko.  The module loader would
try to load crc32-x86.ko first.  If the CPU does not support any of the x86
accelerated CRC32 code, then loading that module would fail.  The module loader
would then load crc32.ko instead.

Does any of the infrastructure to handle "this symbol is in multiple modules and
they must be loaded in this particular order" actually exist, though?

And how do we avoid the issues the crypto API often has where the accelerated
modules don't get loaded, causing slow generic code to unnecessarily be used?

IMO this sounds questionable compared to just using static keys and/or branches,
which we'd need anyway to support the non-modular case.

> Not any silly "one module to rule them all" hackery that only results
> in worse code. Just a simple "if this module loads successfully,
> you'll link the optimal hw acceleration".
> 
> Now, the problem with this all is the *non*modular case.
> 
> For modules, we already have the optimal solution in the form of
> init-module error handling and runtime linking.
> 
> So I think the module case is "solved" (except the solution is not
> what we actually do).
> 
> For the non-module case, the problem is that "I linked this
> unconditionally, and now it turns out I run on hardware that doesn't
> have the capability to run this".
> 
> And that's when you need to do things like static_call_update() to
> basically do runtime re-linking of a static decision.
> 
> And currently we very much do this wrong. See how s390 and x86-64 (and
> presumably others) basically have the *exact* same problems, but they
> then mix static branches and static calls (in the case of x86-64) and
> just have non-optimal code in general.
> 
> What I think the generic code should do (for the built-in case) is just have
> 
>         DEFINE_STATIC_CALL(sha256_blocks_fn, sha256_blocks_generic);
> 
> and do
> 
>         static_call(sha256_blocks_fn)(args..);
> 
> and then architecture code can do the static_call_update() to set
> their optimal version.
> 
> And yeah, we'd presumably need multiple versions, since there's the
> whole "is simd usable" thing. Although maybe that's going away?

Moving the static_call into the generic code might make sense.  I don't think
it's a win in all cases currently, though.  Only x86 and PPC32 actually have a
real static_call implementation; everywhere else it's an indirect call which is
slower than a static branch.  Also, some arch code is just usable
unconditionally without any CPU feature check, e.g. the MIPS ChaCha code.  That
doesn't use (or need to use) a static call or branch at all.

Also, while the centralized static_call would *allow* for the generic code to be
loaded while the arch code is not, in the vast majority of cases that would be a
bug, not a feature.  The generic crypto infrastructure has that bug, and this
has caused a huge amount of pain over the years.  People have to go out of the
way to ensure that the arch-optimized crypto code gets loaded.  And they often
forget, resulting in the slow generic code being used unnecessarily...

Making the arch-optimized code be loaded through a direct symbol dependency
solves that problem.

- Eric

