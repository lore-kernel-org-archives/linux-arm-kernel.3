Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE71C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 19:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1PxmnfHMdmrcyvubBDTE9y7CEshlLTBZC8ePZbGBzw=; b=oX3MJRiUH71eq6ZzIWIfneFcfC
	Bqfazx3WPE3V77hRrGmvnGEAnUH/jjM0XkMQ7BB8cORSG9VxTE3KTgrEks5SGKxYBNL+rIp/ff3qO
	WGMLCk2COO9KKwmUUnPMyjRuhVhCA/9mYLAPzIkHRaNckjC/Q0TaWKzdH9Ey2SpzD+fuM0eCVO0fR
	Yje7Tqdpm/mK0CW3aFJtAQGfNvBSxt14pUb9PQifZ+yAE+H5N3V9nO64I6G/+ghxxEaHmFQ6vNAhu
	2RAKx9LzgG99UzS6CU8+psmKFDEAk9vMlz4yJ8lwBBcj86ySOFB2CKn/sDmikZQFbu9Jt/h2raaQD
	7B8EEBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOid2-000000055z1-30wP;
	Mon, 09 Jun 2025 19:57:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOiUW-000000054hY-18xn;
	Mon, 09 Jun 2025 19:49:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E22E629DF;
	Mon,  9 Jun 2025 19:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5945C4CEEB;
	Mon,  9 Jun 2025 19:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749498547;
	bh=RLgUdqwZ9jil0fkdDSzWjVe6IIMp+UtbacVJeNotnRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QK55junN0VbW2TGQ60ZqBGWYViH46R3lRyu4gUydEyY+Hh3KaitiLfFEvBnWI1r1X
	 lRkAy+lEDKGHHODwZuKXmXjD3bma7Uo1p9YeuJDFpOg4S9P5g+Xcg0SSU2vvttcHI9
	 4lR9wO8MNIVxc41xXD74pTH5t5lC3rxHs3ajYv7zAHTC7u7F8taQisrWv24jWv6eEY
	 NAMjDv3elM0fob7CfJw9CVKzwDdg4KQs5dEb5YS6zjc++7S4SPPwQj4A+dAgJwJgOn
	 FVNqVUnGBa5/HSJl7pxNXInlROg8XV9V78mjoJUj00SM7blrPSGCR341rm1XL707q3
	 l5n84gNAl0U8g==
Date: Mon, 9 Jun 2025 12:48:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Julian Calaby <julian.calaby@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is
 integrated
Message-ID: <20250609194845.GC1255@sol>
References: <20250607200454.73587-1-ebiggers@kernel.org>
 <CAGRGNgV_4X3O-qo3XFGexi9_JqJXK9Mf82=p8CQ4BoD3o-Hypw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGRGNgV_4X3O-qo3XFGexi9_JqJXK9Mf82=p8CQ4BoD3o-Hypw@mail.gmail.com>
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

On Mon, Jun 09, 2025 at 06:15:24PM +1000, Julian Calaby wrote:
> Hi Eric,
> 
> On Sun, Jun 8, 2025 at 6:07 AM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > This series is also available at:
> >
> >     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git lib-crc-arch-v2
> >
> > This series improves how lib/crc supports arch-optimized code.  First,
> > instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/, it
> > will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
> > crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
> > functions (e.g. crc32c_base()) will now be part of a single module for
> > each CRC type, allowing better inlining and dead code elimination.  The
> > second change is made possible by the first.
> >
> > As an example, consider CONFIG_CRC32=m on x86.  We'll now have just
> > crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
> > were already coupled together and always both got loaded together via
> > direct symbol dependency, so the separation provided no benefit.
> >
> > Note: later I'd like to apply the same design to lib/crypto/ too, where
> > often the API functions are out-of-line so this will work even better.
> > In those cases, for each algorithm we currently have 3 modules all
> > coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
> > sha256-x86.ko.  We should have just one, inline things properly, and
> > rely on the compiler's dead code elimination to decide the inclusion of
> > the generic code instead of manually setting it via kconfig.
> >
> > Having arch-specific code outside arch/ was somewhat controversial when
> > Zinc proposed it back in 2018.  But I don't think the concerns are
> > warranted.  It's better from a technical perspective, as it enables the
> > improvements mentioned above.  This model is already successfully used
> > in other places in the kernel such as lib/raid6/.  The community of each
> > architecture still remains free to work on the code, even if it's not in
> > arch/.  At the time there was also a desire to put the library code in
> > the same files as the old-school crypto API, but that was a mistake; now
> > that the library is separate, that's no longer a constraint either.
> 
> Quick question, and apologies if this has been covered elsewhere.
> 
> Why not just use choice blocks in Kconfig to choose the compiled-in
> crc32 variant instead of this somewhat indirect scheme?
>
> This would keep the dependencies grouped by arch and provide a single place to
> choose whether the generic or arch-specific method is used.

It's not clear exactly what you're suggesting, but it sounds like you're
complaining about this:

    config CRC32_ARCH
            bool
            depends on CRC32 && CRC_OPTIMIZATIONS
            default y if ARM && KERNEL_MODE_NEON
            default y if ARM64
            default y if LOONGARCH
            default y if MIPS && CPU_MIPSR6
            default y if PPC64 && ALTIVEC
            default y if RISCV && RISCV_ISA_ZBC
            default y if S390
            default y if SPARC64
            default y if X86

We could instead make each arch be responsible for selecting this from
lib/crc/$(SRCARCH)/Kconfig, which lib/crc/Kconfig would then have to include.
But I don't think the small bit of additional per-arch separation would be worth
the extra complexity here.  Something similar applies to lib/crc/Makefile too.

This patchset strikes a balance where the vast majority of the arch-specific CRC
code is isolated in lib/crc/$(SRCARCH), and the exceptions are just
lib/crc/Makefile and lib/crc/Kconfig.  I think these exceptions make sense,
given that we're building a single module per CRC variant.  We'd have to go
through some hoops to isolate the arch-specific Kconfig and Makefile snippets
into per-arch files, which don't seem worth it here IMO.

> It would also allow for alternatives if that ever becomes a thing and

If you mean one arch with multiple alternative implementations of a particular
CRC variant, that already exists for many of the architectures.  They just build
in as many as can be, and the best one is chosen at boot or module load time.

But that's existing behavior, unchanged by this patchset.

> compile testing of the arch-specific variants if that even offers any
> actual value.

They all use instructions specific to the corresponding arch, so I don't think
any of them would be compatible with COMPILE_TEST.

- Eric

