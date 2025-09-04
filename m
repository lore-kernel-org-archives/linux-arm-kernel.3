Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9556ACA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWf+g/j2ZyeVooVD6cagjNyaNKI5NY46qq63zC4TKLc=; b=kakZvewxFiA8InMZNObfPRCg+u
	f3TjihgBYWjsBo6NN0Iv1j4ayRWuXI3qTy0jAA57WswTgRIbV8TdEtitasPOP9UUvcVT6bYW5wyGj
	EBZucHtv4tzwfpoXwDJ9phEmxDA1g/R67oDDNQfE2re+aHxGWCKfslBn9F4PoMD5ZysGbNexm2lbh
	fgbNwkbwOtA1b2yf7gD2ed+tW4JbO5Lt+W28b68paRtBdJdAP5kTq4P6VfU6ocAYbLoOCDy6aDEJm
	2Qg8JehdtoxNTFGw+AyRMCI6R7weU3Fa6/xvt0F3IFUM1NZqiHP3lXUl0R8J4QZwdu4bFcg30R3ZR
	hjN//jow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0h-0000000Fxsq-3nHT;
	Fri, 05 Sep 2025 02:17:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCxX-0000000Czvz-49h5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 16:37:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 167BF60247;
	Thu,  4 Sep 2025 16:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87D8C4CEF0;
	Thu,  4 Sep 2025 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757003834;
	bh=ktaFNYGOy663BwK6rfV/ONBV11uoyQrRziv09fSFQ1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hkRDPCwcgpV8W/82FQ58Hd5lN+OM+10trpdtVo186jo1w+T6Sew0RKJ/4TY/RX2Ip
	 r200ZrHL354DiFKrwms7xBmVqu08JXVvLuE4NErIdKRHDGruat+xbl3SHNKLxHP+Hz
	 2/WSWuM5/y1bZJZUAm39JvLJzGixYRvMVE6a8VVY+F5r9Hi65LJpnWGBwz1ehPZwj6
	 B8r2LYhfLODBKHBqtiyERC74r87xZITyQ8hJ0JE7fK8OpjHuW+RUNRMV3BKI9ySJcD
	 CToGmN2fu60jEhJ6XbgicYPHuEjgzHP2Ww9lFQhmlX4HgTFwgMQkOh4COZI1fTKdBI
	 6xyRidT+lU2Sw==
Date: Thu, 4 Sep 2025 09:37:14 -0700
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <202509040933.06AF02E714@keescook>
References: <20250904033217.it.414-kees@kernel.org>
 <20250904070410.GX4067720@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904070410.GX4067720@noisy.programming.kicks-ass.net>
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

On Thu, Sep 04, 2025 at 09:04:10AM +0200, Peter Zijlstra wrote:
> On Wed, Sep 03, 2025 at 08:46:39PM -0700, Kees Cook wrote:
> 
> > Kees Cook (9):
> >   compiler_types.h: Move __nocfi out of compiler-specific header
> >   x86/traps: Clarify KCFI instruction layout
> >   x86/cfi: Document the "cfi=" bootparam options
> >   x86/cfi: Standardize on common "CFI:" prefix for CFI reports
> >   x86/cfi: Add "debug" option to "cfi=" bootparam
> >   x86/cfi: Remove __noinitretpoline and __noretpoline
> 
> So I can take these first 6 patches (and edit that debug patch to
> un-annoy myself ;-), but I'm thinking this Kconfig stuff:

Sure, yeah. Do you want a v3 for the debug stuff that uses your proposed
helper?

> >   kconfig: Add transitional symbol attribute for migration support
> >   kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
> 
> Should perhaps go through the kbuild tree? A

I had chatted offline with Nathan about this series, and he'd suggested
the kconfig change could go with it's first user (the rename). So if you
don't want to put it in -tip, I can take it in the hardening tree.
(There's no dependencies between these 2 and the first 6.)

> Leaving this:
> 
> >   ARM: traps: Implement KCFI trap handler for ARM32
> 
> Can that go independently through the arm tree, or are there
> dependencies?

I can take this too, assuming ARM folks don't want to snag it. I may,
however, wait on it, just to avoid implementing the kernel support
before the GCC folks are happy with the arm32 KCFI backend and its UDF
encoding, etc.

Thanks for looking at these! :)

-Kees

-- 
Kees Cook

