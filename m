Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D2BE9539B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 13:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJ/9e2DA8SBPV6XQ0gOXCK1heDCNhcbD1ElCKLLyP5Y=; b=Kno+HnVplDZesuiejIUHT2OfdD
	MCpcs9UoCvTGbOYAyZWH8tuwfRmbvch0xvXKo9nPqBKJbmTqq8+Ml2xkfce0tA1DQoysWb0nmJKZc
	+l1ZrhYq1swsE/oHezX6x+L3DAFdoP9jhZaCPhT68/ESDWFBIsGpnEGVjSFInGBUu7J4MVnyB8U57
	okgiaPYL0+Fs4CQL2c6rGJnOhTpDCTArgc+awGr1Otq22M6yCfJU3xbCHw+J3iXNIOAwUIcvOCB5/
	4aoEiksSX+wEZz9T2XxgFrG/Q6seBogrrvJ2fNrIVq6wk21s8UcFTxpT2gilU+JdquQkYJ6T0oUTm
	EFg+9uAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnchp-00000008U0a-44m9;
	Wed, 04 Feb 2026 13:14:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncho-00000008U0T-0pB0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Feb 2026 13:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bJ/9e2DA8SBPV6XQ0gOXCK1heDCNhcbD1ElCKLLyP5Y=; b=WFAAd/9yNOh7RV0efTlEPqxbue
	x8Q0Sctd+c4ROAGh4fPza2KWnZ6NSspi1NkxcWZMYEKdD+djm3RkQBGSvB0S1ZC1LO/hqlLylBf6I
	neHjzbqbnMWfGwDrxCUOQFuhRfjtX4+V4EXokqRhSiDhtjkJz+dZQi1PMf3ATfaDJm/jxy7k/W9W3
	2uuwOfK7dXsmIx1S+wxWUhcw0y3Gz3xiuQ7GeYK9kulncMPLXxkmzR95F0N2LZhlR5mBlBdHZAKRf
	ok4TLbfXUGC6naV7ncg9uCSyEK6b+J2YO+17bNs4rnhlb+f/dPHOi9Joymio581Xd05yFd48PtjSP
	l9QC++HA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnchl-000000026tM-0NwX;
	Wed, 04 Feb 2026 13:14:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 73BA5300E8B; Wed, 04 Feb 2026 14:14:00 +0100 (CET)
Date: Wed, 4 Feb 2026 14:14:00 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Cc: Will Deacon <will@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Boqun Feng <boqun@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260204131400.GI2995752@noisy.programming.kicks-ass.net>
References: <20260130132951.2714396-1-elver@google.com>
 <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck>
 <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck>
 <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
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

On Wed, Feb 04, 2026 at 11:46:02AM +0100, Marco Elver wrote:
> On Tue, 3 Feb 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
> [...]
> > > > What does GCC do with this? :/
> > >
> > > GCC currently doesn't see it, LTO is clang only.
> >
> > LTO is just one way that a compiler could end up breaking dependency
> > chains, so I really want to maintain the option to enable this path for
> > GCC in case we run into problems caused by other optimisations in future.
> 
> It will work for GCC, but only from GCC 11. Before that __auto_type
> does not drop qualifiers:
> https://godbolt.org/z/sc5bcnzKd (switch to GCC 11 to see it compile)
> 
> So to summarize, all supported Clang versions deal with __auto_type
> correctly for the fallback; GCC from version 11 does (kernel currently
> supports GCC 8 and above). From GCC 14 and Clang 19 we have
> __typeof_unqual__.
> 
> I really don't see another way forward; there's no other good way to
> solve this issue. I would advise against pessimizing new compilers and
> features because maybe one day we might still want to enable this
> version of READ_ONCE() for GCC 8-10.
> 
> Should we one day choose to enable this READ_ONCE() version for GCC,
> we will (a) either have bumped the minimum GCC version to 11+, or (b)
> we can only do so from GCC 11. At this point GCC 11 was released 5
> years ago!

There is, from this thread:

  https://lkml.kernel.org/r/20260111182010.GH3634291@ZenIV

another trick to strip qualifiers:

  #define unqual_non_array(T) __typeof__(((T(*)(void))0)())

which will work from GCC-8.4 onwards. Arguably, it should be possible to
raise the minimum from 8 to 8.4 (IMO).

But yes; in general I think it is fine to have 'old' compilers generate
suboptimal code.

