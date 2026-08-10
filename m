Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF5DC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 15:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gSIgDwFrncUnM1vkFT4WLS+q1B+fcZPiDwVpK4Rw+I=; b=sZtqjbuRpxjo2lbROI0IwDiBMx
	QExsWA2OSeVhMWoot/YKiu2R6jvq5UyuAUn2GQFnovn+LPOaEduBFPCyw1j6eansqX0BLzCosAYkX
	RdHn/PKhkmqiIwpVSNC95FA8is4ncYv+KokIe15uhSJZJHM2vpLk1YIe67N/+8J9lF2v7jbpPT4UX
	zAZ3rdeMmbd6DVMQWeJu2KRekcQbjS2pgIaRLlBFsSb+OdmH31DzT8cVUMns3wwwJjaPerG1LyiSp
	+a/tWFkqTCVYe7PGgQeauTkODNLhnZ2psfkKW8S1cPeSCUhyjcraynvzUX1VBWWBWHKA9QOopJA7x
	vl1JjDwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSFB-0000000CJFN-1diw;
	Mon, 10 Aug 2026 15:48:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSF9-0000000CJF3-367r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 15:48:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 03C40600C8;
	Mon, 10 Aug 2026 15:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27511F000E9;
	Mon, 10 Aug 2026 15:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786376930;
	bh=1gSIgDwFrncUnM1vkFT4WLS+q1B+fcZPiDwVpK4Rw+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R9TzrOHXW8DPndlaraQNBD74en4npERtJ0H023oPjK/IAFBuTgRxlPTCjKQl3y4Ah
	 KoMshy/wHzQDu29WYYn564Mz2DVAqN1WOd38SLhABiLemc4r8eFjRr5Dpi0Au233Mx
	 Zgjuyj7+n8Ztr4vaUhcVqOOq9XbHIQhf+WzxqQgSUVcG/GH5lEGFLthdFcTGQmP3LV
	 GS0yeoAycrEhixwPL1ib0jjcRiZQMdISgFZnfzasMcUgWOYkglBwyznYvegko1xwXV
	 g7AlKnUm+7dsSSN6hflvhyuHDCAhaWpjLTlFD5lww4/Ld8q4Ks93CHhYJpiENXQZLj
	 03odwLHmf85fA==
Date: Mon, 10 Aug 2026 08:48:48 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org, Song Liu <song@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang 21+
Message-ID: <e5q2mvqtf6iw4lco55uny5ffhppw6vlflxguhc4gg5nm3zdvmo@zs6rw7iov5qc>
References: <ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org>
 <anmobvJXiBQqWn6S@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <anmobvJXiBQqWn6S@willie-the-truck>
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

On Mon, Aug 10, 2026 at 11:31:10AM +0100, Will Deacon wrote:
> On Fri, Aug 07, 2026 at 02:46:11PM -0700, Josh Poimboeuf wrote:
> > The following BTI exception was seen when loading a livepatch module:
> > 
> >   Internal error: Oops - BTI: 0000000036000001 [#1]  SMP
> >   pstate: 634004c9 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=jc)
> >   pc : kill_orphaned_pgrp+0x0/0x150
> >   lr : do_exit+0x498/0xaf0 [livepatch_combined]
> > 
> > The problem is that the patch module's do_exit() is branching to a
> > static function in vmlinux using a module PLT veneer (indirect branch),
> > but the target function doesn't have a BTI landing pad.
> > 
> > Clang 21+ omits the landing pad for static functions which can only be
> > reached by a direct branch.  That's fine for ordinary modules which only
> > branch to global exported functions.  But livepatch modules use klp
> > relocations to reference arbitrary kernel symbols, and with
> > CONFIG_RANDOMIZE_MODULE_REGION_FULL the module is far enough from the
> > kernel that every R_AARCH64_CALL26 needs a PLT.
> > 
> > RET is exempt from BTI checking, so use it instead of BR when the target
> > has no landing pad, similar to what ftrace and BPF do.
> 
> Hmm, doesn't that somewhat undermine the purpose of using BTI in the
> kernel? Now we're going to create PLTs that can branch to arbitrary
> addresses.

Yes, but just to clarify:

- Only with livepatch modules loaded (and we can add an
  is_livepatch_module() check).

- Only a small minority of livepatch klp relocations need it.

- There are already other instances of "ret <reg>" in the kernel in
  ftrace, BPF, and kvm.

> > This was found by testing with klp-build and Clang 21, but the issue is
> > not specific to klp-build.  It's inherent to any livepatch module use of
> > klp relocations.
> > 
> > Previous tests with Clang 20 did not show this problem, as older Clang
> > unconditionally emits "bti c" for every C function.
> 
> Is there an option to restore that behaviour if CONFIG_LIVEPATCH=y?
> Otherwise, I think I'd be more inclined to add yet-another dependency
> to CONFIG_ARM64_BTI_KERNEL so it's disabled if LIVEPATCH is selected.

Hm, looking deeper, is BTI just fundamentally broken now, independent of
livepatch?

config ARM64_BTI_KERNEL
	...
	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
	depends on !CC_IS_GCC
	...

AFAICT, the reason for the "depends on !CC_IS_GCC" is that GCC was
already doing the exact same thing Clang is now doing: namely, omitting
BTI for static functions that don't have a pointer taken to them.

So Clang 21+ now has the original GCC edge case: an .init.text direct
branching to a .text function which happens to be allocated >= 128MB
away and which doesn't have BTI.

In which case I think to properly support BTI going forward we would
need two "veneers"?  Either that or remove BTI kernel support
altogether.

-- 
Josh

