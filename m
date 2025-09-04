Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A03ACA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 07:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/3H362ZqzDMF6P12e3Tww4DK9Jo6Vxhu+wfYy+W3Aw=; b=DbExkMkkiXGINr1O8oZzOk8WbH
	o5UtSx4C/b0MB72hTclDsd9EETX+XgbouwrZaIBUB7DSCsHmJ2dmo7NCeapy6VquICrM5LVVpTAto
	aicesktIrGIBTOcv/9JoWzIo5WbBC+ahY3XRTvAu2lEDicOyI0RhtkbkcKQWcFon2zKAc1ocP3cl3
	fPO8aGAUnNVMunFw8+x9px0C5n7F6FNkT4uPzNIVe22aYdZiYlZHxnn2AfDfcI43tlw94rnIXYDq4
	S39iEgYGYVx5vRmo0AKRIMCaMjTVYR7lhc3TpPSwc3T+SeIFytkQaPgMnFuOUv2epA2dpf82hHqVP
	C2ppKg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu43i-00000009kaa-0hAS;
	Thu, 04 Sep 2025 07:07:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu40z-00000009jWS-0Ujd;
	Thu, 04 Sep 2025 07:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M/3H362ZqzDMF6P12e3Tww4DK9Jo6Vxhu+wfYy+W3Aw=; b=IteBtjsdCqf/NNkwVs98V72txm
	X2dxVpk7yeyfhAe6TcfgmX/coExBsMMH0B4plQ9d52jz2ip3Yi1bmD9WEflJJH+vivbdEKhk6fSHJ
	jJGKsG37c75uykk591oTp9bnSDl8ybXLHUzNNopFngN1DOzGq+AWKourId73hhnCjcKrAs8QpjUvU
	o9jIjXNtwJEBuFNblNhIUPwFjdT4hGh1ERCx7aYekVwL6pGcTBYjSi5bnhn638Y6nmadkTMKjXLVG
	7mqy/DSrntQYdnutGj0/tHqAkX4xp7kP95zC9UhAIXEOSDMacIfo4B7NxGNR3a4Ze1Eq3jRL3ww9v
	r0ZDw3lA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu40w-0000000EXWv-0FTE;
	Thu, 04 Sep 2025 07:04:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 429CF3002BF; Thu, 04 Sep 2025 09:04:10 +0200 (CEST)
Date: Thu, 4 Sep 2025 09:04:10 +0200
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
Message-ID: <20250904070410.GX4067720@noisy.programming.kicks-ass.net>
References: <20250904033217.it.414-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904033217.it.414-kees@kernel.org>
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

On Wed, Sep 03, 2025 at 08:46:39PM -0700, Kees Cook wrote:

> Kees Cook (9):
>   compiler_types.h: Move __nocfi out of compiler-specific header
>   x86/traps: Clarify KCFI instruction layout
>   x86/cfi: Document the "cfi=" bootparam options
>   x86/cfi: Standardize on common "CFI:" prefix for CFI reports
>   x86/cfi: Add "debug" option to "cfi=" bootparam
>   x86/cfi: Remove __noinitretpoline and __noretpoline

So I can take these first 6 patches (and edit that debug patch to
un-annoy myself ;-), but I'm thinking this Kconfig stuff:

>   kconfig: Add transitional symbol attribute for migration support
>   kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI

Should perhaps go through the kbuild tree? A

Leaving this:

>   ARM: traps: Implement KCFI trap handler for ARM32

Can that go independently through the arm tree, or are there
dependencies?

