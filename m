Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D52EC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 09:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSpeYlqtnZyA+k5/9LIRfgyP93yJj/4XvuLOfnmiRCM=; b=MAD3ymN1yF5FibIV8U9gwi8N2a
	uNQCNLN0Y2M0Wp6o2hm4Bvzj6Csg2wBd4xgkDnJp3gpkOLNBDjXrS2mRwYOq935oMK318tWOsQU5N
	NbYCLWnbeO/F3O/3bWk7+atldSDl4Yp8u5gDsg3f1FuTWZzvSWk8vKevXdtWLl5ZX2/e9HGi/A0VP
	VBoQJnFNLU7pCgPptlUr7Rw7gebITs68wMhLL3mB6ZOucHEtdGzIyRBcPsDYN4cqayEMJnKfVUEC8
	4KNbet9aTJfqvrfA66DK2sp2XM5xbGeObkoOoxpWxilq00pgFHFg8qBhjUEA4cROo/IVvFgKB99bG
	p22RRZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtj2T-0000000DmB2-0rbt;
	Tue, 11 Aug 2026 09:44:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtj2R-0000000DmAp-3NqN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 09:44:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FBF4415F6;
	Tue, 11 Aug 2026 09:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 715571F000E9;
	Tue, 11 Aug 2026 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786441491;
	bh=tSpeYlqtnZyA+k5/9LIRfgyP93yJj/4XvuLOfnmiRCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AC5sqQEs+79Lxz8J+5irzfru6WqJ+WMNPNbg0BlsFRTYHLYNbJwKeTGoX/USNeXec
	 qAHDt6fEvxZwkTQ0OkhSRJd9usYhQgHEvhI5g+ypsQIL23jvgewpj5nwaqHYC+6UkR
	 zDs2sf/mhlntAhxfTUJvorenxXxBr0BVgNVACoI3eygn3tHiMvKXYkyieGSLa68kuy
	 epnY2UANh4597IM2lyYPJchtIfF1HcGwBX9dtBGFtcKys1j8jrzRy+MyZp5o1wYNHe
	 cz4zpMRPAcGysjFIRDbvmhuH41/xP3I5oQht3eFUqy94N6DKua+F7kG11roR8FQVtL
	 FEgaji01XnGaA==
Date: Tue, 11 Aug 2026 10:44:44 +0100
From: Will Deacon <will@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	live-patching@vger.kernel.org, Song Liu <song@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang 21+
Message-ID: <anrvDIWMNGIa4WPK@willie-the-truck>
References: <ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org>
 <anmobvJXiBQqWn6S@willie-the-truck>
 <e5q2mvqtf6iw4lco55uny5ffhppw6vlflxguhc4gg5nm3zdvmo@zs6rw7iov5qc>
 <08d6c5cd-9924-4359-9181-a03718161528@app.fastmail.com>
 <kp4rvh4vxo65gipgqz4i4dnw2ueylmus4yys6xfrbngp5nefzn@4a4ekjlzqlph>
 <CAKwvOdmSVjY0TmOTc6WMmDHcLbn=tOV3R3zH_TO4zXZiYEsaBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdmSVjY0TmOTc6WMmDHcLbn=tOV3R3zH_TO4zXZiYEsaBw@mail.gmail.com>
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

On Mon, Aug 10, 2026 at 09:41:35AM -0700, Nick Desaulniers wrote:
> On Mon, Aug 10, 2026 at 9:39 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > On Mon, Aug 10, 2026 at 06:12:10PM +0200, Ard Biesheuvel wrote:
> > > On Mon, 10 Aug 2026, at 17:48, Josh Poimboeuf wrote:
> > > > In which case I think to properly support BTI going forward we would
> > > > need two "veneers"?  Either that or remove BTI kernel support
> > > > altogether.
> > > >
> > >
> > > Yeah, it seems we did not argue our case convincingly: their assumption
> > > that veneers/PLTs can be placed within -/+ 128M of their target does not
> > > hold for us. But I don't think it holds for .text sections larger than
> > > 128M either, so I'm not convinced their reasoning is sound even for the
> > > general case.
> > >
> > > I suppose we could special-case the PLT logic to use direct branches
> > > where possible, which would probably catch most of these (assuming
> > > .text and .init.text tend to end up close to each other also for KLP
> > > modules)
> > >
> > > For the remaining cases, we'd indeed need a second veneer at the callee
> > > end (i.e., inside .text in this case) that is emitted when resolving a
> > > cross-section indirect call to a function that lacks the BTI landing
> > > pad. But that would be its sole purpose, so I don't think we should go
> > > down this route. Instead, the 'address taken' check should include 'called
> > > directly from a different section'. Emitting veneers to work around a
> > > compiler optimization is just plain silly.
> > >
> > > I'll try and poke people on the Clang side of things to revisit this.
> > > I guess that leaves kernel BTI broken for the foreseeable future but so
> > > be it.
> >
> > Ok, so for now I suppose we need something like so?
> >
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 06b30924509ac..972988238f367 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -2117,6 +2117,8 @@ config ARM64_BTI_KERNEL
> >         depends on !CC_IS_GCC || GCC_VERSION >= 100100
> >         # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
> >         depends on !CC_IS_GCC
> > +       # https://github.com/llvm/llvm-project/commit/7af2b51e761f49974a64c3009882239cea618f2a
> 
> Sure, but let's replace this with a link to a bug report in llvm's
> issue tracker? I meet with Arm's toolchain team (of which Simon
> is...on or adjacent to). I can bring this up then.

Yes, please! I can apply the patch once we have the bug number.

Will

