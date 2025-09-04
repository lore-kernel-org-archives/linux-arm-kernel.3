Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0041CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwRnJdXLUnbJzEliJ8F7yWyHZeWeHGJT0waJGQRe0iU=; b=CkN/F4UOilNEezaRgVDI4MY9nx
	B4Bk3LMwdFbUo1ymJNEWBApFO4Tj18JxhVUrMYC5RJqcqN99zXgmR2ad/78fVzQIUBIkZUKt4Q7vZ
	h2GiaFiVASELGsb01tqy5pKSKBgXFOmX/E6IiuEGZIORoZjxp3gYwbbQ48EznKj7voMeLKJfdZ5d3
	8euTaiadLRyu3jihpxufZaVpXh0N9ml0woZKdcZESROksAGk7QbsUqFy7rohyaM7a4fWKSkbqjrZL
	rQr2vDUibCLzqyHpWCux6PEHncfK3kBfusPWxwNx80K3YQiOzmvrJYdyqKBH2nZZTaYDCjxfXjoQ6
	UM919uFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM2e-0000000G11l-14Gj;
	Fri, 05 Sep 2025 02:19:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG9Q-0000000E7yP-1x0N;
	Thu, 04 Sep 2025 20:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HwRnJdXLUnbJzEliJ8F7yWyHZeWeHGJT0waJGQRe0iU=; b=Wdrg70szvN/Jf+5SKMdlqaYhhw
	7wWW7bSsYxodvgACuWp5HYjdBWfyuJ1ud6jBYmz+eZo9rPDD5PW/trO/gw+IViNTpZpf2MhGS34vm
	Q094atAW/NFnksVkTTUhS1uUUa/DW81zkQNOjwiNSwNqmVEBabodf/RzW+XJaJSoWzjekPp09SD+4
	LOkJnffbEPz0fYXukeH2U4soT0qjZYu53RF7UlA8COJDghYxoJsqpdiKmP8azk+TtE+kTH8uiED1p
	XQhvYFDVIHRyKaHgFC2vsbXb7ptjqwRwxF8Nbkb2cvQiqHRbxU/XhxzCkG37SQPfn8M9IUb8eVmEJ
	cT+kcimw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG9H-00000004PgU-3yfk;
	Thu, 04 Sep 2025 20:01:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B8E2D300220; Thu, 04 Sep 2025 22:01:34 +0200 (CEST)
Date: Thu, 4 Sep 2025 22:01:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	x86@kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 0/9] kcfi: Prepare for GCC support
Message-ID: <20250904200134.GA4067720@noisy.programming.kicks-ass.net>
References: <20250904033217.it.414-kees@kernel.org>
 <20250904070410.GX4067720@noisy.programming.kicks-ass.net>
 <202509040933.06AF02E714@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509040933.06AF02E714@keescook>
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

On Thu, Sep 04, 2025 at 09:37:14AM -0700, Kees Cook wrote:
> On Thu, Sep 04, 2025 at 09:04:10AM +0200, Peter Zijlstra wrote:
> > On Wed, Sep 03, 2025 at 08:46:39PM -0700, Kees Cook wrote:
> > 
> > > Kees Cook (9):
> > >   compiler_types.h: Move __nocfi out of compiler-specific header
> > >   x86/traps: Clarify KCFI instruction layout
> > >   x86/cfi: Document the "cfi=" bootparam options
> > >   x86/cfi: Standardize on common "CFI:" prefix for CFI reports
> > >   x86/cfi: Add "debug" option to "cfi=" bootparam
> > >   x86/cfi: Remove __noinitretpoline and __noretpoline
> > 
> > So I can take these first 6 patches (and edit that debug patch to
> > un-annoy myself ;-), but I'm thinking this Kconfig stuff:
> 
> Sure, yeah. Do you want a v3 for the debug stuff that uses your proposed
> helper?

Nah, already done :-) I just pushed out these 6 and my UDB hackery to
queue.git/x86/core. If the robots don't complain, I'll stuff it into tip
in a few days.

> > >   kconfig: Add transitional symbol attribute for migration support
> > >   kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
> > 
> > Should perhaps go through the kbuild tree? A
> 
> I had chatted offline with Nathan about this series, and he'd suggested
> the kconfig change could go with it's first user (the rename). So if you
> don't want to put it in -tip, I can take it in the hardening tree.
> (There's no dependencies between these 2 and the first 6.)

So I suppose I can carry them, just to keep the lot together, but then I
need an ack from someone that actually knows this Kconfig language stuff
:-)

You taking them through the hardening tree also works for em.

