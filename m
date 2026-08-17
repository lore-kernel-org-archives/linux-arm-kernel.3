Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E2CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 21:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYYWAFb6MNGQGSRSXAIPAH4FqybYazhn6qOSEXQ0npo=; b=kMHISqu6/Fi80Uuwp3f8SxsE3v
	bg+OwWjdrFgj3qTClrzV0VsnbrT2X6RCAkLjXvFu416ixYRYPOC0vvP2uDJlYqxsmo8Y1WM6kNzfE
	5jNs5cIZdJWnn7c3Ea4mSm1hL+HyleT3lXicgrhA57xkcvdSvVCpmg/tOM6s6GQWwKTqCIIvHk56s
	j3i/EZsP3QRd/GlAsKWFl4LXzg5lWZ/lmZT7WvRzf1NK2DiIlfyES5mxQWJZU0F82gEOv/qdhWCni
	DVP23SyOxy+DuNeQSOC5EyEu4hIt1ZaA6iWnfdTZj7y9Phvkq1TGOf3BQ6g2SC675X6NVaddu0cFV
	zcMiPzMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww588-00000006rka-20tR;
	Mon, 17 Aug 2026 21:44:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww587-00000006rk7-07po
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 21:44:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C39843596;
	Mon, 17 Aug 2026 21:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F00E1F000E9;
	Mon, 17 Aug 2026 21:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787003066;
	bh=SYYWAFb6MNGQGSRSXAIPAH4FqybYazhn6qOSEXQ0npo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YvyXr0mF8oM0Qpvu8B995T9Niu1lMEuyvznn463YUnzlINCBL6c7oP3w5/b1Ik0Oj
	 EIgVVvFhn1CxAtUcjww9aYnQh5EWlUeW8LkFNcAXZDKUyYCmckuluC53a+H9EPbz/l
	 cr+nkXZNg9seXdnPrCWVpG5LXr7Xw9OUKKDN3qkO6269j3SOgLEJ3493HDDO+5CU+a
	 zuRougM303roU30KkODvILas9ddQoNAX+6/eavYzCM4zyPqjJAtYatilCtSP3i6MCH
	 6X/lSvmEV5vQrxR3NkQCHkzkDC2XrpBAm2kzphwFWbhlMzqGOGrJcqZ1HMhpAPx/kU
	 +oVuu0zDnLYbw==
Date: Mon, 17 Aug 2026 14:44:23 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org, Song Liu <song@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mark Brown <broonie@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	linux-toolchains@vger.kernel.org
Subject: Re: [PATCH 02/12] arm64/module: Fix BTI exceptions caused by omitted
 landing pads in Clang 21
Message-ID: <aoMnkvrrjljQ6uOJ@jpoimboe>
References: <cover.1786768375.git.jpoimboe@kernel.org>
 <2ff1b2482406c61ca5979d6284ba5f948a3fbc20.1786768375.git.jpoimboe@kernel.org>
 <6bc20c00-21a9-4315-8ec3-33c7ad6ae95f@app.fastmail.com>
 <aoCu66bx1Qg14-uD@jpoimboe>
 <b32fc053-6f1f-481e-9872-ab3cf22534e6@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b32fc053-6f1f-481e-9872-ab3cf22534e6@app.fastmail.com>
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

On Mon, Aug 17, 2026 at 02:11:26PM +0300, Ard Biesheuvel wrote:
> On Sat, 15 Aug 2026, at 21:57, Josh Poimboeuf wrote:
> > On Sat, Aug 15, 2026 at 12:56:11PM +0300, Ard Biesheuvel wrote:
> >> On Sat, 15 Aug 2026, at 07:45, Josh Poimboeuf wrote:
> >> > The following BTI exception was seen when loading a livepatch module:
> >> >
> >> >   Internal error: Oops - BTI: 0000000036000001 [#1]  SMP
> >> >   pstate: 634004c9 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=jc)
> >> >   pc : kill_orphaned_pgrp+0x0/0x150
> >> >   lr : do_exit+0x498/0xaf0 [livepatch_combined]
> >> >
> >> > The problem is that the patch module's do_exit() is branching to a
> >> > static function in vmlinux using a module PLT veneer (indirect branch),
> >> > but the target function doesn't have a BTI landing pad.
> >> >
> >> > Clang 21+ omits the landing pad for static functions which can only be
> >> > reached by a direct branch.  But livepatch modules use klp relocations
> >> > to reference arbitrary kernel symbols, and with
> >> > CONFIG_RANDOMIZE_MODULE_REGION_FULL the module is far enough away that
> >> > every call to vmlinux needs a PLT.
> >> >
> >> > Note this problem is actually not specific to livepatch.  It's possible
> >> > for any module's .init section to be allocated > 128MB away from its
> >> > .text section.  So calls from .init to .text via a PLT can trigger a BTI
> >> > exception when the target function doesn't have a landing pad.
> >> >
> >> > GCC has always omitted the landing pad when possible, so kernel BTI is
> >> > already considered incompatible with GCC since commit c0a454b9044f
> >> > ("arm64/bti: Disable in kernel BTI when cross section thunks are
> >> > broken").
> >> >
> >> > When missing landing pads are detected, allocate a page close to the
> >> > target which can be used to hold BTI veneers which receive PLT veneer
> >> > indirect branches and direct branch to the final target:
> >> >
> >> 
> >> This does not work for cross-section calls from .init.text to .text.
> >> 
> >> If .init.text is far away from .text, it is likely because .text
> >> ended up in the 128M 'near' module region, and .init.text did not.
> >> (They tend to end up in direct branching range of each otherwise.)
> >> 
> >> Given that the module init code is typically small, I don't think
> >> it is safe to assume that allocating a single page close enough to
> >> .text is going to be possible if allocating the space for .init.*
> >> was not.
> >> 
> >> IOW, the fix I proposed for cross-section calls is still needed
> >> with this approach.
> >
> > But the BTI veneer page is allocated from a *256MB* window, of which the
> > near region is only a 128MB subset.
> >
> 
> OK, so this window would be [_etext - 128M, _text + 128M), right? Or
> whichever the equivalent is for a kernel module?
> 
> I agree that this considerably reduces the likelihood of running out
> of veneer space within direct branching range.

It's a *moving* 256M window centered around a given branch target:
[target - 128M, target + 128M).  The window always fully contains the
near region, *plus* another 128MB: 128M - (target - base) below the
region and (target - base) above, which always adds up to an extra
128MB.  So it has a much bigger pool to choose from than module text
does.

It does try to allocate inside the region, or right after it, so the
page can be shared by other branches in the same module if possible.
But it can allocate more above or below as needed.

> > There is a theoretical case where the 256MB window around the target is
> > completely full without any fragmentation, but I would think that there
> > would almost always be some fragmentation.  If that window is modules
> > stacked together, most modules have at least .init.plt and .init.text,
> > and many have .init.data.
> >
> 
> Are you saying these are freed again once the module is initialized, and
> therefore there is fragmentation? Not sure if it works like that if modules
> are loaded one after the other.

Not sure I understand your question, but yes, the module init mem is
allocated from the same pool as other module memory, and freed once
module init is done, able to be reused, causing fragmentation.

If multiple modules get loaded all at the same time before any module
init memory has a chance to get freed, presumably fragmentation wouldn't
be much of an issue yet and the given module's .init.text would get
allocated close to .text in the first place.

> > Right now it needs two pages (because of the default guard page) but we
> > could maybe fall back to VM_NO_GUARD in case of emergency.
> >
> 
> I like the advantage of only allocating veneers if they are really needed,
> as opposed to allocating the space unconditionally, which is what my
> solution does. But I need more convincing that this will actually cover
> all these cases, given that the cross-section call issue only occurs when
> running out of direct branching space to begin with.

Right, so if .text fits in the near region, and a one-page .init.text
doesn't, meaning the 128MB near region is completely full, the BTI
veneer allocation still likely succeeds because it still has another
128MB pool to allocate from above/below the region.

So for the allocation to fail, it would need to be a perfect storm:

1) a *lot* of modules loaded and/or huge vmlinux
2) the branch in init code is placed >128MB away from its .text
3) the target is a static .text function with no landing pad
4) there are 0 free pages in the 256MB region around the target

Seems unrealistic to me, unless I'm missing something.

-- 
Josh

