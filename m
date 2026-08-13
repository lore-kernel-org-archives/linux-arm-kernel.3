Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00C0C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 02:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ED0aXaLuZYw1bazTncgWLLGV85AkjzKY6UwsXWsviE=; b=WWZO/9/0OBzEJZfu3DdCS7BEqt
	WdQ3kYvG8182JjaGpW30wnOCCoxpQPRxV/7gOEVyNG/yyWBnPh24l4eRV6yYIEbgrLAy08ohxySoE
	ImEtpM6DiUxJBZPJeAmMS6TFGWa+HyE+4zxtYtC/NKnUOWTwQFAOW9EqblVzwsVPpt3fuNCVsz6rq
	zUnw7CCaaujK5mTXsVIjPYY+dG603vHVJrjHX/PmyP9wZNytVGtyFHSVcavbPmS2W3hSi8vqTzw2r
	UmNqT4YfWvd8GULYnhjrVGk3bC4/3weFfuGbmma4PTbNtblz5xAUEUwMFAnDugqvS8LkYTfadHERw
	31sLO+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuL8S-0000000HHIo-3Oxm;
	Thu, 13 Aug 2026 02:25:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuL8R-0000000HHIO-06xa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 02:25:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A252342B5B;
	Thu, 13 Aug 2026 02:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49441F00A3D;
	Thu, 13 Aug 2026 02:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786587934;
	bh=1ED0aXaLuZYw1bazTncgWLLGV85AkjzKY6UwsXWsviE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GCuYUxX1LBIJtF0rjhD7pA/K48vn+4nr6n98j/0wrmzIoj45ryJrrXhYZDm8jQhTY
	 9JJNnXnvCp81XSALOsan2A/HSDfQkyikYtOkQw6JvxiyF1s9TsvauW62fHeKZRdNmq
	 cDkBRWVkmCir4GdCUnrSimiO7f3nBosAbPlKxEt03bFJt0jlFsvXujNf157EVOYMxj
	 qe6vbGG8Psw6coDcPty+nRP5nKzDmzxxQ0dvuH1csnLcr+09vN5/g42BIkylk+PlPP
	 iRfrAq4HXjaeJ6MF5eimX8RJ1xs11BjFSL6ZlvUJ2StJcjUCvDtzdQuo1Ny6FU7mBY
	 hrjosd1ONcquA==
Date: Wed, 12 Aug 2026 19:25:32 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	Mark Brown <broonie@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 1/2] arm64: module: Emit BTI veneers for cross-section
 calls
Message-ID: <an0l-wSimIc8C38S@jpoimboe>
References: <20260812162058.612202-4-ardb@kernel.org>
 <20260812162058.612202-5-ardb@kernel.org>
 <anzo2Q-TxbB0PUhi@jpoimboe>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <anzo2Q-TxbB0PUhi@jpoimboe>
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

On Wed, Aug 12, 2026 at 02:52:04PM -0700, Josh Poimboeuf wrote:
> On Wed, Aug 12, 2026 at 06:21:00PM +0200, Ard Biesheuvel wrote:
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -2114,8 +2114,6 @@ config ARM64_BTI_KERNEL
> >  	depends on CC_HAS_BRANCH_PROT_PAC_RET_BTI
> >  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
> >  	depends on !CC_IS_GCC || GCC_VERSION >= 100100
> > -	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
> > -	depends on !CC_IS_GCC
> 
> This doesn't work for livepatch though, and removing the "depends on
> !CC_IS_GCC" is a livepatch regression as it broadly increases the
> likelihood of ARM64_BTI_KERNEL (default y) getting enabled.
> 
> So "livepatch broken on arm64 clang 21+" now becomes "livepatch broken on arm64".
> 
> So either ARM64_BTI_KERNEL needs to depend on !LIVEPATCH (which will
> keep BTI disabled for most distros), or we need a different approach
> which uses __vmalloc_node_range() to allocate a veneer within 128MB of
> the target.  I can try to write that up.

Hm, does the omitted BTI also break long intra-vmlinux branches for
vmlinux text size > 128MB?

The linker adds veneers for that case, but doesn't make them
BTI-friendly unless GNU_PROPERTY_AARCH64_FEATURE_1_BTI is set on *all*
.o files, which is not currently happening for .S files.

And when I force that bit with "-z force-bti" on a 700MB text
allyesconfig vmlinux with 22k linker-created veneers, it's crashes the
GNU linker :-/

Seems kernel BTI is borked all around...

-- 
Josh

