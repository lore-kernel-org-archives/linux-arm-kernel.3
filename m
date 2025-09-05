Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E657FCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M79TTCqe8JoZ513tNokPtvkx8UtSSWW2OczVIrxAnbI=; b=O1xDQaLAlKM31UbDDlM1OKYU0r
	uL1TaUdSDWiKxy+4tSogQhNgibfEuPNLxeeb51HcszOlDdn1w/56sLxZkGHJKYcPck0C4iEzxE0Ok
	UICz5IC6GFem2HgRusqrLoyy6Z58s/DAV7AGTDM6VnFNATXRaxOeZcvif6HJMY+VKf8A4jb+KoxQe
	bASptz9GJ558n0yAtOnF4w6g2HuDyzVdisRWVl2t1h1qXFIRW/spNPqINeORM5LrlDv7nvX0xJQos
	k1bC2EkUsHxESJqZdWyxHX0RPoiycjp0wr/IV5SRCrmUthyG666m6uk7fgMnkUGT0UayKVSFolC9X
	wRiL145A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6u-0000000G6LT-2ewm;
	Fri, 05 Sep 2025 02:23:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuKWf-0000000FaZj-38UY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 00:42:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7161244401;
	Fri,  5 Sep 2025 00:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48560C4CEF0;
	Fri,  5 Sep 2025 00:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757032921;
	bh=6Wt+nRtf6qZqi5LeG5qpb9AIL6REC47JvD6eLsZ0+9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=chm1kixwtf/FHR3gPWrpopBZ4GxiW/dC4OhBkmJLaYl/ifsxPHyAmNHN3bHMFAaBJ
	 b4GvcyPmi4YZfMAmZ4xbMZZxMSSzRuch0jp/uIW/fOTs1+OokjX3dLpO7VpXpwQwWD
	 dXrcjTAqkweyzZ8aZVYk7qfW+ZBMgk0iptEnjOuVQqQkPgygNxqA4RTJdeiY0NfwRl
	 yK9sgYcJLN6VvEkQhGGcgxwAUoj9o8GeuIBrf5iYytPs51n2donasZGVTxUEW85lSw
	 54CBDOvXFswiq8HajAxWm1MCYIq+IaYt/WOGqtdMNi3NdYNVlG4u4zIEygTeEG+sKp
	 8w0rsGAEMhTCw==
Date: Thu, 4 Sep 2025 17:42:00 -0700
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
Message-ID: <202509041740.1007FFEA@keescook>
References: <20250904033217.it.414-kees@kernel.org>
 <20250904070410.GX4067720@noisy.programming.kicks-ass.net>
 <202509040933.06AF02E714@keescook>
 <20250904200134.GA4067720@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904200134.GA4067720@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_174201_807348_B6C5EB8C 
X-CRM114-Status: GOOD (  13.62  )
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

On Thu, Sep 04, 2025 at 10:01:34PM +0200, Peter Zijlstra wrote:
> Nah, already done :-) I just pushed out these 6 and my UDB hackery to
> queue.git/x86/core. If the robots don't complain, I'll stuff it into tip
> in a few days.

Okay, thanks!

> So I suppose I can carry them, just to keep the lot together, but then I
> need an ack from someone that actually knows this Kconfig language stuff
> :-)
> 
> You taking them through the hardening tree also works for em.

Assuming Nathan (and Vegard? or other folks from the other thread?) are
okay with the kconfig changes, I'll take it via hardening.

Wheee

-- 
Kees Cook

