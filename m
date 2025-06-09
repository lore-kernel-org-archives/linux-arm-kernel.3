Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C430C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 23:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2w5rX95eeScpv5mqK21JWv/UhtBCWE6Zq/RxFSbaLM=; b=rlhFmHTzs7Tht8fUMmSpnHzyl+
	DYr4zj+DSQy5cFYdL/VkY/2JR+oxreLvJoqmTYgvYIEiTkIJ1E9+b1+ZQX1BS9jwB0obyF15mh/Y4
	jxENYB+Eqbifg8Y3NkcXZxPJmZFw8FOZ+Pj9I8XL9teeI2Do79VRjOp/wQSMgayVw31xiXB9BH/WQ
	1BpXW2aTOYdSjrY6Q1Z7W8uXX9QQ+Dp79BLHXPfzlQRs5NtBx2r++fJFGBLVnmd3zJFch3YG3kfx2
	MgVKsY/k+blgQGIqWwWAG+a79k+nX5XaWAjPtFWJXQUPSZ86/9hYOrnumBMYgoPv07fuMVJtudrjD
	8t08KpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOlVD-00000005PY8-1j4G;
	Mon, 09 Jun 2025 23:02:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOlT3-00000005POT-20nW;
	Mon, 09 Jun 2025 22:59:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B726D4A946;
	Mon,  9 Jun 2025 22:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A46C4CEEB;
	Mon,  9 Jun 2025 22:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749509988;
	bh=U4vhsJXM46e+0Mfc4PBs3bseTa3h9UosBlHtozqeIf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bZ2q/LWijEpaEq00igAvU15ZFA2btFmPEoPv0oTqawn+MjrxKEc4/OqXy2N38kxpV
	 AFvy2lrAzn2djDaUY1swfzB9EZ627MitJD6/avaXEMt58zpc+17thB5+o+L/NCFmXx
	 Bbahqr8beEaE9JLR92svUSP/oo9HcH3K/MV2jUx5drdibhmczFNStuOfZD9lCWMysz
	 P11+Cs72P7BkkpWfSW0Wc/UiWNcR1xk5ksNxTizKDn6BSr0mEtJF/ezlntceoWJxAz
	 yys2b1O4D36HQh8H0QW/vQ0doPIIwaleXhHsMUSvkGTKjPZAQluFZIrFMruyPgxt0i
	 IRxGum7RmzoYw==
Date: Mon, 9 Jun 2025 15:59:26 -0700
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
Message-ID: <20250609225926.GE1255@sol>
References: <20250607200454.73587-1-ebiggers@kernel.org>
 <CAGRGNgV_4X3O-qo3XFGexi9_JqJXK9Mf82=p8CQ4BoD3o-Hypw@mail.gmail.com>
 <20250609194845.GC1255@sol>
 <CAGRGNgXw5LcykjiRS3yteb0K8FmYtb9wp1CJPM+GCKAw7j4ktQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGRGNgXw5LcykjiRS3yteb0K8FmYtb9wp1CJPM+GCKAw7j4ktQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_155949_558387_DE4D53DF 
X-CRM114-Status: GOOD (  41.43  )
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

On Tue, Jun 10, 2025 at 08:36:39AM +1000, Julian Calaby wrote:
> Hi Eric,
> 
> On Tue, Jun 10, 2025 at 5:49 AM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Mon, Jun 09, 2025 at 06:15:24PM +1000, Julian Calaby wrote:
> > > Hi Eric,
> > >
> > > On Sun, Jun 8, 2025 at 6:07 AM Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > This series is also available at:
> > > >
> > > >     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git lib-crc-arch-v2
> > > >
> > > > This series improves how lib/crc supports arch-optimized code.  First,
> > > > instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/, it
> > > > will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
> > > > crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
> > > > functions (e.g. crc32c_base()) will now be part of a single module for
> > > > each CRC type, allowing better inlining and dead code elimination.  The
> > > > second change is made possible by the first.
> > > >
> > > > As an example, consider CONFIG_CRC32=m on x86.  We'll now have just
> > > > crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
> > > > were already coupled together and always both got loaded together via
> > > > direct symbol dependency, so the separation provided no benefit.
> > > >
> > > > Note: later I'd like to apply the same design to lib/crypto/ too, where
> > > > often the API functions are out-of-line so this will work even better.
> > > > In those cases, for each algorithm we currently have 3 modules all
> > > > coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
> > > > sha256-x86.ko.  We should have just one, inline things properly, and
> > > > rely on the compiler's dead code elimination to decide the inclusion of
> > > > the generic code instead of manually setting it via kconfig.
> > > >
> > > > Having arch-specific code outside arch/ was somewhat controversial when
> > > > Zinc proposed it back in 2018.  But I don't think the concerns are
> > > > warranted.  It's better from a technical perspective, as it enables the
> > > > improvements mentioned above.  This model is already successfully used
> > > > in other places in the kernel such as lib/raid6/.  The community of each
> > > > architecture still remains free to work on the code, even if it's not in
> > > > arch/.  At the time there was also a desire to put the library code in
> > > > the same files as the old-school crypto API, but that was a mistake; now
> > > > that the library is separate, that's no longer a constraint either.
> > >
> > > Quick question, and apologies if this has been covered elsewhere.
> > >
> > > Why not just use choice blocks in Kconfig to choose the compiled-in
> > > crc32 variant instead of this somewhat indirect scheme?
> > >
> > > This would keep the dependencies grouped by arch and provide a single place to
> > > choose whether the generic or arch-specific method is used.
> >
> > It's not clear exactly what you're suggesting, but it sounds like you're
> > complaining about this:
> >
> >     config CRC32_ARCH
> >             bool
> >             depends on CRC32 && CRC_OPTIMIZATIONS
> >             default y if ARM && KERNEL_MODE_NEON
> >             default y if ARM64
> >             default y if LOONGARCH
> >             default y if MIPS && CPU_MIPSR6
> >             default y if PPC64 && ALTIVEC
> >             default y if RISCV && RISCV_ISA_ZBC
> >             default y if S390
> >             default y if SPARC64
> >             default y if X86
> 
> I was suggesting something roughly like:
> 
> choice
>     prompt "CRC32 Variant"
>     depends on CRC32 && CRC_OPTIMIZATIONS
> 
> config CRC32_ARCH_ARM_NEON
>     bool "ARM NEON"
>     default y
>     depends ARM && KERNEL_MODE_NEON
> 
> ...
> 
> config CRC32_GENERIC
>     bool "Generic"
> 
> endchoice
> 
> > This patchset strikes a balance where the vast majority of the arch-specific CRC
> > code is isolated in lib/crc/$(SRCARCH), and the exceptions are just
> > lib/crc/Makefile and lib/crc/Kconfig.  I think these exceptions make sense,
> > given that we're building a single module per CRC variant.  We'd have to go
> > through some hoops to isolate the arch-specific Kconfig and Makefile snippets
> > into per-arch files, which don't seem worth it here IMO.
> 
> I was only really concerned with the Kconfig structure, I was
> expecting Kbuild to look roughly like this: (filenames are wrong)
> 
> crc32-y += crc32-base.o
> crc32-$(CRC32_ARCH_ARM_NEON) += arch/arm/crc32-neon.o
> ...
> crc32-$(CRC32_GENERIC) += crc32-generic.o
> 
> but yeah, your proposal here has grown on me now that I think about it
> and the only real "benefit" mine has is that architectures can display
> choices for variants that have Kconfig-visible requirements, which
> probably isn't that many so it wouldn't be useful in practice.
> 
> Thanks for answering my question,

The CRC32 implementation did used to be user-selectable, but that was already
removed in v6.14 (except for the coarse-grained knob CONFIG_CRC_OPTIMIZATIONS
that remains and can be disabled only when CONFIG_EXPERT=y) since the vast
majority of users simply want the optimized CRC32 code enabled.  The fact that
it wasn't just enabled by default was a longstanding bug.

- Eric

