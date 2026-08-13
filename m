Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41149C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 15:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pojo/5ihe+x3tRo9VM4Cq8odA8bQ3ul0KyDtov7i6YE=; b=YM8q8KSUVLCHFQroMrLpIBExi4
	Ppm5eMGkbqaLMRdDm+To4nn0irRUjyNUdTTRbO+5MhcIRBvu0Gjjj2F0Zyf1w9i2nDisIqIkaaFqh
	A+sWVH1F8ciggrzzryXp+Y9ZxRFlZfk0FXhOwBAfE4gwh+L7KlHH1jjQ73ZAZhLW5bF7L8+eHC5OX
	HpKfgY/PJWJlP3RWqRXh5HZDIVqygVlF6B3vWqcgO2EbGH66G1YRpX6ndvKQZpn+ypl/p+sSSe8yx
	jRDgiOvSHvWwQRN3DuiyPQJ+M3zfjyW5mdwCoIfk04AOc7tywv3mIJTjGQjHTMWyZTISTyindSc8N
	3sWUIxuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXk0-000000015Hm-3lyJ;
	Thu, 13 Aug 2026 15:53:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXjz-000000015HZ-1Qzl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 15:53:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 63B9B61882;
	Thu, 13 Aug 2026 15:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB821F000E9;
	Thu, 13 Aug 2026 15:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786636390;
	bh=pojo/5ihe+x3tRo9VM4Cq8odA8bQ3ul0KyDtov7i6YE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aQanQO+DNNS5jcSgP9fd7qtYMs2Pe1fwqXr8IVo5Xg/278WctdtrgvZH2RFhMI2Bq
	 Vys2IlJu8+7RNtHd9GFVY+iZtms6peyf+l/QcBbZgx/Gm3BTqPPiHZEo/kXxrgWzjc
	 WPKT8cX+3DYFceElFmHFZIFbijDudJoKEGdVCgg1z/3Ww3hasXEtRaTKqzUh6T49L1
	 l5Fp3Rmmm5lqxD6u+u+N1Z/74u6iRNy/pJlQxMxwykGwK1H8NEM2EOdkTtEiNyGyBX
	 1vA0PYo89Qz1l11NYxjnK0oo7Jnwel+/2VO2EbK3Q1rMaEkOPDQRJhJZ535zBUTP1q
	 fYS8OJRhxBvHg==
Date: Thu, 13 Aug 2026 08:53:07 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 1/2] arm64: module: Emit BTI veneers for cross-section
 calls
Message-ID: <an3kKsTNAYjbDIRH@jpoimboe>
References: <20260812162058.612202-4-ardb@kernel.org>
 <20260812162058.612202-5-ardb@kernel.org>
 <anzo2Q-TxbB0PUhi@jpoimboe>
 <ba248b4e-958d-4eef-bb66-22a737a6412d@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ba248b4e-958d-4eef-bb66-22a737a6412d@app.fastmail.com>
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

On Thu, Aug 13, 2026 at 09:34:44AM +0300, Ard Biesheuvel wrote:
> 
> On Thu, 13 Aug 2026, at 00:52, Josh Poimboeuf wrote:
> > On Wed, Aug 12, 2026 at 06:21:00PM +0200, Ard Biesheuvel wrote:
> >> The compiler is permitted to omit BTI landing pads from static functions
> >> that never have their address taken, but are only called directly, even
> >> if those calls originate from other code sections.
> >> 
> >> This means that calls into a module's .text section from .init.text,
> >> which may need to be routed via a PLT if .text is out of direct
> >> branching range, may result in BTI exceptions due to the indirect calls
> >> performed by the PLT veneers. (Note that calls to .init.text from .text
> >> are not allowed.)
> >> 
> >> The 'solution' is to emit yet another veneer - this is what the ELF
> >> psABI for AArch64 mandates in this case.
> >> 
> >> So derive an upper bound for the number of veneers that may be needed in
> >> the core module region to ensure that any call from init code that ends
> >> up needing a PLT can be directed at a veneer with a BTI landing pad, and
> >> allocate the additional space.
> >> 
> >> Then, emit these veneers as needed, i.e., only when emitting a PLT entry
> >> for a call from an init code section to a normal code section in the
> >> same module. In practice, this only occurs when a module's .init.text
> >> happens to be allocated far away from its .text section, which might
> >> happen when the initial 128M 'near' module region runs out of space
> >> between allocating the core module and allocating its init region.
> >> 
> >> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >> ---
> >>  arch/arm64/Kconfig                  |   2 -
> >>  arch/arm64/include/asm/module.h     |  12 ++
> >>  arch/arm64/include/asm/module.lds.h |   3 +
> >>  arch/arm64/kernel/module-plts.c     | 128 +++++++++++++++++++-
> >>  4 files changed, 138 insertions(+), 7 deletions(-)
> >> 
> >> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> >> index b3afe0688919..25fa80b5591d 100644
> >> --- a/arch/arm64/Kconfig
> >> +++ b/arch/arm64/Kconfig
> >> @@ -2114,8 +2114,6 @@ config ARM64_BTI_KERNEL
> >>  	depends on CC_HAS_BRANCH_PROT_PAC_RET_BTI
> >>  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
> >>  	depends on !CC_IS_GCC || GCC_VERSION >= 100100
> >> -	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
> >> -	depends on !CC_IS_GCC
> >
> > This doesn't work for livepatch though, and removing the "depends on
> > !CC_IS_GCC" is a livepatch regression as it broadly increases the
> > likelihood of ARM64_BTI_KERNEL (default y) getting enabled.
> >
> > So "livepatch broken on arm64 clang 21+" now becomes "livepatch broken 
> > on arm64".
> >
> 
> ... when kernel mode BTI is enabled.
> 
> I have no insight into which pieces of livepatch for arm64 are actually
> upstream. Is it just the tooling that is missing? In this case, though,
> I think HAVE_LIVEPATCH should depend on !ARM64_BTI_KERNEL, rather than
> the other way around. I can add that in v2.

So arm64 has supported livepatch since HAVE_LIVEPATCH was introduced
with fd1e0fd71f65 ("arm64: Implement HAVE_LIVEPATCH").

The only production tooling for arm64 livepatch is out-of-tree, though
it's possible to create some rudimentary livepatches in tree (see
samples/livepatch).

Though I think klp-build for arm64 is solid and ready to be merged soon.

> > So either ARM64_BTI_KERNEL needs to depend on !LIVEPATCH (which will
> > keep BTI disabled for most distros), or we need a different approach
> > which uses __vmalloc_node_range() to allocate a veneer within 128MB of
> > the target.  I can try to write that up.
> >
> 
> Yes. Or pre-allocate some space in vmlinux for this purpose. I suppose
> we might just use -fpatchable-function-entry for this, and add one
> additional NOP to vmlinux for livepatch kernels, so that a landing pad
> can be patched in as needed. AFAIR the ftrace code already deals with
> the BTI landing pads gracefully.

It looked to me like ftrace is using RET instead of BR, which I proposed
to do in the veneer, but Will objected:

  https://lore.kernel.org/ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org

I have a patch using __vmalloc_node_range() to allocate the 2nd veneer
near the target, which seems to work fine, I'll post it later.

> > vmlinux text size > 128MB?
> >
> > The linker adds veneers for that case, but doesn't make them
> > BTI-friendly unless GNU_PROPERTY_AARCH64_FEATURE_1_BTI is set on *all*
> > .o files, which is not currently happening for .S files.
> >
> 
> I think we should fix that.
> 
> > And when I force that bit with "-z force-bti" on a 700MB text
> > allyesconfig vmlinux with 22k linker-created veneers, it's crashes the
> > GNU linker :-/
> >
> > Seems kernel BTI is borked all around...
> 
> allyesconfig is useful, but it is not a configuration that is expected
> to boot successfully. But it certainly shouldn't crash the linker, so
> this is something we should report to the binutils folks.

Yeah, working on reporting that now, I have a couple of small
reproducers.  The crash isn't specific to allyesconfig though.  It
doesn't like the use of PROVIDE() in linker scripts, apparently...

-- 
Josh

